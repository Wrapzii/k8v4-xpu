"""In-process A/B of decode-attention S1 variants selected by environment variables.

One library, one process. The reference is the default path (XE2_KV_S1_PAGES unset,
fp32 partials). Each variant is run eagerly and as an XPUGraph replay and compared to the
reference on identical data (output max_abs, finite), including causal per-row visible
lengths, then all graphs are timed interleaved (median host time per replay).

Variants: "label:K=V,K=V;label2:..." over XE2_KV_S1_PAGES, XE2_KV_PARTIAL_FP16, XE2_KV_S1_GRF,
XE2_KV_SMALL_S1. Example:
  python bench/ab_s1pages.py --lengths 63000,16000,2000 --queries 1,4,7 \
      --variants "pf16:XE2_KV_PARTIAL_FP16=1;p4:XE2_KV_S1_PAGES=4;p4h:XE2_KV_S1_PAGES=4,XE2_KV_PARTIAL_FP16=1"
"""
from __future__ import annotations

import argparse
import gc
import json
import os
import statistics
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

KEYS = ("XE2_KV_S1_PAGES", "XE2_KV_PARTIAL_FP16", "XE2_KV_S1_GRF", "XE2_KV_SMALL_S1", "XE2_KV_BATCH_REQS")


def emit(**row):
    print(json.dumps(row), flush=True)


