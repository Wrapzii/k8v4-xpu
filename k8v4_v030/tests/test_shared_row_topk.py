"""CPU check: one top-k on a shared score row matches top-k on copied rows.

Graph decode scores one historical row and used to expand it to seven
identical MTP queries before torch.topk. The shared-row path ranks row 0
and still unions each position's own block.
"""

from __future__ import annotations

import unittest

import torch

from k8v4_v030.qsa_ops import _visible_graph
from k8v4_v030.qsa_ref import QsaHyper


def _row(width: int) -> torch.Tensor:
    values = torch.arange(width, 0, -1, dtype=torch.float32)
    return values[torch.randperm(width)].reshape(1, width)


class SharedRowTopkTest(unittest.TestCase):
    def test_one_row_matches_topk_on_duplicated_rows(self):
        width = 64
        row = _row(width)
        row = row.clone()
        row[:, 30:] = float("-inf")
        expanded = row.expand(7, width).contiguous()
        counts = torch.tensor([30, 31, 32, 33, 34, 35, 36], dtype=torch.int32)
        cells = torch.tensor([40, 48, 56, 64, 72, 80, 88], dtype=torch.int32)
        hyper = QsaHyper(top_tokens=32)
        out_width = int(hyper.budget) + int(hyper.ratio)
        shared = _visible_graph(
            row, counts, cells, hyper, out_width, premasked=True, shared_row=True,
        )
        copied = _visible_graph(
            expanded, counts, cells, hyper, out_width, premasked=True, shared_row=False,
        )
        self.assertEqual(tuple(shared.shape), (7, out_width))
        self.assertTrue(torch.equal(shared, copied))

    def test_full_matrix_flag_matches_the_single_row(self):
        width = 64
        row = _row(width)
        row[:, 30:] = float("-inf")
        expanded = row.expand(7, width).contiguous()
        counts = torch.tensor([30, 31, 32, 33, 34, 35, 36], dtype=torch.int32)
        cells = torch.tensor([40, 48, 56, 64, 72, 80, 88], dtype=torch.int32)
        hyper = QsaHyper(top_tokens=32)
        out_width = int(hyper.budget) + int(hyper.ratio)
        single = _visible_graph(
            row, counts, cells, hyper, out_width, premasked=True, shared_row=True,
        )
        flagged = _visible_graph(
            expanded, counts, cells, hyper, out_width, premasked=True, shared_row=True,
        )
        self.assertTrue(torch.equal(single, flagged))

    def test_own_blocks_still_differ(self):
        width = 64
        row = _row(width)
        row[:, 24:] = float("-inf")
        counts = torch.tensor([24, 24], dtype=torch.int32)
        cells = torch.tensor([40, 100], dtype=torch.int32)
        hyper = QsaHyper(top_tokens=32)
        out_width = int(hyper.budget) + int(hyper.ratio)
        visible = _visible_graph(
            row, counts, cells, hyper, out_width, premasked=True, shared_row=True,
        )
        self.assertFalse(torch.equal(visible[0], visible[1]))
        self.assertTrue(bool((visible[0] == 40).any()))
        self.assertTrue(bool((visible[1] == 100).any()))
        self.assertFalse(bool((visible[0] == 100).any()))

    def test_mismatched_rows_still_raise(self):
        hyper = QsaHyper(top_tokens=32)
        scores = torch.zeros(1, 8)
        counts = torch.ones(7, dtype=torch.int32)
        cells = torch.arange(7, dtype=torch.int32)
        with self.assertRaises(ValueError):
            _visible_graph(scores, counts, cells, hyper, 36, premasked=True)

    def test_unmasked_shared_row_uses_the_representative_count(self):
        width = 32
        row = torch.arange(width, 0, -1, dtype=torch.float32).reshape(1, width)
        counts = torch.tensor([8, 20], dtype=torch.int32)
        cells = torch.tensor([40, 80], dtype=torch.int32)
        hyper = QsaHyper(top_tokens=16)
        out_width = int(hyper.budget) + int(hyper.ratio)
        shared = _visible_graph(
            row, counts, cells, hyper, out_width, premasked=False, shared_row=True,
        )
        masked = row.clone()
        masked[:, 8:] = float("-inf")
        copied = _visible_graph(
            masked.expand(2, width).contiguous(),
            counts,
            cells,
            hyper,
            out_width,
            premasked=True,
            shared_row=False,
        )
        self.assertTrue(torch.equal(shared, copied))


if __name__ == "__main__":
    unittest.main()
