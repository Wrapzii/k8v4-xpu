"""Optional eager large-prefill sidecar writer; no legacy library is changed.

The native op is private: invoke it only with prepare() output. The Python
boundary is responsible for physical bounds and duplicate resolution.
"""
import os
import torch


def prepare(cache, slots, keys, positions):
    slots = slots.to(dtype=torch.int64, device=cache.raw.device).reshape(-1)
    pos = positions.to(dtype=torch.int32, device=cache.pos.device)
    if keys.ndim != 2 or keys.shape != (slots.numel(), 128):
        raise ValueError('indexer keys are [tokens, 128]')
    if pos.ndim != 2 or pos.shape != (slots.numel(), 4):
        raise ValueError('indexer positions are [tokens, 4]')
    mask = slots >= 0
    idx = slots[mask]
    if idx.numel() == 0:
        return idx, keys[:0], pos[:0], idx
    cache.ensure_capacity(int(idx.max()))
    keys = keys.to(dtype=cache.raw.dtype, device=cache.raw.device)[mask]
    pos = pos[mask]
    # Stable sort means the final member of each equal-slot run is the final
    # original input write. Distinct micros need not occur in contiguous runs.
    order = torch.argsort(idx, stable=True)
    idx, keys, pos = idx[order], keys[order], pos[order]
    last = torch.ones(idx.numel(), dtype=torch.bool, device=idx.device)
    last[:-1] = idx[:-1] != idx[1:]
    idx, keys, pos = idx[last], keys[last], pos[last]
    micros = torch.unique_consecutive(torch.div(idx, 4, rounding_mode='floor'))
    return idx, keys, pos, micros


def try_runtime_write(cache, slots, keys, positions, weight, hyper, lengths):
    """Bridge for the existing eager else branch; missing prerequisites fall back."""
    if os.environ.get('K8V4_QSA_NEW_PREFILL_WRITER', '0') != '1':
        return False
    if keys.device.type != 'xpu':
        return False
    try:
        fn = getattr(torch.xpu, 'is_current_stream_capturing', None)
        if fn is None or bool(fn()):
            return False
        native = getattr(torch.ops.qsa_prefill_sidecar, 'update', None)
    except Exception:
        return False  # unknown capture state / absent library: never enter native
    return try_write(cache, slots, keys, positions, weight, hyper, native,
                     capturing=False, lengths=lengths)


def eligible_prefill_size(n):
    return 2048 <= n <= 8192


def try_write(cache, slots, keys, positions, weight, hyper, native, *, capturing, lengths):
    """True iff handled; False means call the original write_tokens unchanged.

    The caller must pass the actual capture status and original query lengths.
    This function never touches graph paths, main KV, or legacy native symbols.
    """
    n = slots.numel()
    if (getattr(cache,'storage_contract','') == 'xpu-fp32-physical-tail-v1'
        or os.environ.get('K8V4_QSA_NEW_PREFILL_WRITER', '0') != '1'
        or capturing or keys.device.type != 'xpu' or native is None
        or not eligible_prefill_size(n) or not lengths
        or not (n > 128 or max(lengths) > 16)
        or (hyper.dim, hyper.ratio, hyper.n_rot, tuple(hyper.sections), float(hyper.theta))
           != (128, 4, 64, (11, 11, 10, 0), 10000000.0)
        or keys.dtype != torch.float32 or cache.raw.dtype != torch.float32
        or cache.pooled.dtype != torch.float32
        or not all(t.is_contiguous() for t in
                   (cache.raw, cache.pos, cache.filled, cache.pooled, cache.pool_valid))):
        return False
    s, k, p, micros = prepare(cache, slots, keys, positions)
    if not s.numel():
        return True
    device = cache.raw.device
    w = weight.to(device=device, dtype=torch.float32).reshape(-1).contiguous()
    step = float(hyper.theta) ** (-2.0 / float(hyper.n_rot))
    freq = torch.tensor([step ** i for i in range(32)], dtype=torch.float32, device=device)
    native(s, k, p, micros, w, freq, cache.raw, cache.pos, cache.filled,
           cache.pooled, cache.pool_valid, float(hyper.eps))
    return True
