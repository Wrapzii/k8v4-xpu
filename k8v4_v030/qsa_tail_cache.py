"""Compact FP32 indexer storage, CPU reference for a future native ABI.

Keep pooled history and only a bounded raw tail per physical KV block.
This is NOT a drop-in QsaBlockCache: partial rewrites of retired raw history
must fail before publication. Native graph writers/readers must be ported and
qualified explicitly; the frozen legacy cache and serving path are untouched.
"""
from __future__ import annotations

import torch

from k8v4_v030.qsa_config import pooled_key_dtype
from k8v4_v030.qsa_pooled_quant import quantize_pooled_rows
from k8v4_v030.qsa_ref import QsaHyper, pool_blocks


def _compact_int8_op(namespace, name):
    """Patched compact op. The FP32 libs do not export these symbols."""
    try:
        table = getattr(torch.ops, namespace)
        op = getattr(table, name)
    except (AttributeError, RuntimeError):
        op = None
    if op is None:
        raise RuntimeError(
            "loaded compact QSA library cannot store int8 pooled keys "
            "(missing torch.ops.%s.%s). Build the patched native-src kernels "
            "into a new directory and set K8V4_QSA_COMPACT_LIBRARY_DIR to it. "
            "Do not overwrite /compact-libs." % (namespace, name)
        )
    return op


