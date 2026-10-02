"""Paired oneDNN SDPA oracle, queue-lifetime stress and pipeline timings."""
import argparse
import json
import os
from pathlib import Path
import statistics
import time

import torch

p = argparse.ArgumentParser()
p.add_argument('--lib', required=True)
p.add_argument('--mode', choices=('baseline', 'candidate'), required=True)
p.add_argument('--device', type=int, required=True)
p.add_argument('--fixture', type=Path, required=True)
a = p.parse_args()
os.environ['K8V4_SDPA_ASYNC'] = '1' if a.mode == 'candidate' else '0'
torch.ops.load_library(a.lib)
torch.xpu.set_device(a.device)
torch.manual_seed(3187)
device = torch.device('xpu', a.device)
saved = {} if a.mode == 'baseline' else torch.load(a.fixture, weights_only=True)
observed = {}

def execute(q, k, v):
    dense = q.transpose(0, 1).contiguous()
    out = torch.empty_like(dense)
    torch.ops.k8v4_sdpa.sdpa_len(dense, k, v, out, 1 / 16, k.shape[1], q.shape[0])
    # Immediate downstream consumer exercises the same queue as native SDPA.
    return out.transpose(0, 1).contiguous()

shapes = [(8, 69), (64, 256), (128, 2115), (2112, 2112), (4224, 64000), (4224, 128000)]
for qlen, klen in shapes:
    q = torch.randn(qlen, 6, 256, device=device, dtype=torch.float16) * .3
    k = torch.randn(1, klen, 256, device=device, dtype=torch.float16) * .3
    v = torch.randn_like(k)
    answer = execute(q, k, v)
    key = f'{qlen}-{klen}'
    got = answer.cpu()
    observed[key] = got
    if a.mode == 'candidate':
        assert torch.equal(got, saved[key]), key
    del answer
    samples = []
    for _ in range(8):
        torch.xpu.synchronize()
        t0 = time.perf_counter()
        for _ in range(8):
            answer = execute(q, k, v)
        torch.xpu.synchronize()
        samples.append((time.perf_counter() - t0) * 1000 / 8)
        del answer
    print(json.dumps({'kind': 'sdpa', 'mode': a.mode, 'device': a.device,
                      'query_tokens': qlen, 'kv_tokens': klen,
                      'bitwise_equal': a.mode == 'candidate',
                      'median_pipeline_ms': statistics.median(samples), 'samples_ms': samples}), flush=True)
    del q, k, v

# Alternate shapes and retire all inputs immediately after enqueueing. Their
# released storage is reused by allocations on the same in-order XPU queue.
stress = []
for i in range(60):
    qlen, klen = [(8, 69), (64, 2115), (69, 8192)][i % 3]
    q = torch.randn(qlen, 6, 256, device=device, dtype=torch.float16) * .3
    k = torch.randn(1, klen, 256, device=device, dtype=torch.float16) * .3
    v = torch.randn_like(k)
    answer = execute(q, k, v)
    stress.append(answer.clone())
    del q, k, v, answer
    trash = torch.zeros((1024, 1024), device=device, dtype=torch.float16)
    del trash
torch.xpu.synchronize()
for i, answer in enumerate(stress):
    key = f'stress-{i}'
    got = answer.cpu()
    observed[key] = got
    if a.mode == 'candidate':
        assert torch.equal(got, saved[key]), key
if a.mode == 'baseline':
    torch.save(observed, a.fixture)
print(json.dumps({'kind': 'stress', 'mode': a.mode, 'device': a.device,
                  'requests': 60, 'bitwise_equal': a.mode == 'candidate', 'passed': True}), flush=True)
