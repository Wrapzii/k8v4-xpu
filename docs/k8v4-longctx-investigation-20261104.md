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
