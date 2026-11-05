"""Train the 16 QSA indexers from captured activations or a live GPTQ teacher.

Disk mode reads ``layer_{idx}.pt`` packs. ``--overfit`` reuses one pack every
step (the seq-128 smoke set). Otherwise each step loads
``activations/step_{n}/`` and cycles when there are fewer packs than steps.
``--on-the-fly`` tokenizes ids and calls ``FrozenGPTQSwift.capture``.

The step matches ``train_indexer.distill_step``: AdamW, grad clip 1.0, block
KL, and top-k teacher mass. Checkpoints are ``{layer_idx: state_dict}``.
"""

from __future__ import annotations

import argparse
import os
import sys
from datetime import datetime
from pathlib import Path

_RESEARCH = Path(__file__).resolve().parents[1]
if str(_RESEARCH) not in sys.path:
    sys.path.insert(0, str(_RESEARCH))

import torch

from qsa.device import empty_cache, resolve_device, synchronize, to_device
from qsa.indexer import QSAIndexer
from qsa.losses import indexer_kl_from_target
from qsa.sparse_attention import select_blocks


FULL_LAYERS = list(range(3, 64, 4))
HIDDEN = 5120
HEADS = 4
HEAD_DIM = 128
ROPE_DIM = 64
BLOCK = 4
BUDGET = 2048
HDD = Path("/mnt/hdd-500gb/model-validation/qsa-train")


def save_indexers(indexers: dict[int, QSAIndexer], path: Path) -> Path:
    """``{layer_idx: state_dict}`` on CPU, same pattern as ``train_indexer.save_indexers``."""
    state = {
        int(layer): {name: tensor.detach().cpu() for name, tensor in module.state_dict().items()}
        for layer, module in indexers.items()
    }
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    torch.save(state, path)
    print(f"[gptq-train] saved {path} ({path.stat().st_size / 2**20:.1f} MiB)", flush=True)
    return path


def _parse_layers(text: str) -> list[int]:
    if text == "all":
        return list(FULL_LAYERS)
    layers = [int(part) for part in text.split(",") if part.strip()]
    missing = [layer for layer in layers if layer not in FULL_LAYERS]
    if missing:
        raise SystemExit(f"not full-attention layers: {missing}")
    return layers


def _load_pack(directory: Path, layers: list[int]) -> dict[int, dict]:
    pack = {}
    for layer in layers:
        path = directory / f"layer_{layer}.pt"
        if not path.is_file():
            raise FileNotFoundError(path)
        pack[layer] = torch.load(path, map_location="cpu", weights_only=True)
    return pack


def _step_dirs(activations_dir: Path) -> list[Path]:
    found = []
    for path in activations_dir.glob("step_*"):
        if path.is_dir() and path.name.split("_", 1)[1].isdigit():
            found.append(path)
    return sorted(found, key=lambda path: int(path.name.split("_", 1)[1]))


def _cos_sin(blob: dict) -> tuple[torch.Tensor, torch.Tensor]:
    cos, sin = blob["cos"], blob["sin"]
    if cos.ndim == 3:
        cos, sin = cos[0], sin[0]
    return cos.float(), sin.float()


def _batch(blob: dict, device: str) -> tuple[torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor]:
    hidden = blob["hidden_pre_attn"].float()
    if hidden.ndim == 2:
        hidden = hidden.unsqueeze(0)
    cos, sin = _cos_sin(blob)
    target = blob["block_teacher"].float()
    return (
        to_device(hidden, device),
        to_device(cos, device),
        to_device(sin, device),
        to_device(target, device),
    )


class DiskActivations:
    def __init__(self, activations_dir: Path, layers: list[int], overfit: bool):
        self.layers = layers
        self.overfit = overfit
        self.flat = _step_dirs(activations_dir) == []
        if overfit or self.flat:
            if not overfit and self.flat:
                raise SystemExit(
                    f"no {activations_dir}/step_N packs; pass --overfit to reuse layer_*.pt"
                )
            self.packs = [_load_pack(activations_dir, layers)]
            self.flat = True
        else:
            dirs = _step_dirs(activations_dir)
            self.packs = [_load_pack(path, layers) for path in dirs]

    def for_step(self, step: int) -> dict[int, dict]:
        return self.packs[(step - 1) % len(self.packs)]


