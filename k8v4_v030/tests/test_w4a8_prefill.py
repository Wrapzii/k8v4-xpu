"""CPU checks for the length-gated W4A8 prefill patch."""

from __future__ import annotations

import os
import sys
import tempfile
import textwrap
import unittest
from pathlib import Path

import torch

from k8v4_v030.w4a8_prefill import (
    SMALL_M_MAX,
    activation_for_quant,
    install,
    pack_signed_int4,
    quantize_activation,
    remove_import_hook,
    reverse_nibble_order,
    scale_for_w4a8,
    unpack_signed_int4,
    wrap_kernel_module,
)


class PackTest(unittest.TestCase):
    def test_low_nibble_roundtrip_and_scale_orientation(self):
        weight = torch.randint(-8, 8, (6, 32), dtype=torch.int32)
        packed = pack_signed_int4(weight, low_nibble_first=True)
        self.assertEqual(tuple(packed.shape), (6, 4))
        self.assertTrue(torch.equal(unpack_signed_int4(packed, True), weight))
        reversed_pack = pack_signed_int4(weight, low_nibble_first=False)
        self.assertFalse(torch.equal(packed, reversed_pack))
        self.assertTrue(torch.equal(unpack_signed_int4(reversed_pack, False), weight))

        scales = torch.arange(12, dtype=torch.float32).reshape(3, 4)
        self.assertTrue(torch.equal(scale_for_w4a8(scales, "as_stored"), scales))
        swapped = scale_for_w4a8(scales, "transposed")
        self.assertEqual(tuple(swapped.shape), (4, 3))
        self.assertTrue(torch.equal(swapped, scales.transpose(0, 1)))
        low = pack_signed_int4(weight, True)
        high = pack_signed_int4(weight, False)
        self.assertTrue(torch.equal(reverse_nibble_order(low), high))
        self.assertTrue(torch.equal(reverse_nibble_order(high), low))
        values = torch.tensor([[-4.0, 1.0, 2.0, 8.0]], dtype=torch.float32)
        quantized, scale, zero = quantize_activation(values)
        self.assertEqual(quantized.dtype, torch.int8)
        self.assertEqual(zero.dtype, torch.int32)
        self.assertEqual(tuple(quantized.shape), (1, 4))
        expected_scale = 8.0 / 127.0
        self.assertAlmostEqual(float(scale.reshape(-1)[0]), expected_scale, places=5)
        reconstructed = quantized.to(torch.float32) * float(scale.reshape(-1)[0])
        self.assertLess(float((reconstructed - values).abs().max()), 0.05)


