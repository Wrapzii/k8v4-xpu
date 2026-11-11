"""Persistent adaptive harness: one process, 200K fixture resident, loops verifier variants
(selected per call via XE2_KV_VERIFY_MP_IMPL / XE2_KV_VERIFY_PAGES) in short reps.
Gated on vLLM idle (num_requests_running==0) per rep; draft q_len=1 P=1 timed each round as a
contention sentinel. Drops variants >5% slower than the P=1 baseline after round 1."""
import argparse, json, os, re, statistics as st, sys, tempfile, time, urllib.request
import torch
from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import PAGE, PageLayout
from k8v4_v030.ops_api import ops
from k8v4_v030.plan import workspace_programs
from k8v4_v030.scratch import Scratch
RE = re.compile(r"\[xe2_kv_time\] s1_us=([\d.]+) s2_us=([\d.]+)")
ap = argparse.ArgumentParser()
ap.add_argument("--ctx", type=int, default=204800); ap.add_argument("--variants", required=True)
ap.add_argument("--rounds", type=int, default=6); ap.add_argument("--iters", type=int, default=20)
ap.add_argument("--drop", type=float, default=1.05); ap.add_argument("--out", required=True)
ap.add_argument("--metrics", default="http://127.0.0.1:8100/metrics")
a = ap.parse_args()
def vllm_running():
    try:
        t = urllib.request.urlopen(a.metrics, timeout=2).read().decode()
        m = re.search(r"^vllm:num_requests_running\{[^}]*\} ([\d.]+)", t, re.M); return float(m.group(1)) if m else -1
    except Exception: return -1
def wait_idle(maxs=600):
    t0 = time.time(); ok = 0
    while time.time() - t0 < maxs:
        ok = ok + 1 if vllm_running() == 0 else 0
        if ok >= 2: return True
        time.sleep(1)
    return False
dev = torch.device("xpu:0"); L = PageLayout(2); torch.manual_seed(1234)
np_ = (a.ctx + PAGE - 1) // PAGE
raw = torch.randint(-127, 127, (np_ * L.page_bytes,), dtype=torch.int8, device=dev)
v = bind_regions(raw, L); v["k_scale"].uniform_(0.005, 0.02); v["v_scale"].uniform_(0.005, 0.02); v["v_zero"].fill_(8.0)
s = Scratch(dev, L, nprog_max=workspace_programs(np_, 1, L), max_store_tokens=1, max_out_tokens=7)
bt = torch.arange(np_, dtype=torch.int32, device=dev).view(1, -1).contiguous()
sl = torch.full((1,), a.ctx, dtype=torch.int32, device=dev)
part, m, l, merged = s.workspace(workspace_programs(np_, 1, L))
os.environ["XE2_KV_PARTIAL_FP16"] = "1"
def mk(ql):
    q, o = s.attention_pair(ql); g = torch.Generator(device=dev).manual_seed(7 + ql)
    q.copy_(torch.randn(q.shape, generator=g, device=dev, dtype=torch.float32).half())
    return q, o
QV = mk(7)
# Track H: reshape each page of packed V from [tok][head][128] to [chunk][tok][head][16]
# (COLS=32 consume order). Same bytes / same scales; stage-1 XF&128 reads this layout.
def reshuffle_v_cols32(v_u8):
    # v_u8: [pages, PAGE, HKV, 128] uint8
    pages, page, hkv, cols = v_u8.shape
    assert page == 64 and cols == 128
    nchunks = 8  # 256 dims / 32
    src = v_u8.reshape(pages, page, hkv, nchunks, 16)
    # -> [pages, nchunks, page, hkv, 16]
    dst = src.permute(0, 3, 1, 2, 4).contiguous()
    return dst.reshape(pages, page, hkv, cols)

V_SHUF = None  # lazy
def call(q, o, ql, use_vshuf=False):
    vv = v["v"]
    if use_vshuf:
        global V_SHUF
        if V_SHUF is None:
            V_SHUF = reshuffle_v_cols32(v["v"])
        vv = V_SHUF
    ops().int8k_int4v_attn_batch(q, s.q8, s.q_scale, v["k"], v["k_scale"], vv, v["v_scale"], v["v_zero"],
                                 bt, sl, s.visible, part, m, l, merged, o, ql, 1)
errf = tempfile.TemporaryFile(mode="w+"); saved = os.dup(2); os.dup2(errf.fileno(), 2)
def log(x): os.write(saved, (x + "\n").encode())
BASE_ENV = {k: os.environ.get(k) for k in ("XE2_KV_COMPACT_SLM", "XE2_KV_S2_NSG_VERIFY")}
def set_extra(extra):
    for k in ("XE2_KV_TEAM_MODE", "XE2_KV_REUSE_VAR", "XE2_KV_PARTIAL_I8", "XE2_KV_S2_FUSE", "XE2_KV_FUSE_STUB", "XE2_KV_XF", "XE2_KV_PP2", "XE2_KV_PERSIST_WG"): os.environ.pop(k, None)
    for k, val in BASE_ENV.items():
        if val is None: os.environ.pop(k, None)
        else: os.environ[k] = val
    for kv in filter(None, extra.split("+")):
        k, val = kv.split("=")
        if k == "XE2_KV_VSHUF":
            continue  # harness-only; kernel selected via XF&128
        os.environ[k] = val
