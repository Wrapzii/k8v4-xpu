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
    "sparse_ok",
)
PHASES = ("prefill", "decode")
_INTERVAL_S = 1.0

_lock = threading.Lock()
_counts = {phase: {reason: 0 for reason in REASONS} for phase in PHASES}
_last_write = 0.0
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


def qsa_stats_flush() -> None:
    """Append one snapshot now. A no-op while stats are off."""
    if not qsa_stats_enabled():
        return
    _arm_atexit()
    with _lock:
        _write_locked()


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
    row.update(
        {
            phase: {reason: int(_counts[phase][reason]) for reason in REASONS}
            for phase in PHASES
        }
    )
    path = qsa_stats_file()
    try:
        with open(path, "a", encoding="utf-8") as handle:
            handle.write(json.dumps(row, separators=(",", ":")) + "\n")
    except OSError:
        # A missing path must not retry on every layer. The next interval will.
        _last_write = time.monotonic()
        return
    _last_write = time.monotonic()
