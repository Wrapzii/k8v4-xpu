"""Batch-shape decisions for the native K8/V4 path.

Decode uses one C++ batch op when every request has the same query length
and that length fits the 64-row tile. Anything else stays on the eager
prefill path. These helpers are host integers taken from the CPU query
starts, so the graph replay does not read them again.
"""

from __future__ import annotations

from collections.abc import Sequence

from k8v4_v030.layout import (
    DECODE_MAX_T,
    D,
    PageLayout,
    attention_pages_per_block,
    max_kernel_pages,
)


def query_lengths(starts: Sequence[int]) -> list[int]:
    """Per-request query lengths from an inclusive ``query_start_loc``."""
    if len(starts) < 2:
        raise ValueError("query_start_loc needs a start and an end")
    lengths: list[int] = []
    for i in range(len(starts) - 1):
        q_len = int(starts[i + 1]) - int(starts[i])
        if q_len < 0:
            raise ValueError("query_start_loc decreased")
        lengths.append(q_len)
    return lengths


def uniform_packed_q_len(starts: Sequence[int]) -> int:
    """Shared query length when every request fits the packed decode tile.

    Returns 0 when the batch is empty, mixed, or any query is longer than
    ``DECODE_MAX_T``. MTP width 7 is inside the tile; a chunked prefill is not.
    """
    lengths = query_lengths(starts)
    if not lengths:
        return 0
    q_len = lengths[0]
    if q_len < 1 or q_len > DECODE_MAX_T:
        return 0
    for item in lengths:
        if item != q_len:
            return 0
    return q_len


def query_segments(starts: Sequence[int]) -> list[tuple[int, int, int]]:
    """Runs of equal query length as ``(first_request, count, q_len)``."""
    lengths = query_lengths(starts)
    if not lengths:
        return []
    segments: list[tuple[int, int, int]] = []
    begin = 0
    for index, q_len in enumerate(lengths):
        if q_len != lengths[begin]:
            segments.append((begin, index - begin, lengths[begin]))
            begin = index
    segments.append((begin, len(lengths) - begin, lengths[begin]))
    return segments


def token_span(starts: Sequence[int], first_request: int, count: int, q_len: int) -> tuple[int, int]:
    """Token offset and width of a tightly packed request run."""
    if count < 1 or q_len < 1:
        raise ValueError("empty segment")
    if first_request < 0 or first_request + count >= len(starts):
        raise ValueError("segment outside query_start_loc")
    tok0 = int(starts[first_request])
    tok1 = int(starts[first_request + count])
    if tok1 - tok0 != count * q_len:
        raise ValueError("query segment is not tightly packed")
    return tok0, tok1 - tok0


def scratch_capacity(
    max_model_len: int,
    manager_block: int,
    kernel_block: int | None,
    max_batched_tokens: int,
    max_seqs: int,
    capture_sizes: Sequence[int],
    layout: PageLayout,
) -> tuple[int, int, int]:
    """``(nprog_max, max_store_tokens, max_out_tokens)`` for one worker.

    One extra manager block of kernel pages is margin past a full context.
    The output buffer covers MTP capture widths and a full eager decode batch.
    """
    ratio = attention_pages_per_block(manager_block, kernel_block)
    pages = max_kernel_pages(max_model_len, manager_block, kernel_block) + ratio
    nprog = pages * layout.hkv
    widest = 0
    for size in capture_sizes:
        widest = max(widest, int(size))
    max_out = max(int(max_seqs) * DECODE_MAX_T, widest, DECODE_MAX_T)
    if int(max_batched_tokens) < 1:
        raise ValueError("max_batched_tokens")
    return nprog, int(max_batched_tokens), max_out


def workspace_programs(table_width: int, pages_per_block: int, layout: PageLayout) -> int:
    """Split programs for one request. The C++ check wants this exact count."""
    table_width = int(table_width)
    pages_per_block = int(pages_per_block)
    if table_width < 1 or pages_per_block < 1:
        raise ValueError("workspace shape")
    return table_width * pages_per_block * layout.hkv


def layout_for_heads(num_heads: int, num_kv_heads: int, head_size: int) -> PageLayout:
    """Validated page layout for one rank, or a loud RuntimeError."""
    if int(head_size) != D:
        raise RuntimeError(
            "K8/V4 kernel head dim is %d, got %s" % (D, head_size)
        )
    try:
        return PageLayout.for_heads(num_heads, num_kv_heads)
    except ValueError as error:
        raise RuntimeError(str(error)) from error


def require_decoder(
    attn_type: object,
    sliding_window: int | None,
    alibi_slopes: object,
    logits_soft_cap: float | None,
    scale: float,
) -> None:
    value = getattr(attn_type, "value", attn_type)
    if str(value) != "decoder":
        raise RuntimeError("K8/V4 attention is decoder-only, got %s" % attn_type)
    if sliding_window is not None and int(sliding_window) > 0:
        raise RuntimeError("K8/V4 does not implement sliding window")
    if alibi_slopes is not None:
        raise RuntimeError("K8/V4 does not implement alibi")
    if logits_soft_cap not in (None, 0, 0.0):
        raise RuntimeError("K8/V4 does not implement logits soft cap")
    expected = 1.0 / (D ** 0.5)
    if abs(float(scale) - expected) > 1e-5:
        raise RuntimeError("K8/V4 kernel scale is fixed at %s, got %s" % (expected, scale))
