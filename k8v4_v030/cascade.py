"""Shared-prefix cascade scratch for int8k_int4v_attn_batch_cascade (experimental).

Enabled only when XE2_KV_CASCADE=1 (the C++ op reads the same flag; with it unset
the op is the serial attn_batch).  The q1 drafter path needs no extra memory.  The
q7 verify path keeps per-request fp16 partials for the shared pages of requests
1..B-1: (B-1) * HKV * cap * slot_rows * 256 * 2 bytes (cap=3200, B=4, HKV=2,
slot_rows=48 -> 472 MB, plus 7.4 MB of M/L) per GPU.  Allocate before graph capture;
a capture-time first use falls back to the serial op rather than allocating.
"""

from __future__ import annotations

import os

import torch

from k8v4_v030.layout import D, PAGE

CASC_MAX_B = 8      # must match CASC_MAX_B in native/xe2_kv_ops.cpp
PLAN_LEN = 16       # >= 2 + CASC_MAX_B
SLOT_ROWS = 48      # 7 verify tokens * GQA 6 = 42 rows, rounded up to 8

_SLOTS: dict[tuple[str, int | None, int], "CascadeScratch"] = {}


def enabled() -> bool:
    return os.environ.get("XE2_KV_CASCADE") == "1"


def _env_int(name: str, default: int) -> int:
    try:
        return int(os.environ.get(name, default))
    except ValueError:
        return default


class CascadeScratch:
    def __init__(self, device: torch.device, hkv: int, max_b: int, cap_pages: int, slot_rows: int = SLOT_ROWS):
        self.device = device
        self.max_b = max(2, min(int(max_b), CASC_MAX_B))
        self.cap = max(0, int(cap_pages))
        self.slot_rows = int(slot_rows)
        self.q8 = torch.empty((CASC_MAX_B + 1, hkv, PAGE, D), dtype=torch.int8, device=device)
        self.qsc = torch.empty((CASC_MAX_B + 1, hkv, PAGE), dtype=torch.float32, device=device)
        self.plan = torch.zeros((PLAN_LEN,), dtype=torch.int32, device=device)
        regions = (self.max_b - 1) if self.cap > 0 else 1
        n = regions * hkv * max(self.cap, 1) * self.slot_rows
        self.part = torch.empty((n, D), dtype=torch.float16, device=device)
        self.m = torch.empty((n,), dtype=torch.float32, device=device)
        self.l = torch.empty((n,), dtype=torch.float32, device=device)

    def bytes(self) -> int:
        return sum(t.numel() * t.element_size() for t in (self.q8, self.qsc, self.plan, self.part, self.m, self.l))


def _capturing() -> bool:
    try:
        return bool(torch.xpu.is_current_stream_capturing())
    except Exception:
        return False


def get(device: torch.device, hkv: int, count: int) -> CascadeScratch | None:
    """Scratch for a batch of ``count`` requests, or None to use the serial op."""
    if not enabled() or count < 2:
        return None
    key = (device.type, device.index, int(hkv))
    cur = _SLOTS.get(key)
    if cur is None:
        if _capturing():
            return None  # never allocate inside a graph capture
        cur = CascadeScratch(
            device,
            hkv,
            _env_int("K8V4_CASCADE_MAX_B", 4),
            _env_int("K8V4_CASCADE_VERIFY_PAGES", 3200) if os.environ.get("XE2_KV_CASCADE_VERIFY") == "1" else 0,
        )
        _SLOTS[key] = cur
    if count > cur.max_b:
        return None
    return cur


def clear() -> None:
    _SLOTS.clear()
