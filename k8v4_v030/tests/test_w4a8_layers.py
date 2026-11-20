"""CPU checks for the opt-in K8V4_W4A8_LAYERS gate."""

from __future__ import annotations

import os
import unittest
from unittest.mock import patch

import torch

from k8v4_v030 import w4a8_prefill as gemm


class Layer:
    def __init__(self, prefix):
        self.prefix = prefix


PREFIXES = {
    "model.layers.3.mlp.gate_up_proj": "mlp",
    "mtp.layers.0.mlp.down_proj": "mlp",
    "model.layers.3.self_attn.qkv_proj": "attn",
    "mtp.layers.0.self_attn.o_proj": "attn",
    "model.layers.0.linear_attn.in_proj_qkvz": "gdn",
    "model.layers.0.linear_attn.out_proj": "gdn",
    "mtp.fc": "other",
    "lm_head": "other",
}


class LayerFamilyTest(unittest.TestCase):
    def test_families_from_prefix(self):
        for prefix, family in PREFIXES.items():
            self.assertEqual(gemm.layer_family(prefix), family, prefix)

    def test_parse_default_all_and_lists(self):
        self.assertEqual(gemm.parse_layer_families(None), frozenset(("mlp",)))
        self.assertEqual(gemm.parse_layer_families(""), frozenset(("mlp",)))
        self.assertEqual(gemm.parse_layer_families("all"), frozenset(gemm.LAYER_FAMILIES))
        self.assertEqual(gemm.parse_layer_families("mlp,attn, gdn"), frozenset(("mlp", "attn", "gdn")))
        for bad in ("mlp,", "qkv", "all,mlp", "mlp;attn"):
            with self.assertRaises(RuntimeError, msg=bad):
                gemm.parse_layer_families(bad)

    def test_default_gate_is_mlp_only(self):
        with patch.object(gemm, "_LAYERS", frozenset(("mlp",))):
            chosen = [p for p in PREFIXES if gemm._mlp_linear(Layer(p))]
        self.assertEqual(chosen, [p for p, f in PREFIXES.items() if f == "mlp"])
        self.assertTrue(gemm._mlp_linear(Layer("")))

    def test_wider_gate(self):
        with patch.object(gemm, "_LAYERS", frozenset(("mlp", "attn", "gdn"))):
            chosen = {p for p in PREFIXES if gemm._mlp_linear(Layer(p))}
        self.assertEqual(chosen, {p for p, f in PREFIXES.items() if f != "other"})
        with patch.object(gemm, "_LAYERS", frozenset(gemm.LAYER_FAMILIES)):
            self.assertTrue(all(gemm._mlp_linear(Layer(p)) for p in PREFIXES))

    def test_install_if_requested_reads_the_env(self):
        previous = (gemm._RUNTIME_ENABLED, gemm._LAYERS)
        try:
            with patch.object(gemm, "install"):
                with patch.dict(os.environ, {"K8V4_PREFILL_GEMM": "w4a8", "K8V4_W4A8_LAYERS": "all"}):
                    gemm.install_if_requested()
                self.assertEqual(gemm._LAYERS, frozenset(gemm.LAYER_FAMILIES))
                env = dict(os.environ)
                env.pop("K8V4_W4A8_LAYERS", None)
                env["K8V4_PREFILL_GEMM"] = "w4a8"
                with patch.dict(os.environ, env, clear=True):
                    gemm.install_if_requested()
                self.assertEqual(gemm._LAYERS, frozenset(("mlp",)))
                with patch.dict(os.environ, {"K8V4_PREFILL_GEMM": "w4a8", "K8V4_W4A8_LAYERS": "qkv"}):
                    with self.assertRaises(RuntimeError):
                        gemm.install_if_requested()
        finally:
            gemm._RUNTIME_ENABLED, gemm._LAYERS = previous

    def test_wrapped_apply_routes_attention_when_enabled(self):
        class Kernel:
            w_q_name = "qweight"
            w_s_name = "scales"
            w_zp_name = "qzeros"

            class config:
                group_size = 128

        class QLayer(Layer):
            def __init__(self, prefix):
                super().__init__(prefix)
                self.qweight = torch.arange(16, dtype=torch.int32).reshape(4, 4)
                self.scales = torch.ones(2, 4)
                self.qzeros = torch.tensor([8], dtype=torch.int8)

        class Backend:
            pass

        seen = []

        def w4a16(self, layer, x, bias=None):
            seen.append(("w4a16", layer.prefix))
            return torch.zeros(x.shape[0], 4)

        def w4a8(*_args, **_kwargs):
            seen.append(("w4a8",))
            return torch.zeros(gemm.SMALL_M_MAX + 8, 4, dtype=torch.float16)

        Backend.apply_weights = w4a16
        gemm._install_on_class(Backend)
        x = torch.zeros(gemm.SMALL_M_MAX + 8, 32, dtype=torch.bfloat16)
        with patch.object(gemm, "w4a8_gemm", w4a8), \
             patch.object(gemm, "_LAYERS", frozenset(("mlp", "attn"))):
            Backend.apply_weights(Kernel(), QLayer("model.layers.3.self_attn.qkv_proj"), x)
            Backend.apply_weights(Kernel(), QLayer("model.layers.0.linear_attn.out_proj"), x)
        self.assertEqual(seen, [("w4a8",), ("w4a16", "model.layers.0.linear_attn.out_proj")])


if __name__ == "__main__":
    unittest.main()
