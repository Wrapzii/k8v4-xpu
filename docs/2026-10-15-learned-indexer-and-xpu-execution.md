# Learned page indexing and upstream XPU execution

The user changed the next experiment from more Quest/SparQ tuning to (1) reusing vLLM XPU sparse execution, (2) frozen-Qwen dense-teacher distillation, (3) studying IndexCache, while retaining the exact shared-prefix/q7 track. These are separate numerical, selection-quality and latency gates. No sparse serving integration is enabled.

## Research and installed-code audit

Primary sources inspected:

- [vLLM DSA implementation](https://vllm.ai/blog/2025-09-29-deepseek-v3-2): selection, indexer cache and sparse execution are separate stages. An executor receiving indices does not calculate relevance/top-k for us.
- [Installed upstream kernel interface](https://github.com/vllm-project/vllm/blob/main/vllm/v1/attention/ops/xpu_mla_sparse.py): the public wrapper assumes MLA with one shared K/V cache, one KV head and value dimension512. Our tensors have separate K8 and affine-V4 caches, dimension256, two local KV heads and GQA6. The underlying kernel already has distinct K/V pointers, strides and per-query/per-KV indices; the experiment uses it unmodified through a thin launch adapter.
- [IndexCache paper](https://arxiv.org/abs/2603.12201), [authors' patch](https://github.com/THUDM/IndexCache), and [vLLM configuration](https://github.com/vllm-project/vllm/blob/main/docs/features/index_cache.md): F layers index; S layers reuse the previous F layer's logical token selections. Published integration is for DSA models, not a Qwen GQA override. Greedy LM-loss calibration is stronger than overlap alone. DeepSeek's dense warm-up freezes base weights, but subsequent sparse continued training adapts the model; successful DeepSeek quality does not establish that an indexer-only retrofit will preserve frozen Qwen quality.

Production image inventory: vLLM `0.30.0+xpu`, image `200458a4…`. Sparse source `v1/attention/ops/xpu_mla_sparse.py` SHA256 `d98d17110577c2b7b4d05e07bfdae15faf83321b6342a5daaaecce45b9503f38`. Local parent-workspace receipt: `audit/model-validation/launch80-20261013/xpu-sparse-installed-audit.json`. No framework upgrade or original-image patch was performed.

`k8v4_v030/upstream_xpu_sparse.py` calls the existing private Triton entry point with dimension256, GQA6, distinct FP16/BF16 K/V and caller-provided buffers. This is an unsupported experimental launch configuration, not upstream's public API guarantee. It does not consume packed K8/V4 directly. Full dequantization or selected-slot gathering/casting has additional traffic, latency and memory cost and cannot be omitted from a future serving comparison. The upstream kernel explicitly rounds its accumulator to BF16 on output, so bit identity with the original integer native op is not assumed.

Device-only logical-page expansion is implemented with per-query causal endpoints, padded -1 indices and fixed-shape top-k including sink/recent pages. This removes the need for our eager host `.item()`/compaction path and supports separate per-query/per-KV selections. It does not automatically remove query scoring/ranking costs. Graph-compatible live index writes, COW/page recycling, rollback, concurrency and backend wiring remain unimplemented.

## First frozen-model distillation prototype: completed, not accurate enough

`k8v4_v030/learned_page_indexer.py` provides independent projections per KV group; instantiate independently for each FA layer. Six Q heads feed a rank16 query projection, while page mean/min/max dequantized K feed a rank16 page-key projection. Projected page keys can be cached and updated during cache writes; the prototype does not install that live hook. It does not train Qwen weights or feed teacher probabilities into inference.

Training used the existing **144 validated snapshots / 1008 correlated query positions**, native-calibration-qualified only. Training: 64 CODE32K/128K snapshots. Held out: all 80 remaining snapshots, comprising CODE200K extrapolation and every TOOLS snapshot. No random adjacent-position train/test split. These are still only two synthetic workload families, not a serious corpus.

Four models (FA3/15/31/63), each with two local KV-group predictors, have **73,728 parameters per layer**, 294,912 total. Fixed seed61141, rank16,128 AdamW steps/layer, LR0.002, no hyperparameter sweep. Dense-teacher probabilities are averaged across the six GQA heads per group and distilled with KL on nonmandatory pages. Sink and last eight pages are mandatory and count toward each row's budget. Recent/future pages cannot influence the ranking of older pages. The teacher is the existing frozen dense quantized-cache computation, not an approximate selector.

Detailed output-error evaluation was predeclared on bucket0/7 of held-out tag/layer pairs: **20 snapshots / 140 query positions**, all rechecked against saved native output. All80 held-out frames contribute KL diagnostics. Evaluation uses per-query/per-KV selections; its physical global union is reported separately and must not be combined with group-specific output error as a global-table implementation.

| Actual per-query/KV page budget | Method | Median relative output L2 | Worst relative output L2 | Below1% |
| --- | --- | ---: | ---: | ---: |
| 20% | First learned rank16 model | 11.10% | 28.00% | 0/20 |
| 20% | Quest normalized-weighted group baseline | 7.50% | 14.62% | 0/20 |
| 20% | Dense-mass teacher ranking | 5.88% | 12.85% | 0/20 |
| 50% | First learned rank16 model | 6.16% | 18.02% | 0/20 |
| 50% | Quest group baseline | 2.51% | 5.81% | 2/20 |
| 50% | Dense-mass teacher ranking | 1.96% | 4.84% | 4/20 |

The pipeline ran in33.8 seconds on the PC CPU; this is **not B60 inference speed**. The first learned model did not outperform the heuristic. Some training-layer KL losses did not decrease, so this is not evidence of a converged or well-tuned neural selector. Dense-mass top-k is an oracle for retained average group mass, not an oracle minimizing output L2 or final task loss; its error is not an impossibility bound for learning. The source features/teacher pooling and small, correlated training set are explicit limitations. No selected checkpoint was promoted based on held-out tuning.

Artifacts in parent workspace `audit/model-validation/launch80-20261013/perf-learned-indexer-20261015`: `teacher-dataset.pt`, four `layer*-rank16.pt` checkpoints, `prototype-receipt.json`, `heldout-screen.jsonl`. Script: `prototype_learned_indexer.py`. Production models/counters/weights remain unchanged.

## IndexCache investigation

`audit_index_reuse.py` joins only the same request tag and exact sequence length, then compares logical page positions across the valid captured FA layers. It never reuses physical page IDs from another layer. There are576 diagnostic rows across budgets10/20/50% and available pairs.

At20%, median Jaccard overlaps for teacher-group page sets are approximately0.221 (FA3→15),0.308 (15→31) and0.235 (31→63). These are **widely separated FA layers**, not adjacent-FA evidence; Qwen's intermediate layers are hybrid, and the same KV-group number need not have the same semantic role. The data does not justify blindly enabling every-fourth-layer reuse or rejecting IndexCache for adjacent layers. Cache identity must include request, logical query positions, cache epoch and layer mapping; prefix mutation, recycled pages and MTP rollback must invalidate stale state.

Next capture should sample consecutive full-attention layers3/7/11/15 at identical request-bound q7 steps, retain query positions and source signatures, then test own versus reused selection output error and final LM loss. Even high overlap is not proof of preserved reasoning/tool fidelity. The authors report failures of overlap/output-similarity-only pattern selection; their calibrated LM-loss criterion matters here. That additional model capture has not been submitted by this prototype.

## Exact shared-prefix/q7 track

`merge_attention_states` implements the softmax/LSE decomposition, with no page pruning. CPU float64 tests match dense attention within1e-12 at all seven causal endpoints and cover empty partitions. This validates the decomposition, not an optimized shared-load GPU kernel. The older native shared-prefix prototype remains about1.16x with max absolute difference~0.02, not bit-identical and not deployed. Reusing unchanged K/V loads is exact in real arithmetic; changed GPU reduction order still needs output/logit validation.

Next exact GPU work must preserve physical-page-content identity, use distinct queries/private tails, compare C1/C2/C4 with q7 boundary cases, and measure actual load reuse rather than counting prefix-cache hits. The previous shared-prefix prefill optimization remains separate from this decode work.

## GPU executor test status

The first bounded helper launch failed before GPU execution because a new child file could not be bind-mounted beneath a read-only parent. Its receipt is preserved at server `perf-upstream-sparse-20261015`, return125; production restoration ran. A prepared second launch copies an isolated module overlay before stopping serving. It uses the same six-test budget: two synthetic GQA numerical controls and four frozen CODE128K/200K Quest-selected executions; no generation requests. Neither launch alters the original backend/library/image. Final measurements and restoration receipt must be appended before calling executor reuse validated.

Seventeen focused CPU tests pass, including cached-versus-direct projection, KV-group independence, fixed budgets, per-query causal indexing, and exact q7 partition merge. No model/task fidelity or serving speedup is claimed.
