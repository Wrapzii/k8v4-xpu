"""Opt-in fused, one-head gather/dequantization for paged K8/V4 prefill.

This replaces temporary int32/fp32 tensor chains, not attention or decode.
Packed affine arithmetic remains fp32 and fusion is disabled for parity.
"""
from __future__ import annotations

import torch
import triton
import triton.language as tl

from k8v4_v030.layout import D, PAGE


@triton.jit
def _gather(K, V, KS, VS, VZ, TABLE, OUT_K, OUT_V,
            DIM: tl.constexpr, PAGE_SIZE: tl.constexpr,
            N, HEAD: tl.constexpr, RATIO: tl.constexpr,
            KP: tl.constexpr, KT: tl.constexpr, KH: tl.constexpr, KD: tl.constexpr,
            VP: tl.constexpr, VT: tl.constexpr, VH: tl.constexpr, VD: tl.constexpr,
            SP: tl.constexpr, ST: tl.constexpr, SH: tl.constexpr,
            VSP: tl.constexpr, VST: tl.constexpr, VSH: tl.constexpr,
            ZP: tl.constexpr, ZT: tl.constexpr, ZH: tl.constexpr,
            TABLE_STRIDE: tl.constexpr, BLOCK: tl.constexpr):
    x = tl.program_id(0) * BLOCK + tl.arange(0, BLOCK)
    token = x // DIM
    dim = x % DIM
    valid = token < N
    logical_page = token // PAGE_SIZE
    manager = tl.load(TABLE + (logical_page // RATIO) * TABLE_STRIDE, mask=valid, other=0)
    page = manager * RATIO + logical_page % RATIO
    offset = token % PAGE_SIZE
    k = tl.load(K + page * KP + offset * KT + HEAD * KH + dim * KD, mask=valid, other=0).to(tl.float32)
    ks = tl.load(KS + page * SP + offset * ST + HEAD * SH, mask=valid, other=0)
    packed = tl.load(V + page * VP + offset * VT + HEAD * VH + (dim // 2) * VD, mask=valid, other=0).to(tl.int32)
    vs = tl.load(VS + page * VSP + offset * VST + HEAD * VSH, mask=valid, other=0)
    vz = tl.load(VZ + page * ZP + offset * ZT + HEAD * ZH, mask=valid, other=0)
    nibble = tl.where(dim % 2 == 0, packed & 15, packed >> 4).to(tl.float32)
    tl.store(OUT_K + x, k * ks, mask=valid)
    tl.store(OUT_V + x, (nibble - vz) * vs, mask=valid)


def gather_dequant_head_fused(views, block_row, seq_len, head, pages_per_block, dtype):
    seq_len, head, pages_per_block = int(seq_len), int(head), int(pages_per_block)
    hkv = int(views["k"].shape[2])
    if seq_len < 0 or not 0 <= head < hkv or pages_per_block < 1:
        raise ValueError('Invalid paged gather geometry')
    if block_row.ndim != 1:
        raise ValueError('Block-table row must be one-dimensional')
    if dtype not in (torch.float16, torch.bfloat16, torch.float32):
        raise ValueError('Expected floating-point gather output')
    k = torch.empty((seq_len, D), dtype=dtype, device=block_row.device)
    v = torch.empty_like(k)
    if not seq_len:
        return k, v
    if block_row.numel() < triton.cdiv(seq_len, PAGE * pages_per_block):
        raise ValueError('Block-table row is too short')
    tensors = [views[name] for name in ('k', 'v', 'k_scale', 'v_scale', 'v_zero')]
    if any(t.device != block_row.device for t in tensors):
        raise ValueError('Gather tensors must share one device')
    _gather[(triton.cdiv(seq_len * D, 1024),)](
        *tensors, block_row, k, v, D, PAGE, seq_len, head, pages_per_block,
        *tensors[0].stride(), *tensors[1].stride(),
        *tensors[2].stride(), *tensors[3].stride(), *tensors[4].stride(),
        block_row.stride(0), 1024, num_warps=4, enable_fp_fusion=False)
    return k, v
