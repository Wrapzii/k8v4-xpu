"""Frozen GPTQ Int4 backbone for Swift / Qwen3.5 teacher capture.

The served checkpoint is AutoGPTQ Int4, group 128, symmetric, ``desc_act=false``.
Transformers 5.16 routes GPTQ through optimum and gptqmodel, which this image
does not ship, and it refuses CPU when those are missing. This module
dequantizes ``qweight`` / ``scales`` / ``qzeros`` on CPU and replays the text
stack one decoder layer at a time.

Activations saved for distillation (one full-attention layer):

- ``hidden_pre_attn`` ``[B, T, H]`` input of ``self_attn`` (after input RMSNorm)
- ``cos``, ``sin`` ``[B, T, rope_dim]``
- ``block_teacher`` ``[B, T, T // block]`` from ``qsa.teacher.block_teacher_from_qk``

Indexer export keys live in ``EXPORT_FORMAT.md``. They are not written here.
The flat names are ``model.language_model.layers.{i}.self_attn._qsa_indexer.{q_proj.weight,k_proj.weight,q_norm,k_norm,k_block_norm}``.
"""

from __future__ import annotations

import gc
import json
import os
from pathlib import Path

# Read before transformers is imported. Hub kernels are CUDA/Triton paths.
os.environ["USE_HUB_KERNELS"] = "0"

import torch
import torch.nn.functional as F

from qsa.teacher import block_teacher_from_qk


_BITS_DEFAULT = 4
_PACK = 32 // _BITS_DEFAULT


def full_attention_indices(layer_types) -> list[int]:
    return [i for i, kind in enumerate(layer_types) if kind == "full_attention"]


def _shifts(bits: int = _BITS_DEFAULT) -> torch.Tensor:
    return torch.arange(0, 32, bits, dtype=torch.int32)


def _unpack_qzeros(qzeros: torch.Tensor, bits: int = _BITS_DEFAULT) -> torch.Tensor:
    """``qzeros`` ``[groups, out/pack]`` -> zero-points ``[groups, out]``.

    AutoGPTQ / GPTQ checkpoints store ``zp - 1`` because the Exllama kernel
    adds one. Symmetric 4-bit checkpoints store nibble 7, which becomes 8.
    """
    if qzeros.dtype != torch.int32:
        qzeros = qzeros.to(torch.int32)
    groups, packed_out = qzeros.shape
    pack = 32 // bits
    shifts = _shifts(bits)
    mask = (1 << bits) - 1
    expanded = qzeros.unsqueeze(-1).expand(groups, packed_out, pack)
    nibbles = torch.bitwise_and(torch.bitwise_right_shift(expanded, shifts.view(1, 1, pack)), mask)
    zeros = nibbles.reshape(groups, packed_out * pack).to(torch.int32)
    return zeros + 1


def _unpack_qweight_rows(qweight_rows: torch.Tensor, bits: int = _BITS_DEFAULT) -> torch.Tensor:
    """``qweight`` rows ``[n, out]`` -> int values ``[n * pack, out]``."""
    if qweight_rows.dtype != torch.int32:
        qweight_rows = qweight_rows.to(torch.int32)
    rows, out = qweight_rows.shape
    pack = 32 // bits
    shifts = _shifts(bits)
    mask = (1 << bits) - 1
    expanded = qweight_rows.unsqueeze(1).expand(rows, pack, out)
    nibbles = torch.bitwise_and(
        torch.bitwise_right_shift(expanded, shifts.view(1, pack, 1)),
        mask,
    )
    return nibbles.reshape(rows * pack, out)


