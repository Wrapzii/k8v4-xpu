"""XPU checks: the Triton quantizers against the torch references (skipped without an XPU)."""

from __future__ import annotations

import unittest

import torch

from k8v4_v030 import w4a8_prefill as gemm

HAS_XPU = hasattr(torch, "xpu") and torch.xpu.is_available()


def _ref_gated(o, z, w, eps):
    x = o.float()
    out = x * torch.rsqrt(x.pow(2).mean(dim=-1, keepdim=True) + eps) * w.float()
    return (out * torch.nn.functional.silu(z.float())).to(o.dtype).reshape(o.shape[0], -1)


@unittest.skipUnless(HAS_XPU, "needs an XPU")
class TritonQuantTest(unittest.TestCase):
    def check(self, q, s, ref, group):
        rows, width = ref.shape
        back = q.float().reshape(rows, width // group, group) * s.float().unsqueeze(-1)
        err = (back.reshape(rows, width) - ref.float()).abs()
        bound = ref.float().abs().reshape(rows, width // group, group).amax(-1) / 127
        self.assertTrue(bool((err.reshape(rows, width // group, group) <= bound.unsqueeze(-1) * 0.51 + 1e-6).all()))
        rq, rs = gemm._quantize_grouped(ref, group)
        self.assertTrue(torch.equal(s, rs))
        self.assertLessEqual(int((q.int() - rq.int()).abs().max()), 1)

    def test_quantizers(self):
        from k8v4_v030 import w4a8_triton as tr

        x = (torch.randn(300, 17408, device="xpu") * 0.7).to(torch.bfloat16)
        q, s = tr.quantize_groups(x, 64)
        self.check(q, s, x, 64)
        q, s = tr.quantize_rows(x)
        self.check(q, s, x, 17408)
        gu = torch.randn(300, 2 * 4096, device="xpu").to(torch.bfloat16)
        q, s = tr.silu_quantize_groups(gu, 64)
        g, u = gu[:, :4096].float(), gu[:, 4096:].float()
        self.check(q, s, (torch.nn.functional.silu(g) * u).to(torch.bfloat16), 64)
        o = torch.randn(300, 48, 128, device="xpu").to(torch.bfloat16)
        z = torch.randn(300, 48, 128, device="xpu").to(torch.bfloat16)
        w = torch.rand(128, device="xpu").to(torch.bfloat16)
        q, s = tr.gnorm_quantize_groups(o, z, w, 1e-6, "silu", 64)
        self.check(q, s, _ref_gated(o, z, w, 1e-6), 64)

    def test_gnorm_decode_rows(self):
        """K8V4_W4A8_FUSED=gnorm's decode side: the one-launch gated norm against forward_static's arithmetic."""
        from k8v4_v030 import w4a8_triton as tr

        for dtype in (torch.float16, torch.bfloat16):
            for rows in (1, 7, 16, 64, 128):
                o = torch.randn(rows, 48, 128, device="xpu").to(dtype)
                z = (torch.randn(rows, 48, 128, device="xpu") * 2).to(dtype)
                w = (torch.rand(128, device="xpu") + 0.5).to(dtype)
                y = tr.gnorm(o, z, w, 1e-6, "silu")
                ref = _ref_gated(o, z, w, 1e-6)
                self.assertEqual(y.shape, ref.shape)
                self.assertEqual(y.dtype, dtype)
                # one rounding of the same fp32 value: at most one unit in the last place of the output dtype
                ulp = ref.float().abs().clamp(min=1e-3) * (2.0 ** -10 if dtype == torch.float16 else 2.0 ** -7)
                self.assertTrue(bool(((y.float() - ref.float()).abs() <= ulp).all()))

    def test_silu_mul_decode_rows(self):
        """K8V4_W4A8_FUSED=silu's decode side: SiLU(gate) * up rounded once (the compiled stock SiluAndMul)."""
        from k8v4_v030 import w4a8_triton as tr

        for dtype in (torch.float16, torch.bfloat16):
            for rows in (1, 16, 128):
                gu = (torch.randn(rows, 2 * 17408, device="xpu") * 3).to(dtype)
                g, u = gu[:, :17408].float(), gu[:, 17408:].float()
                ref = (g * torch.sigmoid(g) * u).to(dtype)
                y = tr.silu_mul(gu)
                ulp = ref.float().abs().clamp(min=1e-3) * (2.0 ** -10 if dtype == torch.float16 else 2.0 ** -7)
                self.assertTrue(bool(((y.float() - ref.float()).abs() <= ulp).all()))


if __name__ == "__main__":
    unittest.main()