def measure(impl, vpp, ql=7, extra=""):
    set_extra(extra if ql == 7 else "")
    os.environ["XE2_KV_VERIFY_MP_IMPL"] = str(impl); os.environ["XE2_KV_VERIFY_PAGES"] = str(vpp)
    use_vshuf = ("XE2_KV_VSHUF=1" in extra) if ql == 7 else False
    q, o = QV if ql == 7 else QD
    for _ in range(3): call(q, o, ql, use_vshuf=use_vshuf)
    torch.xpu.synchronize(); ts = []
    for _ in range(a.iters):
        e0 = torch.xpu.Event(enable_timing=True); e1 = torch.xpu.Event(enable_timing=True)
        e0.record(); call(q, o, ql, use_vshuf=use_vshuf); e1.record(); e1.synchronize(); ts.append(e0.elapsed_time(e1) * 1e3)
    out = o.float().clone()
    os.environ["XE2_KV_TIME_SPLITS"] = "1"; errf.seek(0); errf.truncate()
    for _ in range(6): call(q, o, ql, use_vshuf=use_vshuf)
    torch.xpu.synchronize(); os.environ.pop("XE2_KV_TIME_SPLITS"); os.fsync(2); errf.seek(0)
    sp = RE.findall(errf.read())
    return st.median(ts), st.median(float(x[0]) for x in sp), st.median(float(x[1]) for x in sp), out
QD = mk(1)
variants = [tuple((x.split(":") + [""])[:4]) for x in a.variants.split(",")]  # name:impl:vpp[:K=V+K=V]
alive = [vv for vv in variants]; res = {vv[0]: [] for vv in variants}
outf = open(a.out, "a"); ref = None; SENT = []
for rnd in range(a.rounds):
    for vv in list(alive):
        for tries in range(4):  # contamination retry: draft sentinel before/after must stay near its floor
            idle = wait_idle(); vr0 = vllm_running()
            d = measure(1, 1, ql=1)[0]                      # draft sentinel
            t, s1, s2, out = measure(int(vv[1]), int(vv[2]), extra=vv[3])
            d2 = measure(1, 1, ql=1)[0]; vr1 = vllm_running()
            SENT.append(min(d, d2)); floor = min(SENT)
            if max(d, d2) <= floor * 1.12: break
            log("CONTAMINATED %s try=%d sentinel %.1f/%.1f floor %.1f -> retry" % (vv[0], tries, d, d2, floor))
        if vv[1] == "1" or (vv[1] == "2" and vv[2] == "1"): pass
        if ref is None: ref = out   # first variant must be the baseline
        dmax = float((out - ref).abs().max()) if ref is not None else None
        r = {"round": rnd, "name": vv[0], "impl": int(vv[1]), "vpp": int(vv[2]), "extra": vv[3], "ctx": a.ctx, "q_len": 7, "batch": 1,
             "p50_us": round(t, 1), "s1_us": round(s1, 1), "s2_us": round(s2, 1), "draft_sentinel_us": round(d, 1),
             "idle_gate": idle, "vllm_running_before": vr0, "vllm_running_after": vr1, "maxabs_vs_P1": dmax,
             "finite": bool(torch.isfinite(out).all())}
        res[vv[0]].append(r); outf.write(json.dumps(r) + "\n"); outf.flush(); log(json.dumps(r))
    if rnd == 0 or rnd == 2:
        base = min(x["p50_us"] for x in res[variants[0][0]])
        keep = [variants[0]] + [vv for vv in alive[1:] if min(x["p50_us"] for x in res[vv[0]]) <= base * a.drop]
        for vv in alive:
            if vv not in keep: log("DROP %s best=%.1f base=%.1f" % (vv[0], min(x["p50_us"] for x in res[vv[0]]), base))
        alive = keep
log("SUMMARY")
base = min(x["p50_us"] for x in res[variants[0][0]])
for vv in variants:
    xs = res[vv[0]]; b = min(xs, key=lambda x: x["p50_us"])
    log("%-8s n=%d best=%.1f (s1 %.1f / s2 %.1f) median=%.1f x%.3f vs %s draft_at_best=%.1f" % (
        vv[0], len(xs), b["p50_us"], b["s1_us"], b["s2_us"], st.median(x["p50_us"] for x in xs), base / b["p50_us"], variants[0][0], b["draft_sentinel_us"]))
