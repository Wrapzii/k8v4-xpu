"""Pooled indexer rows follow the block table, including prefix copies."""

from __future__ import annotations

import unittest

import torch

from k8v4_v030.qsa_cache import QsaBlockCache, reset_caches
from k8v4_v030.qsa_ref import QsaHyper, pool_block


class CacheTest(unittest.TestCase):
    def setUp(self):
        reset_caches()

    def test_pool_waits_for_four_keys_and_copy_blocks_moves_them(self):
        hyper = QsaHyper(
            heads=2,
            dim=4,
            hidden=4,
            ratio=4,
            top_tokens=8,
            n_rot=4,
            sections=(1, 1, 0, 0),
            theta=10000.0,
        )
        cache = QsaBlockCache(num_blocks=2, block_size=64, hyper=hyper, dtype=torch.float64)
        norm = torch.tensor([1.0, 1.5, 0.5, 2.0], dtype=torch.float64)
        keys = []
        for token in range(4):
            key = torch.tensor([float(token + 1), 0.0, 0.0, 0.0], dtype=torch.float64)
            pos = torch.tensor([token, token, 0, 0], dtype=torch.int64)
            keys.append(key)
            cache.write_token(token, key, pos, norm)
            if token < 3:
                self.assertFalse(bool(cache.pool_valid[0]))
        expect = pool_block(torch.stack(keys), norm, torch.tensor([0, 0, 0, 0]), hyper)
        self.assertTrue(bool(cache.pool_valid[0]))
        self.assertTrue(torch.allclose(cache.pooled[0], expect))
        # The second physical block is still empty. Copy block 0 onto it.
        cache.copy_blocks([0], [1])
        self.assertTrue(torch.equal(cache.raw[64:68], cache.raw[0:4]))
        self.assertTrue(torch.equal(cache.pooled[16], cache.pooled[0]))
        self.assertTrue(bool(cache.pool_valid[16]))
        # Identity block table, one page per block entry: logical token 0 is slot 0.
        row = torch.arange(8, dtype=torch.int32)
        got = cache.pooled_row(row, 0, pages_per_block=1)
        self.assertIsNotNone(got)
        self.assertTrue(torch.allclose(got, expect))
        # Logical token 64 lives in physical block 1, which now holds the copy.
        copied = cache.pooled_row(row, 64, pages_per_block=1)
        self.assertTrue(torch.allclose(copied, expect))
        self.assertIsNone(cache.pooled_row(row, 4, pages_per_block=1))


if __name__ == "__main__":
    unittest.main()
