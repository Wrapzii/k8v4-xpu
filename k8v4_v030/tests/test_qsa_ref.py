"""Indexer reference: RoPE, pooling, ReLU scores, and the block budget."""

from __future__ import annotations

import json
import math
import os
import tempfile
import unittest

import torch

from k8v4_v030.qsa_config import (
    PARAMS_PER_LAYER,
    PARAMS_TOTAL,
    SECTIONS,
    full_attention_layers,
    is_full_attention_layer,
    qsa_enabled,
    top_tokens,
)
from k8v4_v030.qsa_ref import (
    QsaHyper,
    apply_q_rope,
    complete_blocks,
    fp_gqa,
    pool_block,
    project_indexer,
    rmsnorm,
    score_blocks,
    select_blocks,
    topk_block_ids,
    visible_tokens,
)
from k8v4_v030.qsa_rope import mrope, mrope_row, pair_axis
from k8v4_v030.qsa_weights import IndexerBank, expected_full_numel, load_bank_file, make_random_bank


class FlagTest(unittest.TestCase):
    def test_default_off_and_layer_map(self):
        previous = os.environ.pop("K8V4_QSA", None)
        previous_top = os.environ.pop("K8V4_QSA_TOP_TOKENS", None)
        try:
            self.assertFalse(qsa_enabled())
            self.assertEqual(top_tokens(), 2048)
        finally:
            if previous is not None:
                os.environ["K8V4_QSA"] = previous
            if previous_top is not None:
                os.environ["K8V4_QSA_TOP_TOKENS"] = previous_top
        layers = full_attention_layers()
        self.assertEqual(len(layers), 16)
        self.assertEqual(layers[0], 3)
        self.assertEqual(layers[-1], 63)
        for index in range(64):
            self.assertEqual(is_full_attention_layer(index), (index + 1) % 4 == 0)
        self.assertFalse(is_full_attention_layer(64))
        self.assertEqual(PARAMS_PER_LAYER, 3_277_184)
        self.assertEqual(PARAMS_TOTAL, 52_434_944)
        self.assertEqual(expected_full_numel(), PARAMS_TOTAL)

    def test_random_bank_matches_the_parameter_count(self):
        bank = make_random_bank(0)
        self.assertEqual(sorted(bank.layers), list(full_attention_layers()))
        self.assertEqual(bank.numel(), PARAMS_TOTAL)
        self.assertIsNone(bank.get(0))
        self.assertIsNotNone(bank.get(3))


class RopeTest(unittest.TestCase):
    def test_interleaved_axes_follow_the_ggml_rule(self):
        self.assertEqual(pair_axis(0), 0)
        self.assertEqual(pair_axis(1), 1)
        self.assertEqual(pair_axis(2), 2)
        self.assertEqual(pair_axis(3), 0)
        self.assertEqual(sum(SECTIONS), 32)

    def test_row_matches_a_hand_expanded_pair(self):
        sections = (1, 1, 0, 0)
        n_rot = 4
        theta = 10000.0
        row = [0.5, -0.25, 0.125, 0.75, 9.0]
        pos = (2, 5, 7, 9)
        scale = theta ** (-2.0 / n_rot)
        freq0 = 2.0 * (scale ** 0)
        freq1 = 5.0 * (scale ** 1)
        c0, s0 = math.cos(freq0), math.sin(freq0)
        c1, s1 = math.cos(freq1), math.sin(freq1)
        out = mrope_row(row, pos, n_rot=n_rot, sections=sections, theta=theta)
        self.assertAlmostEqual(out[0], row[0] * c0 - row[2] * s0)
        self.assertAlmostEqual(out[2], row[0] * s0 + row[2] * c0)
        self.assertAlmostEqual(out[1], row[1] * c1 - row[3] * s1)
        self.assertAlmostEqual(out[3], row[1] * s1 + row[3] * c1)
        self.assertEqual(out[4], 9.0)
        batched = mrope(
            torch.tensor(row, dtype=torch.float64).view(1, 5),
            torch.tensor(pos).view(1, 4),
            n_rot=n_rot,
            sections=sections,
            theta=theta,
        )
        self.assertTrue(torch.allclose(batched[0], torch.tensor(out, dtype=torch.float64), atol=1e-12))


