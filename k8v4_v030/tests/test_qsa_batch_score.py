"""CPU contract for the batched c4 indexer score.

The XPU companion library is optional here. These tests lock the page map,
the per-request numerics, and the rule that capture does not shrink the
score width or read a live count.
"""

from __future__ import annotations

import math
import os
import unittest

import torch

from k8v4_v030.qsa_batch_score import (
    _batched_i8_kernel,
    score_paged_multi,
    scored_width,
    static_score_width,
)
from k8v4_v030.qsa_pooled_quant import dequantize_pooled_rows
from k8v4_v030.qsa_ref import score_blocks


def _hand_page(block: int, table: list[int], ratio: int) -> tuple[int, int]:
    tok = int(block) * 4
    logical = tok // 64
    off = tok % 64
    if ratio == 1:
        page = int(table[logical])
    else:
        page = int(table[logical // ratio]) * ratio + logical % ratio
    micro = (page * 64 + off) // 4
    return page, micro


def _identity_table(n_pages: int) -> torch.Tensor:
    return torch.arange(n_pages, dtype=torch.int32)


class WidthTest(unittest.TestCase):
    def test_static_width_matches_the_graph_fit(self):
        # bt=(126,) and 33 pages per KV block is the shape behind width=65536.
        self.assertEqual(static_score_width(126, 33, 65536), 65536)
        self.assertEqual(static_score_width(126, 1, 65536), (126 * 64) // 4 - 1)
        self.assertEqual(static_score_width(4, 1, 3), 3)

    def test_capture_keeps_the_static_width_and_does_not_read_counts(self):
        self.assertEqual(
            scored_width(65536, [3, 5], capturing=True, host_counts=True),
            65536,
        )
        self.assertEqual(
            scored_width(65536, [3, 5], capturing=False, host_counts=False),
            65536,
        )
        counts = torch.tensor([2, 9, 4], dtype=torch.int32)
        self.assertEqual(scored_width(100, counts, capturing=False, host_counts=True), 9)
        self.assertEqual(scored_width(100, counts, capturing=True, host_counts=True), 100)
        self.assertEqual(scored_width(8, counts, capturing=False, host_counts=True), 8)

    def test_c4_body_scores_the_roster_once(self):
        # Read the source. Importing qsa_runtime here would make the runtime
        # import-isolation test fail when this module is collected first.
        path = os.path.join(os.path.dirname(__file__), os.pardir, "qsa_runtime.py")
        text = open(path, encoding="utf-8").read()
        start = text.index("def _run_c4_graph_decode")
        end = text.index("\ndef _run_graph_decode")
        src = text[start:end]
        self.assertIn("score_paged_multi", src)
        self.assertNotIn("score_pooled_paged", src)
        self.assertNotIn("_run_graph_decode", src)


class ScoreTest(unittest.TestCase):
    def test_identity_rows_match_score_blocks(self):
        torch.manual_seed(4)
        pooled = torch.randn(16, 128, dtype=torch.float64)
        valid = torch.ones(16, dtype=torch.bool)
        valid[3] = False
        pooled[3] = float("nan")
        table = _identity_table(2)
        query = torch.randn(4, 128, dtype=torch.float64)
        counts = torch.tensor([6], dtype=torch.int32)
        got = score_paged_multi(
            query.unsqueeze(0), pooled, valid, table.unsqueeze(0),
            counts, 1, 8,
        )
        self.assertEqual(tuple(got.shape), (1, 8))
        for block in range(8):
            page, micro = _hand_page(block, [0, 1], 1)
            self.assertEqual(micro, block)
            column = got[0, block]
            if block >= 6 or not bool(valid[micro]) or page < 0:
                self.assertTrue(math.isinf(float(column)) and float(column) < 0)
                continue
            expect = score_blocks(query, pooled[micro:micro + 1])
            self.assertTrue(torch.allclose(column.double(), expect.reshape(())))

    def test_four_requests_match_their_own_tables(self):
        torch.manual_seed(11)
        pooled = torch.randn(64, 128, dtype=torch.float64)
        valid = torch.ones(64, dtype=torch.bool)
        queries = torch.randn(4, 4, 128, dtype=torch.float64)
        # Distinct maps so a broadcast of request 0 cannot pass.
        tables = [
            torch.arange(4, dtype=torch.int32),
            torch.tensor([2, 0, 1, 3], dtype=torch.int32),
            torch.tensor([1, 1, 0, 2], dtype=torch.int32),
            torch.tensor([3, 2, 1, 0], dtype=torch.int32),
        ]
        counts = torch.tensor([3, 7, 1, 5], dtype=torch.int32)
        block_table = torch.stack(tables, 0)
        width = scored_width(16, counts, capturing=False, host_counts=True)
        self.assertEqual(width, 7)
        got = score_paged_multi(queries, pooled, valid, block_table, counts, 1, width)
        self.assertEqual(tuple(got.shape), (4, 7))
        for req in range(4):
            solo = score_paged_multi(
                queries[req:req + 1], pooled, valid,
                tables[req].unsqueeze(0), counts[req:req + 1], 1, width,
            )
            self.assertTrue(torch.equal(got[req], solo[0]))
            for block in range(width):
                page, micro = _hand_page(block, tables[req].tolist(), 1)
                column = got[req, block]
                if block >= int(counts[req]) or page < 0 or micro < 0 or micro >= 64 or not bool(valid[micro]):
                    self.assertTrue(math.isinf(float(column)) and float(column) < 0)
                else:
                    expect = score_blocks(queries[req], pooled[micro:micro + 1])
                    self.assertTrue(torch.allclose(column.double(), expect.reshape(())))
        # A short request stays -inf where a longer one still has a finite score.
        self.assertTrue(math.isinf(float(got[0, 3])) and float(got[0, 3]) < 0)
        self.assertTrue(math.isfinite(float(got[1, 3])))

    def test_static_tail_is_negative_inf_without_using_invalid_keys(self):
        pooled = torch.ones(8, 128, dtype=torch.float64)
        pooled[1] = float("nan")
        valid = torch.tensor([True, False, True, True, True, True, True, True])
        query = torch.ones(1, 4, 128)
        table = _identity_table(1).unsqueeze(0)
        counts = torch.tensor([4], dtype=torch.int32)
        # Capture-sized buffer: do not clamp, and do not let the NaN key leak.
        got = score_paged_multi(query, pooled.float(), valid, table, counts, 1, n_blocks=6)
        self.assertEqual(tuple(got.shape), (1, 6))
        self.assertTrue(math.isfinite(float(got[0, 0])))
        self.assertTrue(math.isinf(float(got[0, 1])) and float(got[0, 1]) < 0)
        self.assertTrue(math.isfinite(float(got[0, 2])))
        self.assertTrue(math.isinf(float(got[0, 4])) and float(got[0, 4]) < 0)
        self.assertFalse(torch.isnan(got).any())

    def test_ratio_pages_follow_the_kernel_map(self):
        torch.manual_seed(2)
        pooled = torch.randn(40, 128, dtype=torch.float64)
        valid = torch.ones(40, dtype=torch.bool)
        query = torch.randn(4, 128, dtype=torch.float64)
        # ratio 2 and table[0]=1 maps block 0 to pooled row 32, not row 0.
        table = torch.tensor([1, 0, 2], dtype=torch.int32)
        counts = torch.tensor([5], dtype=torch.int32)
        got = score_paged_multi(
            query.unsqueeze(0), pooled, valid, table.unsqueeze(0),
            counts, 2, 5,
        )
        self.assertNotEqual(_hand_page(0, table.tolist(), 2)[1], 0)
        for block in range(5):
            page, micro = _hand_page(block, table.tolist(), 2)
            expect = score_blocks(query, pooled[micro:micro + 1])
            self.assertGreaterEqual(page, 0)
            self.assertTrue(torch.allclose(got[0, block].double(), expect.reshape(())))

    def test_int8_scales_match_the_dequantized_rows(self):
        torch.manual_seed(6)
        raw = torch.randn(8, 128)
        scale = torch.rand(8).add(0.1)
        quant = torch.clamp(torch.round(raw / scale.unsqueeze(-1)), -127, 127).to(torch.int8)
        query = torch.randn(1, 4, 128)
        table = _identity_table(1).unsqueeze(0)
        counts = torch.tensor([4], dtype=torch.int32)
        valid = torch.ones(8, dtype=torch.bool)
        got = score_paged_multi(query, quant, valid, table, counts, 1, 4, scales=scale)
        pooled = dequantize_pooled_rows(quant, scale).double()
        for block in range(4):
            expect = score_blocks(query[0].double(), pooled[block:block + 1])
            self.assertTrue(torch.allclose(got[0, block].double(), expect.reshape(())))

    def test_int8_entry_point_is_selected_only_when_present(self):
        class Ready:
            def qsa_score_paged_multi_i8(self):
                return None

        pooled = torch.zeros(4, 128, dtype=torch.int8)
        scales = torch.ones(4)
        self.assertTrue(_batched_i8_kernel(Ready(), pooled, scales))
        self.assertFalse(_batched_i8_kernel(Ready(), torch.zeros(4, 128), scales))
        self.assertFalse(_batched_i8_kernel(object(), pooled, scales))
        self.assertFalse(_batched_i8_kernel(Ready(), pooled, None))
        self.assertFalse(_batched_i8_kernel(None, pooled, scales))


if __name__ == "__main__":
    unittest.main()
