# QSA on the K8V4 attention backend

Qwen Sparse Attention (QSA) for the 16 full-attention layers of Qwen3.8-27B, as an optional path inside the existing K8/V4 vLLM backend (`k8v4_v030/`). The 48 Gated DeltaNet layers are unchanged. The serving stack (container `vllm-k8v4-tp2`, image, production `libxe2_kv.so`, dense kernels) is not modified by this work. QSA is off unless `K8V4_QSA=1`.

Reference engine: the llama.cpp fork that implements Qwen3.8 QSA (`src/models/qwen35.cpp`, `src/models/qwen4exp.cpp` `llm_build_qsa_base`, `src/llama-memory-hybrid-idx.*`, CUDA `qsa-attn.cu` / `lightning-indexer.cu`, Vulkan `topk_qsa`, SYCL `ggml-sycl/lightning-indexer.cpp`). Paper: arXiv 2608.30320. Weight naming follows that fork's HF to GGUF map (`conversion/qwen.py`, `QSAQwen35Model`).

Swift-1.5 has no trained indexers. Kernels are checked with random indexer weights. A missing indexer bank leaves those layers on dense K8V4.

## What is sparse, and what is not

Qwen3.8-27B text stack (`config.json` of the Swift checkpoint):

| Item | Value |
| --- | --- |
| Layers | 64, `full_attention_interval` 4 |
| Full attention | layers 3, 7, …, 63 (16 layers). `(i + 1) % 4 == 0` |
| Gated DeltaNet | the other 48 layers |
| Hidden | 5120 |
| Q / KV heads | 24 / 4, head dim 256, GQA 6 |
| TP2 local heads | 12 Q / 2 KV per rank (the K8V4 kernel) |
| Main RoPE | partial factor 0.25 so `n_rot = 64`, theta `1e7`, interleaved MRoPE sections `[11, 11, 10]` |
| MTP | one extra attention block, no indexer |

QSA does not drop KV rows. Every token is still stored as INT8 K / INT4 V in the existing page layout (`SLOT_BYTES_PER_HEAD = 396`, 64-token region-major pages). Sparsity only limits which pages the full-attention math reads. An indexer cache sits beside that layout. It is not packed into the 396-byte cell: the production decode kernel addresses pages with a compile-time page stride, and growing `state_content_bytes` would move page 1 onto page 0's tail. `customize_spec` therefore keeps `state_content_bytes` at 396 even when QSA is on, and the dense op is the same function as today.

## Indexer

Per full-attention layer, five FP32 tensors (80 tensors across 16 layers, 52,434,944 parameters):

| HF suffix under `layers.{i}._qsa_indexer.` | Role | Shape |
| --- | --- | --- |
| `q_proj.weight` | query projection | `[512, 5120]` (`4 * 128` out) |
| `k_proj.weight` | key projection | `[128, 5120]` |
| `q_norm` or `q_norm.weight` | RMSNorm on Q, per dim | `[128]` |
| `k_norm` or `k_norm.weight` | RMSNorm on the raw key, before the cache | `[128]` |
| `k_block_norm` or `k_block_norm.weight` | RMSNorm on the mean-pooled block key | `[128]` |

Training checkpoints, and the HF tensors `QSAQwen35Model.modify_tensors` reads, store zero-centered deltas. That converter adds 1 before writing GGUF. ggml `build_norm` then multiplies by the stored vector (`ggml_rms_norm`, then `ggml_mul`); it does not add 1 a second time. The in-memory bank holds that real multiplier. `load_bank_file` adds 1 to `q_norm`, `k_norm`, and `k_block_norm`, so a stored zero (the training initialization) is an identity RMSNorm. Safetensors metadata `norm_storage=multiplier` skips the add. RMSNorm is `x * rsqrt(mean(x^2) + 1e-6) * weight` with the Swift `rms_norm_eps`.

