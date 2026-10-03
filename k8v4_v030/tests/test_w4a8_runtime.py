"""The compiled model must select precision using actual runtime batch size."""
import os
import unittest
from unittest.mock import patch

import torch
from k8v4_v030 import w4a8_prefill as gemm


class RuntimeGateTests(unittest.TestCase):
    def test_compiled_graph_handles_alternating_decode_and_prefill(self):
        seen = []
        def w4a16(x, packed, scales, zeros, group, bias):
            seen.append(("w4a16", x.shape[0]))
            return x.new_zeros((x.shape[0], packed.shape[1]))
        def w4a8(x, xs, xz, packed, scales, zeros, group, bias):
            seen.append(("w4a8", x.shape[0]))
            return torch.zeros((x.shape[0], packed.shape[1]), dtype=torch.float16)
        def quant(x):
            return x.to(torch.int8), torch.ones(x.shape[0], 1), torch.zeros(x.shape[0], 1, dtype=torch.int32)
        packed = torch.zeros(4, 5, dtype=torch.int32)
        scales = torch.ones(1, 5)
        zeros = torch.tensor([8], dtype=torch.int8)
        fn = torch.compile(lambda x: gemm.runtime_mlp_gemm(x, packed, scales, zeros, 128, None),
                           backend="eager", dynamic=True, fullgraph=True)
        with patch.object(gemm, "_RUNTIME_ENABLED", True), \
             patch.object(gemm, "_w4a16_runtime", w4a16), \
             patch.object(gemm, "w4a8_gemm", w4a8), \
             patch.object(gemm, "_QUANT_COMPILED", quant):
            for rows in (7, 4224, 14, 128, 129, 28):
                out = fn(torch.ones(rows, 32, dtype=torch.bfloat16))
                self.assertEqual(out.shape, (rows, 5))
                self.assertEqual(out.dtype, torch.bfloat16)
            # Even an already compiled opaque call must honor a disabled mode.
            with patch.object(gemm, "_RUNTIME_ENABLED", False):
                fn(torch.ones(4224, 32, dtype=torch.bfloat16))
        self.assertEqual(seen, [("w4a16", 7), ("w4a8", 4224), ("w4a16", 14),
                                ("w4a16", 128), ("w4a8", 129), ("w4a16", 28),
                                ("w4a16", 4224)])

    def test_opt_in_installs_and_opt_out_disables_runtime_dispatch(self):
        previous = gemm._RUNTIME_ENABLED
        try:
            with patch.object(gemm, "install") as install:
                with patch.dict(os.environ, {"K8V4_PREFILL_GEMM": "w4a8"}):
                    gemm.install_if_requested()
                install.assert_called_once()
                self.assertTrue(gemm._RUNTIME_ENABLED)
                with patch.dict(os.environ, {"K8V4_PREFILL_GEMM": "w4a16"}):
                    gemm.install_if_requested()
                self.assertFalse(gemm._RUNTIME_ENABLED)
        finally:
            gemm._RUNTIME_ENABLED = previous
