# Continuation, 2026-10-14 evening

Picked up `HANDOFF_CONCURRENCY_2026-10-14_CURRENT.md` and `perf-resume-20261014/README.md`. Production was idle on the compact library. No leftover controllers. A finite probe is running against the live compact/q1+fp16 server; it does not switch libraries.

## What the earlier "no results" actually were

The quality A/B never produced a usable kernel verdict. `quality_ab.snapshot.jsonl` is interleaved, and the same-endpoint control already diverges: **4/29 A-vs-B identical vs 5/29 A-vs-A identical**. MTP at temperature 0 is not text-stable. Exact-text match cannot judge fp16 partials or the compact verifier.

The advertised compact C1 regression (−11.2%, 89.2 → 79.2 tok/s) is a three-trial median artifact. Per-trial compact C1 was **79.2 / 95.4 / 78.3**; baseline was **89.2 / 81.1 / 89.6**. Means are 84.3 vs 86.6. Compact C1 trial 1 is the fastest 128K C1 in the set. Same-library repeats also diverge after 193–276 characters. Extra 128K C1 samples are in `continue_probe.py`.

## 8K compact results (probe, controlled)

| C | tok/s per stream (3 trials) | median | cycle ms | acceptance |
|---|---|---:|---:|---|
| 1 | 125.1, 128.6, 130.7 | 128.6 | 37.5 | 0.615–0.645 |
| 2 | 100.8, 106.9, 107.5 | 106.9 | 45.0 | 0.591–0.639 |

C2 per-stream loss vs C1: **16.9%**. Cycle growth x1.20. Same cycle as the previous q1/fp16 8K matrix (37.8 / 45.3 ms). Short-context concurrency is already near the 15% target; the leftover ~0.9 ms is not the long-context attention path.

## Finished probe (compact library, controlled)

| Context | C1 tok/s | C2 tok/s | C2 loss | cycle C1 / C2 |
|---|---:|---:|---:|---|
| 8K | 128.6 | 106.9 | 16.9% | 37.5 / 45.0 ms |
| 32K | 118.7 | 91.4 | 23.0% | 40.9 / 52.7 ms |
| 128K | 84.8 | — | extra C1 only | 54.4 ms |

128K C2/C4 from the earlier matched test: 58.5 / 36.1 tok/s vs ~85 C1 → about 31% and 57% per-stream loss. Historical 384-token 200K C2 was 33.2 vs 64.9 (**49%**), combined 66.5. This evening’s 256-token window on the same compact server: 200K C1 **70.9**, C2 **48.4** (−31.7%), C4 **28.2** (−60.2%).

## Local argmax (`use_local_argmax_reduction=true`) — wash, still serving

Qwen3_5 MTP has `LocalArgmaxMixin`. The switch came up healthy (`vllm-k8v4-tp2-before-argmax-20261014204535` kept). Controlled 3×256-token probe vs the compact 8K/32K numbers:

| Context | compact C1 / C2 / loss | argmax C1 / C2 / loss | cycle C1 / C2 |
|---|---:|---:|---:|
| 8K | 128.6 / 106.9 / 16.9% | 125.9 / 105.2 / 16.4% | 37.6 / 44.6 ms |
| 32K | 118.7 / 91.4 / 23.0% | 113.3 / 89.0 / 21.4% | 40.7 / 53.6 ms |

C1 is slightly slower; C2 loss is within noise of compact. Cycle times match. Vocab all-gather is not the 200K / C4 problem. Not a deploy win. The fastsync isolator later restarted this same container, so **8100 still has the flag**. Rollback without a 7-minute reload is `vllm-k8v4-tp2-before-argmax-20261014204535`.

## Rejected: compact verifier sync cut (`fastsync`)

Dropped the extra QK-half subgroup barrier and the two workgroup barriers around subgroup-private P pack/load; kept the P→V workgroup handoff. Library `libxe2_kv_fastsync.so` SHA256 `324b38fb9a1cfaa816c9d6f657156a897e8969aced6fbdafc0ff54f7383d1b23`. Graph A/B vs compact (`ffe0e5a1…`) at 128K/200K, q1/q7, C1/C2/C4: **bit-exact** (`max_abs=0`) and **no speed win**. 200K q7 C4 6.346 vs 6.348 ms (1.000×). 128K q7 C1 1.014×, C4 1.000×. Compact itself is still serial: 200K q7 1.620 / 3.193 / 6.346 ms at C1/C2/C4. Not deployed. Isolator restored production healthy (`fastsync-ab-receipt.json`).

