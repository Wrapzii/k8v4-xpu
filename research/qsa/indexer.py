"""Compressed MQA indexer used by QSA."""

from __future__ import annotations

import math

import torch
from torch import nn


def rms_norm(x: torch.Tensor, weight: torch.Tensor | None, eps: float = 1e-6,
             zero_centered: bool = True) -> torch.Tensor:
    """RMSNorm over the last dimension.

    Qwen3.8-Next describes the indexer norms as "zero-centered": the learnable
    scale is ``1 + weight`` with ``weight`` initialized to zero. Set
    ``zero_centered=False`` for a standard RMSNorm.
    """
    var = x.float().pow(2).mean(-1, keepdim=True)
    x = x * torch.rsqrt(var + eps)
    x = x.to(weight.dtype) if weight is not None else x
    if weight is None:
        return x
    w = 1.0 + weight if zero_centered else weight
    return x * w


def rotate_half(x: torch.Tensor) -> torch.Tensor:
    x1, x2 = x.chunk(2, dim=-1)
    return torch.cat((-x2, x1), dim=-1)


def apply_partial_rope(x: torch.Tensor, cos: torch.Tensor, sin: torch.Tensor,
                       rope_dim: int) -> torch.Tensor:
    """Rotate the first ``rope_dim`` channels of ``x``.

    ``x``: ``[..., dim]``; ``cos``/``sin``: ``[..., rope_dim]`` aligned with the
    token (or block) positions of those rows.
    """
    if rope_dim <= 0:
        return x
    x_rope, x_pass = x[..., :rope_dim], x[..., rope_dim:]
    x_rope = x_rope * cos + rotate_half(x_rope) * sin
    return torch.cat((x_rope, x_pass), dim=-1)


class QSAIndexer(nn.Module):
    """MQA indexer with H query heads, one shared key head, and block pooling.

    Args:
        hidden_size: backbone hidden width.
        num_heads: number of indexer query heads (``H`` in the paper).
        head_dim: indexer head width (128 in Qwen3.8-Next).
        rope_dim: channels receiving partial RoPE (64 in Qwen3.8-Next).
        block_size: key compression ratio ``r`` (4 in Qwen3.8-Next).
        norm_eps: RMSNorm epsilon.
        zero_centered_norm: use ``1 + weight`` scaling.
    """

    def __init__(
        self,
        hidden_size: int,
        num_heads: int = 4,
        head_dim: int = 128,
        rope_dim: int = 64,
        block_size: int = 4,
        norm_eps: float = 1e-6,
        zero_centered_norm: bool = True,
        logit_scale: float = 1.0,
    ) -> None:
        super().__init__()
        if rope_dim % 2 != 0 or rope_dim > head_dim:
            raise ValueError("rope_dim must be even and <= head_dim")
        self.hidden_size = hidden_size
        self.num_heads = num_heads
        self.head_dim = head_dim
        self.rope_dim = rope_dim
        self.block_size = block_size
        self.norm_eps = norm_eps
        self.zero_centered_norm = zero_centered_norm
        self.logit_scale = logit_scale

        self.q_proj = nn.Linear(hidden_size, num_heads * head_dim, bias=False)
        self.k_proj = nn.Linear(hidden_size, head_dim, bias=False)
        self.q_norm = nn.Parameter(torch.zeros(head_dim))
        self.k_norm = nn.Parameter(torch.zeros(head_dim))
        self.k_block_norm = nn.Parameter(torch.zeros(head_dim))

    def _norm(self, x: torch.Tensor, weight: torch.Tensor) -> torch.Tensor:
        return rms_norm(x, weight, self.norm_eps, self.zero_centered_norm)

    def forward(self, hidden_states: torch.Tensor, cos: torch.Tensor,
                sin: torch.Tensor) -> tuple[torch.Tensor, torch.Tensor]:
        """Score key blocks for every query token.

        Args:
            hidden_states: ``[batch, seq, hidden]`` layer input.
            cos, sin: ``[seq, rope_dim]`` rotary tables for token positions.

        Returns:
            scores: ``[batch, seq, n_blocks]`` block importance (block-causal
                masked to ``-inf`` where a block is not fully observed).
            valid: ``[batch, seq, n_blocks]`` boolean observation mask.
        """
        b, t, _ = hidden_states.shape
        r = self.block_size
        n_blocks = t // r  # incomplete tail block is excluded from scoring

        q = self.q_proj(hidden_states).view(b, t, self.num_heads, self.head_dim)
        k = self.k_proj(hidden_states).view(b, t, 1, self.head_dim)

        q = self._norm(q, self.q_norm)
        k = self._norm(k, self.k_norm)

        cos = cos.to(q.dtype)
        sin = sin.to(q.dtype)
        q = apply_partial_rope(q, cos[None, :, None, :], sin[None, :, None, :], self.rope_dim)

        if n_blocks == 0:
            empty = hidden_states.new_zeros(b, t, 0)
            return empty, torch.zeros(b, t, 0, dtype=torch.bool, device=hidden_states.device)

        # Average-pool complete key blocks, then normalize and rotate with the
        # block start position (pooling before RoPE; see paper Eq. 13-14).
        k_blocks = k[:, : n_blocks * r, 0].reshape(b, n_blocks, r, self.head_dim).mean(2)
        k_blocks = self._norm(k_blocks, self.k_block_norm)
        block_pos = torch.arange(n_blocks, device=hidden_states.device) * r
        k_blocks = apply_partial_rope(
            k_blocks,
            cos[block_pos][None, :, :],
            sin[block_pos][None, :, :],
            self.rope_dim,
        )

        # [b, t, H, d] x [b, nb, d] -> [b, t, H, nb], rectified per head, summed.
        logits = torch.einsum("bthd,bnd->bhtn", q, k_blocks)
        scores = torch.relu(logits).sum(1) * self.logit_scale

        pos = torch.arange(t, device=hidden_states.device)
        block_starts = torch.arange(n_blocks, device=hidden_states.device) * r
        valid = (block_starts[None, :] + r - 1) <= pos[:, None]  # [t, nb]
        valid = valid.unsqueeze(0).expand(b, -1, -1)
        scores = scores.masked_fill(~valid, float("-inf"))
        return scores, valid
