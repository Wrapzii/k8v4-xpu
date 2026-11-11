"""Per-row symmetric INT8 for QSA pooled indexer keys.

One FP32 scale per 128-d row. The scale is a single float, so the
quantization error stays in the 8-bit values and indexer top-k holds up
better than an FP16 scale. FP8 is intentionally not used.

``amax = max(abs(row), tiny)``
``scale = amax / 127``
``q = round(clamp(row / scale, -127, 127)).to(int8)``
``row_hat = q.float() * scale``

Torch only. No device imports. Callers materialize FP32 before any kernel
that requires floating pooled keys.
"""

from __future__ import annotations

import torch

# Smallest positive fp32 normal. Matches the C++ ``FLT_MIN`` used by the
# patched compact writers. A zero row stays finite and dequantizes to zero.
TINY = float(torch.finfo(torch.float32).tiny)


def quantize_pooled_rows(rows: torch.Tensor) -> tuple[torch.Tensor, torch.Tensor]:
    """Quantize ``[n, dim]`` floating rows. Returns int8 values and fp32 scales."""
    if rows.ndim != 2:
        raise ValueError("pooled rows are [n, dim]")
    values = rows if rows.dtype == torch.float32 else rows.to(dtype=torch.float32)
    amax = values.abs().amax(dim=-1).clamp_min(TINY)
    scale = amax / 127
    quantized = torch.round((values / scale.unsqueeze(-1)).clamp(-127, 127)).to(torch.int8)
    return quantized, scale


def dequantize_pooled_rows(quantized: torch.Tensor, scales: torch.Tensor | None) -> torch.Tensor:
    """Expand int8 pooled rows with one fp32 scale per row."""
    if quantized.dtype != torch.int8:
        raise ValueError("dequantize expects int8 pooled rows")
    if quantized.ndim != 2:
        raise ValueError("pooled rows are [n, dim]")
    if scales is None or not torch.is_tensor(scales):
        raise ValueError("int8 pooled keys require per-row fp32 scales")
    if not scales.is_floating_point():
        raise ValueError("pooled scales must be floating point")
    if scales.dtype == torch.float32 and scales.device == quantized.device:
        scale = scales
    else:
        scale = scales.to(device=quantized.device, dtype=torch.float32)
    if scale.ndim != 1 or int(scale.shape[0]) != int(quantized.shape[0]):
        raise ValueError("one fp32 scale per pooled row")
    return quantized.to(dtype=torch.float32) * scale.unsqueeze(-1)
