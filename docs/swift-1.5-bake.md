# Swift 1.5 special-weight bake — October 1, 2026

This derivative starts from the [Swift AutoRound compatibility checkpoint](swift-1.5-trial.md), pinned to upstream revision `278de52d4252d0b7c0ea01833d1403cd386c65ef`. It keeps the 400 existing quantized body linears and vision weights. It adds calibrated, symmetric GPTQ INT4 (group 128, no activation ordering, 1% damping) for nine previously dense linears: `lm_head`, `mtp.fc`, MTP attention q/k/v/o, and MTP MLP gate/up/down. The embedding uses per-row symmetric INT8 codes with FP16 scales through a tensor-parallel-aware runtime loader.

Calibration uses Swift's own activations, not the previous Qwen checkpoint's Hessians or weights. There are 128 WikiText-2 validation prompts of 384 tokens with up to 64 generated tokens, eager TP2, and MTP6. Row-parallel inputs are gathered before building full-input Hessians. Every 64th input row is withheld from calibration, with up to 1,024 held-out rows per input owner. Dataset provenance and exact row counts are recorded in `calibration.json` and `BAKE.json`.

## Quantization checks

All nine linears pass packed-code round-trip checks. On withheld activations, each GPTQ result has lower output error than the corresponding round-to-nearest baseline:

| linear | GPTQ relative output L2 | round-to-nearest relative output L2 |
| --- | ---: | ---: |
| lm_head | 3.515% | 7.638% |
| mtp.fc | 5.588% | 11.312% |
| MTP q_proj | 2.155% | 4.432% |
| MTP k_proj | 5.028% | 10.387% |
| MTP v_proj | 4.091% | 8.243% |
| MTP o_proj | 5.046% | 11.874% |
| MTP gate_proj | 3.019% | 6.499% |
| MTP up_proj | 4.703% | 9.750% |
| MTP down_proj | 6.009% | 11.513% |

Embedding relative weight L2 error is 0.901%. These are matrix checks, not a model-quality or perplexity comparison. The CPU embedding fixture checks both vocabulary partitions, padded rows, BF16 output, and repeated initialization.

The checkpoint audit confirms five unchanged hardlinked shards and byte equality of the seven retained tensors in the rewritten MTP shard. The source index has 2,399 tensors and the derivative has 2,426. Raw quantization statistics and calibration provenance are in [swift-bake-manifest.json](../results/2026-10-01/swift-bake-manifest.json).

The assembled index removes the nine dense weight entries and replaces them with 36 GPTQ arrays. Their old dense tensors are also physically removed from rewritten shards. Unchanged body shards are hardlinked. The original dense embedding remains on disk for stock loading; the runtime replaces each resident vocabulary partition with INT8 codes and scales after loading. A checkpoint name or side file alone does not establish that the embedding is resident INT8.

## Reproduction

Use the patched K8/V4 vLLM 0.30 XPU environment. The source must first pass `tools/prepare_swift_autoround.py`. Run calibration without another GPU-serving process. Keep the calibration directory between stages; baking reads its saved Hessians.

```bash
PYTHONPATH="$PWD/tools:$PYTHONPATH" python tools/calibrate_swift_bake.py \
  --model /models/swift-compatible --out /work/swift-bake
python tools/bake_gptq_resume.py \
  --src /models/swift-compatible --out /work/swift-bake
python tools/assemble_swift_bake.py \
  --src /models/swift-compatible --bake /work/swift-bake \
  --dst /models/swift-baked
docker build -f k8v4_v030/Dockerfile.swift-bake \
  -t vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 .
IMAGE=vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 \
MODEL_DIR=/models/swift-baked \
CHAT_TEMPLATE=/models/swift-baked/chat_template_low.jinja \
SERVED_NAME=Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8 \
bash k8v4_v030/launch.sh
```

The embedding patch fails if the expected vLLM methods differ. It synchronizes XPU transfers before replacing the dense parameter and after creating the codes/scales. Each target and draft embedding logs its local dtype, shape, and resident bytes. Preserve the source checkpoint and previous image for rollback. Bake tooling adapted from launch80/B65 retains its [MIT notice](../tools/B65-LICENSE).

## Deployment status

