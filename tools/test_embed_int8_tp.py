"""CPU fixture verifies both vocabulary shards and padding in the INT8 loader."""
import json
from pathlib import Path
import tempfile
from types import SimpleNamespace
from unittest.mock import patch

import torch
from safetensors.torch import save_file
import swift_embed_int8_runtime as runtime


class Embedding(torch.nn.Module):
    def __init__(self, rank):
        super().__init__()
        self.num_added_embeddings = 0
        self.tp_rank = rank
        self.params_dtype = torch.bfloat16
        self.embedding_dim = 8
        self.num_embeddings_per_partition = 32
        self.shard_indices = SimpleNamespace(org_vocab_start_index=rank*32,
                                            org_vocab_end_index=min((rank+1)*32, 62))
        self.weight = torch.nn.Parameter(torch.zeros(32, 8, dtype=torch.bfloat16), requires_grad=False)


with tempfile.TemporaryDirectory() as folder:
    path = Path(folder)
    codes = (torch.arange(62*8).reshape(62, 8) % 127 - 63).to(torch.int8)
    scale = torch.arange(1, 63).reshape(62, 1).half() / 1000
    save_file({'w': codes, 's': scale}, str(path/'embed.safetensors'))
    (path/'config.json').write_text(json.dumps({'embed_tokens_quant': {
        'bits':8, 'packed':False, 'side_file':'embed.safetensors', 'key_weight':'w', 'key_scale':'s'}}))
    config = SimpleNamespace(model_config=SimpleNamespace(model=folder))
    with patch('vllm.config.get_current_vllm_config', return_value=config):
        for rank in (0, 1):
            layer = Embedding(rank)
            assert runtime.materialize(layer)
            ids = torch.tensor([0, 1, 15, 29])
            result = runtime.embedding(layer, ids)
            global_ids = ids + rank*32
            expected = codes[global_ids].bfloat16() * scale[global_ids].bfloat16()
            assert torch.equal(result, expected), 'Vocabulary shard mismatch'
            assert layer.weight.dtype == torch.int8 and result.dtype == torch.bfloat16
            if rank == 1:
                assert torch.count_nonzero(runtime.embedding(layer, torch.tensor([30, 31]))) == 0
            assert runtime.materialize(layer), 'Repeated processing must be idempotent'
print('INT8_EMBED_TP2_AND_PADDING_PASS')
