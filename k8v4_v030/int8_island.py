"""Int8 weight islands for k8v4 (B70 XPU), native int8_gemm_w8a16 path.

Promoted modules listed in $K8V4_INT8_ISLANDS (comma-separated module-name
suffixes, e.g. "layers.55.self_attn.qkv_proj") get their dense weight stored
RESIDENT as group-128 symmetric int8 plus bf16 per-group scales, halving the
island VRAM vs bf16. The checkpoint keeps its proven dense bf16 tensors; the
param-level weight_loader quantizes on load.

apply() calls the vllm-xpu-kernels oneDNN primitive int8_gemm_w8a16
(bf16 activations x s8 weights, group-128 scales folded by the kernel)
when the patched wheel is installed; otherwise falls back to
dequant-then-matmul. Scale layout for the kernel: [K/128, N] bf16 —
passing the [N, K/128] orientation silently degrades output (corr ~0.98).
"""

from __future__ import annotations

import os

import torch
from torch.nn.parameter import Parameter

from vllm.model_executor.layers.linear import LinearMethodBase
from vllm.model_executor.utils import set_weight_attrs

GROUP_SIZE = 128


def _island_suffixes():
    raw = os.environ.get('K8V4_INT8_ISLANDS', '')
    return tuple(s.strip() for s in raw.split(',') if s.strip())


def _int8_op():
    try:
        import vllm_xpu_kernels._xpu_C  # noqa: F401
    except Exception:
        return None
    op = getattr(torch.ops._xpu_C, "int8_gemm_w8a16", None)
    return op if op is not None else None


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
    """Dense linear with group-128 symmetric int8 resident weights."""

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
        if k % GROUP_SIZE != 0:
            raise RuntimeError(
                "Int8Island requires K %% %d == 0, got K=%d" % (GROUP_SIZE, k))

        weight = Parameter(torch.empty(n, k, dtype=torch.int8), requires_grad=False)
        scale = Parameter(
            torch.empty(n, k // GROUP_SIZE, dtype=params_dtype), requires_grad=False)

        def island_weight_loader(param, loaded_weight, loaded_shard_id=None):
            if loaded_shard_id is not None:
                raise RuntimeError(
                    "Int8Island weight_loader got shard_id=%r; only fused "
                    "whole-tensor loads are supported on TP1" % loaded_shard_id)
            w = loaded_weight.detach().to(torch.float32)
            if tuple(w.shape) != (n, k):
                raise RuntimeError(
                    "Int8Island got shape %s, expected (%d, %d)" % (tuple(w.shape), n, k))
            wg = w.reshape(n, k // GROUP_SIZE, GROUP_SIZE)
            s = (wg.abs().amax(dim=-1, keepdim=True) / 127.0).clamp_min(1e-12)
            q = torch.round(wg / s).clamp_(-127, 127).to(torch.int8).reshape(n, k)
            param.data.copy_(q)
            layer.weight_scale.data.copy_(s.squeeze(-1).to(params_dtype))

        weight.weight_loader = island_weight_loader
        set_weight_attrs(weight, extra_weight_attrs)
        layer.register_parameter("weight", weight)
        layer.register_parameter("weight_scale", scale)

    def process_weights_after_loading(self, layer: torch.nn.Module) -> None:
        layer.weight_t = layer.weight.data.t()
        layer.scale_t = layer.weight_scale.data.t().contiguous()

    def apply(
        self,
        layer: torch.nn.Module,
        x: torch.Tensor,
        bias: torch.Tensor | None = None,
    ) -> torch.Tensor:
        op = _int8_op()
        if op is not None and layer.weight_t.device == x.device:
            out_shape = x.shape[:-1] + (layer.weight_t.shape[1],)
            y = op(x.reshape(-1, x.shape[-1]), layer.weight_t, bias, layer.scale_t,
                   GROUP_SIZE)
            return y.reshape(out_shape)
        w = layer.weight.to(x.dtype) * layer.weight_scale.to(x.dtype)
        return torch.nn.functional.linear(x, w, bias)

    @staticmethod
    def quantize(w_bf16: torch.Tensor, dtype=torch.bfloat16):
        n, k = w_bf16.shape
        w = w_bf16.to(torch.float32).reshape(n, k // GROUP_SIZE, GROUP_SIZE)
        s = (w.abs().amax(dim=-1, keepdim=True) / 127.0).clamp_min(1e-12)
        q = torch.round(w / s).clamp_(-127, 127).to(torch.int8).reshape(n, k)
        return q, s.squeeze(-1).to(dtype)
