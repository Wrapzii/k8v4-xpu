# KV sweep optimisation, 2026-10-15 (agent worktree)

> Published copy. Host-specific paths and addresses are redacted to placeholders: `<HOME>` (server home), `<DATA_DIR>` (server data disk), `<SRV>`, `<BOX_WORKSPACE>`, `<DESKTOP>`, `<DESKTOP_HOME>`, `<DESKTOP_REPO_CLONE>`, `<TAILSCALE_IP>`, `<FORGE_HOST>`. Paths such as `/opt/k8v4`, `/opt/venv` and `/w` are container-internal. Small receipts are in [`2026-10-15-kv-sweep-opt/receipts/`](2026-10-15-kv-sweep-opt/receipts/); binaries, tensors, traces and docker-inspect receipts are not checked in.

Everything below lives in `<HOME>/agent-work/kv-sweep-opt-20261015/` on ai01. Production
(vllm-k8v4-tp2, /opt/k8v4/libxe2_kv.so e789e4f9…, launch_production.sh) was not touched.
No GPU work was run: the sweep (`sweep.py`, sweep-20261015T195903Z) was running the whole
time and GPU memory read 24.2–24.5 GB used per card. Numbers marked **ESTIMATE** are model
outputs and were not measured.

## 1. Exact shared-prefix cascade (implemented and built, GPU-unverified)

### Files
| file | what |
|---|---|
| `xe2_kv_cascade.cpp` (sha e98970cf…) | deployed source `ref/xe2_kv_lookahead.cpp` (982cad72…) + patch below |
| `cascade_block.cpp` | the new code, appended inside the anonymous namespace |
| `patch_cpp.py` | reproducible patch (asserts anchor counts) |
| `libxe2_kv_cascade.so` (sha cf32e82d…) | CPU-only build: capped compile container, `--cpus 1 --memory 1200m`, nice 19, no network, no GPU devices. Took 29 s, 0 errors |
| `k8v4-opt/k8v4_v030/{cascade.py, backend.py}` | Python integration (copy of the container package + patch) |
| `tests/emulate_cascade.py` | CPU emulator, schedule-level exactness |
| `tests/test_cascade_xpu.py` | GPU test for the exclusive window |
| `build-cascade.sh`, `run-build.sh`, `check_load.py` | build and schema check |

### C++ diff summary
* The three per-request S1 kernels (small q1, generic, compact-SLM reuse q7) gain an optional
  `page_begin` pointer (default `nullptr`, so production behaviour is unchanged). It adds one
  work-group-uniform early return, `logical < page_begin[0]`.
* New `launch_cascade_plan`: one 256-thread work-group computes the shared page count `S` on
  the device, so the cascade is graph-capture legal.
  * A request participates if it has at least one full page that every one of its query rows
    can see.
  * `S` = the first block-table entry where any participant differs from the leader (× ratio),
    clamped to the shortest participant's full pages, the extra-memory cap and `n_splits`.
  * `S = 0` when fewer than 2 requests participate. That is exactly the serial schedule.
* New `launch_cascade_s1_packed` (drafter q1, 4×6 = 24 rows): the generic S1 body walks the
  shared pages once with every request's rows in one Q tile, at rows 8..31.
  * Rows 0..7 are left alone because the q1 tails (small kernel) publish rows 0..7.
  * Results go to the normal workspace slots, so no extra memory is needed.
* New `launch_cascade_s1_multi` (verifier q7): the reuse-kernel body is copied verbatim, with a
  loop over requests inside each (page, head) work-group.
  * The K/V page and its scales come from DRAM once and are re-read from cache for requests
    1..B-1.
  * Request 0 writes the normal workspace. Requests 1..B-1 write an extra fp16 region.
* New `launch_s2_cascade_half` (8/16/32 subgroups): a copy of the deployed fp16-partial
  parallel S2.
  * Same `n_live`, same chunking and lookahead, same LSE merge order.
  * The only change is the address of pages `s < S`.
* New op `int8k_int4v_attn_batch_cascade(...)`: same arguments as `int8k_int4v_attn_batch`,
  plus `casc_q8, casc_qsc, casc_plan, casc_part, casc_m, casc_l, cap_pages, slot_rows`.
  * It falls back to the serial op unless `XE2_KV_CASCADE=1`, 2 ≤ B ≤ 8, fp16 out, parallel
    S2, `XE2_KV_PARTIAL_FP16=1` and two-pass off.
  * Mode 1 (packed) needs q·6 ≤ 8. Mode 2 (multi) needs q=7 with `XE2_KV_COMPACT_SLM=1`.
* Schema check: the library loads under torch (CPU, compile container), and both ops register
  with the expected schemas.

