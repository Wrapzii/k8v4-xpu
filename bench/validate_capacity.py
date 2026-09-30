"""Exercise independent long histories on the deployed endpoint, with pool metrics."""
import argparse
import concurrent.futures
import json
import re
import threading
import time
import urllib.request

parser = argparse.ArgumentParser()
parser.add_argument('--base', default='http://127.0.0.1:8200')
parser.add_argument('--skip-single', action='store_true')
args = parser.parse_args()
BASE = args.base
MODEL = 'Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8'
def request(index, target, round_name):
    marker = 815731 + index * 379
    prompt = f'History {index}: the secret marker is {marker}.\n'
    prompt += 'Background note: interval endpoints are integers. Sort before merging.\n' * (target // 13)
    prompt += '\nReturn only a JSON object with marker equal to the secret at the start of this history and sequence equal to the list of every integer from 0 through 99 inclusive. The marker must be a JSON integer, never a quoted string. No prose.'
    body = {'model': MODEL, 'messages': [{'role': 'user', 'content': prompt}],
            'temperature': 0, 'max_tokens': 768, 'stream': True,
            'stream_options': {'include_usage': True, 'continuous_usage_stats': True},
            'chat_template_kwargs': {'enable_thinking': False}}
    req = urllib.request.Request(BASE+'/v1/chat/completions', json.dumps(body).encode(),
                                 {'Content-Type': 'application/json'})
    start = time.perf_counter()
    pieces, events, finish, usage = [], [], None, {}
    with urllib.request.urlopen(req, timeout=1800) as response:
        for line in response:
            if not line.startswith(b'data:'): continue
            raw = line[5:].strip()
            if raw == b'[DONE]': break
            event = json.loads(raw)
            usage = event.get('usage') or usage
            for choice in event.get('choices') or []:
                piece = (choice.get('delta') or {}).get('content')
                if piece: pieces.append(piece)
                finish = choice.get('finish_reason') or finish
            count = usage.get('completion_tokens', 0)
            if count and (not events or count > events[-1]['tokens']):
                events.append({'seconds': time.perf_counter()-start, 'tokens': count})
    text = ''.join(pieces).strip()
    cleaned = re.sub(r'^```(?:json)?\s*\n?', '', text)
    cleaned = re.sub(r'\n?```$', '', cleaned)
    try:
        answer = json.loads(cleaned)
        valid = answer == {'marker': marker, 'sequence': list(range(100))}
    except ValueError:
        valid = False
    row = {'round': round_name, 'history': index, 'target_approx': target,
           'usage': usage, 'finish_reason': finish, 'retrieval_and_sequence_passed': valid,
           'elapsed_s': time.perf_counter()-start, 'text': text, 'events': events}
    print(json.dumps(row), flush=True)
    return valid and finish == 'stop'

def snapshot():
    result = {}
    with urllib.request.urlopen(BASE+'/metrics', timeout=10) as response:
        for line in response.read().decode().splitlines():
            if line.startswith(('vllm:num_requests_running', 'vllm:num_requests_waiting',
                                'vllm:kv_cache_usage_perc', 'vllm:num_preemptions_total')):
                name, value = line.split()[:2]
                name = name.split('{')[0]
                result[name] = result.get(name, 0) + float(value)
    return result

stop = threading.Event()
samples = []
def sample():
    while not stop.is_set():
        try: samples.append(snapshot())
        except Exception as exc: print(json.dumps({'metric_error': str(exc)}), flush=True)
        stop.wait(1)

initial = snapshot()
sampler = threading.Thread(target=sample, daemon=True)
sampler.start()
ok = True
try:
    for round_name in ('four_first_pass', 'four_repeat'):
        with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
            jobs = [pool.submit(request, i, 130000, round_name) for i in range(4)]
            ok = all([job.result() for job in jobs]) and ok
    if not args.skip_single:
        ok = request(9, 261000, 'near_maximum_single') and ok
finally:
    stop.set()
    sampler.join(timeout=15)
final = snapshot()
report = {'kind': 'capacity_summary', 'requests_passed': ok,
          'metrics_initial': initial, 'metrics_final': final,
          'metrics_peak': {key: max(row.get(key, 0) for row in samples)
                           for key in final}, 'metric_samples': len(samples)}
print(json.dumps(report), flush=True)
assert ok, 'capacity request behavior or natural EOS failed'
assert report['metrics_peak'].get('vllm:num_requests_running', 0) >= 4, 'four running requests not observed'
assert final.get('vllm:num_preemptions_total', 0) == initial.get('vllm:num_preemptions_total', 0), 'unexpected preemption'
