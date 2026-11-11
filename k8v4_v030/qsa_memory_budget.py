"""QSA sidecar accounting before main KV allocation (no Torch/device imports).

Storage matches QsaBlockCache: FP32 raw indexer keys, int32 four-axis
positions, and initialized validity flags. Pooled keys stay FP32 unless
``K8V4_QSA_POOLED_KEY_DTYPE`` selects INT8, which also reserves one FP32
scale per pooled row. This changes allocation planning only, not the
indexer, selector, physical-slot map, or KV encoding. ``storage_contract``
strings stay ``legacy-full-raw`` / ``xpu-fp32-physical-tail-v1``.
"""
from __future__ import annotations


def _resolve_pooled_key_dtype(value):
    """``None`` reads the env gate. Explicit strings use the same tokens."""
    if value is None:
        from k8v4_v030.qsa_config import pooled_key_dtype
        return pooled_key_dtype()
    if type(value) is not str:
        raise ValueError('invalid QSA pooled key dtype')
    key=value.strip()
    if key in ('','fp32','float32'):
        return 'fp32'
    if key in ('int8','i8'):
        return 'int8'
    raise ValueError('K8V4_QSA_POOLED_KEY_DTYPE must be unset, empty, fp32, float32, int8, or i8 (got %r)'%(value,))


def prefill_tile_rows(requested_rows, max_complete_blocks, workspace_bytes=64 << 20):
    """Bound the score/sort tile using 64 bytes per row/block of headroom.

    This is a conservative workspace model, not a measured native peak.
    Pooled keys, projection tensors and staged output are reserved separately.
    """
    if type(requested_rows) is not int or requested_rows < 1:
        raise ValueError('invalid requested prefill tile')
    if type(max_complete_blocks) is not int or max_complete_blocks < 0:
        raise ValueError('invalid complete block count')
    if type(workspace_bytes) is not int or workspace_bytes < 1:
        raise ValueError('invalid prefill workspace budget')
    if max_complete_blocks == 0:
        return requested_rows
    limit = workspace_bytes // (64 * max_complete_blocks)
    if limit < 1:
        raise ValueError('one QSA score row exceeds workspace budget')
    return min(requested_rows, limit)


