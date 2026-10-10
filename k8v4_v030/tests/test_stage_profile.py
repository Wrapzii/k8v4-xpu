"""CPU checks for the opt-in prefill stage profiler.

The hook and the head-major ranges are the ones the server uses. XPU
events are not required: on CPU the same stack records perf-counter spans.
"""

from __future__ import annotations

import os
import sys
import tempfile
import textwrap
import time
import unittest
from pathlib import Path

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import D, PAGE, PageLayout
from k8v4_v030.onednn_prefill import head_major_prefill
from k8v4_v030.oracle import deterministic_rows
from k8v4_v030.stage_profile import (
    bucket_for,
    bucket_kernel,
    exclusive_report,
    install_import_hook,
    install_module_hook,
    kernel_report,
    profile_enabled,
    register_root,
    remove_import_hook,
    reset_for_test,
    set_capture_override,
    snapshot,
    uninstall_module_hook,
)
from k8v4_v030.tests.test_onednn_prefill import _pack


def _records():
    return [
        {
            "parent": None,
            "inclusive_ms": 100.0,
            "kind": "module",
            "qualname": "Qwen3_5Model",
            "cls": "Qwen3_5Model",
        },
        {
            "parent": 0,
            "inclusive_ms": 40.0,
            "kind": "module",
            "qualname": "layers.0.self_attn.qkv_proj",
            "cls": "QKVParallelLinear",
        },
        {
            "parent": 1,
            "inclusive_ms": 10.0,
            "kind": "collective",
            "qualname": "tensor_model_parallel_all_gather",
            "cls": "tensor_model_parallel_all_gather",
        },
        {
            "parent": 0,
            "inclusive_ms": 25.0,
            "kind": "module",
            "qualname": "layers.0.linear_attn",
            "cls": "QwenGatedDeltaNetAttention",
        },
        {
            "parent": 3,
            "inclusive_ms": 15.0,
            "kind": "module",
            "qualname": "layers.0.linear_attn.in_proj_qkvz",
            "cls": "ColumnParallelLinear",
        },
        {
            "parent": 3,
            "inclusive_ms": 8.0,
            "kind": "module",
            "qualname": "layers.0.linear_attn.chunk_gated_delta_rule",
            "cls": "ChunkGatedDeltaRule",
        },
        {
            "parent": 0,
            "inclusive_ms": 12.0,
            "kind": "attn_sdpa",
            "qualname": "score_one_group",
            "cls": "score_one_group",
        },
    ]


