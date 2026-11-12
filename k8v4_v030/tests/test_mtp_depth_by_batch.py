"""CPU contract for K8V4_MTP_DEPTH_BY_BATCH. No GPU and no vLLM import."""

from __future__ import annotations

import os
import unittest
from pathlib import Path

from k8v4_v030.mtp_depth_by_batch import (
    ENV_NAME,
    STEADY_VERIFY_ROWS,
    align_scheduled_window,
    apply_schedule,
    batch_schedule,
    draft_depth,
    enabled,
    install_if_vllm_present,
    merge_capture_sizes,
    qsa_verify_plan,
    verify_rows,
)
from k8v4_v030.uniform_spec import drop_partial_spec_window


class DepthContractTest(unittest.TestCase):
    def tearDown(self) -> None:
        os.environ.pop(ENV_NAME, None)

    def test_unset_matches_today(self) -> None:
        os.environ.pop(ENV_NAME, None)
        self.assertFalse(enabled())
        for n in (0, 1, 2, 3, 4, 8):
            self.assertEqual(draft_depth(n, 6), 6)
        self.assertEqual(verify_rows(1), 7)
        self.assertEqual(verify_rows(4), 28)
        self.assertFalse(install_if_vllm_present())

    def test_other_values_stay_off(self) -> None:
        for value in ("", "0", "true", "yes", "6"):
            os.environ[ENV_NAME] = value
            self.assertFalse(enabled())
            self.assertEqual(draft_depth(4, 6), 6)

    def test_flag_on_is_6_alone_and_3_shared(self) -> None:
        os.environ[ENV_NAME] = "1"
        self.assertTrue(enabled())
        self.assertEqual(draft_depth(1, 6), 6)
        self.assertEqual(draft_depth(0, 6), 6)
        for n in (2, 3, 4):
            self.assertEqual(draft_depth(n, 6), 3)
            self.assertEqual(verify_rows(n), STEADY_VERIFY_ROWS[n])
        self.assertEqual(verify_rows(1), 7)
        self.assertEqual(
            batch_schedule(6),
            [(1, 1, 6), (2, 1024, 3)],
        )

    def test_flag_does_not_raise_a_smaller_configured_k(self) -> None:
        os.environ[ENV_NAME] = "1"
        self.assertEqual(draft_depth(1, 3), 3)
        self.assertEqual(draft_depth(4, 2), 2)

    def test_capture_sizes_cover_the_new_rows_only_when_on(self) -> None:
        today = [7, 14, 21, 28]
        os.environ.pop(ENV_NAME, None)
        self.assertEqual(merge_capture_sizes(today), today)
        os.environ[ENV_NAME] = "1"
        self.assertEqual(
            merge_capture_sizes(today),
            [7, 8, 12, 14, 16, 21, 28],
        )
        for rows in STEADY_VERIFY_ROWS.values():
            self.assertIn(rows, merge_capture_sizes(today))

    def test_shared_qsa_is_one_batch_and_not_seven_row_calls(self) -> None:
        os.environ[ENV_NAME] = "1"
        for n, rows in STEADY_VERIFY_ROWS.items():
            plan = qsa_verify_plan(n)
            self.assertEqual(plan["batch_calls"], 1)
            self.assertEqual(plan["query_rows"], rows)
            if n == 1:
                self.assertEqual(plan["per_request_rows"], 7)
                self.assertEqual(plan["seven_row_calls"], 0)
            else:
                self.assertEqual(plan["per_request_rows"], 4)
                self.assertEqual(plan["seven_row_calls"], 0)
                self.assertNotEqual(plan["query_rows"], n * 7)

    def test_schedule_fill_leaves_rejection_and_an_explicit_schedule(self) -> None:
        os.environ[ENV_NAME] = "1"

        class Spec:
            num_speculative_tokens = 6
            num_speculative_tokens_per_batch_size = None
            rejection_sample_method = "standard"

        spec = Spec()
        self.assertTrue(apply_schedule(spec))
        self.assertEqual(spec.num_speculative_tokens_per_batch_size, [(1, 1, 6), (2, 1024, 3)])
        self.assertEqual(spec.rejection_sample_method, "standard")
        spec.num_speculative_tokens_per_batch_size = [(1, 4, 5)]
        self.assertFalse(apply_schedule(spec))
        self.assertEqual(spec.num_speculative_tokens_per_batch_size, [(1, 4, 5)])

        os.environ.pop(ENV_NAME, None)
        bare = Spec()
        bare.num_speculative_tokens_per_batch_size = None
        self.assertFalse(apply_schedule(bare))
        self.assertIsNone(bare.num_speculative_tokens_per_batch_size)

    def test_flag_off_window_matches_the_existing_drop(self) -> None:
        os.environ.pop(ENV_NAME, None)
        kwargs = dict(
            configured_k=6,
            num_running=4,
            num_new_tokens=2,
            num_computed_tokens=262141,
            num_tokens=262142,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(align_scheduled_window(**kwargs), 1)
        self.assertEqual(
            drop_partial_spec_window(
                num_spec_tokens=6,
                num_new_tokens=2,
                num_computed_tokens=262141,
                num_tokens=262142,
                num_output_placeholders=0,
                has_spec_token_ids=True,
            ),
            1,
        )
        full = dict(kwargs, num_running=1, num_new_tokens=7, num_computed_tokens=8377, num_tokens=8378)
        self.assertEqual(align_scheduled_window(**full), 7)

    def test_shared_step_keeps_depth_3_and_drops_a_leftover_depth_6(self) -> None:
        os.environ[ENV_NAME] = "1"
        kept = align_scheduled_window(
            configured_k=6,
            num_running=4,
            num_new_tokens=4,
            num_computed_tokens=100,
            num_tokens=101,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(kept, 4)
        dropped = align_scheduled_window(
            configured_k=6,
            num_running=4,
            num_new_tokens=7,
            num_computed_tokens=100,
            num_tokens=101,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(dropped, 1)
        prefill = align_scheduled_window(
            configured_k=6,
            num_running=4,
            num_new_tokens=8192,
            num_computed_tokens=1000,
            num_tokens=20000,
            num_output_placeholders=0,
            has_spec_token_ids=True,
        )
        self.assertEqual(prefill, 8192)

    def test_source_has_no_device_sync(self) -> None:
        path = Path(__file__).resolve().parents[1] / "mtp_depth_by_batch.py"
        text = path.read_text(encoding="utf-8")
        self.assertNotIn(".item(", text)
        self.assertNotIn(".tolist(", text)
        self.assertNotIn("rejection_sample_method=", text)


if __name__ == "__main__":
    unittest.main()
