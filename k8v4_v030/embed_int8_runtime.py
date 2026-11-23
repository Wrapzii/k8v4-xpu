"""TP-aware INT8 embedding side-file loader for the Swift bake.

K8V4_EMBED_HOST=1 (default 0) keeps the INT8 table in pinned host memory and gives the GPU a
zero-copy (UVA) view of it instead of a device copy. The table is 248,320 x 5,120 int8 = 1.27 GB;
each step reads only the rows of the step's tokens (5 KiB per token over PCIe), so the device
memory goes to the KV cache instead. The MTP draft shares the target's embedding after load, so it
reads the same host table. The values gathered are bit-identical.
"""
import json
import os
from pathlib import Path

import torch
from safetensors import safe_open
from torch.nn import Parameter
from torch.nn import functional as F


EMBED_HOST_ENV = 'K8V4_EMBED_HOST'


def host_resident():
    """True when K8V4_EMBED_HOST=1. Unset or 0 keeps the device-resident table."""
    value = os.environ.get(EMBED_HOST_ENV, '0').strip() or '0'
    if value not in ('0', '1'):
        raise RuntimeError('%s must be 0 or 1, got %r' % (EMBED_HOST_ENV, value))
    return value == '1'


def _host_table(rows, dim):
    """Zeroed int8 table in pinned (page-locked) host memory, which the device can read directly."""
    return torch.zeros((rows, dim), dtype=torch.int8, pin_memory=True)


def _device_view(table):
    """Device tensor that reads the pinned host table in place (no copy)."""
    from vllm.utils.torch_utils import get_accelerator_view_from_cpu_tensor
    return get_accelerator_view_from_cpu_tensor(table)


def _keep_on_host(layer, weight, scale):
    device = layer.weight.device
    if device.type == 'xpu':
        torch.xpu.synchronize(device)  # Finish weight-loader copies before retiring the dense allocation.
    layer._k8v4_embed_host = weight  # The view does not own the pinned pages; keep them alive.
    layer.weight = Parameter(_device_view(weight), requires_grad=False)
    layer.register_parameter('weight_scale', Parameter(scale.to(device), requires_grad=False))
    layer._swift_embed_int8 = True
    if device.type == 'xpu':
        torch.xpu.synchronize(device)
    print('[swift-embed-int8] TP rank %d: host-resident %s %s (K8V4_EMBED_HOST=1, %s view); device bytes=%d, '
          'pinned host bytes=%d' % (layer.tp_rank, tuple(weight.shape), weight.dtype, layer.weight.device.type,
                                    layer.weight_scale.numel() * layer.weight_scale.element_size(), weight.numel()),
          flush=True)
    return True


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
    host = host_resident() and layer.weight.device.type != 'cpu'
    weight = _host_table(rows, layer.embedding_dim) if host else torch.zeros((rows, layer.embedding_dim), dtype=torch.int8)
    scale = torch.zeros((rows, 1), dtype=scales.dtype)
    weight[:end-begin], scale[:end-begin] = codes, scales
    if host:
        return _keep_on_host(layer, weight, scale)
    device = layer.weight.device
    if device.type == 'xpu':
        torch.xpu.synchronize(device)  # Finish weight-loader copies before retiring the dense allocation.
    from k8v4_v030.upload import to_device  # K8V4_UPLOAD_SLICE_MB; default 0 = plain .to(device)
    layer.weight = Parameter(to_device(weight, device), requires_grad=False)
    layer.register_parameter('weight_scale', Parameter(to_device(scale, device), requires_grad=False))
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
