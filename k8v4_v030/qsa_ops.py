"""Device entry points for QSA. Python is the numeric contract.

``XE2_QSA_LIB`` loads ``torch.ops.xe2_qsa`` when the file is present. An
unset variable uses ``libxe2_qsa.so`` under the QSA build directory when
that file exists. CPU tensors never load that library. A missing library,
and any CPU tensor, run the same selection through ``qsa_quant_attn``.
"""

from __future__ import annotations

import os
import time

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import D, PAGE, PageLayout, builtin_q_end
from k8v4_v030.qsa_quant_attn import allow_tokens, sparse_from_views
from k8v4_v030.qsa_ref import QsaHyper, finish_selection, score_blocks, topk_block_ids, visible_tokens

_LOADED: str | None = None
_DEFAULT_LIB = "/mnt/hdd-500gb/model-validation/qsa-k8v4/libxe2_qsa.so"
_VIEW_KEYS = ("k", "k_scale", "v", "v_scale", "v_zero")


def library_path() -> str | None:
    raw = os.environ.get("XE2_QSA_LIB", "").strip()
    if raw:
        return raw
    if os.path.isfile(_DEFAULT_LIB):
        return _DEFAULT_LIB
    return None


def kv_ops():
    """The K8/V4 kernel namespace. ``ops()`` is the QSA library, not this one."""
    if not hasattr(torch.ops, "xe2_kv") or not hasattr(torch.ops.xe2_kv, "kv_store_paged"):
        path = os.environ.get("XE2_KV_LIB", "/opt/k8v4/libxe2_kv.so")
        torch.ops.load_library(path)
    return torch.ops.xe2_kv


def ops():
    """Return ``torch.ops.xe2_qsa``, or None when no library is configured."""
    global _LOADED
    path = library_path()
    if path is None:
        return None
    if not os.path.isfile(path):
        raise FileNotFoundError("QSA library is not at %s" % path)
    if _LOADED != path:
        torch.ops.load_library(path)
        _LOADED = path
    return torch.ops.xe2_qsa


def causal_visible_rows(visible: list[list[int]], seq_len: int, q_len: int) -> list[list[int]]:
    """Sorted unique token cells that are still inside each query's causal end.

    The Python attention loop drops anything at or past ``builtin_q_end`` and
    attends a token once. The device kernel trusts the list it is given, so
    the wrapper applies that filter before the launch.
    """
    rows: list[list[int]] = []
    for q_tok, row in enumerate(visible):
        end = builtin_q_end(int(seq_len), int(q_len), int(q_tok))
        kept: list[int] = []
        seen: set[int] = set()
        for token in row:
            token = int(token)
            if token < 0 or token >= end or token in seen:
                continue
            seen.add(token)
            kept.append(token)
        kept.sort()
        rows.append(kept)
    return rows


def _xpu_ready(query: torch.Tensor, views: dict[str, torch.Tensor], block_row: torch.Tensor) -> bool:
    if query.device.type != "xpu" or block_row.device.type != "xpu":
        return False
    for key in _VIEW_KEYS:
        if views[key].device.type != "xpu":
            return False
    return library_path() is not None


def score_pooled(query: torch.Tensor, pooled: torch.Tensor) -> torch.Tensor:
    """Sum of ``relu(q · k)`` over indexer heads.

    ``query`` is ``[queries, 4, 128]`` and ``pooled`` is ``[blocks, 128]``.
    An XPU pair uses ``qsa_score`` when the library is present. The result
    is fp32 on that device. CPU stays on the fp64 reference.
    """
    if (query.device.type == "xpu" and pooled.device.type == "xpu"
            and os.environ.get("K8V4_QSA_GEMM_SCORE", "0") == "1"
            and int(query.shape[0]) > 16):
        return score_pooled_gemm(query, pooled)
    if query.device.type == "xpu" and pooled.device.type == "xpu" and library_path() is not None:
        q = query
        if q.dtype != torch.float32 or not q.is_contiguous():
            q = q.contiguous().float()
        k = pooled
        if k.dtype != torch.float32 or not k.is_contiguous():
            k = k.contiguous().float()
        scores = torch.empty((q.shape[0], k.shape[0]), dtype=torch.float32, device=q.device)
        ops().qsa_score(q, k, scores)
        return scores
    return score_blocks(query, pooled)


