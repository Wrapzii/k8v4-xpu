"""CPU tests for the MTP draft sink+window read view."""

from __future__ import annotations

import os
import unittest

import torch

from k8v4_v030.draft_window import (
    apply_read_view,
    clear_scratch,
    compact_draft_window,
    is_mtp_layer,
    packed_page_ids,
    packed_token_count,
    reset_window_config,
    should_apply,
    tokens_per_entry,
    window_config,
)
from k8v4_v030.layout import PAGE


def _row(n_pages: int) -> list[int]:
    # Distinct, recognizable page ids (not equal to the column index).
    return [1000 + i * 3 for i in range(n_pages)]


def _tables(rows: list[list[int]], lengths: list[int]):
    cols = max(len(r) for r in rows)
    table = torch.full((len(rows), cols), -1, dtype=torch.int32)
    for i, row in enumerate(rows):
        table[i, : len(row)] = torch.tensor(row, dtype=torch.int32)
    lens = torch.tensor(lengths, dtype=torch.int32)
    return table, lens


class _Layer:
    def __init__(self, name: str):
        self.layer_name = name
        self.prefix = name


class DraftWindowConfigTests(unittest.TestCase):
    def tearDown(self) -> None:
        os.environ.pop("K8V4_MTP_DRAFT_WINDOW", None)
        os.environ.pop("K8V4_MTP_DRAFT_SINKS", None)
        reset_window_config()
        clear_scratch()

    def test_unset_is_dense(self) -> None:
        os.environ.pop("K8V4_MTP_DRAFT_WINDOW", None)
        os.environ.pop("K8V4_MTP_DRAFT_SINKS", None)
        reset_window_config()
        self.assertEqual(window_config(), (0, 0))
        self.assertFalse(should_apply(_Layer("mtp.layers.0.self_attn")))

    def test_zero_window_is_dense(self) -> None:
        os.environ["K8V4_MTP_DRAFT_WINDOW"] = "0"
        os.environ["K8V4_MTP_DRAFT_SINKS"] = "4"
        reset_window_config()
        self.assertEqual(window_config(), (0, 0))

    def test_defaults_and_mtp_gate(self) -> None:
        os.environ["K8V4_MTP_DRAFT_WINDOW"] = "8192"
        os.environ.pop("K8V4_MTP_DRAFT_SINKS", None)
        reset_window_config()
        self.assertEqual(window_config(), (8192, 4))
        self.assertTrue(is_mtp_layer(_Layer("model.mtp.layers.0.self_attn")))
        self.assertTrue(should_apply(_Layer("mtp")))
        self.assertFalse(is_mtp_layer(_Layer("model.layers.3.self_attn")))
        self.assertFalse(should_apply(_Layer("model.layers.3.self_attn")))
        self.assertFalse(should_apply(None))


