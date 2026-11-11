"""Sink + sliding-window read view for dense MTP draft attention.

Only the MTP drafter should use this. Target verify and QSA layers are
unchanged.

Environment
-----------
``K8V4_MTP_DRAFT_WINDOW``
    Tail window in tokens. Unset or ``0`` keeps the current full-context
    dense read.
``K8V4_MTP_DRAFT_SINKS``
    Tokens kept from the start of the sequence. Defaults to ``4`` when the
    window is on. ``0`` means no sinks.

The K8/V4 kernel walks KV in page units (64 tokens, times
``pages_per_block``). This module packs the pages that cover the sinks and
the tail window at the front of the block table and shortens ``seq_lens`` to
the packed token count, so the kernel reads only those pages. It does not
build a full-context mask.

Whole pages are included, so ``S=4`` keeps the first 64-token page and the
window start is rounded down to a page boundary. RoPE lives on the stored K
and on Q; the kernel does not need the original token index in the packed
table.

Block-table and seq-len *shapes* are unchanged so an XPU graph can replay
them. Scratch is preallocated; a first use during capture falls back to the
dense table rather than allocating. All length math is device-side. Host
Python only reads the env (a capture-time constant) and whether the layer
name contains ``mtp``.
"""

from __future__ import annotations

import os

import torch

from k8v4_v030.layout import PAGE

_CONFIG: tuple[int, int] | None = None
_SCRATCH: dict[tuple[object, ...], tuple[torch.Tensor, torch.Tensor]] = {}


def _env_int(name: str, default: str = "0") -> int:
    raw = os.environ.get(name)
    if raw is None or raw.strip() == "":
        return int(default)
    try:
        return int(raw)
    except ValueError:
        return 0


def window_config() -> tuple[int, int]:
    """``(window, sinks)``. ``window==0`` means the dense path."""
    global _CONFIG
    if _CONFIG is None:
        window = max(0, _env_int("K8V4_MTP_DRAFT_WINDOW", "0"))
        sinks = max(0, _env_int("K8V4_MTP_DRAFT_SINKS", "4")) if window > 0 else 0
        _CONFIG = (window, sinks)
    return _CONFIG


def reset_window_config() -> None:
    """Drop the cached env parse. Tests use this."""
    global _CONFIG
    _CONFIG = None


def is_mtp_layer(layer: object | None) -> bool:
    """True when this attention belongs to the MTP drafter, not the target."""
    if layer is None:
        return False
    parts = [type(layer).__name__]
    for attr in ("layer_name", "prefix"):
        parts.append(str(getattr(layer, attr, "") or ""))
    attn = getattr(layer, "attn", None)
    if attn is not None:
        for attr in ("layer_name", "prefix"):
            parts.append(str(getattr(attn, attr, "") or ""))
        parts.append(type(attn).__name__)
    return "mtp" in " ".join(parts).lower()


def should_apply(layer: object | None) -> bool:
    return window_config()[0] > 0 and is_mtp_layer(layer)


def tokens_per_entry(pages_per_block: int) -> int:
    return PAGE * max(int(pages_per_block), 1)


def _capturing() -> bool:
    xpu = getattr(torch, "xpu", None)
    fn = getattr(xpu, "is_current_stream_capturing", None)
    if fn is None:
        return False
    try:
        return bool(fn())
    except Exception:
        return False


def preallocate(device: torch.device | str, max_seqs: int, max_cols: int) -> None:
    """Reserve packed tables before graph capture."""
    device = torch.device(device)
    key = _scratch_key(device, int(max_seqs), int(max_cols), torch.int32)
    if key in _SCRATCH:
        return
    bt = torch.zeros((int(max_seqs), int(max_cols)), dtype=torch.int32, device=device)
    sl = torch.zeros((int(max_seqs),), dtype=torch.int32, device=device)
    _SCRATCH[key] = (bt, sl)


def clear_scratch() -> None:
    _SCRATCH.clear()


def _scratch_key(device: torch.device, rows: int, cols: int, dtype: torch.dtype):
    return (device.type, device.index, int(rows), int(cols), dtype)


def _buffers(block_table: torch.Tensor, seq_lens: torch.Tensor) -> tuple[torch.Tensor, torch.Tensor] | None:
    rows, cols = int(block_table.shape[0]), int(block_table.shape[1])
    key = _scratch_key(block_table.device, rows, cols, block_table.dtype)
    found = _SCRATCH.get(key)
    if found is None:
        if _capturing():
            return None
        found = (
            torch.empty_like(block_table),
            torch.empty_like(seq_lens),
        )
        _SCRATCH[key] = found
    bt, sl = found
    if bt.shape[0] < rows or bt.shape[1] < cols or sl.shape[0] < rows:
        if _capturing():
            return None
        found = (torch.empty_like(block_table), torch.empty_like(seq_lens))
        _SCRATCH[key] = found
        bt, sl = found
    return bt.narrow(0, 0, rows).narrow(1, 0, cols), sl.narrow(0, 0, rows)


