"""Optional QSA fallback counters. Off unless ``K8V4_QSA_STATS=1``.

The off path is one environment read. On, each dense or sparse decision
increments a prefill or decode bucket. A snapshot is appended to
``K8V4_QSA_STATS_FILE`` (default ``/tmp/qsa-stats.jsonl``) at most about
once a second, and ``qsa_stats_flush`` writes immediately.
"""

from __future__ import annotations

import atexit
import json
import os
import threading
import time

from k8v4_v030.layout import DECODE_MAX_T

REASONS = (
    "disabled",
    "capturing",
    "no_layer",
    "not_full_attn",
    "no_weights",
    "no_hidden",
    "empty",
    "within_budget",
    "full_causal",
    "fast_prefill",
    "sparse_ok",
)
PHASES = ("prefill", "decode")
_INTERVAL_S = 1.0

_lock = threading.Lock()
_handle = None
_handle_path = ""
_counts = {phase: {reason: 0 for reason in REASONS} for phase in PHASES}
_last_write = 0.0
_attn_width: int | None = None
_layer_hits_note: int | None = None
_atexit_armed = False


def qsa_stats_enabled() -> bool:
    return os.environ.get("K8V4_QSA_STATS", "0") == "1"


def qsa_stats_file() -> str:
    raw = os.environ.get("K8V4_QSA_STATS_FILE", "").strip()
    return raw or "/tmp/qsa-stats.jsonl"


def qsa_stats_snapshot() -> dict:
    """Copy of the counters. Safe to call while stats are off."""
    with _lock:
        return {
            phase: {reason: int(_counts[phase][reason]) for reason in REASONS}
            for phase in PHASES
        }


def qsa_stats_reset() -> None:
    """Zero the counters and the write timer. Tests use this."""
    global _last_write
    with _lock:
        for phase in PHASES:
            for reason in REASONS:
                _counts[phase][reason] = 0
        _last_write = 0.0
_attn_width: int | None = None


def qsa_stats_flush() -> None:
    """Append one snapshot now. A no-op while stats are off."""
    if not qsa_stats_enabled():
        return
    _arm_atexit()
    with _lock:
        _write_locked()


def note_qsa_width(width: int) -> None:
    """Remember the widest selected row. Written on the next stats snapshot."""
    global _attn_width
    if not qsa_stats_enabled():
        return
    _attn_width = int(width)


def note_qsa_decode_layers(hits: int, width: int = 2052) -> None:
    """Count graph-replayed full-attention layers as decode sparse_ok.

    Each hit is one shipped ``qsa_cache_update`` on a full-attention layer.
    The write is immediate so a short generation window still has a raw line.
    """
    global _attn_width, _layer_hits_note
    if not qsa_stats_enabled() or int(hits) <= 0:
        return
    _arm_atexit()
    with _lock:
        _counts["decode"]["sparse_ok"] += int(hits)
        _attn_width = int(width)
        _layer_hits_note = int(hits)
        _write_locked()
        _layer_hits_note = None


def note_qsa(query, meta, reason: str) -> None:
    """Count one decision. Returns immediately when stats are off."""
    if not qsa_stats_enabled():
        return
    if reason not in _counts["decode"]:
        raise ValueError("unknown QSA stat %r" % reason)
    phase = "decode" if _q_len(query, meta) <= DECODE_MAX_T else "prefill"
    _arm_atexit()
    with _lock:
        _counts[phase][reason] += 1
        if time.monotonic() - _last_write >= _INTERVAL_S:
            _write_locked()


def _q_len(query, meta) -> int:
    """Longest query in the step. Decode is ``q_len <= DECODE_MAX_T``."""
    max_q = getattr(meta, "max_query_len", None)
    if max_q:
        return int(max_q)
    starts = getattr(meta, "query_starts", None)
    if starts is not None and len(starts) >= 2:
        lengths = [int(starts[i + 1]) - int(starts[i]) for i in range(len(starts) - 1)]
        if lengths:
            return max(lengths)
    if query is not None and getattr(query, "ndim", 0) >= 1:
        return int(query.shape[0])
    return DECODE_MAX_T + 1


def _arm_atexit() -> None:
    global _atexit_armed
    if _atexit_armed:
        return
    _atexit_armed = True
    atexit.register(_flush_atexit)


def _flush_atexit() -> None:
    if not qsa_stats_enabled():
        return
    try:
        with _lock:
            _write_locked()
    except Exception:
        return


def _write_locked() -> None:
    global _last_write
    row = {"t": time.time()}
    if _attn_width is not None:
        row["attn_width"] = int(_attn_width)
    if _layer_hits_note:
        row["layer_hits"] = int(_layer_hits_note)
    row.update(
        {
            phase: {reason: int(_counts[phase][reason]) for reason in REASONS}
            for phase in PHASES
        }
    )
    path = qsa_stats_file()
    global _handle, _handle_path
    try:
        if _handle is None or _handle_path != path:
            if _handle is not None:
                _handle.close()
            _handle = open(path, "a", encoding="utf-8")
            _handle_path = path
        _handle.write(json.dumps(row, separators=(",", ":")) + "\n")
        _handle.flush()
    except OSError:
        # A missing path must not retry on every layer. The next interval will.
        _last_write = time.monotonic()
        if _handle is not None:
            try:
                _handle.close()
            except OSError:
                pass
            _handle = None
        return
    _last_write = time.monotonic()
