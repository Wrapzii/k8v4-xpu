"""One paged indexer score for every request in a decode step.

The c4 graph path used to call ``score_pooled_paged`` once per request at a
fixed width of up to 65536 blocks. Each call reread pooled keys, including
columns past that request's live prefix. This module scores the whole roster
in one launch. Each request keeps its own block-table row.

The captured output width stays at the static block-table fit. A graph
recorded on a short warmup must replay a longer context, so Python does not
read a device count with ``.item()`` while capturing or on the device decode
path. The companion kernel (``XE2_QSA_BATCH_LIB``, namespace
``xe2_qsa_batch``) returns before the pooled-key load when the column is past
that request's count or the pooled row is invalid. CPU counts are already on
the host, and those calls clamp the width to the longest live prefix.

CPU numerics are the fp64 ``score_blocks`` contract. The XPU kernel is the
same fp32 subgroup dot as ``qsa_score_paged`` (sum of relu over 4 heads, no
1/sqrt(128)). Finite XPU values should match the fp64 rows within a few ulps
of fp32; columns past the count or an invalid pooled row are ``-inf``.

INT8 pooled keys are dequantized inside ``qsa_score_paged_multi_i8`` for the
rows the kernel actually loads. A full-pool cast is the fallback when that
entry point is not in the loaded library.
"""

from __future__ import annotations

import os

import torch

from k8v4_v030.qsa_pooled_quant import dequantize_pooled_rows
from k8v4_v030.qsa_ref import score_blocks

_PAGE = 64
_LOADED: str | None = None


