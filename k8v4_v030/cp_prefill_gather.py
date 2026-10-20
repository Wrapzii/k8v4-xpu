"""Fused chronological reconstruction of two gathered FP16 CP K/V halves."""
import torch
import triton
import triton.language as tl


@triton.jit
def _unstripe(P,K,V,N,CAPACITY:tl.constexpr,D:tl.constexpr,BLOCK:tl.constexpr):
    x=tl.program_id(0)*BLOCK+tl.arange(0,BLOCK)
    token=x//D;dim=x%D
    rank=token//64%2;local=token//128*64+token%64
    base=(rank*2*CAPACITY+local)*D+dim
    key=tl.load(P+base,mask=token<N,other=0)
    value=tl.load(P+base+CAPACITY*D,mask=token<N,other=0)
    tl.store(K+x,key,mask=token<N);tl.store(V+x,value,mask=token<N)


def unstripe(packet,seq_len):
    if not packet.is_contiguous():raise ValueError('CP K/V packet must be contiguous')
    k=torch.empty((seq_len,packet.shape[-1]),device=packet.device,dtype=packet.dtype)
    v=torch.empty_like(k)
    if seq_len:
        _unstripe[(triton.cdiv(seq_len*packet.shape[-1],1024),)](
            packet,k,v,seq_len,packet.shape[2],packet.shape[-1],1024,num_warps=4)
    return k,v
