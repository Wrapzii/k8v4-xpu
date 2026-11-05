"""Attach a QSA indexer to Qwen3.8-27B's full-attention layers.

The patch replaces ``Qwen3_5Attention.forward`` with a version that

1. reproduces the model's gated GQA exactly (dense path), and
2. optionally records the block-level dense teacher distribution
   (``block_teacher_from_qk``) and/or runs the QSA block-sparse path.

Only full-attention layers are touched; GDN layers keep their implementation.
The trainer drives the flags below per module, so no global state is needed.
"""

from __future__ import annotations

import math

import torch
import torch.nn.functional as F

from .indexer import QSAIndexer, rotate_half
from .sparse_attention import qsa_attention, select_blocks
from .teacher import block_teacher_from_qk

_PATCHED = False


def _rope(query: torch.Tensor, key: torch.Tensor, cos: torch.Tensor,
          sin: torch.Tensor) -> tuple[torch.Tensor, torch.Tensor]:
    cos = cos.unsqueeze(1)
    sin = sin.unsqueeze(1)
    d = cos.shape[-1]
    q_rot, q_pass = query[..., :d], query[..., d:]
    k_rot, k_pass = key[..., :d], key[..., d:]
    q_rot = q_rot * cos + rotate_half(q_rot) * sin
    k_rot = k_rot * cos + rotate_half(k_rot) * sin
    return torch.cat((q_rot, q_pass), dim=-1), torch.cat((k_rot, k_pass), dim=-1)


def _qsa_forward(self, hidden_states, position_embeddings, attention_mask=None,
                 past_key_values=None, **kwargs):
    if past_key_values is not None and past_key_values.get_seq_length() > 0:
        raise NotImplementedError("QSA patch does not support cached decoding")
    # The model always builds a causal mask and an (empty) cache for full
    # forwards; with unpadded batches this is exactly ``is_causal=True``.

    b, t, _ = hidden_states.shape
    q, gate = torch.chunk(
        self.q_proj(hidden_states).view(b, t, -1, self.head_dim * 2), 2, dim=-1
    )
    gate = gate.reshape(b, t, -1)
    query = self.q_norm(q).transpose(1, 2)
    key = self.k_norm(self.k_proj(hidden_states).view(b, t, -1, self.head_dim)).transpose(1, 2)
    value = self.v_proj(hidden_states).view(b, t, -1, self.head_dim).transpose(1, 2)

    cos, sin = position_embeddings
    query, key = _rope(query, key, cos, sin)

    block_size = getattr(self, "_qsa_block", 4)
    target = None

    groups = self.num_key_value_groups
    key_all = key.repeat_interleave(groups, dim=1) if groups > 1 else key
    value_all = value.repeat_interleave(groups, dim=1) if groups > 1 else value

    if getattr(self, "_qsa_collect", False):
        target, valid = block_teacher_from_qk(
            query, key_all, block_size, scale=self.scaling
        )
        keep = getattr(self, "_qsa_keep_target", False)
        self._qsa_target = target.half() if keep else None
        if keep:
            self._qsa_hidden = hidden_states.detach()
            self._qsa_rope = (cos.detach(), sin.detach())
        capture = getattr(self, "_qsa_capture", None)
        if capture is not None:
            _accumulate_capture(capture, target, valid, block_size)

    indexer = getattr(self, "_qsa_indexer", None)
    budget = getattr(self, "_qsa_budget", 0)
    if indexer is not None and budget > 0:
        scores, valid = indexer(hidden_states.float(), cos[0].float(), sin[0].float())
        mm = getattr(self, "_qsa_mm_capture", None)
        if mm is not None and target is not None:
            self._qsa_mm_target = target
            self._qsa_mm_valid = valid
            self._qsa_mm_scores = scores.detach()
        selected = select_blocks(scores, valid, budget, block_size)
        output = qsa_attention(query, key_all, value_all, selected, valid,
                               block_size, scale=self.scaling)
    else:
        # Expand GQA explicitly instead of ``enable_gqa=True``: the latter
        # selects the math backend, which materializes [B, H, T, T] and OOMs
        # at 16k. Expanded KV is small and keeps the flash kernel available.
        output = F.scaled_dot_product_attention(
            query, key_all, value_all, is_causal=True, scale=self.scaling
        )

    output = output.transpose(1, 2).reshape(b, t, -1)
    output = output * torch.sigmoid(gate)
    return self.o_proj(output), None


def _accumulate_capture(capture: dict, target: torch.Tensor, valid: torch.Tensor,
                        block_size: int) -> None:
    mask = valid.any(-1)
    if not mask.any():
        return
    for budget in capture["budgets"]:
        kb = min(target.shape[-1], math.ceil(budget / block_size))
        sel = torch.topk(target, kb, dim=-1).indices
        mass = target.gather(-1, sel).sum(-1)
        mass = mass[mask.expand_as(mass)]
        entry = capture["sums"].setdefault(budget, 0.0)
        capture["sums"][budget] = entry + mass.sum().item()
    capture["count"] += int(mask.sum())


def install(model, block_size: int = 4, budget: int = 0, indexer_heads: int = 4,
            indexer_head_dim: int = 128, rope_dim: int = 64,
            dtype: torch.dtype = torch.float32) -> list[int]:
    """Patch the attention class and attach indexers to full-attention layers."""
    global _PATCHED
    from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5Attention

    if not _PATCHED:
        Qwen3_5Attention.forward = _qsa_forward
        _PATCHED = True

    text = text_model(model)
    layers: list[int] = []
    for idx, layer in enumerate(text.layers):
        attn = getattr(layer, "self_attn", None)
        if not isinstance(attn, Qwen3_5Attention):
            continue
        attn._qsa_block = block_size
        attn._qsa_budget = budget
        if True:
            attn._qsa_indexer = QSAIndexer(
                hidden_size=attn.q_proj.in_features,
                num_heads=indexer_heads,
                head_dim=indexer_head_dim,
                rope_dim=rope_dim,
                block_size=block_size,
                logit_scale=indexer_head_dim ** -0.5,
            ).to(device=attn.q_proj.weight.device, dtype=dtype)
        attn._qsa_indexer.requires_grad_(True)
        layers.append(idx)
    return layers


def set_collect(model, flag: bool) -> None:
    from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5Attention

    for module in model.modules():
        if isinstance(module, Qwen3_5Attention) and hasattr(module, "_qsa_indexer"):
            module._qsa_collect = flag
            if not flag:
                module._qsa_target = None


def clear_targets(model) -> None:
    from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5Attention

    for module in model.modules():
        if isinstance(module, Qwen3_5Attention):
            module._qsa_target = None


def text_model(model):
    """Return the text backbone for either CausalLM or ConditionalGeneration."""
    inner = model.model
    return getattr(inner, "language_model", inner)


def full_attention_layers(model) -> list:
    from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5Attention

    return [m for m in model.modules() if isinstance(m, Qwen3_5Attention)]
