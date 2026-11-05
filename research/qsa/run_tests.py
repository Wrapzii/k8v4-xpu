"""CPU-safe unit tests for the QSA indexer.

No checkpoint is loaded. The device under test is ``resolve_device()``
(``QSA_DEVICE`` when set, otherwise XPU, then CUDA, then CPU).

Run from a checkout with ``research`` on ``PYTHONPATH``::

    python research/qsa/run_tests.py
"""

from __future__ import annotations

import os
import sys
import traceback
from pathlib import Path

_RESEARCH = Path(__file__).resolve().parents[1]
if str(_RESEARCH) not in sys.path:
    sys.path.insert(0, str(_RESEARCH))

import torch

from qsa.device import empty_cache, resolve_device, synchronize, to_device
from qsa.indexer import QSAIndexer
from qsa.losses import indexer_kl_from_target
from qsa.sparse_attention import select_blocks
from qsa.teacher import block_teacher_from_qk


def _rope(seq: int, rope_dim: int, device: str) -> tuple[torch.Tensor, torch.Tensor]:
    pos = torch.arange(seq, device=device, dtype=torch.float32)
    freq = torch.arange(0, rope_dim, 2, device=device, dtype=torch.float32)
    inv_freq = 1.0 / (10000 ** (freq / rope_dim))
    angles = pos[:, None] * inv_freq[None, :]
    cos = torch.cos(angles).repeat_interleave(2, dim=-1)
    sin = torch.sin(angles).repeat_interleave(2, dim=-1)
    return cos, sin


def _indexer(hidden: int, device: str) -> QSAIndexer:
    module = QSAIndexer(
        hidden_size=hidden,
        num_heads=4,
        head_dim=128,
        rope_dim=64,
        block_size=4,
    )
    return module.to(device)


def test_resolve_device_matches_runtime() -> None:
    device = resolve_device()
    assert device in {"xpu", "cuda", "cpu"}
    if os.environ.get("QSA_DEVICE", "").strip().lower() in {"xpu", "cuda", "cpu"}:
        assert device == os.environ["QSA_DEVICE"].strip().lower()


def test_prefer_xpu_then_cuda_then_cpu() -> None:
    import qsa.device as dev

    old_env = os.environ.pop("QSA_DEVICE", None)
    old_xpu, old_cuda = dev._xpu_is_available, dev._cuda_is_available
    try:
        dev._xpu_is_available = lambda: True
        dev._cuda_is_available = lambda: True
        assert dev.resolve_device() == "xpu"
        dev._xpu_is_available = lambda: False
        assert dev.resolve_device() == "cuda"
        dev._cuda_is_available = lambda: False
        assert dev.resolve_device() == "cpu"
    finally:
        dev._xpu_is_available = old_xpu
        dev._cuda_is_available = old_cuda
        if old_env is None:
            os.environ.pop("QSA_DEVICE", None)
        else:
            os.environ["QSA_DEVICE"] = old_env


def test_qsa_device_override() -> None:
    import qsa.device as dev

    old = os.environ.get("QSA_DEVICE")
    try:
        os.environ["QSA_DEVICE"] = "cpu"
        assert dev.resolve_device() == "cpu"
        os.environ["QSA_DEVICE"] = "mps"
        try:
            dev.resolve_device()
        except ValueError:
            pass
        else:
            raise AssertionError("invalid QSA_DEVICE must raise ValueError")
        os.environ["QSA_DEVICE"] = "xpu"
        if not dev._xpu_is_available():
            try:
                dev.resolve_device()
            except RuntimeError:
                pass
            else:
                raise AssertionError("unavailable xpu override must raise RuntimeError")
    finally:
        if old is None:
            os.environ.pop("QSA_DEVICE", None)
        else:
            os.environ["QSA_DEVICE"] = old


def test_to_device_and_sync_helpers() -> None:
    device = resolve_device()
    tensor = to_device(torch.zeros(2, 3))
    assert tensor.device.type == device
    batch = to_device({"input_ids": torch.ones(1, 4, dtype=torch.long), "note": "keep"})
    assert batch["note"] == "keep"
    assert batch["input_ids"].device.type == device
    assert batch["input_ids"].dtype == torch.long
    synchronize()
    empty_cache()


