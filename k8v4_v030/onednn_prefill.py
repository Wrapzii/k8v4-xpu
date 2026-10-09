"""Opt-in head-major prefill. Decode and the default eager path stay put.

One KV head is dequantized to fp16, scored over the full logical sequence,
then released. Queries are padded at the top to a multiple of ``Q_BUCKET``
so a bottom-right causal mask lines up with the tensor rows. Keys stay the
exact sequence length. ``K8V4_PREFILL=onednn`` selects this from the backend.
On XPU the score is the fused oneDNN op in ``libk8v4_sdpa.so``. The CPU
reference is only for tests; a missing library on XPU raises instead of
building the score matrix.
"""

from __future__ import annotations

import os

import torch

from k8v4_v030.dequant import gather_dequant_head
from k8v4_v030.layout import D, PageLayout
from k8v4_v030.stage_profile import profile_enabled, profile_range

Q_BUCKET = 256
_SDPA = None
_SDPA_TRIED = False


def prefill_mode() -> str:
    """``eager`` unless the process was started with ``K8V4_PREFILL=onednn``."""
    mode = os.environ.get("K8V4_PREFILL", "eager").strip().lower()
    if mode not in ("eager", "onednn"):
        raise RuntimeError("K8V4_PREFILL must be eager or onednn, got %s" % mode)
    return mode


