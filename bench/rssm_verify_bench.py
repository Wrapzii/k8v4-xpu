"""RecoverSSM verify kernel only (torch.ops._k8v4_rssm.verify), fp16 state, Qwen3.8-27B GDN shapes, 48 layers of
distinct state blocks; ms per decode step for 4 requests x 3 drafts and 1 x 6. Saves layer-0 outputs to
OUTDIR/out-VAR.pt and compares them with OUTDIR/out-base.pt when present.
usage: python3 bench/rssm_verify_bench.py LIB VAR OUTDIR"""
from __future__ import annotations

import os
import sys

import torch

import vllm_xpu_kernels._xpu_C  # noqa: F401

lib, var, outdir = sys.argv[1], sys.argv[2], sys.argv[3]
torch.ops.load_library(lib)
HK, HV, DK, DV, KS = 16, 48, 128, 128, 4
CONV = 2 * HK * DK + HV * DV
LAYERS = 48
dev = "xpu"


def timeit(fn, n=30):
    for _ in range(5):
        fn()
    torch.xpu.synchronize()
    s, e = torch.xpu.Event(enable_timing=True), torch.xpu.Event(enable_timing=True)
    s.record()
    for _ in range(n):
        fn()
    e.record()
    torch.xpu.synchronize()
    return s.elapsed_time(e) / n


saved = {}
for reqs, k in ((4, 3), (1, 6)):
    gen = torch.Generator(device="cpu").manual_seed(reqs * 100 + k)

    def rnd(*shape, scale=1.0, dtype=torch.bfloat16):
        return (torch.randn(*shape, generator=gen) * scale).to(dtype).to(dev)

    T = reqs * (k + 1)
    nblk = reqs + 1
    conv_w = rnd(CONV, KS, scale=0.3)
    a_log = rnd(HV, dtype=torch.float32)
    dt_bias = rnd(HV, scale=0.5)
    qkvz = rnd(T, 2 * HK * DK + 2 * HV * DV)
    ba = rnd(T, 2 * HV)
    loc = torch.arange(0, T + 1, k + 1, dtype=torch.int32, device=dev)
    tok = torch.arange(T, dtype=torch.int32, device=dev)
    ck = torch.arange(1, reqs + 1, dtype=torch.int32, device=dev)
    ck2 = ck.view(reqs, 1).expand(reqs, k + 1).contiguous()
    ones = torch.ones(reqs, dtype=torch.int32, device=dev)
    rec = torch.arange(reqs, dtype=torch.int32, device=dev)
    z = torch.empty(T, HV, DV, dtype=torch.bfloat16, device=dev)
    conv = rnd(nblk, KS - 1 + k, CONV, scale=0.5)
    q, kk, v, b, a = torch.ops._xpu_C.causal_conv1d_spec(z, qkvz, ba, HK, HV, DK, DV, conv, conv_w, None, "silu",
                                                          0, 0, reqs, loc, tok, ck2, ones, T, 1, True)
    q, kk, v, b, a = (x.clone() for x in (q, kk, v, b, a))
    ssms = [rnd(nblk, HV, DV, DK, scale=0.1, dtype=torch.float16) for _ in range(LAYERS)]
    reps = [torch.zeros(reqs, HV, k + 1, DV + DK + 1, dtype=torch.float32, device=dev) for _ in range(LAYERS)]
    outs = [torch.empty(T, HV, DV, dtype=torch.bfloat16, device=dev) for _ in range(LAYERS)]

    def verify():
        for li in range(LAYERS):
            torch.ops._k8v4_rssm.verify(outs[li], q, kk, v, b, a, a_log, dt_bias, ssms[li], reps[li], loc, tok,
                                        ck, rec, 0)

    ms = timeit(verify)
    torch.xpu.synchronize()
    saved["%dx%d" % (reqs, k)] = (outs[0].float().cpu(), reps[0].cpu())
    print("RSSM %s %d requests x %d drafts: verify %.3f ms per step (48 layers), %.1f us per layer"
          % (var, reqs, k, ms, ms * 1000 / LAYERS), flush=True)
os.makedirs(outdir, exist_ok=True)
torch.save(saved, os.path.join(outdir, "out-%s.pt" % var))
base = os.path.join(outdir, "out-base.pt")
if var != "base" and os.path.exists(base):
    ref = torch.load(base)
    for key, (o, r) in saved.items():
        ro, rr = ref[key]
        print("RSSM %s %s vs base: out max|d| %.3e (max|ref| %.3e), replay max|d| %.3e, bit-identical %s"
              % (var, key, (o - ro).abs().max().item(), ro.abs().max().item(), (r - rr).abs().max().item(),
                 bool(torch.equal(o, ro) and torch.equal(r, rr))), flush=True)
