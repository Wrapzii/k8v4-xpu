"""Opt-in bitwise-reproducible oneDNN matmuls for torch's own dense linears on XPU.

``K8V4_ONEDNN_DETERMINISTIC=1`` sets ``torch.backends.mkldnn.deterministic``
in the engine process before the model loads. On one B70 (vLLM 0.34, torch
2.15) the unquantized bf16 GDN ``in_proj_ba`` ([M, 5120] x [5120, 96], the
Swift 1.5 bake keeps ``in_proj_a`` / ``in_proj_b`` dense) went through
oneDNN's matmul with a different reduction order on repeated calls for some
row counts: M = 2112, 4224, 1056, 2171 and 128 differed in 6-8 of 8 repeats
(max |delta| up to 3e-2), M = 2048 and 4096 did not. With MTP depth 6 the
hybrid KV layout makes the prefill chunks 2112 / 4224 rows, so two identical
cold prompts gave different next-token distributions (harness prefix check:
top-1 flips on 2 of 10 prompts, KL up to 4). With the flag the same calls
are bitwise equal at the same speed (2112 rows: 62.2 vs 62.9 us). It only
affects matmuls torch dispatches to oneDNN; the int4 GEMM libraries build
their own primitives. Unset (the default) changes nothing.
"""

from __future__ import annotations

import os
import sys

ENV = "K8V4_ONEDNN_DETERMINISTIC"


def parse(raw: str | None) -> bool:
    """True for ``1``; unset, empty or ``0`` is off. Anything else is an error."""
    value = "0" if raw is None or raw.strip() == "" else raw.strip()
    if value not in ("0", "1"):
        raise RuntimeError("%s must be 0 or 1, got %r" % (ENV, raw))
    return value == "1"


def install_if_requested() -> bool:
    """Set torch's oneDNN deterministic flag when requested. Returns whether it was set."""
    if not parse(os.environ.get(ENV)):
        return False
    import torch

    torch.backends.mkldnn.deterministic = True
    sys.stderr.write("k8v4_onednn_det: torch.backends.mkldnn.deterministic = True (%s=1)\n" % ENV)
    return True
