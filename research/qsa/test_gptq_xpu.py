"""CPU checks for the XPU GPTQ loader. No accelerator and no checkpoint.

Run inside the vLLM image with ``QSA_DEVICE=cpu`` and without ``/dev/dri``.
The int4 GEMM numeric check runs only when ``int4_gemm_w4a16`` can execute.
"""

from __future__ import annotations

import os
import sys
import traceback

import torch
import torch.nn.functional as F
from torch import nn

from qsa.gptq_backbone import (
    FrozenGPTQSwift,
    _pack_int4_along_rows,
    _pack_int4_qzeros,
    dequantize_gptq_linear,
)
from qsa.gptq_xpu import (
    GPTQLinearXPU,
    dequantize_gptq_linear_device,
    int4_gemm_available,
    int4_linear_w4a16,
    kernel_qweight_from_nt,
    prepare_gptq_nt,
)


_GROUP = 128
_DEQUANT_TOL = 2e-3
_INT4_TOL = 2e-2
_CAUSAL_TOL = 1e-2


class MemoryIndex:
    """In-memory stand-in for ``WeightIndex`` (``has`` / ``get`` only)."""

    def __init__(self, tensors: dict[str, torch.Tensor]) -> None:
        self.tensors = tensors

    def has(self, key: str) -> bool:
        return key in self.tensors

    def get(self, key: str) -> torch.Tensor:
        try:
            return self.tensors[key]
        except KeyError:
            raise KeyError(key) from None


def _require_cpu() -> None:
    forced = os.environ.get("QSA_DEVICE", "cpu").strip().lower()
    if forced not in {"", "cpu"}:
        raise SystemExit(f"test_gptq_xpu is CPU-only, QSA_DEVICE={forced!r}")


def _pack_symmetric(in_features: int, out_features: int, *, seed: int) -> tuple[torch.Tensor, torch.Tensor, torch.Tensor]:
    """Random symmetric GPTQ tensors, including a negative int32 word."""
    generator = torch.Generator().manual_seed(seed)
    codes = torch.randint(0, 16, (in_features, out_features), generator=generator, dtype=torch.int32)
    codes[-1, -1] = 15
    qweight = _pack_int4_along_rows(codes)
    if int(qweight[-1, -1]) >= 0:
        raise AssertionError("top nibble 15 did not produce a negative int32 word")
    groups = in_features // _GROUP
    scales = (torch.randn(groups, out_features, generator=generator) * 0.2).to(torch.float16)
    scales[scales == 0] = torch.tensor(0.1, dtype=torch.float16)
    qzeros = _pack_int4_qzeros(torch.full((groups, out_features), 7, dtype=torch.int32))
    return qweight, scales, qzeros


def _max_abs(a: torch.Tensor, b: torch.Tensor) -> float:
    return float((a.float() - b.float()).abs().max())


def test_dequant_device_matches_cpu() -> None:
    qweight, scales, qzeros = _pack_symmetric(256, 32, seed=1)
    cpu = dequantize_gptq_linear(qweight, scales, qzeros, group_size=_GROUP)
    device = dequantize_gptq_linear_device(
        qweight, scales, qzeros, group_size=_GROUP, device="cpu",
    )
    err = _max_abs(device, cpu)
    print(f"dequant device vs cpu max abs {err:.6e}", flush=True)
    if device.shape != cpu.shape:
        raise AssertionError(f"shape {tuple(device.shape)} != {tuple(cpu.shape)}")
    if err >= _DEQUANT_TOL:
        raise AssertionError(f"dequant max abs {err} >= {_DEQUANT_TOL}")


