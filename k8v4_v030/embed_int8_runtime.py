"""TP-aware INT8 embedding side-file loader for the Swift bake."""
import json
from pathlib import Path

import torch
from safetensors import safe_open
from torch.nn import Parameter
from torch.nn import functional as F


def materialize(layer):
    from vllm.config import get_current_vllm_config
    from vllm.model_executor.layers.vocab_parallel_embedding import ParallelLMHead
    if isinstance(layer, ParallelLMHead):
        return False
    if getattr(layer, '_swift_embed_int8', False):
        return True
    directory = Path(get_current_vllm_config().model_config.model)
    config = directory / 'config.json'
    if not config.exists():
        return False
    quant = json.loads(config.read_text()).get('embed_tokens_quant')
    if not quant:
        return False
    assert quant['bits'] == 8 and not quant.get('packed', False)
    assert layer.num_added_embeddings == 0, 'INT8 side-file loader does not support added LoRA vocabulary'
    side = quant['side_file']
    assert Path(side).name == side
    indices = layer.shard_indices
    begin, end = indices.org_vocab_start_index, indices.org_vocab_end_index
    rows = layer.num_embeddings_per_partition
    with safe_open(str(directory / side), framework='pt') as file:
        codes = file.get_slice(quant['key_weight'])[begin:end]
        scales = file.get_slice(quant['key_scale'])[begin:end]
    assert codes.dtype == torch.int8 and codes.shape[1] == layer.embedding_dim
    assert scales.shape == (end-begin, 1) and torch.isfinite(scales).all()
    weight = torch.zeros((rows, layer.embedding_dim), dtype=torch.int8)
    scale = torch.zeros((rows, 1), dtype=scales.dtype)
    weight[:end-begin], scale[:end-begin] = codes, scales
    device = layer.weight.device
    if device.type == 'xpu':
        torch.xpu.synchronize(device)  # Finish weight-loader copies before retiring the dense allocation.
    layer.weight = Parameter(weight.to(device), requires_grad=False)
    layer.register_parameter('weight_scale', Parameter(scale.to(device), requires_grad=False))
    layer._swift_embed_int8 = True
    if device.type == 'xpu':
        torch.xpu.synchronize(device)
    print(f'[swift-embed-int8] TP rank {layer.tp_rank}: resident {tuple(layer.weight.shape)} '
          f'{layer.weight.dtype}; bytes={layer.weight.numel()+layer.weight_scale.numel()*layer.weight_scale.element_size()}', flush=True)
    return True


def embedding(layer, tokens):
    values = F.embedding(tokens, layer.weight).to(layer.params_dtype)
    scales = F.embedding(tokens, layer.weight_scale).to(layer.params_dtype)
    return values * scales
