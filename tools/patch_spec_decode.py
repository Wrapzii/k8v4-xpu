"""Speculative-decoding splices for an installed vLLM tree (V2 model runner).

Each splice is anchored on text that is identical in vLLM 0.30 and 0.34,
applies once (a marker makes a second run a no-op) and refuses unknown
source. The spliced call is a no-op unless its opt-in env var is set; the
logic lives in the k8v4_v030 module it imports.

- draft_vocab (k8v4_v030/draft_vocab.py, K8V4_DRAFT_VOCAB): after the
  speculator loads its draft model, give it a row-subset lm_head.
  Anchor: v1/worker/gpu/spec_decode/speculator.py, DraftModelSpeculator.load_model
  (0.30 line 218, 0.34 line 294).
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
    return [_splice(root / SPECULATOR, _VOCAB_OLD, _VOCAB_NEW, VOCAB_MARK, "draft_vocab")]


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
