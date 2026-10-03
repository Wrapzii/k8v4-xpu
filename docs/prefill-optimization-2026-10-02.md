# Prefill optimization, 2026-10-02

Runtime audit correction: these vLLM 0.30 comparisons used W4A16 GEMMs despite the requested W4A8 environment setting. The missing installer is fixed in the [subsequent wiring report](w4a8-wiring-2026-10-02.md); the timings here remain measurements of the earlier path.

The fused paged gather reduces GPU temporary memory. The small full-model speed differences below do **not** establish a repeatable throughput gain. In particular, similar numbers were already observed with the larger scheduler batch cap; those changes must not be added together as independent gains.

## Fused paged gather

`K8V4_PREFILL_GATHER=triton` selects `k8v4_v030/prefill_gather_triton.py` on XPU. The published launcher now defaults to `triton`; set the selector to `torch` for the reference path. The server uses Triton with the original 4,224 scheduler cap.

A single Triton kernel gathers a logical KV head from paged region-major storage, unpacks V nibbles, and applies the existing K scale and V affine scale/zero in fp32. It writes the same floating-point K/V tensors needed by oneDNN attention. Floating-point fusion is disabled to preserve rounding. The token count is a runtime argument, avoiding a separate gather compilation for every context length.

The old gather also ran on the GPU. This change removes intermediate GPU int32/fp32 tensors and memory passes; it does not introduce CPU offloading, change weights, alter the cache representation, or change decode attention. The final floating-point head is still materialized for oneDNN.

On both B60s, checks covered manager-page ratios 1 and 33, both KV heads, partial pages, permuted blocks, nibble extremes, and fp16/bf16/fp32 outputs. All 144 head/dtype comparisons were bitwise equal. The CPU reference suite also passed with both selectors; CPU keeps the reference path.

At 200K tokens, the **bf16 microbenchmark** allocated peak temporary storage of 926,109,184 bytes with the original gather versus 205,520,896 bytes with the fused gather: about 687 MiB less per head. The served oneDNN path uses fp16. Microbenchmark kernel timings are not whole-model speedups.

## Existing full-model observations

These measurements were completed before the request to stop context sweeps. No additional context sweep is planned. Same checkpoint, scheduler cap 4,224, TP2, six MTP draft tokens, native K8/V4 decode, thinking disabled, temperature zero, concurrency one. Each fresh request had zero cached prompt tokens. Prefill here is prompt tokens / time to first streamed token, including serving overhead.

| Fresh prompt | Original gather TTFT | Fused gather TTFT | Original tok/s | Fused tok/s |
| --- | ---: | ---: | ---: | ---: |
| 64,197 | 46.971 s | 46.831 s | 1,366.7 | 1,370.8 |
| 128,197 | 115.409 s | 110.810 s | 1,110.8 | 1,156.9 |
| 200,191 | 219.127 s | 207.848 s | 913.6 | 963.2 |

These are single fresh observations, not a randomized repeated comparison. Clock, compilation, cache, and runtime variation can affect them. Treat the memory reduction as established and the throughput changes as provisional. The 8K fresh request included startup compilation and is excluded from this comparison.

All 12 generated coding answers in the fused-gather run passed syntax and interval-merging behavior checks and stopped naturally. This is a focused correctness probe, not a general model-quality evaluation. Startup reported the same 869,121 KV token capacity / 13.09 GiB cache as the original 4,224-cap deployment. A subsequent conversation-overlap run was interrupted at the user's request and provides no completed aggregate result.

Cached requests divide total prompt size, including reused tokens, by TTFT. Their apparent 20Kâ€“30K tok/s does not measure newly computed prefill and is not a new gain from this kernel.

## Receipts

- `results/2026-10-02/prefill-optimization/gather-micro-final.jsonl`: exact deployed gather variant, independent oracle checks and kernel memory/timing results.
- `results/2026-10-02/prefill-optimization/gather-c1.jsonl`: complete generated answers, SSE timing, cached/computed token counts and quality checks.
- `bench/prefill_gather.py`: standalone synthetic XPU gather probe; requires the same Triton/XPU runtime, no model weights.

For a focused micro-check: `python -m bench.prefill_gather --lengths 128000 --devices 0,1`. Tests for the CPU reference: `python -m unittest k8v4_v030.tests.test_onednn_prefill`.

## Asynchronous SDPA trial: no cold-prefill gain

The second candidate removes the per-head `engine.stream.wait()` when `K8V4_SDPA_ASYNC=1`. Host length scalars are stored in stable, immutable partition entries instead of stack variables. It requires an in-order current XPU queue; default `0` retains the wait. This is an experimental opt-in, **not enabled in the restored serving configuration**.

The paired GPU probe compared against the original SDPA library on each GPU, with identical synthetic FP16 tensors. All six shapes per GPU and 60 buffer-retirement/reuse stress requests per GPU matched the original bitwise. In `sdpa-checks.jsonl`, baseline `bitwise_equal=false` marks the reference-generation mode, not a failed comparison; candidate rows contain the actual equality assertion. These checks cover the serving queue pattern and fixed scale, not arbitrary concurrent multi-stream callers.

A short 8K request warmed startup compilation, then only the 128K coding case was tested at concurrency one:

| Configuration | Fresh prompt | Cached tokens | TTFT | Fresh effective prefill |
| --- | ---: | ---: | ---: | ---: |
| Fused gather + original synchronous SDPA | 128,197 | 0 | 110.810 s | 1,156.9 tok/s |
| Fused gather + asynchronous SDPA | 128,197 | 0 | 110.795 s | 1,157.1 tok/s |

This is effectively identical: about 0.014% elapsed-time difference, far below a persuasive throughput improvement. The asynchronous candidate was rolled back. One cached follow-up took 4.446 s with 124,608 cached tokens; that is not cold-prefill performance. Both coding outputs passed syntax and behavior checks and stopped naturally. Decode was 78.55 tok/s fresh and 71.97 tok/s cached, with differing generated answers; these observations do not establish a decode improvement or regression.

At q=4,224 / KV=128,000, the standalone attention pipeline took about 66 ms per head with either mode. Removing host waits reduces overhead for short attention calls but does not remove the long-context GPU computation. The 2,000 fresh-prefill tok/s target at 128K has **not** been reached. Scheduler tuning and host-wait removal do not explain a large speedup; GPU attention/GEMM work remains the next optimization target.

`k8v4_v030/compile_sdpa_host.sh` reproduces the experimental library using g++ and the serving image's matching SYCL headers/runtime. This compiles host glue only; it does not build device kernels or change `libxe2_kv`. The existing Intel compiler build remains available. The trial library SHA-256 is recorded with the pinned image and unchanged decode SHA in `async-trial-configuration.json`. Mount the generated library at `/opt/k8v4/libk8v4_sdpa.so` before selecting the async flag; an older library ignores that flag.

Additional receipts:

- `results/2026-10-02/prefill-optimization/sdpa-checks.jsonl`: paired SDPA equality, lifetime stress and timings.
- `results/2026-10-02/prefill-optimization/async-c1-128k.jsonl`: single fresh 128K request and one cached follow-up.
- `results/2026-10-02/prefill-optimization/async-trial-configuration.json`: sanitized experimental configuration; not the restored production configuration.
- `bench/prefill_sdpa.py`: reference/candidate probe, run once per GPU per mode with a separate saved synthetic fixture.

The restored server keeps fused gather, synchronous SDPA, scheduler cap 4,224, native decode and the existing weights. Room gateways and CI remain paused for the user's testing window.