class OnTheFly:
    """Random ids, or one FineWeb-edu stream when the dataset can be opened."""

    def __init__(self, model: Path, seq: int, layers: list[int], log):
        from qsa.gptq_backbone import FrozenGPTQSwift

        self.seq = seq
        self.layers = layers
        self.log = log
        self.backbone = FrozenGPTQSwift(model, probe=False)
        self.vocab = self.backbone.vocab_size
        self._fineweb = None
        self._pending = None
        self._tokenizer = None
        try:
            from transformers import AutoTokenizer

            from qsa.data import iter_token_blocks

            self._tokenizer = AutoTokenizer.from_pretrained(model, local_files_only=True)
            self._fineweb = iter_token_blocks(self._tokenizer, seq, n_blocks=10**9)
            self._pending = next(self._fineweb)
            log("on-the-fly tokens: fineweb-edu stream")
        except Exception as exc:
            self._fineweb = None
            self._pending = None
            log(f"on-the-fly tokens: random ids ({type(exc).__name__}: {exc})")

    def for_step(self, step: int) -> dict[int, dict]:
        ids = self._next_ids(step)
        return self.backbone.capture(
            ids, mode="auto", layers=self.layers, block_size=BLOCK,
        )

    def _next_ids(self, step: int) -> torch.Tensor:
        if self._pending is not None:
            pending = self._pending
            self._pending = None
            return pending.view(1, self.seq)
        if self._fineweb is not None:
            try:
                return next(self._fineweb).view(1, self.seq)
            except Exception as exc:
                self._fineweb = None
                self.log(f"fineweb stopped ({type(exc).__name__}: {exc}); random ids")
        generator = torch.Generator().manual_seed(step)
        return torch.randint(0, self.vocab, (1, self.seq), generator=generator)

    def close(self) -> None:
        self.backbone.close()


def _build_indexers(layers: list[int], device: str, rope_dim: int, hidden: int) -> dict[int, QSAIndexer]:
    indexers = {}
    for layer in layers:
        module = QSAIndexer(
            hidden_size=hidden,
            num_heads=HEADS,
            head_dim=HEAD_DIM,
            rope_dim=rope_dim,
            block_size=BLOCK,
            logit_scale=HEAD_DIM ** -0.5,
        ).to(device=device, dtype=torch.float32)
        module.train()
        indexers[layer] = module
    return indexers


def _metrics(scores: torch.Tensor, target: torch.Tensor, valid: torch.Tensor) -> tuple[float, int, float, float]:
    """Capture mass plus the entropy and score-std terms from ``distill_step``."""
    selected = select_blocks(scores.detach(), valid, BUDGET, BLOCK)
    mass = target.gather(-1, selected).sum(-1)
    mask = valid.any(-1)
    cap_sum = float(mass[mask].sum()) if bool(mask.any()) else 0.0
    cap_count = int(mask.sum())
    probs = target / target.sum(-1, keepdim=True).clamp_min(1e-12)
    ent = -(probs * probs.clamp_min(1e-12).log()).sum(-1)
    ent_mean = float(ent[mask].mean()) if bool(mask.any()) else 0.0
    filled = scores.detach().masked_fill(~valid, 0.0)
    count = valid.sum(-1).clamp_min(1)
    mean = filled.sum(-1) / count
    var = (((filled - mean.unsqueeze(-1)) ** 2) * valid).sum(-1) / count
    std_mean = float(var.clamp_min(0).sqrt().mean())
    return cap_sum, cap_count, ent_mean, std_mean


