"""CPU checks for head-major K8/V4 prefill. The fused .so is XPU-only."""

from __future__ import annotations

import os
import unittest

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030 import dequant
from k8v4_v030.dequant import eager_gqa_attention, eager_prefill, gather_dequant, gather_dequant_head
from k8v4_v030.layout import D, PAGE, PageLayout, V4_COLS
from k8v4_v030.onednn_prefill import (
    head_major_attention,
    head_major_prefill,
    prefill_mode,
    query_pad_rows,
    score_group_reference,
    sdpa_ops_for,
)
from k8v4_v030.oracle import deterministic_rows
from k8v4_v030.paged import read_token, write_token

TP2 = PageLayout(2)
TP1 = PageLayout(4)
LAYOUTS = (TP2, TP1)


def _pack(block_row: list[int], ratio: int, keys, values, layout: PageLayout):
    pages = []
    for block_id in block_row:
        base = int(block_id) * ratio
        pages.extend(base + sub for sub in range(ratio))
    nbytes = (max(pages) + 1) * layout.page_bytes
    blob = bytearray(nbytes)
    for token in range(len(keys)):
        logical = token // PAGE
        phys = pages[logical]
        write_token(blob, phys * PAGE + (token % PAGE), keys[token], values[token])
    raw = torch.frombuffer(blob, dtype=torch.int8)
    return raw, torch.tensor(block_row, dtype=torch.int32)