The training loss multiplies the ReLU sum by `1/sqrt(128)`. That factor is positive and the same for every block, so it does not change which blocks win or how ties break. The llama.cpp fast path does not apply it. This backend does not either.

The indexer is MQA: 4 query heads, 1 shared key, head dim 128. It reads the same post-attention-norm hidden state that feeds the main QKV projection (`build_qsa_blk_select` / `build_qsa_mask` in the fork).

1. `k_raw = RMSNorm(k_proj(h), k_norm)`. No RoPE. One fp32 row per token, written into the indexer cache at the same physical slot as the main KV slot.
2. `q = MRoPE(RMSNorm(q_proj(h), q_norm))` at the query's MRoPE position. RoPE is the model's `n_rot = 64` (not 128), NeoX pairing, interleaved MRoPE. With `ext_factor = 0` and `freq_scale = 1` this is `cos/sin(pos_axis * theta^(-2 * pair / n_rot))`. Sections `[11, 11, 10, 0]` sum to 32 pairs, which is exactly `n_rot / 2`. Text positions broadcast one token index onto all four axes unless the caller passes `[4]` MRoPE ids.
3. Complete 4-token blocks are mean-pooled over the raw keys (`sum / 4`), passed through `k_block_norm`, then MRoPE'd at the position of the block's first token. The incomplete tail is not a scoring key. It is always attended as itself.
4. Score of block `b` for one query is the sum over the 4 heads of `relu(q_h · pooled_b)`. The fast path in `build_qsa_blk_select` does **not** scale by `1/sqrt(128)`. The reference mask path does. A positive scale does not change the order among finite scores, because invisible blocks are `-inf` / `-1e30` rather than a finite bias. This backend follows the fast path (no scale).
5. Budget: `indexer_top_k = 2048` tokens, so `n_sel = 512` blocks, plus the query's own block.

