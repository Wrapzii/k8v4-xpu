"""Log MTP draft top-k against the verifier token. Measurement only.

Greedy MTP already commits the verifier token at the first miss. A later
draft position was conditioned on the rejected token, so only the miss
itself says whether top-2 or top-3 would have started the right branch.
Continuations of that branch are not in this log.
"""

from __future__ import annotations

import json
import os
import sys
import time

_QUEUE: list[dict] = []
_QUEUE_CAP = 48
_ERR = False
_ANNOUNCED = False
_BREAD = False


def reset_for_test() -> None:
    global _ERR, _ANNOUNCED, _BREAD
    _QUEUE.clear()
    _ERR = False
    _ANNOUNCED = False
    _BREAD = False


def drafter_mode(current, disabled):
    """Return the drafter graph mode for this process.

    Callers rebind their local argument. This does not write the compilation
    config, so the target model's graphs stay as launched.
    """
    if not enabled():
        return current
    sys.stderr.write("[mtp_topk] drafter cudagraph mode forced to NONE\n")
    return disabled


def skip_drafter_capture() -> bool:
    """Skip speculator graph capture while top-k logging is on.

    FULL drafter replay never re-enters sample_draft, so the log would stay
    empty. The capture context itself is not entered.
    """
    return enabled()


def enabled() -> bool:
    return os.environ.get("MTP_TOPK_LOG") == "1"


def rank() -> int:
    try:
        import torch

        dist = getattr(torch, "distributed", None)
        if dist is not None and dist.is_available() and dist.is_initialized():
            return int(dist.get_rank())
    except Exception:
        pass
    raw = os.environ.get("RANK", "0")
    try:
        return int(raw)
    except ValueError:
        return 0


def _err(msg: object) -> None:
    global _ERR
    if _ERR:
        return
    _ERR = True
    sys.stderr.write("[mtp_topk] %s\n" % msg)


def _capturing() -> bool:
    try:
        import torch
    except Exception:
        return False
    xpu = getattr(torch, "xpu", None)
    if xpu is not None and hasattr(xpu, "is_current_stream_capturing"):
        try:
            if xpu.is_current_stream_capturing():
                return True
        except Exception:
            return False
    return False


def begin(owner, attn=None) -> None:
    if not enabled():
        return
    try:
        owner._mtp_buf = []
        owner._mtp_seq = None
        if _capturing():
            return
        # Sequence length comes from the client prompt size. Copying
        # seq_lens here syncs during drafter warmup and can break capture.
        _breadcrumb("begin")
    except Exception as exc:
        _err(exc)


def _breadcrumb(where: str) -> None:
    global _BREAD
    if rank() != 0:
        return
    path = os.environ.get("MTP_TOPK_FILE")
    if not path:
        return
    line = json.dumps(
        {"kind": "breadcrumb", "where": where, "t": time.time()},
        separators=(",", ":"),
    )
    with open(path, "a", encoding="utf-8") as handle:
        handle.write(line + "\n")
    if not _BREAD:
        _BREAD = True
        sys.stderr.write("[mtp_topk] breadcrumb %s\n" % path)


def note_logits(owner, logits) -> None:
    if not enabled():
        return
    try:
        _note_logits(owner, logits)
    except Exception as exc:
        _err(exc)


def _note_logits(owner, logits) -> None:
    if _capturing():
        return
    if logits.ndim != 2 or logits.shape[0] > 32 or logits.shape[-1] > 400000:
        return
    import torch

    scores = logits.detach().float()
    k = min(8, scores.shape[-1])
    vals, idx = torch.topk(scores, k=k, dim=-1)
    lse = torch.logsumexp(scores, dim=-1, keepdim=True)
    probs = torch.exp(vals - lse)
    buf = getattr(owner, "_mtp_buf", None)
    if buf is None:
        buf = []
        owner._mtp_buf = buf
    buf.append((idx, vals, probs))


def flush(owner, draft_token_ids, dummy_run: bool = False) -> None:
    if not enabled():
        return
    try:
        _flush(owner, draft_token_ids, dummy_run)
    except Exception as exc:
        _err(exc)


def _flush(owner, draft_token_ids, dummy_run: bool = False) -> None:
    buf = getattr(owner, "_mtp_buf", None) or []
    owner._mtp_buf = []
    if dummy_run or not buf or _capturing():
        return
    import torch

    idx = torch.stack([item[0] for item in buf], dim=1)
    vals = torch.stack([item[1] for item in buf], dim=1)
    probs = torch.stack([item[2] for item in buf], dim=1)
    idx_cpu = idx.to("cpu")
    vals_cpu = vals.to("cpu")
    probs_cpu = probs.to("cpu")
    drafts = draft_token_ids.detach().to("cpu").tolist()
    if rank() != 0:
        return
    if idx_cpu.shape[0] != len(drafts):
        return
    seqs = getattr(owner, "_mtp_seq", None)
    for row in range(idx_cpu.shape[0]):
        depths = []
        for depth in range(idx_cpu.shape[1]):
            choices = []
            for cand in range(idx_cpu.shape[2]):
                choices.append(
                    {
                        "id": int(idx_cpu[row, depth, cand]),
                        "logit": round(float(vals_cpu[row, depth, cand]), 5),
                        "prob": round(float(probs_cpu[row, depth, cand]), 5),
                    }
                )
            depths.append(choices)
        seq = None
        if isinstance(seqs, list) and row < len(seqs):
            seq = int(seqs[row])
        top1 = [depth[0]["id"] for depth in depths if depth]
        draft_row = [int(token) for token in drafts[row]]
        push_proposal(
            {
                "top": depths,
                "top1": top1,
                "seq": seq,
                "draft": draft_row,
            }
        )


