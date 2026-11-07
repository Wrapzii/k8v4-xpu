"""Pooled indexer rows follow the block table, including prefix copies."""

from __future__ import annotations

import unittest
from unittest.mock import patch

import torch

from k8v4_v030.qsa_cache import QsaBlockCache, reset_caches
from k8v4_v030.qsa_ref import QsaHyper, pool_block


class CacheTest(unittest.TestCase):
    def test_lazy_cache_grows_and_preserves_blocks_and_prefix_copies(self):
        with patch.dict("os.environ", {"K8V4_QSA_LAZY_CACHE": "1"}):
            lazy = QsaBlockCache(num_blocks=16, block_size=64)
        with patch.dict("os.environ", {"K8V4_QSA_LAZY_CACHE": "0"}):
            eager = QsaBlockCache(num_blocks=16, block_size=64)
        self.assertEqual(lazy.raw.shape[0], 128)
        norm = torch.ones(128)
        for start in (0, 128, 448):
            slots = torch.arange(start, start + 4, dtype=torch.int64)
            keys = torch.arange(4 * 128, dtype=torch.float32).view(4, 128) + start
            pos = torch.arange(start, start + 4).view(4, 1).expand(4, 4)
            lazy.write_tokens(slots, keys, pos, norm)
            eager.write_tokens(slots, keys, pos, norm)
        lazy.copy_blocks([0], [12])
        eager.copy_blocks([0], [12])
        for name in ("raw", "pos", "filled", "pooled", "pool_valid"):
            a, b = getattr(lazy, name), getattr(eager, name)
            self.assertTrue(torch.equal(a, b[:a.shape[0]]), name)
        with self.assertRaises(IndexError):
            lazy.ensure_capacity(16 * 64)

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

    def test_write_tokens_matches_the_per_slot_loop(self):
        hyper = QsaHyper()
        norm = torch.randn(hyper.dim)
        keys = torch.randn(6, hyper.dim)
        pos = torch.arange(24, dtype=torch.int64).reshape(6, 4)
        slots = torch.tensor([0, 1, 2, 3, -1, 5])
        one = QsaBlockCache(num_blocks=1, block_size=64, hyper=hyper)
        two = QsaBlockCache(num_blocks=1, block_size=64, hyper=hyper)
        for slot, key, one_pos in zip(slots.tolist(), keys, pos):
            if int(slot) < 0:
                continue
            one.write_token(int(slot), key, one_pos, norm)
        two.write_tokens(slots, keys, pos, norm)
        self.assertTrue(torch.equal(one.raw, two.raw))
        self.assertTrue(torch.equal(one.pos, two.pos))
        self.assertTrue(torch.equal(one.filled, two.filled))
        self.assertTrue(torch.equal(one.pooled, two.pooled))
        self.assertTrue(torch.equal(one.pool_valid, two.pool_valid))

    def test_gather_follows_a_swapped_block_table(self):
        cache = QsaBlockCache(num_blocks=4, block_size=64)
        norm = torch.ones(cache.hyper.dim)
        # Physical block 2 holds a distinctive pooled micro-block.
        for slot in range(128, 132):
            key = torch.full((cache.hyper.dim,), float(slot - 127))
            cache.write_token(slot, key, torch.tensor([slot, slot, 0, 0]), norm)
        self.assertTrue(bool(cache.pool_valid[128 // cache.hyper.ratio]))
        swapped = torch.tensor([2, 0, 1, 3], dtype=torch.int32)
        gathered, valid = cache.gather_blocks(swapped, count=1, pages_per_block=1)
        direct = cache.pooled_row(swapped, 0, pages_per_block=1)
        self.assertIsNotNone(direct)
        self.assertTrue(bool(valid[0]))
        self.assertTrue(torch.equal(gathered[0], direct))
        # Identity would read physical slot 0, which was never written.
        identity = torch.arange(4, dtype=torch.int32)
        self.assertIsNone(cache.pooled_row(identity, 0, pages_per_block=1))
        for token in (0, 64, 128):
            vector = cache.logical_slots(swapped, torch.tensor([token]), 1)
            self.assertEqual(int(vector[0]), cache.logical_slot(swapped, token, 1))

    def test_pages_per_block_addresses_the_second_kernel_page(self):
        cache = QsaBlockCache(num_blocks=4, block_size=128)
        norm = torch.ones(cache.hyper.dim)
        # Manager entry 3 covers kernel pages 6 and 7. Token 64 of that entry
        # is the second page: physical slot 3 * 128 + 64.
        row = torch.tensor([3, 0, 1, 2], dtype=torch.int32)
        slot = cache.logical_slot(row, 64, pages_per_block=2)
        self.assertEqual(slot, 3 * 128 + 64)
        for offset in range(4):
            key = torch.full((cache.hyper.dim,), float(offset + 1))
            cache.write_token(slot + offset, key, torch.zeros(4, dtype=torch.int64), norm)
        # Logical block 16 starts at token 64.
        gathered, valid = cache.gather_blocks(row, count=17, pages_per_block=2)
        self.assertTrue(bool(valid[16]))
        self.assertFalse(bool(valid[0]))
        direct = cache.pooled_row(row, 64, pages_per_block=2)
        self.assertTrue(torch.equal(gathered[16], direct))


if __name__ == "__main__":
    unittest.main()
