"""CPU checks for the MTP top-k measurement records.

These drive summarize_step, the proposal queue, and the miss labels. They
do not start a server or change a draft token.
"""

from __future__ import annotations

import ast
import json
import os
import pathlib
import tempfile
import unittest

from k8v4_v030.mtp_probe_client import is_step_line, skip_longer
from k8v4_v030.mtp_topk_log import (
    begin,
    draft_positions,
    drafter_mode,
    flush,
    label_miss,
    pop_match,
    push_proposal,
    reset_for_test,
    skip_drafter_capture,
    summarize_step,
    swap_counts,
    valid_positions,
    verify_v2,
)
from k8v4_v030.mtp_topk_report import step_records
from k8v4_v030.patch_mtp_topk import (
    patch_ar_speculator,
    patch_gpu_rejection,
    patch_gpu_speculator,
    patch_proposer,
    patch_sampler,
)


def _choice(token: int, logit: float, prob: float) -> dict:
    return {"id": token, "logit": logit, "prob": prob}


def _depth(*pairs: tuple[int, float, float]) -> list[dict]:
    return [_choice(token, logit, prob) for token, logit, prob in pairs]


class TestMtpTopkLog(unittest.TestCase):
    def setUp(self):
        reset_for_test()

    def test_all_accepted_step_has_no_miss(self):
        proposal = {
            "seq": 2000,
            "top": [
                _depth((10, 4.0, 0.70), (11, 1.0, 0.05)),
                _depth((12, 3.0, 0.60), (13, 1.2, 0.10)),
            ],
        }
        record = summarize_step([10, 12], [10, 12], proposal)
        self.assertIsNone(record["miss"])
        self.assertEqual(record["n_accept"], 2)
        self.assertEqual(record["committed"], 3)
        self.assertEqual(record["seq"], 2000)
        self.assertTrue(all(position["rank"] == 1 for position in record["positions"]))
        self.assertEqual(len(valid_positions(record)), 2)

    def test_rank2_rescue_is_only_counted_at_the_miss(self):
        proposal = {
            "seq": 64000,
            "top": [
                _depth((10, 5.0, 0.80), (11, 1.0, 0.05)),
                _depth((20, 2.0, 0.40), (21, 1.8, 0.35), (22, 0.2, 0.05)),
                _depth((30, 3.0, 0.50), (31, 1.0, 0.10)),
            ],
        }
        record = summarize_step([10, 20, 30], [10, 21, 99], proposal)
        self.assertEqual(record["miss"], 1)
        self.assertEqual(record["n_accept"], 1)
        self.assertEqual(record["committed"], 2)
        miss = record["positions"][1]
        self.assertEqual(miss["rank"], 2)
        self.assertEqual(label_miss(miss), "rank2")
        self.assertFalse(miss["after_miss"])
        self.assertTrue(record["positions"][2]["after_miss"])
        self.assertEqual([position["i"] for position in valid_positions(record)], [0, 1])

    def test_far_miss_is_outside_the_top(self):
        proposal = {
            "seq": 128000,
            "top": [_depth((7, 6.0, 0.90), (8, 0.4, 0.02), (9, 0.1, 0.01))],
        }
        record = summarize_step([7], [100], proposal)
        miss = record["positions"][0]
        self.assertIsNone(miss["rank"])
        self.assertEqual(label_miss(miss), "confident_wrong")
        self.assertAlmostEqual(miss["margin"], 5.6)

    def test_near_tie_outside_top3_is_not_called_a_rescue(self):
        proposal = {
            "seq": 100,
            "top": [
                _depth(
                    (1, 1.20, 0.22),
                    (2, 1.10, 0.20),
                    (3, 1.00, 0.18),
                    (4, 0.90, 0.10),
                )
            ],
        }
        record = summarize_step([1], [4], proposal)
        self.assertEqual(label_miss(record["positions"][0]), "near_tie_outside_top3")

    def test_queue_matches_the_draft_not_an_older_dummy(self):
        push_proposal({"top1": [1, 2, 3], "top": [], "seq": 1, "draft": [1, 2, 3]})
        push_proposal({"top1": [4, 5], "top": [], "seq": 2, "draft": [8, 9]})
        found = pop_match([8, 9])
        self.assertEqual(found["seq"], 2)
        self.assertEqual(len(pop_match([1, 2, 3])["top1"]), 3)
        self.assertIsNone(pop_match([8, 9]))

    def test_patch_inserts_each_hook_once(self):
        proposer = (
            "        self._last_draft_probs = None\n"
            "        batch_size = common_attn_metadata.batch_size()\n"
            "        return self.model.compute_logits(hidden_states).argmax(dim=-1)\n"
            "            return draft_token_ids.view(-1, self.num_speculative_tokens)\n"
            "        if draft_probs_list is not None:\n"
            "            self._last_draft_probs = torch.stack(draft_probs_list, dim=1).contiguous()\n"
            "        return draft_token_ids\n"
        )
        patched = patch_proposer(proposer)
        self.assertEqual(patched.count("_mtp_note_logits(self, logits)"), 1)
        self.assertEqual(patched.count("_mtp_begin(self, common_attn_metadata)"), 1)
        self.assertEqual(patched.count("_mtp_flush(self"), 2)
        self.assertIn("def _mtp_flush", patched)
        sampler = (
            "        target_argmax = target_logits.argmax(dim=-1)\n"
            "        _rejection_greedy_sample(\n"
        )
        patched_sampler = patch_sampler(sampler)
        self.assertIn("if sampling_metadata.all_greedy:", patched_sampler)
        self.assertEqual(patched_sampler.count("_mtp_verify("), 2)

    def test_swap_counts_do_not_use_tokens_after_the_miss(self):
        tight_match = {
            "miss": None,
            "positions": [
                {
                    "i": 0,
                    "after_miss": False,
                    "margin": 0.2,
                    "rank": 1,
                }
            ],
        }
        miss = {
            "miss": 0,
            "positions": [
                {"i": 0, "after_miss": False, "margin": 0.2, "rank": 2},
                {"i": 1, "after_miss": True, "margin": 0.1, "rank": 2},
            ],
        }
        counts = swap_counts([tight_match, miss], 0.5)
        self.assertEqual(counts["positions"], 2)
        self.assertEqual(counts["top1"], 1)
        self.assertEqual(counts["top2"], 1)

    def test_low_rescue_rate_rejects_the_tree(self):
        from k8v4_v030.mtp_topk_report import recommendation

        text = recommendation(
            {
                "matched_steps": 40,
                "misses": 20,
                "labels": {"outside_top8": 16, "rank2": 2, "rank3": 1},
                "swap": {"0.5": {"positions": 10, "top1": 8, "top2": 1}},
                "committed_mean": 4.1,
            }
        )
        self.assertIn("reject tree", text)

    def test_high_rescue_rate_does_not_pretend_a_second_verify_is_free(self):
        from k8v4_v030.mtp_topk_report import recommendation

        text = recommendation(
            {
                "matched_steps": 40,
                "misses": 20,
                "labels": {"rank2": 8, "rank3": 4, "outside_top8": 8},
                "swap": {"0.5": {"positions": 10, "top1": 6, "top2": 3}},
                "committed_mean": 4.2,
            }
        )
        self.assertIn("same-forward tree", text)
        self.assertNotIn("reject tree", text)