def set_env(spec):
    for k in list(os.environ):
        if k in KEYS or k.startswith("XE2_KV_S1_"):
            os.environ.pop(k, None)
    for kv in filter(None, spec.split(",")):
        k, v = kv.split("=")
        os.environ[k] = v


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--lengths", default="63000,16000,2000")
    ap.add_argument("--queries", default="1,4,7")
    ap.add_argument("--hkv", type=int, default=4)
    ap.add_argument("--capacity", type=int, default=131072)
    ap.add_argument("--pages-per-block", type=int, default=33)
    ap.add_argument("--variants", default="pf16:XE2_KV_PARTIAL_FP16=1")
    ap.add_argument("--nsg", default="32")
    ap.add_argument("--repeats", type=int, default=5)
    ap.add_argument("--replays", type=int, default=16)
    ap.add_argument("--warmup", type=int, default=16)
    ap.add_argument("--no-timing", action="store_true")
    ap.add_argument("--tol", type=float, default=2e-3)
    ap.add_argument("--batch", type=int, default=1,
                    help="requests per op (request r has length - 37 * r tokens and its own pages)")
    ap.add_argument("--ops-per-graph", type=int, default=1,
                    help="capture the op this many times per graph (amortizes host replay cost)")
    args = ap.parse_args()

    os.environ.pop("XE2_KV_S2_NSG_DRAFT", None)
    os.environ.pop("XE2_KV_S2_NSG_VERIFY", None)
    os.environ["XE2_KV_S2_NSG"] = args.nsg
    os.environ["XE2_KV_S2_TWO_PASS"] = "0"
    import torch
    from k8v4_v030.cache_views import bind_regions
    from k8v4_v030.layout import D, PAGE, PageLayout
    from k8v4_v030.ops_api import ops
    from k8v4_v030.plan import workspace_programs
    from k8v4_v030.scratch import Scratch

    torch.set_num_threads(1)
    device = torch.device("xpu", 0)
    layout = PageLayout(args.hkv)
    hkv, hq = layout.hkv, layout.hq
    variants = [("base", "")]
    for item in filter(None, args.variants.split(";")):
        label, spec = item.split(":", 1)
        variants.append((label, spec))
    emit(kind="begin", variants=variants, lengths=args.lengths, queries=args.queries)
    fails = []
    summary = []
    for length in map(int, args.lengths.split(",")):
        ppb = args.pages_per_block
        blocks = (max(length, args.capacity) + PAGE * ppb - 1) // (PAGE * ppb)
        pages = blocks * ppb
        nb = args.batch
        raw = torch.zeros(nb * pages * layout.page_bytes, dtype=torch.int8, device=device)
        views = bind_regions(raw, layout)
        gen = torch.Generator(device="cpu").manual_seed(length)
        # Permuted block table: logical pages are not physically consecutive.
        perm = torch.randperm(nb * blocks, generator=gen).to(torch.int64).reshape(nb, blocks)
        bs = PAGE * ppb
        lens = [length - 37 * r for r in range(nb)]
        for r in range(nb):
            for start in range(0, lens[r], 2048):
                count = min(2048, lens[r] - start)
                k = torch.randn(count, hkv, D, generator=gen, dtype=torch.float16).to(device)
                v = torch.randn(count, hkv, D, generator=gen, dtype=torch.float16).to(device)
                pos = torch.arange(start, start + count, dtype=torch.int64)
                slots = (perm[r][pos // bs] * bs + pos % bs).to(device)
                ops().kv_store_paged(k, v, slots, views["k"], views["k_scale"], views["v"],
                                     views["v_scale"], views["v_zero"])
        table = perm.to(torch.int32).to(device).contiguous()
        seq = torch.tensor(lens, dtype=torch.int32, device=device)
        for qlen in map(int, args.queries.split(",")):
            scratch = Scratch(device, layout, workspace_programs(pages, 1, layout), 1, nb * qlen)
            query, out = scratch.attention_pair(nb * qlen)
            query.copy_(torch.randn(nb * qlen, hq, D, generator=gen, dtype=torch.float16).to(device))
            ws = scratch.workspace(workspace_programs(pages, 1, layout))
            # Causal per-row visible lengths (spec verify): rows see staggered prefixes.
            vis_list = []
            for r in range(nb):
                vis_rows = [max(1, lens[r] - qlen + i + 1 - 97 * (qlen - 1 - i)) for i in range(qlen)]
                vis_list.append([max(vis_rows)] + vis_rows)
            vis = torch.tensor(vis_list, dtype=torch.int32, device=device)
            empty = scratch.visible

            def run(visible):
                ops().int8k_int4v_attn_batch(query, scratch.q8, scratch.q_scale, views["k"],
                                             views["k_scale"], views["v"], views["v_scale"],
                                             views["v_zero"], table, seq, visible, *ws, out, qlen, ppb)

            def eager(spec, visible):
                set_env(spec)
                # Dirty the workspace so stale partials cannot hide a missing write.
                ws[0].fill_(float("nan"))
                ws[1].fill_(float("nan"))
                ws[2].fill_(float("nan"))
                run(visible)
                torch.xpu.synchronize()
                return out.clone().float()

            ref = eager("", empty)
            ref_vis = eager("", vis)
            graphs = {}
            for label, spec in variants:
                r1 = eager(spec, empty)
                r2 = eager(spec, vis)
                g1 = (r1 - ref).abs().max().item()
                g2 = (r2 - ref_vis).abs().max().item()
                fin = bool(torch.isfinite(r1).all().item() and torch.isfinite(r2).all().item())
                set_env(spec)
                graph = torch.xpu.XPUGraph()
                with torch.xpu.graph(graph):
                    for _ in range(args.ops_per_graph):
                        run(empty)
                out.zero_()
                graph.replay()
                torch.xpu.synchronize()
                g3 = (out.float() - ref).abs().max().item()
                fin = fin and bool(torch.isfinite(out).all().item())
                ok = fin and max(g1, g2, g3) <= args.tol
                emit(kind="correctness", seq=length, q=qlen, variant=label, finite=fin,
                     max_abs=g1, max_abs_causal=g2, max_abs_graph=g3, mean_abs_ref=ref.abs().mean().item(),
                     ok=ok)
                if not ok:
                    fails.append((length, qlen, label, g1, g2, g3, fin))
                graphs[label] = graph
            if not args.no_timing:
                samples = {label: [] for label, _ in variants}
                for label in graphs:
                    for _ in range(args.warmup):
                        graphs[label].replay()
                torch.xpu.synchronize()
                labels = [label for label, _ in variants]
                for turn in range(args.repeats):
                    order = labels[turn % len(labels):] + labels[:turn % len(labels)]
                    if turn % 2:
                        order = list(reversed(order))
                    for label in order:
                        graph = graphs[label]
                        for _ in range(3):
                            graph.replay()
                        torch.xpu.synchronize()
                        t0 = time.perf_counter()
                        for _ in range(args.replays):
                            graph.replay()
                        torch.xpu.synchronize()
                        samples[label].append((time.perf_counter() - t0) * 1e6 / args.replays
                                              / args.ops_per_graph)
                for label in labels:
                    med = statistics.median(samples[label])
                    emit(kind="timing", seq=length, q=qlen, variant=label, median_us=round(med, 1),
                         min_us=round(min(samples[label]), 1))
                    summary.append((length, qlen, label, med))
            del graphs, query, out, ws, scratch
            gc.collect()
        del views, raw, table, seq
        gc.collect()
        torch.xpu.empty_cache()
    if summary:
        labels = [label for label, _ in variants]
        print("SUMMARY seq q " + " ".join(labels))
        keys = sorted({(s, q) for s, q, _, _ in summary}, key=lambda x: (-x[0], x[1]))
        for s, q in keys:
            row = {l: m for ss, qq, l, m in summary if ss == s and qq == q}
            print("SUMMARY %d %d " % (s, q) + " ".join("%.0f" % row[l] for l in labels))
    emit(kind="end", passed=not fails, fails=fails)


if __name__ == "__main__":
    main()
