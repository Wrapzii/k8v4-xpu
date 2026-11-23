"""K8V4_DRAFT_LASTROW: gate parsing, draft-layer match and row arithmetic (CPU only)."""

from __future__ import annotations

import unittest
from types import SimpleNamespace

from k8v4_v030 import draft_lastrow


class GateTest(unittest.TestCase):
    def test_default_is_off_and_values_are_strict(self):
        self.assertFalse(draft_lastrow.enabled({}))
        self.assertFalse(draft_lastrow.enabled({"K8V4_DRAFT_LASTROW": "0"}))
        self.assertTrue(draft_lastrow.enabled({"K8V4_DRAFT_LASTROW": "1"}))
        for bad in ("2", "yes", "on", ""):
            with self.subTest(bad=bad):
                with self.assertRaises(RuntimeError):
                    draft_lastrow.enabled({"K8V4_DRAFT_LASTROW": bad})

    def test_only_mtp_draft_layers_match(self):
        on = {"K8V4_DRAFT_LASTROW": "1"}

        def layer(name, **kw):
            return SimpleNamespace(layer_name=name, **kw)

        self.assertTrue(draft_lastrow.applies(layer("mtp.layers.0.self_attn.attn"), on))
        self.assertTrue(draft_lastrow.applies(layer("model.mtp.layers.0.self_attn.attn"), on))
        self.assertTrue(draft_lastrow.applies(layer("draft.layers.0.attn", is_draft_layer=True), on))
        self.assertFalse(draft_lastrow.applies(layer("mtp.layers.0.self_attn.attn"), {}))
        for name in ("model.layers.3.self_attn.attn", "language_model.model.layers.63.self_attn.attn",
                     "", None):
            with self.subTest(name=name):
                self.assertFalse(draft_lastrow.applies(layer(name, is_draft_layer=False), on))
        self.assertFalse(draft_lastrow.applies(object(), on))

    def test_last_row_and_zeroed_prefix(self):
        self.assertEqual(draft_lastrow.last_row(100, 4224), (4323, 4223))
        self.assertEqual(draft_lastrow.last_row(7, 1), (7, 0))
        with self.assertRaises(ValueError):
            draft_lastrow.last_row(0, 0)


if __name__ == "__main__":
    unittest.main()
