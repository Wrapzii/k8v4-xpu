# Speculative decoding: draft last row, draft vocabulary, chunked verify, deep copy drafting (2026-11-19)

Four opt-in additions to the MTP speculative decoding path, ported from the B70 stack this
work is measured against. Each is off unless its variable is set, and each is lossless for
served outputs: the target model still verifies every drafted token, so only draft proposals
(and so acceptance and speed) can change.

| knob (default off) | what | vLLM | where |
|---|---|---|---|
| `K8V4_DRAFT_LASTROW=1` | MTP draft layer: prefill attention for the last row of each request only | any (0.34 `is_draft_layer`, 0.30 `mtp.layers.N` name) | `k8v4_v030/draft_lastrow.py`, `backend.py` |
| `K8V4_DRAFT_VOCAB=<ids.json>` | drafter's own row-subset lm_head (e.g. 64K most frequent tokens) | 0.30 and 0.34, one splice | `k8v4_v030/draft_vocab.py`, `tools/patch_spec_decode.py` |
| `K8V4_VERIFY_CHUNK=1..10` | uniform verify of up to 32 rows per request on the decode kernel, in row chunks | any | `k8v4_v030/verify_chunk.py`, `backend.py`, `plan.py` |
| `K8V4_DEEP_DRAFT=lo,hi` | n-gram copy drafting at depth 15 for a lone copying request | 0.34 only, four splices | `k8v4_v030/deep_draft.py`, `k8v4_v030/ngram_lookup.py`, `tools/patch_spec_decode.py` |

`launch.sh` passes each only when set (`K8V4_DRAFT_VOCAB` also mounts the id file read-only);
`test_launch_profiles` asserts the default command is unchanged.

## Draft last row (`K8V4_DRAFT_LASTROW`)

During a prefill chunk the MTP draft layer runs attention over every query row, like a target
layer: per request the oneDNN path gathers and dequantizes the whole KV prefix of every head and
runs the SDPA for all rows. The V2 runner's draft prefill keeps one row per request (its
`last_token_indices`), and the draft K/V of every row are stored before attention runs. With the
knob on, a draft layer's prefill segment computes only that row, with the decode kernel over the
stored sequence (read in place, no gather), and writes zeros to the other rows so nothing
uninitialized reaches o_proj and the MLP. Target layers and decode/verify rows are untouched.

## Draft vocabulary (`K8V4_DRAFT_VOCAB`)

Every MTP draft step ends in the full lm_head (248,320 rows; the Swift bake's GPTQ int4 head is
about 0.65 GB of weights and scales per read, the same at one user as at four, six reads per
MTP6 step). The knob gives the drafter a private subset of its head: for the XPU wNa16 GPTQ head
the packed rows `[N, K/8]` and the scale columns `[K/g, N]` of the listed ids (symmetric form
only), or dense rows for an unquantized head. Its logits are that GEMM scattered into a
full-vocab row of -inf; `get_top_tokens` maps the subset argmax back. The target's head is not
touched. 64K int4 rows cost about 170 MB. Rejection sampling stays valid at temperature > 0
(the draft distribution is zero outside the list). On our stack a 64K ranking was a lossless
+20% one-user decode with a bf16 head (2026-10-05); with an int4 head the saving is about a
quarter of that read.

## Chunked verify (`K8V4_VERIFY_CHUNK`)

The decode kernel takes at most `DECODE_MAX_T` = 10 query rows per request. Rows `[r0, r1)` of
a q_len-row verify are the last rows of a sequence `q_len - r1` tokens shorter, so each chunk is
the same kernel call with trimmed `seq_lens`: exact causal mask, one KV read per chunk (two at
depth 15 with chunks of 8). With the knob set the builder marks a uniform verify up to 32 rows
as packed, so it stays in the decode graph instead of falling to per-request prefill.

## Deep copy drafting (`K8V4_DEEP_DRAFT`, vLLM 0.34)