def dequantize_gptq_linear(
    qweight: torch.Tensor,
    scales: torch.Tensor,
    qzeros: torch.Tensor,
    g_idx: torch.Tensor | None = None,
    *,
    bits: int = _BITS_DEFAULT,
    group_size: int = 128,
    dtype: torch.dtype = torch.float16,
) -> torch.Tensor:
    """Dequantize one AutoGPTQ linear to ``[out_features, in_features]`` for ``nn.Linear``.

    ``desc_act`` must be false: packed row ``i`` is input feature ``i``.
    ``g_idx``, when present, selects the scale group of each input feature.
    A monotonic ``arange(in) // group_size`` index is treated as absent.
    """
    if bits != 4:
        raise ValueError(f"only 4-bit GPTQ is implemented, got bits={bits}")
    if group_size <= 0:
        raise ValueError("group_size must be positive")
    pack = 32 // bits
    in_packed, out_features = qweight.shape
    in_features = in_packed * pack
    if in_features % group_size != 0:
        raise ValueError(f"in_features {in_features} is not divisible by group_size {group_size}")
    groups = in_features // group_size
    if tuple(scales.shape) != (groups, out_features):
        raise ValueError(f"scales {tuple(scales.shape)} != {(groups, out_features)}")
    zeros = _unpack_qzeros(qzeros, bits)
    if tuple(zeros.shape) != (groups, out_features):
        raise ValueError(f"qzeros unpacked to {tuple(zeros.shape)}, expected {(groups, out_features)}")
    if g_idx is not None:
        g_idx = g_idx.to(torch.int64).view(-1)
        if g_idx.numel() != in_features:
            raise ValueError(f"g_idx length {g_idx.numel()} != in_features {in_features}")
        identity = torch.arange(in_features, dtype=torch.int64) // group_size
        if torch.equal(g_idx, identity):
            g_idx = None
        elif bool((g_idx < 0).any().item()) or bool((g_idx >= groups).any().item()):
            raise ValueError("g_idx is outside the scale groups")

    scales_f = scales.to(torch.float32)
    zeros_f = zeros.to(torch.float32)
    weight = torch.empty(out_features, in_features, dtype=dtype)
    rows_per_group = group_size // pack
    for group in range(groups):
        packed = qweight[group * rows_per_group:(group + 1) * rows_per_group]
        values = _unpack_qweight_rows(packed, bits).to(torch.float32)
        if g_idx is None:
            block = (values - zeros_f[group]) * scales_f[group]
        else:
            which = g_idx[group * group_size:(group + 1) * group_size]
            block = (values - zeros_f[which]) * scales_f[which]
        weight[:, group * group_size:(group + 1) * group_size] = block.transpose(0, 1).to(dtype)
    return weight


def _pack_int4_along_rows(values: torch.Tensor) -> torch.Tensor:
    """Test helper. ``values`` ``[in, out]`` in ``0..15`` -> ``qweight`` ``[in/8, out]``."""
    if values.shape[0] % _PACK != 0:
        raise ValueError("in_features must be divisible by 8")
    grouped = values.to(torch.int32).reshape(-1, _PACK, values.shape[1])
    packed = torch.zeros(grouped.shape[0], values.shape[1], dtype=torch.int32)
    for slot in range(_PACK):
        packed = torch.bitwise_or(packed, torch.bitwise_left_shift(grouped[:, slot], 4 * slot))
    return packed


def _pack_int4_qzeros(stored: torch.Tensor) -> torch.Tensor:
    """Test helper. ``stored`` ``[groups, out]`` in ``0..15`` (before the +1) -> ``qzeros``."""
    if stored.shape[1] % _PACK != 0:
        raise ValueError("out_features must be divisible by 8")
    grouped = stored.to(torch.int32).reshape(stored.shape[0], -1, _PACK)
    packed = torch.zeros(stored.shape[0], grouped.shape[1], dtype=torch.int32)
    for slot in range(_PACK):
        packed = torch.bitwise_or(packed, torch.bitwise_left_shift(grouped[:, :, slot], 4 * slot))
    return packed


