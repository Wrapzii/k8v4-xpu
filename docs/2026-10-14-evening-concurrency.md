# Evening concurrency candidates, 2026-10-14

Serving is still the compact 8-KiB verifier (`XE2_KV_COMPACT_SLM=1`, library `ffe0e5a1…`). The 200K / C4 per-stream loss is **not fixed**. Full receipts: `audit/model-validation/launch80-20261013/HANDOFF_CONCURRENCY_2026-10-14_CURRENT.md`.

## Measured tonight (do not repeat)

**Local argmax** (`use_local_argmax_reduction=true` on Qwen3_5 MTP): valid flag, healthy switch, wash. 8K C2 loss 16.4% vs compact 16.9%; 32K 21.4% vs 23.0%. Cycle times matched. Live Cmd still has the flag after a later isolator restart; backup `vllm-k8v4-tp2-before-argmax-20261014204535` does not.

**Compact-sync cut:** dropped conservative barriers on subgroup-private score/P rows. Graph A/B at 128K and 200K, q1/q7, C1/C2/C4: bit-exact (`max_abs=0`) and 1.00× at 200K C4 q7 (6.346 vs 6.348 ms). Compact remains serial: 1.620 / 3.193 / 6.346 ms. Not deployed.

**Parallel-batch extra XPU streams:** graph-illegal (`wait` during command-graph capture); eager bit-exact and slower.

**Shared-walk L1 hope:** one WG/page, loop requests. 128K q7 1.05–1.09×; shared ≈ distinct. Not bit-exact. Not deployed.

**Prefix-once fuse-KV** (the cheap 90% experiment): one K/V tile, two Q accumulators. 128K C2 q7 graph A/B `prefix90-ab.jsonl`. Serial is flat across layouts (4473 / 4471 / 4471 µs). Fused: p0 1.04×, p90 **1.16×**, p100 **1.19×**. Not bit-exact (max_abs ~0.02). Never mounted; 8100 restored healthy. Does not move 128K/200K serving loss onto 15%. Sliding window + page index is the remaining lever.

## Goal vs this stack

- 200K C1 ~65 tok/s: met.
- ≤15% loss at C>1: 16.9% at 8K C2; **this session 200K C2 31.7%** (48.4 vs 70.9), **C4 60.2%** (28.2 vs 70.9). Historical 384-token 200K C2 was 49% (33.2 vs 64.9). Another S1 occupancy/stream/barrier clone will not change C4 ≈ 4× C1 on distinct KV. Shared prefix does not change C2/C4 decode.
- Prefill 3–4k for one prompt: not met (~2.15k). Host-routed PCIe all-reduce ~9 GB/s; async does not overlap.

Leftover ideas that are not repeats: hot window + cold page index (10–20% of 200K per token); GDN/small kernels for the 8K 16.9%→15% gap; fused all-reduce / int8-QK flash prefill as projects; TP1 replicas for aggregate prefill (~3.4k, ~75K KV). Prefix-once fuse-KV is done (1.16× at 90%, not a deploy).

## Live 200K prefix share, C1 / C2 / C4 (2026-10-14 22:44–23:11 UTC)

Prefix cache **stays working**. Sibling-warm hit on aligned last-line tails:

`hit_tokens = 2112 * max(0, (lcp_tokens // 2112) - 1)`

| Probe | Sibling-warm hit | Prefill | Decode tok/s per stream |
|---|---|---|---|
| 200K C1 | n/a (cold) | 181.9 s | **70.9** |
| 200K C2 distinct | 0% | 182 s ×2 | 48.4 / 48.1 |
| 200K C2 aligned | **196416/200083 = 98.2%** | 5.8 s sibling | 47.7 / 47.1 |
| 200K C4 aligned | **98.2%** on actors 1–3 | 5.8 s ×3 | **28.2 / 27.9** (combined ~112) |
| 200K C4 distinct | 0% sibling; trial 0 decode 28.2; trial 1 **invalid** (hits 392832 vs 785664 — 2 of 4 prefixes evicted from the 828656 pool) | 182 s ×4 | **28.2** |

C1→C2 loss **31.7%**. C1→C4 **60.2%**. C2→C4 is another **−20 tok/s**. Shared vs distinct decode is the same. +10 tok/s at 200K C2 (48→58) needs ~26% less KV time; fuse-KV 1.16× would land ~53 and is not mounted. Production left idle on compact `ffe0e5a1…`.
