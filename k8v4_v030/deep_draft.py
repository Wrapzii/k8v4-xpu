"""Deep copy drafting for one request: MTP plus n-gram copies (``K8V4_DEEP_DRAFT``).

Agent output often copies from its own context (file edits, quoted code,
tool results). When the last tokens occur earlier in the request, the
tokens that followed them there are a far better draft than MTP's, and a
long one: our B70 stack drafts 15 copied tokens per step on a match (-23:
one-user copy/edit output 177-186 -> 280-351 tok/s, lossless).

``K8V4_DEEP_DRAFT=lo,hi`` (n-gram lengths, e.g. ``12,16``) with a speculative
config of ``num_speculative_tokens`` = the deep depth (e.g. 15):

- the scheduler schedules the deep depth for a single running request only
  while its output is copying (its last ``lo`` tokens occur earlier, held for
  one more step), otherwise ``K8V4_DEEP_MTP_DEPTH`` (default 6): plain MTP
  depth, so ordinary text keeps today's verify width;
- at the deep depth the speculator runs the GPU n-gram lookup in front of the
  draft prefill; on a full-length match the copied tokens replace the MTP
  drafts and the MTP decode steps are skipped (one host read of the flag);
- two or more running requests keep the configured or per-batch depth.

The target verifies every draft token, so outputs are unchanged (lossless).
Verifying depth 15 needs 16 query rows per request: on the K8/V4 decode
kernel that is ``K8V4_VERIFY_CHUNK`` (k8v4_v030/verify_chunk.py). The
graph capture list needs the deep width (16) next to the MTP width (7).
Note: vLLM reserves one GDN state block per draft position per running
request (depth 15 = 16 blocks each), so this suits ``K8V4_MAX_SEQS=1`` (the
TP1 default); our per-request state-block trimming is not ported.
Unset (the default) changes nothing.
"""

from __future__ import annotations

import os
from typing import Any

ENV_NAME = "K8V4_DEEP_DRAFT"
DEPTH_ENV = "K8V4_DEEP_MTP_DEPTH"
COPY_HOLD_STEPS = 2


def ngram_range(environ: dict[str, str] | None = None) -> tuple[int, int] | None:
    """``(lo, hi)`` from ``K8V4_DEEP_DRAFT=lo,hi`` (or ``n``); None when unset."""
    source = os.environ if environ is None else environ
    raw = source.get(ENV_NAME, "").strip()
    if not raw:
        return None
    lo_s, sep, hi_s = raw.partition(",")
    if not lo_s.isdigit() or (sep and not hi_s.isdigit()):
        raise RuntimeError("%s must be lo,hi n-gram lengths (e.g. 12,16), got %s" % (ENV_NAME, raw))
    lo = int(lo_s)
    hi = int(hi_s) if hi_s else lo
    if lo < 2 or hi < lo or hi > 64:
        raise RuntimeError("%s needs 2 <= lo <= hi <= 64, got %s" % (ENV_NAME, raw))
    return lo, hi


def mtp_depth(environ: dict[str, str] | None = None) -> int:
    source = os.environ if environ is None else environ
    raw = source.get(DEPTH_ENV, "6").strip() or "6"
    if not raw.isdigit() or int(raw) < 1:
        raise RuntimeError("%s must be a positive int, got %s" % (DEPTH_ENV, raw))
    return int(raw)


class CopyTracker:
    """Is a request's output copying from its own context? (host side, numpy)

    True while its last ``n`` tokens also occur earlier in its tokens, and on
    the step after the last such match (a hold of ``COPY_HOLD_STEPS`` counting
    the matching step: the scheduler runs one step ahead of the drafter). Tokens are appended
    incrementally into a per-request buffer, so a step costs one vectorised
    scan of the history.
    """

    def __init__(self, n: int):
        self.n = int(n)
        self._buf: dict[str, Any] = {}
        self._hold: dict[str, int] = {}

    def forget_missing(self, live: Any) -> None:
        for key in [k for k in self._buf if k not in live]:
            self._buf.pop(key, None)
            self._hold.pop(key, None)

    def copying(self, req_id: str, tokens: Any, has_output: bool) -> bool:
        import numpy as np

        n_tok = len(tokens)
        entry = self._buf.get(req_id)
        if entry is None or entry[1] > n_tok:
            buf = np.empty(max(2 * n_tok, 8192), dtype=np.int64)
            filled = 0
            self._hold[req_id] = 0
        else:
            buf, filled = entry
            if n_tok > buf.shape[0]:
                grown = np.empty(2 * n_tok, dtype=np.int64)
                grown[:filled] = buf[:filled]
                buf = grown
        if n_tok > filled:
            buf[filled:n_tok] = tokens[filled:n_tok]
        self._buf[req_id] = (buf, n_tok)
        k = self.n
        hit = False
        if has_output and n_tok > 2 * k:
            cand = np.flatnonzero(buf[: n_tok - k] == buf[n_tok - k])
            for j in range(1, k):
                if not cand.size:
                    break
                cand = cand[buf[cand + j] == buf[n_tok - k + j]]
            hit = bool(cand.size)
        hold = self._hold.get(req_id, 0)
        hold = COPY_HOLD_STEPS if hit else max(0, hold - 1)
        self._hold[req_id] = hold
        return hit or hold > 0


