"""K8V4_DEEP_DRAFT: gates, copy detection, lone-request depth, capture widths, splices."""

from __future__ import annotations

import importlib.util
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest import mock

from k8v4_v030 import deep_draft

HAVE_NUMPY = importlib.util.find_spec("numpy") is not None
HAVE_VLLM = importlib.util.find_spec("vllm") is not None

_TOOL = Path(__file__).resolve().parents[2] / "tools" / "patch_spec_decode.py"
_spec = importlib.util.spec_from_file_location("patch_spec_decode", _TOOL)
patch_tool = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(patch_tool)


class GateTest(unittest.TestCase):
    def test_parsing(self):
        self.assertIsNone(deep_draft.ngram_range({}))
        self.assertEqual(deep_draft.ngram_range({"K8V4_DEEP_DRAFT": "12,16"}), (12, 16))
        self.assertEqual(deep_draft.ngram_range({"K8V4_DEEP_DRAFT": "8"}), (8, 8))
        for bad in ("1", "16,12", "a,b", "12,", "4,99"):
            with self.subTest(bad=bad):
                with self.assertRaises(RuntimeError):
                    deep_draft.ngram_range({"K8V4_DEEP_DRAFT": bad})
        self.assertEqual(deep_draft.mtp_depth({}), 6)
        self.assertEqual(deep_draft.mtp_depth({"K8V4_DEEP_MTP_DEPTH": "4"}), 4)
        with self.assertRaises(RuntimeError):
            deep_draft.mtp_depth({"K8V4_DEEP_MTP_DEPTH": "0"})

    def test_extra_capture_width_only_when_on(self):
        with mock.patch.dict(os.environ, {}, clear=False):
            os.environ.pop("K8V4_DEEP_DRAFT", None)
            self.assertEqual(deep_draft.extra_query_lens({16: 1, 4: 4}, 15, 1), {16: 1, 4: 4})
        with mock.patch.dict(os.environ, {"K8V4_DEEP_DRAFT": "12,16"}):
            self.assertEqual(deep_draft.extra_query_lens({16: 1, 4: 4}, 15, 1), {16: 1, 4: 4, 7: 1})


@unittest.skipUnless(HAVE_NUMPY, "numpy is needed")
class CopyTest(unittest.TestCase):
    def test_copy_detection_and_hold(self):
        tracker = deep_draft.CopyTracker(4)
        prompt = list(range(100, 140))
        self.assertFalse(tracker.copying("r", prompt + [1, 2, 3, 4], True))
        # the last 4 tokens now repeat a run from the prompt
        toks = prompt + [1, 2, 3, 4] + prompt[10:14]
        self.assertTrue(tracker.copying("r", toks, True))
        toks += [7]
        self.assertTrue(tracker.copying("r", toks, True))  # held
        toks += [8]
        self.assertFalse(tracker.copying("r", toks, True))
        self.assertFalse(tracker.copying("q", prompt[10:14] * 20, False))  # no output yet

    def test_lone_request_depth(self):
        prompt = list(range(100, 140))
        req = SimpleNamespace(_all_token_ids=prompt + [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13],
                              num_output_tokens=13)
        sched = SimpleNamespace(requests={"r": req})
        with mock.patch.dict(os.environ, {"K8V4_DEEP_DRAFT": "4,8"}):
            self.assertEqual(deep_draft.scheduled_depth(sched, {"r": 14}, 15), 6)
            req._all_token_ids = req._all_token_ids + prompt[3:12]
            self.assertEqual(deep_draft.scheduled_depth(sched, {"r": 7}, 15), 15)
            self.assertEqual(deep_draft.scheduled_depth(sched, {"r": 7, "s": 4}, 3), 3)
        off = SimpleNamespace(requests={"r": req})
        with mock.patch.dict(os.environ, {}, clear=False):
            os.environ.pop("K8V4_DEEP_DRAFT", None)
            self.assertEqual(deep_draft.scheduled_depth(off, {"r": 16}, 15), 15)


