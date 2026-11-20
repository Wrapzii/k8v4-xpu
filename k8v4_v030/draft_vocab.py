"""Frequency-ranked draft vocabulary for the MTP drafter (``K8V4_DRAFT_VOCAB``).

Every MTP draft step ends in the full lm_head: 248,320 vocab rows x 5,120.
For the Swift bake that is the GPTQ int4 head, about 0.65 GB of weights and
scales read per draft step, the same at one user as at four, and MTP6 runs
six draft steps per verify step. Restricting the DRAFT's logits to the most
frequent tokens reads only those rows. On our B70 stack a 64K-token ranking
was part of the -3 decode win (2026-10-05: lossless +20% one-user decode
with the bf16 head; less with an int4 head, which is already 4x smaller).

``K8V4_DRAFT_VOCAB=<path>`` names a JSON list of token ids (for example the
65,536 most frequent). At load the drafter gets a private row subset of its
lm_head (GPTQ int4 rows + their scales, or bf16/fp16 rows of an unquantized
head; about 170 MB for 64K int4 rows) and its logits are that GEMM scattered
into a full-vocab row of -inf. The target's head is untouched.

Lossless: the target verifies every draft token, so served outputs are
unchanged. Only acceptance can move (a token outside the list can never be
drafted). Rejection sampling stays valid at temperature > 0: the draft
distribution is zero outside the list, which is still a proper distribution.
Unset (the default) changes nothing.
"""

from __future__ import annotations

import json
import os
from types import MethodType

ENV_NAME = "K8V4_DRAFT_VOCAB"


def vocab_path(environ: dict[str, str] | None = None) -> str | None:
    source = os.environ if environ is None else environ
    value = source.get(ENV_NAME, "").strip()
    return value or None


def load_ids(path: str, vocab_size: int) -> list[int]:
    """Sorted unique token ids from a JSON list; refuses anything out of range."""
    with open(path, encoding="utf-8") as handle:
        raw = json.load(handle)
    if not isinstance(raw, list) or not raw:
        raise RuntimeError("%s must be a non-empty JSON list of token ids: %s" % (ENV_NAME, path))
    ids = set()
    for item in raw:
        if isinstance(item, bool) or not isinstance(item, int):
            raise RuntimeError("%s: token id %r is not an int" % (ENV_NAME, item))
        if item < 0 or item >= int(vocab_size):
            raise RuntimeError("%s: token id %d outside vocab %d" % (ENV_NAME, item, vocab_size))
        ids.add(item)
    if len(ids) >= int(vocab_size):
        raise RuntimeError("%s lists the whole vocab (%d ids); nothing to save" % (ENV_NAME, len(ids)))
    return sorted(ids)


def int4_form(head, w_zp) -> str:
    """``u4`` (one scalar zero point 8) or ``s4`` (W4A8 onednn flip: empty zero point)."""
    if w_zp is not None and w_zp.numel() == 0 and getattr(head, "_k8v4_s4", False):
        return "s4"
    if w_zp is not None and w_zp.numel() == 1:
        return "u4"
    raise RuntimeError(
        "%s: only the symmetric int4 head is supported (zero point %s)"
        % (ENV_NAME, None if w_zp is None else tuple(w_zp.shape))
    )


