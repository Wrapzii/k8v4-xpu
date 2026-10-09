"""Host decisions the backend uses for MTP batches and scratch sizing."""

from __future__ import annotations

import unittest
from pathlib import Path

import torch

from k8v4_v030.layout import PageLayout
from k8v4_v030.plan import (
    layout_for_heads,
    query_segments,
    require_decoder,
    scratch_capacity,
    token_span,
    uniform_packed_q_len,
    workspace_programs,
)
from k8v4_v030.scratch import Scratch, clear_scratch, ensure_scratch

ROOT = Path(__file__).resolve().parents[1]

TP2 = PageLayout(2)
TP1 = PageLayout(4)


class PlanTest(unittest.TestCase):
    def test_mtp7_batch_is_one_packed_segment(self):
        starts = [i * 7 for i in range(9)]
        self.assertEqual(uniform_packed_q_len(starts), 7)
        self.assertEqual(query_segments(starts), [(0, 8, 7)])

    def test_mixed_prefill_is_not_a_packed_decode(self):
        starts = [0, 7, 14, 114]
        self.assertEqual(uniform_packed_q_len(starts), 0)
        self.assertEqual(query_segments(starts), [(0, 2, 7), (2, 1, 100)])
        self.assertEqual(token_span(starts, 2, 1, 100), (14, 100))

    def test_production_scratch_covers_the_manager_block_table(self):
        for layout in (TP2, TP1):
            with self.subTest(hkv=layout.hkv):
                nprog, store, out = scratch_capacity(
                    131072, 1664, 1664, 8192, 8, [7, 14, 21, 28, 35, 42, 49, 56], layout
                )
                self.assertEqual(nprog, (79 * 26 + 26) * layout.hkv)
                self.assertEqual(store, 8192)
                self.assertEqual(out, 80)
                split = scratch_capacity(131072, 1664, 64, 8192, 8, [], layout)
                self.assertEqual(split[0], (2048 + 1) * layout.hkv)
                unset = scratch_capacity(131072, 1664, None, 8192, 8, [], layout)
                self.assertEqual(unset[0], nprog)
                self.assertEqual(
                    workspace_programs(36, 26, layout), 36 * 26 * layout.hkv
                )

    def test_rejects_the_wrong_model_shape(self):
        self.assertEqual(layout_for_heads(12, 2, 256).hkv, 2)
        self.assertEqual(layout_for_heads(24, 4, 256).hkv, 4)
        with self.assertRaises(RuntimeError):
            layout_for_heads(24, 2, 256)
        with self.assertRaises(RuntimeError):
            layout_for_heads(12, 4, 256)
        with self.assertRaises(RuntimeError):
            layout_for_heads(6, 1, 256)
        with self.assertRaises(RuntimeError):
            layout_for_heads(12, 2, 128)
        require_decoder("decoder", None, None, None, 0.0625)
        with self.assertRaises(RuntimeError):
            require_decoder("encoder", None, None, None, 0.0625)
        with self.assertRaises(RuntimeError):
            require_decoder("decoder", 128, None, None, 0.0625)
        with self.assertRaises(RuntimeError):
            require_decoder("decoder", None, None, None, 1.0)

    def test_backend_source_is_the_native_batch_op(self):
        text = (ROOT / "backend.py").read_text(encoding="utf-8")
        self.assertIn("class Xe2K8V4AttentionBackend", text)
        self.assertIn("int8k_int4v_attn_batch", text)
        self.assertIn("supports_spec_as_decode=True", text)
        self.assertIn("register_backend(AttentionBackendEnum.CUSTOM)", text)
        self.assertIn("return AttentionBackendEnum.CUSTOM.name", text)
        self.assertNotIn('return "XE2_K8V4"', text)
        self.assertNotIn("xe2_kv_vllm_overlay", text)
        self.assertNotIn("fill_(1)", text)
        self.assertNotIn(".item()", text)
        self.assertIn("def _require_page_ratio", text)
        self.assertIn("K8/V4 pages per block-table entry", text)


class ScratchTest(unittest.TestCase):
    def tearDown(self):
        clear_scratch()

    def test_workspace_narrow_is_exact_and_reused(self):
        device = torch.device("cpu")
        scratch = Scratch(device, TP2, nprog_max=8, max_store_tokens=4, max_out_tokens=4)
        partials, m_state, l_state, merged = scratch.workspace(3)
        self.assertEqual(partials.shape[0], 3)
        self.assertEqual(m_state.shape[0], 3)
        self.assertEqual(l_state.shape[0], 3)
        self.assertEqual(partials.data_ptr(), scratch.partials.data_ptr())
        self.assertEqual(merged.shape[0], 2)
        with self.assertRaises(RuntimeError):
            scratch.workspace(9)
        k_buf, v_buf = scratch.store_pair(4)
        self.assertEqual(k_buf.shape[0], 4)
        self.assertEqual(v_buf.shape[1], 2)
        first = ensure_scratch(device, TP2, 4, 4, 4)
        second = ensure_scratch(device, TP2, 4, 4, 4)
        self.assertIs(first, second)
        grown = ensure_scratch(device, TP2, 6, 4, 4)
        self.assertIsNot(first, grown)
        self.assertEqual(grown.nprog_max, 6)

    def test_scratch_follows_the_layout_it_was_built_with(self):
        device = torch.device("cpu")
        tp1 = Scratch(device, TP1, nprog_max=8, max_store_tokens=4, max_out_tokens=4)
        self.assertEqual(tp1.q8.shape[0], 4)
        self.assertEqual(tp1.q_fp16.shape[1], 24)
        self.assertEqual(tp1.merged.shape[0], 4)
        self.assertIsNot(ensure_scratch(device, TP2, 4, 4, 4), ensure_scratch(device, TP1, 4, 4, 4))


if __name__ == "__main__":
    unittest.main()
