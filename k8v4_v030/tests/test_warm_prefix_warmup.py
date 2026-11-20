"""CPU checks for the opt-in warm-prefix startup warmup (K8V4_WARMUP_WARM_PREFIX)."""

from __future__ import annotations

import os
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from k8v4_v030 import patch_installed_vllm as piv
from k8v4_v030 import warm_prefix_warmup as wpw


class FlagTest(unittest.TestCase):
    def test_flag_parsing(self):
        with patch.dict(os.environ, {}, clear=False):
            os.environ.pop(wpw.ENV, None)
            self.assertFalse(wpw.enabled())
        for raw, want in (("0", False), ("1", True), ("", False)):
            with patch.dict(os.environ, {wpw.ENV: raw}):
                self.assertEqual(wpw.enabled(), want)
        for bad in ("2", "yes", "true"):
            with patch.dict(os.environ, {wpw.ENV: bad}):
                self.assertRaises(RuntimeError, wpw.enabled)

    def test_off_returns_before_touching_the_worker(self):
        with patch.dict(os.environ, {wpw.ENV: "0"}):
            self.assertIsNone(wpw.maybe_warmup(object()))

    def test_context(self):
        with patch.dict(os.environ, {}, clear=False):
            os.environ.pop(wpw.CTX_ENV, None)
            self.assertEqual(wpw.context_tokens(), wpw.DEFAULT_CTX)
        with patch.dict(os.environ, {wpw.CTX_ENV: "32000"}):
            self.assertEqual(wpw.context_tokens(), 32000)
        for bad in ("0", "-5", "64k"):
            with patch.dict(os.environ, {wpw.CTX_ENV: bad}):
                self.assertRaises(RuntimeError, wpw.context_tokens)

    def test_depth_batches(self):
        # config F: one request drafts 15 deep, 2-4 requests 3 deep
        self.assertEqual(wpw.depth_batches([[1, 1, 15], [2, 4, 3]], 15, 4), [(3, 4), (15, 1)])
        self.assertEqual(wpw.depth_batches(None, 6, 4), [(6, 4)])
        self.assertEqual(wpw.depth_batches([[1, 2, 6], [3, 8, 3]], 6, 4), [(3, 4), (6, 2)])
        self.assertEqual(wpw.depth_batches([[1, 1, 6], [5, 8, 2]], 6, 4), [(6, 1)])


class SpliceTest(unittest.TestCase):
    SOURCE = ("        if jit:\n" + piv._WARM_PREFIX_OLD + "        x = 1\n")

    def tree(self, temp, text):
        path = Path(temp) / piv._WARM_PREFIX_FILE
        path.parent.mkdir(parents=True)
        path.write_text(text, encoding="utf-8")
        return path

    def test_patches_once_and_compiles(self):
        with tempfile.TemporaryDirectory() as temp:
            path = self.tree(temp, "def f(self, jit):\n" + self.SOURCE)
            self.assertEqual(piv.patch_warm_prefix_warmup(Path(temp)), ["warm_prefix_warmup:patched"])
            self.assertEqual(piv.patch_warm_prefix_warmup(Path(temp)), ["warm_prefix_warmup:unchanged"])
            text = path.read_text(encoding="utf-8")
            self.assertEqual(text.count("_k8v4_warm_prefix(self)"), 1)
            compile(text, str(path), "exec")

    def test_refuses_unknown_source(self):
        with tempfile.TemporaryDirectory() as temp:
            self.tree(temp, "def f():\n    warmup_kernels(model_runner)\n")
            self.assertRaises(RuntimeError, piv.patch_warm_prefix_warmup, Path(temp))

    def test_missing_file_is_skipped(self):
        with tempfile.TemporaryDirectory() as temp:
            self.assertEqual(piv.patch_warm_prefix_warmup(Path(temp)), [])

    def test_installed_vllm_is_patched(self):
        path = Path("/opt/venv/lib/python3.12/site-packages/vllm") / piv._WARM_PREFIX_FILE
        if not path.is_file():
            self.skipTest("no installed vLLM")
        self.assertIn(piv._WARM_PREFIX_MARK, path.read_text(encoding="utf-8"))


if __name__ == "__main__":
    unittest.main()
