"""Opt-in [K, N]-contiguous weights for chosen dense linears on XPU.

``K8V4_NCONTIG_RE=<regex>`` stores the weight of every unquantized linear
whose vLLM prefix matches as ``weight.t().contiguous().t()`` after load:
the same (N, K) view, with [K, N]-contiguous storage. On one B70 our fp16
stack saw oneDNN's matmul with the (N, K) row-major weight return different
bits on repeated calls for the GDN ``in_proj_ba`` ([M, 5120] x [5120, 96])
at some prefill chunk sizes; with the [K, N] layout the result was bitwise
reproducible at the same speed. vLLM's ``VLLM_XPU_FORCE_N_CONTIG_WEIGHT``
does this for every dense linear (and moves the CPU-offloaded vision
weights onto the GPU); the regex keeps it to the layers that need it.
Unset (the default) changes nothing. The Swift 1.5 bake keeps
``in_proj_a`` / ``in_proj_b`` dense, so ``in_proj_ba`` is the natural value.
"""

from __future__ import annotations

import os
import re

_PATTERN = None
_COUNT = [0]


def parse_pattern(raw: str | None):
    if raw is None or raw.strip() == "":
        return None
    try:
        return re.compile(raw)
    except re.error as error:
        raise RuntimeError("K8V4_NCONTIG_RE is not a valid regex: %s (%s)" % (raw, error)) from error


def relayout(layer) -> bool:
    """[K, N]-contiguous storage for a matching layer's 2-D weight. True if changed."""
    if _PATTERN is None:
        return False
    prefix = getattr(layer, "prefix", "") or ""
    weight = getattr(layer, "weight", None)
    if not prefix or weight is None or not _PATTERN.search(prefix):
        return False
    data = weight.data
    if data.ndim != 2 or data.stride(0) == 1 or data.device.type == "cpu":
        return False
    weight.data = data.t().contiguous().t()
    _COUNT[0] += 1
    return True


def _wrap(cls) -> None:
    current = cls.process_weights_after_loading
    if getattr(current, "_k8v4_ncontig", False):
        return

    def process_weights_after_loading(self, layer):
        current(self, layer)
        relayout(layer)

    process_weights_after_loading._k8v4_ncontig = True
    cls.process_weights_after_loading = process_weights_after_loading


def install_if_requested() -> None:
    global _PATTERN
    _PATTERN = parse_pattern(os.environ.get("K8V4_NCONTIG_RE"))
    if _PATTERN is None:
        return
    from vllm.model_executor.layers.linear import UnquantizedLinearMethod

    _wrap(UnquantizedLinearMethod)
    import sys
    sys.stderr.write("k8v4_ncontig: [K, N]-contiguous weights for layers matching %r\n" % _PATTERN.pattern)