class DraftWindowPackTests(unittest.TestCase):
    def tearDown(self) -> None:
        os.environ.pop("K8V4_MTP_DRAFT_WINDOW", None)
        os.environ.pop("K8V4_MTP_DRAFT_SINKS", None)
        reset_window_config()
        clear_scratch()

    def test_window_zero_identical_to_dense(self) -> None:
        row = _row(32)
        table, lens = _tables([row], [32 * PAGE])
        packed, new_lens = compact_draft_window(table, lens, window=0, sinks=4)
        self.assertTrue(torch.equal(packed, table))
        self.assertTrue(torch.equal(new_lens, lens))
        self.assertEqual(packed_token_count(32 * PAGE, 0, 4), 32 * PAGE)
        self.assertEqual(packed_page_ids(row, 32 * PAGE, 0, 4), row)

    def test_short_context_identical_to_dense(self) -> None:
        # 4096 tokens is inside 4+8192, so the view must not change.
        n_pages = 4096 // PAGE
        row = _row(n_pages + 4)
        table, lens = _tables([row], [4096])
        packed, new_lens = compact_draft_window(table, lens, window=8192, sinks=4)
        self.assertTrue(torch.equal(packed, table))
        self.assertTrue(torch.equal(new_lens, lens))
        self.assertEqual(packed_token_count(4096, 8192, 4), 4096)

    def test_long_context_limits_the_read_range(self) -> None:
        seq_len = 131072
        window, sinks = 8192, 4
        n_pages = seq_len // PAGE
        row = _row(n_pages)
        table, lens = _tables([row], [seq_len])
        packed, new_lens = compact_draft_window(table, lens, window=window, sinks=sinks)
        expect_len = packed_token_count(seq_len, window, sinks)
        # One sink page (64 tokens) plus an 8192-token, page-aligned tail.
        self.assertEqual(expect_len, 64 + 8192)
        self.assertEqual(int(new_lens[0]), expect_len)
        got = [int(x) for x in packed[0, : expect_len // PAGE].tolist()]
        expect_ids = packed_page_ids(row, seq_len, window, sinks)
        self.assertEqual(got, expect_ids)
        # Sink page is the original first page; tail pages are the last 8192/64.
        self.assertEqual(got[0], row[0])
        self.assertEqual(got[1:], row[(seq_len - window) // PAGE :])
        # The packed prefix is much shorter than the dense table.
        self.assertEqual(len(got), 1 + window // PAGE)
        self.assertLess(int(new_lens[0]), seq_len)
        # Pages the kernel no longer walks.
        unread = set(row) - set(got)
        self.assertIn(row[1], unread)
        self.assertIn(row[(seq_len - window) // PAGE - 1], unread)

    def test_pages_are_only_sinks_and_tail(self) -> None:
        seq_len = 200000  # also page-aligned
        window, sinks = 8192, 4
        row = _row(seq_len // PAGE)
        ids = packed_page_ids(row, seq_len, window, sinks)
        sink_pages = {row[0]}
        tail_first = (seq_len - window) // PAGE
        tail_pages = set(row[tail_first : seq_len // PAGE])
        self.assertEqual(set(ids), sink_pages | tail_pages)

    def test_batch_mixed_lengths(self) -> None:
        window, sinks = 8192, 4
        long_len, short_len = 131072, 4096
        long_row = _row(long_len // PAGE)
        short_row = _row(short_len // PAGE) + [-1] * ((long_len - short_len) // PAGE)
        table, lens = _tables([long_row, short_row], [long_len, short_len])
        packed, new_lens = compact_draft_window(table, lens, window=window, sinks=sinks)
        self.assertEqual(int(new_lens[0]), 64 + 8192)
        self.assertEqual(int(new_lens[1]), short_len)
        # Short row is left untouched.
        self.assertTrue(torch.equal(packed[1], table[1]))
        # Long row is packed; its shape is unchanged.
        self.assertEqual(tuple(packed.shape), tuple(table.shape))
        self.assertEqual(
            packed[0, : (64 + 8192) // PAGE].tolist(),
            packed_page_ids(long_row, long_len, window, sinks),
        )

    def test_shape_stable_for_graphs(self) -> None:
        table, lens = _tables([_row(2048)], [131072])
        packed, new_lens = compact_draft_window(table, lens, 8192, 4)
        self.assertEqual(tuple(packed.shape), tuple(table.shape))
        self.assertEqual(tuple(new_lens.shape), tuple(lens.shape))

    def test_apply_read_view_respects_env(self) -> None:
        table, lens = _tables([_row(2048)], [131072])
        os.environ.pop("K8V4_MTP_DRAFT_WINDOW", None)
        reset_window_config()
        out_t, out_l = apply_read_view(table, lens)
        self.assertIs(out_t, table)
        self.assertIs(out_l, lens)
        os.environ["K8V4_MTP_DRAFT_WINDOW"] = "8192"
        reset_window_config()
        out_t, out_l = apply_read_view(table, lens)
        self.assertEqual(int(out_l[0]), 64 + 8192)
        self.assertEqual(tuple(out_t.shape), tuple(table.shape))
        # Original metadata is not mutated.
        self.assertEqual(int(lens[0]), 131072)

    def test_tokens_per_entry_tracks_pages_per_block(self) -> None:
        self.assertEqual(tokens_per_entry(1), PAGE)
        self.assertEqual(tokens_per_entry(2), 128)
        seq_len = 131072
        # With 128-token entries, one sink entry plus 8192 tail tokens.
        self.assertEqual(packed_token_count(seq_len, 8192, 4, pages_per_block=2), 128 + 8192)


if __name__ == "__main__":
    unittest.main()