def scheduled_depth(scheduler: Any, num_scheduled_tokens: dict, k: int) -> int:
    """Scheduler hook: the draft depth for the step being scheduled.

    Unset: ``k`` unchanged. One running request that is not copying: the MTP
    depth (when below ``k``).
    """
    state = getattr(scheduler, "_k8v4_deep", None)
    if state is None:
        rng = ngram_range()
        state = (rng is not None, CopyTracker(rng[0]) if rng else None, mtp_depth() if rng else 0)
        scheduler._k8v4_deep = state
    on, tracker, depth = state
    if not on or len(num_scheduled_tokens) != 1 or not (0 < depth < k):
        return k
    req_id = next(iter(num_scheduled_tokens))
    request = scheduler.requests.get(req_id)
    if request is None:
        return k
    if len(tracker._buf) > 32:
        tracker.forget_missing(scheduler.requests)
    tokens = getattr(request, "_all_token_ids", None)
    if tokens is None:
        tokens = request.all_token_ids
    if tracker.copying(req_id, tokens, request.num_output_tokens > 0):
        return k
    return depth


def extra_query_lens(query_lens: dict, num_speculative_tokens: int, num_new_sampled: int) -> dict:
    """Capture-list hook: a lone request may verify at the MTP depth, which no schedule row lists."""
    if ngram_range() is None:
        return query_lens
    depth = mtp_depth()
    if 0 < depth < int(num_speculative_tokens):
        query_lens.setdefault(depth + int(num_new_sampled), 1)
    return query_lens


def maybe_speculator(vllm_config: Any, device: Any, req_states: Any) -> Any:
    """``init_speculator`` hook: the MTP + n-gram speculator, or None (stock path)."""
    rng = ngram_range()
    if rng is None:
        return None
    spec = vllm_config.speculative_config
    if spec is None or spec.method != "mtp":
        raise RuntimeError("%s needs --speculative-config method mtp" % ENV_NAME)
    if not spec.num_speculative_tokens_per_batch_size:
        # Without a schedule the scheduler pads new decodes to the full (deep) width.
        raise RuntimeError(
            "%s needs num_speculative_tokens_per_batch_size, e.g. [[1,1,15],[2,4,3]]" % ENV_NAME
        )
    return _speculator_class()(vllm_config, device, req_states, rng[0], rng[1], mtp_depth())


_CLASS = None


def _speculator_class():
    global _CLASS
    if _CLASS is not None:
        return _CLASS
    import torch

    from vllm.v1.worker.gpu.spec_decode.mtp.speculator import MTPSpeculator

    from k8v4_v030.ngram_lookup import NgramLookup, write_one_hot_draft_logits

    class NgramMTPSpeculator(MTPSpeculator):
        """MTP drafting that copies from the context on an n-gram match (one request)."""

        def __init__(self, vllm_config, device, req_states, min_n, max_n, depth):
            super().__init__(vllm_config, device)
            self.req_states = req_states
            self.ngram = NgramLookup(
                min_n, max_n, self.num_speculative_steps, self.max_num_reqs, self.max_model_len, device
            )
            self.k8v4_mtp_depth = depth
            self._pending = None
            self._matched = False
            self.ngram_stats = [0, 0]  # [lookups, full-length matches]
            print(
                "k8v4 deep drafting: n-gram %d..%d, depth %d on a copy, MTP depth %d otherwise"
                % (min_n, max_n, self.num_speculative_steps, depth),
                flush=True,
            )

        def k8v4_num_draft_steps(self, num_speculative_tokens: int) -> int:
            """Called after the draft prefill: 1 (skip the MTP decode steps) on a match."""
            pending = self._pending
            if pending is None:
                return num_speculative_tokens
            self._pending = None
            self._matched = bool(pending.all().item())
            self.ngram_stats[0] += 1
            self.ngram_stats[1] += self._matched
            return 1 if self._matched else num_speculative_tokens

        @torch.inference_mode()
        def propose(self, input_batch, attn_metadata, slot_mappings, last_hidden_states, aux_hidden_states,
                    num_sampled, num_rejected, last_sampled, next_prefill_tokens, temperature, seeds,
                    *args, **kwargs):
            depth = kwargs.get("num_speculative_tokens")
            if depth is None:
                depth = self.num_speculative_steps
            use_lookup = (
                input_batch.num_reqs == 1
                and not kwargs.get("dummy_run", False)
                and depth == self.num_speculative_steps
                and depth > 1
            )
            self._pending = None
            self._matched = False
            drafts = has_match = None
            if use_lookup:
                drafts, has_match = self.ngram.lookup(
                    self.req_states, input_batch.idx_mapping, num_sampled, last_sampled, input_batch.num_reqs
                )
                self._pending = has_match
            draft_tokens = super().propose(
                input_batch, attn_metadata, slot_mappings, last_hidden_states, aux_hidden_states,
                num_sampled, num_rejected, last_sampled, next_prefill_tokens, temperature, seeds,
                *args, **kwargs,
            )
            self._pending = None
            if not use_lookup or not self._matched:
                return draft_tokens
            draft_tokens.copy_(drafts)
            if self.draft_logits is not None:
                write_one_hot_draft_logits(self.draft_logits, input_batch.idx_mapping, has_match, drafts)
            return draft_tokens

    _CLASS = NgramMTPSpeculator
    return _CLASS
