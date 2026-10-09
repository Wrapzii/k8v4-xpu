# K8/V4 KV cache for vLLM 0.30 on Intel XPU

Persistent int8-K / int4-V attention for Qwen3.8-27B GPTQ INT4 on two Arc Pro B60s. The serving path is stock vLLM 0.30.0 XPU plus a small dtype registration, a SYCL decode library, oneDNN prefill attention, and an MLP-only W4A8 GEMM. It is a patch on `vllm/vllm-openai-xpu:v0.30.0`, not a vLLM fork, and it is not vLLM's `turboquant_k8v4` selector.

The deployment uses tensor-parallel 2, MTP with 6 draft tokens, `FULL_DECODE_ONLY` graphs, prefix caching, a **262,144-token request window**, and **four active sequences**. The October 1 deployment uses Swift 1.5 with its AutoRound INT4 body, a calibrated GPTQ INT4 head/MTP bake, and a verified resident INT8 embedding. Low thinking is the Hermes default, with medium available. See the [Swift bake and reproduction instructions](docs/swift-1.5-bake.md) and the [initial loader adaptation](docs/swift-1.5-trial.md). This repo does not ship weights.

The historical Qwen results below were measured on the previous local Qwen GPTQ INT4 bake (group 128, symmetric; checkpoint includes an INT8 embedding side file), with thinking disabled. Its checkpoint includes an INT8 embedding side file; resident embedding dtype was not independently recorded for those historical runs. They do not establish Swift performance.

The earlier unbaked [October 1 Swift speed check](docs/swift-1.5-speed.md) records cold prefill and warmed decode under overlapping live traffic. It does not provide an isolated comparison against these results.

## October 2: active MLP W4A8 prefill

A runtime audit found that the vLLM 0.30 image requested W4A8 but never installed its MLP hook. The corrected path measured **1,255 tok/s fresh prefill at 128,197 tokens**, versus 1,157 before the fix (102.15 versus 110.81 seconds to first token). Long-context decode measured 78–81 tok/s in the new checks. The scheduler cap stays at 4,224; shared KV capacity is now 860,324 tokens, about 1% lower. These targeted concurrency-one checks do not establish unchanged multi-agent latency or general quality equivalence. See the [implementation, raw data, validation, and rejected attention candidate](docs/w4a8-wiring-2026-10-02.md).

## Current Swift bake: coding speed

The table below preserves the October 1 bake measurements; see the October 2 report above for the latest runtime. Thinking disabled; warmed decode is the median of two samples. All listed samples observed concurrency one. Fresh prefill includes time to first token and serving overhead.

| prompt tokens | fresh first-token latency | effective fresh prefill | warmed decode | median update gap |
| ---: | ---: | ---: | ---: | ---: |
| 2,184 | 1.41 s | 1552.5 tok/s | 136.51 tok/s | 37.20 ms |
| 8,190 | 5.81 s | 1409.1 tok/s | 133.97 tok/s | 39.18 ms |
| 128,197 | 115.39 s | 1111.0 tok/s | 77.82 tok/s | 68.49 ms |
| 200,191 | 218.79 s | 915.0 tok/s | 60.79 tok/s | 86.12 ms |

See the [bake report](docs/swift-1.5-bake.md) for raw records, calibration, validation, observed concurrency, and comparison limits.

The [October 2 batch-size comparison](docs/batched-prefill-2026-10-02.md) tests 4,224 versus 16,384 scheduled tokens with K8/V4. Larger chunks cut isolated 200K cold-prefill latency by 6.7% and completed a 27-turn overlapping agent workload 4.5% sooner, but increased its longest streaming pause from 5.33 to 15.61 seconds and reduced KV capacity from 869K to 765K tokens. The production default remains 4,224. The report includes delivery-over-time charts, raw stream timestamps, cached versus cold measurements, and reproduction clients.

## Previous Qwen: natural-EOS coding at 200K

The September 30 K8/V4 coding curve reaches **62.49 tok/s median at 200,156 prompt tokens**; adding retrieval of constants from the start of the document reaches **65.04 tok/s median**. Each point has one warmup and three measured requests. All answers stop naturally and pass independent behavior checks.

