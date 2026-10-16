# Decode concurrency handoff — 2026-10-14 evening

This document supersedes the afternoon compact-kernel handoff and `perf-continue-20261014/README.md` for **current server state** and **what was tried after that handoff**. Compact-kernel receipts in `perf-resources-20261014/` remain valid.

## Outcome

The long-context concurrency problem is **not fixed**. Evening candidates gained **nothing** on 200K or C4:

| Candidate | Result | Deployed? |
|---|---|---|
| Compact 8-KiB verifier (afternoon) | Kernel −12.5% at 200K C4 q7; endpoint C4 +6.2%, C2 +0.7%, C1 noisy | **Yes** — still the serving library |
| `use_local_argmax_reduction` | 8K C2 loss 16.4% vs 16.9%; 32K 21.4% vs 23.0%; C1 slightly slower | Flag is on the live Cmd (wash, not a win) |
| Compact-sync cut (`fastsync`) | Bit-exact, 1.00× at 200K C4 q7 | **No** |
| Parallel-batch extra XPU streams | Bit-exact, slower; illegal under XPUGraph | **No** |
| Shared-walk L1 hope (one WG/page, loop Qs) | 128K q7 C2/C4 1.05–1.09×; shared ≈ distinct | **No** |
| Prefix-once fuse-KV (one K/V load, two Q acc) | 128K C2 q7 p90 **1.16×**, p100 **1.19×**; not 2×; not bit-exact | **No** |

Do not describe compact as a concurrency fix. Do not rerun the evening losers. Check traffic before interrupting serving.

## Live server and rollback

Host: `dan@100.93.94.42` (`ai01`), two Intel B60 24-GiB GPUs. API: `http://100.93.94.42:8100/v1`. Container: **`vllm-k8v4-tp2`**. Health HTTP 200, busy 0.0 verified at **2026-10-14 23:11 UTC** after the 200K C4 prefix probe. Serving library unchanged (compact).

| Setting | Serving value |
|---|---|
| Weights | `/srv/launch80-target-fast` → `/model` (Launch80 Swift-1.5-Qwen3.8-27B INT4 baked) |
| Dtype / KV / TP | FP16, `int8_k_int4_v`, TP2, max 4 seqs, 262144 / 4224 |
| Speculation | MTP6; live Cmd also has `use_local_argmax_reduction: true` (measured wash) |
| Graphs | FULL_DECODE_ONLY, capture 7/14/21/28 |
| Native | `XE2_KV_PARTIAL_FP16=1`, `XE2_KV_COMPACT_SLM=1`, draft NSG 32 / verify NSG 8 |

Serving image: `sha256:200458a4be862eb5f8da82d0b657f37912fe7150949053a213a3b9250527f742`.

Serving library: `/mnt/hdd-500gb/model-validation/launch80-20261013/perf-resources-20261014/libxe2_kv_final.so` → `/opt/k8v4/libxe2_kv.so`.

Library SHA256: `ffe0e5a1a2a2930efb6578b78b8e6b9b9405299c1ad72c8ce550385f1f738632`.

Stopped rollbacks (do not delete):

- `vllm-k8v4-tp2-before-argmax-20261014204535` — compact library, **no** local-argmax flag (preferred Cmd if the flag is removed)
- `vllm-k8v4-tp2-before-compact8win-20261014191618` — q1 library `0ea8d2d86170fed4db1a1848e2f4d4833cba0064f5d3217a70227479396c1848`

`k8v4-dev-gpu0` / `k8v4-dev-gpu1` remain stopped. Forgejo is running. Do not restart `run_mtp_focus.py`, `run_sequence.py`, `run_followup.py`, `switch_validated_final.py`, or old DFlash controllers.

## Goal status (verified)

User goal: (1) prefill 3–4k tok/s; (2) ~65 tok/s decode at 200K C1; (3) ≤15% per-stream loss at concurrency >1.