A GPU n-gram lookup (longest suffix of `lo..hi` tokens seen earlier in the request; Triton,
no host sync) runs in front of the MTP draft prefill. A lone request whose output is copying
from its own context (its last `lo` tokens occur earlier) is scheduled the deep depth (15);
on a full-length match its copied tokens replace the MTP drafts and the MTP decode steps are
skipped. Otherwise it keeps MTP depth 6 (`K8V4_DEEP_MTP_DEPTH`), and two or more requests draft
3 through vLLM 0.34's native per-batch schedule. `launch.sh` builds the profile:
`num_speculative_tokens` 15, schedule `[[1,1,15],[2,MAX_SEQS,3]]`, capture sizes 7, 16 and 4n,
`K8V4_VERIFY_CHUNK=8`. vLLM reserves one GDN state block per draft position for each running
request (16 at depth 15), so this suits `K8V4_MAX_SEQS=1`, their TP1 default; our per-request
state-block trimming (`B70_SPEC_BASE`) and all-users deep drafting (`B70_DEEP_ALL`, which needs
RecoverSSM) are not ported. On our stack (-23) one-user copy/edit output went 177-186 ->
280-351 tok/s with identical outputs.

## vLLM 0.34 anchors (`tools/patch_spec_decode.py`)

All anchored, applied once, refused on unknown text; verified against the stock
`vllm/vllm-openai-xpu:v0.34.0` image (and the vocab one against 0.30).

| splice | file | anchor |
|---|---|---|
| draft_vocab | `v1/worker/gpu/spec_decode/speculator.py` | `self.model = self.load_draft_model(...)` in `load_model` (0.30 l.218, 0.34 l.294) |
| deep_init | `v1/worker/gpu/spec_decode/__init__.py` | top of `init_speculator` |
| deep_steps | `v1/worker/gpu/spec_decode/target_dependent_ar/speculator.py` | after the `num_speculative_tokens <= 1` early return in `propose` |
| deep_sched | `v1/core/sched/scheduler.py` | after the dynamic-SD lookup of `num_spec_tokens_to_schedule` |
| deep_capture | `config/vllm.py` | `get_decode_cudagraph_query_lens` return |

## Measurements

One B70, Swift 1.5 (Qwen3.8-27B GPTQ int4), their stack moved to vLLM 0.34 (`b70/test-v034`, image
`k8v4-up:v034-1508198` as the baseline), test image `k8v4-up:spec034-9592f2c` (`b70/test-spec034b` =
`b70/test-v034` + this branch). Config as the baseline window: `K8V4_MAX_SEQS=4`, prefix caching on,
max-model-len 131072, util 0.96, sliced upload 128 MiB; our local test harness, end to end over HTTP.

Unit checks on the GPU (the local test harness):
- chunked verify, depth 15 (16 rows, chunks of 8, two requests of 3,000 and 5,003 tokens): max abs gap to 16
  one-row decode calls **0** (bit-identical; 0.30 image, their kernel library).
- int4 row-subset head (1,024 of 4,096 rows, K 5,120, g128) vs the full head on the kept rows: max abs gap **0**
  (0.34 image).

| run | knobs | KV tokens | exact / needle | cold 63K prefill | 1 user decode (gap p50) | 4 users aggregate (gap p50) |
|---|---|---|---|---|---|---|
| v034base | none | 349,525 | 8/9, 6/6 | 1,511 tok/s | 50.8 tok/s (66 ms) | 87.7 tok/s (159 ms) |
| spec034a | `K8V4_DRAFT_LASTROW=1`, `K8V4_DRAFT_VOCAB` (64K) | 345,005 | 8/9, 6/6 | 1,538 tok/s (+1.8%) | 49.8 tok/s (61 ms) | 86.6 tok/s (155 ms) |

- Draft last row: cold 63K prefill +1.8% (1,511 -> 1,537 on all five cold prefills).
- Draft vocabulary: the step gets shorter (one user gap p50 66 -> 61 ms, four users 159 -> 155 ms), but decode
  tok/s is flat within run-to-run noise (tokens per step moved with the sampled content; overall draft acceptance
  in the server log was 0.49 vs 0.42, a different request mix). Costs 4,520 KV tokens (the 173 MB draft head).

Deep copy drafting, one request at a time (`copyprobe.py`, greedy, 1,200-token outputs), same image:
spec034a (MTP6, 4 seqs) vs spec034b (`K8V4_MAX_SEQS=1`, `K8V4_DEEP_DRAFT=12,16`, lastrow + vocab on in both):

