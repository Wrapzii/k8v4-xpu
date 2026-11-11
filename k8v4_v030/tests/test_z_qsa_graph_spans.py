"""Exact-verifier graph rosters through 8 requests (56 tokens).

Import ``qsa_runtime`` inside the test. A module-level import would make
``test_import_leaves_runtime_alone_and_spec_stays_396`` fail when this file
is collected in the same process.
"""

from __future__ import annotations

import unittest
from types import SimpleNamespace
from unittest.mock import patch

import torch


def _mode():
    return SimpleNamespace(name="FULL")


def _desc(reqs: int):
    return SimpleNamespace(
        qsa_exact_verifier=True,
        cg_mode=_mode(),
        num_tokens=7 * reqs,
        num_reqs=reqs,
        uniform_token_count=7,
        num_ubatches=1,
    )


def _meta(reqs: int, starts=None):
    n = 7 * reqs
    meta = SimpleNamespace()
    meta.query_starts = tuple(range(0, n + 1, 7)) if starts is None else starts
    meta.seq_lens = torch.zeros(reqs, dtype=torch.int32)
    meta.block_table = torch.zeros(reqs, 2, dtype=torch.int32)
    meta.slot_mapping = torch.zeros(n, dtype=torch.int64)
    return meta


class ExactVerifierSpanTest(unittest.TestCase):
    def test_capture_roster_includes_eight_sequences_and_stops_at_nine(self):
        from k8v4_v030 import qsa_runtime as rt

        for reqs in (1, 4, 8):
            self.assertTrue(rt._descriptor_is_exact_mtp6(_desc(reqs)))
        self.assertFalse(rt._descriptor_is_exact_mtp6(_desc(9)))
        self.assertFalse(rt._descriptor_is_exact_mtp6(_desc(0)))
        short = _desc(4)
        short.num_tokens = 27
        self.assertFalse(rt._descriptor_is_exact_mtp6(short))
        self.assertFalse(rt._descriptor_is_exact_mtp6(None))
        not_exact = _desc(4)
        not_exact.qsa_exact_verifier = False
        self.assertFalse(rt._descriptor_is_exact_mtp6(not_exact))

        for reqs in (1, 4, 5, 8):
            n = 7 * reqs
            mask = torch.zeros(n, dtype=torch.bool)
            with patch.object(rt, "_verified_v2_graph_descriptor", return_value=_desc(reqs)), \
                    patch.object(rt, "_verified_v2_graph_padding", return_value=mask):
                self.assertEqual(
                    rt._c4_graph_spans(_meta(reqs), n),
                    tuple((r, r * 7, 7) for r in range(reqs)),
                )
        # 63 tokens is 9 requests, outside the capture list, so it returns
        # before asking for a forward context.
        self.assertEqual(rt._c4_graph_spans(_meta(9), 63), ())

    def test_padded_tail_is_admitted_and_a_ragged_tail_is_not(self):
        from k8v4_v030 import qsa_runtime as rt

        mask = torch.zeros(14, dtype=torch.bool)
        padded = _meta(2, starts=(0, 7, 14, 14, 14))
        ragged = _meta(2, starts=(0, 7, 14, 21))
        with patch.object(rt, "_verified_v2_graph_descriptor", return_value=_desc(2)), \
                patch.object(rt, "_verified_v2_graph_padding", return_value=mask):
            self.assertEqual(
                rt._c4_graph_spans(padded, 14),
                ((0, 0, 7), (1, 7, 7)),
            )
            self.assertEqual(rt._c4_graph_spans(ragged, 14), ())

    def test_missing_exact_key_skips_a_five_request_roster(self):
        from k8v4_v030 import qsa_runtime as rt

        bare = SimpleNamespace(
            qsa_exact_verifier_descriptor=None,
            batch_descriptor=None,
            is_padding=None,
        )
        with patch.object(rt, "_verified_v2_graph_descriptor", return_value=None), \
                patch("vllm.forward_context.get_forward_context", return_value=bare):
            self.assertEqual(rt._c4_graph_spans(_meta(5), 35), ())