def push_proposal(proposal: dict) -> None:
    _QUEUE.append(proposal)
    del _QUEUE[:-_QUEUE_CAP]


def pop_match(draft_ids: list[int]) -> dict | None:
    """Match the tokens that were actually drafted.

    topk's first index can differ from argmax on a tie, so the stored draft
    row is the one the verifier will see. top1 is the fallback.
    """
    want = [int(token) for token in draft_ids]
    for index, proposal in enumerate(_QUEUE):
        for key in ("draft", "top1"):
            got = [int(token) for token in proposal.get(key, [])]
            if len(got) >= len(want) and got[: len(want)] == want:
                return _QUEUE.pop(index)
    return None


def summarize_step(draft_ids: list[int], verify_ids: list[int], proposal: dict | None) -> dict:
    """One greedy verify step. Rank is 1-based inside the draft top-8."""
    draft = [int(token) for token in draft_ids]
    verify = [int(token) for token in verify_ids]
    count = min(len(draft), len(verify))
    miss = None
    for index in range(count):
        if draft[index] != verify[index]:
            miss = index
            break
    positions = []
    tops = proposal.get("top") if proposal else None
    for index in range(count):
        choices = tops[index] if tops is not None and index < len(tops) else None
        rank_of = None
        margin = None
        top1_prob = None
        top2_prob = None
        top_ids = []
        if choices:
            top_ids = [int(item["id"]) for item in choices]
            if verify[index] in top_ids:
                rank_of = top_ids.index(verify[index]) + 1
            if len(choices) >= 2:
                margin = round(float(choices[0]["logit"]) - float(choices[1]["logit"]), 5)
                top1_prob = float(choices[0]["prob"])
                top2_prob = float(choices[1]["prob"])
        positions.append(
            {
                "i": index,
                "draft": draft[index],
                "verify": verify[index],
                "match": draft[index] == verify[index],
                "after_miss": miss is not None and index > miss,
                "rank": rank_of,
                "margin": margin,
                "top1_prob": top1_prob,
                "top2_prob": top2_prob,
                "top": top_ids,
            }
        )
    n_accept = miss if miss is not None else count
    return {
        "seq": None if proposal is None else proposal.get("seq"),
        "matched_proposal": proposal is not None,
        "n_draft": count,
        "n_accept": n_accept,
        "committed": n_accept + 1,
        "miss": miss,
        "positions": positions,
    }


def label_miss(position: dict) -> str:
    """One label per miss. Rank-2/3 wins over the margin description."""
    found = position.get("rank")
    margin = position.get("margin")
    top1 = position.get("top1_prob")
    top2 = position.get("top2_prob")
    near = False
    if margin is not None and margin < 0.5:
        near = True
    if top1 is not None and top2 is not None and (top1 - top2) < 0.05:
        near = True
    if found in (2, 3):
        return "rank2" if found == 2 else "rank3"
    if near:
        return "near_tie_outside_top3"
    if top1 is not None and top1 >= 0.6:
        return "confident_wrong"
    if found is None:
        return "outside_top8"
    return "moderate_outside_top3"


def valid_positions(record: dict) -> list[dict]:
    """Draft positions conditioned on a prefix the verifier has agreed with.

    The miss itself is included. Tokens after it were drafted from the
    rejected token and are not a legal branch.
    """
    miss = record.get("miss")
    kept = []
    for position in record.get("positions", []):
        if position.get("after_miss"):
            continue
        if miss is not None and position["i"] > miss:
            continue
        kept.append(position)
    return kept


def swap_counts(records: list[dict], tau: float) -> dict:
    """Immediate-token outcome of replacing top-1 when the draft margin is below tau.

    Counted only on the valid prefix. This does not credit extra tokens a
    redrawn suffix might have earned.
    """
    counts = {"top1": 0, "top2": 0, "top3": 0, "other": 0, "positions": 0}
    for record in records:
        for position in valid_positions(record):
            margin = position.get("margin")
            if margin is None or margin >= tau:
                continue
            counts["positions"] += 1
            found = position.get("rank")
            if found == 1:
                counts["top1"] += 1
            elif found == 2:
                counts["top2"] += 1
            elif found == 3:
                counts["top3"] += 1
            else:
                counts["other"] += 1
    return counts


