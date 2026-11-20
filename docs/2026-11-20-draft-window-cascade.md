# Draft-layer attention window, shared-prefix cascade, QSA micro-optimisations (2026-11-20)

Three leads from the 11-19 research reports, each measured on their stack (one B70, Swift 1.5, vLLM 0.34).
All are opt-in; with the knobs unset `launch.sh` prints the same command as before (`test_launch_profiles`).

| item | knob (default off) | branch / commit | verdict |
|---|---|---|---|
| 1. attention window for the MTP draft layer | `K8V4_DRAFT_ATTN_WINDOW=N` (tokens) | `b70/draft-attn-window` (from `b70/vllm-034`) | lossless, but costs acceptance: **not recommended** |
| 2. shared-prefix cascade for the drafter batch | `XE2_KV_CASCADE=1` (with `XE2_KV_BATCH_REQS=1`) | `b70/kv-cascade` (from `b70/s1-rows`) | +2% on 4 agents sharing a 49K prefix, flat on distinct prompts |
| 3. QSA grp3 micro-optimisations | none | none | already in FAST S1's structure; nothing to port |

Test tree: `b70/test-dwin` = `b70/test-deep-all` (config A + vocab + determinism + RecoverSSM + deep-all) + the S1
FAST / batched-requests commits + both features. Measured config (the local test harness): `K8V4_MAX_SEQS=4`,
prefix caching, util 0.96, `XE2_KV_S1_SPLITS=32`, embed host, draft skip shared, GDN heads, W4A8 all / oneDNN, draft
last row, `K8V4_MTP_SHARED_DEPTH=3`, draft vocab 64K, `K8V4_ONEDNN_DETERMINISTIC=1`, `XE2_KV_S1_FAST=1`,
`XE2_KV_BATCH_REQS=1`, `K8V4_GDN_RECOVERSSM=1`, `K8V4_MAMBA_SSM_DTYPE=float16` (KV 508,996 tokens). Image
`k8v4-up:rssm-v2`, decode library mounted from the tree. our local test harness over HTTP, greedy; acceptance from
vLLM's `/metrics` counters around each workload (`dwin_spec.py`).

## 1. Draft-layer attention window (`K8V4_DRAFT_ATTN_WINDOW`)

At 63K the draft layer is 3 of the 19 full-attention KV passes of a 4-user step (6 of 22 alone). With the knob the draft
layer's decode-kernel calls read only the last whole block-table entries that cover at least N tokens: the table row is
shifted on the device (`torch.gather`, a few tiny graph-safe ops) and the length shortened, so the kernel, its grid, the
workspace and the batched-request path stay as they are (`k8v4_v030/draft_window.py`, hook in `backend._attn_batch`).
Target layers and shorter sequences are untouched (bit-identical). The window is in block-table entries, so it covers
between N and N + 2 entries of tokens. KV pages are not freed: the draft layer stays in the full-attention KV group (KV
508,996 in every arm). A separate sliding-window group would free about 1/17 of the attention KV (~6%), but given the
acceptance loss below it was not built.

| 63K, greedy | base `dwB` | window 4K `dwW4` | window 16K `dwW16` |
|---|---:|---:|---:|
| 1 user: decode tok/s, gap p50 | **78.5**, 41 ms | 61.1, 40 ms | 67.8, 40 ms |
| tokens per step (tok/s x gap) | **3.22** | 2.44 | 2.71 |
| 4 users: aggregate tok/s, gap p50 | **198.5**, 55 ms | 177.6, 53 ms | 187.1, 53 ms |
| tokens per step per user | **2.76** | 2.38 | 2.49 |
| far copy (source 48K back), 1 user tok/s / accepted per draft | **170.7** / 5.84 | 100.5 / 2.92 | 104.9 / 3.12 |
| near copy, 4 users at 63K (`copy4`), aggregate / accepted per draft | 295.1 / 2.98 | **308.3** / 2.98 | 304.6 / 2.98 |
| first-position acceptance, 1 user / 4 users | 0.80 / 0.80 | 0.70 / 0.72 | 0.84* / 0.73 |
| exact | 8/9 | 8/9 | 8/9 |

