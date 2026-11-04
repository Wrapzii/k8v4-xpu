"""Sampled GPU-timestamp profiling of the K8/V4 decode attention op.

Off unless ``VLLM_K8V4_PROFILE=1`` (read once at import; the backend caches
``ENABLED`` in a module global, so the disabled cost is one bool test).

What is timed: one ``int8k_int4v_attn_batch[_cascade]`` call = q pack/quant +
stage 1 (split-KV DPAS partials) + stage 2 (split merge) for every request in
the uniform decode segment, bracketed by two ``torch.xpu.Event(enable_timing=
True)`` markers on the current stream. The live library fuses S1 and S2 into
one op, and no kernel/C++ change is allowed here, so S1 and S2 are not split
in production; ``tools/k8v4_attn_splits_bench.py`` splits them offline.

No host synchronisation: ``begin``/``end`` only record events and append to a
deque. A daemon thread polls ``end.query()`` (non-blocking) and calls
``elapsed_time`` only on completed pairs. Context lengths come from
``meta.seq_lens_cpu`` (already host-side); when that is missing the call is
skipped rather than copying device lengths to the host. Calls made while an
XPU graph is being captured are never sampled; graph *replays* do not enter
Python at all, so FULL_DECODE_ONLY uniform decode is not observed (mixed
prefill+decode steps, draft steps outside capture sizes, and eager runs are).

Env:
  VLLM_K8V4_PROFILE=1            enable
  VLLM_K8V4_PROFILE_SAMPLE=0.01  fraction of calls sampled (0 < r <= 1)
  VLLM_K8V4_PROFILE_DIR          output dir (default ~/ops/vllm-telemetry/attn-profile)
  VLLM_K8V4_PROFILE_FLUSH_S=30   write interval
  VLLM_K8V4_PROFILE_MAX_PENDING=4096  drop (and count) samples beyond this
"""

from __future__ import annotations

import collections
import json
import os
import random
import socket
import threading
import time

ENABLED: bool = os.environ.get("VLLM_K8V4_PROFILE") == "1"

# K8/V4 bytes read per cached token per local KV head: K int8 256 + V int4 128
# + K scale fp32 4 + V scale/zero fp32 8 (README: 1,584 B/token for 4 heads).
BYTES_PER_TOKEN_PER_KV_HEAD = 396
MAX_BUCKET = 262144


def _env_float(name: str, default: float) -> float:
    try:
        return float(os.environ.get(name, default))
    except ValueError:
        return default


def ctx_bucket(n: int) -> int:
    """Smallest power of two >= n, clamped to [64, 262144]."""
    b = 64
    while b < n and b < MAX_BUCKET:
        b <<= 1
    return b


