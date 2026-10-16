# Four Intel GPUs: TP2 × CP2 experimental branch

Branch: `codex/tp2-cp2-four-gpu`. Baseline: `3eb9d37` from
`codex/compact-slm-concurrency`, plus the current FP16/local-argmax/native
launch settings inventoried on October 16, 2026.

**Status: an experimental implementation and test package. Four-GPU model
serving, maximum concurrency and endpoint speedup have not been validated.**
Do not substitute an attention-only result for a model/task fidelity result.
The existing two-GPU production server was not replaced by this work.

[Recorded component checks](../results/tp2-cp2-2026-10-16/README.md): native
partition output passed 32 cases with worst relative L2 0.03396%; the real
two-device fused merge passed eager and changed-input graph replay. The
capped C4 merge smoke still took about 1.1 ms with graphs. Four-GPU combined
attention, full-model fidelity, serving speed and maximum concurrency remain
unmeasured. The guide below is a qualification procedure, not a speed claim.

## What uses each card

All four cards participate in every request. They are not four independent
servers and CP is not a concurrency limit.

| Process rank | TP lane | Context lane | Local full-attention heads |
| --- | --- | --- | --- |
| 0 | 0 | 0 | KV heads 0–1, corresponding 12 query heads |
| 1 | 1 | 0 | KV heads 2–3, corresponding 12 query heads |
| 2 | 0 | 1 | KV heads 0–1, corresponding 12 query heads |
| 3 | 1 | 1 | KV heads 2–3, corresponding 12 query heads |

TP groups are `[0,1]` and `[2,3]`. Context groups are `[0,2]` and `[1,3]`.
These are process/visible-device indices; `--devices` controls their mapping
to physical cards. Check PCIe topology before comparing device orders.

Each TP pair executes the **same complete input queries**, during both
prefill and decode. Weights and Qwen's GDN/recurrent state are replicated
between context lanes. Full-attention KV alone is striped in 64-token chunks.
Each lane produces its attention output and natural-log softmax normalization;
one device collective and a fused Triton weighted merge reconstruct the complete output.
No context pages are selected or dropped. Floating-point reduction order
differs from the unsplit kernel, so bitwise identity is not promised.

This preserves two local KV heads per GPU while roughly halving the historical
KV walked by each full-attention operation. It does not halve model weights,
GDN work, TP collectives or all other per-step costs. Additional communication
may erase the saved KV time. Measure it.

## Why this needs an adapter

Upstream DCP alone does not create four processes: it normally reuses TP
ranks. PCP expands the process world. In the inventoried runtime, its stock
V2 PCP manager supports MLA and partitions prefill queries; that is not a
correct drop-in for Qwen's GQA + recurrent layers.

The adapter deliberately uses TP2/PCP2/DCP2 for the process/group/cache
geometry, with the legacy XPU runner executing replicated queries. It replaces
the stock head-replication check only for this exact topology/model family,
keeps GDN unsharded, fixes MTP's new-slot and next-draft slot mappings, and
broadcasts sampled tokens between matching CP lanes before state updates.
It does not simply suppress all PCP compatibility checks.

`cp_runtime_contract.json` pins thirteen relevant runtime source files. Five
have narrowly scoped patches; eight cache/group/runner files must match
unchanged. Unknown source or a modified patch fails before files are written.
The patch is installed in a new Docker image, not on the host or in production.

