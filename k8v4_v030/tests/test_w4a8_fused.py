"""CPU checks for the opt-in fused SiLU-and-mul quantizer (K8V4_W4A8_FUSED=silu)."""

from __future__ import annotations

import unittest
from unittest.mock import patch

import torch

from k8v4_v030 import w4a8_prefill as gemm


class ParseTest(unittest.TestCase):
    def test_parse_fused(self):
        self.assertEqual(gemm.parse_fused(None, "xpu", 0), frozenset())
        self.assertEqual(gemm.parse_fused("silu", "onednn", 64), frozenset(("silu",)))
        for raw, kernel, group in (("silu", "xpu", 0), ("silu", "onednn", 0), ("gelu", "onednn", 64)):
            with self.assertRaises(RuntimeError):
                gemm.parse_fused(raw, kernel, group)


class QuantTest(unittest.TestCase):
    def test_fused_equals_unfused_product_then_quant(self):
        gu = torch.randn(9, 256).to(torch.bfloat16)
        g, u = gu[:, :128].float(), gu[:, 128:].float()
        product = (torch.nn.functional.silu(g) * u).to(torch.bfloat16)
        q1, s1 = gemm._silu_quantize_grouped(gu, 64)
        q2, s2 = gemm._quantize_grouped(product, 64)
        self.assertTrue(torch.equal(q1, q2))
        self.assertTrue(torch.equal(s1, s2))


