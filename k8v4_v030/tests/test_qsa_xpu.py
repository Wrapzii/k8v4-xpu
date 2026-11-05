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
    score_pooled,
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
            "/mnt/hdd-500gb/model-validation/qsa-k8v4/no-such-libxe2_qsa.so"
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


def _xpu_available() -> bool:
    return bool(getattr(torch, "xpu", None) and torch.xpu.is_available() and torch.xpu.device_count() > 0)


@unittest.skipUnless(_xpu_available(), "no xpu")
@unittest.skipUnless(library_path() is not None, "no qsa library")
class XpuKernelTest(unittest.TestCase):
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


if __name__ == "__main__":
    unittest.main()
