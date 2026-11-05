"""Quantized sparse GQA that matches ``oracle.causal_gqa`` on a full allow-set.

K is symmetric int8, V is affine int4, Q is quantized per head with the
same rounding as the store. The score is the integer dot times the two
scales over ``sqrt(256)``. Tokens are visited in increasing order, which
is the oracle's order, so a full causal allow-set reproduces the dense
K8/V4 output bit for bit.

The packed reader uses the page views the dense kernel reads: INT8 K and
INT4 V, low nibble on the even dimension.
"""

from __future__ import annotations

import torch

from k8v4_v030.dequant import physical_pages
from k8v4_v030.layout import D, GQA, PAGE, PageLayout, builtin_q_end
from k8v4_v030.oracle import _dot, _softmax, dequant_v, quant_k, quant_v
from k8v4_v030.qsa_config import INV_SQRT_ATTN


def quantize_kv(
    key: list[list[list[float]]],
    value: list[list[list[float]]],
    seq_len: int,
) -> tuple[list, list, PageLayout]:
    """Per-token packed K and dequantized V, same rounding as ``causal_gqa``."""
    if len(key) < seq_len or len(value) < seq_len:
        raise ValueError("cache shorter than seq_len")
    kv_heads = len(key[0]) if key else 0
    if kv_heads not in (2, 4):
        raise ValueError("K8/V4 quant attention serves 2 or 4 KV heads")
    layout = PageLayout(kv_heads)
    kq = []
    vq = []
    for t in range(seq_len):
        k_heads = []
        v_heads = []
        for head in range(layout.hkv):
            packed, scale = quant_k(key[t][head])
            vpack, vscale, vzero = quant_v(value[t][head])
            k_heads.append((packed, scale))
            v_heads.append(dequant_v(vpack, vscale, vzero))
        kq.append(k_heads)
        vq.append(v_heads)
    return kq, vq, layout


def attend_quantized(
    query: list[list[list[float]]],
    kq: list,
    vq: list,
    seq_len: int,
    q_len: int,
    allowed,
    layout: PageLayout,
) -> list[list[list[float]]]:
    """``allowed(q_tok, token)`` is False for tokens the indexer did not keep.

    The causal end is applied as well. ``allowed`` returning True for every
    ``token < end`` matches ``oracle.causal_gqa``.
    """
    if len(query) != q_len:
        raise ValueError("query width")
    if q_len == 0:
        return []
    hq = layout.hq
    if len(query[0]) != hq:
        raise ValueError("query heads %d, layout has %d" % (len(query[0]), hq))
    out: list[list[list[float]]] = []
    for q_tok in range(q_len):
        end = builtin_q_end(seq_len, q_len, q_tok)
        heads: list[list[float]] = []
        for head in range(hq):
            kv_head = head // GQA
            q_packed, q_scale = quant_k(query[q_tok][head])
            scores = []
            for token in range(seq_len):
                if token >= end or not allowed(q_tok, token):
                    scores.append(float("-inf"))
                    continue
                k_packed, k_scale = kq[token][kv_head]
                scores.append(_dot(q_packed, k_packed) * q_scale * k_scale * INV_SQRT_ATTN)
            probs = _softmax(scores)
            acc = [0.0] * D
            for token, prob in enumerate(probs):
                if prob == 0.0:
                    continue
                row = vq[token][kv_head]
                for dim in range(D):
                    acc[dim] += prob * row[dim]
            heads.append(acc)
        out.append(heads)
    return out


def sparse_causal_gqa(
    query: list[list[list[float]]],
    key: list[list[list[float]]],
    value: list[list[list[float]]],
    seq_len: int,
    q_len: int,
    allowed,
) -> list[list[list[float]]]:
    """Quantize K/V like the store, then attend only where ``allowed`` says so."""
    kq, vq, layout = quantize_kv(key, value, seq_len)
    if q_len == 0:
        return []
    if len(query[0]) != layout.hq:
        raise ValueError(
            "query heads %d do not match %d KV heads" % (len(query[0]), layout.hkv)
        )
    return attend_quantized(query, kq, vq, seq_len, q_len, allowed, layout)


def allow_all(_q_tok: int, _token: int) -> bool:
    return True


def allow_tokens(per_query: list[list[int]]):
    """Build ``allowed(q_tok, token)`` from an explicit cell list per query."""
    sets = [set(int(t) for t in row) for row in per_query]

    def allowed(q_tok: int, token: int) -> bool:
        return int(token) in sets[int(q_tok)]

    return allowed


def _page_and_offset(block_row: torch.Tensor, token: int, pages_per_block: int) -> tuple[int, int]:
    logical = int(token) // PAGE
    offset = int(token) % PAGE
    ratio = int(pages_per_block)
    if ratio == 1:
        page = int(block_row[logical])
    else:
        page = int(block_row[logical // ratio]) * ratio + (logical % ratio)
    return page, offset


def load_quantized_views(
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    pages_per_block: int,
) -> tuple[list, list, PageLayout]:
    """Read INT8 K and INT4 V for logical tokens ``[0, seq_len)``."""
    layout = PageLayout(int(views["k"].shape[2]))
    # Touch the block map once so a bad table fails before the token loop.
    if seq_len > 0:
        last_page = (int(seq_len) - 1) // PAGE
        physical_pages(block_row, 0, last_page + 1, pages_per_block)
    kq = []
    vq = []
    for token in range(int(seq_len)):
        page, offset = _page_and_offset(block_row, token, pages_per_block)
        k_heads = []
        v_heads = []
        for head in range(layout.hkv):
            packed = [int(v) for v in views["k"][page, offset, head].to(torch.int32).tolist()]
            if len(packed) != D:
                raise RuntimeError("K row width")
            scale = float(views["k_scale"][page, offset, head])
            k_heads.append((packed, scale))
            nibbles = views["v"][page, offset, head].to(torch.int32)
            vscale = float(views["v_scale"][page, offset, head])
            vzero = float(views["v_zero"][page, offset, head])
            raw = []
            for byte in nibbles.tolist():
                raw.append(int(byte) & 0xFF)
            v_heads.append(dequant_v(raw, vscale, vzero))
        kq.append(k_heads)
        vq.append(v_heads)
    return kq, vq, layout


def sparse_from_views(
    query: list[list[list[float]]],
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    q_len: int,
    allowed,
    pages_per_block: int,
) -> list[list[list[float]]]:
    """Sparse attention that reads the packed K8/V4 pages directly."""
    kq, vq, layout = load_quantized_views(views, block_row, seq_len, pages_per_block)
    return attend_quantized(query, kq, vq, seq_len, q_len, allowed, layout)