class QsaTailCache:
    storage_contract = 'cpu-fp32-physical-tail-v1'

    def __init__(self, num_blocks, block_size, *, tail_tokens=16, hyper=None, device='cpu'):
        self.hyper = hyper or QsaHyper()
        self.device = torch.device(device)
        if self.device.type != 'cpu':
            raise RuntimeError('compact cache native/graph ABI is not implemented')
        for value in (num_blocks, block_size, tail_tokens):
            if type(value) is not int or value <= 0:
                raise ValueError('invalid compact cache geometry')
        if block_size % 64 or tail_tokens % self.hyper.ratio or tail_tokens > block_size:
            raise ValueError('invalid compact cache block/tail alignment')
        self.num_blocks = num_blocks
        self.block_size = block_size
        self.tail_tokens = tail_tokens
        self.raw = torch.zeros(num_blocks * tail_tokens, self.hyper.dim, dtype=torch.float32)
        self.pos = torch.zeros(num_blocks * tail_tokens, 4, dtype=torch.int32)
        self.raw_slots = torch.full((num_blocks * tail_tokens,), -1, dtype=torch.int64)
        self.filled = torch.zeros(self.num_slots, dtype=torch.bool)
        rows = self.num_slots // self.hyper.ratio
        self.pooled_key_dtype = pooled_key_dtype()
        if self.pooled_key_dtype == 'int8':
            self.pooled = torch.zeros(rows, self.hyper.dim, dtype=torch.int8)
            self.pooled_scale = torch.zeros(rows, dtype=torch.float32)
        else:
            self.pooled = torch.zeros(rows, self.hyper.dim, dtype=torch.float32)
            self.pooled_scale = None
        self.pool_valid = torch.zeros(rows, dtype=torch.bool)

    @property
    def num_slots(self):
        return self.num_blocks * self.block_size

    def _ring_indices(self, slots):
        return (torch.div(slots, self.block_size, rounding_mode='floor') * self.tail_tokens
                + slots.remainder(self.block_size).remainder(self.tail_tokens))

    def write_tokens(self, slots, keys, positions, block_norm):
        """Eager transaction; missing retired members reject before any mutation.

        Fresh full microblocks pool directly from this call's input, so a long
        prefill never needs to allocate or scatter a full raw-history bank.
        Duplicate input slots retain last-write semantics.
        """
        slots = slots.to(dtype=torch.int64, device='cpu').reshape(-1)
        if tuple(keys.shape) != (slots.numel(), self.hyper.dim):
            raise ValueError('indexer keys are [tokens, dim]')
        if tuple(positions.shape) != (slots.numel(), 4):
            raise ValueError('indexer positions are [tokens, 4]')
        if bool((slots >= self.num_slots).any()):
            raise IndexError('indexer slot')
        latest = {slot: i for i, slot in enumerate(slots.tolist()) if slot >= 0}
        if not latest:
            return
        idx = torch.tensor(sorted(latest), dtype=torch.int64)
        source = torch.tensor([latest[s] for s in idx.tolist()], dtype=torch.int64)
        incoming = keys.to(dtype=torch.float32, device='cpu')[source]
        incoming_pos = positions.to(dtype=torch.int32, device='cpu')[source]
        ratio = self.hyper.ratio
        micros = torch.unique(torch.div(idx, ratio, rounding_mode='floor'))
        windows = micros[:, None] * ratio + torch.arange(ratio)
        flat = windows.reshape(-1)
        lookup = torch.searchsorted(idx, flat).clamp_max(idx.numel() - 1)
        provided = idx[lookup] == flat
        ring = self._ring_indices(flat)
        available = self.raw_slots[ring] == flat
        if bool((self.filled[flat] & ~provided & ~available).any()):
            raise RuntimeError('partial overwrite needs retired raw history')
        raw = self.raw[ring].clone()
        pos = self.pos[ring].clone()
        raw[provided] = incoming[lookup[provided]]
        pos[provided] = incoming_pos[lookup[provided]]
        complete = (self.filled[flat] | provided).reshape(-1, ratio).all(dim=1)
        values = pool_blocks(raw.reshape(-1, ratio, self.hyper.dim)[complete], block_norm,
                             pos.reshape(-1, ratio, 4)[complete, 0], self.hyper)
        # Everything that can fail semantically was checked before publication.
        self.filled[idx] = True
        self.pool_valid[micros] = complete
        if self.pooled_scale is None:
            self.pooled[micros[complete]] = values.to(self.pooled.dtype)
        else:
            quantized, scales = quantize_pooled_rows(values)
            self.pooled[micros[complete]] = quantized
            self.pooled_scale[micros[complete]] = scales
        destinations = self._ring_indices(idx).tolist()
        retain = {}
        for source_index, (slot, destination) in enumerate(zip(idx.tolist(), destinations)):
            if slot >= int(self.raw_slots[destination]):
                retain[destination] = source_index
        if retain:
            dst = torch.tensor(list(retain), dtype=torch.int64)
            src = torch.tensor(list(retain.values()), dtype=torch.int64)
            self.raw[dst] = incoming[src]
            self.pos[dst] = incoming_pos[src]
            self.raw_slots[dst] = idx[src]

    def reset_blocks(self, block_ids):
        """Allocation-generation boundary: discard validity before reusing a page."""
        ids = [int(i) for i in block_ids]
        if any(i < 0 or i >= self.num_blocks for i in ids):
            raise IndexError('reset block')
        for i in ids:
            ring = slice(i * self.tail_tokens, (i + 1) * self.tail_tokens)
            self.raw[ring].zero_()
            self.pos[ring].zero_()
            self.raw_slots[ring].fill_(-1)
            self.filled[i*self.block_size:(i+1)*self.block_size].zero_()
            m = self.block_size // self.hyper.ratio
            self.pooled[i*m:(i+1)*m].zero_()
            if self.pooled_scale is not None:
                self.pooled_scale[i*m:(i+1)*m].zero_()
            self.pool_valid[i*m:(i+1)*m].zero_()

    def copy_blocks(self, src_ids, dst_ids):
        """Sequential whole-block copy; rebase retained raw physical-slot tags."""
        src = [int(s) for s in src_ids]
        dst = [int(d) for d in dst_ids]
        if len(src) != len(dst):
            raise ValueError('copy_blocks src/dst length')
        if any(i < 0 or i >= self.num_blocks for i in src + dst):
            raise IndexError('copy block')
        for s, d in zip(src, dst):
            if s == d:
                continue
            rs = slice(s * self.tail_tokens, (s + 1) * self.tail_tokens)
            rd = slice(d * self.tail_tokens, (d + 1) * self.tail_tokens)
            tags = self.raw_slots[rs].clone()
            self.raw[rd] = self.raw[rs].clone()
            self.pos[rd] = self.pos[rs].clone()
            self.raw_slots[rd] = torch.where(tags >= 0, tags + (d - s) * self.block_size, tags)
            self.filled[d * self.block_size:(d + 1) * self.block_size] = self.filled[s * self.block_size:(s + 1) * self.block_size].clone()
            m = self.block_size // self.hyper.ratio
            self.pooled[d*m:(d+1)*m] = self.pooled[s*m:(s+1)*m].clone()
            if self.pooled_scale is not None:
                self.pooled_scale[d*m:(d+1)*m] = self.pooled_scale[s*m:(s+1)*m].clone()
            self.pool_valid[d*m:(d+1)*m] = self.pool_valid[s*m:(s+1)*m].clone()


