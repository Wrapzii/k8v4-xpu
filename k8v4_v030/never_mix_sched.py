"""Opt-in: never mix long prefill tokens into a live decode graph step.

Enabled by the flag file ``never_mix.flag`` next to this module. Default off.
Decode-only steps keep FULL_DECODE_ONLY graphs. Every Nth mixed step is
prefill-only so the other agent still moves. Not a marked production fix.
"""
from __future__ import annotations

import logging
from pathlib import Path

logger = logging.getLogger("k8v4_v030.never_mix_sched")
FLAG = Path(__file__).with_name("never_mix.flag")
# RATIO is a dial, not a constant: if the flag file's content is a positive
# integer, it overrides the default 8 (so the A/B sweep can test 1-in-16 /
# 1-in-32 by writing the ratio into the flag). A flag with no integer content
# falls back to 8, so the original boolean "flag present = on" behavior is
# preserved exactly.
DEFAULT_RATIO = 8
RATIO = DEFAULT_RATIO
_installed = False


def _flag_ratio() -> int:
    try:
        txt = FLAG.read_text().strip()
        return int(txt) if txt.isdigit() and int(txt) >= 2 else DEFAULT_RATIO
    except Exception:
        return DEFAULT_RATIO


def _is_prefill(req) -> bool:
    if hasattr(req, "is_prefill_chunk"):
        return bool(req.is_prefill_chunk)
    tokens = int(getattr(req, "num_tokens", 0))
    computed = int(getattr(req, "num_computed_tokens", 0))
    return computed < max(tokens - 1, 0)


def install_if_requested() -> None:
    global _installed, RATIO
    if _installed or not FLAG.exists():
        return
    RATIO = _flag_ratio()
    from vllm.v1.core.sched.scheduler import Scheduler

    original = Scheduler.schedule

    def schedule(self, throttle_prefills: bool = False):
        running = list(self.running)
        decode_running = any(not _is_prefill(req) for req in running)
        prefill_pending = any(_is_prefill(req) for req in running) or bool(
            getattr(self, "waiting", None)
        )
        if not (decode_running and prefill_pending):
            return original(self, throttle_prefills)
        if self.current_step % RATIO == RATIO - 1:
            saved = []
            for req in running:
                if not _is_prefill(req):
                    saved.append((req, req.next_decode_eligible_step))
                    req.next_decode_eligible_step = self.current_step + 2
            try:
                return original(self, False)
            finally:
                for req, value in saved:
                    req.next_decode_eligible_step = value
        self.prefill_capacity_bound = False
        return original(self, True)

    Scheduler.schedule = schedule
    _installed = True
    logger.warning(
        "K8V4 never-mix scheduler on: decode-only graphs, 1/%d steps prefill-only",
        RATIO,
    )
