"""Runtime wiring: stash, cache update, sparse output, dense fallthrough."""

from __future__ import annotations

import os
import sys
import types
import unittest

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import PAGE, SLOT_BYTES_PER_HEAD, PageLayout
from k8v4_v030.oracle import deterministic_rows
from k8v4_v030.paged import write_token
from k8v4_v030.qsa_cache import all_banks, bank_for, reset_caches
from k8v4_v030.qsa_config import HIDDEN, qsa_force_all
from k8v4_v030.qsa_ops import attend_selected
from k8v4_v030.qsa_ref import (
    QsaHyper,
    apply_q_rope,
    cells_for_queries,
    complete_blocks,
    finish_selection,
    project_indexer,
    score_blocks,
    select_blocks,
    topk_block_ids,
    visible_tokens,
)
from k8v4_v030.qsa_rope import normalize_positions
from k8v4_v030.qsa_weights import make_random_bank, reset_bank, set_bank


class _Layer:
    def __init__(self, name: str):
        self.layer_name = name


class _Impl:
    def __init__(self, hkv: int):
        self.layout = PageLayout(hkv)


class _Meta:
    def __init__(self, seq_len: int, q_len: int, hkv: int, slots: torch.Tensor):
        self.seq_lens = torch.tensor([seq_len], dtype=torch.int32)
        self.seq_lens_cpu = self.seq_lens.clone()
        self.slot_mapping = slots.to(torch.int64)
        self.block_table = torch.arange(4, dtype=torch.int32).view(1, -1)
        self.query_starts = (0, int(q_len))
        self.pages_per_block = 1
        self.layout = PageLayout(hkv)
        self.num_actual_tokens = int(q_len)


def _rows(n: int, heads: int, seed: int) -> torch.Tensor:
    return torch.tensor(deterministic_rows(n, heads, seed), dtype=torch.float32)


def _page(hkv: int, key, value) -> torch.Tensor:
    layout = PageLayout(hkv)
    blob = bytearray(layout.page_bytes)
    for slot in range(len(key)):
        write_token(blob, slot, key[slot], value[slot])
    return torch.frombuffer(blob, dtype=torch.int8)


def _expected(cache, weights, hidden, positions, seq_len, q_len, block_row, pages):
    hyper = QsaHyper()
    query, _key = project_indexer(
        hidden, weights.q_proj, weights.k_proj, weights.q_norm, weights.k_norm, hyper
    )
    query = apply_q_rope(query, normalize_positions(positions, q_len), hyper)
    rows = []
    for local, cell in enumerate(cells_for_queries(seq_len, q_len)):
        count = complete_blocks(cell, hyper.ratio)
        matrix = torch.zeros(count, hyper.dim, dtype=torch.float64)
        missing = []
        for block in range(count):
            pooled = cache.pooled_row(block_row, block * hyper.ratio, pages)
            if pooled is None:
                missing.append(block)
            else:
                matrix[block] = pooled.detach().to(dtype=torch.float64, device="cpu")
        scores = score_blocks(query[local].detach().to(dtype=torch.float64, device="cpu"), matrix)
        if missing:
            scores = scores.clone()
            for block in missing:
                scores[block] = float("-inf")
        chosen, width = select_blocks(scores, cell, hyper, force_all=qsa_force_all())
        rows.append(visible_tokens(cell, chosen, width, hyper.ratio))
    return rows


def _expected_reused(cache, weights, hidden, positions, seq_len, q_len, block_row, pages):
    """One historical top-k from query 0, plus each query's own block.

    Queries 1..q_len-1 are not scored. That is the MTP verify contract.
    """
    hyper = QsaHyper()
    query, _key = project_indexer(
        hidden, weights.q_proj, weights.k_proj, weights.q_norm, weights.k_norm, hyper
    )
    query = apply_q_rope(query, normalize_positions(positions, q_len), hyper)
    cells = cells_for_queries(seq_len, q_len)
    counts = [complete_blocks(cell, hyper.ratio) for cell in cells]
    rep = counts[0]
    matrix = torch.zeros(rep, hyper.dim, dtype=torch.float64)
    missing = []
    for block in range(rep):
        pooled = cache.pooled_row(block_row, block * hyper.ratio, pages)
        if pooled is None:
            missing.append(block)
        else:
            matrix[block] = pooled.detach().to(dtype=torch.float64, device="cpu")
    scores = score_blocks(query[0].detach().to(dtype=torch.float64, device="cpu"), matrix)
    if missing:
        scores = scores.clone()
        for block in missing:
            scores[block] = float("-inf")
    if qsa_force_all() or rep <= hyper.n_sel:
        hist = list(range(rep))
    else:
        hist = topk_block_ids(scores[:rep], hyper.n_sel)
    rows = []
    for cell, count in zip(cells, counts):
        if qsa_force_all() or count <= hyper.n_sel:
            chosen = list(range(count))
        else:
            chosen = list(hist)
        chosen, width = finish_selection(chosen, cell, hyper)
        rows.append(visible_tokens(cell, chosen, width, hyper.ratio))
    return rows


