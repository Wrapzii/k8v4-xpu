# Current takeover update — November 6, 2026, 6:05 PM ET

This section supersedes older status statements below where they conflict. Work is continuing; the goal is not met and production remains intentionally stopped. The detailed running audit is `/home/dan/agent-work/k8v4-qsa/docs/qsa-audit-fixes.md`. No commits or pushes.

- The shared-prefill path produced repeated headings. In two single-user tests with shared selection disabled and per-query FP32 scoring, the full 768-token response had no obvious repetition loop. This is encouraging but does not establish broad quality or correct concurrency.
- On the same 200,008-token prompt, the local indexer measured approximately 423 prefill tokens/s and 51 decode tokens/s; the 27B author's verified indexer measured approximately 422 and 66. The outputs differed, so one pair does not prove the weights caused the speed difference. The earlier matched dense run measured about 58 token-counted decode tokens/s; the 127 figure below was from a repeated-word workload.
- A tie-checked per-query top-k matched stable packed arrays on synthetic fixtures. With the author's weights and the same prompt it generated 768 tokens without an obvious loop, at approximately 585 prefill and 66.5 decode tokens/s. The 39% prefill improvement over the original stable selector is one pair, not a general guarantee.
- The author's 27B MTP path is dense because its draft checkpoint has no trained indexer. A two-draft comparison is prepared but has not run. Do not enable blind target-to-draft index reuse.
- The current logical indexer cache is shared per layer without request identity. Simultaneous requests can overwrite each other's rows. Sparse graph capture and KV/indexer capacity also do not yet support a valid four-user 200K result.
- Active experiment: `qsa-split-attn` on port 8123, with `build/gdn-nosync/run_split_attn.sh` waiting for it to start. It adds an opt-in split-attention kernel to the validated fast selector. Synthetic checks passed, but the 200K model result is pending. The GPU hold is `codex-qsa` through 20:03 EST; verify status. Production remains stopped.

---


# QSA handoff (Nov 6, 2026, 5:02 PM ET)

This is the current note. Production stays down until you ask for it back. Nothing here is committed. Work stopped here on request. The goal is not met.

Older writeups, where they disagree with this file, are stale:

- `C:\Users\WhiteWidow\QSA-handoff-overnight.md`
- `C:\Users\WhiteWidow\Documents\Codex\2026-11-05\files-pasted-by-the-user-qsa\outputs\QSA-handoff-codex.md` (the 2:17 PM failure, before the logical-index fix)

Copies of this file:

- This PC: `C:\Users\WhiteWidow\QSA-handoff.md`
- ai01: `/home/dan/agent-work/qsa-fix/QSA-handoff.md`
- ai01: `/home/dan/agent-work/k8v4-qsa/QSA-HANDOFF-2026-11-06.md`

The short page is `C:\Users\WhiteWidow\QSA-status.md` (same text on ai01 at `/home/dan/agent-work/qsa-fix/QSA-status.md`).

## Where it stands

The `1. 1. 1` collapse is fixed. The indexer is keyed by logical token now, so a 200K request no longer falls off the 211,200-slot buffer. Sparse stats on these runs stay at width 2052 and 16 layer hits.

Shared prefill on that prompt is about 1,600 tok/s (first token ~125 s). That beats dense prefill at this length, about 1,080–1,100 tok/s. Decode on a real 512-token answer is 51–57 tok/s over the sparse forwards. Dense real text on the short repeated-word prompt was about 127 tok/s. The gap is MTP acceptance around 2.8 tokens per step, not a slow step. The old 125–132 and 325 tok/s figures were a repetition loop or a text-chunk gap.

A later shared run (`per-query-matrix-chat.json`) still starts as a real architecture answer and then, at character 1710 of 2213, repeats `###`. So the full 512 tokens are not clean. Exact per-query (`per-query-logical-chat.json`) stayed on the subject and did not do that, at about 427 tok/s prefill.

Concurrency 4 at 200K does not fit. KV is 718,202 tokens. Four 200K sequences are 800,032. A probe peaked at Running 2, Waiting 2. After the visible-matrix fix the engine stayed up and all four streams returned a short opening. They did not reside together, and 8 generated tokens is not a decode-rate comparison.

