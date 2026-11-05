"""Held-out top-2048 dense-mass recall for trained vs random-init indexers."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import torch

from qsa.device import resolve_device, to_device
from qsa.indexer import QSAIndexer
from qsa.sparse_attention import select_blocks

FULL_LAYERS = list(range(3, 64, 4))
BUDGET = 2048
BLOCK = 4


def _load_indexers(checkpoint: Path | None, device: str, hidden: int = 5120, rope_dim: int = 64):
    indexers = {}
    state = None
    if checkpoint is not None:
        state = torch.load(checkpoint, map_location="cpu", weights_only=True)
        state = {int(k): v for k, v in state.items()}
    for layer in FULL_LAYERS:
        mod = QSAIndexer(
            hidden_size=hidden, num_heads=4, head_dim=128, rope_dim=rope_dim,
            block_size=BLOCK, logit_scale=128 ** -0.5,
        ).to(device=device, dtype=torch.float32)
        if state is not None and layer in state:
            mod.load_state_dict(state[layer])
        mod.eval()
        indexers[layer] = mod
    return indexers


@torch.no_grad()
def recall_for_pack(indexers, pack: dict[int, dict], device: str) -> dict[int, float]:
    out = {}
    for layer, blob in pack.items():
        hidden = blob["hidden_pre_attn"].float()
        if hidden.ndim == 2:
            hidden = hidden.unsqueeze(0)
        cos, sin = blob["cos"].float(), blob["sin"].float()
        if cos.ndim == 3:
            cos, sin = cos[0], sin[0]
        target = blob["block_teacher"].float()
        if target.ndim == 2:
            target = target.unsqueeze(0)
        hidden, cos, sin, target = (to_device(t, device) for t in (hidden, cos, sin, target))
        scores, valid = indexers[layer](hidden, cos, sin)
        selected = select_blocks(scores, valid, BUDGET, BLOCK)
        mass = target.gather(-1, selected).sum(-1)
        mask = valid.any(-1)
        out[int(layer)] = float(mass[mask].mean()) if bool(mask.any()) else 0.0
    return out


def main(argv=None) -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--checkpoint", default="")
    p.add_argument("--activations", required=True, help="dir with layer_*.pt OR parent of step_*")
    p.add_argument("--out", required=True)
    p.add_argument("--device", default="")
    args = p.parse_args(argv)
    device = args.device or resolve_device()
    act = Path(args.activations)
    packs = []
    steps = sorted(act.glob("step_*"))
    if steps:
        for d in steps:
            pack = {int(f.stem.split("_")[1]): torch.load(f, map_location="cpu", weights_only=True)
                    for f in d.glob("layer_*.pt")}
            packs.append(pack)
    else:
        pack = {int(f.stem.split("_")[1]): torch.load(f, map_location="cpu", weights_only=True)
                for f in act.glob("layer_*.pt")}
        packs.append(pack)

    rope_dim = 64
    trained = _load_indexers(Path(args.checkpoint) if args.checkpoint else None, device, rope_dim=rope_dim)
    random = _load_indexers(None, device, rope_dim=rope_dim)

    trained_sum = {L: 0.0 for L in FULL_LAYERS}
    random_sum = {L: 0.0 for L in FULL_LAYERS}
    n = 0
    for pack in packs:
        tr = recall_for_pack(trained, pack, device)
        rd = recall_for_pack(random, pack, device)
        for L in FULL_LAYERS:
            if L in tr:
                trained_sum[L] += tr[L]
                random_sum[L] += rd[L]
        n += 1
    report = {
        "n_packs": n,
        "budget": BUDGET,
        "trained_mean_recall": {str(L): trained_sum[L] / max(n, 1) for L in FULL_LAYERS},
        "random_mean_recall": {str(L): random_sum[L] / max(n, 1) for L in FULL_LAYERS},
        "trained_overall": sum(trained_sum.values()) / (max(n, 1) * len(FULL_LAYERS)),
        "random_overall": sum(random_sum.values()) / (max(n, 1) * len(FULL_LAYERS)),
        "checkpoint": args.checkpoint,
        "activations": str(act),
    }
    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
