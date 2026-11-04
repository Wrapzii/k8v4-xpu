#!/usr/bin/env python3
"""Offline K8/V4 decode-attention microbenchmark (separate process, NOT the server).

Times the shipped op with torch.xpu.Event and, with XE2_KV_TIME_SPLITS=1, the
library's own bench-only host-timed S1/S2 split (that branch q.wait()s, so it
is only legal here). Sweeps context, q_len and batch, and the *existing*
runtime knobs, no kernel rebuild:
  XE2_KV_PARTIAL_FP16 0/1   halves split-workspace bytes      -> workspace-traffic bound?
  XE2_KV_S2_NSG 8/16/32     stage-2 subgroups per row         -> S2 occupancy
  XE2_KV_COMPACT_SLM 0/1    S1 verifier SLM footprint (q_len 7) -> S1 occupancy
  XE2_KV_S2_PARALLEL 0/1    serial vs parallel merge
Reports achieved GB/s two ways: KV-only bytes (lower bound) and KV + split
workspace write+read (what the kernel actually moves), against 456 GB/s.

Needs a free GPU: ~0.2 GB per 128K of context per call plus workspace
(nprog*64*256*4 B; 2*2048 programs at 128K = 0.5 GB). Do NOT run while vLLM
holds 95% of both cards; use a maintenance window or a stopped server.

usage: XE2_KV_LIB=/opt/k8v4/libxe2_kv.so PYTHONPATH=/opt/k8v4-casc \
       python3 k8v4_attn_splits_bench.py --sweep default --out bench.jsonl
"""
import argparse, itertools, json, os, re, subprocess, sys

PEAK = 456.0
KV_B = 396  # bytes/token/kv-head
SPLIT_RE = re.compile(r"\[xe2_kv_time\] s1_us=([\d.]+) s2_us=([\d.]+) n_splits=(\d+) seq0=(-?\d+) tq=(\d+)")


def one(ctx, q_len, batch, iters, splits):
    import torch
    from k8v4_v030.cache_views import bind_regions
    from k8v4_v030.layout import PAGE, PageLayout
    from k8v4_v030.ops_api import ops
    from k8v4_v030.plan import workspace_programs
    from k8v4_v030.scratch import Scratch

    dev = torch.device("xpu:0"); L = PageLayout(2)
    pages = (ctx + PAGE - 1) // PAGE
    raw = torch.randint(-127, 127, (pages * L.page_bytes,), dtype=torch.int8, device=dev)
    v = bind_regions(raw, L)
    v["k_scale"].fill_(0.01); v["v_scale"].fill_(0.01); v["v_zero"].fill_(8.0)
    bt = torch.arange(pages, dtype=torch.int32, device=dev).repeat(batch, 1).contiguous()
    sl = torch.full((batch,), ctx, dtype=torch.int32, device=dev)
    nprog = workspace_programs(pages, 1, L)
    s = Scratch(dev, L, nprog_max=nprog, max_store_tokens=1, max_out_tokens=batch * q_len)
    q, out = s.attention_pair(batch * q_len)
    q.normal_()
    part, m, l, merged = s.workspace(nprog)
    call = lambda: ops().int8k_int4v_attn_batch(q, s.q8, s.q_scale, v["k"], v["k_scale"], v["v"],
                                                v["v_scale"], v["v_zero"], bt, sl, s.visible, part, m, l,
                                                merged, out, q_len, 1)
    for _ in range(3):
        call()
    torch.xpu.synchronize()
    times = []
    for _ in range(iters):
        a = torch.xpu.Event(enable_timing=True); b = torch.xpu.Event(enable_timing=True)
        a.record(); call(); b.record(); b.synchronize()
        times.append(a.elapsed_time(b) * 1000)
    times.sort()
    us = times[len(times) // 2]
    pf16 = os.environ.get("XE2_KV_PARTIAL_FP16") == "1"
    kv = batch * ctx * KV_B * 2
    ws = batch * 2 * pages * PAGE * 256 * (2 if pf16 else 4) * 2  # write in S1 + read in S2
    print(json.dumps({"ctx": ctx, "q_len": q_len, "batch": batch, "p50_us": round(us, 1),
                      "min_us": round(times[0], 1), "kv_gbps": round(kv / us / 1e3, 1),
                      "kv_ws_gbps": round((kv + ws) / us / 1e3, 1),
                      "env": {k: os.environ.get(k) for k in ("XE2_KV_PARTIAL_FP16", "XE2_KV_S2_NSG",
                              "XE2_KV_COMPACT_SLM", "XE2_KV_S2_PARALLEL", "XE2_KV_TIME_SPLITS")}}),
          flush=True)


def sweep(a):
    knobs = [dict(XE2_KV_PARTIAL_FP16=p, XE2_KV_S2_NSG=n, XE2_KV_COMPACT_SLM=c)
             for p, n, c in itertools.product(("0", "1"), ("8", "32"), ("0", "1"))]
    ctxs = [2048, 16384, 65536, 131072, 200000, 262144]
    with open(a.out, "a") as fh:
        for env, ctx, ql, b in itertools.product(knobs, ctxs, (1, 7), (1, 4)):
            for split in (False, True):
                e = dict(os.environ, **env)
                if split:
                    e["XE2_KV_TIME_SPLITS"] = "1"
                p = subprocess.run([sys.executable, __file__, "--one", str(ctx), str(ql), str(b),
                                    str(5 if split else a.iters)], env=e, capture_output=True, text=True)
                row = json.loads(p.stdout.strip().splitlines()[-1]) if p.returncode == 0 else {"err": p.stderr[-400:]}
                if split:
                    sp = [tuple(map(float, x[:2])) for x in SPLIT_RE.findall(p.stderr)]
                    if sp:
                        row["split_s1_us"] = sorted(x[0] for x in sp)[len(sp) // 2]
                        row["split_s2_us"] = sorted(x[1] for x in sp)[len(sp) // 2]
                fh.write(json.dumps(row) + "\n"); print(json.dumps(row), flush=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--one", nargs=4, type=int)
    ap.add_argument("--sweep", default=None)
    ap.add_argument("--iters", type=int, default=50)
    ap.add_argument("--out", default="k8v4-splits-bench.jsonl")
    a = ap.parse_args()
    if a.one:
        one(*a.one[:3], iters=a.one[3], splits=os.environ.get("XE2_KV_TIME_SPLITS") == "1")
    else:
        sweep(a)
