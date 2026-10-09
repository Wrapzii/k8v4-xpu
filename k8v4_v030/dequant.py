"""Dequantize packed pages for the eager prefill path.

Decode stays on the compressed kernel. Prefill gathers the block-table
pages, expands a manager block into 64-token pages when needed, and
materializes fp16 K/V. The nibble order matches the store: low = even dim.
Short prefills score the suffix with SDPA. Past KEY_TILE_MAX tokens the
eager path dequantizes one key tile at a time and runs online softmax, so
a 128K prefill never materializes the whole sequence. Each key tile is
gathered once. Decode stays on the compressed kernel. Neither loop is on
the decode graph.
"""

from __future__ import annotations

import torch

from k8v4_v030.layout import D, GQA, PAGE, PageLayout

# fp32 bytes for one HQ * query_rows * key_tile score. 128 MiB is one tile.
# The 96K fault gathered the whole suffix (about 82K tokens) on a full card.
# Tests shrink these.
SCORE_TILE_BYTES = 128 * 1024 * 1024
SCORE_TILE_MAX_ROWS = 256
# Sequences at or under this are gathered once and scored with SDPA.
# 16K stayed correct on that path. 64K and 96K did not fit it.
KEY_TILE_MAX = 16384


def gather_dequant(
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    pages_per_block: int,
    dtype: torch.dtype,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Return ``(k, v)`` as ``[seq_len, HKV, D]`` in ``dtype``."""
    return gather_dequant_range(views, block_row, 0, int(seq_len), pages_per_block, dtype)


def physical_pages(
    block_row: torch.Tensor, page0: int, page1: int, pages_per_block: int
) -> torch.Tensor:
    """Kernel pages for logical pages ``[page0, page1)``.

    ``pages_per_block`` is 1 when the block table already stores kernel pages.
    Otherwise each entry is a manager block and page ``p`` is
    ``block_row[p // ratio] * ratio + (p % ratio)``.
    """
    ratio = int(pages_per_block)
    if ratio < 1:
        raise RuntimeError("pages_per_block")
    logical = torch.arange(int(page0), int(page1), device=block_row.device)
    if ratio == 1:
        return block_row[logical].to(torch.long)
    return block_row[logical // ratio].to(torch.long) * ratio + (logical % ratio)


def _views_hkv(views: dict[str, torch.Tensor]) -> int:
    """Per-GPU KV head count named by the bound region views, validated."""
    return PageLayout(int(views["k"].shape[2])).hkv


def gather_dequant_range(
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    start: int,
    end: int,
    pages_per_block: int,
    dtype: torch.dtype,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Return tokens ``[start, end)`` as ``(k, v)`` shaped ``[end - start, HKV, D]``.

    ``block_row`` is one request's block-table row. Entries are kernel pages
    when ``pages_per_block`` is 1, otherwise manager blocks.
    """
    hkv = _views_hkv(views)
    start = int(start)
    end = int(end)
    if start < 0 or end < start:
        raise RuntimeError("bad token range")
    n = end - start
    device = block_row.device
    if n <= 0:
        empty = torch.empty((0, hkv, D), dtype=dtype, device=device)
        return empty, empty
    page0 = start // PAGE
    page1 = (end + PAGE - 1) // PAGE
    phys = physical_pages(block_row, page0, page1, pages_per_block)
    local0 = start - page0 * PAGE
    local1 = local0 + n
    k = views["k"].index_select(0, phys).to(torch.float32)
    k = k * views["k_scale"].index_select(0, phys).to(torch.float32).unsqueeze(-1)
    k = k.reshape(-1, hkv, D)[local0:local1].contiguous()
    packed = views["v"].index_select(0, phys).to(torch.int32)
    scale = views["v_scale"].index_select(0, phys).unsqueeze(-1)
    zero = views["v_zero"].index_select(0, phys).unsqueeze(-1)
    even = (packed & 15).to(torch.float32)
    odd = (packed >> 4).to(torch.float32)
    value = torch.stack(((even - zero) * scale, (odd - zero) * scale), dim=-1)
    value = value.reshape(-1, hkv, D)[local0:local1].contiguous()
    return k.to(dtype), value.to(dtype)


# Shape of the one-head index_select copies from the last gather_dequant_head.
# Tests use this to prove the copy is one KV head, not ``[pages, PAGE, HKV, D]``.
last_head_copy_shapes: tuple[tuple[int, ...], tuple[int, ...]] | None = None


def gather_dequant_head(
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    head: int,
    pages_per_block: int,
    dtype: torch.dtype,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Dequantize one KV head to ``[seq_len, D]``.

    The block table is the same map as ``gather_dequant_range``. The selected
    copy is that head only; the other head stays in the packed pages.
    """
    global last_head_copy_shapes
    seq_len = int(seq_len)
    head = int(head)
    if head < 0 or head >= _views_hkv(views):
        raise RuntimeError("kv head %s" % head)
    if seq_len < 0:
        raise RuntimeError("bad token range")
    device = block_row.device
    if seq_len == 0:
        empty = torch.empty((0, D), dtype=dtype, device=device)
        last_head_copy_shapes = ((), ())
        return empty, empty
    page0 = 0
    page1 = (seq_len + PAGE - 1) // PAGE
    phys = physical_pages(block_row, page0, page1, pages_per_block)
    local1 = seq_len
    k_src = views["k"][:, :, head, :]
    scale_src = views["k_scale"][:, :, head]
    k_pages = k_src.index_select(0, phys).to(torch.float32)
    k_pages = k_pages * scale_src.index_select(0, phys).to(torch.float32).unsqueeze(-1)
    k = k_pages.reshape(-1, D)[:local1].contiguous()
    packed_src = views["v"][:, :, head, :]
    packed = packed_src.index_select(0, phys).to(torch.int32)
    scale = views["v_scale"][:, :, head].index_select(0, phys).unsqueeze(-1)
    zero = views["v_zero"][:, :, head].index_select(0, phys).unsqueeze(-1)
    even = (packed & 15).to(torch.float32)
    odd = (packed >> 4).to(torch.float32)
    value_pages = torch.stack(((even - zero) * scale, (odd - zero) * scale), dim=-1)
    value = value_pages.reshape(-1, D)[:local1].contiguous()
    last_head_copy_shapes = (tuple(k_pages.shape), tuple(packed.shape))
    return k.to(dtype), value.to(dtype)


def attention_tiles(q_len: int, seq_len: int, hq: int) -> tuple[int, int]:
    """Query rows and key tokens whose fp32 score stays inside the budget."""
    q_len = int(q_len)
    seq_len = max(int(seq_len), 0)
    if q_len <= 0 or seq_len <= 0:
        return 0, 0
    key_tile = min(seq_len, max(int(KEY_TILE_MAX), 1))
    while True:
        room = max(int(SCORE_TILE_BYTES) // max(key_tile * hq * 4, 1), 1)
        rows = min(SCORE_TILE_MAX_ROWS, q_len, room)
        score_bytes = rows * key_tile * hq * 4
        if score_bytes <= int(SCORE_TILE_BYTES) or key_tile <= PAGE:
            return max(rows, 1), key_tile
        nxt = max(PAGE, key_tile // 2)
        if nxt == key_tile:
            return max(rows, 1), key_tile
        key_tile = nxt


def eager_gqa_attention(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
) -> torch.Tensor:
    """Causal GQA for one prefill request.

    ``query`` is ``[q_len, HQ, D]`` and is the suffix of ``key``/``value``
    ``[seq_len, HKV, D]``. Decode does not use this path. A key longer than
    one tile uses online softmax over slices of this dense tensor.
    """
    if query.ndim != 3 or key.ndim != 3 or value.ndim != 3:
        raise RuntimeError("eager attention expects [tokens, heads, dim]")
    if query.shape[-1] != D or key.shape[-1] != D:
        raise RuntimeError("eager attention head shape")
    # Head layout comes from the tensors; an unsupported pair fails loudly.
    # PageLayout raises ValueError; this public path raised RuntimeError on
    # origin/main, so keep that type for callers catching it.
    try:
        layout = PageLayout.for_heads(int(query.shape[1]), int(key.shape[1]))
    except ValueError as error:
        raise RuntimeError("eager attention head shape: %s" % error) from error
    if query.shape[0] > key.shape[0]:
        raise RuntimeError("query longer than the KV sequence")
    rows, key_tile = attention_tiles(query.shape[0], key.shape[0], layout.hq)
    if key_tile < key.shape[0]:
        return _online_dense(query, key, value, float(scale), rows, key_tile, layout.hkv)
    try:
        return _sdpa_gqa(query, key, value, scale, repeat_kv=False, gqa=layout.gqa)
    except TypeError:
        return _sdpa_gqa(query, key, value, scale, repeat_kv=True, gqa=layout.gqa)


def eager_prefill(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    pages_per_block: int,
    scale: float,
) -> torch.Tensor:
    """Eager prefill from packed pages. Long sequences are gathered per key tile."""
    q_len = int(query.shape[0])
    seq_len = int(seq_len)
    if q_len == 0:
        return query
    if q_len > seq_len:
        raise RuntimeError("query longer than the KV sequence")
    # The views carry this rank's KV head count; the query must carry its Q count.
    hkv = _views_hkv(views)
    if int(query.shape[1]) != GQA * hkv:
        raise RuntimeError(
            "query has %d heads, the K8/V4 cache holds %d (needs %d)"
            % (int(query.shape[1]), hkv, GQA * hkv)
        )
    rows, key_tile = attention_tiles(q_len, seq_len, int(query.shape[1]))
    if key_tile >= seq_len:
        k_fp, v_fp = gather_dequant(views, block_row, seq_len, pages_per_block, query.dtype)
        return eager_gqa_attention(query, k_fp, v_fp, scale)
    return _online_paged(
        query, views, block_row, seq_len, pages_per_block, float(scale), rows, key_tile,
        hkv,
    )


def _suffix_causal_mask(
    row0: int,
    rows: int,
    q_len: int,
    seq_len: int,
    device: torch.device,
    dtype: torch.dtype,
) -> torch.Tensor:
    """Bottom-right causal mask for query rows ``[row0, row0 + rows)``.

    Query row ``j`` of the full suffix is token ``seq_len - q_len + j``.
    """
    q_pos = torch.arange(row0, row0 + rows, device=device)[:, None]
    k_pos = torch.arange(seq_len, device=device)[None, :]
    allow = k_pos <= (seq_len - q_len + q_pos)
    mask = torch.zeros((rows, seq_len), dtype=dtype, device=device)
    return mask.masked_fill(~allow, torch.finfo(dtype).min)


def _sdpa_rows(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
    repeat_kv: bool,
    row0: int,
    q_len: int,
) -> torch.Tensor:
    mask = _suffix_causal_mask(
        row0, query.shape[0], q_len, key.shape[0], query.device, query.dtype
    )
    kwargs = {"attn_mask": mask, "scale": float(scale)}
    if not repeat_kv:
        kwargs["enable_gqa"] = True
    attn = torch.nn.functional.scaled_dot_product_attention(
        query.transpose(0, 1).unsqueeze(0),
        key.transpose(0, 1).unsqueeze(0),
        value.transpose(0, 1).unsqueeze(0),
        **kwargs,
    )
    return attn.squeeze(0).transpose(0, 1).contiguous()


def _sdpa_gqa(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
    repeat_kv: bool,
    gqa: int,
) -> torch.Tensor:
    if repeat_kv:
        key = key.repeat_interleave(gqa, dim=1)
        value = value.repeat_interleave(gqa, dim=1)
    q_len = int(query.shape[0])
    if q_len == 0:
        return query
    # is_causal is top-left. A prefill query is the suffix of the KV sequence,
    # so each tile's mask is aligned to that row's position in the full query.
    seq_len = int(key.shape[0])
    tile, key_tile = attention_tiles(q_len, seq_len, int(query.shape[1]))
    if key_tile < seq_len:
        hkv = int(query.shape[1]) // gqa
        _derived_gqa(int(query.shape[1]), hkv)
        return _online_dense(query, key, value, float(scale), tile, key_tile, hkv)
    if tile >= q_len:
        return _sdpa_rows(query, key, value, scale, repeat_kv, 0, q_len)
    parts = []
    for row0 in range(0, q_len, tile):
        rows = min(tile, q_len - row0)
        parts.append(
            _sdpa_rows(
                query[row0 : row0 + rows],
                key,
                value,
                scale,
                repeat_kv,
                row0,
                q_len,
            )
        )
    return torch.cat(parts, dim=0)

def _derived_gqa(query_heads: int, hkv: int) -> int:
    """Query heads per KV head; the kernel math is GQA=6, so a derived value must be."""
    gqa, rem = divmod(int(query_heads), hkv)
    if rem != 0 or gqa != GQA:
        raise RuntimeError(
            "K8/V4 attention needs %d query heads over %d KV heads, got %d"
            % (GQA * hkv, hkv, query_heads)
        )
    return gqa


def _online_accumulate(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
    row0: int,
    q_len: int,
    seq_len: int,
    k0: int,
    acc: torch.Tensor | None,
    running_max: torch.Tensor | None,
    normalizer: torch.Tensor | None,
    hkv: int,
) -> tuple[torch.Tensor, torch.Tensor, torch.Tensor]:
    """One key tile of online-softmax GQA. State is ``[HKV, GQA, rows, ...]``."""
    rows = int(query.shape[0])
    kt = int(key.shape[0])
    gqa = _derived_gqa(int(query.shape[1]), hkv)
    qf = query.to(torch.float32).reshape(rows, hkv, gqa, D)
    kf = key.to(torch.float32)
    vf = value.to(torch.float32)
    scores = torch.einsum("rhgd,khd->hgrk", qf, kf) * float(scale)
    q_pos = torch.arange(row0, row0 + rows, device=query.device)
    limit = seq_len - q_len + q_pos
    k_pos = torch.arange(k0, k0 + kt, device=query.device)
    allow = k_pos[None, :] <= limit[:, None]
    scores = scores.masked_fill(~allow.view(1, 1, rows, kt), torch.finfo(torch.float32).min)
    tile_max = scores.amax(dim=-1)
    if acc is None:
        running_max = torch.full_like(tile_max, torch.finfo(torch.float32).min)
        normalizer = torch.zeros_like(tile_max)
        acc = torch.zeros((hkv, gqa, rows, D), dtype=torch.float32, device=query.device)
    new_max = torch.maximum(running_max, tile_max)
    alpha = torch.exp(running_max - new_max)
    probs = torch.exp(scores - new_max.unsqueeze(-1))
    normalizer = normalizer * alpha + probs.sum(dim=-1)
    acc = acc * alpha.unsqueeze(-1) + torch.einsum("hgrk,khd->hgrd", probs, vf)
    return acc, new_max, normalizer


def _online_query_tile(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
    row0: int,
    q_len: int,
    seq_len: int,
    key_tile: int,
    hkv: int,
) -> torch.Tensor:
    acc = None
    running_max = None
    normalizer = None
    for k0 in range(0, seq_len, key_tile):
        k1 = min(seq_len, k0 + key_tile)
        acc, running_max, normalizer = _online_accumulate(
            query,
            key[k0:k1],
            value[k0:k1],
            scale,
            row0,
            q_len,
            seq_len,
            k0,
            acc,
            running_max,
            normalizer,
            hkv,
        )
    out = acc / normalizer.unsqueeze(-1)
    return (
        out.permute(2, 0, 1, 3).reshape(query.shape[0], query.shape[1], D).contiguous().to(query.dtype)
    )


def _online_dense(
    query: torch.Tensor,
    key: torch.Tensor,
    value: torch.Tensor,
    scale: float,
    rows: int,
    key_tile: int,
    hkv: int,
) -> torch.Tensor:
    q_len = int(query.shape[0])
    seq_len = int(key.shape[0])
    if rows >= q_len:
        return _online_query_tile(query, key, value, scale, 0, q_len, seq_len, key_tile, hkv)
    parts = []
    for row0 in range(0, q_len, rows):
        count = min(rows, q_len - row0)
        parts.append(
            _online_query_tile(
                query[row0 : row0 + count],
                key,
                value,
                scale,
                row0,
                q_len,
                seq_len,
                key_tile,
                hkv,
            )
        )
    return torch.cat(parts, dim=0)


def _online_paged(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    pages_per_block: int,
    scale: float,
    rows: int,
    key_tile: int,
    hkv: int,
) -> torch.Tensor:
    """Stream key tiles once. Query rows are scored in budget-sized groups."""
    q_len = int(query.shape[0])
    gqa = _derived_gqa(int(query.shape[1]), hkv)
    device = query.device
    acc = torch.zeros((hkv, gqa, q_len, D), dtype=torch.float32, device=device)
    running_max = torch.full(
        (hkv, gqa, q_len),
        torch.finfo(torch.float32).min,
        dtype=torch.float32,
        device=device,
    )
    normalizer = torch.zeros((hkv, gqa, q_len), dtype=torch.float32, device=device)
    step = max(int(rows), 1)
    span = max(int(key_tile), 1)
    for k0 in range(0, seq_len, span):
        k1 = min(seq_len, k0 + span)
        key, value = gather_dequant_range(
            views, block_row, k0, k1, pages_per_block, query.dtype
        )
        for row0 in range(0, q_len, step):
            count = min(step, q_len - row0)
            acc_t, max_t, norm_t = _online_accumulate(
                query[row0 : row0 + count],
                key,
                value,
                scale,
                row0,
                q_len,
                seq_len,
                k0,
                acc[:, :, row0 : row0 + count, :],
                running_max[:, :, row0 : row0 + count],
                normalizer[:, :, row0 : row0 + count],
                hkv,
            )
            acc[:, :, row0 : row0 + count, :] = acc_t
            running_max[:, :, row0 : row0 + count] = max_t
            normalizer[:, :, row0 : row0 + count] = norm_t
        del key, value
    out = acc / normalizer.unsqueeze(-1)
    return (
        out.permute(2, 0, 1, 3).reshape(q_len, query.shape[1], D).contiguous().to(query.dtype)
    )
