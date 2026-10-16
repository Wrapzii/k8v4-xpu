#!/bin/bash
# Serve Qwen3.8-27B GPTQ INT4 with the K8/V4 stack on vLLM 0.30 XPU.
# TP2 defaults are the measured deployment. K8V4_TP=1 selects the Studio profile.
# Does not stop containers other than the selected NAME.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
IMAGE=${IMAGE:-vllm-openai-xpu:v0.30.0-k8v4-unified}
TP=${K8V4_TP:-2}
case "$TP" in
  1)
    NAME=${NAME:-vllm-k8v4-tp1}
    PORT=${PORT:-8201}
    CACHE=${K8V4_CACHE:-$ROOT/.cache/vllm-k8v4-tp1}
    MAX_SEQS=${K8V4_MAX_SEQS:-1}
    GPU_UTIL=${K8V4_GPU_MEMORY_UTILIZATION:-0.92}
    DEVICES=${K8V4_DEVICES:-0}
    PREFIX_CACHING=${K8V4_PREFIX_CACHING:-0}
    CACHE_NAMESPACE=w4a8-tp1-v1
    DEFAULT_DTYPE=bfloat16
    DEFAULT_NATIVE_OPT=0
    ;;
  2)
    NAME=${NAME:-vllm-k8v4-tp2}
    PORT=${PORT:-8200}
    CACHE=${K8V4_CACHE:-$ROOT/.cache/vllm-k8v4}
    MAX_SEQS=${K8V4_MAX_SEQS:-4}
    GPU_UTIL=${K8V4_GPU_MEMORY_UTILIZATION:-0.95}
    DEVICES=${K8V4_DEVICES:-0,1}
    PREFIX_CACHING=${K8V4_PREFIX_CACHING:-1}
    CACHE_NAMESPACE=${K8V4_PREFILL_GEMM:-w4a8}-wired-v1
    DEFAULT_DTYPE=float16
    DEFAULT_NATIVE_OPT=1
    ;;
  *) echo "K8V4_TP must be 1 or 2" >&2; exit 2 ;;
esac
DRY_RUN=${K8V4_DRY_RUN:-0}
[[ "$DRY_RUN" =~ ^[01]$ && "$PREFIX_CACHING" =~ ^[01]$ ]] || {
  echo "K8V4_DRY_RUN and K8V4_PREFIX_CACHING must be 0 or 1" >&2; exit 2;
}
[[ "$DEVICES" =~ ^(0|[1-9][0-9]*)(,(0|[1-9][0-9]*))*$ ]] || {
  echo "K8V4_DEVICES must contain comma-separated GPU indices" >&2; exit 2;
}
IFS=, read -r -a devices <<< "$DEVICES"
if [ "${#devices[@]}" -ne "$TP" ] || { [ "$TP" = 2 ] && [ "${devices[0]}" = "${devices[1]}" ]; }; then
  echo "K8V4_DEVICES must select $TP distinct GPUs" >&2; exit 2
fi
BIND_HOST=${BIND_HOST:-127.0.0.1}
SERVED_NAME=${SERVED_NAME:-Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8}
MODEL_DIR=${MODEL_DIR:-}
TEMPLATE=${CHAT_TEMPLATE:-$ROOT/templates/chat_template.jinja}
MAX_MODEL_LEN=${K8V4_MAX_MODEL_LEN:-262144}
DTYPE=${K8V4_DTYPE:-$DEFAULT_DTYPE}
[[ "$DTYPE" = float16 || "$DTYPE" = bfloat16 ]] || { echo "K8V4_DTYPE must be float16 or bfloat16" >&2; exit 2; }
VISION=${K8V4_VISION:-1}
MAX_IMAGES=${K8V4_MAX_IMAGES:-4}
MAX_IMAGE_PIXELS=${K8V4_MAX_IMAGE_PIXELS:-1048576}
[[ "$VISION" =~ ^[01]$ ]] || { echo "K8V4_VISION must be 0 or 1" >&2; exit 2; }
[[ "$MAX_IMAGES" =~ ^[1-9][0-9]*$ && "$MAX_IMAGE_PIXELS" =~ ^[1-9][0-9]*$ ]] || { echo "Image limits must be positive integers" >&2; exit 2; }
multimodal=()
if [ "$VISION" = 1 ]; then
  multimodal+=(--limit-mm-per-prompt="{\"image\":$MAX_IMAGES,\"video\":0}")
  multimodal+=(--mm-processor-kwargs="{\"max_pixels\":$MAX_IMAGE_PIXELS}")
  multimodal+=(--mm-processor-cache-gb="${K8V4_MM_PROCESSOR_CACHE_GB:-0.125}")