### Why it is bit-exact (argument, not yet a GPU measurement)
* All S1 arithmetic is per row: int32 DPAS for QK, per-row q scale, per-row max and sum, and the
  same DPAS tile order for PV. A row's partial for a page therefore does not depend on which
  other rows share the tile or which work-group computes it.
* The source already relies on this: it notes the small kernel is bit-identical to the generic
  one.
* S2 visits the same pages in the same order with the same chunking. Only the source address
  changes.

### Verification done (CPU)
`tests/emulate_cascade.py` models what every kernel writes (slots, rows, padding publication,
skipped pages) and what S2 reads (n_live, chunking, float32 merge). Every workspace starts as
NaN.
* It ran 32 cases: q1/q7 × pages_per_block 1/2 × {full sharing, partial sharing with an
  interior mismatch, no sharing, short request + dummy, short request first, cap smaller than
  the shared prefix, a request shorter than the prefix, B=2}.
* Result: **0 bit differences and 0 NaN in all 32 cases.** It passes on my box and inside the
  compile container on ai01.
* Mutation checks show the emulator catches real bugs:
  * packing the q1 rows at row 0 (my first design) fails 2 cases;
  * an extra-region base off by one fails 11;
  * a plan that ignores block-table mismatches fails 18.
* **Not measured: max abs/rel error against the current GPU kernel.** It needs the window
  (test plan below). The expected result is 0 / 0 (bitwise).

### Deviations from proposed/shared-prefix-fusion.md
1. The shared prefix is found on the device (longest common block-table prefix of the
   participating requests), not detected on the host. This keeps the op graph-legal and lets
   it degrade to the serial schedule.
2. For the q7 verifier, per-request partials are kept, so partial-store and S2 traffic is
   **not** shared. Only the KV read is. The REPORT's rank-1 figure (prefix cost ≈ one C1 walk)
   is therefore too optimistic for the verifier. The drafter (q1) gets the full benefit.
3. The q7 path needs extra memory: (B−1)·HKV·cap·48·256·2 B. With cap = 3200 pages and B = 4
   that is 472 MB, plus 7.4 MB M/L, per GPU. A candidate launch should use
   `--gpu-memory-utilization 0.93` instead of 0.95. Pages beyond the cap fall back to tail
   walks.
4. It is bit-exact, rather than the doc's "fp16-partial bound" accuracy target.
5. Padding or dummy requests with seq_len 0 read stale workspace in both schedules. Their rows
   are discarded, but they are excluded from the exactness claim.

### Effect on the 166 ms step (all ESTIMATE, bandwidth model from REPORT byte counts)
* Verifier full-attention at C4: 6.08 → about 4.5–5.5 ms per layer. Over 16 layers that saves
  about 9–26 ms per step.
  * Logical bytes go from about 1786 MB to about 1310 MB per layer. The lower saving applies if
    the kernel is issue-bound, not bandwidth-bound.
* Drafter full-attention (q1) at C4: about 3.0 → 1.25 ms per draft pass, saving about 10.5 ms
  per step (6 drafts).
* Step time about 130–146 ms, or about 120–135 combined t/s, against 106 (pure decode). This
  assumes requests really share the 200K prefix. The sweep's "shared" scenario reports
  hit_frac 0.98.
* With no sharing (`unique-*`), the plan gives S = 0. The expected cost is one extra tiny plan
  kernel, plus one extra launch and Q pack per layer (ESTIMATE < 0.05 ms per layer).

### Python integration
* `cascade.get(device, hkv, count)` returns `None` (use the serial op) unless
  `XE2_KV_CASCADE=1` and 2 ≤ count ≤ `K8V4_CASCADE_MAX_B` (default 4).
* It allocates lazily and never inside a capture: a first call during capture falls back to
  serial. Allocate-before-capture is a TODO if warm-up does not hit decode eagerly.
* `backend._attn_batch` calls the cascade op when `casc` is not `None`. Otherwise the code path
  is the original one.
* The drafter's full-attention layer goes through the same `_attn_batch` (packed mode), so it
  is covered with no extra code.

## 2. New S1 scheduling to raise EU active (51%): design only, not implemented
Bit-exactness for #1 required leaving S1's per-page structure intact, so #2 is a separate,
flag-gated change.
* **Chunked S1** (flash-decoding inside S1): one work-group walks CH consecutive pages
  (CH = 4–8) with an online softmax in registers/SLM, and writes one partial per chunk.
  * Partial stores and S2 reads, which are about 288 MB of the about 446 MB logical per q7
    request, shrink by a factor of CH.
  * Work-groups and barriers per layer drop by CH×, and DPAS issue stays dense.
  * Combined with the q7 cascade (loop requests inside the chunk), it also removes most of the
    cascade's extra memory.
