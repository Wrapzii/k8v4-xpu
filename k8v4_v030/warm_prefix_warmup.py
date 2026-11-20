"""Optional startup warmup of the warm-prefix multi-user path (``K8V4_WARMUP_WARM_PREFIX``).

Measured reason (config F, one B70, 2026-11-20): the first round of 4 users sending a new turn on warm ~63K
prefixes took 2.3-4.3 s to the first token, every later round 1.30-1.37 s. vLLM's own JIT warmup
(``warmup_kernels``) prefills short prompts from an empty prefix, all requests in one step, so serving pays,
inside that first round (py-spy, --nonblocking):
  - the Triton JIT of the K8/V4 prefill gather for a long context whose length is not a multiple of 16 (~1.2 s);
  - the Triton JIT of the deferred-commit kernels for a batch that mixes prefilling and decoding requests (the
    spec requests' state slots are then a contiguous subset, a stride-1 specialization; ~1.0 s);
  - the oneDNN SDPA kernel for a short query over a long cached context (``libk8v4_sdpa.so`` builds one per
    shape class, 0.55-0.87 s; later context lengths of the class reuse it in ~6 ms).
With ``K8V4_WARMUP_WARM_PREFIX=1`` (default 0: startup unchanged) startup runs, for every draft depth of the
batch-size table (or the one configured depth), that many requests with a new turn on a long cached context
(garbage KV, as vLLM's ``run_context_prefill_warmup`` does), arriving staggered as in a first multi-user round
(one prefills alone, the rest prefill while it decodes, then all decode at that depth), through
the worker's real ``execute_model`` / ``sample_tokens``. Nothing is kept; serving results are bit-identical.
Called from vLLM's ``compile_or_warm_up_model`` right after its ``warmup_kernels`` (before graph capture).
"""

from __future__ import annotations

import os
import time

ENV = "K8V4_WARMUP_WARM_PREFIX"
CTX_ENV = "K8V4_WARMUP_WARM_PREFIX_CTX"
DEFAULT_CTX = 63000
QUERY_LEN = 100  # a new turn's uncached suffix: one 256-row query bucket of the oneDNN prefill
DECODE_STEPS = 3


def enabled() -> bool:
    value = os.environ.get(ENV, "0").strip() or "0"
    if value not in ("0", "1"):
        raise RuntimeError("%s must be 0 or 1, got %r" % (ENV, value))
    return value == "1"


def context_tokens() -> int:
    raw = os.environ.get(CTX_ENV, "").strip()
    if raw == "":
        return DEFAULT_CTX
    if not raw.isdigit() or int(raw) < 1:
        raise RuntimeError("%s must be a positive integer, got %r" % (CTX_ENV, raw))
    return int(raw)


def depth_batches(per_batch, num_spec: int, max_seqs: int) -> list[tuple[int, int]]:
    """(draft depth, request count) pairs to warm: the largest batch of every depth in the table.

    ``per_batch`` is vLLM's ``num_speculative_tokens_per_batch_size`` ([[lo, hi, depth], ...]) or None.
    """
    if not per_batch:
        return [(int(num_spec), int(max_seqs))]
    best: dict[int, int] = {}
    for entry in per_batch:
        lo, hi, depth = (int(x) for x in entry)
        if lo > max_seqs:
            continue
        best[depth] = max(best.get(depth, 0), min(hi, max_seqs))
    return sorted(((d, n) for d, n in best.items() if n >= 1), key=lambda x: (-x[1], x[0]))


