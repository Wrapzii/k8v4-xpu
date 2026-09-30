"""CPU checks for the packed page, the strided cache view, and eager prefill."""

from __future__ import annotations

import struct
import unittest

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.dequant import (
    eager_gqa_attention,
    eager_prefill,
    gather_dequant,
    gather_dequant_range,
)
from k8v4_v030.layout import D, HKV, HQ, PAGE, PAGE_BYTES, page_regions
from k8v4_v030.oracle import deterministic_rows, quant_k
from k8v4_v030.paged import read_token, write_token


def _max_abs(a, b) -> float:
    return max(abs(x - y) for x, y in zip(a, b))


class PagedBytesTest(unittest.TestCase):
    def test_negative_slot_is_a_noop_and_roundtrip_matches_regions(self):
        keys = deterministic_rows(1, HKV, seed=3)[0]
        values = deterministic_rows(1, HKV, seed=4)[0]
        blob = bytearray(2 * PAGE_BYTES)
        write_token(blob, -5, keys, values)
        self.assertEqual(blob, bytearray(2 * PAGE_BYTES))
        write_token(blob, 70, keys, values)
        got_k, got_v = read_token(blob, 70)
        for head in range(HKV):
            k_err = _max_abs(keys[head], got_k[head])
            v_err = _max_abs(values[head], got_v[head])
            self.assertLess(k_err, quant_k(keys[head])[1] + 1e-5)
            self.assertLess(v_err, 1.0)
        page, off = divmod(70, PAGE)
        scale_at = page_regions(page)["k_scale"][0] + (off * HKV) * 4
        stored = struct.unpack_from("<f", blob, scale_at)[0]
        self.assertAlmostEqual(stored, quant_k(keys[0])[1])

    def test_partial_page_keeps_the_masked_tail_byte(self):
        zeros = [[0.0] * D, [0.0] * D]
        ones = [[1.0] * D, [1.0] * D]
        blob = bytearray(PAGE_BYTES)
        write_token(blob, 43, zeros, zeros)
        write_token(blob, 44, ones, ones)
        kept, _ = read_token(blob, 43)
        tail, _ = read_token(blob, 44)
        self.assertLess(max(abs(x) for x in kept[0]), 1e-6)
        self.assertGreater(tail[0][0], 0.5)