class IndexerMathTest(unittest.TestCase):
    def test_rmsnorm_and_pool_and_relu_sum(self):
        weight = torch.tensor([1.0, 2.0, 0.5, 1.0], dtype=torch.float64)
        raw = torch.tensor([3.0, 0.0, -3.0, 4.0], dtype=torch.float64)
        normed = rmsnorm(raw, weight, eps=1e-6)
        var = float((raw * raw).mean())
        scale = (var + 1e-6) ** -0.5
        expect = raw * scale * weight
        self.assertTrue(torch.allclose(normed, expect))

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
        keys = torch.tensor(
            [
                [1.0, 0.0, 0.0, 0.0],
                [3.0, 0.0, 0.0, 0.0],
                [5.0, 0.0, 0.0, 0.0],
                [7.0, 0.0, 0.0, 0.0],
            ],
            dtype=torch.float64,
        )
        block_norm = torch.ones(4, dtype=torch.float64)
        first = torch.zeros(4, dtype=torch.int64)
        pooled = pool_block(keys, block_norm, first, hyper)
        mean = keys.mean(dim=0)
        # Position 0 makes every frequency 0, so RoPE is identity.
        self.assertTrue(torch.allclose(pooled, rmsnorm(mean, block_norm, hyper.eps)))

        query = torch.tensor([[1.0, 0.0, 0.0, 0.0], [-1.0, 0.0, 0.0, 0.0]], dtype=torch.float64)
        blocks = torch.stack([pooled, -pooled])
        scores = score_blocks(query, blocks)
        dot = float((pooled * query[0]).sum() + torch.relu(pooled * query[1]).sum())
        # head 0 dot is positive, head 1 dot is its negation so relu kills it
        # on block 0. Block 1 flips the sign.
        naive = []
        for block in blocks:
            total = 0.0
            for head in range(2):
                total += float(torch.relu((block * query[head]).sum()))
            naive.append(total)
        self.assertTrue(torch.allclose(scores, torch.tensor(naive, dtype=torch.float64)))
        self.assertAlmostEqual(float(scores[0]), dot)

    def test_topk_ties_keep_the_lower_block_and_the_own_block_is_kept(self):
        scores = torch.tensor([1.0, 5.0, 5.0, 0.5, 4.0], dtype=torch.float64)
        self.assertEqual(topk_block_ids(scores, 3), [1, 2, 4])
        hyper = QsaHyper(top_tokens=8, ratio=4)
        # cell 19 -> 5 complete blocks (0..4), own block 4, width 4.
        self.assertEqual(complete_blocks(19, 4), 5)
        chosen, width = select_blocks(scores, 19, hyper, force_all=False)
        self.assertEqual(width, 4)
        self.assertEqual(chosen, [1, 2, 4])
        self.assertIn(4, chosen)
        # cell 17 is inside block 4 but the block is not complete (width 2).
        # c = 4, own = 4, so the tail is appended beside the top 2 of 4.
        chosen_tail, width_tail = select_blocks(scores, 17, hyper, force_all=False)
        self.assertEqual(width_tail, 2)
        self.assertEqual(chosen_tail, sorted(set(topk_block_ids(scores[:4], 2) + [4])))
        forced, forced_width = select_blocks(scores, 19, hyper, force_all=True)
        self.assertEqual(forced, [0, 1, 2, 3, 4])
        self.assertEqual(forced_width, 4)
        self.assertEqual(visible_tokens(19, forced, forced_width, 4), list(range(20)))
        # Dropped block 0 and block 3. Own block is complete, so all 4 of its tokens stay.
        sparse = visible_tokens(19, [1, 2, 4], 4, 4)
        self.assertEqual(sparse, [4, 5, 6, 7, 8, 9, 10, 11, 16, 17, 18, 19])

    def test_projection_shapes_and_q_rope_changes_a_nonzero_position(self):
        hyper = QsaHyper()
        bank = make_random_bank(1, layers=(3,))
        weights = bank.get(3)
        assert weights is not None
        hidden = torch.randn(2, hyper.hidden, dtype=torch.float32)
        query, key = project_indexer(
            hidden, weights.q_proj, weights.k_proj, weights.q_norm, weights.k_norm, hyper
        )
        self.assertEqual(tuple(query.shape), (2, 4, 128))
        self.assertEqual(tuple(key.shape), (2, 128))
        pos = torch.tensor([[0, 0, 0, 0], [3, 3, 3, 3]], dtype=torch.int64)
        rotated = apply_q_rope(query, pos, hyper)
        self.assertTrue(torch.allclose(rotated[0], query[0], atol=1e-8))
        self.assertFalse(torch.allclose(rotated[1], query[1], atol=1e-6))

    def test_fp_gqa_matches_an_independent_loop(self):
        torch.manual_seed(4)
        q = torch.randn(2, 12, 8, dtype=torch.float64)
        k = torch.randn(6, 2, 8, dtype=torch.float64)
        v = torch.randn(6, 2, 8, dtype=torch.float64)
        visible = [[0, 1, 2], [0, 1, 2, 3, 4]]
        got = fp_gqa(q, k, v, visible, scale=0.5)
        for qi, tokens in enumerate(visible):
            for head in range(12):
                kv_head = head // 6
                scores = []
                for token in tokens:
                    scores.append(0.5 * float((q[qi, head] * k[token, kv_head]).sum()))
                peak = max(scores)
                weights = [math.exp(s - peak) for s in scores]
                denom = sum(weights)
                acc = [0.0] * 8
                for token, weight in zip(tokens, weights):
                    row = v[token, kv_head].tolist()
                    for dim in range(8):
                        acc[dim] += (weight / denom) * row[dim]
                self.assertTrue(
                    torch.allclose(got[qi, head], torch.tensor(acc, dtype=torch.float64), atol=1e-10)
                )


