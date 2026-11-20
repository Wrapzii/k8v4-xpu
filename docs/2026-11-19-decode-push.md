# Decode push: GDN state dtype, GDN RecoverSSM, GEMMs, host gaps (2026-11-19)

Goal (user): their stack reads less per token than ours (int8 K + int4 V KV = 0.75 B per element against our
fp8 = 1 B; the same int4 GPTQ weights), so it should go further than ours, not only reach parity. Targets (our
0.34 stack, one B70, Swift 1.5, 63K): 4-user aggregate 204-209 tok/s, 1 user 79-86, agent sessions 149 / 282 s
(1 / 4 clients), coding-client decode 146 / 137 / 139 / 106 tok/s at 2K / 8K / 32K / 128K.

Base for every run: `b70/all-034` config A (`K8V4_MAX_SEQS=4`, prefix caching, util 0.96, `XE2_KV_S1_SPLITS=32`,
embed host, draft skip shared, GDN heads, W4A8 all layers via oneDNN, draft last row, shared depth 3) plus
`K8V4_DRAFT_VOCAB` (s4 head fix) and `K8V4_ONEDNN_DETERMINISTIC=1` (1e2951f, cherry-picked; makes config A
bitwise reproducible). our local test harness: `TESTS="exact users custom mt"`, `USERS="1 4"`,
`MT_LEVELS="1 4"`, `CONV_PER_CLIENT=1`, `SEED_BASE=20261118`, plus the coding client (`serve_coding.py`).

## Knobs

| knob | branch (from `b70/vllm-034`) | what it does | numerics |
|---|---|---|---|
| `K8V4_MAMBA_SSM_DTYPE=float16` (bfloat16 / float32) | `b70/gdn-state-dtype` fde698e, 1973309 | passes `--mamba-ssm-cache-dtype`; unset keeps the bake's `mamba_ssm_dtype` (float32) | changes numerics (state rounded to 16 bits each token); our prod runs float16 |
| `K8V4_GDN_RECOVERSSM=1` | `b70/gdn-recoverssm` e0bcdf3, 7d6bc97, bench 81d9de6 | `--use-replayssm` + mounts `build/libk8v4_rssm.so` (`compile_rssm.sh`); the GDN spec rows verify off the request checkpoint without writing a state per draft token; the accepted tokens are folded into the checkpoint once after sampling | lossless verification up to fp rounding; not bit-identical to the per-draft-state path |

`K8V4_GDN_RECOVERSSM` is the vLLM RecoverSSM path (`--use-replayssm`, upstream for Kimi KDA; GDN as in vLLM
PR 61309 / 62625) carried from our 0.34 port: the commit kernels (`k8v4_v030/rssm_gdn.py`, `rssm_kernels.py`) and
the metadata builder (`rssm_backend.py`) are copied unchanged apart from imports; `gdn_recoverssm.py` holds the
hooks and the mixed-step split (prefill rows through the stock fused op, spec rows through
`_xpu_C.causal_conv1d_spec` + the RecoverSSM verify). The verify is the vllm-xpu-kernels v0.1.17 SYCL kernel built
as a standalone op with per-request replay rows (`native/rssm`, about 5 min to build, CPU only). The vLLM side is
eight anchored, idempotent splices in `tools/patch_gdn_recoverssm_v030.py` (run by `Dockerfile.unified`; refuses
unknown source), all inert unless the knob is set and vLLM runs with `--use-replayssm`. Default launch command
unchanged (`test_launch_profiles`); CPU contract tests in `k8v4_v030/tests/test_gdn_recoverssm.py` and
`test_mamba_ssm_dtype.py` (the latter has an XPU check that the fused GDN op takes a half / bf16 state next to bf16
activations: max |out diff| / max |out| 3.6e-3 fp16, 1.8e-3 bf16 against the float32 state; passed on the B70).

Test branches: `b70/test-decode-push` (test-vocab-all034 + state dtype) and `b70/test-rssm` (+ RecoverSSM +
1e2951f; image `k8v4-up:rssm-v2` = `rssm-5fd6110`).

## End to end (same image, same day, determinism knob on)