| Target | Status | Best measured |
|---|---|---|
| 200K C1 ~65 tok/s | **Met** | This session **70.9** tok/s (256-token window, acc 0.59); earlier 60–73 |
| ≤15% loss at C>1 | **Not met** | 8K C2 **16.9%**; 32K C2 **23%**; 128K C2/C4 **~31% / ~57%**; **this session 200K C2 31.7%** (48.4 vs 70.9), **C4 60.2%** (28.2 vs 70.9). Historical 384-token 200K C2 was 49% (33.2 vs 64.9) |
| Prefill 3–4k one prompt | **Not met** | ~2.15k short/mid, ~1.2k at 128K. Two TP1 replicas ~3.4k **aggregate**, ~75K KV each |

Compact 128K matched endpoint (same 131146-token code prompt, 3 trials, thinking off):

| C | compact tok/s per stream | combined | vs previous kernel |
|---|---:|---:|---|
| 1 | 79.2 (trials 79.2 / 95.4 / 78.3; mean 84.3 vs 86.6) | 79.2 | −11.2% median, artifact |
| 2 | 58.5 | 116.9 | +0.7% |
| 4 | 36.1 | 144.6 | +6.2% |

## Evening measurements

### Local argmax (serving Cmd still has the flag)

Receipts: `perf-continue-20261014/switch-argmax.json`, `argmax-probe.jsonl`. Smoke `ready`. Backup `vllm-k8v4-tp2-before-argmax-20261014204535`.

| Context | compact C1 / C2 / loss | argmax C1 / C2 / loss | cycle C1 / C2 |
|---|---:|---:|---|
| 8K | 128.6 / 106.9 / 16.9% | 125.9 / 105.2 / 16.4% | 37.6 / 44.6 ms |
| 32K | 118.7 / 91.4 / 23.0% | 113.3 / 89.0 / 21.4% | 40.7 / 53.6 ms |

Qwen3_5 MTP has `LocalArgmaxMixin.get_top_tokens`; the flag is valid. Vocab all-gather is not the long-context limiter. Fastsync isolator later stopped and restarted this same container, so 8100 still has the flag.

### Compact-sync cut (`fastsync`) — rejected

Source `perf-continue-20261014/xe2_kv_fastsync.cpp`: dropped the extra QK-half subgroup barrier and the two workgroup barriers around subgroup-private P pack/load; kept the P→V workgroup handoff.

Library SHA256 `324b38fb9a1cfaa816c9d6f657156a897e8969aced6fbdafc0ff54f7383d1b23`. Graph A/B `fastsync-ab.jsonl`, receipt `fastsync-ab-receipt.json` (`returncode` 0, `restored_healthy` true). Isolated container; production restored in `finally`. **Never mounted.**

| 200K q7 | compact | fastsync | ratio | exact |
|---|---:|---:|---:|---|
| C1 | 1620.4 µs | 1639.0 µs | 0.99× | yes, max_abs=0 |
| C2 | 3193.4 µs | 3191.8 µs | 1.00× | yes |
| C4 | 6346.2 µs | 6348.2 µs | 1.00× | yes |

Compact itself is serial: 200K q7 C2 = 1.97× C1, C4 = 3.92× C1. 128K q7 C4 4216.1 vs 4215.2 µs (1.000×).

### Parallel-batch streams — rejected earlier this evening

`libxe2_kv_parbatch.so` SHA256 `ce244a1755e2550746f8c2189b23c4be844f8f02fbc20ff3c4af4bc8b50b5020`. Extra XPU streams cannot `synchronize()` during command-graph capture. Eager screen bit-exact and slower (128K q7 C2 2490→2838 µs, C4 4562→4911 µs).

### Prefix-once fuse-KV (90% shared pages) — real bytes, not a deploy

