"""Triton activation quantizers for K8V4_W4A8_KERNEL=onednn.

One program per token row. The compiled-torch quantizers in w4a8_prefill.py
measured 1.9 ms (per token) and 6.2 ms (per 64 channels) for the
[4224, 17408] down-projection input on one B70, several times the memory
time of the row; these kernels read the row once (grouped) or twice (per
token) and write the int8 codes and fp16 scales. Rounding is half away from
zero, as int8 symmetric quantizers usually round; scales are the fp16-rounded
``amax / 127`` and the codes are computed with that rounded scale.
The fused variants also compute SiLU(gate) * up, or the gated RMSNorm of a
GDN head (vLLM's RMSNormGated.forward_static with the gate after the norm),
rounded to the activation dtype before quantizing.
"""

from __future__ import annotations

import torch
import triton
import triton.language as tl

BLOCK = 1024


@triton.jit
def _round_clamp(q):
    q = tl.where(q >= 0, tl.floor(q + 0.5), tl.ceil(q - 0.5))
    return tl.minimum(tl.maximum(q, -127.0), 127.0)


@triton.jit
def _q8_row_kernel(x_ptr, q_ptr, s_ptr, K, BLOCK: tl.constexpr):
    row = tl.program_id(0).to(tl.int64)
    base = row * K
    amax = tl.zeros([BLOCK], dtype=tl.float32)
    for k in range(0, K, BLOCK):
        offs = k + tl.arange(0, BLOCK)
        x = tl.load(x_ptr + base + offs, mask=offs < K, other=0.0).to(tl.float32)
        amax = tl.maximum(amax, tl.abs(x))
    s16 = tl.maximum(tl.max(amax, 0) / 127.0, 1e-5).to(tl.float16)
    inv = 1.0 / s16.to(tl.float32)
    for k in range(0, K, BLOCK):
        offs = k + tl.arange(0, BLOCK)
        x = tl.load(x_ptr + base + offs, mask=offs < K, other=0.0).to(tl.float32)
        tl.store(q_ptr + base + offs, _round_clamp(x * inv).to(tl.int8), mask=offs < K)
    tl.store(s_ptr + row, s16)