def gptq_self_test() -> None:
    """Round-trip a known symmetric matrix, including a negative int32 word."""
    in_features, out_features, group_size = 128, 16, 128
    codes = torch.full((in_features, out_features), 8, dtype=torch.int32)
    codes[0, 0] = 9
    codes[3, 1] = 7
    codes[-1, -1] = 15
    qweight = _pack_int4_along_rows(codes)
    if int(qweight.reshape(-1, out_features)[-1, -1]) >= 0:
        raise AssertionError("top-nibble 15 did not produce a negative int32 word")
    scales = torch.full((1, out_features), 0.25, dtype=torch.float16)
    scales[0, 1] = 0.5
    qzeros = _pack_int4_qzeros(torch.full((1, out_features), 7, dtype=torch.int32))
    weight = dequantize_gptq_linear(qweight, scales, qzeros, g_idx=torch.arange(in_features) // group_size)
    # [out, in], value = scale * (code - 8)
    expected = torch.zeros(out_features, in_features, dtype=torch.float32)
    expected[0, 0] = 0.25 * (9 - 8)
    expected[1, 3] = 0.5 * (7 - 8)
    expected[-1, -1] = 0.25 * (15 - 8)
    got = weight.float()
    if not torch.allclose(got, expected):
        mismatch = (got - expected).abs().argmax()
        raise AssertionError(f"GPTQ round-trip mismatch at flat {int(mismatch)}")
    if not torch.equal(_unpack_qzeros(qzeros), torch.full((1, out_features), 8, dtype=torch.int32)):
        raise AssertionError("symmetric qzeros did not unpack to 8")


def _zero_centered_rms(x: torch.Tensor, weight: torch.Tensor, eps: float) -> torch.Tensor:
    """Qwen3.5 RMSNorm: stored ``weight`` is the zero-centered delta."""
    var = x.float().pow(2).mean(-1, keepdim=True)
    y = x.float() * torch.rsqrt(var + eps)
    y = y * (1.0 + weight.float())
    return y.to(dtype=x.dtype)


def apply_partial_rope(query: torch.Tensor, key: torch.Tensor, cos: torch.Tensor, sin: torch.Tensor):
    """``query``/``key`` are ``[B, H, T, D]``. ``cos``/``sin`` are ``[B, T, rotary]``."""
    cos = cos.unsqueeze(1)
    sin = sin.unsqueeze(1)
    rotary = cos.shape[-1]

    def _rotate(x):
        x_rot, x_pass = x[..., :rotary], x[..., rotary:]
        half = rotary // 2
        x1, x2 = x_rot[..., :half], x_rot[..., half:]
        twisted = torch.cat((-x2, x1), dim=-1)
        return torch.cat((x_rot * cos + twisted * sin, x_pass), dim=-1)

    return _rotate(query), _rotate(key)


def project_qk_teacher(
    hidden: torch.Tensor,
    q_weight: torch.Tensor,
    k_weight: torch.Tensor,
    q_norm: torch.Tensor,
    k_norm: torch.Tensor,
    cos: torch.Tensor,
    sin: torch.Tensor,
    *,
    num_heads: int,
    num_kv_heads: int,
    head_dim: int,
    block_size: int,
    eps: float,
    scale: float | None = None,
) -> dict[str, torch.Tensor]:
    """Q/K teacher from an already-normalized attention input."""
    b, t, _ = hidden.shape
    q_lin = F.linear(hidden, q_weight)
    q, _gate = q_lin.view(b, t, num_heads, head_dim * 2).chunk(2, dim=-1)
    q = _zero_centered_rms(q, q_norm, eps).transpose(1, 2)
    k = F.linear(hidden, k_weight).view(b, t, num_kv_heads, head_dim)
    k = _zero_centered_rms(k, k_norm, eps).transpose(1, 2)
    q, k = apply_partial_rope(q, k, cos, sin)
    groups = num_heads // num_kv_heads
    if groups > 1:
        k = k.repeat_interleave(groups, dim=1)
    target, valid = block_teacher_from_qk(q, k, block_size, scale=scale)
    return {
        "hidden_pre_attn": hidden.detach(),
        "cos": cos.detach(),
        "sin": sin.detach(),
        "block_teacher": target.detach(),
        "valid": valid.detach(),
    }


class WeightIndex:
    """Read-only safetensors index. Files stay mapped until ``close``."""

    def __init__(self, model_dir: Path):
        self.model_dir = Path(model_dir)
        index_path = self.model_dir / "model.safetensors.index.json"
        payload = json.loads(index_path.read_text())
        self.weight_map: dict[str, str] = payload["weight_map"]
        self._files = {}

    def has(self, key: str) -> bool:
        return key in self.weight_map

    def _file(self, key: str):
        from safetensors import safe_open

        shard = self.weight_map[key]
        handle = self._files.get(shard)
        if handle is None:
            handle = safe_open(self.model_dir / shard, framework="pt", device="cpu")
            self._files[shard] = handle
        return handle

    def get(self, key: str) -> torch.Tensor:
        return self._file(key).get_tensor(key)

    def rows(self, key: str, indices: list[int]) -> torch.Tensor:
        slicer = self._file(key).get_slice(key)
        return torch.stack([slicer[int(i)] for i in indices], dim=0)

    def close(self) -> None:
        self._files.clear()


def probe_transformers_gptq(model_dir: str | Path) -> tuple[torch.nn.Module | None, str | None]:
    """Try to load the checkpoint with transformers GPTQ on CPU.

    The quantizer is built the same way ``from_pretrained`` builds it. When
    that rejects the environment, weights are not read: a 27B allocate must
    not start. On success, ``AutoModelForImageTextToText`` then
    ``AutoModelForCausalLM`` are tried with ``device_map`` CPU.
    """
    try:
        from transformers import AutoConfig, AutoModelForCausalLM, AutoModelForImageTextToText
        from transformers.quantizers.auto import AutoHfQuantizer
    except Exception as exc:
        return None, f"{type(exc).__name__}: {exc}"
    try:
        config = AutoConfig.from_pretrained(str(model_dir), local_files_only=True)
        quantizer = AutoHfQuantizer.from_config(config.quantization_config, pre_quantized=True)
        quantizer.validate_environment()
    except Exception as exc:
        return None, f"{type(exc).__name__}: {exc}"
    errors: list[str] = []
    for name, cls in (
        ("AutoModelForImageTextToText", AutoModelForImageTextToText),
        ("AutoModelForCausalLM", AutoModelForCausalLM),
    ):
        try:
            model = cls.from_pretrained(
                str(model_dir),
                dtype=torch.float16,
                device_map={"": "cpu"},
                low_cpu_mem_usage=True,
                local_files_only=True,
                attn_implementation="eager",
            )
            return model, None
        except Exception as exc:
            errors.append(f"{name}: {type(exc).__name__}: {exc}")
    return None, " | ".join(errors)


class FrozenGPTQSwift:
    """Frozen Swift GPTQ text backbone with layer-wise or hook capture.

    ``forward_layerwise`` dequantizes one decoder layer, runs it, and drops
    the weights. ``install_capture_hooks`` records the same tensors from a
    transformers module whose ``q_proj`` / ``k_proj`` are dense ``nn.Linear``
    weights. ``forward_minimal`` is the fallback: real Q/K of each
    full-attention layer applied to the token embedding (or a supplied hidden).
    """

    def __init__(self, model_dir: str | Path, *, probe: bool = True):
        self.model_dir = Path(model_dir)
        self.config = json.loads((self.model_dir / "config.json").read_text())
        quant = self.config.get("quantization_config") or {}
        if quant.get("quant_method") != "gptq":
            raise ValueError(f"expected quant_method gptq, got {quant.get('quant_method')!r}")
        self.bits = int(quant.get("bits", 4))
        self.group_size = int(quant.get("group_size", 128))
        self.desc_act = bool(quant.get("desc_act", False))
        self.sym = bool(quant.get("sym", True))
        if self.bits != 4 or self.group_size != 128:
            raise ValueError(f"expected int4 g128, got bits={self.bits} group={self.group_size}")
        if self.desc_act:
            raise NotImplementedError("desc_act=true permutes input rows; this loader does not")
        text = self.config["text_config"]
        self.hidden_size = int(text["hidden_size"])
        self.num_heads = int(text["num_attention_heads"])
        self.num_kv_heads = int(text["num_key_value_heads"])
        self.head_dim = int(text["head_dim"])
        self.num_layers = int(text["num_hidden_layers"])
        self.rms_eps = float(text["rms_norm_eps"])
        self.vocab_size = int(text["vocab_size"])
        rope = text["rope_parameters"]
        self.rope_theta = float(rope["rope_theta"])
        self.partial_rotary = float(rope.get("partial_rotary_factor", text.get("partial_rotary_factor", 1.0)))
        self.mrope_section = list(rope.get("mrope_section", [11, 11, 10]))
        self.layer_types = list(text["layer_types"])
        self.full_layers = full_attention_indices(self.layer_types)
        if self.full_layers != list(range(3, self.num_layers, 4)):
            raise ValueError(f"unexpected full-attention layers: {self.full_layers}")
        self.index = WeightIndex(self.model_dir)
        self.hf_model = None
        self.hf_error: str | None = None
        self.replay_error: str | None = None
        self.captures: dict[int, dict[str, torch.Tensor]] = {}
        self._hook_handles = []
        self._text_config = None
        if probe:
            self.hf_model, self.hf_error = probe_transformers_gptq(self.model_dir)

    def close(self) -> None:
        self.remove_hooks()
        self.index.close()
        self.hf_model = None

    def dequant_linear(self, prefix: str) -> torch.Tensor:
        """``prefix`` is the module path without ``.weight``, for example
        ``model.language_model.layers.3.self_attn.q_proj``.
        """
        g_idx = None
        if self.index.has(prefix + ".g_idx"):
            g_idx = self.index.get(prefix + ".g_idx")
        weight = dequantize_gptq_linear(
            self.index.get(prefix + ".qweight"),
            self.index.get(prefix + ".scales"),
            self.index.get(prefix + ".qzeros"),
            g_idx,
            bits=self.bits,
            group_size=self.group_size,
            dtype=torch.float16,
        )
        return weight

    def embed(self, input_ids: torch.Tensor) -> torch.Tensor:
        if input_ids.ndim == 1:
            input_ids = input_ids.unsqueeze(0)
        flat = input_ids.reshape(-1).to(torch.int64).tolist()
        rows = self.index.rows("model.language_model.embed_tokens.weight", flat)
        return rows.view(*input_ids.shape, self.hidden_size).to(torch.float16)

    def rope(self, batch: int, seq: int, *, dtype: torch.dtype = torch.float16) -> tuple[torch.Tensor, torch.Tensor]:
        """Text MRoPE. Equal T/H/W positions match ``Qwen3_5TextModel``."""
        text = self._load_text_config()
        from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5TextRotaryEmbedding

        rotary = Qwen3_5TextRotaryEmbedding(text)
        dummy = torch.zeros(batch, seq, self.hidden_size, dtype=dtype)
        position_ids = torch.arange(seq).view(1, 1, seq).expand(3, batch, seq)
        cos, sin = rotary(dummy, position_ids)
        return cos, sin

    def _load_text_config(self):
        if self._text_config is not None:
            return self._text_config
        from transformers import AutoConfig

        config = AutoConfig.from_pretrained(self.model_dir, local_files_only=True)
        text = config.text_config
        text._attn_implementation = "eager"
        self._text_config = text
        return text

    def _prefix(self, layer_idx: int) -> str:
        return f"model.language_model.layers.{layer_idx}"

    def capture_layer(
        self,
        layer_idx: int,
        hidden: torch.Tensor,
        cos: torch.Tensor,
        sin: torch.Tensor,
        *,
        block_size: int = 4,
        source: str = "minimal",
        apply_input_norm: bool = True,
    ) -> dict:
        """Dequantize ``q_proj`` / ``k_proj`` of one full-attention layer and score blocks.

        ``hidden`` is the residual entering the layer when ``apply_input_norm``
        is true, and the attention input otherwise.
        """
        if layer_idx not in self.full_layers:
            raise ValueError(f"layer {layer_idx} is not a full-attention layer")
        if hidden.ndim == 2:
            hidden = hidden.unsqueeze(0)
        prefix = self._prefix(layer_idx)
        if apply_input_norm:
            norm_w = self.index.get(prefix + ".input_layernorm.weight")
            hidden = _zero_centered_rms(hidden, norm_w, self.rms_eps)
        q_weight = self.dequant_linear(prefix + ".self_attn.q_proj")
        k_weight = self.dequant_linear(prefix + ".self_attn.k_proj")
        q_norm = self.index.get(prefix + ".self_attn.q_norm.weight")
        k_norm = self.index.get(prefix + ".self_attn.k_norm.weight")
        packed = project_qk_teacher(
            hidden,
            q_weight,
            k_weight,
            q_norm,
            k_norm,
            cos,
            sin,
            num_heads=self.num_heads,
            num_kv_heads=self.num_kv_heads,
            head_dim=self.head_dim,
            block_size=block_size,
            eps=self.rms_eps,
            scale=self.head_dim ** -0.5,
        )
        del q_weight, k_weight
        return self._finalize_capture(packed, layer_idx, source)

    def _finalize_capture(self, packed: dict, layer_idx: int, source: str) -> dict:
        out = {
            "layer_idx": layer_idx,
            "source": source,
            "hidden_pre_attn": packed["hidden_pre_attn"].to(device="cpu", dtype=torch.float16).contiguous(),
            "cos": packed["cos"].to(device="cpu", dtype=torch.float16).contiguous(),
            "sin": packed["sin"].to(device="cpu", dtype=torch.float16).contiguous(),
            "block_teacher": packed["block_teacher"].to(device="cpu", dtype=torch.float16).contiguous(),
            "valid": packed["valid"].to(device="cpu").contiguous(),
        }
        for name in ("hidden_pre_attn", "cos", "sin", "block_teacher"):
            if not torch.isfinite(out[name]).all():
                raise RuntimeError(f"non-finite {name} at layer {layer_idx} ({source})")
        return out

    def forward_minimal(
        self,
        input_ids: torch.Tensor,
        layers: list[int] | None = None,
        *,
        block_size: int = 4,
        hidden: torch.Tensor | None = None,
    ) -> dict[int, dict]:
        """Real Q/K of each requested layer, on the embedding (or ``hidden``).

        This is not the residual after earlier GDN layers. It exists so a
        teacher file can be written when the transformers GPTQ load and the
        layer replay both fail.
        """
        layers = list(self.full_layers if layers is None else layers)
        if input_ids.ndim == 1:
            input_ids = input_ids.unsqueeze(0)
        if hidden is None:
            hidden = self.embed(input_ids)
        elif hidden.ndim == 2:
            hidden = hidden.unsqueeze(0)
        cos, sin = self.rope(hidden.shape[0], hidden.shape[1], dtype=hidden.dtype)
        captures = {}
        for layer_idx in layers:
            captures[layer_idx] = self.capture_layer(
                layer_idx, hidden, cos, sin, block_size=block_size, source="minimal-embedding",
            )
            print(f"[gptq] minimal layer {layer_idx} teacher {tuple(captures[layer_idx]['block_teacher'].shape)}", flush=True)
            gc.collect()
        self.captures = captures
        return captures

    def install_capture_hooks(self, model, layers: list[int] | None = None, *, block_size: int = 4) -> list[int]:
        """Pre-hooks on ``Qwen3_5Attention``. The module must expose dense ``.weight``."""
        from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5Attention

        wanted = set(self.full_layers if layers is None else layers)
        found: list[int] = []
        for module in model.modules():
            if not isinstance(module, Qwen3_5Attention) or module.layer_idx not in wanted:
                continue

            def _pre(mod, args, kwargs, layer_idx=module.layer_idx):
                hidden = kwargs.get("hidden_states", args[0] if args else None)
                cos, sin = kwargs["position_embeddings"]
                q_weight = mod.q_proj.weight
                k_weight = mod.k_proj.weight
                packed = project_qk_teacher(
                    hidden,
                    q_weight,
                    k_weight,
                    mod.q_norm.weight,
                    mod.k_norm.weight,
                    cos,
                    sin,
                    num_heads=self.num_heads,
                    num_kv_heads=self.num_kv_heads,
                    head_dim=mod.head_dim,
                    block_size=block_size,
                    eps=self.rms_eps,
                    scale=mod.scaling,
                )
                self.captures[layer_idx] = self._finalize_capture(packed, layer_idx, "hook")

            self._hook_handles.append(module.register_forward_pre_hook(_pre, with_kwargs=True))
            found.append(module.layer_idx)
        return found

    def remove_hooks(self) -> None:
        for handle in self._hook_handles:
            handle.remove()
        self._hook_handles.clear()

    def forward_hooks(self, input_ids: torch.Tensor, layers: list[int] | None = None, *, block_size: int = 4):
        if self.hf_model is None:
            raise RuntimeError(self.hf_error or "transformers GPTQ model is not loaded")
        if input_ids.ndim == 1:
            input_ids = input_ids.unsqueeze(0)
        self.captures = {}
        self.install_capture_hooks(self.hf_model, layers, block_size=block_size)
        try:
            with torch.inference_mode():
                self.hf_model(input_ids=input_ids, use_cache=False)
        finally:
            self.remove_hooks()
        return dict(self.captures)

    def _new_decoder_layer(self, text_config, layer_idx: int):
        from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5DecoderLayer

        previous = torch.get_default_dtype()
        torch.set_default_dtype(torch.float16)
        try:
            layer = Qwen3_5DecoderLayer(text_config, layer_idx)
        finally:
            torch.set_default_dtype(previous)
        layer.eval()
        return layer

    def _assign(self, layer, qualname: str, tensor: torch.Tensor) -> None:
        owner = layer
        parts = qualname.split(".")
        for part in parts[:-1]:
            owner = getattr(owner, part)
        name = parts[-1]
        current = getattr(owner, name)
        if tuple(current.shape) != tuple(tensor.shape):
            raise ValueError(f"{qualname}: checkpoint {tuple(tensor.shape)} != module {tuple(current.shape)}")
        setattr(owner, name, torch.nn.Parameter(tensor.to(dtype=current.dtype), requires_grad=False))

    def _load_decoder_layer(self, layer, layer_idx: int) -> None:
        prefix = self._prefix(layer_idx)
        for qualname, _param in list(layer.named_parameters()):
            key = f"{prefix}.{qualname}"
            if self.index.has(key):
                tensor = self.index.get(key)
            elif qualname.endswith(".weight") and self.index.has(key.removesuffix(".weight") + ".qweight"):
                tensor = self.dequant_linear(key.removesuffix(".weight"))
            else:
                raise KeyError(key)
            self._assign(layer, qualname, tensor)
            del tensor

    def forward_layerwise(
        self,
        input_ids: torch.Tensor,
        layers: list[int] | None = None,
        *,
        block_size: int = 4,
        end_layer: int | None = None,
    ) -> dict[int, dict]:
        """Replay decoder layers ``0..end`` on CPU, capturing full-attention teachers."""
        wanted = set(self.full_layers if layers is None else layers)
        if input_ids.ndim == 1:
            input_ids = input_ids.unsqueeze(0)
        text = self._load_text_config()
        hidden = self.embed(input_ids)
        cos, sin = self.rope(hidden.shape[0], hidden.shape[1], dtype=hidden.dtype)
        seq = hidden.shape[1]
        causal = torch.triu(
            torch.full((1, 1, seq, seq), float("-inf"), dtype=hidden.dtype),
            diagonal=1,
        )
        last = max(wanted) if end_layer is None else end_layer
        captures: dict[int, dict] = {}
        for layer_idx in range(last + 1):
            layer = self._new_decoder_layer(text, layer_idx)
            self._load_decoder_layer(layer, layer_idx)
            if layer_idx in wanted and layer.block_type == "full_attention":
                attn = layer.self_attn

                def _pre(mod, args, kwargs, layer_idx=layer_idx):
                    h = kwargs["hidden_states"]
                    c, s = kwargs["position_embeddings"]
                    packed = project_qk_teacher(
                        h,
                        mod.q_proj.weight,
                        mod.k_proj.weight,
                        mod.q_norm.weight,
                        mod.k_norm.weight,
                        c,
                        s,
                        num_heads=self.num_heads,
                        num_kv_heads=self.num_kv_heads,
                        head_dim=mod.head_dim,
                        block_size=block_size,
                        eps=self.rms_eps,
                        scale=mod.scaling,
                    )
                    captures[layer_idx] = self._finalize_capture(packed, layer_idx, "layer-replay")

                handle = attn.register_forward_pre_hook(_pre, with_kwargs=True)
            else:
                handle = None
            mask = causal if layer.block_type == "full_attention" else None
            with torch.inference_mode():
                hidden = layer(
                    hidden,
                    position_embeddings=(cos, sin),
                    attention_mask=mask,
                    position_ids=None,
                    past_key_values=None,
                )
            if handle is not None:
                handle.remove()
            finite = bool(torch.isfinite(hidden).all())
            print(f"[gptq] replay layer {layer_idx} {layer.block_type} finite={finite}", flush=True)
            if not finite:
                raise RuntimeError(f"non-finite hidden after layer {layer_idx}")
            del layer
            gc.collect()
        self.captures = captures
        return captures

    def capture(
        self,
        input_ids: torch.Tensor,
        *,
        mode: str = "auto",
        layers: list[int] | None = None,
        block_size: int = 4,
        end_layer: int | None = None,
    ) -> dict[int, dict]:
        """``auto`` uses hooks when transformers loaded the GPTQ model, else layer replay, else minimal Q/K."""
        if mode not in {"auto", "hook", "layer", "minimal"}:
            raise ValueError(f"unknown mode {mode}")
        if mode == "hook" or (mode == "auto" and self.hf_model is not None):
            return self.forward_hooks(input_ids, layers, block_size=block_size)
        if mode == "minimal":
            return self.forward_minimal(input_ids, layers, block_size=block_size)
        try:
            return self.forward_layerwise(
                input_ids, layers, block_size=block_size, end_layer=end_layer,
            )
        except Exception as exc:
            self.replay_error = f"{type(exc).__name__}: {exc}"
            if mode == "layer":
                raise
            print(f"[gptq] layer replay failed ({self.replay_error}); minimal Q/K path", flush=True)
            return self.forward_minimal(input_ids, layers, block_size=block_size)
