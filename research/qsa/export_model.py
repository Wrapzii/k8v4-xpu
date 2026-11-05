"""Package unchanged multimodal backbone shards plus trained QSA indexers.

No 27B model is instantiated: original safetensors are hard-linked (or copied),
and an additional shard stores the small indexers. The result is self-contained.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import struct

import torch
from safetensors import safe_open
from safetensors.torch import save_file

from .indexer import QSAIndexer


DEFAULT_QSA = {
    "format_version": 1,
    "budget": 2048,
    "block_size": 4,
    "indexer_heads": 4,
    "indexer_head_dim": 128,
    "rope_dim": 64,
    "multimodal_policy": "dense",
    "runtime": "reference_sdpa",
}


def _sha256(path):
    digest = hashlib.sha256()
    with open(path, "rb") as stream:
        for chunk in iter(lambda: stream.read(8 * 1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def export_model(base_dir, checkpoint, output_dir, *, qsa=None, provenance=None):
    base_dir, checkpoint, output_dir = map(Path, (base_dir, checkpoint, output_dir))
    options = DEFAULT_QSA | (qsa or {})
    if options["multimodal_policy"] != "dense":
        raise ValueError("This exporter preserves image/video requests via dense attention")
    if output_dir.exists():
        raise FileExistsError(f"Output already exists: {output_dir}")
    config = json.loads((base_dir / "config.json").read_text())
    if config.get("model_type") != "qwen3_5" or not config.get("vision_config"):
        raise ValueError("Expected the full Qwen3.5/3.8 multimodal checkpoint, including vision_config")
    text = config["text_config"]
    layers = [i for i, kind in enumerate(text["layer_types"]) if kind == "full_attention"]
    state = torch.load(checkpoint, map_location="cpu", weights_only=True)
    if set(state) != set(layers):
        raise ValueError(f"Indexer layer IDs {sorted(state)} do not match {layers}")
    expected = QSAIndexer(
        text["hidden_size"], options["indexer_heads"], options["indexer_head_dim"],
        options["rope_dim"], options["block_size"],
    ).state_dict()
    tensors = {}
    for layer in layers:
        if set(state[layer]) != set(expected):
            raise ValueError(f"Unexpected indexer parameters in layer {layer}")
        for name, tensor in state[layer].items():
            if tensor.shape != expected[name].shape or tensor.dtype != torch.float32:
                raise ValueError(f"Indexer {layer}/{name}: expected {expected[name].shape} in FP32")
            if not torch.isfinite(tensor).all():
                raise ValueError(f"Non-finite indexer parameters: {layer}/{name}")
            tensors[f"model.language_model.layers.{layer}.self_attn._qsa_indexer.{name}"] = tensor.contiguous()

    source_index = base_dir / "model.safetensors.index.json"
    if source_index.exists():
        index = json.loads(source_index.read_text())
    else:
        with safe_open(base_dir / "model.safetensors", framework="pt", device="cpu") as handle:
            index = {"metadata": {}, "weight_map": {k: "model.safetensors" for k in handle.keys()}}
    if not any(k.startswith("model.visual.") for k in index["weight_map"]):
        raise ValueError("Vision encoder weights are missing")
    if any(k in index["weight_map"] for k in tensors):
        raise ValueError("The base model already contains QSA indexers")
    shard_names = sorted(set(index["weight_map"].values()))
    payload_bytes = 0
    for shard in shard_names:
        if not (base_dir / shard).is_file():
            raise FileNotFoundError(base_dir / shard)
        with open(base_dir / shard, "rb") as stream:
            size = struct.unpack("<Q", stream.read(8))[0]
            header = json.loads(stream.read(size))
        payload_bytes += sum(v["data_offsets"][1] - v["data_offsets"][0]
                             for k, v in header.items() if k != "__metadata__")
    output_dir.parent.mkdir(parents=True, exist_ok=True)
    staging = output_dir.with_name(output_dir.name + ".building")
    staging.mkdir()  # Refuse to reuse an incomplete export silently.
    linked, copied = [], []
    try:
        for path in base_dir.iterdir():
            if not path.is_file() or path.name.startswith("."):
                continue
            if path.name in {"config.json", "model.safetensors.index.json"}:
                continue
            name = "BASE_MODEL_CARD.md" if path.name == "README.md" else path.name
            target = staging / name
            try:
                os.link(path.resolve(), target)
                linked.append(name)
            except OSError:
                shutil.copy2(path, target)
                copied.append(name)
        shard = "qsa-indexers.safetensors"
        save_file(tensors, staging / shard, metadata={"format": "pt"})
        index["weight_map"].update({name: shard for name in tensors})
        index.setdefault("metadata", {})["total_size"] = payload_bytes + sum(
            t.numel() * t.element_size() for t in tensors.values()
        )
        (staging / "model.safetensors.index.json").write_text(json.dumps(index, indent=2) + "\n")
        config["architectures"] = ["QSAQwen3_5ForConditionalGeneration"]
        config["model_type"] = "qwen3_5_qsa"
        config["auto_map"] = {
            **config.get("auto_map", {}),
            "AutoConfig": "modeling_qsa.QSAQwen3_5Config",
            "AutoModelForImageTextToText": "modeling_qsa.QSAQwen3_5ForConditionalGeneration",
            "AutoModelForMultimodalLM": "modeling_qsa.QSAQwen3_5ForConditionalGeneration",
        }
        config["qsa"] = options
        (staging / "config.json").write_text(json.dumps(config, indent=2) + "\n")
        for module in ("modeling_qsa.py", "indexer.py"):
            shutil.copyfile(Path(__file__).with_name(module), staging / module)
        manifest = {
            "format_version": 1,
            "base": provenance or {"local_path": str(base_dir.resolve())},
            "indexer_checkpoint_sha256": _sha256(checkpoint),
            "qsa": options,
            "full_attention_layers": layers,
            "backbone_shards_unchanged": shard_names,
            "hardlinked_files": linked,
            "copied_files": copied,
            "vision_tensor_count": sum(k.startswith("model.visual.") for k in index["weight_map"]),
            "mtp_tensor_count": sum(k.startswith("mtp.") for k in index["weight_map"]),
            "indexer_parameters": sum(t.numel() for t in tensors.values()),
            "validation": {
                "full_27b_forward": False,
                "multimodal_quality_benchmark": False,
                "note": "Image/video route uses the unchanged dense model. No speedup claim for this reference runtime.",
            },
        }
        (staging / "conversion_manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
        (staging / "README.md").write_text(
            "# Qwen3.8-27B-QSA\n\n"
            "Full multimodal backbone, with trained QSA indexers on text decoder full-attention layers.\n"
            "Text-only requests use QSA (K=2048, r=4). Image/video requests, including subsequent cached\n"
            "generation, use original dense attention. Padded requests also use dense attention.\n"
            "Backbone weights, vision encoder, MTP tensors, tokenizer, processor and chat template are preserved.\n\n"
            "## Load\n\n"
            "Install the tested runtime with `pip install -r requirements.txt`.\n"
            "The indexers remain FP32; backbone weights remain BF16.\n\n"
            "```python\nfrom transformers import AutoModelForImageTextToText, AutoProcessor\n\n"
            "path = '/absolute/path/to/Qwen3.8-27B-QSA'\n"
            "processor = AutoProcessor.from_pretrained(path, trust_remote_code=True)\n"
            "model = AutoModelForImageTextToText.from_pretrained(\n"
            "    path, trust_remote_code=True, dtype='auto', device_map='auto',\n"
            "    attn_implementation='sdpa',\n)\n"
            "# Use processor.apply_chat_template(...) and model.generate(...) as for the base model.\n```\n\n"
            "## Status\n\n"
            "This runtime uses a dense Boolean mask as a correctness reference, not an optimized sparse kernel.\n"
            "No inference speedup is claimed. Use the default dynamic cache; speculative rollback, MTP\n"
            "execution, static/quantized caches and continuous batching are not implemented here.\n"
            "The original MTP weights are retained for future work. See `conversion_manifest.json` for provenance\n"
            "and validation limits, and `BASE_MODEL_CARD.md` for the original model card.\n"
        )
        (staging / "requirements.txt").write_text(
            "torch==2.14.1\ntransformers==5.22.1\ntorchvision==0.29.1\n"
            "accelerate==1.15.0\npillow==13.0.0\nnumpy==2.5.4\nsafetensors\n"
        )
        staging.rename(output_dir)
    except Exception:
        # Keep partial files available for inspection; never delete user files.
        raise
    return manifest


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", required=True, help="Local multimodal model snapshot")
    parser.add_argument("--indexers", required=True)
    parser.add_argument("--output", required=True)
    parser.add_argument("--provenance", help="JSON file recording immutable source revisions")
    args = parser.parse_args()
    provenance = json.loads(Path(args.provenance).read_text()) if args.provenance else None
    result = export_model(args.base, args.indexers, args.output, provenance=provenance)
    print(json.dumps({"output": str(Path(args.output).resolve()),
                      "indexer_parameters": result["indexer_parameters"],
                      "vision_tensors": result["vision_tensor_count"]}, indent=2))


if __name__ == "__main__":
    main()
