"""Default-off compact-cache lifecycle for the pinned serving runner.

Fresh IDs are allocation generations, not every block in a request's table.
All host metadata is checked before the first native mutation.
"""
from __future__ import annotations

import torch

from k8v4_v030.qsa_cache import all_banks
from k8v4_v030.qsa_tail_cache import native_block_ids


def compact_caches():
    return [cache for bank in all_banks() for cache in bank.layers.values()
            if getattr(cache,'storage_contract',None)=='xpu-fp32-physical-tail-v1']


def reset_allocated_blocks(num_blocks, block_ids):
    if type(num_blocks) is not int or num_blocks<=0:
        raise ValueError('compact scheduler block count must be a positive integer')
    ids=native_block_ids(block_ids,num_blocks)
    plans=[]
    for cache in compact_caches():
        if cache.num_blocks % num_blocks:
            raise ValueError('compact scheduler/cache block geometry mismatch')
        ratio=cache.num_blocks//num_blocks
        if ratio<=0:
            raise ValueError('compact scheduler/cache block geometry mismatch')
        expanded=[block*ratio+j for block in ids for j in range(ratio)]
        plans.append((cache,native_block_ids(expanded,cache.num_blocks)))
    for cache,expanded in plans:
        cache.reset_blocks(expanded)


def check_statuses_before_publication(statuses, *, device, tp_group):
    """Every TP rank participates before any rank raises or publishes output.

    Reduce a separate float32 failure flag; never mutate a captured sticky status.
    Missing caches and malformed local metadata must also reach the collective,
    otherwise healthy ranks can deadlock or publish a failed peer's output.
    """
    device=torch.device(device)
    unique=[];seen=set();bad_metadata=False
    for status in statuses:
        if (not isinstance(status,torch.Tensor) or status.device!=device
                or status.dtype!=torch.int32 or tuple(status.shape)!=(1,)):
            bad_metadata=True
            continue
        pointer=status.data_ptr()
        if pointer not in seen:
            seen.add(pointer);unique.append(status)
    if bad_metadata or not unique:
        failure=torch.ones(1,dtype=torch.float32,device=device)
    else:
        failure=torch.stack(unique).ne(0).any().to(dtype=torch.float32).reshape(1)
    failure=tp_group.all_reduce(failure)
    if float(failure.item())!=0:
        raise RuntimeError('compact cache failure before publication on a tensor-parallel rank')


def check_before_publication(*, device=None, tp_group=None):
    if tp_group is None:
        from vllm.distributed import get_tp_group
        tp_group=get_tp_group()
    if device is None:
        device=torch.device('xpu',torch.xpu.current_device())
    check_statuses_before_publication([cache.status for cache in compact_caches()],
                                     device=device,tp_group=tp_group)
