"""Experimental Quest-style index for K8/V4; never enabled by the serving backend.

This is approximate attention, not cache eviction. Original pages remain intact.
The index is per snapshot: callers must rebuild/update it after KV writes or COW.
Bounds refer to the dequantized K8 keys, not the original pre-quantization keys.
"""
from __future__ import annotations

import dataclasses
import math
import torch


def group_page_scores(scores: torch.Tensor, gqa: int = 6, mode: str = 'max',
                      weights: torch.Tensor | None = None,
                      normalize: bool = False) -> torch.Tensor:
    """One ranking per query/KV group, [Q,KVH,P]; not a union of six lists."""
    if scores.ndim != 3 or gqa < 1 or scores.shape[1] % gqa:
        raise ValueError('scores [Q,QH,P] and GQA ratio')
    if normalize:
        # Avoid letting a head's additive logit offset dominate shared ranking.
        # This is an estimated page distribution, not certified true page mass.
        scores = scores.softmax(-1)
    grouped = scores.reshape(scores.shape[0], -1, gqa, scores.shape[-1])
    if mode == 'max':
        return grouped.amax(2)
    if mode == 'top2':
        return grouped.topk(min(2, gqa), dim=2).values.mean(2)
    if mode == 'weighted':
        if weights is None or weights.shape != scores.shape[:2]:
            raise ValueError('weights [Q,QH] required')
        if not bool(torch.isfinite(weights).all()) or bool((weights < 0).any()):
            raise ValueError('finite nonnegative weights')
        w = weights.reshape(scores.shape[0], -1, gqa, 1)
        w = w / w.sum(2, keepdim=True).clamp_min(1e-12)
        return (grouped*w).sum(2)
    raise ValueError('unknown group ranking')


def dimension_page_scores(query: torch.Tensor, keys: torch.Tensor, scales: torch.Tensor,
                          length: int, dimensions: int = 32) -> torch.Tensor:
    """SparQ-inspired GQA dimension scan, returning [Q,QH,P] page estimates.

    Select channels by summed query magnitude within a KV group, then score
    actual keys in those channels. No V data is read. This eager reference
    implementation does not claim coalesced memory transactions or SparQ's
    published throughput; our packed K is not a transposed key index.
    """
    if keys.ndim != 4 or scales.shape != keys.shape[:3]:
        raise ValueError('keys/scales shape')
    pages, size, heads, dims = keys.shape
    if not 0 < length <= pages*size or math.ceil(length/size) != pages:
        raise ValueError('active logical pages')
    if query.ndim != 3 or query.shape[1] % heads or query.shape[-1] != dims:
        raise ValueError('GQA query shape')
    if not 1 <= dimensions <= dims:
        raise ValueError('dimensions')
    q = query.float().reshape(query.shape[0], heads, -1, dims)
    important = q.abs().sum(dim=(0, 2)).topk(dimensions, -1).indices
    valid = torch.arange(pages*size, device=keys.device).reshape(pages, size) < length
    result = []
    for head in range(heads):
        qsmall = q[:, head].index_select(-1, important[head])
        ksmall = keys[:, :, head].index_select(-1, important[head]).float()
        ksmall = ksmall * scales[:, :, head, None]
        # Mask dirty padded metadata before dot products (0 * NaN is NaN).
        ksmall = ksmall.masked_fill(~valid[:, :, None], 0)
        scores = torch.einsum('qgd,psd->qgps', qsmall, ksmall) / math.sqrt(dims)
        scores = scores.masked_fill(~valid[None, None, :, :], -float('inf')).amax(-1)
        result.append(scores)
    return torch.stack(result, dim=1).reshape(query.shape[0], query.shape[1], pages)