def test_gptq_linear_xpu_matches_f_linear() -> None:
    qweight, scales, qzeros = _pack_symmetric(128, 16, seed=2)
    reference = dequantize_gptq_linear(qweight, scales, qzeros, group_size=_GROUP)
    module = GPTQLinearXPU(
        qweight, scales, qzeros,
        group_size=_GROUP, device="cpu", prefer_int4=False,
    )
    if module._use_int4:
        raise AssertionError("prefer_int4=False selected the int4 path")
    if module.weight is None:
        raise AssertionError("dequant fallback did not store a weight")
    err = _max_abs(module.weight, reference)
    print(f"GPTQLinearXPU weight vs cpu dequant max abs {err:.6e}", flush=True)
    if err >= _DEQUANT_TOL:
        raise AssertionError(f"stored weight max abs {err} >= {_DEQUANT_TOL}")
    activations = torch.randn(2, 5, module.in_features, dtype=torch.float16)
    got = module(activations)
    expected = F.linear(activations, module.weight)
    linear_err = _max_abs(got, expected)
    print(f"GPTQLinearXPU vs F.linear max abs {linear_err:.6e}", flush=True)
    if linear_err != 0.0:
        raise AssertionError(f"F.linear mismatch {linear_err}")

    forced = GPTQLinearXPU(
        qweight, scales, qzeros,
        group_size=_GROUP, device="cpu", prefer_int4=True,
    )
    if forced._use_int4:
        raise AssertionError("prefer_int4=True on CPU selected int4")
    forced_err = _max_abs(forced(activations), F.linear(activations, reference))
    print(f"prefer_int4=True on CPU vs F.linear max abs {forced_err:.6e}", flush=True)
    if forced_err >= _DEQUANT_TOL:
        raise AssertionError(f"CPU prefer_int4 fallback max abs {forced_err}")


def test_nt_layout_matches_qweight() -> None:
    qweight, scales, qzeros = _pack_symmetric(128, 16, seed=3)
    qweight_nt, scales_nt, zp = prepare_gptq_nt(qweight, scales, "cpu")
    if tuple(qweight_nt.shape) != (qweight.shape[1], qweight.shape[0]):
        raise AssertionError(f"NT shape {tuple(qweight_nt.shape)}")
    if not qweight_nt.is_contiguous():
        raise AssertionError("NT buffer is not contiguous")
    if zp.dtype != torch.int8 or int(zp.reshape(-1)[0]) != 8:
        raise AssertionError(f"unexpected zp {zp}")
    view = kernel_qweight_from_nt(qweight_nt)
    if view.is_contiguous():
        raise AssertionError("kernel qweight view must stay non-contiguous")
    if not torch.equal(view, qweight.to(torch.int32)):
        raise AssertionError("NT view does not match the GPTQ qweight")
    from_view = dequantize_gptq_linear(view.contiguous(), scales_nt.cpu(), qzeros, group_size=_GROUP)
    reference = dequantize_gptq_linear(qweight, scales, qzeros, group_size=_GROUP)
    err = _max_abs(from_view, reference)
    print(f"NT view dequant vs qweight dequant max abs {err:.6e}", flush=True)
    if err >= _INT4_TOL:
        raise AssertionError(f"NT dequant max abs {err} >= {_INT4_TOL}")


def test_int4_linear_refuses_cpu() -> None:
    try:
        int4_linear_w4a16(
            torch.zeros(1, 16, dtype=torch.float16),
            torch.zeros(4, 2, dtype=torch.int32),
            torch.zeros(1, 4, dtype=torch.float16),
            torch.tensor([8], dtype=torch.int8),
            _GROUP,
        )
    except RuntimeError as exc:
        if "xpu" not in str(exc):
            raise AssertionError(f"unexpected refusal: {exc}") from exc
    else:
        raise AssertionError("int4 GEMM accepted CPU activations")


def test_int4_gemm_matches_dequant_when_available() -> None:
    if not int4_gemm_available():
        print("SKIP int4 gemm vs dequant (int4_gemm_w4a16 unavailable)", flush=True)
        return
    qweight, scales, qzeros = _pack_symmetric(128, 16, seed=4)
    reference = dequantize_gptq_linear(qweight, scales, qzeros, group_size=_GROUP)
    qweight_nt, scales_nt, zp = prepare_gptq_nt(qweight, scales, "xpu")
    activations = torch.randn(3, qweight.shape[0] * 8, dtype=torch.float16, device="xpu")
    got = int4_linear_w4a16(activations, qweight_nt, scales_nt, zp, _GROUP)
    expected = F.linear(activations, reference.to(device="xpu", dtype=torch.float16))
    err = _max_abs(got, expected)
    print(f"int4 gemm vs dequant max abs {err:.6e}", flush=True)
    if err >= _INT4_TOL:
        raise AssertionError(f"int4 gemm max abs {err} >= {_INT4_TOL}")