Block `b` (tokens `[4b, 4b+4)`) is a complete causal block for a query at absolute position `pos` when `(b + 1) * 4 - 1 <= pos`, i.e. the first `c = (pos + 1) // 4` blocks. The own block is `pos // 4`. Its visible width is `pos % 4 + 1` (the fork's `own_always` path for `LLM_ARCH_QWEN35`).

Selection:

- If `c <= 512`, keep every complete block. Together with the own block this covers every causal token, so the result is dense. The fork also special-cases `n_kv <= 2048` as a full causal mask. Both rules agree through 2051 tokens (512 complete blocks).
- If `c > 512`, take the 512 highest scores among the complete blocks. Ties break toward the lower block id.
- Always include the own block. If it was already selected, it is not attended twice. The tail copy carries the partial width. Earlier selected blocks are fully visible. Tokens after `pos` stay masked.

`K8V4_QSA_FORCE_ALL=1` skips the top-k and keeps every causal block. That mode is the dense-match test of the sparse kernel.

A query whose complete-block count is at most the budget is already dense, so the forward does not score it. One step past the budget can still come back to a full causal set: top-k drops one block and the own-block rule puts that block back when it was the one dropped. The forward scores that case and, if every query's token list is the full causal range, returns to the dense kernel. A batch may mix the two. Each request uses its own block-table row for the pooled gather and for the sparse read. A request still inside the budget contributes a full causal token list and does not change the other request's selection.

Short contexts and missing weights do not call the sparse kernel. They call the existing dense op, including the packed MTP verifier (`q_len <= 10`, MTP6 uses 7) and the eager / oneDNN chunked prefill.

## Indexer cache and prefix blocks

One bank per process, one entry per full-attention layer. Physical blocks use the same ids as the K8V4 block table. A vLLM block of `block_size` tokens (`block_size` is a multiple of 64, hence of 4) holds:

| Tensor | Shape | Meaning |
| --- | --- | --- |
| `raw` | `[block, block_size, 128]` fp32 | pre-RoPE indexer key |
| `pos` | `[block, block_size, 4]` int32 | MRoPE position stored with that key |
| `filled` | `[block, block_size]` bool | slot has a raw key |
| `pooled` | `[block, block_size/4, 128]` fp32 | normed, rotated block key |
| `pool_valid` | `[block, block_size/4]` bool | micro-block is complete |

A micro-block is re-pooled only when all 4 raw slots are filled. The mean uses those raw rows, `k_block_norm`, and the MRoPE position of the first slot. Later tokens in a chunked prefill see the updated row. A prefix hit must copy `raw`, `pos`, `filled`, `pooled`, and `pool_valid` together. `QsaBlockCache.copy_blocks(src_ids, dst_ids)` does that. `install_if_requested` tries to wrap vLLM's block-copy helper so a prefix copy of the main cache copies the sibling too. The installed server is not patched. The hook runs only in a process that imports this tree with `K8V4_QSA=1`.

The bank is sized from the live K8V4 cache tensor on first use (`num_blocks` and `block_size` from the `[block, head, token, 396]` view). Logical token `t` of a request is physical slot `block_table[t // block_size] * block_size + (t % block_size)` when the table is in manager blocks, and the kernel-page form when `pages_per_block` expands a manager block into 64-token pages. The indexer store uses the same `slot_mapping` the main store uses, so the two caches name the same token.

## Where the hidden state comes from

`Xe2K8V4Impl.forward` receives Q, K, V after projection. The indexer needs the pre-projection hidden state. With `K8V4_QSA=1`, the backend wraps the loaded Qwen full-attention module (`forward` that takes `hidden_states`) and stashes `(layer_idx, hidden, positions)` for the matching backend call. Layer index is parsed from `layers.{i}.` on the module prefix. Gated DeltaNet modules are not wrapped. If the stash is empty or the layer has no weights, forward falls through to dense K8V4.

Weights load from `K8V4_QSA_WEIGHTS`: a torch state dict, one safetensors file, or an HF directory. A directory reads only `_qsa_indexer` tensors, using `model.safetensors.index.json` when it is present, so the dense checkpoint is not pulled into memory. The tensor may be named `layers.{i}._qsa_indexer.*` or `layers.{i}.self_attn._qsa_indexer.*`, which is the training export. Zero indexer tensors means "no bank": dense. A partial layer (some of the five tensors missing) is an error. Tests build a bank in memory with `set_bank`; those objects already hold real multipliers, and the file loader is what adds 1.

## Kernels

New library `libxe2_qsa.so`, built by `k8v4_v030/compile_qsa.sh` into `/mnt/hdd-500gb/model-validation/qsa-k8v4/`. It does not replace `libxe2_kv.so`. `XE2_QSA_LIB` overrides the path. If the library is absent, or the tensors are on CPU, the same op contract runs in Python. A CPU call does not load the library.

The eager XPU forward gathers one pooled row per logical block through the block table, then calls `qsa_score` and `qsa_topk`. CPU scoring stays on the fp64 reference, one query at a time, so a full allow-set still matches the quantized oracle bit for bit. Projection, RMSNorm, pooling, and RoPE use that same fp64 reference on CPU. On XPU they run in fp32, because the Arc has no fast fp64. An XPU graph capture still takes the dense kernel: the plan reads sequence lengths on the host, and the indexer write is a Python loop.

Three device ops, registered on `torch.ops.xe2_qsa`:

1. **Indexer score** (`qsa_score`). One subgroup per `(query, block)`, subgroup size 16, 8 fp32s per lane, covering the 128-d dot. Sum `relu(dot)` over 4 heads. An ESIMD variant uses `sycl::ext::intel::esimd` `block_load` of 8 floats. It is compiled when that header builds, and it runs only when `QSA_SCORE_ESIMD=1`. Otherwise the subgroup kernel runs. The numeric contract is the PyTorch reference, not a tuned throughput claim.
2. **Top-k** (`qsa_topk`). One work-item per query keeps the `k` largest scores, best first. A candidate replaces the current best only when its score is strictly greater, and the scan walks block ids upward, so ties keep the smaller block id. `k` is at most the block count. Invisible blocks are not passed in. Correct for the budget of 512. Not a radix select.
3. **Sparse K8V4 attention** (`qsa_sparse_attn`). For each query head, walk the selected logical tokens in the order given. The Python wrapper sorts that list, drops duplicates, and drops tokens at or past the causal end `seq_len - q_len + q_tok + 1` before the launch. The kernel reads INT8 K and INT4 V through the region strides, so K of page `p+1` is not assumed to sit next to K of page `p`. Low nibble is the even dimension. Q is quantized per head with `sycl::rint` and clamp `[-127, 127]`, the same call the dense kernel uses. The Python spec uses round-half-away-from-zero, so an exact halfway value can differ; a GPU compare uses a tolerance. Score is `int_dot(q8, k8) * q_scale * k_scale * (1/16)`. Online softmax in fp32, then the affine int4 V mix. Supports one query (decode), a packed multi-query verifier (`q_len` up to the K8V4 tile of 10), and a chunk of prefill queries. Head counts 2 and 4 match the dense library.

The Python quantized loop in `qsa_quant_attn.py` is the spec for that kernel. With the allow-set equal to every causal token, the loop is the same arithmetic as `oracle.causal_gqa`, in the same token order, so the outputs match exactly (not within a tolerance).

## Flag and call path

`K8V4_QSA` defaults to off. The env var is read per call, not cached at import.

Off:

- `customize_spec` returns `state_content_bytes = 396` as it does today.
- `forward` and `do_kv_cache_update` do not import the QSA runtime.
- No indexer allocation, no wrapper, no second library.

On:

- Backend install wraps Qwen attention modules and the block-copy helper if those symbols exist.
- `forward` asks `try_sparse_forward`. That updates the indexer cache from the stashed hidden state, pools completed micro-blocks, and either runs sparse attention into `output` and returns, or returns false. False means the existing packed decode, cascade, or eager prefill runs, unchanged.
- Dense is taken when there is no bank, the layer is not a full-attention layer, the stash is missing, or every query still sees at most 512 complete blocks (unless `K8V4_QSA_FORCE_ALL=1`).
- An XPU graph capture does not run the Python sparse loop. Capture stays on dense K8/V4 and does not write the indexer cache. Eager forwards on CPU use the Python path, which is the numeric contract. Eager forwards whose query and KV views are on XPU call `qsa_sparse_attn` when `libxe2_qsa.so` loads.

## Tests

CPU, no GPU, no second model:

- Indexer math against a naive loop: RMSNorm, interleaved MRoPE, 4-token mean, ReLU sum, top-k tie break, own-block inclusion, dedup.
- Parameter count of a full bank is 52,434,944. Missing tensors yield no bank. A partial layer raises.
- Block copy copies raw and pooled rows. A micro-block stays invalid until the fourth raw key lands.
- `sparse_causal_gqa` with every causal token allowed matches `oracle.causal_gqa` for decode (`q_len = 1`), a verifier tile (`q_len = 7`), and a short chunk (`q_len > 1` with `seq_len` longer than the query). Reading the same tokens back from a packed page (`paged.write_token`) reproduces the integer K and the INT4 nibbles. Scales on the page are float32, so the page reader matches attention that uses those stored scales, which is what the dense kernel reads.
- A proper subset of blocks matches the oracle with the dropped positions forced to `-inf`.
- The flag default is off, and `state_content_bytes` stays 396 when the flag is on.

GPU, only through `bench-hold`, short, no full model: if `libxe2_qsa.so` is built, score and a tiny sparse attention are compared to the PyTorch reference within a fp32 tolerance. No speedup is claimed.

## Out of scope

Training indexers. Promoting a library into the serving container. Editing `k8v4_v030/native/xe2_kv_ops.cpp` or the kstudy production candidates. Changing Gated DeltaNet. Loading Swift weights onto the GPUs while `vllm-k8v4-tp2` is up.
