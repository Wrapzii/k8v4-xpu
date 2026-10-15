# GQA-group selector study and extended captures

The user requested expanding the selector experiment rather than judging feasibility from six 32K samples. Attention-only acceleration is an opportunity, not an endpoint speed result. The previous eager implementation's overhead is measured separately from selection accuracy.

## Finite capture plan

Six requests: exact input lengths 32768, 131072 and 200000, each with a controlled code workload and a controlled tool-transcript workload. Each has a 128-token output cap with EOS ignored for a fixed horizon. No retries. This is at most 768 generated tokens, not a model-quality benchmark or real tool execution.

Sample rank-zero full-attention layers 3, 15, 31 and 63 at up to eight sequence-position buckets, every sixteen tokens. Up to 192 q7 snapshots represent up to 1344 query positions. Not every model layer or TP rank is covered, and samples from one continuation are correlated.

To avoid copying several gigabytes repeatedly, each tag/layer writes one immutable full-prompt base. Subsequent snapshots reference it and save only their current KV tail, query, output and physical page IDs. Reconstruct base plus tail before analysis. Full-output replay/calibration must detect stale or misaligned reconstruction; compression of the evidence format is not an accuracy shortcut.

Remote root: `/mnt/hdd-500gb/model-validation/launch80-20261013/perf-sparse-long-20261014`. Controller `run_sparse_long_capture.py`, hook `sparse_long_capture_hook.py`, status `long_capture_status.py`. Original serving container is restored in `finally`; production attention/weights/prefill remain unchanged.

## Implemented selector comparison

`group_page_scores` implements max, top-two mean, and query-norm-weighted aggregation across the six Q heads sharing each KV head. Probability-normalized versions prevent a head's additive score offset from dominating the shared ranking. These are explicit experimental ranking rules, not learned or certified attention-mass estimates.

For the fixed q7 bundle, a second maximum over query positions yields one ranking per KV group. A group receives one list at a given budget; this differs from unioning six or forty-two independent lists. Retain the sink and recent pages, and report actual counts including those mandatory pages.

The study evaluates Quest metadata bounds and SparQ-inspired 32/64-dimension scans at budgets 5/10/20/30/50%. `group_selector_study.py` records:

- Unique physical pages and the global union required by the existing native ABI, plus per-KV-group fractions.
- Minimum, median, fifth percentile, mean and maximum retained attention mass; worst query/head identity.
- Aggregate and per-head attention output error, with a CPU-reference/native calibration discrepancy.
- Score calculation, ranking and selected-output reduction CPU times separately. These are **not XPU or serving timings**.
- Pairwise page-set Jaccard overlap for the six Q heads within a KV group.
- Adjacent positions inside the MTP bundle, and logical/physical overlap between captured positions.

Group-specific output metrics simulate a future per-KV-group selection kernel. `global_union_*` metrics simulate the existing native table path, which reads the union for all KV heads. Do not combine the hypothetical group's byte savings with the existing global path's smaller error and call it one measured implementation.

The expanded CPU reference models K8 query/key quantization and FP16 affine V decoding. In the initial six snapshots its output differs from native by at most about 0.000305 relative L2. This calibration is recorded for every new frame; a large discrepancy is a reconstruction/reference blocker, not a selector failure. Model logits and task outcomes remain additional gates.

Twelve targeted tests pass, including group-ranking rules, shared-list versus independent-list behavior, and normalized ranking's invariance to per-head additive logit offsets.

## Exact shared-prefix track

Keep this distinct from pruning. [Hydragen](https://arxiv.org/abs/2402.05099) and [FlashInfer Cascade](https://docs.flashinfer.ai/api/cascade.html) decompose shared-prefix and private-tail attention and merge attention states. This preserves the full attention computation mathematically; floating-point kernel changes need not be bit-identical.

Our older fuse-KV prototype was about 1.16x on its 90%-shared native experiment, with max absolute differences around 0.02. It is not a validated exact deployment and is not mounted. Next evidence should verify actual physical prefix sharing, unchanged K/V bytes, different private tails/causal endpoints, then output/logit fidelity and matched throughput. Physical page IDs from different times may be recycled: equal IDs alone are not proof of unchanged shared contents. Prefix caching remains enabled; no native-prefix speedup is claimed here.

The long-context study is active. Its final per-context findings and restored-server receipt must be added before claiming completion or a deployable sparse path.