| prompt tokens | K8/V4 median decode | stock FP8 median decode | K8/V4 update gap |
| ---: | ---: | ---: | ---: |
| 2,153 | 137.87 tok/s | 146.26 tok/s | 39.09 ms |
| 8,159 | 128.63 tok/s | 131.89 tok/s | 40.95 ms |
| 32,157 | 116.67 tok/s | not measured | 46.85 ms |
| 127,863 | 77.06 tok/s | not measured | 70.05 ms |
| 200,156 | 62.49 tok/s | not measured | 87.90 ms |
| 200,155 + retrieval | 65.04 tok/s | not measured | 87.89 ms |

![Natural-EOS coding decode](docs/charts/coding-decode-20260930.svg)

The 200K ordinary samples range from 59.67 to 63.28 tok/s. This establishes the target on these tasks, rather than guaranteeing 60 tok/s for every answer or at concurrency four. New FP8 comparisons cover only 2K and 8K. GPU clock ceilings were corrected, but workload and MTP acceptance also changed.

A separate capacity-validation request completed with **261,055 prompt tokens and 405 output tokens**. Its first token arrived after **327.49 seconds**, equivalent to **797.14 prompt tokens/s** including serving overhead. This is one observation; there is no matching pre-clock run at that length. Repeated cached coding requests above do not establish cold-prefill throughput.

The tested native source is now the published source. Stage-2 uses 32 subgroups for the one-row draft and 8 for verification. A slower experimental two-pass merge remains disabled. The September 30 text-only deployment reported **814,581 tokens of shared KV capacity**; the subsequent vision-enabled bake reported 830,415, the unbaked Swift trial reported **749,485**, and the new Swift bake reports **869,121**. Four histories near Hermes's half-window compression threshold (~131K each) fit within the reported baked Swift pool; four fully occupied 262K windows do not.

See the [dated update](docs/2026-09-30-update.md) for raw-data links, source/library hashes, validation, benchmark versus deployment settings, reproduction commands, and Hermes configuration. Earlier workloads and configurations are preserved in the [historical benchmark archive](docs/historical-benchmarks.md).

## Cache space

Full attention on this model is 16 of 64 layers. The other 48 are GDN and are unchanged. After TP=2 each GPU holds 2 KV heads, head dim 256.

| payload, one GPU, one full-attention layer, one token | bytes |
| --- | ---: |
| FP8 K + FP8 V | 1,024 |
| int8 K + packed int4 V + three fp32 scales | 792 |

792 / 1,024 is 22.7% smaller on those layers. The formula lives in `k8v4_v030/layout.py`: `D + V4_COLS + 3 * 4` bytes per head, times 2 local heads. A 64-token page is 50,688 bytes.

Across 16 layers and both GPUs that is 7,424 bytes saved per token.

| context | FP8 attention KV | K8/V4 attention KV | saved |
| ---: | ---: | ---: | ---: |
| 131,072 tokens | 4.00 GiB | 3.09 GiB | 928 MiB |
| 262,144 tokens | 8.00 GiB | 6.19 GiB | 1,856 MiB |

A 4-KV-head page padded out to the one-GPU layout is larger than FP8 on a rank. This build does not use it.

## Serving path

