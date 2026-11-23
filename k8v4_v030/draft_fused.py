"""One XPU graph for all draft decode steps of a batch (``K8V4_DRAFT_FUSED_DECODE``).

vLLM 0.34's V2 runner drafts depth k with one draft prefill on the target batch
and k - 1 single-token draft decode steps. When every attention backend of the
draft layer declares ``supports_draft_decode_metadata_update``, the speculator
captures the k - 1 steps (slot mappings, metadata refresh, forward, sampling)
into ONE full graph per (batch, depth) and replays it once; otherwise it builds
the attention metadata in Python and replays a one-step graph k - 1 times. The
K8/V4 backend did not declare it, so at 2-4 users (depth 3) every engine step
paid two draft-graph launches with Python metadata builds and a slot-mapping
kernel launch between them, all serial with the device (the host could not run
ahead of the second replay of the same graph).

Nothing in the K8/V4 decode metadata needs refreshing between draft steps: the
decode kernel reads ``seq_lens``, ``block_table`` and ``slot_mapping`` from the
runner's persistent device buffers, which the speculator advances in place, and
the host-side fields (query starts, packed rows) are the same for every step of
a uniform one-row-per-request draft batch. So with ``K8V4_DRAFT_FUSED_DECODE=1``
the builder declares the capability and ``update_draft_decode_metadata`` is a
no-op, as for vLLM's Triton backend. Same kernels, same inputs: draft tokens and
served outputs are unchanged (bit-identical). Unset or ``0`` keeps the
per-step path. vLLM 0.30's runner never reads the attribute.
"""

from __future__ import annotations

import os

ENV_NAME = "K8V4_DRAFT_FUSED_DECODE"


def enabled(environ: dict[str, str] | None = None) -> bool:
    """``K8V4_DRAFT_FUSED_DECODE`` must be 0 or 1 (unset = 0)."""
    source = os.environ if environ is None else environ
    value = source.get(ENV_NAME, "0").strip()
    if value not in ("0", "1"):
        raise RuntimeError("%s must be 0 or 1, got %s" % (ENV_NAME, value))
    return value == "1"