def _gptq_rows(head, ids):
    """Row subset of an XPU wNa16 GPTQ head, or None when the head is not one.

    After vLLM's XPUwNa16 process_weights_after_loading the packed weight is
    [N, K/8] (output rows first) and the scales [K/group, N]; the op takes
    the weight transposed. Two forms are taken (``int4_form``): the stock
    symmetric one (one scalar zero point 8, u4 nibbles, the stock op), and
    the s4 form that ``K8V4_W4A8_KERNEL=onednn`` leaves after load (same
    packing with every nibble XOR 0x8, an empty zero point, the k8v4_w4a8
    library op). The subset GEMM is the op the head itself decodes with, on
    the same packed rows and scales.
    """
    import torch

    method = getattr(head, "quant_method", None)
    kernel = getattr(method, "kernel", None)
    if kernel is None or not hasattr(kernel, "_get_weight_params"):
        return None
    w_q, w_s, w_zp = kernel._get_weight_params(head)
    group = int(kernel.config.group_size)
    rows = int(w_s.shape[1])
    if w_q.dim() != 2 or w_q.shape[0] != rows or w_s.dim() != 2:
        raise RuntimeError(
            "%s: unexpected int4 head layout q%s s%s" % (ENV_NAME, tuple(w_q.shape), tuple(w_s.shape))
        )
    form = int4_form(head, w_zp)
    q = w_q.index_select(0, ids).contiguous()
    s = w_s.index_select(1, ids).contiguous()

    if form == "s4":
        def gemm(x):
            return torch.ops.k8v4_w4a8.int4_gemm_w4a16(x, q.t(), s, None, group)
    else:
        def gemm(x):
            return torch.ops._xpu_C.int4_gemm_w4a16(x, q.t(), None, s, w_zp, group, None)

    return gemm, q.numel() * q.element_size() + s.numel() * s.element_size()


def _dense_rows(head, ids):
    import torch.nn.functional as F

    weight = getattr(head, "weight", None)
    if weight is None or weight.dim() != 2 or weight.dtype.is_floating_point is False:
        return None
    w = weight.index_select(0, ids).contiguous()

    def gemm(x):
        return F.linear(x, w)

    return gemm, w.numel() * w.element_size()


def install(model, environ: dict[str, str] | None = None) -> bool:
    """Give the draft model a row-subset head. No-op unless ``K8V4_DRAFT_VOCAB`` is set."""
    path = vocab_path(environ)
    if path is None:
        return False
    import torch

    head = getattr(model, "lm_head", None)
    proc = getattr(model, "logits_processor", None)
    if head is None or proc is None:
        raise RuntimeError("%s: draft model %s has no lm_head/logits_processor" % (ENV_NAME, type(model).__name__))
    if getattr(head, "tp_size", 1) != 1:
        raise RuntimeError("%s supports one GPU per model (tp 1) only" % ENV_NAME)
    if getattr(proc, "soft_cap", None) is not None or float(getattr(proc, "scale", 1.0)) != 1.0:
        raise RuntimeError("%s: logits soft cap / scale are not supported" % ENV_NAME)
    if getattr(proc, "logits_as_input", False):
        raise RuntimeError("%s: logits_as_input heads are not supported" % ENV_NAME)
    vocab = int(proc.org_vocab_size)
    ids_list = load_ids(path, vocab)
    device = next(iter(head.parameters())).device
    ids = torch.tensor(ids_list, dtype=torch.long, device=device)
    built = _gptq_rows(head, ids) or _dense_rows(head, ids)
    if built is None:
        raise RuntimeError("%s: unsupported lm_head %s" % (ENV_NAME, type(head).__name__))
    gemm, nbytes = built

    def compute_logits(self, hidden_states, spec_step_idx: int = 0):
        flat = hidden_states.reshape(-1, hidden_states.shape[-1])
        part = gemm(flat)
        full = part.new_full((flat.shape[0], vocab), float("-inf"))
        full.index_copy_(1, ids, part)
        return full.reshape(*hidden_states.shape[:-1], vocab)

    def get_top_tokens(self, hidden_states):
        flat = hidden_states.reshape(-1, hidden_states.shape[-1])
        return ids[gemm(flat).argmax(dim=-1)].reshape(hidden_states.shape[:-1])

    model.compute_logits = MethodType(compute_logits, model)
    model.get_top_tokens = MethodType(get_top_tokens, model)
    print(
        "k8v4 draft vocab: %d of %d rows from %s (%.0f MB draft-only head)"
        % (len(ids_list), vocab, path, nbytes / 1e6),
        flush=True,
    )
    return True
