# MTP6 verifier with 8-KiB shared memory

`XE2_KV_COMPACT_SLM=1` selects the compact first-stage kernel for exactly seven query tokens. Other query counts use the existing kernel, including the subgroup-parallel one-token drafter. Set the flag before server startup/graph capture; its default is off. The same library supports two KV heads per TP2 rank and four on TP1.

The original verifier allocates 24 KiB of shared memory for its score/probability/V tiles. The compact variant computes the 64-key QK tile in two 32-column halves, retains the first half's scaled logits, and packs probabilities after all score reads finish. Four named probability matrices are then loaded into registers. After a workgroup barrier, their shared-memory storage can be reused for a 64-column V tile. This keeps the entire shared allocation at 8 KiB.

Dot products, causal masking, affine V dequantization, softmax reduction order, PV accumulation order, output format and cache layout remain the same. Cross-subgroup score-to-probability and probability-to-V handoffs require workgroup barriers. Named matrices deliberately avoid the previously observed compiler problems with arrays of `joint_matrix` objects.

The deployed-library comparison passed exact output equality on synthetic disjoint-page C1/C2/C4 cases at 131072 and 200001 tokens, including the partial final page. The existing six XPU tests passed for both head layouts. A seventh regression toggles the compact flag on fixed data with shuffled physical pages, explicit per-query visibility and NaNs in unused metadata, at 8001/70000 tokens and query counts 1/2/7. This verifies the unchanged fallback as well as the optimized verifier. These are kernel correctness results, not a broad model-quality evaluation.

Same-process graph replay uses seven rotated-order samples of 32 replays. At 200001 tokens/C4 the final library's baseline verifier measured **7.259 ms** and compact verifier **6.354 ms**, a **12.5% latency reduction**. The one-token kernel is unchanged. Do not equate this attention-operation improvement with an equal end-to-end token-rate improvement.

Resource diagnostics first identified approximately 50% thread occupancy in the baseline. The intermediate 16-KiB version raised measured occupancy to about 71% with almost unchanged instruction counts. That version improved verifier latency, but the final reuse variant was faster. An earlier 8-KiB variant with narrow V tiles was also correct, but its extra synchronization made it slower than the final variant. Losing variants are not included in the serving source.

The matched endpoint comparison used 131146 actual prompt tokens, three trials per concurrency, 384 output tokens, temperature zero, seed 12345 and thinking disabled. Both variants completed all nine groups without preemptions or detected outside traffic. Median shared steady-window rates:

| Concurrency | Baseline per stream | Compact per stream | Baseline combined | Compact combined |
|---|---:|---:|---:|---:|
| 1 | 89.2 | 79.2 | 89.2 | 79.2 |
| 2 | 58.1 | 58.5 | 116.3 | 116.9 |
| 4 | 34.0 | 36.1 | 136.0 | 144.6 |

Rates are tokens/s. This is about a 6% C4 improvement, a negligible C2 improvement, and an 11% raw C1 regression. **The concurrency problem is not fixed.** C1 draft acceptance also fell from 0.673 to 0.551; C2 changed from 0.668 to 0.643 and C4 from 0.609 to 0.629. Generated histories varied even in same-setting repeats, so the acceptance change cannot be confidently attributed to or dismissed as unrelated to the library. This needs a separate fidelity/acceptance investigation.

An acceptance-adjusted cycle proxy decreased from 56.50/86.00/136.93 ms to 54.54/81.51/132.68 ms. It uses whole-batch acceptance rather than acceptance aligned to the steady window and is not an exact iteration profile. The single deterministic code workload does not establish a universal model-speed or quality result. Shared steady windows exclude approximately 2.63-second cached-prefix-tail prefill gaps in C2/C4; total user-visible latency still includes them. Full outputs, counter snapshots and event timelines are retained.

The compact library is left serving because its native operation cost is lower, kernel equality checks passed, and measured C4 throughput improved. It is the best validated kernel candidate from this investigation, not a proven best configuration for every user workload. The original container and library remain available for rollback.

Receipts, compiler hashes, profiler source pin, raw counters, native parity/timing rows and the guarded switch are under `audit/model-validation/launch80-20261013/perf-resources-20261014` in the working workspace and the corresponding server audit directory. The previous q1/FP16-partial build is retained as the rollback baseline.

Evening of the same day did not replace this library. Live 8100 is still compact `ffe0e5a1…`. 200K C1/C2/C4 prefix-share serving numbers and rejected concurrency candidates: `docs/2026-10-14-evening-concurrency.md` and `audit/model-validation/launch80-20261013/HANDOFF_CONCURRENCY_2026-10-14_CURRENT.md`.

Intel's [unitrace documentation](https://github.com/intel/pti-gpu/blob/pti-1.0.0/tools/unitrace/README.md) describes the resource and hardware-counter diagnostics used here. Hardware-counter collection used a separate diagnostic container with profiling capabilities; the host's observation policy was not changed. The profiler's static SLM property excludes this kernel's dynamic local accessor, so its zero static-SLM field must not be read as zero shared-memory use.
