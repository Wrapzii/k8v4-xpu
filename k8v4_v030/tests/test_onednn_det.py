"""CPU checks for the opt-in K8V4_ONEDNN_DETERMINISTIC flag."""

from __future__ import annotations

import os
import unittest
from unittest.mock import patch

import torch

from k8v4_v030 import onednn_det


class OnednnDetTest(unittest.TestCase):
    def setUp(self):
        self.saved = torch.backends.mkldnn.deterministic
        torch.backends.mkldnn.deterministic = False

    def tearDown(self):
        torch.backends.mkldnn.deterministic = self.saved

    def test_parse(self):
        for raw in (None, "", " ", "0"):
            self.assertFalse(onednn_det.parse(raw))
        self.assertTrue(onednn_det.parse("1"))
        self.assertTrue(onednn_det.parse(" 1 "))
        for raw in ("yes", "true", "2", "-1"):
            with self.assertRaises(RuntimeError):
                onednn_det.parse(raw)

    def test_unset_and_zero_leave_torch_alone(self):
        for env in ({}, {onednn_det.ENV: "0"}, {onednn_det.ENV: ""}):
            with self.subTest(env=env), patch.dict(os.environ, env, clear=False):
                if onednn_det.ENV not in env:
                    os.environ.pop(onednn_det.ENV, None)
                self.assertFalse(onednn_det.install_if_requested())
                self.assertFalse(torch.backends.mkldnn.deterministic)

    def test_one_sets_the_flag(self):
        with patch.dict(os.environ, {onednn_det.ENV: "1"}):
            self.assertTrue(onednn_det.install_if_requested())
        self.assertTrue(torch.backends.mkldnn.deterministic)

    def test_bad_value_raises(self):
        with patch.dict(os.environ, {onednn_det.ENV: "on"}):
            with self.assertRaises(RuntimeError):
                onednn_det.install_if_requested()
        self.assertFalse(torch.backends.mkldnn.deterministic)


@unittest.skipUnless(hasattr(torch, "xpu") and torch.xpu.is_available(), "needs an XPU device")
class OnednnDetXpuTest(unittest.TestCase):
    def test_in_proj_ba_shape_is_bitwise_reproducible_with_the_flag(self):
        saved = torch.backends.mkldnn.deterministic
        torch.backends.mkldnn.deterministic = True
        try:
            gen = torch.Generator().manual_seed(0)
            w = (torch.randn(96, 5120, generator=gen) * 0.02).to(torch.bfloat16).to("xpu")
            for rows in (2112, 4224, 1056):
                x = torch.randn(rows, 5120, generator=gen).to(torch.bfloat16).to("xpu")
                ref = torch.nn.functional.linear(x, w)
                for _ in range(6):
                    junk = torch.empty(int(torch.randint(1, 64, (1,), generator=gen)) << 18, device="xpu")
                    self.assertTrue(torch.equal(torch.nn.functional.linear(x, w), ref), rows)
                    del junk
        finally:
            torch.backends.mkldnn.deterministic = saved


if __name__ == "__main__":
    unittest.main()
