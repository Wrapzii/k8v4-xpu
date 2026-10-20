"""Matched TP2/TP2CP2 endpoint screen with independent histories and raw SSE.

Prepare fixtures ONCE, then run the SAME file against both layouts. No server
restart, deployment, clock changes or arbitrary generated-code execution.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
from pathlib import Path
import re
import statistics
import threading
import time
import urllib.request
import uuid


def rates(events):
    """Drop ALL first-burst tokens. Missing cumulative usage is an error."""
    if len(events) < 2 or any(b['tokens'] <= a['tokens'] or b['t'] < a['t']
                              for a,b in zip(events,events[1:])):
        raise ValueError('need increasing cumulative token events, not SSE text-chunk counts')
    duration=events[-1]['t']-events[0]['t']
    if duration <= 0:raise ValueError('zero decode duration')
    return (events[-1]['tokens']-events[0]['tokens'])/duration


def common_decode(rows):
    start=max(r['events'][0]['t'] for r in rows)
    end=min(r['events'][-1]['t'] for r in rows)
    counted=[]
    for row in rows:
        inside=[e for e in row['events'] if start <= e['t'] <= end]
        if len(inside)<16 or end-start<3:
            return {'valid':False,'reason':'insufficient simultaneous-decode coverage',
                    'seconds':max(0,end-start),'per_stream_tps':None}
        counted.append(inside[-1]['tokens']-inside[0]['tokens'])
    # Conservative: no interpolation across an SSE burst or edge.
    return {'valid':True,'seconds':end-start,'counted_tokens':counted,
            'per_stream_tps':[n/(end-start) for n in counted],
            'aggregate_tps':sum(counted)/(end-start),'method':'whole bursts strictly inside common interval'}


def http(base,path,body=None,timeout=900):
    payload=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base.rstrip('/')+path,data=payload,headers={'Content-Type':'application/json'})
    return urllib.request.urlopen(req,timeout=timeout)


def snapshot(base):
    with http(base,'/metrics',timeout=10) as f:text=f.read().decode()
    result={}
    for line in text.splitlines():
        if not line.startswith('vllm:') or '_created' in line:continue
        if not any(k in line for k in ('spec_decode_','prefix_cache_','num_requests_',
                                       'num_preemptions','request_success_total','request_prefill_time_seconds_sum')):continue
        key,value=line.rsplit(' ',1);result[key]=float(value)
    return result


def total(values,prefix):return sum(v for k,v in values.items() if k==prefix or k.startswith(prefix+'{'))


def model_id(base):
    with http(base,'/v1/models') as f:return json.load(f)['data'][0]['id']


TASKS=(
    'Write a Python LRU cache with TTL, a fake clock, and meaningful unit tests. Explain the invariants.',
    'Produce a unified diff fixing reversed and adjacent interval handling in merge_intervals, with regression tests.',
    'Derive expected time to three consecutive heads for a biased coin; solve p=1/2 and p=2/3 and verify the equations.',
    'Show a consistent JSON tool-call workflow for finding, repairing and testing a repository bug. Explain each action.',
)


def prepare(args):
    if args.fixtures.exists():raise ValueError('fixture file exists; reuse it rather than overwrite')
    model=model_id(args.base)
    def tokenize(text):
        with http(args.base,'/tokenize',{'model':model,'prompt':text}) as f:return json.load(f)['tokens']
    unit=tokenize('Repository notes: def merge_intervals(xs):\n    result = []\n    for lo, hi in sorted(xs):\n        if result and lo <= result[-1][1]:\n            result[-1][1] = max(result[-1][1], hi)\n        else:\n            result.append([lo, hi])\n    return result\nPreserve inputs and test empty, touching and negative intervals.\n')
    fixtures={}
    for context in args.contexts:
        requests=[]
        for index in range(max(args.concurrencies)):
            # Different initial tokens prevent shared physical prefixes. Common
            # file contents later in a prompt do not create a prefix-cache hit.
            begin=tokenize(f'Independent repository {index:04d}, context {context}.\n<|im_start|>user\n')
            end=tokenize('\nTask: '+TASKS[index%len(TASKS)]+'<|im_end|>\n<|im_start|>assistant\n')
            count=context-len(begin)-len(end)
            if count<1:raise ValueError('context is too short for task')
            ids=begin+(unit*((count+len(unit)-1)//len(unit)))[:count]+end
            requests.append({'index':index,'task':index%len(TASKS),'ids':ids,
                             'sha256':hashlib.sha256(json.dumps(ids).encode()).hexdigest()})
        fixtures[str(context)]=requests
    args.fixtures.parent.mkdir(parents=True,exist_ok=True)
    args.fixtures.write_text(json.dumps({'schema':1,'scope':'synthetic throughput screen; not task fidelity',
        'created_model':model,'fixtures':fixtures}),encoding='utf-8')


def request(base,model,fixture,max_tokens,salt,barrier=None,priming=False):
    payload={'model':model,'prompt':fixture['ids'],'max_tokens':max_tokens,'temperature':0,
             'seed':61141,'ignore_eos':True,'cache_salt':salt,'stream':True,
             'stream_options':{'include_usage':True,'continuous_usage_stats':True}}
    if barrier:barrier.wait(timeout=30)
    start=time.perf_counter();events=[];pieces=[];usage={};first_text=None
    with http(base,'/v1/completions',payload) as response:
        for raw in response:
            if not raw.startswith(b'data:'):continue
            data=raw[5:].strip()
            if data==b'[DONE]':break
            event=json.loads(data)
            if event.get('error'):raise RuntimeError(event['error'])
            now=time.perf_counter()
            text=''.join(c.get('text','') for c in event.get('choices',[]))
            if text:
                first_text=first_text or now;pieces.append(text)
            update=event.get('usage')
            if update:
                usage=update;count=usage.get('completion_tokens',0)
                if count and (not events or count>events[-1]['tokens']):events.append({'t':now,'tokens':count})
    if usage.get('prompt_tokens')!=len(fixture['ids']) or usage.get('completion_tokens')!=max_tokens:
        raise ValueError(f'incomplete/wrong-length response: {usage}')
    if first_text is None:raise ValueError('response has no text')
    rate=None if priming else rates(events)
    return {'index':fixture['index'],'task':fixture['task'],'prompt_sha256':fixture['sha256'],
            'usage':usage,'start':start,'end':time.perf_counter(),'ttft_seconds':first_text-start,
            'decode_tps':rate,'events':events,'text':''.join(pieces)}


def run(args):
    data=json.loads(args.fixtures.read_text(encoding='utf-8'));model=model_id(args.base)
    if args.output.exists():raise ValueError('output exists; choose a fresh run file')
    args.output.parent.mkdir(parents=True,exist_ok=True)
    digest=hashlib.sha256(args.fixtures.read_bytes()).hexdigest();run_id=uuid.uuid4().hex
    failed=False
    with args.output.open('x',encoding='utf-8') as out:
        for context in args.contexts:
            for concurrency in args.concurrencies:
                group=data['fixtures'][str(context)][:concurrency]
                if len(group)!=concurrency:raise ValueError('not enough prepared independent histories')
                for repeat in range(args.repeats):
                    before=snapshot(args.base)
                    if total(before,'vllm:num_requests_running') or total(before,'vllm:num_requests_waiting'):
                        raise RuntimeError('server busy; metrics would be contaminated')
                    salts=[f'cpbench/{run_id}/{context}/{concurrency}/{repeat}/{g["index"]}' for g in group]
                    if args.mode=='warm':
                        for g,salt in zip(group,salts):request(args.base,model,g,16,salt,priming=True)
                    before=snapshot(args.base);barrier=threading.Barrier(concurrency)
                    start=time.perf_counter()
                    with concurrent.futures.ThreadPoolExecutor(max_workers=concurrency) as pool:
                        pending=[pool.submit(request,args.base,model,g,args.max_tokens,salt,barrier)
                                 for g,salt in zip(group,salts)]
                        rows=[f.result() for f in pending]
                    wall=time.perf_counter()-start;after=snapshot(args.base)
                    delta={k:after[k]-before.get(k,0) for k in after}
                    drafts=total(delta,'vllm:spec_decode_num_draft_tokens_total')
                    accepted=total(delta,'vllm:spec_decode_num_accepted_tokens_total')
                    queries=total(delta,'vllm:prefix_cache_queries_total')
                    hits=total(delta,'vllm:prefix_cache_hits_total')
                    common=common_decode(rows)
                    preempted=total(delta,'vllm:num_preemptions_total')>0
                    bad_cache=args.mode=='cold' and hits>0
                    completed=total(delta,'vllm:request_success_total')
                    contaminated=completed!=concurrency or queries!=context*concurrency
                    valid_request=not preempted and not bad_cache and not contaminated
                    valid=common['valid'] and valid_request
                    record={'schema':1,'label':args.label,'base':args.base,'mode':args.mode,
                        'fixture_sha256':digest,'context':context,'concurrency':concurrency,
                        'repeat':repeat,'max_tokens':args.max_tokens,'wall_seconds':wall,
                        'aggregate_wall_tps':sum(r['usage']['completion_tokens'] for r in rows)/wall,
                        'median_request_decode_tps':statistics.median(r['decode_tps'] for r in rows),
                        'steady_common_decode':common,'acceptance':accepted/drafts if drafts else None,
                        'prefix_hit_rate':hits/queries if queries else None,'preempted':preempted,
                        'valid_request_measurement':valid_request,
                        'valid_decode_measurement':valid,'unexpected_cold_cache_hits':bad_cache,
                        'unexpected_request_or_query_counts':contaminated,
                        'counter_delta':delta,'requests':rows,'model_task_fidelity_validated':False}
                    # Only C1 can use a sum of server prefill times as one request's PP time.
                    pp=total(delta,'vllm:request_prefill_time_seconds_sum')
                    record['single_request_server_prefill_tps']=context/pp if args.mode=='cold' and concurrency==1 and pp>0 else None
                    out.write(json.dumps(record)+'\n');out.flush()
                    print(json.dumps({k:record[k] for k in ('label','mode','context','concurrency','repeat',
                        'median_request_decode_tps','aggregate_wall_tps','acceptance','valid_decode_measurement')}),flush=True)
                    # Cold streams can finish decoding before another stream
                    # finishes prefill. Preserve valid TTFT/wall measurements,
                    # but never turn that into a simultaneous-decode rate.
                    failed |= not valid_request or (args.mode=='warm' and not valid)
    if failed:raise RuntimeError('one or more decode measurements failed coverage/cache/preemption gates; inspect raw JSONL')


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--base',default='http://127.0.0.1:8202')
    p.add_argument('--fixtures',type=Path,required=True)
    p.add_argument('--prepare',action='store_true')
    p.add_argument('--output',type=Path)
    p.add_argument('--label',default='unlabelled')
    p.add_argument('--mode',choices=('cold','warm'),default='warm')
    p.add_argument('--contexts',default='2048,32768,131072,200000')
    p.add_argument('--concurrencies',default='1,2,4')
    p.add_argument('--repeats',type=int,default=3)
    p.add_argument('--max-tokens',type=int,default=2048)
    args=p.parse_args();args.contexts=[int(x) for x in args.contexts.split(',')]
    args.concurrencies=[int(x) for x in args.concurrencies.split(',')]
    if args.repeats<1 or args.max_tokens<128 or not args.contexts or not args.concurrencies or min(args.contexts)<512 or min(args.concurrencies)<1:
        p.error('positive repeats/concurrency, >=512 prompt and >=128 output tokens required')
    if args.prepare:prepare(args)
    else:
        if args.output is None:p.error('--output required for run')
        run(args)


if __name__=='__main__':main()
