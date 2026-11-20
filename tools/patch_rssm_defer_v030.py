"""Deferred RecoverSSM commit splice for an installed vLLM 0.34 tree (K8V4_RSSM_DEFER_COMMIT, k8v4_v030/rssm_defer.py).

The deferred commit keeps a request's accepted replay records from one step to the next under its request slot. The
hybrid (Mamba / GDN) model state of vLLM 0.34 builds the attention metadata without the request slots
(``req_idx``), so the RecoverSSM builder falls back to batch rows, which move when requests join or finish (fine
for the stock commit, whose records live for one step only). Measured: without the slots, the first decode steps of
a new request folded the records a finished request had left in batch row 0 (texts diverged within 10 tokens of
the stock path). This splice passes ``input_batch.idx_mapping_np`` (the slots the default model state already
passes) when K8V4_RSSM_DEFER_COMMIT=1, and None otherwise, so the default metadata is unchanged.

One anchored splice in v1/worker/gpu/model_states/mamba_hybrid.py; applies once (marker), refuses unknown source.
"""

from __future__ import annotations

import sys
from pathlib import Path

_DEFAULT_ROOTS = (
    Path("/opt/venv/lib/python3.12/site-packages/vllm"),
    Path("/workspace/vllm/vllm"),
)
MARK = "K8V4_RSSM_DEFER_V1"

HYBRID = "v1/worker/gpu/model_states/mamba_hybrid.py"
_CALL_OLD = (
    "            model_specific_attn_metadata=mamba_attn_metadata,\n"
    "            for_cudagraph_capture=for_capture,\n"
    "            rswa_prefix_lens=input_batch.prompt_lens,\n"
    "        )\n"
)
_CALL_NEW = (
    "            model_specific_attn_metadata=mamba_attn_metadata,\n"
    "            for_cudagraph_capture=for_capture,\n"
    "            rswa_prefix_lens=input_batch.prompt_lens,\n"
    "            # %s: request slots for the deferred RecoverSSM commit (None unless the knob is on)\n"
    "            req_idx=_k8v4_rssm_req_idx(input_batch),\n"
    "        )\n"
) % MARK
_TAIL = (
    "\n\n"
    "def _k8v4_rssm_req_idx(input_batch):\n"
    "    # %s: k8v4_v030/rssm_defer.py keeps replay records per request slot across steps\n"
    "    try:\n"
    "        from k8v4_v030.rssm_defer import defer_enabled\n"
    "    except ImportError:\n"
    "        return None\n"
    "    return input_batch.idx_mapping_np if defer_enabled() else None\n"
) % MARK


def patch_file(path: Path) -> str:
    if not path.exists():
        raise RuntimeError("missing %s" % path)
    text = path.read_text(encoding="utf-8")
    if MARK in text:
        return "%s:unchanged" % path
    count = text.count(_CALL_OLD)
    if count != 1 or "def _k8v4_rssm_req_idx" in text:
        raise RuntimeError("%s: build_attn_metadata anchor count %d; unexpected vLLM source, patch refused"
                           % (path, count))
    path.write_text(text.replace(_CALL_OLD, _CALL_NEW).rstrip("\n") + _TAIL, encoding="utf-8")
    return "%s:patched" % path


def patch_vllm_tree(root: Path) -> list[str]:
    return [patch_file(root / HYBRID)]


def patch_installed(roots: tuple[Path, ...] = _DEFAULT_ROOTS) -> list[str]:
    found = [r for r in roots if (r / HYBRID).exists()]
    if not found:
        raise RuntimeError("no vLLM 0.34 tree with the hybrid model state found")
    notes = []
    for root in found:
        notes += patch_vllm_tree(root)
    return notes


def main(argv: list[str]) -> int:
    roots = tuple(Path(a) for a in argv[1:]) or _DEFAULT_ROOTS
    for note in patch_installed(roots):
        print(note)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
