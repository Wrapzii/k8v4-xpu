"""CPU checks for one historical QSA selection per MTP verify step.

Scoring every draft query is the old behavior. These tests require the
shared historical top-k, and they still require each position's own block.
They do not require queries 1..6 to match an independent per-query top-k.
"""

from __future__ import annotations

import os
import unittest

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.oracle import deterministic_rows
from k8v4_v030.qsa_cache import all_banks, reset_caches
from k8v4_v030.qsa_config import HIDDEN
from k8v4_v030.qsa_ops import attend_selected, choose_blocks, mask_query_scores
from k8v4_v030.qsa_ref import (
    QsaHyper,
    apply_q_rope,
    cells_for_queries,
    complete_blocks,
    project_indexer,
    topk_block_ids,
)
from k8v4_v030.qsa_rope import normalize_positions
from k8v4_v030.qsa_runtime import (
    _first_live_index,
    _request_scores,
    _score_once_and_expand,
    note_hidden,
    try_sparse_forward,
)
from k8v4_v030.qsa_stats import qsa_stats_reset, qsa_stats_snapshot
from k8v4_v030.qsa_weights import make_random_bank, reset_bank, set_bank
from k8v4_v030.tests.test_qsa_runtime import (
    _Impl,
    _Layer,
    _Meta,
    _expected,
    _expected_reused,
    _page,
    _rows,
)


class ScoreOnceTest(unittest.TestCase):
    def test_broadcasts_one_row_and_keeps_the_batch_shape(self):
        calls = []

        def score_one(query, counts):
            calls.append((tuple(query.shape), None if counts is None else list(counts)))
            return query

        query = torch.arange(14, dtype=torch.float64).reshape(7, 2)
        out = _score_once_and_expand(query, None, score_one)
        self.assertEqual(calls, [((1, 2), None)])
        self.assertEqual(tuple(out.shape), (7, 2))
        self.assertTrue(torch.equal(out, query[:1].expand(7, 2)))

    def test_padding_selects_the_first_live_row_on_device(self):
        calls = []

        def score_one(query, counts):
            calls.append((query.detach().clone(), counts.detach().clone()))
            return query

        query = (torch.arange(7, dtype=torch.float64) + 10).reshape(7, 1)
        counts = torch.arange(1, 8)
        valid = torch.tensor([False, False, True, True, False, False, False])
        out = _score_once_and_expand(query, counts, score_one, valid=valid)
        self.assertEqual(len(calls), 1)
        self.assertTrue(torch.equal(calls[0][0], query[2:3]))
        self.assertTrue(torch.equal(calls[0][1], counts[2:3]))
        self.assertTrue(torch.equal(out, query[2:3].expand(7, 1)))
        # The helper keeps this index on device. Reading it here is the test.
        self.assertTrue(
            torch.equal(_first_live_index(7, valid, query.device), torch.tensor([2]))
        )

    def test_all_padding_falls_back_to_row_zero(self):
        valid = torch.zeros(4, dtype=torch.bool)
        self.assertTrue(
            torch.equal(_first_live_index(4, valid, torch.device("cpu")), torch.tensor([0]))
        )

    def test_host_counts_cannot_follow_a_device_mask(self):
        query = torch.ones(2, 1)
        with self.assertRaises(RuntimeError):
            _score_once_and_expand(
                query, [1, 2], lambda q, c: q, valid=torch.tensor([True, True])
            )


