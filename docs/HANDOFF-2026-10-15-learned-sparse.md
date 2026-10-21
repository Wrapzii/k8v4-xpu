# Current handoff: learned sparse selection, B60 execution, exact prefix reuse

Updated **2026-10-15 03:40 UTC / October14 Eastern**. Analysis pack: `docs/concurrency-dossier-2026-10-15/INDEX.md` plus `results/`. Branch `codex/compact-slm-concurrency`. This is the active decode/concurrency task; old Anime Studio/DFlash/MTP controllers are unrelated and must not be restarted.

## Objectives and acceptance gates

1. Reduce high-context C2/C4 decode cost while preserving the user's FP16/TP2/MTP6/maxseq4 production configuration. Distinguish attention-operation improvements from final tokens/sec.
2. Reuse upstream vLLM XPU sparse execution where appropriate, measuring compatibility/conversion cost rather than assuming DeepSeek MLA is a drop-in K8/V4 GQA executor.
3. Keep **Qwen frozen**. Compare learned selectors per full-attention layer and KV group. Train on CODE32K/128K plus additional CODE128K; hold out CODE200K and every TOOLS capture. Do not randomly split nearby positions from the same request across train/test.
4. Improve dense-mass/page-ranking objective and compare predictor capacity. The first prototype already used dense-mass KL, not generic heuristic-score regression; add weighted hard-negative/high-mass ranking and a normalized linear-versus-small-MLP comparison.
5. Report **actual physical pages → selector ms → sparse attention ms → total ms → output L2**, keeping physical global unions separate from hypothetical/per-query/per-KV execution. Never combine traffic from one path with error from another.
6. Agreed operation-level fidelity gate: **relative attention-output L2 strictly below1%**. Latency cut: **total below1.600ms** at200K. At128K ordinary full attention is1.086ms, so merely beating1.600ms is not a speedup there. Index/cache maintenance, conversion, allocation and graph behavior must eventually be included.
7. Before serious fusion work, learned selection must beat the best matched heuristic **held-out accuracy/page-count frontier**, ideally below1% with materially fewer than~59–64% physical pages. A fast inaccurate predictor does not qualify. Then require logits/LM-loss and code/tool task fidelity, followed by matched C1/C2/C4 serving. No sparse candidate currently qualifies.
8. Study IndexCache across **consecutive FA layers**; do not blindly copy DSA skip patterns into hybrid Qwen. Keep exact q7/shared-prefix load reuse separate. Exact mathematical decomposition still needs floating-point/logit checks.

## Completed results

### Previous selector study

See `2026-10-15-group-selector-study.md` and parent workspace `audit/model-validation/launch80-20261013/perf-sparse-long-20261014/validated-selector-summary.json`.

-144 usable original q7 snapshots /1008 correlated query positions. Six mislabeled snapshots excluded;42 others could not be reconstructed/calibrated and were excluded. Do not describe all original data as recovered.
-Twelve fresh full native controls replayed bit-identically. The~0.058% CPU/full-native discrepancy was **reference calibration**, not sparse-model loss.
-2.18x pilot attention-only speedup was real, but selection erased it. No sparse serving speedup was measured or deployed.
-At the agreed1% screen, no measured configuration met total<1.600ms. With a zero-cost selector,25/105 native cases at128K and16/105 at200K did. This keeps the research opportunity open; these are one layer31 snapshot/context, not general workload certification.
-Full210-case table: `perf-sparse-repair-20261015/selector-tradeoff-128k-200k.csv` in the parent audit directory.

### First learned predictor: complete, fails quality

Module `k8v4_v030/learned_page_indexer.py`; audit script `prototype_learned_indexer.py`.

-Four FA-layer models3/15/31/63, each two KV-group predictors;73,728 parameters/layer,294,912 total; rank16,128 fixed optimizer steps/layer, seed61141.
-64 CODE32K/128K frames trained;80 remaining frames held out. Detailed output L2 was checked on20 predeclared held-out endpoint frames; all80 contributed KL diagnostics.
-At20% per-query/KV pages, learned median/worst output L2 **11.10%/28.00%**, versus Quest group **7.50%/14.62%**;0/20 learned passes. At50%, learned **6.16%/18.02%**,0/20 passes.
-Some training-layer losses did not improve. This first architecture/training run is not a converged capacity study and does not disprove learned indexing.
-Artifacts: parent audit `perf-learned-indexer-20261015/{prototype-receipt.json,teacher-dataset.pt,heldout-screen.jsonl,source-lineage.json,layer*-rank16.pt}`. CPU total33.8sec is not B60 inference latency.

### Upstream XPU executor and first-predictor timings: complete GPU probe

Installed vLLM `0.30.0+xpu`; source kernel SHA256 `d98d17110577c2b7b4d05e07bfdae15faf83321b6342a5daaaecce45b9503f38`. The public MLA wrapper assumes one shared K/V cache, one KV head and dimension512. Experimental `upstream_xpu_sparse.py` launches its **unmodified private kernel** with separate FP16 K/V, head dimension256, two KV groups/GQA6. This is not official support for our packed-cache layout.

-Two synthetic controls and four CODE128K/200K selected-index runs passed CPU-FP16 numerical comparison; relative discrepancies~0.156–0.174%, partly from the kernel's explicit BF16 output rounding. These are executor correctness checks, not sparse-vs-full quality checks.
-The installed executor is a reference serial sparse path. At128K, actual selected global unions35.0%/77.5% took **49.57/109.48ms** attention-only. At200K,37.6%/80.1% took **81.29/172.65ms**. It is **not a replacement speed win**. Full CPU cache dequantization/copy was excluded and would add cost; a live selected-slot K8/V4 adapter is unimplemented.
-First BAD predictor, cached FP16 side keys, B60 eager timings:

