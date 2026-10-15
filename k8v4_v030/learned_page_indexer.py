"""Offline frozen-model page-indexer prototype; not a serving backend.

Separate parameters per FA layer and KV group. Cache projected page keys once;
score queries against the small side cache. Dense attention remains the teacher.
"""
import math

import torch
from torch import nn


def page_features(keys: torch.Tensor) -> torch.Tensor:
    """Dequantized [pages,64,kv,dim] -> [pages,kv,3*dim].

    The caller must not rank incomplete/future pages; retain those as mandatory.
    Features do not use values, teacher probabilities, or source page identities.
    """
    if keys.ndim != 4 or keys.shape[1] != 64:
        raise ValueError('expected 64-token pages')
    return torch.cat((keys.mean(1), keys.amin(1), keys.amax(1)), dim=-1)


class LearnedPageIndexer(nn.Module):
    def __init__(self, kv_heads=2, gqa=6, head_dim=256, rank=16):
        super().__init__()
        self.kv_heads, self.gqa, self.head_dim, self.rank = kv_heads, gqa, head_dim, rank
        self.query_projection = nn.ModuleList([nn.Linear(gqa * head_dim, rank, bias=False)
                                               for _ in range(kv_heads)])
        self.key_projection = nn.ModuleList([nn.Linear(3 * head_dim, rank, bias=False)
                                             for _ in range(kv_heads)])

    def project_pages(self, features):
        if features.shape[1:] != (self.kv_heads, 3 * self.head_dim):
            raise ValueError('page feature layout mismatch')
        return torch.stack([layer(features[:, group])
                            for group, layer in enumerate(self.key_projection)], dim=0)

    def score_projected(self, query, projected_keys):
        if query.shape[1:] != (self.kv_heads * self.gqa, self.head_dim):
            raise ValueError('query GQA layout mismatch')
        grouped = query.reshape(query.shape[0], self.kv_heads, self.gqa * self.head_dim)
        q = torch.stack([layer(grouped[:, group])
                         for group, layer in enumerate(self.query_projection)], dim=0)
        return torch.bmm(q, projected_keys.transpose(1, 2)).permute(1, 0, 2) / math.sqrt(self.rank)

    def forward(self, query, features):
        return self.score_projected(query, self.project_pages(features))


class CapacityPageIndexer(LearnedPageIndexer):
    """Matched normalized linear or MLP projection experiment, same side-cache rank."""
    def __init__(self, kv_heads=2, gqa=6, head_dim=256, rank=16, hidden=0):
        super().__init__(kv_heads, gqa, head_dim, rank)
        def projection(width):
            layers = [nn.LayerNorm(width, elementwise_affine=False)]
            if hidden:
                layers.extend((nn.Linear(width, hidden), nn.SiLU(), nn.Linear(hidden, rank, bias=False)))
            else:
                layers.append(nn.Linear(width, rank, bias=False))
            return nn.Sequential(*layers)
        self.query_projection = nn.ModuleList([projection(gqa * head_dim) for _ in range(kv_heads)])
        self.key_projection = nn.ModuleList([projection(3 * head_dim) for _ in range(kv_heads)])


def mass_and_ranking_loss(scores, dense_mass, ranking_weight=2.):
    """Dense mass KL plus weighted high-mass positives vs hard low-mass negatives.

    Teacher probabilities, not regressed heuristic scores. Mandatory pages are
    excluded from ranking. The held-out set is never used to choose negatives.
    """
    keep = ~mandatory_mask(scores.shape[-1], scores.device)
    logits, target = scores[..., keep], dense_mass[..., keep].float()
    target = target / target.sum(-1, keepdim=True).clamp_min(1e-20)
    kl = torch.nn.functional.kl_div(logits.log_softmax(-1), target, reduction='none').sum(-1).mean()
    count = min(8, logits.shape[-1] // 2)
    if count == 0:
        return kl, kl.detach(), kl.detach() * 0
    positive = target.topk(count, -1).indices
    excluded = target.topk(max(count, math.ceil(target.shape[-1] * .2)), -1).indices
    negative_logits = logits.scatter(-1, excluded, -float('inf'))
    negative = negative_logits.topk(count, -1).values
    positive_logits = logits.gather(-1, positive)
    weights = target.gather(-1, positive)
    weights = weights / weights.sum(-1, keepdim=True).clamp_min(1e-20)
    pair = torch.nn.functional.softplus(1 + negative[..., None, :] - positive_logits[..., :, None])
    ranking = (pair.mean(-1) * weights).sum(-1).mean()
    return kl + ranking_weight * ranking, kl.detach(), ranking.detach()


def mandatory_mask(pages, device=None, recent=8):
    if pages < 1:
        raise ValueError('empty history')
    result = torch.zeros(pages, dtype=torch.bool, device=device)
    result[0] = True
    result[-recent:] = True
    return result


def select_pages(scores, fraction, recent=8):
    """Fixed-shape [queries,kv,K] logical page IDs, independently per row.

    Mandatory sink/recent pages count toward the actual budget. No CPU tensor
    reads, unique union, or physical-page assumptions. Serving needs preallocation.
    """
    if scores.ndim != 3 or not 0 < fraction <= 1:
        raise ValueError('invalid score layout or budget')
    pages = scores.shape[-1]
    count = min(pages, max(math.ceil(pages * fraction), min(pages, recent + 1)))
    forced = scores.masked_fill(mandatory_mask(pages, scores.device, recent), float('inf'))
    return forced.topk(count, dim=-1).indices.sort(-1).values


def page_ids_to_token_indices(page_ids, query_ends, sequence_length):
    """Expand logical 64-token pages, pad future tokens with -1 on the device."""
    if page_ids.ndim != 3 or query_ends.shape != (page_ids.shape[0],):
        raise ValueError('indices/query endpoint layout mismatch')
    offsets = torch.arange(64, device=page_ids.device)
    tokens = (page_ids[..., None] * 64 + offsets).flatten(-2)
    valid = (tokens >= 0) & (tokens < sequence_length) & (tokens < query_ends[:, None, None])
    return torch.where(valid, tokens, -1).to(torch.int32)


def merge_attention_states(left, left_lse, right, right_lse):
    """Exact softmax decomposition in real arithmetic; no sparsity/pruning.

    Empty partitions have LSE=-inf. Callers must supply zero outputs for them.
    Floating-point kernel implementations still require numerical validation.
    """
    lse = torch.logaddexp(left_lse, right_lse)
    safe = torch.where(torch.isfinite(lse), lse, torch.zeros_like(lse))
    a = torch.exp(left_lse - safe)
    b = torch.exp(right_lse - safe)
    return left * a[..., None] + right * b[..., None], lse