The first candidate loaded rank 0 with 7.47 GiB of model weights, but rank 1 suffered a GPU copy-engine CAT fault before serving became healthy. The fault's cause was not established. An explicit transfer synchronization was added to the embedding loader; the completed checkpoint did not need recalibration. The VM was rebooted with user approval and the synchronized image staged for startup. After reboot, both ranks loaded successfully with 7.47 GiB of model weights per GPU (unbaked Swift: 9.23 GiB). Both target and draft embeddings on each rank logged resident INT8 vocabulary partitions of shape `(124160, 5120)`, 635,947,520 bytes including scales per embedding. Backbone/MTP compilation, vision warmup and graph capture completed. The API was healthy around 15:04 UTC; medium-thinking text, low-thinking red-image recognition, and a parsed low-thinking tool call passed. No new CAT or OOM error appeared during these checks. This validates recovery for this startup, not a guarantee against future driver faults.

The deployment retains TP2, K8/V4, MTP6, decode graphs `[7,14,21,28]`, four active sequences, vision support, and a 262,144-token request limit. The shared KV pool is 869,121 tokens (3.32 full windows), up from 749,485 for unbaked Swift. Four histories near the half-window compaction threshold fit; four full 262K histories do not. Four-client saturation was not tested. Local Hermes and server Wrapzii default to the baked model with low thinking, and native low/medium transport checks passed on both machines. Old Qwen and unbaked Swift IDs are compatibility aliases for baked Swift; the original checkpoints and stopped containers remain available.

## Coding speed after the bake

Thinking is disabled, MTP6 is enabled, and answers end naturally. Each context has one fresh-prefix request followed by two cached requests; the decode column is the median of the two cached samples. All selected samples observed one running request and zero waiting requests. The 2K/8K samples came from the initial run with live traffic allowed; the clean 128K/200K repeat began after the user paused the room agent and rejected a busy baseline before each probe. Monitoring polls once per second.

| prompt tokens | fresh first-token latency | effective fresh prefill | warmed decode | median update gap |
| ---: | ---: | ---: | ---: | ---: |
| 2,184 | 1.41 s | 1552.5 tok/s | 136.51 tok/s | 37.20 ms |
| 8,190 | 5.81 s | 1409.1 tok/s | 133.97 tok/s | 39.18 ms |
| 128,197 | 115.39 s | 1111.0 tok/s | 77.82 tok/s | 68.49 ms |
| 200,191 | 218.79 s | 915.0 tok/s | 60.79 tok/s | 86.12 ms |

At 128K, the two warmed samples range from 77.17 to 78.46 tok/s. Their combined MTP acceptance is 537/750 (0.716).

At 200K, the two warmed samples range from 60.36 to 61.22 tok/s. Their combined MTP acceptance is 518/738 (0.702).

Effective prefill is prompt tokens divided by time to first streamed token, including scheduling and serving overhead. The update gap is an SSE observation, not a separately timed attention kernel. Cached requests do not establish fresh prefill speed. All 18 outputs across the initial and repeat runs passed syntax and interval-merging behavior checks, and stopped naturally. These small coding probes do not establish general quality parity.

The initial run overlapped other traffic at 128K: warmed decode was 48.58 tok/s with two active requests. At 200K, its warmed samples observed one active request and reached 61.63 tok/s. That mixed-concurrency run is retained separately rather than treating its 128K number as a concurrency-one regression.

Deployment checks and resident-memory observations: [swift-bake-validation.json](../results/2026-10-01/swift-bake-validation.json).

Raw records: [initial mixed-load run](../results/2026-10-01/swift-baked-coding-live.jsonl), [clean long-context repeat](../results/2026-10-01/swift-baked-coding-c1.jsonl). The earlier [unbaked Swift live-load run](swift-1.5-speed.md) observed two to three requests, so it cannot isolate a quantization-only speedup. The historical Qwen coding curve uses a different checkpoint and different prompt lengths; the new results show similar serving performance on this task, not a controlled quality or FP8 comparison.

The server's CI runner is limited to eight CPUs, with eight CPUs allowed per CI job. `CARGO_BUILD_JOBS` was initially eight; after CI linker OOMs during the later VM recovery, it was reduced to four. Job capacity remains one and the existing memory limits are retained. See the [memory incident and recovery](2026-10-01-memory-recovery.md).
