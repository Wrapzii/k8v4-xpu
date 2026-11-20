"""CPU contract tests for K8V4_GDN_RECOVERSSM (k8v4_v030/gdn_recoverssm.py, tools/patch_gdn_recoverssm_v030.py)."""
from __future__ import annotations

import importlib.util
import os
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from k8v4_v030 import gdn_recoverssm as rssm

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location('patch_gdn_recoverssm_v030', ROOT / 'tools/patch_gdn_recoverssm_v030.py')
patch = importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)

KIMI = ('KimiLinearForCausalLM', 'KimiK3ForConditionalGeneration', 'KimiK31ForConditionalGeneration')


class KnobTest(unittest.TestCase):
    def test_architectures_only_with_the_knob(self):
        with mock.patch.dict(os.environ, {}, clear=False):
            os.environ.pop(rssm.ENV, None)
            self.assertEqual(rssm.kda_architectures(KIMI), KIMI)
        with mock.patch.dict(os.environ, {rssm.ENV: '0'}):
            self.assertEqual(rssm.kda_architectures(KIMI), KIMI)
        with mock.patch.dict(os.environ, {rssm.ENV: '1'}):
            archs = rssm.kda_architectures(KIMI)
            self.assertEqual(archs[:3], KIMI)
            self.assertIn('Qwen3_5ForConditionalGeneration', archs)
            self.assertIn('Qwen3_5ForCausalLM', archs)
            self.assertEqual(rssm.kda_architectures(archs), archs)
        with mock.patch.dict(os.environ, {rssm.ENV: 'yes'}):
            with self.assertRaises(ValueError):
                rssm.kda_architectures(KIMI)

    def test_layer_hook_keeps_stock_layers(self):
        class Cache:
            use_kda_recoverssm = False

        class Layer:
            def __init__(self, num_spec):
                self.cache_config = Cache()
                self.num_spec = num_spec

            def get_attn_backend(self):
                return 'stock'

        rssm.install_layer(Layer)
        rssm.install_layer(Layer)  # idempotent
        layer = Layer(3)
        self.assertFalse(layer.use_gdn_recoverssm)
        self.assertEqual(layer.get_attn_backend(), 'stock')
        self.assertFalse(hasattr(layer, 'recoverssm_replay'))
        Cache.use_kda_recoverssm = True
        self.assertFalse(Layer(0).use_gdn_recoverssm)  # no drafts: nothing to recover


SOURCES = {
    patch.CONFIG: 'def f(self):\n' + patch._CONFIG_OLD + '        return kda_architectures\n',
    patch.MODEL: patch._CAUSAL_OLD + '\n\n' + patch._COND_OLD,
    patch.MTP: 'LocalArgmaxMixin = object\n\n\n' + patch._MTP_OLD + '    pass\n',
    patch.PKG: '"""doc"""\n\n' + patch._PKG_OLD,
    patch.LAYER: 'class QwenGatedDeltaNetAttention:\n    pass\n\n\ndef direct_register_custom_op(**kw):\n    pass\n\n\n'
                 'def qwen_gdn_attention_core_fused_norm_packed():\n    pass\n\n\n' + patch._LAYER_OLD,
    patch.OPS: 'def impl(self, num_spec_decodes, attn_metadata, core_attn_out, z, projected_states_qkvz,\n'
               '         projected_states_ba):\n' + patch._OPS_OLD + '        core_attn_out)\n',
    patch.STATE: 'class RecoverSSMState:\n' + patch._STATE_OLD,
    patch.GRAPH: 'def teardown(runner):\n' + patch._GRAPH_OLD,
}


class PatchTest(unittest.TestCase):
    def tree(self, temp, sources=SOURCES):
        root = Path(temp)
        for rel, text in sources.items():
            (root / rel).parent.mkdir(parents=True, exist_ok=True)
            (root / rel).write_text(text, encoding='utf-8')
        return root

    def test_patches_once(self):
        with tempfile.TemporaryDirectory() as temp:
            root = self.tree(temp)
            notes = patch.patch_vllm_tree(root)
            self.assertTrue(all(n.endswith(':patched') for n in notes), notes)
            text = {rel: (root / rel).read_text() for rel in SOURCES}
            notes = patch.patch_vllm_tree(root)
            self.assertTrue(all(n.endswith(':unchanged') for n in notes), notes)
            self.assertEqual(text, {rel: (root / rel).read_text() for rel in SOURCES})
            self.assertEqual(text[patch.MODEL].count('supports_replayssm = True'), 2)
            self.assertEqual(text[patch.MTP].count('supports_replayssm = True'), 1)
            self.assertIn('_k8v4_rssm_install(QwenGatedDeltaNetAttention)', text[patch.LAYER])
            self.assertIn('return\n\n    torch.ops._xpu_C.gdn_attention(', text[patch.OPS])

    def test_refuses_unknown_source_before_writing(self):
        changed = dict(SOURCES)
        changed[patch.GRAPH] = 'def teardown(runner):\n    pass\n'
        with tempfile.TemporaryDirectory() as temp:
            root = self.tree(temp, changed)
            with self.assertRaises(RuntimeError):
                patch.patch_vllm_tree(root)
            self.assertEqual((root / patch.CONFIG).read_text(), SOURCES[patch.CONFIG])

    def test_patched_config_hook_is_inert_without_the_knob(self):
        with tempfile.TemporaryDirectory() as temp:
            root = self.tree(temp)
            patch.patch_vllm_tree(root)
            scope = {}
            exec(compile((root / patch.CONFIG).read_text(), 'config', 'exec'), scope)
            with mock.patch.dict(os.environ, {}, clear=False):
                os.environ.pop(rssm.ENV, None)
                self.assertEqual(scope['f'](None), KIMI)
            with mock.patch.dict(os.environ, {rssm.ENV: '1'}):
                self.assertIn('Qwen3_5ForCausalLM', scope['f'](None))


if __name__ == '__main__':
    unittest.main()
