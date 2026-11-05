"""XPU helpers for GPTQ Int4 linears.

Primary path (always available): vectorized dequant to fp16, then ``F.linear``.
Optional path: oneDNN ``torch.ops._xpu_C.int4_gemm_w4a16`` only when that op
is registered and ``torch.xpu.is_available()`` is true. A registered fake op
on CPU must not take the int4 path.
"""

from __future__ import annotations

import torch
from torch import nn
import torch.nn.functional as F


def _int4_op_registered() -> bool:
    try:
        ops = getattr(torch.ops, "_xpu_C", None)
        return ops is not None and hasattr(ops, "int4_gemm_w4a16")
    except Exception:
        return False


def _xpu_runtime_available() -> bool:
    xpu = getattr(torch, "xpu", None)
    if xpu is None:
        return False
    try:
        return bool(xpu.is_available())
    except Exception:
        return False


def int4_gemm_available() -> bool:
    """True when ``int4_gemm_w4a16`` is registered and a real XPU is up."""
    return _int4_op_registered() and _xpu_runtime_available()


def ensure_int4_op() -> bool:
    """Import vLLM XPU ops if needed. True only when the op can run on XPU."""
    if not _int4_op_registered():
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
    """Pack GPTQ ``qweight`` ``[K/8, N]`` into contiguous NT ``[N, K/8]``.

    Copies are blocking. A non-blocking CPU→XPU copy can be read after the
    source storage is freed.
    """
    dev = torch.device(device)
    qw = qweight.to(device=dev, dtype=torch.int32)
    sc = scales.to(device=dev, dtype=torch.float16).contiguous()
    qweight_nt = qw.transpose(0, 1).contiguous()
    zp = torch.tensor([8], dtype=torch.int8, device=qweight_nt.device)
    return qweight_nt, sc, zp


def kernel_qweight_from_nt(qweight_nt: torch.Tensor) -> torch.Tensor:
    """``[K/8, N]`` view over the contiguous NT buffer.

    The oneDNN kernel reads this strided transpose. Do not call
    ``contiguous()`` on the returned view.
    """
    return qweight_nt.transpose(0, 1)


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
    if flat.device.type != "xpu":
        raise RuntimeError(
            f"int4_gemm_w4a16 requires xpu activations, got {flat.device.type}"
        )
    out = torch.ops._xpu_C.int4_gemm_w4a16(
        flat,
        kernel_qweight_from_nt(qweight_nt),
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
        dev = torch.device(device)
        self.group_size = int(group_size)
        self.in_features = int(qweight.shape[0] * 8)
        self.out_features = int(qweight.shape[1])
        # prefer_int4 on CPU must stay on the dequant path even if the op namespace exists.
        self._use_int4 = bool(prefer_int4 and dev.type == "xpu" and ensure_int4_op())
        if bias is not None:
            self.register_buffer(
                "bias", bias.to(device=dev, dtype=torch.float16), persistent=False
            )
        else:
            self.bias = None
        if self._use_int4:
            qweight_nt, sc, zp = prepare_gptq_nt(qweight, scales, dev)
            self.register_buffer("qweight_nt", qweight_nt, persistent=False)
            self.register_buffer("scales", sc, persistent=False)
            self.register_buffer("zp", zp, persistent=False)
            self.weight = None
        else:
            if qzeros is None:
                raise ValueError("qzeros required for dequant fallback")
            weight = dequantize_gptq_linear_device(
                qweight, scales, qzeros, group_size=group_size, device=dev,
            )
            self.register_buffer("weight", weight, persistent=False)

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        if self._use_int4:
            return int4_linear_w4a16(
                x, self.qweight_nt, self.scales, self.zp, self.group_size, self.bias
            )
        return F.linear(x, self.weight, self.bias)
