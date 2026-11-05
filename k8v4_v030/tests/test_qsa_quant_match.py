"""Sparse quantized attention matches dense K8/V4 when every block is kept."""

from __future__ import annotations

import struct
import unittest

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import PAGE, PageLayout
from k8v4_v030.oracle import causal_gqa, dequant_v, deterministic_rows, quant_k, quant_v
from k8v4_v030.paged import write_token
from k8v4_v030.qsa_quant_attn import (
    allow_all,
    allow_tokens,
    attend_quantized,
    load_quantized_views,
    sparse_causal_gqa,
    sparse_from_views,
)
from k8v4_v030.qsa_ref import cells_for_queries, select_blocks, visible_tokens
from k8v4_v030.qsa_ref import QsaHyper


def _lists_equal(got, expect) -> bool:
    if len(got) != len(expect):
        return False
    for grow, erow in zip(got, expect):
        if len(grow) != len(erow):
            return False
        for ghead, ehead in zip(grow, erow):
            if len(ghead) != len(ehead):
                return False
            for gval, eval_ in zip(ghead, ehead):
                if gval != eval_:
                    return False
    return True


class QuantMatchTest(unittest.TestCase):
    def _run(self, seq_len: int, q_len: int, hkv: int, seed: int):
        hq = 6 * hkv
        key = deterministic_rows(seq_len, hkv, seed)
        value = deterministic_rows(seq_len, hkv, seed + 1)
        query = deterministic_rows(q_len, hq, seed + 2)
        dense = causal_gqa(query, key, value, seq_len, q_len)
        full = sparse_causal_gqa(query, key, value, seq_len, q_len, allow_all)
        self.assertTrue(_lists_equal(full, dense))
        # Drop token 1 for every query. Changing that key must not move the result.
        kept = [t for t in range(seq_len) if t != 1]
        masked = sparse_causal_gqa(
            query, key, value, seq_len, q_len, allow_tokens([kept] * q_len)
        )
        key_mut = [list(map(list, heads)) for heads in key]
        for dim in range(len(key_mut[1][0])):
            key_mut[1][0][dim] += 10.0
        masked_mut = sparse_causal_gqa(
            query, key_mut, value, seq_len, q_len, allow_tokens([kept] * q_len)
        )
        self.assertTrue(_lists_equal(masked, masked_mut))
        self.assertFalse(_lists_equal(masked, dense))

    def test_decode_verifier_and_chunk_match_dense_when_unmasked(self):
        self._run(seq_len=8, q_len=1, hkv=2, seed=10)
        self._run(seq_len=20, q_len=7, hkv=2, seed=11)
        self._run(seq_len=16, q_len=5, hkv=4, seed=12)

    def test_forced_all_blocks_match_dense_and_packed_pages(self):
        seq_len, q_len, hkv = 16, 3, 2
        hq = 6 * hkv
        key = deterministic_rows(seq_len, hkv, 21)
        value = deterministic_rows(seq_len, hkv, 22)
        query = deterministic_rows(q_len, hq, 23)
        dense = causal_gqa(query, key, value, seq_len, q_len)
        hyper = QsaHyper(top_tokens=8, ratio=4)
        visible = []
        for cell in cells_for_queries(seq_len, q_len):
            # Scores are unused when every block is forced in.
            dummy = torch.zeros(8, dtype=torch.float64)
            blocks, width = select_blocks(dummy, cell, hyper, force_all=True)
            tokens = visible_tokens(cell, blocks, width, hyper.ratio)
            self.assertEqual(tokens, list(range(cell + 1)))
            visible.append(tokens)
        selected = sparse_causal_gqa(
            query, key, value, seq_len, q_len, allow_tokens(visible)
        )
        self.assertTrue(_lists_equal(selected, dense))

        layout = PageLayout(hkv)
        blob = bytearray(PAGE * layout.page_bytes)
        for slot in range(seq_len):
            write_token(blob, slot, key[slot], value[slot])
        # The page stores scales as float32. The integer K and V nibbles match
        # the oracle; attention on those stored scales matches the page reader.
        raw = torch.frombuffer(blob, dtype=torch.int8)
        views = bind_regions(raw, layout)
        block_row = torch.arange(PAGE, dtype=torch.int32)
        kq, vq, packed_layout = load_quantized_views(views, block_row, seq_len, 1)
        for token in range(seq_len):
            for head in range(hkv):
                packed_k, scale = quant_k(key[token][head])
                self.assertEqual(kq[token][head][0], packed_k)
                self.assertEqual(kq[token][head][1], _f32(scale))
                packed_v, vscale, vzero = quant_v(value[token][head])
                self.assertEqual(vq[token][head], dequant_v(packed_v, _f32(vscale), _f32(vzero)))
        stored = attend_quantized(query, kq, vq, seq_len, q_len, allow_all, packed_layout)
        packed = sparse_from_views(
            query, views, block_row, seq_len, q_len, allow_all, pages_per_block=1
        )
        self.assertTrue(_lists_equal(packed, stored))
        packed_blocks = sparse_from_views(
            query,
            views,
            block_row,
            seq_len,
            q_len,
            allow_tokens(visible),
            pages_per_block=1,
        )
        stored_blocks = attend_quantized(
            query, kq, vq, seq_len, q_len, allow_tokens(visible), packed_layout
        )
        self.assertTrue(_lists_equal(packed_blocks, stored_blocks))


def _f32(value: float) -> float:
    return struct.unpack("<f", struct.pack("<f", float(value)))[0]


if __name__ == "__main__":
    unittest.main()
