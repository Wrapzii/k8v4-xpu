"""Which direct-attention kernel a decode or prefill call captures.

The choice depends on the query length, the GQA ratio, and which symbols
the process loaded. Those are all fixed for a captured graph. A replay does
not re-read the selected set, so this is not a Python skip around a kernel
that the graph already recorded.
"""

from __future__ import annotations


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


def decode_split_width(kind: str, q_len: int, width: int) -> int | None:
    """Token chunk per subgroup, or None when the kernel does not split."""
    if kind == "grp3":
        return None
    if kind == "grp3_prefill_split":
        return 128
    if int(q_len) <= 16:
        return 64
    return max(int(width), 1)


def partial_offset(qi: int, head: int, split: int, ns: int, hq: int, lane: int, dim: int) -> int:
    """Flat float index of one partial element. Matches both split kernels."""
    group = (int(qi) * int(hq) + int(head)) * int(ns) + int(split)
    return group * 256 + int(lane) * 16 + int(dim)