| | base `dpD-base` | fp16 state only `dpS16` (*) | fp16 state + RecoverSSM `dpR16` | ours (`swift034`) |
|---|---:|---:|---:|---:|
| KV tokens | 384,176 | 444,505 | **508,996** | 373,124 |
| EXACT | 8/9 | 8/9 | 8/9 | |
| 1 user 63K decode, tok/s (gap p50) | 70.1 (44 ms) | 72.0 (44 ms) | **77.3 (42 ms)** | 78.7 (45 ms) |
| 4 users 63K aggregate, tok/s (gap p50) | 177.9 (63 ms) | 179.4 (64 ms) | **180.7 (61 ms)** | 204.2 (55 ms) |
| depth check (chat prompts) 1 user, tok/s | 68.0 / 69.8 | 64.5 / 65.1 | 69.4 / 71.4 | |
| depth check 4 users aggregate, tok/s | 214.7 | 221.8 | **237.2** | |
| coding decode 2K / 8K / 32K / 128K | 146.5 / 138.6 / 123.4 / 99.1 | 145.9 / 138.9 / 130.5 / 96.8 | **151.7 / 149.2 / 138.8 / 106.2** | 146 / 137 / 139 / 106 |
| agent sessions 1 / 4 clients, s | 163.8 / 324.9 | 165.7 / 307.9 | **158.4 / 304.5** | 149.5 / 281.6 |

(*) `dpS16` ran before the determinism fix existed, on `b70/test-decode-push` (no RecoverSSM in the image).
Run-to-run spread before the fix was large at one user (gapVf 82.5 vs dpD-base 70.1 on the same config): the
users test decodes one 512-token answer and tokens per step follow its content; the gap p50 column (step time)
is the stable part, and the depth check (several chat prompts) averages acceptance.

Reading: RecoverSSM with a half state cuts the step by 2 ms at both widths (1 user 44 -> 42 ms, 4 users 63 -> 61
ms), lifts the 4-user chat aggregate 10.5% and the coding client 4-12%, and adds a third more KV (no per-draft
state blocks). With it the coding client now matches or beats ours at every length (151.7 / 149.2 / 138.8 / 106.2
vs 146 / 137 / 139 / 106) and the 1-user 63K rate is within 2% of ours. The half state alone buys memory only.
The 4-user 63K aggregate (180.7 vs 204.2) and the agent sessions remain behind: that gap is the decode attention
(below), which another agent is rewriting (`wt/s1-rows`).

## GDN cost per decode step (microbenchmark, `bench/gdn_spec_bench.py`, `dp-gdnbench`)

48 GDN layers, Qwen3.8-27B GDN shapes, bf16 activations, distinct state blocks per layer; ms per decode step,
conv included.

| path | 4 requests x 3 drafts | 1 request x 6 drafts |
|---|---:|---:|
| stock spec, float32 state | 6.32 | 3.07 |
| stock spec, float16 state | 5.41 | 2.99 |
| RecoverSSM float16: verify + commit | 2.17 + 1.35 = **3.52** | 1.91 + 0.33 = **2.24** |
| RecoverSSM float32: verify + commit | 2.34 + 2.43 = 4.77 | 2.15 + 0.62 = 2.76 |

In the serving profiles (torch profiler, eager) the stock spec kernel alone is 4.19 ms per 4-user step with the
float32 state and 4.68 ms with float16 (1 user: 1.22 -> 2.18 ms): the stock kernel stores the 16-bit state
element by element after every draft token, so a half state does not make the stock path faster in place. That
is why `K8V4_MAMBA_SSM_DTYPE=float16` alone moved memory (+16% KV) and not step time, and why it should be used
together with `K8V4_GDN_RECOVERSSM` (verify reads the checkpoint, commit writes it once, both vectorised).

## Per-step budget, 4 x 63K (ms of device time per decode step)

| part | theirs, base (gapA eager, fp32 state, full draft head) | theirs, vocab + fp16 state (dpprof-graph, graphs on) | theirs + RecoverSSM (from the bench) | floor theirs | floor ours (fp8 KV) |
|---|---:|---:|---:|---:|---:|
| attention (S1 + draft S1 + S2 + pack + store) | 24.2 | 24.1 | 24.1 | 12.7 | 16.4 |
| GEMMs (target + draft layer + draft head) | 33.2 | 30.6 | 30.6 | 24.1 | 24.1 |
| GDN (recurrence + conv; RecoverSSM verify + commit) | 4.8 | 5.3 | ~3.5 | 1.5 | 1.5 |
| other (norms, copies, sampler, rejection) | 1.1 | 1.1 | 1.1 | - | - |
| **device busy** | **63.3** | **61.0** | **~59** | **38.3** | **42.0** |
| step, gap p50 without profiler | 66 (all034A) | 63-64 | 61 | | 55 (ours, swift034) |