def draft_positions(
    draft_ids: list[int],
    verify_ids: list[int],
    local_pos: list[int],
    cu_num_logits: list[int],
    num_speculative_steps: int,
) -> list[tuple[list[int], list[int]]]:
    """Pair each draft with the verifier argmax that is checked against it.

    V2 greedy rejection loads the draft id from the next logit row
    (draft_sampled[logit_idx + 1]) and the target argmax from logit_idx.
    local_pos 0 is the previously sampled token. local_pos == K holds the
    last draft id and is not a verifier distribution. A negative id is a
    placeholder and ends the row.
    """
    rows: list[tuple[list[int], list[int]]] = []
    if num_speculative_steps <= 0:
        return rows
    limit = min(len(draft_ids), len(verify_ids), len(local_pos))
    for req in range(max(0, len(cu_num_logits) - 1)):
        start = int(cu_num_logits[req])
        stop = int(cu_num_logits[req + 1])
        by_pos: dict[int, tuple[int, int]] = {}
        for index in range(start, stop):
            if index < 0 or index >= limit:
                continue
            pos = int(local_pos[index])
            if pos < 0:
                continue
            by_pos[pos] = (int(draft_ids[index]), int(verify_ids[index]))
        draft_row: list[int] = []
        verify_row: list[int] = []
        for depth in range(num_speculative_steps):
            if depth not in by_pos or (depth + 1) not in by_pos:
                break
            draft = by_pos[depth + 1][0]
            if draft < 0:
                break
            draft_row.append(draft)
            verify_row.append(by_pos[depth][1])
        if draft_row:
            rows.append((draft_row, verify_row))
    return rows


def _cpu_list(value) -> list:
    current = value
    if hasattr(current, "detach"):
        current = current.detach()
    if hasattr(current, "to"):
        current = current.to("cpu")
    if hasattr(current, "tolist"):
        current = current.tolist()
    return list(current)


def verify_v2(
    processed_logits,
    draft_sampled,
    cu_num_logits,
    expanded_local_pos,
    num_speculative_steps: int,
) -> None:
    if not enabled():
        return
    try:
        _verify_v2(
            processed_logits,
            draft_sampled,
            cu_num_logits,
            expanded_local_pos,
            num_speculative_steps,
        )
    except Exception as exc:
        _err(exc)


def _verify_v2(
    processed_logits,
    draft_sampled,
    cu_num_logits,
    expanded_local_pos,
    num_speculative_steps: int,
) -> None:
    if _capturing():
        return
    shape = getattr(processed_logits, "shape", None)
    ndim = getattr(processed_logits, "ndim", None)
    if ndim != 2 or shape is None or len(shape) != 2:
        return
    # The flattened verify tensor is one row per scheduled token, not one
    # row per request. 8 sequences times 7 positions is 56. The per-step
    # draft note still uses the smaller batch cap.
    if int(shape[0]) > 256 or int(shape[-1]) > 400000:
        return
    chosen = [
        int(token)
        for token in _cpu_list(processed_logits.float().argmax(dim=-1))
    ]
    drafts = [int(token) for token in _cpu_list(draft_sampled)]
    positions = [int(token) for token in _cpu_list(expanded_local_pos)]
    bounds = [int(token) for token in _cpu_list(cu_num_logits)]
    if rank() != 0:
        return
    now = time.time()
    for draft_row, verify_row in draft_positions(
        drafts, chosen, positions, bounds, int(num_speculative_steps)
    ):
        proposal = pop_match(draft_row)
        record = summarize_step(draft_row, verify_row, proposal)
        record["t"] = now
        _write(record)


def verify(draft_token_ids, target_argmax, num_draft_tokens) -> None:
    if not enabled():
        return
    try:
        _verify(draft_token_ids, target_argmax, num_draft_tokens)
    except Exception as exc:
        _err(exc)


def _verify(draft_token_ids, target_argmax, num_draft_tokens) -> None:
    if _capturing():
        return
    drafts = [int(token) for token in draft_token_ids.detach().to("cpu").tolist()]
    chosen = [int(token) for token in target_argmax.detach().to("cpu").tolist()]
    if rank() != 0:
        return
    offset = 0
    now = time.time()
    for raw_count in num_draft_tokens:
        count = int(raw_count)
        draft_row = drafts[offset : offset + count]
        verify_row = chosen[offset : offset + count]
        offset += count
        if count <= 0 or any(token < 0 for token in draft_row):
            continue
        proposal = pop_match(draft_row)
        record = summarize_step(draft_row, verify_row, proposal)
        record["t"] = now
        _write(record)


def _write(record: dict) -> None:
    global _ANNOUNCED
    path = os.environ.get("MTP_TOPK_FILE")
    if not path:
        return
    line = json.dumps(record, separators=(",", ":"))
    with open(path, "a", encoding="utf-8") as handle:
        handle.write(line + "\n")
    if not _ANNOUNCED:
        _ANNOUNCED = True
        sys.stderr.write("[mtp_topk] writing %s\n" % path)
