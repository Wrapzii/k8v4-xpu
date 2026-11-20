# Reproducible oneDNN matmuls on vLLM 0.34 (K8V4_ONEDNN_DETERMINISTIC), 2026-11-19
## run-to-run nondeterminism (cause, fix)

**Cause.** The unquantized bf16 GDN `in_proj_ba` (`[M, 5120] x [5120, 96]`; the Swift 1.5 bake keeps
`in_proj_a` / `in_proj_b` dense, so vLLM runs it as a plain `F.linear`) goes through oneDNN's matmul. At some
row counts that matmul uses a different reduction order on each call. With MTP depth 6 the hybrid KV layout
makes the attention block 2,112 tokens (the conv state grows by the draft depth), so prefill chunks are 2,112
or 4,224 rows: exactly the row counts where the matmul is not reproducible. The small `a`/`b` gate
differences then grow through 48 GDN layers. None of our knobs causes it. Their base has it at 0.30 and at
0.34. Our ports change how large the effect is: W4A8 on every linear makes some prompts more sensitive.

**Evidence** (one B70, all on `k8v4-up:all034-575ee85`, cold prompts with a fresh `cache_salt` each):

1. Harness history. Their stack was never deterministic: `e2es32` (0.30 base) cold2 top-1 8/10, KL max
   0.15. `upsim` 8/10, max 0.56. `e2eu96` 10/10, max 0.21. `pfxall-pmu` (all-034 plus prefix work) 9/10, max
   1.20. `all034A` 8/10, max 3.99. Our 0.34 port with Swift: KL 0.00000.
   The check's "cached 0" is a reporting artifact: their launch line has no
   `--enable-prompt-tokens-details`, and the engine log shows prefix-cache hits. Cold and cold2 have
   different salts, so they are two real cold prefills.
2. `detcheck.py` (a local analysis script) sends the same prompt with `prompt_logprobs=0` several times,
   back to back and with a different long prompt in between. On the 14,279-token code prompt it reports the
   last-token KL between runs and the mean |delta logprob| over every prompt position:

   | window | what | last-token KL (b2b / after other / plain pair) | prompt mean abs delta logprob |
   |---|---|---|---|
   | detA | config A | 0.153 / 0.730 ... 2.371 (top-1 flip) / 0.714 | 0.57 |
   | dnoGH | A without `K8V4_GDN_HEADS` | 0.174 / 0.076 / 0.725 (flip) | 0.51 |
   | dnoW4 | A without the W4A8 knobs | 0.040 / 0.251 / 0.368 (flip) | 0.39 |
   | dbase | their 0.34 base (S1 32, depth 3 shared, no ports) | 0.021 / 0.010 / 0.025 | 0.39 |
   | dnoS1 | A + `--no-async-scheduling` | 0.649 / 0.332 / 0.536 | 0.53 |
   | sNoPC | base, prefix caching off (`--mamba-cache-mode=none`) | 0.022 / 0.045 / 0.025 | 0.37 |
   | dbaseS1 | base, **no speculative config** | 0 / 0 / 0 | **0 (bitwise)** |
   | dA (no spec) | A, **no speculative config** | 0 / 0 / 0 | **0 (bitwise)** |
   | sD1 | base, **MTP depth 1** | 0 / 0 / 0 | **0 (bitwise)** |

   So no single port is the cause. Speculative decoding with depth > 1 is the trigger.
3. Kernel microtests, same inputs called repeatedly, comparing bits: the W4A8 s4 library GEMM, the Triton
   quantizers and the fused oneDNN SDPA are all bitwise equal at 4224 / 1647 / 200 rows. Only the library
   w4a16 at 200 rows of `mlp.down` differs, by at most 3e-5.
4. Per-layer checksums from an eager window (`--enforce-eager`, depth 6, a `sitecustomize` hook):
   - The first divergence is always in a GDN layer, with identical layer input.
   - Inside the GDN op, the `qkvz` input is identical but `projected_states_ba` differs.
   - The prefill chunk is 2,112 rows at depth 6 and 2,048 rows at depth 1. At 2,048 rows all 48 GDN calls are
     identical across runs.