class StageAccountTest(unittest.TestCase):
    def test_exclusive_time_splits_gemm_collective_and_gdn(self):
        report = exclusive_report(_records())
        self.assertAlmostEqual(report["balance_ms"], 0.0, places=6)
        self.assertAlmostEqual(report["root_inclusive_ms"], 100.0, places=6)
        buckets = report["buckets_ms"]
        self.assertAlmostEqual(buckets["gemm_qkv"], 30.0, places=6)
        self.assertAlmostEqual(buckets["collective"], 10.0, places=6)
        self.assertAlmostEqual(buckets["gemm_gdn"], 15.0, places=6)
        self.assertAlmostEqual(buckets["gdn"], 10.0, places=6)
        self.assertAlmostEqual(buckets["attn_sdpa"], 12.0, places=6)
        self.assertAlmostEqual(buckets["layer_glue"], 23.0, places=6)
        groups = report["groups_ms"]
        self.assertAlmostEqual(sum(groups.values()), 100.0, places=6)
        self.assertAlmostEqual(groups["attention"], 12.0, places=6)
        self.assertAlmostEqual(groups["gdn"], 10.0, places=6)

    def test_leaf_names_stay_on_their_buckets(self):
        self.assertEqual(
            bucket_for("module", "layers.3.mlp.down_proj", "RowParallelLinear"),
            "gemm_down",
        )
        self.assertEqual(
            bucket_for("module", "layers.3.mlp.gate_up_proj", "MergedColumnParallelLinear"),
            "gemm_gate_up",
        )
        self.assertEqual(
            bucket_for("module", "layers.3.self_attn.o_proj", "RowParallelLinear"),
            "gemm_o",
        )
        self.assertEqual(
            bucket_for("module", "layers.3.linear_attn.out_proj", "RowParallelLinear"),
            "gemm_gdn",
        )
        self.assertEqual(bucket_for("kv_store", "kv_store_paged", "kv_store_paged"), "kv_store")
        self.assertEqual(bucket_for("attn_gather", "gather_dequant_head", "gather"), "attn_gather")

    def test_kernel_names_split_gemm_from_gdn_and_collectives(self):
        self.assertEqual(bucket_kernel("int4_gemm_w4a16"), "gemm")
        self.assertEqual(bucket_kernel("aten::int4_gemm_w4a8"), "gemm")
        self.assertEqual(bucket_kernel("dnnl::graph::sdpa_partition"), "attention")
        self.assertEqual(bucket_kernel("ccl::allreduce"), "collective")
        self.assertEqual(bucket_kernel("chunk_gated_delta_rule_fwd"), "gdn")
        self.assertEqual(bucket_kernel("aten::add"), "other")
        report = kernel_report(
            [
                ("int4_gemm_w4a16", 800.0, 64),
                ("aten::int4_gemm_w4a8", 50.0, 4),
                ("ccl::allreduce", 120.0, 32),
                ("chunk_gated_delta_rule_fwd", 90.0, 48),
                ("dnnl::graph::sdpa_partition", 40.0, 16),
                ("aten::add", 10.0, 1000),
            ]
        )
        groups = report["groups_ms"]
        self.assertAlmostEqual(groups["gemm"], 850.0, places=6)
        self.assertAlmostEqual(groups["collective"], 120.0, places=6)
        self.assertAlmostEqual(groups["gdn"], 90.0, places=6)
        self.assertAlmostEqual(groups["attention"], 40.0, places=6)
        self.assertAlmostEqual(groups["other"], 10.0, places=6)

    def test_compiling_frame_does_not_call_the_xpu_capture_probe(self):
        import k8v4_v030.stage_profile as stage_profile

        calls = []
        original_dynamo = stage_profile._dynamo_compiling
        original_xpu = stage_profile._xpu_stream_capturing

        def compiling():
            return True

        def xpu_probe():
            calls.append("xpu")
            raise AssertionError("XPU capture probe ran inside a compiling frame")

        stage_profile._dynamo_compiling = compiling
        stage_profile._xpu_stream_capturing = xpu_probe
        tls = stage_profile._tls()
        tls.ready = True
        tls.depth = 1
        tls.abort = False
        tls.stack = []
        tls.nodes = []
        try:
            set_capture_override(None)
            self.assertTrue(stage_profile._capturing())
            wrapped = stage_profile._collective_wrapper(
                lambda value: value + 1,
                "tensor_model_parallel_all_reduce",
            )
            self.assertEqual(wrapped(3), 4)
            self.assertEqual(calls, [])
        finally:
            stage_profile._dynamo_compiling = original_dynamo
            stage_profile._xpu_stream_capturing = original_xpu
            set_capture_override(None)
            tls.depth = 0
            tls.abort = False