def test_indexer_forward_shapes() -> None:
    device = resolve_device()
    seq, block = 128, 4
    for hidden in (512, 5120):
        module = _indexer(hidden, device)
        hidden_states = torch.randn(1, seq, hidden, device=device)
        cos, sin = _rope(seq, module.rope_dim, device)
        scores, valid = module(hidden_states, cos, sin)
        n_blocks = seq // block
        assert scores.shape == (1, seq, n_blocks), scores.shape
        assert valid.shape == (1, seq, n_blocks), valid.shape
        assert valid.dtype == torch.bool
        assert scores.device.type == device
        assert torch.isfinite(scores[valid]).all()
        if (~valid).any():
            assert torch.isneginf(scores[~valid]).all()
        # A block is visible only once its last token is at or before the query.
        pos = torch.arange(seq, device=device)
        starts = torch.arange(n_blocks, device=device) * block
        expected = (starts[None, :] + block - 1) <= pos[:, None]
        assert torch.equal(valid[0], expected)

    short = _indexer(512, device)
    cos, sin = _rope(2, short.rope_dim, device)
    scores, valid = short(torch.randn(1, 2, 512, device=device), cos, sin)
    assert scores.shape == (1, 2, 0)
    assert valid.shape == (1, 2, 0)


def test_indexer_kl_from_target_finite() -> None:
    device = resolve_device()
    batch, seq, n_blocks = 1, 32, 8
    scores = torch.randn(batch, seq, n_blocks, device=device)
    valid = torch.zeros(seq, n_blocks, dtype=torch.bool, device=device)
    valid[4:] = True
    scores = scores.masked_fill(~valid[None], float("-inf"))
    target = torch.zeros(batch, seq, n_blocks, device=device)
    target[:, 4:, 0] = 0.7
    target[:, 4:, 1] = 0.3
    loss = indexer_kl_from_target(scores, target, valid)
    assert loss.ndim == 0
    assert torch.isfinite(loss), loss

    block_ids = torch.zeros(batch, seq, 2, dtype=torch.long, device=device)
    block_ids[..., 1] = 1
    restricted = indexer_kl_from_target(scores, target, valid, block_ids)
    assert restricted.ndim == 0
    assert torch.isfinite(restricted), restricted

    empty = indexer_kl_from_target(
        torch.zeros(batch, seq, 0, device=device),
        torch.zeros(batch, seq, 0, device=device),
        torch.zeros(seq, 0, dtype=torch.bool, device=device),
    )
    assert torch.isfinite(empty)
    assert float(empty.detach()) == 0.0


def test_block_teacher_from_qk_shapes() -> None:
    device = resolve_device()
    batch, heads, seq, dim, block = 1, 2, 128, 16, 4
    query = torch.randn(batch, heads, seq, dim, device=device)
    key = torch.randn(batch, heads, seq, dim, device=device)
    target, valid = block_teacher_from_qk(query, key, block_size=block)
    n_blocks = seq // block
    assert target.shape == (batch, seq, n_blocks)
    assert valid.shape == (seq, n_blocks)
    assert valid.dtype == torch.bool
    assert target.device.type == device
    assert not valid[0].any()
    assert valid[-1].all()
    assert torch.isfinite(target).all()
    observed = valid.any(-1)
    sums = target.sum(-1)[0, observed]
    assert torch.allclose(sums, torch.ones_like(sums), atol=1e-5)
    assert torch.count_nonzero(target[0][~valid]) == 0


def test_select_blocks() -> None:
    device = resolve_device()
    batch, seq, n_blocks, block = 2, 16, 8, 4
    scores = torch.zeros(batch, seq, n_blocks, device=device)
    valid = torch.ones(batch, seq, n_blocks, dtype=torch.bool, device=device)
    valid[:, :, 5:] = False
    scores = scores.masked_fill(~valid, float("-inf"))
    scores[:, :, 1] = 50
    selected = select_blocks(scores, valid, token_budget=4, block_size=block)
    assert selected.shape == (batch, seq, 1)
    assert selected.dtype == torch.long
    assert selected.device.type == device
    assert torch.equal(selected, torch.ones_like(selected))

    wide = select_blocks(scores, valid, token_budget=100, block_size=block)
    assert wide.shape[-1] == n_blocks

    empty_scores = torch.zeros(batch, seq, 0, device=device)
    empty_valid = torch.zeros(batch, seq, 0, dtype=torch.bool, device=device)
    empty = select_blocks(empty_scores, empty_valid, token_budget=8, block_size=block)
    assert empty.shape == (batch, seq, 0)
    assert empty.dtype == torch.long