class HeadMajorPrefillTest(unittest.TestCase):
    def test_default_mode_stays_eager_and_xpu_refuses_a_missing_library(self):
        saved = os.environ.pop("K8V4_PREFILL", None)
        try:
            self.assertEqual(prefill_mode(), "eager")
            os.environ["K8V4_PREFILL"] = "onednn"
            self.assertEqual(prefill_mode(), "onednn")
            os.environ["K8V4_PREFILL"] = "turbo"
            with self.assertRaises(RuntimeError):
                prefill_mode()
        finally:
            if saved is None:
                os.environ.pop("K8V4_PREFILL", None)
            else:
                os.environ["K8V4_PREFILL"] = saved
        self.assertIsNone(sdpa_ops_for("cpu"))
        saved_lib = os.environ.get("K8V4_SDPA_LIB")
        os.environ["K8V4_SDPA_LIB"] = os.path.join("C:\\", "no", "such", "libk8v4_sdpa.so")
        try:
            with self.assertRaises(RuntimeError):
                sdpa_ops_for("xpu")
        finally:
            if saved_lib is None:
                os.environ.pop("K8V4_SDPA_LIB", None)
            else:
                os.environ["K8V4_SDPA_LIB"] = saved_lib

    def test_one_head_matches_the_full_gather_and_copies_one_head(self):
        import k8v4_v030.dequant as dequant

        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                ratio = 33
                block_id = 4
                seq_len = PAGE + 5
                keys = deterministic_rows(seq_len, layout.hkv, seed=41)
                values = deterministic_rows(seq_len, layout.hkv, seed=42)
                raw, block_row = _pack([block_id], ratio, keys, values, layout)
                views = bind_regions(raw, layout)
                full_k, full_v = gather_dequant(views, block_row, seq_len, ratio, torch.float32)
                for head in range(layout.hkv):
                    got_k, got_v = gather_dequant_head(
                        views, block_row, seq_len, head, ratio, torch.float32
                    )
                    self.assertEqual(tuple(got_k.shape), (seq_len, D))
                    self.assertEqual(tuple(got_v.shape), (seq_len, D))
                    self.assertTrue(torch.allclose(got_k, full_k[:, head, :], atol=1e-5, rtol=1e-5))
                    self.assertTrue(torch.allclose(got_v, full_v[:, head, :], atol=1e-5, rtol=1e-5))
                    k_shape, v_shape = dequant.last_head_copy_shapes
                    self.assertEqual(k_shape, (2, PAGE, D))
                    self.assertEqual(v_shape, (2, PAGE, V4_COLS))
                    self.assertEqual(len(k_shape), 3)
                with self.assertRaises(RuntimeError):
                    gather_dequant_head(views, block_row, seq_len, layout.hkv, ratio, torch.float32)

    def test_permuted_block_table_keeps_logical_order(self):
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                ratio = 1
                order = [5, 1, 9]
                seq_len = 2 * PAGE + 10
                q_len = 5
                keys = deterministic_rows(seq_len, layout.hkv, seed=51)
                values = deterministic_rows(seq_len, layout.hkv, seed=52)
                raw, block_row = _pack(order, ratio, keys, values, layout)
                views = bind_regions(raw, layout)
                generator = torch.Generator().manual_seed(3)
                query = torch.randn(q_len, layout.hq, D, generator=generator)
                scale = 1.0 / (D ** 0.5)
                got = head_major_prefill(query, views, block_row, seq_len, ratio, scale, bucket=8)
                eager = eager_prefill(query, views, block_row, seq_len, ratio, scale)
                self.assertEqual(tuple(got.shape), (q_len, layout.hq, D))
                self.assertTrue(torch.allclose(got, eager, atol=1e-5, rtol=1e-5))
                identity = torch.tensor([0, 1, 2], dtype=torch.int32)
                wrong = head_major_prefill(query, views, identity, seq_len, ratio, scale, bucket=8)
                self.assertGreater((got - wrong).abs().max().item(), 1e-3)
                blob = bytes(raw.numpy())
                stored_k, _ = read_token(blob, order[0] * PAGE, layout)
                got_k, _ = gather_dequant_head(views, block_row, seq_len, 0, ratio, torch.float32)
                self.assertLess(abs(float(got_k[0, 0]) - stored_k[0][0]), 1e-5)
                empty_k, _ = read_token(blob, 0, layout)
                self.assertLess(abs(empty_k[0][0]), 1e-8)
                masked_v = [row[:] for row in values]
                masked_v[-1] = [[0.0] * D for _ in range(layout.hkv)]
                raw2, _ = _pack(order, ratio, keys, masked_v, layout)
                masked = head_major_prefill(
                    query, bind_regions(raw2, layout), block_row, seq_len, ratio, scale, bucket=8
                )
                self.assertTrue(torch.allclose(got[0], masked[0], atol=1e-5, rtol=1e-5))
                self.assertGreater((got[-1] - masked[-1]).abs().max().item(), 1e-4)

    def test_suffix_chunk_and_query_pad_do_not_move_the_real_rows(self):
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                seq_len = 10
                q_len = 3
                generator = torch.Generator().manual_seed(11)
                key = torch.randn(seq_len, layout.hkv, D, generator=generator)
                value = torch.randn(seq_len, layout.hkv, D, generator=generator)
                query = torch.randn(q_len, layout.hq, D, generator=generator)
                scale = 1.0 / (D ** 0.5)
                oracle = eager_gqa_attention(query, key, value, scale)
                self.assertEqual(query_pad_rows(q_len, 256), 256)
                wide = head_major_attention(query, key, value, scale, bucket=256)
                narrow = head_major_attention(query, key, value, scale, bucket=4)
                self.assertTrue(torch.allclose(wide, oracle, atol=1e-4, rtol=1e-4))
                self.assertTrue(torch.allclose(narrow, wide, atol=1e-5, rtol=1e-5))
                self.assertTrue(torch.allclose(wide[0], oracle[0], atol=1e-4, rtol=1e-4))
                longer = torch.cat([key, torch.zeros(1, layout.hkv, D)], dim=0)
                with self.assertRaises(RuntimeError):
                    score_group_reference(
                        query[:, : layout.gqa, :], longer[:, 0, :], value[:, 0, :], scale, seq_len, q_len
                    )

    def test_manager_blocks_of_33_pages_follow_the_table(self):
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                ratio = 33
                order = [2, 7]
                seq_len = ratio * PAGE + 3
                q_len = 4
                keys = deterministic_rows(seq_len, layout.hkv, seed=61)
                values = deterministic_rows(seq_len, layout.hkv, seed=62)
                raw, block_row = _pack(order, ratio, keys, values, layout)
                views = bind_regions(raw, layout)
                generator = torch.Generator().manual_seed(13)
                query = torch.randn(q_len, layout.hq, D, generator=generator)
                scale = 1.0 / (D ** 0.5)
                got = head_major_prefill(query, views, block_row, seq_len, ratio, scale, bucket=4)
                eager = eager_prefill(query, views, block_row, seq_len, ratio, scale)
                self.assertTrue(torch.allclose(got, eager, atol=1e-5, rtol=1e-5))
                blob = bytes(raw.numpy())
                for head in range(layout.hkv):
                    got_k, _ = gather_dequant_head(views, block_row, seq_len, head, ratio, torch.float32)
                    first_k, _ = read_token(blob, order[0] * ratio * PAGE, layout)
                    second_k, _ = read_token(blob, order[1] * ratio * PAGE, layout)
                    self.assertLess(abs(float(got_k[0, 0]) - first_k[head][0]), 1e-5)
                    self.assertLess(abs(float(got_k[ratio * PAGE, 0]) - second_k[head][0]), 1e-5)
                    self.assertEqual(dequant_pages(block_row, ratio), (order[0] * ratio, order[1] * ratio))


def dequant_pages(block_row, ratio):
    first = dequant.physical_pages(block_row, 0, 1, ratio).tolist()[0]
    second = dequant.physical_pages(block_row, ratio, ratio + 1, ratio).tolist()[0]
    return first, second


if __name__ == "__main__":
    unittest.main()