class ViewAndGatherTest(unittest.TestCase):
    def test_nonzero_storage_offset_writes_the_marker_byte(self):
        pad = 32
        blob = torch.zeros(pad + PAGE_BYTES, dtype=torch.int8)
        layer = blob.narrow(0, pad, PAGE_BYTES)
        self.assertNotEqual(int(layer.storage_offset()), 0)
        views = bind_regions(layer)
        views["k"][0, 0, 0, 0] = 7
        views["k_scale"][0, 3, 1] = 1.5
        self.assertEqual(int(blob[pad].item()), 7)
        self.assertEqual(int(views["k"][0, 0, 0, 0].item()), 7)
        spec_off = page_regions(0)["k_scale"][0] + (3 * HKV + 1) * 4
        raw = blob.view(torch.uint8)[pad + spec_off : pad + spec_off + 4].numpy().tobytes()
        self.assertEqual(struct.unpack("<f", raw)[0], 1.5)

    def test_uint8_layer_and_rejected_layouts(self):
        layer = torch.zeros(PAGE_BYTES, dtype=torch.uint8)
        views = bind_regions(layer)
        views["k"][0, 0, 0, 0] = -3
        self.assertEqual(int(layer[0].item()), 253)
        self.assertEqual(int(views["v"][0, 0, 0, 0].item()), 0)
        misaligned = torch.zeros(PAGE_BYTES + 8, dtype=torch.int8).narrow(0, 2, PAGE_BYTES)
        with self.assertRaises(RuntimeError):
            bind_regions(misaligned)
        with self.assertRaises(RuntimeError):
            bind_regions(torch.zeros(PAGE_BYTES, dtype=torch.int8)[::2])
        with self.assertRaises(RuntimeError):
            bind_regions(torch.zeros(0, dtype=torch.int8))
        # stride <= 0 (broadcast or a negative stride) is not a dense span.
        broadcast = torch.as_strided(
            torch.zeros(PAGE_BYTES, dtype=torch.int8),
            size=(2, PAGE_BYTES),
            stride=(0, 1),
        )
        with self.assertRaises(RuntimeError):
            bind_regions(broadcast)

    def test_vllm_strided_block_is_address_order(self):
        # Live warmup shape: [block, head, token, cell], memory order
        # [block, token, head, cell]. 2112 tokens is 33 kernel pages.
        blocks, tokens, heads, cell = 2, 2112, HKV, 396
        self.assertEqual(tokens * heads * cell, 33 * PAGE_BYTES)
        nbytes = blocks * tokens * heads * cell
        pad = 32
        storage = torch.zeros(pad + nbytes, dtype=torch.uint8)
        layer = torch.as_strided(
            storage,
            size=(blocks, heads, tokens, cell),
            stride=(tokens * heads * cell, cell, heads * cell, 1),
            storage_offset=pad,
        )
        self.assertFalse(layer.is_contiguous())
        views = bind_regions(layer)
        views["k"][0, 1, 0, 0] = 9
        self.assertEqual(int(storage[pad + 512].item()), 9)
        self.assertEqual(int(storage[pad + 792].item()), 0)
        views["k"][1, 0, 0, 0] = 11
        self.assertEqual(int(storage[pad + PAGE_BYTES].item()), 11)
        views["k"][33, 0, 0, 0] = 13
        self.assertEqual(int(storage[pad + 33 * PAGE_BYTES].item()), 13)
        views["k"][0, 0, 0, 0] = -3
        self.assertEqual(int(storage[pad].item()), 253)

    def test_gather_matches_paged_read_for_a_manager_block(self):
        ratio = 2
        block_id = 3
        n_tok = PAGE + 5
        keys = deterministic_rows(n_tok, HKV, seed=11)
        values = deterministic_rows(n_tok, HKV, seed=12)
        blob = bytearray((block_id * ratio + ratio) * PAGE_BYTES)
        base = block_id * ratio * PAGE
        for token in range(n_tok):
            write_token(blob, base + token, keys[token], values[token])
        raw = torch.frombuffer(blob, dtype=torch.int8)
        views = bind_regions(raw)
        gathered_k, gathered_v = gather_dequant(
            views,
            torch.tensor([block_id], dtype=torch.int32),
            n_tok,
            ratio,
            torch.float32,
        )
        self.assertEqual(tuple(gathered_k.shape), (n_tok, HKV, D))
        for token in range(n_tok):
            got_k, got_v = read_token(blob, base + token)
            for head in range(HKV):
                self.assertLess(_max_abs(got_k[head], gathered_k[token, head].tolist()), 1e-5)
                self.assertLess(_max_abs(got_v[head], gathered_v[token, head].tolist()), 1e-4)

    def test_gather_range_matches_a_slice_of_the_full_gather(self):
        ratio = 2
        block_id = 1
        n_tok = PAGE + 20
        keys = deterministic_rows(n_tok, HKV, seed=21)
        values = deterministic_rows(n_tok, HKV, seed=22)
        blob = bytearray((block_id * ratio + ratio) * PAGE_BYTES)
        base = block_id * ratio * PAGE
        for token in range(n_tok):
            write_token(blob, base + token, keys[token], values[token])
        raw = torch.frombuffer(blob, dtype=torch.int8)
        views = bind_regions(raw)
        block_row = torch.tensor([block_id], dtype=torch.int32)
        full_k, full_v = gather_dequant(views, block_row, n_tok, ratio, torch.float32)
        start, end = 60, 75
        self.assertNotEqual(start % PAGE, 0)
        part_k, part_v = gather_dequant_range(
            views, block_row, start, end, ratio, torch.float32
        )
        self.assertEqual(tuple(part_k.shape), (end - start, HKV, D))
        self.assertTrue(torch.allclose(part_k, full_k[start:end], atol=1e-5, rtol=1e-5))
        self.assertTrue(torch.allclose(part_v, full_v[start:end], atol=1e-5, rtol=1e-5))
        empty_k, empty_v = gather_dequant_range(
            views, block_row, 4, 4, ratio, torch.float32
        )
        self.assertEqual(tuple(empty_k.shape), (0, HKV, D))
        self.assertEqual(tuple(empty_v.shape), (0, HKV, D))
        with self.assertRaises(RuntimeError):
            gather_dequant_range(views, block_row, -1, 4, ratio, torch.float32)