else
  multimodal+=(--language-model-only)
fi
[[ "$MAX_SEQS" =~ ^[1-9][0-9]*$ ]] || { echo "K8V4_MAX_SEQS must be a positive integer" >&2; exit 2; }
[[ "$MAX_MODEL_LEN" =~ ^[1-9][0-9]*$ ]] || { echo "K8V4_MAX_MODEL_LEN must be a positive integer" >&2; exit 2; }
# MTP6 verifies seven tokens per sequence; capture each supported batch width.
CAPTURE_SIZES="["
for ((i=1; i<=MAX_SEQS; i++)); do
  if [ "$i" -gt 1 ]; then CAPTURE_SIZES+=","; fi
  CAPTURE_SIZES+=$((i * 7))
done
CAPTURE_SIZES+="]"

if [ -z "$MODEL_DIR" ] || [ ! -d "$MODEL_DIR" ]; then
  echo "Set MODEL_DIR to the local weights directory." >&2
  exit 2
fi
if [ ! -f "$TEMPLATE" ]; then
  echo "Missing chat template: $TEMPLATE" >&2
  exit 2
fi
if [ "$DRY_RUN" = 0 ] && ! command -v docker >/dev/null 2>&1; then
  echo "docker is required" >&2
  exit 2
fi

render_gid=0
if [ "$DRY_RUN" = 0 ]; then
  render_gid=$(stat -c '%g' /dev/dri/renderD* 2>/dev/null | sort -u | head -n1 || true)
fi
if [ -z "${render_gid}" ]; then
  echo "No /dev/dri render node found." >&2
  exit 2
fi

extra=()
prefix=()
if [ "$PREFIX_CACHING" = 1 ]; then
  prefix+=(--enable-prefix-caching)
else
  prefix+=(--no-enable-prefix-caching --mamba-cache-mode=none)
fi
if [ "$TP" = 2 ]; then
  extra+=(
    -e CCL_SYCL_ALLREDUCE_LL=twoshots
    -e CCL_SYCL_ALLREDUCE_SIMPLE_READ=1
    -e CCL_SYCL_COPY_ENGINE=1
    -e CCL_SYCL_ALLREDUCE_SIMPLE_THRESHOLD=4294967296
    -e CCL_SYCL_REDUCE_SCATTER_SIMPLE_THRESHOLD=4294967296
    -e CCL_SYCL_ALLGATHERV_SIMPLE_THRESHOLD=4294967296
    -e CCL_SYCL_ALLTOALL_TMP_BUF=1
  )
else
  # Keep the selected GPU separate from the card used by the image editor.
  extra+=(-e NEOReadDebugKeys=1 -e ForceZeDeviceCanAccessPerReturnValue=0)
fi
# Site-packages mounts are off unless a caller is logging MTP top-k.
# Leaving them unset keeps the drafter inside FULL_DECODE_ONLY graphs.
if [ -n "${MTP_PATCH_PROPOSER:-}" ]; then
  extra+=(-v "${MTP_PATCH_PROPOSER}:/workspace/vllm/vllm/v1/spec_decode/llm_base_proposer.py:ro")
  extra+=(-v "${MTP_PATCH_PROPOSER}:/opt/venv/lib/python3.12/site-packages/vllm/v1/spec_decode/llm_base_proposer.py:ro")
fi
if [ -n "${MTP_PATCH_SAMPLER:-}" ]; then
  extra+=(-v "${MTP_PATCH_SAMPLER}:/workspace/vllm/vllm/v1/sample/rejection_sampler.py:ro")
  extra+=(-v "${MTP_PATCH_SAMPLER}:/opt/venv/lib/python3.12/site-packages/vllm/v1/sample/rejection_sampler.py:ro")
