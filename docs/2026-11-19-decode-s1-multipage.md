# Decode attention: multi-page S1 with an online softmax (2026-11-19)

One opt-in change to the paged K8/V4 decode attention (`k8v4_v030/native/xe2_kv_ops.cpp`), on top of
the live-row gating / fp16-partials branch. No model weights, no Python backend and no cache layout
changed. With neither new variable set the op runs exactly the previous code (outputs bit-identical,
max abs difference 0.0 in every case below).

## What was inefficient

S1 runs one work-group per 64-token page per KV head and writes a normalized 64 x 256 partial plus
M/L per page; S2 reads every live partial back. At 63K tokens on one GPU (4 KV heads) that is about
3,900 programs and about 4,000 partial round trips for about 100 MB of real KV (read floor about
170 us). A second cost shows up at short context: the grid is graph-static, sized for the block-table
capacity (131072 tokens here = 8,316 programs), and the programs past the live length still have to be
dispatched before they return.

## Change

New S1 kernel, selected by environment variable, only for `q_len * GQA <= 48` with the parallel S2:

- One work-group walks consecutive pages of one KV head with an online softmax: running `m`, `l` per
  row in registers, `P = exp(s - m_new)` written to SLM as half (values <= 1), and the per-row
  `alpha = exp(m_old - m_new)` in a 64-float SLM vector.
- SLM holds one page at a time exactly like the single-page kernel (S and the V tile alias, P), plus
  two 64-float row vectors (alpha, 1/l): 24.5 KB.
- QK is split into (8-row tile, 16-token tile) jobs over all 8 sub-groups; softmax row `r` lives on
  sub-group `r % 8`; PV uses column slabs: sub-group `g` owns columns `[16g, 16g+16)` of each
  128-column V half for every live row tile, so the PV accumulators stay in registers across pages
  (q1: 16 floats per lane, q4: 48, q7: 96). Each V slab is loaded from SLM once per k step and reused
  by every row tile. Rows are rescaled with `joint_matrix_apply` (row coordinate) before each mad.
- At the end the program writes `acc / l`, `M = m`, `L = l`, so the S2 merge math is unchanged; S2
  takes the pages-per-program rule as an argument and computes the number of live splits on device.
- Large register file (`grf_size<256>`) by default. In the 128-register mode the q4/q7 instances
  spill (IGC dump: 2.4 KB and 3.3 KB of spill) and run up to 2.4x slower; `XE2_KV_S1_GRF=128`
  keeps that mode for comparison.

Two ways to choose the pages per program:

| Variable | Meaning |
|---|---|
| `XE2_KV_S1_PAGES=N` (N > 1) | N pages per program; grid `ceil(n_splits / N)` programs per head |
| `XE2_KV_S1_SPLITS=S` (S > 0) | S programs per head; each takes `ceil(live pages / S)` pages, computed on device from `seq_lens` (or `visible_lens[0]`), so S1 and S2 agree inside a captured graph and no padded programs are launched |

`XE2_KV_S1_SPLITS=32` is the recommended setting for one B70 with 4 KV heads: 128 programs are one
wave at 4 large-GRF work-groups per Xe-core on 32 Xe-cores. For a TP2 rank (2 KV heads) the
equivalent is 64 (checked for correctness, not timed). `XE2_KV_PARTIAL_FP16` still works with
either mode but no longer matters (the partial traffic is now small).

## Kernel results (one B70, HKV 4, 1 request, capacity 131072, pages per block 33, NSG 32)

XPU graph replay, one op per graph, median host time per op (`bench/ab_s1pages.py`, all variants in
one process on identical data; `main` is the main-branch library in the same harness).

| Context, op | main | PR3 (gating) | PR3 + fp16 partials | PAGES=8 | **SPLITS=32** | vs PR3+fp16 |
|---|---:|---:|---:|---:|---:|---:|
| 63K q1 | 622 us | 394 us | 372 us | 295 us | **244 us** | -34% |
| 63K q4 | 845 us | 797 us | 629 us | 389 us | **342 us** | -46% |
| 63K q7 | 1069 us | 1061 us | 810 us | 526 us | **471 us** | -42% |
| 16K q1 | 203 us | 111 us | 103 us | 84 us | **88 us** | -15% |
| 16K q4 | 257 us | 228 us | 180 us | 116 us | **119 us** | -34% |
| 16K q7 | 315 us | 301 us | 223 us | 155 us | **159 us** | -29% |
| 2K q1 | 79 us | 49 us | 49 us | 67 us | **41 us** | -16% |
| 2K q4 | 79 us | 71 us | 69 us | 93 us | **52 us** | -25% |
| 2K q7 | 85 us | 81 us | 76 us | 130 us | **64 us** | -16% |

