#!/usr/bin/env python3
"""Four-rank XPU correctness/timing gate; no weights or server involved.

torchrun --standalone --nproc-per-node=4 -m bench.tp2_cp2_attention --output result.json
Run on idle test GPUs. --pair-only allows a TWO-rank CP primitive smoke test;
that result is explicitly not a TP2xCP2/four-GPU validation.
"""
from __future__ import annotations

import argparse
from datetime import timedelta
import hashlib
import json
import math
import os
from pathlib import Path
import time

import torch
import torch.distributed as dist

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.context_parallel import ContextLane, local_length, slots_for_positions
from k8v4_v030.layout import D, PAGE, PageLayout
from k8v4_v030.ops_api import library_path, ops
from k8v4_v030.plan import workspace_programs
from k8v4_v030.scratch import Scratch

LAYOUT = PageLayout(2)


class TorchGroup:
    def __init__(self, group):self.group=group

    def all_gather(self, tensor, dim=0):
        if dim != 0:raise ValueError('dim')
        output=torch.empty((2*tensor.shape[0],*tensor.shape[1:]),dtype=tensor.dtype,device=tensor.device)
        dist.all_gather_into_tensor(output,tensor,group=self.group)
        return output


def initialize(pair_only):
    rank=int(os.environ['RANK']);local=int(os.environ['LOCAL_RANK'])
    world=int(os.environ['WORLD_SIZE'])
    expected=2 if pair_only else 4
    if world != expected or torch.xpu.device_count() < expected:
        raise RuntimeError(f'need {expected} ranks and visible XPUs, found {world} ranks/{torch.xpu.device_count()} XPUs')
    torch.xpu.set_device(local)
    dist.init_process_group('xccl',timeout=timedelta(seconds=120))
    if pair_only:
        group=dist.new_group([0,1],backend='xccl');cp_rank=rank;tp_rank=0
    else:
        # Every process creates all groups in the same order.
        for ranks in ([0,1],[2,3]):dist.new_group(ranks,backend='xccl')
        for ranks in ([0,2],[1,3]):
            new=dist.new_group(ranks,backend='xccl')
            if rank in ranks:group=new
        cp_rank=rank//2;tp_rank=rank%2
    return rank,tp_rank,ContextLane(cp_rank,2,64,TorchGroup(group))


