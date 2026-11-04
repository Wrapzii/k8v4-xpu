# K8/V4 decode attention: where the long-context time goes (plan + current evidence)

Date: 2026-11-04. Status: **hypothesis report**. Items marked **[LIVE]** need data
from the sampled profiler; items marked **[BENCH]** need the offline microbench
(`tools/k8v4_attn_splits_bench.py`) in a GPU window. No kernel changes were made.

## 1. What runs per decode attention call (live lib, TP2 rank, HKV=2, GQA=6)

`int8k_int4v_attn_batch[_cascade]` (one op per uniform decode segment, serial over requests):

1. pack + int8-quantise Q into one `[HKV,64,256]` tile (per-row fp32 scale).
2. **Stage 1** `launch_int8k_int4v_s1_paged[_reuse]`: one work-group (8 sub-groups x 16 lanes)
   per **64-token page** per KV head. QK^T is int8 x int8 -> int32 on DPAS
   (`joint_matrix` 8x32 * 32x16), rescaled by `q_scale*k_scale/16`; softmax per page;
   V int4 is dequantised to fp16 into SLM, PV on fp16 DPAS. Writes per page a
   **64x256 partial** (fp32, or fp16 with `XE2_KV_PARTIAL_FP16=1`, live) + M/L.
3. **Stage 2** `launch_s2_parallel_half[_p16]`: merges all live page partials per
   query row, `NSG` sub-groups per row (live: draft 32, verify 8), 4-wide vector loads.

## 2. Existing measurements and what they already imply

| source | measurement |
| --- | --- |
| docs/historical-benchmarks.md:17 | padded 128K, q_len 7: op ~2668 us with serial S2, **~1743-1789 us** with parallel S2 |
| docs/historical-benchmarks.md:29,78 | step 40.5 ms at 2K, 71.9 ms at 128K (served stack) |
| RESULTS.md:9-14 | update gap 39.1 ms (2K) -> 70.1 ms (128K) -> 87.9 ms (200K) |

Back-of-envelope from those numbers (one rank):

* KV bytes at 128K: 131072 x 396 B x 2 heads = **104 MB**. 104 MB / 1.77 ms = **~59 GB/s =
  ~13% of the B60's 456 GB/s**. A KV-bandwidth-bound kernel would take ~0.23 ms.
* 16 full-attention layers x 1.77 ms = 28 ms, which roughly matches the 2K->128K step growth
  (71.9 - 40.5 = 31.4 ms). So, roughly, **decode attention is the whole long-context step growth**.
  The 2K->200K growth (~49 ms) is consistent with ~3 ms/layer-call at 200K.
* Serial->parallel S2 saved ~0.9 ms of 2.7 ms, so stage 2 was at least a third of the op before
  the parallel merge. What S2 costs now is not recorded: **[BENCH] split_s2_us**.
* Split workspace traffic: S1 writes 64 rows x 256 x 2 B (fp16) = 32 KB per page per head and
  S2 reads it back. That is **~2 x 134 MB = 268 MB at 128K, ~2.6x the KV bytes**. Only
  q_len x 6 = 42 of the 64 rows are live in verify (6 in draft), but the full tile is written.
  Total ~372 MB / 1.77 ms = ~210 GB/s (~46% of peak) if all of it reaches DRAM.

## 3. Suspected bottleneck (ranked)

1. **Split-per-page workspace traffic + S2 merge length** (most likely). With one split per
   64-token page, partial bytes exceed KV bytes ~2.6x and S2 has to merge 2048 (128K) to 4096
   (262K) partials per row. That fits the 13% KV-only bandwidth figure and why parallel S2 gave
   the biggest single win.
2. **S1 occupancy / per-WG fixed cost**: each WG reloads the 16 KB Q8 tile and does a full
   64-row DPAS + softmax for 6-42 live rows. That cost is the same at any context, but there
   are many WGs (4096 at 128K).
3. **V int4 dequant in S1** (scalar 8-byte loads + per-element fp convert into SLM). This
   probably does not dominate, because K is consumed by DPAS without dequant, but it is unmeasured.
4. Pure DRAM bandwidth on KV: ruled out as the main limit by the 13% figure, unless the live lib
   (cascade/compact SLM) differs a lot from the 2668/1766 us measurements. **[LIVE]** re-checks it.

## 4. What the sampled profiler answers [LIVE]

`tools/analyze_attn_profile.py` gives p50/p95 GPU us per call by ctx bucket and by batch,
`p50_us/req`, and KV-only GB/s.

* us/req linear in ctx with a flat GB/s means a per-token cost (bandwidth or S1/S2 work per
  page). The fitted slope (us per 1K tokens) times 16 layers predicts the step growth.
* us/req rising with batch at a fixed ctx bucket would be unexpected (the op is serial over
  requests) and would point to cache/L2 contention or the cascade path.
* Join with `samples.csv` (running/waiting) to separate scheduler concurrency from in-op batch.
* Limitation: FULL_DECODE_ONLY graph replays don't enter Python, so the profiler sees eager
  calls only: mixed prefill+decode steps, draft steps at sizes that aren't captured, and the
  first capture-time calls (skipped). Compare the q_len=7 rows with the bench, which uses the same kernel.

## 5. Controlled microbenchmarks that separate the explanations [BENCH]

All of these use existing runtime knobs on the shipped library (no rebuild). Run them in a
separate process while vLLM is stopped or GPU memory is free:

| experiment | if workspace-bound | if S1 occupancy/fixed-cost | if dequant | if KV BW |
| --- | --- | --- | --- | --- |
| `XE2_KV_PARTIAL_FP16` 0 vs 1 (2x partial bytes) | time moves ~ws bytes | ~flat | flat | flat |
| `XE2_KV_TIME_SPLITS=1` S1 vs S2 vs ctx | S2 + S1-store large | S1 large, per-page const | S1 large | S1 ~ KV bytes / 456 GB/s |
| q_len 1 vs 7 at same ctx | ~flat (full tile written anyway) | ~flat | flat | flat |
| `XE2_KV_S2_NSG` 8/16/32 | S2 changes | - | - | - |
| `XE2_KV_COMPACT_SLM` 0/1 (q_len 7) | - | S1 changes with SLM/occupancy | - | - |
| ctx sweep 2K..262K | slope ~ (KV+ws) bytes/BW | slope ~ pages x per-WG cost | slope ~ V bytes | slope ~ KV/456 GB/s |

Ones that need a kernel build (not done, needs Daniel's OK): a *skip-V-dequant* variant
(feed fp16 zeros for V to isolate dequant), a *16-byte load* V decode (uint4/`vec<uint8_t,16>`
block loads vs the current 8-byte memcpy), *multi-page splits* (2-8 pages per WG, which cuts
partials and S2 length by 2-8x), and `reqd_sub_group_size(32)` / BM=16-row tiles for draft.

## 6. Next experiment (the decisive one)

Run the `XE2_KV_PARTIAL_FP16` 0/1 x `XE2_KV_TIME_SPLITS` sweep at 128K/200K, q_len 7, batch 1.
If S1+S2 time drops by roughly the halved workspace bytes / achieved BW (~0.3 ms at 128K), the
bottleneck is split workspace traffic, and the fix is multi-page splits. If it doesn't move and
S1 dominates with time ~ linear in pages, it's per-WG fixed cost/occupancy, and the next
build is a skip-dequant + BM-row-trim variant.
