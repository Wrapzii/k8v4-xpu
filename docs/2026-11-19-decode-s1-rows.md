# Decode attention: faster multi-row S1 (`XE2_KV_S1_FAST`, 2026-11-19)

One opt-in change to the multi-page decode S1 kernel (`k8v4_v030/native/xe2_kv_ops.cpp`,
`docs/2026-11-19-decode-s1-multipage.md`) for the spec-decode verify shapes: q4 (24 live rows, MTP depth 3
at 2-4 users) and q7 (42 rows, depth 6 alone). With `XE2_KV_S1_FAST` unset or `0` nothing changes: the
default kernels are separate template instances and their source is untouched.

## What was slow

The decode-gap profile (config A, 63K, 4 users) put attention S1 at 20.7 ms per step, 54% of the KV read
floor, and the cost grew about 33 us per extra query row although every page is loaded once for all rows.
Removing one phase at a time from the multi-page kernel (debug build, 63K, one request, us):

| removed | q1 | q4 | q7 |
|---|---:|---:|---:|
| nothing (`SPLITS=32`) | 234 | 332 | 450 |
| nothing (`FAST`, first version) | 227 | 282 | 467 |
| softmax | 203 | 237 | 402 |
| V decode (and the V loads) | 165 | 211 | 367 |
| QK (and the K loads) | 161 | 220 | 394 |
| PV | 205 | 228 | 297 |
| all four | 41 | 47 | 56 |

Every phase sits on one serial chain per page (K load -> QK -> barrier -> softmax -> barrier -> V decode ->
barrier -> PV, twice for the two V halves), so time is latency per page per work-group, not bandwidth. At q7 the
PV phase is the largest single cost: every sub-group loads all row tiles of P from SLM for its 16-column V slab.

## Change (`XE2_KV_S1_FAST=1`, only with `XE2_KV_S1_SPLITS` / `XE2_KV_S1_PAGES`)

- Lazy-rescale online softmax in the log2 domain: the running max moves only when a score exceeds it by more
  than 8 (so P <= 2^8, still exact enough in half); on almost every page alpha is exactly 1, the PV accumulator
  rescale is skipped (one "moved" byte per row and sub-group in SLM) and the max reduction is skipped (one
  `any_of` instead). Row sums stay per lane and are reduced once at the end. M is converted back to the natural
  log domain for the unchanged S2 merge.
- No causal mask arithmetic on pages that every query row sees completely (int32 compares on the others);
  padding rows of the last row tile are skipped (their P is zeroed once).
- QK: sub-group g owns 16-token tile g % 4 of row tiles g / 4, g / 4 + 2, ...: one K fragment load per k step
  feeds all of its row tiles.
- P and the decoded V half are stored as contiguous 8x16 / 16x16 blocks, so each `joint_matrix_load` from SLM
  reads one contiguous run (q7: 459 -> 411 us at 63K, 882 -> 776 us at 128K; q1 / q4 unchanged).
- Up to 3 live row tiles (q2-q4): each sub-group keeps its P fragments in registers for both V halves instead of
  loading them from SLM twice (q4 at 63K 286 -> 273 us, 128K 531 -> 505 us, two runs each; the table below was
  measured before this step, and so was the end-to-end run).
- Same SLM tile as the multi-page kernel plus 64 bytes; large GRF as before. `launch.sh` passes the variable
  only when set and rejects anything but `0` / `1`; the C++ side rejects other values too.

Numerics: not bit-exact with the default multi-page kernel (P relative to a lagging max, exp2, per-lane sums);
differences are fp16-level (see Correctness). Spec decode stays lossless in the sense that verification uses the
same attention for every candidate; outputs can differ from the default kernel at fp16 rounding level.

## Kernel results (one B70, HKV 4, one request, capacity 131072, pages per block 33, NSG 32)

XPU graph replay, one op per graph, median host time per op (`bench/ab_s1pages.py`, all variants in one
process on identical data). Read floor = K int8 + V int4 + 3 scales = 396 B per token per KV head at 597 GB/s
(63K: 167 us, 128K: 340 us, 16K: 42 us).

