"""CPU contract for short-decode attention kernel selection."""

from __future__ import annotations

import os
import unittest
from pathlib import Path

from k8v4_v030.qsa_direct_plan import decode_attn_kind, decode_split_width, partial_offset


class DirectPlanTest(unittest.TestCase):
    def test_short_decode_prefers_grp3_split(self):
        kind = decode_attn_kind(7, 6, has_gqa6=True, has_grp3_split=True, has_grp3=True, prefill_split=False)
        self.assertEqual(kind, "grp3_decode_split")
        self.assertEqual(decode_split_width(kind, 7, 2048), 64)

    def test_gqa6_only_when_grp3_split_is_absent(self):
        kind = decode_attn_kind(7, 6, has_gqa6=True, has_grp3_split=False, has_grp3=True, prefill_split=False)
        self.assertEqual(kind, "gqa6_split")
        self.assertEqual(decode_split_width(kind, 7, 2048), 64)

    def test_short_gqa6_falls_back_to_grp3_split(self):
        kind = decode_attn_kind(7, 6, has_gqa6=False, has_grp3_split=True, has_grp3=True, prefill_split=True)
        self.assertEqual(kind, "grp3_decode_split")
        self.assertEqual(decode_split_width(kind, 7, 2048), 64)

    def test_short_unrelated_gqa_stays_on_direct(self):
        kind = decode_attn_kind(7, 4, has_gqa6=True, has_grp3_split=True, has_grp3=True, prefill_split=False)
        self.assertEqual(kind, "direct")
        self.assertEqual(decode_split_width(kind, 7, 100), 64)

    def test_one_query_uses_grp3_split(self):
        kind = decode_attn_kind(1, 6, has_gqa6=True, has_grp3_split=True, has_grp3=True, prefill_split=False)
        self.assertEqual(kind, "grp3_decode_split")

    def test_prefill_split_is_unchanged(self):
        kind = decode_attn_kind(32, 6, has_gqa6=True, has_grp3_split=True, has_grp3=True, prefill_split=True)
        self.assertEqual(kind, "grp3_prefill_split")
        self.assertEqual(decode_split_width(kind, 32, 2048), 128)

    def test_long_query_without_the_prefill_flag_uses_grp3(self):
        kind = decode_attn_kind(32, 6, has_gqa6=True, has_grp3_split=True, has_grp3=True, prefill_split=False)
        self.assertEqual(kind, "grp3")
        self.assertIsNone(decode_split_width(kind, 32, 2048))

    def test_long_query_without_grp3_is_one_direct_split(self):
        kind = decode_attn_kind(32, 5, has_gqa6=False, has_grp3_split=False, has_grp3=False, prefill_split=False)
        self.assertEqual(kind, "direct")
        self.assertEqual(decode_split_width(kind, 32, 2048), 2048)

    def test_partial_layout_matches_the_merge_index(self):
        # group = ((qi * hq + head) * ns) + split, then the lane's 16 dims.
        self.assertEqual(partial_offset(0, 0, 0, 32, 12, 0, 0), 0)
        self.assertEqual(partial_offset(1, 3, 5, 32, 12, 2, 7), ((1 * 12 + 3) * 32 + 5) * 256 + 2 * 16 + 7)

    def test_attend_decode_direct_uses_the_plan(self):
        path = os.path.join(os.path.dirname(__file__), os.pardir, "qsa_ops.py")
        text = Path(path).read_text(encoding="utf-8")
        start = text.index("def attend_decode_direct")
        end = text.index("\ndef attend_decode_k8v4")
        src = text[start:end]
        self.assertIn("decode_attn_kind", src)
        self.assertIn("qsa_gqa6_split", src)
        self.assertIn("qsa_grp3_split", src)
        self.assertIn("qsa_direct_attn", src)
