"""CPU contract for the 9-16 row oneDNN choice. No torch and no GPU."""

from __future__ import annotations

import os
import unittest
from pathlib import Path

from k8v4_v030.small_m_band import (
    ENV_NAME,
    enabled,
    onednn_rows,
)


class SmallMBandTest(unittest.TestCase):
    def tearDown(self) -> None:
        os.environ.pop(ENV_NAME, None)

    def test_unset_keeps_the_128_cutoff(self) -> None:
        os.environ.pop(ENV_NAME, None)
        self.assertFalse(enabled())
        for rows in (1, 7, 8, 9, 12, 16, 17, 28, 128):
            self.assertFalse(onednn_rows(rows, band=False))
        self.assertTrue(onednn_rows(129, band=False))
        self.assertFalse(onednn_rows(16))

    def test_other_values_stay_off(self) -> None:
        for value in ("", "0", "true", "16"):
            os.environ[ENV_NAME] = value
            self.assertFalse(enabled())
            self.assertFalse(onednn_rows(12))

    def test_band_is_9_through_16_only(self) -> None:
        os.environ[ENV_NAME] = "1"
        self.assertTrue(enabled())
        for rows in (1, 7, 8):
            self.assertFalse(onednn_rows(rows, band=True))
        for rows in (9, 12, 16):
            self.assertTrue(onednn_rows(rows, band=True))
        for rows in (17, 28, 32, 128):
            self.assertFalse(onednn_rows(rows, band=True))
        self.assertTrue(onednn_rows(129, band=True))
        self.assertTrue(onednn_rows(9))
        self.assertFalse(onednn_rows(8))

    def test_w4a8_caller_uses_the_cached_flag(self) -> None:
        path = Path(__file__).resolve().parents[1] / "w4a8_prefill.py"
        text = path.read_text(encoding="utf-8")
        self.assertIn("_SMALL_M_BAND", text)
        self.assertIn("_onednn_rows(rows, band=_SMALL_M_BAND)", text)
        self.assertNotIn(".item(", text)
        self.assertNotIn("K8V4_OVH_SMALL_M_MAX", text)


if __name__ == "__main__":
    unittest.main()
