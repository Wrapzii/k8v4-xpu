"""CPU checks for request-isolated indexer slots, batched decode, MTP own-cell."""

from __future__ import annotations

import unittest

import torch

from k8v4_v030.qsa_cache import QsaBlockCache
from k8v4_v030.qsa_runtime import (
    _decode_batch,
    _graph_score_width,
    _one_decode_span,
    _own_block_column,
)


class DecodeBatchTest(unittest.TestCase):
    def test_one_mtp_request(self):
        batch = _decode_batch((0, 7, 7, 7, 7), 7)
        self.assertEqual(batch, [(0, 0, 7)])
        self.assertTrue(_one_decode_span((0, 7, 7, 7, 7), 7))

    def test_four_mtp_requests(self):
        batch = _decode_batch((0, 7, 14, 21, 28), 28)
        self.assertEqual(batch, [(0, 0, 7), (1, 7, 7), (2, 14, 7), (3, 21, 7)])
        self.assertFalse(_one_decode_span((0, 7, 14, 21, 28), 28))

    def test_prefill_rejected(self):
        self.assertIsNone(_decode_batch((0, 4224), 4224))

    def test_mixed_prefill_rejected(self):
        self.assertIsNone(_decode_batch((0, 4224, 4231), 4231))


class OwnBlockColumnTest(unittest.TestCase):
    def test_appends_each_cell(self):
        cells = torch.tensor([200000, 200001, 200002], dtype=torch.int64)
        extra = _own_block_column(cells)
        self.assertEqual(tuple(extra.shape), (3, 1))
        self.assertEqual(extra.tolist(), [[200000], [200001], [200002]])


class PhysicalSlotIsolationTest(unittest.TestCase):
    def test_two_requests_same_logical_do_not_collide(self):
        cache = QsaBlockCache(num_blocks=8, block_size=64, device="cpu")
        pages_per_block = 1
        row_a = torch.tensor([0, 1, 2, 3], dtype=torch.int64)
        row_b = torch.tensor([4, 5, 6, 7], dtype=torch.int64)
        cells = torch.tensor([0, 1, 2, 3], dtype=torch.int64)
        key_a = torch.arange(4 * 128, dtype=torch.float32).view(4, 128)
        key_b = key_a + 1000
        pos = torch.zeros(4, 4, dtype=torch.int32)
        norm = torch.ones(128, dtype=torch.float32)
        cache.write_tokens(cache.logical_slots(row_a, cells, pages_per_block), key_a, pos, norm)
        cache.write_tokens(cache.logical_slots(row_b, cells, pages_per_block), key_b, pos, norm)
        pooled_a, valid_a = cache.gather_blocks(row_a, 1, pages_per_block)
        pooled_b, valid_b = cache.gather_blocks(row_b, 1, pages_per_block)
        self.assertTrue(bool(valid_a[0]))
        self.assertTrue(bool(valid_b[0]))
        self.assertFalse(torch.allclose(pooled_a[0], pooled_b[0]))
        # Logical addressing would have overwritten A with B, so the pooled
        # rows would match. RMSNorm shrinks the raw offset, but they differ.


class GraphScoreWidthTest(unittest.TestCase):
    def test_capture_uses_full_cap(self):
        self.assertEqual(_graph_score_width(True, 10_000, 10**9, 10**9), 65536)

    def test_eager_buckets(self):
        self.assertEqual(_graph_score_width(False, 10_000, 10**9, 10**9), 4096)
        self.assertEqual(_graph_score_width(False, 50_000, 10**9, 10**9), 16384)
        self.assertEqual(_graph_score_width(False, 200_000, 10**9, 10**9), 65536)

    def test_fit_caps_bucket(self):
        self.assertEqual(_graph_score_width(False, 200_000, 3000, 10**9), 3000)


if __name__ == "__main__":
    unittest.main()