@triton.jit
def _q8_group_kernel(x_ptr, q_ptr, s_ptr, K, NG, G: tl.constexpr, BLOCK: tl.constexpr):
    row = tl.program_id(0).to(tl.int64)
    base = row * K
    for k in range(0, K, BLOCK):
        offs = k + tl.arange(0, BLOCK)
        x = tl.load(x_ptr + base + offs, mask=offs < K, other=0.0).to(tl.float32)
        x2 = tl.reshape(x, (BLOCK // G, G))
        s16 = tl.maximum(tl.max(tl.abs(x2), 1) / 127.0, 1e-5).to(tl.float16)
        q = _round_clamp(x2 * (1.0 / s16.to(tl.float32))[:, None])
        tl.store(q_ptr + base + offs, tl.reshape(q, (BLOCK,)).to(tl.int8), mask=offs < K)
        goffs = k // G + tl.arange(0, BLOCK // G)
        tl.store(s_ptr + row * NG + goffs, s16, mask=goffs < NG)


@triton.jit
def _silu_q8_group_kernel(gu_ptr, q_ptr, s_ptr, K, NG, BF16: tl.constexpr, G: tl.constexpr,
                          BLOCK: tl.constexpr):
    row = tl.program_id(0).to(tl.int64)
    gbase = row * (2 * K)
    base = row * K
    for k in range(0, K, BLOCK):
        offs = k + tl.arange(0, BLOCK)
        m = offs < K
        g = tl.load(gu_ptr + gbase + offs, mask=m, other=0.0).to(tl.float32)
        u = tl.load(gu_ptr + gbase + K + offs, mask=m, other=0.0).to(tl.float32)
        y = g * tl.sigmoid(g) * u
        if BF16:
            y = y.to(tl.bfloat16).to(tl.float32)
        else:
            y = y.to(tl.float16).to(tl.float32)
        y2 = tl.reshape(y, (BLOCK // G, G))
        s16 = tl.maximum(tl.max(tl.abs(y2), 1) / 127.0, 1e-5).to(tl.float16)
        q = _round_clamp(y2 * (1.0 / s16.to(tl.float32))[:, None])
        tl.store(q_ptr + base + offs, tl.reshape(q, (BLOCK,)).to(tl.int8), mask=m)
        goffs = k // G + tl.arange(0, BLOCK // G)
        tl.store(s_ptr + row * NG + goffs, s16, mask=goffs < NG)


@triton.jit
def _gnorm_q8_group_kernel(o_ptr, z_ptr, w_ptr, q_ptr, s_ptr, K, NG, eps, SIGMOID: tl.constexpr,
                           BF16: tl.constexpr, D: tl.constexpr, G: tl.constexpr, BLOCK: tl.constexpr):
    row = tl.program_id(0).to(tl.int64)
    base = row * K
    w = tl.load(w_ptr + tl.arange(0, D)).to(tl.float32)
    for k in range(0, K, BLOCK):
        offs = k + tl.arange(0, BLOCK)
        x = tl.reshape(tl.load(o_ptr + base + offs).to(tl.float32), (BLOCK // D, D))
        zz = tl.reshape(tl.load(z_ptr + base + offs).to(tl.float32), (BLOCK // D, D))
        var = tl.sum(x * x, 1) / D
        y = x * tl.rsqrt(var + eps)[:, None] * w[None, :]
        if SIGMOID:
            y = y * tl.sigmoid(zz)
        else:
            y = y * (zz * tl.sigmoid(zz))
        y = tl.reshape(y, (BLOCK,))
        if BF16:
            y = y.to(tl.bfloat16).to(tl.float32)
        else:
            y = y.to(tl.float16).to(tl.float32)
        y2 = tl.reshape(y, (BLOCK // G, G))
        s16 = tl.maximum(tl.max(tl.abs(y2), 1) / 127.0, 1e-5).to(tl.float16)
        q = _round_clamp(y2 * (1.0 / s16.to(tl.float32))[:, None])
        tl.store(q_ptr + base + offs, tl.reshape(q, (BLOCK,)).to(tl.int8))
        goffs = k // G + tl.arange(0, BLOCK // G)
        tl.store(s_ptr + row * NG + goffs, s16)


@triton.jit
def _silu_mul_kernel(gu_ptr, y_ptr, K, BF16: tl.constexpr, BLOCK: tl.constexpr):
    """SiLU(gate) * up computed in fp32 and rounded once, as the compiled stock SiluAndMul does."""
    row = tl.program_id(0).to(tl.int64)
    offs = tl.program_id(1) * BLOCK + tl.arange(0, BLOCK)
    m = offs < K
    g = tl.load(gu_ptr + row * 2 * K + offs, mask=m, other=0.0).to(tl.float32)
    u = tl.load(gu_ptr + row * 2 * K + K + offs, mask=m, other=0.0).to(tl.float32)
    y = g * tl.sigmoid(g) * u
    if BF16:
        tl.store(y_ptr + row * K + offs, y.to(tl.bfloat16), mask=m)
    else:
        tl.store(y_ptr + row * K + offs, y.to(tl.float16), mask=m)


@triton.jit
def _gnorm_kernel(o_ptr, z_ptr, w_ptr, y_ptr, K, eps, SIGMOID: tl.constexpr, BF16: tl.constexpr,
                  D: tl.constexpr, BLOCK: tl.constexpr):
    """_gnorm_q8_group_kernel without the quantizer, on a (row, block of heads) grid: the normed output itself."""
    row = tl.program_id(0).to(tl.int64)
    offs = tl.program_id(1) * BLOCK + tl.arange(0, BLOCK)
    base = row * K
    w = tl.load(w_ptr + tl.arange(0, D)).to(tl.float32)
    x = tl.reshape(tl.load(o_ptr + base + offs).to(tl.float32), (BLOCK // D, D))
    zz = tl.reshape(tl.load(z_ptr + base + offs).to(tl.float32), (BLOCK // D, D))
    var = tl.sum(x * x, 1) / D
    y = x * tl.rsqrt(var + eps)[:, None] * w[None, :]
    if SIGMOID:
        y = y * tl.sigmoid(zz)
    else:
        y = y * (zz * tl.sigmoid(zz))
    y = tl.reshape(y, (BLOCK,))
    if BF16:
        tl.store(y_ptr + base + offs, y.to(tl.bfloat16))
    else:
        tl.store(y_ptr + base + offs, y.to(tl.float16))


def quantize_rows(x: torch.Tensor):
    """Per-token symmetric int8: (q [M, K], s [M, 1] fp16)."""
    x = x.contiguous()
    rows, width = x.shape
    q = torch.empty((rows, width), dtype=torch.int8, device=x.device)
    s = torch.empty((rows, 1), dtype=torch.float16, device=x.device)
    if rows:
        _q8_row_kernel[(rows,)](x, q, s, width, BLOCK=BLOCK, num_warps=4)
    return q, s


def quantize_groups(x: torch.Tensor, group: int):
    """Per token and per ``group`` channels: (q [M, K], s [M, K/group] fp16)."""
    x = x.contiguous()
    rows, width = x.shape
    q = torch.empty((rows, width), dtype=torch.int8, device=x.device)
    s = torch.empty((rows, width // group), dtype=torch.float16, device=x.device)
    if rows:
        _q8_group_kernel[(rows,)](x, q, s, width, width // group, G=group, BLOCK=BLOCK, num_warps=4)
    return q, s


def silu_quantize_groups(gate_up: torch.Tensor, group: int):
    gate_up = gate_up.contiguous()
    rows, width = gate_up.shape[0], gate_up.shape[1] // 2
    q = torch.empty((rows, width), dtype=torch.int8, device=gate_up.device)
    s = torch.empty((rows, width // group), dtype=torch.float16, device=gate_up.device)
    if rows:
        _silu_q8_group_kernel[(rows,)](gate_up, q, s, width, width // group,
                                       BF16=gate_up.dtype == torch.bfloat16, G=group, BLOCK=BLOCK,
                                       num_warps=4)
    return q, s


def silu_mul(gate_up: torch.Tensor) -> torch.Tensor:
    """[M, 2K] -> SiLU(gate) * up [M, K] in gate_up's dtype (the small-row side of K8V4_W4A8_FUSED=silu)."""
    gate_up = gate_up.contiguous()
    rows, width = gate_up.shape[0], gate_up.shape[1] // 2
    y = gate_up.new_empty((rows, width))
    if rows:
        _silu_mul_kernel[(rows, triton.cdiv(width, BLOCK))](gate_up, y, width, BF16=gate_up.dtype == torch.bfloat16,
                                                           BLOCK=BLOCK, num_warps=4)
    return y


def gnorm(o: torch.Tensor, z: torch.Tensor, weight: torch.Tensor, eps: float, activation: str):
    """o, z [M, heads, D] -> RMSNormGated(o, z) (gate after the norm) flattened to [M, heads * D], o's dtype.

    The small-row (decode / verify) side of K8V4_W4A8_FUSED=gnorm: one launch, as the compiled stock norm is,
    instead of the eager forward_static's chain of elementwise kernels.
    """
    o, z = o.contiguous(), z.contiguous()
    rows, heads, dim = o.shape
    width = heads * dim
    block = BLOCK if width % BLOCK == 0 and BLOCK % dim == 0 else dim
    y = torch.empty((rows, width), dtype=o.dtype, device=o.device)
    if rows:
        _gnorm_kernel[(rows, width // block)](o, z, weight, y, width, eps, SIGMOID=activation == "sigmoid",
                                              BF16=o.dtype == torch.bfloat16, D=dim, BLOCK=block, num_warps=4)
    return y


def gnorm_quantize_groups(o: torch.Tensor, z: torch.Tensor, weight: torch.Tensor, eps: float,
                          activation: str, group: int):
    """o, z [M, heads, D] -> grouped int8 of RMSNormGated(o, z) flattened to [M, heads * D]."""
    o, z = o.contiguous(), z.contiguous()
    rows, heads, dim = o.shape
    width = heads * dim
    block = BLOCK if width % BLOCK == 0 and BLOCK % dim == 0 else dim
    if block % group:
        raise RuntimeError("gated-norm quantizer: block %d is not a multiple of group %d" % (block, group))
    q = torch.empty((rows, width), dtype=torch.int8, device=o.device)
    s = torch.empty((rows, width // group), dtype=torch.float16, device=o.device)
    if rows:
        _gnorm_q8_group_kernel[(rows,)](o, z, weight, q, s, width, width // group, eps,
                                        SIGMOID=activation == "sigmoid",
                                        BF16=o.dtype == torch.bfloat16, D=dim, G=group,
                                        BLOCK=block, num_warps=4)
    return q, s