def static_score_width(table_n: int, ratio: int, pooled_rows: int, decode_blocks: int = 65536) -> int:
    """Block-table fit, clamped to the pooled allocation and ``decode_blocks``.

    This is the width ``_run_graph_decode`` already used. It is a Python
    shape, not a read of live token counts.
    """
    fit = max(1, (int(table_n) * int(ratio) * _PAGE) // 4 - 1)
    pooled_blocks = max(1, int(pooled_rows))
    return min(int(decode_blocks), fit, pooled_blocks)


def scored_width(static_width: int, counts, *, capturing: bool, host_counts: bool) -> int:
    """Width passed to the score launch.

    Capture and any device-resident count keep ``static_width``. Shrinking to
    a warmup's live prefix would bake that short width into the graph.
    Reading the device max with ``.item()`` would also sync the decode step.
    A count tensor that is already on the CPU may clamp to its max, which is
    the longest live prefix in the roster.
    """
    static_width = int(static_width)
    if static_width < 1:
        raise ValueError("QSA score width must be positive")
    if capturing or not host_counts:
        return static_width
    if torch.is_tensor(counts):
        if torch.device(counts.device).type != "cpu" or int(counts.numel()) == 0:
            return static_width
        live = int(counts.detach().to(dtype=torch.int64).reshape(-1).max().item())
    elif counts is None or len(counts) == 0:
        return static_width
    else:
        live = int(max(int(v) for v in counts))
    if live < 1:
        return 1
    return min(static_width, live)


def batch_library_path() -> str | None:
    """Companion library. Never the shared ``libxe2_qsa.so``."""
    raw = os.environ.get("XE2_QSA_BATCH_LIB", "").strip()
    if raw:
        return raw
    default = os.path.abspath(
        os.path.join(os.path.dirname(__file__), os.pardir, "build", "libxe2_qsa_batch.so")
    )
    if os.path.isfile(default):
        return default
    return None


def batch_ops():
    """``torch.ops.xe2_qsa_batch``, or None when the companion file is absent.

    CPU callers must not call this. Loading the library is an XPU operation.
    """
    global _LOADED
    path = batch_library_path()
    if path is None:
        return None
    if not os.path.isfile(path):
        raise FileNotFoundError("QSA batch library is not at %s" % path)
    if _LOADED != path:
        torch.ops.load_library(path)
        _LOADED = path
    return torch.ops.xe2_qsa_batch


def _as_fp32_pooled(pooled: torch.Tensor, scales: torch.Tensor | None) -> torch.Tensor:
    if pooled.dtype != torch.int8:
        return pooled
    return dequantize_pooled_rows(pooled, scales)


def _batched_i8_kernel(native, pooled: torch.Tensor, scales) -> bool:
    """The companion library can apply int8 row scales inside the score.

    Decoding used to cast every pooled row to fp32 on each full-attention
    layer. The int8 entry point loads a row only when that column is live.
    """
    if native is None or pooled.dtype != torch.int8 or not torch.is_tensor(scales):
        return False
    return hasattr(native, "qsa_score_paged_multi_i8")


def _page_index(block_row: torch.Tensor, n_blocks: int, ratio: int) -> tuple[torch.Tensor, torch.Tensor]:
    """Map logical indexer blocks to pooled micros.

    Matches ``qsa_score_paged``: token ``block * 4``, page ``token // 64``,
    then the block table. ``bad`` is true when that page is outside the row
    or negative. Pool validity is applied by the caller.
    """
    ratio = int(ratio)
    if ratio < 1:
        raise ValueError("pages_per_block")
    blocks = torch.arange(int(n_blocks), dtype=torch.int64)
    tok = blocks * 4
    logical = torch.div(tok, _PAGE, rounding_mode="floor")
    off = tok.remainder(_PAGE)
    table = block_row.detach().to(device="cpu", dtype=torch.int64).reshape(-1)
    cap = int(table.shape[0]) * ratio
    in_table = logical < cap if cap > 0 else torch.zeros_like(logical, dtype=torch.bool)
    logical_c = logical.clamp(0, max(cap - 1, 0))
    if ratio == 1:
        page = table[logical_c] if int(table.shape[0]) else torch.full_like(logical, -1)
    else:
        base = torch.div(logical_c, ratio, rounding_mode="floor")
        page = table[base] * ratio + logical_c.remainder(ratio)
    micro = torch.div(page * _PAGE + off, 4, rounding_mode="floor")
    bad = (~in_table) | (page < 0)
    return micro, bad


def _score_request_cpu(query: torch.Tensor, pooled: torch.Tensor, valid: torch.Tensor,
                       block_row: torch.Tensor, count: int, ratio: int, n_blocks: int) -> torch.Tensor:
    """One request, fp64, ``-inf`` past the live count and on invalid rows.

    Invalid pooled rows are replaced with zeros before the dot so a NaN key
    cannot leak into a column the kernel would not have loaded.
    """
    micro, bad = _page_index(block_row, n_blocks, ratio)
    pooled_cpu = pooled.detach().to(device="cpu", dtype=torch.float64)
    valid_cpu = valid.detach().to(device="cpu", dtype=torch.bool).reshape(-1)
    n_pool = int(pooled_cpu.shape[0])
    micro_c = micro.clamp(0, max(n_pool - 1, 0))
    in_pool = (micro >= 0) & (micro < n_pool) & ~bad
    if n_pool == 0:
        ok = torch.zeros(int(n_blocks), dtype=torch.bool)
        gathered = torch.zeros((int(n_blocks), int(pooled_cpu.shape[-1])), dtype=torch.float64)
    else:
        ok = in_pool & valid_cpu[micro_c]
        gathered = pooled_cpu.index_select(0, micro_c)
        gathered = torch.where(ok.unsqueeze(-1), gathered, torch.zeros_like(gathered))
    q = query.detach().to(device="cpu", dtype=torch.float64)
    if q.ndim == 3:
        raw = score_blocks(q, gathered)
        if raw.ndim != 2 or int(raw.shape[0]) != 1:
            raise RuntimeError("QSA batch score row has shape %s" % (tuple(raw.shape),))
        scores = raw.reshape(-1)
    else:
        scores = score_blocks(q, gathered).reshape(-1)
    columns = torch.arange(int(n_blocks), dtype=torch.int64)
    live = columns < int(count)
    return scores.masked_fill(~ok | ~live, float("-inf"))


def _score_cpu(query, pooled, valid, block_table, counts, ratio: int, n_blocks: int) -> torch.Tensor:
    rows = []
    count_list = [int(v) for v in counts.detach().to(device="cpu", dtype=torch.int64).reshape(-1).tolist()]
    if len(count_list) != int(query.shape[0]):
        raise ValueError("one live count per request")
    for index, count in enumerate(count_list):
        rows.append(_score_request_cpu(
            query[index], pooled, valid, block_table[index], count, ratio, n_blocks,
        ))
    if not rows:
        raise ValueError("batched QSA score needs a request")
    return torch.stack(rows, dim=0)


def _score_xpu_fallback(query, pooled, valid, block_table, counts, ratio: int, n_blocks: int) -> torch.Tensor:
    """Correct per-request launches when the companion library is absent."""
    from k8v4_v030.qsa_ops import score_pooled_paged
    rows = []
    requests = int(query.shape[0])
    for index in range(requests):
        rows.append(score_pooled_paged(
            query[index:index + 1], pooled, valid, block_table[index],
            counts[index:index + 1], ratio, n_blocks=n_blocks, scales=None,
        ))
    return torch.cat(rows, dim=0)


def score_paged_multi(query: torch.Tensor, pooled: torch.Tensor, valid: torch.Tensor,
                      block_table: torch.Tensor, counts: torch.Tensor, pages_per_block: int,
                      n_blocks: int, scales: torch.Tensor | None = None) -> torch.Tensor:
    """Score ``[requests, 4, 128]`` against one pooled cache and a 2D block table.

    ``counts`` is ``[requests]`` and is the number of live logical blocks for
    the query that row represents (the first live query of that request).
    ``n_blocks`` is the allocated score width. Columns at or past the count,
    and columns whose pooled row is invalid, are ``-inf``.
    """
    if query.ndim != 3 or int(query.shape[1]) != 4 or int(query.shape[2]) != 128:
        raise ValueError("batched QSA query is [requests, 4, 128], got %s" % (tuple(query.shape),))
    if block_table.ndim != 2 or int(block_table.shape[0]) != int(query.shape[0]):
        raise ValueError("batched QSA block table is [requests, pages]")
    if not torch.is_tensor(counts) or int(counts.reshape(-1).shape[0]) != int(query.shape[0]):
        raise ValueError("batched QSA counts are [requests]")
    width = int(n_blocks)
    if width < 1:
        raise ValueError("batched QSA score needs at least one block")
    ratio = int(pages_per_block)
    if ratio < 1:
        raise ValueError("pages_per_block")
    if query.device.type == "cpu" or pooled.device.type == "cpu":
        # Keep the caller's precision. ``score_blocks`` promotes to fp64.
        # Rounding to fp32 here would disagree with the CPU reference.
        pooled_f = _as_fp32_pooled(pooled, scales)
        q = query.detach().to(device="cpu")
        table = block_table.detach().to(device="cpu", dtype=torch.int32)
        count_cpu = counts.detach().to(device="cpu", dtype=torch.int32).reshape(-1)
        return _score_cpu(q, pooled_f.detach().to(device="cpu"), valid.detach().to(device="cpu"),
                          table, count_cpu, ratio, width)
    native = batch_ops()
    q = query if query.dtype == torch.float32 and query.is_contiguous() else query.contiguous().float()
    table = block_table if block_table.dtype == torch.int32 and block_table.is_contiguous() else block_table.to(dtype=torch.int32).contiguous()
    count_x = counts.reshape(-1)
    if count_x.dtype != torch.int32 or not count_x.is_contiguous():
        count_x = count_x.to(dtype=torch.int32).contiguous()
    mask = valid if valid.dtype == torch.bool and valid.is_contiguous() else valid.to(dtype=torch.bool).contiguous()
    if _batched_i8_kernel(native, pooled, scales):
        if int(scales.reshape(-1).numel()) != int(pooled.shape[0]):
            raise ValueError("one fp32 scale per pooled row")
        pool_i8 = pooled if pooled.is_contiguous() else pooled.contiguous()
        scale = scales.reshape(-1)
        if scale.dtype != torch.float32 or not scale.is_contiguous():
            scale = scale.to(dtype=torch.float32).contiguous()
        scores = torch.full((int(q.shape[0]), width), float("-inf"), dtype=torch.float32, device=q.device)
        native.qsa_score_paged_multi_i8(q, pool_i8, scale, mask, table, count_x, scores, ratio)
        return scores
    pooled_f = _as_fp32_pooled(pooled, scales)
    pool = pooled_f if pooled_f.dtype == torch.float32 and pooled_f.is_contiguous() else pooled_f.contiguous().float()
    if native is not None and hasattr(native, "qsa_score_paged_multi"):
        scores = torch.full((int(q.shape[0]), width), float("-inf"), dtype=torch.float32, device=q.device)
        native.qsa_score_paged_multi(q, pool, mask, table, count_x, scores, ratio)
        return scores
    if not getattr(score_paged_multi, "_logged_fallback", False):
        score_paged_multi._logged_fallback = True
        print("QSA_GRAPH batch lib missing; scoring each request", flush=True)
    return _score_xpu_fallback(q, pool, mask, table, count_x, ratio, width)
