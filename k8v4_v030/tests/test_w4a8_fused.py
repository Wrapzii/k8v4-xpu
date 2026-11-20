"""CPU checks for the opt-in fused quantizers (K8V4_W4A8_FUSED=silu,gnorm,addnorm)."""

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


def _gemma_reference(x, residual, weight, eps):
    """vLLM GemmaRMSNorm.forward_native with a residual, written out."""
    v = x.float() + residual.float()
    out = v * torch.rsqrt(v.pow(2).mean(dim=-1, keepdim=True) + eps) * (1.0 + weight.float())
    return out.to(x.dtype), v.to(x.dtype)


class AddnormTest(unittest.TestCase):
    def test_parse(self):
        self.assertEqual(gemm.parse_fused("addnorm", "onednn", 0), frozenset(("addnorm",)))
        self.assertEqual(gemm.parse_fused("silu,gnorm,addnorm", "onednn", 64),
                         frozenset(("silu", "gnorm", "addnorm")))
        for raw, kernel, group in (("addnorm", "xpu", 0), ("addnorm,silu", "onednn", 0),
                                   ("addnorm,addnorm", "onednn", 0)):
            with self.assertRaises(RuntimeError):
                gemm.parse_fused(raw, kernel, group)

    def test_fused_equals_norm_then_quant(self):
        x = torch.randn(9, 256).to(torch.bfloat16)
        r = torch.randn(9, 256).to(torch.bfloat16)
        w = (torch.randn(256) * 0.1).to(torch.bfloat16)
        normed, new_residual = gemm._addnorm_torch(x, r, w, 1e-6)
        ref, ref_residual = _gemma_reference(x, r, w, 1e-6)
        self.assertTrue(torch.equal(normed, ref) and torch.equal(new_residual, ref_residual))
        (q, s), res = gemm._addnorm_quantize(x, r, w, 1e-6, 64)
        q2, s2 = gemm._quantize_grouped(ref, 64)
        self.assertTrue(torch.equal(q, q2) and torch.equal(s, s2) and torch.equal(res, ref_residual))
        (q, s), res = gemm._addnorm_quantize(x, r, w, 1e-6, 0)
        q2, s2, _ = gemm._quantize_stored(ref)
        self.assertTrue(torch.equal(q, q2) and torch.equal(s, s2))

    def test_dispatch(self):
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

        packed = torch.zeros(32, 5, dtype=torch.int32)
        w = torch.zeros(256, dtype=torch.bfloat16)
        for group in (0, 64):
            with patch.object(gemm, "_lib", lambda: Ops), patch.object(gemm, "_RUNTIME_ENABLED", True), \
                 patch.object(gemm, "_AGROUP", group), patch.object(gemm, "_TRITON", None), \
                 patch.object(gemm, "_ADDNORM_COMPILED", gemm._addnorm_quantize), \
                 patch.object(gemm, "_QUANT_COMPILED", gemm._quantize_stored), \
                 patch.object(gemm, "_GROUPED_COMPILED", gemm._quantize_grouped):
                for rows in (200, 7):
                    x, r = torch.randn(rows, 256).to(torch.bfloat16), torch.randn(rows, 256).to(torch.bfloat16)
                    out, res = gemm._addnorm_body(x, r, w, 1e-6, packed, torch.ones(1, 5),
                                                  torch.empty(0, dtype=torch.int8), 128)
                    self.assertEqual((tuple(out.shape), out.dtype), ((rows, 5), torch.bfloat16))
                    self.assertTrue(torch.equal(res, (x.float() + r.float()).to(torch.bfloat16)))
        self.assertEqual(seen, [("w4a8", (200, 256), (200, 1)), ("w4a16", (7, 256)),
                                ("w4a8", (200, 256), (200, 4)), ("w4a16", (7, 256))])


_STOCK_FORWARD = """
    def forward(self, hidden_states, residual, positions, **kwargs):
        if residual is None:
            residual = hidden_states
            hidden_states = self.input_layernorm(hidden_states)
        else:
            hidden_states, residual = self.input_layernorm(hidden_states, residual)
        if self.layer_type == "linear_attention":
            hidden_states = self.linear_attn(hidden_states=hidden_states)
        elif self.layer_type == "full_attention":
            hidden_states = self.self_attn(
                hidden_states=hidden_states,
                positions=positions,
            )
        if self.layer_scale:
            pass
        hidden_states, residual = self.post_attention_layernorm(hidden_states, residual)
        if self.use_attn_reduce_scatter_for_moe:
            hidden_states = self.mlp(hidden_states, already_sequence_parallel=True)
        else:
            hidden_states = self.mlp(hidden_states)
        return hidden_states, residual
"""


class AddnormForwardTest(unittest.TestCase):
    def test_source_check(self):
        gemm.check_addnorm_source(_STOCK_FORWARD)
        with self.assertRaises(RuntimeError):
            gemm.check_addnorm_source(_STOCK_FORWARD.replace("self.post_attention_layernorm", "self.norm2"))

    def test_only_marked_layers_take_the_fused_op(self):
        class Kernel:
            w_q_name = "qweight"
            w_s_name = "scales"
            w_zp_name = "qzeros"

            class config:
                group_size = 128

        class Linear:
            qweight = torch.zeros(5, 16, dtype=torch.int32)
            scales = torch.ones(1, 5)
            qzeros = torch.empty(0, dtype=torch.int8)

            def __call__(self, x):
                return x[:, :5] * 0 + 3, None

        class MLP:
            expert_gate = None

            def __init__(self, marked):
                self.gate_up_proj = Linear()
                self.down_proj = Linear()
                if marked:
                    self.gate_up_proj._k8v4_addnorm_kernel = Kernel()

            def act_fn(self, x):
                return x

        class Norm:
            weight = torch.zeros(8)
            variance_epsilon = 1e-6

            def __call__(self, x, residual):
                return x, residual

        class Base:
            def forward(self, hidden_states, residual, positions, **kwargs):
                return "stock", residual

        class Layer(Base):
            layer_scale = False
            use_attn_reduce_scatter_for_moe = False
            layer_type = "linear_attention"

            def __init__(self, marked):
                self.mlp = MLP(marked)
                self.input_layernorm = Norm()
                self.post_attention_layernorm = Norm()

            def linear_attn(self, hidden_states):
                return hidden_states + 1

        with patch("inspect.getsource", lambda fn: _STOCK_FORWARD):
            gemm._install_addnorm(Layer, Base.forward)
            gemm._install_addnorm(Layer, Base.forward)
        calls = []

        def fused(x, residual, weight, eps, packed, scales, zeros, group_size):
            calls.append((tuple(x.shape), group_size))
            return torch.ones(x.shape[0], 16), residual + 2

        x, r = torch.ones(3, 8), torch.zeros(3, 8)
        with patch.object(gemm, "runtime_addnorm_gemm", fused):
            self.assertEqual(Layer(False).forward(x, r, None)[0], "stock")
            self.assertEqual(Layer(True).forward(x, None, None)[0], "stock")
            out, res = Layer(True).forward(x, r, None)
        self.assertEqual(calls, [((3, 8), 128)])
        self.assertTrue(torch.equal(out, torch.full((3, 5), 3.0)) and torch.equal(res, torch.full((3, 8), 2.0)))

        class Own(Base):
            def forward(self, hidden_states, residual, positions, **kwargs):
                return None

        with self.assertRaises(RuntimeError):
            gemm._install_addnorm(Own, Base.forward)

if __name__ == "__main__":
    unittest.main()
