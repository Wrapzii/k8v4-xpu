"""MM1: multimodal continued indexer distillation from the step-600 checkpoint.

The backbone, vision encoder, projector and MTP stay frozen. Each step is a
single sequence (text-only or image+text), the dense teacher is collected from
the patched attention, and the 16 indexers are trained with the block KL.
Image cases place the image late so image queries also see N > K blocks.
"""

from __future__ import annotations

import json
import math
import os
import random
import time

import torch


def _sha256(path: str) -> str:
    import hashlib
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def _to_cuda(inputs: dict) -> dict:
    return {k: (v.cuda() if torch.is_tensor(v) else v) for k, v in inputs.items()}


def filler_pool(tokenizer, n_tokens: int, count: int, dataset: str, revision: str,
                subset: str = "sample-10BT", skip_docs: int = 0) -> list[str]:
    from datasets import load_dataset

    stream = load_dataset(dataset, subset, split="train", streaming=True,
                          revision=revision).skip(skip_docs)
    ids: list[int] = []
    need = n_tokens * count
    for row in stream:
        ids.extend(tokenizer(row["text"], add_special_tokens=False)["input_ids"])
        ids.append(tokenizer.eos_token_id)
        if len(ids) >= need:
            break
    return [tokenizer.decode(ids[i * n_tokens:(i + 1) * n_tokens]) for i in range(count)]


def _capture(scores, target, valid, eligible, kb) -> float:
    selected = torch.topk(scores.detach(), kb, dim=-1).indices
    mass = (target * valid[None]).gather(-1, selected).sum(-1)
    total = (target * valid[None]).sum(-1).clamp_min(1e-9)
    ratio = (mass / total).reshape(-1)[eligible.reshape(-1)]
    return ratio.mean().item() if ratio.numel() else float("nan")


