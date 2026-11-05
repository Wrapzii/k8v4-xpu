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
    project_indexer,
    score_blocks,
    select_blocks,
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
        reset_caches()
        reset_bank()

    def tearDown(self):
        os.environ.pop("K8V4_QSA", None)
        os.environ.pop("K8V4_QSA_FORCE_ALL", None)
        os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
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

    def test_decode_verifier_and_force_all_match_the_quant_path(self):
        from k8v4_v030.qsa_runtime import note_hidden, try_sparse_forward

        self._continuation(q_len=1, hist=16, hkv=2, seed=8)
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


if __name__ == "__main__":
    unittest.main()
