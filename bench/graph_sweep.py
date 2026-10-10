"""Bounded single-device graph sweep using an already-built serving library.

No model loading and no server restarts. Synthetic input is filled in small
CPU chunks, with one sequence case resident at a time. Each graph is checked
against NSG=32 before timings are accepted. Timings include host replay cost.
"""
from __future__ import annotations

import argparse
import gc
import hashlib
import json
import os
from pathlib import Path
import resource
import statistics
import sys
import time

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))


def emit(**row):
    print(json.dumps(row), flush=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--lengths", default="2001,8001,15992")
    parser.add_argument("--queries", default="1,7")
    parser.add_argument("--device", type=int, default=0)
    parser.add_argument("--repeats", type=int, default=7)
    parser.add_argument("--replays", type=int, default=24)
    parser.add_argument("--warmup", type=int, default=64)
    parser.add_argument("--capacity", type=int, default=0)
    parser.add_argument("--pages-per-block", type=int, default=1)
    parser.add_argument("--modes", default="0")
    parser.add_argument("--hkv", type=int, default=2,
                        help="per-GPU KV heads: 2 (a TP2 rank, the old default) or 4 (single GPU)")
    parser.add_argument("--expected-sha", default="",
                        help="sha256 of the library; empty pins nothing (the digest is always emitted)")
    args = parser.parse_args()
    # Sweep the fallback explicitly even when invoked in a serving environment.
    # Role-specific settings otherwise override every NSG variant below.
    os.environ.pop("XE2_KV_S2_NSG_DRAFT", None)
    os.environ.pop("XE2_KV_S2_NSG_VERIFY", None)
    import torch
    from k8v4_v030.cache_views import bind_regions
    from k8v4_v030.layout import D, PAGE, PageLayout
    from k8v4_v030.ops_api import library_path, ops
    from k8v4_v030.plan import workspace_programs
    from k8v4_v030.scratch import Scratch

    torch.set_num_threads(1)
    torch.xpu.set_device(args.device)
    device = torch.device("xpu", args.device)
    # One library serves both head layouts; the cache geometry follows --hkv.
    layout = PageLayout(args.hkv)
    hkv, hq = layout.hkv, layout.hq
    lib = library_path()
    digest = hashlib.sha256(Path(lib).read_bytes()).hexdigest()
    if args.expected_sha and digest != args.expected_sha:
        raise SystemExit("Unexpected library: " + digest)
    emit(kind="begin", library_sha256=digest, device=args.device, hkv=hkv,
         basis="host elapsed time for batched XPUGraph replay; standalone synthetic attention",
         lengths=args.lengths, queries=args.queries, capacity=args.capacity,
         pages_per_block=args.pages_per_block, modes=args.modes)
    variants = [(mode, nsg) for mode in map(int, args.modes.split(',')) for nsg in (32,16,8)]
    failures = []
    for length in map(int, args.lengths.split(",")):
        ppb = args.pages_per_block
        manager_blocks = (max(length, args.capacity) + PAGE*ppb - 1) // (PAGE*ppb)
        pages = manager_blocks * ppb
        raw = torch.zeros(pages * layout.page_bytes, dtype=torch.int8, device=device)
        views = bind_regions(raw, layout)
        gen = torch.Generator(device="cpu").manual_seed(length)
        # Never allocate a full long-context K/V tensor in host RAM.
        for start in range(0, length, 2048):
            count = min(2048, length-start)
            k = torch.randn(count, hkv, D, generator=gen, dtype=torch.float16).to(device)
            v = torch.randn(count, hkv, D, generator=gen, dtype=torch.float16).to(device)
            slots = torch.arange(start, start+count, dtype=torch.int64, device=device)
            ops().kv_store_paged(k, v, slots, views["k"], views["k_scale"], views["v"], views["v_scale"], views["v_zero"])
        del k, v, slots
        table = torch.arange(manager_blocks, dtype=torch.int32, device=device).reshape(1, manager_blocks)
        seq = torch.tensor([length], dtype=torch.int32, device=device)
        for qlen in map(int, args.queries.split(",")):
            scratch = Scratch(device, layout, workspace_programs(pages, 1, layout), 1, qlen)
            query, out = scratch.attention_pair(qlen)
            query.copy_(torch.randn(qlen, hq, D, generator=gen, dtype=torch.float16).to(device))
            ws = scratch.workspace(workspace_programs(pages, 1, layout))

            def run():
                ops().int8k_int4v_attn_batch(query, scratch.q8, scratch.q_scale,
                    views["k"], views["k_scale"], views["v"], views["v_scale"], views["v_zero"],
                    table, seq, scratch.visible, *ws, out, qlen, ppb)

            os.environ["XE2_KV_S2_NSG"] = "32"
            os.environ["XE2_KV_S2_TWO_PASS"] = "0"
            for _ in range(3):
                run()
            torch.xpu.synchronize()
            reference = out.clone()
            graphs, gaps, samples = {}, {}, {key: [] for key in variants}
            for mode, nsg in variants:
                os.environ["XE2_KV_S2_TWO_PASS"] = str(mode)
                os.environ["XE2_KV_S2_NSG"] = str(nsg)
                for _ in range(3):
                    run()
                torch.xpu.synchronize()
                graph = torch.xpu.XPUGraph()
                with torch.xpu.graph(graph):
                    run()
                graph.replay()
                torch.xpu.synchronize()
                finite = bool(torch.isfinite(out).all().item())
                gap = float((out-reference).abs().max().item())
                emit(kind="correctness", seq=length, q=qlen, nsg=nsg, two_pass=mode, finite=finite, max_abs=gap)
                if not finite or gap > .001:
                    failures.append((length, qlen, mode, nsg, gap))
                graphs[mode,nsg], gaps[mode,nsg] = graph, gap
            if failures:
                raise SystemExit("Graph correctness failed: " + str(failures))
            for key in variants:
                for _ in range(args.warmup):
                    graphs[key].replay()
            torch.xpu.synchronize()
            for turn in range(args.repeats):
                order = variants[turn % len(variants):] + variants[:turn % len(variants)]
                if turn % 2: order = list(reversed(order))
                for key in order:
                    graph = graphs[key]
                    for _ in range(3):
                        graph.replay()
                    torch.xpu.synchronize()
                    t0 = time.perf_counter()
                    for _ in range(args.replays):
                        graph.replay()
                    torch.xpu.synchronize()
                    samples[key].append((time.perf_counter()-t0)*1e6/args.replays)
            baseline = statistics.median(samples[0,32])
            for mode, nsg in variants:
                key = (mode,nsg)
                med = statistics.median(samples[key])
                emit(kind="timing", seq=length, q=qlen, nsg=nsg, two_pass=mode,
                     median_us=med, min_us=min(samples[key]), samples_us=samples[key],
                     ratio_to_32=med/baseline, max_abs=gaps[key])
            del graphs, graph, reference, query, out, ws, scratch
            gc.collect()
        del views, raw, table, seq
        gc.collect()
        torch.xpu.empty_cache()
    emit(kind="end", passed=True, peak_rss_kib=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss)


if __name__ == "__main__":
    main()