def plan(available_bytes, main_bytes_per_block, layer_block_tokens, *, fixed_bytes=0, override=None, compact_tail_tokens=None, pooled_key_dtype=None):
    if type(available_bytes) is not int or available_bytes < 0:
        raise ValueError('invalid available memory')
    if type(main_bytes_per_block) is not int or main_bytes_per_block <= 0:
        raise ValueError('invalid main cache block bytes')
    if type(fixed_bytes) is not int or fixed_bytes < 0:
        raise ValueError('invalid fixed QSA reserve')
    layers=tuple(layer_block_tokens)
    if any(type(t) is not int or t<=0 or t%64 for t in layers):
        raise ValueError('invalid QSA physical block token count')
    if compact_tail_tokens is not None:
        if (type(compact_tail_tokens) is not int or compact_tail_tokens<=0 or compact_tail_tokens%4
                or any(compact_tail_tokens>t for t in layers)):
            raise ValueError('invalid compact QSA tail size')
        raw_tokens=(compact_tail_tokens,)*len(layers)
        fixed_bytes+=len(layers)*(32*4+4)  # FP32 frequencies and native sticky status.
    else:
        raw_tokens=layers
    components={
        'raw_keys':sum(t*128*4 for t in raw_tokens),
        'positions':sum(t*4*4 for t in raw_tokens),
        'filled':sum(t for t in layers),
        'pooled_keys':sum((t//4)*128*4 for t in layers),
        'pool_valid':sum(t//4 for t in layers),
    }
    # Default ``fp32`` keeps the formula above, including key order.
    # INT8 replaces the 4-byte rows with 1 byte and adds an fp32 scale per row.
    if _resolve_pooled_key_dtype(pooled_key_dtype)=='int8':
        components['pooled_keys']=sum((t//4)*128 for t in layers)
        components['pooled_scales']=sum((t//4)*4 for t in layers)
    if compact_tail_tokens is not None:
        components['raw_slots']=sum(t*8 for t in raw_tokens)
    sidecar_per_block=sum(components.values())
    per_block=main_bytes_per_block+sidecar_per_block
    blocks=max(0,(available_bytes-fixed_bytes)//per_block)
    if override is not None:
        if type(override) is not int or override<=0 or override>blocks:
            raise ValueError('num_gpu_blocks_override exceeds combined KV + QSA budget')
        blocks=override
    if blocks<=0:
        raise ValueError('no physical cache blocks fit after QSA reservation')
    return {'blocks':blocks,'main_bytes':blocks*main_bytes_per_block,
            'storage_contract':'legacy-full-raw' if compact_tail_tokens is None else 'xpu-fp32-physical-tail-v1',
            'sidecar_bytes':blocks*sidecar_per_block,'fixed_bytes':fixed_bytes,
            'sidecar_bytes_per_block':sidecar_per_block,
            'sidecar_components_per_block':components,
            'sidecar_components_bytes':{name:value*blocks for name,value in components.items()},
            'total_bytes':blocks*per_block+fixed_bytes}


def reserve_worker(available_bytes, main_bytes_per_block, layer_specs, *, fixed_bytes, override=None, compact_tail_tokens=None, pooled_key_dtype=None):
    """Pinned TP1/TP2, PP1 Qwen3.8 indexer roster; MTP remains dense.

    Use the cache manager's actual per-layer block size, never reported
    group-aware token capacity or padded tensor bytes divided by key bytes.
    """
    import re
    found={}
    for name,spec in layer_specs:
        if 'mtp' in name.lower():
            continue
        match=re.search(r'(?:^|\.)layers\.(\d+)(?:\.|$)',name)
        if match is None:
            raise ValueError('unrecognized cache layer name')
        layer=int(match.group(1))
        if layer>=64 or layer%4!=3:
            continue
        if layer in found:
            raise ValueError('duplicate trained QSA layer')
        if int(getattr(spec,'num_kv_heads',0)) not in (2,4) or int(getattr(spec,'head_size',0))!=256:
            raise ValueError('unsupported trained QSA cache geometry')
        found[layer]=spec.block_size
    expected=set(range(3,64,4))
    if set(found)!=expected:
        raise ValueError('incomplete trained QSA cache roster; PP sharding is not qualified')
    result=plan(available_bytes,main_bytes_per_block,tuple(found.values()),fixed_bytes=fixed_bytes,
                override=override,compact_tail_tokens=compact_tail_tokens,pooled_key_dtype=pooled_key_dtype)
    result['qsa_layers']=sorted(found)
    return result


def reserve_vllm(vllm_config, groups_per_worker, available_memory, pool_bytes):
    """Reserve indexer storage on each TP rank before admission/auto-fit.

    The 256 MiB workspace allowance is conservative, not a measured graph
    acceptance result. Indexer FP32 parameter bytes are separately exact.
    """
    import os
    if os.environ.get('K8V4_QSA','0')!='1':
        return list(available_memory),[]
    if len(groups_per_worker)!=len(available_memory):
        raise ValueError('QSA worker budget count mismatch')
    cache=vllm_config.cache_config
    if getattr(cache,'kv_cache_memory_bytes',None) is not None:
        raise ValueError('QSA automatic memory accounting requires automatic KV budget')
    fixed=16*(5120*128*5+128*3)*4+(256<<20)
    from k8v4_v030.qsa_config import pooled_key_dtype
    kind=pooled_key_dtype()
    budgets=[]; records=[]
    for worker,(groups,available) in enumerate(zip(groups_per_worker,available_memory)):
        layers=[]
        for group in groups:
            spec=group.kv_cache_spec
            by_name=getattr(spec,'kv_cache_specs',None)
            for name in group.layer_names:
                layers.append((name,spec if by_name is None else by_name[name]))
        record=reserve_worker(available,pool_bytes(groups),layers,fixed_bytes=fixed,
                              override=cache.num_gpu_blocks_override,
                              compact_tail_tokens=16 if os.environ.get('K8V4_QSA_COMPACT_TAIL','0')=='1' else None,
                              pooled_key_dtype=kind)
        record['worker']=worker; record['available_bytes']=available
        budgets.append(record['main_bytes']); records.append(record)
    return budgets,records
