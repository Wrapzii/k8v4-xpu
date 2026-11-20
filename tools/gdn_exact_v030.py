"""Bit-identity and timing check for a replacement libgdn_attn_kernels_xe_2.so (K8V4_GDN_HEADS).

The library is loaded by vllm_xpu_kernels._xpu_C, so two builds cannot share
one process: run this once per library (stock image, then with the patched
file mounted over the image's copy) and compare the saves.
Runs the fused prefill op torch.ops._xpu_C.gdn_attention on fixed random
inputs with Qwen3.8-27B GDN shapes (16 K heads, 48 V heads, dim 128), single
and multi-sequence, with and without initial state, and saves out / conv
state / ssm state.

usage: gdn_exact_v030.py run OUT.pt | cmp A.pt B.pt
"""
from __future__ import annotations

import sys
import time

import torch

HK, HV, DK, DV, KS = 16, 48, 128, 128, 4
CONV = 2 * HK * DK + HV * DV
CASES = (
    ('1x65', [65], [0]),
    ('1x200', [200], [0]),
    ('1x508', [508], [0]),
    ('1x2047', [2047], [0]),
    ('1x8192', [8192], [0]),
    ('3x(100,300,37)', [100, 300, 37], [0, 1, 0]),
    ('2x(64,1000)init', [64, 1000], [1, 1]),
    ('8x mixed', [5, 64, 65, 127, 128, 129, 700, 33], [0, 1, 0, 1, 0, 1, 0, 1]),
)


def compare(a_path: str, b_path: str) -> int:
    a, b = torch.load(a_path), torch.load(b_path)
    bad = 0
    for name in a:
        for i, (x, y) in enumerate(zip(a[name], b[name])):
            same = torch.equal(x, y)
            diff = (x.float() - y.float()).abs().max().item()
            bad += not same
            print('%-20s %-10s %s maxdiff %.3g' % (name, ('out', 'conv_state', 'ssm_state')[i],
                                                   'BITWISE-EQUAL' if same else 'DIFFERS', diff))
    print('CMP_RESULT', 'ALL_EQUAL' if bad == 0 else '%d DIFFER' % bad)
    return 0 if bad == 0 else 1


def run(out_path: str) -> int:
    import vllm_xpu_kernels._xpu_C  # noqa: F401  registers torch.ops._xpu_C
    dev = 'xpu'
    gen = torch.Generator(device='cpu').manual_seed(1234)

    def rnd(*shape, scale=1.0, dtype=torch.float16):
        return (torch.randn(*shape, generator=gen) * scale).to(dtype).to(dev)

    conv_w = rnd(CONV, KS, scale=0.3)
    a_log = rnd(HV, dtype=torch.float32)
    dt_bias = rnd(HV, scale=0.5)
    saved = {}
    for name, lens, init in CASES:
        tokens, batch = sum(lens), len(lens)
        qkvz = rnd(tokens, 2 * HK * DK + 2 * HV * DV)
        ba = rnd(tokens, 2 * HV)
        conv0 = rnd(batch + 1, KS - 1, CONV, scale=0.5)
        ssm0 = rnd(batch + 1, HV, DK, DV, scale=0.1)
        loc = torch.tensor([0] + torch.tensor(lens).cumsum(0).tolist(), dtype=torch.int32, device=dev)
        has_init = torch.tensor(init, dtype=torch.bool, device=dev)
        idx = torch.arange(1, batch + 1, dtype=torch.int32, device=dev)

        def call():
            out = torch.zeros(tokens, HV, DV, dtype=torch.float16, device=dev)
            z = torch.zeros(tokens, HV, DV, dtype=torch.float16, device=dev)
            conv, ssm = conv0.clone(), ssm0.clone()
            torch.ops._xpu_C.gdn_attention(out, z, qkvz, ba, HK, HV, DK, DV, conv, ssm, conv_w, None, 'silu',
                                           a_log, dt_bias, batch, 0, 0, has_init, loc, None, idx, None, None,
                                           None, None, tokens, 1, False)
            return out, conv, ssm

        result = call()
        torch.xpu.synchronize()
        saved[name] = [t.cpu() for t in result]
        for _ in range(3):
            call()
        torch.xpu.synchronize()
        start = time.perf_counter()
        for _ in range(20):
            call()
        torch.xpu.synchronize()
        ms = (time.perf_counter() - start) / 20 * 1e3
        print('%-18s T=%5d  %.3f ms/call  (x48 layers = %.1f ms)' % (name, tokens, ms, ms * 48), flush=True)
    torch.save(saved, out_path)
    print('saved', out_path)
    return 0


def main(argv: list[str]) -> int:
    if len(argv) == 3 and argv[1] == 'run':
        return run(argv[2])
    if len(argv) == 4 and argv[1] == 'cmp':
        return compare(argv[2], argv[3])
    print(__doc__.strip().splitlines()[-1], file=sys.stderr)
    return 2


if __name__ == '__main__':
    sys.exit(main(sys.argv))