There is no finished matched dense-versus-QSA pair on the architecture prompt after the logical-index fix. A dense server did become ready (see machine state). The bench that was pointed at it wrote empty files and was stopped. Do not treat those files as a result.

## Why it was incoherent

The indexer stored keys by physical KV slot. A long request does not start at slot 0. Warmup and graph capture hold the low blocks. One 12K probe started at slot 46464 (block 22). A 200K request from there ends near slot 246000, past the 211,200-token indexer allocation (`K8V4_QSA_GRAPH_TOKENS`). Prefill grew the tensor. The decode graph had already captured the old buffer, so replay could not see the question at the end of the prompt. The model wrote a short opening and then repeated a heading.

The 10K screen stayed coherent because 10K plus that offset still fit in 211,200 slots, so the graph buffer and the live buffer were the same.

## What changed

Indexer rows are logical tokens, `0 … seq-1`, not physical slots. A 200K sequence fits in the 211,200-row allocation, so the captured graph still points at the keys. K8/V4 attention still uses the real block table (`pages_per_block` 33) to read the quantized cache. The score kernel is called with an identity page table and ratio 1, so pooled row `b` is the block of tokens `4b … 4b+3`.

Checked on a 12K prompt after the change. `QSA_CACHE` lines:

- seq_end 4223, need_blocks 1056, valid 1056, max_slot 4223
- seq_end 8447, need_blocks 2112, valid 2112, max_slot 8447
- seq_end 11999, need_blocks 3000, valid 3000, max_slot 11999

Before the change the same probe reported valid 0 and max_slot 50687, 54911, 58461.

The CPU selector matches the paper and the training indexer. `k8v4_v030/tests/test_qsa_ref.py`, 12 tests, OK. New test: `test_paper_budget_keeps_own_block_and_drops_past_count`. Budget 2048 plus the own 4-token block is width 2052. Past-count columns are `-inf` and are not selected. Zero-centered norm deltas load as `1 + weight` (`test_hf_delta_and_self_attn_key_become_the_multiplier`). Pool order is mean, then block RMSNorm, then partial RoPE at the first token of the block. Run log: `C:\Users\WHITEW~1\AppData\Local\Temp\grok-goal-2ac5b48039c2\implementer\unit.txt` (that scratch dir is deleted when the goal ends; the test in the repo is the durable copy).

## 200K quality runs after the fix

Prompt file: `/home/dan/agent-work/k8v4-qsa/build/gdn-nosync/realistic-chat-prompt.txt`. Client: `qsa_token_bench_v2.py`. Model `Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8`. 200,008 prompt tokens, 512 completion tokens, finish `length`. oneDNN prefill, w4a8 GEMM, K8/V4 kernels left on, prefix caching off, MTP 6, TP 2.

Decode tok/s is `(completion_tokens - 1) / (last sparse forward − first sparse forward)` after prefill `sparse_ok` has gone flat. Both ranks write each stats line twice.

| run | first token | prefill | forward-span decode | text |
| --- | --- | --- | --- | --- |
| exact per-query, logical index | 468.4 s | ~427 tok/s | 57.1 tok/s over 8.95 s (164 steps) | on the architecture the whole way, no heading loop |
| shared prefill + fp16 score, logical index | 125.2 s | ~1,597 tok/s | 51.2 tok/s over 9.98 s (183 steps) | on the architecture, no `1. 1. 1` loop |
| same shared path after the matrix fix | 124.5 s | ~1,606 tok/s | 57.0 tok/s over 8.96 s (164 steps) | real answer, then `###` from character 1710 |

Exact result: `per-query-logical-chat.json`. Shared result: `per-query-shared-logical-chat.json`. Matrix-fix result: `per-query-matrix-chat.json`. All under `/home/dan/agent-work/k8v4-qsa/build/gdn-nosync/`.

