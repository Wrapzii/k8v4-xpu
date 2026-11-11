"""QSA device kernels against the Python spec.

CPU cases always run. Device cases skip unless an XPU is visible and
``libxe2_qsa.so`` is configured. A GPU run of this file belongs behind
bench-hold and does not load a model.
"""

from __future__ import annotations

import os
import unittest

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import PAGE, PageLayout
from k8v4_v030.oracle import deterministic_rows
from k8v4_v030.paged import write_token
from k8v4_v030.qsa_ops import (
    attend_selected,
    causal_visible_rows,
    choose_blocks,
    library_path,
    mask_query_scores,
    packed_visible_rows,
    rows_from_packed,
    score_pooled,
    score_pooled_gemm,
    score_pooled_paged,
    topk_ids,
)
from k8v4_v030.qsa_ref import QsaHyper, score_blocks, select_blocks, visible_tokens


def _cache(hkv: int, key, value):
    layout = PageLayout(hkv)
    n_pages = max(1, (len(key) + PAGE - 1) // PAGE)
    blob = bytearray(n_pages * layout.page_bytes)
    for slot, (k_row, v_row) in enumerate(zip(key, value)):
        write_token(blob, slot, k_row, v_row)
    raw = torch.frombuffer(blob, dtype=torch.int8).clone()
    return raw, layout, n_pages


def _query_tensor(rows, dtype, device):
    return torch.tensor(rows, dtype=dtype, device=device)


class CpuContractTest(unittest.TestCase):
    def test_gemm_score_matches_reference(self):
        gen = torch.Generator().manual_seed(551)
        query = torch.randn(23, 4, 128, generator=gen)
        pooled = torch.randn(83, 128, generator=gen)
        expected = score_blocks(query, pooled).float()
        actual = score_pooled_gemm(query, pooled)
        self.assertTrue(torch.allclose(actual, expected, rtol=1e-5, atol=3e-5),
                        float((actual - expected).abs().max()))

    def test_causal_rows_drop_future_and_duplicates(self):
        # seq 8, q_len 2: ends are 7 and 8. Token 7 is visible only to query 1.
        rows = causal_visible_rows([[7, 1, 1, 9], [7, 0, 3]], seq_len=8, q_len=2)
        self.assertEqual(rows, [[1], [0, 3, 7]])

    def test_cpu_attend_does_not_open_a_missing_library(self):
        key = deterministic_rows(4, 2, 3)
        value = deterministic_rows(4, 2, 4)
        query = deterministic_rows(1, 12, 5)
        raw, layout, _pages = _cache(2, key, value)
        views = bind_regions(raw, layout)
        block_row = torch.arange(1, dtype=torch.int32)
        previous = os.environ.get("XE2_QSA_LIB")
        os.environ["XE2_QSA_LIB"] = (
            "/nonexistent/no-such-libxe2_qsa.so"
        )
        try:
            out = attend_selected(torch.tensor(query), views, block_row, 4, [[0, 1, 2, 3]], 1)
        finally:
            if previous is None:
                os.environ.pop("XE2_QSA_LIB", None)
            else:
                os.environ["XE2_QSA_LIB"] = previous
        self.assertEqual(tuple(out.shape), (1, 12, 256))

    def test_topk_ties_keep_the_lower_id(self):
        scores = torch.tensor(
            [[0.5, 0.5, 1.0, 0.2], [3.0, 3.0, 3.0, 0.0]],
            dtype=torch.float64,
        )
        got = topk_ids(scores, 2)
        self.assertEqual(got.tolist(), [[2, 0], [0, 1]])
        full = topk_ids(scores[:1, :3], 3)
        self.assertEqual(full.tolist(), [[2, 0, 1]])

    def test_masked_scores_rank_like_select_blocks(self):
        hyper = QsaHyper(top_tokens=8)  # two blocks
        raw = torch.tensor(
            [
                [0.2, 0.2, 5.0, 0.0],
                [1.0, 4.0, 4.0, 0.5],
            ],
            dtype=torch.float64,
        )
        valid = torch.tensor([True, False, True, True])
        # Query 0 sees one complete block. Query 1 sees three, past the budget.
        masked = mask_query_scores(raw, [1, 3], valid)
        self.assertTrue(torch.isneginf(masked[0, 1:]).all())
        self.assertTrue(torch.isneginf(masked[1, 1]))
        self.assertTrue(torch.isneginf(masked[1, 3]))
        chosen, width = choose_blocks(masked[1], 3, cell=11, hyper=hyper, force_all=False)
        expect, expect_width = select_blocks(masked[1], 11, hyper, force_all=False)
        self.assertEqual((chosen, width), (expect, expect_width))
        # Block 1 is invalid, so the two finite blocks in range are 0 and 2.
        # The budget keeps both. The own block is 2. Width is 11 % 4 + 1.
        self.assertEqual(chosen, [0, 2])
        self.assertEqual(width, 4)
        short, short_width = choose_blocks(None, 1, cell=3, hyper=hyper, force_all=False)
        self.assertEqual(short, [0])
        self.assertEqual(short_width, 4)

    def test_packed_visible_matches_the_token_lists(self):
        hyper = QsaHyper(top_tokens=8)
        scores = torch.tensor(
            [
                [0.0, 0.0, 0.0],
                [5.0, 4.0, 0.1],
                [0.1, 5.0, 4.0],
                [1.0, 1.0, 0.0],
            ],
            dtype=torch.float64,
        )
        counts = [1, 3, 3, 3]
        cells = [3, 11, 11, 11]
        packed = packed_visible_rows(scores, counts, cells, hyper, False)
        expect = []
        for local, cell in enumerate(cells):
            chosen, width = select_blocks(scores[local], cell, hyper, force_all=False)
            expect.append(visible_tokens(cell, chosen, width, hyper.ratio))
        self.assertEqual(expect[0], [0, 1, 2, 3])
        self.assertEqual(expect[1], list(range(12)))
        self.assertEqual(expect[2], [4, 5, 6, 7, 8, 9, 10, 11])
        self.assertEqual(expect[3], list(range(12)))
        for local, tokens in enumerate(expect):
            row = [int(token) for token in packed[local].tolist() if int(token) >= 0]
            self.assertEqual(row, tokens)
        forced = packed_visible_rows(scores, counts, cells, hyper, True)
        for local, cell in enumerate(cells):
            row = [int(token) for token in forced[local].tolist() if int(token) >= 0]
            self.assertEqual(row, list(range(cell + 1)))

    def test_packed_matrix_matches_token_lists(self):
        key = deterministic_rows(4, 2, 3)
        value = deterministic_rows(4, 2, 4)
        query = deterministic_rows(2, 12, 5)
        raw, layout, _pages = _cache(2, key, value)
        views = bind_regions(raw, layout)
        block_row = torch.arange(1, dtype=torch.int32)
        lists = [[0, 1, 2], [0, 1, 2, 3]]
        packed = torch.full((2, 4), -1, dtype=torch.int32)
        packed[0, :3] = torch.tensor(lists[0], dtype=torch.int32)
        packed[1, :] = torch.tensor(lists[1], dtype=torch.int32)
        q = torch.tensor(query)
        expect = attend_selected(q, views, block_row, 4, lists, 1)
        got = attend_selected(q, views, block_row, 4, packed, 1)
        self.assertTrue(torch.equal(got, expect))
        self.assertEqual(rows_from_packed(packed), lists)


    def test_graph_selector_keeps_budget_plus_own_block(self):
        from k8v4_v030.qsa_ops import _visible_graph, _visible_stable

        hyper = QsaHyper(top_tokens=2048)
        gen = torch.Generator().manual_seed(11)
        scores = torch.randn(3, 600, generator=gen)
        counts = [600, 520, 100]
        cells = [2399, 2080, 403]
        width = hyper.budget + hyper.ratio
        graph = _visible_graph(
            scores,
            torch.tensor(counts, dtype=torch.int32),
            torch.tensor(cells, dtype=torch.int32),
            hyper,
            width,
        )
        stable = _visible_stable(scores, counts, cells, hyper, False, width_override=width)
        self.assertEqual(tuple(graph.shape), (3, width))
        for grow, srow, cell, count in zip(graph.tolist(), stable.tolist(), cells, counts):
            gset = {token for token in grow if token >= 0}
            sset = {token for token in srow if token >= 0}
            self.assertEqual(gset, sset)
            self.assertTrue(all(0 <= token <= cell for token in gset))
            own = cell // hyper.ratio
            self.assertTrue(any(token // hyper.ratio == own for token in gset))
            self.assertLessEqual(len(gset), width)
            if count > hyper.n_sel:
                self.assertLess(len(gset), cell + 1)


def _xpu_available() -> bool:
    return bool(getattr(torch, "xpu", None) and torch.xpu.is_available() and torch.xpu.device_count() > 0)


@unittest.skipUnless(_xpu_available(), "no xpu")
@unittest.skipUnless(library_path() is not None, "no qsa library")
class XpuKernelTest(unittest.TestCase):
    def test_chunked_prefill_plan_matches_unchunked(self):
        from types import SimpleNamespace
        from k8v4_v030.qsa_cache import QsaBlockCache
        from k8v4_v030.qsa_runtime import _plans
        torch.manual_seed(553)
        hyper = QsaHyper(top_tokens=2048)
        cache = QsaBlockCache(40, 64, hyper, device="xpu")
        cache.pooled.copy_(torch.randn_like(cache.pooled))
        cache.pool_valid.fill_(True)
        table = torch.arange(40, dtype=torch.int32, device="xpu").view(1, -1)
        meta = SimpleNamespace(block_table=table, pages_per_block=1)
        query = torch.randn(33, 4, 128, device="xpu")
        requests = [(0, 0, 33, 2200)]
        old_gemm = os.environ.pop("K8V4_QSA_GEMM_SCORE", None)
        old_chunk = os.environ.get("K8V4_QSA_SCORE_CHUNK")
        try:
            reference = _plans(cache, query, requests, meta, hyper)[0][4]
            os.environ["K8V4_QSA_GEMM_SCORE"] = "1"
            os.environ["K8V4_QSA_SCORE_CHUNK"] = "7"
            actual = _plans(cache, query, requests, meta, hyper)[0][4]
        finally:
            if old_gemm is None: os.environ.pop("K8V4_QSA_GEMM_SCORE", None)
            else: os.environ["K8V4_QSA_GEMM_SCORE"] = old_gemm
            if old_chunk is None: os.environ.pop("K8V4_QSA_SCORE_CHUNK", None)
            else: os.environ["K8V4_QSA_SCORE_CHUNK"] = old_chunk
        self.assertEqual(rows_from_packed(actual), rows_from_packed(reference))

    def test_paged_scores_match_gathered_scores(self):
        from k8v4_v030.qsa_cache import QsaBlockCache
        torch.manual_seed(92)
        cache = QsaBlockCache(6, 64, device="xpu")
        cache.pooled.copy_(torch.randn_like(cache.pooled))
        cache.pool_valid.copy_(torch.rand(cache.pool_valid.shape, device="xpu") > .2)
        table = torch.tensor([2, 0, 1], dtype=torch.int32, device="xpu")
        counts = [11, 31, 63]
        q = torch.randn(3, 4, 128, device="xpu")
        pooled, valid = cache.gather_blocks(table, max(counts), 2)
        reference = mask_query_scores(score_pooled(q, pooled), counts, valid)
        actual = score_pooled_paged(q, cache.pooled, cache.pool_valid, table, counts, 2)
        self.assertTrue(torch.equal(torch.isneginf(actual), torch.isneginf(reference)))
        finite = torch.isfinite(reference)
        self.assertTrue(torch.allclose(actual[finite], reference[finite], rtol=1e-5, atol=1e-5))

    def test_gemm_scores_match_device_reference(self):
        torch.manual_seed(221)
        query = torch.randn(33, 4, 128, device="xpu")
        pooled = torch.randn(193, 128, device="xpu")
        previous = os.environ.pop("K8V4_QSA_GEMM_SCORE", None)
        try:
            expected = score_pooled(query, pooled)
            os.environ["K8V4_QSA_GEMM_SCORE"] = "1"
            actual = score_pooled(query, pooled)
        finally:
            if previous is None:
                os.environ.pop("K8V4_QSA_GEMM_SCORE", None)
            else:
                os.environ["K8V4_QSA_GEMM_SCORE"] = previous
        self.assertTrue(torch.allclose(actual, expected, rtol=1e-4, atol=1e-4),
                        float((actual-expected).abs().max()))

    def test_native_decode_cache_matches_reference(self):
        from k8v4_v030.qsa_cache import QsaBlockCache
        from k8v4_v030.qsa_runtime import _write_indexer_cache_native
        hyper = QsaHyper()
        reference = QsaBlockCache(4, 64, hyper, device="xpu")
        actual = QsaBlockCache(4, 64, hyper, device="xpu")
        generator = torch.Generator().manual_seed(419)
        weight = (torch.randn(128, generator=generator) * .2 + 1).to("xpu")
        for slots in ([0, 1, 2], [3, 4, 5, 6, 7, -1], [13, 12, 13, 14, 15, 32],
                      [33, 34, 35, 63, 64, 65, 66, 67]):
            n = len(slots)
            slot_t = torch.tensor(slots, dtype=torch.int64, device="xpu")
            keys = torch.randn(n, 128, generator=generator).to("xpu")
            base = torch.arange(n, dtype=torch.int32) + 262000
            pos = torch.stack((base, base - 123, base - 345, base), dim=1).to("xpu")
            reference.write_tokens(slot_t, keys, pos, weight)
            _write_indexer_cache_native(actual, slot_t, keys, pos, weight, hyper)
            self.assertTrue(torch.equal(reference.raw, actual.raw))
            self.assertTrue(torch.equal(reference.pos, actual.pos))
            self.assertTrue(torch.equal(reference.filled, actual.filled))
            self.assertTrue(torch.equal(reference.pool_valid, actual.pool_valid))
            self.assertTrue(torch.allclose(reference.pooled, actual.pooled, atol=1e-4, rtol=1e-4),
                            float((reference.pooled-actual.pooled).abs().max()))

    def test_cache_update_counts_one_hit_per_call(self):
        from k8v4_v030.qsa_cache import QsaBlockCache
        from k8v4_v030.qsa_runtime import (
            _write_indexer_cache_native,
            ensure_layer_hits,
            flush_layer_hits,
        )

        device = torch.device("xpu")
        hyper = QsaHyper()
        cache = QsaBlockCache(4, 64, hyper, device=device)
        ensure_layer_hits(device)
        flush_layer_hits(device)
        weight = torch.ones(128, device=device)
        slots = torch.tensor([0, 1, 2, 3], dtype=torch.int64, device=device)
        keys = torch.randn(4, 128, device=device)
        pos = torch.arange(16, dtype=torch.int32, device=device).view(4, 4)
        _write_indexer_cache_native(cache, slots, keys, pos, weight, hyper, count_hit=True)
        _write_indexer_cache_native(cache, slots, keys, pos, weight, hyper, count_hit=True)
        self.assertEqual(flush_layer_hits(device), 2)
        self.assertEqual(flush_layer_hits(device), 0)

    def test_visible_selection_large_budget_and_ties(self):
        hyper = QsaHyper(top_tokens=2048)
        gen = torch.Generator().manual_seed(704)
        scores = torch.randint(-4, 5, (4, 1024), generator=gen).float()
        counts = [513, 700, 900, 1024]
        cells = [count * 4 + i for i, count in enumerate(counts)]
        expected = packed_visible_rows(scores.double(), counts, cells, hyper, False)
        actual = packed_visible_rows(scores.to("xpu"), counts, cells, hyper, False)
        self.assertEqual(rows_from_packed(actual), rows_from_packed(expected))
        # Trigger sharded top-k with both short and long rows and tie-heavy scores.
        scores = torch.randint(-8, 9, (5, 12000), generator=gen).float()
        counts = [511, 513, 4095, 4096, 12000]
        cells = [count * 4 + i % 4 for i, count in enumerate(counts)]
        expected = packed_visible_rows(scores.double(), counts, cells, hyper, False)
        actual = packed_visible_rows(scores.to("xpu"), counts, cells, hyper, False)
        self.assertEqual(rows_from_packed(actual), rows_from_packed(expected))
        budget = hyper.budget + hyper.ratio
        for row, cell, count in zip(rows_from_packed(actual), cells, counts):
            own = cell // hyper.ratio
            self.assertLessEqual(len(row), budget)
            self.assertTrue(row)
            self.assertTrue(all(0 <= token <= cell for token in row))
            self.assertTrue(any(token // hyper.ratio == own for token in row))
            non_own = [token for token in row if token // hyper.ratio != own]
            self.assertEqual(len(non_own) % hyper.ratio, 0)
            self.assertLessEqual(len(non_own) // hyper.ratio, hyper.n_sel)
            if count > hyper.n_sel:
                self.assertLess(len(row), cell + 1)


    def test_gathered_prefill_matches_direct_kernel(self):
        """oneDNN on the gathered selection matches direct K8/V4-cell attention."""
        from k8v4_v030.qsa_ops import attend_decode_direct, attend_gathered_sdpa

        hkv, seq_len, q_len = 2, 96, 32
        keys, values = deterministic_rows(seq_len, hkv, 71), deterministic_rows(seq_len, hkv, 72)
        raw, layout, _pages = _cache(hkv, keys, values)
        views = bind_regions(raw.to("xpu"), layout)
        table = torch.arange((seq_len + 63) // 64, dtype=torch.int32, device="xpu")
        rows = []
        for i in range(q_len):
            end = seq_len - q_len + i
            rows.append([token for token in range(end + 1) if token % 3 != 2])
        width = max(len(row) for row in rows)
        visible = torch.full((q_len, width), -1, dtype=torch.int32, device="xpu")
        for i, row in enumerate(rows):
            visible[i, : len(row)] = torch.tensor(row, dtype=torch.int32, device="xpu")
        query = torch.tensor(deterministic_rows(q_len, layout.hq, 73), dtype=torch.float16, device="xpu")
        reference = attend_decode_direct(query, views, table, visible, 1)
        actual = attend_gathered_sdpa(query, views, table, visible, 1)
        self.assertEqual(actual.shape, query.shape)
        self.assertTrue(torch.allclose(actual, reference, atol=0.05, rtol=0.05),
                        float((actual - reference).abs().max()))

    def test_direct_sparse_decode_matches_reference(self):
        from k8v4_v030.qsa_ops import attend_decode_direct
        for hkv in (2, 4):
            with self.subTest(hkv=hkv):
                keys, values = deterministic_rows(200, hkv, 41), deterministic_rows(200, hkv, 42)
                raw, layout, _ = _cache(hkv, keys, values)
                views = bind_regions(raw.to("xpu"), layout)
                table = torch.tensor([1, 0], dtype=torch.int32, device="xpu")
                rows = [list(range(0, 130, 2)), list(range(5, 190, 3))]
                visible = torch.full((2, 150), -1, dtype=torch.int32, device="xpu")
                for i, row in enumerate(rows):
                    visible[i, :len(row)] = torch.tensor(row, dtype=torch.int32, device="xpu")
                query = torch.tensor(deterministic_rows(2, layout.hq, 43),
                                     dtype=torch.float16, device="xpu")
                reference = attend_selected(query, views, table, 200, visible, 2)
                actual = attend_decode_direct(query, views, table, visible, 2)
                self.assertTrue(torch.allclose(actual, reference, atol=.025, rtol=.04),
                                float((actual-reference).abs().max()))

    def test_fused_masked_prefill_matches_pytorch(self):
        from k8v4_v030.qsa_runtime import _masked_prefill
        if not os.path.isfile(os.environ.get("K8V4_SDPA_LIB", "")):
            self.skipTest("experimental masked SDPA library not configured")
        hkv, seq_len, q_len = 2, 70, 32
        raw, layout, n_pages = _cache(hkv, deterministic_rows(seq_len, hkv, 35),
                                      deterministic_rows(seq_len, hkv, 36))
        views = bind_regions(raw.to("xpu"), layout)
        table = torch.arange(n_pages, dtype=torch.int32, device="xpu")
        query = torch.tensor(deterministic_rows(q_len, layout.hq, 37),
                             dtype=torch.float16, device="xpu")
        rows = []
        for i in range(q_len):
            end = seq_len - q_len + i
            rows.append([token for token in range(end + 1) if token % 3 != 2])
        width = max(map(len, rows))
        visible = torch.full((q_len, width), -1, dtype=torch.int32, device="xpu")
        for i, row in enumerate(rows):
            visible[i, :len(row)] = torch.tensor(row, dtype=torch.int32, device="xpu")
        previous = os.environ.pop("K8V4_QSA_FUSED_PREFILL", None)
        previous_chunk = os.environ.get("K8V4_QSA_MASK_CHUNK")
        try:
            reference = _masked_prefill(query, views, table, seq_len, visible, 1, .0625)
            os.environ["K8V4_QSA_FUSED_PREFILL"] = "1"
            os.environ["K8V4_QSA_MASK_CHUNK"] = "9"
            actual = _masked_prefill(query, views, table, seq_len, visible, 1, .0625)
        finally:
            if previous is None:
                os.environ.pop("K8V4_QSA_FUSED_PREFILL", None)
            else:
                os.environ["K8V4_QSA_FUSED_PREFILL"] = previous
            if previous_chunk is None:
                os.environ.pop("K8V4_QSA_MASK_CHUNK", None)
            else:
                os.environ["K8V4_QSA_MASK_CHUNK"] = previous_chunk
        self.assertTrue(torch.allclose(actual, reference, atol=.012, rtol=.03),
                        float((actual-reference).abs().max()))

    def test_native_pack_decode_matches_selected_attention(self):
        from k8v4_v030.qsa_ops import attend_decode_k8v4
        if not os.path.isfile(os.environ.get("XE2_KV_LIB", "")):
            self.skipTest("K8/V4 library not configured")
        for hkv in (2, 4):
            with self.subTest(hkv=hkv):
                keys = deterministic_rows(70, hkv, 31)
                values = deterministic_rows(70, hkv, 32)
                raw, layout, n_pages = _cache(hkv, keys, values)
                views = bind_regions(raw.to("xpu"), layout)
                table = torch.arange(n_pages, dtype=torch.int32, device="xpu")
                visible = torch.tensor([[0, 3, 19, 63, 64, -1], [1, 2, 4, 62, 68, 69]],
                                       dtype=torch.int32, device="xpu")
                query = torch.tensor(deterministic_rows(2, layout.hq, 33),
                                     dtype=torch.float16, device="xpu")
                reference = attend_selected(query, views, table, 70, visible, 1)
                previous = os.environ.get("K8V4_QSA_PACK_NATIVE")
                os.environ["K8V4_QSA_PACK_NATIVE"] = "1"
                try:
                    actual = attend_decode_k8v4(query, views, table, visible, 1)
                finally:
                    if previous is None:
                        os.environ.pop("K8V4_QSA_PACK_NATIVE", None)
                    else:
                        os.environ["K8V4_QSA_PACK_NATIVE"] = previous
                self.assertTrue(torch.allclose(actual, reference, rtol=0.04, atol=0.04),
                                float((actual - reference).abs().max()))

    def test_native_pack_preserves_quantized_rows(self):
        from k8v4_v030.qsa_ops import ops

        for hkv in (2, 4):
            with self.subTest(hkv=hkv):
                layout = PageLayout(hkv)
                source = bind_regions(torch.randint(-128, 127, (4 * layout.page_bytes,),
                                                    dtype=torch.int8, device="xpu"), layout)
                for name in ("k_scale", "v_scale", "v_zero"):
                    source[name].copy_(torch.randn(source[name].shape, device="xpu"))
                dest = bind_regions(torch.zeros(layout.page_bytes, dtype=torch.int8, device="xpu"), layout)
                # Two kernel pages per manager block, with manager blocks swapped.
                block_row = torch.tensor([1, 0], dtype=torch.int32, device="xpu")
                selected = [0, 3, 63, 64, 130, 250]
                visible = torch.tensor(selected + [-1, -1], dtype=torch.int32, device="xpu")
                lengths = torch.empty((1, 2), dtype=torch.int32, device="xpu")
                ops().qsa_pack_kv(source["k"], source["k_scale"], source["v"],
                                  source["v_scale"], source["v_zero"], block_row, visible,
                                  dest["k"], dest["k_scale"], dest["v"], dest["v_scale"],
                                  dest["v_zero"], lengths, 2)
                self.assertEqual(lengths.cpu().tolist(), [[len(selected), len(selected)]])
                for slot, token in enumerate(selected):
                    logical, off = divmod(token, PAGE)
                    phys = [1, 0][logical // 2] * 2 + logical % 2
                    for name in ("k", "k_scale", "v", "v_scale", "v_zero"):
                        self.assertTrue(torch.equal(dest[name][0, slot], source[name][phys, off]), name)

    def test_score_and_topk_match_the_reference(self):
        gen = torch.Generator().manual_seed(11)
        query = torch.randn(3, 4, 128, generator=gen, dtype=torch.float32)
        pooled = torch.randn(6, 128, generator=gen, dtype=torch.float32)
        ref = score_blocks(query, pooled)
        got = score_pooled(query.to("xpu"), pooled.to("xpu")).cpu()
        self.assertTrue(torch.allclose(got, ref.to(torch.float32), rtol=1e-4, atol=1e-4))
        if os.environ.get("QSA_TEST_ESIMD") == "1":
            previous = os.environ.get("QSA_SCORE_ESIMD")
            os.environ["QSA_SCORE_ESIMD"] = "1"
            try:
                esimd = score_pooled(query.to("xpu"), pooled.to("xpu")).cpu()
            finally:
                if previous is None:
                    os.environ.pop("QSA_SCORE_ESIMD", None)
                else:
                    os.environ["QSA_SCORE_ESIMD"] = previous
            self.assertTrue(torch.allclose(esimd, ref.to(torch.float32), rtol=1e-4, atol=1e-4))
        scores = torch.tensor(
            [[0.5, 0.5, 1.0, 0.2], [3.0, 3.0, 3.0, 0.0]],
            dtype=torch.float32,
        )
        ids = topk_ids(scores.to("xpu"), 2).cpu()
        self.assertEqual(ids.tolist(), [[2, 0], [0, 1]])

    def test_sparse_matches_python_on_packed_pages(self):
        cases = (
            (2, 16, 1, 1, None),
            (2, 20, 7, 1, None),
            (4, 16, 1, 1, None),
            (2, 32, 4, 1, "subset"),
            (2, 70, 1, 2, None),
        )
        for hkv, seq_len, q_len, ratio, mode in cases:
            with self.subTest(hkv=hkv, seq_len=seq_len, q_len=q_len, ratio=ratio, mode=mode):
                self._compare(hkv, seq_len, q_len, ratio, mode, torch.float32, 2e-3)
                self._compare(hkv, seq_len, q_len, ratio, mode, torch.float16, 2e-2)

    def _compare(self, hkv, seq_len, q_len, ratio, mode, dtype, tol):
        hq = 6 * hkv
        key = deterministic_rows(seq_len, hkv, 30 + hkv + q_len)
        value = deterministic_rows(seq_len, hkv, 40 + seq_len)
        query = deterministic_rows(q_len, hq, 50 + q_len)
        raw, layout, n_pages = _cache(hkv, key, value)
        views = bind_regions(raw, layout)
        n_logical = (seq_len + PAGE - 1) // PAGE
        if ratio == 1:
            block_row = torch.arange(n_logical, dtype=torch.int32)
        else:
            entries = (n_logical + ratio - 1) // ratio
            block_row = torch.arange(entries, dtype=torch.int32)
        visible = []
        for q_tok in range(q_len):
            end = seq_len - q_len + q_tok + 1
            if mode == "subset":
                tokens = [token for token in range(end) if token % 5 != 1]
            else:
                tokens = list(range(end))
            visible.append(tokens)
        q_cpu = _query_tensor(query, dtype, "cpu")
        expect = attend_selected(q_cpu, views, block_row, seq_len, visible, ratio)
        raw_x = raw.to("xpu")
        views_x = bind_regions(raw_x, layout)
        q_x = _query_tensor(query, dtype, "xpu")
        got = attend_selected(q_x, views_x, block_row.to("xpu"), seq_len, visible, ratio)
        self.assertEqual(got.dtype, dtype)
        self.assertEqual(got.device.type, "xpu")
        delta = (got.float().cpu() - expect.float()).abs().max().item()
        print("qsa_xpu_delta", hkv, seq_len, q_len, ratio, mode, str(dtype).replace("torch.", ""), "%.6g" % delta)
        self.assertLessEqual(delta, tol)
        self.assertGreaterEqual(n_pages, 1)

    def test_device_visible_matches_python_rows(self):
        """qsa_visible's packed matrix is the Python reference, including force-all."""
        hyper = QsaHyper(top_tokens=8)
        scores = torch.tensor(
            [
                [0.0, 0.0, 0.0],
                [5.0, 4.0, 0.1],
                [0.1, 5.0, 4.0],
                [1.0, 1.0, 0.0],
            ],
            dtype=torch.float64,
        )
        counts = [1, 3, 3, 3]
        cells = [3, 11, 11, 11]
        cpu_rows = rows_from_packed(packed_visible_rows(scores, counts, cells, hyper, False))
        device = packed_visible_rows(scores.float().to("xpu"), counts, cells, hyper, False)
        self.assertEqual(device.device.type, "xpu")
        self.assertEqual(rows_from_packed(device), cpu_rows)
        forced_cpu = rows_from_packed(packed_visible_rows(scores, counts, cells, hyper, True))
        forced = packed_visible_rows(scores.float().to("xpu"), counts, cells, hyper, True)
        self.assertEqual(rows_from_packed(forced), forced_cpu)
        for cell, row in zip(cells, forced_cpu):
            self.assertEqual(row, list(range(cell + 1)))

        # Cells are the real causal ends, so the packed matrix is exactly the
        # token list the kernel may read. A wider matrix with a mismatched
        # seq_len would attend past builtin_q_end; qsa_visible does not.
        seq_len, q_len, hkv = 16, 4, 2
        live_cells = [seq_len - q_len + j for j in range(q_len)]
        live_counts = [(cell + 1) // hyper.ratio for cell in live_cells]
        # Gaps of 1 are exact in fp32, so the fp64 reference and qsa_visible
        # rank the same blocks. No ties.
        live_scores = (
            torch.arange(q_len * max(live_counts), dtype=torch.float32)
            .reshape(q_len, max(live_counts))
            .flip(1)
            .to(torch.float64)
        )
        live_cpu = rows_from_packed(packed_visible_rows(live_scores, live_counts, live_cells, hyper, False))
        live_device = packed_visible_rows(live_scores.float().to("xpu"), live_counts, live_cells, hyper, False)
        self.assertEqual(rows_from_packed(live_device), live_cpu)
        forced_live = packed_visible_rows(live_scores.float().to("xpu"), live_counts, live_cells, hyper, True)
        full = [list(range(cell + 1)) for cell in live_cells]
        self.assertEqual(rows_from_packed(forced_live), full)
        hq = 6 * hkv
        key = deterministic_rows(seq_len, hkv, 30)
        value = deterministic_rows(seq_len, hkv, 40)
        query = deterministic_rows(q_len, hq, 50)
        raw, layout, _pages = _cache(hkv, key, value)
        views = bind_regions(raw, layout)
        block_row = torch.arange((seq_len + PAGE - 1) // PAGE, dtype=torch.int32)
        views_x = bind_regions(raw.to("xpu"), layout)
        row_x = block_row.to("xpu")
        for dtype, tol in ((torch.float32, 2e-3), (torch.float16, 2e-2)):
            q_cpu = _query_tensor(query, dtype, "cpu")
            q_x = _query_tensor(query, dtype, "xpu")
            sparse_cpu = attend_selected(q_cpu, views, block_row, seq_len, live_cpu, 1)
            sparse_x = attend_selected(q_x, views_x, row_x, seq_len, live_device, 1)
            sparse_delta = (sparse_x.float().cpu() - sparse_cpu.float()).abs().max().item()
            self.assertLessEqual(sparse_delta, tol)
            # force-all keeps every causal token, so the sparse kernel matches dense.
            dense = attend_selected(q_cpu, views, block_row, seq_len, full, 1)
            dense_x = attend_selected(q_x, views_x, row_x, seq_len, forced_live, 1)
            dense_delta = (dense_x.float().cpu() - dense.float()).abs().max().item()
            self.assertLessEqual(dense_delta, tol)


    def test_shared_prefill_keeps_2048_plus_own_block(self):
        """Shipped shared prefill attends the top-2048 tokens plus the own block.

        pages_per_block is the K8/V4 page ratio on this model and must not
        widen the token budget. Attention on that set matches fp64 GQA.
        """
        from k8v4_v030.qsa_ops import _gather_tokens_fp16, attend_shared_prefill
        from k8v4_v030.qsa_ref import (
            cells_for_queries,
            complete_blocks,
            fp_gqa,
            topk_block_ids,
            visible_tokens,
        )

        hkv = 2
        seq_len, q_len = 2078, 3
        hyper = QsaHyper(top_tokens=2048)
        self.assertEqual(hyper.n_sel, 512)
        cells = cells_for_queries(seq_len, q_len)
        n_blocks = complete_blocks(cells[-1], hyper.ratio)
        self.assertGreater(n_blocks, hyper.n_sel)
        raw, layout, _pages = _cache(
            hkv,
            deterministic_rows(seq_len, hkv, 81),
            deterministic_rows(seq_len, hkv, 82),
        )
        # 33 is the live attention-block / kernel-page ratio. Token blocks stay 4.
        pages_per_block = 33
        views = bind_regions(raw.to("xpu"), layout)
        block_row = torch.zeros(4, dtype=torch.int32, device="xpu")
        scores = torch.zeros(q_len, n_blocks, dtype=torch.float32, device="xpu")
        scores[-1] = torch.arange(n_blocks, 0, -1, device="xpu", dtype=torch.float32)
        query = torch.tensor(
            deterministic_rows(q_len, layout.hq, 83), dtype=torch.float16, device="xpu"
        )
        counts = [complete_blocks(cell, hyper.ratio) for cell in cells]
        piece, visible = attend_shared_prefill(
            query, scores, counts, cells, views, block_row, pages_per_block, hyper.n_sel,
        )
        self.assertEqual(tuple(piece.shape), tuple(query.shape))
        self.assertTrue(bool(torch.isfinite(piece).all()))
        self.assertEqual(int(visible.shape[0]), q_len)
        self.assertEqual(int(visible.shape[1]), hyper.budget + hyper.ratio)
        self.assertLessEqual(int(visible.shape[1]), 2052)
        chosen = topk_block_ids(scores[-1].double().cpu(), hyper.n_sel)
        self.assertEqual(chosen, list(range(hyper.n_sel)))
        expected = []
        for cell in cells:
            own = cell // hyper.ratio
            blocks = list(chosen)
            if own not in blocks:
                blocks.append(own)
            expected.append(visible_tokens(cell, blocks, cell % hyper.ratio + 1, hyper.ratio))
        got = rows_from_packed(visible)
        dropped = set(range(512 * hyper.ratio, 513 * hyper.ratio))
        for row, cell, want in zip(got, cells, expected):
            self.assertEqual(len(row), len(set(row)))
            self.assertEqual(set(row), set(want))
            self.assertLess(len(set(row)), seq_len)
            self.assertTrue(dropped.isdisjoint(row))
            own = cell // hyper.ratio
            self.assertTrue(any(token // hyper.ratio == own for token in row))
            non_own = [token for token in row if token // hyper.ratio != own]
            self.assertEqual(len(non_own) % hyper.ratio, 0)
            self.assertLessEqual(len(non_own) // hyper.ratio, hyper.n_sel)
            self.assertLessEqual(len(row), hyper.budget + hyper.ratio)
        ids = torch.arange(seq_len, device="xpu")
        key, value = _gather_tokens_fp16(views, block_row, ids, pages_per_block)
        reference = fp_gqa(
            query.double().cpu(), key.double().cpu(), value.double().cpu(), expected, scale=0.0625,
        )
        delta = (piece.double().cpu() - reference).abs().max().item()
        self.assertLessEqual(delta, 0.05, delta)

if __name__ == "__main__":
    unittest.main()