| prompt | MTP6 | deep | change | text |
|---|---|---|---|---|
| copy-code | 181.9 | 348.2 | +91.4% | identical |
| edit-rename | 182.5 | 271.3 | +48.6% | identical |
| edit-docstring | 175.6 | 345.4 | +96.7% | identical |
| copy-prose | 181.0 | 314.8 | +73.9% | identical |
| review | 105.7 | 108.4 | +2.5% | differs after 425 chars |
| essay | 78.8 | 79.1 | +0.4% | identical |
| story | 65.0 | 64.4 | -0.8% | differs after 4,592 chars |
| code-new | 124.1 | 124.4 | +0.3% | identical |
| mean | 136.8 | 207.0 | +51% | |

Copy and edit outputs +49-97% with identical text; ordinary text unchanged (MTP depth 6). The two differing
greedy texts are the known temp-0 non-determinism of the batch shapes (4 seqs vs 1 seq capture different
graphs; exact ties), not the drafter: the target verifies every token. KV at `K8V4_MAX_SEQS=1` with depth 15:
258,569 tokens (16 GDN state blocks for the one request). Exact 8/9 in every run (the same item as the baseline).

Per-batch draft depth on 0.30 (port-plan #10): the 0.30 scheduler applies `num_speculative_tokens_per_batch_size`
to the verify (draft placeholders and the trim of proposed drafts follow `num_spec_tokens_to_schedule`), but the
V2 runner's autoregressive speculator still drafts all 6 steps, so 3 of 6 MTP forwards are wasted at depth 3.
vLLM 0.34 passes the scheduled depth to the speculator natively. The 0.30-only fix is on branch
`b70/spec-depth` (27cdc5b), not measured (the 0.30 windows were dropped for the 0.34 move).

## Not ported

- RecoverSSM for GDN (our -25/-26): vLLM 0.34 has the Mamba2/KDA RecoverSSM frame
  (`model_states/recoverssm.py`, `recoverssm_metadata.py`) but no GDN branch. Our 0.34 port adds
  four files (`layers/mamba/gdn/recoverssm_gdn.py` 746 lines, `v1/attention/backends/gdn_recoverssm.py`
  238, `layers/mamba/ops/recoverssm.py` 200, `layers/mamba/recoverssm_utils.py` 37), edits
  `models/qwen3_5.py` (162 diff lines), `gdn_attn.py` (129), `recoverssm_metadata.py` (38),
  `_xpu_ops.py` (391, the `_b70_rssm` verify op loader) and needs `_b70_rssm.so` (xk v0.1.17 verify
  kernel; a 0.34 build exists as image `b70-rssm-ext:v034-exp`). It touches GDN layers only, not
  the K8/V4 attention backend, so it could land as new files plus splices once their 0.34 base
  serves. It is what lets every user draft deep (all copying 4x63K 274 -> 464 tok/s on our stack).
- Per-batch draft depth: native in vLLM 0.34.

## Draft vocabulary with the W4A8 s4 head (fix, measured on `b70/all-034` config A)

With `K8V4_W4A8_LAYERS=all K8V4_W4A8_KERNEL=onednn` the target's lm_head (layer family `other`) is flipped at
load to s4 nibbles with an empty zero point, and the MTP draft shares that head (the shared-table path, with or
without `K8V4_DRAFT_SKIP_SHARED`). The first version refused it ("only the symmetric int4 head is supported").
The subset now keeps whichever form the head is in (`int4_form`): u4 with one zero point 8 runs the stock
`_xpu_C.int4_gemm_w4a16`, s4 runs `k8v4_w4a8.int4_gemm_w4a16`, the op the head itself decodes with, on the same
packed rows and scales. Still lossless.

Config A of `b70/all-034` (image `k8v4-up:all034-575ee85`, source `b70/test-vocab-all034` = all-034 + this fix),
`K8V4_MTP_SHARED_DEPTH=3`, plus `K8V4_DRAFT_VOCAB` (64K ids):

| | all034A | + draft vocab (gapVf) |
|---|---|---|
| KV tokens | 388,696 | 384,176 |
| exact | 8/9 | 8/9 |
| 1 user decode (gap p50) | 73.6 tok/s (49 ms) | 82.5 tok/s (44 ms), +12% |
| 4 users aggregate (gap p50) | 171.7 tok/s | 184.8 tok/s (63 ms), +7.6% |
| coding client decode, 2K / 8K / 32K / 128K | 124 / 124 / 119 / 89 | 141 / 139 / 126 / 98 |

Same with `K8V4_MTP_SHARED_DEPTH=4` (gapV4f, 4 users only): 164.4 tok/s aggregate, below depth 3.
Coding-client numbers are the mean `decode_tok_s` of the three non-warmup trials per length.