The cheap experiment: two 128K q7 requests, 0% / 90% / 100% identical `block_table` pages, one K tile and one V tile, two Q accumulators. Kernel `perf-continue-20261014/xe2_kv_sharedwalk.cpp` (`XE2_KV_SHARED_WALK=1`, fuse when `phys` matches on that page). Library SHA256 `ba3c020def6bc2fa107041a453d9873b519327858fc4cdf248e7aa1d457a7ffc`. Isolated graph A/B `prefix90-ab.jsonl`, receipt `prefix90-ab-receipt.json` (`returncode` 0, `restored_healthy` true). **Never mounted.**

| 128K C2 q7 prefix | serial µs | fused µs | ratio | exact | max_abs |
|---|---:|---:|---:|---|---:|
| p0 (unrelated pages) | 4473.4 | 4303.0 | 1.04× | no | 0.019 |
| p90 (90% shared) | 4470.6 | 3863.0 | **1.16×** | no | 0.020 |
| p100 (identical pages) | 4471.3 | 3764.4 | **1.19×** | no | 0.019 |

Serial p0 ≈ p90 ≈ p100. Prefix cache already shares storage; walking the same page IDs twice still costs a full second walk. Fuse-KV is a real load-once: p90/p100 pull away from p0. It is **not** the 1.8–2× a pure-bandwidth second-walk cut would be. Dual QK MAD, softmax, PV, and S2 stay 2×; we only drop the second K/V fill. Not bit-exact (same class as the earlier L1 shared-walk). Unrelated users stay at 1.04×. C4 is still `batch==2` only. 1.16× on C2 attention at 128K does not move this session’s **31.7% C2 / 60.2% C4** serving loss onto the 15% line.

Earlier L1-hope shared-walk (`cd1ce746…`, `sharedwalk-ab.jsonl`) was the wrong experiment: per-request S1 body, 100% vs 0% pages, 1.05–1.09×, shared ≈ distinct.

### Live 8100 prefix share, 200K C1 / C2 / C4 (22:44–23:11 UTC)

Production compact, no remount. 256-token window. Sibling-warm hit (the cross-request number):

`hit_tokens = 2112 * max(0, (lcp_tokens // 2112) - 1)`

Decode `cache_hits` are mostly self-replay of each actor’s own blocks. Lifetime `/metrics` hit % mixes every probe and is not per-request share. Loose “90% NOTE + unique tail” was 50.8% at 8K and **0% at 32K**. Aligned body + last-line tail is the construction that hits.

| Probe | Sibling-warm hit | Prefill | Decode tok/s per stream |
|---|---|---|---|
| 200K C1 | n/a (cold 0/200079) | 181.9 s | **70.9** |
| 200K C2 distinct | 0% | 182 s ×2 | 48.4 / 48.1 |
| 200K C2 aligned | **196416/200083 = 98.2%** | 5.8 s sibling | 47.7 / 47.1 |
| 200K C4 aligned | **98.2%** on actors 1–3 | 5.8 s ×3 + 182 s actor 0 | **28.2 / 27.9** (combined ~112) |
| 200K C4 distinct | 0% sibling | 182 s ×4 | **28.2** trial 0. Trial 1 **invalid** (hits 392832 vs 785664; 2 of 4 prefixes evicted from the 828656-token pool) |

C1→C2 **−31.7%**. C1→C4 **−60.2%**. C2→C4 is another **−20 tok/s**. Aligned and distinct decode match. +10 tok/s at 200K C2 (48→58) needs ~26% less KV time (`T_kv` 6.6→4.85 ms); fuse-KV 1.16× would land ~53 and is not mounted. Keep prefix cache for sibling prefill and HBM packing (C4 aligned unique KV ≈ 211K vs 800K distinct). Do not expect it to raise C2/C4 tok/s.

Receipts: `share-prefix-serve.jsonl`, `share-prefix-aligned.jsonl`, `share-prefix-200k.jsonl`, `share-prefix-200k-c4.jsonl`. Hit law: `prefix_hit_model.py`.

