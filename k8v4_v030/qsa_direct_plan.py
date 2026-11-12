"""Which direct-attention kernel a decode or prefill call captures.

The choice depends on the query length, the GQA ratio, and which symbols
the process loaded. Those are all fixed for a captured graph. A replay does
not re-read the selected set, so this is not a Python skip around a kernel
that the graph already recorded.
"""

from __future__ import annotations

import os


def decode_attn_kind(
    q_len: int,
    gqa: int,
    *,
    has_gqa6: bool,
    has_grp3_split: bool,
    has_grp3: bool,
    prefill_split: bool,
) -> str:
    """Return the kernel name attend_decode_direct launches.

    Short decode (q_len <= 16) is the MTP graph. grp3_decode_split loads
    each selected K/V once per three query heads and keeps the 64-token
    splits. On one Arc Pro B60 a 7-query, 2048-token row took 0.17 ms in
    that kernel, 0.41 ms (scattered) to 0.90 ms (packed) in qsa_direct_attn,
    and 0.73-0.76 ms in qsa_gqa6_split. One subgroup for all six heads does
    not keep the device busy, so gqa6 is only the fallback when the
    three-head split is absent. Longer queries stay on the prefill path
    this tree already shipped.
    """
    queries = int(q_len)
    ratio = int(gqa)
    grouped = ratio > 0 and ratio % 3 == 0
    if queries > 16 and prefill_split and grouped and has_grp3_split:
        return "grp3_prefill_split"
    if queries > 16 and grouped and has_grp3:
        return "grp3"
    if queries <= 16 and grouped and has_grp3_split:
        return "grp3_decode_split"
    if queries <= 16 and ratio == 6 and has_gqa6:
        return "gqa6_split"
    return "direct"


DECODE_SPLIT_ENV = "K8V4_QSA_DECODE_SPLIT"

# Measured short-decode split widths for grp3_decode_split, keyed by the
# per-GPU (query heads, KV heads) layout. Kernel-only, 7 MTP rows, 2052
# selected tokens, 16 layers, one Arc Pro B60:
#   24Q/4KV (TP1): shipped grp3_split split 32 4.87 ms, 64 5.39, 128 5.20
#                  at 96K. The tuned xe2_qsa_grp3 body is best at split 48
#                  (1.11x over grp3_split split 32 in the same process);
#                  32 is about 1.00x and 64 about 0.94x for that body.
#   12Q/2KV (TP2 rank): split 64, the width the TP2 serving tree used. The
#                  tuned body was not measured on this shape.
# Any other layout keeps 64, the previous default. K8V4_QSA_DECODE_SPLIT
# overrides the pick for every layout.
_GRP3_DECODE_SPLIT = {
    (24, 4): {"shipped": 32, "fast": 48},
    (12, 2): {"shipped": 64, "fast": 64},
}
_DEFAULT_DECODE_SPLIT = 64


def grp3_decode_split_width(hq: int = 0, hkv: int = 0, *, fast: bool = False) -> int:
    """Split width for short-decode grp3_split on this per-GPU head layout.

    ``fast`` is true when the tuned ``xe2_qsa_grp3`` kernel runs instead of
    the shipped ``xe2_qsa.qsa_grp3_split``. The width is fixed for a
    captured graph: it sizes the partial workspace.
    """
    raw = os.environ.get(DECODE_SPLIT_ENV, "").strip()
    if raw:
        try:
            value = int(raw)
        except ValueError as exc:
            raise ValueError("%s must be a positive integer, got %r" % (DECODE_SPLIT_ENV, raw)) from exc
        if value < 1:
            raise ValueError("%s must be a positive integer, got %r" % (DECODE_SPLIT_ENV, raw))
        return value
    picks = _GRP3_DECODE_SPLIT.get((int(hq), int(hkv)))
    if picks is None:
        return _DEFAULT_DECODE_SPLIT
    return int(picks["fast" if fast else "shipped"])


def decode_split_width(
    kind: str,
    q_len: int,
    width: int,
    *,
    hq: int = 0,
    hkv: int = 0,
    fast: bool = False,
) -> int | None:
    """Token chunk per subgroup, or None when the kernel does not split.

    ``hq`` and ``hkv`` are the per-GPU query and KV head counts. Callers that
    do not pass them keep the old fixed 64 for short decode.
    """
    if kind == "grp3":
        return None
    if kind == "grp3_prefill_split":
        return 128
    if int(q_len) <= 16:
        if kind == "grp3_decode_split":
            return grp3_decode_split_width(hq, hkv, fast=fast)
        return _DEFAULT_DECODE_SPLIT
    return max(int(width), 1)


def partial_offset(qi: int, head: int, split: int, ns: int, hq: int, lane: int, dim: int) -> int:
    """Flat float index of one partial element. Matches both split kernels."""
    group = (int(qi) * int(hq) + int(head)) * int(ns) + int(split)
    return group * 256 + int(lane) * 16 + int(dim)
