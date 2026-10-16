"""Single-pass CP packet packing and two-shard softmax merge on XPU."""
from __future__ import annotations

import torch
import triton
import triton.language as tl


@triton.jit
def _pack(O, L, P, D: tl.constexpr, BLOCK: tl.constexpr):
    row=tl.program_id(0)
    d=tl.arange(0,BLOCK)
    value=tl.load(O+row*D+d,mask=d<D,other=0).to(tl.float32)
    tl.store(P+row*(D+1)+d,value,mask=d<D)
    lse=tl.load(L+row)
    tl.store(P+row*(D+1)+D,lse)


@triton.jit
def _merge(P, O, ROWS: tl.constexpr, D: tl.constexpr, BLOCK: tl.constexpr):
    row=tl.program_id(0)
    d=tl.arange(0,BLOCK)
    first=P+row*(D+1)
    second=P+(ROWS+row)*(D+1)
    a=tl.load(first+D)
    b=tl.load(second+D)
    empty=(a == -float('inf')) & (b == -float('inf'))
    maximum=tl.where(empty,0.,tl.maximum(a,b))
    wa=tl.exp(a-maximum)
    wb=tl.exp(b-maximum)
    # Empty partitions may carry unspecified/NaN local outputs. LSE=-inf
    # excludes them; do not evaluate 0*NaN. Other NaNs remain failures.
    va=tl.load(first+d,mask=(d<D) & (wa != 0.),other=0.)
    vb=tl.load(second+d,mask=(d<D) & (wb != 0.),other=0.)
    denominator=tl.where(empty,1.,wa+wb)
    output=(wa*va+wb*vb)/denominator
    tl.store(O+row*D+d,output,mask=d<D)


def pack(output, lse):
    if output.ndim != 3 or output.shape[-1] != 256 or lse.shape != output.shape[:-1]:
        raise ValueError('CP packet needs [T,H,256] output and [T,H] LSE')
    if not output.is_contiguous() or not lse.is_contiguous() or lse.dtype != torch.float32:
        raise ValueError('CP packing needs contiguous output and float32 LSE')
    packet=torch.empty((*output.shape[:-1],257),dtype=torch.float32,device=output.device)
    _pack[(output.shape[0]*output.shape[1],)](output,lse,packet,D=256,BLOCK=256,num_warps=4)
    return packet


def merge(packet, shape, dtype):
    tokens,heads,dim=shape
    if dim != 256 or packet.shape != (2*tokens,heads,257) or packet.dtype != torch.float32:
        raise ValueError('CP gathered packet geometry')
    result=torch.empty(shape,dtype=dtype,device=packet.device)
    _merge[(tokens*heads,)](packet,result,ROWS=tokens*heads,D=256,BLOCK=256,num_warps=4)
    return result
