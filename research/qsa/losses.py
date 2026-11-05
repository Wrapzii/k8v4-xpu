"""Dense-distillation losses for QSA indexer training (paper Eq. 17-20)."""

from __future__ import annotations

import torch


def pool_teacher_distribution(
    attn_probs: torch.Tensor,
    block_size: int,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Convert token-level teacher attention into block-level targets.

    ``attn_probs``: ``[B, H, T, T]`` or ``[B, T, T]``. Heads are summed, then
    each complete block is reduced with **max pooling** (paper Eq. 17), masked
    to fully observed blocks, and L1-normalized per query.

    Returns ``(target [B, T, nb], valid [T, nb])``.
    """
    if attn_probs.dim() == 4:
        attn_probs = attn_probs.sum(1)
    b, t, _ = attn_probs.shape
    r = block_size
    nb = t // r
    if nb == 0:
        return (
            attn_probs.new_zeros(b, t, 0),
            torch.zeros(t, 0, dtype=torch.bool, device=attn_probs.device),
        )

    blocks = attn_probs[:, :, : nb * r].reshape(b, t, nb, r)
    target = blocks.max(-1).values

    pos = torch.arange(t, device=attn_probs.device)
    starts = torch.arange(nb, device=attn_probs.device) * r
    valid = (starts[None, :] + r - 1) <= pos[:, None]

    target = target.masked_fill(~valid[None], 0.0)
    denom = target.sum(-1, keepdim=True)
    target = torch.where(denom > 0, target / denom.clamp_min(1e-12), target)
    return target, valid


def indexer_kl_from_target(
    scores: torch.Tensor,
    target: torch.Tensor,
    valid: torch.Tensor,
    block_ids: torch.Tensor | None = None,
) -> torch.Tensor:
    """KL(teacher blocks || softmax(indexer scores)) from precomputed targets.

    ``scores``/``target``: ``[B, T, nb]``; ``valid``: ``[T, nb]``.
    If ``block_ids`` is given, restrict the KL to those blocks and renormalize
    the teacher inside them (paper Eq. 20, Stage 2).
    """
    if scores.shape[-1] == 0:
        return scores.sum() * 0.0

    target = target.detach()
    if block_ids is not None:
        keep = torch.zeros_like(scores, dtype=torch.bool)
        keep.scatter_(-1, block_ids, True)
        keep = keep & valid[None]
        valid = keep[0]
        target = target * keep
        target = target / target.sum(-1, keepdim=True).clamp_min(1e-12)
        scores = scores.masked_fill(~keep, float("-inf"))

    logp = torch.log_softmax(scores, dim=-1)
    logp = torch.where(valid[None], logp, torch.zeros_like(logp))
    log_target = torch.where(
        target > 0, target.clamp_min(1e-12).log(), torch.zeros_like(target)
    )
    kl = torch.where(
        target > 0, target * (log_target - logp), torch.zeros_like(target)
    ).sum(-1)
    has_mass = valid.any(-1)[None] & (target.sum(-1) > 0)
    if not has_mass.any():
        return scores.sum() * 0.0
    return kl[has_mass].mean()


def indexer_kl_per_query(
    scores: torch.Tensor,
    target: torch.Tensor,
    valid: torch.Tensor,
) -> torch.Tensor:
    """Per-query KL (``[B, T]``) for weighting query regions during training."""
    target = target.detach()
    logp = torch.log_softmax(scores, dim=-1)
    logp = torch.where(valid[None], logp, torch.zeros_like(logp))
    log_target = torch.where(
        target > 0, target.clamp_min(1e-12).log(), torch.zeros_like(target)
    )
    kl = torch.where(
        target > 0, target * (log_target - logp), torch.zeros_like(target)
    ).sum(-1)
    return torch.where(valid.any(-1)[None], kl, torch.zeros_like(kl))


def indexer_kl_loss(
    scores: torch.Tensor,
    attn_probs: torch.Tensor,
    block_size: int,
    block_ids: torch.Tensor | None = None,
) -> torch.Tensor:
    """KL between the dense teacher attention and the indexer's block scores."""
    target, valid = pool_teacher_distribution(attn_probs, block_size)
    return indexer_kl_from_target(scores, target, valid, block_ids)
