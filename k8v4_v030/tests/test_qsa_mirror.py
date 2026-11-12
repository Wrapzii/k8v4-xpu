"""The int8 score mirror matches a full dequant on the rows it refreshes."""
import subprocess
import sys
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

import torch

from k8v4_v030.qsa_pooled_quant import (
    dequantize_pooled_rows,
    quantize_pooled_rows,
    refresh_mirror_rows,
)


class MirrorRefreshTest(unittest.TestCase):
    def test_batched_decode_prefers_native_int8_over_fp32_mirror(self):
        # Runtime import is deliberately lazy. Keep this check in a fresh
        # process so it cannot invalidate the backend's import-isolation test.
        subprocess.run(
            [
                sys.executable,
                "-c",
                "from k8v4_v030.tests.test_qsa_mirror import MirrorRefreshTest; "
                "MirrorRefreshTest()._check_batched_scoring_dispatch()",
            ],
            cwd=Path(__file__).resolve().parents[2],
            check=True,
            timeout=60,
        )

    def _check_batched_scoring_dispatch(self):
        from k8v4_v030.qsa_runtime import _scoring_pool

        cache = SimpleNamespace(
            pooled=torch.zeros(6, 128, dtype=torch.int8),
            pooled_scale=torch.ones(6),
            pooled_fp32=torch.zeros(6, 128),
        )
        ready = SimpleNamespace(qsa_score_paged_multi_i8=object())
        with patch("k8v4_v030.qsa_batch_score.batch_ops", return_value=ready):
            pooled, scales = _scoring_pool(cache, batched=True)
        self.assertIs(pooled, cache.pooled)
        self.assertIs(scales, cache.pooled_scale)

        # Old companion builds and single-request scoring retain the mirror.
        with patch("k8v4_v030.qsa_batch_score.batch_ops", return_value=SimpleNamespace()):
            pooled, scales = _scoring_pool(cache, batched=True)
        self.assertIs(pooled, cache.pooled_fp32)
        self.assertIsNone(scales)
        with patch("k8v4_v030.qsa_batch_score.batch_ops") as loader:
            pooled, scales = _scoring_pool(cache)
        loader.assert_not_called()
        self.assertIs(pooled, cache.pooled_fp32)
        self.assertIsNone(scales)

    def test_refreshed_rows_match_full_dequant(self):
        torch.manual_seed(0)
        values = torch.randn(6, 128)
        quantized, scales = quantize_pooled_rows(values)
        mirror = torch.zeros(6, 128)
        refresh_mirror_rows(quantized, scales, mirror, torch.tensor([1, 4, 1, 0]))
        full = dequantize_pooled_rows(quantized, scales)
        for row in (0, 1, 4):
            self.assertTrue(torch.equal(mirror[row], full[row]))
        for row in (2, 3, 5):
            self.assertTrue(torch.equal(mirror[row], torch.zeros(128)))


if __name__ == "__main__":
    unittest.main()
