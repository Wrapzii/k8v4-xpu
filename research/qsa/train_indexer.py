"""Stage-1 indexer distillation for QSA on Qwen3.8-27B.

The backbone stays frozen; only the indexers train, against the dense attention
distribution of the same forward pass. Each step

1. runs the dense model once under ``no_grad`` and records, per full-attention
   layer, the block teacher target (fp16) and the layer input hidden states;
2. recomputes each indexer with gradients on those stored inputs and applies
   the block-level KL from the paper (Eq. 18);
3. reports the mass of the teacher distribution captured by the indexer's own
   top-k selection.

``overfit: true`` reuses a single fixed sequence to test whether the objective
can fit at all before spending tokens on a real run.
"""

from __future__ import annotations

import json
import math
import os
import time

import torch
import torch.nn.functional as F

from qsa.device import empty_cache, resolve_device, synchronize, to_device


@torch.inference_mode()
def perplexity(model, blocks, chunk: int = 512) -> tuple[float, int]:
    from qsa.hf_qsa import text_model

    total_nll, total_tokens = 0.0, 0
    for ids in blocks:
        ids = to_device(ids[None])
        hidden = text_model(model)(input_ids=ids).last_hidden_state
        length = ids.shape[1]
        for start in range(0, length - 1, chunk):
            end = min(start + chunk, length - 1)
            logits = model.lm_head(hidden[:, start:end + 1]).float()
            total_nll += F.cross_entropy(
                logits[:, :-1].reshape(-1, logits.shape[-1]),
                ids[:, start + 1:end + 1].reshape(-1),
                reduction="sum",
            ).item()
            total_tokens += end - start
        del hidden
        empty_cache()
    return math.exp(total_nll / max(total_tokens, 1)), total_tokens


def set_mode(layers, collect: bool, budget: int) -> None:
    for layer in layers:
        layer._qsa_collect = collect
        layer._qsa_budget = budget
        layer._qsa_keep_target = collect
        layer._qsa_target = None
        layer._qsa_hidden = None
        layer._qsa_rope = None


def distill_step(model, layers, ids, cfg, optimizer) -> tuple[float, float, dict]:
    """One optimizer step on a single sequence; returns (loss, capture)."""
    from qsa.hf_qsa import text_model
    from qsa.losses import indexer_kl_from_target
    from qsa.sparse_attention import select_blocks

    with torch.no_grad():
        text_model(model)(input_ids=ids)

    params = [p for layer in layers for p in layer._qsa_indexer.parameters()]
    total_loss, cap_sum, cap_count, used = 0.0, 0.0, 0, 0
    ent_sum, std_sum = 0.0, 0.0
    for layer in layers:
        target = layer._qsa_target
        hidden = layer._qsa_hidden
        cos, sin = layer._qsa_rope
        layer._qsa_target = None
        layer._qsa_hidden = None
        layer._qsa_rope = None
        if target is None:
            continue
        scores, valid = layer._qsa_indexer(hidden.float(), cos[0].float(), sin[0].float())
        target32 = target.float()
        loss = indexer_kl_from_target(scores, target32, valid)
        loss.backward()
        total_loss += loss.item()
        used += 1

        with torch.no_grad():
            probs = target32 / target32.sum(-1, keepdim=True).clamp_min(1e-12)
            ent = -(probs * probs.clamp_min(1e-12).log()).sum(-1)
            ent_sum += ent[valid.any(-1)].mean().item()
            sc = scores.detach().masked_fill(~valid, 0.0)
            cnt = valid.sum(-1).clamp_min(1)
            mean = sc.sum(-1) / cnt
            var = (((sc - mean.unsqueeze(-1)) ** 2) * valid).sum(-1) / cnt
            std_sum += var.clamp_min(0).sqrt().mean().item()
            selected = select_blocks(scores.detach(), valid, cfg["budget"], cfg["block_size"])
            mass = target32.gather(-1, selected).sum(-1)
            mask = valid.any(-1).expand_as(mass)
            cap_sum += mass[mask].sum().item()
            cap_count += int(mask.sum())
        del scores, loss, target, target32, hidden

    synchronize()
    torch.nn.utils.clip_grad_norm_(params, 1.0)
    optimizer.step()
    optimizer.zero_grad(set_to_none=True)
    empty_cache()
    stats = {
        "teacher_entropy": ent_sum / max(used, 1),
        "score_std": std_sum / max(used, 1),
    }
    return total_loss / max(used, 1), cap_sum / max(cap_count, 1), stats


