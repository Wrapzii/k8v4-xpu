"""CP prefill through the production fused oneDNN SDPA, one KV head at a time.

Replicated queries require complete chronological K/V for this operator.
Gather the two local striped halves, reconstruct their global order, score,
then release that head. Decode remains compressed and sequence-sharded.
No query-by-history score matrix is materialized by this adapter.
"""
from __future__ import annotations

import torch
from k8v4_v030.context_parallel import local_length
from k8v4_v030.onednn_prefill import pad_queries_top, query_pad_rows, score_one_group


def reassemble(packet, seq_len):
    """[2 lanes,2 K/V,capacity,D] -> chronological K,V. CPU reference too."""
    if packet.ndim!=4 or packet.shape[:2]!=(2,2) or packet.shape[2]%64:
        raise ValueError('CP gathered K/V packet shape')
    if seq_len<0 or seq_len>2*packet.shape[2]:raise ValueError('CP global sequence length')
    if packet.device.type=='xpu':
        from k8v4_v030.cp_prefill_gather import unstripe
        return unstripe(packet,seq_len)
    pos=torch.arange(seq_len,device=packet.device)
    rank=pos//64%2;local=pos//128*64+pos%64
    return packet[rank,0,local].contiguous(),packet[rank,1,local].contiguous()


def head_major_prefill(query, views, block_row, seq_len, pages_per_block, scale, lane):
    hkv=int(views['k'].shape[2]);q_len=query.shape[0]
    if query.ndim!=3 or query.shape[1]!=6*hkv or query.shape[2]!=256 or query.dtype!=torch.float16:
        raise ValueError('CP oneDNN prefill requires FP16 [T,6*HKV,256]')
    if not 0<=q_len<=seq_len or pages_per_block<1 or lane.world!=2 or lane.interleave!=64:
        raise ValueError('CP oneDNN prefill ownership/length')
    if q_len==0:return query
    capacity=((int(seq_len)+127)//128)*64
    local_len=local_length(int(seq_len),lane.rank)
    q_pad=query_pad_rows(q_len);padded=pad_queries_top(query,q_pad)
    out=torch.empty_like(padded)
    if query.device.type=='xpu':
        from k8v4_v030.prefill_gather_triton import gather_dequant_head_fused as gather
    else:
        from k8v4_v030.dequant import gather_dequant_head as gather
    for head in range(hkv):
        local_k,local_v=gather(views,block_row,local_len,head,pages_per_block,query.dtype)
        packet=torch.zeros((2,capacity,256),dtype=query.dtype,device=query.device)
        packet[0,:local_len].copy_(local_k);packet[1,:local_len].copy_(local_v)
        gathered=lane.group.all_gather(packet,dim=0).reshape(2,2,capacity,256)
        k,v=reassemble(gathered,seq_len)
        del packet,gathered,local_k,local_v
        out[:,head*6:(head+1)*6]=score_one_group(
            padded[:,head*6:(head+1)*6],k,v,scale,int(seq_len),q_pad)
        del k,v
    return out[q_pad-q_len:].contiguous()