5. `F.linear` bf16 `[M, 5120] x [96, 5120]^T`, 6-8 repeats:
   - Not reproducible at M = 2112, 4224, 1056, 2171, 6336 and 128 (max abs delta up to 3e-2).
   - Reproducible at 2048, 4096, 3168, 1797, 1607, 1458 and 59.
   - Padding to a multiple of 256 does not help (2304 differs), nor does an fp32 matmul, nor does
     `K8V4_NCONTIG_RE=in_proj_ba` (that fixed the fp16 case in our stack, not this bf16 one).
   - With `torch.backends.mkldnn.deterministic = True` it is bitwise equal at every M, at the same speed
     (2112 rows: 62.2 vs 62.9 us; 4224: 114.5 vs 131.0 us).

**Fix.** `K8V4_ONEDNN_DETERMINISTIC=1` (new and opt-in; module `k8v4_v030/onednn_det.py`, wired in
`backend.py`, passed by `launch.sh` only when set, bad values refused). It sets
`torch.backends.mkldnn.deterministic` in the engine process. It touches only the matmuls torch sends to
oneDNN: the int4 GEMM libraries build their own primitives, and the microtests show those are already
reproducible. Unset, the launch command and the behaviour are unchanged.

- Commits: `b70/ncontig` 5d83f49, cherry-picked to `b70/all-034` 1e2951f.
- Tests: `test_onednn_det` (CPU contract, plus an XPU bitwise test that skips without a device) and a
  `test_launch_profiles` case. The unittest suite passes in the 0.34 image: 182 tests, 12 XPU skips.

**Before / after** (config A as `all034A`; `all034Adet` adds `K8V4_ONEDNN_DETERMINISTIC=1`;
`TESTS="exact prefix users"`, `USERS=1`):

| | all034A (before) | all034Adet (flag on) |
|---|---|---|
| prefix check, cold2 vs cold | KL mean 0.664, max 3.989, top-1 8/10 | **KL 0.00000 on all 10, top-1 10/10** |
| prefix check, full / part vs cold | max 6.283 / 3.116, top-1 8/10 / 9/10 | 0.00000 / 0.00000, 10/10 / 10/10 |
| detcheck, 14,279 and 2,171 tokens (window `dAdet`) | last-token KL up to 2.37 (top-1 flip), 57% of positions differ | **bitwise: 0 differing positions, KL 0** |
| EXACT | 8/9 | 8/9 |
| cold 63K prefill | 2,084 tok/s (30.2 s) | 2,063 tok/s (30.5 s) |
| one-user 63K decode | 73.4 tok/s, step gap p50 49 ms / p99 50 ms | 68.5 tok/s, step gap p50 49 ms / p99 50 ms |
| warm TTFT, one user | 1.30 s | 1.31 s |

- Prefill is within 1% (single runs).
- The decode step time is unchanged (same 49 ms gap). The lower tok/s is fewer accepted draft tokens on this
  run's text, not slower steps. One-user decode on this stack has read 55-74 tok/s across earlier windows.
- Both windows used the same image and the mounted `k8v4_v030` of `b70/all-034`. No rebuild was needed: the
  knob is Python only.

**Left.**
- The small last-rows noise that remained without speculative decoding is also gone with the flag. That was
  a 59-123-row tail pass, and `in_proj_ba` at 128 rows differed in the microtest.
- The library's own w4a16 GEMM can still differ in the last bits at decode-size row counts (200 rows of
  `mlp.down`: 3e-5 in the microtest). These checks measure prefill only, so decode-step reproducibility is
  not covered. Making that reproducible needs `set_deterministic` in the library's primitive attributes
  (a rebuild) and a decode-speed check.
- Recommendation: add `K8V4_ONEDNN_DETERMINISTIC=1` to the speed-first profile (config A,
  the local test harness `COMMON`) and to any window that compares numerics.
- QualityBench was not run (not required yet). The flag changes no arithmetic, only the reduction order of
  one small GEMM.
