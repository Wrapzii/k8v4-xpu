"""K8V4_DRAFT_SKIP_SHARED: flag, placeholder load, share check, and the vLLM 0.30 splices (CPU only)."""
from __future__ import annotations

import importlib.util
import os
import shutil
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

import torch

from k8v4_v030 import draft_shared
from k8v4_v030 import patch_installed_vllm as piv


class _Table(torch.nn.Module):
    def __init__(self, rows):
        super().__init__()
        self.org_vocab_size = rows
        self.weight = torch.nn.Parameter(torch.full((rows, 4), 7.0), requires_grad=False)


class _Draft(torch.nn.Module):
    def __init__(self, rows):
        super().__init__()
        self.config = SimpleNamespace(vocab_size=10, tie_word_embeddings=False)
        self.model = torch.nn.Module()
        self.model.embed_tokens = _Table(rows)
        self.model.fc = torch.nn.Linear(4, 4)
        self.lm_head = _Table(rows)


class _Loader:
    def __init__(self):
        self.names = []

    def load_weights(self, weights):
        self.names = [name for name, _ in weights]
        return set(self.names)


WEIGHTS = [('model.embed_tokens.weight', torch.zeros(10, 4)), ('model.fc.weight', torch.zeros(4, 4)),
           ('lm_head.weight', torch.zeros(10, 4))]


class DraftSharedTest(unittest.TestCase):
    def test_flag_is_strict_and_off_by_default(self):
        env = {k: v for k, v in os.environ.items() if k != draft_shared.ENV}
        with patch.dict(os.environ, env, clear=True):
            self.assertFalse(draft_shared.enabled())
        for value, expected in (('0', False), ('1', True)):
            with patch.dict(os.environ, {draft_shared.ENV: value}):
                self.assertIs(draft_shared.enabled(), expected)
        for bad in ('2', 'on'):
            with patch.dict(os.environ, {draft_shared.ENV: bad}), self.assertRaises(RuntimeError):
                draft_shared.enabled()

    def test_table_rows(self):
        untied, tied = SimpleNamespace(tie_word_embeddings=False), SimpleNamespace(tie_word_embeddings=True)
        with patch.object(draft_shared, '_pipeline_parallel', return_value=False):
            with patch.dict(os.environ, {draft_shared.ENV: '0'}):
                self.assertEqual(draft_shared.table_rows(10, untied), 10)
            with patch.dict(os.environ, {draft_shared.ENV: '1'}):
                self.assertEqual(draft_shared.table_rows(10, untied), 1)
                self.assertEqual(draft_shared.table_rows(10, tied), 10)
        with patch.object(draft_shared, '_pipeline_parallel', return_value=True), \
                patch.dict(os.environ, {draft_shared.ENV: '1'}):
            self.assertEqual(draft_shared.table_rows(10, untied), 10)

    def test_full_tables_load_everything(self):
        loader = _Loader()
        draft_shared.load_without_shared(_Draft(10), loader, iter(WEIGHTS))
        self.assertEqual(loader.names, [name for name, _ in WEIGHTS])

    def test_placeholders_skip_shared_tensors_and_count_as_loaded(self):
        draft, loader = _Draft(1), _Loader()
        loaded = draft_shared.load_without_shared(draft, loader, iter(WEIGHTS))
        self.assertEqual(loader.names, ['model.fc.weight'])
        self.assertEqual(loaded, {'model.fc.weight', 'model.embed_tokens.weight', 'lm_head.weight'})
        self.assertFalse(draft.model.embed_tokens.weight.any() or draft.lm_head.weight.any())
        with self.assertRaises(RuntimeError):
            draft_shared.check_replaced(draft)
        target = _Draft(10)
        draft.model.embed_tokens, draft.lm_head = target.model.embed_tokens, target.lm_head
        draft_shared.check_replaced(draft)


MTP_TEXT = (
    'class Qwen3_5MultiTokenPredictor(nn.Module):\n'
    '    def __init__(self):\n'
    + piv._DRAFT_EMBED_OLD
    + '\n'
    'class Qwen3_5MTP(nn.Module):\n'
    '    def __init__(self):\n'
    '        if get_pp_group().is_last_rank:\n'
    + piv._DRAFT_HEAD_OLD
    + '                prefix=maybe_prefix(prefix, "lm_head"),\n'
    '            )\n'
    '\n'
    '    def load_weights(self, weights):\n'
    + piv._DRAFT_LOAD_OLD
)
EAGLE_TEXT = 'def load_eagle_model(target_model, vllm_config):\n' + piv._DRAFT_CHECK_OLD


class DraftSharedSpliceTest(unittest.TestCase):
    def _tree(self, root: Path, mtp: str, eagle: str) -> None:
        for rel, text in ((piv._MTP_FILE, mtp), (piv._EAGLE_FILE, eagle)):
            (root / rel).parent.mkdir(parents=True, exist_ok=True)
            (root / rel).write_text(text, encoding='utf-8')

    def test_patches_once_and_compiles(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._tree(root, MTP_TEXT, EAGLE_TEXT)
            self.assertEqual(piv.patch_draft_shared(root), ['draft_shared_mtp:patched', 'draft_shared_check:patched'])
            self.assertEqual(piv.patch_draft_shared(root),
                             ['draft_shared_mtp:unchanged', 'draft_shared_check:unchanged'])
            mtp = (root / piv._MTP_FILE).read_text(encoding='utf-8')
            self.assertEqual(mtp.count('_k8v4_rows('), 2)
            self.assertIn('_k8v4_load(self, loader, remap_weight_names(weights))', mtp)
            self.assertIn('_k8v4_check(eagle_model)', (root / piv._EAGLE_FILE).read_text(encoding='utf-8'))
            for rel in (piv._MTP_FILE, piv._EAGLE_FILE):
                compile((root / rel).read_text(encoding='utf-8'), rel, 'exec')

    def test_unknown_source_is_refused_untouched(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            broken = MTP_TEXT.replace('                config.vocab_size,\n', '                vocab,\n')
            self._tree(root, broken, EAGLE_TEXT)
            with self.assertRaises(RuntimeError):
                piv.patch_draft_shared(root)
            self.assertEqual((root / piv._MTP_FILE).read_text(encoding='utf-8'), broken)

    def test_missing_files_are_skipped(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(piv.patch_draft_shared(Path(tmp)), [])

    def test_installed_vllm_sources_take_the_splice(self):
        spec = importlib.util.find_spec('vllm')
        if spec is None or spec.origin is None:
            self.skipTest('vLLM is not installed')
        installed = Path(spec.origin).parent
        if '_k8v4_rows' in (installed / piv._MTP_FILE).read_text(encoding='utf-8'):
            self.skipTest('installed vLLM is already patched')
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            for rel in (piv._MTP_FILE, piv._EAGLE_FILE):
                (root / rel).parent.mkdir(parents=True, exist_ok=True)
                shutil.copy(installed / rel, root / rel)
            self.assertEqual(piv.patch_draft_shared(root), ['draft_shared_mtp:patched', 'draft_shared_check:patched'])


if __name__ == '__main__':
    unittest.main()
