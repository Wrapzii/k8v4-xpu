"""Length-gated W4A8 prefill for the GPTQ WNA16 linears.

Decode and other small-M steps stay on ``int4_gemm_w4a16``. A prefill row
count above ``SMALL_M_MAX`` quantizes activations per token and calls the
existing XPU ``int4_gemm_w4a8`` op, and only on MLP linears. Attention and
Gated DeltaNet projections stay on ``int4_gemm_w4a16`` so the KV cache and
the recurrent state the MTP draft reads are still the original GEMM.
The int32 weight blob is the one WNA16 already passes as ``qweight.t()``.

This is not an EXL3 Hadamard repack. The checkpoint stays GPTQ INT4.

``K8V4_W4A8_LAYERS`` (opt-in, default ``mlp``) widens the gate to more
projection families: a comma list of ``mlp``, ``attn`` (``self_attn``),
``gdn`` (``linear_attn``) and ``other`` (any remaining GPTQ linear, e.g. the
MTP ``fc``), or ``all``. Widening it changes the KV cache and the GDN state
slightly (int8 activations), so it stays opt-in. Measured reason and
numbers: docs/2026-11-19-prefill-w4a8-layers.md.
"""

from __future__ import annotations

import os

import torch

SMALL_M_MAX = 128
_FINDER = None
_ORIG_APPLY = None