def save_indexers(layers, step: int | None = None) -> str:
    suffix = f"_step{step}" if step is not None else ""
    path = f"qsa_indexers{suffix}.pt"
    state = {
        getattr(layer, "layer_idx", i): layer._qsa_indexer.state_dict()
        for i, layer in enumerate(layers)
    }
    torch.save(state, path)
    print(f"[p1] saved {path} ({os.path.getsize(path) / 2**20:.1f} MiB)", flush=True)
    return path


def check_hub(cfg: dict) -> tuple[str, object] | None:
    """Fail fast when the run is asked to persist to the Hub but cannot."""
    if not cfg.get("push_to_hub", False):
        return None
    token = os.environ.get("HF_TOKEN")
    if not token:
        raise SystemExit("[p1] HF_TOKEN is not set in the runtime environment")
    from huggingface_hub import HfApi

    api = HfApi(token=token)
    try:
        user = api.whoami()["name"]
    except Exception as exc:
        raise SystemExit(f"[p1] HF authentication rejected: {type(exc).__name__}: {exc}")
    private = bool(cfg.get("hub_private", False))
    repo = cfg.get("hf_repo") or f"{user}/qwen38-27b-qsa-indexers"
    api.create_repo(repo_id=repo, private=private, exist_ok=True, repo_type="model")
    if not private:
        try:
            api.update_repo_settings(repo_id=repo, private=False, repo_type="model")
        except Exception as exc:
            print(f"[p1] could not force public visibility: {exc}", flush=True)
    print(f"[p1] hub ready user={user} repo={repo} private={private}", flush=True)
    return repo, api


def upload_files(api, repo: str, paths: list[str], prefix: str = "pilot") -> None:
    from huggingface_hub import HfApi

    for path in paths:
        if not os.path.exists(path):
            continue
        api.upload_file(path_or_fileobj=path, path_in_repo=f"{prefix}/{path}",
                        repo_id=repo, repo_type="model")
        print(f"[p1] uploaded {path} -> {repo}/{prefix}/{path}", flush=True)


