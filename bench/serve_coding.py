"""Repeatable natural-EOS coding probe with per-request MTP metric deltas.

Run on the guest, preserving full output and cumulative SSE token counts.
Decode rate excludes every token delivered in the first streamed update.
"""
import argparse
import ast
import json
import re
import statistics
import threading
import time
import urllib.request

p = argparse.ArgumentParser()
p.add_argument('--base', default='http://127.0.0.1:8200')
p.add_argument('--lengths', default='2000,8000')
p.add_argument('--repeats', type=int, default=3)
p.add_argument('--max-tokens', type=int, default=768)
p.add_argument('--needle', action='store_true')
p.add_argument('--model', default='Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8')
p.add_argument('--cold-prefix', default='', help='Unique run marker placed at the start of each context size to avoid prior prefix-cache reuse.')
p.add_argument('--allow-busy', action='store_true', help='Permit live traffic; metric deltas may include other requests. Observed concurrency is recorded.')
a = p.parse_args()
model = a.model

def post(route, body):
    req = urllib.request.Request(a.base+route, data=json.dumps(body).encode(),
                                 headers={'Content-Type':'application/json'})
    return urllib.request.urlopen(req, timeout=600)

def metrics():
    with urllib.request.urlopen(a.base+'/metrics', timeout=10) as resp:
        body = resp.read().decode()
    result = {}
    for line in body.splitlines():
        if line.startswith(('vllm:spec_decode_', 'vllm:prompt_tokens_cached_total',
                            'vllm:request_prefill_time_seconds_sum',
                            'vllm:request_prefill_kv_computed_tokens_sum',
                            'vllm:num_requests_running', 'vllm:num_requests_waiting')):
            name, value = line.split()[:2]
            name = name.split('{')[0]
            if name.endswith(('_total', '_sum')) or name in ('vllm:num_requests_running','vllm:num_requests_waiting'):
                result[name] = result.get(name, 0) + float(value)
    return result