class BackendFlagTest(unittest.TestCase):
    def test_import_leaves_runtime_alone_and_spec_stays_396(self):
        os.environ.pop("K8V4_QSA", None)
        self.assertNotIn("k8v4_v030.qsa_runtime", sys.modules)
        from k8v4_v030.backend import Xe2K8V4AttentionBackend
        from vllm.v1.kv_cache_interface import AttentionSpec

        self.assertNotIn("k8v4_v030.qsa_runtime", sys.modules)
        spec = AttentionSpec(
            block_size=PAGE,
            num_kv_heads=2,
            head_size=256,
            dtype=torch.float16,
        )
        os.environ["K8V4_QSA"] = "1"
        try:
            tuned = Xe2K8V4AttentionBackend.customize_spec(spec)
        finally:
            os.environ.pop("K8V4_QSA", None)
        self.assertEqual(tuned.state_content_bytes, SLOT_BYTES_PER_HEAD)
        self.assertEqual(SLOT_BYTES_PER_HEAD, 396)
        self.assertNotIn("k8v4_v030.qsa_runtime", sys.modules)


class RuntimeTest(unittest.TestCase):
    def setUp(self):
        os.environ.pop("K8V4_QSA", None)
        os.environ.pop("K8V4_QSA_FORCE_ALL", None)
        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        os.environ.pop("K8V4_QSA_WEIGHTS", None)
        os.environ.pop("K8V4_QSA_EAGER", None)
        os.environ.pop("K8V4_QSA_STATS", None)
        os.environ.pop("K8V4_QSA_CACHE_DEBUG", None)
        reset_caches()
        reset_bank()

    def tearDown(self):
        os.environ.pop("K8V4_QSA", None)
        os.environ.pop("K8V4_QSA_FORCE_ALL", None)
        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        os.environ.pop("K8V4_QSA_EAGER", None)
        os.environ.pop("K8V4_QSA_STATS", None)
        os.environ.pop("K8V4_QSA_CACHE_DEBUG", None)
        reset_caches()
        reset_bank()

    def test_install_wraps_full_attention_only(self):
        from k8v4_v030.qsa_runtime import install_if_requested, take_hidden
        import vllm.model_executor.models.qwen3_next as qwen

        module = types.ModuleType("vllm.qsa_test_mod")

        class Qwen3NextAttention:
            def __init__(self):
                self.attn = types.SimpleNamespace(layer_name="model.layers.7.self_attn.attn")
                self.calls = 0

            def forward(self, positions, hidden_states):
                self.calls += 1
                return hidden_states

        module.Qwen3NextAttention = Qwen3NextAttention
        sys.modules["vllm.qsa_test_mod"] = module
        os.environ["K8V4_QSA"] = "1"
        install_if_requested()
        layer = Qwen3NextAttention()
        hidden = torch.zeros(2, 4)
        positions = torch.tensor([4, 5])
        layer.forward(positions, hidden)
        stashed = take_hidden(7)
        self.assertIsNotNone(stashed)
        assert stashed is not None
        self.assertTrue(torch.equal(stashed[0], hidden))
        self.assertEqual(layer.calls, 1)
        # Gated DeltaNet is a different class and stays unwrapped.
        self.assertTrue(getattr(qwen.Qwen3NextAttention.forward, "_qsa_wrapped", False))
        gated = getattr(qwen, "QwenGatedDeltaNetAttention", None)
        if gated is not None:
            self.assertFalse(getattr(gated.forward, "_qsa_wrapped", False))
        import vllm.v1.worker.utils as utils

        self.assertTrue(getattr(utils.copy_kv_cache_blocks_inplace, "_qsa_wrapped", False))

    def test_flag_off_and_missing_weights_stay_dense(self):
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        hkv = 2
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        query = _rows(1, impl.layout.hq, 1)
        key = deterministic_rows(4, hkv, 2)
        value = deterministic_rows(4, hkv, 3)
        cache = _page(hkv, key, value)
        meta = _Meta(4, 1, hkv, torch.tensor([3]))
        output = torch.full_like(query, 3)
        note_hidden(3, torch.zeros(1, HIDDEN), torch.tensor([3]))
        self.assertFalse(try_sparse_forward(impl, layer, query, cache, meta, output))
        self.assertTrue(torch.equal(output, torch.full_like(query, 3)))
        self.assertEqual(all_banks(), [])

        os.environ["K8V4_QSA"] = "1"
        note_hidden(3, torch.zeros(1, HIDDEN), torch.tensor([3]))
        self.assertFalse(try_sparse_forward(impl, layer, query, cache, meta, output))
        linear = _Layer("model.layers.1.self_attn.attn")
        note_hidden(1, torch.zeros(1, HIDDEN), torch.tensor([3]))
        set_bank(make_random_bank(1, layers=(3,)))
        self.assertFalse(try_sparse_forward(impl, linear, query, cache, meta, output))
        self.assertTrue(torch.equal(output, torch.full_like(query, 3)))

    def test_short_context_warms_the_cache_and_leaves_dense_output(self):
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        hkv = 2
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        set_bank(make_random_bank(2, layers=(3,)))
        seq_len = 8
        key = deterministic_rows(seq_len, hkv, 4)
        value = deterministic_rows(seq_len, hkv, 5)
        cache = _page(hkv, key, value)
        query = _rows(seq_len, impl.layout.hq, 6)
        hidden = torch.randn(seq_len, HIDDEN)
        positions = torch.arange(seq_len)
        meta = _Meta(seq_len, seq_len, hkv, torch.arange(seq_len))
        output = torch.full_like(query, 5)
        os.environ["K8V4_QSA"] = "1"
        note_hidden(3, hidden, positions)
        wrote = try_sparse_forward(impl, layer, query, cache, meta, output)
        self.assertFalse(wrote)
        self.assertTrue(torch.equal(output, torch.full_like(query, 5)))
        banks = all_banks()
        self.assertEqual(len(banks), 1)
        stored = banks[0].layers[3]
        self.assertTrue(bool(stored.pool_valid[0]))
        self.assertTrue(bool(stored.pool_valid[1]))
        self.assertFalse(bool(stored.pool_valid[2]))

    def test_prefill_cache_debug_print_is_off_by_default(self):
        import io
        from contextlib import redirect_stdout

        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        hkv = 2
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        set_bank(make_random_bank(2, layers=(3,)))
        seq_len = 20
        key = deterministic_rows(seq_len, hkv, 4)
        value = deterministic_rows(seq_len, hkv, 5)
        cache = _page(hkv, key, value)
        query = _rows(seq_len, impl.layout.hq, 6)
        hidden = torch.randn(seq_len, HIDDEN)
        positions = torch.arange(seq_len)
        meta = _Meta(seq_len, seq_len, hkv, torch.arange(seq_len))
        output = torch.full_like(query, 5)
        os.environ["K8V4_QSA"] = "1"
        os.environ.pop("K8V4_QSA_CACHE_DEBUG", None)
        note_hidden(3, hidden, positions)
        buf = io.StringIO()
        with redirect_stdout(buf):
            wrote = try_sparse_forward(impl, layer, query, cache, meta, output)
        self.assertFalse(wrote)
        self.assertNotIn("QSA_CACHE", buf.getvalue())
        os.environ["K8V4_QSA_CACHE_DEBUG"] = "1"
        note_hidden(3, hidden, positions)
        buf = io.StringIO()
        with redirect_stdout(buf):
            try_sparse_forward(impl, layer, query, cache, meta, output)
        self.assertIn("QSA_CACHE seq_end=", buf.getvalue())

    def test_seq_len_reads_the_live_cpu_tensor(self):
        from k8v4_v030.qsa_runtime import _request_seq_len, _seq_len, _short_decode_spans

        meta = _Meta(8, 1, 2, torch.tensor([7]))
        self.assertEqual(_seq_len(meta, 0), 8)
        meta.seq_lens[0] = 11
        self.assertEqual(_request_seq_len(meta, 0, 1), 11)
        self.assertFalse(hasattr(meta, "_qsa_actual_seq_lens"))
        self.assertFalse(hasattr(meta, "_qsa_prefill_seq_lens_cpu"))
        self.assertEqual(_short_decode_spans(meta, 1), ((0, 0, 1),))
        meta.query_starts = (0, 7, 14, 14)
        meta.seq_lens = torch.tensor([100, 50, 1], dtype=torch.int32)
        meta.block_table = torch.zeros((3, 4), dtype=torch.int32)
        self.assertEqual(
            _short_decode_spans(meta, 14),
            ((0, 0, 7), (1, 7, 7)),
        )
        meta.query_starts = (0, 20)
        meta.seq_lens = torch.tensor([20], dtype=torch.int32)
        meta.block_table = torch.zeros((1, 4), dtype=torch.int32)
        self.assertEqual(_short_decode_spans(meta, 20), ())
        meta.seq_lens = torch.tensor([4], dtype=torch.int32, device="meta")
        with self.assertRaisesRegex(RuntimeError, "refusing a host sync"):
            _seq_len(meta, 0)

    def test_decode_verifier_and_force_all_match_the_quant_path(self):
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        self._continuation(q_len=1, hist=16, hkv=2, seed=8)
        reset_caches()
        reset_bank()
        self._mixed_batch()
        reset_caches()
        reset_bank()
        self._crossing_prefill()
        reset_caches()
        reset_bank()
        self._continuation(q_len=7, hist=13, hkv=2, seed=9)
        reset_caches()
        reset_bank()
        self._force_all(hkv=4)

    def _continuation(self, q_len: int, hist: int, hkv: int, seed: int):
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        weights = make_random_bank(seed, layers=(3,)).get(3)
        assert weights is not None
        set_bank(make_random_bank(seed, layers=(3,)))
        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        os.environ.pop("K8V4_QSA_FORCE_ALL", None)
        seq_len = hist + q_len
        key = deterministic_rows(seq_len, hkv, seed + 20)
        value = deterministic_rows(seq_len, hkv, seed + 21)
        cache = _page(hkv, key, value)
        hidden_all = torch.randn(seq_len, HIDDEN)
        os.environ["K8V4_QSA"] = "1"
        # History is inside the default 2048-token budget, so this warms the cache.
        hist_query = _rows(hist, impl.layout.hq, seed + 22)
        hist_out = torch.zeros_like(hist_query)
        note_hidden(3, hidden_all[:hist], torch.arange(hist))
        hist_meta = _Meta(hist, hist, hkv, torch.arange(hist))
        self.assertFalse(
            try_sparse_forward(impl, layer, hist_query, cache, hist_meta, hist_out)
        )
        os.environ["K8V4_QSA_TOP_TOKENS"] = "8"
        query = _rows(q_len, impl.layout.hq, seed + 23)
        output = torch.zeros_like(query)
        positions = torch.arange(hist, seq_len)
        slots = torch.arange(hist, seq_len)
        note_hidden(3, hidden_all[hist:], positions)
        meta = _Meta(seq_len, q_len, hkv, slots)
        self.assertTrue(try_sparse_forward(impl, layer, query, cache, meta, output))
        stored = all_banks()[0].layers[3]
        hyper = QsaHyper()
        cells = cells_for_queries(seq_len, q_len)
        # A multi-token decode past the budget on the target token reuses one
        # historical top-k. A single query still matches the per-query reference.
        if q_len > 1 and complete_blocks(cells[0], hyper.ratio) > hyper.n_sel:
            visible = _expected_reused(
                stored, weights, hidden_all[hist:], positions, seq_len, q_len,
                meta.block_table[0], 1,
            )
        else:
            visible = _expected(
                stored,
                weights,
                hidden_all[hist:],
                positions,
                seq_len,
                q_len,
                meta.block_table[0],
                1,
            )
        views = bind_regions(cache, impl.layout)
        expect = attend_selected(query, views, meta.block_table[0], seq_len, visible, 1)
        self.assertTrue(torch.equal(output, expect))
        full = [list(range(cell + 1)) for cell in cells_for_queries(seq_len, q_len)]
        dense = attend_selected(query, views, meta.block_table[0], seq_len, full, 1)
        self.assertFalse(torch.equal(output, dense))
        # Each query keeps its own block. The union across a verifier tile can
        # still cover every token, so the dropped-token check is per query.
        self.assertNotEqual(visible[-1], full[-1])
        covered = {token for row in visible for token in row}
        missing = [token for token in range(seq_len) if token not in covered]
        if not missing:
            return
        dropped = missing[0]
        mutated = [list(map(list, heads)) for heads in key]
        for dim in range(len(mutated[dropped][0])):
            mutated[dropped][0][dim] += 3.0
        blob = bytearray(cache.detach().cpu().numpy().tobytes())
        write_token(blob, dropped, mutated[dropped], value[dropped])
        cache.copy_(torch.frombuffer(bytearray(blob), dtype=torch.int8))
        again = torch.zeros_like(query)
        note_hidden(3, hidden_all[hist:], positions)
        self.assertTrue(try_sparse_forward(impl, layer, query, cache, meta, again))
        self.assertTrue(torch.equal(again, output))

    def _mixed_batch(self):
        """One request past the budget and one inside it, on different blocks.

        The short request must stay a full causal set and must read its own
        physical block. The long request is sparse and must not use that block.
        """
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        hkv = 2
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        weights = make_random_bank(12, layers=(3,)).get(3)
        assert weights is not None
        set_bank(make_random_bank(12, layers=(3,)))
        long_n, short_n = 16, 4
        os.environ["K8V4_QSA"] = "1"
        os.environ["K8V4_QSA_TOP_TOKENS"] = "8"
        key_long = deterministic_rows(long_n, hkv, 70)
        value_long = deterministic_rows(long_n, hkv, 71)
        key_short = deterministic_rows(short_n, hkv, 72)
        value_short = deterministic_rows(short_n, hkv, 73)
        cache = torch.cat(
            [_page(hkv, key_long, value_long), _page(hkv, key_short, value_short)]
        )
        query = _rows(long_n + short_n, impl.layout.hq, 74)
        hidden = torch.randn(long_n + short_n, HIDDEN)
        positions = torch.cat([torch.arange(long_n), torch.arange(short_n)])
        slots = torch.cat([torch.arange(long_n), torch.arange(64, 64 + short_n)])
        meta = _Meta(long_n, long_n + short_n, hkv, slots)
        meta.seq_lens = torch.tensor([long_n, short_n], dtype=torch.int32)
        meta.seq_lens_cpu = meta.seq_lens.clone()
        meta.query_starts = (0, long_n, long_n + short_n)
        meta.num_actual_tokens = long_n + short_n
        meta.block_table = torch.tensor(
            [[0, 3, 2, 1], [1, 0, 2, 3]],
            dtype=torch.int32,
        )
        output = torch.zeros_like(query)
        note_hidden(3, hidden, positions)
        self.assertTrue(try_sparse_forward(impl, layer, query, cache, meta, output))
        stored = all_banks()[0].layers[3]
        long_visible = _expected(
            stored, weights, hidden[:long_n], positions[:long_n], long_n, long_n, meta.block_table[0], 1
        )
        short_visible = _expected(
            stored,
            weights,
            hidden[long_n:],
            positions[long_n:],
            short_n,
            short_n,
            meta.block_table[1],
            1,
        )
        self.assertEqual(short_visible[-1], list(range(short_n)))
        self.assertNotEqual(long_visible[-1], list(range(long_n)))
        views = bind_regions(cache, impl.layout)
        long_expect = attend_selected(
            query[:long_n], views, meta.block_table[0], long_n, long_visible, 1
        )
        short_expect = attend_selected(
            query[long_n:], views, meta.block_table[1], short_n, short_visible, 1
        )
        self.assertTrue(torch.equal(output[:long_n], long_expect))
        self.assertTrue(torch.equal(output[long_n:], short_expect))
        swapped = attend_selected(
            query[long_n:], views, meta.block_table[0], short_n, short_visible, 1
        )
        self.assertFalse(torch.equal(short_expect, swapped))

    def _crossing_prefill(self):
        """One chunk where early queries are inside the budget and the last is not.

        The last query has four complete blocks and a budget of two, so forcing
        its own block back in still leaves a block out. Early queries stay dense.
        """
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        hkv = 2
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        weights = make_random_bank(11, layers=(3,)).get(3)
        assert weights is not None
        set_bank(make_random_bank(11, layers=(3,)))
        seq_len = 16
        os.environ["K8V4_QSA"] = "1"
        os.environ["K8V4_QSA_TOP_TOKENS"] = "8"
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
            stored, weights, hidden, positions, seq_len, seq_len, meta.block_table[0], 1
        )
        self.assertEqual(visible[0], [0])
        self.assertEqual(visible[7], list(range(8)))
        self.assertNotEqual(visible[-1], list(range(seq_len)))
        views = bind_regions(cache, impl.layout)
        expect = attend_selected(query, views, meta.block_table[0], seq_len, visible, 1)
        self.assertTrue(torch.equal(output, expect))

    def _force_all(self, hkv: int):
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        set_bank(make_random_bank(4, layers=(3,)))
        seq_len = 8
        key = deterministic_rows(seq_len, hkv, 30)
        value = deterministic_rows(seq_len, hkv, 31)
        cache = _page(hkv, key, value)
        query = _rows(seq_len, impl.layout.hq, 32)
        hidden = torch.randn(seq_len, HIDDEN)
        positions = torch.arange(seq_len)
        meta = _Meta(seq_len, seq_len, hkv, torch.arange(seq_len))
        output = torch.zeros_like(query)
        os.environ["K8V4_QSA"] = "1"
        os.environ["K8V4_QSA_FORCE_ALL"] = "1"
        note_hidden(3, hidden, positions)
        self.assertTrue(try_sparse_forward(impl, layer, query, cache, meta, output))
        views = bind_regions(cache, impl.layout)
        full = [list(range(cell + 1)) for cell in cells_for_queries(seq_len, seq_len)]
        expect = attend_selected(query, views, meta.block_table[0], seq_len, full, 1)
        self.assertTrue(torch.equal(output, expect))

    def test_scheduler_copy_expands_kernel_pages(self):
        from k8v4_v030.qsa_runtime import apply_scheduled_copies

        cache = bank_for(2).layer(3, num_blocks=4, block_size=64)
        norm = torch.ones(cache.hyper.dim)
        for slot in range(4):
            key = torch.full((cache.hyper.dim,), float(slot + 1))
            cache.write_token(slot, key, torch.zeros(4, dtype=torch.int64), norm)
        apply_scheduled_copies(2, [(0, 1)])
        self.assertTrue(torch.equal(cache.raw[128:132], cache.raw[0:4]))
        self.assertTrue(bool(cache.pool_valid[128 // cache.hyper.ratio]))
        direct = bank_for(2).layer(7, num_blocks=2, block_size=64)
        direct.write_token(0, torch.ones(cache.hyper.dim), torch.zeros(4, dtype=torch.int64), norm)
        apply_scheduled_copies(2, [types.SimpleNamespace(src_block_id=0, dst_block_id=1)])
        self.assertTrue(torch.equal(direct.raw[64], direct.raw[0]))

    def test_eager_wrapper_still_stashes_outside_compile(self):
        from k8v4_v030.qsa_runtime import install_if_requested, take_hidden

        module = types.ModuleType("vllm.qsa_eager_mod")

        class Qwen3NextAttention:
            def __init__(self):
                self.attn = types.SimpleNamespace(layer_name="model.layers.3.self_attn.attn")

            def forward(self, positions, hidden_states):
                return hidden_states

        module.Qwen3NextAttention = Qwen3NextAttention
        sys.modules["vllm.qsa_eager_mod"] = module
        os.environ["K8V4_QSA"] = "1"
        os.environ["K8V4_QSA_EAGER"] = "1"
        from k8v4_v030 import qsa_runtime

        # install_if_requested stops scanning once it has wrapped a class.
        # Put the flag back so a later test can wrap its own stand-in.
        previous = qsa_runtime._CLASSES_WRAPPED
        try:
            install_if_requested()
            self.assertTrue(getattr(Qwen3NextAttention.forward, "_qsa_wrapped", False))
            hidden = torch.zeros(1, 4)
            Qwen3NextAttention().forward(torch.tensor([3]), hidden)
            stashed = take_hidden(3)
            self.assertIsNotNone(stashed)
            assert stashed is not None
            self.assertTrue(torch.equal(stashed[0], hidden))
        finally:
            qsa_runtime._CLASSES_WRAPPED = previous
            sys.modules.pop("vllm.qsa_eager_mod", None)


class EagerGraphTest(unittest.TestCase):
    def tearDown(self):
        os.environ.pop("K8V4_QSA", None)
        os.environ.pop("K8V4_QSA_EAGER", None)

    def test_eager_flag_reports_no_cudagraph_support(self):
        from k8v4_v030.backend import Xe2K8V4MetadataBuilder
        from vllm.v1.attention.backend import AttentionCGSupport

        self.assertEqual(
            Xe2K8V4MetadataBuilder.get_cudagraph_support(None, None),
            AttentionCGSupport.UNIFORM_BATCH,
        )
        os.environ["K8V4_QSA_EAGER"] = "1"
        self.assertEqual(
            Xe2K8V4MetadataBuilder.get_cudagraph_support(None, None),
            AttentionCGSupport.UNIFORM_BATCH,
        )
        os.environ["K8V4_QSA"] = "1"
        self.assertEqual(
            Xe2K8V4MetadataBuilder.get_cudagraph_support(None, None),
            AttentionCGSupport.NEVER,
        )
        os.environ.pop("K8V4_QSA_EAGER", None)
        self.assertEqual(
            Xe2K8V4MetadataBuilder.get_cudagraph_support(None, None),
            AttentionCGSupport.UNIFORM_BATCH,
        )


class StatsTest(unittest.TestCase):
    def setUp(self):
        os.environ.pop("K8V4_QSA", None)
        os.environ.pop("K8V4_QSA_FORCE_ALL", None)
        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        os.environ.pop("K8V4_QSA_WEIGHTS", None)
        os.environ.pop("K8V4_QSA_STATS", None)
        os.environ.pop("K8V4_QSA_STATS_FILE", None)
        from k8v4_v030.qsa_stats import qsa_stats_reset

        qsa_stats_reset()
        reset_caches()
        reset_bank()

    def tearDown(self):
        os.environ.pop("K8V4_QSA", None)
        os.environ.pop("K8V4_QSA_FORCE_ALL", None)
        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        os.environ.pop("K8V4_QSA_STATS", None)
        os.environ.pop("K8V4_QSA_STATS_FILE", None)
        from k8v4_v030.qsa_stats import qsa_stats_reset

        qsa_stats_reset()
        reset_caches()
        reset_bank()

    def test_counters_stay_quiet_until_enabled(self):
        import json
        import tempfile

        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward
        from k8v4_v030.qsa_stats import REASONS, qsa_stats_flush, qsa_stats_snapshot

        hkv = 2
        impl = _Impl(hkv)
        layer = _Layer("model.layers.3.self_attn.attn")
        query = _rows(1, impl.layout.hq, 1)
        cache = _page(hkv, deterministic_rows(4, hkv, 2), deterministic_rows(4, hkv, 3))
        meta = _Meta(4, 1, hkv, torch.tensor([3]))
        output = torch.zeros_like(query)
        with tempfile.TemporaryDirectory() as temp:
            path = os.path.join(temp, "stats.jsonl")
            os.environ["K8V4_QSA_STATS_FILE"] = path
            note_hidden(3, torch.zeros(1, HIDDEN), torch.tensor([3]))
            self.assertFalse(try_sparse_forward(impl, layer, query, cache, meta, output))
            qsa_stats_flush()
            self.assertFalse(os.path.exists(path))
            quiet = qsa_stats_snapshot()
            self.assertEqual(set(quiet), {"prefill", "decode"})
            self.assertEqual(set(quiet["decode"]), set(REASONS))
            self.assertEqual(sum(quiet["decode"].values()) + sum(quiet["prefill"].values()), 0)

            os.environ["K8V4_QSA_STATS"] = "1"
            note_hidden(3, torch.zeros(1, HIDDEN), torch.tensor([3]))
            self.assertFalse(try_sparse_forward(impl, layer, query, cache, meta, output))
            prefill_query = _rows(16, impl.layout.hq, 4)
            prefill_meta = _Meta(16, 16, hkv, torch.arange(16))
            self.assertFalse(
                try_sparse_forward(impl, _Layer("not-a-layer"), prefill_query, cache, prefill_meta, torch.zeros_like(prefill_query))
            )
            snap = qsa_stats_snapshot()
            self.assertEqual(snap["decode"]["disabled"], 1)
            self.assertEqual(snap["prefill"]["disabled"], 1)
            self.assertEqual(snap["decode"]["sparse_ok"], 0)
            qsa_stats_flush()
            lines = [json.loads(line) for line in open(path, encoding="utf-8") if line.strip()]
            # The first decision appends a line; the second is inside the
            # one-second window, and flush forces the second line.
            self.assertGreaterEqual(len(lines), 2)
            self.assertEqual(lines[-1]["decode"]["disabled"], 1)
            self.assertEqual(lines[-1]["prefill"]["disabled"], 1)
            before = len(lines)
            note_hidden(3, torch.zeros(1, HIDDEN), torch.tensor([3]))
            self.assertFalse(try_sparse_forward(impl, layer, query, cache, meta, output))
            self.assertEqual(qsa_stats_snapshot()["decode"]["disabled"], 2)
            mid = [json.loads(line) for line in open(path, encoding="utf-8") if line.strip()]
            self.assertEqual(len(mid), before)

    def test_fallback_reasons_follow_the_forward(self):
        from k8v4_v030 import qsa_runtime
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward
        from k8v4_v030.qsa_stats import qsa_stats_snapshot

        os.environ["K8V4_QSA"] = "1"
        os.environ["K8V4_QSA_STATS"] = "1"
        hkv = 2
        impl = _Impl(hkv)
        query = _rows(1, impl.layout.hq, 1)
        cache = _page(hkv, deterministic_rows(4, hkv, 2), deterministic_rows(4, hkv, 3))
        meta = _Meta(4, 1, hkv, torch.tensor([3]))
        output = torch.zeros_like(query)
        note_hidden(3, torch.zeros(1, HIDDEN), torch.tensor([3]))
        self.assertFalse(try_sparse_forward(impl, _Layer("model.layers.3.self_attn.attn"), query, cache, meta, output))
        self.assertEqual(qsa_stats_snapshot()["decode"]["no_weights"], 1)

        set_bank(make_random_bank(1, layers=(3,)))
        note_hidden(1, torch.zeros(1, HIDDEN), torch.tensor([3]))
        self.assertFalse(try_sparse_forward(impl, _Layer("model.layers.1.self_attn.attn"), query, cache, meta, output))
        self.assertEqual(qsa_stats_snapshot()["decode"]["not_full_attn"], 1)
        self.assertFalse(try_sparse_forward(impl, _Layer("draft.mtp.layers.0"), query, cache, meta, output))
        # layers.0 is not a full-attention index, so this returns before the
        # MTP name check. Draft modules that do resolve to a trained layer
        # stay dense in test_indexer_mtp_reuse.
        self.assertEqual(qsa_stats_snapshot()["decode"]["not_full_attn"], 2)
        self.assertEqual(qsa_stats_snapshot()["decode"]["no_layer"], 0)
        self.assertFalse(try_sparse_forward(impl, _Layer("model.layers.3.self_attn.attn"), query, cache, meta, output))
        self.assertEqual(qsa_stats_snapshot()["decode"]["no_hidden"], 1)

        note_hidden(3, torch.zeros(1, HIDDEN), torch.tensor([3]))
        original = qsa_runtime._capturing
        qsa_runtime._capturing = lambda: True
        try:
            self.assertFalse(
                try_sparse_forward(impl, _Layer("model.layers.3.self_attn.attn"), query, cache, meta, output)
            )
        finally:
            qsa_runtime._capturing = original
        self.assertEqual(qsa_stats_snapshot()["decode"]["capturing"], 1)
        self.assertTrue(torch.equal(output, torch.zeros_like(query)))

        # Eight tokens are inside the default budget and inside the decode tile.
        seq_len = 8
        wide = _rows(seq_len, impl.layout.hq, 6)
        wide_cache = _page(hkv, deterministic_rows(seq_len, hkv, 4), deterministic_rows(seq_len, hkv, 5))
        note_hidden(3, torch.randn(seq_len, HIDDEN), torch.arange(seq_len))
        self.assertFalse(
            try_sparse_forward(
                impl,
                _Layer("model.layers.3.self_attn.attn"),
                wide,
                wide_cache,
                _Meta(seq_len, seq_len, hkv, torch.arange(seq_len)),
                torch.zeros_like(wide),
            )
        )
        self.assertEqual(qsa_stats_snapshot()["decode"]["within_budget"], 1)

        # Sixteen tokens is a prefill, and a budget of 8 drops a block.
        os.environ["K8V4_QSA_TOP_TOKENS"] = "8"
        reset_caches()
        long_n = 16
        long_q = _rows(long_n, impl.layout.hq, 7)
        long_cache = _page(hkv, deterministic_rows(long_n, hkv, 8), deterministic_rows(long_n, hkv, 9))
        note_hidden(3, torch.randn(long_n, HIDDEN), torch.arange(long_n))
        self.assertTrue(
            try_sparse_forward(
                impl,
                _Layer("model.layers.3.self_attn.attn"),
                long_q,
                long_cache,
                _Meta(long_n, long_n, hkv, torch.arange(long_n)),
                torch.zeros_like(long_q),
            )
        )
        self.assertEqual(qsa_stats_snapshot()["prefill"]["sparse_ok"], 1)
        self.assertEqual(qsa_stats_snapshot()["decode"]["sparse_ok"], 0)


if __name__ == "__main__":
    unittest.main()