## Why 15% at 200K / C4 is not a leftover kernel flag

`int8k_int4v_attn_batch` submits one varlen S1 per request on one in-order queue and reuses one q8/workspace tile. Distinct 200K page tables mean distinct full KV walks. One walk already sits near device copy bandwidth (~388 GB/s reference; C1 q7 200K effective ~94 GB/s on the whole op including partials). A second stream therefore adds nearly 1× wall time, not 15%.

Fit of this session’s 256-token window: `T_kv ≈ 6.6 ms` per 200K stream, `T_other ≈ 7.5 ms`. C1 14.1 ms → 70.9 tok/s. C2 20.7 ms → 48.3. C4 predicted 33.9 ms → 29.5 vs measured **28.2**. Shared physical pages do not collapse `T_kv`: each request still walks its block table, and 200K KV (~158 MiB/rank) does not stay in L2 for the next request.

The 200K KV-byte floor is about **9 ms per decode step**. That can raise absolute C2 tok/s but does not make C4 cost ~1.18× C1. C4 15% would require four full 200K walks to cost little more than one; that needs not walking the full cache. Serving prefix share was the cheap test of “shared bytes”; it helps prefill and capacity only.

MTP at temperature 0 is not text-stable (A-vs-A 5/29 identical). Do not judge kernels by exact completion match.

## Do not repeat

Already measured slower, illegal, or a wash. Receipts are kept; do not blindly rerun.

- Parallel extra XPU streams / fused one-grid batch (+1.46% then lost)
- Compact-sync barrier cut
- Shared-walk L1 hope (one WG/page, loop requests)
- Prefix-once fuse-KV (one K/V load, two Q acc; 0/90/100% pages)
- Live 8100 C2/C4 distinct vs aligned prefix (decode unchanged; prefill and capacity only)
- Local argmax reduction
- Online 2/4-page streaming, scalar merge, two-pass chunk softmax (5× slower)
- Compact/page-transposed partials; coalesced V (exact after barrier fix, slower)
- PPP=2/4; 6-row q7 block; indexed `joint_matrix` arrays (NaN)
- `CCL_SYCL_*` all-reduce knobs; eager int8 all-reduce payload; async all-reduce overlap (10.36 vs 10.10 ms)
- `--max-num-batched-tokens=8448`; S2 NSG widths other than draft 32 / verify 8
- `switch_validated_final.py`, old DFlash / MTP focus controllers

Write remote scripts as LF files. PowerShell interpolates `*`, `|`, and quotes.

## KV-traffic investigation (instrument first)

Goal: cut repeated long-context KV bytes per useful token without a quality regression. Production stays on compact `ffe0e5a1…`. Nothing new is mounted.

| Class | What | Status |
|---|---|---|
| Exact | Compact serial S1/S2 serving | Live |
| Exact | Prefix cache enabled (`block_size=2112`, hash sha256) | On. **Decode unchanged when pages actually share.** Dynamic sibling-warm hit: `2112 * max(0, (lcp // 2112) - 1)` / prompt. Aligned tail: 8K loose 50.8%, 32K loose **0%**, 32K aligned **90.0%** (29568/32852), 200K C2/C4 **98.2%** (196416/200083). Distinct sibling **0%**. Prefill 200K 182 s → 5.8 s. C2 **47.7 / 47.1** vs distinct **48.4 / 48.1**. **200K C4 aligned 28.2 / 27.9**, distinct trial 0 **28.2** (trial 1 invalid: pool evicted 2 of 4). Same decode. Receipts include `share-prefix-200k-c4.jsonl`. |
| Numerically altered | Fuse-KV one page → QA+QB | 128K C2 q7: 0% 1.04×, 90% 1.16×, 100% 1.19×; max_abs ~0.02; **not equivalent** |
| Bound only | Unique-page bytes at 0/25/50/75/90/100% × C2/C4 | Arithmetic; 90% C2 0.55× bytes, C4 0.325× if all streams share |
| Instrument | Page-mass from production (M, L) | Done on **randn Q/K/V** (`page-mass.jsonl`). 99% mass needs ~98% of pages. Not a Qwen prior. |
| Approximate | Quest / page metadata | **Not implemented** until mass + stability exist |
| Hermes overlap | Main-agent / subagent physical pages | **No traces yet**; do not assume 90% |