def score_pooled_gemm(query: torch.Tensor, pooled: torch.Tensor) -> torch.Tensor:
    """Reference rectified per-head scores, chunked to 64 MiB of matmul output.

    XPU prefill uses one fp16 GEMM plus an fp16 relu-sum. The head reduction
    stays in fp16 because promoting the full score matrix to fp32 is slower
    than the GEMM. CPU callers keep the fp32 reference path.
    """
    if query.ndim != 3 or pooled.ndim != 2 or query.shape[-1] != pooled.shape[-1]:
        raise ValueError("QSA score expects [tokens, heads, dim] and [blocks, dim]")
    if (query.device.type == "xpu" and os.environ.get("K8V4_QSA_SCORE_FP16", "0") == "1"
            and int(pooled.shape[0]) > 0 and int(query.shape[0]) > 0):
        tokens, heads, dim = query.shape
        blocks = int(pooled.shape[0])
        # 512 MiB of fp16 GEMM output. 4224 queries land in two chunks.
        chunk = max(1, min(int(tokens), (512 << 20) // max(1, int(heads) * blocks * 2)))
        kh = pooled.detach().to(dtype=torch.float16).transpose(0, 1).contiguous()
        qh = query.detach() if query.dtype == torch.float16 else query.detach().to(dtype=torch.float16)
        pieces = []
        for start in range(0, int(tokens), chunk):
            part = qh[start:start + chunk].reshape(-1, dim).matmul(kh)
            pieces.append(torch.relu(part).reshape(-1, heads, blocks).sum(dim=1))
        reduced = pieces[0] if len(pieces) == 1 else torch.cat(pieces, dim=0)
        return reduced if reduced.dtype == torch.float32 else reduced.float()
    tokens, heads, dim = query.shape
    blocks = int(pooled.shape[0])
    if blocks == 0:
        return torch.empty((tokens, 0), dtype=torch.float32, device=query.device)
    chunk = max(1, min(int(tokens), (64 << 20) // (blocks * int(heads) * 4)))
    q = query.to(dtype=torch.float32)
    k = pooled.to(device=query.device, dtype=torch.float32).contiguous().transpose(0, 1)
    pieces = []
    for start in range(0, int(tokens), chunk):
        part = q[start:start+chunk].reshape(-1, dim).matmul(k)
        pieces.append(part.reshape(-1, heads, blocks).relu_().sum(dim=1))
    return torch.cat(pieces, dim=0) if pieces else torch.empty((0, blocks), dtype=torch.float32, device=query.device)


def score_pooled_paged(query, pooled, valid, block_row, counts, pages_per_block: int, n_blocks: int | None = None):
    """Decode scores directly from the physical pooled cache.

    ``n_blocks`` fixes the scored width so a CUDA graph captured on a short
    dummy sequence still replays across a long context. Columns past each
    query's count stay ``-inf``.
    """
    q = query.to(dtype=torch.float32).contiguous()
    row = block_row.to(device=query.device, dtype=torch.int32).contiguous()
    if torch.is_tensor(counts):
        lengths = counts.to(device=query.device, dtype=torch.int32).reshape(-1).contiguous()
        width = int(n_blocks) if n_blocks is not None else int(lengths.numel())
    else:
        if not counts or max(counts) < 1:
            raise ValueError("paged QSA score needs at least one block")
        lengths = torch.tensor(counts, dtype=torch.int32, device=query.device)
        width = int(n_blocks) if n_blocks is not None else int(max(counts))
    if width < 1:
        raise ValueError("paged QSA score needs at least one block")
    scores = torch.empty((query.shape[0], width), dtype=torch.float32, device=query.device)
    native = ops()
    if native is None or not hasattr(native, "qsa_score_paged"):
        raise RuntimeError("paged QSA score requires an updated libxe2_qsa.so")
    native.qsa_score_paged(q, pooled, valid, row, lengths, scores, int(pages_per_block))
    return scores


_SCORE_SCRATCH: dict[tuple, torch.Tensor] = {}
_VISIBLE_SCRATCH: dict[tuple, torch.Tensor] = {}


def score_select_paged(
    query,
    pooled,
    valid,
    block_row,
    counts,
    cells,
    pages_per_block: int,
    hyper: QsaHyper,
    n_blocks: int,
    out=None,
):
    """Score live blocks and pack the visible token row in one native op.

    ``n_blocks`` is the scratch width. The kernel stops at each query's
    device count, so a graph captured at 65536 still only dots the live
    context. ``out`` is ``[queries, (n_sel+1)*ratio]`` int32, padded with -1.
    """
    q = query.to(dtype=torch.float32).contiguous()
    row = block_row.to(device=query.device, dtype=torch.int32).contiguous()
    if torch.is_tensor(counts):
        lengths = counts.to(device=query.device, dtype=torch.int32).reshape(-1).contiguous()
    else:
        if not counts or max(counts) < 1:
            raise ValueError("paged QSA score needs at least one block")
        lengths = torch.tensor(counts, dtype=torch.int32, device=query.device)
    if torch.is_tensor(cells):
        cells_t = cells.to(device=query.device, dtype=torch.int32).reshape(-1).contiguous()
    else:
        cells_t = torch.tensor(cells, dtype=torch.int32, device=query.device)
    width = max(1, int(n_blocks))
    k = int(hyper.n_sel)
    ratio = int(hyper.ratio)
    vis_w = (k + 1) * ratio
    nq = int(q.shape[0])
    device = q.device
    score_key = (str(device), nq, width)
    scores = _SCORE_SCRATCH.get(score_key)
    if scores is None or scores.device != device:
        scores = torch.empty((nq, width), dtype=torch.float32, device=device)
        _SCORE_SCRATCH[score_key] = scores
    if out is None:
        vis_key = (str(device), nq, vis_w)
        out = _VISIBLE_SCRATCH.get(vis_key)
        if out is None or out.device != device:
            out = torch.empty((nq, vis_w), dtype=torch.int32, device=device)
            _VISIBLE_SCRATCH[vis_key] = out
    native = ops()
    if native is not None and hasattr(native, "qsa_score_select_paged"):
        native.qsa_score_select_paged(
            q, pooled, valid, row, lengths, cells_t, scores, out, int(pages_per_block), k,
        )
        return out
    scored = score_pooled_paged(
        q, pooled, valid, row, lengths, int(pages_per_block), n_blocks=width,
    )
    return _visible_graph(scored, lengths, cells_t, hyper, vis_w, premasked=True)


def mask_query_scores(
    scores: torch.Tensor,
    counts: list[int],
    valid: torch.Tensor | None = None,
) -> torch.Tensor:
    """``-inf`` past each query's complete-block count, and on invalid blocks.

    ``scores`` is ``[queries, blocks]``. ``valid`` is ``[blocks]`` when a
    pooled row exists. A query with ``count`` complete blocks must not rank
    a later column, including one that belongs to a longer query in the batch.
    """
    if scores.ndim != 2:
        raise ValueError("scores are [queries, blocks]")
    if len(counts) != int(scores.shape[0]):
        raise ValueError("one complete-block count per query")
    out = scores
    if valid is not None:
        if int(valid.shape[0]) != int(scores.shape[1]):
            raise ValueError("validity width")
        mask = valid.to(device=out.device, dtype=torch.bool)
        out = out.masked_fill(~mask.unsqueeze(0), float("-inf"))
    if int(scores.shape[1]) == 0 or not counts:
        return out
    columns = torch.arange(int(scores.shape[1]), device=out.device)
    limit = torch.tensor(list(counts), dtype=torch.int64, device=out.device).unsqueeze(1)
    return out.masked_fill(columns.unsqueeze(0) >= limit, float("-inf"))


def choose_blocks(
    row: torch.Tensor | None,
    count: int,
    cell: int,
    hyper: QsaHyper,
    force_all: bool,
    device_ids: list[int] | None = None,
) -> tuple[list[int], int]:
    """Block ids for one query.

    Inside the budget, and under ``force_all``, every complete block is kept.
    Past the budget, ``device_ids`` is the top-k kernel's row (best first).
    Otherwise the fp64 reference ranks ``row``. The own block is added either way.
    """
    count = int(count)
    if force_all or count <= hyper.n_sel:
        return finish_selection(list(range(count)), cell, hyper)
    if device_ids is not None:
        chosen = [int(block) for block in device_ids if 0 <= int(block) < count]
        return finish_selection(chosen, cell, hyper)
    if row is None:
        raise RuntimeError("QSA has no scores for a query past the block budget")
    if int(row.shape[0]) < count:
        raise RuntimeError("scores cover %d blocks, query needs %d" % (int(row.shape[0]), count))
    return finish_selection(topk_block_ids(row[:count], hyper.n_sel), cell, hyper)


def packed_visible_rows(
    scores: torch.Tensor | None,
    counts: list[int],
    cells: list[int],
    hyper: QsaHyper,
    force_all: bool,
) -> torch.Tensor:
    """``[queries, width]`` int32 token cells, ascending, padded with ``-1``.

    The rows are ``visible_tokens`` of ``choose_blocks``. A query inside the
    budget, and a query whose own block is the one top-k dropped, both come
    back as the full causal range. Width is the longest row, at least 1.
    """
    if len(counts) != len(cells):
        raise ValueError("one complete-block count per query")
    if scores is not None and int(scores.shape[0]) != len(cells):
        raise ValueError("one score row per query")
    if (
        scores is not None
        and scores.device.type == "xpu"
        and library_path() is not None
        and int(scores.shape[0]) <= 1024
    ):
        # The heap kernel is one thread per query. A stable argsort is the
        # same tie rule (equal scores keep the lower block id) and is much
        # faster for decode and for a few hundred prefill queries.
        return _visible_stable(scores, counts, cells, hyper, force_all)
    if (
        scores is not None
        and scores.device.type == "xpu"
        and library_path() is not None
        and _visible_op() is not None
    ):
        return _visible_xpu(scores, counts, cells, hyper, force_all)
    rows: list[list[int]] = []
    width = 1
    for local, cell in enumerate(cells):
        row = None if scores is None else scores[local]
        chosen, own_width = choose_blocks(row, counts[local], int(cell), hyper, force_all, None)
        tokens = visible_tokens(int(cell), chosen, own_width, hyper.ratio)
        rows.append(tokens)
        if len(tokens) > width:
            width = len(tokens)
    packed = torch.full((len(cells), width), -1, dtype=torch.int32)
    for i, tokens in enumerate(rows):
        if tokens:
            packed[i, : len(tokens)] = torch.tensor(tokens, dtype=torch.int32)
    return packed



def _visible_stable(scores, counts, cells, hyper: QsaHyper, force_all: bool, counts_t=None, cells_t=None, width_override: int | None = None) -> torch.Tensor:
    """Device selection with a stable sort. Ties keep the lower block id."""
    if scores.ndim != 2:
        raise ValueError("scores are [queries, blocks]")
    if counts_t is None or cells_t is None:
        if len(counts) != len(cells) or int(scores.shape[0]) != len(cells):
            raise ValueError("one score row per query")
    elif int(counts_t.reshape(-1).shape[0]) != int(scores.shape[0]) or int(cells_t.reshape(-1).shape[0]) != int(scores.shape[0]):
        raise ValueError("one score row per query")
    device = scores.device
    queries, n_blocks = int(scores.shape[0]), int(scores.shape[1])
    ratio = int(hyper.ratio)
    budget = int(hyper.n_sel)
    if width_override is None:
        width = _visible_width(counts, cells, hyper, force_all)
    else:
        width = int(width_override)
    out = torch.full((queries, width), -1, dtype=torch.int32, device=device)
    if queries == 0 or n_blocks == 0:
        return out
    if counts_t is None:
        counts_t = torch.tensor(counts, dtype=torch.int32, device=device)
    else:
        counts_t = counts_t.to(device=device, dtype=torch.int32).reshape(-1)
    if cells_t is None:
        cells_t = torch.tensor(cells, dtype=torch.int32, device=device)
    else:
        cells_t = cells_t.to(device=device, dtype=torch.int32).reshape(-1)
    within = counts_t <= budget
    if force_all:
        within = torch.ones_like(within)
    columns = torch.arange(n_blocks, device=device)
    masked = scores
    if masked.dtype != torch.float32 or not masked.is_contiguous():
        masked = masked.contiguous().float()
    masked = masked.masked_fill(columns.unsqueeze(0) >= counts_t.unsqueeze(1), float("-inf"))
    take = min(budget, n_blocks)
    order = torch.argsort(masked, dim=1, descending=True, stable=True)[:, :take]
    finite = torch.gather(masked, 1, order).isfinite()
    ids = torch.where(finite, order, torch.full_like(order, -1))
    own = torch.div(cells_t, ratio, rounding_mode="floor")
    blocks = torch.cat((ids, own.unsqueeze(1)), dim=1)
    blocks, _ = torch.sort(blocks, dim=1)
    previous = torch.cat((torch.full((queries, 1), -2, dtype=blocks.dtype, device=device), blocks[:, :-1]), dim=1)
    keep_block = (blocks >= 0) & (blocks != previous)
    offsets = torch.arange(ratio, device=device)
    tokens = blocks.unsqueeze(-1) * ratio + offsets
    own_width = (cells_t.remainder(ratio) + 1).view(queries, 1, 1)
    is_own = blocks.unsqueeze(-1).eq(own.view(queries, 1, 1))
    span = torch.where(is_own, own_width, torch.full((queries, 1, 1), ratio, dtype=torch.int32, device=device))
    keep = keep_block.unsqueeze(-1) & (offsets.view(1, 1, ratio) < span) & (tokens <= cells_t.view(queries, 1, 1))
    flat_tok = tokens.reshape(queries, -1).to(torch.int32)
    flat_keep = keep.reshape(queries, -1)
    # Boolean index assignment waits during XPU graph capture. -1 holes are
    # skipped by the attention kernel, and dropping them restores the same order.
    packed = torch.where(flat_keep, flat_tok, torch.full_like(flat_tok, -1))
    copy = min(width, int(packed.shape[1]))
    out[:, :copy] = packed[:, :copy]
    # Always a device where. A host any() would sync every decode step.
    positions = torch.arange(width, device=device)
    full = torch.where(
        positions.unsqueeze(0) <= cells_t.unsqueeze(1),
        positions.unsqueeze(0),
        torch.full((1, width), -1, device=device),
    ).to(torch.int32)
    return torch.where(within.unsqueeze(1), full, out)


def _visible_graph(scores, counts_t, cells_t, hyper: QsaHyper, width_override: int, premasked: bool = False, stable_ties: bool = False) -> torch.Tensor:
    """Decode selection captured inside a full graph.

    ``torch.topk`` keeps the scored width cheap at 50k blocks. Ties are not
    stable here; ``_visible_stable`` remains the tie-breaking selector. The
    own block is still unioned in, and the row stays within budget*4+4.
    """
    if scores.ndim != 2:
        raise ValueError("scores are [queries, blocks]")
    device = scores.device
    queries, n_blocks = int(scores.shape[0]), int(scores.shape[1])
    ratio = int(hyper.ratio)
    budget = int(hyper.n_sel)
    width = int(width_override)
    out = torch.full((queries, width), -1, dtype=torch.int32, device=device)
    if queries == 0 or n_blocks == 0:
        return out
    counts_t = counts_t.to(device=device, dtype=torch.int32).reshape(-1)
    cells_t = cells_t.to(device=device, dtype=torch.int32).reshape(-1)
    if int(counts_t.shape[0]) != queries or int(cells_t.shape[0]) != queries:
        raise ValueError("one score row per query")
    within = counts_t <= budget
    masked = scores if scores.dtype == torch.float32 and scores.is_contiguous() else scores.contiguous().float()
    # qsa_score_paged already writes -inf past each count. A second pass
    # over 50k columns was most of this call.
    if not premasked:
        columns = torch.arange(n_blocks, device=device)
        masked = masked.masked_fill(columns.unsqueeze(0) >= counts_t.unsqueeze(1), float("-inf"))
    if os.environ.get("K8V4_QSA_FUSED_SELECT", "1") == "1":
        qsa = ops()
        if qsa is not None and hasattr(qsa, "qsa_visible"):
            qsa.qsa_visible(masked.contiguous(), counts_t, cells_t, out, int(budget), int(ratio), 0)
            return out
    take = min(budget, n_blocks)
    if os.environ.get("K8V4_QSA_GRAPH_TOPK", "1") == "1":
        fast_values = fast_order = None
        if stable_ties and os.environ.get("K8V4_QSA_FAST_STABLE", "0") == "1":
            # The author-compatible stable ordering matters only when the
            # kth score ties an excluded block. Check that boundary on device;
            # prefill is eager, so the one scalar read is safe outside graphs.
            candidate_values, candidate_order = torch.topk(masked, k=take, dim=1, largest=True, sorted=True)
            threshold = candidate_values[:, -1]
            finite = torch.isfinite(threshold)
            match_value = torch.where(finite, threshold, torch.full_like(threshold, float("nan")))
            selected_ties = (candidate_values == match_value.unsqueeze(1)).sum(dim=1)
            total_ties = (masked == match_value.unsqueeze(1)).sum(dim=1)
            crossed = finite & (counts_t > budget) & (total_ties > selected_ties)
            high_nonfinite = (~torch.isfinite(candidate_values)) & (~torch.isneginf(candidate_values))
            if not bool((crossed.any() | high_nonfinite.any()).item()):
                fast_values, fast_order = candidate_values, candidate_order
        if stable_ties and fast_order is None:
            # QSA scores are non-negative fp32. Their positive IEEE bit order
            # follows numeric order; the low 32 bits prefer smaller block IDs.
            # Non-finite rows are kept at the bottom and filtered by the packer.
            normalized = torch.where(masked == 0, 0.0, masked).contiguous()
            bits = normalized.view(torch.int32).to(torch.int64)
            cols = torch.arange(n_blocks, dtype=torch.int64, device=device)
            rank_keys = (bits << 32) | (0xffffffff - cols.unsqueeze(0))
            rank_keys = rank_keys.masked_fill(~torch.isfinite(masked), -(1 << 63))
            order = torch.topk(rank_keys, k=take, dim=1, largest=True, sorted=False).indices
            values = torch.gather(masked, 1, order)
        elif fast_order is not None:
            values, order = fast_values, fast_order
        else:
            values, order = torch.topk(masked, k=take, dim=1, largest=True, sorted=True)
        if (os.environ.get("K8V4_QSA_PACK_TOPK", "0") == "1" and ratio == 4
                and width == (take + 1) * ratio and take <= 512 and n_blocks >= budget):
            qsa = ops()
            if qsa is None or not hasattr(qsa, "qsa_pack_topk"):
                raise RuntimeError("QSA top-k packing requires the experimental library")
            qsa.qsa_pack_topk(values, order, counts_t, cells_t, out, ratio)
            return out
    else:
        order = torch.argsort(masked, dim=1, descending=True, stable=True)[:, :take]
        values = torch.gather(masked, 1, order)
    ids = torch.where(values.isfinite(), order, torch.full_like(order, -1))
    own = torch.div(cells_t, ratio, rounding_mode="floor")
    blocks = torch.cat((ids, own.unsqueeze(1)), dim=1)
    blocks, _ = torch.sort(blocks, dim=1)
    previous = torch.cat((torch.full((queries, 1), -2, dtype=blocks.dtype, device=device), blocks[:, :-1]), dim=1)
    keep_block = (blocks >= 0) & (blocks != previous)
    offsets = torch.arange(ratio, device=device)
    tokens = blocks.unsqueeze(-1) * ratio + offsets
    own_width = (cells_t.remainder(ratio) + 1).view(queries, 1, 1)
    is_own = blocks.unsqueeze(-1).eq(own.view(queries, 1, 1))
    span = torch.where(is_own, own_width, torch.full((queries, 1, 1), ratio, dtype=torch.int32, device=device))
    keep = keep_block.unsqueeze(-1) & (offsets.view(1, 1, ratio) < span) & (tokens <= cells_t.view(queries, 1, 1))
    flat_tok = tokens.reshape(queries, -1).to(torch.int32)
    flat_keep = keep.reshape(queries, -1)
    packed = torch.where(flat_keep, flat_tok, torch.full_like(flat_tok, -1))
    copy = min(width, int(packed.shape[1]))
    out[:, :copy] = packed[:, :copy]
    positions = torch.arange(width, device=device)
    full = torch.where(
        positions.unsqueeze(0) <= cells_t.unsqueeze(1),
        positions.unsqueeze(0),
        torch.full((1, width), -1, device=device),
    ).to(torch.int32)
    return torch.where(within.unsqueeze(1), full, out)


def attend_gathered_sdpa(query, views, block_row, visible, pages_per_block: int):
    """Prefill attention on the selected tokens with oneDNN SDPA.

    The selected ids are gathered once per tile and every other column is
    masked off. The K8/V4 cache stays in place; this does not read the
    unselected pages.
    """
    if query.ndim != 3 or int(query.shape[-1]) != D:
        raise ValueError("query is [q_len, heads, 256]")
    if visible.ndim != 2 or int(visible.shape[0]) != int(query.shape[0]):
        raise ValueError("visible is [q_len, width]")
    q_len = int(query.shape[0])
    if q_len == 0 or int(visible.shape[1]) == 0:
        return torch.zeros_like(query)
    if q_len > 2048:
        out = torch.empty_like(query)
        for start in range(0, q_len, 2048):
            end = min(q_len, start + 2048)
            out[start:end] = attend_gathered_sdpa(
                query[start:end], views, block_row, visible[start:end], pages_per_block
            )
        return out
    device = query.device
    vis = visible if visible.dtype == torch.int32 and visible.device == device else visible.to(device=device, dtype=torch.int32)
    present = vis >= 0
    if not bool(present.any()):
        return torch.zeros_like(query)
    uniq_t = time.perf_counter()
    uniq = torch.unique(vis[present], sorted=True)
    union = int(uniq.shape[0])
    if os.environ.get("K8V4_QSA_STAGE", "0") == "1":
        torch.xpu.synchronize()
        path = os.environ.get("K8V4_QSA_STAGE_FILE", "/ops/attn-profile/qsa-stage.txt")
        with open(path, "a", encoding="utf-8") as handle:
            handle.write("union q=%d u=%d ms=%.1f\n" % (q_len, union, (time.perf_counter() - uniq_t) * 1000.0))
    if union > 16384:
        mid = q_len // 2
        out = torch.empty_like(query)
        out[:mid] = attend_gathered_sdpa(query[:mid], views, block_row, vis[:mid], pages_per_block)
        out[mid:] = attend_gathered_sdpa(query[mid:], views, block_row, vis[mid:], pages_per_block)
        return out
    key, value = _gather_tokens_fp16(views, block_row, uniq.to(torch.int64), pages_per_block)
    columns = torch.searchsorted(uniq, vis.clamp(min=0))
    neg = torch.finfo(torch.float16).min
    mask = torch.full((q_len, union), neg, dtype=torch.float16, device=device)
    rows = torch.arange(q_len, device=device).unsqueeze(1).expand_as(vis)
    mask[rows[present], columns[present]] = 0
    q = query.transpose(0, 1).unsqueeze(0)
    k = key.permute(1, 0, 2).unsqueeze(0)
    v = value.permute(1, 0, 2).unsqueeze(0)
    attended = torch.nn.functional.scaled_dot_product_attention(
        q, k, v, attn_mask=mask.view(1, 1, q_len, union), scale=0.0625, enable_gqa=True
    )
    return attended.squeeze(0).transpose(0, 1).contiguous()


def _visible_op():
    table = ops()
    if table is None or not hasattr(table, "qsa_visible"):
        return None
    return table


def _visible_width(counts: list[int], cells: list[int], hyper: QsaHyper, force_all: bool) -> int:
    """Upper bound on the token list. The kernel writes fewer and leaves ``-1``."""
    width = 1
    budget = hyper.n_sel
    for count, cell in zip(counts, cells):
        if force_all or int(count) <= budget:
            need = int(cell) + 1
        else:
            need = (budget + 1) * hyper.ratio
        if need > width:
            width = need
    return width


def _visible_xpu(
    scores: torch.Tensor,
    counts: list[int],
    cells: list[int],
    hyper: QsaHyper,
    force_all: bool,
) -> torch.Tensor:
    row = scores if scores.dtype == torch.float32 and scores.is_contiguous() else scores.contiguous().float()
    if row.ndim != 2:
        raise ValueError("scores are [queries, blocks]")
    counts_t = torch.tensor(list(counts), dtype=torch.int32, device=row.device)
    cells_t = torch.tensor(list(cells), dtype=torch.int32, device=row.device)
    width = _visible_width(counts, cells, hyper, force_all)
    out = torch.full((int(row.shape[0]), width), -1, dtype=torch.int32, device=row.device)
    _visible_op().qsa_visible(
        row, counts_t, cells_t, out, int(hyper.n_sel), int(hyper.ratio), 1 if force_all else 0
    )
    return out


def topk_ids(scores: torch.Tensor, k: int) -> torch.Tensor:
    """``[queries, k]`` int32 block ids, best score first.

    Ties keep the lower block id. ``scores`` is ``[queries, blocks]``.
    ``k`` is from 1 through the block count. When ``k`` equals the block
    count the ids are still score order, not ``range(n)``.
    """
    if scores.ndim != 2:
        raise ValueError("scores are [queries, blocks]")
    k = int(k)
    n_blocks = int(scores.shape[1])
    if k < 1 or k > n_blocks:
        raise ValueError("k")
    if scores.device.type == "xpu" and library_path() is not None:
        row = scores
        if row.dtype != torch.float32 or not row.is_contiguous():
            row = row.contiguous().float()
        ids = torch.empty((row.shape[0], k), dtype=torch.int32, device=row.device)
        ops().qsa_topk(row, ids, k)
        return ids
    chosen = []
    for i in range(int(scores.shape[0])):
        if k == n_blocks:
            values = scores[i].detach().to(dtype=torch.float64).cpu().tolist()
            chosen.append(sorted(range(n_blocks), key=lambda j: (-float(values[j]), j)))
        else:
            chosen.append(topk_block_ids(scores[i], k))
    return torch.tensor(chosen, dtype=torch.int32, device=scores.device)


def rows_from_packed(packed: torch.Tensor) -> list[list[int]]:
    """Drop ``-1`` padding. The remaining cells stay in row order."""
    if packed.ndim != 2:
        raise ValueError("packed visible is [queries, width]")
    cpu = packed.detach().to(device="cpu")
    rows: list[list[int]] = []
    for local in range(int(cpu.shape[0])):
        rows.append([int(token) for token in cpu[local].tolist() if int(token) >= 0])
    return rows


def attend_selected(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    visible: list[list[int]] | torch.Tensor,
    pages_per_block: int,
) -> torch.Tensor:
    """Sparse K8/V4 attention for one request.

    ``query`` is ``[q_len, heads, dim]``. ``visible`` is either one token
    list per query, or a ``[q_len, width]`` int32 matrix padded with ``-1``.
    The matrix is the ``qsa_visible`` output and is passed through on XPU.
    The Python path quantizes with ``oracle.quant_k`` after promoting the
    query to fp64, which is exact for fp32 and fp16 values. An XPU query
    whose KV views are also on XPU calls ``qsa_sparse_attn`` when the
    library loads. That kernel quantizes Q with ``sycl::rint``, matching
    the dense K8/V4 kernel, so halfway cases can differ from the Python
    round-half-away rule.
    """
    if query.ndim != 3:
        raise ValueError("query is [q_len, heads, dim]")
    if isinstance(visible, torch.Tensor):
        return _attend_packed(query, views, block_row, int(seq_len), visible, int(pages_per_block))
    if len(visible) != int(query.shape[0]):
        raise ValueError("one visible list per query")
    q_len = int(query.shape[0])
    if _xpu_ready(query, views, block_row):
        return _attend_xpu(query, views, block_row, int(seq_len), visible, int(pages_per_block))
    lists = query.detach().to(dtype=torch.float64).cpu().tolist()
    row = block_row.detach().to(device="cpu")
    out = sparse_from_views(
        lists,
        views,
        row,
        int(seq_len),
        q_len,
        allow_tokens(visible),
        int(pages_per_block),
    )
    return torch.tensor(out, dtype=query.dtype, device=query.device)


# 1/sqrt(256). The dense K8/V4 kernel and the author's flash path use this scale.
_ATTN_SCALE = 0.0625
_FAST_TILE = 64


def _kernel_slots(block_row: torch.Tensor, tokens: torch.Tensor, pages_per_block: int):
    """Logical token ids to ``(kernel page, offset in the 64-token page)``."""
    logical = torch.div(tokens, PAGE, rounding_mode="floor")
    off = tokens - logical * PAGE
    ratio = int(pages_per_block)
    if ratio == 1:
        phys = block_row[logical]
    else:
        entry = torch.div(logical, ratio, rounding_mode="floor")
        sub = logical - entry * ratio
        phys = block_row[entry] * ratio + sub
    return phys.to(torch.long), off.to(torch.long)


def _dequant_selected(compact, local_page, off, head: int):
    """Dequantize selected slots from pages already pulled by ``index_select``.

    ``compact`` holds one contiguous copy of those pages. Slot ``local*64+off``
    is one ``index_select`` on that copy, which is the gather the K8/V4
    prefill uses, not a 2-index walk of the live paged cache.
    """
    slot = local_page * PAGE + off
    k_pages = compact["k"]
    k_flat = k_pages[:, :, head, :].reshape(-1, D)
    scale_flat = compact["k_scale"][:, :, head].reshape(-1)
    key = k_flat.index_select(0, slot).to(torch.float16)
    key = key * scale_flat.index_select(0, slot).to(torch.float16).unsqueeze(-1)
    packed = compact["v"][:, :, head, :].reshape(-1, D // 2).index_select(0, slot).to(torch.int32)
    scale = compact["v_scale"][:, :, head].reshape(-1).index_select(0, slot).to(torch.float16).unsqueeze(-1)
    zero = compact["v_zero"][:, :, head].reshape(-1).index_select(0, slot).to(torch.float16).unsqueeze(-1)
    even = (packed & 15).to(torch.float16)
    odd = (packed >> 4).to(torch.float16)
    value = torch.stack(((even - zero) * scale, (odd - zero) * scale), dim=-1).reshape(slot.shape[0], D)
    return key, value


def _compact_pages(views, phys: torch.Tensor):
    """One ``index_select`` of the pages this tile touches."""
    uniq, inverse = torch.unique(phys, return_inverse=True)
    return {
        "k": views["k"].index_select(0, uniq),
        "k_scale": views["k_scale"].index_select(0, uniq),
        "v": views["v"].index_select(0, uniq),
        "v_scale": views["v_scale"].index_select(0, uniq),
        "v_zero": views["v_zero"].index_select(0, uniq),
    }, inverse


def attend_selected_fast(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    visible: torch.Tensor,
    pages_per_block: int,
) -> torch.Tensor:
    """Attention over the selected tokens, using dense GEMMs.

    This is the author's flash-attention path: the selected 4-token blocks
    are the only keys, and the score is a real matrix multiply. ``visible``
    is ``[q_len, width]`` int32 with ``-1`` in the padding. The scalar
    ``qsa_sparse_attn`` loop is not used.
    """
    if query.ndim != 3 or int(query.shape[-1]) != D:
        raise ValueError("query is [q_len, heads, 256]")
    if visible.ndim != 2 or int(visible.shape[0]) != int(query.shape[0]):
        raise ValueError("visible is [q_len, width]")
    q_len = int(query.shape[0])
    hq = int(query.shape[1])
    hkv = int(views["k"].shape[2])
    if hq % hkv != 0:
        raise ValueError("query heads are not a multiple of KV heads")
    gqa = hq // hkv
    width = int(visible.shape[1])
    if q_len == 0 or width == 0:
        return torch.zeros_like(query)
    row = block_row if block_row.dtype == torch.int32 else block_row.to(dtype=torch.int32)
    if row.device != query.device:
        row = row.to(device=query.device)
    vis = visible
    if vis.dtype != torch.int32 or vis.device != query.device:
        vis = vis.to(device=query.device, dtype=torch.int32)
    out = torch.empty_like(query)
    neg = torch.finfo(torch.float32).min
    for tok0 in range(0, q_len, _FAST_TILE):
        tok1 = min(q_len, tok0 + _FAST_TILE)
        ids = vis[tok0:tok1]
        valid = ids >= 0
        flat_ids = ids.clamp(min=0).reshape(-1)
        phys, off = _kernel_slots(row, flat_ids, pages_per_block)
        compact, local = _compact_pages(views, phys)
        local = local.view(tok1 - tok0, width)
        off = off.view(tok1 - tok0, width)
        q_tile = query[tok0:tok1]
        for head in range(hkv):
            key, value = _dequant_selected(compact, local.reshape(-1), off.reshape(-1), head)
            key = key.view(tok1 - tok0, width, D)
            value = value.view(tok1 - tok0, width, D)
            qg = q_tile[:, head * gqa : (head + 1) * gqa, :].to(torch.float16)
            scores = torch.matmul(qg, key.transpose(-1, -2)).float() * _ATTN_SCALE
            scores = scores.masked_fill(~valid.unsqueeze(1), neg)
            probs = torch.nan_to_num(torch.softmax(scores, dim=-1), nan=0.0).to(torch.float16)
            mixed = torch.matmul(probs, value)
            out[tok0:tok1, head * gqa : (head + 1) * gqa, :] = mixed.to(dtype=query.dtype)
    return out


def _gather_tokens_fp16(views, block_row, token_ids, pages_per_block: int):
    """Selected logical tokens as fp16 ``[count, HKV, 256]`` K and V."""
    ids = token_ids.to(dtype=torch.long).reshape(-1)
    count = int(ids.numel())
    hkv = int(views["k"].shape[2])
    phys, off = _kernel_slots(block_row, ids, pages_per_block)
    compact, local = _compact_pages(views, phys)
    slot = local * PAGE + off
    key = torch.empty(count, hkv, D, dtype=torch.float16, device=ids.device)
    value = torch.empty_like(key)
    for head in range(hkv):
        k_flat = compact["k"][:, :, head, :].reshape(-1, D).index_select(0, slot).to(torch.float32)
        k_scale = compact["k_scale"][:, :, head].reshape(-1).index_select(0, slot).to(torch.float32)
        key[:, head, :] = (k_flat * k_scale.unsqueeze(-1)).to(torch.float16)
        packed = compact["v"][:, :, head, :].reshape(-1, D // 2).index_select(0, slot).to(torch.int32)
        v_scale = compact["v_scale"][:, :, head].reshape(-1).index_select(0, slot).to(torch.float32)
        v_zero = compact["v_zero"][:, :, head].reshape(-1).index_select(0, slot).to(torch.float32)
        even = (packed & 15).to(torch.float32)
        odd = (packed >> 4).to(torch.float32)
        decoded = torch.stack(
            ((even - v_zero.unsqueeze(-1)) * v_scale.unsqueeze(-1), (odd - v_zero.unsqueeze(-1)) * v_scale.unsqueeze(-1)),
            dim=-1,
        )
        value[:, head, :] = decoded.reshape(count, D).to(torch.float16)
    return key.contiguous(), value.contiguous()


_DECODE_PACK = {}
_DIRECT_WORK = {}


import torch


def attend_shared_prefill(query, scores, counts, cells, views, block_row, pages_per_block, budget_blocks):
    """One learned top-2048 for the chunk, plus each query's own 4-token block.

    ``pages_per_block`` is the K8/V4 page ratio. Token blocks are always 4.
    """
    import torch.nn.functional as F
    if query.ndim != 3 or scores.ndim != 2:
        raise RuntimeError("shared QSA shapes")
    q_len = int(query.shape[0])
    device = query.device
    token_ratio = 4
    pages_per_block = int(pages_per_block)
    budget = int(budget_blocks)
    if q_len < 1 or int(scores.shape[0]) not in (1, q_len):
        raise RuntimeError("shared QSA query count")
    cells_t = torch.tensor(cells, dtype=torch.int64, device=device)
    row = scores[-1]
    row = torch.where(torch.isfinite(row), row, torch.full_like(row, -1.0e30))
    take = min(budget, int(row.shape[0]))
    blocks = torch.topk(row, k=take).indices.to(torch.int64)
    shared = (blocks.unsqueeze(1) * token_ratio + torch.arange(token_ratio, device=device)).reshape(-1)
    own_block = torch.div(cells_t, token_ratio, rounding_mode="floor")
    own = own_block.unsqueeze(1) * token_ratio + torch.arange(token_ratio, device=device)
    own = own.masked_fill(own > cells_t.unsqueeze(1), -1)
    keys = torch.unique(torch.cat((shared, own.reshape(-1))), sorted=True)
    keys = keys[keys >= 0]
    key, value = _gather_tokens_fp16(views, block_row, keys, pages_per_block)
    shared_sorted, _ = torch.sort(shared)
    pos = torch.searchsorted(shared_sorted, keys).clamp(max=max(shared_sorted.numel() - 1, 0))
    in_shared = shared_sorted[pos] == keys
    key_block = torch.div(keys, token_ratio, rounding_mode="floor")
    allowed = (keys.unsqueeze(0) <= cells_t.unsqueeze(1)) & (
        in_shared.unsqueeze(0) | (key_block.unsqueeze(0) == own_block.unsqueeze(1))
    )
    neg = torch.finfo(torch.float16).min
    mask = torch.where(
        allowed,
        torch.zeros((), dtype=torch.float16, device=device),
        torch.full((), neg, dtype=torch.float16, device=device),
    )
    qq = query.transpose(0, 1).unsqueeze(0)
    kk = key.permute(1, 0, 2).unsqueeze(0).contiguous()
    vv = value.permute(1, 0, 2).unsqueeze(0).contiguous()
    attended = F.scaled_dot_product_attention(
        qq, kk, vv, attn_mask=mask.unsqueeze(0).unsqueeze(0), scale=0.0625, enable_gqa=True
    )
    width = budget * token_ratio + token_ratio
    if int(width) > 2052:
        raise RuntimeError("shared QSA row %d exceeds the 2048+block budget" % width)
    visible = torch.full((q_len, width), -1, dtype=torch.int32, device=device)
    shared_ok = shared.unsqueeze(0) <= cells_t.unsqueeze(1)
    visible[:, : shared.numel()] = torch.where(
        shared_ok, shared.to(torch.int32).unsqueeze(0), visible[:, : shared.numel()]
    )
    tail = own.clamp(min=-1).to(torch.int32)
    visible[:, shared.numel() : shared.numel() + tail.shape[1]] = tail
    return attended.squeeze(0).transpose(0, 1).contiguous(), visible


def coerce_visible_matrix(visible, q_len: int, device) -> torch.Tensor:
    """Return ``[queries, width]`` int token ids.

    The multi-request planner hands each request a Python list of rows.
    A single decode query can also arrive as a 1-D vector. Both are the
    same selected-token matrix the K8/V4 kernel reads.
    """
    if torch.is_tensor(visible):
        if visible.ndim == 2 and int(visible.shape[0]) == int(q_len):
            return visible
        if visible.ndim == 1 and int(q_len) == 1:
            return visible.view(1, -1)
        raise RuntimeError("direct QSA decode needs a visible-token matrix")
    rows = [list(row) for row in visible]
    width = 1
    for row in rows:
        if len(row) > width:
            width = len(row)
    out = torch.full((int(q_len), width), -1, dtype=torch.int32, device=device)
    for i, row in enumerate(rows[: int(q_len)]):
        if row:
            out[i, : len(row)] = torch.tensor(row, dtype=torch.int32, device=device)
    return out


def attend_decode_direct(query, views, block_row, visible, pages_per_block: int, out=None):
    """Split-key attention directly over selected quantized cache cells."""
    if query.device.type != "xpu" or query.dtype != torch.float16:
        raise RuntimeError("direct QSA decode requires XPU float16 queries")
    q_len, heads, _dim = query.shape
    visible = coerce_visible_matrix(visible, q_len, query.device)
    if visible.shape[0] != q_len:
        raise RuntimeError("direct QSA decode query count")
    width = int(visible.shape[1])
    # Short queries need many key splits so the 2048-token walk is parallel.
    # A long prefill already has enough queries; one split keeps the partial
    # buffer small.
    split_width = 64 if int(query.shape[0]) <= 16 else max(int(visible.shape[1]), 1)
    prefill_split = int(os.environ.get("K8V4_QSA_PREFILL_SPLIT", "0"))
    if int(query.shape[0]) > 16 and prefill_split > 0:
        split_width = prefill_split
    splits = (width + split_width - 1) // split_width
    key = (query.device.type, query.device.index, int(q_len), int(heads), splits)
    state = _DIRECT_WORK.get(key)
    if state is None:
        partial = torch.empty((q_len, heads, splits, D), dtype=torch.float32, device=query.device)
        ml = torch.empty((q_len, heads, splits, 2), dtype=torch.float32, device=query.device)
        state = (partial, ml)
        _DIRECT_WORK[key] = state
    partial, ml = state
    if out is None:
        out = torch.empty_like(query)
    qsa = ops()
    if qsa is None or not hasattr(qsa, "qsa_direct_attn"):
        raise RuntimeError("direct QSA decode requires an updated libxe2_qsa.so")
    vis = visible.to(device=query.device, dtype=torch.int32)
    hkv = int(views["k"].shape[2])
    gqa = int(query.shape[1]) // hkv if hkv else 0
    # Three query heads share one KV load. Six heads in one subgroup spilled
    # and was slower; short decode stays on the split direct kernel.
    if (int(query.shape[0]) > 16 and gqa > 0 and gqa % 3 == 0
            and prefill_split > 0 and hasattr(qsa, "qsa_grp3_split")):
        qsa.qsa_grp3_split(query, views["k"], views["k_scale"], views["v"],
                           views["v_scale"], views["v_zero"], block_row, vis,
                           partial, ml, out, int(pages_per_block), split_width)
        return out
    if (int(query.shape[0]) > 16 and gqa > 0 and gqa % 3 == 0
            and hasattr(qsa, "qsa_grp3_attn")):
        qsa.qsa_grp3_attn(query, views["k"], views["k_scale"], views["v"],
                          views["v_scale"], views["v_zero"], block_row, vis,
                          out, int(pages_per_block))
        return out
    qsa.qsa_direct_attn(query, views["k"], views["k_scale"], views["v"],
                         views["v_scale"], views["v_zero"], block_row,
                         vis, partial, ml, out, int(pages_per_block), split_width)
    return out


def attend_decode_k8v4(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    visible: torch.Tensor,
    pages_per_block: int,
) -> torch.Tensor:
    """Run the K8/V4 decode kernel on each query's selected tokens.

    Selected rows are stored into a small page cache and ``int8k_int4v_attn_batch``
    attends that prefix. A query length of 1 sees every packed token, which is
    the selected set. The opt-in native packer preserves the original K8/V4
    bytes; this remains a staging copy, not direct block-indexed attention.
    """
    from k8v4_v030.plan import workspace_programs
    from k8v4_v030.scratch import Scratch

    if os.environ.get("K8V4_QSA_DIRECT", "0") == "1":
        return attend_decode_direct(query, views, block_row, visible, pages_per_block)
    if not torch.is_tensor(visible):
        raise TypeError("decode visible rows must be a tensor")
    q_len, hq, dim = query.shape
    if dim != D:
        raise RuntimeError("decode query dim")
    hkv = int(views["k"].shape[2])
    layout = PageLayout.for_heads(hq, hkv)
    native_pack = os.environ.get("K8V4_QSA_PACK_NATIVE", "0") == "1"
    vis = visible.to(device=query.device, dtype=torch.int32 if native_pack else torch.long)
    width = int(vis.shape[1])
    n_pages = max(1, (width + PAGE - 1) // PAGE)
    device = query.device
    key = (device.type, getattr(device, "index", None), hkv, n_pages)
    packed_state = _DECODE_PACK.get(key)
    if packed_state is None:
        raw = torch.zeros(n_pages * layout.page_bytes, dtype=torch.int8, device=device)
        packed = bind_regions(raw, layout)
        table = torch.arange(n_pages, dtype=torch.int32, device=device).view(1, n_pages)
        nprog = workspace_programs(n_pages, 1, layout)
        scratch = Scratch(device, layout, nprog, max_store_tokens=1, max_out_tokens=16)
        lengths = torch.empty((1, 2), dtype=torch.int32, device=device)
        packed_state = (packed, table, scratch, nprog, lengths)
        _DECODE_PACK[key] = packed_state
    packed, table, scratch, nprog, lengths = packed_state
    partials, m_state, l_state, merged = scratch.workspace(nprog)
    out = torch.empty_like(query)
    row = block_row if block_row.device == device else block_row.to(device)
    for i in range(q_len):
        if native_pack:
            qsa = ops()
            if qsa is None or not hasattr(qsa, "qsa_pack_kv"):
                raise RuntimeError("native QSA packing requires an updated libxe2_qsa.so")
            qsa.qsa_pack_kv(
                views["k"], views["k_scale"], views["v"], views["v_scale"], views["v_zero"],
                row, vis[i], packed["k"], packed["k_scale"], packed["v"],
                packed["v_scale"], packed["v_zero"], lengths, int(pages_per_block),
            )
            q_buf, out_buf = scratch.attention_pair(1)
            q_buf.copy_(query[i : i + 1])
            kv_ops().int8k_int4v_attn_batch(
                q_buf, scratch.q8, scratch.q_scale, packed["k"], packed["k_scale"],
                packed["v"], packed["v_scale"], packed["v_zero"], table,
                lengths[:, 0], lengths, partials, m_state, l_state, merged, out_buf, 1, 1,
            )
            out[i : i + 1].copy_(out_buf)
            continue
        ids = vis[i]
        ids = ids[ids >= 0]
        count = int(ids.numel())
        if count < 1:
            out[i].zero_()
            continue
        key_fp, value_fp = _gather_tokens_fp16(views, row, ids, pages_per_block)
        slots = torch.arange(count, device=device, dtype=torch.int64)
        kv_ops().kv_store_paged(
            key_fp,
            value_fp,
            slots,
            packed["k"],
            packed["k_scale"],
            packed["v"],
            packed["v_scale"],
            packed["v_zero"],
        )
        q_buf, out_buf = scratch.attention_pair(1)
        q_buf.copy_(query[i : i + 1])
        seq = torch.tensor([count], dtype=torch.int32, device=device)
        # Element 0 is the max length. Element 1 is this query's end.
        # Both are the packed count, so the one query attends every selected token.
        vis_len = torch.tensor([[count, count]], dtype=torch.int32, device=device)
        kv_ops().int8k_int4v_attn_batch(
            q_buf,
            scratch.q8,
            scratch.q_scale,
            packed["k"],
            packed["k_scale"],
            packed["v"],
            packed["v_scale"],
            packed["v_zero"],
            table,
            seq,
            vis_len,
            partials,
            m_state,
            l_state,
            merged,
            out_buf,
            1,
            1,
        )
        out[i : i + 1].copy_(out_buf)
    return out


def _launch_sparse(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    visible: torch.Tensor,
    pages_per_block: int,
    seq_len: int,
) -> torch.Tensor:
    if os.environ.get("K8V4_QSA_SCALAR", "0") == "1":
        return _launch_sparse_scalar(query, views, block_row, visible, pages_per_block, seq_len)
    return attend_selected_fast(query, views, block_row, visible, pages_per_block)


def _launch_sparse_scalar(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    visible: torch.Tensor,
    pages_per_block: int,
    seq_len: int,
) -> torch.Tensor:
    row = block_row if block_row.dtype == torch.int32 else block_row.to(dtype=torch.int32)
    if row.device != query.device:
        row = row.to(device=query.device)
    vis = visible
    if vis.dtype != torch.int32 or not vis.is_contiguous() or vis.device != query.device:
        vis = vis.to(device=query.device, dtype=torch.int32).contiguous()
    out = torch.empty_like(query)
    ops().qsa_sparse_attn(
        query,
        views["k"],
        views["k_scale"],
        views["v"],
        views["v_scale"],
        views["v_zero"],
        row,
        vis,
        out,
        int(pages_per_block),
        int(seq_len),
    )
    return out


def _attend_packed(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    visible: torch.Tensor,
    pages_per_block: int,
) -> torch.Tensor:
    """Attend a ``-1``-padded id matrix already filtered to causal cells."""
    if visible.ndim != 2 or int(visible.shape[0]) != int(query.shape[0]):
        raise ValueError("visible is [q_len, width]")
    row = block_row if block_row.dtype == torch.int32 else block_row.to(dtype=torch.int32)
    if row.device != query.device:
        row = row.to(device=query.device)
    if _xpu_ready(query, views, row):
        return _launch_sparse(query, views, row, visible, pages_per_block, seq_len)
    return attend_selected(
        query,
        views,
        block_row,
        seq_len,
        rows_from_packed(visible),
        pages_per_block,
    )


def _attend_xpu(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    visible: list[list[int]],
    pages_per_block: int,
) -> torch.Tensor:
    rows = causal_visible_rows(visible, seq_len, int(query.shape[0]))
    width = 1
    for row in rows:
        if len(row) > width:
            width = len(row)
    packed = torch.full((len(rows), width), -1, dtype=torch.int32)
    for i, row in enumerate(rows):
        if row:
            packed[i, : len(row)] = torch.tensor(row, dtype=torch.int32)
    return _launch_sparse(
        query, views, block_row, packed.to(device=query.device), pages_per_block, seq_len
    )
