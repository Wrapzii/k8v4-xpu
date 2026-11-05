"""Write k8v4 indexer weights from a ``{layer_idx: state_dict}`` checkpoint.

Norms stay the zero-centered training deltas (``q_norm``, not ``1 + q_norm``).
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import torch
from safetensors.torch import save_file


SUFFIXES = (
    "q_proj.weight",
    "k_proj.weight",
    "q_norm",
    "k_norm",
    "k_block_norm",
)
FULL_LAYERS = list(range(3, 64, 4))
EXPECTED_PARAMS = 52_434_944


def _layer_key(layer: int, name: str) -> str:
    return f"model.language_model.layers.{layer}.self_attn._qsa_indexer.{name}"


def export_k8v4(checkpoint: Path, out_dir: Path) -> tuple[Path, Path]:
    state = torch.load(checkpoint, map_location="cpu", weights_only=True)
    state = {int(layer): tensors for layer, tensors in state.items()}
    tensors = {}
    for layer in sorted(state):
        blob = state[layer]
        missing = [name for name in SUFFIXES if name not in blob]
        if missing:
            raise ValueError(f"layer {layer} missing {missing}")
        for name in SUFFIXES:
            weight = blob[name].detach().to(dtype=torch.float32).contiguous()
            if not torch.isfinite(weight).all():
                raise ValueError(f"non-finite {layer}/{name}")
            tensors[_layer_key(layer, name)] = weight
    count = sum(weight.numel() for weight in tensors.values())
    out_dir.mkdir(parents=True, exist_ok=True)
    weights_path = out_dir / "qsa-indexers.safetensors"
    save_file(tensors, weights_path, metadata={"format": "pt", "norm_storage": "zero-centered-delta"})
    manifest = {
        "full_attention_layers": sorted(state),
        "indexer_parameters": count,
        "expected_parameters_16_layers": EXPECTED_PARAMS,
        "safetensors": weights_path.name,
        "dtype": "float32",
        "norm_storage": "zero-centered training delta (state_dict q_norm, not 1+w)",
        "keys_per_layer": list(SUFFIXES),
        "checkpoint": str(Path(checkpoint).resolve()),
        "complete_full_attention_set": sorted(state) == FULL_LAYERS,
    }
    manifest_path = out_dir / "conversion_manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"[export] {weights_path} params={count} layers={sorted(state)}", flush=True)
    print(f"[export] {manifest_path}", flush=True)
    return weights_path, manifest_path


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--checkpoint", required=True)
    parser.add_argument(
        "--out-dir",
        default="/mnt/hdd-500gb/model-validation/qsa-train/exports",
    )
    args = parser.parse_args(argv)
    export_k8v4(Path(args.checkpoint), Path(args.out_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