MTP6 amortization from `high-context-final.jsonl` (128K, exact endpoint): ~4.3–4.9 committed tokens per step, two full walks (q1+q7) per step, **99.0 MiB/walk/rank**, ~41 MiB KV per committed token on one rank. C4 acceptance holds (~0.63); the C4 loss is extra walks, not worse draft accept. q7 already reuses each loaded page across seven Qs **inside one request**. Wider speculative Q amortizes that further; it does not collapse C2/C4.

Accuracy gate for anything non-exact: attention-output error, target-logit KL, top-1/5, flips vs margin, frozen Hermes (success, repairs, tool errors, tokens, wall time). A faster retry loop is a regression.

## Four levers (2026-10-14 21:39 UTC)

1. **Parallelize the scan.** Tried (extra streams, one-grid). Helps unrelated users only a little; does not remove “twice the bytes.”
2. **Load shared KV pages once for several Qs.** Screened. Hermes-style 90% prefix is **1.16×** at 128K C2 q7, 100% is **1.19×**. Real, not 2×, not deployable.
3. **Shrink the history you touch.** Hot window + cold store with a tiny page index so each token pulls ~10–20% of 200K. Directly targets the scaling pain. **This is now the serious path.**
4. **Do not move the whole cache to CPU.** Treat cold KV as an index and fetch only the parts the index names. Same idea as (3), not LMCache.

## What is left (not another occupancy clone)

**Will not hit the written 15% / 3–4k-single-prompt numbers on this box:**

1. Another S1 occupancy, barrier, or stream clone.
2. Single-prompt prefill 3–4k while TP2 all-reduce is host-routed PCIe at ~9 GB/s (~29% of a 4224-token chunk) and compute will not overlap it.
3. C4 at 200K ≤15% per-stream while each stream walks its own full KV.

### Cross-user / “stale cache in RAM” (asked 2026-10-14 21:23 UTC)

People usually mean one of three different things. Only the first is already on; none of them is extra host RAM:

1. **Prefix cache** (already `--enable-prefix-caching`). Same token prefix → same GPU page IDs, one copy in HBM. Attention still walks those pages **once per query**. Shared storage ≠ one walk.
2. **KV offload / LMCache** (“cold blocks to system RAM”). This box has about **12 GiB host RAM**. A 200K k8v4 working set does not fit there as a speed path, and a host walk is PCIe (~9–30 GB/s) vs HBM (~388 GB/s). That is a capacity trick, not a C2 fix. Do not turn it on here.
3. **CacheBlend / similar-document KV reuse.** Research. Only helps if sessions share real token chunks. Quality-sensitive. Still a walk per live query unless the kernel does one load and several Qs.

The concurrency cliff is the **per-request full-KV walk**, not the tiny reused q8/partials scratch (one 64×256 tile, already INT8-Q / FP16 partials / live-row gated). Parallel streams gave each request its own scratch and an extra XPU queue. Same HBM, same Xe cores; one walk already fills the straw; two streams contend and cannot record into XPUGraph.

Two shared-prefix kernels were screened and rejected for deploy:

1. **L1 hope** (`cd1ce746…`, `sharedwalk-ab.jsonl`): one WG/page, loop requests. 128K q7 C4 shared 8236→7533 µs (**1.09×**). Shared ≈ distinct.
2. **Fuse-KV** (`ba3c020d…`, `prefix90-ab.jsonl`): one K/V load, two Q accumulators. 128K C2 q7 p90 **1.16×**, p100 **1.19×**. Real bandwidth, not 2×, not bit-exact, not a serving fix.