def _tiny_text_config():
    from transformers.models.qwen3_5.configuration_qwen3_5 import Qwen3_5TextConfig

    # head_dim 32 * partial 0.25 = 8 rotary dims; mrope sections sum to half of that.
    # in_features stay divisible by the GPTQ group, except dense in_proj_a/b (out=4).
    config = Qwen3_5TextConfig(
        vocab_size=128,
        hidden_size=128,
        intermediate_size=128,
        num_hidden_layers=2,
        num_attention_heads=4,
        num_key_value_heads=2,
        head_dim=32,
        linear_conv_kernel_dim=4,
        linear_key_head_dim=32,
        linear_value_head_dim=32,
        linear_num_key_heads=4,
        linear_num_value_heads=4,
        max_position_embeddings=64,
        rms_norm_eps=1e-6,
        partial_rotary_factor=0.25,
        attention_bias=False,
        rope_parameters={
            "mrope_interleaved": True,
            "mrope_section": [2, 1, 1],
            "partial_rotary_factor": 0.25,
            "rope_theta": 10000.0,
            "rope_type": "default",
        },
        layer_types=["linear_attention", "full_attention"],
    )
    config.layer_types = ["linear_attention", "full_attention"]
    config._attn_implementation = "sdpa"
    return config


def _new_layer(config, layer_idx: int):
    from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5DecoderLayer

    previous = torch.get_default_dtype()
    torch.set_default_dtype(torch.float16)
    try:
        layer = Qwen3_5DecoderLayer(config, layer_idx)
    finally:
        torch.set_default_dtype(previous)
    layer.eval()
    return layer


def _child(module: nn.Module, qualname: str) -> nn.Module:
    current = module
    for part in qualname.split("."):
        current = getattr(current, part)
    return current


def _keep_dense(qualname: str, module: nn.Linear) -> bool:
    if qualname.endswith("in_proj_a") or qualname.endswith("in_proj_b"):
        return True
    return module.in_features % _GROUP != 0 or module.out_features % 8 != 0


def _checkpoint_for(layer, layer_idx: int):
    prefix = f"model.language_model.layers.{layer_idx}"
    tensors: dict[str, torch.Tensor] = {}
    dense: dict[str, torch.Tensor] = {}
    gptq: dict[str, tuple[torch.Tensor, torch.Tensor, torch.Tensor]] = {}
    linears = {
        qualname: module
        for qualname, module in layer.named_modules()
        if isinstance(module, nn.Linear) and qualname
    }
    gptq_weight_keys: set[str] = set()
    for qualname, module in linears.items():
        base = f"{prefix}.{qualname}"
        if _keep_dense(qualname, module):
            weight = torch.empty(module.out_features, module.in_features, dtype=torch.float16)
            weight.uniform_(-0.2, 0.2)
            tensors[base + ".weight"] = weight
            dense[qualname] = weight
            if module.bias is not None:
                bias = torch.empty(module.out_features, dtype=torch.float16)
                bias.uniform_(-0.2, 0.2)
                tensors[base + ".bias"] = bias
            continue
        packed = _pack_symmetric(module.in_features, module.out_features, seed=1000 + layer_idx * 17 + len(gptq))
        tensors[base + ".qweight"] = packed[0]
        tensors[base + ".scales"] = packed[1]
        tensors[base + ".qzeros"] = packed[2]
        gptq[qualname] = packed
        gptq_weight_keys.add(base + ".weight")
    for qualname, param in layer.named_parameters():
        key = f"{prefix}.{qualname}"
        if key in tensors or key in gptq_weight_keys:
            continue
        value = torch.empty(param.shape, dtype=param.dtype)
        value.uniform_(-0.05, 0.05)
        tensors[key] = value
    return tensors, dense, gptq


def _backbone(tensors: dict[str, torch.Tensor]) -> FrozenGPTQSwift:
    backbone = FrozenGPTQSwift.__new__(FrozenGPTQSwift)
    backbone.group_size = _GROUP
    backbone.index = MemoryIndex(tensors)
    return backbone


def _poison(layer) -> None:
    with torch.no_grad():
        for param in layer.parameters():
            param.fill_(-7)


def _load_pair(config):
    loaded = []
    for layer_idx in (0, 1):
        layer = _new_layer(config, layer_idx)
        tensors, dense, gptq = _checkpoint_for(layer, layer_idx)
        _poison(layer)
        _backbone(tensors)._load_decoder_layer_xpu(layer, layer_idx, "cpu")
        loaded.append((layer, tensors, dense, gptq))
    return loaded