def run_distillation(cfg: dict) -> None:
    device = resolve_device()
    if device == "cpu":
        raise SystemExit("distillation requires an XPU or CUDA accelerator")

    from transformers import AutoTokenizer, Qwen3_5ForConditionalGeneration

    from qsa.data import iter_token_blocks
    from qsa.hf_qsa import full_attention_layers, install

    hub = check_hub(cfg)

    tokenizer = AutoTokenizer.from_pretrained(cfg["model"])
    model = Qwen3_5ForConditionalGeneration.from_pretrained(
        cfg["model"], dtype=torch.bfloat16, attn_implementation="sdpa",
        device_map=device,
    ).eval()

    install(
        model,
        block_size=cfg["block_size"],
        budget=cfg["budget"],
        indexer_heads=cfg["indexer_heads"],
        indexer_head_dim=cfg["indexer_head_dim"],
        rope_dim=cfg["rope_dim"],
    )
    model.requires_grad_(False)
    layers = [layer for layer in full_attention_layers(model)
              if getattr(layer, "_qsa_indexer", None) is not None]
    params = [p for layer in layers for p in layer._qsa_indexer.parameters()]
    for p in params:
        p.requires_grad_(True)
    if cfg.get("init_from_hub"):
        from huggingface_hub import hf_hub_download

        repo = cfg.get("hf_repo")
        if not repo:
            raise SystemExit("init_from_hub requires hf_repo")
        path = hf_hub_download(repo, cfg["init_from_hub"], repo_type="model")
        state = torch.load(path, map_location="cpu", weights_only=True)
        for layer in layers:
            layer._qsa_indexer.load_state_dict(state[layer.layer_idx])
        print(f"[p1] warm start {repo}/{cfg['init_from_hub']} "
              f"({len(state)} layers)", flush=True)

    optimizer = torch.optim.AdamW(params, lr=cfg["lr"], betas=(0.9, 0.95),
                                  eps=1e-8, weight_decay=0.0)
    print(f"[p1] layers {len(layers)} params {sum(p.numel() for p in params)/1e6:.1f}M",
          flush=True)

    overfit = bool(cfg.get("overfit", False))
    if not cfg.get("skip_eval", False):
        eval_blocks = list(iter_token_blocks(
            tokenizer, cfg["seq_len"], cfg["eval_seqs"],
            dataset=cfg["dataset"], subset=cfg.get("subset", "sample-10BT"),
            skip_docs=cfg.get("eval_skip_docs", 50_000),
        ))
        set_mode(layers, collect=False, budget=0)
        dense_ppl, dense_tokens = perplexity(model, eval_blocks)
        print(f"[p1] dense ppl {dense_ppl:.4f} ({dense_tokens} tokens)", flush=True)

    if overfit:
        fixed = to_device(next(iter(iter_token_blocks(
            tokenizer, cfg["seq_len"], 1,
            dataset=cfg["dataset"], subset=cfg.get("subset", "sample-10BT"),
            skip_docs=cfg.get("skip_docs", 0),
        )))[None])
        train_iter = iter([fixed] * cfg["steps"])
    else:
        train_iter = iter(iter_token_blocks(
            tokenizer, cfg["seq_len"], cfg["steps"],
            dataset=cfg["dataset"], subset=cfg.get("subset", "sample-10BT"),
            skip_docs=cfg.get("skip_docs", 0),
        ))

    set_mode(layers, collect=True, budget=cfg["budget"])
    started = time.time()
    history = []
    step = 0
    offset = int(cfg.get("step_offset", 0))
    prefix = cfg.get("upload_prefix", "pilot")
    for ids in train_iter:
        if not overfit:
            ids = to_device(ids[None])
        loss, capture, stats = distill_step(model, layers, ids, cfg, optimizer)
        step += 1
        save_every = cfg.get("save_every", 0)
        if hub is not None and save_every and step % save_every == 0:
            repo, api = hub
            upload_files(api, repo, [save_indexers(layers, step + offset)], prefix)

        if step % cfg.get("log_every", 10) == 0 or step == 1:
            record = {
                "step": step,
                "global_step": step + offset,
                "loss": loss,
                "capture": capture,
                "teacher_entropy": round(stats["teacher_entropy"], 3),
                "score_std": round(stats["score_std"], 3),
                "seconds": round(time.time() - started, 1),
                "tokens": (step + offset) * cfg["seq_len"],
            }
            history.append(record)
            print("TRAIN " + json.dumps(record), flush=True)

    checkpoint = save_indexers(layers)
    result = {
        "overfit": overfit,
        "steps": step,
        "step_offset": offset,
        "tokens": (step + offset) * cfg["seq_len"],
        "final_loss": history[-1]["loss"] if history else None,
        "final_capture": history[-1]["capture"] if history else None,
        "history": history,
        "checkpoint": checkpoint,
    }

    if not cfg.get("skip_eval", False):
        set_mode(layers, collect=False, budget=cfg["budget"])
        for layer in layers:
            layer._qsa_indexer.eval()
        sparse_ppl, sparse_tokens = perplexity(model, eval_blocks)
        result.update({
            "dense_ppl": dense_ppl,
            "sparse_ppl": sparse_ppl,
            "eval_tokens": sparse_tokens,
            "ppl_delta_pct": 100 * (sparse_ppl / dense_ppl - 1),
        })

    if cfg.get("retrieval_lengths"):
        from datasets import load_dataset

        from qsa.retrieval import build_examples, retrieval_accuracy

        stream = load_dataset(cfg["dataset"], cfg.get("subset", "sample-10BT"),
                              split="train", streaming=True)
        docs = [row["text"] for row in stream.take(cfg.get("retrieval_docs", 200))]
        examples = build_examples(tokenizer, docs, cfg["retrieval_lengths"],
                                  cfg.get("retrieval_n", 8))
        set_mode(layers, collect=False, budget=0)
        dense_ret = retrieval_accuracy(model, examples)
        print(f"[p1] retrieval dense {dense_ret}", flush=True)
        set_mode(layers, collect=False, budget=cfg["budget"])
        sparse_ret = retrieval_accuracy(model, examples)
        print(f"[p1] retrieval sparse {sparse_ret}", flush=True)
        result["retrieval"] = {"dense": dense_ret, "sparse": sparse_ret}

    if hub is not None:
        repo, api = hub
        paths = [checkpoint]
        if os.path.exists("p1_results.json"):
            paths.append("p1_results.json")
        try:
            upload_files(api, repo, paths, prefix)
        except Exception as exc:
            print(f"[p1] final upload failed: {type(exc).__name__}: {exc}", flush=True)
            raise

    print("RESULT " + json.dumps({
        key: result[key] for key in
        ("overfit", "steps", "tokens", "final_loss", "final_capture",
         "dense_ppl", "sparse_ppl", "ppl_delta_pct", "retrieval")
        if key in result
    }), flush=True)
    with open("p1_results.json", "w") as f:
        json.dump(result, f, indent=2)