@dataclasses.dataclass(frozen=True)
class QueryPageIndex:
    minimum: torch.Tensor  # [pages, KV heads, dimensions], fp32
    maximum: torch.Tensor
    length: int
    page_size: int = 64

    @classmethod
    def build(cls, keys: torch.Tensor, scales: torch.Tensor, length: int,
              chunk_pages: int = 32) -> 'QueryPageIndex':
        if keys.ndim != 4 or scales.shape != keys.shape[:3]:
            raise ValueError('keys [P,S,H,D], scales [P,S,H]')
        pages, page_size, _, _ = keys.shape
        if not 0 < length <= pages * page_size or pages != math.ceil(length / page_size):
            raise ValueError('only active logical pages, including the partial tail, are allowed')
        if keys.dtype != torch.int8 or scales.dtype != torch.float32:
            raise ValueError('K8 keys and fp32 scales required')
        if chunk_pages < 1:
            raise ValueError('chunk_pages')
        lows, highs = [], []
        for first in range(0, pages, chunk_pages):
            last = min(first + chunk_pages, pages)
            dequant = keys[first:last].float() * scales[first:last, ..., None]
            positions = torch.arange(first * page_size, last * page_size, device=keys.device)
            valid = positions.reshape(-1, page_size, 1, 1) < length
            # Dirty tail scales can be NaN. Mask after multiplication, before reduction.
            lows.append(dequant.masked_fill(~valid, float('inf')).amin(dim=1))
            highs.append(dequant.masked_fill(~valid, -float('inf')).amax(dim=1))
        minimum, maximum = torch.cat(lows), torch.cat(highs)
        if not bool(torch.isfinite(minimum).all() & torch.isfinite(maximum).all()):
            raise ValueError('non-finite valid key metadata; full attention is required')
        return cls(minimum, maximum, int(length), page_size)

    def score_bounds(self, query: torch.Tensor) -> torch.Tensor:
        """[Q,QH,P] dot-product upper estimates; fp32 rounding is not a certificate."""
        pages, heads, dims = self.minimum.shape
        if query.ndim != 3 or query.shape[-1] != dims or query.shape[1] % heads:
            raise ValueError('query [Q,QH,D] must use an integer GQA ratio')
        if query.device != self.minimum.device or not bool(torch.isfinite(query).all()):
            raise ValueError('query device/finite values')
        q = query.float().reshape(query.shape[0], heads, query.shape[1] // heads, dims)
        upper = (torch.einsum('qhgd,phd->qhgp', q.clamp_min(0), self.maximum)
                 + torch.einsum('qhgd,phd->qhgp', q.clamp_max(0), self.minimum)) / math.sqrt(dims)
        return upper.reshape(query.shape[0], query.shape[1], pages)

    def select(self, query: torch.Tensor, fraction: float, sink_pages: int = 1,
               recent_pages: int = 8) -> torch.Tensor:
        """Sorted union of top pages for every Q/head, plus mandatory sink/recent pages.

        The union can exceed ``fraction`` substantially. We report actual pages,
        never call the nominal per-head budget the amount of KV traffic saved.
        One shared table lets the existing exact native op evaluate selected KV.
        """
        if not 0 < fraction <= 1 or sink_pages < 0 or recent_pages < 0:
            raise ValueError('selection budget')
        pages = self.minimum.shape[0]
        if fraction == 1:
            return torch.arange(pages, dtype=torch.long, device=query.device)
        scores = self.score_bounds(query)
        count = max(1, math.ceil(pages * fraction))
        chosen = scores.topk(count, dim=-1).indices.reshape(-1)
        mandatory = torch.cat((torch.arange(min(pages, sink_pages), device=query.device),
                               torch.arange(max(0, pages-recent_pages), pages, device=query.device)))
        return torch.unique(torch.cat((chosen, mandatory)), sorted=True)

    def compact_length(self, selected: torch.Tensor, q_len: int) -> int:
        """Remap causal lengths while preserving every page containing live queries.

        RoPE is already stored in K and Q: never rebase positions or requantize K.
        This host-validation method is for the offline prototype, not graph capture.
        """
        ids = selected.detach().cpu().tolist()
        if not ids or ids != sorted(set(ids)) or ids[0] < 0 or ids[-1] >= self.minimum.shape[0]:
            raise ValueError('selected logical pages must be sorted, unique and in range')
        if not 1 <= q_len <= self.length:
            raise ValueError('q_len')
        mandatory = set(range((self.length-q_len) // self.page_size, math.ceil(self.length/self.page_size)))
        if not mandatory.issubset(ids):
            raise ValueError('all query/tail pages must remain to preserve causal visibility')
        return self.length - (self.minimum.shape[0]-len(ids)) * self.page_size
