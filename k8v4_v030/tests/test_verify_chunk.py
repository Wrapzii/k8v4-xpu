"""K8V4_VERIFY_CHUNK: chunk plan and gate (CPU), chunked verify vs one-row calls (XPU)."""

from __future__ import annotations

import os
import unittest
from types import SimpleNamespace

from k8v4_v030 import verify_chunk
from k8v4_v030.layout import DECODE_MAX_T
from k8v4_v030.plan import uniform_packed_q_len


class PlanTest(unittest.TestCase):
    def test_gate_is_off_by_default_and_strict(self):
        self.assertEqual(verify_chunk.chunk_rows({}), 0)
        self.assertEqual(verify_chunk.max_query_rows({}), DECODE_MAX_T)
        self.assertEqual(verify_chunk.chunk_rows({"K8V4_VERIFY_CHUNK": "8"}), 8)
        self.assertEqual(verify_chunk.max_query_rows({"K8V4_VERIFY_CHUNK": "8"}), verify_chunk.VERIFY_MAX_T)
        for bad in ("11", "-1", "x", "8.0"):
            with self.subTest(bad=bad):
                with self.assertRaises(RuntimeError):
                    verify_chunk.chunk_rows({"K8V4_VERIFY_CHUNK": bad})

    def test_chunks_cover_rows_and_trim_seq_lens(self):
        self.assertEqual(verify_chunk.plan(16, 8), [(0, 8, 8), (8, 16, 0)])
        self.assertEqual(verify_chunk.plan(16, 10), [(0, 8, 8), (8, 16, 0)])
        self.assertEqual(verify_chunk.plan(7, 8), [(0, 7, 0)])
        for q_len in range(1, verify_chunk.VERIFY_MAX_T + 1):
            for chunk in range(1, DECODE_MAX_T + 1):
                parts = verify_chunk.plan(q_len, chunk)
                self.assertEqual(parts[0][0], 0)
                self.assertEqual(parts[-1][1:], (q_len, 0))
                for (a0, a1, trim), nxt in zip(parts, parts[1:] + [None]):
                    self.assertLessEqual(a1 - a0, chunk)
                    self.assertEqual(trim, q_len - a1)
                    if nxt is not None:
                        self.assertEqual(a1, nxt[0])
        with self.assertRaises(ValueError):
            verify_chunk.plan(verify_chunk.VERIFY_MAX_T + 1, 8)

    def test_packed_width_widens_only_when_asked(self):
        starts = [0, 16, 32]
        self.assertEqual(uniform_packed_q_len(starts), 0)
        self.assertEqual(uniform_packed_q_len(starts, verify_chunk.VERIFY_MAX_T), 16)
        self.assertEqual(uniform_packed_q_len([0, 7, 14]), 7)


def _xpu_ready() -> bool:
    try:
        import torch

        from k8v4_v030.ops_api import library_path
    except Exception:
        return False
    xpu = getattr(torch, "xpu", None)
    return bool(xpu is not None and xpu.is_available() and os.path.isfile(library_path()))


@unittest.skipUnless(_xpu_ready(), "XPU K8/V4 library is not available")
class ChunkedVerifyXpuTest(unittest.TestCase):
    def test_depth15_verify_matches_one_row_calls(self):
        import torch

        from k8v4_v030.backend import Xe2K8V4Impl
        from k8v4_v030.cache_views import bind_regions
        from k8v4_v030.layout import CACHE_DTYPE, D, PAGE, PageLayout
        from k8v4_v030.ops_api import ops
        from k8v4_v030.plan import workspace_programs
        from k8v4_v030.scratch import ensure_scratch, get_scratch

        device = torch.device("xpu", torch.xpu.current_device())
        layout = PageLayout(4)
        hkv, hq = layout.hkv, layout.hq
        lens = [3000, 5003]
        q_len = 16
        pages = [(n + PAGE - 1) // PAGE for n in lens]
        width = max(pages)
        raw = torch.zeros(sum(pages) * layout.page_bytes, dtype=torch.int8, device=device)
        views = bind_regions(raw, layout)
        gen = torch.Generator(device="cpu")
        gen.manual_seed(1519)
        table = torch.zeros(len(lens), width, dtype=torch.int32)
        page0 = 0
        for i, n in enumerate(lens):
            table[i, : pages[i]] = torch.arange(page0, page0 + pages[i], dtype=torch.int32)
            key = torch.randn(n, hkv, D, generator=gen, dtype=torch.float16).to(device)
            value = torch.randn(n, hkv, D, generator=gen, dtype=torch.float16).to(device)
            slots = (torch.arange(n, dtype=torch.int64) + page0 * PAGE).to(device)
            ops().kv_store_paged(key, value, slots, views["k"], views["k_scale"], views["v"],
                                 views["v_scale"], views["v_zero"])
            page0 += pages[i]
        table = table.to(device)
        seq = torch.tensor(lens, dtype=torch.int32, device=device)
        query = torch.randn(len(lens) * q_len, hq, D, generator=gen, dtype=torch.float16).to(device)
        nprog = workspace_programs(width, 1, layout)
        ensure_scratch(device, layout, nprog, 1, len(lens) * q_len)
        scratch = get_scratch(device, layout)

        os.environ["K8V4_VERIFY_CHUNK"] = "8"
        try:
            impl = Xe2K8V4Impl(hq, D, 1.0 / (D ** 0.5), num_kv_heads=hkv, kv_cache_dtype=CACHE_DTYPE)
            meta = SimpleNamespace(block_table=table, seq_lens=seq, pages_per_block=1)
            out = torch.zeros(len(lens) * q_len, hq, D, dtype=torch.float16, device=device)
            impl._attn_chunked(query, raw, meta, out, 0, len(lens), q_len, 0, len(lens) * q_len)
        finally:
            os.environ.pop("K8V4_VERIFY_CHUNK", None)

        gap = 0.0
        partials, m_state, l_state, merged = scratch.workspace(workspace_programs(width, 1, layout))
        for i, n in enumerate(lens):
            for j in range(q_len):
                q_buf, o_buf = scratch.attention_pair(1)
                q_buf.copy_(query[i * q_len + j : i * q_len + j + 1])
                one = torch.tensor([n - (q_len - 1 - j)], dtype=torch.int32, device=device)
                ops().int8k_int4v_attn_batch(
                    q_buf, scratch.q8, scratch.q_scale, views["k"], views["k_scale"], views["v"],
                    views["v_scale"], views["v_zero"], table[i : i + 1].contiguous(), one, scratch.visible,
                    partials, m_state, l_state, merged, o_buf, 1, 1,
                )
                ref = o_buf.clone()
                gap = max(gap, float((ref.float() - out[i * q_len + j].float()).abs().max().item()))
        torch.xpu.synchronize()
        self.assertTrue(bool(torch.isfinite(out).all().item()))
        self.assertGreater(float(out.abs().max().item()), 0.0)
        print("chunked verify vs one-row calls: max abs gap %.3g" % gap, flush=True)
        self.assertLess(gap, 1e-3)


if __name__ == "__main__":
    unittest.main()
