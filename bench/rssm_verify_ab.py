"""A/B of the RecoverSSM verify ops in one libk8v4_rssm.so: torch.ops._k8v4_rssm.verify (stock v0.1.17 kernel) against
the variants named on the command line (e.g. verify_slm). Qwen3.8-27B GDN shapes (16 q/k heads, 48 value heads,
128 x 128), 48 layers of distinct state blocks, ms per decode step; then bit-identity of outputs and replay records
on ragged windows, a null-block row, token_indx remap and record rows, for fp16 / bf16 activations and fp16 / fp32
state.
usage: python3 rssm_verify_ab.py LIB OP [OP ...]"""
from __future__ import annotations

import os
import sys

import torch
import vllm_xpu_kernels._xpu_C  # noqa: F401  (loaded first, as in vLLM)

lib, ops = sys.argv[1], sys.argv[2:]
torch.ops.load_library(lib)
HK, HV, DK, DV = 16, 48, 128, 128
LAYERS = 48
dev = 'xpu'


def timeit(fn, n=40):
    for _ in range(5):
        fn()
    torch.xpu.synchronize()
    s, e = torch.xpu.Event(enable_timing=True), torch.xpu.Event(enable_timing=True)
    best = None
    for _ in range(3):
        s.record()
        for _ in range(n):
            fn()
        e.record()
        torch.xpu.synchronize()
        ms = s.elapsed_time(e) / n
        best = ms if best is None else min(best, ms)
    return best


def make(lens, act, sdt, seed, nblk=None, null_rows=(), remap=False, rec_rows=True):
    gen = torch.Generator(device='cpu').manual_seed(seed)

    def rnd(*shape, scale=1.0, dtype=act):
        return (torch.randn(*shape, generator=gen) * scale).to(dtype).to(dev)

    reqs = len(lens)
    T = sum(lens)
    W = max(lens)
    nblk = nblk or reqs + 2
    q, k = rnd(T, HK, DK), rnd(T, HK, DK)
    v = rnd(T, HV, DV)
    b, a = rnd(T, HV), rnd(T, HV)
    a_log = rnd(HV, dtype=torch.float32)
    dt_bias = rnd(HV, scale=0.5)
    loc = torch.tensor([0] + list(torch.tensor(lens).cumsum(0).tolist()), dtype=torch.int32, device=dev)
    tok = torch.randperm(T, generator=gen).to(torch.int32).to(dev) if remap else torch.arange(T, dtype=torch.int32,
                                                                                              device=dev)
    si = [i + 2 for i in range(reqs)]
    for r in null_rows:
        si[r] = 0
    si = torch.tensor(si, dtype=torch.int32, device=dev)
    rec = torch.tensor(list(range(reqs))[::-1], dtype=torch.int32, device=dev) if rec_rows else None
    rows = reqs if rec_rows else nblk
    return dict(q=q, k=k, v=v, b=b, a=a, a_log=a_log, dt_bias=dt_bias, loc=loc, tok=tok, si=si, rec=rec, rows=rows,
                W=W, T=T, nblk=nblk, sdt=sdt, gen=gen)


def run(op, d, ssm, rep, out):
    getattr(torch.ops._k8v4_rssm, op)(out, d['q'], d['k'], d['v'], d['b'], d['a'], d['a_log'], d['dt_bias'], ssm, rep,
                                      d['loc'], d['tok'], d['si'], d['rec'], 0)


def bench(reqs, drafts, act):
    d = make([drafts + 1] * reqs, act, torch.float16, reqs * 100 + drafts)
    ssms = [(torch.randn(d['nblk'], HV, DV, DK, generator=d['gen']) * 0.1).to(torch.float16).to(dev)
            for _ in range(LAYERS)]
    reps = [torch.zeros(d['rows'], HV, d['W'], DV + DK + 1, dtype=torch.float32, device=dev) for _ in range(LAYERS)]
    outs = [torch.empty(d['T'], HV, DV, dtype=act, device=dev) for _ in range(LAYERS)]
    res = {}
    for op in ['verify'] + ops:
        def step():
            for li in range(LAYERS):
                run(op, d, ssms[li], reps[li], outs[li])
        res[op] = timeit(step)
    floor = reqs * LAYERS * HV * DV * DK * 2 / 597e9 * 1e3
    print('BENCH %dx%d %s: ' % (reqs, drafts, str(act).split('.')[-1])
          + ', '.join('%s %.3f ms' % (op, ms) for op, ms in res.items())
          + ' per step (48 layers); state read floor %.3f ms' % floor, flush=True)


def check(name, lens, act, sdt, **kw):
    d = make(lens, act, sdt, 7 + len(lens) * 13 + sum(lens), **kw)
    ssm = (torch.randn(d['nblk'], HV, DV, DK, generator=d['gen']) * 0.3).to(sdt).to(dev)
    ref_out = torch.full((d['T'], HV, DV), 7.0, dtype=act, device=dev)
    ref_rep = torch.full((d['rows'], HV, d['W'], DV + DK + 1), 3.0, dtype=torch.float32, device=dev)
    run('verify', d, ssm, ref_rep, ref_out)
    ok_all = True
    for op in ops:
        out = torch.full_like(ref_out, 7.0)
        rep = torch.full_like(ref_rep, 3.0)
        s0 = ssm.clone()
        run(op, d, ssm, rep, out)
        torch.xpu.synchronize()
        same = torch.equal(out, ref_out) and torch.equal(rep, ref_rep) and torch.equal(s0, ssm)
        dmax = (out.float() - ref_out.float()).abs().max().item()
        ok_all &= same
        print('CHECK %-28s %-14s out max|d| %.3e  replay max|d| %.3e  bit-identical %s'
              % (name, op, dmax, (rep - ref_rep).abs().max().item(), same), flush=True)
    return ok_all


ok = True
for act in (torch.float16, torch.bfloat16):
    a = str(act).split('.')[-1]
    ok &= check('4x4 %s s16' % a, [4, 4, 4, 4], act, torch.float16)
    ok &= check('1x7 %s s16' % a, [7], act, torch.float16)
    ok &= check('ragged %s s16 remap' % a, [4, 1, 3, 2], act, torch.float16, remap=True)
    ok &= check('null row %s s32' % a, [4, 4, 4], act, torch.float32, null_rows=(1,))
    ok &= check('8 tok %s s16 no rec' % a, [8, 5], act, torch.float16, rec_rows=False)
    ok &= check('16 tok %s s16 deep' % a, [16, 9, 1, 16], act, torch.float16)
    ok &= check('16 tok %s s32 no rec' % a, [16, 12], act, torch.float32, rec_rows=False)
print('CHECK ALL bit-identical %s' % ok, flush=True)
CHECK_ONLY = os.environ.get('K8V4_RSSM_CHECK_ONLY') == '1'
for act in () if CHECK_ONLY else (torch.float16, torch.bfloat16):
    for reqs, drafts in ((4, 3), (1, 6), (2, 3), (3, 3)):
        bench(reqs, drafts, act)
print('AB_DONE', flush=True)
if hasattr(torch.ops._k8v4_rssm, 'verify_deferred') and not CHECK_ONLY:
    import runpy
    sys.argv = [sys.argv[0], lib]
    runpy.run_path(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'rssm_defer_check.py'), run_name='__main__')
