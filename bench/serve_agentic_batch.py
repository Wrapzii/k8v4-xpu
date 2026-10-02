"""Four overlapping synthetic agent conversations; run on an isolated server.

Three workers reuse the 64K context from serve_coding.py, then consume simulated
tool results over eight turns. A fourth, fresh 128K conversation arrives once
all three have streamed output. No external tools or repository actions run.
"""
import argparse
import ast
import concurrent.futures
import json
import re
import statistics
import threading
import time
import urllib.request
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument('--base', default='http://127.0.0.1:8100')
p.add_argument('--model', default='Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8')
p.add_argument('--coding-script', required=True)
p.add_argument('--seed-results', required=True)
p.add_argument('--cap', type=int, required=True)
p.add_argument('--turns', type=int, default=8)
a = p.parse_args()
task = next(ast.literal_eval(n.value) for n in ast.parse(Path(a.coding_script).read_text()).body
            if isinstance(n, ast.Assign) and any(isinstance(t, ast.Name) and t.id == 'task' for t in n.targets))
seeds = [json.loads(s) for s in Path(a.seed_results).read_text().splitlines()]
seed = next(r for r in reversed(seeds) if r['target_approx'] == 64000)

def prompt(target, marker):
    context = 'Background note: interval endpoints are integers. Sort before merging.\n' * (target // 13)
    return f'Benchmark run {marker}, context size {target}.\nReference notes follow.\n' + context + '\nTask:\n' + task

def metrics():
    with urllib.request.urlopen(a.base + '/metrics', timeout=10) as r:
        body = r.read().decode()
    out = {}
    for line in body.splitlines():
        if line.startswith(('vllm:num_requests_running', 'vllm:num_requests_waiting',
                            'vllm:prompt_tokens_cached_total', 'vllm:spec_decode_')):
            key, val = line.split()[:2]
            key = key.split('{')[0]
            if key.endswith('_total') or key.startswith('vllm:num_requests_'):
                out[key] = out.get(key, 0) + float(val)
    return out

def check(source):
    source = re.sub(r'^```(?:python)?\s*\n?', '', source.strip())
    source = re.sub(r'\n?```$', '', source)
    try:
        tree = ast.parse(source)
        if any(isinstance(n, (ast.Import, ast.ImportFrom)) or
               isinstance(n, ast.Attribute) and n.attr not in ('append', 'sort', 'copy')
               for n in ast.walk(tree)):
            return {'passed': False, 'reason': 'unsupported generated syntax'}
        names = ('ValueError', 'TypeError', 'AssertionError', 'isinstance', 'int', 'list', 'tuple',
                 'len', 'sorted', 'enumerate', 'range', 'zip', 'min', 'max', 'all', 'any')
        scope = {'__builtins__': {k: __builtins__.__dict__[k] for k in names}}
        exec(compile(tree, 'generated', 'exec'), scope)
        f = scope['merge_intervals']
        data = [(4, 5), (-3, -1), (-1, 2), (8, 9), (5, 7)]
        assert f(data) == [(-3, 2), (4, 7), (8, 9)]
        assert data == [(4, 5), (-3, -1), (-1, 2), (8, 9), (5, 7)]
        assert f([]) == []
        assert f([(1, 2), (3, 4)]) == [(1, 2), (3, 4)]
        assert f([(1, 2), (2, 4)]) == [(1, 4)]
        for bad in ([(1,)], [(3, 1)]):
            try:
                f(bad)
            except ValueError:
                pass
            else:
                raise AssertionError('invalid input accepted')
        return {'passed': True}
    except Exception as e:
        return {'passed': False, 'reason': str(e)}

lock = threading.Lock()
first = [threading.Event() for _ in range(3)]
stop = threading.Event()
samples = []
start = time.perf_counter()
before = metrics()
if before.get('vllm:num_requests_running', 0) or before.get('vllm:num_requests_waiting', 0):
    raise RuntimeError('Server is not idle')

def emit(row):
    with lock:
        print(json.dumps(row), flush=True)

def watcher():
    while not stop.is_set():
        try:
            samples.append({'t': time.perf_counter() - start, **metrics()})
        except Exception as e:
            samples.append({'t': time.perf_counter() - start, 'error': str(e)})
        stop.wait(0.5)

def request(messages, worker, turn, fresh=False):
    body = {'model': a.model, 'messages': messages, 'temperature': 0, 'max_tokens': 768,
            'stream': True, 'stream_options': {'include_usage': True, 'continuous_usage_stats': True},
            'chat_template_kwargs': {'enable_thinking': False}}
    req = urllib.request.Request(a.base + '/v1/chat/completions', data=json.dumps(body).encode(),
                                 headers={'Content-Type': 'application/json'})
    t0 = time.perf_counter()
    events, pieces, finish = [], [], None
    with urllib.request.urlopen(req, timeout=600) as r:
        for line in r:
            if not line.startswith(b'data:'):
                continue
            raw = line[5:].strip()
            if raw == b'[DONE]':
                break
            e = json.loads(raw)
            choices = e.get('choices') or []
            if choices:
                piece = (choices[0].get('delta') or {}).get('content')
                if piece:
                    pieces.append(piece)
                finish = choices[0].get('finish_reason') or finish
            usage = e.get('usage') or {}
            count = usage.get('completion_tokens', 0)
            if count > 0 and (not events or count > events[-1]['tokens']):
                events.append({'t': time.perf_counter() - t0, 'tokens': count,
                               'prompt_tokens': usage.get('prompt_tokens')})
                if worker < 3:
                    first[worker].set()
    text = ''.join(pieces)
    gaps = [(y['t'] - x['t']) * 1000 for x, y in zip(events, events[1:])]
    rate = (events[-1]['tokens'] - events[0]['tokens']) / (events[-1]['t'] - events[0]['t']) if len(events) > 1 else None
    row = {'kind': 'request', 'cap': a.cap, 'worker': worker, 'turn': turn, 'fresh_long_arrival': fresh,
           'start_s': t0 - start, 'end_s': time.perf_counter() - start,
           'ttft_s': events[0]['t'] if events else None, 'decode_tok_s': rate,
           'completion_tokens': events[-1]['tokens'] if events else 0,
           'prompt_tokens': events[-1]['prompt_tokens'] if events else None,
           'finish_reason': finish, 'gaps_ms': gaps, 'events': events,
           'quality': check(text), 'text': text}
    emit(row)
    return row

def worker(i):
    messages = [{'role': 'user', 'content': prompt(64000, seed['cold_prefix'])},
                {'role': 'assistant', 'content': seed['text']}]
    rows = []
    for turn in range(a.turns):
        call_id = f'build_{i}_{turn}'
        messages.extend([
            {'role': 'assistant', 'content': None, 'tool_calls': [{'id': call_id, 'type': 'function',
                'function': {'name': 'get_build_status', 'arguments': json.dumps({'agent': i, 'iteration': turn})}}]},
            {'role': 'tool', 'tool_call_id': call_id, 'content': json.dumps({
                'tests_passed': 12, 'agent': i, 'iteration': turn,
                'review': 'Retain touching-endpoint behavior, input immutability, and ValueError validation.'})},
            {'role': 'user', 'content': f'Agent {i}, review iteration {turn}: return the complete concise merge_intervals function again. ' + task}])
        row = request(messages, i, turn)
        rows.append(row)
        messages.append({'role': 'assistant', 'content': row['text']})
    return rows

def arrival():
    for signal in first:
        if not signal.wait(600):
            raise RuntimeError('Existing agent failed to start streaming')
    messages = [{'role': 'user', 'content': prompt(128000, 'agentic-fresh-20261002-a1')}]
    rows = [request(messages, 3, 0, fresh=True)]
    for turn in range(1, 3):
        messages.extend([{'role': 'assistant', 'content': rows[-1]['text']},
                         {'role': 'user', 'content': f'Review iteration {turn}: repeat the complete validated function. ' + task}])
        rows.append(request(messages, 3, turn))
    return rows

t = threading.Thread(target=watcher, daemon=True)
t.start()
errors, rows = [], []
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
    futures = [pool.submit(worker, i) for i in range(3)] + [pool.submit(arrival)]
    for f in concurrent.futures.as_completed(futures):
        try:
            rows.extend(f.result())
        except Exception as e:
            errors.append(str(e))
stop.set()
t.join(12)
wall = time.perf_counter() - start
after = metrics()
gaps = sorted(g for r in rows for g in r['gaps_ms'])
def percentile(v, q):
    return v[min(len(v) - 1, int((len(v) - 1) * q))] if v else None
emit({'kind': 'summary', 'cap': a.cap, 'wall_s': wall, 'requests': len(rows), 'errors': errors,
      'quality_passes': sum(r['quality']['passed'] for r in rows),
      'output_tokens': sum(r['completion_tokens'] for r in rows),
      'aggregate_output_tok_s': sum(r['completion_tokens'] for r in rows) / wall,
      'median_decode_tok_s': statistics.median(r['decode_tok_s'] for r in rows if r['decode_tok_s']),
      'median_ttft_s': statistics.median(r['ttft_s'] for r in rows if r['ttft_s']),
      'stream_gap_p95_ms': percentile(gaps, .95), 'stream_gap_p99_ms': percentile(gaps, .99),
      'stream_gap_max_ms': max(gaps) if gaps else None,
      'peak_running': max(s.get('vllm:num_requests_running', 0) for s in samples),
      'peak_waiting': max(s.get('vllm:num_requests_waiting', 0) for s in samples),
      'aggregate_metric_deltas': {k: after[k] - before.get(k, 0) for k in after if k.endswith('_total')},
      'samples': samples, 'thinking': False, 'temperature': 0, 'max_tokens': 768,
      'seed_context_shared': True, 'tools_simulated': True})
if errors:
    raise SystemExit(1)
