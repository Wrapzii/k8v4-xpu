"""Microbench: post-attention add + Gemma RMSNorm + int8 quantizer, stock (vLLM XPU fused add-norm op, then the
Triton row/group quantizer) vs the fused K8V4_W4A8_FUSED=addnorm kernel. One B70, bf16, hidden 5120."""
from __future__ import annotations

import sys

import torch

sys.path.insert(0, "/src")
from k8v4_v030 import w4a8_triton as tr  # noqa: E402

import vllm._xpu_ops  # noqa: E402,F401  registers torch.ops.vllm.xpu_fused_add_gemma_rms_norm


def timeit(fn, n=50):
    for _ in range(5):
        fn()
    torch.xpu.synchronize()
    start, end = torch.xpu.Event(enable_timing=True), torch.xpu.Event(enable_timing=True)
    start.record()
    for _ in range(n):
        fn()
    end.record()
    torch.xpu.synchronize()
    return start.elapsed_time(end) / n


K = 5120
w = (torch.randn(K, device="xpu") * 0.2).to(torch.bfloat16)
for M in (4224, 8192):
    x0 = torch.randn(M, K, device="xpu").to(torch.bfloat16)
    r0 = torch.randn(M, K, device="xpu").to(torch.bfloat16)
    for group in (0, 64):
        def stock():
            x, r = x0.clone(), r0.clone()
            torch.ops.vllm.xpu_fused_add_gemma_rms_norm(x, r, w, 1e-6)
            return tr.quantize_groups(x, group) if group else tr.quantize_rows(x)

        def clones():
            return x0.clone(), r0.clone()

        def fused():
            return tr.addnorm_quantize(x0, r0, w, 1e-6, group)

        t_clone = timeit(clones)
        t_stock = timeit(stock) - t_clone
        t_fused = timeit(fused)
        # Agreement with the stock op's normed output.
        x, r = x0.clone(), r0.clone()
        torch.ops.vllm.xpu_fused_add_gemma_rms_norm(x, r, w, 1e-6)
        (q, s), ro = fused()
        q2, s2 = tr.quantize_groups(x, group) if group else tr.quantize_rows(x)
        print("ADDNORM M=%d group=%s stock %.3f ms fused %.3f ms (x64 layers: %.1f -> %.1f ms) "
              "residual_equal=%s codes_max_diff=%d scales_equal=%s"
              % (M, group or "token", t_stock, t_fused, 64 * t_stock, 64 * t_fused, torch.equal(ro, r),
                 int((q.int() - q2.int()).abs().max()), torch.equal(s, s2)), flush=True)
