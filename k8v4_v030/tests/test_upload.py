"""K8V4_UPLOAD_SLICE_MB: sliced copies are byte-identical, off by default, and the vLLM splice is idempotent."""

from __future__ import annotations

import os
import tempfile
import unittest
from pathlib import Path
from unittest import mock

import torch

from k8v4_v030 import upload
from k8v4_v030.patch_installed_vllm import (
    _EMBED_COPY_NEW,
    _EMBED_COPY_NEW_034,
    _EMBED_COPY_OLD,
    _EMBED_COPY_OLD_034,
    _splice_embed_copy,
)


class SliceTest(unittest.TestCase):
    def test_default_is_off(self):
        with mock.patch.dict(os.environ, {}, clear=False):
            os.environ.pop(upload.ENV, None)
            self.assertEqual(upload.slice_mib(), 0)

    def test_negative_rejected(self):
        with mock.patch.dict(os.environ, {upload.ENV: "-1"}):
            with self.assertRaises(ValueError):
                upload.slice_mib()

    def test_slices_are_byte_identical(self):
        torch.manual_seed(0)
        for dtype in (torch.bfloat16, torch.int8, torch.float32):
            src = (torch.randn(2111, 769) * 50).to(dtype)
            dst = torch.empty_like(src)
            calls = []
            real = torch.Tensor.copy_

            def counting(self, other, *args, **kwargs):
                calls.append(other.shape[0])
                return real(self, other, *args, **kwargs)

            with mock.patch.object(torch.Tensor, "copy_", counting):
                upload.copy_in_slices(dst, src, mib=1)
            self.assertTrue(torch.equal(dst, src))
            self.assertGreater(len(calls), 1)
            self.assertLessEqual(max(calls) * src[0].numel() * src.element_size(), 1 << 20)

    def test_small_copy_is_one_call(self):
        src = torch.arange(12, dtype=torch.float32).reshape(3, 4)
        dst = torch.empty_like(src)
        upload.copy_in_slices(dst, src, mib=128)
        self.assertTrue(torch.equal(dst, src))

    def test_cpu_destination_never_slices(self):
        src = torch.ones(4, 4)
        dst = torch.zeros(4, 4)
        with mock.patch.dict(os.environ, {upload.ENV: "1"}), \
                mock.patch.object(upload, "copy_in_slices", side_effect=AssertionError("sliced")):
            upload.copy_rows(dst, src)
        self.assertTrue(torch.equal(dst, src))


class EmbedSpliceTest(unittest.TestCase):
    def test_splice_once(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "vocab_parallel_embedding.py"
            path.write_text("def weight_loader(self, param, loaded_weight):\n" + _EMBED_COPY_OLD
                            + "        param[loaded_weight.shape[0] :].data.fill_(0)\n", encoding="utf-8")
            self.assertEqual(_splice_embed_copy(path), "patched")
            text = path.read_text(encoding="utf-8")
            self.assertIn(_EMBED_COPY_NEW, text)
            self.assertEqual(_splice_embed_copy(path), "unchanged")
            self.assertEqual(path.read_text(encoding="utf-8"), text)
            compile(text, str(path), "exec")

    def test_splice_once_034(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "vocab_parallel_embedding.py"
            path.write_text("def weight_loader(self, param, loaded_weight):\n" + _EMBED_COPY_OLD_034
                            + "        param[loaded_weight.shape[0] :].data.fill_(0)\n", encoding="utf-8")
            self.assertEqual(_splice_embed_copy(path), "patched")
            text = path.read_text(encoding="utf-8")
            self.assertIn(_EMBED_COPY_NEW_034, text)
            self.assertEqual(_splice_embed_copy(path), "unchanged")
            compile(text, str(path), "exec")

    def test_missing_anchor_raises(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "vocab_parallel_embedding.py"
            path.write_text("x = 1\n", encoding="utf-8")
            with self.assertRaises(RuntimeError):
                _splice_embed_copy(path)


if __name__ == "__main__":
    unittest.main()