class ApplyGateTest(unittest.TestCase):
    def test_small_m_stays_on_w4a16_and_large_m_calls_w4a8(self):
        import k8v4_v030.w4a8_prefill as patch

        class Kernel:
            w_q_name = "qweight"
            w_s_name = "scales"
            w_zp_name = "qzeros"

            class config:
                group_size = 128

        class Layer:
            def __init__(self):
                self.qweight = torch.arange(16, dtype=torch.int32).reshape(4, 4)
                self.scales = torch.ones(2, 4)
                self.qzeros = torch.tensor([8], dtype=torch.int8)

        class Backend:
            pass

        seen = []
        original_quant = patch._quantize_stored
        original_gemm = patch.w4a8_gemm

        def quantize(activation):
            seen.append(("quant", tuple(activation.reshape(-1, activation.shape[-1]).shape)))
            rows = activation.reshape(-1, activation.shape[-1]).shape[0]
            return (
                torch.zeros(rows, activation.shape[1], dtype=torch.int8),
                torch.ones(rows, 1),
                torch.zeros(rows, 1, dtype=torch.int32),
            )

        def gemm(quant_x, x_scale, x_zero, packed, weight_scale, weight_zp, group_size, bias):
            seen.append(
                (
                    "gemm",
                    tuple(packed.shape),
                    tuple(packed.stride()),
                    packed.is_contiguous(),
                    tuple(weight_scale.shape),
                    group_size,
                )
            )
            return torch.zeros(quant_x.shape[0], packed.shape[1], dtype=torch.float16)

        def w4a16(self, layer, x, bias=None):
            seen.append(("w4a16", x.shape[0]))
            return torch.zeros(x.shape[0], 4)

        Backend.apply_weights = w4a16
        patch._install_on_class(Backend)
        layer = Layer()
        kernel = Kernel()
        activation = torch.zeros(SMALL_M_MAX + 8, 32, dtype=torch.bfloat16)
        try:
            patch._quantize_stored = quantize
            patch.w4a8_gemm = gemm
            small = Backend.apply_weights(kernel, layer, torch.zeros(SMALL_M_MAX, 32))
            large = Backend.apply_weights(kernel, layer, activation)
        finally:
            patch._quantize_stored = original_quant
            patch.w4a8_gemm = original_gemm

        self.assertEqual(small.shape[0], SMALL_M_MAX)
        self.assertEqual(large.dtype, torch.bfloat16)
        self.assertEqual(seen[0], ("w4a16", SMALL_M_MAX))
        self.assertEqual(seen[1][0], "quant")
        self.assertEqual(seen[1][1], (SMALL_M_MAX + 8, 32))
        self.assertEqual(seen[2][0], "gemm")
        self.assertEqual(seen[2][1], (4, 4))
        self.assertEqual(seen[2][2], tuple(layer.qweight.transpose(0, 1).stride()))
        self.assertFalse(seen[2][3])
        self.assertEqual(seen[2][4], (2, 4))
        self.assertEqual(seen[2][5], 128)

    def test_attention_and_gdn_prefixes_stay_on_w4a16(self):
        import k8v4_v030.w4a8_prefill as patch

        class Kernel:
            w_q_name = "qweight"
            w_s_name = "scales"
            w_zp_name = "qzeros"

            class config:
                group_size = 128

        class Layer:
            def __init__(self, prefix):
                self.prefix = prefix
                self.qweight = torch.arange(16, dtype=torch.int32).reshape(4, 4)
                self.scales = torch.ones(2, 4)
                self.qzeros = torch.tensor([8], dtype=torch.int8)

        class Backend:
            pass

        seen = []

        def w4a16(self, layer, x, bias=None):
            seen.append(("w4a16", layer.prefix, x.shape[0]))
            return torch.zeros(x.shape[0], 4)

        def gemm(*_args, **_kwargs):
            seen.append(("gemm",))
            return torch.zeros(SMALL_M_MAX + 8, 4, dtype=torch.float16)

        Backend.apply_weights = w4a16
        patch._install_on_class(Backend)
        activation = torch.zeros(SMALL_M_MAX + 8, 32, dtype=torch.bfloat16)
        kernel = Kernel()
        original_gemm = patch.w4a8_gemm
        try:
            patch.w4a8_gemm = gemm
            for prefix in (
                "model.layers.0.linear_attn.in_proj_qkvz",
                "model.layers.0.self_attn.qkv_proj",
                "model.layers.0.self_attn.o_proj",
            ):
                Backend.apply_weights(kernel, Layer(prefix), activation)
            mlp = Backend.apply_weights(
                kernel,
                Layer("model.layers.3.mlp.gate_proj"),
                activation,
            )
        finally:
            patch.w4a8_gemm = original_gemm
        self.assertEqual([row[1] for row in seen if row[0] == "w4a16"], [
            "model.layers.0.linear_attn.in_proj_qkvz",
            "model.layers.0.self_attn.qkv_proj",
            "model.layers.0.self_attn.o_proj",
        ])
        self.assertEqual(seen[-1][0], "gemm")
        self.assertEqual(mlp.dtype, torch.bfloat16)

    def test_reverse_nibble_env_repacks_the_cached_blob(self):
        import k8v4_v030.w4a8_prefill as patch

        class Kernel:
            w_q_name = "qweight"
            w_s_name = "scales"
            w_zp_name = "qzeros"

            class config:
                group_size = 128

        class Layer:
            def __init__(self):
                self.qweight = torch.arange(32, dtype=torch.int32).reshape(4, 8)
                self.scales = torch.ones(2, 4)
                self.qzeros = torch.tensor([8], dtype=torch.int8)

        os.environ["K8V4_W4A8_NIBBLE"] = "reverse"
        os.environ["K8V4_W4A8_SCALE_DTYPE"] = "fp16"
        try:
            packed, scales, _zeros = patch.cached_w4a8_weights(Kernel(), Layer())
        finally:
            os.environ.pop("K8V4_W4A8_NIBBLE", None)
            os.environ.pop("K8V4_W4A8_SCALE_DTYPE", None)
        expected = patch.reverse_nibble_order(torch.arange(32, dtype=torch.int32).reshape(4, 8))
        self.assertFalse(packed.is_contiguous())
        self.assertEqual(tuple(packed.stride()), tuple(expected.transpose(0, 1).stride()))
        self.assertTrue(torch.equal(packed, expected.transpose(0, 1)))
        self.assertEqual(scales.dtype, torch.float16)
        self.assertEqual(tuple(scales.shape), (2, 4))
        os.environ["K8V4_W4A8_ACT"] = "fp16"
        try:
            cast = activation_for_quant(torch.zeros(3, 4, dtype=torch.bfloat16))
        finally:
            os.environ.pop("K8V4_W4A8_ACT", None)
        self.assertEqual(cast.dtype, torch.float16)

    def test_import_hook_wraps_the_kernel_class(self):
        with tempfile.TemporaryDirectory() as directory:
            package = Path(directory) / "k8v4_w4a8hook"
            package.mkdir()
            (package / "__init__.py").write_text("", encoding="utf-8")
            nested = package / "xpu.py"
            nested.write_text(
                textwrap.dedent(
                    """\
                    class XPUwNa16LinearKernel:
                        def apply_weights(self, layer, x, bias=None):
                            return x
                    """
                ),
                encoding="utf-8",
            )
            import k8v4_v030.w4a8_prefill as patch

            finder = patch._KernelFinder("k8v4_w4a8hook.xpu")
            sys.meta_path.insert(0, finder)
            sys.path.insert(0, directory)
            try:
                import k8v4_w4a8hook.xpu as xpu_mod

                self.assertTrue(getattr(xpu_mod.XPUwNa16LinearKernel.apply_weights, "_k8v4_w4a8", False))
                kernel = xpu_mod.XPUwNa16LinearKernel()
                out = kernel.apply_weights(None, torch.zeros(4, 3))
                self.assertEqual(tuple(out.shape), (4, 3))
            finally:
                remove_import_hook(finder)
                sys.path.remove(directory)
                for name in list(sys.modules):
                    if name == "k8v4_w4a8hook" or name.startswith("k8v4_w4a8hook."):
                        del sys.modules[name]

    def test_install_is_a_no_op_until_the_module_loads(self):
        os.environ["K8V4_PREFILL_GEMM"] = "w4a8"
        try:
            install()
            self.assertIsNotNone(__import__("k8v4_v030.w4a8_prefill", fromlist=["_FINDER"])._FINDER)
        finally:
            import k8v4_v030.w4a8_prefill as patch

            remove_import_hook()
            patch._FINDER = None
            os.environ.pop("K8V4_PREFILL_GEMM", None)
            wrap_kernel_module  # keep the import used by the hook path