def compact_draft_window(
    block_table: torch.Tensor,
    seq_lens: torch.Tensor,
    window: int,
    sinks: int,
    pages_per_block: int = 1,
    out_table: torch.Tensor | None = None,
    out_lens: torch.Tensor | None = None,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Pack sink pages + tail-window pages to the front of each block-table row.

    ``seq_lens`` becomes the packed token count. Shapes are preserved.
    When ``L <= sinks + window`` the tables are copied unchanged (dense).
    """
    if block_table.ndim != 2 or seq_lens.ndim != 1:
        raise ValueError("block_table is [B, P] and seq_lens is [B]")
    if int(block_table.shape[0]) != int(seq_lens.shape[0]):
        raise ValueError("batch size mismatch")
    if block_table.dtype != torch.int32 or seq_lens.dtype != torch.int32:
        raise ValueError("block_table and seq_lens must be int32")

    window = int(window)
    sinks = max(0, int(sinks))
    if out_table is None:
        out_table = block_table.clone()
    else:
        out_table.copy_(block_table)
    if out_lens is None:
        out_lens = seq_lens.clone()
    else:
        out_lens.copy_(seq_lens)

    if window <= 0:
        return out_table, out_lens

    tpb = tokens_per_entry(pages_per_block)
    rows, cols = int(block_table.shape[0]), int(block_table.shape[1])
    device = block_table.device
    lengths = seq_lens
    keep = lengths <= (sinks + window)
    # CPU-only shortcut for the unit tests. The XPU path stays in tensor
    # ops so a captured graph does not take a host branch on seq_lens.
    if lengths.device.type == "cpu" and bool(keep.all().item()):
        return out_table, out_lens

    sink_pages = (sinks + tpb - 1) // tpb if sinks > 0 else 0
    # First page of the tail window, rounded down. When L is long enough
    # this does not overlap the sink pages.
    window_start = torch.clamp(lengths - window, min=sinks)
    first_window_page = torch.div(window_start, tpb, rounding_mode="floor")
    packed = (sink_pages * tpb) + (lengths - first_window_page * tpb)
    packed = torch.where(keep, lengths, packed.to(dtype=torch.int32))
    out_lens.copy_(packed.to(dtype=torch.int32))

    page_ids = torch.arange(cols, device=device, dtype=torch.int32).unsqueeze(0).expand(rows, cols)
    src = first_window_page.to(torch.int32).unsqueeze(1) + (page_ids - sink_pages)
    orig_pages = torch.div(lengths + (tpb - 1), tpb, rounding_mode="floor")
    in_window = (
        (page_ids >= sink_pages)
        & (src >= 0)
        & (src < orig_pages.unsqueeze(1).to(torch.int32))
        & (src < cols)
        & (~keep.unsqueeze(1))
    )
    gathered = torch.gather(
        block_table, 1, src.clamp(0, cols - 1).to(dtype=torch.int64)
    )
    out_table.copy_(torch.where(in_window, gathered, block_table))
    return out_table, out_lens


def apply_read_view(
    block_table: torch.Tensor,
    seq_lens: torch.Tensor,
    pages_per_block: int = 1,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Pack a kernel-facing view, or return the inputs if capture has no scratch."""
    window, sinks = window_config()
    if window <= 0:
        return block_table, seq_lens
    buf = _buffers(block_table, seq_lens)
    if buf is None:
        return block_table, seq_lens
    return compact_draft_window(
        block_table,
        seq_lens,
        window,
        sinks,
        pages_per_block,
        out_table=buf[0],
        out_lens=buf[1],
    )


def packed_token_count(seq_len: int, window: int, sinks: int, pages_per_block: int = 1) -> int:
    """Host helper for tests and the bytes estimate."""
    seq_len = int(seq_len)
    window = int(window)
    sinks = max(0, int(sinks))
    if window <= 0 or seq_len <= sinks + window:
        return seq_len
    tpb = tokens_per_entry(pages_per_block)
    sink_pages = (sinks + tpb - 1) // tpb if sinks > 0 else 0
    window_start = max(sinks, seq_len - window)
    first_window_page = window_start // tpb
    return sink_pages * tpb + (seq_len - first_window_page * tpb)


def packed_page_ids(
    block_row: list[int],
    seq_len: int,
    window: int,
    sinks: int,
    pages_per_block: int = 1,
) -> list[int]:
    """The page ids the kernel would walk after packing, in order."""
    seq_len = int(seq_len)
    packed = packed_token_count(seq_len, window, sinks, pages_per_block)
    tpb = tokens_per_entry(pages_per_block)
    n_pages = (packed + tpb - 1) // tpb
    if window <= 0 or seq_len <= max(0, sinks) + window:
        return [int(block_row[i]) for i in range(n_pages)]
    sink_pages = (sinks + tpb - 1) // tpb if sinks > 0 else 0
    window_start = max(sinks, seq_len - window)
    first_window_page = window_start // tpb
    out = [int(block_row[i]) for i in range(sink_pages)]
    remaining = n_pages - sink_pages
    out.extend(int(block_row[first_window_page + i]) for i in range(remaining))
    return out
