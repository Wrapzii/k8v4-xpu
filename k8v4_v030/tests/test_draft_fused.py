"""K8V4_DRAFT_FUSED_DECODE contract (CPU only).

The knob parses strictly; unset keeps the K8/V4 metadata builder exactly as before (no capability declared, so
vLLM 0.34's speculator keeps the per-step draft decode); set to 1 the builder declares
supports_draft_decode_metadata_update and its update is a no-op that leaves the metadata object untouched.
"""
from __future__ import annotations

import importlib.util
import unittest
from unittest import mock

from k8v4_v030 import draft_fused

HAVE_VLLM = importlib.util.find_spec("vllm") is not None


class EnvTest(unittest.TestCase):
    def test_parse(self):
        self.assertFalse(draft_fused.enabled({}))
        self.assertFalse(draft_fused.enabled({"K8V4_DRAFT_FUSED_DECODE": "0"}))
        self.assertTrue(draft_fused.enabled({"K8V4_DRAFT_FUSED_DECODE": "1"}))
        self.assertTrue(draft_fused.enabled({"K8V4_DRAFT_FUSED_DECODE": " 1 "}))
        for bad in ("2", "yes", "true", "on", "-1"):
            with self.subTest(bad=bad):
                with self.assertRaisesRegex(RuntimeError, "K8V4_DRAFT_FUSED_DECODE"):
                    draft_fused.enabled({"K8V4_DRAFT_FUSED_DECODE": bad})


@unittest.skipUnless(HAVE_VLLM, "the vLLM attention base classes are needed")
class BuilderTest(unittest.TestCase):
    def _builder(self, env):
        from k8v4_v030.backend import Xe2K8V4MetadataBuilder

        # Run only the knob part of __init__: the rest needs a KV cache spec and a vLLM config.
        builder = Xe2K8V4MetadataBuilder.__new__(Xe2K8V4MetadataBuilder)
        with mock.patch.dict("os.environ", env, clear=False):
            builder._apply_draft_fused_decode()
        return builder

    def test_unset_declares_nothing(self):
        from vllm.v1.attention.backend import AttentionMetadataBuilder

        builder = self._builder({"K8V4_DRAFT_FUSED_DECODE": "0"})
        self.assertNotIn("supports_draft_decode_metadata_update", vars(builder))
        self.assertEqual(getattr(builder, "supports_draft_decode_metadata_update", False),
                         getattr(AttentionMetadataBuilder, "supports_draft_decode_metadata_update", False))

    def test_set_declares_and_update_is_a_noop(self):
        builder = self._builder({"K8V4_DRAFT_FUSED_DECODE": "1"})
        self.assertTrue(builder.supports_draft_decode_metadata_update)
        meta = mock.Mock(spec=[])
        builder.update_draft_decode_metadata(meta)
        self.assertEqual(meta.mock_calls, [])

    def test_bad_value_fails_loudly(self):
        with self.assertRaisesRegex(RuntimeError, "K8V4_DRAFT_FUSED_DECODE"):
            self._builder({"K8V4_DRAFT_FUSED_DECODE": "yes"})


if __name__ == "__main__":
    unittest.main()
