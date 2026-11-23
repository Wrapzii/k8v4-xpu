"""A/B harness for the native decode attention op (one library per process).

Builds deterministic synthetic K8/V4 caches (seeded per length, identical across runs), runs
``int8k_int4v_attn_batch`` at the production S2 roles (draft NSG from XE2_KV_S2_NSG_DRAFT, verify
from XE2_KV_S2_NSG_VERIFY; leave those exported as production has them), then:

  --save-dir D     writes every op output so a second run can be compared bit for bit
  --compare-dir D  loads a baseline's outputs and reports exact equality / max abs difference
  --bw             also prints a plain device-copy bandwidth reference

Timing is the median host-measured time of an XPUGraph replay, like batch_attention_probe.py.
No model is loaded. One length resident at a time.
"""
from __future__ import annotations

import argparse
import gc
import hashlib
import json
import os
import statistics
import sys
import time
from pathlib import Path

sys.path.insert(0, os.environ.get("K8V4_ROOT", "/opt/k8v4-opt"))


def emit(**row):
    print(json.dumps(row), flush=True)


def bandwidth_reference(torch, device):
    n = 256 * 1024 * 1024  # 256 MiB of int32 = 1 GiB
    x = torch.empty(n, dtype=torch.int32, device=device)
    x.fill_(1)
    y = torch.empty_like(x)
    torch.xpu.synchronize()
    out = {}
    for name, fn, moved in (("copy_rw", lambda: y.copy_(x), 2 * x.numel() * 4),
                            ("read_sum", lambda: x.sum(), x.numel() * 4)):
        for _ in range(3):
            fn()
        torch.xpu.synchronize()
        t = []
        for _ in range(7):
            t0 = time.perf_counter()
            for _ in range(5):
                fn()
            torch.xpu.synchronize()
            t.append((time.perf_counter() - t0) / 5)
        out[name + "_GBps"] = round(moved / statistics.median(t) / 1e9, 1)
    del x, y
    torch.xpu.empty_cache()
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--lengths", default="131072")
    ap.add_argument("--queries", default="1,7")
    ap.add_argument("--batches", default="1,2")
    ap.add_argument("--device", type=int, default=0)
    ap.add_argument("--hkv", type=int, default=2)
    ap.add_argument("--repeats", type=int, default=7)
    ap.add_argument("--replays", type=int, default=24)
    ap.add_argument("--warmup", type=int, default=48)
    ap.add_argument("--save-dir", default="")
    ap.add_argument("--compare-dir", default="")
    ap.add_argument("--bw", action="store_true")
    ap.add_argument("--tag", default="")
    ap.add_argument("--phase-masks", default="", help="comma list, e.g. 15,14,13,11,7,0 (debug build only)")
    ap.add_argument("--no-graph", action="store_true", help="eager only (use with XE2_KV_TIME_SPLITS=1)")
    args = ap.parse_args()

    import torch
    from k8v4_v030.cache_views import bind_regions
    from k8v4_v030.layout import D, PAGE, PageLayout
    from k8v4_v030.ops_api import library_path, ops
    from k8v4_v030.plan import workspace_programs
    from k8v4_v030.scratch import Scratch

    torch.set_num_threads(1)
    torch.xpu.set_device(args.device)
    device = torch.device("xpu", args.device)
    layout = PageLayout(args.hkv)
    hkv, hq = layout.hkv, layout.hq
    lib = library_path()
    digest = hashlib.sha256(Path(lib).read_bytes()).hexdigest()
    os.environ.setdefault("XE2_KV_S2_NSG", "32")
    os.environ["XE2_KV_S2_TWO_PASS"] = "0"
    emit(kind="begin", tag=args.tag, lib=str(lib), sha256=digest, device=args.device, hkv=hkv,
         draft_nsg=os.environ.get("XE2_KV_S2_NSG_DRAFT"), verify_nsg=os.environ.get("XE2_KV_S2_NSG_VERIFY"),
         lengths=args.lengths, batches=args.batches, queries=args.queries)
    if args.bw:
        emit(kind="bandwidth_reference", **bandwidth_reference(torch, device))
    for d in (args.save_dir, args.compare_dir):
        if d:
            Path(d).mkdir(parents=True, exist_ok=True)

    for length in map(int, args.lengths.split(",")):
        manager_blocks = (length + PAGE - 1) // PAGE
        pages = manager_blocks
        for batch in map(int, args.batches.split(",")):
            raw = torch.zeros(pages * batch * layout.page_bytes, dtype=torch.int8, device=device)
            views = bind_regions(raw, layout)
            gen = torch.Generator(device="cpu").manual_seed(length)
            for start in range(0, length * batch, 2048):
                count = min(2048, length * batch - start)
                k = torch.randn(count, hkv, D, generator=gen, dtype=torch.float16).to(device)
                v = torch.randn(count, hkv, D, generator=gen, dtype=torch.float16).to(device)
                slots = torch.arange(start, start + count, dtype=torch.int64, device=device)
                ops().kv_store_paged(k, v, slots, views["k"], views["k_scale"], views["v"],
                                     views["v_scale"], views["v_zero"])
            del k, v, slots
            table = torch.arange(manager_blocks * batch, dtype=torch.int32,
                                 device=device).reshape(batch, manager_blocks)
            seq = torch.tensor([length] * batch, dtype=torch.int32, device=device)
            visible = torch.empty(0, dtype=torch.int32, device=device)
            for qlen in map(int, args.queries.split(",")):
                scratch = Scratch(device, layout, workspace_programs(pages, 1, layout), 1, qlen * batch)
                query, out = scratch.attention_pair(qlen * batch)
                qgen = torch.Generator(device="cpu").manual_seed(length * 131 + qlen)
                query.copy_(torch.randn(qlen * batch, hq, D, generator=qgen, dtype=torch.float16).to(device))
                ws = scratch.workspace(workspace_programs(pages, 1, layout))

                def run():
                    ops().int8k_int4v_attn_batch(query, scratch.q8, scratch.q_scale, views["k"],
                        views["k_scale"], views["v"], views["v_scale"], views["v_zero"],
                        table, seq, visible, *ws, out, qlen, 1)

                for _ in range(3):
                    run()
                torch.xpu.synchronize()
                result = out.clone().float().cpu()
                finite = bool(torch.isfinite(result).all().item())
                name = f"out_L{length}_B{batch}_Q{qlen}.pt"
                if args.save_dir:
                    torch.save(result, Path(args.save_dir) / name)
                parity = {}
                if args.compare_dir:
                    ref = torch.load(Path(args.compare_dir) / name)
                    parity = dict(exact=bool(torch.equal(ref, result)),
                                  max_abs_vs_base=float((ref - result).abs().max().item()),
                                  mean_abs_ref=float(ref.abs().mean().item()))
                if args.no_graph:
                    emit(kind="eager_parity", tag=args.tag, seq=length, batch=batch, q=qlen, finite=finite, **parity)
                    del ws, scratch, query, out
                    continue
                graph = torch.xpu.XPUGraph()
                with torch.xpu.graph(graph):
                    run()
                graph.replay()
                torch.xpu.synchronize()
                for _ in range(args.warmup):
                    graph.replay()
                torch.xpu.synchronize()
                samples = []
                for _ in range(args.repeats):
                    t0 = time.perf_counter()
                    for _ in range(args.replays):
                        graph.replay()
                    torch.xpu.synchronize()
                    samples.append((time.perf_counter() - t0) * 1e6 / args.replays)
                # Bytes the op must read per request at minimum: K int8 + V int4 + scales.
                kv_bytes = length * hkv * (D + D // 2 + 3 * 4)
                emit(kind="timing", tag=args.tag, seq=length, batch=batch, q=qlen,
                     median_us=round(statistics.median(samples), 1), min_us=round(min(samples), 1),
                     samples_us=[round(s, 1) for s in samples], finite=finite,
                     kv_bytes_per_req_MB=round(kv_bytes / 1e6, 1),
                     effective_kv_GBps=round(batch * kv_bytes / (statistics.median(samples) * 1e-6) / 1e9, 1),
                     **parity)
                if args.phase_masks:
                    # Only meaningful for a library built with -DXE2_KV_S1_PHASES_DEBUG.
                    for mask in map(int, args.phase_masks.split(",")):
                        os.environ["XE2_KV_S1_PHASES"] = str(mask)
                        g2 = torch.xpu.XPUGraph()
                        with torch.xpu.graph(g2):
                            run()
                        g2.replay()
                        torch.xpu.synchronize()
                        for _ in range(args.warmup):
                            g2.replay()
                        torch.xpu.synchronize()
                        ps = []
                        for _ in range(args.repeats):
                            t0 = time.perf_counter()
                            for _ in range(args.replays):
                                g2.replay()
                            torch.xpu.synchronize()
                            ps.append((time.perf_counter() - t0) * 1e6 / args.replays)
                        emit(kind="phase_timing", tag=args.tag, seq=length, batch=batch, q=qlen,
                             mask=mask, median_us=round(statistics.median(ps), 1))
                        del g2
                    os.environ.pop("XE2_KV_S1_PHASES", None)
                del graph, ws, scratch, query, out
                gc.collect()
            del views, raw, table, seq
            gc.collect()
            torch.xpu.empty_cache()
    emit(kind="end", tag=args.tag)


if __name__ == "__main__":
    main()
