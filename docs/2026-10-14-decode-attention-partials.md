# Decode attention: padded-row gating and optional fp16 partials (2026-10-14)

Two changes to the paged K8/V4 decode attention (`k8v4_v030/native/xe2_kv_ops.cpp`). No model weights, no
Python backend and no cache layout changed.

## What was inefficient

Stage 1 writes one 64-row by 256 fp32 partial per 64-token page per KV head, and stage 2 reads the live
rows back. The tile is padded to 64 rows, but a draft step has 6 real rows and an MTP6 verify has 42. At
128K per rank that is about 268 MB of partials written per layer per request against about 104 MB of real
KV. A phase-masked build showed the partial store/merge round trip is about 70% of the q7 verify op;
the compute phases are minor.

## Changes

1. **Live-row gating (bit-exact, always on).** Sub-groups whose 8 rows are all padding skip the QK matmul,
   softmax, PV matmul and the partial stores. They still take every barrier and publish `M=-inf, L=0`.
2. **fp16 partials (optional, `XE2_KV_PARTIAL_FP16=1`).** S1 converts its accumulators to half before the
   store and S2 reads half partials. Only for fp16 output with the parallel S2 merge; every other
   configuration keeps the fp32 path. Not bit-exact: on identical data the maximum absolute difference to
   the fp32-partial kernel is 7.6e-6 to 1.5e-5 for outputs of mean magnitude about 3.7e-3 (about one fp16
   rounding step). A model-quality evaluation has not been run.

## Kernel results (one TP2 rank, 131072 tokens per request, XPU graph replay, `bench/ab_attention.py`)

| Op | original | gating | gating + fp16 partials |
|---|---:|---:|---:|
| q1 draft, C1 | 1306 us | 802 us | 767 us |
| q7 verify, C1 | 1646 us | 1478 us | 1217 us |
| q1 draft, C2 | 2542 us | 1528 us | 1500 us |
| q7 verify, C2 | 3247 us | 2903 us | 2390 us |

Gating is bit-identical to the original on all cases (maximum absolute difference 0.0). The repository's
XPU kernel tests (`tests/test_kernel_xpu.py`: MTP7 parallel-vs-serial at 59K to 70K tokens on 2-head and
4-head layouts, partial pages, dirty tails, prefix copy-on-write) pass with and without the flag.

## End-to-end (production TP2, MTP6, `bench/bench_matrix.py`)

Cycle time is `(1 + 6 * acceptance) / per-stream decode rate`, which removes draft-acceptance variation.

| Context | C1 cycle | C2 cycle | C2 growth vs C1 |
|---|---:|---:|---:|
| 8K | 37.7 ms | 45.8 ms | x1.22 |
| 32K | 41.7 ms | 53.9 ms | x1.29 |
| 128K | 58.2 ms | 86.9 ms | x1.49 |
| 200K | 69.7 ms | 109.1 ms | x1.57 |

At 200K, single stream: 65.9 tok/s measured (code task, acceptance 0.53 to 0.59). The earlier gating-only build
measured 64.9 tok/s at acceptance 0.65, so acceptance-normalised the fp16 partials shorten the 200K cycle by
9% (C1) and 14% (C2). Decode-like pair probe at 128K: C1 +8% from gating alone.

## What did not help

- Two pages per S1 program (half the partials): slower, because the larger shared-local-memory tile cuts
  work-group occupancy (q1 1232 us vs 802 us; q7 1584 us vs 1478 us). Consistent with earlier chunked-kernel notes.
- `--max-num-batched-tokens=8448`: prefill +1% to +3% only, and doubles the decode stall for other requests.
- oneCCL `CCL_SYCL_*` variations: no change in all-reduce time.

## Measurements that bound further work

- Prefill all-reduce (4224 tokens, 43 MB): 4.8 ms, about 9 GB/s over the host-routed PCIe path
  (`xpu-smi topology`: NODE). About 128 per chunk is about 29% of a 4224-token chunk (about 2.16 s).