- **Paged K8/V4 decode:** native SYCL attention runs inside `FULL_DECODE_ONLY` graphs. Stage-2 uses 32 subgroups for the one-row draft and 8 for verification, selected independently by the launcher.
- **oneDNN prefill:** one KV head is dequantized at a time for oneDNN Graph SDPA, outside the decode graph. The graph pattern is adapted from [exl3xpu](https://github.com/0xSero/exl3xpu) (`csrc/exl3_ops.sycl`, MIT, Copyright (c) 2026 0xSero).
- **Fused paged gather:** the launcher selects `K8V4_PREFILL_GATHER=triton`, removing intermediate GPU int32/fp32 tensors while preserving bitwise gather outputs. The small full-model timing differences are provisional; this is a confirmed memory reduction, not a claimed new throughput gain. [Implementation and measurements](docs/prefill-optimization-2026-10-02.md).
- **MLP-only W4A8:** large `.mlp.` prefill linears quantize activations to int8. Attention and GDN projections, and small MTP decode linears, keep `int4_gemm_w4a16`.

The [historical benchmark archive](docs/historical-benchmarks.md) preserves the earlier component experiments, forced-token fox curve and BetterBench comparisons. They are separate from the current coding results above.

## Current deployment

- Image: `vllm/vllm-openai-xpu:v0.30.0`, digest `sha256:fc0e112afb64e3a06fe8daff34652435822a629412f38efce8f0f67a46636b8d`, plus this package
- GPUs: 2× Arc Pro B60, `ZE_AFFINITY_MASK=0,1`, composite hierarchy
- Collectives: `CCL_SYCL_ALLREDUCE_LL=twoshots`, simple threshold `4294967296`, copy engine on. The measured host has no Xe Link
- Activations bf16, KV dtype `int8_k_int4_v`, TP 2, max length 262144
- MTP 6, graphs `FULL_DECODE_ONLY`, capture sizes `[7,14,21,28]`
- Prefix caching on, `max-num-seqs` 4, `max-num-batched-tokens` 4224, GPU memory utilization 0.95
- Tool parser `qwen3_xml`, reasoning parser `qwen3`; vision enabled with up to four images per request and video disabled
- Env that selects the three pieces: `K8V4_PREFILL=onednn`, `K8V4_PREFILL_GEMM=w4a8`, `XE2_KV_S2_NSG_DRAFT=32`, `XE2_KV_S2_NSG_VERIFY=8`, `XE2_KV_S2_TWO_PASS=0`. Parallel decode is the library default. Leave `XE2_KV_S2_PARALLEL` unset
- `B70_MTP_BF16_DRAFT=1` and `B70_WORKER_AFFINITY=1` were set on the measured B60 server. The names are historical. `launch.sh` keeps them
- Clocks 400–2400 MHz, burst power limit 180 W, when `xpu-smi` is available
- Swift trial uses its adapted upstream `chat_template_low.jinja`; Hermes defaults to low and supports medium. Benchmark reproduction uses `templates/chat_template.jinja`; the curve client sends `enable_thinking=false`

These CCL settings raised GPU faults on this platform and are not in the launch script: `CCL_SYCL_ALLREDUCE_ARC=1`, a simple threshold of 0 or 8192, `CCL_ALLREDUCE=direct`, `CCL_ATL_TRANSPORT=mpi`, `CCL_TOPO_FABRIC_VERTEX_CONNECTION_CHECK=0`.

## How this path was chosen

vLLM owns the block table. Decode is one C++ op per uniform batch. Earlier eager prefill kernels were slower or faulted: untiled SDPA faulted at 16K, query-tiled eager faulted at 96K, online-softmax eager finished 128K at a few hundred tok/s. Fused on-chip decode, chunked stage-1, wider GRF, and fp16 partials were correct and slower than parallel stage-2. Those binaries are not this build.

`patch_installed_vllm.py` adds `int8_k_int4_v` next to the existing cache-dtype list and points the XPU platform at `k8v4_v030.backend.Xe2K8V4AttentionBackend`. Workers import vLLM from site-packages. The image runs that patch at build time.

## On your own tree

Call `python3 -m k8v4_v030.patch_installed_vllm` against the vLLM package you import, or splice the same three sites in `k8v4_v030/patch_installed_vllm.py` (cache dtype list, torch dtype map, XPU backend selector). Ship this package on `PYTHONPATH` and the two libraries from the compile scripts. Then pick the pieces with flags:

- `--kv-cache-dtype int8_k_int4_v` turns on the kernel
- `K8V4_PREFILL=onednn` turns on oneDNN prefill. Unset, prefill stays on the eager path
- `K8V4_PREFILL_GEMM=w4a8` turns on the MLP GEMM. Unset, linears stay w4a16
- `XE2_KV_S2_PARALLEL=0` forces the serial decode kernel, which did not beat FP8 at 128K

One `libxe2_kv.so` serves both head layouts: 2 KV / 12 Q heads on a TP2 rank and 4 KV / 24 Q on a single GPU holding the whole model (see `Dockerfile.tp1` and `TP1-B70.md`). The ops pick the layout from the tensors they receive — `layout.PageLayout` on the Python side carries the same count from the attention spec — and any other head count raises.

Keep capture sizes as multiples of `1 + num_speculative_tokens` (7 when MTP is 6). Keep the manager block a multiple of the 64-token page. The served block is 2112 tokens, 33 pages. Partial pages and prefix caching go through that block table. Query lengths inside the graph are 1 and 7.

## Run it

The two GPUs are exclusive. Stop whatever else is using them before launch. `compile_decode.sh` caps its container at 1200 MB (the two-instantiation build measured ~610 MiB peak) plus a 4 GB swap bound, so a 12 GB host can compile next to a loaded model. The oneAPI image used for compile is large. Compile does not use the GPU. icpx 2025.3 segfaults against this image's `libsycl.so.9`; the compile image copies oneAPI 2026. `compile_sdpa.sh` builds `build/libk8v4_sdpa.so` and copies the compile image's bundled `libdnnl.so.3` beside it.

```bash
bash k8v4_v030/compile_image.sh
bash k8v4_v030/compile_decode.sh
bash k8v4_v030/compile_sdpa.sh
bash k8v4_v030/build_image.sh
MODEL_DIR=/path/to/Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8 bash k8v4_v030/launch.sh
```

`launch.sh` publishes `http://127.0.0.1:8200/v1`, container name `vllm-k8v4-tp2`, restart policy off. Graph capture can take a while. The script waits up to 40 minutes for `/health`.

The checkpoint includes its vision tower. Vision is enabled by default and accepts OpenAI `image_url` content parts. This permits four images per prompt, limits image processing to 1,048,576 pixels, disables video input, and uses a 0.125 GiB processor cache. Set `K8V4_VISION=0` to reproduce the measured text-only configuration. On October 1, after a VM reboot cleared a GPU driver fault, the production server started with these image settings and correctly identified a 64×64 red image through `/v1/chat/completions`. Its startup reported 830,415 tokens of shared KV capacity (3.17 full 262,144-token windows); four full windows still do not fit simultaneously. This is a startup capacity report and a functional image check, not a new performance benchmark. All published benchmark results and the earlier 814,581-token capacity were measured with vision disabled.

The [October 1 runtime update](docs/2026-10-01-runtime.md) documents Hermes low/medium thinking controls, the corrected boot-time GPU limits, and the live memory-pressure investigation.

The current tested decode library hashes to `11535539e01ab3d5b0942911c14c4bb9d8ab0eb855cfd784748a83e33c379498`. The earlier library used by the historical curves hashes to `0b7e2dc92262b1778aadefc8ab71e484408d6b6e90ccb8641616ee078f92623a`. A rebuild can hash differently. The compile script prints the reference hash and does not fail the build on a mismatch.

Overrides, all optional:

| variable | default | role |
| --- | --- | --- |
| `PORT` | 8200 | host port |
| `BIND_HOST` | 127.0.0.1 | publish address |
| `SERVED_NAME` | `Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8` | must match the benchmark client |
| `K8V4_CACHE` | `.cache/vllm-k8v4` | prefix-cache directory |
| `K8V4_PREFILL` | `onednn` | prefill attention |
| `K8V4_PREFILL_GATHER` | `triton` | fused GPU paged gather; `torch` restores original gather |
| `K8V4_SDPA_ASYNC` | `0` | experimental host-wait removal; no measured cold-128K gain |
| `K8V4_PREFILL_GEMM` | `w4a8` | MLP GEMM |
| `XE2_KV_S2_NSG` | 32 | parallel stage-2 subgroups |
| `XE2_KV_S2_NSG_DRAFT` | 32 | one-row draft subgroups |
| `XE2_KV_S2_NSG_VERIFY` | 8 | verifier subgroups |
| `XE2_KV_S2_TWO_PASS` | 0 | disabled experimental merge |
| `K8V4_MAX_MODEL_LEN` | 262144 | maximum request window |
| `K8V4_MAX_SEQS` | 4 | active sequence limit and graph sizes |
| `K8V4_GPU_MEMORY_UTILIZATION` | 0.95 | memory budget fraction |
| `K8V4_VISION` | 1 | set to 0 for text-only benchmark reproduction |
| `K8V4_MAX_IMAGES` | 4 | image limit per prompt when vision is enabled |
| `K8V4_MAX_IMAGE_PIXELS` | 1048576 | image processor pixel limit |
| `K8V4_MM_PROCESSOR_CACHE_GB` | 0.125 | multimodal processor cache size |
| `K8V4_MAX_BATCHED_TOKENS` | 4224 | scheduler cap |

New natural-EOS coding curve, concurrency 1:

```bash
python3 bench/serve_coding.py --lengths 2000,8000,32000,127700,200000 --max-tokens 448
python3 bench/serve_coding.py --lengths 200000 --max-tokens 448 --needle
```

The [dated update](docs/2026-09-30-update.md) gives the exact profile used for the recorded curve. The earlier forced-token workload is documented in the [historical archive](docs/historical-benchmarks.md).

CPU checks that do not need a GPU:

```bash
python3 -m unittest k8v4_v030.tests.test_layout_mtp k8v4_v030.tests.test_patch k8v4_v030.tests.test_public_package
```
