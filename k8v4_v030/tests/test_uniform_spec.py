"""Partial MTP windows must not reach the XPU GDN kernel."""

from __future__ import annotations

import unittest

from k8v4_v030.uniform_spec import (
    drop_partial_spec_window,
    install,
    scheduled_spec_rows,
)


class PartialSpecWindowTest(unittest.TestCase):
    def test_crash_shape_keeps_one_real_token_and_no_drafts(self):
        # Scheduler dump from vllm-qsa-combined-test-v3 (28976e5ef9be) at
        # 12:14:26 AM ET: the 262141-token request was given 2 rows and a
        # 1-draft list while the other request kept 7 rows and 6 drafts.
        # num_tokens is the real length, one ahead of computed, which is
        # what makes scheduled_spec_rows == 1 for a 2-row clip.
        k = 6
        computed = 262141
        tokens = 262142
        clipped = drop_partial_spec_window(
            num_spec_tokens=k,
            num_new_tokens=2,
            num_computed_tokens=computed,
            num_tokens=tokens,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(clipped, 1)
        self.assertLessEqual(
            scheduled_spec_rows(clipped, computed, tokens, 0),
            0,
        )

    def test_full_window_is_unchanged(self):
        # Real length is one ahead of computed, so a 7-row step carries 6 drafts.
        got = drop_partial_spec_window(
            num_spec_tokens=6,
            num_new_tokens=7,
            num_computed_tokens=8377,
            num_tokens=8378,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(got, 7)
        self.assertEqual(scheduled_spec_rows(7, 8377, 8378, 0), 6)

    def test_prefill_chunk_is_unchanged_even_with_stale_drafts(self):
        got = drop_partial_spec_window(
            num_spec_tokens=6,
            num_new_tokens=8192,
            num_computed_tokens=1000,
            num_tokens=20000,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(got, 8192)

    def test_short_window_without_draft_rows_is_unchanged(self):
        got = drop_partial_spec_window(
            num_spec_tokens=6,
            num_new_tokens=3,
            num_computed_tokens=10,
            num_tokens=40,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(got, 3)

    def test_no_spec_ids_keeps_the_clip(self):
        got = drop_partial_spec_window(
            num_spec_tokens=6,
            num_new_tokens=2,
            num_computed_tokens=262141,
            num_tokens=262142,
            num_output_placeholders=0,
            has_spec_token_ids=False,
        )
        self.assertEqual(got, 2)

    def test_no_real_room_schedules_nothing(self):
        # Every remaining row would be a draft. Skipping beats a short spec.
        got = drop_partial_spec_window(
            num_spec_tokens=6,
            num_new_tokens=2,
            num_computed_tokens=100,
            num_tokens=100,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(got, 0)


class InstallTest(unittest.TestCase):
    def test_wrapper_drops_the_crash_window_on_the_scheduler(self):
        try:
            from vllm.v1.core.sched.scheduler import Scheduler
        except Exception as exc:
            self.skipTest("vLLM scheduler is not importable: %s" % exc)
        self.assertTrue(install())
        wrapped = Scheduler._reserve_prefill_lookahead
        self.assertTrue(getattr(wrapped, "_k8v4_uniform_spec", False))

        class Request:
            num_tokens = 262142
            num_output_placeholders = 0
            spec_token_ids = [-1, -1, -1, -1, -1, -1]

        class Self:
            num_spec_tokens = 6
            num_prefill_lookahead = 1

        # remaining = 262142 - 262141 - 2 = -1, so lookahead leaves 2 rows,
        # and the wrapper then drops the draft.
        got = wrapped(Self(), Request(), 262141, 2)
        self.assertEqual(got, 1)
        # A full window is not a partial spec, so lookahead's result stands.
        full = wrapped(Self(), Request(), 8371, 7)
        self.assertEqual(full, 7)
        install()
        self.assertIs(Scheduler._reserve_prefill_lookahead, wrapped)
