"""Speculative-decoding splices for an installed vLLM tree (V2 model runner).

Each splice is anchored on text that is identical in vLLM 0.30 and 0.34,
applies once (a marker makes a second run a no-op) and refuses unknown
source. The spliced call is a no-op unless its opt-in env var is set; the
logic lives in the k8v4_v030 module it imports.

- draft_vocab (k8v4_v030/draft_vocab.py, K8V4_DRAFT_VOCAB): after the
  speculator loads its draft model, give it a row-subset lm_head.
  Anchor: v1/worker/gpu/spec_decode/speculator.py, DraftModelSpeculator.load_model
  (0.30 line 218, 0.34 line 294).
- deep drafting (k8v4_v030/deep_draft.py, K8V4_DEEP_DRAFT), vLLM 0.34 only: speculator
  selection (spec_decode/__init__.py init_speculator), skipping the MTP decode steps on a
  copy (target_dependent_ar/speculator.py propose), the lone-request depth
  (core/sched/scheduler.py, after the dynamic-SD lookup) and its capture width
  (config/vllm.py get_decode_cudagraph_query_lens).
"""

from __future__ import annotations

import sys
from pathlib import Path

_DEFAULT_ROOTS = (
    Path("/opt/venv/lib/python3.12/site-packages/vllm"),
    Path("/workspace/vllm/vllm"),
)

SPECULATOR = "v1/worker/gpu/spec_decode/speculator.py"

VOCAB_MARK = "K8V4_DRAFT_VOCAB_V1"
_VOCAB_OLD = "        self.model = self.load_draft_model(target_model, target_attn_layer_names)\n"
_VOCAB_NEW = (
    "        self.model = self.load_draft_model(target_model, target_attn_layer_names)\n"
    "        # %s: optional row-subset draft head (k8v4_v030/draft_vocab.py; unset = no-op)\n"
    "        from k8v4_v030.draft_vocab import install as _k8v4_draft_vocab\n"
    "        _k8v4_draft_vocab(self.model)\n"
) % VOCAB_MARK


DEEP_MARK = "K8V4_DEEP_DRAFT_V1"
INIT = "v1/worker/gpu/spec_decode/__init__.py"
TDAR = "v1/worker/gpu/spec_decode/target_dependent_ar/speculator.py"
SCHED = "v1/core/sched/scheduler.py"
CONFIG = "config/vllm.py"
_INIT_OLD = (
    "    from vllm.v1.worker.gpu.spec_decode.speculator import BaseSpeculator\n"
    "\n"
    "    speculative_config = vllm_config.speculative_config\n"
    "    assert speculative_config is not None\n"
)
_INIT_NEW = _INIT_OLD + (
    "    # %s: MTP + n-gram copy speculator when K8V4_DEEP_DRAFT is set (k8v4_v030/deep_draft.py)\n"
    "    from k8v4_v030.deep_draft import maybe_speculator as _k8v4_deep\n"
    "    _k8v4_spec = _k8v4_deep(vllm_config, device, req_states)\n"
    "    if _k8v4_spec is not None:\n"
    "        return _k8v4_spec\n"
) % DEEP_MARK
_TDAR_OLD = (
    "        if num_speculative_tokens <= 1:\n"
    "            if num_speculative_tokens == 0:\n"
    "                self.draft_tokens[:num_reqs].fill_(-1)\n"
    "            return self.draft_tokens[:num_reqs]\n"
)
_TDAR_NEW = _TDAR_OLD + (
    "        # %s: a copied draft skips the MTP decode steps (k8v4_v030/deep_draft.py)\n"
    "        _k8v4_steps = getattr(self, \"k8v4_num_draft_steps\", None)\n"
    "        if _k8v4_steps is not None and _k8v4_steps(num_speculative_tokens) <= 1:\n"
    "            return self.draft_tokens[:num_reqs]\n"
) % DEEP_MARK
_SCHED_OLD = (
    "        if self.dynamic_sd_lookup is not None and len(num_scheduled_tokens) > 0:\n"
    "            num_spec_tokens_to_schedule = self.dynamic_sd_lookup[\n"
    "                len(num_scheduled_tokens)\n"
    "            ]\n"
)
_SCHED_NEW = _SCHED_OLD + (
    "        # %s: a lone request drafts deep only while copying (k8v4_v030/deep_draft.py)\n"
    "        from k8v4_v030.deep_draft import scheduled_depth as _k8v4_depth\n"
    "        num_spec_tokens_to_schedule = _k8v4_depth(\n"
    "            self, num_scheduled_tokens, num_spec_tokens_to_schedule\n"
    "        )\n"
) % DEEP_MARK
_CONFIG_OLD = (
    "        # By ascending batch size, so each query length keeps its widest batch.\n"
    "        return {\n"
    "            k + num_new_sampled_tokens: batch_size\n"
    "            for batch_size, k in enumerate(dense_schedule)\n"
    "            if batch_size > 0\n"
    "        }\n"
)
_CONFIG_NEW = (
    "        # By ascending batch size, so each query length keeps its widest batch.\n"
    "        query_lens = {\n"
    "            k + num_new_sampled_tokens: batch_size\n"
    "            for batch_size, k in enumerate(dense_schedule)\n"
    "            if batch_size > 0\n"
    "        }\n"
    "        # %s: capture the MTP-depth width a lone request uses (k8v4_v030/deep_draft.py)\n"
    "        from k8v4_v030.deep_draft import extra_query_lens as _k8v4_qlens\n"
    "        return _k8v4_qlens(query_lens, self.num_speculative_tokens, num_new_sampled_tokens)\n"
) % DEEP_MARK


