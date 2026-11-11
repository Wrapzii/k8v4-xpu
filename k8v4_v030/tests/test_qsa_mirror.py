"""The int8 score mirror matches a full dequant on the rows it refreshes."""
import unittest

import torch

from k8v4_v030.qsa_pooled_quant import (
    dequantize_pooled_rows,
    quantize_pooled_rows,
    refresh_mirror_rows,
)


class MirrorRefreshTest(unittest.TestCase):
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