Shared prefill beats dense prefill (~1,080–1,100 tok/s at this length). Exact per-query prefill does not. It scores every query against every block. Shared scores the last query in the chunk and reuses that selection. That is faster and, with the logical index, no longer the `1. 1. 1` failure. It is a coarser selection than the paper’s per-query top-k.

Shared-run acceptance from the server log at 20:59 UTC: mean acceptance length 2.76. Per-position rates 0.680, 0.424, 0.285, 0.180, 0.116, 0.070. About 183 forwards for 512 tokens, ~55 ms each. `2.76 / 0.055` is about 50 tok/s.

## Why decode looks worse than this afternoon

The afternoon pair was a repeated-word prompt (`bench-qsaB word`), 32 tokens. Warm QSA step span was 0.234 s, 132 tok/s, against dense 127 tok/s. The model was repeating, so MTP accepted the draft tokens. One client figure of 325 tok/s was a 95 ms text-chunk gap. The forwards for that request were 0.247 s, 125 tok/s, and the answer was the loop. Do not quote 325, 146, or 132 as the decode rate of a real answer.

A real 512-token answer does not accept 6 of 6 draft tokens. The draft path was still dense attention over the full cache while the target was sparse, so they disagree. The step time is similar to dense. The tokens per step are not. That is the whole gap from ~127 to ~50.

Reusing the target's selected row for the MTP draft was tried (`per-query-reuse-chat.json`). Forward-span decode rose to 92.2 tok/s over 5.544 s (102 steps) and mean acceptance length hit 6.69, because the answer collapsed into `(V) (V) (V)`. That is the same failure as the old heading loop. The reuse branch now returns dense for any module whose name contains `mtp`. Do not turn it back on unless each draft token keeps its own block.

## Machine state at handoff (22:02 UTC / 5:02 PM ET)

- `vllm-k8v4-tp2` is stopped (Exited 1). `/run/vllm-intentional-stop` is set (root, empty, created 17:20 UTC). The healthcheck will not start production while that file exists. Production was not started.
- `qsa-exact-tiled-test` is not running. It was removed earlier so a dense comparison could use `:8123`.
- `qsa-dense-comparison` came up and answered `/v1/models` around 21:58 UTC. Env inside it: `K8V4_QSA=0`, `K8V4_PREFILL=onednn`, `K8V4_PREFILL_GEMM=w4a8`, `K8V4_QSA_GRAPH=0`, cache `/root/.cache/vllm/w4a8-wired-v1`. It was stopped at 22:02 UTC (Exited 137). Port 8123 is free.
- A bench of `realistic-chat-prompt.txt` was started against that server at 22:00 UTC (pid 1355839) and killed before it wrote anything. `dense-realistic-chat-2.json` and `dense-realistic-chat-2.err` are both 0 bytes. There is no new dense rate.
- Bench hold was extended to 21:00 EST (`qsa-200k-pair`) and then released. Status after release: released, queued 0. `bench-hold release` printed `drain FAIL ... rooms has no attribute router`. That line is normal.
- Forgejo and its runner were left up. Do not stop them.

Experiment env on the last shared-prefill QSA run: `K8V4_QSA=1`, `K8V4_QSA_GRAPH=1`, `K8V4_QSA_EXACT_TILED=0`, `K8V4_QSA_SHARED=1`, `K8V4_QSA_SHARED_LAST_SCORE=1`, `K8V4_QSA_SCORE_FP16=1`, `K8V4_QSA_DIRECT=1`, `K8V4_QSA_PAGED_SCORE=1`, `K8V4_QSA_GRAPH_TOKENS=211200`, `K8V4_PREFILL=onednn`, `K8V4_PREFILL_GEMM=w4a8`, `VLLM_CACHE_ROOT=/root/.cache/vllm/qsa-exact-tiled-test`.