Authoritative evening write-up: `../HANDOFF_CONCURRENCY_2026-10-14_CURRENT.md`.

## Screened: one-WG-per-page multi-Q (`XE2_KV_SHARED_WALK`) — not a deploy

One compact-verifier work-group owns a page and loops requests so a shared `block_table` ID can hit L1. Library `libxe2_kv_sharedwalk.so` SHA256 `cd1ce7468364be849f5dd059b2184fe8b8f1dbdaa0c3cccc42b768e428011b2e`. Isolated graph A/B `sharedwalk-ab.jsonl`. **Not bit-exact** (max abs 0.018–0.050). Shared pages are only a hair faster than distinct pages, so this is mostly “one grid instead of B grids,” not a cached walk:

| 128K q7 | serial | fused | ratio |
|---|---:|---:|---:|
| C2 distinct | 4142 µs | 3940 µs | 1.05× |
| C2 shared pages | 4141 µs | 3892 µs | 1.06× |
| C4 distinct | 8227 µs | 7661 µs | 1.07× |
| C4 shared pages | 8236 µs | 7533 µs | 1.09× |

C4 remains ~2× C2. Does not change the 200K per-stream ~50% story. Not mounted. Production restore in `finally`.

## Screened: prefix-once fuse-KV (90% shared pages) — not a deploy

One K tile and one V tile, two Q accumulators, fuse only when that page’s `phys` matches. Library `libxe2_kv_sharedwalk.so` SHA256 `ba3c020def6bc2fa107041a453d9873b519327858fc4cdf248e7aa1d457a7ffc`. Isolated graph A/B `prefix90-ab.jsonl`, receipt `prefix90-ab-receipt.json` (`restored_healthy` true). Production stays on compact `ffe0e5a1…`.

| 128K C2 q7 | serial µs | fused µs | ratio | max_abs |
|---|---:|---:|---:|---:|
| p0 unrelated | 4473.4 | 4303.0 | 1.04× | 0.019 |
| p90 shared | 4470.6 | 3863.0 | 1.16× | 0.020 |
| p100 identical | 4471.3 | 3764.4 | 1.19× | 0.019 |

Serial time does not care whether the page IDs match. Fuse-KV does, so the load-once is real. It is not 2× (compute/softmax/S2 stay per request). Not bit-exact. Unrelated users stay at 1.04×. Does not fix this session’s 200K C2 −31.7% / C4 −60.2%. Next lever: hot window + cold page index.

## Rejected: parallel-batch streams (`XE2_KV_PARALLEL_BATCH`)

Compiled `libxe2_kv_parbatch.so` (SHA256 `ce244a1755e2550746f8c2189b23c4be844f8f02fbc20ff3c4af4bc8b50b5020`). Extra XPU streams cannot be recorded into an XPUGraph (`wait cannot be called for a queue which is recording to a command graph`), so this cannot enter the FULL_DECODE serving path.

Eager no-graph screen (`parbatch-eager.jsonl`) was bit-exact (`max_abs=0`) and **slower** on every concurrent case. 128K q7: C2 2490 → 2838 us (0.88x), C4 4562 → 4911 us (0.93x). C1 unchanged. Same conclusion as the fused one-grid prototype: one request already saturates the KV walk; a second stream contends. Not deployed. Production restored after the screen.

## Live 200K C1 / C2 / C4 prefix share (2026-10-14 22:44–23:11 UTC)

Receipt `share-prefix-200k-c4.jsonl`. 8100 restored idle (health 200, busy 0.0). Compact library unchanged.

Sibling-warm hit law: `2112 * max(0, (lcp // 2112) - 1)` / prompt. Aligned last-line tails at 200K: **196416/200085 = 98.2%**. Distinct siblings: **0%**.

| Layout | tok/s per stream | vs C1 | Prefill |
|---|---:|---:|---|
| C1 | **70.9** | — | 181.9 s cold |
| C2 distinct | 48.4 / 48.1 | −31.7% | 182 s ×2 |
| C2 aligned 98% | 47.7 / 47.1 | −33% | 5.8 s sibling |
| C4 aligned 98% | **28.2 / 27.9** | −60% | 5.8 s ×3 + 182 s actor 0 |
| C4 distinct | **28.2** (trial 0) | −60% | 182 s ×4. Trial 1 invalid: 2 of 4 prefixes evicted |

C4 drops another **~20 tok/s** from C2. Shared pages do not move decode. +10 tok/s at 200K C2 is not in this lever. `prefix_hit_model.py` restates the hit law from the receipts.
