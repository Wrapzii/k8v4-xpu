import hashlib
import tempfile
import unittest
from pathlib import Path

from k8v4_v030.patch_context_parallel import patch, transform


SOURCES = {
    'config/vllm.py': '''class Config:
    def method(self):
        unsupported = []
        if self.parallel_config.prefill_context_parallel_size > 1:
            unsupported.append("prefill context parallel")
        return unsupported
''',
    'config/model.py': '''class Model:
    def method(self, parallel_config):
        decode_context_parallel_size = 2
        if decode_context_parallel_size > 1 and not self.use_mla:
            raise ValueError("stock DCP needs replicated heads")
''',
    'v1/worker/cp_utils.py': '''def check(layers, vllm_config):
    if layers:
        for layer_name, layer in layers.items():
            assert layer.supported
''',
    'v1/worker/gpu_model_runner.py': '''class Runner:
    def method(self, logits, spec_decode_metadata):
        with scope():
            sampler_output = self._sample(logits, spec_decode_metadata)
        return sampler_output
''',
    'v1/spec_decode/utils.py': '''def step(positions_1d, block_table_tensor, seq_lens, block_size, max_model_len, out_clamped_positions, out_slot_mapping, input_batch_size):
    batch_size = positions_1d.shape[0]
    return batch_size

def slots(cad, new_positions, is_rejected_token_mask, block_size, num_new_tokens, max_model_len):
    batch_size, n_blocks_per_req = cad.block_table_tensor.shape
    return batch_size
''',
}


def digest(data):return hashlib.sha256(data).hexdigest()


class RuntimePatchTest(unittest.TestCase):
    def tree(self, root):
        contract={'sources':{},'required_unchanged':{}}
        for name,text in SOURCES.items():
            path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(text.encode())
            contract['sources'][name]={'sha256':digest(text.encode()),
                                      'patched_sha256':digest(transform(name,text).encode())}
        path=root/'config/parallel.py';path.write_bytes(b'cache_geometry = "known"\n')
        contract['required_unchanged']['config/parallel.py']=digest(path.read_bytes())
        return contract

    def test_pinned_patch_is_idempotent(self):
        with tempfile.TemporaryDirectory() as temp:
            root=Path(temp);contract=self.tree(root)
            first=patch(root,contract);second=patch(root,contract)
            self.assertEqual(len(first['files_written']),5)
            self.assertEqual(second['files_written'],[])
            self.assertFalse(first['four_gpu_serving_validated'])

    def test_late_geometry_mismatch_writes_nothing(self):
        with tempfile.TemporaryDirectory() as temp:
            root=Path(temp);contract=self.tree(root)
            (root/'config/parallel.py').write_bytes(b'changed geometry\n')
            with self.assertRaisesRegex(RuntimeError,'unsupported CP cache/group'):
                patch(root,contract)
            for name,text in SOURCES.items():self.assertEqual((root/name).read_bytes(),text.encode())

    def test_tampered_patch_or_changed_anchor_is_rejected(self):
        with tempfile.TemporaryDirectory() as temp:
            root=Path(temp);contract=self.tree(root);patch(root,contract)
            path=root/'config/model.py';path.write_bytes(path.read_bytes()+b'pass\n')
            self.assertRaises(RuntimeError,patch,root,contract)
        with self.assertRaisesRegex(RuntimeError,'known CP anchor'):
            transform('config/model.py','pass\n')


if __name__=='__main__':unittest.main()