fi
if [ -n "${MTP_PATCH_GPU_SPEC:-}" ]; then
  extra+=(-v "${MTP_PATCH_GPU_SPEC}:/workspace/vllm/vllm/v1/worker/gpu/spec_decode/speculator.py:ro")
  extra+=(-v "${MTP_PATCH_GPU_SPEC}:/opt/venv/lib/python3.12/site-packages/vllm/v1/worker/gpu/spec_decode/speculator.py:ro")
fi
if [ -n "${MTP_PATCH_AR_SPEC:-}" ]; then
  extra+=(-v "${MTP_PATCH_AR_SPEC}:/workspace/vllm/vllm/v1/worker/gpu/spec_decode/autoregressive/speculator.py:ro")
  extra+=(-v "${MTP_PATCH_AR_SPEC}:/opt/venv/lib/python3.12/site-packages/vllm/v1/worker/gpu/spec_decode/autoregressive/speculator.py:ro")
fi
if [ -n "${MTP_PATCH_GPU_REJECTION:-}" ]; then
  extra+=(-v "${MTP_PATCH_GPU_REJECTION}:/workspace/vllm/vllm/v1/worker/gpu/spec_decode/rejection_sampler.py:ro")
  extra+=(-v "${MTP_PATCH_GPU_REJECTION}:/opt/venv/lib/python3.12/site-packages/vllm/v1/worker/gpu/spec_decode/rejection_sampler.py:ro")
fi
if [ -n "${XE2_KV_LIB_MOUNT:-}" ]; then
  extra+=(-v "${XE2_KV_LIB_MOUNT}:/opt/k8v4/libxe2_kv.so:ro")
fi
if [ -n "${XE2_KV_S2_PARALLEL:-}" ]; then
  extra+=(-e "XE2_KV_S2_PARALLEL=${XE2_KV_S2_PARALLEL}")
fi
# Sub-group-parallel S1 for the 1-token draft is on by default; set 0 to disable.
if [ -n "${XE2_KV_SMALL_S1:-}" ]; then
  extra+=(-e "XE2_KV_SMALL_S1=${XE2_KV_SMALL_S1}")
fi

