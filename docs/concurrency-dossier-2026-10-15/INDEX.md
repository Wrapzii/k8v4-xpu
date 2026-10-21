# Concurrency / decode dossier (2026-10-14–15)

This folder is the analysis pack for everything tried on Xe2 K8/V4 Qwen3.8-27B serving (`vllm-k8v4-tp2` on ai01, two Intel B60 24 GiB). **No `.pt` captures, no `.so` kernels, no launcher scripts.** Narratives live in `docs/*.md`; raw receipts live in `results/`.

Production was left **dense FP16 / TP2 / MTP6 / maxseq 4**, compact verifier lib `ffe0e5a1…`. Nothing from the rejected sparse or CP probes was mounted.

## Goals (still the scoreboard)

| Goal | Status | Best measured |
|---|---|---|
| ~65 tok/s decode at 200K C1 | **Met** | 70.9 tok/s |
| ≤15% per-stream loss at C>1 | **Not met** | 200K C2 **31.7%** (48.4 vs 70.9); C4 **60.2%** (28.2) |
| Prefill 3–4k tok/s one prompt | **Not met** | ~2.15k short/mid, ~1.2k at 128K; PCIe all-reduce ~9 GB/s |

Model of long-context decode: cycle ≈ `T_other (~7.5 ms) + C × T_kv (~6.6 ms)`. Compact q7 attention is almost perfectly serial: **1.62 / 3.19 / 6.35 ms** at 200K C1/C2/C4.

## Assumptions to audit

1. Attention-output L2 <1% is the sparse quality gate; loosening it requires logits/Hermes A/B, not a rescue of a failed selector.
2. Dense-mass KL ranking is **not** an L2-optimal oracle and cannot prove impossibility, but the mass teacher already misses 1% at useful sparsity.
3. Prefix **cache** hits are not prefix **decode** reuse. 98.2% sibling-warm hits cut prefill 182 s → 5.8 s and do not change C2/C4 tok/s.
4. TP2 already uses both GPUs (heads, not sequence). Adding “a second GPU” does not shorten the 200K walk unless context is split **instead of** TP, or a fused shared-prefix walk exists.
5. `heads × tokens` bytes per GPU are isomorphic for TP2 (`hkv=2 × 200K`) vs CP2 (`hkv=4 × 100K`).
6. One Python process driving two XPUGraphs is **not** a valid two-GPU measurement (GPU1 artifact ~91 ms). Two affinity-pinned workers are.
7. Fuse-KV / SHARED_WALK is a different kernel than exact `merge_attention_states`. The former was 1.16× / not bit-exact. The latter is 1e-12 on CPU float64 and ~1e-6 on XPU fp32 vs dense, with no fast native shared-load.

## Experiment catalog

### A. Serving decode / concurrency (kernel and 8100)

Narrative: `docs/HANDOFF-2026-10-14-decode-performance.md`, `docs/2026-10-14-decode-attention-partials.md`, `docs/2026-10-14-compact-verifier-slm.md`, `docs/2026-10-14-evening-concurrency.md`, `docs/concurrency-dossier-2026-10-15/HANDOFF_CONCURRENCY_2026-10-14_CURRENT.md`, `docs/concurrency-dossier-2026-10-15/perf-continue-README.md`.

| Experiment | Result | Deployed? | Data |
|---|---|---|---|
| Live-row gating | bit-exact | **Yes** (always on) | decode-attention-partials doc |
| fp16 S1 partials | max abs ~1e-5; no model-quality eval | **Yes** (`XE2_KV_PARTIAL_FP16=1`) | same |
| Small-S1 q1 draft | bit-exact; q1 C1 1306→578 µs at 128K | **Yes** | same |
| Compact 8-KiB verifier | kernel −12.5% at 200K C4 q7; C4 +6.2% tok/s, C2 +0.7%, C1 noisy | **Yes** (`ffe0e5a1…`) | compact-verifier doc |
| Local MTP argmax | wash (8K C2 16.4% vs 16.9%) | Flag still on live Cmd; not a win | `results/argmax-probe.jsonl`, `results/switch-argmax.json` |
| Compact-sync / fastsync | bit-exact, **1.00×** at 200K C4 q7 | **No** | `results/fastsync-ab.jsonl` |
| Extra XPU streams on `attn_batch` | graph-illegal; eager slower | **No** | `results/parbatch-*.jsonl` |
| Shared-walk L1 (one WG/page, loop Qs) | 1.05–1.09×; shared ≈ distinct; not bit-exact | **No** | `results/sharedwalk-ab.jsonl` |
| Prefix-once fuse-KV 0/90/100% | p90 **1.16×**, p100 1.19×; max_abs ~0.02 | **No** | `results/prefix90-ab.jsonl` |
| Live 200K prefix-share C1/C2/C4 | decode **unchanged**; prefill 182 s → 5.8 s at 98.2% hits | Cache stays on | `results/share-prefix-200k*.jsonl`, `share-prefix-aligned.jsonl` |
| Two pages/S1, q7 6-row block, S2 width sweep, batch=8448, oneCCL knobs | slower or wash | **No** | decode-performance “tried and rejected” |

