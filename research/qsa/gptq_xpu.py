"""XPU helpers for GPTQ Int4 linears.

Primary path (always available): vectorized dequant to fp16 on the XPU, then
``F.linear``, freeing the dense weight afterward. Optional path: oneDNN
``torch.ops._xpu_C.int4_gemm_w4a16`` when the native op is registered (vLLM
worker / IPEX image).
"""

from __future__ import annotations

import torch
from torch import nn
import torch.nn.functional as F


def int4_gemm_available() -> bool:
    try:
        return hasattr(torch.ops._xpu_C, "int4_gemm_w4a16")
    except Exception:
        return False

def ensure_int4_op() -> bool:
    """Best-effort load of ``_xpu_C.int4_gemm_w4a16`` (vLLM XPU ops)."""
    if int4_gemm_available():
        return True
    try:
        import vllm._xpu_ops  # noqa: F401 — registers fakes if C op present
    except Exception:
        pass
    try:
        # Importing the kernel module can pull in the native extension.
        import vllm.model_executor.kernels.linear.mixed_precision.xpu  # noqa: F401
    except Exception:
        pass
    return int4_gemm_available()




def prepare_gptq_nt(
    qweight: torch.Tensor,
    scales: torch.Tensor,
    device: torch.device | str,
) -> tuple[torch.Tensor, torch.Tensor, torch.Tensor]:
    qw = qweight.to(device=device, dtype=torch.int32, non_blocking=True)
    sc = scales.to(device=device, dtype=torch.float16, non_blocking=True)
    qweight_nt = qw.t().contiguous()
    zp = torch.tensor([8], dtype=torch.int8, device=device)
    return qweight_nt, sc, zp


def int4_linear_w4a16(
    x: torch.Tensor,
    qweight_nt: torch.Tensor,
    scales: torch.Tensor,
    zp: torch.Tensor,
    group_size: int,
    bias: torch.Tensor | None = None,
) -> torch.Tensor:
    out_features = qweight_nt.shape[0]
    out_shape = x.shape[:-1] + (out_features,)
    flat = x.reshape(-1, x.shape[-1])
    if flat.dtype != torch.float16:
        flat = flat.to(torch.float16)
    out = torch.ops._xpu_C.int4_gemm_w4a16(
        flat,
        qweight_nt.t(),
        bias if bias is not None else None,
        scales,
        zp,
        int(group_size),
        None,
    )
    return out.reshape(out_shape)


@torch.no_grad()
def dequantize_gptq_linear_device(
    qweight: torch.Tensor,
    scales: torch.Tensor,
    qzeros: torch.Tensor,
    *,
    group_size: int = 128,
    bits: int = 4,
    dtype: torch.dtype = torch.float16,
    device: torch.device | str = "xpu",
) -> torch.Tensor:
    """Vectorized GPTQ dequant on ``device`` -> ``[out, in]``."""
    if bits != 4:
        raise ValueError("only 4-bit GPTQ is implemented")
    pack = 32 // bits
    qw = qweight.to(device=device, dtype=torch.int32)
    sc = scales.to(device=device, dtype=torch.float32)
    qz = qzeros.to(device=device, dtype=torch.int32)
    in_packed, out_features = qw.shape
    in_features = in_packed * pack
    groups = in_features // group_size
    if tuple(sc.shape) != (groups, out_features):
        raise ValueError(f"scales {tuple(sc.shape)} != {(groups, out_features)}")

    shifts = torch.arange(0, 32, bits, dtype=torch.int32, device=device)
    mask = (1 << bits) - 1
    expanded = qw.unsqueeze(1).expand(in_packed, pack, out_features)
    values = torch.bitwise_and(
        torch.bitwise_right_shift(expanded, shifts.view(1, pack, 1)), mask
    ).reshape(in_features, out_features).to(torch.float32)
    packed_out = qz.shape[1]
    zexp = qz.unsqueeze(-1).expand(groups, packed_out, pack)
    zeros = torch.bitwise_and(
        torch.bitwise_right_shift(zexp, shifts.view(1, 1, pack)), mask
    ).reshape(groups, out_features).to(torch.float32) + 1.0
    values = values.view(groups, group_size, out_features)
    weight = (values - zeros[:, None, :]) * sc[:, None, :]
    return weight.reshape(in_features, out_features).transpose(0, 1).contiguous().to(dtype)


class GPTQLinearXPU(nn.Module):
    """``nn.Linear`` replacement: int4 GEMM when available, else cached fp16 weight."""

    def __init__(
        self,
        qweight: torch.Tensor,
        scales: torch.Tensor,
        qzeros: torch.Tensor | None = None,
        *,
        group_size: int = 128,
        bias: torch.Tensor | None = None,
        device: torch.device | str = "xpu",
        prefer_int4: bool = True,
    ) -> None:
        super().__init__()
        self.group_size = int(group_size)
        self.in_features = int(qweight.shape[0] * 8)
        self.out_features = int(qweight.shape[1])
        self._use_int4 = bool(prefer_int4 and ensure_int4_op())
        if bias is not None:
            self.register_buffer(
                "bias", bias.to(device=device, dtype=torch.float16), persistent=False
            )
        else:
            self.bias = None
        if self._use_int4:
            qweight_nt, sc, zp = prepare_gptq_nt(qweight, scales, device)
            self.register_buffer("qweight_nt", qweight_nt, persistent=False)
            self.register_buffer("scales", sc, persistent=False)
            self.register_buffer("zp", zp, persistent=False)
            self.weight = None
        else:
            if qzeros is None:
                raise ValueError("qzeros required for dequant fallback")
            weight = dequantize_gptq_linear_device(
                qweight, scales, qzeros, group_size=group_size, device=device,
            )
            self.register_buffer("weight", weight, persistent=False)

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        if self._use_int4:
            return int4_linear_w4a16(
                x, self.qweight_nt, self.scales, self.zp, self.group_size, self.bias
            )
        return F.linear(x, self.weight, self.bias)
