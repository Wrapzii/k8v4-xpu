# RecoverSSM verify kernel and deferred commit (2026-11-20)

Goal: take ~1.5 ms out of the GDN RecoverSSM path of the 4-user 63K decode step (their stack ties ours at 54.1 ms).
Base: `K8V4_GDN_RECOVERSSM=1` with fp16 state (`K8V4_MAMBA_SSM_DTYPE=float16`), the `l3h` config of
docs/2026-11-20-last-3ms.md. Shapes (checked): 48 GDN layers, 16 q/k heads, 48 value heads, state 128 x 128 per
value head (fp16: 1.57 MB per request per layer, 6.3 MB per layer at 4 requests).

Branch `b70/rssm-verify` (from `b70/gdn-recoverssm`): 65ca9ea (kernels, knobs, tests), 833c74d (per-step column
copies, deferred-commit bench), b2d9a17 (docstrings), d2abdec (request-slot splice, required for the deferred
commit). Test trees `b70/test-rssm-verify` (= `b70/test-last3ms` + 65ca9ea, 833c74d; image `k8v4-up:rverify-14f7578`)
and `b70/test-rssm-verify2` (+ b2d9a17, d2abdec; image `k8v4-up:rverify-f6a33c4`). `build/libk8v4_rssm.so` from
`compile_rssm.sh` (sha256 c058e8a0...).

## Knobs

| knob | what | numerics |
|---|---|---|
| `K8V4_RSSM_VERIFY=slm` (`stock` = unset) | `torch.ops._k8v4_rssm.verify_slm` (`native/rssm/rssm_verify_slm.hpp`): the v0.1.17 verify with each window's normalised q / k, values, beta and decay staged in SLM before the recurrence (one sub-group normalises one token; the stock kernel had every sub-group reload and re-normalise every token inside its serial loop) | bit-identical outputs and replay records |
| `K8V4_RSSM_DEFER_COMMIT=1` | deferred commit (vLLM PR 66595's idea for KDA, here for GDN), `k8v4_v030/rssm_defer.py` + `verify_deferred`: see below | bit-identical to commit-then-verify |

Both need `K8V4_GDN_RECOVERSSM=1`, are passed by `launch.sh` only when set (bad values exit 2), take windows of at
most 8 tokens (startup error otherwise, e.g. with deep drafting), and also copy the two checkpoint-column tensors
once per step instead of twice per layer. Default launch command unchanged (`test_launch_profiles`); CPU contract
tests `k8v4_v030/tests/test_rssm_defer.py` (its XPU test runs both bit-identity checks below).

### Deferred commit

Stock RecoverSSM: verify reads each request's checkpoint (S), writes replay records (correction, key, decay per
token); after sampling the commit reads S again, folds the accepted records and writes S. Deferred: the commit's
plan kernel (`prepare_commit_plan_kernel`, unchanged, then `_defer_plan_kernel`) leaves a window that stays in its
state block **pending** (`pending[slot] = accepted`) instead of folding it; the next verify of that request slot
loads S (which it does anyway), folds the pending records with the commit kernel's own update
(`fma(c, k, h * decay)`) and its rounding to the state dtype, writes S once and verifies from it. One state read and
one state write per step instead of two reads and one write.

- Replay buffer: two halves per request slot (`parity[slot]` = the half this step writes, flipped by the plan
  kernel), so the next verify can read the previous step's records while writing its own. +0.8 MB per layer at
  4 seqs / depth 3.
- Align mode (prefix caching): windows that cross or end on a mamba block boundary commit at once, exactly as
  before, so every block the prefix cache can hand out (and every block the align pre-copy reads) holds its exact
  state. Only windows that stay inside their block are deferred.
