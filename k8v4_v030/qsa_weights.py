"""Optional indexer weights for the 16 full-attention layers.

A checkpoint with none of the indexer tensors loads as "no bank". The
model then stays on dense K8/V4. A layer that has some of the five tensors
and not the others is a hard error: a half-loaded indexer would select
garbage and still look configured.

HF names, anywhere under the state dict::

    layers.{i}._qsa_indexer.q_proj.weight      [512, 5120]
    layers.{i}._qsa_indexer.k_proj.weight      [128, 5120]
    layers.{i}._qsa_indexer.q_norm             [128]
    layers.{i}._qsa_indexer.k_norm             [128]   pre-pool
    layers.{i}._qsa_indexer.k_block_norm       [128]   after the mean

Norm tensors may also use a ``.weight`` suffix. The values are the real
RMSNorm multipliers. Do not add the ggml ``+ 1``.
"""

from __future__ import annotations

import json
import os
import re
from dataclasses import dataclass

import torch

from k8v4_v030.qsa_config import HIDDEN, IDX_DIM, IDX_HEADS, PARAMS_PER_LAYER, full_attention_layers
from k8v4_v030.qsa_ref import QsaHyper

_LAYER = re.compile(r"(?:^|\.)layers\.(\d+)\._qsa_indexer\.(.+)$")
_FIELDS = {
    "q_proj.weight": "q_proj",
    "k_proj.weight": "k_proj",
    "q_norm": "q_norm",
    "q_norm.weight": "q_norm",
    "k_norm": "k_norm",
    "k_norm.weight": "k_norm",
    "k_block_norm": "k_block_norm",
    "k_block_norm.weight": "k_block_norm",
}
_REQUIRED = ("q_proj", "k_proj", "q_norm", "k_block_norm", "k_norm")

_BANK: "IndexerBank | None" = None


@dataclass
class IndexerWeights:
    """One full-attention layer. Tensors are fp32, HF linear layout ``[out, in]``."""

    q_proj: torch.Tensor
    k_proj: torch.Tensor
    q_norm: torch.Tensor
    k_norm: torch.Tensor
    k_block_norm: torch.Tensor

    def numel(self) -> int:
        return sum(int(t.numel()) for t in self.tensors())

    def tensors(self) -> tuple[torch.Tensor, ...]:
        return (self.q_proj, self.k_proj, self.q_norm, self.k_norm, self.k_block_norm)

    def check(self, hyper: QsaHyper | None = None) -> None:
        hyper = hyper or QsaHyper()
        q_out = hyper.heads * hyper.dim
        shapes = {
            "q_proj": (q_out, hyper.hidden),
            "k_proj": (hyper.dim, hyper.hidden),
            "q_norm": (hyper.dim,),
            "k_norm": (hyper.dim,),
            "k_block_norm": (hyper.dim,),
        }
        for name, shape in shapes.items():
            tensor = getattr(self, name)
            if tuple(tensor.shape) != shape:
                raise ValueError("indexer %s shape %s, expected %s" % (name, tuple(tensor.shape), shape))
            if tensor.dtype != torch.float32:
                raise ValueError("indexer %s is %s, expected float32" % (name, tensor.dtype))


@dataclass
class IndexerBank:
    """Indexer weights keyed by decoder layer index. Missing layers are dense."""

    layers: dict[int, IndexerWeights]

    def get(self, layer_idx: int) -> IndexerWeights | None:
        return self.layers.get(int(layer_idx))

    def numel(self) -> int:
        return sum(item.numel() for item in self.layers.values())

    @classmethod
    def from_state_dict(
        cls,
        state: dict[str, torch.Tensor],
        hyper: QsaHyper | None = None,
    ) -> "IndexerBank | None":
        """Return None when ``state`` has no indexer tensors."""
        hyper = hyper or QsaHyper()
        found: dict[int, dict[str, torch.Tensor]] = {}
        for name, tensor in state.items():
            match = _LAYER.search(str(name))
            if match is None:
                continue
            field = _FIELDS.get(match.group(2))
            if field is None:
                raise ValueError("unrecognized indexer tensor %s" % name)
            layer = int(match.group(1))
            slot = found.setdefault(layer, {})
            if field in slot:
                raise ValueError("duplicate indexer tensor %s" % name)
            slot[field] = tensor.detach().to(torch.float32).contiguous()
        if not found:
            return None
        layers: dict[int, IndexerWeights] = {}
        for layer, slot in sorted(found.items()):
            missing = [name for name in _REQUIRED if name not in slot]
            if missing:
                raise ValueError(
                    "layer %d indexer is missing %s" % (layer, ", ".join(missing))
                )
            weights = IndexerWeights(
                q_proj=slot["q_proj"],
                k_proj=slot["k_proj"],
                q_norm=slot["q_norm"],
                k_norm=slot["k_norm"],
                k_block_norm=slot["k_block_norm"],
            )
            weights.check(hyper)
            layers[layer] = weights
        return cls(layers)


