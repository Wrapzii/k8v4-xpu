"""Layout, prefix-block, and MTP length regressions. No GPU.

The ~59.5K case is the historic signed-int16 wrap. These checks pin the
numbers the kernel is given; the XPU test compares the same lengths against
the running op. Byte geometry runs for both served layouts: 2 KV heads on a
TP2 rank and 4 on a single GPU.
"""

from __future__ import annotations

import unittest
from pathlib import Path

from k8v4_v030.layout import (
    CACHE_DTYPE,
    D,
    DECODE_MAX_T,
    GQA,
    HISTORIC_MTP_LEN,
    PAGE,
    SLOT_BYTES_PER_HEAD,
    PageLayout,
    as_int16,
    block_byte_span,
    builtin_q_end,
    expand_block_ids,
    kernel_page_and_offset,
    n_valid,
    page_regions,
    attention_pages_per_block,
    element_byte,
    max_kernel_pages,
    pages_per_block,
    region_stays_inside_block,
    region_view_specs,
    visible_lens,
)
from k8v4_v030.oracle import causal_gqa, dequant_k, dequant_v, deterministic_rows, quant_k, quant_v


ROOT = Path(__file__).resolve().parents[1]
KERNEL = ROOT / "native" / "xe2_kv_ops.cpp"

TP2 = PageLayout(2)
TP1 = PageLayout(4)
LAYOUTS = (TP2, TP1)


