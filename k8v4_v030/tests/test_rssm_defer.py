"""Contract tests for K8V4_RSSM_VERIFY / K8V4_RSSM_DEFER_COMMIT (k8v4_v030/rssm_defer.py). CPU: knob parsing, window
bound, replay rows. XPU (skipped without a device and the built library, K8V4_RSSM_LIB): verify_slm is bit-identical to
the stock verify, and the deferred commit to commit-then-verify over several steps, plain and align mode."""
from __future__ import annotations

import importlib.util
import os
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from k8v4_v030 import rssm_defer

ROOT = Path(__file__).resolve().parents[2]


class KnobTest(unittest.TestCase):
    def env(self, **kv):
        clean = {k: v for k, v in os.environ.items() if k not in (rssm_defer.VERIFY_ENV, rssm_defer.DEFER_ENV)}
        clean.update(kv)
        return mock.patch.dict(os.environ, clean, clear=True)

    def test_defaults_keep_the_stock_path(self):
        with self.env():
            self.assertEqual(rssm_defer.verify_mode(), 'stock')
            self.assertFalse(rssm_defer.defer_enabled())
            self.assertEqual(rssm_defer.replay_rows(4), 4)
            rssm_defer.check_window(15)  # deep drafting keeps working with the stock kernels

    def test_values(self):
        with self.env(K8V4_RSSM_VERIFY='slm', K8V4_RSSM_DEFER_COMMIT='1'):
            self.assertEqual(rssm_defer.verify_mode(), 'slm')
            self.assertTrue(rssm_defer.defer_enabled())
            self.assertEqual(rssm_defer.replay_rows(4), 8)
        with self.env(K8V4_RSSM_VERIFY='stock', K8V4_RSSM_DEFER_COMMIT='0'):
            self.assertEqual(rssm_defer.verify_mode(), 'stock')
            self.assertFalse(rssm_defer.defer_enabled())

    def test_bad_values_are_rejected(self):
        for kv in ({'K8V4_RSSM_VERIFY': 'fast'}, {'K8V4_RSSM_VERIFY': 'SLM'}):
            with self.env(**kv):
                with self.assertRaises(ValueError):
                    rssm_defer.verify_mode()
        for value in ('2', 'yes', 'true'):
            with self.env(K8V4_RSSM_DEFER_COMMIT=value):
                with self.assertRaises(ValueError):
                    rssm_defer.defer_enabled()

    def test_window_bound(self):
        for kv in ({'K8V4_RSSM_VERIFY': 'slm'}, {'K8V4_RSSM_DEFER_COMMIT': '1'}):
            with self.env(**kv):
                rssm_defer.check_window(7)
                rssm_defer.check_window(15)  # deep copy drafting (K8V4_DEEP_DRAFT, depth 15)
                with self.assertRaises(ValueError):
                    rssm_defer.check_window(16)


_spec = importlib.util.spec_from_file_location('patch_rssm_defer_v030', ROOT / 'tools/patch_rssm_defer_v030.py')
patch = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(patch)


class PatchTest(unittest.TestCase):
    SOURCE = ('def prepare_attn(self, input_batch, for_capture):\n'
              '        attn_metadata = build_attn_metadata(\n' + patch._CALL_OLD + '        return attn_metadata\n')

    def test_splices_once_and_stays_inert_without_the_knob(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / patch.HYBRID
            path.parent.mkdir(parents=True)
            path.write_text(self.SOURCE, encoding='utf-8')
            self.assertTrue(patch.patch_vllm_tree(Path(temp))[0].endswith(':patched'))
            text = path.read_text(encoding='utf-8')
            self.assertTrue(patch.patch_vllm_tree(Path(temp))[0].endswith(':unchanged'))
            self.assertEqual(text, path.read_text(encoding='utf-8'))
            self.assertEqual(text.count('req_idx=_k8v4_rssm_req_idx(input_batch)'), 1)
            scope = {}
            exec(compile('def _k8v4_rssm_req_idx' + text.split('def _k8v4_rssm_req_idx', 1)[1], 'hybrid', 'exec'),
                 scope)

            class Batch:
                idx_mapping_np = [3, 1]

            with mock.patch.dict(os.environ, {rssm_defer.DEFER_ENV: ''}):
                self.assertIsNone(scope['_k8v4_rssm_req_idx'](Batch()))
            with mock.patch.dict(os.environ, {rssm_defer.DEFER_ENV: '1'}):
                self.assertEqual(scope['_k8v4_rssm_req_idx'](Batch()), [3, 1])

    def test_refuses_unknown_source(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / patch.HYBRID
            path.parent.mkdir(parents=True)
            path.write_text('def prepare_attn():\n    pass\n', encoding='utf-8')
            with self.assertRaises(RuntimeError):
                patch.patch_vllm_tree(Path(temp))
            self.assertEqual(path.read_text(encoding='utf-8'), 'def prepare_attn():\n    pass\n')


def _xpu():
    try:
        import torch

        return torch.xpu.is_available()
    except Exception:
        return False


LIB = os.environ.get('K8V4_RSSM_LIB', str(ROOT / 'build/libk8v4_rssm.so'))


@unittest.skipUnless(_xpu() and os.path.exists(LIB), 'needs an XPU and build/libk8v4_rssm.so')
class XpuTest(unittest.TestCase):
    def test_slm_and_deferred_are_bit_identical(self):
        import subprocess
        import sys

        for script in ('rssm_verify_ab.py', 'rssm_defer_check.py'):
            args = [sys.executable, str(ROOT / 'bench' / script), LIB] + (['verify_slm'] if 'ab' in script else [])
            env = dict(os.environ, K8V4_RSSM_CHECK_ONLY='1', PYTHONPATH=str(ROOT))
            out = subprocess.run(args, env=env, capture_output=True, text=True, timeout=900)
            self.assertEqual(out.returncode, 0, out.stderr[-2000:])
            self.assertIn('bit-identical True', out.stdout)
            self.assertNotIn('bit-identical False', out.stdout)


if __name__ == '__main__':
    unittest.main()