def make_random_bank(
    seed: int,
    layers: tuple[int, ...] | None = None,
    hyper: QsaHyper | None = None,
) -> IndexerBank:
    """Deterministic fp32 weights. Not trained. For kernel checks only."""
    hyper = hyper or QsaHyper()
    chosen = full_attention_layers(hyper.interval, hyper.n_layers) if layers is None else layers
    gen = torch.Generator()
    gen.manual_seed(int(seed))
    built: dict[int, IndexerWeights] = {}
    q_out = hyper.heads * hyper.dim
    for layer in chosen:
        weights = IndexerWeights(
            q_proj=torch.randn(q_out, hyper.hidden, generator=gen, dtype=torch.float32) * 0.02,
            k_proj=torch.randn(hyper.dim, hyper.hidden, generator=gen, dtype=torch.float32) * 0.02,
            q_norm=torch.ones(hyper.dim, dtype=torch.float32),
            k_norm=torch.ones(hyper.dim, dtype=torch.float32),
            k_block_norm=torch.ones(hyper.dim, dtype=torch.float32),
        )
        weights.check(hyper)
        built[int(layer)] = weights
    return IndexerBank(built)


def set_bank(bank: IndexerBank | None) -> None:
    global _BANK
    _BANK = bank


def get_bank() -> IndexerBank | None:
    return _BANK


def reset_bank() -> None:
    set_bank(None)


def _is_indexer_name(name: str) -> bool:
    return _LAYER.search(str(name)) is not None


def _read_indexer_safetensors(path: str) -> dict[str, torch.Tensor]:
    """Read only indexer tensors. Other keys in the shard stay on disk."""
    from safetensors import safe_open

    found: dict[str, torch.Tensor] = {}
    with safe_open(path, framework="pt", device="cpu") as handle:
        for name in handle.keys():
            if _is_indexer_name(name):
                found[str(name)] = handle.get_tensor(name)
    return found


def _indexer_shards(directory: str) -> list[str]:
    """Safetensors files that can hold indexer weights.

    An HF ``model.safetensors.index.json`` limits the read to shards named
    by an indexer key. Without an index, every ``*.safetensors`` file in the
    directory is opened and filtered by tensor name.
    """
    index_path = os.path.join(directory, "model.safetensors.index.json")
    if os.path.isfile(index_path):
        with open(index_path, encoding="utf-8") as handle:
            payload = json.load(handle)
        weight_map = payload.get("weight_map")
        if not isinstance(weight_map, dict):
            raise ValueError("indexer index %s has no weight_map" % index_path)
        names = sorted({str(shard) for name, shard in weight_map.items() if _is_indexer_name(str(name))})
        return [os.path.join(directory, name) for name in names]
    names = sorted(
        entry for entry in os.listdir(directory) if entry.endswith(".safetensors")
    )
    return [os.path.join(directory, name) for name in names]


def load_state_dict_file(path: str) -> dict[str, torch.Tensor]:
    """Load indexer tensors from a torch save, a safetensors file, or a directory.

    A directory is an HF checkpoint folder. Only ``_qsa_indexer`` tensors are
    read, so pointing this at a full model does not pull the dense weights
    into memory. A folder with none of those tensors yields an empty dict,
    which the bank treats as "no indexer".
    """
    if os.path.isdir(path):
        found: dict[str, torch.Tensor] = {}
        for shard in _indexer_shards(path):
            if not os.path.isfile(shard):
                raise FileNotFoundError(shard)
            for name, tensor in _read_indexer_safetensors(shard).items():
                if name in found:
                    raise ValueError("duplicate indexer tensor %s" % name)
                found[name] = tensor
        return found
    if path.endswith(".safetensors"):
        return _read_indexer_safetensors(path)
    loaded = torch.load(path, map_location="cpu", weights_only=True)
    if not isinstance(loaded, dict):
        raise ValueError("indexer checkpoint is not a state dict")
    return {str(k): v for k, v in loaded.items() if isinstance(v, torch.Tensor)}


def load_bank_file(path: str, hyper: QsaHyper | None = None) -> IndexerBank | None:
    return IndexerBank.from_state_dict(load_state_dict_file(path), hyper)


def expected_full_numel() -> int:
    return PARAMS_PER_LAYER * len(full_attention_layers())