| context, op | PR3 one-page | + fp16 partials | `SPLITS=32` | **`SPLITS=32` + `FAST`** | FAST vs SPLITS | of read floor |
|---|---:|---:|---:|---:|---:|---:|
| 128K q1 | 765 | 720 | 447 | **445** | -0% | 76% |
| 128K q4 | 1480 | 1165 | 651 | **546** | -16% | 62% |
| 128K q7 | 2014 | 1522 | 879 | **802** | -9% | 42% |
| 63K q1 | 388 | 366 | 240 | **238** | -1% | 70% |
| 63K q4 | 787 | 630 | 336 | **290** | -14% | 58% |
| 63K q7 | 1040 | 798 | 456 | **419** | -8% | 40% |
| 16K q1 | 104 | 96 | 81 | **81** | 0% | |
| 16K q4 | 222 | 173 | 111 | **100** | -10% | |
| 16K q7 | 298 | 215 | 149 | **140** | -6% | |
| 2K q1 / q4 / q7 | 42 / 64 / 76 | 42 / 61 / 69 | 34 / 43 / 56 | **33 / 44 / 55** | | |

With the P-in-registers step: 63K q4 273 us (61% of the floor), 128K q4 505 us (67%).

`XE2_KV_S1_GRF=128` with FAST: q4/q7 spill and run 2.9-3.6x slower (q7 63K 1466 us); `SPLITS=40` with 128
registers: same (q1 235, q4 287, q7 1293 us at 63K). Large GRF stays the right default.

## End to end

the local test harness (exp2 harness over HTTP, 63K prompts, greedy), the current best config A: max 4
sequences, prefix caching, util 0.96, `XE2_KV_S1_SPLITS=32`, embed host, draft skip shared, GDN heads, W4A8 all
layers on the oneDNN library, draft last row, `K8V4_MTP_SHARED_DEPTH=3`, the fixed `K8V4_DRAFT_VOCAB` (64K ids),
and `K8V4_ONEDNN_DETERMINISTIC=1`. Source tree `b70/test-s1rows-vocab` (= `b70/test-vocab-all034` + the
determinism commit + this branch); the FAST arm mounts this branch's `libxe2_kv.so`
(`XE2_KV_LIB_MOUNT`), the baseline runs the image library. Both windows back to back in one lock hold.

| run | 1 user decode | gap p50 | 4 users aggregate | gap p50 | coding 2K / 8K / 32K / 128K (1 user) | exact |
|---|---:|---:|---:|---:|---|---|
| `s1vB` baseline | 76.5 tok/s | 44 ms | 174.2 tok/s | 63 ms | 144.0 / 140.6 / 129.0 / 92.8 | 8/9 |
| `s1vF` + `XE2_KV_S1_FAST=1` | 88.0 tok/s | 43 ms | 194.6 tok/s | 60 ms | 149.8 / 138.4 / 134.8 / 98.3 | 8/9 |
| (`gapVf`, same config without the determinism knob, earlier) | 82.5 | 44 ms | 184.8 | 63 ms | | 8/9 |

The step time (gap p50) is the clean measure: 63 -> 60 ms at four users (-5%), 44 -> 43 ms at one user. The
tok/s differences are larger than the step change because the outputs differ (FAST is not bit-exact) and
acceptance moves with the text; the one-user 76.5 vs 82.5 between two baseline runs shows that spread. Depth
check (accepted per draft): baseline 1.41 / 1.30 / 1.46, FAST 1.56 / 1.26 / 1.42.

## Round 2 (2026-11-20): one launch for all requests, and the restructures

### `XE2_KV_BATCH_REQS=1`: one q-pack, one S1 and one S2 launch per batch

