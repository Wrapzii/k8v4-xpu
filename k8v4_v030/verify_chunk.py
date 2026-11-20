"""Chunked verify for spec-decode depths past the decode tile (``K8V4_VERIFY_CHUNK``).

The K8/V4 decode kernel takes at most ``DECODE_MAX_T`` (10) query rows per
request (one 64-slot page of q8 rows / 6 query heads per KV head). MTP6
verifies 7 rows; deeper drafting does not fit: n-gram copy drafting at depth
15 verifies 16 rows per request, which today falls to the per-request prefill
path (a whole-prefix gather per head) and cannot run inside the decode graph.

``K8V4_VERIFY_CHUNK=c`` (1..10; unset or 0 = off) lets a uniform verify of
up to ``VERIFY_MAX_T`` rows per request run on the decode kernel in row
chunks of at most c rows. Rows ``[r0, r1)`` of a q_len-row verify sit at the
end of a sequence ``q_len - r1`` tokens shorter, so each chunk is the same
kernel call with ``seq_lens - (q_len - r1)``: the causal mask is exact and
each chunk reads the KV once (two reads at depth 15 with c=8 instead of one).
Results equal the single-call math up to the kernel's split order. Rows of
10 or fewer, and the default, are unchanged.
"""

from __future__ import annotations

import os

from k8v4_v030.layout import DECODE_MAX_T

ENV_NAME = "K8V4_VERIFY_CHUNK"
# Depth 15 (our n-gram copy drafting) verifies 16 rows; leave room for 31.
VERIFY_MAX_T = 32


def chunk_rows(environ: dict[str, str] | None = None) -> int:
    """Rows per verify chunk; 0 = off (the default)."""
    source = os.environ if environ is None else environ
    raw = source.get(ENV_NAME, "0").strip() or "0"
    if not raw.isdigit() or int(raw) > DECODE_MAX_T:
        raise RuntimeError("%s must be 0..%d, got %s" % (ENV_NAME, DECODE_MAX_T, raw))
    return int(raw)


def max_query_rows(environ: dict[str, str] | None = None) -> int:
    """Widest per-request query the decode path accepts."""
    return VERIFY_MAX_T if chunk_rows(environ) else DECODE_MAX_T


def plan(q_len: int, chunk: int) -> list[tuple[int, int, int]]:
    """``[(r0, r1, trim)]`` row chunks of a q_len-row verify, balanced, each <= chunk rows.

    ``trim = q_len - r1`` is what each request's seq_len loses for that call.
    """
    q_len = int(q_len)
    chunk = int(chunk)
    if q_len < 1 or q_len > VERIFY_MAX_T:
        raise ValueError("q_len %d outside the verify range" % q_len)
    if chunk < 1 or chunk > DECODE_MAX_T:
        raise ValueError("chunk %d outside the decode tile" % chunk)
    pieces = -(-q_len // chunk)
    base, extra = divmod(q_len, pieces)
    out = []
    r0 = 0
    for i in range(pieces):
        r1 = r0 + base + (1 if i < extra else 0)
        out.append((r0, r1, q_len - r1))
        r0 = r1
    return out
