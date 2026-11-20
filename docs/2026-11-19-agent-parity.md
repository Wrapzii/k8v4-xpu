# Agent / OpenAI-API parity with the B70 production stack — November 19, 2026

One Arc Pro B70, Swift 1.5 (Qwen3.8-27B GPTQ int4), TP1, vLLM 0.34 (`b70/vllm-034`). The goal is to serve
agent clients the same way our production engine does (B70 prod `-27`, vLLM 0.33, model qwen38), with
only the differences an agent can see closed, each by an opt-in knob. Our agent platform is Turnstone 1.9.4
(OpenAI chat completions, model `qwen38`, streamed with `stream_options.include_usage`, thinking and effort
sent as `chat_template_kwargs` `enable_thinking` / `reasoning_effort` with the values low / medium / xhigh,
mid-conversation operator turns folded into the preceding turn, `prompt_tokens_details.cached_tokens` read
for its cache statistics).

## What was compared

- Ours: the prod compose command (`/opt/vllm-compose/compose.yaml`) and its entrypoint, which runs
  `inline_system_template.py` on the model's template and passes `--default-chat-template-kwargs
  {"reasoning_effort":"medium"} --enable-prompt-tokens-details --generation-config auto`, with
  `VLLM_HTTP_TIMEOUT_KEEP_ALIVE=300`.
- Theirs: `k8v4_v030/launch.sh` as the b70 harness runs it (`SERVED_NAME=qwen38`, Swift's
  `chat_template_low.jinja`, `K8V4_MAX_MODEL_LEN=131072 K8V4_MAX_SEQS=4`).

| item | ours (prod) | theirs (launch.sh) | agent-visible? |
|---|---|---|---|
| served name | qwen38 | qwen38 (`SERVED_NAME`) | same |
| tool parser / auto tool choice | qwen3_xml, on | qwen3_xml, on | same |
| reasoning parser | qwen3 | qwen3 | same |
| `--generation-config` | auto | unset = auto (vLLM 0.34 default) | same; both checkpoints default to T 1.0, top-k 20, top-p 0.95 |
| max-model-len | 131,072 | 131,072 (`K8V4_MAX_MODEL_LEN`; their default 262,144) | same |
| default reasoning effort | medium (`--default-chat-template-kwargs`) | low (Swift template default) | yes, for clients that send no effort |
| `reasoning_effort` high / minimal | mapped to xhigh / low | HTTP 400 | yes, for clients that send them |
| non-leading system message | rendered in place | HTTP 400 (OpenAI); merged into the system prompt, prefix-cache miss every turn (/v1/messages) | yes, for clients that send them |
| `usage.prompt_tokens_details` | present (`cached_tokens`) | `null` | yes: Turnstone's cache statistics read 0 |
| HTTP keep-alive | 300 s | 5 s (vLLM default) | yes: pooled connections idle > 5 s fail ("Connection error.") |
| images per prompt | 999 (vLLM default), video allowed | 4, video 0 (`K8V4_MAX_IMAGES`) | yes: a request with a 5th image is HTTP 400 |
| image size | model default (up to 16.7 MP) | `max_pixels` 1,048,576 (`K8V4_MAX_IMAGE_PIXELS`) | yes: a 1920x1080 screenshot is 1,027 prompt tokens vs 2,059 on prod (downscaled) |
| max concurrent sequences | 8 | 4 | no (Turnstone runs at most 4) |

What our template fix does (`/opt/b70/inline_system_template.py` in our image): Qwen3.8's template raises
"System message must be at the beginning." for any later system message; vLLM's Anthropic endpoint probes the
template with [system, user, system, user] and, when it raises, merges every inline system message (Claude
Code's per-turn reminders) into the leading system prompt, so the prompt prefix changes every turn and the
whole conversation is re-prefilled. The fix renders them in place. It also maps `high` -> `xhigh` and
`minimal` -> `low`. Swift's `chat_template_low.jinja` is the same template with the default effort changed
to low, so it has the same two behaviours; our fixer's effort anchor is the `xhigh` default line, so the new
`chat_template_fix.py` matches any of the three defaults.

## Knobs (all off by default; unset, the launch command is byte-identical)

| knob | effect |
|---|---|
| `K8V4_CHAT_TEMPLATE_KWARGS` | JSON object -> `--default-chat-template-kwargs` (ours: `{"reasoning_effort":"medium"}`) |
| `K8V4_PROMPT_TOKENS_DETAILS=1` | `--enable-prompt-tokens-details` |
| `K8V4_HTTP_KEEP_ALIVE=<s>` | `VLLM_HTTP_TIMEOUT_KEEP_ALIVE` (ours: 300) |
| `K8V4_CHAT_TEMPLATE_FIX=1` | container entrypoint `python3 -I k8v4_v030/chat_template_fix.py --serve`: writes the fixed copy of `/model/chat_template.jinja` and execs `vllm serve ... --chat-template <it>`; both edits are anchored and an unknown template is refused (launch.sh also checks the host template first) |
| existing `K8V4_MAX_IMAGES`, `K8V4_MAX_IMAGE_PIXELS` | raise to match prod if agents send many or large screenshots |

Tests: `k8v4_v030/tests/test_launch_profiles.py` (default command unchanged, pass-through, bad values
refused), `k8v4_v030/tests/test_chat_template_fix.py` (both templates; with jinja2 the fixed template renders
byte-identically for every accepted effort and for conversations without inline system messages).

## Measured (`bench/api_compat.py`, one exp2 window each, port 8002; prod on 8001 for reference)

Config A of the all-034 integration (`K8V4_W4A8_LAYERS=all K8V4_W4A8_KERNEL=onednn`, draft vocab,
`K8V4_ONEDNN_DETERMINISTIC=1`, ...), image `k8v4-up:all034-575ee85`, tree `b70/test-parity-addnorm-034`.

| check | prod -27 | theirs, knobs unset (parA) | theirs + 4 knobs (parB) |
|---|---|---|---|
| tools auto / required / named, tool-result turn | pass | pass | pass |
| json_schema, json_object | pass | pass | pass |
| streamed tool calls (2 calls, args JSON, finish tool_calls) + usage chunk | pass | pass | pass |
| thinking on / off (`enable_thinking`) | pass | pass | pass |
| 4 concurrent streamed requests with thinking + tools | pass (7.1 s) | pass (7.7 s) | pass (6.8 s) |
| rendered default effort (no kwargs) | medium | **low** | medium |
| effort high / minimal | 200 (xhigh / low) | **400** | 200 (xhigh / low) |
| inline system message | 200 | **400** | 200 |
| second identical 4,935-token prompt: `cached_tokens` | 4,864 | **null** | 4,224 |
| connection reused after 8 s idle | ok | **RemoteDisconnected** | ok |
| 5 images in one request | 200 | **400** | 400 (needs `K8V4_MAX_IMAGES`) |
| 1920x1080 image, prompt tokens | 2,059 | 1,027 | 1,027 (needs `K8V4_MAX_IMAGE_PIXELS`) |

(The cached count differs because the prefix-cache hit granularity differs: prod matches in 64-token units
(`--prefix-match-unit 64`); this stack's hit was 4,224 tokens, one prefill chunk. Not investigated further.) The top-level `reasoning_effort` request field
reaches the template on both stacks.

## What Turnstone actually needs

Turnstone sends an explicit effort on every call (settings: medium for users, low for the judge and task
lane; `[low, medium, xhigh]` declared, so it never sends high), folds mid-conversation system turns, and
streams. With their defaults it works (every functional check passes); the visible differences for it are
`cached_tokens` (its cache statistics), the 5 s keep-alive (pooled-connection errors after idle gaps), and
the image limits (Playwright screenshots). Recommended for our agents:

```
K8V4_CHAT_TEMPLATE_KWARGS='{"reasoning_effort":"medium"}' K8V4_PROMPT_TOKENS_DETAILS=1 \
K8V4_HTTP_KEEP_ALIVE=300 K8V4_CHAT_TEMPLATE_FIX=1
```

plus `K8V4_MAX_IMAGES` / `K8V4_MAX_IMAGE_PIXELS` if image-heavy agent sessions matter (prod defaults: no
practical count limit, model-default resolution; both cost KV and prefill time).

None of these knobs touches the engine's numerics; speed is unaffected (the API flags only change request
handling; the template fix changes rendered prompts only for inputs the stock template rejects).