class _Owner:
    pass


class _Tensor:
    def __init__(self, data, ndim=None):
        self.data = data
        if ndim is None:
            self.ndim = 2 if data and isinstance(data[0], list) else 1
        else:
            self.ndim = ndim
        if self.ndim == 2:
            self.shape = (len(data), len(data[0]) if data else 0)
        else:
            self.shape = (len(data),)

    def detach(self):
        return self

    def float(self):
        return self

    def to(self, _device):
        return self

    def tolist(self):
        return self.data

    def argmax(self, dim=-1):
        self_ = self
        assert dim == -1 and self_.ndim == 2
        chosen = [row.index(max(row)) for row in self_.data]
        return _Tensor(chosen, ndim=1)


GPU_SPEC_FIXTURE = """
class Draft:
    def sample_draft(self, draft_logits):
        if draft_logits is not None:
            logits = self.model.compute_logits(hidden_states)
            sampled = gumbel_sample(logits)
        elif self.use_local_argmax_reduction:
            return self.model.get_top_tokens(hidden_states)
        else:
            logits = self.model.compute_logits(hidden_states)
            sampled = logits.argmax(dim=-1)
        return sampled
"""

AR_FIXTURE = """
class Spec:
    def init_cudagraph_manager(self, cudagraph_mode: CUDAGraphMode) -> None:
        # Initialize cudagraph manager for draft prefill (draft position 0).
        self.prefill_cudagraph_manager = SpeculatorCudaGraphManager(
            self.vllm_config,
            cudagraph_mode,
        )

    def capture(self) -> None:
        logger.info("Capturing model for speculator...")
        self.prefill_cudagraph_manager.capture(self._prefill)

    def propose(self, input_batch, dummy_run: bool = False):
        num_tokens = input_batch.num_tokens
        num_tokens_padded = input_batch.num_tokens_after_padding
        num_reqs = input_batch.num_reqs
        max_query_len = input_batch.num_scheduled_tokens.max()
        if self.num_speculative_steps == 1:
            # Early exit.
            return self.draft_tokens[:num_reqs, :1]
        self.on_multi_step_decode_end(num_reqs)

        return self.draft_tokens[:num_reqs]
"""