INIT = '''\
def init_speculator(vllm_config, device, req_states):
    from vllm.v1.worker.gpu.spec_decode.speculator import BaseSpeculator

    speculative_config = vllm_config.speculative_config
    assert speculative_config is not None
    return "stock"
'''
TDAR = '''\
class S:
    def propose(self, num_reqs, num_speculative_tokens):
        if num_speculative_tokens <= 1:
            if num_speculative_tokens == 0:
                self.draft_tokens[:num_reqs].fill_(-1)
            return self.draft_tokens[:num_reqs]
        return "decoded"
'''
SCHED = '''\
class Scheduler:
    def schedule(self, num_scheduled_tokens):
        num_spec_tokens_to_schedule = self.num_spec_tokens
        if self.dynamic_sd_lookup is not None and len(num_scheduled_tokens) > 0:
            num_spec_tokens_to_schedule = self.dynamic_sd_lookup[
                len(num_scheduled_tokens)
            ]
        return num_spec_tokens_to_schedule
'''
CONFIG = '''\
class VllmConfig:
    def lens(self, dense_schedule, num_new_sampled_tokens):
        # By ascending batch size, so each query length keeps its widest batch.
        return {
            k + num_new_sampled_tokens: batch_size
            for batch_size, k in enumerate(dense_schedule)
            if batch_size > 0
        }
'''
SPEC = "        self.model = self.load_draft_model(target_model, target_attn_layer_names)\n"


class SpliceTest(unittest.TestCase):
    def _tree(self, tmp, with_tdar=True):
        root = Path(tmp)
        files = {patch_tool.SPECULATOR: "class D:\n    def load_model(self, target_model):\n" + SPEC,
                 patch_tool.INIT: INIT, patch_tool.SCHED: SCHED, patch_tool.CONFIG: CONFIG}
        if with_tdar:
            files[patch_tool.TDAR] = TDAR
        for rel, text in files.items():
            (root / rel).parent.mkdir(parents=True, exist_ok=True)
            (root / rel).write_text(text, encoding="utf-8")
        return root

    def test_034_tree_gets_every_splice_once(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._tree(tmp)
            self.assertEqual(patch_tool.patch_vllm_tree(root), [
                "draft_vocab:patched", "deep_init:patched", "deep_steps:patched",
                "deep_sched:patched", "deep_capture:patched"])
            self.assertTrue(all(n.endswith(":unchanged") for n in patch_tool.patch_vllm_tree(root)))
            scope = {}
            exec(compile((root / patch_tool.TDAR).read_text(encoding="utf-8"), "tdar", "exec"), scope)
            obj = scope["S"]()
            self.assertEqual(obj.propose(1, 15), "decoded")
            obj.draft_tokens = [9, 9]
            obj.k8v4_num_draft_steps = lambda k: 1
            self.assertEqual(obj.propose(1, 15), [9])

    def test_030_tree_gets_only_the_vocab_splice(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._tree(tmp, with_tdar=False)
            self.assertEqual(patch_tool.patch_vllm_tree(root), ["draft_vocab:patched"])


@unittest.skipUnless(HAVE_VLLM, "vLLM is needed")
class ImportTest(unittest.TestCase):
    def test_speculator_class_builds_on_this_vllm(self):
        if importlib.util.find_spec("vllm.v1.worker.gpu.spec_decode.target_dependent_ar") is None:
            self.skipTest("vLLM without target_dependent_ar (0.30)")
        # A child process: importing the speculators loads vLLM kernel modules that other
        # tests (the W4A8 import hook) expect to load later.
        code = ("from k8v4_v030 import deep_draft; "
                "assert hasattr(deep_draft._speculator_class(), 'k8v4_num_draft_steps')")
        result = subprocess.run([sys.executable, "-c", code], capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr[-2000:])


if __name__ == "__main__":
    unittest.main()
