"""Capture full-attention teacher activations from the Swift GPTQ checkpoint.

Layer replay stays on CPU. When ``QSA_DEVICE=xpu``, the Q/K block teacher
runs on that device. Do not pass ``/dev/dri`` while ``vllm-k8v4-tp2`` is up.

Example::

    python research/qsa/capture_activations.py --seq 128 --prompt-tokens hello
"""

from __future__ import annotations

import argparse
import os
import sys
import traceback
from datetime import datetime
from pathlib import Path

os.environ["USE_HUB_KERNELS"] = "0"
os.environ.setdefault("HF_HUB_OFFLINE", "1")
os.environ.setdefault("TRANSFORMERS_OFFLINE", "1")

_RESEARCH = Path(__file__).resolve().parents[1]
if str(_RESEARCH) not in sys.path:
    sys.path.insert(0, str(_RESEARCH))

import torch

from qsa.device import resolve_device
from qsa.gptq_backbone import FrozenGPTQSwift, _unpack_qzeros, gptq_self_test


DEFAULT_MODEL = "/srv/launch80-target-fast"
DEFAULT_OUT = "/mnt/hdd-500gb/model-validation/qsa-train/activations"
DEFAULT_LOG = "/mnt/hdd-500gb/model-validation/qsa-train/logs/gptq-teacher.log"