class MtpReuseTest(unittest.TestCase):
    def setUp(self):
        os.environ.pop("K8V4_QSA_FORCE_ALL", None)
        os.environ.pop("K8V4_QSA_GRAPH", None)
        os.environ.pop("K8V4_QSA_PAGED_SCORE", None)
        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        os.environ["K8V4_QSA"] = "1"
        reset_caches()
        reset_bank()
        qsa_stats_reset()

    def tearDown(self):
        os.environ.pop("K8V4_QSA", None)
        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        os.environ.pop("K8V4_QSA_STATS", None)
        reset_caches()
        reset_bank()
        qsa_stats_reset()

    def test_reused_hist_matches_query0_and_not_an_independent_later_query(self):
        """Hand-built scores: a later query would pick different blocks alone."""
        hyper = QsaHyper(top_tokens=8)  # n_sel = 2
        self.assertEqual(hyper.n_sel, 2)
        target = torch.tensor([5.0, 4.0, 1.0, 9.0, 8.0], dtype=torch.float64)
        later = torch.tensor([0.0, 1.0, 5.0, 4.0, 3.0], dtype=torch.float64)
        shared = _score_once_and_expand(
            torch.stack([target, later]), None, lambda query, _counts: query,
        )
        shared = mask_query_scores(shared, [3, 3], None)
        cells = [11, 16]  # counts 3 and 4; own blocks 2 and 4
        counts = [complete_blocks(cell, hyper.ratio) for cell in cells]
        self.assertEqual(counts, [3, 4])
        hists = []
        chosen_rows = []
        for row, count, cell in zip(shared, counts, cells):
            hists.append(topk_block_ids(row[: counts[0]], hyper.n_sel))
            chosen, _width = choose_blocks(row, count, cell, hyper, False)
            chosen_rows.append(chosen)
            self.assertIn(cell // hyper.ratio, chosen)
        self.assertEqual(hists, [[0, 1], [0, 1]])
        self.assertNotIn(cells[0] // hyper.ratio, hists[0])
        self.assertNotEqual(chosen_rows[0], chosen_rows[1])
        # Independent later query: top-2 of [0, 1, 5] is blocks 2 then 1.
        self.assertNotEqual(topk_block_ids(later[:3], hyper.n_sel), hists[1])
        self.assertEqual(topk_block_ids(target[:3], hyper.n_sel), hists[0])

    def test_verify_span_scores_the_target_once_and_unions_own_blocks(self):
        hkv = 2
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        bank = make_random_bank(9, layers=(3,))
        weights = bank.get(3)
        assert weights is not None
        set_bank(bank)
        hist, q_len = 13, 7
        seq_len = hist + q_len
        key = deterministic_rows(seq_len, hkv, 40)
        value = deterministic_rows(seq_len, hkv, 41)
        cache = _page(hkv, key, value)
        hidden_all = torch.randn(seq_len, HIDDEN)
        note_hidden(3, hidden_all[:hist], torch.arange(hist))
        hist_query = _rows(hist, impl.layout.hq, 42)
        self.assertFalse(
            try_sparse_forward(
                impl, layer, hist_query, cache,
                _Meta(hist, hist, hkv, torch.arange(hist)),
                torch.zeros_like(hist_query),
            )
        )
        os.environ["K8V4_QSA_TOP_TOKENS"] = "8"
        hyper = QsaHyper()
        self.assertEqual(hyper.n_sel, 2)
        query = _rows(q_len, impl.layout.hq, 43)
        output = torch.zeros_like(query)
        positions = torch.arange(hist, seq_len)
        note_hidden(3, hidden_all[hist:], positions)
        meta = _Meta(seq_len, q_len, hkv, torch.arange(hist, seq_len))
        self.assertTrue(try_sparse_forward(impl, layer, query, cache, meta, output))
        stored = all_banks()[0].layers[3]
        cells = cells_for_queries(seq_len, q_len)
        counts = [complete_blocks(cell, hyper.ratio) for cell in cells]
        self.assertGreater(counts[0], hyper.n_sel)
        self.assertEqual(len(cells), 7)
        reused = _expected_reused(
            stored, weights, hidden_all[hist:], positions, seq_len, q_len,
            meta.block_table[0], 1,
        )
        independent = _expected(
            stored, weights, hidden_all[hist:], positions, seq_len, q_len,
            meta.block_table[0], 1,
        )
        views = bind_regions(cache, impl.layout)
        expect = attend_selected(query, views, meta.block_table[0], seq_len, reused, 1)
        self.assertTrue(torch.equal(output, expect))
        # Query 0 is the representative, so its visible row matches the old scorer.
        self.assertEqual(reused[0], independent[0])
        q_idx, _key = project_indexer(
            hidden_all[hist:], weights.q_proj, weights.k_proj,
            weights.q_norm, weights.k_norm, hyper,
        )
        q_idx = apply_q_rope(q_idx, normalize_positions(positions, q_len), hyper)
        import k8v4_v030.qsa_runtime as runtime
        calls = []
        original = runtime.score_blocks

        def wrapped(query_row, pooled):
            calls.append(tuple(query_row.shape))
            return original(query_row, pooled)

        runtime.score_blocks = wrapped
        try:
            scores, device_ids = _request_scores(
                stored, q_idx, meta.block_table[0], counts, 1, hyper, False,
            )
        finally:
            runtime.score_blocks = original
        self.assertIsNone(device_ids)
        self.assertEqual(calls, [(1, 4, 128)])
        self.assertEqual(tuple(scores.shape), (q_len, scores.shape[1]))
        for row in scores[1:]:
            self.assertTrue(torch.equal(row, scores[0]))
        hists = [topk_block_ids(scores[i][: counts[0]], hyper.n_sel) for i in range(q_len)]
        self.assertEqual(hists, [hists[0]] * q_len)
        chosen_rows = []
        for row, count, cell in zip(scores, counts, cells):
            chosen, _width = choose_blocks(row, count, cell, hyper, False)
            chosen_rows.append(chosen)
            self.assertIn(cell // hyper.ratio, chosen)
        self.assertNotEqual(chosen_rows[0], chosen_rows[-1])

    def test_prefill_that_starts_inside_the_budget_still_scores_every_query(self):
        """The q_len=16 crossing prefill must not collapse onto query 0."""
        hkv = 2
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        bank = make_random_bank(11, layers=(3,))
        weights = bank.get(3)
        assert weights is not None
        set_bank(bank)
        os.environ["K8V4_QSA_TOP_TOKENS"] = "8"
        seq_len = 16
        key = deterministic_rows(seq_len, hkv, 60)
        value = deterministic_rows(seq_len, hkv, 61)
        cache = _page(hkv, key, value)
        query = _rows(seq_len, impl.layout.hq, 62)
        hidden = torch.randn(seq_len, HIDDEN)
        positions = torch.arange(seq_len)
        meta = _Meta(seq_len, seq_len, hkv, torch.arange(seq_len))
        output = torch.zeros_like(query)
        note_hidden(3, hidden, positions)
        self.assertTrue(try_sparse_forward(impl, layer, query, cache, meta, output))
        stored = all_banks()[0].layers[3]
        visible = _expected(
            stored, weights, hidden, positions, seq_len, seq_len, meta.block_table[0], 1,
        )
        self.assertEqual(visible[0], [0])
        self.assertEqual(visible[7], list(range(8)))
        self.assertNotEqual(visible[-1], list(range(seq_len)))
        hyper = QsaHyper()
        cells = cells_for_queries(seq_len, seq_len)
        counts = [complete_blocks(cell, hyper.ratio) for cell in cells]
        self.assertLessEqual(counts[0], hyper.n_sel)
        q_idx, _key = project_indexer(
            hidden, weights.q_proj, weights.k_proj, weights.q_norm, weights.k_norm, hyper,
        )
        q_idx = apply_q_rope(q_idx, normalize_positions(positions, seq_len), hyper)
        import k8v4_v030.qsa_runtime as runtime
        calls = []
        original = runtime.score_blocks

        def wrapped(query_row, pooled):
            calls.append(tuple(query_row.shape))
            return original(query_row, pooled)

        runtime.score_blocks = wrapped
        try:
            _request_scores(stored, q_idx, meta.block_table[0], counts, 1, hyper, False)
        finally:
            runtime.score_blocks = original
        self.assertEqual(len(calls), seq_len)
        self.assertTrue(all(len(shape) == 2 for shape in calls))

    def test_draft_modules_stay_dense(self):
        """Checkpoint indexers are the 16 target layers. Draft names do not get QSA.

        ``draft.mtp.layers.0`` is not a full-attention index, so it stops at
        ``not_full_attn`` before the MTP name check. ``draft.mtp.layers.3``
        resolves to a trained layer and is still left dense, reason ``no_layer``.
        """
        os.environ["K8V4_QSA_STATS"] = "1"
        qsa_stats_reset()
        hkv = 2
        impl = _Impl(hkv)
        set_bank(make_random_bank(1, layers=(3,)))
        query = _rows(1, impl.layout.hq, 1)
        cache = _page(hkv, deterministic_rows(4, hkv, 2), deterministic_rows(4, hkv, 3))
        meta = _Meta(4, 1, hkv, torch.tensor([3]))
        output = torch.zeros_like(query)
        note_hidden(0, torch.zeros(1, HIDDEN), torch.tensor([3]))
        self.assertFalse(
            try_sparse_forward(impl, _Layer("draft.mtp.layers.0"), query, cache, meta, output)
        )
        self.assertEqual(qsa_stats_snapshot()["decode"]["not_full_attn"], 1)
        self.assertEqual(qsa_stats_snapshot()["decode"]["no_layer"], 0)
        note_hidden(3, torch.zeros(1, HIDDEN), torch.tensor([3]))
        self.assertFalse(
            try_sparse_forward(impl, _Layer("draft.mtp.layers.3"), query, cache, meta, output)
        )
        self.assertEqual(qsa_stats_snapshot()["decode"]["no_layer"], 1)
        self.assertTrue(torch.equal(output, torch.zeros_like(query)))


if __name__ == "__main__":
    unittest.main()