* **Not bit-exact** against production: the merge order changes. It is LSE-exact and must be
  validated against an fp64 reference, reporting max abs/rel. The bitwise test cannot apply.
* ESTIMATE: verifier per-layer bytes ~1786 → ~950 MB at C4 with the cascade and CH = 4.
  Requires a kernel-level profile (VTune EU active) in the window.

## 3. Daniel's item #4: graph gaps and TP all-reduce overlap
**What the earlier attempt did** (perf-20261014: comm_overlap_bench.py, allreduce_bench.py,
logs):
* It overlapped a 43 MB **prefill** all-reduce with a GEMM in **eager** mode, with async
  all-reduce issued before the GEMM.
* Results: GEMM 5.33 ms, AR 5.85 ms, serial 10.10 ms, "overlapped" 10.36 ms (no gain). The int8
  variant was 12.06 ms. An async-SDPA prefill trial also showed no gain.

**What was wrong with it:**
1. Wrong regime. Decode all-reduces are 40–287 KB (B·T × 5120 fp16 — hidden 5120 inferred from
   the brief's 72–287 KB sizes) and latency-bound. 43 MB is bandwidth-bound over host-routed
   PCIe (topology NODE, about 9 GB/s), where both operations fight for the same PCIe/copy
   resources.
2. Eager timing. The handoff itself says small collectives are "host launch dominates; the
   graph-captured decode path is not represented". Production decode runs FULL_DECODE_ONLY
   graphs, so eager 1.1–1.5 ms per collective says nothing about the replayed cost.
3. There was no real concurrency.
   * The async all-reduce and the GEMM were issued from the same thread onto the same
     in-order compute queue, with no side stream and events.
   * oneCCL's PCIe path can block the host thread until the collective is enqueued or done.
   * So the GEMM was serialised behind the collective, which matches 10.36 ≈ 10.10.
   * The int8 path also waited on only the first gather.
4. There was no independent work. Each all-reduce in a decode layer feeds the residual and norm
   of the next sub-layer, so overlap needs a second micro-batch.
   * vLLM's DBO (`--enable-dbo`) exists in the container, and `xpu_worker` sizes workspaces for
     2 ubatches.
   * However, its yield points (`dbo_yield` / recv hooks) are only in the fused-MoE all2all
     prepare/finalize paths. For this dense TP model, DBO cannot overlap the TP all-reduce.
     This was checked read-only in the container: grep of
     `/opt/venv/lib/python3.12/site-packages/vllm`.

**Redo:**
* `docs/decode_ar_overlap_bench.py` (2 ranks, `torchrun`, production CCL env) measures, at
  decode sizes (T = 4 and 28):
  * eager versus **graph-replayed** per-op latency;
  * GEMM and all-reduce on separate streams with events inside one captured graph, in both
    issue orders;
  * a dependent GEMM → AR chain.
  Re-run it with `CCL_SYCL_COPY_ENGINE=0/1` and LL variants.
* Gate further work on its numbers and on the stage timer (proposed/decode-stage-timer.md).
  REPORT budgets about 3 ms per step for all-reduce (medium-low confidence) and about 9 ms for
  host/graph gaps (low).
* If graph-replayed all-reduce is ≥ 2 ms per step and side-stream overlap works, implement a
  2-micro-batch split in the model forward. That means custom hooks in XpuCommunicator, not
  DBO.
* Not implemented beyond the benchmark: there is no measurement yet that justifies the model
  surgery.

## Exclusive GPU window plan (needs Daniel's approval: production downtime)
Preconditions:
* the sweep is finished (`pgrep -f sweep.py` is empty);
* `vllm:num_requests_running` is 0;
* the restore receipt is saved: `docker inspect vllm-k8v4-tp2 > <HOME>/agent-work/kv-sweep-opt-20261015/receipt-before.json`
  and `sha256sum <DATA_DIR>/model-validation/launch80-20261013/perf-layout-merge-20261015/libxe2_kv_lookahead.so` (host source of /opt/k8v4/libxe2_kv.so, expect e789e4f9…).

A. Kernel exactness and latency (about 10–15 min of downtime, ESTIMATE):
```
docker stop vllm-k8v4-tp2
W=<HOME>/agent-work/kv-sweep-opt-20261015
IMG=$(docker inspect -f '{{.Config.Image}}' vllm-k8v4-tp2)
RUN="docker run --rm --entrypoint bash --device /dev/dri --group-add 992 -v $W:/w -v <DATA_DIR>/model-validation/launch80-20261013/perf-layout-merge-20261015/libxe2_kv_lookahead.so:/prod/libxe2_kv.so:ro -e PYTHONPATH=/w/k8v4-opt $IMG -c"
$RUN "cd /w/tests && XE2_KV_LIB=/w/libxe2_kv_cascade.so python3 test_cascade_xpu.py --save /w/cand.pt"
$RUN "cd /w/tests && XE2_KV_LIB=/prod/libxe2_kv.so python3 test_cascade_xpu.py --serial-only --save /w/prod.pt"
$RUN "cd /w/tests && python3 test_cascade_xpu.py --compare /w/prod.pt /w/cand.pt"   # bitwise, max abs/rel
# repeat the first two with --ratio <production pages_per_block>
```
* Memory: about 1.6 GB on one GPU.
* Pass criteria: `bitwise_equal` is true for every q1/q7 × share case,
  `graph_replay_bitwise` is true, and the plan S equals the shared pages.
* It also prints ms per call for the serial and cascade ops.

B. Optional serving A/B (about 45–60 min, ESTIMATE; most of it is 200K prefill warm-up at
about 175 s per prompt):
* Run a candidate container on port 8101, built from `docker inspect` of production.
* Differences from production: the library mount is libxe2_kv_cascade.so, `/w/k8v4-opt` is
  first on PYTHONPATH, `XE2_KV_CASCADE=1`, and `--gpu-memory-utilization 0.93`. Do **not**
  edit launch_production.sh.
* Run the `shared 200 C4` point of sweep.py against 8101. The baseline from today's sweep is
  shared 200K C4 rep1, comb 98.9 t/s, per_med 23.4.
* Add the stage-timer profile and `decode_ar_overlap_bench.py` here, with production down.

C. Restore: `docker rm -f` the candidate, then `docker start vllm-k8v4-tp2`. Check
/v1/models, check that the lib sha is e789e4f9…, and run one short request.

## Window A results (2026-10-15, 5:12–5:18 PM ET; raw: win/{cand,prod}.log, win/compare.json.log, win/window.log)
Test: 200K-token contexts (seq 200050+37i), B=4, one GPU each (cand on GPU0, production lib serial on GPU1),
pages_per_block 33 (production, 2112-token blocks) and 1; shares 100/98/90/0 %.
* Exactness: cascade op vs CURRENT production kernel (e789e4f9…): bitwise equal in all 16 cases,
  max abs 0, max rel 0, all finite. Candidate lib serial op vs production: bitwise equal in all 16.
  XPU graph capture + replay after rewriting block tables/seq_lens in place: bitwise equal in all 16.
* Latency (ms per layer-call, eager, 30 iters, pages_per_block 33; ratio 1 within ~2 %):
  | case | serial | cascade |
  |---|---|---|
  | q1 drafter share 100 % | 3.20 (prod 3.11) | 1.64 |
  | q1 share 98 % | 3.00 | 1.67 |
  | q1 share 90 % | 3.00 | 1.79 |
  | q1 share 0 % | 2.97 | 3.00 |
  | q7 verify share 100 % | 6.06 | 7.17 |
  | q7 share 98 % | 6.06 | 7.16 |
  | q7 share 90 % | 6.07 | 7.14 |
  | q7 share 0 % | 6.05 | 6.06 |
* Conclusion: drafter (packed) cascade lands: -45 % per call at 98-100 % sharing. Verifier multi-request
  loop is 18 % SLOWER (the per-request partial traffic dominates and 4x-longer work-groups lose
  occupancy), so it is now opt-in (XE2_KV_CASCADE_VERIFY=1) in xe2_kv_cascade.cpp (sha 6a4b7c8c…,
  libxe2_kv_cascade_v2.so sha 400d1265…, CPU build only, not GPU-retested; the gate only changes mode selection).
  The window-tested source/lib are kept as *.window-tested.*.
* ESTIMATE step impact: drafter full-attention 6 calls/step x ~1.35 ms = ~8 ms/step at 200K C4 shared
  (166 -> ~158 ms, ~+5 % t/s). With q7 verify cascade enabled it would be +17.7 ms/step (worse). The
  verifier needs the chunked/shared-partial design (#2) to benefit.

## #2 Chunked S1 (+ verifier cascade) — built CPU-only, NOT yet GPU-tested (2026-10-15, ~5:40 PM ET)

**Flags (all default off; production env unaffected):** `XE2_KV_CHUNK=4|8` enables chunked S1 in the
cascade op; `XE2_KV_CASCADE=1` keeps the window-A cascade; `XE2_KV_CASCADE_VERIFY=1` is required for the
q7 multi cascade (chunked or not). With none set the op is the window-A-tested serial path.

**Design.** One work-group walks CH consecutive pages (64 tokens each) with an online softmax: per-row m/l
in registers, fp32 accumulator (rows x 256) in SLM after the 8 KB base region, P in unnormalized fp16,
accumulator rescaled by alpha per row, one normalized fp16 partial + M + L per unit. S2 (parallel LSE
merge, unchanged NSG) runs over n_units = ceil(n_live/CH). The cascade plan rounds the shared page count S
down to a multiple of CH, so shared units never straddle the boundary. q1 packed cascade: shared units are
computed once for all requests (rows start at TM=8, as in window A). q7 cascade: requests loop inside
the work-group; the per-request extra region is capU = cap_pages/CH units (CH=4: 118 MB instead of 472 MB).
Deviation from bit-exactness: chunked output is LSE-exact but not bitwise equal to production (different
fp16 rounding points). Chunk+cascade is designed to be bitwise equal to chunk-only.

**Files (ai01, this worktree):** `chunk/chunk_block.cpp`, `chunk/patch_chunk.py` → `xe2_kv_chunk.cpp`
(af45647d…), `libxe2_kv_chunk.so` (26b7e64b74fc53bd…, CPU-only build in capped container, exit 0, 32 s; op
loads, schema `xe2_kv::int8k_int4v_attn_batch_cascade` unchanged), `k8v4-opt/k8v4_v030/cascade.py` +
`backend.py` (agent copy only; production /opt/k8v4-opt untouched; diff = backend.py + new cascade.py),
`tests/emulate_chunk.py`, `tests/test_chunk_xpu.py`, `tests/dryrun_chunk.py`, `window2.sh`,
`chunk/ab_launch.py`, `chunk/make_ab_sweep.py` → `ab_sweep.py`.

**CPU emulator (fp64 reference, head_dim 32, 64 cases: q1/q7 x CH4/8 x block ratio 1/3 x {share100,
share98, share90, partial-mismatch, share0, short+dummy, cap, short-seq}), NaN-poisoned workspaces:**
ALL OK. Worst abs error vs fp64: q1 chunk 9.4e-4 (production-model 9.4e-4), q7 chunk 1.48e-3
(production-model 7.3e-4 in the same case); worst rel ~0.8% (rel floor 1e-2). Bound: chunk error
<= max(2 x production error, 2e-3). chunk+cascade == chunk-only bitwise in all 64 cases.
Note: on ai01's numpy 2.2.6 the first emulator version showed 10 q1 bitwise mismatches; cause was BLAS
choosing different kernels for different row counts (packed vs per-request tiles) — an emulator artifact,
since a DPAS row's reduction does not depend on tile row count. Emulator now computes products row-wise
(`emulate_chunk.v1.py` kept). The GPU test checks chunkNc == chunkN bitwise directly.
**Planted bugs (64 cases each):** no_rescale 64 fail, mask_off_by_one 32, no_round 33, bad_row_off 22,
bad_region 22 — every mutation detected.

**ESTIMATE (not measured; conservative — the last bandwidth estimate was wrong in direction).** Window A
showed q7 is not bandwidth-bound (cascade cut traffic yet was 18% slower). Chunking also raises SLM per
WG (q7: 56 KB, q1: 16 KB, packed: 40 KB), lowering occupancy. Verifier (q7, 200K C4) per layer call:
serial 6.06 ms measured; chunk alone ESTIMATE 5.5–6.5 ms, could be slower; chunk + verify cascade
ESTIMATE 5.5–7 ms. Drafter q1: chunking ESTIMATE neutral to small vs the measured 1.64–1.67 ms
cascade. No gain is claimed until measured.

**#4 status.** vLLM DBO only yields in fused-MoE all2all paths, so it cannot overlap TP all-reduce in this
dense model. `docs/decode_ar_overlap_bench.py` (torchrun 2 ranks, xccl; eager vs graph per-op latency,
side-stream overlap in both issue orders, dependent chain; T = 4, 28; hidden 5120 and per-rank MLP 8704
confirmed from config.json) is ready for window 2 (production CCL env, then CCL_SYCL_COPY_ENGINE=0).

**Window 2 plan (`window2.sh --approved [--ab]`; refuses to run without --approved; NOT run):**
preflight (no sweep, two idle metric reads, inspect + lib sha receipts, free -m) → docker stop →
in parallel: chunk lib on GPU0 (serial/casc/chunk4/chunk8/chunk4c/chunk8c, fp64 reference, graph replay)
and production lib `--serial-only` on GPU1, q1/q7 x ratio 33/1 x share 1.0/0.98/0.0, 200K C4, 30 iters
(timeout 600 s each) → AR bench x2 (timeout 240 s each) → optional `--ab`: copy cache-stack, candidate
on 127.0.0.1:8101 with chunk lib + XE2_KV_CASCADE=1 only (VERIFY/CHUNK unset), shared-200K warm x2,
C1, C4 x2, 2048 out (timeout 1500 s), compare with today's sweep → restore trap (docker start, /v1/models,
lib sha, one completion) → CPU compare prod vs candidate. Durations are ESTIMATES: kernel + AR ~8–9 min
+ ~5.5 min restart ≈ 14–15 min downtime; with A/B ≈ +15 min → ~30 min.

## Window 2 rerun (6:11–6:18 PM ET) and window 3 (6:35–7:00 PM ET), 15 Oct 2026

### Window 2 rerun: chunked S1 (#2) kernel tests, fixed test script (7.0 min downtime)
- Exactness: chunk4/chunk8 matched serial's fp64 error. chunk+cascade was bit-identical to chunk-only.
- Speed (ms per layer call, 200K, B4): it was slow.
  - q1: chunk4/8 5.8–5.9 (with cascade 4.1–4.7) vs serial 3.07.
  - q7: chunk 21.5–21.8 vs serial 6.03.
  - Drafter per-page cascade: 1.59–1.79.
- Cause (inferred): the SLM fp32 accumulator (64 rows × 256 × 4 B = 64 KB, plus 8 KB per work-group) limits occupancy.

### Window 3: verifier cascade v3 (sub-group packed), P2P all-reduce prototype, TP2 serving A/B (25.1 min downtime)
Kernel ms per layer call, 200K, B4, block 2112:

| case | serial | casc | vsg2 | vsg4 |
|---|---:|---:|---:|---:|
| q7, 100% shared | 6.05 | 7.09 | 6.57 | 7.40 |
| q7, 98% shared | 6.03 | 7.08 | 6.58 | 7.40 |
| q7, 0% shared | 6.04 | 6.05 | 6.12 | 6.13 |
| q7, B3, 98% | 4.55 | 5.39 | 5.79 | 6.60 |
| q1 (drafter) | 3.09 | 1.58–1.60 | – | – |

- **Exactness:**
  - Every variant was bitwise equal to serial, and graph replay was bitwise.
  - Serial vs the production library: 12/12 bitwise.
  - fp64 abs error was 1.1e-4 to 4.1e-4 for all variants.
- **Verifier cascade:** packing more requests per work-group made it slower. The per-request partial traffic and compute dominate, not the shared KV read. Not adopted.
- **P2P fused-epilogue all-reduce:**
  - Kernel remote stores ran at 0.48 GB/s. Fused AR took 0.103 ms (T4) and 0.608 ms (T28).
  - Copy engine copy+reduce took 0.047 / 0.060 ms.
  - Not feasible as built (decode AR measured 0.039 ms).
- **Serving A/B on 127.0.0.1:8101, drafter cascade only (`XE2_KV_CASCADE=1`):**

  | | Baseline | Candidate |
  |---|---|---|
  | C1 | 74.3 / 67.3 | 72.8 |
  | C4 combined | 98.9 / 111.8 (acceptance 0.52 / 0.63) | 116.2 / 115.9 (acceptance 0.61) |
  | C4 per stream | 23.4 / 26.7 | 26.4 / 26.9 |

  That is about +4% combined when acceptance is matched.
- **DERIVED:** the drafter cascade saves about 1.49 ms × 6 ≈ 8.9 ms per step.
- **Candidate startup:** the cold compile took 733 s. The compile-cache copy failed with "Permission denied" because cache-stack holds root-only files.
- **Leftover directories, kept and not deleted:**
  - `vllm-cache-copy/`: root-owned, 378 MB. It is the window-3 candidate's compile cache and is reusable by the next candidate.
  - `vllm-cache-copy.tmp/`: about 2.1 GB, the partial failed copy.

### #2b register-accumulator verifier S1 (CPU-side only so far; `XE2_KV_CHUNK=4|8|16` + `XE2_KV_CHUNK_REG=1`)
- **Kernel:** `reg/regacc_block.cpp`, launched as `launch_s1_regacc<HKV,CH>`.
  - Units have the same contract and output layout as `launch_s1_chunk`, so unit S2 and plumbing are unchanged.
  - The fp32 accumulator lives in DPAS accumulator registers: 8 tiles of 8×16 per sub-group, i.e. 64 floats per lane.
  - Work-group = 2 × TPR sub-groups (12 for q7). Sub-group (tile, half) owns 8 rows × 128 V columns.
  - V decode is 2 passes of two 64-column chunks.
  - SLM is 22 KB for q7 (≈1.8 KB per sub-group; SLM-chunk was 72 KB).
  - Same products, reduction order and fp16 rounding points as the SLM chunk kernel, so it is expected bit-identical.
- **Hook:** `reg/patch_reg.py` (applied to `xe2_kv_vsg.cpp`, giving `xe2_kv_reg.cpp` / `libxe2_kv_reg.so`).
  - Applies to the per-request (tail) S1 call.
  - CH=16 is allowed only with REG.
  - `XE2_KV_CHUNK_MINQ=2` keeps the q1 drafter on the per-page cascade.
  - Default paths are unchanged.
- **Emulator** (`reg/emulate_regacc.py`): full head dims, int8 Q/K, int4 V, paged table with ratio, lo_pages, partial pages, causal verify mask, and the aliased NaN-poisoned SLM.
  - 126 cases: ALL OK and bitwise equal to the SLM-chunk model. Worst fp64 relative error 7.7e-4.
  - 8/8 planted bugs caught: pub_col, dec_half, dec_pass, no_rescale_h1, ml_row, qk_half, mask, wg_step.
- **Build** (capped CPU container) and AOT check for bmg-g21:
  - CH=8 and CH=16 compile without spills at 128 GRF.
  - CH=4 spills about 3.
  - The existing multi-cascade kernel spills about 50 (informational).
- **ESTIMATE, unmeasured:** 0 to ~2 ms per layer (0–32 ms per step). Partial traffic is 288 of 446 MB logical per request-layer, and CH=8 cuts it about 8×. But S1 is issue-bound (EU active 51%), and earlier estimates were wrong in direction.

### Rest of the step: ranked opportunities (C4, 200K, MTP6; step 166 ms, ≈157 ms with the drafter cascade). All ms are ESTIMATES unless marked measured.

| # | Opportunity | Est. ms/step | Evidence | Exact? | Settled by |
|---|---|---:|---|---|---|
| 1 | Register-accumulator verifier S1 (CH 8/16) | 0 – ~32 (wide) | Partials are 288/446 MB logical per request-layer; CH=8 cuts ~8×. No spills at CH 8/16. S1 is issue-bound and SLM-chunk was 3.6× slower (occupancy). | bitwise == SLM chunk (emulated) | window 4 A |
| 2 | MTP k=7 (q8 = 48 rows = the same 6 row tiles as q7) | ≈4–5 equiv. (net ~+2.5–3% t/s) | Per-position acceptance ratio ≈0.81 per position → pos-7 cumulative ≈26% → +0.26 tok/step (+5.9%). Cost of one more draft after the cascade: FA 1.6 (measured) + lm_head ~0.85 + MTP layer ~0.3 + M 28→32 GEMM/GDN ~1–2 ≈ +4–5 ms. | exact (spec decode) | window 4 C (optional) |
| 3 | Drafter lm_head: draft-only vocab subset (e.g. top 32K tokens) | ≈3.9–4.9 minus acceptance loss | lm_head is GPTQ int4, vocab 248320, ≈328 MB per card per draft. 6 drafts/step ≈4.5–5.6 ms at 350–440 GB/s. Verifier unchanged, so outputs are unchanged. | exact output | profile (lm_head kernel time); acceptance loss needs token stats |
| 4 | GDN spec-state writes: deferred commit | ≈2.0–2.6 | `fused_sigmoid_gating.py` stores the fp16 state at every one of the T=7 positions (`tl.store` inside `for i_t in range(T)`). That is ≈786 KB per request·layer·rank → ≈1.06 GB written per step. Writing one state and replaying the accepted tokens next step (fp16 round-trip at the boundary) keeps it bitwise. | bitwise (by construction) | profile (GDN kernel ms) |
| 5 | Host / graph-launch gaps | 0 – ~9 (low confidence) | REPORT residual. 6 drafter graph replays plus metadata per step. | exact | profile (device idle per step) |
| 6 | Sampler / rejection | ≤1–3 | Sweeps use temperature 0, and the drafter uses local argmax (`get_top_tokens`). | exact | profile |
| 7 | TP all-reduce overlap / fusion | ≈0 now | Measured: AR 0.039 ms, 0.054 exposed per layer. Side-stream overlap was worse; P2P remote stores ran at 0.48 GB/s. | – | done |
| 8 | Prefill admission staggering | 0 per step | TTFT 5.8–21 s at C4 with a 4224-token budget. This affects end-to-end combined throughput (~27% overlap tax), not step time. | – | – |

Excluding #1, the plausible items (#2–#4) add up to ≈10–11 ms per step. Together with the measured drafter cascade (8.9 ms), that is ≈19–20 ms, against the ≥16 ms target. This is an ESTIMATE with wide error bars. #1 could add 0–32 ms.

### Window 4 plan (prepared, NOT run): `w4/window4.sh --approved [--with-k7] [--cap-s N]`
- **A — kernel tests (≈3 min).**
  - On GPU0: `libxe2_kv_reg.so` with serial, casc, chunk4/8, reg4/8/16 and reg8m/16m at 200K B4 for q1 and q7, ratios 33 and 1, plus an fp64 ref, bitwise pairs and graph replay. Edge cases at seq 3000 and 130.
  - On GPU1: production library serial-only, followed by a bitwise compare.
  - `w4/pick_reg.py` adopts reg only if it is exact, within 1.5× serial's fp64 error, graph-bitwise, and <0.97× serial at q7.
- **B — profiled candidate on 127.0.0.1:8101 (≈13–14 min).** Production Cmd/Env plus the picked flags plus `--profiler-config` (torch; traces to `win4-*/prof`).
  - Warm 200K ×2 (3.3 min measured).
  - 8 s profiled C4 decode window.
  - C1 + C4 2048-token throughput points if the budget allows.
  - The trace is parsed after the restore by `w4/parse_trace.py` into per-step buckets (FA, GDN, GEMM, AR, sampler, memcpy) plus device idle and gaps.
- **C — optional, `--with-k7`.** Candidate with MTP k=7 and graphs [8,16,24,32]: cold compile ≈12 min, then C1 + C4 ×2. Adds ≈20 min.
- **R — restore (≈6 min; 344 s measured in window 3)**, with a trap on any exit. Then verify /v1/models, the library sha and one completion.
- **Downtime ESTIMATE:**
  - A+B+R ≈23 min (≈29 min if the candidate compiles cold); hard cap 35 min (`--cap-s 2100`).
  - With C ≈43–49 min; needs `--cap-s 3000` and separate approval.
- **Risks:**
  - The XPU torch profiler may not record kernels inside replayed graphs. The parser reports "NO DEVICE EVENTS"; the throughput points still run.
  - k=7 is untested in the k8v4 backend.

## Window 4 (7:49:20–8:29:25 PM ET, 15 Oct 2026; 40.1 min downtime, cap 50)
- **Register-accumulator verifier: exact but slow, not adopted.**
  - Exactness: reg4 and reg8 are bitwise equal to chunk4 and chunk8, and graph replay is bitwise. The fp64 error matches serial (1.6e-4 to 2.0e-4 at 200K).
  - Serial is bitwise equal to the production library.
  - q7 at 200K B4, ms per layer call (33-page blocks / 1-page blocks):

    | serial | reg8 | reg16 | chunk8 (SLM) |
    |---:|---:|---:|---:|
    | 6.03 / 6.06 | 14.14 / 14.14 | 14.16 / 14.09 | 21.57 / 21.45 |

  - q1: reg8 12.8 vs serial 3.1. With `MINQ=2`, q1 stays on the cascade and is bitwise equal to casc (1.60 ms).
  - Inferred cause: too little parallelism. 200K / (8 pages × 64) × 2 heads = 782 work-groups, each walking pages serially behind barriers, against 6250 for serial. At seq 3000, CH16 is 6× slower than serial.
- **Flags picked:** `XE2_KV_CASCADE=1` only.
- **Profiler:** it could not see inside the decode graphs.
  - Rank 0 shows only 1360 kernels in 12.3 s, and no GDN or q7 verifier kernels.
  - With the profiler on, steps took 0.51–1.20 s instead of ~0.17 s, so the trace is not representative.
  - Only eager pieces are visible. The drafter cascade op measured 1.59 ms per call, consistent with the kernel test.
- **Serving, shared 200K, 2048 output tokens.** Step = accepted tokens per step ÷ per-stream t/s (DERIVED).

  | run | C1 t/s | C1 acceptance | C4 combined t/s | C4 per stream | C4 acceptance | step C1 / C4 (ms) |
  |---|---:|---:|---:|---:|---:|---|
  | k=6 + drafter cascade (B) | 71.9 | 0.607 | 111.1 | 26.3 | 0.575 | 64.6 / 169.6 |
  | k=7 + drafter cascade (C), rep 1 / rep 2 | 76.9 | 0.642 | 107.5 / 99.1 | 25.6 / 24.1 | 0.568 / 0.514 | 71.4 / 194.6, 190.8 |

  - Earlier references:
    - Window-3 k=6 cascade: C1 72.8; C4 116.2 / 115.9 (acceptance 0.61; step ≈176).
    - Baseline: C1 74.3 / 67.3 and C4 98.9 / 111.8 (acceptance 0.52 / 0.63; step ≈176–179).
    - Today's production sweep: C4 105.4, C1 70.8.
  - **k=7:** one more draft costs +6.8 ms per step at C1 and +21–25 ms at C4 (DERIVED). That is far above the 4–5 ms estimate. Inferred cause: q8 is not on the compact q7 verifier kernel (unverified). Net: +7% at C1, −3% to −11% at C4. Not adopted.
- **Production after restore:** `vllm-k8v4-tp2` (646e52f57a5e) is up, library sha e789e4f9, /v1/models and one completion OK.
