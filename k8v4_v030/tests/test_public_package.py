"""Checks the published tree: cache math, launch defaults, and no private paths."""

from __future__ import annotations

import pathlib
import unittest

from k8v4_v030.layout import PageLayout

ROOT = pathlib.Path(__file__).resolve().parents[2]


def _needle(*parts: str) -> str:
    return "".join(parts)


NEEDLES = (
    _needle("/ho", "me/"),
    _needle("192.168", "."),
)


class PublicPackageTest(unittest.TestCase):
    def test_attention_payload_is_smaller_than_fp8(self):
        tp2 = PageLayout(2)
        self.assertEqual(tp2.fp8_bytes_per_token, 1024)
        self.assertEqual(tp2.bytes_per_token, 792)
        self.assertEqual(tp2.page_bytes, 50688)
        saved_per_token = (tp2.fp8_bytes_per_token - tp2.bytes_per_token) * 16 * 2
        self.assertEqual(saved_per_token, 7424)
        self.assertEqual(saved_per_token * 131072, 973078528)
        self.assertEqual(tp2.fp8_bytes_per_token * 16 * 2 * 131072, 4 * 1024 ** 3)

    def test_launch_defaults_match_the_measured_server(self):
        launch = (ROOT / "k8v4_v030" / "launch.sh").read_text(encoding="utf-8")
        self.assertIn("${K8V4_PREFILL:-onednn}", launch)
        self.assertIn("${K8V4_PREFILL_GEMM:-w4a8}", launch)
        self.assertIn("${XE2_KV_S2_NSG:-32}", launch)
        self.assertIn("--kv-cache-dtype=int8_k_int4_v", launch)
        self.assertIn("FULL_DECODE_ONLY", launch)
        self.assertIn("K8V4_MAX_SEQS:-4", launch)
        self.assertIn("K8V4_MAX_MODEL_LEN:-262144", launch)
        self.assertIn("CAPTURE_SIZES+=$((i * 7))", launch)
        self.assertIn("XE2_KV_S2_NSG_DRAFT:-32", launch)
        self.assertIn("XE2_KV_S2_NSG_VERIFY:-8", launch)
        self.assertIn("XE2_KV_S2_TWO_PASS:-0", launch)
        self.assertIn('"num_speculative_tokens":6', launch)
        self.assertIn("PORT:-8200", launch)
        self.assertNotIn("XE2_KV_S2_PARALLEL=0", launch)
        self.assertNotIn("\r\n", launch)

    def test_curve_client_defaults_to_the_k8v4_port(self):
        client = (ROOT / "bench" / "held_curve.py").read_text(encoding="utf-8")
        self.assertIn('CURVE_BASE", "http://127.0.0.1:8200"', client)
        self.assertIn('CURVE_CONCURRENCY", [1]', client)

    def test_docs_carry_the_measured_headlines(self):
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        results = (ROOT / "RESULTS.md").read_text(encoding="utf-8")
        historical = (ROOT / "docs" / "historical-benchmarks.md").read_text(encoding="utf-8")
        for phrase in ("928 MiB", "onednn", "w4a8"):
            self.assertIn(phrase, readme)
            self.assertIn(phrase, results)
        for phrase in (
            "57.2",
            "35.2",
            "0.199",
            "0.241",
            "1,638",
            "1,394",
            "301.4",
            "344.3",
        ):
            self.assertIn(phrase, historical)
            self.assertIn(phrase, results)
        for name in (
            "fox-prefill.svg",
            "fox-decode.svg",
            "fox-step.svg",
            "fox-kv.svg",
            "bench-concurrency.svg",
            "pieces-prefill.svg",
            "pieces-decode.svg",
        ):
            chart = ROOT / "docs" / "charts" / name
            self.assertTrue(chart.is_file(), name)
            self.assertIn("<svg", chart.read_text(encoding="utf-8"))

    def test_tree_has_no_private_paths(self):
        suffixes = {".py", ".sh", ".md", ".json", ".jsonl", ".svg", ".jinja", ".txt", ".cpp", ".hpp"}
        names = {"Dockerfile", "Dockerfile.compile", ".gitignore", ".gitattributes", ".dockerignore"}
        hits = []
        for path in ROOT.rglob("*"):
            if not path.is_file():
                continue
            if path.suffix not in suffixes and path.name not in names:
                continue
            if any(part in {".git", "mtp-tree", "__pycache__", "build"} for part in path.parts):
                continue
            text = path.read_text(encoding="utf-8", errors="replace")
            for needle in NEEDLES:
                if needle in text:
                    hits.append("%s: %s" % (path.relative_to(ROOT), needle))
        self.assertEqual(hits, [])


if __name__ == "__main__":
    unittest.main()