def train(args: argparse.Namespace) -> Path:
    os.environ["QSA_DEVICE"] = args.device
    device = resolve_device()
    if device != args.device:
        raise SystemExit(f"--device {args.device} resolved to {device}")
    torch.set_num_threads(int(os.environ.get("OMP_NUM_THREADS", "8")))
    layers = _parse_layers(args.layers)
    log_path = Path(args.log)
    log_path.parent.mkdir(parents=True, exist_ok=True)

    def log(message: str) -> None:
        print(message, flush=True)
        with log_path.open("a", encoding="utf-8") as handle:
            handle.write(message + "\n")

    log(f"=== train_from_gptq {datetime.now().isoformat(timespec='seconds')} device={device} ===")
    log(
        f"steps={args.steps} seq={args.seq} lr={args.lr} overfit={args.overfit} "
        f"on_the_fly={args.on_the_fly} layers={layers}"
    )

    source = None
    if args.on_the_fly:
        if args.overfit:
            raise SystemExit("pass only one of --on-the-fly and --overfit")
        source = OnTheFly(Path(args.model), args.seq, layers, log)
        hidden_size, rope_dim = HIDDEN, ROPE_DIM
    else:
        source = DiskActivations(Path(args.activations_dir), layers, args.overfit)
        sample = next(iter(source.packs[0].values()))
        hidden = sample["hidden_pre_attn"]
        cos, _sin = _cos_sin(sample)
        hidden_size = int(hidden.shape[-1])
        rope_dim = int(cos.shape[-1])
        seq = int(hidden.shape[-2] if hidden.ndim == 3 else hidden.shape[0])
        log(f"disk pack seq={seq} tensors={tuple(sample['block_teacher'].shape)} packs={len(source.packs)}")
        if args.overfit and args.seq != seq:
            log(f"overfit uses activation seq {seq} (flag --seq {args.seq})")

    indexers = _build_indexers(layers, device, rope_dim, hidden_size)
    optimizer = torch.optim.AdamW(
        [param for module in indexers.values() for param in module.parameters()],
        lr=args.lr, betas=(0.9, 0.95), eps=1e-8, weight_decay=0.0,
    )
    out_dir = Path(args.out_dir)
    final = Path(args.checkpoint) if args.checkpoint else out_dir / "qsa_indexers.pt"
    try:
        for step in range(1, args.steps + 1):
            optimizer.zero_grad(set_to_none=True)
            pack = source.for_step(step)
            total_loss = 0.0
            cap_sum = 0.0
            cap_count = 0
            ent_sum = 0.0
            std_sum = 0.0
            used = 0
            for layer in layers:
                hidden, cos, sin, target = _batch(pack[layer], device)
                scores, valid = indexers[layer](hidden, cos, sin)
                loss = indexer_kl_from_target(scores, target, valid[0])
                loss.backward()
                total_loss += float(loss.detach())
                used += 1
                with torch.no_grad():
                    part_sum, part_count, ent, std = _metrics(scores, target, valid)
                cap_sum += part_sum
                cap_count += part_count
                ent_sum += ent
                std_sum += std
                del scores, loss, hidden, target
            synchronize()
            torch.nn.utils.clip_grad_norm_(
                [param for module in indexers.values() for param in module.parameters()],
                1.0,
            )
            optimizer.step()
            empty_cache()
            if step % args.log_every == 0 or step == args.steps:
                loss_mean = total_loss / max(used, 1)
                capture = cap_sum / max(cap_count, 1)
                log(
                    f"step {step}/{args.steps} loss={loss_mean:.6f} capture={capture:.6f} "
                    f"teacher_entropy={ent_sum / max(used, 1):.4f} "
                    f"score_std={std_sum / max(used, 1):.4f}"
                )
            if args.save_every and step % args.save_every == 0:
                save_indexers(indexers, out_dir / f"qsa_indexers_step{step}.pt")
        save_indexers(indexers, final)
    finally:
        close = getattr(source, "close", None)
        if close:
            close()
    log(f"=== exit 0 checkpoint={final} ===")
    return final


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--steps", type=int, default=300)
    parser.add_argument("--seq", type=int, default=16384)
    parser.add_argument("--lr", type=float, default=3e-4)
    parser.add_argument("--model", default="/srv/launch80-target-fast")
    parser.add_argument("--activations-dir", default=str(HDD / "activations"))
    parser.add_argument("--out-dir", default=str(HDD / "checkpoints"))
    parser.add_argument("--device", default=os.environ.get("QSA_DEVICE", "cpu"))
    parser.add_argument("--layers", default="all")
    parser.add_argument("--save-every", type=int, default=50)
    parser.add_argument("--log-every", type=int, default=1)
    parser.add_argument("--on-the-fly", action="store_true")
    parser.add_argument("--overfit", action="store_true")
    parser.add_argument("--log", default=str(HDD / "logs" / "train-from-gptq.log"))
    parser.add_argument("--checkpoint", default="")
    args = parser.parse_args(argv)
    train(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
