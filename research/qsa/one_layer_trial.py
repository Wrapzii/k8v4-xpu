"""Five AdamW steps of one QSA indexer on a captured full-attention layer.

CPU only. Reads ``activations/layer_3.pt`` and appends loss and teacher-mass
capture to the qsa-train log. The capture uses the same top-k mass as
``train_indexer.distill_step`` (budget 2048, block 4). At seq 128 that budget
covers every block, so the log also records top-1 mass.
"""

from __future__ import annotations

import os
import sys
from datetime import datetime
from pathlib import Path

os.environ.setdefault("QSA_DEVICE", "cpu")

_RESEARCH = Path(__file__).resolve().parents[1]
if str(_RESEARCH) not in sys.path:
    sys.path.insert(0, str(_RESEARCH))

import torch

from qsa.device import resolve_device
from qsa.indexer import QSAIndexer
from qsa.losses import indexer_kl_from_target
from qsa.sparse_attention import select_blocks


DEFAULT_ACT = "/mnt/hdd-500gb/model-validation/qsa-train/activations/layer_3.pt"
DEFAULT_LOG = "/mnt/hdd-500gb/model-validation/qsa-train/logs/one-layer-trial.log"
BUDGET = 2048
BLOCK = 4
STEPS = 5
LR = 3e-4


def _capture(scores: torch.Tensor, target: torch.Tensor, valid: torch.Tensor, budget: int) -> float:
    """Mean teacher mass inside the indexer's top blocks. ``valid`` is ``[B, T, nb]``."""
    selected = select_blocks(scores.detach(), valid, budget, BLOCK)
    mass = target.gather(-1, selected).sum(-1)
    mask = valid.any(-1).expand_as(mass)
    if not bool(mask.any()):
        return 0.0
    return float(mass[mask].mean())


def main() -> int:
    if resolve_device() != "cpu":
        raise SystemExit(f"refusing non-CPU device {resolve_device()}")
    torch.set_num_threads(int(os.environ.get("OMP_NUM_THREADS", "8")))
    act_path = Path(os.environ.get("QSA_ACT", DEFAULT_ACT))
    log_path = Path(os.environ.get("QSA_TRIAL_LOG", DEFAULT_LOG))
    blob = torch.load(act_path, map_location="cpu", weights_only=True)
    hidden = blob["hidden_pre_attn"].float()
    cos = blob["cos"][0].float()
    sin = blob["sin"][0].float()
    target = blob["block_teacher"].float()
    if hidden.ndim != 3 or cos.ndim != 2 or target.shape[:2] != hidden.shape[:2]:
        raise SystemExit(
            f"bad activation shapes hidden={tuple(hidden.shape)} cos={tuple(cos.shape)} "
            f"teacher={tuple(target.shape)}"
        )
    indexer = QSAIndexer(
        hidden_size=hidden.shape[-1],
        num_heads=4,
        head_dim=128,
        rope_dim=cos.shape[-1],
        block_size=BLOCK,
        logit_scale=128 ** -0.5,
    ).to(dtype=torch.float32)
    indexer.train()
    optimizer = torch.optim.AdamW(
        indexer.parameters(), lr=LR, betas=(0.9, 0.95), eps=1e-8, weight_decay=0.0,
    )
    lines = [
        f"=== one-layer trial {datetime.now().isoformat(timespec='seconds')} ===",
        f"activation={act_path} layer={blob.get('layer_idx')} source={blob.get('source')} "
        f"hidden={tuple(hidden.shape)} teacher={tuple(target.shape)} device=cpu",
        f"steps={STEPS} lr={LR} budget={BUDGET} block={BLOCK} "
        f"kb_at_budget={min(target.shape[-1], -(-BUDGET // BLOCK))}",
    ]
    print(lines[-2], flush=True)
    print(lines[-1], flush=True)
    for step in range(1, STEPS + 1):
        optimizer.zero_grad(set_to_none=True)
        scores, valid = indexer(hidden, cos, sin)
        # indexer_kl_from_target wants valid [T, nb]; the indexer returns [B, T, nb].
        loss = indexer_kl_from_target(scores, target, valid[0])
        loss.backward()
        torch.nn.utils.clip_grad_norm_(indexer.parameters(), 1.0)
        optimizer.step()
        with torch.no_grad():
            capture = _capture(scores, target, valid, BUDGET)
            capture_top1 = _capture(scores, target, valid, BLOCK)
        finite = bool(torch.isfinite(loss).item())
        row = f"step {step} loss={float(loss.detach()):.6f} capture={capture:.6f} capture_top1={capture_top1:.6f} finite={finite}"
        print(row, flush=True)
        lines.append(row)
        if not finite:
            lines.append("=== exit 1 ===")
            log_path.parent.mkdir(parents=True, exist_ok=True)
            with log_path.open("a", encoding="utf-8") as handle:
                handle.write("\n".join(lines) + "\n")
            return 1
    lines.append("=== exit 0 ===")
    log_path.parent.mkdir(parents=True, exist_ok=True)
    with log_path.open("a", encoding="utf-8") as handle:
        handle.write("\n".join(lines) + "\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
