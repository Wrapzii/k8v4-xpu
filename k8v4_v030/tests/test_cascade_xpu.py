"""Exclusive-window GPU test: shared-prefix cascade vs the serial attn_batch op.

DO NOT RUN while production (vllm-k8v4-tp2) or the sweep owns the GPUs.
Needs ~1.6 GB on ONE GPU at the defaults (cache ~0.63 GB, partials ~0.42 GB,
cascade extra ~0.48 GB).

  # 1) candidate library: serial op vs cascade op in one process (+ graph replay check)
  XE2_KV_LIB=<cand.so> python3 test_cascade_xpu.py --save cand.pt
  # 2) production library (current kernel), serial op only
  XE2_KV_LIB=/opt/k8v4/libxe2_kv.so python3 test_cascade_xpu.py --serial-only --save prod.pt
  # 3) bitwise / max-abs / max-rel of cascade vs the CURRENT production kernel
  python3 test_cascade_xpu.py --compare prod.pt cand.pt
"""

from __future__ import annotations

import argparse, json, os, sys, time


import torch

from k8v4_v030 import cascade as casc_mod
from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import D, PAGE, PageLayout
from k8v4_v030.ops_api import ops
from k8v4_v030.plan import workspace_programs
from k8v4_v030.scratch import Scratch

TP2 = PageLayout(2)


def stats(a: torch.Tensor, b: torch.Tensor) -> dict:
    a = a.float(); b = b.float()
    d = (a - b).abs()
    rel = d / a.abs().clamp_min(1e-3)
    return {"bitwise_equal": bool(torch.equal(a, b)), "n_diff": int((d != 0).sum()),
            "max_abs": float(d.max()), "max_rel": float(rel.max()),
            "finite": bool(torch.isfinite(b).all())}