- A request slot that runs a prefill gets its pending count cleared in the metadata builder (a new or recomputed
  request may reuse a finished request's slot). A finished request's pending records are simply dropped.
- Everything is device-side (persistent `pending` / `parity` tensors), so the FULL decode graphs capture it.

## Kernel bench (B70, Qwen3.8 GDN shapes, 48 layers, fp16 state, eager, event timing, best of 3 x 30 steps)

`bench/rssm_verify_ab.py` (a run log), ms per step:

| case | stock verify | verify_slm | state-read floor |
|---|---:|---:|---:|
| 4 requests x 3 drafts, fp16 act | 1.487 | **1.402** (-5.7%) | 0.506 |
| 1 x 6 | 0.685 | **0.596** (-13%) | 0.126 |
| 2 x 3 | 0.929 | 0.873 | 0.253 |
| 3 x 3 | 1.243 | 1.181 | 0.379 |
| 4 x 3, bf16 act | 1.543 | 1.418 | 0.506 |

Bit-identical (outputs, replay records, state untouched) on 4x4, 1x7, ragged windows with token remap, a
null-block row with fp32 state, 8-token windows without record rows, fp16 and bf16 activations.

`bench/rssm_defer_check.py` (a run log): verify + commit per decode step, 3 commit groups of
16 layers as vLLM groups them, steady state:

| case | stock (verify + commit) | slm + commit | **deferred** |
|---|---:|---:|---:|
| 4 x 3, 2 accepted, fp16 | 2.726 | 2.597 | **2.187 (-0.54 ms, -20%)** |
| 4 x 3, 4 accepted | 2.771 | 2.641 | **2.346 (-0.43)** |
| 2 x 3, 2 accepted | 1.557 | 1.494 | **1.327 (-0.23)** |
| 1 x 6, 3 accepted | 1.019 | 0.993 | 1.103 / 1.000 (fp16 / bf16 act; no gain) |
| 4 x 3, 2 accepted, bf16 | 2.760 | 2.607 | **2.179** |

Deferred vs stock commit-then-verify: bit-identical outputs every step, and after a last verify every state and
conv block bit-identical, for fp16 / bf16 / fp32 state x fp16 / bf16 activations x plain / align mode (block 8, so
windows of up to 4 tokens cross and end on boundaries: 5-13 of 21 windows took the immediate path in align mode).

## Why the verify stays above its floor (what was measured)

- 48 back-to-back trivial kernels cost 0.51 ms per step in this eager loop (`LAUNCH` line), i.e. ~10 us per launch:
  at one request (12-14 us per layer) the bench is launch-rate bound; in the graph-mode profile of the last-3ms doc
  the one-user verify is 17-18 us of device time per layer.
- Time grows in steps of resident waves, not bytes: 4 x 3 is 768 work-groups x 8 sub-groups = 6144 SIMD32 threads
  against 2048 resident (32 Xe cores x 8 XVE x 8), three waves of ~9.7 us; one request (1536 threads) is one wave.
  Each thread loads its 16 state values once, then runs the token chain (8 cross-lane reductions per token).
- Staging the inputs in SLM (slm) removed the global loads and the duplicated norm reductions from the chain: -6%
  at 4 users, -13% at one.
- A different lane layout was built and measured, **not adopted**: 16-wide sub-groups where 2 / 4 / 8 lanes share a
  whole state row (dot products as in-lane sums plus 1-3 butterfly steps, one value per lane instead of four 32-lane
  reductions). Slower everywhere that matters (4 x 3: 1.76 / 1.68 / 2.27 ms against 1.40; 1 x 6: 0.85 / 0.68 / 0.90;
  only 2 x 3 at 2 lanes per row tied, 0.877): the per-lane SLM reads of q and k (32-64 floats per token) and the
  extra wave quantisation cost more than the shorter reductions save. Not bit-identical either (fp32 sum order).
  Removed from the branch; the source is in a local build tree.
- So the floor is not reachable by restructuring one launch; what paid is removing a whole pass over the states
  (the deferred commit). Still open in the GDN path: the conv kernel (`causal_conv1d_spec`, 0.6 ms per 4-user step,
  12-14 us per layer, latency-bound like the verify) and the commit's remaining launches (plan, conv compaction and
  an early-exit fold per group; `K8V4_RSSM_GROUPED_COMMIT` merges them, host-side only).

## End to end (l3h config, arms back to back in one window each, same image per window)

Windows the local test harness (one flock each; the local test harness restores prod between arms). l3h config: config A + 64K
draft vocab + `K8V4_ONEDNN_DETERMINISTIC=1` + `XE2_KV_S1_FAST=1 XE2_KV_BATCH_REQS=1` + fp16 GDN state + RecoverSSM +
`K8V4_DRAFT_FUSED_DECODE=1` + `K8V4_DTYPE=float16`. Step timer `l3step.py` (warm 63K prefixes, 3 rounds x 512
tokens, p50 of the inter-chunk gaps = engine step); depth check `v034-depthcheck.py`; fixed-prompt greedy texts
`rv_texts.py` (3 one-user prompts, 512 tokens; 4 concurrent warm 63K users, 384 tokens); EXACT.