### B. Sparse selection and learned indexer

Narrative: `docs/2026-10-14-query-page-selection.md`, `docs/2026-10-15-group-selector-study.md`, `docs/2026-10-15-learned-indexer-and-xpu-execution.md`, `docs/HANDOFF-2026-10-15-learned-sparse.md`.

| Experiment | Result | Deployed? | Data |
|---|---|---|---|
| Eager selector + native attn | ~6× slower than full at 32K | **No** | query-page-selection doc |
| Quest / SparQ / group rankings, 144+ snapshots | at 1% L2 no config has total <1.600 ms | **No** | `results/validated-selector-summary.json`, `results/selector-tradeoff-128k-200k.csv` |
| First learned rank16 prototype | 20% L2 11.1%/28% vs Quest 7.5%/14.6%; 0/20 pass | **No** | `results/learned-prototype-*.jsonl` |
| Upstream XPU MLA sparse executor (dim 256 GQA6 adapter) | numerically ~0.16% vs CPU-FP16; **49–173 ms** attn, not a speed win | **No** | `results/upstream-sparse-*.json*`, `results/xpu-sparse-installed-audit.json` |
| Frozen linear16 vs mlp64-rank16, XPU, 528 frames, 368 held-out | losses drop; **learned loses to SparQ**; 0 configs all-pass <1% L2; teacher needs ~83% physical to all-pass | **No** | `results/frozen-completed.json`, `results/frozen-heldout-frontier.jsonl` (7.4 MiB), `results/frozen-xpu-run-receipt.json` |

Frozen held-out headline (global-union L2, 368 CODE200K+TOOLS frames):

| 20% budget | median L2 | worst L2 | <1% | median physical |
|---|---:|---:|---:|---:|
| dense-mass teacher | 2.3% | 4.6% | 55/368 | 49% |
| SparQ64 | 2.9% | 11.7% | 22/368 | 47% |
| Quest | 4.8% | 18.5% | 0/368 | 36% |
| linear16 | 5.0% | 15.2% | 2/368 | 40% |
| mlp64-rank16 | 5.6% | 18.6% | 2/368 | 37% |

CODE200K and TOOLS fail the same way. Layer 63 is the only easy layer at 20%. More CODE32K/128K cannot beat the teacher ceiling.

### C. Exact prefix merge and context parallel (2026-10-15 night)

CPU float64 q7 prefix/tail merge: `results/q7-prefix-merge.json` (merge L2 <1e-11; FP32 merge is not bit-identical ~3.8e-6).

| Experiment | Result | Deployed? | Data |
|---|---|---|---|
| Native T(L) q7 compact + cascade **traffic bound** | T(200K)=1623 µs, T(2K)=201 µs. Hermes 2K/200K cascade **0.96×** (worse). p90 **1.54×** vs 2× full **if** prefix loaded once. XPU merge vs dense L2 **1.2e-6** | **No** | `results/split-cp-probe.jsonl` |
| One-process 2-device XPUGraph | GPU1 ~91 ms artifact; invalid | **No** | same file `cp_solo` / `cp_parallel` |
| Two affinity-pinned workers, hkv=2 × 100K | GPU0/1 solo **874/875 µs**; concurrent 875/1039 µs; 200K=1649 µs; host 86 KB merge **1.52 ms** eats the win | **No** | `results/cp-two-worker-*.jsonl` |
| CP **instead of** TP (hkv=4 × 100K vs hkv=2 × 200K) | q7 **1742 vs 1659 µs** (CP 5% slower); q1 wash 822 vs 842; concurrent CP2 1744/1747 µs | **No** | `results/cp-vs-tp-*.jsonl` |

## What is closed vs still open

**Closed as serving levers on these two B60s**

- Sparse page selection / learned indexer (quality; no fast executor)
- Fuse-KV / shared-walk / extra streams / fastsync
- Prefix cache as a decode C2/C4 fix
- Context parallel stacked on TP2 (drops heads)
- Context parallel **instead of** TP2 (same bytes, slightly slower q7)
- Ordinary Hermes shared-prefix cascade (2K/200K is a net loss)

**Still open, not this pack’s winners**

- GDN verify + small per-request kernels (8K 16.9% → 15% gap)
- Fused / overlapping prefill all-reduce (3–4k tok/s goal)
- Bit-exact fused prefix walk **only** if production traffic is same-document ~90%+ share
- Logit/Hermes A/B at ~50% **physical** pages (not 40% nominal) — only if a fast kernel exists; do not loosen 1% L2 to rescue sparse
- IndexCache on consecutive FA 3/7/11/15 (captures exist; LM-loss not done)

## Production snapshot after these probes

- Container `vllm-k8v4-tp2`, image `sha256:200458a4…`, lib `ffe0e5a1…`, backend `c2639e06…`
- Health 200 restored after every isolator
- Rollbacks: `vllm-k8v4-tp2-before-argmax-20261014204535`, `vllm-k8v4-tp2-before-compact8win-20261014191618`
- Do not restart old DFlash/MTP controllers; do not remount sparse or CP kernels
