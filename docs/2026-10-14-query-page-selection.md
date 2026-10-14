# Query-aware decode page selection investigation

The evening results show that sibling prefix reuse improves prefill and GPU capacity but not decode throughput. Extra streams, barrier cuts, local argmax and the shared-KV prototypes have already been screened. This investigation implements a different lever: selecting relevant historical pages for each current query while keeping the full original cache recoverable.

## Research and choice

| Approach | Relevant property | Decision for this stack |
|---|---|---|
| [Quest](https://arxiv.org/html/2406.10774v2) | Estimates page relevance from the current query and per-channel key extrema; queries can revisit any historical page. | First prototype. Adapt the algorithm to existing K8/V4 storage rather than installing CUDA kernels. |
| [SparQ](https://graphcore-research.github.io/posts/sparq/) | Uses important query dimensions to estimate relevant keys; its authors describe a GQA adaptation. | Alternative if coarse page bounds fail. Requires a different key access/index path. |
| [AsyncSpade](https://arxiv.org/abs/2510.07486) | Overlaps selection using predicted queries. | Later option. Validate current-query selection first; our prior extra-stream experiment was graph-incompatible. Published A100 results do not establish XPU compatibility. |
| [Sparse Frontier](https://github.com/PiotrNawrot/sparse-frontier) | vLLM sparse-attention evaluation with retrieval, reasoning and code tasks. | Useful evaluation design. Its published framework is tested on A100/H100 and documents a batch-size-one limitation, so it is not a drop-in concurrency fix. |

These are approximate attention methods. Preserving the full cache does not make each sparse attention result mathematically equal to full attention. Research accuracy results on other models do not certify this hybrid Qwen target, INT8 keys, MTP6 or long-context agent tasks.

## Implemented prototype

`k8v4_v030/query_page_index.py` builds FP32 min/max metadata from the actual dequantized INT8 keys. Partial-page garbage is excluded. Each query/head selects its highest-ranked pages; the sorted union also retains sink and recent pages. The union may be much larger than the nominal per-head budget. Report its actual size, not an assumed 80–90% byte reduction.

The offline replay passes selected physical page IDs to the existing native attention op. All pages containing live query tokens remain included, so causal endpoints can be remapped without changing stored RoPE positions or requantizing keys. A full-budget control must reproduce the saved native output exactly. Neither the serving backend nor native library is modified by this prototype.

This version deliberately uses explicit snapshot metadata and eager PyTorch operations. It is not graph-ready and does not maintain live metadata through writes, prefix COW, page recycling or speculative rollback. Those are requirements for eventual integration, not features already implemented. Selection timing includes host validation/synchronization; it is an honest eager prototype cost, not optimized kernel latency.

## Validation boundary

Seven CPU tests pass: all-head/sign score bounds, dirty partial tails, full-budget identity, per-head selection coverage, causal remapping across a page boundary, nonconsecutive original-token causal equivalence, and invalid-input refusal.

The finite real-model experiment captures two 32K workloads with 16 generated tokens each, rank zero, early/middle/late target full-attention layers and the MTP layer where available. Capture runs exact compact attention in an isolated eager clone. Offline replay compares full and sparse outputs, native page-mass retention, actual selected fraction and attention-plus-selection latency. Capturing is not a serving speed benchmark.

Predeclared screening thresholds are minimum retained softmax mass at least 0.999 over every sampled live head/query, and relative attention-output L2 at most 0.01. Passing these alone does not permit deployment. Target-logit KL, top-k/margin changes and frozen retrieval/code/tool task quality must also pass, followed by a matched C1/C2/C4 serving comparison with graphs and live index updates.

Receipts are in `audit/model-validation/launch80-20261013/perf-quest-v2-20261014` on the server. The first capture attempt failed before loading the diagnostic model because two host bindings were rewritten to one identical address/port. Its receipt is preserved in `perf-quest-20261014`; the corrected controller preflights the port and uses one loopback binding. It always restores the unchanged original serving container in a `finally` block.

## Completed real-model screen

Captured six real seven-query attention snapshots, rank zero, layers 3/31/63, on the code and structured-record workloads (lengths 32775–32790). No q1/MTP-layer snapshot was obtained; do not claim that path was validated. Each capture's full native replay matched its saved output **exactly**. The finite native replay completed with return code zero.

| Nominal per-head budget | Actual shared page fraction | Worst retained head/query mass | Worst relative output L2 | Median attention-only speedup | Screens passed |
|---|---:|---:|---:|---:|---:|
| 10% | 31.2–64.7% | 73.19% | 4.93% | 2.18× | 0/6 |
| 20% | 47.0–85.2% | 82.75% | 2.19% | 1.72× | 0/6 |
| 50% | 84.2–98.2% | 96.46% | 0.42% | 1.16× | 0/6 |
| 100% control | 100% | ~100% | 0 | ~1× | 6/6 |

The warmed eager selector plus attention is roughly **six times slower** than the native full-attention operation at 32K. Selection includes real host validation/synchronization and is not graph-ready. Even the 100% control incurs unnecessary helper overhead; production full attention bypasses that helper. These numbers reject this implementation as a serving optimization. They do not prove an optimized sparse selector cannot work at 200K. No C1/C2/C4 serving gain is claimed.

The 0.999 mass threshold is a conservative internal screen, not a semantic-task benchmark. The 50% cases have small aggregate output error but still fail that screen. Do not translate that into a measured text-quality loss, or relax it and call the method validated without target-logit and task results.

## Second implemented selector and oracle diagnostic

`dimension_page_scores` adds a SparQ-inspired GQA dimension scan. It sums query magnitudes within each KV group to choose channels, scores actual keys in those channels, and ranks pages by their maximum estimated token score. It omits mean-value interpolation and uses page-granular shared-table unions; it is not a complete reproduction of the published SparQ system. Packed K memory transactions and GPU throughput for this second method have not been benchmarked.

CPU screening reused the same six frozen captures, with no extra model requests. At a 20% per-head budget:

| Query dimensions read | Mean actual pages read | Worst retained mass |
|---|---:|---:|
| 32 / 256 | 65.7% | 84.18% |
| 64 / 256 | 68.6% | 88.54% |
| 128 / 256 | 73.7% | 90.90% |

These also fail the retained-mass screen. This is CPU score analysis, not a native output-error or speed comparison. Two additional tests pass, bringing the targeted suite to **nine tests**, including full-dimensional score equivalence and padded-tail handling.

An offline CPU oracle using full dequantized-key attention found that the most diffuse head in each snapshot needs **80.7–94.7% of pages** to retain 99% of its mass even with ideal ranking. To retain 99.9%, the corresponding fractions are 96.9–99.4%. The union of independently selected per-head oracle sets covers 97.3–100% at 99%; that union is not a mathematically optimal joint selection. These are six 32K samples, not proof about all Qwen heads, workloads or 200K contexts.

This provides a concrete reason not to wire a fixed 10–20% shared page budget into serving. The next meaningful design needs head/layer-specific budgets, an efficient graph-compatible selector, and output/logit/task-based acceptance of approximation. Sparse page traffic, eager overhead, and model quality are separate gates. A smaller average output error alone is not a finished model-quality evaluation.

## Receipts and final boundary

- `perf-quest-v2-20261014/capture-receipt.json`: finite generation/capture budget, original backend hash and restoration result.
- `captures/*.pt`: six frozen query/K8/V4/output snapshots, retained locally and on the server.
- `replay.jsonl`, `summary.json`: native controls, actual mass/error/timing rows, aggregate results.
- `dimension-screen.jsonl`, `dimension-oracle-screen.jsonl`: CPU-only second-selector/oracle diagnostics.
- `run_quest_capture.py`, `quest_capture_hook.py`, `quest_replay.py`, `sparq_capture_screen.py`: audit scripts in the parent audit folder locally; staged copies on the server.

The serving backend, weights, prefix-cache/prefill implementation and native library remain unchanged. Neither sparse selector is enabled in production. The concurrency slowdown remains unresolved; these tests establish implementation and fidelity boundaries, not a successful deployment.
