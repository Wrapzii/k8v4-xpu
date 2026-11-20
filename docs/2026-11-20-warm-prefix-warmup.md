# First warm round warmup (`K8V4_WARMUP_WARM_PREFIX`), 2026-11-20

Opt-in, default off: with the knob unset the launch command and startup are unchanged.

## Why

On one Arc Pro B70 (Swift 1.5 27B, preset F, util 0.96, 4 sequences), the first round of 4 users sending a new
turn on warm ~63K prefixes took 2.3-4.3 s to the first token; every later round 1.30-1.37 s. vLLM's own JIT
warmup prefills short prompts from an empty prefix, all requests in one step, so the first real multi-user round
paid, inside the request (py-spy):

- the Triton JIT of the K8/V4 prefill gather for a long context whose length is not a multiple of 16 (~1.2 s);
- the Triton JIT of the deferred-commit kernels for a batch that mixes prefilling and decoding requests (the
  spec requests' state slots are then a contiguous subset, a stride-1 specialization; ~1.0 s);
- the oneDNN SDPA kernel for a short query over a long cached context (one build per shape class, 0.55-0.87 s).

## What it does

`K8V4_WARMUP_WARM_PREFIX=1` runs, right after vLLM's `warmup_kernels` (before graph capture), for every draft
depth of the batch-size table (or the one configured depth), that many requests with a 100-token new turn on a
long cached context (garbage KV, as vLLM's own context-prefill warmup does). The requests arrive staggered as in
a first multi-user round: one prefills alone, the others prefill while it decodes, then all decode at that depth.
Everything goes through the worker's real `execute_model` / `sample_tokens`; nothing is kept, so serving results
are bit-identical. `K8V4_WARMUP_WARM_PREFIX_CTX` (default 63000) sets the context length. The hook is an anchored,
idempotent splice of `v1/worker/gpu_worker.py` in `patch_installed_vllm.py` that refuses unknown source.

## Measured (one B70, preset F, same image, one run each)

| | warmup off | warmup on (one batch) | warmup on (staggered, final) |
|---|---:|---:|---:|
| warm TTFT, first 4-user round | 2.28 s | 1.65 s | 1.32-1.34 s |
| warm TTFT, 1 user | 0.45 s | 0.44 s | 0.47-0.51 s |
| cold 63K prefill | 1,972 tok/s | 1,979 tok/s | 1,937-1,966 tok/s |
| 4-user / 1-user decode step | 55.0 / 41.7 ms | 54.7 / 42.9 ms | 54.6-55.3 / 41.9-43.2 ms |
| start to ready | 116 s | 137 s | 107-152 s |

The first 4-user round now matches the steady state (1.30-1.37 s). Exact-answer check 8/9 in every run (the same
miss as without the knob). Decode and prefill are unchanged within run-to-run noise; startup varies with the
compile cache more than with the warmup itself.

## Tests

`k8v4_v030/tests/test_warm_prefix_warmup.py` (flag parsing, off path never touches the worker, depth table,
splice idempotence and refusal) and a `test_launch_profiles` case (passed only when set, bad values rejected).
`test_installed_vllm_is_patched` checks the vLLM inside the image, so it passes only in an image built from this
tree.
