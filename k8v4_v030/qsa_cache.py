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

import torch

from k8v4_v030.layout import PAGE
from k8v4_v030.qsa_ref import QsaHyper, pool_block


class QsaBlockCache:
    """Flat slot cache. ``block_size`` is the token width of one K8/V4 block."""

    def __init__(
        self,
        num_blocks: int,
        block_size: int,
        hyper: QsaHyper | None = None,
        dtype: torch.dtype = torch.float32,
    ) -> None:
        self.hyper = hyper or QsaHyper()
        self.block_size = int(block_size)
        self.num_blocks = int(num_blocks)
        if self.num_blocks < 1 or self.block_size < self.hyper.ratio:
            raise ValueError("indexer cache size")
        if self.block_size % self.hyper.ratio != 0:
            raise ValueError("block_size must be a multiple of the QSA ratio")
        if self.block_size % PAGE != 0:
            raise ValueError("block_size must be a multiple of the K8/V4 page")
        slots = self.num_blocks * self.block_size
        dim = self.hyper.dim
        self.raw = torch.zeros(slots, dim, dtype=dtype)
        self.pos = torch.zeros(slots, 4, dtype=torch.int32)
        self.filled = torch.zeros(slots, dtype=torch.bool)
        self.pooled = torch.zeros(slots // self.hyper.ratio, dim, dtype=dtype)
        self.pool_valid = torch.zeros(slots // self.hyper.ratio, dtype=torch.bool)

    @property
    def num_slots(self) -> int:
        return self.num_blocks * self.block_size

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
        if tuple(key.shape) != (self.hyper.dim,):
            raise ValueError("indexer key shape %s" % (tuple(key.shape),))
        self.raw[slot] = key.to(dtype=self.raw.dtype)
        self.pos[slot] = position.to(torch.int32).reshape(4)
        self.filled[slot] = True
        self._maybe_pool(slot // self.hyper.ratio, block_norm)

    def _maybe_pool(self, micro: int, block_norm: torch.Tensor) -> None:
        ratio = self.hyper.ratio
        start = int(micro) * ratio
        window = slice(start, start + ratio)
        if not bool(self.filled[window].all()):
            self.pool_valid[micro] = False
            return
        pooled = pool_block(self.raw[window], block_norm, self.pos[start], self.hyper)
        self.pooled[micro] = pooled.to(dtype=self.pooled.dtype)
        self.pool_valid[micro] = True

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
            s = self.block_slice(src_id)
            d = self.block_slice(dst_id)
            self.raw[d] = self.raw[s]
            self.pos[d] = self.pos[s]
            self.filled[d] = self.filled[s]
            sm = slice(src_id * micros, (src_id + 1) * micros)
            dm = slice(dst_id * micros, (dst_id + 1) * micros)
            self.pooled[dm] = self.pooled[sm]
            self.pool_valid[dm] = self.pool_valid[sm]

    def logical_slot(self, block_row: torch.Tensor, token: int, pages_per_block: int) -> int:
        """Physical slot of one logical token. Same map as the K8/V4 page table."""
        token = int(token)
        logical_page = token // PAGE
        offset = token % PAGE
        ratio = int(pages_per_block)
        if ratio < 1:
            raise ValueError("pages_per_block")
        if ratio == 1:
            page = int(block_row[logical_page])
        else:
            page = int(block_row[logical_page // ratio]) * ratio + (logical_page % ratio)
        pages_in_block = self.block_size // PAGE
        block_id = page // pages_in_block
        page_in_block = page % pages_in_block
        return block_id * self.block_size + page_in_block * PAGE + offset

    def pooled_row(self, block_row: torch.Tensor, cell: int, pages_per_block: int) -> torch.Tensor | None:
        """Pooled key of the micro-block that contains ``cell``, or None if it is open."""
        slot = self.logical_slot(block_row, int(cell), pages_per_block)
        micro = slot // self.hyper.ratio
        if not bool(self.pool_valid[micro]):
            return None
        return self.pooled[micro]


class QsaCacheBank:
    """One ``QsaBlockCache`` per full-attention layer, created on first use."""

    def __init__(self, hyper: QsaHyper | None = None) -> None:
        self.hyper = hyper or QsaHyper()
        self.layers: dict[int, QsaBlockCache] = {}

    def layer(self, layer_idx: int, num_blocks: int, block_size: int) -> QsaBlockCache:
        layer_idx = int(layer_idx)
        current = self.layers.get(layer_idx)
        if current is None:
            current = QsaBlockCache(num_blocks, block_size, self.hyper)
            self.layers[layer_idx] = current
            return current
        if current.num_blocks != int(num_blocks) or current.block_size != int(block_size):
            raise RuntimeError(
                "QSA cache for layer %d was allocated %d x %d and is now %d x %d"
                % (layer_idx, current.num_blocks, current.block_size, num_blocks, block_size)
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


def reset_caches() -> None:
    _BANKS.clear()
