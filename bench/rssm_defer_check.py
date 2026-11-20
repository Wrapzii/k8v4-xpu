"""Deferred RecoverSSM commit (K8V4_RSSM_DEFER_COMMIT) against the stock path, on the XPU: several decode steps of
verify + commit for a few requests in reused request slots, plain mode and align mode (prefix caching: block size 8,
so windows of up to 4 tokens cross and end on block boundaries and take the immediate commit), ragged windows and
accepted counts, two layers, fp16 / bf16 / fp32 state. Stock: verify -> GDNRecoverSSMCommitContext.commit. Deferred:
verify_deferred -> rssm_defer.commit. Every step's outputs must match bit for bit; after a last verify (which
materialises the pending records) every state block and conv block must match too.
usage: python3 rssm_defer_check.py LIB"""
from __future__ import annotations

import os
import sys

import torch
import vllm_xpu_kernels._xpu_C  # noqa: F401  (first, as in vLLM: its stock RecoverSSM kernel shares the SYCL kernel name)

from k8v4_v030 import rssm_defer
from k8v4_v030.rssm_gdn import GDNRecoverSSMCommitContext

torch.ops.load_library(sys.argv[1])
HK, HV, DK, DV = 16, 48, 128, 128
dev = 'xpu'
LAYERS = 2
SLOTS = 4
W = 4  # spec_query_len
CONV_DIM = 64


def verify(out, q, k, v, b, a, a_log, dt_bias, ssm, rep, loc, tok, si, slots, defer=None):
    """Reference: the stock verify; deferred: verify_deferred."""
    if defer is None:
        torch.ops._k8v4_rssm.verify(out, q, k, v, b, a, a_log, dt_bias, ssm, rep, loc, tok, si, slots, 0)
    else:
        torch.ops._k8v4_rssm.verify_deferred(out, q, k, v, b, a, a_log, dt_bias, ssm, rep, loc, tok, si, slots, 0,
                                             defer.pending, defer.parity)