def _run_one(model_runner, execute_model, sample_tokens, num_reqs: int, depth: int, ctx: int) -> int:
    from vllm import SamplingParams
    from vllm.v1.core.sched.output import CachedRequestData, NewRequestData, SchedulerOutput
    from vllm.v1.worker.extensible_kv_cache import ensure_kv_cache_blocks, num_committable_kv_blocks
    from vllm.v1.worker.gpu import warmup as vw

    specs = [g.kv_cache_spec for g in model_runner.kv_cache_config.kv_cache_groups]
    block_count = vw._warmup_block_counter(model_runner)
    ctx = min(ctx, model_runner.max_model_len - QUERY_LEN - (DECODE_STEPS + 1) * (depth + 1) - 1)
    if ctx < 1:
        return 0
    end = ctx + QUERY_LEN + DECODE_STEPS * (depth + 1)
    per_req = max(sum(block_count(end, s) for s in specs), 1)
    num_reqs = min(num_reqs, (num_committable_kv_blocks(model_runner) - 1) // per_req)
    if num_reqs < 1:
        return 0
    ensure_kv_cache_blocks(model_runner, 1 + num_reqs * per_req)
    next_block = [1]

    def alloc(n):
        first = next_block[0]
        next_block[0] += n
        return list(range(first, first + n))

    req_ids = ["_k8v4_warm_prefix_%d_%d_" % (depth, i) for i in range(num_reqs)]
    tokens = vw._warmup_token_ids(model_runner, ctx + QUERY_LEN)
    held = [[block_count(ctx + QUERY_LEN, s) for s in specs] for _ in req_ids]
    computed = [ctx] * num_reqs
    started = []

    def step(new: list[int]) -> None:
        """One step: the started requests decode `depth` drafts deep, the `new` ones prefill their turn."""
        out = SchedulerOutput.make_empty()
        out.num_spec_tokens_to_schedule = depth
        out.scheduled_new_reqs = [
            NewRequestData(req_id=req_ids[i], prompt_token_ids=tokens, mm_features=[],
                           sampling_params=SamplingParams(temperature=0.0, max_tokens=64), pooling_params=None,
                           block_ids=tuple(alloc(n) for n in held[i]), num_computed_tokens=ctx, lora_request=None,
                           prefill_token_ids=tokens)
            for i in new
        ]
        cached = CachedRequestData.make_empty()
        cached.req_ids = [req_ids[i] for i in started]
        cached.num_computed_tokens = [computed[i] for i in started]
        cached.num_output_tokens = [1] * len(started)
        cached.new_block_ids = []
        for i in started:
            after = [block_count(computed[i] + depth + 1, s) for s in specs]
            delta = [a - h for a, h in zip(after, held[i])]
            cached.new_block_ids.append(tuple(alloc(max(d, 0)) for d in delta) if any(delta) else None)
            held[i] = [max(a, h) for a, h in zip(after, held[i])]
        out.scheduled_cached_reqs = cached
        sched = {req_ids[i]: depth + 1 for i in started}
        sched.update({req_ids[i]: QUERY_LEN for i in new})
        out.num_scheduled_tokens = sched
        out.scheduled_spec_decode_tokens = {req_ids[i]: [0] * depth for i in started} if depth else {}
        out.total_num_scheduled_tokens = sum(sched.values())
        vw._run_step(execute_model, sample_tokens, out)
        for i in started:
            computed[i] += depth + 1
        for i in new:
            computed[i] += QUERY_LEN
        started.extend(new)

    # Requests arrive as in a first multi-user round: one turn prefills alone, the rest prefill in a step where
    # it already decodes (the mixed commit takes the spec requests' state slots as a contiguous subset, a
    # separate Triton specialization), then all of them decode.
    phases = [[0]] + ([list(range(1, num_reqs))] if num_reqs > 1 else []) + [[]] * DECODE_STEPS
    model_runner.kv_connector.set_disabled(True)
    steps = 0
    try:
        for new in phases:
            step(new)
            steps += 1
    finally:
        cleanup = SchedulerOutput.make_empty()
        cleanup.finished_req_ids = set(req_ids)
        execute_model(cleanup)
        model_runner.kv_connector.set_disabled(False)
    return steps


def maybe_warmup(worker) -> None:
    """compile_or_warm_up_model hook: the warm-prefix multi-user path when K8V4_WARMUP_WARM_PREFIX=1."""
    if not enabled():
        return
    import torch

    runner = worker.model_runner
    spec = runner.speculative_config
    per_batch = getattr(spec, "num_speculative_tokens_per_batch_size", None) if spec is not None else None
    num_spec = int(getattr(runner, "num_speculative_steps", 0) or 0)
    pairs = depth_batches(per_batch, num_spec, worker.scheduler_config.max_num_seqs)
    ctx = context_tokens()
    start = time.perf_counter()
    done = []
    from vllm.v1.worker.gpu.warmup import _fixed_draft_counts

    with _fixed_draft_counts(runner):
        for depth, num_reqs in pairs:
            t = time.perf_counter()
            steps = _run_one(runner, worker.execute_model, worker.sample_tokens, num_reqs, depth, ctx)
            done.append("%d req x depth %d: %d steps %.1fs" % (num_reqs, depth, steps, time.perf_counter() - t))
    if runner.speculator is not None:
        runner.speculator.reset_state()
    torch.accelerator.synchronize()
    print("[k8v4-warm-prefix-warmup] context %d + %d new tokens: %s; total %.1fs"
          % (ctx, QUERY_LEN, "; ".join(done), time.perf_counter() - start), flush=True)
