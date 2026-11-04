# K8/V4 long-context attention: investigation, 2026-11-04 (stopped at a GPU-memory blocker)

Status: Stages A, B and C **not run**. Isolated GPU kernel benchmarks can't run safely next to production
(see "Blocker"). Everything below is either **MEASURED-LIVE** (async GPU-event profiler inside
production, `/opt/k8v4/libxe2_kv.so` = libxe2_kv_cascade.so sha256 f1565f84?), **MEASURED-E2E**
(bench_conversation.py), **COMPILER** (AOT build of the reconstructed c4 source, not the production
binary), or **ESTIMATE** (theoretical traffic). Nothing was changed in production.

## Blocker
xpu-smi at 19:32Z: GPU0 24,133 MiB used, GPU1 24,079 MiB used, so only ~350 MiB free per B60.
A 200K one-layer fixture needs KV 166 MB + split workspace ~205 MB (fp16) + Level Zero context
overhead, which is more than is free. A second process allocating there risks vLLM OOM during a long
prefill (the oneDNN gather allocates transiently). Sharing one physical page across the block table
would fit, but it reads from L2 and doesn't represent DRAM. Small contexts (?32K) would fit, but they
contend with live traffic and still risk transient OOM. So I did not run any GPU fixture.
Unblock options (need Daniel's OK, ~5-7 min vLLM downtime each):
  (a) maintenance window: stop vLLM, run `tools/k8v4_attn_splits_bench.py --sweep` (~20-30 min), restart;
  (b) restart vLLM at `--gpu-memory-utilization=0.90` (frees ~1.2 GiB per GPU; KV pool shrinks, still far
      above 4x210K) and run fixtures beside it.

## 1. Stage breakdown (MEASURED-LIVE, combined S1+S2 per call; 1% sample, 360 calls)
The split per stage isn't available in production (fused op). XE2_KV_TIME_SPLITS needs the blocked bench.
| q_len | op | batch | ctx/req | p50 us/call | us/req | KV-only GB/s |
|---|---|---|---|---|---|---|
| 1 (draft) | attn_batch | 1 | ~131-134K | 523-545 | 523-545 | ~197 |
| 1 | cascade | 2 | ~131K | 614 | 307 | 161 |
| 1 | cascade | 4 | ~134K | 1196 | 299 | 358 (shared prefix counted 4x) |
| 7 (verify) | attn_batch | 1 | ~131-134K | 1035-1051 | ~1045 | ~100 |
| 7 | cascade | 2 | ~134K | 2087 | 1043 | 102 |
| 7 | cascade | 3 | ~210K | 4764 | 1588 | 105 |
Findings:
* The verifier costs **2.0x the draft per request** at the same context, and runs at only ~100 GB/s KV-only.
* The cascade (shared-prefix) path **helps draft ~1.8x but gives verify nothing** (1043 vs 1045 us/req).
  Verify per-request cost is linear in context (1045 us x 210/134 = 1640 ~ 1588 measured).
* So in the shared-prefix 4-way bench, per-step verify attention ~ 4 req x 16 layers x ~1.6 ms ~ 100 ms at
  200K (ESTIMATE from measured per-call times). That is the largest term that grows with concurrency.

## 2. Bottlenecks ranked
1. **Verifier attention** (high confidence that it's the dominant concurrency term; MEASURED-LIVE): 2x the
   draft cost, linear in batch, no cascade benefit.
2. **Verifier split-workspace traffic** (medium; ESTIMATE): see section 3. It is consistent with verify
   ~ 2x draft at the same KV bytes, but S1 compute on 48 rows vs 8 is a competing explanation that
   only the blocked split-timing/PARTIAL_FP16 A/B can separate.
3. The draft is reasonably efficient (~57% of peak with workspace counted); low priority.
4. Register pressure/spills: ruled out for the live kernels (COMPILER): every PF16 S1/S2 kernel used in
   production compiles to 128 GRF, SIMD16, **0 scratch/spill**. Only the unused fp32 generic S1
   spills 512 B. (`kstudy/kernel-resources.txt`)
5. Unexplained: E2E 4-way aggregate (77 tok/s) < 1-way (94) at 200K is worse than linear attention
   alone predicts. MTP acceptance and non-attention terms weren't measured per step. **Not determined.**

## 3. Memory traffic (ESTIMATE, per 64-token page per KV head; c4 source)
KV read: 64 x (256 K + 128 V + 12 scales) = 25,344 B.
* Draft (`S1PagedSmall`, c4:638-805): stores only 8 rows fp16 = 4,096 B, read back by S2, so
  workspace = 8 KB = **0.32x KV**. Total ~1.32x KV, ~259 GB/s effective, ~57% of 456.
* Verify (`S1PagedReuse<64>`, compact SLM; dead sub-groups skipped, c4:1135): 48 rows fp16 = 24,576 B,
  so workspace = 49 KB = **1.94x KV**. Total ~2.9x KV, ~292 GB/s effective, ~64% of peak.
* The earlier "2.6x" claim was wrong for draft (0.32x) and about right for verify (1.9x extra).
* Hardware bandwidth counters: not collected (needs the GPU window; unitrace/PTI not tried on prod).

## 4. Experiments
None run: blocked. Historical results to avoid repeating: serial vs parallel S2 (done, parallel kept),
all-GEMM W4A8 (rejected), PARTIAL_FP16 and COMPACT_SLM (already live).

## 5. Improvement potential (PROJECTION only)
Multi-page verifier splits (P pages per program; online softmax across pages; one partial per P pages):
the verify workspace drops from 1.94x to 1.94/P x KV. At constant ~292 GB/s effective, P=4 gives
(2.94/1.49) ? **1.97x faster verify attention**, ~-50 ms per step at 200K x4 (of ~100 ms verify).
If verify is instead S1-compute-bound (48-row DPAS), the gain is small: this is the hypothesis to test first.

## 6. Next highest-value experiment (decisive, ~10 min GPU once unblocked)
Production lib, fixture 128K/200K, q_len 7, batch 1/4, `XE2_KV_TIME_SPLITS=1`, `XE2_KV_PARTIAL_FP16=0/1`:
* If S2 + workspace time scales with partial bytes (fp32 roughly doubles the verify time delta), the
  workspace is the bottleneck, so build multi-page verifier splits (P=2/4/8) from c4 and screen.
* If S1 dominates and is insensitive to fp32 vs fp16, the cost is compute/occupancy, so trim the verifier
  to 42 rows / BM=48 tiles instead.
Correctness reference: dequantize K/V (dequant.py) and run fp32 SDPA; tolerance as in tests/test_kernel_xpu.py.

## 7. Reproduction and artifacts
* Live profiler data: `~/ops/vllm-telemetry/attn-profile/*.jsonl`; analysis:
  `python3 tools/analyze_attn_profile.py ~/ops/vllm-telemetry/attn-profile`; snapshot `results/live-profile-1.json`.
* E2E: `results/conv-{off,off2,on}-*.json`, `results/cmp-*.txt`.
* Compiler study: `kstudy/` (c4 source sha256 982cad72?, AOT lib `kstudy/out/libxe2_kv_c4_aot.so`,
  IGC dumps `kstudy/out/igc/`, `kstudy/kernel-resources.txt`, hashes `kstudy/sha256-sources.txt`).
  Build: oneAPI 2025.3.2 from the host, mounted into a throwaway CPU-only container of the vLLM image,
  `-fsycl-targets=spir64_gen -Xs "-device bmg-g21"`. Production lib source: missing (kv-sweep-opt-20261015 is gone).
* Isolated bench (ready, not run): `tools/k8v4_attn_splits_bench.py --sweep default`.

---
# UPDATE 2026-11-04 15:15 ET: blocker cleared, funnel A/B run (production library)

Restart: vLLM recreated once at `--gpu-memory-utilization=0.90` (everything else identical, profiler on).
Down 19:58:47Z, healthy 20:06:33Z (**~7.8 min**). Test completion OK. KV pool 753,004 tokens (was 814,581),
"max concurrency 2.87x" at 262K. GPU0 frees ~1.7 GiB. Rollback container: `vllm-k8v4-tp2-before-gmu090-20261104T195848`.
Paused during the window and restored afterwards (`results/paused-20261104.txt`): fstrim.timer, ai01-branch-cleanup.timer,
e2scrub_all.timer, forgejo-runner + wrapzii-server-runner + 4 CI job containers (docker pause/unpause; nothing killed),
vllm-healthcheck.timer + /run/vllm-intentional-stop. Outside vLLM load before the runs: 0 running / 0 waiting.

All numbers below are **MEASURED, PRODUCTION library** (libxe2_kv_cascade.so sha256 f1565f84?), isolated process
in a throwaway container on GPU0, fixture built directly (seed 1234, one layer, HKV=2), production XE2_* knobs.
Combined = torch.xpu.Event p50 of 30-40 reps. S1/S2 = the library's own `XE2_KV_TIME_SPLITS` host-timed split (10 reps).
p10-p90 spread is <1% except a few outliers. Batch reuses the same physical pages per request (KV >> L2, so it still reads DRAM).
`attn_batch` (non-cascade) is the unique-context case.

## A. Decisive test: verifier q_len 7, PARTIAL_FP16 0 vs 1 (us per request)
| ctx | b | pf16 | S1 | S2 | total | est workspace MB/req |
|---|---|---|---|---|---|---|
| 131072 | 1 | 0 | 904 | 466 | 1408 | 403 |
| 131072 | 1 | 1 | 748 | 269 | 1044 | 201 |
| 204800 | 1 | 0 | 1398 | 722 | 2145 | 629 |
| 204800 | 1 | 1 | 1151 | 402 | 1584 | 315 |
| 204800 | 4 | 0 | 1397 | 714 | 2120 | 629 |
| 204800 | 4 | 1 | 1152 | 401 | 1557 | 315 |
Halving the workspace bytes (157 MB less written in S1 and 157 MB less read in S2 at 200K) cut S1 by 247 us and S2 by 321 us.
**Time tracks workspace bytes**, and the marginal cost is close to DRAM speed (~490-630 GB/s apparent, which means part of
the write is absorbed by L2). Outputs are identical (max |diff| 4e-6).

## B. Broad sweep, pf16=1 (us per request; full table in results/kernel/broad.jsonl)
| ctx | draft S1 / S2 / total | verify S1 / S2 / total | verify/draft |
|---|---|---|---|
| 2K | 57 / 58 / 204 | 93 / 33 / 239 | fixed-overhead bound (~200 us/call) |
| 32K | 105 / 29 / 163 | 201 / 83 / 314 | 1.9x |
| 128K | 450 / 61 / 540 | 744 / 268 / 1044 | 1.9x |
| 200K | 690 / 88 / 809 | 1151 / 402 / 1585 | 2.0x |
* **Concurrency:** us/req is flat in batch (200K verify b1/b2/b4 = 1585/1566/1558). There is no contention or geometry
  penalty: the op runs requests serially, so the per-step attention cost is exactly linear in concurrent requests.
* **Achieved bandwidth (KV + estimated workspace):** S1 draft 200K (162+26 MB)/690 us = 272 GB/s, S1 verify
  (162+157)/1151 = 277 GB/s, S2 verify 157/402 = 391 GB/s (86% of 456). Verify S1 exceeds draft S1 by almost exactly
  its extra workspace bytes at the same ~275 GB/s.
* **Existing knobs re-checked** (production values already best): S2_NSG_VERIFY 8 ? 16/32 makes verify S2 slower
  (402 ? 515/441 us at 200K); COMPACT_SLM 0 makes verify S1 slower (1151 ? 1418); SMALL_S1 0 makes draft S1 slower (690 ? 1000).

## Verdict: bandwidth (intermediate traffic), not compute
* S2 is pure workspace bandwidth (86% of peak). S1 time is proportional to KV + workspace bytes at ~275 GB/s
  (60% of peak) for both draft and verify, despite 6x more live rows in verify. That rules out DPAS/row compute as the
  differentiator. Spills are ruled out (compiler study).
* Verify workspace is 1.94x KV bytes per request (measured to matter by the pf16 A/B). It's the largest removable cost.
* The 4-concurrency loss at long context: the attention cost is linear in requests (measured). Per step at 200K x4,
  verify attention is ~16 layers x 4 x 1.56 ms ? 100 ms (combined measured x layer count). The remaining superlinear
  E2E loss (77 vs 94 tok/s) still points at outside-attention effects (MTP acceptance/scheduling). **Not measured.**

## Next optimization (justified): multi-page verifier splits
P pages per S1 program (online softmax across pages, one 48-row fp16 partial per P pages). PROJECTION from
the measured ~277 GB/s (S1) and ~391 GB/s (S2) at 200K:
| P | ws MB/req | S1 | S2 | total | speedup |
|---|---|---|---|---|---|
| 1 (now) | 315 | 1151 | 402 | 1585 | 1.0x |
| 2 | 157 | ~875 | ~200 | ~1075 | ~1.5x |
| 4 | 79 | ~730 | ~100 | ~830 | ~1.9x |
Draft at P=4: ~809 ? ~650 us (~1.2x). At 200K x4 this removes ~45-50 ms of verify attention per step (projected).
A second-order S1 item: S1 reaches only 60% of peak (8-byte V loads, per-page Q reload). Try 16-byte V loads after P.
Implementation needs a rebuild from the c4 source (closest available) and a correctness check against fp32 SDPA. Not done,
and nothing promoted.

## Reproduce
`results/kernel/run.sh <name> --ctx 131072,204800 --batch 1,4 --qlen 7 --pf16 0,1` (throwaway container,
production lib + package read-only, GPU0). Knob overrides: `NSGV=16|32`, `CSLM=0`, `SMALLS1=0`. Files: `results/kernel/
{decisive,broad,nsgv16,nsgv32,cslm0,smalls1off}.jsonl`, hashes `results/kernel/sha256.txt`.