def _distill_like(hidden: int) -> float:
    """One indexer KL step on synthetic tokens. Returns the finite loss."""
    device = resolve_device()
    seq, block = 128, 4
    indexer = _indexer(hidden, device)
    with torch.no_grad():
        indexer.q_proj.weight.fill_(0.01)
        indexer.k_proj.weight.fill_(0.01)
    hidden_states = torch.ones(1, seq, hidden, device=device)
    cos, sin = _rope(seq, indexer.rope_dim, device)
    before = {name: param.detach().clone() for name, param in indexer.named_parameters()}

    scores, valid = indexer(hidden_states, cos, sin)
    assert scores.shape == (1, seq, seq // block)
    target = torch.zeros_like(scores)
    target[..., 0] = 1
    target = target * valid
    denom = target.sum(-1, keepdim=True)
    target = torch.where(denom > 0, target / denom.clamp_min(1e-12), target)

    loss = indexer_kl_from_target(scores, target, valid)
    assert loss.ndim == 0
    assert bool(torch.isfinite(loss.detach()).item()), loss.detach()
    loss.backward()
    for name, param in indexer.named_parameters():
        assert param.grad is not None, name
        assert torch.isfinite(param.grad).all(), name
    assert any(param.grad.abs().sum().item() > 0 for param in indexer.parameters())

    optimizer = torch.optim.AdamW(
        indexer.parameters(), lr=1e-2, betas=(0.9, 0.95), eps=1e-8, weight_decay=0.0
    )
    synchronize()
    torch.nn.utils.clip_grad_norm_(indexer.parameters(), 1.0)
    optimizer.step()
    optimizer.zero_grad(set_to_none=True)
    empty_cache()

    changed = False
    for name, param in indexer.named_parameters():
        assert torch.isfinite(param).all(), name
        if not torch.equal(param, before[name]):
            changed = True
    assert changed, "indexer parameters did not move"
    return float(loss.detach())


def test_distill_step_hidden_512() -> None:
    loss = _distill_like(512)
    assert loss > 0


def test_distill_step_hidden_5120() -> None:
    loss = _distill_like(5120)
    assert loss > 0


def test_sources_do_not_require_cuda() -> None:
    root = Path(__file__).resolve().parent
    for path in sorted(root.glob("*.py")):
        if path.name == "run_tests.py":
            continue
        text = path.read_text()
        assert ".cuda()" not in text, path.name
        assert 'device="cuda"' not in text and "device='cuda'" not in text, path.name
        assert 'device_map="cuda"' not in text and "device_map='cuda'" not in text, path.name
        assert "requires a CUDA" not in text, path.name


def test_training_entrypoints_reject_cpu_without_weights() -> None:
    import qsa.train_indexer as train_indexer
    import qsa.train_mm as train_mm

    old = os.environ.get("QSA_DEVICE")
    os.environ["QSA_DEVICE"] = "cpu"
    try:
        for fn, needle in (
            (train_indexer.run_distillation, "distillation"),
            (train_mm.run_mm1, "MM1"),
        ):
            try:
                fn({})
            except SystemExit as exc:
                message = str(exc)
                assert "CUDA GPU" not in message, message
                assert "accelerator" in message, message
                assert needle in message, message
            else:
                raise AssertionError(f"{fn.__name__} returned on CPU")
    finally:
        if old is None:
            os.environ.pop("QSA_DEVICE", None)
        else:
            os.environ["QSA_DEVICE"] = old


def main() -> None:
    tests = [value for name, value in globals().items() if name.startswith("test_") and callable(value)]
    failed = 0
    for fn in tests:
        try:
            fn()
        except Exception:
            failed += 1
            print(f"FAIL {fn.__name__}", flush=True)
            traceback.print_exc()
        else:
            print(f"PASS {fn.__name__}", flush=True)
    print(f"device={resolve_device()} tests={len(tests)} failed={failed}", flush=True)
    if failed:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
