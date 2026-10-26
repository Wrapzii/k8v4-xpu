"""Int8 dequant-at-compute weight islands for k8v4 (B70 XPU).

Promoted modules listed in $K8V4_INT8_ISLANDS (comma-separated module-name
suffixes, e.g. "layers.55.self_attn.qkv_proj") get their dense weight stored
RESIDENT as per-channel symmetric int8 plus a bf16 per-row scale, halving the
island VRAM vs bf16. The checkpoint keeps its proven dense bf16 tensors; the
param-level weight_loader quantizes on load. apply() dequantizes then matmuls.

fp8-e4m3 was evaluated and rejected for this use (4-6pp tensor error vs int8
per-channel's ~0.5-1pp; k8v4 already dequantizes int4-at-compute, so int8
matches the codebase idiom).
"""

from __future__ import annotations

import os

import torch
from torch.nn.parameter import Parameter

from vllm.model_executor.layers.linear import LinearMethodBase
from vllm.model_executor.utils import set_weight_attrs


def _island_suffixes():
    raw = os.environ.get('K8V4_INT8_ISLANDS', '')
    return tuple(s.strip() for s in raw.split(',') if s.strip())


def maybe_island_method(prefix: str):
    if not prefix:
        return None
    suffixes = _island_suffixes()
    if not suffixes:
        return None
    for suf in suffixes:
        if suf and (prefix.endswith(suf)):
            return Int8IslandLinearMethod()
    return None


class Int8IslandLinearMethod(LinearMethodBase):
    """Dense linear with per-channel symmetric int8 resident weights."""

    def create_weights(
        self,
        layer: torch.nn.Module,
        input_size_per_partition: int,
        output_partition_sizes: list[int],
        input_size: int,
        output_size: int,
        params_dtype: torch.dtype,
        **extra_weight_attrs,
    ):
        extra_weight_attrs.pop("weight_loader", None)
        n = sum(output_partition_sizes)
        k = input_size_per_partition

        weight = Parameter(torch.empty(n, k, dtype=torch.int8), requires_grad=False)
        scale = Parameter(torch.empty(n, 1, dtype=params_dtype), requires_grad=False)

        def island_weight_loader(param, loaded_weight, loaded_shard_id=None):
            if loaded_shard_id is not None:
                raise RuntimeError(
                    "Int8Island weight_loader got shard_id=%r; only fused "
                    "whole-tensor loads are supported on TP1" % loaded_shard_id)
            w = loaded_weight.detach().to(torch.float32)
            if tuple(w.shape) != (n, k):
                raise RuntimeError(
                    "Int8Island got shape %s, expected (%d, %d)" % (tuple(w.shape), n, k))
            row_max = w.abs().amax(dim=1, keepdim=True)
            s = (row_max / 127.0).clamp_min(1e-12)
            q = torch.round(w / s).clamp_(-127, 127).to(torch.int8)
            param.data.copy_(q)
            layer.weight_scale.data.copy_(s.to(params_dtype))

        weight.weight_loader = island_weight_loader
        set_weight_attrs(weight, extra_weight_attrs)
        layer.register_parameter("weight", weight)
        layer.register_parameter("weight_scale", scale)

    def process_weights_after_loading(self, layer: torch.nn.Module) -> None:
        pass

    def apply(
        self,
        layer: torch.nn.Module,
        x: torch.Tensor,
        bias: torch.Tensor | None = None,
    ) -> torch.Tensor:
        w = layer.weight.to(x.dtype) * layer.weight_scale.to(x.dtype)
        return torch.nn.functional.linear(x, w, bias)

    @staticmethod
    def quantize(w_bf16: torch.Tensor, dtype=torch.bfloat16):
        w = w_bf16.to(torch.float32)
        s = (w.abs().amax(dim=1, keepdim=True) / 127.0).clamp_min(1e-12)
        q = torch.round(w / s).clamp_(-127, 127).to(torch.int8)
        return q, s.to(dtype)