| Context | Query score | Top-k | Index expansion | Sum | Full page-key projection, separately |
|---|---:|---:|---:|---:|---:|
|128K|0.601ms|0.374ms|0.393ms|1.368ms|0.596ms|
|200K|0.627ms|0.377ms|0.408ms|1.412ms|0.464ms|

-These exclude live feature/cache updates and allocations and do not meet the~0.62ms selector headroom found in the previous200K example. Do not pair these bad-predictor timings with another selector's low error.
-Server root `/mnt/hdd-500gb/model-validation/launch80-20261013/perf-upstream-sparse-v3-20261015`, `gpu-execution.jsonl` ends `passed=true`, six executor tests, zero model generation. Same log copied to parent local audit directory of that name.
-Earlier v1/v2 launch receipts are preserved. They failed before GPU execution: nested read-only child mount, then missing staged query-page module. The corrected driver performs import preflight before stopping serving. Do not rerun the failed roots or overwrite their receipts.
-Original `vllm-k8v4-tp2` restored; health200 confirmed01:30 UTC. The driver session1610 was waiting to finalize its restoration receipt; read actual receipt/session before claiming it exited. No sparse backend/model was installed in production.

## Expanded frozen experiment: complete on B60; fails quality; not fused

Capture root: `/mnt/hdd-500gb/model-validation/launch80-20261013/perf-indexer-scale-20261015` (384 q7 snapshots + 24 bases; `capture_passed`, 8100 restored). Packed receipts: `docs/concurrency-dossier-2026-10-15/results/frozen-*.json*`.

XPU isolator (`xpu:0` B60, reuse `teacher-dataset.pt`, production restored): 12 models, 256 steps, 528 valid / 160 train / 368 held-out CODE200K+TOOLS. Training ~1 min; full held-out ~5 min. Losses drop (~3.8 → ~0.7–1.1). **Learned linear16 and mlp64-rank16 lose to SparQ64.** No learned budget all-passes <1% global-union L2. Dense-mass teacher needs ~50% nominal / ~83% physical pages to all-pass. CODE200K and TOOLS fail the same way. Do not fuse. Do not remount sparse serving.

## Exact prefix + context parallel (2026-10-15 night): complete; not mounted

Packed receipts: `docs/concurrency-dossier-2026-10-15/results/{split-cp,cp-two-worker,cp-vs-tp}-*`.

- Native compact T(L) q7 is linear plus ~200 µs launch (200K = 1623 µs, matches 1.62 ms). Hermes-like 2K/200K cascade is **0.96×** vs two full walks. 90% share traffic bound is **1.54×** only if prefix is loaded once (native cannot do that without fuse-KV). XPU `merge_attention_states` vs dense L2 ~1.2e-6.
- Two affinity-pinned workers, hkv=2 × 100K: 874/875 µs solo; concurrent 875/1039 µs; host 86 KB merge 1.52 ms eats the win.
- **CP instead of TP** (hkv=4 × 100K vs hkv=2 × 200K): q7 **1742 vs 1659 µs**. Same bytes per GPU; slightly slower. Concurrent CP2 1744/1747 µs.

Do not stack CP on TP2. Do not replace TP2 with CP on these two B60s. Production stays dense.

## IndexCache and exact work

Existing widely separated FA3→15→31→63 teacher-set overlap at20% has median Jaccard~0.22–0.31. This is not evidence about consecutive FA layers. New3/7/11/15 captures are intended to address that gap. `audit_index_reuse.py` joins request+exact query position and uses logical pages; it does not reuse physical page IDs across layers. IndexCache's published greedy **LM-loss** calibration matters; local overlap/L2 is an initial screen only.

`merge_attention_states` and q7 CPU float64 tests validate exact softmax prefix/private-tail decomposition within1e-12, including empty partitions. No new optimized GPU shared-load kernel was completed. The old~1.16x shared-prefix prototype remains numerically non-bit-exact (~0.02 maxabs) and unmounted. Keep that independent exact-computation research track alive without calling it deployed or zero floating-point risk.

## State/safety/workspace constraints

-Original serving container ID `28136a70ca30038781fa2965b297d509fb5c6bed54019fd54bbee56f26423515`; image `200458a4…`; best library SHA `ffe0e5a1a2a2930efb6578b78b8e6b9b9405299c1ad72c8ce550385f1f738632`; backend SHA `c2639e06e517f4a37ede269997c76fda411e9e718eeaefe81682474db82576df`.
-Preserve FP16, TP2, MTP6, maxseq4,262144 context, batch4224, graph sizes7/14/21/28, prefix cache, existing parsers/vision settings. API aliases still say Swift; actual weights are the Launch80 target on SSD.
-No VM reboot; no unrelated workload changes. A Forgejo build appeared during work; do not stop it. No model-weight fine-tuning.
-No subagents, goals, automations or PRs created. No push requested. Do not restart old DFlash/MTP test controllers.
-Unrelated dirty docs pre-exist: `2026-10-14-compact-verifier-slm.md`, `HANDOFF-2026-10-14-decode-performance.md`, untracked evening-concurrency doc. Do not blanket-add/reset them. Parent workspace contains unrelated Anime work.
-Use script files/SCP, not complicated PowerShell→SSH quoting. Preserve failed receipts and finite budgets. Native/CPU timing, full-reference calibration, sparse-output approximation and model/task fidelity are distinct claims.
-Focused tests: **20passed** (indexer/cached projections, high-mass loss, causal indices, query-page rules, actual-prefill ownership, exact q7 merge). GPU numerical probe passed separately. Expanded frozen study and CP probes completed; none qualify for mount. Full catalog: `docs/concurrency-dossier-2026-10-15/INDEX.md`.