def make_cache(lengths, ratio, device, seed):
    manager=PAGE*ratio
    # vLLM reserves nonzero table width even if this lane currently owns no
    # visible tokens. Exercise that empty shard with a harmless zeroed block.
    counts=[max(1,(length+manager-1)//manager) for length in lengths]
    blocks=sum(counts)+1
    # Reserved zero block plus shuffled, independent request histories.
    generator=torch.Generator().manual_seed(seed)
    permutation=torch.randperm(blocks-1,generator=generator)+1
    table=torch.zeros((len(lengths),max(counts)),dtype=torch.int32)
    offset=0
    for i,count in enumerate(counts):
        table[i,:count]=permutation[offset:offset+count];offset+=count
    raw=torch.zeros((blocks,LAYOUT.hkv,manager,396),dtype=torch.int8,device=device)
    return raw,bind_regions(raw,LAYOUT),table.to(device)


def store(views, key, value, slots):
    ops().kv_store_paged(key,value,slots.contiguous(),views['k'],views['k_scale'],
                         views['v'],views['v_scale'],views['v_zero'])


def prepare(context,batch,q_len,ratio,lane,tp_rank,device,q1_cascade=False,shared_fraction=0):
    lengths=[context+3*i for i in range(batch)]
    local_lengths=[local_length(length,lane.rank) for length in lengths]
    full_raw,full,full_table=make_cache(lengths,ratio,device,111)
    local_raw,local,local_table=make_cache(local_lengths,ratio,device,222)
    # Only identical PHYSICAL prefix blocks qualify. Align a shared global
    # prefix to two manager blocks so both striped halves share whole blocks.
    prefix_blocks=int(context*shared_fraction//(2*PAGE*ratio))*2
    if prefix_blocks:
        full_table[:,:prefix_blocks]=full_table[0,:prefix_blocks].clone()
        local_table[:,:prefix_blocks//2]=local_table[0,:prefix_blocks//2].clone()
    prefix_tokens=prefix_blocks*PAGE*ratio
    prefix_k=prefix_v=None
    generator=torch.Generator(device=device).manual_seed(20261016+tp_rank)
    for request,length in enumerate(lengths):
        k=torch.randn((length,2,D),generator=generator,device=device,dtype=torch.float16)
        v=torch.randn((length,2,D),generator=generator,device=device,dtype=torch.float16)
        if prefix_tokens:
            if request==0:prefix_k=k[:prefix_tokens].clone();prefix_v=v[:prefix_tokens].clone()
            else:k[:prefix_tokens].copy_(prefix_k);v[:prefix_tokens].copy_(prefix_v)
        positions=torch.arange(length,device=device,dtype=torch.int64)
        manager=PAGE*ratio
        slots=full_table[request,positions//manager].long()*manager+positions%manager
        store(full,k,v,slots)
        slots=slots_for_positions(positions,torch.full_like(positions,request),local_table,manager,lane.rank)
        store(local,k,v,slots)
        del k,v,positions,slots
    q=torch.randn((batch*q_len,12,D),generator=generator,device=device,dtype=torch.float16)
    seq=torch.tensor(lengths,dtype=torch.int32,device=device)
    def scratch(table):
        nprog=workspace_programs(table.shape[1],ratio,LAYOUT)
        state=Scratch(device,LAYOUT,nprog,1,batch*q_len)
        return state,nprog
    full_s,nf=scratch(full_table);local_s,nl=scratch(local_table)
    out_full=torch.empty_like(q);out_local=torch.empty_like(q)
    lse=torch.empty(q.shape[:2],device=device,dtype=torch.float32)
    use_cascade=q1_cascade and q_len==1
    if use_cascade:
        from k8v4_v030.cascade import CascadeScratch
        full_cs=CascadeScratch(device,2,batch,0,8)
        local_cs=CascadeScratch(device,2,batch,0,8)
    # Hold raw allocations for the lifetime of the cache views and graphs.
    def baseline():
        p,m,l,merged=full_s.workspace(nf)
        args=(q,full_s.q8,full_s.q_scale,full['k'],full['k_scale'],
            full['v'],full['v_scale'],full['v_zero'],full_table,seq,full_s.visible,
            p,m,l,merged,out_full,q_len,ratio)
        if use_cascade:
            c=full_cs
            ops().int8k_int4v_attn_batch_cascade(*args,c.q8,c.qsc,c.plan,c.part,c.m,c.l,c.cap,c.slot_rows)
        else:ops().int8k_int4v_attn_batch(*args)
        return out_full
    def local_walk():
        p,m,l,merged=local_s.workspace(nl)
        args=(q,local_s.q8,local_s.q_scale,local['k'],local['k_scale'],
            local['v'],local['v_scale'],local['v_zero'],local_table,seq,lane.visible(seq,q_len),
            p,m,l,merged,out_local)
        if use_cascade:
            c=local_cs
            ops().int8k_int4v_attn_batch_cascade_lse(*args,q_len,ratio,c.q8,c.qsc,c.plan,c.part,c.m,c.l,c.cap,c.slot_rows,lse)
        else:ops().int8k_int4v_attn_batch_lse(*args,lse,q_len,ratio)
        return out_local
    def merge():return lane.merge(out_local,lse)
    def combined():
        local_walk()
        return merge()
    return baseline,local_walk,merge,combined,q,seq,(full_raw,local_raw,full_s,local_s)


def worst(value,device):
    tensor=torch.tensor(value,dtype=torch.float64,device=device)
    dist.all_reduce(tensor,op=dist.ReduceOp.MAX)
    return tensor.item()


def timed(fn,iters,device):
    for _ in range(3):fn()
    torch.xpu.synchronize();dist.barrier()
    start=time.perf_counter()
    for _ in range(iters):fn()
    torch.xpu.synchronize()
    return worst((time.perf_counter()-start)*1000/iters,device)


def capture(fn):
    for _ in range(3):fn()
    torch.xpu.synchronize();dist.barrier()
    graph=torch.xpu.XPUGraph()
    with torch.xpu.graph(graph):output=fn()
    torch.xpu.synchronize()
    return graph,output


def error(actual,expected,device):
    local_finite=bool(torch.isfinite(actual).all().item()) and bool(torch.isfinite(expected).all().item())
    finite=worst(float(not local_finite),device)==0
    if not finite:return {'relative_l2':float('inf'),'max_abs':float('inf'),'finite':False}
    delta=actual.float()-expected.float()
    return {'relative_l2':worst((delta.norm()/expected.float().norm().clamp_min(1e-12)).item(),device),
            'max_abs':worst(delta.abs().max().item(),device),'finite':True}


def merge_only(args,rank,lane,device):
    """Isolate collective/merge correctness without loading native DPAS code."""
    records=[]
    for q_len in (1,7):
        shape=(4*q_len,12,256)
        base=torch.arange(4*q_len*12*256,device=device,dtype=torch.float32).reshape(shape)/100000
        output=base*(2 if lane.rank==0 else 6)
        lse=torch.full(shape[:2],0.0 if lane.rank==0 else 1.0986122886681098,device=device)
        # First row: one empty lane. Last row: both lanes empty.
        if lane.rank==1:lse[0]=-torch.inf
        lse[-1]=-torch.inf
        expected=base*5;expected[0]=base[0]*2;expected[-1]=0
        fn=lambda:lane.merge(output,lse)
        report=error(fn(),expected,device)
        if report['relative_l2']>1e-6:raise RuntimeError(f'merge-only mismatch: {report}')
        if args.graphs:
            graph,result=capture(fn)
            output.add_(.1*(lane.rank+1))
            expected.add_(.175);expected[0]=base[0]*2+.1;expected[-1]=0
            graph.replay();report=error(result,expected,device)
            if report['relative_l2']>1e-6:raise RuntimeError(f'merge-only graph mismatch: {report}')
            fn=graph.replay
        row={'q_len':q_len,'concurrency':4,'graphs':args.graphs,'error':report,
             'collective_and_merge_ms':timed(fn,args.iters,device)}
        records.append(row)
        if rank==0:print(json.dumps(row),flush=True)
    if rank==0:
        args.output.parent.mkdir(parents=True,exist_ok=True)
        args.output.write_text(json.dumps({'scope':'two-rank CP merge only' if args.pair_only else 'four-rank CP merge only',
            'native_attention_validated':False,'full_model_validated':False,'records':records},indent=2)+'\n')


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--contexts',default='131072,200003')
    p.add_argument('--concurrencies',default='1,2,4')
    p.add_argument('--queries',default='1,7')
    p.add_argument('--pages-per-block',type=int,default=33)
    p.add_argument('--iters',type=int,default=20)
    p.add_argument('--graphs',action='store_true')
    p.add_argument('--pair-only',action='store_true')
    p.add_argument('--merge-only',action='store_true',help='isolate collective/merge; does not test native attention')
    p.add_argument('--q1-cascade',action='store_true',help='enable physical-prefix q1 cascade in BOTH arms')
    p.add_argument('--shared-fraction',type=float,default=0,help='separate shared-prefix case; primary comparison is independent (0)')
    p.add_argument('--output',type=Path,required=True)
    p.add_argument('--l2-limit',type=float,default=.001,help='0.1%% operation screen; not a model fidelity claim')
    args=p.parse_args()
    contexts=[int(x) for x in args.contexts.split(',')]
    batches=[int(x) for x in args.concurrencies.split(',')]
    queries=[int(x) for x in args.queries.split(',')]
    if min(contexts)<max(queries) or min(batches)<1 or args.iters<1 or args.pages_per_block<1:
        raise SystemExit('invalid context, batch, query, iteration or page-ratio configuration')
    if any(q not in (1,7) for q in queries):raise SystemExit('queries must be 1 or 7')
    if not 0<=args.shared_fraction<=1:raise SystemExit('shared fraction must be 0..1')
    if args.q1_cascade and max(batches)>8:raise SystemExit('q1 cascade supports at most eight requests')
    if args.q1_cascade:os.environ['XE2_KV_CASCADE']='1'
    if not math.isfinite(args.l2_limit) or args.l2_limit<=0:raise SystemExit('L2 limit must be positive and finite')
    for name,value in {'XE2_KV_PARTIAL_FP16':'1','XE2_KV_COMPACT_SLM':'1',
                       'XE2_KV_S2_NSG_DRAFT':'32','XE2_KV_S2_NSG_VERIFY':'8','XE2_KV_S2_TWO_PASS':'0'}.items():
        os.environ[name]=value
    for name,value in {'CCL_SYCL_ALLREDUCE_LL':'twoshots','CCL_SYCL_ALLREDUCE_SIMPLE_READ':'1',
                       'CCL_SYCL_COPY_ENGINE':'1','CCL_SYCL_ALLREDUCE_SIMPLE_THRESHOLD':'4294967296',
                       'CCL_SYCL_REDUCE_SCATTER_SIMPLE_THRESHOLD':'4294967296',
                       'CCL_SYCL_ALLGATHERV_SIMPLE_THRESHOLD':'4294967296','CCL_SYCL_ALLTOALL_TMP_BUF':'1'}.items():
        os.environ.setdefault(name,value)
    rank,tp_rank,lane=initialize(args.pair_only);device=torch.device('xpu',torch.xpu.current_device())
    if args.merge_only:
        merge_only(args,rank,lane,device)
        dist.destroy_process_group()
        return
    records=[]
    for context in contexts:
        for batch in batches:
            for q_len in queries:
                baseline,walk,merge,combined,q,seq,keep=prepare(context,batch,q_len,args.pages_per_block,lane,tp_rank,device,args.q1_cascade,args.shared_fraction)
                expected=baseline().clone();actual=combined()
                report=error(actual,expected,device)
                if report['relative_l2']>args.l2_limit:
                    raise RuntimeError(f'CP mismatch at {context}/{batch}/q{q_len}: {report}')
                graphs=[]
                if args.graphs:
                    for fn in (baseline,walk,merge,combined):graphs.append(capture(fn))
                    # Change both live Q and sequence lengths after capture.
                    # A stale input capture must fail this replay comparison.
                    q.mul_(.83);seq.sub_(1)
                    graphs[0][0].replay();expected=graphs[0][1].clone()
                    graphs[3][0].replay()
                    report=error(graphs[3][1],expected,device)
                    if report['relative_l2']>args.l2_limit:raise RuntimeError(f'graph replay mismatch: {report}')
                    fns=[g.replay for g,_ in graphs]
                else:fns=[baseline,walk,merge,combined]
                dense_ms,walk_ms,merge_ms,total_ms=[timed(fn,args.iters,device) for fn in fns]
                row={'context':context,'concurrency':batch,'q_len':q_len,'graphs':args.graphs,
                     'q1_cascade':args.q1_cascade,'shared_fraction':args.shared_fraction,
                     'dense_per_tp_rank_ms':dense_ms,'cp_local_walk_and_lse_ms':walk_ms,
                     'cp_collective_and_merge_ms':merge_ms,'cp_total_ms':total_ms,
                     'attention_speedup':dense_ms/total_ms,'error':report}
                records.append(row)
                if rank==0:print(json.dumps(row),flush=True)
                del baseline,walk,merge,combined,q,seq,keep,graphs,fns,expected,actual
                torch.xpu.synchronize();torch.xpu.empty_cache()
    if rank==0:
        args.output.parent.mkdir(parents=True,exist_ok=True)
        result={'scope':'two-rank CP primitive only' if args.pair_only else 'four-rank TP2xCP2 attention only',
                'full_model_validated':False,'library_sha256':hashlib.sha256(Path(library_path()).read_bytes()).hexdigest(),
                'torch':torch.__version__,'device':torch.xpu.get_device_name(),
                'args':{**vars(args),'output':str(args.output)},'records':records}
        args.output.write_text(json.dumps(result,indent=2)+'\n')
    dist.destroy_process_group()


if __name__=='__main__':main()
