"""CPU checks for the opt-in K8V4_NCONTIG_RE relayout."""

from __future__ import annotations

import unittest
from unittest.mock import patch

import torch

from k8v4_v030 import ncontig


class FakeWeight:
    def __init__(self, data):
        self.data = data


class FakeData:
    """A 2-D tensor that reports a non-CPU device so relayout() runs on CPU."""

    def __init__(self, tensor, device="xpu"):
        self.t_ = tensor
        self.device = torch.device("meta") if device == "meta" else type("D", (), {"type": device})()

    ndim = 2

    def stride(self, dim):
        return self.t_.stride(dim)

    def t(self):
        return FakeData(self.t_.t(), self.device.type)

    def contiguous(self):
        return FakeData(self.t_.contiguous(), self.device.type)


class Layer:
    def __init__(self, prefix, tensor, device="xpu"):
        self.prefix = prefix
        self.weight = FakeWeight(FakeData(tensor, device))


class NcontigTest(unittest.TestCase):
    def test_parse(self):
        self.assertIsNone(ncontig.parse_pattern(None))
        self.assertIsNone(ncontig.parse_pattern(""))
        self.assertEqual(ncontig.parse_pattern("in_proj_ba").pattern, "in_proj_ba")
        with self.assertRaises(RuntimeError):
            ncontig.parse_pattern("in_proj_(")

    def test_only_matching_layers_change_and_values_stay(self):
        w = torch.arange(96 * 64, dtype=torch.float32).reshape(96, 64)
        with patch.object(ncontig, "_PATTERN", ncontig.parse_pattern("in_proj_ba")):
            hit = Layer("model.layers.0.linear_attn.in_proj_ba", w.clone())
            miss = Layer("model.layers.0.linear_attn.in_proj_qkvz", w.clone())
            cpu = Layer("model.layers.0.linear_attn.in_proj_ba", w.clone(), "cpu")
            self.assertTrue(ncontig.relayout(hit))
            self.assertFalse(ncontig.relayout(miss))
            self.assertFalse(ncontig.relayout(cpu))
            self.assertFalse(ncontig.relayout(hit))  # already [K, N]-contiguous
        self.assertEqual(hit.weight.data.stride(0), 1)
        self.assertTrue(torch.equal(hit.weight.data.t_, w))
        self.assertEqual(miss.weight.data.stride(1), 1)
        with patch.object(ncontig, "_PATTERN", None):
            off = Layer("model.layers.0.linear_attn.in_proj_ba", w.clone())
            self.assertFalse(ncontig.relayout(off))

    def test_wrap_calls_original_then_relayout_once(self):
        calls = []

        class Method:
            def process_weights_after_loading(self, layer):
                calls.append("orig")

        ncontig._wrap(Method)
        ncontig._wrap(Method)
        w = torch.zeros(8, 4)
        layer = Layer("x.in_proj_ba", w)
        with patch.object(ncontig, "_PATTERN", ncontig.parse_pattern("in_proj_ba")):
            Method().process_weights_after_loading(layer)
        self.assertEqual(calls, ["orig"])
        self.assertEqual(layer.weight.data.stride(0), 1)


if __name__ == "__main__":
    unittest.main()