def run_case(name, sdt, act, align, steps=7, seed=0, W=W, B=8):
    gen = torch.Generator(device='cpu').manual_seed(seed)

    def rnd(*shape, scale=1.0, dtype=act):
        return (torch.randn(*shape, generator=gen) * scale).to(dtype).to(dev)

    reqs = 3
    slots = torch.tensor([2, 0, 3], dtype=torch.int32, device=dev)
    width = 12
    nblk = 1 + reqs * width
    bt = torch.arange(1, nblk, dtype=torch.int32).view(reqs, width).to(dev)
    num_computed = [13, 6, 21]  # tokens already in the state per request
    si_of = lambda r: int(bt[r, (num_computed[r] - 1) // B]) if align else 1 + r * width
    ssm0 = [(torch.randn(nblk, HV, DV, DK, generator=gen) * 0.3).to(sdt).to(dev) for _ in range(LAYERS)]
    conv0 = [(torch.randn(nblk, CONV_DIM, 3 + W - 1, generator=gen)).to(act).to(dev) for _ in range(LAYERS)]
    ssm_r, ssm_d = [s.clone() for s in ssm0], [s.clone() for s in ssm0]
    conv_r, conv_d = [c.clone() for c in conv0], [c.clone() for c in conv0]
    rep_r = [torch.zeros(SLOTS, HV, W, DV + DK + 1, dtype=torch.float32, device=dev) for _ in range(LAYERS)]
    rep_d = [torch.zeros(2 * SLOTS, HV, W, DV + DK + 1, dtype=torch.float32, device=dev) for _ in range(LAYERS)]
    ctx_r = GDNRecoverSSMCommitContext.from_tensors(conv_r, ssm_r, rep_r, spec_query_len=W, max_num_reqs=SLOTS)
    ctx_d = GDNRecoverSSMCommitContext.from_tensors(conv_d, ssm_d, rep_d, spec_query_len=W, max_num_reqs=SLOTS)
    rssm_defer.attach(ctx_d, SLOTS)
    a_log = rnd(HV, dtype=torch.float32)
    dt_bias = rnd(HV, scale=0.5)
    ok = True
    deferred = immediate = 0
    for step in range(steps + 1):
        lens = [int(x) for x in torch.randint(1, W + 1, (reqs,), generator=gen)]
        T = sum(lens)
        loc = torch.tensor([0] + list(torch.tensor(lens).cumsum(0).tolist()), dtype=torch.int32, device=dev)
        q, k = rnd(T, HK, DK), rnd(T, HK, DK)
        v, b, a = rnd(T, HV, DV), rnd(T, HV), rnd(T, HV)
        tok = torch.arange(T, dtype=torch.int32, device=dev)
        si = torch.tensor([si_of(r) for r in range(reqs)], dtype=torch.int32, device=dev)
        outs_r, outs_d = [], []
        for li in range(LAYERS):
            o_r = torch.empty(T, HV, DV, dtype=act, device=dev)
            o_d = torch.empty_like(o_r)
            verify(o_r, q, k, v, b, a, a_log, dt_bias, ssm_r[li], rep_r[li], loc, tok, si, slots)
            verify(o_d, q, k, v, b, a, a_log, dt_bias, ssm_d[li], rep_d[li], loc, tok, si, slots,
                   ctx_d.k8v4_defer)
            outs_r.append(o_r)
            outs_d.append(o_d)
        same = all(torch.equal(x, y) for x, y in zip(outs_r, outs_d))
        ok &= same
        if not same:
            print('CHECK %s step %d outputs differ: max|d| %.3e' % (
                name, step, max((x.float() - y.float()).abs().max().item() for x, y in zip(outs_r, outs_d))))
        if step == steps:
            break
        acc = [int(torch.randint(1, n + 1, (1,), generator=gen)) for n in lens]
        acc_t = torch.tensor(acc, dtype=torch.int32, device=dev)
        kw = {}
        if align:
            kw = dict(block_table=bt, num_computed_tokens=torch.tensor(num_computed, dtype=torch.int32, device=dev),
                      mamba_block_size=B)
        ctx_r.commit(acc_t, si, loc, record_indices=slots, **kw)
        rssm_defer.commit(ctx_d, acc_t, si, loc, record_indices=slots, **kw)
        torch.xpu.synchronize()
        pend = ctx_d.k8v4_defer.pending.cpu().tolist()
        for r in range(reqs):
            if pend[int(slots[r])]:
                deferred += 1
            else:
                immediate += 1
            num_computed[r] += acc[r]
    torch.xpu.synchronize()
    st = all(torch.equal(x, y) for x, y in zip(ssm_r, ssm_d))
    cv = all(torch.equal(x, y) for x, y in zip(conv_r, conv_d))
    ok &= st and cv
    print('CHECK %-26s windows deferred %2d / immediate %2d: outputs, states, conv bit-identical %s (states %s, '
          'conv %s, state max|d| %.3e)' % (name, deferred, immediate, ok, st, cv,
                                           max((x.float() - y.float()).abs().max().item() for x, y in zip(ssm_r, ssm_d))),
          flush=True)
    return ok


ok = True
seed = 0
for sdt in (torch.float16, torch.bfloat16, torch.float32):
    for act in (torch.float16, torch.bfloat16):
        for align in (False, True):
            seed += 1
            ok &= run_case('%s state %s act %s' % (str(sdt).split('.')[-1], str(act).split('.')[-1],
                                                    'align' if align else 'plain'), sdt, act, align, seed=seed)
# deep copy drafting: windows of up to 16 tokens (the max_t = 16 kernel), align blocks of 32
for sdt in (torch.float16, torch.float32):
    for align in (False, True):
        seed += 1
        ok &= run_case('w16 %s state %s' % (str(sdt).split('.')[-1], 'align' if align else 'plain'), sdt,
                       torch.float16, align, seed=seed, W=16, B=32)
print('DEFER CHECK ALL bit-identical %s' % ok, flush=True)


MODES = ['stock', 'slm', 'defer']


def launch_floor():
    """48 back-to-back launches of a trivial kernel: the per-step launch cost every verify timing above includes."""
    x = torch.zeros(16, device=dev)
    for _ in range(5):
        x.add_(1)
    torch.xpu.synchronize()
    s, e = torch.xpu.Event(enable_timing=True), torch.xpu.Event(enable_timing=True)
    s.record()
    for _ in range(30 * 48):
        x.add_(1)
    e.record()
    torch.xpu.synchronize()
    print('LAUNCH 48 trivial kernels: %.3f ms per step' % (s.elapsed_time(e) / 30), flush=True)


def bench_step(reqs, drafts, acc_n, act):
    """GDN verify + commit per decode step, 48 layers in three commit groups of 16 (as vLLM groups them), fp16 state,
    real conv width; stock (verify + commit) against verify_slm + commit and the deferred pair, steady state."""
    gen = torch.Generator(device='cpu').manual_seed(reqs * 10 + drafts)
    Wn = drafts + 1
    T = reqs * Wn
    nblk = reqs + 1
    conv_dim = 2 * HK * DK + HV * DV
    rnd = lambda *s, scale=1.0, dtype=act: (torch.randn(*s, generator=gen) * scale).to(dtype).to(dev)
    q, k, v, b, a = rnd(T, HK, DK), rnd(T, HK, DK), rnd(T, HV, DV), rnd(T, HV), rnd(T, HV)
    a_log, dt_bias = rnd(HV, dtype=torch.float32), rnd(HV, scale=0.5)
    loc = torch.arange(0, T + 1, Wn, dtype=torch.int32, device=dev)
    tok = torch.arange(T, dtype=torch.int32, device=dev)
    si = torch.arange(1, reqs + 1, dtype=torch.int32, device=dev)
    slots = torch.arange(reqs, dtype=torch.int32, device=dev)
    acc = torch.full((reqs,), acc_n, dtype=torch.int32, device=dev)
    res = {}
    for mode in MODES:
        deferred = mode.endswith('defer')
        rows = 2 * reqs if deferred else reqs
        groups = []
        for g in range(3):
            ssm = [(torch.randn(nblk, HV, DV, DK, generator=gen) * 0.1).to(torch.float16).to(dev) for _ in range(16)]
            conv = [torch.zeros(nblk, conv_dim, 3 + Wn - 1, dtype=act, device=dev) for _ in range(16)]
            rep = [torch.zeros(rows, HV, Wn, DV + DK + 1, dtype=torch.float32, device=dev) for _ in range(16)]
            ctx = GDNRecoverSSMCommitContext.from_tensors(conv, ssm, rep, spec_query_len=Wn, max_num_reqs=reqs)
            if deferred:
                rssm_defer.attach(ctx, reqs)
            groups.append((ssm, rep, ctx))
        outs = [torch.empty(T, HV, DV, dtype=act, device=dev) for _ in range(48)]

        def step(mode=mode, groups=groups):
            for g, (ssm, rep, ctx) in enumerate(groups):
                for li in range(16):
                    o = outs[g * 16 + li]
                    if mode == 'stock':
                        torch.ops._k8v4_rssm.verify(o, q, k, v, b, a, a_log, dt_bias, ssm[li], rep[li], loc, tok, si,
                                                    slots, 0)
                    elif mode == 'slm':
                        torch.ops._k8v4_rssm.verify_slm(o, q, k, v, b, a, a_log, dt_bias, ssm[li], rep[li], loc, tok,
                                                        si, slots, 0)
                    elif mode == 'defer':
                        torch.ops._k8v4_rssm.verify_deferred(o, q, k, v, b, a, a_log, dt_bias, ssm[li], rep[li], loc,
                                                             tok, si, slots, 0, ctx.k8v4_defer.pending,
                                                             ctx.k8v4_defer.parity)
            for ssm, rep, ctx in groups:
                if deferred:
                    rssm_defer.commit(ctx, acc, si, loc, record_indices=slots)
                else:
                    ctx.commit(acc, si, loc, record_indices=slots)

        for _ in range(5):
            step()
        torch.xpu.synchronize()
        s, e = torch.xpu.Event(enable_timing=True), torch.xpu.Event(enable_timing=True)
        best = None
        for _ in range(3):
            s.record()
            for _ in range(30):
                step()
            e.record()
            torch.xpu.synchronize()
            best = min(best or 1e9, s.elapsed_time(e) / 30)
        res[mode] = best
    print('STEP %dx%d accept %d %s: verify+commit per step: ' % (reqs, drafts, acc_n, str(act).split('.')[-1])
          + ', '.join('%s %.3f ms' % kv for kv in res.items()), flush=True)


if os.environ.get('K8V4_RSSM_CHECK_ONLY') != '1':
    launch_floor()
for act in () if os.environ.get('K8V4_RSSM_CHECK_ONLY') == '1' else (torch.float16, torch.bfloat16):
    for reqs, drafts, acc_n in ((4, 3, 2), (1, 6, 3), (4, 3, 4), (2, 3, 2)):
        bench_step(reqs, drafts, acc_n, act)
print('DEFER_DONE', flush=True)
