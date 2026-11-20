"""K8V4_EMBED_HOST: host-resident INT8 embedding contract (CPU) and UVA gather (XPU only)."""
from __future__ import annotations

import json
import os
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

import torch
from safetensors.torch import save_file

from k8v4_v030 import embed_int8_runtime as runtime


class _Embedding(torch.nn.Module):
    def __init__(self, device):
        super().__init__()
        self.num_added_embeddings = 0
        self.tp_rank = 0
        self.params_dtype = torch.bfloat16
        self.embedding_dim = 8
        self.num_embeddings_per_partition = 64
        self.shard_indices = SimpleNamespace(org_vocab_start_index=0, org_vocab_end_index=62)
        self.weight = torch.nn.Parameter(torch.zeros(64, 8, dtype=torch.bfloat16, device=device), requires_grad=False)


class EmbedHostTest(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory()
        path = Path(self.folder.name)
        self.codes = (torch.arange(62 * 8).reshape(62, 8) % 127 - 63).to(torch.int8)
        self.scale = torch.arange(1, 63).reshape(62, 1).half() / 1000
        save_file({'w': self.codes, 's': self.scale}, str(path / 'embed.safetensors'))
        (path / 'config.json').write_text(json.dumps({'embed_tokens_quant': {
            'bits': 8, 'packed': False, 'side_file': 'embed.safetensors', 'key_weight': 'w', 'key_scale': 's'}}))
        config = SimpleNamespace(model_config=SimpleNamespace(model=self.folder.name))
        self.config = patch('vllm.config.get_current_vllm_config', return_value=config)
        self.config.start()

    def tearDown(self):
        self.config.stop()
        self.folder.cleanup()

    def test_flag_parsing_is_strict_and_off_by_default(self):
        for value, expected in ((None, False), ('', False), ('0', False), ('1', True)):
            env = {k: v for k, v in os.environ.items() if k != runtime.EMBED_HOST_ENV}
            if value is not None:
                env[runtime.EMBED_HOST_ENV] = value
            with self.subTest(value=value), patch.dict(os.environ, env, clear=True):
                self.assertIs(runtime.host_resident(), expected)
        for bad in ('2', 'yes', 'true'):
            with self.subTest(bad=bad), patch.dict(os.environ, {runtime.EMBED_HOST_ENV: bad}):
                with self.assertRaises(RuntimeError):
                    runtime.host_resident()

    def test_default_keeps_the_device_table(self):
        layer = _Embedding('meta')
        with patch.dict(os.environ, {runtime.EMBED_HOST_ENV: '0'}), \
                patch.object(runtime, '_host_table', side_effect=AssertionError('host table built')):
            self.assertTrue(runtime.materialize(layer))
        self.assertFalse(hasattr(layer, '_k8v4_embed_host'))
        self.assertEqual((layer.weight.device.type, layer.weight.dtype), ('meta', torch.int8))

    def test_host_mode_keeps_codes_on_host_and_only_the_view_on_the_device(self):
        layer = _Embedding('meta')
        views = []

        def view(table):
            views.append(table)
            return torch.empty(table.shape, dtype=table.dtype, device='meta')

        with patch.dict(os.environ, {runtime.EMBED_HOST_ENV: '1'}), \
                patch.object(runtime, '_host_table', side_effect=lambda r, d: torch.zeros((r, d), dtype=torch.int8)), \
                patch.object(runtime, '_device_view', side_effect=view):
            self.assertTrue(runtime.materialize(layer))
            self.assertTrue(runtime.materialize(layer), 'Repeated processing must be idempotent')
        self.assertEqual(len(views), 1)
        host = layer._k8v4_embed_host
        self.assertIs(views[0], host)
        self.assertEqual((host.device.type, host.dtype, tuple(host.shape)), ('cpu', torch.int8, (64, 8)))
        self.assertTrue(torch.equal(host[:62], self.codes) and not host[62:].any())
        self.assertEqual((layer.weight.device.type, layer.weight_scale.device.type), ('meta', 'meta'))
        ids = torch.tensor([0, 1, 15, 61])
        expected = self.codes[ids].bfloat16() * self.scale[ids].bfloat16()
        got = torch.nn.functional.embedding(ids, host).bfloat16() * self.scale[ids].bfloat16()
        self.assertTrue(torch.equal(got, expected))

    def test_cpu_layers_ignore_the_flag(self):
        layer = _Embedding('cpu')
        with patch.dict(os.environ, {runtime.EMBED_HOST_ENV: '1'}), \
                patch.object(runtime, '_host_table', side_effect=AssertionError('host table built')):
            self.assertTrue(runtime.materialize(layer))
        self.assertFalse(hasattr(layer, '_k8v4_embed_host'))

    @unittest.skipUnless(hasattr(torch, 'xpu') and torch.xpu.is_available(), 'needs an XPU device')
    def test_xpu_view_gathers_the_same_rows_as_a_device_copy(self):
        device = torch.device('xpu')
        with patch.dict(os.environ, {runtime.EMBED_HOST_ENV: '1'}):
            host = _Embedding(device)
            self.assertTrue(runtime.materialize(host))
        with patch.dict(os.environ, {runtime.EMBED_HOST_ENV: '0'}):
            dense = _Embedding(device)
            self.assertTrue(runtime.materialize(dense))
        self.assertTrue(host._k8v4_embed_host.is_pinned())
        self.assertEqual(host.weight.device.type, 'xpu')
        ids = torch.tensor([0, 5, 61, 62, 63, 5], device=device)
        self.assertTrue(torch.equal(runtime.embedding(host, ids), runtime.embedding(dense, ids)))


if __name__ == '__main__':
    unittest.main()