REJECTION_FIXTURE = """
class Sampler:
    def _verify(self):
        processed_logits = self.sampler.apply_sampling_params(
            logits,
            expanded_idx_mapping,
            idx_mapping,
            idx_mapping_np,
            pos,
            draft_sampled,
            expanded_local_pos,
        )
        sampled, num_sampled = rejection_sample(
            processed_logits,
        )
        return sampled
"""


class TestMtpTopkV2(unittest.TestCase):
    def setUp(self):
        reset_for_test()
        self._saved = os.environ.copy()

    def tearDown(self):
        os.environ.clear()
        os.environ.update(self._saved)
        reset_for_test()

    def test_logging_rebinds_drafter_mode_and_skips_capture(self):
        os.environ["MTP_TOPK_LOG"] = "1"
        self.assertEqual(drafter_mode("FULL_DECODE_ONLY", "NONE"), "NONE")
        self.assertTrue(skip_drafter_capture())
        del os.environ["MTP_TOPK_LOG"]
        self.assertEqual(drafter_mode("FULL_DECODE_ONLY", "NONE"), "FULL_DECODE_ONLY")
        self.assertFalse(skip_drafter_capture())

    def test_bonus_row_is_not_a_draft_position(self):
        # Draft k is the input id at local_pos k+1. The argmax at local_pos k
        # is what greedy rejection compares it with. local_pos 3 holds the
        # last draft id for a 3-deep row and its own argmax is the bonus.
        rows = draft_positions(
            [7, 10, 11, 12, 21, 8, 20],
            [10, 11, 50, 77, 3, 20, 21],
            [0, 1, 2, 3, 2, 0, 1],
            [0, 4, 7],
            6,
        )
        self.assertEqual(rows, [([10, 11, 12], [10, 11, 50]), ([20, 21], [20, 21])])

    def test_verify_v2_matches_the_draft_and_drops_the_bonus(self):
        os.environ["MTP_TOPK_LOG"] = "1"
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "topk.jsonl")
            os.environ["MTP_TOPK_FILE"] = path
            push_proposal(
                {
                    "seq": 8000,
                    "top": [
                        _depth((10, 4.0, 0.70), (19, 1.0, 0.10)),
                        _depth((11, 3.0, 0.55), (18, 2.5, 0.40)),
                        _depth((12, 2.0, 0.40), (50, 1.9, 0.35)),
                    ],
                    "top1": [10, 11, 12],
                    "draft": [10, 11, 12],
                }
            )
            # Row 0 is the previous token. Its argmax is the check for draft 0,
            # which is stored on row 1. Row 3 stores draft 2; its argmax is the
            # bonus distribution and must not become a fourth draft position.
            width = 51

            def row(token):
                values = [0.0] * width
                values[token] = 5.0
                return values

            verify_v2(
                _Tensor([row(10), row(11), row(50), row(7)]),
                _Tensor([7, 10, 11, 12], ndim=1),
                _Tensor([0, 4], ndim=1),
                _Tensor([0, 1, 2, 3], ndim=1),
                6,
            )
            with open(path, encoding="utf-8") as handle:
                lines = handle.read().splitlines()
            steps = [json.loads(line) for line in lines if is_step_line(line)]
            self.assertEqual(len(steps), 1)
            self.assertEqual(steps[0]["n_draft"], 3)
            self.assertEqual(steps[0]["miss"], 2)
            self.assertEqual(steps[0]["positions"][2]["rank"], 2)
            self.assertTrue(steps[0]["matched_proposal"])
            self.assertEqual([item["draft"] for item in steps[0]["positions"]], [10, 11, 12])
            self.assertNotIn(7, [item["draft"] for item in steps[0]["positions"]])

    def test_wide_verify_batch_is_logged(self):
        os.environ["MTP_TOPK_LOG"] = "1"
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "topk.jsonl")
            os.environ["MTP_TOPK_FILE"] = path
            # 40 rows is above the per-step note cap of 32 and below the
            # flattened verify cap. Positions 0..6 form six draft checks.
            rows = []
            drafts = []
            local_pos = []
            for index in range(40):
                values = [0.0, 0.0]
                values[1] = 3.0
                rows.append(values)
                drafts.append(1 if index < 7 else -1)
                local_pos.append(index if index < 7 else 100)
            verify_v2(
                _Tensor(rows),
                _Tensor(drafts, ndim=1),
                _Tensor([0, 40], ndim=1),
                _Tensor(local_pos, ndim=1),
                6,
            )
            with open(path, encoding="utf-8") as handle:
                text = handle.read()
            self.assertIn('"n_draft":6', text)

    def test_dummy_flush_clears_the_buffer_without_a_proposal(self):
        os.environ["MTP_TOPK_LOG"] = "1"
        owner = _Owner()
        owner._mtp_buf = [(1, 2, 3)]
        flush(owner, None, dummy_run=True)
        self.assertEqual(owner._mtp_buf, [])
        self.assertIsNone(pop_match([1]))

    def test_breadcrumb_is_not_a_measured_step(self):
        os.environ["MTP_TOPK_LOG"] = "1"
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "topk.jsonl")
            os.environ["MTP_TOPK_FILE"] = path
            begin(_Owner(), False)
            with open(path, encoding="utf-8") as handle:
                text = handle.read()
            self.assertIn('"kind":"breadcrumb"', text)
            self.assertFalse(is_step_line(text))
            self.assertEqual(step_records([json.loads(text)]), [])
            self.assertFalse(skip_longer("code-retry", 32.0))
            self.assertTrue(skip_longer("code-ctx-64000", 900.0))
            self.assertFalse(skip_longer("code-ctx-8000", 1700.0))

    def test_v2_patches_insert_each_hook_once(self):
        spec = patch_gpu_speculator(GPU_SPEC_FIXTURE)
        ast.parse(spec)
        self.assertEqual(spec.count("_mtp_note_logits(self, logits)"), 1)
        self.assertIn("sampled = logits.argmax(dim=-1)", spec)
        with self.assertRaises(SystemExit):
            patch_gpu_speculator(spec)

        drafted = patch_ar_speculator(AR_FIXTURE)
        ast.parse(drafted)
        mode_at = drafted.index("cudagraph_mode = _mtp_drafter_mode(cudagraph_mode)")
        ctor_at = drafted.index("SpeculatorCudaGraphManager(")
        self.assertLess(mode_at, ctor_at)
        self.assertIn("if _mtp_skip_drafter_capture():", drafted)
        self.assertLess(
            drafted.index("if _mtp_skip_drafter_capture():"),
            drafted.index('logger.info("Capturing model for speculator...")'),
        )
        self.assertEqual(drafted.count("_mtp_begin(self, dummy_run)"), 1)
        self.assertIn(
            "_mtp_flush(self, self.draft_tokens[:num_reqs, :1], dummy_run)",
            drafted,
        )
        self.assertIn(
            "self.draft_tokens[:num_reqs, : self.num_speculative_steps]",
            drafted,
        )
        self.assertNotIn("compilation_config.cudagraph_mode =", drafted)
        self.assertIn("return drafter_mode(cudagraph_mode, CUDAGraphMode.NONE)", drafted)
        with self.assertRaises(SystemExit):
            patch_ar_speculator(drafted)

        rejected = patch_gpu_rejection(REJECTION_FIXTURE)
        ast.parse(rejected)
        self.assertEqual(rejected.count("_mtp_verify_v2("), 2)
        self.assertLess(
            rejected.index("_mtp_verify_v2("),
            rejected.index("sampled, num_sampled = rejection_sample("),
        )
        with self.assertRaises(SystemExit):
            patch_gpu_rejection(rejected)

    def test_launch_binds_hooks_onto_site_packages(self):
        root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
        site = "/opt/venv/lib/python3.12/site-packages/vllm"
        launch = pathlib.Path(root, "launch.sh").read_text(encoding="utf-8")
        gated = (
            ("MTP_PATCH_GPU_SPEC", f"{site}/v1/worker/gpu/spec_decode/speculator.py:ro"),
            (
                "MTP_PATCH_AR_SPEC",
                f"{site}/v1/worker/gpu/spec_decode/autoregressive/speculator.py:ro",
            ),
            (
                "MTP_PATCH_GPU_REJECTION",
                f"{site}/v1/worker/gpu/spec_decode/rejection_sampler.py:ro",
            ),
            ("MTP_PATCH_PROPOSER", f"{site}/v1/spec_decode/llm_base_proposer.py:ro"),
            ("MTP_PATCH_SAMPLER", f"{site}/v1/sample/rejection_sampler.py:ro"),
        )
        for gate, dest in gated:
            self.assertIn(dest, launch)
            self.assertLess(launch.index(gate), launch.index(dest))
        self.assertIn("${K8V4_PREFILL_GEMM:-w4a8}", launch)
        self.assertIn("${K8V4_PREFILL:-onednn}", launch)
        self.assertIn("--kv-cache-dtype=int8_k_int4_v", launch)
        self.assertNotIn("XE2_KV_S2_PARALLEL=0", launch)


if __name__ == "__main__":
    unittest.main()
