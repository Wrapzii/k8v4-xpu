# MTP draft skips the tables it shares with the target (`K8V4_DRAFT_SKIP_SHARED`, 2026-11-19)

One opt-in change, made of splices applied by `k8v4_v030/patch_installed_vllm.py` plus a new module
`k8v4_v030/draft_shared.py`. With the variable unset or `0`, the draft loads exactly as before.

## Why

vLLM (0.30, and stock 0.34 unchanged) builds the Qwen3.5 MTP draft with its own full
`embed_tokens` (248,320 x 5,120) and `lm_head`, and loads both from the checkpoint. Then, in
`load_eagle_model`, it deletes them and points the draft at the target's modules, because
`Qwen3_5MTP` has neither `has_own_embed_tokens` nor `has_own_lm_head`. With the Swift bake the
throwaway work per start is:

- 2.37 GiB BF16 embedding copied to the GPU;
- the 1.185 GiB INT8 side table built and uploaded again by `materialize()`;
- the 0.615 GiB GPTQ int4 `lm_head` uploaded.

Those are the largest single host-to-device copies of the draft load, the pattern behind the
sliced-upload hang. They cost load time, but no steady-state memory: the KV pool is sized after the
draft's copies are freed.

## Change

`K8V4_DRAFT_SKIP_SHARED=1`:

- `qwen3_5_mtp.py`: the draft's `embed_tokens` and `lm_head` are built with one vocabulary row
  (`draft_shared.table_rows`). They stay full size if the embeddings are tied, or under pipeline
  parallelism, where vLLM does not share them.
- `qwen3_5_mtp.py` `load_weights`: `draft_shared.load_without_shared` drops the checkpoint tensors
  named `embed_tokens` / `lm_head` when the modules are placeholders. It zero-fills the
  placeholders, so `g_idx` and the other buffers hold defined values for
  `process_weights_after_loading`, and reports their names as loaded.
- `v1/worker/gpu/spec_decode/eagle/utils.py` `load_eagle_model`: after sharing,
  `draft_shared.check_replaced` raises if a placeholder survived. A future vLLM that stopped sharing
  would then fail loudly instead of drafting from a one-row table.

Serving is identical: the draft reads the target's tables either way (**bit-identical**). Every
splice is anchored and idempotent, and refuses unknown source without touching the file. The
anchors match vLLM 0.30 and stock `vllm/vllm-openai-xpu:v0.34.0` unchanged (checked by
`test_installed_vllm_sources_take_the_splice` in both images).

## Tests

- `k8v4_v030/tests/test_draft_shared.py`: flag parsing; `table_rows` (tied, pipeline parallel);
  the full tables load everything; the placeholder load skips the shared tensors and counts them
  as loaded; `check_replaced`; the splice patches once, compiles, refuses unknown source and
  skips missing files; it applies to the installed vLLM.
- `test_launch_profiles.py`: the default argv is unchanged, and bad values exit with code 2.

## Measurements

All runs: one B70 at 230 W (no power change), vLLM 0.34 base (`b70/test-v034` @1508198 plus these
three branches, image `k8v4-up:memload034-d692083`), TP1 profile with `K8V4_MAX_SEQS=4`, prefix caching,
max-model-len 131072, util 0.96, `K8V4_UPLOAD_SLICE_MB=128`. One start each, 2026-11-19 10:58-11:20 UTC
(runs m4A-m4D). For the 63K users test, the base row is the 0.34 base run v034base (same code, knobs unset,
09:50 UTC).

| | knobs unset (m4A) | EMBED_HOST=1 + DRAFT_SKIP_SHARED=1 (m4B) | same + GEMM_WARMUP (m4C) |
|---|---|---|---|
| draft "Loading weights took" | 6.55 s | 0.06 s | 0.07 s |
| skipped checkpoint tensors | - | 5 (2.98 GiB) | 5 (2.98 GiB) |
| second `[swift-embed-int8]` (draft) table | (248320, 5120) on the device | (64, 5120) placeholder | (64, 5120) |
| starts | 1/1 | 1/1 | 1/1 |
| EXACT | 8/9 | 8/9 | 8/9 |

- The draft load drops from 6.5 s to under 0.1 s. Three host-to-device copies of 0.6-2.4 GiB each
  are no longer made at all.
- The target's own load time varies with the page cache (31 s cold in m4A, 4-14 s in later runs), so
  only the draft line is compared.
- KV is unchanged by this knob alone; the KV gain in m4B comes from `K8V4_EMBED_HOST`.
- Start reliability without `K8V4_UPLOAD_SLICE_MB` was not tested: one start per configuration.