def pack_signed_int4(weight_nk: torch.Tensor, low_nibble_first: bool = True) -> torch.Tensor:
    """Pack signed int4 ``[N, K]`` into int32 ``[N, K/8]``."""
    if weight_nk.ndim != 2 or weight_nk.shape[1] % 8 != 0:
        raise RuntimeError("weight must be [N, K] with K divisible by 8")
    values = weight_nk.to(torch.int32) + 8
    grouped = values.reshape(weight_nk.shape[0], weight_nk.shape[1] // 8, 8)
    if low_nibble_first:
        shifts = torch.arange(0, 32, 4, dtype=torch.int32)
    else:
        shifts = torch.arange(28, -1, -4, dtype=torch.int32)
    shifts = shifts.to(device=grouped.device)
    return ((grouped & 0xF) << shifts).sum(dim=2).to(torch.int32)


def unpack_signed_int4(packed_nk8: torch.Tensor, low_nibble_first: bool = True) -> torch.Tensor:
    """Inverse of ``pack_signed_int4``. Values are signed, in ``[-8, 7]``."""
    if packed_nk8.ndim != 2:
        raise RuntimeError("packed weight must be [N, K/8]")
    if low_nibble_first:
        shifts = torch.arange(0, 32, 4, dtype=torch.int32)
    else:
        shifts = torch.arange(28, -1, -4, dtype=torch.int32)
    shifts = shifts.to(device=packed_nk8.device)
    nibbles = (packed_nk8.unsqueeze(-1) >> shifts) & 0xF
    signed = nibbles.to(torch.int32) - 8
    return signed.reshape(packed_nk8.shape[0], packed_nk8.shape[1] * 8)


def scale_for_w4a8(scales: torch.Tensor, layout: str | None = None) -> torch.Tensor:
    """Return the scale tensor the W4A8 op should see.

    ``as_stored`` keeps the WNA16 tensor. ``transposed`` swaps the two axes.
    The env ``K8V4_W4A8_SCALE`` selects the orientation. Default is the
    orientation whose microbench matched ``int4_gemm_w4a16``.
    """
    chosen = layout if layout is not None else os.environ.get("K8V4_W4A8_SCALE", "as_stored")
    if chosen == "as_stored":
        return scales.contiguous()
    if chosen == "transposed":
        return scales.transpose(0, 1).contiguous()
    raise RuntimeError("K8V4_W4A8_SCALE must be as_stored or transposed, got %s" % chosen)


def reverse_nibble_order(packed_nk8: torch.Tensor) -> torch.Tensor:
    """Swap nibble order inside each int32 of an ``[N, K/8]`` blob.

    ``int4_gemm_w4a16`` and ``int4_gemm_w4a8`` are checked against the same
    signed weights. When they disagree, this converts the blob one op accepts
    into the blob the other accepts.
    """
    signed = unpack_signed_int4(packed_nk8, low_nibble_first=True)
    return pack_signed_int4(signed, low_nibble_first=False)


def cached_w4a8_weights(kernel, layer):
    """Return the NT weight view. The cache write is eager-only.

    vLLM captures this forward with fullgraph, so the compiled path cannot
    store Python attributes or enter a disabled compiled region.
    """
    compiling = torch.compiler.is_compiling()
    if not compiling:
        cached = getattr(layer, "_k8v4_w4a8", None)
        if cached is not None:
            return cached
    qweight = getattr(layer, kernel.w_q_name)
    scales = getattr(layer, kernel.w_s_name)
    zeros = getattr(layer, kernel.w_zp_name)
    # WNA16 stores qweight as [N, K/8] and calls int4_gemm_w4a16 with .t().
    stored = qweight.contiguous()
    nibble = os.environ.get("K8V4_W4A8_NIBBLE", "same")
    if nibble == "reverse":
        stored = reverse_nibble_order(stored)
    elif nibble != "same":
        raise RuntimeError("K8V4_W4A8_NIBBLE must be same or reverse, got %s" % nibble)
    # int4_gemm_* rejects a contiguous [K/8, N] copy. Keep the transpose view
    # over [N, K/8] storage; that is the NT layout w_q.t() already uses.
    packed = stored.transpose(0, 1)
    oriented = scale_for_w4a8(scales)
    scale_dtype = os.environ.get("K8V4_W4A8_SCALE_DTYPE", "stored")
    if scale_dtype == "fp16":
        oriented = oriented.to(torch.float16)
    elif scale_dtype == "bf16":
        oriented = oriented.to(torch.bfloat16)
    elif scale_dtype != "stored":
        raise RuntimeError(
            "K8V4_W4A8_SCALE_DTYPE must be stored, fp16, or bf16, got %s" % scale_dtype
        )
    views = (packed, oriented, zeros)
    if not compiling:
        layer._k8v4_w4a8 = views
    return views


def activation_for_quant(activation: torch.Tensor) -> torch.Tensor:
    """Cast the prefill activation when the microbench required fp16 scales."""
    mode = os.environ.get("K8V4_W4A8_ACT", "stored")
    if mode == "fp16":
        return activation.to(torch.float16)
    if mode in ("stored", "bf16"):
        return activation
    raise RuntimeError("K8V4_W4A8_ACT must be stored, bf16, or fp16, got %s" % mode)


def quantize_activation(activation: torch.Tensor):
    """Per-token symmetric int8.

    Inlined instead of ``dynamic_per_token_int8_quant_ref``. That helper is
    itself ``torch.compile``'d, and the model forward is captured with
    fullgraph, which cannot call into a second compiled region.
    """
    flat = activation_for_quant(activation).reshape(-1, activation.shape[-1])
    qmax = 127
    minimum = torch.amin(flat, dim=-1, keepdim=True).to(torch.float32)
    maximum = torch.amax(flat, dim=-1, keepdim=True).to(torch.float32)
    scale = (torch.maximum(minimum.abs(), maximum.abs()) / qmax).clamp(min=1e-5)
    scale = scale.to(dtype=flat.dtype)
    zero = torch.zeros(scale.shape, dtype=torch.int32, device=scale.device)
    quantized = torch.round(flat.to(torch.float32) / scale.to(torch.float32))
    quantized = torch.clamp(quantized, -qmax, qmax).to(torch.int8)
    return quantized, scale, zero


def w4a8_gemm(quant_x, x_scale, x_zero, packed, weight_scale, weight_zp, group_size, bias):
    return torch.ops._xpu_C.int4_gemm_w4a8(
        quant_x,
        x_scale,
        x_zero,
        packed,
        weight_scale,
        weight_zp,
        group_size,
        None,
        bias,
    )


def _large_m(activation: torch.Tensor) -> bool:
    rows = activation.reshape(-1, activation.shape[-1]).shape[0]
    return bool(rows > SMALL_M_MAX)


LAYER_FAMILIES = ("mlp", "attn", "gdn", "other")
_LAYERS = frozenset(("mlp",))


def parse_layer_families(raw: str | None) -> frozenset:
    """``K8V4_W4A8_LAYERS`` -> the projection families that may take W4A8.

    Unset or empty is ``mlp``, the measured default. ``all`` is every family.
    """
    if raw is None or raw.strip() == "":
        return frozenset(("mlp",))
    names = [name.strip().lower() for name in raw.split(",")]
    if names == ["all"]:
        return frozenset(LAYER_FAMILIES)
    if any(name not in LAYER_FAMILIES for name in names):
        raise RuntimeError(
            "K8V4_W4A8_LAYERS must be all or a comma list of %s, got %s"
            % (",".join(LAYER_FAMILIES), raw)
        )
    return frozenset(names)


def layer_family(prefix: str) -> str:
    """Family of a linear from its vLLM prefix (the MTP draft's included)."""
    if ".mlp." in prefix:
        return "mlp"
    if ".self_attn." in prefix:
        return "attn"
    if ".linear_attn." in prefix:
        return "gdn"
    return "other"


def _mlp_linear(layer) -> bool:
    """True when this linear may use int8 activations.

    A missing prefix keeps the length gate alone so the CPU contract tests
    still exercise the GEMM path. A real vLLM module carries ``prefix``.
    By default only ``*.mlp.*`` takes W4A8. ``self_attn`` and ``linear_attn``
    stay on the w4a16 kernel that wrote the measured oneDNN checkpoints
    unless ``K8V4_W4A8_LAYERS`` names their family.
    """
    prefix = getattr(layer, "prefix", None)
    if not isinstance(prefix, str) or prefix == "":
        return True
    return layer_family(prefix) in _LAYERS


def _compile_safe_views(kernel, layer):
    """NT weight view with the checkpoint scales left untouched.

    No environment reads and no module stores: vLLM fullgraph-captures the
    forward that calls this. The serving choice is low nibble, scales as
    stored, and the stored fp16 scale dtype.
    """
    qweight = getattr(layer, kernel.w_q_name)
    scales = getattr(layer, kernel.w_s_name)
    zeros = getattr(layer, kernel.w_zp_name)
    return qweight.transpose(0, 1), scales, zeros


def _quantize_stored(activation: torch.Tensor):
    """Per-token int8 with no env read. The captured prefill forward calls this."""
    flat = activation.reshape(-1, activation.shape[-1])
    qmax = 127
    minimum = torch.amin(flat, dim=-1, keepdim=True).to(torch.float32)
    maximum = torch.amax(flat, dim=-1, keepdim=True).to(torch.float32)
    scale = (torch.maximum(minimum.abs(), maximum.abs()) / qmax).clamp(min=1e-5)
    scale = scale.to(dtype=flat.dtype)
    zero = torch.zeros(scale.shape, dtype=torch.int32, device=scale.device)
    quantized = torch.round(flat.to(torch.float32) / scale.to(torch.float32))
    quantized = torch.clamp(quantized, -qmax, qmax).to(torch.int8)
    return quantized, scale, zero


def _apply_w4a8(kernel, layer, activation, bias):
    packed, weight_scale, weight_zp = _compile_safe_views(kernel, layer)
    quant_x, x_scale, x_zero = _quantize_stored(activation)
    out = w4a8_gemm(
        quant_x,
        x_scale,
        x_zero,
        packed,
        weight_scale,
        weight_zp,
        int(kernel.config.group_size),
        bias,
    )
    return out.to(dtype=activation.dtype)


# The outer vLLM graph spans decode and prefill sizes. An opaque runtime
# dispatch prevents a symbolic row-count branch from being folded into one
# precision path for that entire graph range.
_QUANT_COMPILED = None
_RUNTIME_ENABLED = False
_DIAGNOSTICS = os.environ.get("K8V4_GEMM_DIAGNOSTICS") == "1"
_BRANCH_LOGGED = set()


def _w4a16_runtime(flat, packed, scales, zeros, group_size, bias):
    return torch.ops._xpu_C.int4_gemm_w4a16(
        flat, packed, bias, scales, zeros, group_size, None,
    )


# K8V4_W4A8_KERNEL=onednn (opt-in): the selected layers keep their GPTQ
# nibbles as s4 with NO zero point and run the k8v4_w4a8 library
# (native/w4a8: vllm-xpu-kernels' oneDNN int4 GEMMs with the zero points
# optional, bf16 output, grouped activation scales). The stock ops always
# hand oneDNN a u4 weight zero point and, for W4A8, a source zero point,
# and the compensation for them costs GEMM time even when both are
# constants. u4 with zero point 8 equals s4 of the same nibbles XOR 0x8,
# so the weights are flipped once at load. Such a layer's zero point is an
# empty tensor, and its decode GEMM also runs the library (bf16 x s4).
# K8V4_W4A8_AGROUP=G (with onednn): one activation scale per token AND per
# G input channels instead of one per token.
KERNELS = ("xpu", "onednn")
_KERNEL = "xpu"
_AGROUP = 0
_S4_FLIP = -2004318072  # 0x88888888 as int32: XOR 0x8 in every nibble
_LIB_DEFAULT = "/opt/k8v4/libk8v4_w4a8.so"


def parse_kernel(raw: str | None) -> str:
    value = "xpu" if raw is None or raw.strip() == "" else raw.strip().lower()
    if value not in KERNELS:
        raise RuntimeError("K8V4_W4A8_KERNEL must be xpu or onednn, got %s" % raw)
    return value


def parse_agroup(raw: str | None, kernel: str) -> int:
    value = "0" if raw is None or raw.strip() == "" else raw.strip()
    if value not in ("0", "32", "64", "128"):
        raise RuntimeError("K8V4_W4A8_AGROUP must be 0, 32, 64 or 128, got %s" % raw)
    if value != "0" and kernel != "onednn":
        raise RuntimeError("K8V4_W4A8_AGROUP needs K8V4_W4A8_KERNEL=onednn")
    return int(value)


def flip_to_s4(qweight: torch.Tensor) -> torch.Tensor:
    """u4 nibbles with zero point 8 -> s4 nibbles of the same values, in place."""
    return qweight.bitwise_xor_(_S4_FLIP)


def _quantize_grouped(flat: torch.Tensor, group: int):
    """Symmetric int8 with one fp16 scale per token and per ``group`` channels.

    Returns ``(q [M, K], scale [M, K/group])``. No env read: the prefill
    forward compiles this.
    """
    rows, width = flat.shape
    grouped = flat.reshape(rows, width // group, group).to(torch.float32)
    scale = (grouped.abs().amax(dim=-1) / 127).clamp(min=1e-5).to(torch.float16)
    quantized = torch.round(grouped / scale.to(torch.float32).unsqueeze(-1))
    quantized = torch.clamp(quantized, -127, 127).to(torch.int8)
    return quantized.reshape(rows, width), scale


_GROUPED_COMPILED = None
# k8v4_v030.w4a8_triton once K8V4_W4A8_KERNEL=onednn is installed on XPU; None
# keeps the compiled-torch quantizers (the CPU tests use those).
_TRITON = None


def _lib():
    return torch.ops.k8v4_w4a8


def _s4_runtime(flat, packed, scales, group_size, bias, large):
    """The library path for an s4 layer (empty zero point)."""
    ops = _lib()
    if not large:
        out = ops.int4_gemm_w4a16(flat, packed, scales, None, group_size)
    else:
        bf16 = flat.dtype == torch.bfloat16
        if _TRITON is not None:
            if _AGROUP:
                quant_x, x_scale = _TRITON.quantize_groups(flat, _AGROUP)
            else:
                quant_x, x_scale = _TRITON.quantize_rows(flat)
        elif _AGROUP:
            global _GROUPED_COMPILED
            if _GROUPED_COMPILED is None:
                _GROUPED_COMPILED = torch.compile(_quantize_grouped, dynamic=True, fullgraph=True)
            quant_x, x_scale = _GROUPED_COMPILED(flat, _AGROUP)
        else:
            global _QUANT_COMPILED
            if _QUANT_COMPILED is None:
                _QUANT_COMPILED = torch.compile(_quantize_stored, dynamic=True, fullgraph=True)
            quant_x, x_scale, _zero = _QUANT_COMPILED(flat)
        out = ops.int4_gemm_w4a8(quant_x, x_scale, None, packed, scales, None,
                                 group_size, None, bf16)
        if out.dtype != flat.dtype:
            out = out.to(dtype=flat.dtype)
    if bias is not None:
        out = out + bias
    return out


def _runtime_mlp_body(x, packed, scales, zeros, group_size, bias):
    flat = x.reshape(-1, x.shape[-1])
    if zeros.numel() == 0:
        return _s4_runtime(flat, packed, scales, group_size, bias,
                           _RUNTIME_ENABLED and flat.shape[0] > SMALL_M_MAX)
    branch = "w4a16" if not _RUNTIME_ENABLED or flat.shape[0] <= SMALL_M_MAX else "w4a8"
    if _DIAGNOSTICS and branch not in _BRANCH_LOGGED:
        import sys
        sys.stderr.write("k8v4_mlp_gemm: branch=%s rows=%s input=%s\n" %
                         (branch, flat.shape[0], x.dtype))
        _BRANCH_LOGGED.add(branch)
    if not _RUNTIME_ENABLED or flat.shape[0] <= SMALL_M_MAX:
        return _w4a16_runtime(flat, packed, scales, zeros, group_size, bias)
    global _QUANT_COMPILED
    if _QUANT_COMPILED is None:
        _QUANT_COMPILED = torch.compile(_quantize_stored, dynamic=True, fullgraph=True)
    quant_x, x_scale, x_zero = _QUANT_COMPILED(flat)
    return w4a8_gemm(quant_x, x_scale, x_zero, packed, scales, zeros,
                    group_size, bias).to(dtype=x.dtype)


@torch.library.custom_op("k8v4_prefill::mlp_gemm", mutates_args=())
def runtime_mlp_gemm(x: torch.Tensor, packed: torch.Tensor, scales: torch.Tensor,
                     zeros: torch.Tensor, group_size: int,
                     bias: torch.Tensor | None) -> torch.Tensor:
    return _runtime_mlp_body(x, packed, scales, zeros, group_size, bias)


@runtime_mlp_gemm.register_fake
def _runtime_mlp_fake(x, packed, scales, zeros, group_size, bias):
    return x.new_empty((x.numel() // x.shape[-1], packed.shape[1]))


# K8V4_W4A8_FUSED=silu (with K8V4_W4A8_KERNEL=onednn and K8V4_W4A8_AGROUP):
# an MLP's down projection takes gate_up_proj's output and does
# SiLU(gate) * up inside its grouped int8 quantizer, so the
# [tokens, intermediate] product is never written out and read back. The
# product is rounded to the activation dtype before quantizing, as the
# unfused SiLU-and-mul output is. Rows at or below SMALL_M_MAX take vLLM's
# silu_and_mul op and the library w4a16 GEMM.
FUSIONS = ("silu", "gnorm")
_FUSED = frozenset()
_SILU_COMPILED = None


def parse_fused(raw: str | None, kernel: str, agroup: int) -> frozenset:
    if raw is None or raw.strip() == "":
        return frozenset()
    names = [name.strip().lower() for name in raw.split(",")]
    if any(name not in FUSIONS for name in names):
        raise RuntimeError("K8V4_W4A8_FUSED must be a comma list of %s, got %s"
                           % (",".join(FUSIONS), raw))
    if kernel != "onednn" or not agroup:
        raise RuntimeError("K8V4_W4A8_FUSED needs K8V4_W4A8_KERNEL=onednn and K8V4_W4A8_AGROUP")
    return frozenset(names)


def _silu_quantize_grouped(gate_up: torch.Tensor, group: int):
    """``SiLU(gate) * up`` rounded to the input dtype, then ``_quantize_grouped``."""
    width = gate_up.shape[-1] // 2
    gate = gate_up[:, :width].to(torch.float32)
    up = gate_up[:, width:].to(torch.float32)
    product = (gate * torch.sigmoid(gate) * up).to(gate_up.dtype)
    return _quantize_grouped(product, group)


def _silu_and_mul(gate_up: torch.Tensor) -> torch.Tensor:
    out = gate_up.new_empty((gate_up.shape[0], gate_up.shape[1] // 2))
    torch.ops._C.silu_and_mul(out, gate_up)
    return out


def _silu_body(gate_up, packed, scales, zeros, group_size):
    flat = gate_up.reshape(-1, gate_up.shape[-1])
    if not (_RUNTIME_ENABLED and _AGROUP and flat.shape[0] > SMALL_M_MAX):
        # Decode / verify rows: the compiled stock SiluAndMul rounds SiLU(gate) * up once; _C.silu_and_mul rounds
        # SiLU(gate) first and differed from it in most elements (measured), so the Triton path rounds once too.
        act = _TRITON.silu_mul(flat) if _TRITON is not None else _silu_and_mul(flat)
        return _runtime_mlp_body(act, packed, scales, zeros, group_size, None)
    global _SILU_COMPILED
    if _TRITON is not None:
        quant_x, x_scale = _TRITON.silu_quantize_groups(flat, _AGROUP)
    else:
        if _SILU_COMPILED is None:
            _SILU_COMPILED = torch.compile(_silu_quantize_grouped, dynamic=True, fullgraph=True)
        quant_x, x_scale = _SILU_COMPILED(flat, _AGROUP)
    out = _lib().int4_gemm_w4a8(quant_x, x_scale, None, packed, scales, None, group_size, None,
                                flat.dtype == torch.bfloat16)
    return out if out.dtype == flat.dtype else out.to(dtype=flat.dtype)


@torch.library.custom_op("k8v4_prefill::silu_gemm", mutates_args=())
def runtime_silu_gemm(gate_up: torch.Tensor, packed: torch.Tensor, scales: torch.Tensor,
                      zeros: torch.Tensor, group_size: int) -> torch.Tensor:
    return _silu_body(gate_up, packed, scales, zeros, group_size)


@runtime_silu_gemm.register_fake
def _runtime_silu_fake(gate_up, packed, scales, zeros, group_size):
    return gate_up.new_empty((gate_up.numel() // gate_up.shape[-1], packed.shape[1]))


def _install_silu_mlp(cls) -> None:
    """Route a marked MLP (down_proj._k8v4_silu_kernel) through the fused op."""
    current = cls.forward
    if getattr(current, "_k8v4_silu", False):
        return

    def forward(self, x, *args, **kwargs):
        down = self.down_proj
        kernel = getattr(down, "_k8v4_silu_kernel", None)
        if kernel is None or args or kwargs or getattr(self, "expert_gate", None) is not None:
            return current(self, x, *args, **kwargs)
        gate_up, _ = self.gate_up_proj(x)
        packed, scales, zeros = _compile_safe_views(kernel, down)
        return runtime_silu_gemm(gate_up, packed, scales, zeros, int(kernel.config.group_size))

    forward._k8v4_silu = True
    forward._k8v4_orig = current
    cls.forward = forward


# K8V4_W4A8_FUSED=gnorm (also needs gdn in K8V4_W4A8_LAYERS): a GDN layer's
# gated RMSNorm (vLLM's RMSNormGated.forward_static, per head, gate after the
# norm) and the grouped int8 quantization of out_proj's input in one
# compiled function inside out_proj's op, so the normed [tokens, value_dim]
# output is not written out and read back.
_GNORM_STATIC = None
_GNORM_COMPILED = None


def _gnorm(o, z, weight, eps: float, activation: str):
    out = _GNORM_STATIC(o, z, weight, eps, o.dtype, None, True, activation)
    return out.reshape(out.shape[0], -1)


def _gnorm_quantize_grouped(o, z, weight, eps: float, activation: str, group: int):
    return _quantize_grouped(_gnorm(o, z, weight, eps, activation), group)


def _gnorm_body(o, z, weight, eps, activation, packed, scales, zeros, group_size):
    if not (_RUNTIME_ENABLED and _AGROUP and o.shape[0] > SMALL_M_MAX):
        # Decode / verify rows: the op is opaque to inductor, so the eager forward_static here was a chain of
        # elementwise launches per GDN layer (+1.4 ms per decode step, measured) where the per-token config runs
        # one compiled kernel. One Triton launch, same arithmetic order as forward_static.
        if _TRITON is not None:
            normed = _TRITON.gnorm(o, z, weight, eps, activation)
        else:
            normed = _gnorm(o, z, weight, eps, activation)
        return _runtime_mlp_body(normed, packed, scales, zeros, group_size, None)
    global _GNORM_COMPILED
    if _TRITON is not None:
        quant_x, x_scale = _TRITON.gnorm_quantize_groups(o, z, weight, eps, activation, _AGROUP)
    else:
        if _GNORM_COMPILED is None:
            _GNORM_COMPILED = torch.compile(_gnorm_quantize_grouped, dynamic=True, fullgraph=True)
        quant_x, x_scale = _GNORM_COMPILED(o, z, weight, eps, activation, _AGROUP)
    out = _lib().int4_gemm_w4a8(quant_x, x_scale, None, packed, scales, None, group_size, None,
                                o.dtype == torch.bfloat16)
    return out if out.dtype == o.dtype else out.to(dtype=o.dtype)


@torch.library.custom_op("k8v4_prefill::gnorm_gemm", mutates_args=())
def runtime_gnorm_gemm(o: torch.Tensor, z: torch.Tensor, weight: torch.Tensor, eps: float,
                       activation: str, packed: torch.Tensor, scales: torch.Tensor,
                       zeros: torch.Tensor, group_size: int) -> torch.Tensor:
    return _gnorm_body(o, z, weight, eps, activation, packed, scales, zeros, group_size)


@runtime_gnorm_gemm.register_fake
def _runtime_gnorm_fake(o, z, weight, eps, activation, packed, scales, zeros, group_size):
    return o.new_empty((o.shape[0], packed.shape[1]))


def _install_gnorm(cls) -> None:
    """Route a marked GDN output projection (out_proj._k8v4_gnorm_kernel) through the fused op."""
    current = cls._output_projection
    if getattr(current, "_k8v4_gnorm", False):
        return

    def _output_projection(self, core_attn_out, z):
        proj, norm = self.out_proj, self.norm
        kernel = getattr(proj, "_k8v4_gnorm_kernel", None)
        if (kernel is None or norm.group_size is not None or not norm.norm_before_gate
                or getattr(norm, "bias", None) is not None or core_attn_out.dim() != 3):
            return current(self, core_attn_out, z)
        packed, scales, zeros = _compile_safe_views(kernel, proj)
        return runtime_gnorm_gemm(core_attn_out, z, norm.weight, float(norm.eps), norm.activation,
                                  packed, scales, zeros, int(kernel.config.group_size))

    _output_projection._k8v4_gnorm = True
    _output_projection._k8v4_orig = current
    cls._output_projection = _output_projection


def _install_on_class(cls) -> None:
    global _ORIG_APPLY
    current = cls.apply_weights
    if getattr(current, "_k8v4_w4a8", False):
        return
    _ORIG_APPLY = current

    def apply_weights(self, layer, x, bias=None):
        if not _mlp_linear(layer):
            return _ORIG_APPLY(self, layer, x, bias)
        if torch.compiler.is_compiling():
            packed, scales, zeros = _compile_safe_views(self, layer)
            return runtime_mlp_gemm(x, packed, scales, zeros,
                                    int(self.config.group_size), bias)
        if getattr(layer, "_k8v4_s4", False):
            packed, scales, zeros = _compile_safe_views(self, layer)
            return _runtime_mlp_body(x, packed, scales, zeros,
                                     int(self.config.group_size), bias)
        if not _large_m(x):
            return _ORIG_APPLY(self, layer, x, bias)
        return _apply_w4a8(self, layer, x, bias)

    apply_weights._k8v4_w4a8 = True
    apply_weights._k8v4_orig = current
    cls.apply_weights = apply_weights
    _install_s4_loader(cls)


def _install_s4_loader(cls) -> None:
    """With K8V4_W4A8_KERNEL=onednn, flip the selected layers to s4 after load."""
    current = getattr(cls, "process_weights_after_loading", None)
    if current is None or getattr(current, "_k8v4_s4", False):
        return

    def process_weights_after_loading(self, layer):
        current(self, layer)
        if _KERNEL != "onednn" or not _mlp_linear(layer):
            return
        if getattr(self.config, "zero_points", False):
            return
        zeros = getattr(layer, self.w_zp_name, None)
        if zeros is None or zeros.numel() != 1 or int(zeros.reshape(-1)[0]) != 8:
            return
        qweight = getattr(layer, self.w_q_name)
        flip_to_s4(qweight.data)
        setattr(layer, self.w_zp_name, torch.nn.Parameter(
            qweight.data.new_empty(0, dtype=torch.int8), requires_grad=False))
        layer._k8v4_s4 = True
        prefix = getattr(layer, "prefix", "") or ""
        if ("silu" in _FUSED and _AGROUP and prefix.endswith(".mlp.down_proj")
                and getattr(layer, "tp_size", 1) == 1):
            layer._k8v4_silu_kernel = self
        if ("gnorm" in _FUSED and _AGROUP and prefix.endswith(".linear_attn.out_proj")
                and getattr(layer, "tp_size", 1) == 1):
            layer._k8v4_gnorm_kernel = self

    process_weights_after_loading._k8v4_s4 = True
    cls.process_weights_after_loading = process_weights_after_loading


def wrap_kernel_module(module) -> None:
    cls = getattr(module, "XPUwNa16LinearKernel", None)
    if cls is None:
        return
    _install_on_class(cls)


class _KernelFinder:
    def __init__(self, target: str):
        self.target = target
        self._busy = False

    def find_spec(self, fullname, path, target=None):
        if fullname != self.target or self._busy:
            return None
        import importlib.machinery

        self._busy = True
        removed = False
        try:
            try:
                import sys

                sys.meta_path.remove(self)
                removed = True
            except ValueError:
                removed = False
            try:
                spec = importlib.machinery.PathFinder.find_spec(fullname, path)
            finally:
                if removed:
                    import sys

                    sys.meta_path.insert(0, self)
        finally:
            self._busy = False
        if spec is None or spec.loader is None:
            return None
        if getattr(spec.loader, "_k8v4_w4a8_loader", False):
            return spec
        spec.loader = _KernelLoader(spec.loader)
        return spec


class _KernelLoader:
    _k8v4_w4a8_loader = True

    def __init__(self, inner):
        self._inner = inner

    def create_module(self, spec):
        create = getattr(self._inner, "create_module", None)
        if create is None:
            return None
        return create(spec)

    def exec_module(self, module):
        self._inner.exec_module(module)
        wrap_kernel_module(module)


def install() -> None:
    """Wrap XPUwNa16LinearKernel before vLLM instantiates the linears."""
    global _FINDER
    import sys

    target = "vllm.model_executor.kernels.linear.mixed_precision.xpu"
    existing = sys.modules.get(target)
    if existing is not None:
        wrap_kernel_module(existing)
        return
    if _FINDER is not None:
        return
    finder = _KernelFinder(target)
    sys.meta_path.insert(0, finder)
    _FINDER = finder


def remove_import_hook(finder=None) -> None:
    import sys

    hook = _FINDER if finder is None else finder
    if hook is None:
        return
    try:
        sys.meta_path.remove(hook)
    except ValueError:
        return




def install_if_requested() -> None:
    """Install before model compilation; cached opaque calls honor opt-out too."""
    global _RUNTIME_ENABLED, _LAYERS, _KERNEL, _AGROUP, _FUSED, _GNORM_STATIC, _TRITON
    mode = os.environ.get("K8V4_PREFILL_GEMM", "w4a16")
    if mode not in ("w4a16", "w4a8"):
        raise RuntimeError("K8V4_PREFILL_GEMM must be w4a16 or w4a8")
    _LAYERS = parse_layer_families(os.environ.get("K8V4_W4A8_LAYERS"))
    kernel = parse_kernel(os.environ.get("K8V4_W4A8_KERNEL"))
    _AGROUP = parse_agroup(os.environ.get("K8V4_W4A8_AGROUP"), kernel)
    _FUSED = parse_fused(os.environ.get("K8V4_W4A8_FUSED"), kernel, _AGROUP)
    _RUNTIME_ENABLED = mode == "w4a8"
    _KERNEL = kernel if _RUNTIME_ENABLED else "xpu"
    if _RUNTIME_ENABLED:
        import sys
        if _KERNEL == "onednn":
            path = os.environ.get("K8V4_W4A8_LIB", _LIB_DEFAULT)
            if not os.path.isfile(path):
                raise RuntimeError("K8V4_W4A8_KERNEL=onednn needs the library at %s" % path)
            torch.ops.load_library(path)
            quant = os.environ.get("K8V4_W4A8_QUANT", "triton")
            if quant not in ("triton", "torch"):
                raise RuntimeError("K8V4_W4A8_QUANT must be triton or torch, got %s" % quant)
            if quant == "triton":
                from k8v4_v030 import w4a8_triton

                _TRITON = w4a8_triton
            sys.stderr.write("k8v4_w4a8: s4 weights via %s (oneDNN %s), activation group %s\n"
                             % (path, torch.ops.k8v4_w4a8.onednn_version(),
                                _AGROUP or "per token"))
        install()
        if "silu" in _FUSED:
            from vllm.model_executor.models import qwen2_moe

            _install_silu_mlp(qwen2_moe.Qwen2MoeMLP)
            sys.stderr.write("k8v4_w4a8: SiLU-and-mul fused into the down projections' quantizer\n")
        if "gnorm" in _FUSED:
            from vllm.model_executor.layers.layernorm import RMSNormGated
            from vllm.model_executor.layers.mamba.gdn import qwen_gdn_linear_attn

            _GNORM_STATIC = RMSNormGated.forward_static
            _install_gnorm(qwen_gdn_linear_attn.QwenGatedDeltaNetAttention)
            sys.stderr.write("k8v4_w4a8: GDN gated norm fused into out_proj's quantizer\n")
        if _LAYERS == frozenset(("mlp",)):
            sys.stderr.write("k8v4_w4a8: MLP-only installer active; small-M runtime gate=128\n")
        else:
            sys.stderr.write("k8v4_w4a8: installer active for %s; small-M runtime gate=128\n"
                             % ",".join(f for f in LAYER_FAMILIES if f in _LAYERS))
