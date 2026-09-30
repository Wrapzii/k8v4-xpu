"""Length-gated W4A8 prefill for the GPTQ WNA16 linears.

Decode and other small-M steps stay on ``int4_gemm_w4a16``. A prefill row
count above ``SMALL_M_MAX`` quantizes activations per token and calls the
existing XPU ``int4_gemm_w4a8`` op, and only on MLP linears. Attention and
Gated DeltaNet projections stay on ``int4_gemm_w4a16`` so the KV cache and
the recurrent state the MTP draft reads are still the original GEMM.
The int32 weight blob is the one WNA16 already passes as ``qweight.t()``.

This is not an EXL3 Hadamard repack. The checkpoint stays GPTQ INT4.
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


def _mlp_linear(layer) -> bool:
    """True when this linear may use int8 activations.

    A missing prefix keeps the length gate alone so the CPU contract tests
    still exercise the GEMM path. A real vLLM module carries ``prefix``.
    Only ``*.mlp.*`` takes W4A8. ``self_attn`` and ``linear_attn`` stay on
    the w4a16 kernel that wrote the measured oneDNN checkpoints.
    """
    prefix = getattr(layer, "prefix", None)
    if not isinstance(prefix, str) or prefix == "":
        return True
    return ".mlp." in prefix


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


def _install_on_class(cls) -> None:
    global _ORIG_APPLY
    current = cls.apply_weights
    if getattr(current, "_k8v4_w4a8", False):
        return
    _ORIG_APPLY = current

    def apply_weights(self, layer, x, bias=None):
        if not _large_m(x) or not _mlp_linear(layer):
            return _ORIG_APPLY(self, layer, x, bias)
        return _apply_w4a8(self, layer, x, bias)

    apply_weights._k8v4_w4a8 = True
    apply_weights._k8v4_orig = current
    cls.apply_weights = apply_weights


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


