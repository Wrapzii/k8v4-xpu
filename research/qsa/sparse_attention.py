"""Block-sparse core attention and the QSA token mask."""

from __future__ import annotations

import math

import torch
import torch.nn.functional as F


def select_blocks(
    scores: torch.Tensor,
    valid: torch.Tensor,
    token_budget: int,
    block_size: int,
) -> torch.Tensor:
    """Pick the top-``ceil(K/r)`` fully observed blocks for every query.

    Args:
        scores: ``[B, T, nb]`` indexer scores (``-inf`` where invalid).
        valid: ``[B, T, nb]`` observation mask.
        token_budget: ``K`` in the paper.
        block_size: compression ratio ``r``.

    Returns:
        ``[B, T, kb]`` selected block ids (``kb = ceil(K/r)``, capped at ``nb``).
        Invalid picks (possible when a query sees fewer blocks than ``kb``) are
        still returned; :func:`build_sparse_mask` drops them via ``valid``.
    """
    nb = scores.shape[-1]
    if nb == 0:
        return torch.zeros(*scores.shape[:2], 0, dtype=torch.long, device=scores.device)
    kb = min(nb, math.ceil(token_budget / block_size))
    return torch.topk(scores, kb, dim=-1).indices


def build_sparse_mask(
    block_ids: torch.Tensor,
    valid: torch.Tensor,
    seq_len: int,
    block_size: int,
) -> torch.Tensor:
    """Expand selected blocks into a ``[B, T, T]`` boolean attention mask.

    A query ``t`` sees (a) every token of its selected blocks, (b) the tokens of
    its own incomplete block up to ``t`` ("tail tokens are always included"),
    and (c) only positions ``j <= t``.
    """
    b, t, _ = block_ids.shape
    device = block_ids.device
    r = block_size
    nb = seq_len // r  # block ids index the full block table, not just top-k

    onehot = torch.zeros(b, t, nb, dtype=torch.bool, device=device)
    onehot.scatter_(-1, block_ids, True)
    onehot = onehot & valid

    tok_block = torch.arange(t, device=device) // r
    in_complete = tok_block < nb
    safe_block = tok_block.clamp(max=max(nb - 1, 0))
    block_sel = onehot[:, :, safe_block] if nb > 0 else torch.zeros(b, t, t, dtype=torch.bool, device=device)
    block_sel = block_sel & in_complete[None, None, :]

    pos = torch.arange(t, device=device)
    causal = pos[None, :] <= pos[:, None]  # [t, t]
    tail = (tok_block[None, :] == tok_block[:, None]) & causal

    return (block_sel | tail) & causal


def qsa_attention(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    block_ids: torch.Tensor,
    valid: torch.Tensor,
    block_size: int,
    scale: float | None = None,
) -> torch.Tensor:
    """Core attention restricted to the QSA token mask.

    ``query``: ``[B, H, T, D]``; ``key``/``value``: ``[B, Hkv, T, D]``.
    """
    t = query.shape[-2]
    mask = build_sparse_mask(block_ids, valid, t, block_size).unsqueeze(1)
    return F.scaled_dot_product_attention(
        query,
        key,
        value,
        attn_mask=mask,
        dropout_p=0.0,
        scale=scale,
        enable_gqa=query.shape[1] != key.shape[1],
    )


def attention_mass_capture(
    attn_probs: torch.Tensor,
    block_ids: torch.Tensor,
    block_size: int,
) -> torch.Tensor:
    """Fraction of the teacher's attention mass inside the selected blocks.

    ``attn_probs`` is either ``[B, H, T, T]`` (head-summed internally) or
    ``[B, T, T]``. Returns ``[B, T]`` with ``nan`` for queries that see no
    complete block.
    """
    if attn_probs.dim() == 4:
        attn_probs = attn_probs.sum(1)
    b, t, _ = attn_probs.shape
    r = block_size
    nb = t // r
    if nb == 0:
        return torch.full((b, t), float("nan"), device=attn_probs.device)
    complete = attn_probs[:, :, : nb * r].reshape(b, t, nb, r).sum(-1)
    total = attn_probs.sum(-1).clamp_min(1e-12)
    selected = complete.gather(-1, block_ids).sum(-1)
    return selected / total
