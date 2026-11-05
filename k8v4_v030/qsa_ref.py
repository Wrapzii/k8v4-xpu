"""PyTorch reference for the Qwen3.8 indexer and for fp sparse attention.

The fast path in the llama.cpp fork scores a block as the sum over the
four indexer heads of ``relu(q · k_block)``. There is no ``1/sqrt(dim)``
on that path. Pooling is the mean of four raw keys, then the block
RMSNorm, then MRoPE at the first token of the block. The query is
RMSNorm'd and MRoPE'd at its own position. Raw keys are RMSNorm'd and
stored without RoPE.

``fp_gqa`` is the dense-math twin of the sparse kernel: same visible
tokens, fp64 dots, no K8/V4 quantization. The quantized twin that must
match the K8/V4 oracle lives in ``qsa_quant_attn``.
"""

from __future__ import annotations

import dataclasses

import torch

from k8v4_v030.qsa_config import (
    FULL_ATTN_INTERVAL,
    HIDDEN,
    IDX_DIM,
    IDX_HEADS,
    INV_SQRT_ATTN,
    N_LAYERS,
    N_ROT,
    RATIO,
    RMS_EPS,
    ROPE_THETA,
    SECTIONS,
    top_tokens,
)
from k8v4_v030.qsa_rope import mrope, normalize_positions


@dataclasses.dataclass(frozen=True)
class QsaHyper:
    heads: int = IDX_HEADS
    dim: int = IDX_DIM
    hidden: int = HIDDEN
    ratio: int = RATIO
    top_tokens: int = 0  # 0 means the live env/default budget
    eps: float = RMS_EPS
    n_rot: int = N_ROT
    sections: tuple[int, int, int, int] = SECTIONS
    theta: float = ROPE_THETA
    n_layers: int = N_LAYERS
    interval: int = FULL_ATTN_INTERVAL

    @property
    def budget(self) -> int:
        return int(self.top_tokens) if self.top_tokens else top_tokens()

    @property
    def n_sel(self) -> int:
        budget = self.budget
        if budget % self.ratio != 0:
            raise ValueError("token budget must be a multiple of the block ratio")
        return budget // self.ratio


def _compute_dtype(values: torch.Tensor) -> torch.dtype:
    """CPU reference math is fp64. XPU has no fast fp64, so the device path is fp32."""
    if values.device.type == "cpu":
        return torch.float64
    return torch.float32


def rmsnorm(values: torch.Tensor, weight: torch.Tensor, eps: float = RMS_EPS) -> torch.Tensor:
    """``x * rsqrt(mean(x^2) + eps) * weight`` over the last dimension."""
    work = _compute_dtype(values)
    x = values.to(work)
    w = weight.to(dtype=work, device=x.device)
    var = x.pow(2).mean(dim=-1, keepdim=True)
    return x * torch.rsqrt(var + float(eps)) * w


