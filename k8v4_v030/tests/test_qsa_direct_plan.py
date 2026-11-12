"""CPU contract for short-decode attention kernel selection."""

from __future__ import annotations

import os
import unittest
from types import SimpleNamespace
from unittest.mock import Mock, patch
from pathlib import Path

from k8v4_v030.qsa_direct_plan import (
    DECODE_SPLIT_ENV,
    decode_attn_kind,
    decode_split_width,
    grp3_decode_split_width,
    partial_offset,
)


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
        self.assertIn("grp3_ops()", src)
        self.assertIn("fast.qsa_grp3_split", src)
        self.assertIn("hq=heads_i, hkv=hkv", src)


class IndependentGrp3DispatchTest(unittest.TestCase):
    def _run(self, base, tuned):
        import torch
        from k8v4_v030.qsa_ops import attend_decode_direct

        query = Mock(device=SimpleNamespace(type="xpu", index=0), dtype=torch.float16)
        query.shape = (7, 24, 256)
        visible = Mock(shape=(7, 2052))
        visible.to.return_value = visible
        key = Mock(shape=(128, 64, 4, 256))
        key.stride.return_value = 1
        value = Mock(shape=(128, 64, 4, 128))
        value.stride.return_value = 1
        views = dict(k=key, v=value, k_scale=Mock(), v_scale=Mock(), v_zero=Mock())
        out = Mock()
        with patch("k8v4_v030.qsa_ops.ops", return_value=base), \
                patch("k8v4_v030.qsa_ops.grp3_ops", return_value=tuned), \
                patch("k8v4_v030.qsa_ops.coerce_visible_matrix", return_value=visible), \
                patch("k8v4_v030.qsa_ops._direct_state", return_value=(Mock(), Mock())), \
                patch("k8v4_v030.qsa_batch_score.batch_ops") as batch_loader:
            result = attend_decode_direct(query, views, Mock(), visible, 33, out=out)
        self.assertIs(result, out)
        batch_loader.assert_not_called()

    def test_tuned_kernel_runs_without_base_attention_symbols(self):
        tuned = SimpleNamespace(qsa_grp3_split=Mock())
        self._run(SimpleNamespace(), tuned)
        tuned.qsa_grp3_split.assert_called_once()

    def test_tuned_kernel_runs_without_a_base_library(self):
        tuned = SimpleNamespace(qsa_grp3_split=Mock())
        self._run(None, tuned)
        tuned.qsa_grp3_split.assert_called_once()

    def test_shipped_grp3_does_not_require_direct_attention(self):
        base = SimpleNamespace(qsa_grp3_split=Mock())
        self._run(base, None)
        base.qsa_grp3_split.assert_called_once()


class Grp3SplitPickTest(unittest.TestCase):
    def setUp(self):
        self._saved = os.environ.pop(DECODE_SPLIT_ENV, None)

    def tearDown(self):
        os.environ.pop(DECODE_SPLIT_ENV, None)
        if self._saved is not None:
            os.environ[DECODE_SPLIT_ENV] = self._saved

    def _kind(self):
        return decode_attn_kind(7, 6, has_gqa6=True, has_grp3_split=True, has_grp3=True, prefill_split=False)

    def test_tp1_shipped_kernel_uses_split_32(self):
        self.assertEqual(decode_split_width(self._kind(), 7, 2052, hq=24, hkv=4), 32)

    def test_tp1_tuned_kernel_uses_split_48(self):
        self.assertEqual(decode_split_width(self._kind(), 7, 2052, hq=24, hkv=4, fast=True), 48)

    def test_tp2_rank_uses_split_64_for_both_kernels(self):
        self.assertEqual(decode_split_width(self._kind(), 7, 2052, hq=12, hkv=2), 64)
        self.assertEqual(decode_split_width(self._kind(), 7, 2052, hq=12, hkv=2, fast=True), 64)

    def test_unknown_layout_keeps_64(self):
        self.assertEqual(decode_split_width(self._kind(), 7, 2052, hq=48, hkv=8, fast=True), 64)
        self.assertEqual(grp3_decode_split_width(), 64)

    def test_other_kinds_ignore_the_layout(self):
        self.assertEqual(decode_split_width("gqa6_split", 7, 2052, hq=24, hkv=4, fast=True), 64)
        self.assertEqual(decode_split_width("direct", 7, 2052, hq=24, hkv=4), 64)
        self.assertEqual(decode_split_width("grp3_prefill_split", 32, 2052, hq=24, hkv=4, fast=True), 128)
        self.assertIsNone(decode_split_width("grp3", 32, 2052, hq=24, hkv=4))

    def test_env_overrides_every_layout(self):
        os.environ[DECODE_SPLIT_ENV] = "40"
        self.assertEqual(decode_split_width(self._kind(), 7, 2052, hq=24, hkv=4), 40)
        self.assertEqual(decode_split_width(self._kind(), 7, 2052, hq=12, hkv=2, fast=True), 40)
        # The override is for grp3 short decode only.
        self.assertEqual(decode_split_width("gqa6_split", 7, 2052, hq=24, hkv=4), 64)

    def test_bad_override_is_an_error(self):
        for raw in ("0", "-8", "abc"):
            os.environ[DECODE_SPLIT_ENV] = raw
            with self.assertRaises(ValueError):
                grp3_decode_split_width(24, 4)


class Grp3LibraryPathTest(unittest.TestCase):
    _KEYS = ("K8V4_QSA_GRP3_FAST", "XE2_QSA_GRP3_LIB", "XE2_QSA_LIB")

    def setUp(self):
        self._saved = {k: os.environ.pop(k, None) for k in self._KEYS}

    def tearDown(self):
        for k in self._KEYS:
            os.environ.pop(k, None)
            if self._saved[k] is not None:
                os.environ[k] = self._saved[k]

    def test_off_switch(self):
        from k8v4_v030.qsa_ops import grp3_library_path

        os.environ["XE2_QSA_GRP3_LIB"] = "/nonexistent/libxe2_qsa_grp3.so"
        os.environ["K8V4_QSA_GRP3_FAST"] = "0"
        self.assertIsNone(grp3_library_path())

    def test_explicit_path_wins(self):
        from k8v4_v030.qsa_ops import grp3_library_path

        os.environ["XE2_QSA_GRP3_LIB"] = "/nonexistent/libxe2_qsa_grp3.so"
        self.assertEqual(grp3_library_path(), "/nonexistent/libxe2_qsa_grp3.so")

    def test_sibling_of_the_qsa_library(self):
        import tempfile

        from k8v4_v030.qsa_ops import grp3_library_path

        with tempfile.TemporaryDirectory() as tmp:
            os.environ["XE2_QSA_LIB"] = os.path.join(tmp, "libxe2_qsa.so")
            self.assertNotEqual(grp3_library_path(), os.path.join(tmp, "libxe2_qsa_grp3.so"))
            Path(tmp, "libxe2_qsa_grp3.so").write_bytes(b"")
            self.assertEqual(grp3_library_path(), os.path.join(tmp, "libxe2_qsa_grp3.so"))
