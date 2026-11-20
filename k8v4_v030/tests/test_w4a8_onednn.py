"""CPU checks for the opt-in s4 / grouped-scale W4A8 path (K8V4_W4A8_KERNEL=onednn)."""

from __future__ import annotations

import os
import unittest
from unittest.mock import patch

import torch

from k8v4_v030 import w4a8_prefill as gemm


class FlipTest(unittest.TestCase):
    def test_u4_with_zero_point_8_equals_s4_of_flipped_nibbles(self):
        signed = torch.randint(-8, 8, (6, 64), dtype=torch.int32)
        u4 = gemm.pack_signed_int4(signed)  # stored u4 = value + 8
        nibbles = (u4.unsqueeze(-1) >> torch.arange(0, 32, 4, dtype=torch.int32)) & 0xF
        self.assertTrue(torch.equal(nibbles.reshape(6, 64) - 8, signed))
        flipped = gemm.flip_to_s4(u4.clone())
        n = (flipped.unsqueeze(-1) >> torch.arange(0, 32, 4, dtype=torch.int32)) & 0xF
        s4 = torch.where(n >= 8, n - 16, n).reshape(6, 64)
        self.assertTrue(torch.equal(s4, signed))
        self.assertTrue(torch.equal(gemm.flip_to_s4(flipped), u4))


class ParseTest(unittest.TestCase):
    def test_kernel_and_group(self):
        self.assertEqual(gemm.parse_kernel(None), "xpu")
        self.assertEqual(gemm.parse_kernel("onednn"), "onednn")
        with self.assertRaises(RuntimeError):
            gemm.parse_kernel("b70")
        self.assertEqual(gemm.parse_agroup(None, "xpu"), 0)
        self.assertEqual(gemm.parse_agroup("64", "onednn"), 64)
        for bad, kernel in (("64", "xpu"), ("48", "onednn"), ("x", "onednn")):
            with self.assertRaises(RuntimeError):
                gemm.parse_agroup(bad, kernel)

    def test_onednn_without_library_fails_loudly(self):
        previous = (gemm._RUNTIME_ENABLED, gemm._LAYERS, gemm._KERNEL, gemm._AGROUP)
        try:
            env = {"K8V4_PREFILL_GEMM": "w4a8", "K8V4_W4A8_KERNEL": "onednn",
                   "K8V4_W4A8_LIB": "/nonexistent/libk8v4_w4a8.so"}
            with patch.object(gemm, "install"), patch.dict(os.environ, env):
                with self.assertRaises(RuntimeError):
                    gemm.install_if_requested()
            with patch.object(gemm, "install"), patch.dict(os.environ, {"K8V4_PREFILL_GEMM": "w4a8"}):
                os.environ.pop("K8V4_W4A8_KERNEL", None)
                os.environ.pop("K8V4_W4A8_AGROUP", None)
                gemm.install_if_requested()
                self.assertEqual((gemm._KERNEL, gemm._AGROUP), ("xpu", 0))
        finally:
            gemm._RUNTIME_ENABLED, gemm._LAYERS, gemm._KERNEL, gemm._AGROUP = previous


class GroupedQuantTest(unittest.TestCase):
    def test_grouped_scales_and_reconstruction(self):
        x = torch.randn(5, 256)
        x[:, 3] *= 50  # one large channel coarsens only its own group
        q, s = gemm._quantize_grouped(x, 64)
        self.assertEqual((q.dtype, tuple(q.shape)), (torch.int8, (5, 256)))
        self.assertEqual((s.dtype, tuple(s.shape)), (torch.float16, (5, 4)))
        back = q.to(torch.float32).reshape(5, 4, 64) * s.to(torch.float32).unsqueeze(-1)
        err = (back.reshape(5, 256) - x).abs()
        self.assertLess(float(err[:, 64:].max()), float(err[:, :64].max()))
        self.assertLess(float(err.max()), float(x.abs().max()) / 127)