def project_indexer(
    hidden: torch.Tensor,
    q_proj: torch.Tensor,
    k_proj: torch.Tensor,
    q_norm: torch.Tensor,
    k_norm: torch.Tensor,
    hyper: QsaHyper | None = None,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Return ``(q, k_raw)`` with q ``[tokens, heads, dim]`` and k ``[tokens, dim]``.

    Projections are HF linear weights ``[out, in]``. Norms are the real
    multipliers, not the ggml ``weight + 1`` form. RoPE is not applied.
    """
    hyper = hyper or QsaHyper()
    if hidden.ndim != 2 or int(hidden.shape[1]) != hyper.hidden:
        raise ValueError("hidden must be [tokens, %d]" % hyper.hidden)
    work = _compute_dtype(hidden)
    h = hidden.to(work)
    q = h @ q_proj.to(dtype=work, device=h.device).transpose(0, 1)
    q = q.reshape(h.shape[0], hyper.heads, hyper.dim)
    q = rmsnorm(q, q_norm, hyper.eps)
    k = h @ k_proj.to(dtype=work, device=h.device).transpose(0, 1)
    k = rmsnorm(k, k_norm, hyper.eps)
    return q, k


def apply_q_rope(
    query: torch.Tensor,
    pos: torch.Tensor,
    hyper: QsaHyper | None = None,
) -> torch.Tensor:
    """MRoPE each indexer query head. ``query`` is ``[tokens, heads, dim]``."""
    hyper = hyper or QsaHyper()
    if query.ndim != 3:
        raise ValueError("indexer q is [tokens, heads, dim]")
    tokens, heads, dim = query.shape
    pos4 = normalize_positions(pos, int(tokens))
    flat = query.reshape(int(tokens) * int(heads), int(dim))
    pos_flat = pos4.unsqueeze(1).expand(int(tokens), int(heads), 4).reshape(-1, 4)
    rotated = mrope(flat, pos_flat, hyper.n_rot, hyper.sections, hyper.theta)
    return rotated.reshape(int(tokens), int(heads), int(dim))


def pool_block(
    raw_keys: torch.Tensor,
    block_norm: torch.Tensor,
    first_pos: torch.Tensor,
    hyper: QsaHyper | None = None,
) -> torch.Tensor:
    """Mean-pool ``[ratio, dim]`` raw keys, block-norm, MRoPE at ``first_pos``."""
    hyper = hyper or QsaHyper()
    if raw_keys.ndim != 2 or int(raw_keys.shape[0]) != hyper.ratio:
        raise ValueError("a block is %d raw keys" % hyper.ratio)
    if int(raw_keys.shape[1]) != hyper.dim:
        raise ValueError("indexer dim")
    mean = raw_keys.to(_compute_dtype(raw_keys)).mean(dim=0)
    normed = rmsnorm(mean, block_norm, hyper.eps)
    pos4 = first_pos.to(torch.int64).reshape(1, 4)
    return mrope(normed.unsqueeze(0), pos4, hyper.n_rot, hyper.sections, hyper.theta).squeeze(0)


def finish_selection(
    chosen: list[int],
    cell: int,
    hyper: QsaHyper | None = None,
) -> tuple[list[int], int]:
    """Sort ``chosen``, add the query's own block once, and report its visible width."""
    hyper = hyper or QsaHyper()
    ratio = hyper.ratio
    cell = int(cell)
    own = cell // ratio
    width = cell % ratio + 1
    blocks = [int(block) for block in chosen]
    if own not in blocks:
        blocks.append(own)
    return sorted(set(blocks)), width


def score_blocks(query: torch.Tensor, pooled: torch.Tensor) -> torch.Tensor:
    """Sum of per-head ``relu(q · k)``.

    ``query`` is ``[heads, dim]`` or ``[tokens, heads, dim]``. ``pooled`` is
    ``[blocks, dim]``. The leading dimension of the result is the queries.
    """
    q = query.to(torch.float64)
    k = pooled.to(dtype=torch.float64, device=q.device)
    if q.ndim == 2:
        dots = k @ q.transpose(0, 1)
        return torch.relu(dots).sum(dim=-1)
    if q.ndim == 3:
        dots = torch.einsum("thd,bd->thb", q, k)
        return torch.relu(dots).sum(dim=1)
    raise ValueError("query rank %d" % q.ndim)


def topk_block_ids(scores: torch.Tensor, k: int) -> list[int]:
    """Largest scores. Equal scores keep the lower block id."""
    n = int(scores.shape[0])
    if k < 1:
        raise ValueError("k")
    if n <= k:
        return list(range(n))
    values = scores.detach().to(torch.float64).cpu().tolist()
    order = sorted(range(n), key=lambda i: (-float(values[i]), i))
    return order[: int(k)]


def complete_blocks(cell: int, ratio: int = RATIO) -> int:
    """How many 4-token blocks end at or before this token cell."""
    if cell < 0:
        raise ValueError("cell")
    return (int(cell) + 1) // int(ratio)


def select_blocks(
    scores: torch.Tensor,
    cell: int,
    hyper: QsaHyper | None = None,
    force_all: bool = False,
) -> tuple[list[int], int]:
    """Block ids to attend, ascending, and how many tokens of the own block are visible.

    ``scores`` covers at least the complete blocks. Incomplete tail blocks
    are not scored. The own block is always included. ``force_all`` keeps
    every causal block, which is also what a short context does on its own
    once the complete-block count is within the budget.
    """
    hyper = hyper or QsaHyper()
    ratio = hyper.ratio
    cell = int(cell)
    count = complete_blocks(cell, ratio)
    if int(scores.shape[0]) < count:
        raise ValueError("scores cover %d blocks, cell needs %d" % (int(scores.shape[0]), count))
    if force_all or count <= hyper.n_sel:
        chosen = list(range(count))
    else:
        chosen = topk_block_ids(scores[:count], hyper.n_sel)
    return finish_selection(chosen, cell, hyper)


def visible_tokens(cell: int, block_ids: list[int], width: int, ratio: int = RATIO) -> list[int]:
    """Absolute token cells the sparse kernel reads, in increasing order.

    Every selected block except the query's own block contributes ``ratio``
    tokens. The own block contributes ``width`` tokens (1..ratio). Tokens
    past ``cell`` are dropped, so a duplicated own block is not attended twice.
    """
    cell = int(cell)
    own = cell // int(ratio)
    seen: list[int] = []
    for block in sorted(set(int(b) for b in block_ids)):
        span = int(width) if block == own else int(ratio)
        start = block * int(ratio)
        for offset in range(span):
            token = start + offset
            if token <= cell:
                seen.append(token)
    return seen


def cells_for_queries(seq_len: int, q_len: int) -> list[int]:
    """Token cell of each query. Query 0 is the oldest of this step."""
    seq_len = int(seq_len)
    q_len = int(q_len)
    if q_len < 1 or seq_len < q_len:
        raise ValueError("seq_len %d does not cover q_len %d" % (seq_len, q_len))
    return [seq_len - q_len + j for j in range(q_len)]


def fp_gqa(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    visible: list[list[int]],
    scale: float = INV_SQRT_ATTN,
) -> torch.Tensor:
    """Fp64 GQA over an explicit token list per query.

    ``query`` is ``[q_len, hq, dim]``, key and value are ``[seq, hkv, dim]``.
    Query head ``h`` reads KV head ``h // (hq / hkv)``. An empty visible list
    yields a zero row.
    """
    if query.ndim != 3 or key.ndim != 3 or value.ndim != 3:
        raise ValueError("fp_gqa expects [q, hq, d], [s, hkv, d], [s, hkv, d]")
    if len(visible) != int(query.shape[0]):
        raise ValueError("one visible list per query")
    q = query.to(torch.float64)
    k = key.to(torch.float64)
    v = value.to(torch.float64)
    hq = int(q.shape[1])
    hkv = int(k.shape[1])
    if hq % hkv != 0:
        raise ValueError("hq %d is not a multiple of hkv %d" % (hq, hkv))
    group = hq // hkv
    out = torch.zeros_like(q)
    for qi, tokens in enumerate(visible):
        if not tokens:
            continue
        idx = torch.tensor(tokens, dtype=torch.long)
        kk = k.index_select(0, idx)
        vv = v.index_select(0, idx)
        for head in range(hq):
            kv_head = head // group
            scores = (kk[:, kv_head, :] * q[qi, head]).sum(dim=-1) * float(scale)
            peak = scores.max()
            weight = torch.exp(scores - peak)
            denom = weight.sum()
            if float(denom) == 0.0:
                continue
            weight = weight / denom
            out[qi, head] = (weight.unsqueeze(-1) * vv[:, kv_head, :]).sum(dim=0)
    return out