\* the per-window acceptance counters also include the stall phase of `conc64` (a second user's cold prefill), so tokens
per step (from the clean decode phase) is the measure to trust; it falls in both window arms.

- Step time drops 1-2 ms as the kernel numbers predicted (4-request q1 at 63K 816 us vs 251 us at 16K), but Swift's MTP
  head clearly uses long-range context: tokens per step fall 16-24% at one user and 10-14% at four, so decode is slower
  overall (-22% / -11% at 4K, -14% / -6% at 16K). The far-copy probe shows the mechanism: drafts of text 48K back
  collapse (5.84 -> 2.9 accepted per draft).
- Only near copies gain (+4.5% at 4K, acceptance unchanged), and deep copy drafting (`K8V4_DEEP_ALL`) already serves
  those through n-gram drafts that skip the draft layer.
- Lossless confirmed: the far-copy text is identical in all three arms (sha c6aaad1fb3ad); the window changes only
  proposals.

Verdict: keep the knob (default off, documented), do not enable it. Run-to-run noise between two baselines on this config
is about 4% at four users (`dwB` 198.5 vs `dcB` 205.9), so the 16K arm's four-user loss alone is within noise, but the
tokens-per-step loss is consistent in every row.

## 2. Shared-prefix cascade (`XE2_KV_CASCADE`)

Port of Wrapzii's `XE2_KV_CASCADE` (5c337d2, `codex/compact-slm-concurrency`, written for the one-page S1) onto the
multi-page S1 with batched requests. Only one-row batches (the MTP drafter, 2-8 requests) take it:

1. A one-work-group plan kernel finds, on the device, the leading block-table entries that every request shares (same
   physical block), capped so each request keeps at least one tail token, and writes the tail tables and lengths.
2. One multi-page S1 launch walks the shared entries once, with every request's rows in one Q tile (a pseudo request
   of q_len = B whose rows all see exactly the shared tokens; 4 requests = the q4 tile).
3. The batched S1 walks each request's tail only (shifted table, shorter length).
4. A cascade variant of the batched S2 merges each row's tail groups and its shared groups.

Everything lives in the caller's workspace (no allocation, graph-capture legal). With nothing shared, the shared launch
exits at once and S2 merges the same groups in the same order: bit-identical to the batched path (checked). With a
shared prefix the result differs at fp16 level (other page grouping, one more merge), max 3e-5 against the reference in
the bench, same as the batched path.

Kernel, 4 requests, q1, one op per graph, us (`bench/ab_s1pages.py --batch 4 --shared F`):

| context | shared | one-page | FAST + batched | **+ cascade** |
|---|---:|---:|---:|---:|
| 63K | 95% | 1531 | 818 | **370 (-55%)** |
| 16K | 95% | 358 | 218 | **144 (-34%)** |
| 63K | 50% | 1541 | 822 | **633 (-23%)** |
| 63K | 0% | 1542 | 828 | 845 (+17 us) |
| 16K | 0% | 432 | 252 | 266 (+14 us) |
| 63K, 2 requests | 95% | 766 | 427 | **313** |

`tests/test_cascade_xpu.py` (XPU): shared 95% / 50% / 2 and 8 requests within 2e-3 of the batched path, nothing shared
bit-identical, graph replay identical: pass.

End to end (`dcB` off / `dcC` on, same tree and library, one lock hold):

| workload | cascade off | cascade on | change |
|---|---:|---:|---:|
| 4 agents, one shared 49K-token prefix, distinct questions (`dwin_shared4.py`), aggregate tok/s, two runs | 229.2 / 229.7 | **234.8 / 233.3** | +2.0% |
| same, chunk gap p50 | 51.2 ms | **50.2-50.3 ms** | -1 ms |
| same, texts / accepted per draft | 4 hashes | identical / identical (1.929) | |
| 4 distinct users at 63K (`conc64`), aggregate, gap p50 | 205.9, 55 ms | 203.8, 55 ms | flat (noise ~4%) |

The gain is the drafter's share of the step: 3 draft passes x ~0.45 ms at 4 x 49K shared. It applies whenever agents
share a long system prompt / repository context; distinct prompts pay ~17 us per draft pass (plan kernel + one more
launch). The verify (q4, 96 rows for 4 requests) does not fit one tile and keeps the plain batched path; Wrapzii measured
their q7 verify cascade 18% slower, so it was not ported. Padded decode batches (fewer live requests than the graph
size) usually see no shared entry, so they fall back to the plain merge.

## 3. QSA grp3 micro-optimisations (qsa-sparse-fix f7ac3a9)

Their three changes target a token-granular kernel (one sub-group per token chunk):
- multiply-high for `logical / 33`: the divide sat on the per-TOKEN K address chain. The FAST multi-page S1 does one
  `logical / pages_per_block` per 64-token PAGE per work-group (uniform), i.e. ~30 integer ops on a ~7.7 us page chain
  (63K q1: 32 programs x 4 heads, ~31 pages each in ~238 us): < 0.1%, below measurement noise.
- physical-page reuse for consecutive tokens: the page loop already resolves the physical page once per page and every
  token of the page uses it.
- one exp per token: FAST already computes one `exp2` per (row, token); the rescale factor is computed only on the rare
  pages where the running max moves by more than 8 (lazy rescale).
Nothing to port; no build was spent on it.

## Files

- `k8v4_v030/draft_window.py`, `backend.py` hook, `tests/test_draft_window.py`, `launch.sh` + launch test (window).
- `k8v4_v030/native/xe2_kv_ops.cpp` (plan kernel, `attn_batch_cascade`, `CASC` S2), `tests/test_cascade_xpu.py`,
  `bench/ab_s1pages.py --shared`, `launch.sh` + launch test (cascade).
