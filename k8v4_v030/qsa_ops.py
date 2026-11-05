"""Device entry points for QSA. Python is the numeric contract.

``XE2_QSA_LIB`` loads ``torch.ops.xe2_qsa`` when the file is present. An
unset variable uses ``libxe2_qsa.so`` under the QSA build directory when
that file exists. CPU tensors never load that library. A missing library,
and any CPU tensor, run the same selection through ``qsa_quant_attn``.
"""

from __future__ import annotations

import os

import torch

from k8v4_v030.layout import builtin_q_end
from k8v4_v030.qsa_quant_attn import allow_tokens, sparse_from_views
from k8v4_v030.qsa_ref import QsaHyper, finish_selection, score_blocks, topk_block_ids

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


def attend_selected(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    visible: list[list[int]],
    pages_per_block: int,
) -> torch.Tensor:
    """Sparse K8/V4 attention for one request.

    ``query`` is ``[q_len, heads, dim]``. ``visible[q]`` lists token cells.
    The Python path quantizes with ``oracle.quant_k`` after promoting the
    query to fp64, which is exact for fp32 and fp16 values. An XPU query
    whose KV views are also on XPU calls ``qsa_sparse_attn`` when the
    library loads. That kernel quantizes Q with ``sycl::rint``, matching
    the dense K8/V4 kernel, so halfway cases can differ from the Python
    round-half-away rule.
    """
    if query.ndim != 3:
        raise ValueError("query is [q_len, heads, dim]")
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
    vis = packed.to(device=query.device)
    row = block_row if block_row.dtype == torch.int32 else block_row.to(dtype=torch.int32)
    if row.device != query.device:
        row = row.to(device=query.device)
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