`bench/graph_sweep.py` (main's version) with `XE2_KV_S1_SPLITS=32`, NSG 32 / 16 / 8: 63K q1 246 / 243
/ 243 us, q4 344 / 336 / 341 us, q7 474 / 460 / 458 us; 16K 80 / 78 / 77, 116 / 107 / 110,
160 / 148 / 147 us; 2K 50 / 48 / 46, 53 / 44 / 47, 65 / 55 / 52 us. With fewer splits the NSG 8/16
merge is now as good as or better than NSG 32.

The 63K q1 op now reads KV at about 410 GB/s (100 MB / 244 us), against a read floor of about 170 us.

Sweep (graph with 8 ops, same harness, us): fixed pages N = 2 / 4 / 8 / 16 at 63K q7 = 874 / 574 /
520 / 514; splits S = 32 / 48 / 64 / 128 = 468 / 598 / 513 / 520. S=48 loses because 192 programs
are 1.5 waves. Fixed N loses at 2K because a 32-page context gets only 32 / N programs per head
(2K q7 N=16: 195 us).

## Correctness

Same process, identical data, against the default path with fp32 partials (eager, graph replay, and
causal per-row visible lengths with a 97-token stagger between query rows), permuted block table,
workspace pre-filled with NaN:

- HKV 4, lengths 63000, 16000, 4097, 2000, 130, 65 (partial last pages, contexts shorter than one
  program's span, seq_len not a multiple of 64 x N), q 1 / 2 / 4 / 7 / 8, variants PAGES 2 and 8,
  SPLITS 7 and 32, each with and without fp16 partials: max abs difference 9.8e-4 (one fp16 step at
  the output magnitude of the short cases; the existing fp16-partials path shows the same 9.8e-4),
  all outputs finite.
- HKV 2, lengths 16000 and 4097, q 1 / 7, PAGES 8, SPLITS 64: max abs difference 6.1e-5.
- `bench/graph_sweep.py` NSG variants against NSG 32 under SPLITS=32: max 6.1e-5.
- `tests/test_kernel_xpu.py` (6 tests): pass with no variable, `XE2_KV_S1_PAGES=8`,
  `XE2_KV_S1_SPLITS=32`, and `XE2_KV_S1_SPLITS=32 XE2_KV_PARTIAL_FP16=1`.

Not bit-exact with the one-page kernel: P is normalized against the running maximum instead of the
page maximum, and the partials are combined in registers instead of in S2. A model-quality
evaluation has not been run.

## What did not help

- Software prefetch of the next page into L1 or L2 (`sycl::ext::oneapi::experimental::prefetch`):
  slower (63K q1 about 360 us vs 300 us at N=8), consistent with the block loads not hitting the
  prefetched lines and the data being fetched twice.
- Loading the next page's packed V into registers one page ahead: the VRegs buffer spilled even with
  256 registers (22 KB at q7) and every case got slower.
- Loading the current page's packed V before QK (8 registers per half): no spill, but slower
  (63K q1 448 vs 283 us at N=8).
- Padded full-size grid with pages per program chosen on device (minimum-groups rule): the early-return
  programs of a 131072-token grid cost about 15 to 20 us per op at large GRF (profiled at 2K); the fixed split count removes them.
- 128-register mode: q4/q7 spill (see above); q1 is equal or a little slower than large GRF.

Not attempted: batching all requests of `int8k_int4v_attn_batch` into one launch. With SPLITS=32 each
request already fills one wave, so a batched launch would save only the per-request launch gaps.

## Reproduce

```
# A/B against the default path in one process (correctness + graph timing)
python bench/ab_s1pages.py --lengths 63000,16000,2000 --queries 1,4,7 \
    --variants "pf16:XE2_KV_PARTIAL_FP16=1;p8:XE2_KV_S1_PAGES=8;s32:XE2_KV_S1_SPLITS=32"
# correctness only, short and odd lengths
python bench/ab_s1pages.py --lengths 4097,130,65 --queries 1,2,4,7,8 --no-timing \
    --variants "s32:XE2_KV_S1_SPLITS=32;s7:XE2_KV_S1_SPLITS=7"
XE2_KV_S1_SPLITS=32 python -m unittest k8v4_v030.tests.test_kernel_xpu
```
