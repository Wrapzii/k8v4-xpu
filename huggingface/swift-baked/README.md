---
license: other
license_name: swift-open-license-1.0
license_link: LICENSE
base_model: ukisai/Swift-1.5-Qwen3.8-27b-W4A16-AutoRound
base_model_relation: quantized
library_name: vllm
pipeline_tag: image-text-to-text
tags:
  - qwen3_5
  - qwen3_8
  - gptq
  - int4
  - int8-embedding
  - intel-xpu
  - mtp
  - quantized
  - reasoning
---

# Swift 1.5 Qwen3.8-27B — GPTQ INT4 head/MTP + INT8 embedding

Quantized derivative prepared by **Wrapzii** for inference on **two Intel Arc Pro B60 GPUs**. It preserves UkisAI's Swift 1.5 AutoRound INT4 body and adds a Swift-specific calibrated INT4 bake of the output head and MTP linears, plus an INT8 embedding side file and loader.

The validated serving stack reaches **136.5 tok/s at 2K**, **134.0 tok/s at 8K**, **77.8 tok/s at 128K**, and **60.8 tok/s at 200K** on the coding probe below, with thinking disabled and observed concurrency one. Model-weight memory is **7.47 GiB per GPU**, versus 9.23 GiB for the unbaked Swift checkpoint.

These numbers include the **custom K8/V4 KV backend, MTP6, graphs, and serving configuration**. They are not a claim that the weight files alone deliver these speeds on other runtimes or hardware.

## Origin and credits