class StageHookTest(unittest.TestCase):
    def setUp(self):
        reset_for_test()
        register_root("FakeModel")
        self._saved_profile = os.environ.get("K8V4_PROFILE")
        self._saved_dir = os.environ.get("K8V4_PROFILE_DIR")
        os.environ.pop("K8V4_PROFILE_DIR", None)
        os.environ.pop("K8V4_PROFILE", None)

    def tearDown(self):
        set_capture_override(None)
        uninstall_module_hook()
        reset_for_test()
        if self._saved_profile is None:
            os.environ.pop("K8V4_PROFILE", None)
        else:
            os.environ["K8V4_PROFILE"] = self._saved_profile
        if self._saved_dir is None:
            os.environ.pop("K8V4_PROFILE_DIR", None)
        else:
            os.environ["K8V4_PROFILE_DIR"] = self._saved_dir

    def test_profile_flag_defaults_off(self):
        self.assertFalse(profile_enabled())
        os.environ["K8V4_PROFILE"] = "1"
        self.assertTrue(profile_enabled())

    def test_hook_records_children_and_skips_capture(self):
        os.environ["K8V4_PROFILE"] = "1"
        install_module_hook()

        class QKVLinear(torch.nn.Module):
            def forward(self, x):
                time.sleep(0.01)
                return x

        class DownLinear(torch.nn.Module):
            def forward(self, x):
                time.sleep(0.01)
                return x

        class FakeModel(torch.nn.Module):
            def __init__(self):
                super().__init__()
                self.qkv_proj = QKVLinear()
                self.down_proj = DownLinear()

            def forward(self, hidden):
                hidden = self.qkv_proj(hidden)
                return self.down_proj(hidden)

        model = FakeModel()
        model(torch.zeros(32, 4))
        report = snapshot()["phases"]["model"]
        self.assertEqual(report["forwards"], 1)
        self.assertEqual(report["token_counts"], [32])
        self.assertGreater(report["buckets_ms"]["gemm_qkv"], 5.0)
        self.assertGreater(report["buckets_ms"]["gemm_down"], 5.0)
        self.assertAlmostEqual(report["balance_ms"], 0.0, places=4)
        self.assertAlmostEqual(
            sum(report["groups_ms"].values()),
            report["gpu_inclusive_ms"],
            places=4,
        )

        set_capture_override(True)
        before = snapshot()["phases"]["model"]["forwards"]
        model(torch.zeros(32, 4))
        self.assertEqual(snapshot()["phases"]["model"]["forwards"], before)
        set_capture_override(None)

        model(torch.zeros(4, 4))
        self.assertEqual(snapshot()["skipped_short"], 1)
        self.assertEqual(snapshot()["phases"]["model"]["forwards"], before)

    def test_nonce_drops_the_warmup_forward(self):
        os.environ["K8V4_PROFILE"] = "1"
        install_module_hook()

        class QKVLinear(torch.nn.Module):
            def forward(self, x):
                return x

        class FakeModel(torch.nn.Module):
            def __init__(self):
                super().__init__()
                self.qkv_proj = QKVLinear()

            def forward(self, hidden):
                return self.qkv_proj(hidden)

        with tempfile.TemporaryDirectory() as directory:
            os.environ["K8V4_PROFILE_DIR"] = directory
            nonce = Path(directory) / "nonce"
            nonce.write_text("warmup\n", encoding="utf-8")
            model = FakeModel()
            model(torch.zeros(32, 4))
            self.assertEqual(snapshot()["phases"]["model"]["forwards"], 1)
            nonce.write_text("measured\n", encoding="utf-8")
            model(torch.zeros(40, 4))
            report = snapshot()["phases"]["model"]
            self.assertEqual(report["forwards"], 1)
            self.assertEqual(report["token_counts"], [40])
            self.assertEqual(snapshot()["nonce"], "measured")
            written = list(Path(directory).glob("profile_*.json"))
            self.assertEqual(len(written), 1)

    def test_import_hook_wraps_collectives_before_the_package_binds_them(self):
        with tempfile.TemporaryDirectory() as directory:
            package = Path(directory) / "k8v4_hooktest"
            package.mkdir()
            (package / "__init__.py").write_text(
                "from .communication_op import *\n",
                encoding="utf-8",
            )
            (package / "communication_op.py").write_text(
                textwrap.dedent(
                    """\
                    def tensor_model_parallel_all_reduce(value):
                        return value + 1
                    """
                ),
                encoding="utf-8",
            )
            finder = install_import_hook(
                ("k8v4_hooktest", "k8v4_hooktest.communication_op")
            )
            sys.path.insert(0, directory)
            try:
                import k8v4_hooktest

                fn = k8v4_hooktest.tensor_model_parallel_all_reduce
                self.assertTrue(getattr(fn, "_k8v4_wrapped", False))
                self.assertEqual(fn(3), 4)
                self.assertTrue(
                    getattr(
                        k8v4_hooktest.communication_op.tensor_model_parallel_all_reduce,
                        "_k8v4_wrapped",
                        False,
                    )
                )
            finally:
                remove_import_hook(finder)
                sys.path.remove(directory)
                for name in list(sys.modules):
                    if name == "k8v4_hooktest" or name.startswith("k8v4_hooktest."):
                        del sys.modules[name]

    def test_head_major_ranges_match_the_unprofiled_prefill(self):
        layout = PageLayout(2)
        ratio = 33
        seq_len = PAGE + 5
        keys = deterministic_rows(seq_len, layout.hkv, seed=41)
        values = deterministic_rows(seq_len, layout.hkv, seed=42)
        raw, block_row = _pack([4], ratio, keys, values, layout)
        views = bind_regions(raw, layout)
        query = torch.randn(3, layout.hq, D)
        os.environ.pop("K8V4_PROFILE", None)
        plain = head_major_prefill(query, views, block_row, seq_len, ratio, 0.125)
        os.environ["K8V4_PROFILE"] = "1"
        outside = head_major_prefill(query, views, block_row, seq_len, ratio, 0.125)
        self.assertTrue(torch.equal(plain, outside))

        seen = {}

        def run():
            seen["out"] = head_major_prefill(
                query, views, block_row, seq_len, ratio, 0.125
            )

        class FakeModel(torch.nn.Module):
            def forward(self, hidden):
                run()
                return hidden

        install_module_hook()
        reset_for_test()
        FakeModel()(torch.zeros(32, 4))
        report = snapshot()["phases"]["model"]
        self.assertGreater(report["buckets_ms"]["attn_gather"], 0.0)
        self.assertGreater(report["buckets_ms"]["attn_sdpa"], 0.0)
        self.assertAlmostEqual(report["balance_ms"], 0.0, places=4)
        self.assertTrue(torch.equal(seen["out"], plain))
        self.assertAlmostEqual(report["groups_ms"]["attention"], report["buckets_ms"]["attn_gather"] + report["buckets_ms"]["attn_sdpa"], places=4)