class EagerPrefillTest(unittest.TestCase):
    def test_query_suffix_does_not_see_future_keys(self):
        seq_len = 4
        q_len = 2
        key = torch.randn(seq_len, HKV, D)
        value = torch.randn(seq_len, HKV, D)
        query = torch.randn(q_len, HQ, D)
        scale = 1.0 / (D ** 0.5)
        first = eager_gqa_attention(query, key, value, scale)
        masked = key.clone()
        masked[-1] = 0
        second = eager_gqa_attention(query, masked, value, scale)
        self.assertEqual(tuple(first.shape), (q_len, HQ, D))
        self.assertTrue(torch.allclose(first[0], second[0], atol=1e-5, rtol=1e-5))
        self.assertGreater((first[1] - second[1]).abs().max().item(), 1e-4)
        from k8v4_v030.dequant import _sdpa_gqa

        via_repeat = _sdpa_gqa(query, key, value, scale, repeat_kv=True)
        self.assertTrue(torch.allclose(first, via_repeat, atol=1e-4, rtol=1e-4))

    def test_tiled_query_matches_one_shot_and_keeps_the_suffix(self):
        seq_len = 8
        q_len = 5
        generator = torch.Generator().manual_seed(7)
        key = torch.randn(seq_len, HKV, D, generator=generator)
        value = torch.randn(seq_len, HKV, D, generator=generator)
        query = torch.randn(q_len, HQ, D, generator=generator)
        scale = 1.0 / (D ** 0.5)
        import k8v4_v030.dequant as dequant

        saved_score = dequant.SCORE_TILE_BYTES
        saved_key = dequant.KEY_TILE_MAX
        try:
            dequant.SCORE_TILE_BYTES = 1 << 40
            dequant.KEY_TILE_MAX = 1 << 20
            self.assertEqual(dequant.attention_tiles(q_len, seq_len), (q_len, seq_len))
            one = eager_gqa_attention(query, key, value, scale)
            dequant.SCORE_TILE_BYTES = 1
            dequant.KEY_TILE_MAX = 1 << 20
            self.assertEqual(dequant.attention_tiles(q_len, seq_len), (1, seq_len))
            tiled_rows = eager_gqa_attention(query, key, value, scale)
            dequant.KEY_TILE_MAX = 3
            rows, key_tile = dequant.attention_tiles(q_len, seq_len)
            self.assertEqual(rows, 1)
            self.assertLess(key_tile, seq_len)
            online = eager_gqa_attention(query, key, value, scale)
            masked_key = key.clone()
            masked_key[-1] = 0
            online_masked = eager_gqa_attention(query, masked_key, value, scale)
        finally:
            dequant.SCORE_TILE_BYTES = saved_score
            dequant.KEY_TILE_MAX = saved_key
        self.assertTrue(torch.allclose(one, tiled_rows, atol=1e-4, rtol=1e-4))
        self.assertTrue(torch.allclose(one, online, atol=1e-4, rtol=1e-4))
        self.assertTrue(torch.allclose(online[0], online_masked[0], atol=1e-5, rtol=1e-5))
        self.assertGreater((online[-1] - online_masked[-1]).abs().max().item(), 1e-4)

    def test_attention_tiles_cover_the_prefill_that_faulted(self):
        from k8v4_v030.dequant import KEY_TILE_MAX, SCORE_TILE_BYTES, attention_tiles

        # 16K completed on one SDPA gather. 96K died on a 6336-token chunk
        # after 76032 tokens were already computed (sequence about 82368).
        short = (
            (6336, 12672),
            (2000, 2000),
            (8000, 8000),
            (16000, 16000),
        )
        for q_len, seq_len in short:
            rows, key_tile = attention_tiles(q_len, seq_len)
            self.assertEqual(key_tile, seq_len)
            self.assertGreaterEqual(rows, 1)
            self.assertLessEqual(rows, min(256, q_len))
        long = (
            (6336, 82368),
            (8192, 82368),
            (8192, 131072),
            (6336, 131072),
            (32000, 32000),
            (131072, 131072),
        )
        for q_len, seq_len in long:
            rows, key_tile = attention_tiles(q_len, seq_len)
            self.assertGreaterEqual(rows, 1)
            self.assertLessEqual(rows, min(256, q_len))
            self.assertLess(key_tile, seq_len)
            self.assertGreaterEqual(key_tile, PAGE)
            self.assertLessEqual(key_tile, KEY_TILE_MAX)
            self.assertLessEqual(rows * key_tile * HQ * 4, SCORE_TILE_BYTES)

    def test_paged_online_prefill_matches_one_shot_and_gathers_once(self):
        seq_len = PAGE + 17
        q_len = 5
        ratio = 2
        block_id = 2
        keys = deterministic_rows(seq_len, HKV, seed=31)
        values = deterministic_rows(seq_len, HKV, seed=32)
        blob = bytearray((block_id * ratio + ratio) * PAGE_BYTES)
        base = block_id * ratio * PAGE
        for token in range(seq_len):
            write_token(blob, base + token, keys[token], values[token])
        raw = torch.frombuffer(blob, dtype=torch.int8)
        views = bind_regions(raw)
        block_row = torch.tensor([block_id], dtype=torch.int32)
        generator = torch.Generator().manual_seed(9)
        query = torch.randn(q_len, HQ, D, generator=generator)
        scale = 1.0 / (D ** 0.5)
        import k8v4_v030.dequant as dequant

        calls: list[tuple[int, int]] = []
        real = dequant.gather_dequant_range

        def wrapped(views, block_row, start, end, pages_per_block, dtype):
            calls.append((int(start), int(end)))
            return real(views, block_row, start, end, pages_per_block, dtype)

        saved_score = dequant.SCORE_TILE_BYTES
        saved_key = dequant.KEY_TILE_MAX
        try:
            dequant.SCORE_TILE_BYTES = 1 << 40
            dequant.KEY_TILE_MAX = 1 << 20
            one = eager_prefill(query, views, block_row, seq_len, ratio, scale)
            dequant.gather_dequant_range = wrapped
            dequant.KEY_TILE_MAX = 40
            dequant.SCORE_TILE_BYTES = 1
            rows, key_tile = dequant.attention_tiles(q_len, seq_len)
            self.assertEqual(rows, 1)
            self.assertLess(key_tile, seq_len)
            online = eager_prefill(query, views, block_row, seq_len, ratio, scale)
            self.assertEqual(
                calls,
                [(0, 40), (40, 80), (80, seq_len)],
            )
            zeros = [[0.0] * D, [0.0] * D]
            write_token(blob, base + seq_len - 1, zeros, zeros)
            masked = eager_prefill(query, views, block_row, seq_len, ratio, scale)
        finally:
            dequant.gather_dequant_range = real
            dequant.SCORE_TILE_BYTES = saved_score
            dequant.KEY_TILE_MAX = saved_key
        self.assertEqual(tuple(online.shape), (q_len, HQ, D))
        self.assertTrue(torch.allclose(one, online, atol=1e-4, rtol=1e-4))
        self.assertTrue(torch.allclose(online[0], masked[0], atol=1e-5, rtol=1e-5))
        self.assertGreater((online[-1] - masked[-1]).abs().max().item(), 1e-4)


if __name__ == "__main__":
    unittest.main()