The QSA container imports `/home/dan/agent-work/k8v4-qsa/build/exact-tiled-runtime` at `/opt/k8v4-qsa`. That tree has the logical-index change. MTP reuse is present but disabled: a module whose name contains `mtp` stays dense, because reusing the target row caused a `(V)` loop. `coerce_visible_matrix` in `qsa_ops.py` turns a list of token rows into the `[queries, width]` matrix. That is what stopped two concurrent decodes from killing the engine. The same function is in the git checkout’s `k8v4_v030/qsa_ops.py`. The logical-index runtime change is not copied into the checkout. Checkout is `/home/dan/agent-work/k8v4-qsa`, branch `qsa-sparse-fix`, HEAD `a5d868b`, uncommitted. Tests added there: `test_paper_budget_keeps_own_block_and_drops_past_count`, `test_list_of_rows_becomes_a_visible_matrix`. Do not commit either tree.

Launcher: `/home/dan/agent-work/k8v4-qsa/build/gdn-nosync/launch_exact_tiled_test.sh qsa`. Readiness script that watches this container, not the old `qsa-vllm-test`: `build/gdn-nosync/wait_exact.sh`. `build/wait_qsa_ready.sh` still looks at `qsa-vllm-test` and will say DEAD while this server is fine.

## Bring production back only when asked

1. Confirm `qsa-exact-tiled-test` and `qsa-dense-comparison` are stopped. Both already are.
2. `docker start vllm-k8v4-tp2` and wait until it answers.
3. `sudo -n rm -f /run/vllm-intentional-stop`
4. `~/.local/bin/bench-hold release`, then `bench-hold status`. The hold is already released. Release prints `drain FAIL ... rooms has no attribute router`. That line is normal.

Stop any test container before removing the flag. If the flag is removed while a test server holds the GPUs, the healthcheck will try to start production on a full device.

## What the next session should do

1. The full 512-token shared path still repeats `###` from character 1710 (`per-query-matrix-chat.json`). Exact per-query did not, and its prefill (~427 tok/s) loses to dense (~1,080–1,100). A pass needs both rates above the paired dense run and a full generation that stays on the prompt.
2. MTP acceptance has to rise from ~2.8 on a coherent answer. Step time is already ~55 ms. At 2.8 tokens per step that cannot beat ~127 tok/s. Blind reuse of the target row (`per-query-reuse-chat.json`) hit 92 tok/s only by repeating `(V)`. A correct reuse has to keep the historical blocks and update each draft token's own block. That code is not written. `_reuse_mtp` still copies one frozen row and is not called.
3. Copy the logical-index runtime from `build/exact-tiled-runtime/k8v4_v030/qsa_runtime.py` into the checkout before relying on the checkout. The checkout still writes the indexer by physical slot.
4. Concurrency 4 at 200K does not fit. KV is 718,202 tokens (engine: 2.74x at 262,144). Four 200K sequences are 800,032 tokens. The logical indexer is one 211,200-row buffer, so two long requests overwrite each other. After `coerce_visible_matrix`, four simultaneous 200K prompts with 8 generated tokens all returned a short opening and the engine stayed up. Peak was Running 2, Waiting 2, KV about 37%. The first probe, before that fix, died with `direct QSA decode needs a visible-token matrix`. File: `build/gdn-nosync/c4-probe-2.txt`. Do not pretend a shorter prompt is the 200K case.
5. Do not commit or push. Do not replace this tree with `/home/dan/agent-work/k8v4-qsa-fixes`. Do not turn off oneDNN or the K8/V4 kernels to buy a speed number. Do not start `vllm-k8v4-tp2` unless asked.

## Earlier speed pair, for the record

Repeated-word prompt, 199,998 tokens, 32 completion tokens, cached 0, before the logical-index fix. QSA B’s 132 tok/s was the loop, not a coherent answer. Pair A prefill lost.

| pair | dense prefill | QSA prefill | dense decode | QSA forward-span decode |
| --- | --- | --- | --- | --- |
| A | 1084.74 | 1034.19 | 22.84 over 1.357 s | 69.19 over 0.448 s |
| B | 1103.44 | 1454.74 | 127.05 over 0.244 s | 132.49 over 0.234 s |

Files: `/home/dan/agent-work/k8v4-qsa/build/bench-dense-1.txt`, `bench-dense-2.txt`, `bench-qsa-1-client.txt`, `bench-qsa-2-client.txt`.
