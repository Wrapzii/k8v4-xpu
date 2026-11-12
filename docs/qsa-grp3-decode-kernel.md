# QSA short-decode attention: tuned grp3 kernel, split auto-pick, publication sync switch

Status: experimental, Nov 12 2026. Hardware: Intel Arc Pro B60, vLLM 0.30 on XPU,
K8/V4 paged cache (int8 K, int4 V), QSA sparse selection of 2048 tokens + own block
(2052-token rows), MTP6 (7 query rows per decode step).

Every number below says which kind it is:

- **kernel-only**: model-free microbenchmark of the attention kernel alone. 24 query
  heads / 4 KV heads (TP1 layout), head_dim 256, 7 query rows, 2052 selected tokens,
  16 layers with 16 distinct caches, real K8/V4 page layout, XPU-graph replay, device
  event timing, FP64 CPU oracle check on a shared-row selection and on a selection
  where every row has its own tokens. This is **not** serving speed.
- **serving**: a real vLLM server, one GPU (TP1), 8K prompt, one user, `FULL_DECODE_ONLY`
  graphs, MTP6.
- **matched**: candidate and baseline timed in the same process on the same GPU in the
  same round. **cross-GPU**: baseline from a different GPU or round. Cross-GPU ratios
  drift with clocks and are not used for claims here.

## What this adds

| file | change |
| --- | --- |
| `k8v4_v030/native/qsa_grp3_split_fast.cpp` | Tuned short-decode grp3 split kernel. Same op schema as `xe2_qsa::qsa_grp3_split`, registered as `torch.ops.xe2_qsa_grp3.qsa_grp3_split` in its own library. |
| `k8v4_v030/compile_qsa_grp3.sh` | Builds `libxe2_qsa_grp3.so` (CPU/docker only, no GPU). |
| `k8v4_v030/qsa_ops.py` | `grp3_ops()` loads the tuned library when present; short decode uses it, otherwise the shipped `xe2_qsa::qsa_grp3_split`. Logs `QSA_ATTN_SPLIT kind=... kernel=... split=... hq=... hkv=...` once per layout. |
| `k8v4_v030/qsa_direct_plan.py` | `grp3_decode_split_width()`: split width picked per per-GPU head layout and kernel, with an env override. |
| `k8v4_v030/qsa_compact_lifecycle.py` | Opt-in `K8V4_QSA_PUBLICATION_SYNC=0` skips the post-step host `.item()` wait. Default unchanged. |
| tests | `tests/test_qsa_direct_plan.py` (split picks, override, library lookup), `tests/test_publication_sync.py`. CPU only. |

The same branch also carries the earlier local commits these measurements were taken on:
`TORCH_LIBRARY_FRAGMENT` registration for `qsa_gqa6_split` (the companion library could
not load next to the score ops), grp3_split preferred over `qsa_gqa6_split` for short
decode, one shared score row ranked once for MTP decode, and the 4096-block score bucket
for ~8K contexts.

## The kernel

`qsa_grp3_split` gives one 16-lane subgroup three query heads of one GQA-6 group for one
query row and one chunk of `split_width` tokens. Per token it loads the int8 K row and
int4 V row once for the three heads, does three partial dots and subgroup reductions,
an online-softmax update and the int4 V mix. A second kernel merges the chunk partials.
Three heads is the most that fits in registers (six heads spilled or, in SLM, ran ~3.6x
slower).

The tuned body makes three changes to the shipped one, each measured on its own:

1. token -> page: `logical / 33` uses an exact multiply-high (guarded to
   `logical < 16384`); other ratios keep the divide. The divide sat on the K address chain.
2. consecutive tokens on the same logical page reuse the physical page instead of
   re-reading `block_row`.
3. the online softmax computes one `exp` per head per token; the other factor of
   (decay, prob) is exactly 1.

### Results (kernel-only, 64K context, concurrency 1, TP1 24Q/4KV, 16 layers)

Lineage of the best body, each step one change. Times are medians in ms per 16 layers.

| body | split | ms | matched shipped grp3_split split 32, same process | matched ratio |
| --- | ---: | ---: | ---: | ---: |
| shipped grp3_split | 32 | ~4.15-4.87 (varies by round/clock) | - | 1.00x |
| ilp1_div (next-token prefetch + multiply-high) | 48 | 4.133 | 4.475 | 1.08x |
| g3_div (multiply-high on the shipped body) | 48 | 4.037 | 4.475 | 1.11x |
| g3_page (+ physical page reuse) | 48 | 4.019 | 4.473 | 1.11x |
| **g3_exp1 (+ one exp per head) = this commit** | 48 | **3.759** | **4.183** | **1.11x** |

On one later round with a 4.145 ms bar the last three were tied: g3_page 3.740 (1.108x),
g3_exp1 3.746 (1.107x), g3_div 3.750 (1.105x). The gain is about 1.11x matched. Most of
it comes from running at split 48; the body changes are small and inside run-to-run noise
of each other.

