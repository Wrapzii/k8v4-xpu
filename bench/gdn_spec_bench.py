"""Decode-step GDN cost on one B70: stock spec path (_xpu_C.gdn_attention, num_spec_decodes rows, a state written
per draft token) with a float32 vs float16 state, against the RecoverSSM verify (_k8v4_rssm.verify on the conv
output) plus its commit (k8v4_v030/rssm_gdn.py). Qwen3.8-27B GDN shapes (16 K heads, 48 V heads, dim 128),
bf16 activations, 48 layers' worth of distinct state blocks so nothing stays in L2.
usage: python3 gdn_spec_bench.py [RSSM_LIB]   (env K8V4_RSSM_LIB)"""
from __future__ import annotations

import os
import sys

import torch

import vllm_xpu_kernels._xpu_C  # noqa: F401

HK, HV, DK, DV, KS = 16, 48, 128, 128, 4
CONV = 2 * HK * DK + HV * DV
LAYERS = 48
dev = 'xpu'
gen = torch.Generator(device='cpu').manual_seed(7)


def rnd(*shape, scale=1.0, dtype=torch.bfloat16):
    return (torch.randn(*shape, generator=gen) * scale).to(dtype).to(dev)


def timeit(fn, n=20):
    for _ in range(3):
        fn()
    torch.xpu.synchronize()
    s, e = torch.xpu.Event(enable_timing=True), torch.xpu.Event(enable_timing=True)
    s.record()
    for _ in range(n):
        fn()
    e.record()
    torch.xpu.synchronize()
    return s.elapsed_time(e) / n  # ms per call of fn (= one step over LAYERS layers)


def case(reqs: int, k: int):
    T = reqs * (k + 1)
    nblk = reqs * (k + 1) + 1
    conv_w = rnd(CONV, KS, scale=0.3)
    a_log = rnd(HV, dtype=torch.float32)
    dt_bias = rnd(HV, scale=0.5)
    qkvz = rnd(T, 2 * HK * DK + 2 * HV * DV)
    ba = rnd(T, 2 * HV)
    loc = torch.arange(0, T + 1, k + 1, dtype=torch.int32, device=dev)
    tok = torch.arange(T, dtype=torch.int32, device=dev)
    sidx = torch.arange(1, reqs * (k + 1) + 1, dtype=torch.int32, device=dev).view(reqs, k + 1).contiguous()
    nacc = torch.full((reqs,), k + 1, dtype=torch.int32, device=dev)
    res = {}
    for name, sdt in (('stock fp32 state', torch.float32), ('stock fp16 state', torch.float16)):
        convs = [rnd(nblk, KS - 1 + k, CONV, scale=0.5)
                 for _ in range(LAYERS)]
        ssms = [rnd(nblk, HV, DV, DK, scale=0.1, dtype=sdt) for _ in range(LAYERS)]
        out = torch.empty(T, HV, DV, dtype=torch.bfloat16, device=dev)
        z = torch.empty(T, HV, DV, dtype=torch.bfloat16, device=dev)

        def step():
            for li in range(LAYERS):
                torch.ops._xpu_C.gdn_attention(
                    out, z, qkvz, ba, HK, HV, DK, DV, conv_state=convs[li], ssm_state=ssms[li],
                    conv_weights=conv_w, conv_bias=None, activation='silu', A_log=a_log, dt_bias=dt_bias,
                    num_prefills=0, num_decodes=0, num_spec_decodes=reqs, has_initial_state=None,
                    non_spec_query_start_loc=None, non_spec_token_indx=None, non_spec_state_indices_tensor=None,
                    spec_query_start_loc=loc, spec_token_indx=tok, spec_state_indices_tensor=sidx,
                    num_accepted_tokens=nacc, num_actual_tokens=T, tp_size=1, reorder_input=True)
        res[name] = timeit(step)
    lib = sys.argv[1] if len(sys.argv) > 1 else os.environ.get('K8V4_RSSM_LIB', '')
    if lib:
        torch.ops.load_library(lib)
        from k8v4_v030.rssm_gdn import GDNRecoverSSMCommitContext
        nblk = reqs + 1
        for name, sdt in (('rssm fp16 state', torch.float16), ('rssm fp32 state', torch.float32)):
            convs = [rnd(nblk, KS - 1 + k, CONV, scale=0.5)
                     for _ in range(LAYERS)]
            ssms = [rnd(nblk, HV, DV, DK, scale=0.1, dtype=sdt) for _ in range(LAYERS)]
            reps = [torch.zeros(reqs, HV, k + 1, DV + DK + 1, dtype=torch.float32, device=dev) for _ in range(LAYERS)]
            ck = torch.arange(1, reqs + 1, dtype=torch.int32, device=dev)
            ck2 = ck.view(reqs, 1).expand(reqs, k + 1).contiguous()
            ones = torch.ones(reqs, dtype=torch.int32, device=dev)
            rec = torch.arange(reqs, dtype=torch.int32, device=dev)
            out = torch.empty(T, HV, DV, dtype=torch.bfloat16, device=dev)
            z = torch.empty(T, HV, DV, dtype=torch.bfloat16, device=dev)
            ctx = GDNRecoverSSMCommitContext.from_tensors(convs, ssms, reps, spec_query_len=k + 1, max_num_reqs=reqs,
                                                       conv_dim_first=False)
            acc = torch.full((reqs,), 2, dtype=torch.int32, device=dev)

            def verify():
                for li in range(LAYERS):
                    q, kk, v, b, a = torch.ops._xpu_C.causal_conv1d_spec(
                        z, qkvz, ba, HK, HV, DK, DV, convs[li], conv_w, None, 'silu', 0, 0, reqs, loc, tok, ck2, ones,
                        T, 1, True)
                    torch.ops._k8v4_rssm.verify(out, q, kk, v, b, a, a_log, dt_bias, ssms[li], reps[li], loc, tok,
                                                ck, rec, 0)

            def commit():
                ctx.commit(acc, ck, loc, record_indices=rec)

            res[name + ' verify'] = timeit(verify)
            res[name + ' commit'] = timeit(commit)
    return res


for reqs, k in ((4, 3), (1, 6)):
    r = case(reqs, k)
    print('%d requests x %d drafts (ms per decode step, %d GDN layers):' % (reqs, k, LAYERS))
    for name, ms in r.items():
        print('  %-28s %7.3f' % (name, ms))