def _prompt_ids(model_dir: Path, kind: str, seq: int, seed: int, vocab: int) -> torch.Tensor:
    if kind == "random":
        generator = torch.Generator().manual_seed(seed)
        return torch.randint(0, vocab, (1, seq), generator=generator)
    from transformers import AutoTokenizer

    tokenizer = AutoTokenizer.from_pretrained(model_dir, local_files_only=True)
    text = ("hello " * 200).strip()
    ids = tokenizer(text, add_special_tokens=False, return_tensors="pt").input_ids[0]
    if ids.numel() < seq:
        ids = ids.repeat((seq + ids.numel() - 1) // ids.numel())
    return ids[:seq].view(1, seq).to(torch.int64)


def _parse_layers(text: str, full_layers: list[int], end_layer: int | None) -> list[int]:
    if text == "all":
        layers = list(full_layers)
    else:
        layers = [int(part) for part in text.split(",") if part.strip()]
        missing = [layer for layer in layers if layer not in full_layers]
        if missing:
            raise SystemExit(f"not full-attention layers: {missing}; expected {full_layers}")
    if end_layer is not None:
        layers = [layer for layer in layers if layer <= end_layer]
    if not layers:
        raise SystemExit("no full-attention layers selected")
    return layers


def _check(capture: dict, seq: int, hidden: int, rope_dim: int, block_size: int) -> None:
    h = capture["hidden_pre_attn"]
    teacher = capture["block_teacher"]
    blocks = seq // block_size
    if tuple(h.shape) != (1, seq, hidden):
        raise RuntimeError(f"hidden_pre_attn {tuple(h.shape)} != {(1, seq, hidden)}")
    if tuple(capture["cos"].shape) != (1, seq, rope_dim):
        raise RuntimeError(f"cos {tuple(capture['cos'].shape)} != {(1, seq, rope_dim)}")
    if tuple(capture["sin"].shape) != tuple(capture["cos"].shape):
        raise RuntimeError("sin shape does not match cos")
    if tuple(teacher.shape) != (1, seq, blocks):
        raise RuntimeError(f"block_teacher {tuple(teacher.shape)} != {(1, seq, blocks)}")
    for name in ("hidden_pre_attn", "cos", "sin", "block_teacher"):
        if not torch.isfinite(capture[name]).all():
            raise RuntimeError(f"non-finite {name}")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--model", default=DEFAULT_MODEL)
    parser.add_argument("--out", default=DEFAULT_OUT)
    parser.add_argument("--log", default=DEFAULT_LOG)
    parser.add_argument("--seq", type=int, default=512)
    parser.add_argument("--prompt-tokens", choices=("hello", "random"), default="hello")
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--layers", default="all", help="all, or a comma list such as 3,7")
    parser.add_argument("--mode", choices=("auto", "hook", "layer", "minimal"), default="auto")
    parser.add_argument("--end-layer", type=int, default=None)
    parser.add_argument("--block-size", type=int, default=4)
    parser.add_argument("--threads", type=int, default=8)
    args = parser.parse_args(argv)

    if args.seq % args.block_size != 0:
        raise SystemExit(f"--seq must be a multiple of --block-size ({args.block_size})")
    torch.manual_seed(args.seed)
    torch.set_num_threads(args.threads)
    out = Path(args.out)
    log_path = Path(args.log)
    out.mkdir(parents=True, exist_ok=True)
    log_path.parent.mkdir(parents=True, exist_ok=True)
    lines: list[str] = [f"=== gptq teacher {datetime.now().isoformat(timespec='seconds')} ==="]

    def log(message: str) -> None:
        print(message, flush=True)
        lines.append(message)

    code = 0
    backbone = None
    try:
        gptq_self_test()
        log("self-test: int4 pack/unpack round-trip ok")
        backbone = FrozenGPTQSwift(args.model)
        log(f"model: {args.model}")
        log(f"quant: int{backbone.bits} g{backbone.group_size} sym={backbone.sym} desc_act={backbone.desc_act}")
        log(f"full-attention layers: {backbone.full_layers}")
        if backbone.hf_model is None:
            log(f"transformers GPTQ CPU load failed: {backbone.hf_error}")
        else:
            log("transformers GPTQ CPU load: ok")
        probe = "model.language_model.layers.3.self_attn.k_proj"
        zeros = _unpack_qzeros(backbone.index.get(probe + ".qzeros"))
        g_idx = backbone.index.get(probe + ".g_idx").to(torch.int64)
        identity = torch.arange(g_idx.numel()) // backbone.group_size
        sample = backbone.dequant_linear(probe)
        log(
            f"layer3 k_proj zeros unique={torch.unique(zeros).tolist()[:8]} "
            f"g_idx_identity={bool(torch.equal(g_idx, identity))} "
            f"weight={tuple(sample.shape)} finite={bool(torch.isfinite(sample).all())} "
            f"mean={sample.float().mean().item():.6f} std={sample.float().std().item():.6f}"
        )
        del sample, zeros, g_idx
        layers = _parse_layers(args.layers, backbone.full_layers, args.end_layer)
        ids = _prompt_ids(Path(args.model), args.prompt_tokens, args.seq, args.seed, backbone.vocab_size)
        log(
            f"prompt-tokens: {args.prompt_tokens} seed={args.seed} seq={args.seq} "
            f"ids={tuple(ids.shape)} mode={args.mode} teacher_device={resolve_device()}"
        )
        captures = backbone.capture(
            ids,
            mode=args.mode,
            layers=layers,
            block_size=args.block_size,
            end_layer=args.end_layer,
        )
        if backbone.replay_error:
            log(f"layer replay failed, used minimal Q/K: {backbone.replay_error}")
        rope_dim = int(backbone.head_dim * backbone.partial_rotary)
        missing = [layer for layer in layers if layer not in captures]
        if missing:
            raise RuntimeError(f"missing captures for layers {missing}")
        for layer in layers:
            capture = captures[layer]
            _check(capture, args.seq, backbone.hidden_size, rope_dim, args.block_size)
            path = out / f"layer_{layer}.pt"
            torch.save(capture, path)
            teacher = capture["block_teacher"].float()
            mass = teacher.sum(-1).mean().item()
            log(
                f"wrote {path} source={capture['source']} "
                f"hidden={tuple(capture['hidden_pre_attn'].shape)} "
                f"teacher={tuple(teacher.shape)} mean_mass={mass:.4f} bytes={path.stat().st_size}"
            )
        log(f"backend note: hook=transformers model, layer-replay=dequantized decoder, minimal-embedding=Q/K on token embeddings")
    except Exception:
        code = 1
        log(traceback.format_exc().rstrip())
    finally:
        if backbone is not None:
            backbone.close()
        lines.append(f"=== exit {code} ===")
        with log_path.open("a", encoding="utf-8") as handle:
            handle.write("\n".join(lines) + "\n")
    return code


if __name__ == "__main__":
    raise SystemExit(main())