Our own stack, profiled the same way with graphs on (`dpprof-ours`, `b70-vllm:0.34.0-rh-e7c147e-28-exp`): the
random-token prompts of the profiler client make it copy, so it ran deep copy drafting (4.8 accepted per draft,
16 verify rows per request) and its steps are not comparable one to one. Per generated token in the same 3 s
window at 4 x 63K: ours 3.52 ms of device time (attention 1.36, GEMMs 1.87, GDN 0.22, other 0.08) against theirs
4.07 ms (attention 1.61, GEMMs 2.04, GDN 0.35, other 0.07; dpprof-graph, before RecoverSSM). The earlier
eager profile of ours (2026-11-05, prod -8 era) is in docs/2026-11-19-decode-gap.md; its 11.3 ms attention is below
the 16.4 ms fp8 read floor at 4 x 63K and should not be used as a target.

Floors at the 597 GB/s measured read roofline. Weights: int4 + bf16 g128 scales = 0.516 B/param; target
13.25 GB per step (64 x gate_up 91.9 MB, 64 x down 46.0, 48 x GDN in_proj 43.3, 64 x out/o_proj 16.2, 16 x attn qkv
37.8, lm_head 656) = 22.2 ms; draft layer x 3 passes 0.6 GB = 1.0 ms; 64K-row draft head x 3 = 0.5 GB = 0.9 ms.
KV: theirs 1,584 B per token per layer (int8 K + int4 V + scales, 101,376-byte 64-token page) = 99.8 MB per request
per layer at 63K, x 19 layer passes (16 target + 3 draft) x 4 requests = 7.6 GB = 12.7 ms; ours fp8 2,048 B = 9.8 GB
= 16.4 ms. GDN: float16 state 1.57 MB per request per layer; RecoverSSM reads it twice and writes it once = 0.9 GB
= 1.5 ms.

## Levers 2-4 (GEMMs, host, the rest)

**GEMMs: 30.4-30.6 ms per 4-user step against a 24.1 ms floor (79%).** Every target GEMM is the k8v4_w4a8 oneDNN
bf16 x s4 path at 500-575 GB/s; bf16 = fp16 within 1-2% (decode-gap doc microbench), so `--dtype` is not a lever.
In the eager profile the GDN out_proj looked 28 us slower than the attention o_proj of the same shape (65 vs 37
us); `dp-gemmcalls.py` (per-call duration vs the device idle time before each call) shows those calls follow
~76 us of host idle in eager mode (the GDN custom op breaks out of the graph) and the gate_up calls run 172-208 us
(bench 172); the graph-mode trace has no such idle. Fused qkv / gate-up layouts are already in place (one GEMM
each). What is left is kernel efficiency (79% -> ~95% would be ~3 ms) - a new int4 decode GEMM for 4-16 rows,
not a knob; our stack runs the same oneDNN kernels, so this would be a gain over ours too.

**Host / graphs: every 4-user verify step replays one FULL graph and the draft steps replay their decode graphs**
(captured widths `[7, 8, 12, 14, 16, 21, 28]` target, `[1..4]` requests draft). Graph-mode profile (`dpprof-graph`,
4 x 63K): 61.0 ms device busy per step against a 63-64 ms gap p50 without the profiler, so ~2-3 ms (4%) per step is
host-serial time: input preparation of the next step (`_prepare_rope_positions`, slot mappings, block-table
gathers, Mamba align pre-copy) waits for the previous step's sampled tokens. One user: 42.9 ms busy vs 44 ms gap.
Removing it needs vLLM-level overlap of spec-decode bookkeeping, not a launch knob.

**The rest (sampler, rejection, logits processors, S2 merge): ~1.1 ms per step together** - argmax over 248,320
rows x 3 (0.1 ms), rejection 0.005 ms, S2 merge 0.68 ms, Q pack 0.81 ms, q copies 0.19 ms. Nothing above 1%.

**Attention: 24.1-24.2 ms against a 12.7 ms floor** (68 S1 launches of 24 query rows per 4-user step at 20.7 ms):
the largest gap to ours and to the floor; the multi-row S1 rewrite is the other agent's (`wt/s1-rows`). With it at
our ~94%-of-floor level (13.5 ms) the 4-user step would be ~50 ms - below our 55 ms.

## Recommended config

Config A + `K8V4_DRAFT_VOCAB=<64K ids>` + `K8V4_ONEDNN_DETERMINISTIC=1` + `K8V4_MAMBA_SSM_DTYPE=float16` +
`K8V4_GDN_RECOVERSSM=1` (image with `tools/patch_gdn_recoverssm_v030.py` applied, `build/libk8v4_rssm.so` from
`compile_rssm.sh`). Numerics differ from the float32-state default (state rounded to fp16, as in our prod); the
RecoverSSM verification itself is lossless. QualityBench not run yet (user: speed first).

## Files