class StateDictTest(unittest.TestCase):
    def test_missing_tensors_mean_dense_and_a_partial_layer_raises(self):
        self.assertIsNone(IndexerBank.from_state_dict({"model.embed.weight": torch.zeros(2)}))
        hyper = QsaHyper()
        bank = make_random_bank(2, layers=(7,), hyper=hyper)
        weights = bank.get(7)
        assert weights is not None
        state = {
            "model.layers.7._qsa_indexer.q_proj.weight": weights.q_proj,
            "model.layers.7._qsa_indexer.k_proj.weight": weights.k_proj,
            "language.layers.7._qsa_indexer.q_norm": weights.q_norm,
            "layers.7._qsa_indexer.k_norm.weight": weights.k_norm,
            "layers.7._qsa_indexer.k_block_norm": weights.k_block_norm,
        }
        loaded = IndexerBank.from_state_dict(state, hyper, norm_storage="multiplier")
        assert loaded is not None
        got = loaded.get(7)
        assert got is not None
        self.assertEqual(got.numel(), weights.numel())
        self.assertTrue(torch.equal(got.k_norm, weights.k_norm))
        del state["layers.7._qsa_indexer.k_block_norm"]
        with self.assertRaisesRegex(ValueError, "missing"):
            IndexerBank.from_state_dict(state, hyper, norm_storage="multiplier")

    def test_hf_delta_and_self_attn_key_become_the_multiplier(self):
        hyper = QsaHyper()
        dim = hyper.dim
        q_out = hyper.heads * dim
        q_proj = torch.randn(q_out, hyper.hidden)
        k_proj = torch.randn(dim, hyper.hidden)
        state = {
            "model.language_model.layers.3.self_attn._qsa_indexer.q_proj.weight": q_proj,
            "model.language_model.layers.3.self_attn._qsa_indexer.k_proj.weight": k_proj,
            "model.language_model.layers.3.self_attn._qsa_indexer.q_norm": torch.zeros(dim),
            "model.language_model.layers.3.self_attn._qsa_indexer.k_norm": torch.full((dim,), 0.25),
            "model.language_model.layers.3.self_attn._qsa_indexer.k_block_norm": torch.full((dim,), -0.5),
        }
        loaded = IndexerBank.from_state_dict(state, hyper)
        assert loaded is not None
        got = loaded.get(3)
        assert got is not None
        self.assertTrue(torch.equal(got.q_proj, q_proj))
        self.assertTrue(torch.equal(got.q_norm, torch.ones(dim)))
        self.assertTrue(torch.equal(got.k_norm, torch.full((dim,), 1.25)))
        self.assertTrue(torch.equal(got.k_block_norm, torch.full((dim,), 0.5)))

    def test_directory_reads_indexer_shards_and_skips_dense_weights(self):
        from safetensors.torch import save_file

        hyper = QsaHyper()
        weights = make_random_bank(5, layers=(3,), hyper=hyper).get(3)
        assert weights is not None
        with tempfile.TemporaryDirectory() as folder:
            save_file(
                {
                    "model.layers.3._qsa_indexer.q_proj.weight": weights.q_proj,
                    "model.layers.0.mlp.up_proj.weight": torch.zeros(8, 8),
                },
                os.path.join(folder, "model-00001-of-00002.safetensors"),
            )
            save_file(
                {
                    "model.layers.3._qsa_indexer.k_proj.weight": weights.k_proj,
                    "model.layers.3._qsa_indexer.q_norm": weights.q_norm - 1,
                    "model.layers.3._qsa_indexer.k_norm": weights.k_norm - 1,
                    "model.layers.3._qsa_indexer.k_block_norm": weights.k_block_norm - 1,
                },
                os.path.join(folder, "model-00002-of-00002.safetensors"),
                metadata={"norm_storage": "zero-centered-delta"},
            )
            index = {
                "weight_map": {
                    "model.layers.3._qsa_indexer.q_proj.weight": "model-00001-of-00002.safetensors",
                    "model.layers.0.mlp.up_proj.weight": "model-00001-of-00002.safetensors",
                    "model.layers.3._qsa_indexer.k_proj.weight": "model-00002-of-00002.safetensors",
                    "model.layers.3._qsa_indexer.q_norm": "model-00002-of-00002.safetensors",
                    "model.layers.3._qsa_indexer.k_norm": "model-00002-of-00002.safetensors",
                    "model.layers.3._qsa_indexer.k_block_norm": "model-00002-of-00002.safetensors",
                }
            }
            with open(os.path.join(folder, "model.safetensors.index.json"), "w", encoding="utf-8") as handle:
                json.dump(index, handle)
            loaded = load_bank_file(folder, hyper)
            assert loaded is not None
            got = loaded.get(3)
            assert got is not None
            self.assertTrue(torch.equal(got.q_proj, weights.q_proj))
            self.assertTrue(torch.equal(got.q_norm, weights.q_norm))
            self.assertTrue(torch.equal(got.k_norm, weights.k_norm))
            self.assertTrue(torch.equal(got.k_block_norm, weights.k_block_norm))
            self.assertEqual(got.numel(), weights.numel())
            baked = os.path.join(folder, "baked.safetensors")
            save_file(
                {
                    "model.layers.3._qsa_indexer.q_proj.weight": weights.q_proj,
                    "model.layers.3._qsa_indexer.k_proj.weight": weights.k_proj,
                    "model.layers.3._qsa_indexer.q_norm": weights.q_norm,
                    "model.layers.3._qsa_indexer.k_norm": weights.k_norm,
                    "model.layers.3._qsa_indexer.k_block_norm": weights.k_block_norm,
                },
                baked,
                metadata={"norm_storage": "multiplier"},
            )
            baked_bank = load_bank_file(baked, hyper)
            assert baked_bank is not None
            baked_got = baked_bank.get(3)
            assert baked_got is not None
            self.assertTrue(torch.equal(baked_got.k_block_norm, weights.k_block_norm))
            empty = tempfile.mkdtemp()
            try:
                self.assertIsNone(load_bank_file(empty, hyper))
            finally:
                os.rmdir(empty)


if __name__ == "__main__":
    unittest.main()