class S4DispatchTest(unittest.TestCase):
    def run_body(self, rows, enabled=True, agroup=0, dtype=torch.bfloat16):
        seen = []

        class Ops:
            @staticmethod
            def int4_gemm_w4a16(a, b, s, zp, g):
                seen.append(("w4a16", a.shape[0], zp))
                return torch.zeros(a.shape[0], b.shape[1], dtype=a.dtype)

            @staticmethod
            def int4_gemm_w4a8(a, a_s, a_zp, b, s, zp, g, accum, bf16_out):
                seen.append(("w4a8", a.shape[0], tuple(a_s.shape), a_zp, zp, bf16_out))
                return torch.zeros(a.shape[0], b.shape[1],
                                   dtype=torch.bfloat16 if bf16_out else torch.float16)

        packed = torch.zeros(4, 5, dtype=torch.int32)
        zeros = torch.empty(0, dtype=torch.int8)
        with patch.object(gemm, "_lib", lambda: Ops), \
             patch.object(gemm, "_RUNTIME_ENABLED", enabled), \
             patch.object(gemm, "_AGROUP", agroup), \
             patch.object(gemm, "_QUANT_COMPILED", gemm._quantize_stored), \
             patch.object(gemm, "_GROUPED_COMPILED", gemm._quantize_grouped):
            out = gemm._runtime_mlp_body(torch.ones(rows, 128, dtype=dtype), packed,
                                         torch.ones(1, 5), zeros, 128, None)
        self.assertEqual(out.dtype, dtype)
        self.assertEqual(tuple(out.shape), (rows, 5))
        return seen

    def test_small_rows_take_library_w4a16(self):
        self.assertEqual(self.run_body(7), [("w4a16", 7, None)])
        self.assertEqual(self.run_body(4224, enabled=False), [("w4a16", 4224, None)])

    def test_large_rows_take_library_w4a8_without_zero_points(self):
        self.assertEqual(self.run_body(129), [("w4a8", 129, (129, 1), None, None, True)])
        self.assertEqual(self.run_body(129, agroup=64), [("w4a8", 129, (129, 2), None, None, True)])
        self.assertEqual(self.run_body(129, dtype=torch.float16),
                         [("w4a8", 129, (129, 1), None, None, False)])


class LoaderTest(unittest.TestCase):
    def test_process_weights_flips_only_selected_symmetric_layers(self):
        class Config:
            zero_points = False
            group_size = 128

        class Kernel:
            w_q_name = "qweight"
            w_s_name = "scales"
            w_zp_name = "qzeros"
            config = Config()

            def process_weights_after_loading(self, layer):
                layer.qzeros = torch.tensor([8], dtype=torch.int8)

            def apply_weights(self, layer, x, bias=None):
                return None

        class Layer:
            def __init__(self, prefix):
                self.prefix = prefix
                self.qweight = torch.full((2, 2), 0x77777777, dtype=torch.int32)

        gemm._install_s4_loader(Kernel)
        k = Kernel()
        with patch.object(gemm, "_KERNEL", "onednn"), patch.object(gemm, "_LAYERS", frozenset(("mlp", "attn"))):
            mlp, gdn = Layer("model.layers.0.mlp.down_proj"), Layer("model.layers.0.linear_attn.out_proj")
            k.process_weights_after_loading(mlp)
            k.process_weights_after_loading(gdn)
        self.assertTrue(getattr(mlp, "_k8v4_s4", False))
        self.assertEqual(mlp.qzeros.numel(), 0)
        self.assertTrue(torch.equal(mlp.qweight, torch.full((2, 2), -1, dtype=torch.int32)))
        self.assertFalse(hasattr(gdn, "_k8v4_s4"))
        self.assertEqual(int(gdn.qweight[0, 0]), 0x77777777)
        with patch.object(gemm, "_KERNEL", "xpu"):
            plain = Layer("model.layers.0.mlp.down_proj")
            k.process_weights_after_loading(plain)
        self.assertFalse(hasattr(plain, "_k8v4_s4"))


if __name__ == "__main__":
    unittest.main()