- Prefill GEMMs are at 80% of fp16 peak (W4A16) and 62% to 70% of int8 peak (W4A8). Decode-size int4 GEMMs
  read weights at 340 to 440 GB/s; M=7 to M=28 costs +5% to +20%.
- Prefill SDPA at 128K history: 75 ms per KV head per 4224-row chunk at 46 TFLOP/s (about 44% of fp16 peak);
  gather/dequant is 1.1 ms. Attention is about 58% of a 128K prefill chunk.
- Per-request decode cost at 8K (graph-free profile, decode steps only): +7.05 ms per extra request
  (GEMMs about 3.0, attention S1 about 1.9, GDN spec kernel about 1.2, other about 0.9).

## Reproduce

```
# A/B one library against another on identical deterministic data (bit-exact / tolerance check):
python bench/ab_attention.py --lengths 131072 --batches 1,2 --save-dir /tmp/base          # baseline library
XE2_KV_LIB=/path/new.so XE2_KV_PARTIAL_FP16=1 python bench/ab_attention.py \
    --lengths 131072 --batches 1,2 --compare-dir /tmp/base                                  # variant
python bench/bench_matrix.py --out results.jsonl --prefill-lens 2048,8192,32768 \
    --decode-lens 8192,32768 --conc 1,2,4                                                   # endpoint matrix
```

- Single-GPU (TP1) replicas, same build: prefill 1.65K tok/s per GPU (2K-8K), 1.37K at 32K, decode C1 70 / 67 / 57 tok/s at
  8K / 24K / 48K; with both GPUs running independently the interference is at most about 4% and the aggregate
  prefill of two simultaneous prompts is about 3.4K tok/s. A TP1 replica holds only about 75K tokens of KV
  (weights 15.04 GiB), so contexts above that need TP2.
- Prefill all-reduce experiments (two ranks, 43 MB message): fp16 all-reduce 5.85 ms; an eager int8-payload
  variant 12.06 ms (slower; max error 1.3% of row max); an async all-reduce overlapped with a GEMM takes
  10.36 ms against 10.10 ms serial, i.e. no overlap on this stack. A single-prompt prefill above about 2.4K tok/s
  would need a fused exchange kernel and a real overlap mechanism.
- Loading: the model on the HDD loads at about 57 MB/s; a copy on an SSD loads in about 7 minutes for TP2.

## Update: sub-group-parallel S1 for the 1-token draft (bit-exact)

For `q_len * GQA <= 8` the generic kernel leaves 7 of 8 sub-groups idle while sub-group 0 does all QK, softmax
and PV work. The new variant spreads one page over all 8 (QK by 16-token tile on 4 sub-groups, softmax by row,
PV by 16-column tile) with a work-group barrier at every cross-sub-group hand-off, including the last S read
before the V tile overwrites S. Every element is accumulated in the same order, so the output is bit-identical.
On by default; `XE2_KV_SMALL_S1=0` disables it. Only with the parallel S2 merge.

| q1 draft op, one rank, graph replay | before | after | change |
|---|---:|---:|---:|
| 8001 tokens, C1 / C2 | 155.7 / 233.2 us | 121.8 / 171.9 us | -22% / -26% |
| 131072 tokens, C1 / C2 | 767.7 / 1499.5 us | 578.0 / 1088.9 us | -25% / -27% |

Maximum absolute difference to the previous kernel is 0.0 on all cases (partial last page included). The
q7 verify op is unchanged within noise. The repository's XPU kernel tests pass (6/6, both head layouts).
End to end the decode cycle shortens by 0% (8K) to 3% (200K C1) over the fp16-partials build, which matches
the 6 draft steps per cycle (about 1 to 2.5 ms at long context).

A 6-row-block version of the same idea for the q7 verify op is correct but 5% to 7% slower (more accumulators,
only 4 sub-groups issue the QK matmul), so it is not included.