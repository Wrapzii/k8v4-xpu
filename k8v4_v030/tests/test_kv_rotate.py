"""K8V4_KV_ROTATE contract: strict parsing, an exact basis change, smaller K8/V4 storage error."""
from __future__ import annotations

import unittest

import torch

from k8v4_v030 import kv_rotate


def v4_roundtrip(x):
    """The xe2_kv_ops.cpp V store / load (per token and head: range / 15, integer zero point)."""
    lo = x.amin(-1, keepdim=True)
    hi = x.amax(-1, keepdim=True)
    s = torch.clamp((hi - lo) / 15.0, min=1e-8)
    z = torch.clamp(torch.floor(-lo / s + 0.5), 0, 15)
    return (torch.clamp(torch.floor(x / s + z + 0.5), 0, 15) - z) * s


def k8_roundtrip(x):
    s = x.abs().amax(-1, keepdim=True) / 127.0
    return torch.clamp(torch.round(x / s), -127, 127) * s


class ParseTest(unittest.TestCase):
    def test_values(self):
        self.assertEqual(kv_rotate.parse(None), (False, False))
        self.assertEqual(kv_rotate.parse(""), (False, False))
        self.assertEqual(kv_rotate.parse("k"), (True, False))
        self.assertEqual(kv_rotate.parse("v"), (False, True))
        self.assertEqual(kv_rotate.parse("kv"), (True, True))
        for bad in ("1", "vk", "K", "kv,", "yes"):
            with self.assertRaises(RuntimeError):
                kv_rotate.parse(bad)


class BasisTest(unittest.TestCase):
    def test_hadamard_is_symmetric_orthonormal(self):
        h = kv_rotate.hadamard()
        self.assertEqual(tuple(h.shape), (256, 256))
        torch.testing.assert_close(h, h.t())
        torch.testing.assert_close(h @ h, torch.eye(256), atol=1e-5, rtol=0)
        with self.assertRaises(ValueError):
            kv_rotate.hadamard(96)

    def test_attention_is_unchanged_without_quantization(self):
        torch.manual_seed(0)
        q = torch.randn(5, 2, 256)
        k = torch.randn(40, 2, 256)
        v = torch.randn(40, 2, 256)
        p = torch.softmax(torch.einsum("thd,nhd->thn", q, k) / 16.0, -1)
        ref = torch.einsum("thn,nhd->thd", p, v)
        qr, kr, vr = kv_rotate.rotate(q), kv_rotate.rotate(k), kv_rotate.rotate(v)
        pr = torch.softmax(torch.einsum("thd,nhd->thn", qr, kr) / 16.0, -1)
        out = kv_rotate.rotate(torch.einsum("thn,nhd->thd", pr, vr))
        torch.testing.assert_close(out, ref, atol=1e-4, rtol=1e-4)

    def test_flat_heads_and_dtype(self):
        x = torch.randn(3, 4 * 256, dtype=torch.bfloat16)
        y = kv_rotate.rotate(x, torch.float16)
        self.assertEqual(y.dtype, torch.float16)
        self.assertEqual(tuple(y.shape), (3, 1024))
        with self.assertRaises(RuntimeError):
            kv_rotate.rotate(torch.randn(2, 100))


class ErrorTest(unittest.TestCase):
    def test_outlier_channels_lose_less_after_rotation(self):
        torch.manual_seed(1)
        x = torch.randn(512, 256)
        x[:, 7] *= 12.0  # one large channel sets the per-token scale
        h = kv_rotate.hadamard()
        for roundtrip in (v4_roundtrip, k8_roundtrip):
            plain = (roundtrip(x) - x).norm() / x.norm()
            rotated = (roundtrip(x @ h) @ h - x).norm() / x.norm()
            self.assertLess(rotated, 0.6 * plain)


if __name__ == "__main__":
    unittest.main()