`int8k_int4v_attn_batch` looped over the requests on the host (q-pack, S1, S2 each). With
`XE2_KV_BATCH_REQS=1` (multi-page S1 only; 0/1, `launch.sh` passes it only when set) the batch runs as one
launch of each: request r owns S1 programs `r * groups * HKV ...`, its own Q tile, block-table row and
seq / visible lengths, and the S2 merge maps each output token to its request. The per-request Q tiles live in
the unused tail of the caller's partials workspace, so nothing is allocated (graph capture is safe); when the
workspace is too small, the two-pass S2 is selected or the path does not apply, the loop runs as before. Same
arithmetic as the per-request path.

Kernel, 4 requests (lengths L, L - 37, L - 74, L - 111, own pages each), one op per graph, us:

| context | q1 loop / batched | q4 loop / batched | q7 loop / batched |
|---|---:|---:|---:|
| 128K | 1785 / 1645 (-8%) | 2083 / 2020 (-3%) | 3270 / 3207 (-2%) |
| 63K | 949 / 824 (-13%) | 1112 / 1024 (-8%) | 1703 / 1631 (-4%) |
| 16K | 334 / 250 (-25%) | 402 / 345 (-14%) | 577 / 525 (-9%) |

Correctness, 4 requests, 16000 / 4097 / 130 tokens, q 1 / 4 / 7, against the per-request one-page kernel:
9.8e-4 (FAST, plain SPLITS, fp16 partials, PAGES=8); one request through the batched path 6.1e-5.

### End to end, second round (same config as above, CODING=0, one lock hold)

| run | 1 user | gap p50 | 4 users aggregate | gap p50 | accepted per draft (depth check) |
|---|---:|---:|---:|---:|---|
| `s1vB2` baseline | 75.0 tok/s | 44 ms | 181.0 tok/s | 63 ms | 1.51 / 1.35 / 1.46 |
| `s1vF2` FAST (with P in registers) | 79.3 tok/s | 43 ms | 193.6 tok/s | 59 ms | 1.45 / 1.23 / 1.47 |
| `s1vFB` FAST + `XE2_KV_BATCH_REQS=1` | 76.7 tok/s | 43 ms | 198.0 tok/s | 58 ms | 1.46 / 1.31 / 1.46 |

The P-in-registers step is confirmed end to end: the four-user step is 59 ms with it (`s1vF2`) against 60 ms
without (`s1vF`, first round) and 63 ms for both baselines. Batching the requests takes the four-user step to
58 ms. One user stays at 43 ms (batch of one).

### Softmax straight from the QK accumulators (measured, not adopted)