- Direct source: [ukisai/Swift-1.5-Qwen3.8-27b-W4A16-AutoRound](https://huggingface.co/ukisai/Swift-1.5-Qwen3.8-27b-W4A16-AutoRound), revision `278de52d4252d0b7c0ea01833d1403cd386c65ef`.
- Swift training and original AutoRound export: **UkisAI**; original quantization uses Intel AutoRound / SignRound.
- Base-model origin: Qwen / Alibaba Cloud, as recorded in the retained upstream NOTICE.
- Additional head/MTP GPTQ bake, TP-aware INT8 embedding integration, and serving validation: **Wrapzii**.
- Serving and bake approach reference: [Launch80/Qwen3.8-27B-GPTQ-Int4-baked-v2](https://huggingface.co/Launch80/Qwen3.8-27B-GPTQ-Int4-baked-v2). This release uses Swift's own weights and calibration activations.
- GPTQ bake tooling was adapted from [launch80/B65](https://github.com/launch80/B65); its MIT attribution is retained in the [tooling repository](https://github.com/Wrapzii/k8v4-xpu/blob/main/tools/B65-LICENSE).

No additional fine-tuning or model merging was performed. We did not transplant weights or calibration Hessians from the previous Launch80/Qwen checkpoint. Upstream benchmark scores have not been independently re-established for this derivative.

## What changed

| Component | Source checkpoint | This derivative |
| --- | --- | --- |
| 400 body linears | AutoRound symmetric INT4, group 128 | Original quantized payloads preserved; GPTQ-compatible metadata and deterministic group indices added |
| Output `lm_head` | Dense | Calibrated symmetric GPTQ INT4, group 128 |
| MTP `fc`, q/k/v/o, gate/up/down | Dense | Eight calibrated GPTQ INT4 linears, group 128 |
| Token embedding | Dense | Per-row symmetric INT8 codes and FP16 scales, materialized by the runtime loader |
| Vision tower and remaining excluded auxiliary weights | Dense | Preserved |
| Chat template | Upstream effort default | Low effort default; low, medium and xhigh remain supported |

This is a **mixed-precision checkpoint**, not an all-tensor INT4 conversion. The original AutoRound body's activations are not re-quantized by the checkpoint conversion. The tested serving stack also uses an MLP-only W4A8 path, separately from the weight-file format.

The nine dense linears are replaced by 36 GPTQ arrays (`qweight`, `qzeros`, `scales`, `g_idx` for each). Their old dense tensors are physically removed from rewritten shards. Five unchanged shards are preserved, and the seven retained tensors in the rewritten MTP shard were checked byte for byte. The model index grows from 2,399 to 2,426 tensors.

**Embedding detail:** the original dense embedding remains indexed on disk for stock embedding loading. The patched runtime replaces its resident TP partition with INT8 codes and FP16 scales. Without that patch, the INT8 side file alone does not give the resident-memory saving. Complete checkpoint compatibility outside the tested runtime has not been established.

**K8/V4 is KV-cache compression, not the weight quantizer.** The tested stack uses INT8 K / packed INT4 V on full-attention layers. GDN layers are unchanged. That backend is a separate patch available in the code repository.

## How the additional quantization was made

1. Verified all 400 existing packed body linears: symmetric zero point 8 is represented by stored nibble 7. Added `g_idx = input_index // 128` without changing their packed weight values; activation ordering remains disabled.
2. Collected **Swift's own** input activations using eager vLLM 0.30 XPU, TP2, MTP6, a 1,024-token calibration window, and four sequences.
3. Used 128 WikiText-2 validation prompts of 384 tokens, with up to 64 generated tokens. Calibration text came from the [PyTorch examples mirror](https://raw.githubusercontent.com/pytorch/examples/main/word_language_model/data/wikitext-2/valid.txt), SHA256 `f0737ed31fc1329026e95cb8b98e19c2a182c39c240ab909dc31abf2f8af58e8`.
4. Accumulated Float32 Hessians for six input owners shared by the nine linears. Row-parallel inputs were gathered into the full input dimension before rank-zero Hessian accumulation. The head accumulated 34,215 calibration rows; the MTP input owners accumulated 80,548.
5. Withheld every 64th input row from the Hessians, retaining up to 1,024 rows per input owner for output-error checks. These are withheld activation rows, not an independent model-quality benchmark.
6. Applied symmetric GPTQ with group size 128, 1% Hessian damping, no activation ordering, and output-column chunks of 8,192. The tooling uses an XPU Cholesky path with a CPU Float64 fallback.
7. Packed the results in GPTQ-compatible form and checked all nine code tensors by unpacking them. Rebuilt the index and streamed rewritten shards without loading the whole model into host RAM.
8. Quantized embedding rows using absolute maximum / 127, INT8 codes and FP16 scales. The TP-aware loader reads only its vocabulary partition, preserves padded rows and BF16 output, and synchronizes XPU transfers around replacement of the dense allocation.

The original body calibration belongs to UkisAI's AutoRound export; the WikiText calibration above applies only to our additional head/MTP bake. See `BAKE.json` and the [published quantization manifest](https://github.com/Wrapzii/k8v4-xpu/blob/main/results/2026-10-01/swift-bake-manifest.json) for exact settings and provenance.

## Quantization and integration checks

All nine GPTQ pack/unpack checks passed. On withheld activations, GPTQ gave lower relative output L2 error than the corresponding round-to-nearest baseline:

| Linear | GPTQ output L2 error | RTN output L2 error |
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

Embedding relative weight L2 error is **0.901%**. Its scales are finite and nonzero. The CPU fixture checks both TP vocabulary partitions, padded rows, BF16 dequantized output and idempotent loading. Live logs confirm INT8 embeddings on both target and draft models on both GPU ranks: local shape `(124160, 5120)`, 635,947,520 bytes including scales per embedding.

Text with medium thinking, image recognition with low thinking, and a parsed low-thinking tool call passed. All 18 generated coding outputs across the initial and clean repeat runs passed syntax and interval-merging behavior checks and stopped naturally.

These checks do **not** establish perplexity, general reasoning parity, preservation of every upstream evaluation score, or long-duration service stability. The two city-generation screenshots supplied by the operator were qualitative observations, not a controlled quality evaluation.

## Measured serving performance

Measured October 1, 2026, on **2 × Intel Arc Pro B60, TP2**, using patched **vLLM 0.30.0 XPU**, K8/V4 KV, MTP6, prefix caching, `FULL_DECODE_ONLY` graphs `[7,14,21,28]`, 4,224 batch tokens, 0.95 memory utilization, and vision enabled. GPU power limits were 180 W and clock ceilings 2,400 MHz on both devices. Thinking was **disabled for throughput measurements**; the normal chat default is low thinking.

The task asks for a concise Python interval-merging function with validation and no imports. A synthetic reference prefix sets context length. Each context has one fresh-prefix request and two cached repeats. Decode excludes tokens in the first streamed update and uses actual streamed cumulative token counts until natural EOS; it does not pad generation to a forced length.

| Prompt tokens | Fresh time to first token | Effective fresh prefill | Median warmed decode | Warmed decode range |
| ---: | ---: | ---: | ---: | ---: |
| 2,184 | 1.41 s | 1,552.5 tok/s | **136.51 tok/s** | 131.69–141.33 |
| 8,190 | 5.81 s | 1,409.1 tok/s | **133.97 tok/s** | 133.20–134.75 |
| 128,197 | 115.39 s | 1,111.0 tok/s | **77.82 tok/s** | 77.17–78.46 |
| 200,191 | 218.79 s | 915.0 tok/s | **60.79 tok/s** | 60.36–61.22 |

All listed samples observed one running request and none waiting. The 2K/8K samples were collected with live traffic permitted but observed no overlap; the long-context repeat followed the operator pausing the room agent and rejected a busy baseline before each request. Concurrency was sampled once per second, so a sufficiently brief overlap could be missed.

Effective prefill is prompt tokens divided by client time to the first streamed token, including scheduling, initial decode and serving overhead. Cached requests do not measure fresh prefill. The median SSE update gaps were 68.49 ms at 128K and 86.12 ms at 200K; these are not separately timed attention kernels. Combined warmed MTP acceptance was 537/750 (0.716) at 128K and 518/738 (0.702) at 200K.

### Before/after observations and demonstrated memory gains

| Observation | Before: unbaked Swift | After: this bake |
| --- | ---: | ---: |
| Model-weight memory per GPU | 9.23 GiB | **7.47 GiB** — 19.1% lower |
| Reported shared KV pool | 749,485 tokens | **869,121 tokens** — 16.0% larger |
| ~2K warmed decode | 70.96 tok/s, 2–3 active requests | 136.51 tok/s, 1 active request |
| ~8K warmed decode | 55.28 tok/s, 2 active requests | 133.97 tok/s, 1 active request |
| ~128K warmed decode | 43.57 tok/s, 2 active requests | 77.82 tok/s, 1 active request |
| ~200K warmed decode | 29.42 tok/s, 2 active requests | 60.79 tok/s, 1 active request |

**A controlled quantization-only decode speedup was not measured:** the before/after traffic differed. Do not interpret these throughput ratios as gains solely caused by the additional quantization. The memory and KV observations support the reported runtime capacity improvement on this configuration.

An initial baked 128K run with two active requests measured 48.58 tok/s, explaining the lower intermediate result. Historical tests on a different Qwen bake reached 77.06 tok/s at roughly 128K and 62.49 tok/s at 200K; this derivative reaches similar serving performance on the coding task, but those are different checkpoints and not a controlled quality or FP8 comparison.

Raw data and verification code:

- [Unbaked Swift live-load baseline](https://github.com/Wrapzii/k8v4-xpu/blob/main/results/2026-10-01/swift-coding-live.jsonl)
- [Initial baked run, mixed observed concurrency](https://github.com/Wrapzii/k8v4-xpu/blob/main/results/2026-10-01/swift-baked-coding-live.jsonl)
- [Clean 128K/200K repeat](https://github.com/Wrapzii/k8v4-xpu/blob/main/results/2026-10-01/swift-baked-coding-c1.jsonl)
- [Serving validation and library hash](https://github.com/Wrapzii/k8v4-xpu/blob/main/results/2026-10-01/swift-bake-validation.json)
- [Benchmark harness](https://github.com/Wrapzii/k8v4-xpu/blob/main/bench/serve_coding.py)

## Serving this checkpoint

The **validated runtime is the custom Intel XPU stack**, not an unmodified Transformers pipeline, a GGUF runtime, or a generic CUDA install. Model files do not bundle or install the K8/V4 backend. Reproduce the tested stack using [Wrapzii/k8v4-xpu](https://github.com/Wrapzii/k8v4-xpu):

```bash
git clone https://github.com/Wrapzii/k8v4-xpu.git
cd k8v4-xpu
# On the tested Intel XPU host, build the native libraries and base image.
bash k8v4_v030/compile_image.sh
bash k8v4_v030/compile_decode.sh
bash k8v4_v030/compile_sdpa.sh
bash k8v4_v030/build_image.sh
docker build -f k8v4_v030/Dockerfile.swift-bake \
  -t vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 .
IMAGE=vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 \
MODEL_DIR=/absolute/path/to/downloaded/checkpoint \
CHAT_TEMPLATE=/absolute/path/to/downloaded/checkpoint/chat_template_low.jinja \
SERVED_NAME=Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8 \
bash k8v4_v030/launch.sh
```

Build before loading the model on a host with limited system RAM. The launcher defaults to loopback port 8200 and waits for graph capture and `/health`. The synchronized embedding loader must be included; stock loading does not establish resident INT8 embedding memory. Added LoRA vocabulary is not supported by this embedding side-file loader.

The tested request limit is **262,144 tokens**, with four active sequences sharing a reported **869,121-token** KV pool. Four fully occupied 262K requests do not fit simultaneously. Four histories around a half-window compaction threshold fit the reported pool, but four-user saturation was not tested. The older 261K capacity request was on the previous Qwen checkpoint, not this Swift derivative.

Supported thinking efforts are `low`, `medium`, and `xhigh`. The supplied low-default template uses instructions to guide reasoning length; it does not enforce a fixed thinking-token budget. To disable thinking, use `chat_template_kwargs: {"enable_thinking": false}`. Image requests use OpenAI-style `image_url` content parts; tool calls use the qwen3 XML parser configured by the launcher.

```python
from openai import OpenAI

client = OpenAI(base_url="http://127.0.0.1:8200/v1", api_key="unused")
response = client.chat.completions.create(
    model="Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8",
    messages=[{"role": "user", "content": "Write a concise Python interval merger."}],
    reasoning_effort="low",
    max_tokens=2048,
)
print(response.choices[0].message.content)
```

## Reproducing the bake

The full [quantization procedure and scripts](https://github.com/Wrapzii/k8v4-xpu/blob/main/docs/swift-1.5-bake.md) are published. Prepare a separate source directory, collect its calibration Hessians, bake the nine linears, and assemble a new checkpoint. The source directory is preserved; do not bake into a live serving directory.

```bash
python tools/prepare_swift_autoround.py /models/swift-source
PYTHONPATH="$PWD/tools:$PYTHONPATH" python tools/calibrate_swift_bake.py \
  --model /models/swift-source --out /work/swift-bake
python tools/bake_gptq_resume.py --src /models/swift-source --out /work/swift-bake
python tools/assemble_swift_bake.py --src /models/swift-source \
  --bake /work/swift-bake --dst /models/swift-baked
```

Calibration must run without another serving process occupying the GPUs. The package includes provenance and modification notices; it does not include the multi-gigabyte calibration Hessians or calibration-text cache.

## License and modification notices

This derivative retains **Swift Open License v1.0** for the Swift contribution and the **Apache License 2.0** notices for the underlying Qwen material. Read [LICENSE](LICENSE), [LICENSE-APACHE-2.0](LICENSE-APACHE-2.0), and [NOTICE](NOTICE). Swift's license includes a commercial-use threshold and separate enterprise licensing provisions; this release is not advertised as an Apache-only model.

Modified and added files are documented in `MODIFICATIONS.json`, the added NOTICE section, and applicable file metadata. Upstream notices are retained. This community quantization is not an official UkisAI release or an endorsement by the upstream authors.
