#!/usr/bin/env python3
"""Single-process isolated K8/V4 decode-attention sweep on the PRODUCTION library.

Fixture: one layer's paged KV built directly (random int8 K / int4 V, fixed seed),
sized for the largest context; shorter contexts pass the correct seq_len and a
block table of exactly ceil(ctx/64) pages. Batch b reuses the same physical pages
for each request (KV >> L2 at >=32K, so it is still DRAM traffic; noted).
Env knobs are re-read by the library per call, so they are toggled in-process:
XE2_KV_PARTIAL_FP16, XE2_KV_TIME_SPLITS (bench-only host-timed S1/S2 split,
parsed from fd2). Combined time = torch.xpu.Event around the op (splits off).
"""
import argparse, json, os, re, statistics as st, sys, tempfile, time
import torch
from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import PAGE, PageLayout
from k8v4_v030.ops_api import ops
from k8v4_v030.plan import workspace_programs
from k8v4_v030.scratch import Scratch

KVB = 396
RE = re.compile(r"\[xe2_kv_time\] s1_us=([\d.]+) s2_us=([\d.]+) n_splits=(\d+) seq0=(-?\d+) tq=(\d+)")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--ctx", default="131072,204800"); ap.add_argument("--batch", default="1,4")
    ap.add_argument("--qlen", default="7"); ap.add_argument("--pf16", default="0,1")
    ap.add_argument("--iters", type=int, default=30); ap.add_argument("--split-iters", type=int, default=10)
    ap.add_argument("--out", required=True); ap.add_argument("--device", default="xpu:0")
    a = ap.parse_args()
    ctxs = [int(x) for x in a.ctx.split(",")]; bs = [int(x) for x in a.batch.split(",")]
    qls = [int(x) for x in a.qlen.split(",")]; pfs = a.pf16.split(",")
    dev = torch.device(a.device); L = PageLayout(2); torch.manual_seed(1234)
    pages = (max(ctxs) + PAGE - 1) // PAGE
    raw = torch.randint(-127, 127, (pages * L.page_bytes,), dtype=torch.int8, device=dev)
    v = bind_regions(raw, L)
    v["k_scale"].uniform_(0.005, 0.02); v["v_scale"].uniform_(0.005, 0.02); v["v_zero"].fill_(8.0)
    nprog = workspace_programs(pages, 1, L)
    s = Scratch(dev, L, nprog_max=nprog, max_store_tokens=1, max_out_tokens=max(bs) * max(qls))
    errf = tempfile.TemporaryFile(mode="w+"); saved = os.dup(2); os.dup2(errf.fileno(), 2)
    out = open(a.out, "a")
    try:
        for ctx in ctxs:
            np_ = (ctx + PAGE - 1) // PAGE
            for b in bs:
                bt = torch.arange(np_, dtype=torch.int32, device=dev).repeat(b, 1).contiguous()
                sl = torch.full((b,), ctx, dtype=torch.int32, device=dev)
                w = workspace_programs(np_, 1, L)
                part, m, l, merged = s.workspace(w)
                for ql in qls:
                    q, o = s.attention_pair(b * ql); g = torch.Generator(device=dev).manual_seed(7)
                    q.copy_(torch.randn(q.shape, generator=g, device=dev, dtype=torch.float32).half())
                    call = lambda: ops().int8k_int4v_attn_batch(q, s.q8, s.q_scale, v["k"], v["k_scale"], v["v"],
                        v["v_scale"], v["v_zero"], bt, sl, s.visible, part, m, l, merged, o, ql, 1)
                    for pf in pfs:
                        os.environ["XE2_KV_PARTIAL_FP16"] = pf; os.environ.pop("XE2_KV_TIME_SPLITS", None)
                        for _ in range(5): call()
                        torch.xpu.synchronize()
                        ts = []
                        for _ in range(a.iters):
                            e0 = torch.xpu.Event(enable_timing=True); e1 = torch.xpu.Event(enable_timing=True)
                            e0.record(); call(); e1.record(); e1.synchronize(); ts.append(e0.elapsed_time(e1) * 1e3)
                        ref = o.float().clone()
                        os.environ["XE2_KV_TIME_SPLITS"] = "1"; sys.stderr.flush()
                        errf.seek(0); errf.truncate()
                        for _ in range(a.split_iters): call()
                        torch.xpu.synchronize(); os.environ.pop("XE2_KV_TIME_SPLITS")
                        os.fsync(2); errf.seek(0); sp = RE.findall(errf.read())
                        s1 = [float(x[0]) for x in sp]; s2 = [float(x[1]) for x in sp]
                        p50 = st.median(ts)
                        kv = b * ctx * KVB * 2
                        rows_live = 8 if ql * 6 <= 8 else ((ql * 6 + 7) // 8) * 8
                        ws = b * 2 * np_ * rows_live * 256 * (2 if pf == "1" else 4) * 2
                        r = {"ctx": ctx, "batch": b, "q_len": ql, "pf16": pf, "n": len(ts),
                             "p50_us": round(p50, 1), "p10_us": round(sorted(ts)[len(ts)//10], 1),
                             "p90_us": round(sorted(ts)[9*len(ts)//10], 1), "us_per_req": round(p50 / b, 1),
                             "s1_us_req_p50": round(st.median(s1), 1) if s1 else None,
                             "s2_us_req_p50": round(st.median(s2), 1) if s2 else None, "n_split": len(s1),
                             "est_kv_MB": round(kv / 1e6, 1), "est_ws_MB": round(ws / 1e6, 1),
                             "kv_gbps": round(kv / p50 / 1e3, 1), "kv_ws_gbps": round((kv + ws) / p50 / 1e3, 1),
                             "out_absmax": float(ref.abs().max()), "finite": bool(torch.isfinite(ref).all())}
                        if pf == pfs[0]: base = ref
                        else: r["max_abs_diff_vs_pf%s" % pfs[0]] = float((ref - base).abs().max())
                        out.write(json.dumps(r) + "\n"); out.flush()
                        os.write(saved, (json.dumps(r) + "\n").encode())
    finally:
        os.dup2(saved, 2)


if __name__ == "__main__":
    main()