Sub-group t < T computed all 64 scores of row tile t and ran the lazy softmax on the accumulator registers
(element i of a lane's 8x16 accumulator is row i), writing only P to SLM; the other sub-groups decoded the first
V half meanwhile (one barrier less per page, no S round trip). Correct (9.8e-4), but slower everywhere, because
QK then runs on T sub-groups instead of 8 (one at q1): 63K 330 / 352 / 496 us against 236 / 276 / 417, 128K
619 / 652 / 958 against 436 / 505 / 798. Removed again.

### Double-buffered V (measured, not adopted)

A second 16 KB V buffer: V half 1 of page j decoded into the dead S region next to the half-0 PV, half 0 of
page j + 1 into the second buffer next to the half-1 PV (4 barriers per page instead of 6, decode overlapped with
PV). Correct (9.8e-4) but the 40 KB tile drops occupancy from 4 to 3 work-groups per Xe-core and that loses more
than the overlap wins: 63K 361 / 460 / 770 us against 237 / 275 / 415. A producer / consumer split with a raw
page buffer needs at least as much SLM and fewer computing sub-groups (the accumulator-softmax result above), so
it was not built.

### V scale folded into P (measured, not adopted)

P' = P x scale per token, the V tile holds the raw nibbles as exact halves (0x6400 | n minus 1024), and the zero
point is a per-row correction (sum of P' x zero, rescaled like the row sum). The decode becomes bit work only,
but the per-token scale / zero loads and the extra multiply move into the softmax, which sits on the same chain:
63K 264 / 299 / 438 us against 237 / 275 / 415, and the causal cases differ by up to 2.0e-3 (two fp16 steps)
instead of 9.8e-4. Removed again.

### Also measured in round 2 (not adopted)

- Q fragments in registers for the whole program (the Q tile is the same on every page; up to 3 row tiles):
  q4 slower, 63K 274 -> 341 us, 128K 506 -> 634 us (register pressure next to the P fragments and accumulators);
  q1 unchanged.
- Split count with four batched requests at 63K (q1 / q4, us): 32 splits 839 / 1040, 16: 867 / 1069,
  8: 876 / 1072, 24: 865 / 1062, 64: 917 / 1136. 32 stays best.

### Where this leaves the four-user step

Config A + vocab + deterministic oneDNN: 63 ms (baseline) -> 59 ms (FAST) -> 58 ms (FAST + batched requests);
the target (under our stack's 55 ms) needs about 3 ms more. In the kernel, every restructure tried in this round
that shortens the per-page chain (softmax from the accumulators, a second V buffer, folded V scale, Q in
registers) costs more in occupancy, registers or work on the same chain than it saves; what helped is removing
launches (batched requests) and SLM traffic (blocked tiles, P in registers). The remaining distance to the read
floor at q4 (63K: 256 us per request batched against 167) is spread over all four phases of the page chain.

## Round 3 (2026-11-20): pure-bit dequant, named-barrier ideas, and what bounds the kernel

All measured as before (one op per graph, `bench/ab_s1pages.py`, against `SPLITS=32 FAST=1` in the same
process; us; correctness against the one-page kernel). None was adopted; the branch keeps FAST + batched requests.

| idea | 63K q1 / q4 / q7 | 128K q1 / q4 / q7 | correctness | verdict |
|---|---|---|---|---|
| baseline FAST | 237 / 277 / 418 | 437 / 509 / 805 | 9.8e-4 | |
| V dequant in packed half2 bit ops (`0x6400 \| n` minus 1024, one half2 fma with scale and -zero x scale, two columns per store) | 271 / 319 / 410 | 506 / 599 / 788 | 3.9e-3 causal (fails the 2e-3 bar) | slower at q1/q4, q7 within noise, less exact |
| V scale folded into P, raw nibbles as exact halves (round 2) | 264 / 299 / 438 | | 2.0e-3 | slower |
| smaller SLM tile (P sized to the live rows: 17 / 19 KB) + 128 registers + 48 splits, i.e. 6-7 work-groups per Xe-core instead of 4 | 242 / 281 / - | 452 / 522 / - | 9.8e-4 | no gain; 4 x 63K batched worse (962 / 1185 vs 825 / 1032) |
| heads of one split as adjacent work-groups (same KV pages read together) | 236 / 276 / 417 | 436 / 509 / 798 | 9.8e-4 | no change |
| K page staged into SLM with 128-byte lane loads, QK operands from SLM | 416 / 574 / 772 | 811 / 1108 / 1490 | 9.8e-4 | much slower |
| softmax on the QK accumulators of all 8 sub-groups (no S round trip; rows agree on a new max through an SLM atomic only when it moves) | 264 / 314 / 481 | 493 / 598 / 929 | wrong (1.9) | slower even before fixing the bug; dropped |

Named barriers (sycl-tla #812: `nbarrier.signal` / `nbarrier.wait` inline asm plus `named_barrier_init`) were
not built. Every phase of the page chain is all-to-all across the sub-groups (scores of a row come from four
sub-groups, P of all rows feeds every PV column slab), so a named barrier only pays off with a producer /
consumer split that stages the next page through SLM. Each measurement above points the other way: staging
through SLM (K tile: +75%, second V buffer: +52%), fewer computing sub-groups (accumulator softmax on T
sub-groups: +40%) and cheaper ALU work (bit-op dequant: no gain) all lose, while more work-groups per Xe-core
(6-7 instead of 4) gain nothing. The kernel is bound by its SLM round trips per page (S, P x 8 sub-groups, V
tile), not by DRAM, ALU or occupancy; reducing those further needs a different decomposition of the work (for
example several KV heads or both V halves per work-group with P kept in registers), which these experiments
could not reach without spilling.

Libraries and scripts: `build/libxe2_kv_{h2,ss,hi,ks,sa}.so` (untracked), a run log
... `s1rows-r16.txt`.

## Correctness

Same process, identical data, against the one-page PR3 kernel with fp32 partials (eager, graph replay, causal
per-row visible lengths with a 97-token stagger, permuted block table, NaN-filled workspace):

- HKV 4, lengths 63000, 16000, 4097, 2000, 130, 65, q 1 / 2 / 4 / 7 / 8, FAST with `SPLITS=32`, `SPLITS=7`,
  `PAGES=8`, and with fp16 partials (30 cases each): max abs difference 9.8e-4, the same as the multi-page
  kernel without FAST (one fp16 step at the output size of the short cases); all finite.
- HKV 2, 16000 / 4097, q 1 / 7, `SPLITS=64` + FAST: 6.1e-5.
- `tests/test_kernel_xpu.py` (6 tests) pass with `XE2_KV_S1_SPLITS=32 XE2_KV_S1_FAST=1`;
  `tests/test_launch_profiles.py` passes (new test: passed only when set, `0`/`1` only).

## How far from the floor, and what is left

At 63K the op now runs at 70% (q1), 61% (q4) and 40% (q7) of the KV read floor; at 128K 76% / 67% / 42%. The
phase table explains why it stops there: each work-group walks its pages through one serial chain (K load,
QK, barrier, softmax, barrier, V decode, barrier, PV, twice for the V halves) and only 4 work-groups fit on an
Xe-core with 256 registers, so the chain latency, not DRAM bandwidth, sets the time. Every way tried here to
overlap the next page (registers, cache prefetch, a larger SLM tile) either spills or costs occupancy. Closing
the rest (>= 85%) needs a different structure, in order of expected value:

1. Producer / consumer sub-groups with a double-buffered raw (undecoded) page in SLM, so loads of page j + 1
   run while page j is in QK / PV (needs about 24 KB more SLM per work-group; check whether 3 work-groups per
   Xe-core with full overlap beat 4 without).
2. Softmax straight from the QK accumulators (one sub-group per row tile), removing the S round trip through SLM
   and one barrier per page; the other sub-groups decode V meanwhile.
3. V decode folded into P (P x scale per token, raw nibbles as exact halves, the zero point as a per-row
   correction), which removes most of the decode ALU work.
4. One launch for all requests of `int8k_int4v_attn_batch` (per-request q-pack / S2 launches are about 1.7 ms of
   a 4-user step at 63K in the profile).

## What did not help

- Pipelining the next page's operands in registers: packed V one page ahead (`PIPE=2`) or K fragments one page
  ahead (`PIPE=4`) or both: spills at q4 / q7 even with 256 registers (2-10 KB), slower in most cases (63K q1
  384 / 231 / 436 us against 225).
- Decoding the whole 64 x 256 V tile at once (32 KB, one P load for both halves, 4 barriers instead of 6): the
  larger SLM tile costs occupancy; 63K 314 / 414 / 541 us against 225 / 282 / 459.
- V decode variants: 32-bit word loads with one fma per value, and per-sub-group private V slabs without
  work-group barriers between the halves: both slower than the original byte decode (63K q1 285-304 us against
  242).
- Earlier (multi-page note): cache prefetch of the next page, packed V in registers one page ahead.
- Code size matters for the q7 instance: adding dormant runtime-selected paths to the same kernel moved the q7
  baseline from 471 to 585-770 us, so every option here is a template instance, not a runtime branch.

## Reproduce

```
python bench/ab_s1pages.py --lengths 128000,63000,16000,2000 --queries 1,4,7 \
    --variants "s32:XE2_KV_S1_SPLITS=32;f:XE2_KV_S1_SPLITS=32,XE2_KV_S1_FAST=1"
XE2_KV_S1_SPLITS=32 XE2_KV_S1_FAST=1 python -m unittest k8v4_v030.tests.test_kernel_xpu
```
