"""Optional per-request attention timing.

Off unless ``K8V4_ATTN_TIME=1``. Device events are drained only after they
have completed, so the drain thread does not synchronize the GPU. Decode
graphs replay the kernel without re-entering this wrapper, so decode time
is recorded only when the attention implementation actually runs.
"""

from __future__ import annotations

import os
import threading
import time

_LOCK = threading.Lock()
_PENDING: list = []
_TOTALS = {"prefill_us": 0.0, "decode_us": 0.0, "prefill_calls": 0, "decode_calls": 0}
_DRAIN: threading.Thread | None = None
_STOP = False


def enabled() -> bool:
    return os.environ.get("K8V4_ATTN_TIME") == "1"


def snapshot() -> dict[str, float]:
    with _LOCK:
        return dict(_TOTALS)


def reset_for_test() -> None:
    """Stop the drain thread and zero the counters. Tests only."""
    global _DRAIN, _STOP
    _STOP = True
    drain = _DRAIN
    if drain is not None and drain.is_alive():
        drain.join(timeout=2)
        if drain.is_alive():
            raise RuntimeError("attention timer drain did not stop")
    with _LOCK:
        _PENDING.clear()
        for key in list(_TOTALS):
            _TOTALS[key] = 0 if key.endswith("_calls") else 0.0
    _DRAIN = None
    _STOP = False


def add_us(kind: str, micros: float) -> None:
    if kind not in ("prefill", "decode"):
        raise RuntimeError("attention timer kind %s" % kind)
    with _LOCK:
        _TOTALS[kind + "_us"] += float(micros)
        _TOTALS[kind + "_calls"] += 1
        data = dict(_TOTALS)
    _publish(data)


def attention_span(kind: str, fn):
    if not enabled():
        return fn()
    if _compiling():
        return fn()
    if _capturing():
        return fn()
    event_cls = _event_cls()
    if event_cls is None:
        t0 = time.perf_counter()
        try:
            return fn()
        finally:
            add_us(kind, (time.perf_counter() - t0) * 1e6)
    start = event_cls(enable_timing=True)
    end = event_cls(enable_timing=True)
    start.record()
    try:
        return fn()
    finally:
        end.record()
        _enqueue(kind, start, end)


def _compiling() -> bool:
    try:
        import torch

        return bool(torch.compiler.is_compiling())
    except Exception:
        return False


def _capturing() -> bool:
    """Host capture check. Callers are the custom attention op, not Dynamo."""
    if _compiling():
        return True
    try:
        import torch

        fn = getattr(getattr(torch, "xpu", None), "is_current_stream_capturing", None)
        if fn is None:
            return False
        return bool(fn())
    except Exception:
        return False


def _event_cls():
    try:
        import torch

        xpu = getattr(torch, "xpu", None)
        if xpu is None or not hasattr(xpu, "Event"):
            return None
        if not torch.xpu.is_available():
            return None
        return xpu.Event
    except Exception:
        return None


def _enqueue(kind: str, start, end) -> None:
    global _DRAIN
    with _LOCK:
        _PENDING.append((kind, start, end))
        if _DRAIN is None:
            _DRAIN = threading.Thread(target=_drain, name="k8v4-attn-time", daemon=True)
            _DRAIN.start()


def _drain() -> None:
    while not _STOP:
        time.sleep(0.05)
        with _LOCK:
            pending = list(_PENDING)
            _PENDING.clear()
        keep = []
        finished = []
        for kind, start, end in pending:
            query = getattr(end, "query", None)
            if query is None or query():
                finished.append((kind, start, end))
            else:
                keep.append((kind, start, end))
        if keep:
            with _LOCK:
                _PENDING[:0] = keep
        for kind, start, end in finished:
            add_us(kind, float(start.elapsed_time(end)) * 1000.0)


def _publish(data: dict) -> None:
    path = os.environ.get("K8V4_ATTN_TIME_FILE")
    if not path:
        return
    rank = os.environ.get("LOCAL_RANK", os.environ.get("RANK", "0"))
    dest = "%s.r%s" % (path, rank)
    text = (
        "prefill_us %.3f\n"
        "decode_us %.3f\n"
        "prefill_calls %d\n"
        "decode_calls %d\n"
    ) % (
        data["prefill_us"],
        data["decode_us"],
        data["prefill_calls"],
        data["decode_calls"],
    )
    tmp = dest + ".tmp"
    with open(tmp, "w", encoding="utf-8") as handle:
        handle.write(text)
    os.replace(tmp, dest)