def make_case(gen, B, seq0, ratio, share, q_len, pool_blocks):
    bt_tok = PAGE * ratio
    seqs = [seq0 + 50 + 37 * i for i in range(B)]
    nblk = [(s + bt_tok - 1) // bt_tok for s in seqs]
    width = max(nblk)
    n_shared = int(share * (seq0 // bt_tok))
    perm = torch.randperm(pool_blocks - 1, generator=gen)[: n_shared + sum(nblk)] + 1
    shared = perm[:n_shared].tolist(); nxt = n_shared
    bt = torch.zeros((B, width), dtype=torch.int32)
    for i in range(B):
        row = list(shared)
        while len(row) < nblk[i]:
            row.append(int(perm[nxt])); nxt += 1
        bt[i, : nblk[i]] = torch.tensor(row, dtype=torch.int32)
    return bt, torch.tensor(seqs, dtype=torch.int32), torch.randn((B * q_len, TP2.hq, D), generator=gen).half()


def _production_env() -> None:
    """Production env + cascade on (the serial op ignores XE2_KV_CASCADE). Applied in main()
    rather than at import so test collection does not leak these flags into other tests."""
    for k, v in {"XE2_KV_PARTIAL_FP16": "1", "XE2_KV_COMPACT_SLM": "1", "XE2_KV_S2_NSG_DRAFT": "32",
                 "XE2_KV_S2_NSG_VERIFY": "8", "XE2_KV_S2_TWO_PASS": "0", "XE2_KV_CASCADE": "1"}.items():
        os.environ.setdefault(k, v)


def main():
    _production_env()
    ap = argparse.ArgumentParser()
    ap.add_argument("--seq", type=int, default=200000)
    ap.add_argument("--batch", type=int, default=4)
    ap.add_argument("--ratios", default="1")
    ap.add_argument("--qlens", default="1,7")
    ap.add_argument("--shares", default="1.0,0.98,0.9,0.0")
    ap.add_argument("--iters", type=int, default=30)
    ap.add_argument("--device", type=int, default=0)
    ap.add_argument("--serial-only", action="store_true")
    ap.add_argument("--save")
    ap.add_argument("--compare", nargs=2)
    ap.add_argument("--min-free-gb", type=float, default=2.5)
    a = ap.parse_args()
    if a.compare:
        ref, cand = (torch.load(p) for p in a.compare)
        res = {k: stats(ref[k]["serial"], cand[k]["cascade"]) for k in ref if k in cand}
        res.update({k + "/cand_serial": stats(ref[k]["serial"], cand[k]["serial"]) for k in ref if k in cand})
        print(json.dumps(res, indent=1)); return 0 if all(v["bitwise_equal"] for v in res.values()) else 1
    dtype_dev = os.environ.get("K8V4_TEST_DEVICE", "xpu")
    dev = torch.device(dtype_dev, a.device) if dtype_dev == "xpu" else torch.device("cpu")
    if dev.type == "xpu": torch.xpu.set_device(a.device)
    def sync():
        if dev.type == "xpu": torch.xpu.synchronize()
    try:
        free, total = torch.xpu.mem_get_info(a.device)
        print(f"free {free/2**30:.2f} GiB of {total/2**30:.2f}")
        if free < a.min_free_gb * 2**30:
            print("refusing: not enough free GPU memory (is production still up?)"); return 2
    except Exception as e:
        print("mem_get_info unavailable:", e)
    has_casc = hasattr(ops(), "int8k_int4v_attn_batch_cascade") and not a.serial_only
    print("library", os.environ.get("XE2_KV_LIB"), "has_cascade_op", has_casc, flush=True)
    out = {}
    for ratio in [int(x) for x in a.ratios.split(",")]:
        gen = torch.Generator().manual_seed(1234 + ratio)
        pool_blocks = a.batch * ((a.seq + 300 + PAGE * ratio - 1) // (PAGE * ratio)) + 8
        raw = torch.zeros(pool_blocks * ratio * TP2.page_bytes, dtype=torch.int8, device=dev)
        views = bind_regions(raw, TP2)
        # Deterministic CPU-generated contents, so different processes/GPUs see identical caches.
        cg = torch.Generator().manual_seed(4321 + ratio)
        npg = int(views["k"].shape[0]); CH = 1024
        for p0 in range(0, npg, CH):
            p1 = min(npg, p0 + CH)
            for name, kind in (("k", ("int", -127, 128)), ("k_scale", ("u", 0.002, 0.03)), ("v", ("int", 0, 256)),
                               ("v_scale", ("u", 0.002, 0.03)), ("v_zero", ("u", 6.0, 9.0))):
                dst = views[name][p0:p1]
                if kind[0] == "int":
                    src = torch.randint(kind[1], kind[2], tuple(dst.shape), generator=cg, dtype=torch.int16).to(dst.dtype)
                else:
                    src = torch.rand(tuple(dst.shape), generator=cg) * (kind[2] - kind[1]) + kind[1]
                dst.copy_(src.to(dst.dtype))
        sync()
        for q_len in [int(x) for x in a.qlens.split(",")]:
            for share in [float(x) for x in a.shares.split(",")]:
                bt, sl, q = make_case(gen, a.batch, a.seq, ratio, share, q_len, pool_blocks)
                bt, sl, q = bt.to(dev), sl.to(dev), q.to(dev)
                nprog = workspace_programs(int(bt.shape[1]), ratio, TP2)
                sc = Scratch(dev, TP2, nprog_max=nprog, max_store_tokens=1, max_out_tokens=int(q.shape[0]))
                qb, ob = sc.attention_pair(int(q.shape[0])); qb.copy_(q)
                pw, mw, lw, mg = sc.workspace(nprog)
                base = (qb, sc.q8, sc.q_scale, views["k"], views["k_scale"], views["v"], views["v_scale"],
                        views["v_zero"], bt, sl, sc.visible, pw, mw, lw, mg, ob, q_len, ratio)
                def serial():
                    ops().int8k_int4v_attn_batch(*base)
                cs = casc_mod.CascadeScratch(dev, TP2.hkv, a.batch, int(os.environ.get("K8V4_CASCADE_VERIFY_PAGES", 3200)))
                def cascade():
                    ops().int8k_int4v_attn_batch_cascade(*base, cs.q8, cs.qsc, cs.plan, cs.part, cs.m, cs.l, cs.cap, cs.slot_rows)
                key = f"q{q_len}/share{share}/B{a.batch}/seq{a.seq}/r{ratio}"
                rec = {}
                pw.fill_(float("nan")); mw.fill_(float("nan")); lw.fill_(float("nan"))
                serial(); sync(); rec["serial"] = ob.detach().cpu().clone()
                fns = [("serial", serial)]
                if has_casc:
                    pw.fill_(float("nan")); mw.fill_(float("nan")); lw.fill_(float("nan")); cs.part.fill_(float("nan"))
                    cascade(); sync(); rec["cascade"] = ob.detach().cpu().clone()
                    rec["plan"] = cs.plan.cpu().tolist()[:2 + a.batch]
                    fns.append(("cascade", cascade))
                for name, fn in fns:
                    for _ in range(3): fn()
                    sync(); t0 = time.perf_counter()
                    for _ in range(a.iters): fn()
                    sync(); rec[f"ms_{name}"] = (time.perf_counter() - t0) * 1e3 / a.iters
                line = {k: v for k, v in rec.items() if not torch.is_tensor(v)}
                if has_casc:
                    line.update(stats(rec["serial"], rec["cascade"]))
                    # Graph replay: capture once, then change block table contents in place.
                    try:
                        g = torch.xpu.XPUGraph()
                        s = torch.xpu.Stream()
                        with torch.xpu.stream(s):
                            cascade(); sync()
                            with torch.xpu.graph(g):
                                cascade()
                        bt2, sl2, _ = make_case(torch.Generator().manual_seed(99), a.batch, a.seq, ratio, 0.5, q_len, pool_blocks)
                        bt.copy_(bt2.to(dev)); sl.copy_(sl2.to(dev))
                        serial(); sync(); ref2 = ob.detach().cpu().clone()
                        g.replay(); sync()
                        line["graph_replay_bitwise"] = bool(torch.equal(ref2, ob.cpu()))
                        line["graph_plan"] = cs.plan.cpu().tolist()[:2 + a.batch]
                    except Exception as e:  # graph API differs across torch builds
                        line["graph_replay_bitwise"] = f"skipped: {e}"
                print(key, json.dumps(line), flush=True)
                out[key] = rec
                del sc, cs
        del raw, views
        if dev.type == "xpu": torch.xpu.empty_cache()
    if a.save:
        torch.save(out, a.save)
    return 0


if __name__ == "__main__":
    sys.exit(main())