| window / arm | knobs | KV tokens | EXACT | 4-user step p50 / mean | 1-user step p50 / mean |
|---|---|---:|---|---:|---:|
| 1 `rvA` | (l3h) | 508,996 | 8/9 | 54.7 / 54.5 | 41.2 / 41.1 |
| 1 `rvC` | `K8V4_RSSM_VERIFY=slm` | 508,996 | 8/9 | 54.4 / 54.3 | 40.9 / 40.8 |
| 1 `rvB` | `K8V4_RSSM_DEFER_COMMIT=1` (slot bug, see below) | 507,904 | 8/9 | 54.2 / 54.0 | 41.0 / 40.9 |
| 2 `rvB2` | defer (slot bug), A's compile cache | 507,904 | 8/9 | 54.1 / 53.9 | 41.0 / 40.9 |
| 2 `rvA2` | (l3h), A's compile cache | 508,996 | 8/9 | 54.8 / 54.6 | 41.2 / 41.1 |
| 3 `rvA3` | (l3h), image with the slot splice | 508,996 | 8/9 | 54.9 / 54.7 | 41.2 / 41.1 |
| 3 **`rvB3`** | **`K8V4_RSSM_DEFER_COMMIT=1`** (fixed), A3's compile cache | 501,350 | 8/9 | **54.3 / 54.1** | **41.1 / 41.0** |
| 4 `rvE` | l3h + 32K draft vocab (= `l3best`) | 513,365 | 8/9 | 54.3 / 54.2 | 40.3 / 40.2 |
| 4 **`rvD2`** | **l3h + 32K draft vocab + `K8V4_RSSM_DEFER_COMMIT=1`**, E's compile cache | 511,180 | 8/9 | **53.8 / 53.7** | **40.2 / 40.1** |

The deferred commit (which runs the SLM verify) takes **0.5-0.7 ms off the 4-user 63K step** in all three
same-window pairs (54.7 -> 54.2, 54.8 -> 54.1, 54.9 -> 54.3 p50) and ~0.1-0.2 ms at one user; the SLM verify alone
is ~0.3 ms of it. Window-to-window drift of the baseline is +-0.1 ms. KV: the doubled replay buffer costs 1,092
tokens; `rvB3` started with 501,350 (-1.5%; one start, the profiler's peak differed; not investigated further).
Against ours (prod -27: 54.1 ms at 4 users / 42.8 at one, last-3ms doc): 54.1-54.3 / 41.0-41.1, i.e. a tie at four
users and 4% faster at one. With the 32K draft vocabulary (`l3best` of the last-3ms doc, which costs some
acceptance on long outputs) the deferred commit gives **53.8 / 53.7 ms at four users (ours 54.1) and 40.2 / 40.1 at
one (ours 42.8)**: the first configuration of their stack that is below ours at four users (by 0.3-0.4 ms, ~0.7%).

### Lossless check

Greedy texts are bit-reproducible for a fixed compile cache: `rvA2` (A's cache copied) and `rvA3` (new image) gave
the same 7 texts as `rvA`. Separate compile caches are not: inductor autotunes some Triton kernels per start (23 of
76 `best_config` files picked differently between `rvA` and `rvB`), which alone changes every text. So arms that are
compared share a copied cache (`CACHE_FROM`).

- **`rvB3` (deferred commit, fixed) == `rvA3`, and `rvD2` == `rvE`: all 7 texts identical in both pairs** (one-user chat, one-user 63K, four concurrent
  63K users), with the same cache. EXACT 8/9 both.
- The first deferred-commit image (`rvB2` vs `rvA2`, same cache) was **not**: texts diverged after 8-200 tokens. Cause:
  vLLM 0.34's hybrid model state builds the GDN attention metadata without the request slots (`req_idx`), so replay
  records sat in batch rows; a new request in batch row 0 folded the records a finished request had left there (the
  prefill-slot clear never ran without slots). Fixed by `tools/patch_rssm_defer_v030.py` (d2abdec): one anchored splice
  passes `input_batch.idx_mapping_np` when the knob is on, and the builder refuses the deferred commit without slots.
  `rvB` / `rvB2` step times are still valid (same work per step); their acceptance numbers are not.
- Depth-check acceptance differs run to run even between identical arms (`rvA` 1.28 / 1.25 / 1.37 vs `rvA2` 1.40 /
  1.27 / 1.27), so it is not a lossless signal.

## Files