def test_loader_gdn_and_full_attention() -> None:
    config = _tiny_text_config()
    if config._attn_implementation != "sdpa":
        raise AssertionError(config._attn_implementation)
    loaded = _load_pair(config)
    saw_dense = False
    saw_gptq = False
    for layer, _tensors, dense, gptq in loaded:
        kind = layer.block_type
        if kind == "linear_attention":
            for qualname in dense:
                if qualname.endswith("in_proj_a") or qualname.endswith("in_proj_b"):
                    module = _child(layer, qualname)
                    if not isinstance(module, nn.Linear):
                        raise AssertionError(f"{qualname} became {type(module).__name__}")
                    if isinstance(module, GPTQLinearXPU):
                        raise AssertionError(f"{qualname} was quantized")
                    err = _max_abs(module.weight, dense[qualname])
                    if err != 0.0:
                        raise AssertionError(f"{qualname} weight max abs {err}")
                    if bool(torch.equal(module.weight, torch.full_like(module.weight, -7))):
                        raise AssertionError(f"{qualname} kept the poison value")
                    saw_dense = True
        if kind == "full_attention" and any(name.endswith("q_proj") for name in gptq):
            saw_gptq = True
        if not gptq:
            raise AssertionError(f"{kind} loaded no GPTQ linears")
        for qualname, packed in gptq.items():
            module = _child(layer, qualname)
            if not isinstance(module, GPTQLinearXPU):
                raise AssertionError(f"{qualname} is {type(module).__name__}")
            if module._use_int4 or module.weight is None:
                raise AssertionError(f"{qualname} took the int4 path on CPU")
            reference = dequantize_gptq_linear(*packed, group_size=_GROUP)
            err = _max_abs(module.weight, reference)
            print(f"loaded {kind} {qualname} dequant max abs {err:.6e}", flush=True)
            if err >= _DEQUANT_TOL:
                raise AssertionError(f"{qualname} dequant max abs {err}")
        for qualname, param in layer.named_parameters():
            if float(param.detach().abs().min()) == 7.0 and bool((param == -7).all()):
                raise AssertionError(f"poison left in {qualname}")
    if not saw_dense or not saw_gptq:
        raise AssertionError(f"coverage dense={saw_dense} gptq={saw_gptq}")

    layer, tensors, _dense, _gptq = loaded[0]
    missing = dict(tensors)
    missing_key = "model.language_model.layers.0.input_layernorm.weight"
    del missing[missing_key]
    fresh = _new_layer(config, 0)
    try:
        _backbone(missing)._load_decoder_layer_xpu(fresh, 0, "cpu")
    except KeyError as exc:
        if missing_key not in str(exc):
            raise AssertionError(f"KeyError did not name {missing_key}: {exc}") from exc
    else:
        raise AssertionError("missing norm weight was ignored")

    dense_key = "model.language_model.layers.0.linear_attn.in_proj_a.weight"
    if dense_key not in tensors:
        raise AssertionError(f"fixture missing {dense_key}")
    dropped = dict(tensors)
    del dropped[dense_key]
    try:
        _backbone(dropped)._load_decoder_layer_xpu(_new_layer(config, 0), 0, "cpu")
    except KeyError as exc:
        if dense_key not in str(exc):
            raise AssertionError(f"KeyError did not name {dense_key}: {exc}") from exc
    else:
        raise AssertionError("missing in_proj_a weight was ignored")


def _rope(config, seq: int):
    from transformers.models.qwen3_5.modeling_qwen3_5 import Qwen3_5TextRotaryEmbedding

    rotary = Qwen3_5TextRotaryEmbedding(config)
    dummy = torch.zeros(1, seq, config.hidden_size, dtype=torch.float16)
    position_ids = torch.arange(seq).view(1, 1, seq).expand(3, 1, seq)
    return rotary(dummy, position_ids)


def _forward(layer, hidden, cos, sin):
    with torch.inference_mode():
        out = layer(
            hidden,
            position_embeddings=(cos, sin),
            attention_mask=None,
            position_ids=None,
            past_key_values=None,
        )
    if not torch.is_tensor(out):
        raise AssertionError(f"decoder layer returned {type(out).__name__}")
    if not bool(torch.isfinite(out).all()):
        raise AssertionError("non-finite decoder output")
    return out


