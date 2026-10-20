"""Real-collective CP prefill gate, including the production 4224-row chunk.

Run with torchrun on FOUR idle XPUs. --pair-only is a two-device primitive
check, never four-GPU serving validation. This measures complete operations,
including KV gather, allocation, reconstruction and actual communication.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import torch
import torch.distributed as dist
from bench.tp2_cp2_attention import initialize, make_cache, store, timed, error
from k8v4_v030.context_parallel import local_length, slots_for_positions, reference_prefill
from k8v4_v030.cp_prefill import head_major_prefill
from k8v4_v030.onednn_prefill import head_major_prefill as dense_prefill
from k8v4_v030.ops_api import library_path


def prepare(seq,rows,ratio,lane,tp_rank,device):
    gen=torch.Generator(device=device).manual_seed(20261019+tp_rank)
    k=torch.randn((seq,2,256),device=device,dtype=torch.float16,generator=gen)
    v=torch.randn(k.shape,device=device,dtype=k.dtype,generator=gen)
    q=torch.randn((rows,12,256),device=device,dtype=k.dtype,generator=gen)
    full_raw,full,ft=make_cache([seq],ratio,device,314)
    raw,local,lt=make_cache([local_length(seq,lane.rank)],ratio,device,731+lane.rank)
    pos=torch.arange(seq,device=device);manager=64*ratio
    store(full,k,v,ft[0,pos//manager].long()*manager+pos%manager)
    store(local,k,v,slots_for_positions(pos,torch.zeros_like(pos),lt,manager,lane.rank))
    def dense():return dense_prefill(q,full,ft[0],seq,ratio,1/16)
    def old():
        o,l=reference_prefill(q,local,lt[0],seq,ratio,1/16,lane)
        return lane.merge(o,l)
    def new():return head_major_prefill(q,local,lt[0],seq,ratio,1/16,lane)
    return q,dense,old,new,(full_raw,raw)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--contexts',default='63,64,65,129,263,4225,131072,200003')
    p.add_argument('--queries',default='128,4224')
    p.add_argument('--pages-per-block',type=int,default=33)
    p.add_argument('--iters',type=int,default=3)
    p.add_argument('--pair-only',action='store_true')
    p.add_argument('--skip-reference-timing',action='store_true',help='skip ONLY slow Python timing; dense numerical checks remain mandatory')
    p.add_argument('--output',required=True,type=Path)
    a=p.parse_args();contexts=list(map(int,a.contexts.split(',')));queries=list(map(int,a.queries.split(',')))
    if min(contexts+queries)<1 or a.iters<1 or a.pages_per_block<1:p.error('positive dimensions required')
    if a.output.exists():p.error('output exists; choose a new receipt')
    os.environ['K8V4_PREFILL_GATHER']='triton'
    rank,tp_rank,lane=initialize(a.pair_only);device=torch.device('xpu',torch.xpu.current_device())
    records=[]
    for seq in contexts:
        for rows in sorted({min(seq,q) for q in queries}):
            q,dense,old,new,keep=prepare(seq,rows,a.pages_per_block,lane,tp_rank,device)
            expected=dense();actual=new();report=error(actual,expected,device)
            if not report['finite'] or report['relative_l2']>.001:raise RuntimeError(f'prefill mismatch {seq}/{rows}: {report}')
            q.neg_();changed=error(new(),dense(),device)
            if not changed['finite'] or changed['relative_l2']>.001:raise RuntimeError(f'changed prefill mismatch: {changed}')
            costs={'ordinary_onednn_ms':timed(dense,a.iters,device),'cp_complete_onednn_ms':timed(new,a.iters,device)}
            if not a.skip_reference_timing:
                old_error=error(old(),dense(),device)
                if not old_error['finite'] or old_error['relative_l2']>.001:raise RuntimeError(f'reference mismatch: {old_error}')
                costs['cp_reference_with_merge_ms']=timed(old,a.iters,device)
            row={'context':seq,'query_rows':rows,'error':report,'changed_query_error':changed,**costs}
            records.append(row)
            if rank==0:print(json.dumps(row),flush=True)
            del q,dense,old,new,keep,expected,actual
            torch.xpu.synchronize();torch.xpu.empty_cache()
    if rank==0:
        a.output.parent.mkdir(parents=True,exist_ok=True)
        a.output.write_text(json.dumps({'scope':'two-rank prefill primitive' if a.pair_only else 'four-rank prefill primitive',
            'full_model_validated':False,'library_sha256':hashlib.sha256(Path(library_path()).read_bytes()).hexdigest(),
            'args':{**vars(a),'output':str(a.output)},'records':records},indent=2)+'\n')
    dist.destroy_process_group()


if __name__=='__main__':main()