docker_cmd=(docker run -d --name "$NAME" --restart=no \
  --device /dev/dri --group-add "$render_gid" --ipc=host --shm-size=8g \
  -p "${BIND_HOST}:${PORT}:8000" \
  -v /dev/dri:/dev/dri \
  -v /dev/dri/by-path:/dev/dri/by-path:ro \
  -v "${MODEL_DIR}:/model:ro" \
  -v "${TEMPLATE}:/model/chat_template.jinja:ro" \
  -v "${CACHE}:/root/.cache/vllm" \
  -v "${HERE}:/opt/k8v4/k8v4_v030:ro" \
  "${extra[@]}" \
  -e PYTHONPATH=/opt/k8v4 \
  -e XE2_KV_LIB=/opt/k8v4/libxe2_kv.so \
  -e K8V4_SDPA_LIB=/opt/k8v4/libk8v4_sdpa.so \
  -e K8V4_PREFILL="${K8V4_PREFILL:-onednn}" \
  -e K8V4_PREFILL_GATHER="${K8V4_PREFILL_GATHER:-triton}" \
  -e K8V4_SDPA_ASYNC="${K8V4_SDPA_ASYNC:-0}" \
  -e K8V4_PREFILL_GEMM="${K8V4_PREFILL_GEMM:-w4a8}" \
  -e VLLM_CACHE_ROOT="${VLLM_CACHE_ROOT:-/root/.cache/vllm/$CACHE_NAMESPACE}" \
  -e XE2_KV_S2_NSG="${XE2_KV_S2_NSG:-32}" \
  -e XE2_KV_S2_NSG_DRAFT="${XE2_KV_S2_NSG_DRAFT:-32}" \
  -e XE2_KV_S2_NSG_VERIFY="${XE2_KV_S2_NSG_VERIFY:-8}" \
  -e XE2_KV_S2_TWO_PASS="${XE2_KV_S2_TWO_PASS:-0}" \
  -e XE2_KV_COMPACT_SLM="${XE2_KV_COMPACT_SLM:-$DEFAULT_NATIVE_OPT}" \
  -e XE2_KV_PARTIAL_FP16="${XE2_KV_PARTIAL_FP16:-$DEFAULT_NATIVE_OPT}" \
  -e XE2_KV_CASCADE="${XE2_KV_CASCADE:-$DEFAULT_NATIVE_OPT}" \
  -e B70_MTP_BF16_DRAFT=1 \
  -e B70_WORKER_AFFINITY=1 \
  -e HF_HUB_OFFLINE=1 \
  -e TRANSFORMERS_OFFLINE=1 \
  -e PYTORCH_ALLOC_CONF=expandable_segments:True \
  -e VLLM_TARGET_DEVICE=xpu \
  -e VLLM_XPU_ENABLE_XPU_GRAPH=1 \
  -e ZE_AFFINITY_MASK="$DEVICES" \
  -e ZE_FLAT_DEVICE_HIERARCHY=COMPOSITE \
  "$IMAGE" \
  /model \
  --host=0.0.0.0 \
  --port=8000 \
  --served-model-name="$SERVED_NAME" \
  --gpu-memory-utilization="$GPU_UTIL" \
  --dtype="$DTYPE" \
  --max-model-len="$MAX_MODEL_LEN" \
  --kv-cache-dtype=int8_k_int4_v \
  --tensor-parallel-size="$TP" \
  --max-num-seqs="$MAX_SEQS" \
  --max-num-batched-tokens="${K8V4_MAX_BATCHED_TOKENS:-4224}" \
  --enable-auto-tool-choice \
  --tool-call-parser=qwen3_xml \
  --reasoning-parser=qwen3 \
  "${prefix[@]}" \
  "${multimodal[@]}" \
  --trust-remote-code \
  --speculative-config='{"method":"mtp","num_speculative_tokens":6,"use_local_argmax_reduction":true}' \
  --compilation-config="{\"cudagraph_mode\":\"FULL_DECODE_ONLY\",\"cudagraph_capture_sizes\":$CAPTURE_SIZES}")

if [ "$DRY_RUN" = 1 ]; then
  # NUL-separated argv for inspection/tests; no Docker, clocks, cache or server changes.
  printf '%s\0' "${docker_cmd[@]}"
  exit 0
fi
if dmesg -T 2>/dev/null | grep -q 'CAT error'; then
  echo "WARN: dmesg already contains a CAT error. Old faults are not fatal. A new GPU fault means stop and power-cycle the guest." >&2
fi
if command -v xpu-smi >/dev/null 2>&1; then
  for dev in "${devices[@]}"; do
    xpu-smi config -d "$dev" --powerlimit 180 --powertype burst >/dev/null 2>&1 \
      || sudo -n xpu-smi config -d "$dev" --powerlimit 180 --powertype burst >/dev/null 2>&1 \
      || true
    xpu-smi config -d "$dev" -t 0 --frequencyrange 400,2400 >/dev/null 2>&1 \
      || sudo -n xpu-smi config -d "$dev" -t 0 --frequencyrange 400,2400 >/dev/null 2>&1 \
      || true
  done
fi
mkdir -p "$CACHE"
docker rm -f "$NAME" >/dev/null 2>&1 || true
"${docker_cmd[@]}"

echo "STARTED ${NAME}"
deadline=$((SECONDS + 2400))
until curl -sf "http://${BIND_HOST}:${PORT}/health" >/dev/null; do
  if [ "$SECONDS" -ge "$deadline" ]; then
    echo "health check timed out" >&2
    docker logs --tail 60 "$NAME" >&2 || true
    exit 1
  fi
  if ! docker ps --format '{{.Names}}' | grep -qx "$NAME"; then
    echo "container exited before health" >&2
    docker logs --tail 60 "$NAME" >&2 || true
    exit 1
  fi
  sleep 10
done
echo "READY http://${BIND_HOST}:${PORT}/v1"