def _scale_dequant_weights(layer, factor: float) -> None:
    """Shrink fp16 GPTQ weights so a random fixture does not overflow."""
    with torch.no_grad():
        for _name, buf in layer.named_buffers():
            if buf.is_floating_point() and buf.ndim == 2:
                buf.mul_(factor)


def test_sdpa_causal_with_null_mask() -> None:
    config = _tiny_text_config()
    loaded = _load_pair(config)
    full = next(layer for layer, *_rest in loaded if layer.block_type == "full_attention")
    linear = next(layer for layer, *_rest in loaded if layer.block_type == "linear_attention")
    _scale_dequant_weights(full, 0.05)
    _scale_dequant_weights(linear, 0.05)
    seq = 8
    prefix = 4
    torch.manual_seed(5)
    hidden = (torch.randn(1, seq, config.hidden_size) * 0.5).to(torch.float16)
    cos, sin = _rope(config, seq)
    if config._attn_implementation != "sdpa":
        raise AssertionError(config._attn_implementation)
    full_out = _forward(full, hidden, cos, sin)
    prefix_out = _forward(full, hidden[:, :prefix], cos[:, :prefix], sin[:, :prefix])
    err = _max_abs(full_out[:, :prefix], prefix_out)
    print(f"sdpa causal prefix max abs {err:.6e}", flush=True)
    if err >= _CAUSAL_TOL:
        raise AssertionError(f"null-mask SDPA is not causal (max abs {err})")

    # Oracle at seq 8 only. Production replay keeps attention_mask=None so the
    # math backend does not allocate [S, S] (that mask OOMs at 8k/16k).
    normed = full.input_layernorm(hidden)
    with torch.inference_mode():
        sdpa_attn, _ = full.self_attn(
            normed,
            position_embeddings=(cos, sin),
            attention_mask=None,
            position_ids=None,
            past_key_values=None,
        )
    causal = torch.triu(torch.full((1, 1, seq, seq), float("-inf"), dtype=hidden.dtype), diagonal=1)
    full.self_attn.config._attn_implementation = "eager"
    try:
        with torch.inference_mode():
            eager_causal, _ = full.self_attn(
                normed,
                position_embeddings=(cos, sin),
                attention_mask=causal,
                position_ids=None,
                past_key_values=None,
            )
            eager_open, _ = full.self_attn(
                normed,
                position_embeddings=(cos, sin),
                attention_mask=None,
                position_ids=None,
                past_key_values=None,
            )
    finally:
        full.self_attn.config._attn_implementation = "sdpa"
    causal_err = _max_abs(sdpa_attn, eager_causal)
    open_err = _max_abs(sdpa_attn, eager_open)
    print(
        f"sdpa none vs eager causal {causal_err:.6e} vs eager none {open_err:.6e}",
        flush=True,
    )
    if causal_err >= _CAUSAL_TOL:
        raise AssertionError(f"null-mask SDPA disagrees with a causal mask ({causal_err})")
    if open_err < max(10 * causal_err, 0.1):
        raise AssertionError(f"null-mask SDPA matched non-causal eager ({open_err})")

    linear_out = _forward(linear, hidden, cos, sin)
    if linear_out.shape != hidden.shape:
        raise AssertionError(f"GDN out {tuple(linear_out.shape)}")


def main() -> None:
    _require_cpu()
    tests = [
        test_dequant_device_matches_cpu,
        test_gptq_linear_xpu_matches_f_linear,
        test_nt_layout_matches_qweight,
        test_int4_linear_refuses_cpu,
        test_int4_gemm_matches_dequant_when_available,
        test_loader_gdn_and_full_attention,
        test_sdpa_causal_with_null_mask,
    ]
    failed = 0
    for test in tests:
        try:
            test()
        except Exception:
            failed += 1
            print(f"FAIL {test.__name__}", flush=True)
            traceback.print_exc()
        else:
            print(f"PASS {test.__name__}", flush=True)
    if failed:
        print(f"FAIL test_gptq_xpu {failed}/{len(tests)}", flush=True)
        sys.exit(1)
    print("PASS test_gptq_xpu", flush=True)


if __name__ == "__main__":
    main()
