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

## Completed long-context screen

The finite capture and component tests have ended. No sparse path is deployed. Production was restored to the same original container/backend and compact library `ffe0e5a1…`, FP16, TP2, MTP6, max sequences four. At 2026-10-15 00:39 UTC its health check returned 200 and a real smoke request returned `ready`. Receipt: `audit/model-validation/launch80-20261013/perf-sparse-repair-20261015/final-server.json` in the parent workspace.

The initial 192-snapshot capture exposed an instrumentation race: the next HTTP request's global tag could label the previous request's late upper-layer forward. Six TOOLS bases at 32K/128K were byte-identical to the preceding CODE bases; six last-position snapshots belonged to that preceding request and were excluded. A request-bound capture hook was implemented and twelve fresh controls were collected from the exact frozen TOOLS prompt tokens, at most sixteen output tokens per context, without retries. All twelve full native replays were **bit-identical** to their captured outputs.

Replacing the six wrong bases with fresh captures did **not** reconstruct the original queries accurately enough. The original and new prefix states differ, and 42 old snapshots still failed the CPU/native calibration limit. Those snapshots are excluded, not counted as failed selectors. The mismatch's precise numerical origin is unresolved; do not describe the new bases as a successful recovery of old evidence. All raw captures and the exclusion/replacement manifest are preserved on the server. Redundant local copies of the repair captures were removed after local disk space interrupted one analysis; the partial output remains preserved and the 200K TOOLS analysis completed in a separate file.

Final usable original evidence: **144 q7 snapshots / 1008 correlated query positions** across rank-zero layers 3/15/31/63. At 32K and 128K each context has 32 CODE snapshots and eight TOOLS layer-3 snapshots; 200K has all 64 CODE/TOOLS snapshots. Maximum valid full-output CPU/native relative L2 discrepancy is 0.000653. Do not claim balanced upper-layer TOOLS coverage at 32K/128K, independent tasks, semantic fidelity, or complete-model coverage.

All Quest, SparQ-inspired 32/64-dimension, seven aggregation modes and 5/10/20/30/50% budgets were screened. For illustration, the matched **20% SparQ64** rows are:

| Context | Ranking | Actual global physical pages, median | Worst retained mass, group path | Max group output relative L2 | Max global-union output relative L2 |
| --- | --- | ---: | ---: | ---: | ---: |
| 32K | independent lists, then union | 77.1% | 72.1% | 2.73% | 1.58% |
| 32K | probability-normalized weighted group | 27.8% | 32.6% | 11.55% | 8.70% |
| 128K | independent lists, then union | 79.8% | 77.2% | 3.37% | 1.69% |
| 128K | probability-normalized weighted group | 30.2% | 36.4% | 14.90% | 10.94% |
| 200K | independent lists, then union | 77.6% | 78.2% | 2.83% | 1.51% |
| 200K | probability-normalized weighted group | 29.0% | 30.2% | 15.57% | 11.21% |

The group path reads about 20% per KV group; its global union is larger. These output columns are distinct algorithms. At 200K/20%, the six-head pairwise page overlap median was 0.479. Adjacent MTP-position overlap was 0.687 for independent-list unions and 0.635 for normalized weighted groups; overlap between sampled positions was 0.809 and 0.534, respectively. Selection has temporal reuse potential, but sets are not constant. Other modes and all budgets remain in `perf-sparse-long-20261014/validated-selector-summary.json` and the source JSONL rows.

None of the context-wide selector configurations passed the exploratory minimum-mass 0.999 / aggregate-output-L2 0.01 screen on every usable sample. This is a conservative screen of **ungated attention**, not measured task loss or proof that useful sparse attention is impossible. The implementation is a page-max-pooled SparQ-inspired selector, not a full reproduction of the published token algorithm, its layouts, or interpolation.

## GPU component measurements

The fresh request-bound controls also supplied one layer-31 q7 snapshot per context for 315 GPU timing cases (three selectors, seven modes, five budgets). Eight rotating cache addresses reduce small-subset cache reuse bias. Full native replay was exact on all twelve controls. Timings below are eager components for the **existing global-union native ABI**, without a live serving model, not graph-replayed endpoint throughput or a per-KV sparse kernel.

For SparQ64 normalized weighted groups at 20%:

| Context | Full attention | Selected attention | Selector scores | Ranking | Host compaction | Component sum |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 32K | 0.308 ms | 0.116 ms | 1.512 ms | 1.340 ms | 0.099 ms | 3.066 ms |
| 128K | 1.086 ms | 0.319 ms | 3.209 ms | 1.382 ms | 0.125 ms | 5.035 ms |
| 200K | 1.600 ms | 0.466 ms | 4.899 ms | 1.450 ms | 0.221 ms | 7.035 ms |

The 200K attention-only improvement is 3.44x on this one sample, but output relative L2 is 3.07%, and the selector erases the speed gain. The fastest component sum of any tested 200K case was still 1.885 ms versus 1.600 ms full attention, with 8.59% output L2 error. Component sums additionally exclude table allocation, scheduler/model work and live index maintenance. Metadata build time is recorded separately. These eager costs do not predict the floor of a future fused selector.

The bottleneck remains repeated long-history attention: previous matched native 200K q7 C1/C2/C4 costs were 1.620/3.193/6.346 ms. This identifies the growth in attention cost, not a complete endpoint time breakdown. The next serving candidate needs accurate cheap selection or shared-prefix reuse, followed by logits/task validation and matched C1/C2/C4 endpoint testing. No further generation or benchmark loop is running. Twelve query-index unit tests pass. Detailed GPU evidence is `perf-sparse-repair-20261015/native-gpu-probe.jsonl` and its summary in the parent workspace.