Primary background:
[vLLM context parallel deployment](https://docs.vllm.ai/en/stable/serving/context_parallel_deployment/).
The installed source contract, rather than the moving documentation, is the
compatibility authority for this branch.

## Current production improvements carried forward

- Unified HKV2/HKV4 native library; FP16 model activations; K8/V4 cache.
- Compact verifier SLM, hoisted metadata, rolled V loop, FP16 partials,
  S2 lookahead, draft/verify subgroup settings 32/8, two-pass S2 disabled.
- MTP6 and local argmax reduction; W4A8 MLP prefill; existing tool/reasoning parsers.
- Original TP1/TP2 oneDNN/Triton gather prefill and shared-prefix drafter cascade
  remain available in the ordinary two-GPU launch path.

The **initial CP path has limitations**: text only; synchronous scheduling;
eager launch by default; no LoRA/KV-transfer connector; Qwen hybrid/four KV
heads only. Its bounded-memory prefill is a correctness implementation, not
the production oneDNN fast path. Its q1 LSE-export path does not yet use the
drafter shared-prefix cascade. The current q7 kernel optimizations are reused.
Do not describe this first CP configuration as retaining the same prefill
speed or every serving feature. The normal two-GPU path retains those features.

## Build on the four-card Linux host

Use four B60s **or** four B70s on one host, a working Intel XPU/vLLM Docker
environment and the same model weights. Mixed models, alternate GQA geometry,
multiple hosts and TP4 are outside this trial. Keep model weights on SSD.

```bash
git clone https://github.com/Wrapzii/k8v4-xpu.git
cd k8v4-xpu
git switch codex/tp2-cp2-four-gpu

# If the compiler image is not already installed:
bash k8v4_v030/compile_image.sh
bash k8v4_v030/compile_decode.sh

bash k8v4_v030/compile_sdpa.sh
# Required artifacts now exist: libxe2_kv.so, libk8v4_sdpa.so, libdnnl.so.3.
docker build -f Dockerfile.unified -t vllm-openai-xpu:v0.30.0-k8v4-unified .
docker build -f Dockerfile.tp2cp2 -t vllm-openai-xpu:v0.30.0-k8v4-tp2cp2 .
```

If the source contract rejects the base image, save that error and the
active vLLM source hashes. Do not delete guards, change the hash manifest to
make it pass, or patch a running server. The adapter needs to be reconciled
against that runtime first.

## First gate: four-rank attention correctness and timing

Use idle cards, with no model server occupying their memory. The attention
benchmark uses synthetic independent request histories and actual native
packed caches. It is not an endpoint benchmark or a trained-model evaluation.

```bash
mkdir -p results/tp2cp2
docker run --rm --device /dev/dri --ipc=host --entrypoint bash \
  -v /dev/dri:/dev/dri -v /dev/dri/by-path:/dev/dri/by-path:ro \
  -e ZE_AFFINITY_MASK=0,1,2,3 -e ZE_FLAT_DEVICE_HIERARCHY=COMPOSITE \
  -e PYTHONPATH=/repo -e XE2_KV_LIB=/opt/k8v4/libxe2_kv.so \
  -v "$PWD:/repo" -w /repo \
  vllm-openai-xpu:v0.30.0-k8v4-tp2cp2 -lc '
  set -euo pipefail
  python3 -m unittest k8v4_v030.tests.test_cp_kernel_xpu -v
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --merge-only --graphs \
    --output results/tp2cp2/merge-graphs.json
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --contexts 63,64,65,129,263 \
    --concurrencies 1,2,4 --iters 3 --output results/tp2cp2/small.json
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --output results/tp2cp2/long-eager.json
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --graphs --output results/tp2cp2/long-graphs.json
  '
```

The default long test covers 128K and about 200K, C1/C2/C4, q1 and q7, shuffled
manager blocks of 2112 tokens, 64-token context stripes, and odd lengths.
Use `--pages-per-block 1` as an additional layout check. Graph validation
changes Q and sequence lengths after capture, then compares replay with the
unsplit kernel. A capture/replay failure blocks graph-enabled serving.

Each result contains unsplit local attention time, half-history walk + LSE
time, collective + merge time, combined CP time, and output error. Timings use
the slowest rank and synchronized repetitions. The default operation-level
relative L2 gate is **0.1%**, stricter than the earlier 1% sparse screen; this
is not a substitute for model fidelity. Empty shards must produce finite
merged outputs. A speed win requires **combined** CP time below the unsplit
time, not just a faster half-history kernel.

`--merge-only` isolates the real collective plus fused packet/softmax merge;
it never labels that result native-attention validation. The single-GPU
unit test executes two virtual shards for native numerical validation. Neither
of these substitutes for the combined four-rank test. The harness defaults
to the production CCL settings while preserving explicit environment overrides.

## Second gate: actual model serving

Start at C4, 90% memory utilization and eager mode. `--dry-run` prints exact
arguments without Docker/cache/server changes. The launcher never removes an
existing container or changes card clocks.

```bash
python3 tools/launch_tp2_cp2.py --model-dir /ssd/model --dry-run

# First run the no-MTP control and validate it, then stop/remove only this
# named experimental container before launching the MTP6 candidate.
python3 tools/launch_tp2_cp2.py --model-dir /ssd/model --no-mtp
docker logs -f vllm-k8v4-tp2cp2

# After control validation and explicit cleanup of the experimental container:
python3 tools/launch_tp2_cp2.py --model-dir /ssd/model
```

Compare against the same weights/dtype/K8V4 backend on ordinary TP2:
deterministic outputs/logprobs, short/long prefill, cached-prefix continuation,
chunked and mixed prefill/decode, q7 acceptance/rejection across stripe and
manager-block boundaries, cancellation, preemption/resume, structured tools,
and C1/C2/C4 independent histories. Include non-greedy sampling to exercise
token synchronization. Check that no recurrent-state divergence accumulates.
Use request/task checks for math, code and edits, not merely HTTP 200 or token
count. Save actual workload token lengths and MTP acceptance alongside speed.

Only after correctness passes, repeat with `--graphs`. Test both q1 and q7
graph paths on the model; the attention-only graph test is necessary but
insufficient. Model startup failure or fidelity drift means the branch is
not ready, even if the native microbenchmark passes.

## Find the useful concurrency on B60 versus B70

`--max-seqs` is configurable through 32. Four is a starting point, not a
capacity claim. Increase to 8, then 12/16 only after the prior configuration
passes. Use independent **200K prompt + 10K output** streams for capacity
tests; shared-prefix streams alone hide the real VRAM requirement. Preserve
context length, output length, workload and acceptance when comparing C1–C4.

For a rough full-attention payload calculation, per GPU per request:

`local_tokens × 2 KV heads × 396 bytes × number_of_FA_layers`

At 210K total tokens and 16 FA layers this is about **1.24 GiB/GPU/request**.
Verify FA-layer count from the actual model config. This excludes block
rounding, weights, replicated GDN states, scratch, graphs and runtime reserve.
More max-seqs can consume more state/graph memory and shrink the remaining KV
pool. B70's larger VRAM may fit more agents; do not infer the answer by simply
doubling total VRAM or treating four cards as four replicas.

Also compare two ordinary TP2 replicas, one per pair. CP replicates the GDN
and feed-forward work for every request; two replicas can distribute requests
between pairs. CP therefore needs to earn its latency/throughput advantage in
the long-context measurements. Extra cards alone do not establish that CP is
the highest-throughput way to serve the most agents.

For every concurrency save startup cache-capacity logs, memory by rank,
preemption/OOM counters, prefix-cache hits, TTFT, per-stream decode rate,
aggregate rate and MTP acceptance. Choose the highest concurrency that both
fits without preemption and delivers useful latency/throughput. If C8 fits but
slows every agent badly, it is not automatically the best production setting.

## Handoff: next work after the first receipts

1. Resolve any four-rank startup, metadata, recurrent-state or graph failures
   before performance tuning. Keep the source contract and fail-closed guards.
2. At 128K/200K, determine whether the new cost is the native LSE extraction,
   collective/merge, or replicated prefill. Do not optimize the half walk in
   isolation or reuse the previous host-merge timing as a device result.
3. If the primitive wins and model fidelity passes, integrate LSE export into
   S2, profile the fused device merge, add a correct faster prefill, and restore local
   shared-prefix q1 cascade support. Revalidate after each change.
4. Qualify image inputs and async scheduling separately; neither is currently
   advertised by this CP launch profile.
5. Publish four-GPU model C1/C2/C4 and capacity results for B60/B70 separately.
   Do not promote the branch based on two-rank or CPU validation alone.
