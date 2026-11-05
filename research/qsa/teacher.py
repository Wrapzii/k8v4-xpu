"""Chunked block-level teacher targets from dense QK logits.

Materializing a full ``[B, H, T, T]`` softmax is too expensive for 27B-scale
distillation, so the teacher target is computed one query chunk at a time and
reduced to block maxima immediately (paper Eq. 17).
"""

from __future__ import annotations

import math

import torch


@torch.no_grad()
def block_teacher_from_qk(
    query: torch.Tensor,
    key: torch.Tensor,
    block_size: int,
    scale: float | None = None,
    query_chunk: int = 512,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Return ``(target [B, T, nb], valid [T, nb])`` from dense Q/K.

    ``query``/``key`` are ``[B, H, T, D]`` (expand GQA heads first). The teacher
    distribution is the softmax summed over heads, max-pooled over each complete
    key block, and L1-normalized per query.
    """
    b, h, t, d = query.shape
    r = block_size
    nb = t // r
    scale = scale if scale is not None else 1.0 / math.sqrt(d)

    pos = torch.arange(t, device=query.device)
    starts = torch.arange(nb, device=query.device) * r
    valid = (starts[None, :] + r - 1) <= pos[:, None]  # [T, nb]

    target = query.new_zeros(b, t, nb, dtype=torch.float32)
    if nb == 0:
        return target, valid

    for qs in range(0, t, query_chunk):
        qe = min(qs + query_chunk, t)
        logits = torch.matmul(query[:, :, qs:qe], key.transpose(-1, -2)) * scale
        causal = pos[None, :] <= pos[qs:qe, None]
        logits = logits.masked_fill(~causal, float("-inf"))
        probs = torch.softmax(logits.float(), dim=-1).sum(1)  # [B, Q, T]
        blocks = probs[:, :, : nb * r].reshape(b, qe - qs, nb, r).amax(-1)
        target[:, qs:qe] = blocks

    target = target.masked_fill(~valid[None], 0.0)
    denom = target.sum(-1, keepdim=True)
    target = torch.where(denom > 0, target / denom.clamp_min(1e-12), target)
    return target, valid


def block_valid(seq_len: int, block_size: int, device=None) -> torch.Tensor:
    """``[T, nb]`` mask of blocks that are fully observed at each query."""
    nb = seq_len // block_size
    if nb == 0:
        return torch.zeros(seq_len, 0, dtype=torch.bool, device=device)
    pos = torch.arange(seq_len, device=device)
    starts = torch.arange(nb, device=device) * block_size
    return (starts[None, :] + block_size - 1) <= pos[:, None]
