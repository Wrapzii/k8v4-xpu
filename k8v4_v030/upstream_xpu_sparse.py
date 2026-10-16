"""Experimental GQA launch adapter for vLLM's unmodified XPU Triton kernel.

The public MLA wrapper assumes shared K/V, one KV head and d_v=512. This
adapter calls its existing separate-pointer kernel for dequantized GQA tensors.
It does NOT implement K8/V4 conversion, page selection, or a serving backend.
"""
import math

import torch


def run_upstream_sparse(query, key, value, indices, out=None, lse=None, maximum=None):
    from vllm.triton_utils import LOG2E, LOGE2, triton
    from vllm.v1.attention.ops.xpu_mla_sparse import _bf16_mla_sparse_kernel

    qlen, heads, dim = query.shape
    length, groups, key_dim = key.shape
    if query.device.type != 'xpu' or key_dim != dim or dim != 256:
        raise ValueError('this experiment requires XPU and head dimension 256')
    if value.shape != (length, groups, dim) or heads % groups or heads // groups != 6:
        raise ValueError('expected distinct K/V and GQA=6')
    if indices.shape[:2] != (qlen, groups) or indices.shape[2] % 16:
        raise ValueError('indices must be [queries,kv,multiple-of-16]')
    if not all(t.device == query.device for t in (key, value, indices)):
        raise ValueError('all tensors must share the XPU device')
    if not all(t.stride(-1) == 1 for t in (query, key, value, indices)):
        raise ValueError('kernel requires contiguous innermost dimensions')
    if not all(t.dtype == query.dtype for t in (key, value)) or query.dtype not in (torch.float16, torch.bfloat16):
        raise ValueError('Q/K/V must share an FP16 or BF16 dtype')
    out = torch.empty_like(query) if out is None else out
    lse = torch.empty((qlen, heads), device=query.device, dtype=torch.float32) if lse is None else lse
    maximum = torch.empty_like(lse) if maximum is None else maximum
    _bf16_mla_sparse_kernel[(qlen, triton.cdiv(heads, 6))](
        q_buffer=query, k_buffer=key, v_buffer=value, indices_ptr=indices,
        out_ptr=out, softmax_lse_ptr=lse, max_logits_ptr=maximum,
        seq_q=qlen, seq_kv=length, h_q=heads, dim_qk=dim, dim_v=dim,
        stride_q_token=query.stride(0), stride_q_head=query.stride(1),
        stride_k_token=key.stride(0), stride_k_head=key.stride(1),
        stride_v_token=value.stride(0), stride_v_head=value.stride(1),
        stride_out_token=out.stride(0), stride_out_head=out.stride(1),
        stride_lse=lse.stride(0), stride_indices_token=indices.stride(0),
        stride_indices_head=indices.stride(1), sm_scale=LOG2E / math.sqrt(dim),
        kv_group_num=6, index_topk=indices.shape[-1], BLOCK_H=16, BLOCK_M=32,
        BLOCK_N=16, BLOCK_DV=256, BLOCK_DMODEL=256, BLOCK_DPE=0, LOGE2=LOGE2)
    return out, lse
