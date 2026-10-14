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

Results will be appended after the finite replay completes. No sparse-attention production improvement is claimed at this preparation stage.
