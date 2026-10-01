# Swift 1.5 AutoRound trial

The October 1 candidate uses [ukisai/Swift-1.5-Qwen3.8-27b-W4A16-AutoRound](https://huggingface.co/ukisai/Swift-1.5-Qwen3.8-27b-W4A16-AutoRound), pinned to revision `278de52d4252d0b7c0ea01833d1403cd386c65ef`. Weights are not included in this repository. The upstream license and notices remain in the downloaded checkpoint.

## Loader compatibility

This export declares `auto-round` with `auto_round:auto_gptq` packing, 4-bit symmetric weights and group size 128. The installed vLLM 0.30 XPU stack loads the same packing through its GPTQ configuration. The adaptation:

- Checks all 400 quantized linears and their packed symmetric zero points. Each stored zero-point nibble is 7, which GPTQ decodes as zero point 8.
- Adds deterministic `g_idx` tensors (`input_index // 128`) because the upstream export omits them. Activation ordering remains disabled.
- Replaces loader metadata with GPTQ metadata and preserves exclusions for dense vision, MTP, and GDN `in_proj_a` / `in_proj_b` modules.
- Preserves every original weight payload. The output head, MTP head and embedding remain dense; this is not the Launch80 head/MTP/INT8-embedding bake.
- Produces a copy of Swift's chat template with low as the unspecified-effort default. Hermes can override it with low or medium.

On a fresh, fully downloaded checkpoint directory:

```bash
python3 tools/prepare_swift_autoround.py /path/to/swift-checkpoint
MODEL_DIR=/path/to/swift-checkpoint \
CHAT_TEMPLATE=/path/to/swift-checkpoint/chat_template_low.jinja \
SERVED_NAME=Swift-1.5-Qwen3.8-27b-AutoRound-GPTQ-compat \
bash k8v4_v030/launch.sh
```

Run the compatibility tool once. It retains upstream config/index backups and records the adaptation in `COMPATIBILITY.json`. Use a separate checkpoint directory; do not modify the previous serving checkpoint.

## Runtime settings and capacity

The trial retains TP2, K8/V4 KV, MTP6, `FULL_DECODE_ONLY` graphs, a 262,144-token request window, four active sequences, prefix caching and image support. Startup reports 749,485 tokens of shared KV capacity (2.86 full request windows). Four histories near the half-window compression threshold fit within that reported pool; four fully occupied 262K requests do not. No four-client saturation test was run for Swift.

The earlier vision-enabled bake reported 830,415 shared tokens. This difference is expected to include the trial's denser special weights; it is not a controlled attribution of memory usage. The published coding curves still describe the original Qwen bake, not Swift.

## Validation and rollback

Startup selected `XPUwNa16LinearKernel` and the K8/V4 attention backend, loaded the model, compiled the backbone and MTP head, initialized vision kernels, and completed graph capture. The API became healthy at approximately 07:39 UTC on October 1. Cold startup took about 20 minutes with concurrent Rust builds and substantial host swapping; startup latency is not a decode benchmark.

Three small endpoint checks passed: medium-thinking arithmetic returned 4, low-thinking recognition of a red image returned red, and a low-thinking tool request produced a parsed `server_probe` call with the expected JSON arguments. Both low and medium produced reasoning output. MTP acceptance counters were nonzero during these checks. No new performance benchmark or quality-parity claim is made.

Local Hermes and the server's shared provider configuration now select Swift. The server Wrapzii profile and local `local` profile default to it, with low thinking. Native Hermes transport checks passed for low and medium on both machines. Wrapzii's gateway was restarted; the room, Compose and Luna gateways, and the CI runner remained active. Compose and Luna's other default providers were retained.

Production retains the old checkpoint and stopped container for rollback. The previous Qwen model ID is temporarily an API alias for Swift, so existing sessions can continue while their model labels are refreshed. New Hermes sessions use Swift's primary served ID and default to low thinking. To roll back, restore the previous serving launch and Hermes configuration backups before restarting the old container.