task = '''Implement a Python function merge_intervals(intervals).
Each interval is a pair (start, end) of integers with start <= end. Return a
new sorted list of disjoint intervals, merging overlapping or touching pairs.
Here touching means next_start <= previous_end; do not merge adjacent but
non-overlapping integer ranges such as (1, 2) and (3, 4).
Never mutate the input. Validate each interval and raise ValueError for an
invalid shape or start > end. Use type hints and a short docstring.
Use built-in list and tuple annotations, with no imports. Provide only the
function, no examples or tests. Keep it concise. Reply with only Python source.'''
for target in map(int, a.lengths.split(',')):
    # Identical deterministic context for baseline and candidate; no forced post-EOS tokens.
    context = ('Background note: interval endpoints are integers. Sort before merging.\n' * (target//13))
    header = ('Configuration from the start of the document: limit_low=18673 and limit_high=42291.\n'
              if a.needle else '')
    extra_task = ('\nAlso define load_limits() to return the pair (limit_low, limit_high) from the start of the document.'
                  if a.needle else '')
    marker = f'Benchmark run {a.cold_prefix}, context size {target}.\n' if a.cold_prefix else ''
    prompt = marker+header+'Reference notes follow.\n'+context+'\nTask:\n'+task+extra_task
    messages = [{'role':'user','content':prompt}]
    for trial in range(a.repeats+1):
        before = metrics()
        if a.cold_prefix and not a.allow_busy and (before.get('vllm:num_requests_running',0) or before.get('vllm:num_requests_waiting',0)):
            raise RuntimeError('Other requests present before concurrency-one probe')
        observed = {'peak_running':0, 'peak_waiting':0, 'poll_errors':0}
        done = threading.Event()
        def monitor():
            while not done.is_set():
                try:
                    snapshot = metrics()
                    observed['peak_running'] = max(observed['peak_running'], snapshot.get('vllm:num_requests_running',0))
                    observed['peak_waiting'] = max(observed['peak_waiting'], snapshot.get('vllm:num_requests_waiting',0))
                except Exception:
                    observed['poll_errors'] += 1
                done.wait(1)
        watcher = threading.Thread(target=monitor, daemon=True)
        watcher.start()
        events, pieces, finish = [], [], None
        t0 = time.perf_counter()
        with post('/v1/chat/completions', {
            'model':model, 'messages':messages, 'temperature':0, 'max_tokens':a.max_tokens,
            'stream':True, 'stream_options':{'include_usage':True,'continuous_usage_stats':True},
            'chat_template_kwargs':{'enable_thinking':False}}) as resp:
            for line in resp:
                now = time.perf_counter()-t0
                if not line.startswith(b'data:'): continue
                data = line[5:].strip()
                if data == b'[DONE]': break
                event = json.loads(data)
                usage = event.get('usage') or {}
                choices = event.get('choices') or []
                if choices:
                    choice = choices[0]
                    piece = (choice.get('delta') or {}).get('content') or ''
                    if piece: pieces.append(piece)
                    if choice.get('finish_reason'): finish = choice['finish_reason']
                count = usage.get('completion_tokens')
                if count is not None and (not events or count > events[-1]['tokens']):
                    events.append({'t':now,'tokens':count,'prompt_tokens':usage.get('prompt_tokens')})
        done.set()
        watcher.join(timeout=12)
        after = metrics()
        positive = [e for e in events if e['tokens'] > 0]
        source = ''.join(pieces).strip()
        source = re.sub(r'^```(?:python)?\s*\n?', '', source)
        source = re.sub(r'\n?```$', '', source)
        check = {'syntax':False, 'embedded_tests':False}
        try:
            tree = ast.parse(source)
            check['syntax'] = True
            # Execute only this deliberately requested standalone Python answer,
            # with a small whitelist of syntax and builtins; reject external actions.
            banned = (ast.Import, ast.ImportFrom)
            unsafe = any(isinstance(node, banned) or
                (isinstance(node, ast.Attribute) and node.attr not in ('append','sort','copy'))
                for node in ast.walk(tree))
            if not unsafe:
                scope = {'__builtins__': {k: __builtins__.__dict__[k] for k in
                    ('ValueError','TypeError','AssertionError','isinstance','int','list','tuple','len','sorted','enumerate','range','zip','min','max','all','any')}}
                exec(compile(tree,'generated','exec'), scope)
                f = scope['merge_intervals']
                data = [(4,5),(-3,-1),(-1,2),(8,9),(5,7)]
                assert f(data) == [(-3,2),(4,7),(8,9)]
                assert data == [(4,5),(-3,-1),(-1,2),(8,9),(5,7)]
                assert f([]) == []
                assert f([(1,2),(3,4)]) == [(1,2),(3,4)]
                assert f([(1,2),(2,4),(1,2)]) == [(1,4)]
                for bad in ([(1,)], [(3,1)]):
                    try: f(bad)
                    except ValueError: pass
                    else: raise AssertionError('Missing invalid-input check')
                if a.needle:
                    assert scope['load_limits']() == (18673,42291)
                    check['needle'] = True
                check['embedded_tests'] = True
            else: check['test_skipped'] = 'imports or attributes'
        except Exception as exc: check['error'] = type(exc).__name__+': '+str(exc)
        gaps = [(b['t']-c['t'])*1000 for c,b in zip(positive,positive[1:])]
        jumps = [b['tokens']-c['tokens'] for c,b in zip(positive,positive[1:])]
        rate = (positive[-1]['tokens']-positive[0]['tokens'])/(positive[-1]['t']-positive[0]['t']) if len(positive)>1 else None
        prefill_time = after.get('vllm:request_prefill_time_seconds_sum',0)-before.get('vllm:request_prefill_time_seconds_sum',0)
        computed = after.get('vllm:request_prefill_kv_computed_tokens_sum',0)-before.get('vllm:request_prefill_kv_computed_tokens_sum',0)
        row = {'kind':'serve', 'model':model, 'thinking':False, 'cold_prefix':a.cold_prefix, 'allow_busy':a.allow_busy,
            'aggregate_metric_deltas_may_include_other_requests':bool(a.allow_busy or observed['peak_running']>1 or observed['peak_waiting']>0),
            'concurrency_observed':observed, 'target_approx':target, 'trial':trial,'warmup':trial==0,'needle':a.needle,
            'prompt_tokens':positive[-1].get('prompt_tokens') if positive else None,
            'completion_tokens':positive[-1]['tokens'] if positive else 0,
            'finish_reason':finish, 'decode_tok_s':rate,
            'ttft_s':positive[0]['t'] if positive else None,
            'effective_prefill_tok_s':positive[-1].get('prompt_tokens',0)/positive[0]['t'] if positive else None,
            'prefill_time_s':prefill_time, 'prefill_computed_tokens':computed,
            'prefill_computed_tok_s':computed/prefill_time if prefill_time>0 else None,
            'cached_prompt_tokens':after.get('vllm:prompt_tokens_cached_total',0)-before.get('vllm:prompt_tokens_cached_total',0),
            'median_step_ms':statistics.median(gaps) if gaps else None,
            'mean_tokens_per_update':statistics.mean(jumps) if jumps else None,
            'spec_delta':{k:after[k]-before.get(k,0) for k in after if k.startswith('vllm:spec_decode_')},
            'quality':check,'text':source,'events':events}
        print(json.dumps(row), flush=True)
