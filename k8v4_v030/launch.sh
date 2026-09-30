#!/bin/bash
# Serve Qwen3.8-27B GPTQ INT4 with the K8/V4 stack on vLLM 0.30 XPU.
# Two GPUs, tensor parallel 2. Does not stop other containers.
# Current defaults: four sequences, full model context, split draft/verify merge settings.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
IMAGE=${IMAGE:-vllm-openai-xpu:v0.30.0-k8v4}
NAME=${NAME:-vllm-k8v4-tp2}
PORT=${PORT:-8200}
BIND_HOST=${BIND_HOST:-127.0.0.1}
SERVED_NAME=${SERVED_NAME:-Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8}
MODEL_DIR=${MODEL_DIR:-}
CACHE=${K8V4_CACHE:-$ROOT/.cache/vllm-k8v4}
TEMPLATE=${CHAT_TEMPLATE:-$ROOT/templates/chat_template.jinja}
MAX_MODEL_LEN=${K8V4_MAX_MODEL_LEN:-262144}
MAX_SEQS=${K8V4_MAX_SEQS:-4}
GPU_UTIL=${K8V4_GPU_MEMORY_UTILIZATION:-0.95}
[[ "$MAX_SEQS" =~ ^[1-9][0-9]*$ ]] || { echo "K8V4_MAX_SEQS must be a positive integer" >&2; exit 2; }
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
if ! command -v docker >/dev/null 2>&1; then
  echo "docker is required" >&2
  exit 2
fi

if dmesg -T 2>/dev/null | grep -q 'CAT error'; then
  echo "WARN: dmesg already contains a CAT error. Old faults are not fatal. A new GPU fault means stop and power-cycle the guest." >&2
fi

render_gid=$(stat -c '%g' /dev/dri/renderD* 2>/dev/null | sort -u | head -n1 || true)
if [ -z "${render_gid}" ]; then
  echo "No /dev/dri render node found." >&2
  exit 2
fi

if command -v xpu-smi >/dev/null 2>&1; then
  for dev in 0 1; do
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

extra=()
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

docker run -d --name "$NAME" --restart=no \
  --device /dev/dri --group-add "$render_gid" --ipc=host --shm-size=8g \
  -p "${BIND_HOST}:${PORT}:8000" \
  -v /dev/dri:/dev/dri \
  -v /dev/dri/by-path:/dev/dri/by-path:ro \
  -v "${MODEL_DIR}:/model:ro" \
  -v "${TEMPLATE}:/model/chat_template.jinja:ro" \
  -v "${CACHE}:/root/.cache/vllm" \
  "${extra[@]}" \
  -e PYTHONPATH=/opt/k8v4 \
  -e XE2_KV_LIB=/opt/k8v4/libxe2_kv.so \
  -e K8V4_SDPA_LIB=/opt/k8v4/libk8v4_sdpa.so \
  -e K8V4_PREFILL="${K8V4_PREFILL:-onednn}" \
  -e K8V4_PREFILL_GEMM="${K8V4_PREFILL_GEMM:-w4a8}" \
  -e XE2_KV_S2_NSG="${XE2_KV_S2_NSG:-32}" \
  -e XE2_KV_S2_NSG_DRAFT="${XE2_KV_S2_NSG_DRAFT:-32}" \
  -e XE2_KV_S2_NSG_VERIFY="${XE2_KV_S2_NSG_VERIFY:-8}" \
  -e XE2_KV_S2_TWO_PASS="${XE2_KV_S2_TWO_PASS:-0}" \
  -e B70_MTP_BF16_DRAFT=1 \
  -e B70_WORKER_AFFINITY=1 \
  -e CCL_SYCL_ALLREDUCE_LL=twoshots \
  -e CCL_SYCL_ALLREDUCE_SIMPLE_READ=1 \
  -e CCL_SYCL_COPY_ENGINE=1 \
  -e CCL_SYCL_ALLREDUCE_SIMPLE_THRESHOLD=4294967296 \
  -e CCL_SYCL_REDUCE_SCATTER_SIMPLE_THRESHOLD=4294967296 \
  -e CCL_SYCL_ALLGATHERV_SIMPLE_THRESHOLD=4294967296 \
  -e CCL_SYCL_ALLTOALL_TMP_BUF=1 \
  -e HF_HUB_OFFLINE=1 \
  -e TRANSFORMERS_OFFLINE=1 \
  -e PYTORCH_ALLOC_CONF=expandable_segments:True \
  -e VLLM_TARGET_DEVICE=xpu \
  -e VLLM_XPU_ENABLE_XPU_GRAPH=1 \
  -e ZE_AFFINITY_MASK=0,1 \
  -e ZE_FLAT_DEVICE_HIERARCHY=COMPOSITE \
  "$IMAGE" \
  /model \
  --host=0.0.0.0 \
  --port=8000 \
  --served-model-name="$SERVED_NAME" \
  --gpu-memory-utilization="$GPU_UTIL" \
  --dtype=bfloat16 \
  --max-model-len="$MAX_MODEL_LEN" \
  --kv-cache-dtype=int8_k_int4_v \
  --tensor-parallel-size=2 \
  --max-num-seqs="$MAX_SEQS" \
  --max-num-batched-tokens="${K8V4_MAX_BATCHED_TOKENS:-4224}" \
  --enable-auto-tool-choice \
  --tool-call-parser=qwen3_xml \
  --reasoning-parser=qwen3 \
  --enable-prefix-caching \
  --language-model-only \
  --trust-remote-code \
  --speculative-config='{"method":"mtp","num_speculative_tokens":6}' \
  --compilation-config="{\"cudagraph_mode\":\"FULL_DECODE_ONLY\",\"cudagraph_capture_sizes\":$CAPTURE_SIZES}"

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