def query_pad_rows(q_len: int, bucket: int = Q_BUCKET) -> int:
    q_len = int(q_len)
    bucket = int(bucket)
    if q_len <= 0:
        return 0
    if bucket < 1:
        raise RuntimeError("query bucket")
    return ((q_len + bucket - 1) // bucket) * bucket


def pad_queries_top(query: torch.Tensor, q_pad: int) -> torch.Tensor:
    """Pad ``query`` with zeros above the real rows. Real rows stay last."""
    q_len = int(query.shape[0])
    q_pad = int(q_pad)
    if q_pad < q_len:
        raise RuntimeError("pad shorter than the query")
    if q_pad == q_len:
        return query
    out = torch.zeros(
        (q_pad, query.shape[1], query.shape[2]),
        dtype=query.dtype,
        device=query.device,
    )
    out[q_pad - q_len :] = query
    return out


def try_load_sdpa():
    """Load ``K8V4_SDPA_LIB`` once. Missing file returns None."""
    global _SDPA, _SDPA_TRIED
    if _SDPA_TRIED:
        return _SDPA
    _SDPA_TRIED = True
    path = os.environ.get("K8V4_SDPA_LIB", "/opt/k8v4/libk8v4_sdpa.so")
    if not os.path.isfile(path):
        return None
    torch.ops.load_library(path)
    _SDPA = torch.ops.k8v4_sdpa
    return _SDPA


def sdpa_ops_for(device_type: str):
    """CPU uses the reference. Any other device requires the fused library."""
    if device_type == "cpu":
        return None
    ops = try_load_sdpa()
    if ops is None:
        raise RuntimeError(
            "oneDNN K8/V4 prefill needs K8V4_SDPA_LIB on %s; "
            "refusing to materialize the score matrix" % device_type
        )
    return ops


def score_group_reference(
    query_g: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
    len_k: int,
    len_q: int,
) -> torch.Tensor:
    """Bottom-right causal SDPA for one KV head.

    ``query_g`` is ``[len_q, G, D]``. ``key`` and ``value`` are ``[len_k, D]``.
    Row ``r`` attends to columns ``c`` where ``r + len_k - len_q >= c``.
    """
    len_k = int(len_k)
    len_q = int(len_q)
    if int(key.shape[0]) != len_k or int(value.shape[0]) != len_k:
        raise RuntimeError("keys must keep the exact logical length")
    if int(query_g.shape[0]) != len_q:
        raise RuntimeError("len_q must be the padded query rows")
    if len_q < 1 or len_k < 1:
        raise RuntimeError("empty sdpa")
    q = query_g.to(torch.float32)
    k = key.to(torch.float32)
    v = value.to(torch.float32)
    scores = torch.einsum("qgd,sd->gqs", q, k) * float(scale)
    rows = torch.arange(len_q, device=query_g.device)
    cols = torch.arange(len_k, device=query_g.device)
    allow = rows[:, None] + len_k - len_q >= cols[None, :]
    scores = scores.masked_fill(~allow.view(1, len_q, len_k), torch.finfo(torch.float32).min)
    probs = torch.softmax(scores, dim=-1)
    probs = torch.nan_to_num(probs, nan=0.0)
    out = torch.einsum("gqs,sd->qgd", probs, v)
    return out.to(dtype=query_g.dtype)


def _score_group_fused(ops, query_g, key, value, scale, len_k, len_q) -> torch.Tensor:
    q = query_g.transpose(0, 1).contiguous()
    k = key.view(1, int(len_k), D)
    v = value.view(1, int(len_k), D)
    out = torch.empty_like(q)
    ops.sdpa_len(q, k, v, out, float(scale), int(len_k), int(len_q))
    return out.transpose(0, 1).contiguous()


def score_one_group(
    query_g: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
    len_k: int,
    len_q: int,
) -> torch.Tensor:
    ops = sdpa_ops_for(query_g.device.type)
    if ops is None:
        return score_group_reference(query_g, key, value, scale, len_k, len_q)
    return _score_group_fused(ops, query_g, key, value, scale, len_k, len_q)


def head_major_attention(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
    bucket: int = Q_BUCKET,
) -> torch.Tensor:
    """Score already-dequantized K/V one KV head at a time.

    ``query`` is ``[q_len, HQ, D]`` and is the suffix of ``key``/``value``
    ``[seq_len, HKV, D]``. The head layout comes from those shapes.
    """
    # This path raised RuntimeError on origin/main; keep the type and add the
    # layout detail instead of letting PageLayout's ValueError escape.
    try:
        layout = PageLayout.for_heads(int(query.shape[1]), int(key.shape[1]))
    except ValueError as error:
        raise RuntimeError("head-major attention head shape: %s" % error) from error
    gqa = layout.gqa
    hq = layout.hq
    hkv = layout.hkv
    q_len = int(query.shape[0])
    seq_len = int(key.shape[0])
    if q_len == 0:
        return query
    if q_len > seq_len:
        raise RuntimeError("query longer than the KV sequence")
    q_pad = query_pad_rows(q_len, bucket)
    padded = pad_queries_top(query, q_pad)
    out = torch.empty((q_pad, hq, D), dtype=query.dtype, device=query.device)
    for head in range(hkv):
        qg = padded[:, head * gqa : (head + 1) * gqa, :]
        scored = score_one_group(
            qg, key[:, head, :], value[:, head, :], scale, seq_len, q_pad
        )
        out[:, head * gqa : (head + 1) * gqa, :] = scored
    if q_pad == q_len:
        return out
    return out[q_pad - q_len :].contiguous()


def head_major_prefill(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    pages_per_block: int,
    scale: float,
    bucket: int = Q_BUCKET,
) -> torch.Tensor:
    """Paged prefill. Each KV head is gathered, scored, and then freed."""
    # The bound views carry this rank's KV head count; the query must agree.
    layout = PageLayout(int(views["k"].shape[2]))
    if int(query.shape[1]) != layout.hq:
        raise RuntimeError(
            "query has %d heads, the K8/V4 cache holds %d"
            % (int(query.shape[1]), layout.hq)
        )
    gqa = layout.gqa
    q_len = int(query.shape[0])
    seq_len = int(seq_len)
    if q_len == 0:
        return query
    if q_len > seq_len:
        raise RuntimeError("query longer than the KV sequence")
    q_pad = query_pad_rows(q_len, bucket)
    padded = pad_queries_top(query, q_pad)
    out = torch.empty((q_pad, layout.hq, D), dtype=query.dtype, device=query.device)
    gather = gather_dequant_head
    gather_mode = os.environ.get("K8V4_PREFILL_GATHER", "torch")
    if gather_mode not in ("torch", "triton"):
        raise RuntimeError("K8V4_PREFILL_GATHER must be torch or triton")
    if gather_mode == "triton" and query.device.type == "xpu":
        from k8v4_v030.prefill_gather_triton import gather_dequant_head_fused
        gather = gather_dequant_head_fused
    for head in range(layout.hkv):
        if profile_enabled():
            with profile_range("attn_gather", "gather_dequant_head"):
                key, value = gather(
                    views, block_row, seq_len, head, pages_per_block, query.dtype
                )
            qg = padded[:, head * gqa : (head + 1) * gqa, :]
            with profile_range("attn_sdpa", "score_one_group"):
                scored = score_one_group(qg, key, value, scale, seq_len, q_pad)
        else:
            key, value = gather(
                views, block_row, seq_len, head, pages_per_block, query.dtype
            )
            qg = padded[:, head * gqa : (head + 1) * gqa, :]
            scored = score_one_group(qg, key, value, scale, seq_len, q_pad)
        out[:, head * gqa : (head + 1) * gqa, :] = scored
        del key, value
    if q_pad == q_len:
        return out
    return out[q_pad - q_len :].contiguous()
