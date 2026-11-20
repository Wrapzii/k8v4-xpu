"""Draft-layer prefill attention for the last row only (``K8V4_DRAFT_LASTROW``).

During a prefill chunk the MTP draft layer runs attention over every query
row of the chunk, exactly like a target layer: per request, the oneDNN path
gathers and dequantizes the whole KV prefix of every head and runs the SDPA
for all rows. The V2 runner's draft prefill then keeps one row per request
(``last_token_indices``: the draft token comes from the last position) and
the next chunk's draft keys/values come from the K/V projections, which are
stored before attention runs. Every other attention row is discarded.

``K8V4_DRAFT_LASTROW=1`` computes, for draft-layer prefill segments only, the
last row of each request with the decode kernel (one query row, the full
stored sequence, read in place: no gather) and writes zeros to the other
rows so nothing uninitialized flows through o_proj and the MLP. Target
layers, decode/verify rows (q_len <= DECODE_MAX_T) and the default (unset or
``0``) are unchanged. The draft's numbers for that one row come from the
decode kernel instead of the prefill SDPA (same math, different
accumulation order), so drafts can differ in rare ties; the target verifies
every draft, so served outputs are unchanged (lossless).
"""

from __future__ import annotations

import os
import re

ENV_NAME = "K8V4_DRAFT_LASTROW"
# vLLM 0.30 Qwen3.5 MTP: mtp.layers.<i>.self_attn.attn (draft model prefix "mtp").
_DRAFT_LAYER = re.compile(r"(^|\.)mtp\.layers\.\d+\.")


def enabled(environ: dict[str, str] | None = None) -> bool:
    """``K8V4_DRAFT_LASTROW`` must be 0 or 1 (unset = 0)."""
    source = os.environ if environ is None else environ
    value = source.get(ENV_NAME, "0").strip()
    if value not in ("0", "1"):
        raise RuntimeError("%s must be 0 or 1, got %s" % (ENV_NAME, value))
    return value == "1"


def is_draft_layer(layer_name: str | None) -> bool:
    return bool(layer_name) and _DRAFT_LAYER.search(str(layer_name)) is not None


def applies(layer: object, environ: dict[str, str] | None = None) -> bool:
    """True when this attention layer's prefill rows may be reduced to the last row.

    vLLM 0.34 marks draft layers (``is_draft_layer``, set by the speculator at
    load); vLLM 0.30 does not, so the layer name is the fallback.
    """
    if not enabled(environ):
        return False
    if getattr(layer, "is_draft_layer", False):
        return True
    return is_draft_layer(getattr(layer, "layer_name", None))


def last_row(tok0: int, width: int) -> tuple[int, int]:
    """``(row, zero_rows)``: the kept token index and how many rows before it are zeroed."""
    tok0 = int(tok0)
    width = int(width)
    if width < 1:
        raise ValueError("empty query span")
    return tok0 + width - 1, width - 1