def run_mm1(cfg: dict) -> None:
    from transformers import AutoProcessor, Qwen3_5ForConditionalGeneration

    from qsa.data import iter_token_blocks
    from qsa.hf_qsa import full_attention_layers, install
    from qsa.losses import indexer_kl_per_query
    from qsa.mm_data import build_inputs, make_specs
    from qsa.mm_capture import MMCapture, merge_summaries
    from qsa.train_indexer import check_hub, save_indexers, upload_files

    device = "cuda" if torch.cuda.is_available() else "cpu"
    if device != "cuda":
        raise SystemExit("MM1 requires a CUDA GPU")

    hub = check_hub(cfg)
    from huggingface_hub import hf_hub_download

    processor = AutoProcessor.from_pretrained(cfg["model"], revision=cfg["model_revision"])
    tokenizer = processor.tokenizer
    model = Qwen3_5ForConditionalGeneration.from_pretrained(
        cfg["model"], revision=cfg["model_revision"], dtype=torch.bfloat16,
        attn_implementation="sdpa", device_map="cuda",
    ).eval()

    install(model, block_size=cfg["block_size"], budget=cfg["budget"])
    model.requires_grad_(False)
    layers = full_attention_layers(model)
    params = [p for layer in layers for p in layer._qsa_indexer.parameters()]
    for p in params:
        p.requires_grad_(True)

    path = hf_hub_download(cfg["indexer_repo"], cfg["indexer_file"],
                           revision=cfg["indexer_revision"], repo_type="model")
    sha = _sha256(path)
    if cfg.get("indexer_sha256") and sha != cfg["indexer_sha256"]:
        raise SystemExit(f"indexer SHA mismatch: {sha}")
    state = torch.load(path, map_location="cpu", weights_only=True)
    for layer in layers:
        layer._qsa_indexer.load_state_dict(state[layer.layer_idx])
    print(f"[mm1] warm start {cfg['indexer_file']} sha={sha[:12]} layers={len(layers)}", flush=True)

    optimizer = torch.optim.AdamW(params, lr=cfg["lr"], betas=(0.9, 0.95),
                                  eps=1e-8, weight_decay=0.0)

    specs = make_specs(cfg.get("seed", 0))
    fillers = filler_pool(
        tokenizer, max(cfg["seq_len"] - 400, 512), cfg.get("filler_pool", 4),
        cfg["dataset"], cfg["dataset_revision"], cfg.get("subset", "sample-10BT"),
        cfg.get("skip_docs", 0),
    )
    text_iter = iter(iter_token_blocks(
        tokenizer, cfg["seq_len"], cfg["steps"] + 1, dataset=cfg["dataset"],
        subset=cfg.get("subset", "sample-10BT"), skip_docs=cfg.get("skip_docs", 0),
        revision=cfg["dataset_revision"],
    ))
    rng = random.Random(cfg.get("seed", 0))
    kb = min(cfg["budget"] // cfg["block_size"], cfg["seq_len"] // cfg["block_size"])

    def configure(collect: bool, budget: int):
        for layer in layers:
            layer._qsa_budget = budget
            layer._qsa_collect = collect
            layer._qsa_keep_target = collect
            layer._qsa_mm_capture = None
            layer._qsa_target = None
            layer._qsa_hidden = None
            layer._qsa_rope = None

    def build_step():
        is_mm = rng.random() < cfg.get("mm_ratio", 0.5)
        if is_mm:
            spec = specs[rng.randrange(len(specs))]
            filler = fillers[rng.randrange(len(fillers))]
            inputs, _ = build_inputs(processor, spec, filler, image_position="late",
                                 image_fraction=cfg.get("image_fraction", 0.72))
            return inputs, True
        ids = next(text_iter)[None]
        return {"input_ids": ids}, False

    history = []
    started = time.time()
    for step in range(1, cfg["steps"] + 1):
        inputs, is_mm = build_step()
        inputs = _to_cuda(inputs)
        configure(collect=True, budget=cfg["budget"])
        with torch.no_grad():
            model(**inputs, logits_to_keep=1)

        image = None
        if is_mm:
            image = (inputs["input_ids"][0] == cfg["image_token_id"])
            qmask = torch.zeros_like(image)
            qmask[max(0, image.shape[0] - cfg.get("question_span", 96)):] = True
        else:
            qmask = None

        total_loss, caps, weight_sum = 0.0, [], 0.0
        for layer in layers:
            target = layer._qsa_target
            hidden = layer._qsa_hidden
            cos, sin = layer._qsa_rope
            layer._qsa_target = layer._qsa_hidden = layer._qsa_rope = None
            if target is None:
                continue
            target32 = target.float()
            scores, valid = layer._qsa_indexer(hidden.float(), cos[0].float(), sin[0].float())
            if valid.dim() == 3:
                valid = valid[0]
            eligible = valid.any(-1)
            weights = eligible.float()
            if is_mm and qmask is not None and cfg.get("question_weight", 1.0) != 1.0:
                weights = weights * torch.where(qmask, cfg["question_weight"], 1.0)
            weights = weights / weights.sum().clamp_min(1.0)
            per_q = indexer_kl_per_query(scores, target32, valid)
            loss = (per_q[0] * weights).sum()
            loss.backward()
            total_loss += loss.item()
            weight_sum += 1.0
            caps.append(_capture(scores, target32, valid, eligible, kb))
            del scores, loss, target, target32, hidden

        torch.nn.utils.clip_grad_norm_(params, 1.0)
        optimizer.step()
        optimizer.zero_grad(set_to_none=True)

        rec = {"step": step, "kind": "mm" if is_mm else "text",
               "tokens": int(inputs["input_ids"].shape[1]),
               "loss": total_loss / max(weight_sum, 1),
               "capture": sum(c for c in caps if c == c) / max(len([c for c in caps if c == c]), 1),
               "seconds": round(time.time() - started, 1)}
        history.append(rec)
        if step % cfg.get("log_every", 1) == 0:
            print("TRAIN " + json.dumps(rec), flush=True)

        save_every = cfg.get("save_every", 50)
        if hub is not None and step % save_every == 0:
            repo, api = hub
            upload_files(api, repo, [save_indexers(layers, step)],
                         cfg.get("upload_prefix", "mm1"))

    # ---- text PPL (dense vs sparse) ----
    from qsa.train_indexer import perplexity

    ppl = {}
    if cfg.get("ppl_blocks", 0):
        ppl_blocks = list(iter_token_blocks(
            tokenizer, cfg["seq_len"], cfg["ppl_blocks"], dataset=cfg["dataset"],
            subset=cfg.get("subset", "sample-10BT"),
            skip_docs=cfg.get("ppl_skip_docs", 50_000),
            revision=cfg["dataset_revision"],
        ))
        configure(collect=False, budget=0)
        dense_ppl, ppl_tokens = perplexity(model, ppl_blocks)
        configure(collect=False, budget=cfg["budget"])
        sparse_ppl, _ = perplexity(model, ppl_blocks)
        ppl = {"dense": dense_ppl, "sparse": sparse_ppl,
               "delta_pct": 100 * (sparse_ppl / dense_ppl - 1),
               "tokens": ppl_tokens}
        print(f"[mm1] ppl {ppl}", flush=True)

    # ---- held-out MM capture + QA (after training) ----
    eval_specs = make_specs(cfg.get("seed", 0) + 1000)
    letters = [tokenizer.encode(" " + ch, add_special_tokens=False)[-1] for ch in "ABCD"]
    eval_metrics = []
    qa = {"dense": 0, "sparse": 0, "n": 0}
    for spec in eval_specs[: cfg.get("eval_cases", 2)]:
        inputs, _ = build_inputs(processor, spec, fillers[0], image_position="late",
                                      image_fraction=cfg.get("image_fraction", 0.72))
        inputs = _to_cuda(inputs)
        image = (inputs["input_ids"][0] == cfg["image_token_id"])
        qmask = torch.zeros_like(image)
        qmask[max(0, image.shape[0] - cfg.get("question_span", 96)):] = True
        caps = {layer.layer_idx: MMCapture() for layer in layers}
        qcaps = {layer.layer_idx: MMCapture() for layer in layers}
        configure(collect=False, budget=0)
        with torch.no_grad():
            dense_logits = model(**inputs, logits_to_keep=1).logits.float()[0, 0]
        configure(collect=True, budget=cfg["budget"])
        for layer in layers:
            layer._qsa_mm_capture = caps[layer.layer_idx]
        with torch.no_grad():
            sparse_logits = model(**inputs, logits_to_keep=1).logits.float()[0, 0]
        if spec["answer"] is not None:
            dense_pred = max(range(4), key=lambda i: dense_logits[letters[i]].item())
            sparse_pred = max(range(4), key=lambda i: sparse_logits[letters[i]].item())
            qa["dense"] += int(dense_pred == spec["answer"])
            qa["sparse"] += int(sparse_pred == spec["answer"])
            qa["n"] += 1
        for layer in layers:
            t = layer._qsa_mm_target
            v = layer._qsa_mm_valid
            s = layer._qsa_mm_scores
            v2 = v[0] if v.dim() == 3 else v
            caps[layer.layer_idx].add(t, v2, s, image, cfg["block_size"], cfg["budget"])
            qcaps[layer.layer_idx].add(t, v2, s, image, cfg["block_size"], cfg["budget"],
                                       query_mask=qmask)
            layer._qsa_mm_target = layer._qsa_mm_valid = layer._qsa_mm_scores = None
        overall = merge_summaries([caps[l.layer_idx].summary() for l in layers])
        qreg = merge_summaries([qcaps[l.layer_idx].summary() for l in layers])
        eval_metrics.append({"id": spec["id"], "tokens": int(inputs["input_ids"].shape[1]),
                             "overall": overall["cells"], "question": qreg["cells"]})
        print(f"[mm1] eval {spec['id']} tokens={inputs['input_ids'].shape[1]} "
              f"question={qreg['cells']}", flush=True)

    checkpoint = save_indexers(layers)
    if hub is not None:
        repo, api = hub
        summary = {"stage": "mm1", "lr": cfg["lr"], "steps": cfg["steps"],
                   "final": history[-1] if history else None,
                   "eval": eval_metrics, "config": cfg}
        with open("mm1_results.json", "w") as f:
            json.dump(summary, f, indent=2)
        try:
            upload_files(api, repo, [checkpoint, "mm1_results.json"],
                         cfg.get("upload_prefix", "mm1"))
        except Exception as exc:
            print(f"[mm1] final upload failed: {type(exc).__name__}: {exc}", flush=True)
            raise

    print("RESULT " + json.dumps({
        "lr": cfg["lr"], "steps": cfg["steps"],
        "ppl": ppl, "qa_mm": qa,
        "final_loss": history[-1]["loss"] if history else None,
        "final_capture": history[-1]["capture"] if history else None,
        "eval_question": [m["question"] for m in eval_metrics],
        "minutes": round((time.time() - started) / 60, 1),
    }), flush=True)
    import sys
    sys.stdout.flush()
    os._exit(0)