**Still untested, and what they can actually do:**

1. **Hot window + cold page index** (the remaining lever that cuts bytes). Keep a small recent window; store a tiny per-page score so each token walks ~10–20% of 200K instead of all of it. This is now the serious path. Treats cold KV as an index, not a CPU dump.
2. **GDN verify + small per-request kernels** (~1.2 + 0.9 ms/request at 8K). Can chase the last ~2 points of the 8K 16.9%→15% gap. Does not move 200K C4.
3. **Prefill projects:** fused quantize-and-exchange plus a copy engine that actually overlaps; int8-QK flash prefill (≤1.3× on attention, ~58% of a 128K chunk). Numerics required. Still unlikely to make **one** prompt 3–4k on this link.
4. **Topology / product, not a kernel:** two TP1 replicas already measure ~3.4k aggregate prefill and ~0–4% cross-GPU decode interference, but ~75K KV each and slower per-stream decode than TP2. Serializing long-context streams in the scheduler does not raise per-stream rate while both are generating (same 2× attention). Removing the live argmax flag is hygiene only.

vLLM 0.30 batch-size speculative schedules flip FULL graphs to PIECEWISE on the V1 runner; V2/XPU/k8v4 compatibility is unvalidated. Do not enable a schedule and blame MTP.

## Evidence pointers

Local: `C:/Users/WhiteWidow/Documents/ChatGPT/Xe2 Low-Bit KV Atten/audit/model-validation/launch80-20261013`.

Remote: `/mnt/hdd-500gb/model-validation/launch80-20261013`.

**`perf-continue-20261014/`** (this evening):

- `README.md` — probe and candidate notes
- `continue-probe.jsonl` — compact 8K/32K/extra 128K C1
- `argmax_probe.py`, `argmax-probe.jsonl`, `switch-argmax.json`, `switch_spec_flag.py`
- `xe2_kv_fastsync.cpp`, `libxe2_kv_fastsync.so`, `fastsync-ab.jsonl`, `fastsync-ab-receipt.json`, `isolated_fastsync.py`
- `xe2_kv_parbatch.cpp`, `parbatch-eager.jsonl`, `isolated_parbatch.py`
- `xe2_kv_sharedwalk.cpp`, `libxe2_kv_sharedwalk.so` (`ba3c020d…` fuse-KV; prior `cd1ce746…` L1 hope)
- `prefix90_probe.py`, `isolated_prefix90.py`, `prefix90-ab.jsonl`, `prefix90-ab-receipt.json`
- `sharedwalk-ab.jsonl`, `sharedwalk-ab-receipt.json`
- `share_prefix_serve.py`, `share-prefix-serve.jsonl` — 8K/32K live C1/C2, loose 90% vs distinct
- `share_prefix_aligned.py`, `share-prefix-aligned.jsonl` — 32K aligned tail 90.0% hits
- `share_prefix_200k.py`, `share-prefix-200k.jsonl` — 200K C2 distinct 48.4/48.1 vs aligned 47.7/47.1
- `share_prefix_200k_c4.py`, `share-prefix-200k-c4.jsonl` — 200K C1 70.9, C4 aligned 28.2/27.9, C4 distinct 28.2 then eviction
- `prefix_hit_model.py` — `hit_tokens = 2112 * max(0, (lcp // 2112) - 1)`
- `health_prefix_scrape.py` — read-only 8100 health + lifetime prefix counters

**`perf-resources-20261014/`** (afternoon compact): `libxe2_kv_final.so`, `xe2_kv_final.cpp`, `high-context-final.jsonl`, `endpoint-comparison.json`, `switch-compact8win.json`.

Repo notes: `github-k8v4-xpu/docs/HANDOFF-2026-10-14-decode-performance.md` and `docs/2026-10-14-evening-concurrency.md`.