class LayoutTest(unittest.TestCase):
    def test_both_layouts_are_smaller_than_fp8(self):
        self.assertEqual(GQA, 6)
        self.assertEqual(SLOT_BYTES_PER_HEAD, 396)
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                self.assertEqual(layout.hq, 6 * layout.hkv)
                self.assertEqual(layout.bytes_per_token, 396 * layout.hkv)
                self.assertEqual(layout.page_bytes, layout.bytes_per_token * PAGE)
                self.assertLess(layout.bytes_per_token, layout.fp8_bytes_per_token)
                self.assertEqual(layout.fp8_bytes_per_token, 512 * layout.hkv)
        # TP2 keeps its hand-measured numbers.
        self.assertEqual(TP2.bytes_per_token, 792)
        self.assertEqual(TP2.page_bytes, 50688)
        self.assertEqual(TP2.fp8_bytes_per_token, 1024)
        self.assertEqual(TP1.bytes_per_token, 1584)
        self.assertEqual(TP1.page_bytes, 101376)
        # A TP2 rank padding its 2 KV heads out to the one-GPU layout would pay
        # more than fp8; that is why 4 heads only run on a single GPU.
        self.assertGreater(TP1.bytes_per_token, TP2.fp8_bytes_per_token)
        self.assertEqual(CACHE_DTYPE, "int8_k_int4_v")
        self.assertNotEqual(CACHE_DTYPE, "turboquant_k8v4")
        with self.assertRaises(ValueError):
            PageLayout(1)
        with self.assertRaises(ValueError):
            PageLayout(3)
        with self.assertRaises(ValueError):
            PageLayout.for_heads(12, 4)
        with self.assertRaises(ValueError):
            PageLayout.for_heads(24, 2)

    def test_kernel_source_serves_both_head_counts_at_runtime(self):
        text = KERNEL.read_text(encoding="utf-8")
        self.assertIn("template <int HKV>", text)
        self.assertIn("hkv == 2 || hkv == 4", text)
        # The head count is no longer a compile-time constant.
        self.assertNotIn("static constexpr int HKV = 2;", text)
        self.assertNotIn("static constexpr int HKV = 4;", text)
        self.assertNotIn("K8V4_TP1", text)
        self.assertIn("int8k_int4v_attn_batch", text)
        # ABI guard only: pages_per_block stays int64_t in every schema.
        self.assertIn("int64_t pages_per_block", text)
        self.assertNotIn("at::Tensor out, int pages_per_block", text)
        self.assertIn("int q_len, int pages_per_block) -> ()", text)
        self.assertIn("bt[logical / pages_per_block]", text)

    def test_production_block_table_expands_manager_blocks(self):
        self.assertEqual(attention_pages_per_block(1664, 64), 1)
        self.assertEqual(attention_pages_per_block(1664, None), 26)
        # The K8/V4 boot grew the manager block to 2112 and kept that as the
        # kernel block, because MultipleOf(64) accepts 2112. One table entry
        # is then 33 kernel pages. A real 64-token kernel block stays ratio 1.
        self.assertEqual(attention_pages_per_block(2112, 2112), 33)
        self.assertEqual(attention_pages_per_block(2112, None), 33)
        self.assertEqual(attention_pages_per_block(2112, 64), 1)
        self.assertEqual(attention_pages_per_block(1664, 1664), 26)
        self.assertEqual(max_kernel_pages(131072, 1664, 64), 2048)
        self.assertEqual(max_kernel_pages(131072, 1664, None), 79 * 26)
        self.assertEqual(max_kernel_pages(131072, 1664, 1664), 79 * 26)
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                specs = region_view_specs(2, layout)
                self.assertEqual(element_byte(specs["k"], (1, 0, 0, 0)), layout.page_bytes)
                for name, (off, _length) in page_regions(0, layout).items():
                    spec = specs[name]
                    index = (0, 0, 0, 0) if len(spec["shape"]) == 4 else (0, 0, 0)
                    self.assertEqual(element_byte(spec, index), off)
                self.assertEqual(
                    element_byte(specs["v_zero"], (0, 63, layout.hkv - 1)), layout.page_bytes - 4
                )

    def test_slot_pages_and_partial_tail(self):
        self.assertEqual(kernel_page_and_offset(-1), (-1, -1))
        self.assertEqual(kernel_page_and_offset(0), (0, 0))
        self.assertEqual(kernel_page_and_offset(63), (0, 63))
        self.assertEqual(kernel_page_and_offset(64), (1, 0))
        # Manager block 3, block size 128, token 70 inside the block.
        slot = 3 * 128 + 70
        self.assertEqual(kernel_page_and_offset(slot), (7, 6))
        self.assertEqual(n_valid(63, 0), 63)
        self.assertEqual(n_valid(64, 0), 64)
        self.assertEqual(n_valid(65, 1), 1)
        self.assertEqual(n_valid(HISTORIC_MTP_LEN, HISTORIC_MTP_LEN // PAGE), HISTORIC_MTP_LEN % PAGE)
        self.assertEqual(HISTORIC_MTP_LEN % PAGE, 44)
        self.assertEqual(n_valid(HISTORIC_MTP_LEN, HISTORIC_MTP_LEN // PAGE + 1), 0)

    def test_block_table_expansion_matches_slots(self):
        self.assertEqual(pages_per_block(64), 1)
        self.assertEqual(pages_per_block(1664), 26)
        expanded = expand_block_ids([3, 5], 2)
        self.assertEqual(expanded, [6, 7, 10, 11])
        # Token 70 of block 3 is kernel page 7, which is the second page of that block.
        self.assertEqual(expanded[1], kernel_page_and_offset(3 * 128 + 70)[0])

    def test_prefix_copy_keeps_k_v_and_scales_together(self):
        block_size = 128
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                self.assertTrue(region_stays_inside_block(block_size, layout))
                self.assertTrue(region_stays_inside_block(1664, layout))
                blob = bytearray(3 * pages_per_block(block_size) * layout.page_bytes)
                src, nbytes = block_byte_span(1, block_size, layout)
                for i in range(nbytes):
                    blob[src + i] = (i * 17 + 3) & 0xFF
                dst, _ = block_byte_span(0, block_size, layout)
                blob[dst : dst + nbytes] = blob[src : src + nbytes]
                self.assertEqual(blob[dst : dst + nbytes], blob[src : src + nbytes])
                # A region that started in another block would fail this equality after
                # a single-block copy. Every region of page 0 (the copy) matches page
                # `ratio` (the source) byte for byte.
                ratio = pages_per_block(block_size)
                for name in ("k", "v", "k_scale", "v_scale", "v_zero"):
                    off, length = page_regions(0, layout)[name]
                    src_off, src_len = page_regions(ratio, layout)[name]
                    self.assertEqual(length, src_len)
                    self.assertEqual(blob[off : off + length], blob[src_off : src_off + src_len])

    def test_mtp7_visible_lens_at_59500_is_not_int16(self):
        q_len = 7
        self.assertLessEqual(q_len, DECODE_MAX_T)
        vis = visible_lens(HISTORIC_MTP_LEN, q_len)
        self.assertEqual(len(vis), 1 + q_len)
        self.assertEqual(vis[0], HISTORIC_MTP_LEN)
        self.assertEqual(vis[1], HISTORIC_MTP_LEN - 6)
        self.assertEqual(vis[q_len], HISTORIC_MTP_LEN)
        for j in range(q_len):
            self.assertEqual(vis[1 + j], builtin_q_end(HISTORIC_MTP_LEN, q_len, j))
            # 59500 fits in uint16 and does not fit in signed int16.
            self.assertGreater(vis[1 + j], 32767)
            self.assertLess(vis[1 + j], 65536)
            self.assertLess(as_int16(vis[1 + j]), 0)
            self.assertNotEqual(as_int16(vis[1 + j]), vis[1 + j])
        wrapped = as_int16(HISTORIC_MTP_LEN)
        self.assertEqual(wrapped, 59500 - 65536)
        other = visible_lens(59527, q_len)
        self.assertEqual(other[0], 59527)
        self.assertNotEqual(as_int16(59527), 59527)
        # Past the uint16 boundary the full integer has to survive too.
        past = visible_lens(70000, q_len)
        self.assertEqual(past[0], 70000)
        self.assertNotEqual(past[0] & 0xFFFF, past[0])
        self.assertEqual(visible_lens(131072, 1), [131072, 131072])

    def test_quant_roundtrip_and_short_causal_reference(self):
        row = deterministic_rows(1, 1, seed=7)[0][0]
        packed, scale = quant_k(row)
        restored = dequant_k(packed, scale)
        self.assertEqual(len(packed), D)
        self.assertLess(max(abs(a - b) for a, b in zip(row, restored)), scale + 1e-6)
        vpack, vscale, vzero = quant_v(row)
        vrest = dequant_v(vpack, vscale, vzero)
        self.assertEqual(len(vpack), D // 2)
        self.assertLess(max(abs(a - b) for a, b in zip(row, vrest)), vscale + 1e-5)

        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                seq_len = 5
                q_len = 2
                key = deterministic_rows(seq_len, layout.hkv, seed=1)
                value = deterministic_rows(seq_len, layout.hkv, seed=2)
                query = [key[seq_len - q_len + j] for j in range(q_len)]
                # Broadcast KV heads into Q heads so the fixture is a real GQA tensor.
                query_gqa = []
                for tok in query:
                    heads = []
                    for h in range(layout.hq):
                        heads.append(tok[h // GQA])
                    query_gqa.append(heads)
                out = causal_gqa(query_gqa, key, value, seq_len, q_len)
                self.assertEqual(len(out), q_len)
                self.assertEqual(len(out[0]), layout.hq)
                self.assertTrue(all(math_finite(x) for head in out[0] for x in head))
                # Query 0 cannot see the last key. Zero that key and the first query
                # output must stay put; the last query must move.
                key_cut = [list(map(list, heads)) for heads in key]
                for h in range(layout.hkv):
                    key_cut[-1][h] = [0.0] * D
                out_cut = causal_gqa(query_gqa, key_cut, value, seq_len, q_len)
                self.assertEqual(out[0][0], out_cut[0][0])
                self.assertNotEqual(out[1][0], out_cut[1][0])


def math_finite(value: float) -> bool:
    return value == value and value not in (float("inf"), float("-inf"))


if __name__ == "__main__":
    unittest.main()
