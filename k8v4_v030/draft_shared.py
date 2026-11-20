"""Optional: the MTP draft does not load the vocabulary tables it shares with the target.

``K8V4_DRAFT_SKIP_SHARED=1`` (default 0) builds the Qwen3.5 MTP draft's ``embed_tokens`` and
``lm_head`` as one-row placeholders and skips their checkpoint tensors. vLLM 0.30 replaces both
with the target's modules right after the draft loads (``load_eagle_model`` in
``v1/worker/gpu/spec_decode/eagle/utils.py``: the draft has no ``has_own_embed_tokens`` /
``has_own_lm_head``), so the full-size draft copies were built, uploaded and then freed: the BF16
embedding (248,320 x 5,120 = 2.5 GB, then the 1.27 GB INT8 side table) and the GPTQ int4 lm_head.
Those are the largest single host-to-device copies of the draft load. Serving is unchanged: the
draft reads the target's tables either way. ``check_replaced`` fails the load if a placeholder
was not replaced (pipeline parallel, or a future vLLM that stops sharing).
"""

from __future__ import annotations

import os

ENV = "K8V4_DRAFT_SKIP_SHARED"
SHARED_KEYS = ("embed_tokens", "lm_head")
PLACEHOLDER_ROWS = 1
TABLES = ("model.embed_tokens", "lm_head")


def enabled() -> bool:
    """True when K8V4_DRAFT_SKIP_SHARED=1; unset or 0 keeps the full draft tables."""
    value = os.environ.get(ENV, "0").strip() or "0"
    if value not in ("0", "1"):
        raise RuntimeError("%s must be 0 or 1, got %r" % (ENV, value))
    return value == "1"


def _pipeline_parallel() -> bool:
    from vllm.distributed import get_pp_group

    return get_pp_group().world_size > 1


def table_rows(vocab_size: int, config: object) -> int:
    """Vocabulary rows for a draft table: a placeholder when the target's table will replace it."""
    if not enabled() or getattr(config, "tie_word_embeddings", False) or _pipeline_parallel():
        return vocab_size
    return PLACEHOLDER_ROWS


def is_shared_name(name: str) -> bool:
    return any(key in name for key in SHARED_KEYS)


def _placeholders(model) -> list[tuple[str, object]]:
    vocab = model.config.vocab_size
    found = []
    for name in TABLES:
        try:
            module = model.get_submodule(name)
        except AttributeError:
            continue
        if getattr(module, "org_vocab_size", vocab) == PLACEHOLDER_ROWS < vocab:
            found.append((name, module))
    return found


def load_without_shared(model, loader, weights) -> set[str]:
    """``loader.load_weights(weights)``, minus the shared tables when their modules are placeholders."""
    placeholders = _placeholders(model)
    if not placeholders:
        return loader.load_weights(weights)
    skipped: list[tuple[str, int]] = []

    def kept(items):
        for name, tensor in items:
            if is_shared_name(name):
                skipped.append((name, tensor.numel() * tensor.element_size()))
                continue
            yield name, tensor

    loaded = set(loader.load_weights(kept(weights)))
    for prefix, module in placeholders:
        module._k8v4_placeholder = True
        for pname, param in module.named_parameters():
            param.data.zero_()  # defined values (g_idx included) for process_weights_after_loading
            loaded.add("%s.%s" % (prefix, pname))
    print("[k8v4-draft-shared] %s=1: draft placeholders %s; skipped %d checkpoint tensors (%.2f GiB) "
          "that the target's tables replace" % (ENV, [p for p, _ in placeholders], len(skipped),
                                                 sum(b for _, b in skipped) / 2**30), flush=True)
    return loaded


def check_replaced(draft_model) -> None:
    """Raise if a placeholder table is still part of the draft after the target's tables were shared."""
    left = [name for name, module in draft_model.named_modules() if getattr(module, "_k8v4_placeholder", False)]
    if left:
        raise RuntimeError("%s=1 but the draft still uses placeholder tables %s; unset it for this setup"
                           % (ENV, left))
