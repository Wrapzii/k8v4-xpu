# QSA correctness and performance audit

## 2026-11-06, 9:45 PM ET — indexer retrain and dense-prefill serving

Isolated work in `build/dense-prefill-runtime` and `/mnt/hdd-500gb/model-validation/qsa-train`. Nothing committed or pushed. Production remains stopped.

### Indexer

Random-token local weights (`checkpoints/qsa_indexers_step300.pt`) measured **0.615** recall on a held-out wrapzii Hermes session. Retrain mixed the five original SSD packs with ten real sessions served by the local Qwen (chat template, tools, replies), 16,384 tokens, 600 steps, sequential capture on one GPU. Holdout recall:

- new `exports/hermes16k/qsa-indexers.safetensors`: **0.931**
- author 27B `exports/author-reference/`: **0.927**
- old local step300: **0.615**

Evals: `evals/hermes16k-holdout-{hermes16k,author,old16k}.json`. Two concurrent captures OOM'd the 22 GB VM and took down the host; later captures ran one at a time. Packs live on `/home/dan/qsa-activations` (SSD).

### Dense prefill + QSA decode

`K8V4_QSA_DENSE_PREFILL=1` fills the indexer cache then returns False so prefill attention is dense K8/V4. Decode writes physical slots through each request's block table, graphs 7/14/21/28-token batches, and reuses the target's visible row for MTP plus the draft token's own cell. CPU: `tests/test_qsa_concurrency.py`, 6 tests OK.

Same 200,008-token prompt, 768 completions, `qsa_token_bench_v2.py`, hermes16k weights, container `qsa-dense-prefill` on :8123:

- client prefill **1,026 tok/s**, decode **48.5 tok/s**, finish `length`, no heading loop (`build/gdn-nosync/dense-prefill-200k.json`)
- prior split-attn exact / author indexer: ~699 prefill, 60.9 decode, also clean
- engine log on 10K prompts: ~2,028 prompt tok/s
- MTP acceptance on the 200K run: mean 3.39

Prefill `fast_prefill` counted; decode `sparse_ok` counted. Shared prefill off.

### Concurrency

Warm 4×10K / 128 tokens: ~20 aggregate tok/s, not 75/user. Graph scoring used a baked 65,536-block width; below 32K the runtime now falls through to eager paged scoring at the real count. That did not reach the conc-4 target. Four 200K sequences still exceed KV (one 200K request used ~29%).

### Still open

Fused score+top-k, a clean 200K prefill timing without prompt-ID transfer, and an A/B of MTP reuse versus dense draft. Do not restart `vllm-k8v4-tp2` without asking.

---


## 2026-11-06, 6:05 PM ET — takeover

The goal is a reliable speedup on the existing Swift 27B GPTQ model with K8V4, oneDNN/W4A8, TP2 and MTP. Production remains intentionally stopped. The changes below are isolated experiments; no changes have been committed or pushed. Do not treat a speed result as valid unless its complete output is usable and the selected path is verified.

### Repetition and model quality

The previous physical-slot indexer could grow beyond the buffer captured by the decode graph. The logical-token indexer experiment prevents that particular single-request overflow, but the fast shared-prefill path still repeated headings in one 200K run. Sharing the final query's selection across a 4,224-token prefill chunk is an approximation, not per-query QSA.

With shared prefill and FP16 indexer scoring disabled, the isolated per-query FP32 path generated 768 tokens without an obvious repetition loop on the 200,008-token architecture prompt. With the locally trained indexer it took 473.35 seconds to first output (about 423 prompt tokens/s) and generated 51.01 tokens/s after the first streamed token. With the author-released 27B indexers it took 474.03 seconds (about 422 prompt tokens/s) and generated 66.08 tokens/s. Both hit the 768-token limit and need broader quality checks. The different outputs and MTP acceptance mean this single pair does not establish that the weights caused the decode difference. Client first-output timing includes prompt token-ID transfer.

The prior dense result on the same prompt was 57.91 token-counted decode tokens/s over 512 generated tokens, with a coherent answer. The older 127-token/s result was from a repeated-word prompt. A later dense rerun was stopped without producing a result. Do not compare MTP text-chunk counts as token counts.

