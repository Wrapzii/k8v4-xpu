# Prefix-hit granularity and warm TTFT (2026-11-19)

Branch `b70/prefix-match-unit` (on `b70/vllm-034`). Launch knobs only; the vLLM code they switch on is stock
(0.30 and 0.34). Off by default; the default `launch.sh` argv is unchanged (asserted in `test_launch_profiles`).

| knob | values | effect |
|---|---|---|
| `K8V4_PREFIX_MATCH_UNIT` | unset, or a positive multiple of the 64-token page (vLLM checks that it divides the block); needs `K8V4_PREFIX_CACHING=1`. Use 64. | `--prefix-match-unit=N` |
| `K8V4_PREFIX_JUNCTIONS` | 0 / 1; needs a match unit | `--enable-mamba-shared-prefix-checkpoint` (vLLM 0.30 calls it `--enable-mamba-fine-grained-prefix-cache`). Not measured. |

## Why warm TTFT was high

The GDN state page forces the attention block to 2112 tokens ("Setting attention block size to 2112 tokens to
ensure that attention page size is >= mamba page size"). With prefix caching vLLM sets mamba cache mode `align`
and, with no match unit, hashes at the GCD of the group block sizes, 2112. A hit can only land on a 2112-token
boundary, and with MTP (`use_eagle_block_drop`) one block lower: for a ~63.1K prompt the hit is
29 x 2112 - 2112 = 59,136 tokens, so every warm turn recomputes ~4,000 tokens at the tail of a 63K context (on
vLLM 0.30 that took 3.6 s for one user and 11.5 s for four; on the 0.34 stack with all other ports, 1.30 / 4.61 s).

`--prefix-match-unit 64` makes vLLM hash every 64-token page and save the GDN state at the prompt's last 64-token
boundary (the scheduler stops the final chunk there). A hit inside a 2112-token block is served by copy-on-write
of the partial block. vLLM 0.34 has the copy-on-write fix for hybrid pages (upstream PR 55112); 0.30 does not, so
on 0.30 this knob needs that backport (parked on `b70/prefix-cow-030`, not proposed).

Measured hits (probe: cold prompt, identical repeat, appended turn, third turn with the model's real reply; prefix
cache metrics, no prompt_logprobs):

| prompt | repeat: recomputed / TTFT | append turn | third turn |
|---|---|---|---|
| 8,189 tok | 61 tok / 0.15 s | 92 / 0.26 s | 213 / 0.41 s |
| 62,993 tok | 17 tok / 0.41 s | 48 / 0.44 s | 233 / 0.75 s |

(The third turn recomputes the previous reply: the chat template rewrites the assistant turn, so the cache can only
reach the previous prompt's tail.)

## Measured on top of b70/all-034 (config A of the local test harness)

One B70, Swift 1.5, util 0.96, 4 seqs, prefix caching, `XE2_KV_S1_SPLITS=32`, embed host, draft skip-shared,
GDN heads, W4A8 all layers (oneDNN), draft last row, MTP shared depth 3. our local test harness, `TESTS="exact custom
users prefix mt"`, `USERS="1 4"`, `MT_LEVELS="1 4"`, `CONV_PER_CLIENT=1`, `SEED_BASE=20261118`.

| run | KV tokens | cold 63K prefill | warm TTFT 1 user | warm TTFT 4 users (max) | agent sessions 1 / 4 clients | decode 1 user / 4 aggregate | exact |
|---|---|---|---|---|---|---|---|
| all034A (before) | 388,696 | 2,084 tok/s | 1.30 s | 4.61 s (5.05) | 175.2 / 326.3 s | 73.4 / 171.7 | 8/9 |
| + `K8V4_PREFIX_MATCH_UNIT=64` | 388,696 | 2,058 tok/s | **0.44 s** | **1.33 s** (1.56) | **163.4 / 305.8 s** | 67.0 / 173.4 | 8/9 |
| our 0.34 port (reference) | 373,124 | 2,047 | 0.41 s | 1.14 s | 149 / 282 s | 78.7 / 204.2 | |

Warm TTFT -66% (one user) / -71% (four users); agent sessions -7% / -6%. KV size is unchanged. (One-user decode
in the users test varies run to run on this stack: 67-74 tok/s.)

Cache-hit correctness (cached repeat vs cold, token logprobs, 32 greedy tokens, 1K / 8K / 63K, two prompts each):
5 of 6 bit-identical (first-token KL 0, identical logprobs); one 63K trial diverged at token 2 with KL 0.003,
the size of the run-to-run oneDNN noise that `K8V4_ONEDNN_DETERMINISTIC=1` removes. With `K8V4_ONEDNN_DETERMINISTIC=1` (commit 1e2951f on b70/all-034) all 6 are bit-identical (same 28-32 tokens,
identical logprobs, KL 0): cache hits at 64-token granularity are exact.

## Not done here

- The in-pass GDN checkpoint (branch `b70/gdn-ckpt`) is not working yet; see its doc.
- `K8V4_PREFIX_JUNCTIONS` (shared-prefix junction checkpoint) was not measured.
