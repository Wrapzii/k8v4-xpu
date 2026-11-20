# Host-resident INT8 embedding table (`K8V4_EMBED_HOST`, 2026-11-19)

One opt-in change in `k8v4_v030/embed_int8_runtime.py`. With the variable unset or `0` the loader
runs the previous code unchanged (device-resident table).

## Why

The Swift bake's INT8 embedding side table is 248,320 x 5,120 int8 = 1.185 GiB and stays on the GPU.
A step only reads the rows of its own tokens (5 KiB per token), so the table is almost never touched
while it holds memory the KV cache could use. On one B70 at `--gpu-memory-utilization 0.96` the KV
pool is 12.74 GiB = 361,577 tokens (about 28,400 tokens per GiB), so the table is worth about
**+33,600 KV tokens (+9%)** if it leaves the device.

## Change

`K8V4_EMBED_HOST=1`:

- `materialize()` builds the INT8 table directly in pinned (page-locked) host memory instead of a
  pageable CPU tensor.
- The GPU gets a zero-copy view of it, `vllm.utils.torch_utils.get_accelerator_view_from_cpu_tensor`
  (UVA; on XPU `torch.ops._C.get_xpu_view_from_cpu_tensor`). The layer keeps a reference to the
  pinned tensor because the view does not own the pages.
- The per-row scales (0.5 MB) stay on the device. `embedding()` is unchanged: the same
  `F.embedding` gathers, now reading the rows over PCIe.
- The MTP draft shares the target's `embed_tokens` after load (`maybe_share_target_embed`), so it
  reads the same host table.
- CPU layers ignore the flag.

The values gathered are **bit-identical**: the same int8 codes and scales. `launch.sh` passes
`K8V4_EMBED_HOST` only when it is set, and rejects values other than 0/1.

Our own stack has run the same idea since our -3 (BF16 table, `B70_EMBED_UVA`): it gave
about +2.5 GB of KV with no measurable decode or prefill change. vLLM 0.34's
`--cpu-offload-params` does not cover this case. On stock `qwen3_5.py` the UVA offloader only
wraps the decoder layers, and the INT8 loader replaces `layer.weight` after loading anyway, so the
view has to be made here.

Side effect: with `K8V4_DRAFT_SKIP_SHARED` unset, the draft's own INT8 table is also built pinned and
then dropped when the target's table is shared. That is 1.27 GB of host RAM kept by the pinned-host
caching allocator. Use it together with `K8V4_DRAFT_SKIP_SHARED=1`, which makes the draft's table a
one-row placeholder.

## Tests

- `k8v4_v030/tests/test_embed_host.py` (CPU): strict flag parsing; the default path never builds a
  host table; host mode keeps the codes on the host and exactly one view on the device; it is idempotent.
- XPU only: the view gathers the same rows as a device copy, including the padding rows.
- `test_launch_profiles.py`: the default argv is unchanged, and bad values exit with code 2.
- Passes on the 0.30 image and on stock `vllm/vllm-openai-xpu:v0.34.0`.

## Measurements

All runs: one B70 at 230 W (no power change), vLLM 0.34 base (`b70/test-v034` @1508198 plus these
three branches, image `k8v4-up:memload034-d692083`), TP1 profile with `K8V4_MAX_SEQS=4`, prefix caching,
max-model-len 131072, util 0.96, `K8V4_UPLOAD_SLICE_MB=128`. One start each, 2026-11-19 10:58-11:20 UTC
(runs m4A-m4D). For the 63K users test, the base row is the 0.34 base run v034base (same code, knobs unset,
09:50 UTC).

| | knobs unset (m4A) | EMBED_HOST=1 + DRAFT_SKIP_SHARED=1 (m4B) |
|---|---|---|
| Model loading took | 14.76 GiB | 13.57 GiB (-1.19 GiB) |
| Available KV cache memory | 12.14 GiB | 13.48 GiB |
| **KV cache size** | **345,005 tokens** (v034base: 349,525) | **382,669 tokens (+37,664, +10.9%)** |
| max concurrency at 131,072 | 2.63x | 2.92x |
| EXACT / NEEDLE 32K+120K | 8/9 / - | 8/9 / 6/6 |

63K users (`conc64.py N 512 63000`), base = v034base:

| | v034base | m4B |
|---|---|---|
| cold 63K prefill | 1,511 tok/s | 1,512 tok/s |
| 1 user: inter-token gap p50 / p99 | 66 / 67 ms | 66 / 67 ms |
| 1 user decode | 50.7 tok/s | 46.1 tok/s |
| 4 users: inter-token gap p50 / p99 | 159 / 162 ms | 159 / 161 ms |
| 4 users aggregate | 87.7 tok/s | 84.9 tok/s |
| warm TTFT 1 / 4 users | 1.67 / 5.98 s | 1.68 / 5.93 s |

- The step time is unchanged: inter-token gaps match to the millisecond, and prefill matches.
- The tok/s difference is MTP acceptance. Each run puts a random nonce in front of every prompt, so
  the outputs differ between runs. It is not the embedding path; the gathered values are bit-identical.
- All of the KV gain comes from this knob. `K8V4_DRAFT_SKIP_SHARED` saves no steady-state memory,
  because the draft's copies were already freed before KV sizing.
- The gain (1.19 GiB → +37.7K tokens) is a bit more than the 1.185 GiB table alone predicts,
  because the KV pool is block-granular.

Related, no code change (item 4): their existing `K8V4_VISION=0` (`--language-model-only`) on top
of m4C (m4D) drops the 0.86 GiB vision tower: model 12.67 GiB, KV **402,255 tokens** (+19,586 over
m4B, +57,250 / +16.6% over m4A), EXACT 8/9. It is only for text-only serving; their default stays 1.