def native_block_ids(values, num_blocks):
    """Validate the complete host list before issuing ANY lifecycle operation."""
    if torch.is_tensor(values):
        if values.device.type != 'cpu' or values.dtype != torch.int64 or values.ndim != 1:
            raise ValueError('native lifecycle ids require one-dimensional CPU int64 metadata')
        values = values.tolist()
    ids = list(values)
    if any(type(i) is not int for i in ids):
        raise TypeError('native lifecycle block ids must be integers')
    if any(i < 0 or i >= num_blocks for i in ids):
        raise IndexError('native lifecycle block id')
    return ids


def native_write_kind(n, *, capturing):
    """Route bounded writes without allocating or inspecting tensor values."""
    if type(n) is not int or not 1 <= n <= 8192:
        raise ValueError('compact native writer requires 1..8192 rows')
    if n > 128:
        if capturing:
            raise RuntimeError('compact native prefill requires eager execution')
        return 'prefill'
    return 'decode'


class QsaXpuTailCache:
    """Explicit compact XPU API, opt-in only in the serving cache factory.

    Uses the separately qualified decode writer (<=128 input rows per call)
    and explicit eager prepared-prefill writer (<=8192 rows). The serving
    allocator and publication boundary still require explicit integration.
    Never use legacy raw writers on this storage. The CPU reference above
    intentionally remains unchanged.
    """
    storage_contract = 'xpu-fp32-physical-tail-v1'

    def __init__(self, num_blocks, block_size, *, tail_tokens=16, hyper=None, device='xpu:0'):
        from k8v4_v030.qsa_cache import QsaBlockCache
        self.device = torch.device(device)
        if self.device.type != 'xpu':
            raise RuntimeError('native compact cache requires XPU')
        if self.device.index is None:
            raise ValueError('native compact cache requires an explicit XPU index')
        self.hyper = hyper or QsaHyper()
        for value in (num_blocks, block_size, tail_tokens):
            if type(value) is not int or value <= 0:
                raise ValueError('invalid native compact cache geometry')
        if (block_size % 64 or tail_tokens % 4 or tail_tokens > block_size
                or num_blocks * block_size > (1 << 31)-1):
            raise ValueError('invalid native compact cache extent')
        if (self.hyper.dim, self.hyper.ratio, self.hyper.n_rot, tuple(self.hyper.sections), self.hyper.theta) != (
                128, 4, 64, (11,11,10,0), 10000000.0):
            raise ValueError('native compact cache requires trained Qwen geometry')
        self._require_eager()
        import os
        from pathlib import Path
        directory=os.environ.get('K8V4_QSA_COMPACT_LIBRARY_DIR')
        if directory:
            paths=[Path(directory)/name for name in (
                'libqsa_tail_v1.so','libqsa_tail_prefill_v1.so','libqsa_tail_lifecycle.so')]
            if not all(path.is_file() for path in paths):
                raise RuntimeError('compact serving native library set is incomplete')
            for path in paths:
                torch.ops.load_library(str(path))
        if (not hasattr(torch.ops.qsa_tail_v1, 'update')
                or not hasattr(torch.ops.qsa_tail_prefill_v1, 'update')
                or not hasattr(torch.ops.qsa_tail_lifecycle, 'copy_block')
                or not hasattr(torch.ops.qsa_tail_lifecycle, 'reset_block')):
            raise RuntimeError('explicit compact writer and lifecycle libraries are not loaded')
        self.pooled_key_dtype = pooled_key_dtype()
        if self.pooled_key_dtype == 'int8':
            # Fail before allocation if the loaded .so is the FP32 build.
            for namespace, op_name in (
                ('qsa_tail_v1', 'update_i8'),
                ('qsa_tail_prefill_v1', 'update_i8'),
                ('qsa_tail_lifecycle', 'copy_block_i8'),
                ('qsa_tail_lifecycle', 'reset_block_i8'),
            ):
                _compact_int8_op(namespace, op_name)
        self.num_blocks, self.block_size, self.tail_tokens = num_blocks, block_size, tail_tokens
        self.lazy = False
        dev = self.device
        self.raw = torch.zeros(num_blocks*tail_tokens,128,dtype=torch.float32,device=dev)
        self.pos = torch.zeros(num_blocks*tail_tokens,4,dtype=torch.int32,device=dev)
        self.raw_slots = torch.full((num_blocks*tail_tokens,),-1,dtype=torch.int64,device=dev)
        self.filled = torch.zeros(self.num_slots,dtype=torch.bool,device=dev)
        rows = self.num_slots//4
        if self.pooled_key_dtype == 'int8':
            self.pooled = torch.zeros(rows,128,dtype=torch.int8,device=dev)
            self.pooled_scale = torch.zeros(rows,dtype=torch.float32,device=dev)
            # Score reads this. The writer refreshes the rows it stored so a
            # decode step does not cast the whole pool on every layer.
            self.pooled_fp32 = torch.zeros(rows,128,dtype=torch.float32,device=dev)
        else:
            self.pooled = torch.zeros(rows,128,dtype=torch.float32,device=dev)
            self.pooled_scale = None
            self.pooled_fp32 = None
        self.pool_valid = torch.zeros(rows,dtype=torch.bool,device=dev)
        self.status = torch.zeros(1,dtype=torch.int32,device=dev)
        step = float(self.hyper.theta) ** (-2.0/float(self.hyper.n_rot))
        self.freq = torch.tensor([step**p for p in range(32)],dtype=torch.float32,device=dev)
        import json
        scale_bytes = 0 if self.pooled_scale is None else self.pooled_scale.numel()*self.pooled_scale.element_size()
        mirror = getattr(self, 'pooled_fp32', None)
        mirror_bytes = 0 if mirror is None else mirror.numel()*mirror.element_size()
        print('QSA_COMPACT_ALLOCATION '+json.dumps({
            'device':str(dev),'num_blocks':num_blocks,'block_size':block_size,
            'tail_tokens':tail_tokens,'storage_contract':self.storage_contract,
            'tensor_bytes':sum(t.numel()*t.element_size() for t in self._tensors())
                           + self.freq.numel()*self.freq.element_size() + scale_bytes + mirror_bytes,
            'mirror_bytes':mirror_bytes}),flush=True)

    @property
    def num_slots(self):
        return self.num_blocks*self.block_size

    def ensure_capacity(self, last_slot):
        if type(last_slot) is not int or last_slot >= self.num_slots:
            raise IndexError('indexer slot')
        # Entire compact allocation is fixed before capture. Never grow it.

    def _tensors(self):
        return (self.raw,self.pos,self.raw_slots,self.filled,self.pooled,self.pool_valid,self.status)

    def _sync_mirror_slots(self, slots):
        """Refresh the fp32 mirror for the token slots just written.

        Row 0 is refreshed for a negative slot. That matches the int8
        value already stored there and does not read the host.
        """
        mirror = getattr(self, "pooled_fp32", None)
        if mirror is None or not torch.is_tensor(slots) or slots.numel() == 0:
            return
        from k8v4_v030.qsa_pooled_quant import refresh_mirror_rows
        rows = torch.div(
            slots.reshape(-1).to(dtype=torch.int64).clamp(min=0),
            4,
            rounding_mode="floor",
        )
        refresh_mirror_rows(self.pooled, self.pooled_scale, mirror, rows)

    def write_tokens(self, slots, keys, positions, block_norm):
        if slots.ndim != 1:
            raise ValueError('compact native slots must be one-dimensional')
        kind = native_write_kind(slots.numel(),capturing=False)
        int8 = self.pooled_scale is not None
        if kind == 'prefill':
            self._require_eager()
            from k8v4_v030.qsa_prefill_sidecar_writer import prepare
            if int8:
                native = _compact_int8_op('qsa_tail_prefill_v1', 'update_i8')
            else:
                native = getattr(torch.ops.qsa_tail_prefill_v1,'update',None)
                if native is None:
                    raise RuntimeError('compact native prefill library is not loaded')
            s,k,p,m = prepare(self,slots,keys,positions)
            if not s.numel():
                return
            w = block_norm.detach().to(device=self.device,dtype=torch.float32).reshape(-1).contiguous()
            if int8:
                native(s,k,p,m,w,self.freq,*self._tensors(),self.pooled_scale,
                       self.block_size,self.tail_tokens,float(self.hyper.eps))
                self._sync_mirror_slots(s)
            else:
                native(s,k,p,m,w,self.freq,*self._tensors(),self.block_size,self.tail_tokens,float(self.hyper.eps))
        elif int8:
            _compact_int8_op('qsa_tail_v1', 'update_i8')(
                slots,keys,positions,block_norm,self.freq,*self._tensors(),self.pooled_scale,
                self.block_size,self.tail_tokens,float(self.hyper.eps))
            self._sync_mirror_slots(slots)
        else:
            torch.ops.qsa_tail_v1.update(slots,keys,positions,block_norm,self.freq,*self._tensors(),
                                         self.block_size,self.tail_tokens,float(self.hyper.eps))

    @staticmethod
    def _require_eager():
        fn = getattr(torch.xpu,'is_current_stream_capturing',None)
        if fn is None or bool(fn()):
            raise RuntimeError('compact lifecycle/publication boundary requires known non-capturing stream')

    def copy_blocks(self, src_ids, dst_ids):
        self._require_eager()
        src = native_block_ids(src_ids,self.num_blocks)
        dst = native_block_ids(dst_ids,self.num_blocks)
        if len(src) != len(dst):
            raise ValueError('copy_blocks src/dst length')
        for s,d in zip(src,dst):
            if self.pooled_scale is not None:
                _compact_int8_op('qsa_tail_lifecycle', 'copy_block_i8')(
                    *self._tensors(),self.pooled_scale,self.block_size,self.tail_tokens,s,d)
                if self.pooled_fp32 is not None:
                    m = self.block_size // 4
                    self.pooled_fp32[d*m:(d+1)*m].copy_(self.pooled_fp32[s*m:(s+1)*m])
            else:
                torch.ops.qsa_tail_lifecycle.copy_block(*self._tensors(),self.block_size,self.tail_tokens,s,d)

    def reset_blocks(self, block_ids):
        self._require_eager()
        ids = native_block_ids(block_ids,self.num_blocks)
        for i in ids:
            if self.pooled_scale is not None:
                _compact_int8_op('qsa_tail_lifecycle', 'reset_block_i8')(
                    *self._tensors(),self.pooled_scale,self.block_size,self.tail_tokens,i)
                if self.pooled_fp32 is not None:
                    m = self.block_size // 4
                    self.pooled_fp32[i*m:(i+1)*m].zero_()
            else:
                torch.ops.qsa_tail_lifecycle.reset_block(*self._tensors(),self.block_size,self.tail_tokens,i)

    def assert_healthy(self):
        """Explicit host completion check; NOT yet installed in the model runner."""
        self._require_eager()
        status = int(self.status.item())
        if status:
            detail = []
            if status & 1: detail.append('invalid physical slot')
            if status & 2: detail.append('retired raw history')
            if status & 4: detail.append('invalid raw slot tag')
            if status & 8: detail.append('invalid prepared prefill indices')
            raise RuntimeError('compact cache failure before publication: '+', '.join(detail or [str(status)]))

    # Reuse only storage-independent mapping and pooled-read operations.
    from k8v4_v030.qsa_cache import QsaBlockCache as _Base
    block_slice = _Base.block_slice
    logical_slots = _Base.logical_slots
    logical_slot = _Base.logical_slot
    gather_blocks = _Base.gather_blocks
    pooled_row = _Base.pooled_row