The A/B loop's auto-generated leaderboard also printed 1.26x-1.29x for these bodies
"vs grp3 bar". That ratio divided by a grp3_split bar measured in a different round/GPU
(5.17 ms) and is inflated by cross-GPU clock drift. It is not the matched result.
**The matched speedup is ~1.11x, not 1.29x, and not the 2x target.**

Split width for this body at TP1: 48 best, 32 about 1.00x of the shipped bar, 64 about
0.94x. Not measured: the TP2-rank shape 12Q/2KV, concurrency 4, and 96K/120K contexts
for this body.

For scale (kernel-only, same harness, 64K C1): the dense int8-K/int4-V attention kernel
over the full context is 16.905 ms per 16 layers. A QSA kernel step proxy (attention
4.058 + int8 score 0.344 + pack top-k 1.936 + fused metadata 0.113) is 6.451 ms per
16 layers. That proxy is a sum of separately timed kernels, not a serving step.

What did not beat the shipped body (all correct against the oracle, matched ratios at
64K-120K): SLM-staged K/V for all rows of a KV head (best 0.85x), fp16/int8 DPAS (XMX)
score and PV tiles (best 0.79x), six heads per subgroup with SLM accumulators (0.27x),
16-byte vector loads (0.95x on the prefetch body), two-tokens-ahead prefetch (1.03x).
A six-heads-in-registers variant faulted the GPU and is not included.

## Split width auto-pick

The best split width depends on the per-GPU head layout and on which kernel runs, so
both split widths stay available and the runtime picks per setup:

| per-GPU layout | typical setup | shipped `xe2_qsa::qsa_grp3_split` | tuned `xe2_qsa_grp3` |
| --- | --- | ---: | ---: |
| 24Q / 4KV | TP1, one GPU | **32** | **48** |
| 12Q / 2KV | TP2, per rank | **64** | **64** (not measured; same as shipped) |
| anything else | | 64 (previous default) | 64 |

Evidence for the shipped kernel at 24Q/4KV (kernel-only, matched in the same rounds):
96K C1 split 32 4.865 ms, split 128 5.197, split 64 5.389; 120K C1 split 32 4.870,
split 128 5.198, split 64 5.400; 64K C4 split 32 19.214, split 128 20.509,
split 64 21.175. 12Q/2KV keeps split 64, the width the TP2 serving tree ran with.

Override for any layout (e.g. after measuring your own GPU/model):

```
K8V4_QSA_DECODE_SPLIT=48     # positive integer; invalid values raise at startup
```

The override applies to grp3 short decode only (`q_len <= 16`). Prefill keeps
`grp3_prefill_split` at 128 and the shipped kernel. The split width sizes the
partial workspace, so it is fixed for a captured graph; change it with a restart.
The chosen kernel and width are printed once:
`QSA_ATTN_SPLIT kind=grp3_decode_split kernel=xe2_qsa_grp3 split=48 hq=24 hkv=4`.

## Building and enabling the tuned kernel

```
bash k8v4_v030/compile_qsa_grp3.sh     # writes build/qsa/libxe2_qsa_grp3.so (QSA_OUT to change)
```

The runtime uses it when `XE2_QSA_GRP3_LIB` names it, or when `libxe2_qsa_grp3.so` sits
next to the loaded `libxe2_qsa.so` (or in `build/qsa/`). `K8V4_QSA_GRP3_FAST=0` turns
it off. Without the library, short decode runs the shipped `xe2_qsa::qsa_grp3_split`
with the split picked above. The tuned library registers only its own namespace and
never `xe2_qsa`, `xe2_qsa_batch` or `xe2_kv`.

The numbers in this document for the tuned kernel are kernel-only. No serving run with
`libxe2_qsa_grp3.so` loaded is reported here; validate end to end before relying on it.

## Publication sync switch (serving overhead)

After each QSA step `check_statuses_before_publication` all-reduces the compact-cache
failure flag and then reads it on the host with `.item()`. That read waits for the whole
step's GPU work and is called twice per step (after replay and after the draft propose).
Dense never calls it.

`K8V4_QSA_PUBLICATION_SYNC=0` keeps the all-reduce on every rank but copies the flag to
pinned host memory without waiting. A nonzero flag is printed on a later step and is
**not raised** (raising on one rank can deadlock the next collective). The default (unset
or `1`) keeps the blocking, raising check.

Serving, TP1, 8K prompt (8212 tokens), one user, 96 completion tokens, same tree and boot
settings, one change:

| | QSA sync on | QSA sync off | dense |
| --- | ---: | ---: | ---: |
| client chunk gap ms (median) | 69.94 | 66.68 | 58.46 |
| worker wall ms / step | 69.40 | 66.02 | 57.93 |
| graph GPU span ms | 48.35 | 48.58 | 40.82 |
| publication check 1 ms | 48.78 | 0.27 | - |
| publication check 2 ms | 1.90 | 0.19 | - |

Sync off moved the QSA step by about -3.3 ms. QSA stays about 8 ms per step behind dense
at 8K one user; the remaining gap is mostly inside graph replay (QSA graph GPU span 48.4 ms
vs dense 40.8 ms). Those serving runs used the shipped grp3_split at split 32, not the
tuned kernel.