class DispatchTest(unittest.TestCase):
    def run_body(self, rows):
        seen = []

        class Ops:
            @staticmethod
            def int4_gemm_w4a16(a, b, s, zp, g):
                seen.append(("w4a16", a.shape))
                return torch.zeros(a.shape[0], b.shape[1], dtype=a.dtype)

            @staticmethod
            def int4_gemm_w4a8(a, a_s, a_zp, b, s, zp, g, accum, bf16_out):
                seen.append(("w4a8", a.shape, tuple(a_s.shape), bf16_out))
                return torch.zeros(a.shape[0], b.shape[1], dtype=torch.bfloat16)

        def silu_and_mul(gu):
            seen.append(("silu_and_mul", gu.shape))
            return gu[:, : gu.shape[1] // 2].clone()

        packed = torch.zeros(16, 5, dtype=torch.int32)
        with patch.object(gemm, "_lib", lambda: Ops), patch.object(gemm, "_RUNTIME_ENABLED", True), \
             patch.object(gemm, "_AGROUP", 64), patch.object(gemm, "_silu_and_mul", silu_and_mul), \
             patch.object(gemm, "_SILU_COMPILED", gemm._silu_quantize_grouped):
            out = gemm._silu_body(torch.ones(rows, 256, dtype=torch.bfloat16), packed, torch.ones(1, 5),
                                  torch.empty(0, dtype=torch.int8), 128)
        self.assertEqual((tuple(out.shape), out.dtype), ((rows, 5), torch.bfloat16))
        return seen

    def test_small_rows_unfused_large_rows_fused(self):
        self.assertEqual(self.run_body(7), [("silu_and_mul", (7, 256)), ("w4a16", (7, 128))])
        self.assertEqual(self.run_body(200), [("w4a8", (200, 128), (200, 2), True)])


class ForwardTest(unittest.TestCase):
    def test_only_marked_mlps_take_the_fused_op(self):
        class Kernel:
            w_q_name = "qweight"
            w_s_name = "scales"
            w_zp_name = "qzeros"

            class config:
                group_size = 128

        class Down:
            qweight = torch.zeros(5, 16, dtype=torch.int32)
            scales = torch.ones(1, 5)
            qzeros = torch.empty(0, dtype=torch.int8)

        class MLP:
            expert_gate = None

            def __init__(self, marked):
                self.down_proj = Down()
                if marked:
                    self.down_proj._k8v4_silu_kernel = Kernel()

            def gate_up_proj(self, x):
                return x, None

            def forward(self, x):
                return "stock"

        gemm._install_silu_mlp(MLP)
        gemm._install_silu_mlp(MLP)
        calls = []
        with patch.object(gemm, "runtime_silu_gemm", lambda *a: calls.append(a[4]) or "fused"):
            self.assertEqual(MLP(False).forward(torch.ones(2, 8)), "stock")
            self.assertEqual(MLP(True).forward(torch.ones(2, 8)), "fused")
        self.assertEqual(calls, [128])


def _gated_reference(x, z, weight, eps, orig_dtype, group_size=None, norm_before_gate=True, activation="silu"):
    x, z, w = x.float(), z.float(), weight.float()
    out = x * torch.rsqrt(x.pow(2).mean(dim=-1, keepdim=True) + eps) * w
    return (out * torch.nn.functional.silu(z)).to(orig_dtype)


class GnormTest(unittest.TestCase):
    def test_parse_accepts_gnorm(self):
        self.assertEqual(gemm.parse_fused("silu,gnorm", "onednn", 64), frozenset(("silu", "gnorm")))

    def test_gnorm_quant_and_dispatch(self):
        o = torch.randn(200, 4, 128).to(torch.bfloat16)
        z = torch.randn(200, 4, 128).to(torch.bfloat16)
        w = torch.rand(128).to(torch.bfloat16)
        seen = []

        class Ops:
            @staticmethod
            def int4_gemm_w4a16(a, b, s, zp, g):
                seen.append(("w4a16", tuple(a.shape)))
                return torch.zeros(a.shape[0], b.shape[1], dtype=a.dtype)

            @staticmethod
            def int4_gemm_w4a8(a, a_s, a_zp, b, s, zp, g, accum, bf16_out):
                seen.append(("w4a8", tuple(a.shape), tuple(a_s.shape)))
                return torch.zeros(a.shape[0], b.shape[1], dtype=torch.bfloat16)

        packed = torch.zeros(64, 5, dtype=torch.int32)
        with patch.object(gemm, "_GNORM_STATIC", _gated_reference), patch.object(gemm, "_lib", lambda: Ops), \
             patch.object(gemm, "_RUNTIME_ENABLED", True), patch.object(gemm, "_AGROUP", 64), \
             patch.object(gemm, "_GNORM_COMPILED", gemm._gnorm_quantize_grouped):
            q, s = gemm._gnorm_quantize_grouped(o, z, w, 1e-6, "silu", 64)
            q2, s2 = gemm._quantize_grouped(_gated_reference(o, z, w, 1e-6, o.dtype).reshape(200, 512), 64)
            self.assertTrue(torch.equal(q, q2) and torch.equal(s, s2))
            gemm._gnorm_body(o, z, w, 1e-6, "silu", packed, torch.ones(1, 5), torch.empty(0, dtype=torch.int8), 128)
            gemm._gnorm_body(o[:7], z[:7], w, 1e-6, "silu", packed, torch.ones(1, 5),
                             torch.empty(0, dtype=torch.int8), 128)
        self.assertEqual(seen, [("w4a8", (200, 512), (200, 8)), ("w4a16", (7, 512))])

    def test_gnorm_small_rows_one_triton_launch(self):
        """Decode-size rows take the Triton gated norm (one launch), never the eager forward_static."""
        o = torch.randn(7, 4, 128).to(torch.bfloat16)
        z = torch.randn(7, 4, 128).to(torch.bfloat16)
        w = torch.rand(128).to(torch.bfloat16)
        seen = []

        class Triton:
            @staticmethod
            def gnorm(o_, z_, w_, eps, activation):
                seen.append(("gnorm", tuple(o_.shape), activation))
                return _gated_reference(o_, z_, w_, eps, o_.dtype).reshape(o_.shape[0], -1)

        class Ops:
            @staticmethod
            def int4_gemm_w4a16(a, b, s, zp, g):
                seen.append(("w4a16", tuple(a.shape)))
                return torch.zeros(a.shape[0], b.shape[1], dtype=a.dtype)

        def no_static(*args):
            raise AssertionError("eager forward_static on decode rows")

        packed = torch.zeros(64, 5, dtype=torch.int32)
        with patch.object(gemm, "_GNORM_STATIC", no_static), patch.object(gemm, "_lib", lambda: Ops), \
             patch.object(gemm, "_RUNTIME_ENABLED", True), patch.object(gemm, "_AGROUP", 64), \
             patch.object(gemm, "_TRITON", Triton):
            gemm._gnorm_body(o, z, w, 1e-6, "silu", packed, torch.ones(1, 5), torch.empty(0, dtype=torch.int8), 128)
        self.assertEqual(seen, [("gnorm", (7, 4, 128), "silu"), ("w4a16", (7, 512))])


if __name__ == "__main__":
    unittest.main()