The 27B author's checkpoint is at /mnt/hdd-500gb/model-validation/qsa-train/exports/author-reference/qsa-indexers.safetensors, SHA256 241f04cd8db6f2820fb50ff4d8f4cfbd1a1be1fe2993dcdb9caccf17a3e83d9a. The loader, 16-layer shapes and zero-centered norm conversion were checked against its original checkpoint. The user's model and local indexers were not replaced. The author trained against the original 27B model; compatibility with the Swift derivative needs evaluation.

### Exact selector optimization

The original stable FP32-score selector uses a 64-bit score/index key. On a synthetic 128-query, 50,000-block fixture at 200K context, scoring took about 2.8 ms, stable selection 16.1 ms, and grouped sparse attention 5.4–6.1 ms.

The isolated fast-stable runtime first uses FP32 top-k, then checks whether tied scores cross the cutoff; it falls back to the stable selector if needed. Complete packed arrays matched on ordinary and tie-heavy GPU fixtures. The selection fixture measured about 5.2 ms versus 16.2 ms. The full 200,008-token author-indexer run with the same 768-token limit generated prose without an obvious repetition loop: 342.17 seconds to first streamed output (about 585 prompt tokens/s) and 66.46 decode tokens/s. The prior stable-selector author run was about 422 prompt tokens/s and 66.08 decode tokens/s. This is a roughly 39% prefill improvement in one pair, with unchanged shared-prefill and FP16-score settings: both were disabled. More varied prompts and repeats are required.

Runtime: build/fast-stable-runtime. Flag: K8V4_QSA_FAST_STABLE=1. Artifacts: build/gdn-nosync/author-exact-chat.json and fast-stable-exact-chat.json. Client qsa_token_bench_v2.py verifies streamed output token counts against usage and measures output after the first streamed chunk. Its first-chunk time includes prompt token IDs; use a clean client for final prefill timing.

Two further selector candidates are isolated and not yet served: fast-boundary-runtime detects a boundary tie by comparing the Kth and K+1th scores; fast-partial-runtime repairs only affected rows. Both matched stable packed arrays on tie-heavy and ordinary fixtures. Their ordinary-score selection timings were approximately 4.95 and 4.92 ms respectively. They need model-level validation.

### Cache and attention kernel experiments

An isolated native prefill cache writer matched the existing cache on partial chunks, a 4,224-token chunk, and permuted physical pages, with maximum pooled-value error 7.15e-7. The single-request fixture measured about 0.039 ms versus 4.71 ms for the original write. It assumes unique, contiguous logical positions and has not yet been used in a model run. Source: build/prefill-cache-src; library: build/prefill-cache-out/libxe2_qsa.so; integration: build/native-prefill-runtime.

A grouped attention variant split selected KV tokens into 128-token pieces. A 128-query synthetic fixture measured about 2.4 ms versus 5.2 ms for the prior kernel, with max absolute error 3.05e-5. The actual wrapper also passed numerical checks for 17, 32, 128 and 256 queries. This is not yet a model-level performance result.

At this update, qsa-split-attn is starting on port 8123 and build/gdn-nosync/run_split_attn.sh is waiting for readiness. It uses the author indexer, fast-stable selector, per-query FP32 prefill and the split-attention variant. It will write build/gdn-nosync/split-attn-exact-chat.json for the same 200K/768-token test. Inspect the result, full output, and timing before accepting it.

### Draft and concurrency limitations

The 27B author's llama.cpp implementation says its MTP checkpoint has no trained indexer and keeps draft attention dense. Its published benchmark uses two draft tokens. The user's current stack uses six; on one coherent run the last two draft positions had low acceptance. A matched two-draft experiment is prepared in build/gdn-nosync/launch_fast_mtp2.sh and run_fast_mtp2.sh. It has not been run. Blindly reusing a backbone row for the draft is not validated and must not read future tokens or omit the draft's own tail.

The logical indexer cache is shared per layer and lacks a request identity, so simultaneous requests can overwrite one another's logical rows. Sparse graph capture also handles only one request span. The current reported KV capacity is about 718K tokens, below four 200K contexts, and the indexer graph allocation is 211,200 tokens. Do not treat four queued requests or a short opening as proof of safe concurrency. Request isolation, graph-safe capacity, and real concurrent quality tests remain open work.

The local indexer was trained for 300 steps on five captured random-token 16K sequences. Its final training log reported approximately 64.5% top-block teacher-mass capture; this is not a 200K quality benchmark. The paper targets a different Flash-Next model; use the published 27B implementation and its checkpoints as the closer reference, and test rather than assuming transfer.