class _Profiler:
    def __init__(self, event_cls=None, out_dir: str | None = None, rate: float | None = None,
                 flush_s: float | None = None, start_thread: bool = True, rng=None):
        self.rate = rate if rate is not None else _env_float("VLLM_K8V4_PROFILE_SAMPLE", 0.01)
        self.rate = min(max(self.rate, 0.0), 1.0)
        self.flush_s = flush_s if flush_s is not None else _env_float("VLLM_K8V4_PROFILE_FLUSH_S", 30.0)
        self.max_pending = int(_env_float("VLLM_K8V4_PROFILE_MAX_PENDING", 4096))
        self.out_dir = out_dir or os.path.expanduser(
            os.environ.get("VLLM_K8V4_PROFILE_DIR", "~/ops/vllm-telemetry/attn-profile"))
        self._event_cls = event_cls
        self._rand = (rng or random.Random()).random
        self._lock = threading.Lock()
        self._pending: collections.deque = collections.deque()
        self._done: list[dict] = []
        self.counters = collections.Counter()
        self._thread = None
        self._stop = threading.Event()
        self._start_thread = start_thread
        rank = os.environ.get("RANK") or os.environ.get("LOCAL_RANK") or "x"
        self._path = os.path.join(
            self.out_dir, "attn-%s-rank%s-pid%d.jsonl" % (socket.gethostname(), rank, os.getpid()))
        self.rank = rank

    # ---- forward-path side (no syncs) -------------------------------------
    def begin(self, meta, first: int, count: int, q_len: int, cascade: bool):
        if self._rand() >= self.rate:
            return None
        self.counters["sampled"] += 1
        if _capturing():
            self.counters["skip_capture"] += 1
            return None
        cpu = getattr(meta, "seq_lens_cpu", None)
        if cpu is None or getattr(cpu, "device", None) is not None and str(cpu.device) != "cpu":
            self.counters["skip_no_cpu_lens"] += 1
            return None
        if len(self._pending) >= self.max_pending:
            self.counters["drop_backlog"] += 1
            return None
        ev = self._events()
        if ev is None:
            self.counters["skip_no_event"] += 1
            return None
        lens = [int(x) for x in cpu.reshape(-1)[first:first + count].tolist()]
        start = ev(enable_timing=True)
        start.record()
        return (start, lens, int(q_len), int(cpu.numel()), bool(cascade), time.time())

    def end(self, tok) -> None:
        start, lens, q_len, n_total, cascade, t_host = tok
        end = self._events()(enable_timing=True)
        end.record()
        with self._lock:
            self._pending.append((start, end, lens, q_len, n_total, cascade, t_host))
        if self._thread is None and self._start_thread:
            self._ensure_thread()

    # ---- background side --------------------------------------------------
    def _events(self):
        if self._event_cls is None:
            try:
                import torch

                self._event_cls = torch.xpu.Event if torch.xpu.is_available() else False
            except Exception:
                self._event_cls = False
        return self._event_cls or None

    def _ensure_thread(self) -> None:
        with self._lock:
            if self._thread is not None:
                return
            self._thread = threading.Thread(target=self._loop, name="k8v4-attn-profile", daemon=True)
            self._thread.start()

    def poll(self) -> int:
        """Resolve completed pairs in FIFO order. Never blocks on the device."""
        n = 0
        while True:
            with self._lock:
                if not self._pending:
                    return n
                item = self._pending[0]
            start, end, lens, q_len, n_total, cascade, t_host = item
            try:
                if not end.query():
                    return n  # in-order stream: later pairs are not done either
                us = float(start.elapsed_time(end)) * 1000.0
            except Exception as exc:  # pragma: no cover - device specific
                self.counters["event_error"] += 1
                self.counters["last_error:" + type(exc).__name__] += 1
                us = None
            with self._lock:
                self._pending.popleft()
                if us is not None:
                    self._done.append(_record(lens, q_len, n_total, cascade, t_host, us, self.rank))
            n += 1

    def flush(self) -> int:
        with self._lock:
            rows, self._done = self._done, []
            stats = dict(self.counters, pending=len(self._pending))
        if not rows and not stats:
            return 0
        os.makedirs(self.out_dir, exist_ok=True)
        with open(self._path, "a", encoding="utf-8") as fh:
            for r in rows:
                fh.write(json.dumps(r, separators=(",", ":")) + "\n")
            fh.write(json.dumps({"type": "stats", "ts": time.time(), "rank": self.rank,
                                 "rate": self.rate, **stats}, separators=(",", ":")) + "\n")
        return len(rows)

    def _loop(self) -> None:
        last = time.monotonic()
        while not self._stop.is_set():
            self._stop.wait(0.2)
            try:
                self.poll()
                if time.monotonic() - last >= self.flush_s:
                    self.flush()
                    last = time.monotonic()
            except Exception:
                self.counters["loop_error"] += 1
        self.poll()
        self.flush()

    def stop(self) -> None:
        self._stop.set()
        if self._thread is not None:
            self._thread.join(timeout=5)


def _record(lens, q_len, n_total, cascade, t_host, us, rank) -> dict:
    mx = max(lens) if lens else 0
    sm = sum(lens)
    return {
        "type": "attn", "ts": round(t_host, 3),
        "iso": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime(t_host)),
        "rank": rank, "op": "attn_batch_cascade" if cascade else "attn_batch",
        "q_len": q_len, "batch": len(lens), "n_reqs_step": n_total,
        "ctx_max": mx, "ctx_sum": sm, "ctx_bucket": ctx_bucket(mx),
        "gpu_us": round(us, 2),
        # KV bytes the op must read at least once (HKV=2 per TP2 rank); a lower
        # bound on traffic, so GB/s here is a lower bound on achieved bandwidth.
        "kv_bytes": sm * BYTES_PER_TOKEN_PER_KV_HEAD * 2,
        "kv_gbps": round(sm * BYTES_PER_TOKEN_PER_KV_HEAD * 2 / (us * 1e3), 2) if us > 0 else None,
    }


def _capturing() -> bool:
    try:
        import torch

        fn = getattr(getattr(torch, "xpu", None), "is_current_stream_capturing", None)
        return bool(fn()) if fn is not None else False
    except Exception:
        return False


_PROF: _Profiler | None = None


def get() -> _Profiler:
    global _PROF
    if _PROF is None:
        _PROF = _Profiler()
        import atexit

        atexit.register(_PROF.stop)
    return _PROF
