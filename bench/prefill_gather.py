"""XPU correctness and timing probe for fused paged gather, no model weights.

Uses region-major byte storage, permuted manager blocks, both KV heads,
partial final pages, nibble extremes and independent reference comparison.
"""
import argparse
import json
import statistics
import time

import torch
from k8v4_v030.cache_views import bind_regions
from k8v4_v030.dequant import gather_dequant_head
from k8v4_v030.prefill_gather_triton import gather_dequant_head_fused
from k8v4_v030.layout import PAGE, PageLayout

p = argparse.ArgumentParser()
p.add_argument('--lengths', default='69,2115,8192,64000,128000,200000')
p.add_argument('--devices', default='0,1')
p.add_argument('--repeats', type=int, default=12)
p.add_argument('--hkv', type=int, default=2,
               help='per-GPU KV heads: 2 (a TP2 rank, the old default) or 4 (single GPU)')
a = p.parse_args()
layout = PageLayout(a.hkv)
torch.manual_seed(73)

def timed(f):
    for _ in range(3):
        result = f()
        del result
    torch.xpu.synchronize()
    times = []
    for _ in range(a.repeats):
        t0 = time.perf_counter()
        result = f()
        torch.xpu.synchronize()
        times.append((time.perf_counter() - t0) * 1000)
        del result
    return statistics.median(times), times

for device_id in map(int, a.devices.split(',')):
    torch.xpu.set_device(device_id)
    device = torch.device('xpu', device_id)
    for n in map(int, a.lengths.split(',')):
        for ratio in (1, 33):
            blocks = (n + PAGE * ratio - 1) // (PAGE * ratio)
            physical = blocks + 3
            # The cache is a byte span, with per-page regions sharing storage.
            raw = torch.empty(physical * ratio * layout.page_bytes, dtype=torch.int8, device=device)
            views = bind_regions(raw, layout)
            views['k'].copy_(torch.randint(-128, 128, views['k'].shape, device=device, dtype=torch.int8))
            views['v'].copy_(torch.randint(0, 256, views['v'].shape, device=device, dtype=torch.int32).to(torch.uint8))
            views['k_scale'].copy_(torch.rand(views['k_scale'].shape, device=device) * .1 + .001)
            views['v_scale'].copy_(torch.rand(views['v_scale'].shape, device=device) * .1 + .001)
            views['v_zero'].copy_(torch.rand(views['v_zero'].shape, device=device) * 15)
            table = torch.randperm(physical, device=device, dtype=torch.int32)[:blocks]
            for head in range(layout.hkv):
                for dtype in (torch.float32, torch.float16, torch.bfloat16):
                    ref = gather_dequant_head(views, table, n, head, ratio, dtype)
                    got = gather_dequant_head_fused(views, table, n, head, ratio, dtype)
                    torch.xpu.synchronize()
                    exact = all(torch.equal(x, y) for x, y in zip(ref, got))
                    errors = [float((x.float() - y.float()).abs().max()) for x, y in zip(ref, got)]
                    if not exact:
                        raise AssertionError((device_id, n, ratio, head, str(dtype), errors))
                    del ref, got
                if head == 0 and ratio == 33:
                    before = torch.xpu.memory_allocated()
                    torch.xpu.reset_peak_memory_stats()
                    old_ms, old_samples = timed(lambda: gather_dequant_head(views, table, n, head, ratio, torch.bfloat16))
                    old_peak = torch.xpu.max_memory_allocated() - before
                    torch.xpu.reset_peak_memory_stats()
                    new_ms, new_samples = timed(lambda: gather_dequant_head_fused(views, table, n, head, ratio, torch.bfloat16))
                    new_peak = torch.xpu.max_memory_allocated() - before
                    print(json.dumps({'device': device_id, 'tokens': n, 'ratio': ratio, 'head': head,
                        'exact_all_dtypes_both_heads_pending': True, 'baseline_ms': old_ms,
                        'fused_ms': new_ms, 'speedup': old_ms / new_ms,
                        'baseline_peak_extra_bytes': old_peak, 'fused_peak_extra_bytes': new_peak,
                        'baseline_samples_ms': old_samples, 'fused_samples_ms': new_samples}), flush=True)
            print(json.dumps({'kind': 'correctness', 'device': device_id, 'tokens': n,
                              'ratio': ratio, 'heads': layout.hkv, 'dtypes': 3, 'bitwise_equal': True}), flush=True)
            del raw, views, table
            torch.xpu.empty_cache()
