"""K8V4_DRAFT_VOCAB: id file contract, the row-subset head (CPU, dense) and the splice."""

from __future__ import annotations

import importlib.util
import json
import os
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace

from k8v4_v030 import draft_vocab

HAVE_TORCH = importlib.util.find_spec("torch") is not None
HAVE_VLLM = importlib.util.find_spec("vllm") is not None

_TOOL = Path(__file__).resolve().parents[2] / "tools" / "patch_spec_decode.py"
_spec = importlib.util.spec_from_file_location("patch_spec_decode", _TOOL)
patch_tool = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(patch_tool)

SPECULATOR = '''\
class DraftModelSpeculator:
    def load_model(self, target_model):
        target_attn_layer_names = set()

        self.model = self.load_draft_model(target_model, target_attn_layer_names)
        self._validate_local_argmax_reduction()
'''


def _write(tmp, ids):
    path = os.path.join(tmp, "ids.json")
    with open(path, "w", encoding="utf-8") as handle:
        json.dump(ids, handle)
    return path


class IdFileTest(unittest.TestCase):
    def test_unset_is_off(self):
        self.assertIsNone(draft_vocab.vocab_path({}))
        self.assertIsNone(draft_vocab.vocab_path({"K8V4_DRAFT_VOCAB": " "}))
        self.assertFalse(draft_vocab.install(object(), {}))

    def test_ids_are_sorted_unique_and_checked(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(draft_vocab.load_ids(_write(tmp, [5, 1, 5, 3]), 10), [1, 3, 5])
            for bad in ([], [1, 10], [-1], ["3"], [True], list(range(10)), {"a": 1}):
                with self.subTest(bad=bad):
                    with self.assertRaises(RuntimeError):
                        draft_vocab.load_ids(_write(tmp, bad), 10)


@unittest.skipUnless(HAVE_TORCH and HAVE_VLLM, "torch and vLLM are needed")
class DenseHeadTest(unittest.TestCase):
    def test_subset_logits_match_the_full_head_on_kept_rows(self):
        import torch

        torch.manual_seed(0)
        vocab, hidden = 40, 16
        head = torch.nn.Linear(hidden, vocab, bias=False)
        model = SimpleNamespace(
            lm_head=head,
            logits_processor=SimpleNamespace(org_vocab_size=vocab, soft_cap=None, scale=1.0, logits_as_input=False),
        )
        keep = [0, 3, 7, 8, 20, 39]
        x = torch.randn(3, hidden)
        with tempfile.TemporaryDirectory() as tmp:
            self.assertTrue(draft_vocab.install(model, {"K8V4_DRAFT_VOCAB": _write(tmp, keep)}))
        with torch.no_grad():
            full = head(x)
            got = model.compute_logits(x)
            top = model.get_top_tokens(x)
        self.assertEqual(tuple(got.shape), (3, vocab))
        self.assertTrue(torch.allclose(got[:, keep], full[:, keep]))
        drop = [i for i in range(vocab) if i not in keep]
        self.assertTrue(torch.isinf(got[:, drop]).all())
        self.assertEqual(top.tolist(), got.argmax(dim=-1).tolist())
        self.assertTrue(set(top.tolist()) <= set(keep))


@unittest.skipUnless(HAVE_TORCH, "torch is needed")
class Int4FormTest(unittest.TestCase):
    def test_forms(self):
        import torch

        head = SimpleNamespace()
        self.assertEqual(draft_vocab.int4_form(head, torch.tensor([8], dtype=torch.int8)), "u4")
        empty = torch.empty(0, dtype=torch.int8)
        with self.assertRaises(RuntimeError):
            draft_vocab.int4_form(head, empty)  # empty zero point without the s4 flip
        head._k8v4_s4 = True
        self.assertEqual(draft_vocab.int4_form(head, empty), "s4")
        for bad in (None, torch.zeros(4, dtype=torch.int8)):
            with self.subTest(bad=bad):
                with self.assertRaises(RuntimeError):
                    draft_vocab.int4_form(SimpleNamespace(), bad)


def _xpu_ready() -> bool:
    if not (HAVE_TORCH and HAVE_VLLM):
        return False
    import torch

    xpu = getattr(torch, "xpu", None)
    return bool(xpu is not None and xpu.is_available())


@unittest.skipUnless(_xpu_ready(), "XPU and vLLM are needed")
class Int4HeadXpuTest(unittest.TestCase):
    def test_gptq_row_subset_matches_full_head_columns(self):
        import torch

        import vllm._xpu_ops  # noqa: F401  (registers torch.ops._xpu_C)

        torch.manual_seed(0)
        dev = torch.device("xpu")
        vocab, hidden, group = 4096, 5120, 128
        w_q = torch.randint(-2**31, 2**31 - 1, (vocab, hidden // 8), dtype=torch.int32).to(dev)
        w_s = (torch.rand(hidden // group, vocab) * 0.02 + 0.001).to(torch.float16).to(dev)
        w_zp = torch.tensor([8], dtype=torch.int8, device=dev)
        kernel = SimpleNamespace(config=SimpleNamespace(group_size=group),
                                 _get_weight_params=lambda layer: (w_q, w_s, w_zp))
        head = torch.nn.Module()
        head.register_buffer("w", w_q)
        head.quant_method = SimpleNamespace(kernel=kernel)
        model = SimpleNamespace(
            lm_head=head,
            logits_processor=SimpleNamespace(org_vocab_size=vocab, soft_cap=None, scale=1.0, logits_as_input=False),
        )
        head.parameters = lambda: iter([torch.nn.Parameter(w_s, requires_grad=False)])
        keep = sorted(torch.randperm(vocab)[:1024].tolist())
        x = torch.randn(4, hidden, dtype=torch.bfloat16, device=dev)
        full = torch.ops._xpu_C.int4_gemm_w4a16(x, w_q.t(), None, w_s, w_zp, group, None)
        with tempfile.TemporaryDirectory() as tmp:
            self.assertTrue(draft_vocab.install(model, {"K8V4_DRAFT_VOCAB": _write(tmp, keep)}))
        got = model.compute_logits(x)
        torch.xpu.synchronize()
        gap = float((got[:, keep].float() - full[:, keep].float()).abs().max().item())
        print("int4 subset head vs full head on kept rows: max abs gap %.3g" % gap, flush=True)
        self.assertLess(gap, 1e-2 * float(full.abs().max().item()) + 1e-3)
        self.assertTrue(torch.isinf(got[:, [i for i in range(vocab) if i not in set(keep)][:64]]).all())
        top = model.get_top_tokens(x)
        self.assertEqual(top.tolist(), got.argmax(dim=-1).tolist())


_W4A8_LIB = os.environ.get("K8V4_W4A8_LIB", "/opt/k8v4/libk8v4_w4a8.so")


@unittest.skipUnless(_xpu_ready() and os.path.isfile(_W4A8_LIB), "XPU and libk8v4_w4a8.so are needed")
class S4HeadXpuTest(unittest.TestCase):
    def test_s4_row_subset_matches_full_s4_head_columns(self):
        import torch

        torch.ops.load_library(_W4A8_LIB)
        torch.manual_seed(1)
        dev = torch.device("xpu")
        vocab, hidden, group = 4096, 5120, 128
        w_q = torch.randint(-2**31, 2**31 - 1, (vocab, hidden // 8), dtype=torch.int32).to(dev)
        w_s = (torch.rand(hidden // group, vocab) * 0.02 + 0.001).to(torch.float16).to(dev)
        w_zp = torch.empty(0, dtype=torch.int8, device=dev)
        kernel = SimpleNamespace(config=SimpleNamespace(group_size=group),
                                 _get_weight_params=lambda layer: (w_q, w_s, w_zp))
        head = torch.nn.Module()
        head.quant_method = SimpleNamespace(kernel=kernel)
        head._k8v4_s4 = True
        head.parameters = lambda: iter([torch.nn.Parameter(w_s, requires_grad=False)])
        model = SimpleNamespace(
            lm_head=head,
            logits_processor=SimpleNamespace(org_vocab_size=vocab, soft_cap=None, scale=1.0, logits_as_input=False),
        )
        keep = sorted(torch.randperm(vocab)[:1024].tolist())
        x = torch.randn(4, hidden, dtype=torch.bfloat16, device=dev)
        full = torch.ops.k8v4_w4a8.int4_gemm_w4a16(x, w_q.t(), w_s, None, group)
        with tempfile.TemporaryDirectory() as tmp:
            self.assertTrue(draft_vocab.install(model, {"K8V4_DRAFT_VOCAB": _write(tmp, keep)}))
        got = model.compute_logits(x)
        torch.xpu.synchronize()
        gap = float((got[:, keep].float() - full[:, keep].float()).abs().max().item())
        print("s4 subset head vs full s4 head on kept rows: max abs gap %.3g" % gap, flush=True)
        self.assertEqual(gap, 0.0)
        self.assertEqual(model.get_top_tokens(x).tolist(), got.argmax(dim=-1).tolist())


class SpliceTest(unittest.TestCase):
    def test_splice_applies_once_and_refuses_unknown_source(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            path = root / patch_tool.SPECULATOR
            path.parent.mkdir(parents=True)
            path.write_text(SPECULATOR, encoding="utf-8")
            self.assertEqual(patch_tool.patch_vllm_tree(root), ["draft_vocab:patched"])
            self.assertEqual(patch_tool.patch_vllm_tree(root), ["draft_vocab:unchanged"])
            text = path.read_text(encoding="utf-8")
            self.assertIn("        _k8v4_draft_vocab(self.model)\n        self._validate_local_argmax_reduction()", text)
            path.write_text(SPECULATOR.replace("self.load_draft_model(", "self.load_other("), encoding="utf-8")
            with self.assertRaises(RuntimeError):
                patch_tool.patch_vllm_tree(root)


if __name__ == "__main__":
    unittest.main()
