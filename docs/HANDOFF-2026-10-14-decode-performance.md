# Handoff: decode attention performance, 2026-10-14

For whoever continues the K8/V4 performance work. Scope of this change set: the paged decode attention in
`k8v4_v030/native/xe2_kv_ops.cpp`. No model weights, no Python backend and no cache layout changed.
Details and tables: `docs/2026-10-14-decode-attention-partials.md`.

## What the code does now

1. **Live-row gating (always on, bit-exact).** S1 skips sub-groups whose 8 rows are all padding.
2. **fp16 S1 partials (`XE2_KV_PARTIAL_FP16=1`, off unless set, not bit-exact).** S1 stores and S2 reads half
   partials. Max abs difference to fp32 partials 7.6e-6 to 1.5e-5 on outputs of magnitude about 3.7e-3. No
   model-quality evaluation has been run.
3. **Sub-group-parallel S1 for the 1-token draft (on by default, `XE2_KV_SMALL_S1=0` disables, bit-exact).**
   For `q_len * GQA <= 8` the page is spread over all 8 sub-groups (QK by 16-token tile, softmax by row, PV by
   16-column tile). Only with the parallel S2 merge. Bit-identical to the generic kernel on every case tested.

`launch.sh` passes `XE2_KV_PARTIAL_FP16` through when set.

## Production state (ai01, `vllm-k8v4-tp2`, port 8100) at the time of writing

TP2, FP16, MTP6, `--max-num-seqs=4`, `--max-num-batched-tokens=4224`, FULL_DECODE_ONLY graphs, 262144 context.
Native library built from this source with `XE2_KV_PARTIAL_FP16=1` in the container environment. The weights are
read from an SSD copy of the Launch80 target (`/srv/launch80-target-fast`, SHA-256 identical to the HDD original);
a TP2 load takes about 7 minutes (13 to 18 minutes from the HDD at about 57 MB/s). Every previous container is kept
stopped under `vllm-k8v4-tp2-before-<tag>-<timestamp>`. Working files, receipts and scripts are under
`/mnt/hdd-500gb/model-validation/launch80-20261013/perf-20261014/` (`switch_lib.py`, `restore_backup.py`,
`prod_from_ssd.py`, `bench_matrix.py`, `ab_attention.py`, receipts `switch-*.json`).

## Results (128K per rank kernel; end to end on TP2)

| Op, one rank, 131072 tokens | original | now |
|---|---:|---:|
| q1 draft, C1 / C2 | 1306 / 2542 us | 578 / 1089 us |
| q7 verify, C1 / C2 | 1646 / 3247 us | 1217 / 2390 us |

Acceptance-normalised decode cycle (`(1 + 6 * acceptance) / per-stream rate`, final build):

| Context | C1 cycle | C2 cycle | 2-stream growth | decode C1 measured |
|---|---:|---:|---:|---:|
| 8K | 37.8 ms | 45.3 ms | x1.20 | 111 tok/s |
| 32K | 41.2 ms | 52.9 ms | x1.28 | 102 tok/s |
| 128K | 56.8 ms | 84.9 ms | x1.49 | 78 tok/s |
| 200K | 67.6 ms | 106.9 ms | x1.58 | 72.7 tok/s (acceptance 0.65) |

## Targets versus reality (user goal: 3-4K prefill, 200K at ~65 tok/s, <=15% loss at concurrency > 1)

- **200K single stream at ~65 tok/s: met** (60 to 73 tok/s depending on draft acceptance).
- **<=15% loss with 2 streams: not met.** Rate-equivalent loss at equal acceptance is about 17% at 8K, 22% at
  32K, 33% at 128K, 37% at 200K. At 128K and above attention is a per-request cost served serially; even a
  memory-bound kernel cannot reach 15% there. At 8K the extra ~7 ms per request is spread across weight GEMMs
  (about 3), attention (about 1.9), the GDN verify kernel (about 1.2) and small kernels (about 0.9).
- **Prefill 3-4K for one prompt: not met.** About 2.15K tok/s at short and mid context, about 1.2K at 128K.
  One GPU alone does 1.65K, so perfect two-GPU scaling would give about 3.3K; the per-chunk all-reduce (43 MB,
  4.8 to 5.9 ms, about 9 GB/s over host-routed PCIe, about 29% of a chunk) is the gap. Async all-reduce does not
  overlap with compute on this stack (10.36 ms vs 10.10 ms serial) and an eager int8-payload version is slower
  (12.06 ms vs 5.85 ms) and lossy. Two single-GPU replicas reach about 3.4K aggregate (two prompts at once) with
  at most 4% interference, but decode 1.3x to 1.8x slower per stream and hold only about 75K tokens.

## Tried and rejected (do not repeat)

Two pages per S1 program (occupancy loss; slower), a 6-row-block variant for the q7 verify (correct but 5% to 7%
slower), indexed arrays of joint_matrix accumulators (miscompiled: wrong results and NaN), S2 merge widths other
than draft 32 / verify 8 (all slower, re-swept with fp16 partials), `--max-num-batched-tokens=8448` (+1% to +3%
prefill, doubles the decode stall), oneCCL `CCL_SYCL_*` variations (no change).

## Open items, in order of expected value

1. Quality evaluation of fp16 partials against the fp32 path and against the full-precision model (user's plan).
2. Fused quantize-and-exchange all-reduce plus a real overlap mechanism (separate engine) for prefill; needs numerics
   evaluation.
3. int8-QK flash prefill kernel for long context (at most 1.3x on attention, which is about 58% of a 128K chunk).
4. GDN verify kernel and the small per-request kernels (about 1.2 ms and 0.9 ms per request at 8K).

## Caveats

The SSD holding the weights is about 96% full. Draft acceptance varies by output (0.5 to 0.69) and moves tok/s more
than any change here; compare cycle times, not raw tok/s, across runs.
