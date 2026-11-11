"""Indexer cache addressed by the same slots as the K8/V4 block table.

One physical slot holds one raw indexer key (fp32, dim 128) and the MRoPE
position that was current when it was written. Four contiguous slots whose
slot ids are ``4 * n .. 4 * n + 3`` are one micro-block. vLLM block sizes
are multiples of 64, and a sequence starts on a block boundary, so a logical
micro-block never crosses a physical block. Prefix caching copies a whole
physical block: raw keys, positions, fill flags, and the pooled rows that
sit inside that block.

Pooled rows are published only when all four raw keys are present. The
value is the reference pool: mean, block RMSNorm, MRoPE at the first token.
"""

from __future__ import annotations

import os

import torch

from k8v4_v030.layout import PAGE
from k8v4_v030.qsa_config import pooled_key_dtype
from k8v4_v030.qsa_pooled_quant import dequantize_pooled_rows, quantize_pooled_rows
from k8v4_v030.qsa_ref import QsaHyper, clear_prepared, pool_blocks


class QsaBlockCache:
    """Flat slot cache. ``block_size`` is the token width of one K8/V4 block."""

    def __init__(
        self,
        num_blocks: int,
        block_size: int,
        hyper: QsaHyper | None = None,
        dtype: torch.dtype = torch.float32,
        device: torch.device | str | None = None,
    ) -> None:
        self.hyper = hyper or QsaHyper()
        self.block_size = int(block_size)
        self.num_blocks = int(num_blocks)
        self.device = torch.device("cpu" if device is None else device)
        if self.num_blocks < 1 or self.block_size < self.hyper.ratio:
            raise ValueError("indexer cache size")
        if self.block_size % self.hyper.ratio != 0:
            raise ValueError("block_size must be a multiple of the QSA ratio")
        if self.block_size % PAGE != 0:
            raise ValueError("block_size must be a multiple of the K8/V4 page")
        self.lazy = os.environ.get("K8V4_QSA_LAZY_CACHE", "0") == "1"
        floor_tokens = int(os.environ.get("K8V4_QSA_GRAPH_TOKENS", "0") or "0")
        # Graph replay can change physical block IDs without Python re-entry.
        # Reserve all physical slots before capture; never grow captured storage.
        if self.lazy and os.environ.get("K8V4_QSA_GRAPH", "0") != "1":
            base_blocks = 2
            if floor_tokens > 0:
                base_blocks = max(base_blocks, (floor_tokens + self.block_size - 1) // self.block_size)
            slots = min(self.num_blocks, base_blocks) * self.block_size
        else:
            slots = self.num_blocks * self.block_size
        dim = self.hyper.dim
        dev = self.device
        self.raw = torch.zeros(slots, dim, dtype=dtype, device=dev)
        self.pos = torch.zeros(slots, 4, dtype=torch.int32, device=dev)
        self.filled = torch.zeros(slots, dtype=torch.bool, device=dev)
        rows = slots // self.hyper.ratio
        # Unset / fp32 keeps the constructor dtype (fp32, or fp64 in tests).
        # INT8 allocates the pooled matrix as int8 plus one fp32 scale per row.
        self.pooled_key_dtype = pooled_key_dtype()
        if self.pooled_key_dtype == "int8":
            self.pooled = torch.zeros(rows, dim, dtype=torch.int8, device=dev)
            self.pooled_scale = torch.zeros(rows, dtype=torch.float32, device=dev)
        else:
            self.pooled = torch.zeros(rows, dim, dtype=dtype, device=dev)
            self.pooled_scale = None
        self.pool_valid = torch.zeros(rows, dtype=torch.bool, device=dev)

    @property
    def num_slots(self) -> int:
        return self.num_blocks * self.block_size

    def ensure_capacity(self, last_slot: int) -> None:
        """Grow physical storage to cover a slot, preserving pooled prefixes."""
        last_slot = int(last_slot)
        if last_slot < 0:
            return
        if last_slot >= self.num_slots:
            raise IndexError("indexer slot")
        current = int(self.raw.shape[0])
        if last_slot < current:
            return
        if not self.lazy:
            raise RuntimeError("indexer cache capacity")
        required_blocks = (last_slot + self.block_size) // self.block_size
        current_blocks = current // self.block_size
        blocks = min(self.num_blocks, max(required_blocks, current_blocks * 2))
        target = blocks * self.block_size

        def grow(tensor: torch.Tensor, shape: tuple[int, ...]) -> torch.Tensor:
            out = torch.zeros(shape, dtype=tensor.dtype, device=tensor.device)
            out[:tensor.shape[0]].copy_(tensor)
            return out

        self.raw = grow(self.raw, (target, self.hyper.dim))
        self.pos = grow(self.pos, (target, 4))
        self.filled = grow(self.filled, (target,))
        grown_rows = target // self.hyper.ratio
        self.pooled = grow(self.pooled, (grown_rows, self.hyper.dim))
        if self.pooled_scale is not None:
            self.pooled_scale = grow(self.pooled_scale, (grown_rows,))
        self.pool_valid = grow(self.pool_valid, (grown_rows,))

    def block_slice(self, block_id: int) -> slice:
        block_id = int(block_id)
        if block_id < 0 or block_id >= self.num_blocks:
            raise IndexError(block_id)
        start = block_id * self.block_size
        return slice(start, start + self.block_size)

    def write_token(
        self,
        slot: int,
        key: torch.Tensor,
        position: torch.Tensor,
        block_norm: torch.Tensor,
    ) -> None:
        """Store one raw key. Re-pool the micro-block once it is complete."""
        slot = int(slot)
        if slot < 0 or slot >= self.num_slots:
            raise IndexError(slot)
        self.ensure_capacity(slot)
        if tuple(key.shape) != (self.hyper.dim,):
            raise ValueError("indexer key shape %s" % (tuple(key.shape),))
        self.raw[slot] = key.to(dtype=self.raw.dtype, device=self.raw.device)
        self.pos[slot] = position.to(dtype=torch.int32, device=self.pos.device).reshape(4)
        self.filled[slot] = True
        self._maybe_pool(slot // self.hyper.ratio, block_norm)

    def write_tokens(
        self,
        slots: torch.Tensor,
        keys: torch.Tensor,
        positions: torch.Tensor,
        block_norm: torch.Tensor,
    ) -> None:
        """Store many raw keys. Negative slots are padding and are skipped.

        The pooled rows match ``write_token`` called in order. Duplicate slots
        take the last write, which is the same rule as that loop.
        """
        slots = slots.to(dtype=torch.int64, device=self.raw.device).reshape(-1)
        if keys.ndim != 2 or int(keys.shape[0]) != int(slots.shape[0]):
            raise ValueError("indexer keys are [tokens, dim]")
        if int(keys.shape[1]) != self.hyper.dim:
            raise ValueError("indexer key shape %s" % (tuple(keys.shape),))
        pos = positions.to(dtype=torch.int32, device=self.pos.device)
        if pos.ndim != 2 or int(pos.shape[0]) != int(slots.shape[0]) or int(pos.shape[1]) != 4:
            raise ValueError("indexer positions are [tokens, 4]")
        valid = slots >= 0
        idx = slots[valid]
        if int(idx.numel()) == 0:
            return
        self.ensure_capacity(int(idx.max()))
        key_rows = keys.to(dtype=self.raw.dtype, device=self.raw.device)[valid]
        pos_rows = pos[valid]
        if int(torch.unique(idx).numel()) != int(idx.numel()):
            for slot, key, one_pos in zip(idx.tolist(), key_rows, pos_rows):
                self.write_token(int(slot), key, one_pos, block_norm)
            return
        self.raw.index_copy_(0, idx, key_rows)
        self.pos.index_copy_(0, idx, pos_rows)
        self.filled.index_fill_(0, idx, True)
        ratio = self.hyper.ratio
        micros = torch.unique(torch.div(idx, ratio, rounding_mode="floor"))
        self._pool_micros(micros, block_norm)

    def _maybe_pool(self, micro: int, block_norm: torch.Tensor) -> None:
        self._pool_micros(
            torch.tensor([int(micro)], dtype=torch.int64, device=self.raw.device),
            block_norm,
        )

    def _pool_micros(self, micros: torch.Tensor, block_norm: torch.Tensor) -> None:
        """Re-pool these micro-blocks. An incomplete window clears ``pool_valid``."""
        if int(micros.numel()) == 0:
            return
        ratio = self.hyper.ratio
        micros = micros.to(dtype=torch.int64, device=self.raw.device).reshape(-1)
        offsets = torch.arange(ratio, device=self.raw.device)
        windows = micros.unsqueeze(1) * ratio + offsets
        complete = self.filled[windows].all(dim=1)
        self.pool_valid[micros] = complete
        if not bool(complete.any()):
            return
        raw = self.raw[windows[complete]]
        first = self.pos[windows[complete][:, 0]]
        pooled = pool_blocks(raw, block_norm, first, self.hyper)
        if self.pooled_scale is None:
            self.pooled[micros[complete]] = pooled.to(dtype=self.pooled.dtype)
        else:
            quantized, scales = quantize_pooled_rows(pooled)
            self.pooled[micros[complete]] = quantized
            self.pooled_scale[micros[complete]] = scales

    def copy_blocks(self, src_ids: list[int] | torch.Tensor, dst_ids: list[int] | torch.Tensor) -> None:
        """Copy whole physical blocks, including pooled micro-blocks inside them."""
        src = [int(x) for x in src_ids]
        dst = [int(x) for x in dst_ids]
        if len(src) != len(dst):
            raise ValueError("copy_blocks src/dst length")
        ratio = self.hyper.ratio
        micros = self.block_size // ratio
        for src_id, dst_id in zip(src, dst):
            if src_id == dst_id:
                continue
            self.ensure_capacity((max(src_id, dst_id) + 1) * self.block_size - 1)
            s = self.block_slice(src_id)
            d = self.block_slice(dst_id)
            self.raw[d] = self.raw[s]
            self.pos[d] = self.pos[s]
            self.filled[d] = self.filled[s]
            sm = slice(src_id * micros, (src_id + 1) * micros)
            dm = slice(dst_id * micros, (dst_id + 1) * micros)
            self.pooled[dm] = self.pooled[sm]
            if self.pooled_scale is not None:
                self.pooled_scale[dm] = self.pooled_scale[sm]
            self.pool_valid[dm] = self.pool_valid[sm]

    def logical_slots(
        self,
        block_row: torch.Tensor,
        tokens: torch.Tensor,
        pages_per_block: int,
    ) -> torch.Tensor:
        """Physical slots of logical tokens. Same map as the K8/V4 page table.

        ``block_row`` is one request's block table. A manager entry covers
        ``pages_per_block`` kernel pages. The indexer cache is addressed in
        tokens, with ``block_size`` tokens per physical block.
        """
        tokens = tokens.to(dtype=torch.int64, device=self.raw.device)
        row = block_row.to(dtype=torch.int64, device=self.raw.device).reshape(-1)
        if tokens.ndim != 1:
            raise ValueError("tokens must be a 1-D list of logical cells")
        ratio = int(pages_per_block)
        if ratio < 1:
            raise ValueError("pages_per_block")
        logical_page = torch.div(tokens, PAGE, rounding_mode="floor")
        offset = tokens.remainder(PAGE)
        if ratio == 1:
            page = row[logical_page]
        else:
            entry = torch.div(logical_page, ratio, rounding_mode="floor")
            sub = logical_page.remainder(ratio)
            page = row[entry] * ratio + sub
        pages_in_block = self.block_size // PAGE
        block_id = torch.div(page, pages_in_block, rounding_mode="floor")
        page_in_block = page.remainder(pages_in_block)
        return block_id * self.block_size + page_in_block * PAGE + offset

    def logical_slot(self, block_row: torch.Tensor, token: int, pages_per_block: int) -> int:
        """Physical slot of one logical token."""
        slots = self.logical_slots(
            block_row,
            torch.tensor([int(token)], dtype=torch.int64),
            pages_per_block,
        )
        return int(slots[0])

    def gather_blocks(
        self,
        block_row: torch.Tensor,
        count: int,
        pages_per_block: int,
    ) -> tuple[torch.Tensor, torch.Tensor]:
        """Pooled keys for logical blocks ``[0, count)`` and a validity mask.

        Row ``b`` is the micro-block that starts at logical token ``b * ratio``.
        A micro-block that is not complete is invalid. Callers must not treat
        an invalid row as a score of zero: the stored vector is uninitialized
        from the indexer's point of view.
        """
        count = int(count)
        if count < 1:
            empty = self.pooled[:0]
            if empty.dtype == torch.int8:
                empty = dequantize_pooled_rows(empty, self.pooled_scale[:0])
            return empty, self.pool_valid[:0]
        tokens = torch.arange(count, dtype=torch.int64) * self.hyper.ratio
        slots = self.logical_slots(block_row, tokens, pages_per_block)
        micros = torch.div(slots, self.hyper.ratio, rounding_mode="floor")
        selected = self.pooled.index_select(0, micros)
        if selected.dtype == torch.int8:
            selected = dequantize_pooled_rows(selected, self.pooled_scale.index_select(0, micros))
        return selected, self.pool_valid.index_select(0, micros)

    def pooled_row(self, block_row: torch.Tensor, cell: int, pages_per_block: int) -> torch.Tensor | None:
        """Pooled key of the micro-block that contains ``cell``, or None if it is open."""
        slot = self.logical_slot(block_row, int(cell), pages_per_block)
        micro = slot // self.hyper.ratio
        if not bool(self.pool_valid[micro]):
            return None
        row = self.pooled[micro]
        if row.dtype == torch.int8:
            row = dequantize_pooled_rows(row.unsqueeze(0), self.pooled_scale[micro:micro + 1]).squeeze(0)
        return row


class QsaCacheBank:
    """One ``QsaBlockCache`` per full-attention layer, created on first use."""

    def __init__(self, hyper: QsaHyper | None = None) -> None:
        self.hyper = hyper or QsaHyper()
        self.compact = os.environ.get('K8V4_QSA_COMPACT_TAIL','0') == '1'
        self.pooled_key_dtype = pooled_key_dtype()
        self.layers: dict[int, QsaBlockCache] = {}

    def layer(
        self,
        layer_idx: int,
        num_blocks: int,
        block_size: int,
        device: torch.device | str | None = None,
    ) -> QsaBlockCache:
        layer_idx = int(layer_idx)
        if self.compact != (os.environ.get('K8V4_QSA_COMPACT_TAIL','0') == '1'):
            raise RuntimeError('QSA cache storage mode changed after bank creation')
        if self.pooled_key_dtype != pooled_key_dtype():
            raise RuntimeError('QSA pooled key dtype changed after bank creation')
        current = self.layers.get(layer_idx)
        if current is None:
            if self.compact:
                dev = torch.device('cpu' if device is None else device)
                if dev.type != 'xpu' or dev.index is None:
                    raise RuntimeError('compact serving cache requires an explicit XPU index')
                from k8v4_v030.qsa_tail_cache import QsaXpuTailCache
                current = QsaXpuTailCache(num_blocks,block_size,hyper=self.hyper,device=device)
            else:
                current = QsaBlockCache(num_blocks, block_size, self.hyper, device=device)
            self.layers[layer_idx] = current
            return current
        if current.num_blocks != int(num_blocks) or current.block_size != int(block_size):
            raise RuntimeError(
                "QSA cache for layer %d was allocated %d x %d and is now %d x %d"
                % (layer_idx, current.num_blocks, current.block_size, num_blocks, block_size)
            )
        if device is not None and current.device != torch.device(device):
            raise RuntimeError(
                "QSA cache for layer %d is on %s and the forward is on %s"
                % (layer_idx, current.device, device)
            )
        return current

    def copy_blocks(self, src_ids, dst_ids) -> None:
        for cache in self.layers.values():
            cache.copy_blocks(src_ids, dst_ids)


_BANKS: dict[tuple[int, int], QsaCacheBank] = {}


def bank_for(num_kv_heads: int, hyper: QsaHyper | None = None) -> QsaCacheBank:
    """Process bank keyed by the local KV head count (2 on TP2, 4 on one GPU)."""
    # Head count does not change the indexer geometry. The key keeps two
    # ranks in one process from sharing a slot space they do not share.
    bank_key = (int(num_kv_heads), 0 if hyper is None else id(hyper))
    found = _BANKS.get(bank_key)
    if found is None:
        found = QsaCacheBank(hyper)
        _BANKS[bank_key] = found
    return found


def all_banks() -> list[QsaCacheBank]:
    return list(_BANKS.values())


def reset_caches() -> None:
    _BANKS.clear()
    clear_prepared()