def _splice(path: Path, old: str, new: str, mark: str, label: str) -> str:
    if not path.is_file():
        raise RuntimeError("missing %s" % path)
    text = path.read_text(encoding="utf-8")
    if mark in text:
        return "%s:unchanged" % label
    count = text.count(old)
    if count != 1:
        raise RuntimeError("%s: %s anchor count %d; unexpected vLLM source, patch refused" % (path, label, count))
    text = text.replace(old, new, 1)
    compile(text, str(path), "exec")
    path.write_text(text, encoding="utf-8")
    return "%s:patched" % label


def patch_vllm_tree(root: Path) -> list[str]:
    """Apply every speculative-decoding splice to one vLLM package root."""
    root = Path(root)
    notes = [_splice(root / SPECULATOR, _VOCAB_OLD, _VOCAB_NEW, VOCAB_MARK, "draft_vocab")]
    # Deep drafting anchors exist in vLLM 0.34 only (0.30 has no target_dependent_ar).
    if (root / TDAR).is_file():
        notes += [
            _splice(root / INIT, _INIT_OLD, _INIT_NEW, DEEP_MARK, "deep_init"),
            _splice(root / TDAR, _TDAR_OLD, _TDAR_NEW, DEEP_MARK, "deep_steps"),
            _splice(root / SCHED, _SCHED_OLD, _SCHED_NEW, DEEP_MARK, "deep_sched"),
            _splice(root / CONFIG, _CONFIG_OLD, _CONFIG_NEW, DEEP_MARK, "deep_capture"),
        ]
    return notes


def patch_installed(roots: tuple[Path, ...] = _DEFAULT_ROOTS) -> list[str]:
    notes: list[str] = []
    for root in roots:
        if (root / SPECULATOR).is_file():
            notes.extend("%s %s" % (root, item) for item in patch_vllm_tree(root))
    if not notes:
        raise RuntimeError("no vLLM tree with the V2 speculator found")
    return notes


def main(argv: list[str]) -> int:
    roots = tuple(Path(arg) for arg in argv) if argv else _DEFAULT_ROOTS
    for line in patch_installed(roots):
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
