#!/bin/bash
# Short XPU smoke of the same unit tests. Does not load 27B weights.
# Refuse to start while vLLM is serving on the Arc Pro B60s.
set -euo pipefail

if docker ps --format '{{.Names}}' | grep -qx 'vllm-k8v4-tp2'; then
  echo "refusing XPU smoke: container vllm-k8v4-tp2 is running and holds the Arc GPUs" >&2
  exit 2
fi

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
IMAGE="${QSA_IMAGE:-vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2}"
LOG="${QSA_LOG:-/mnt/hdd-500gb/model-validation/qsa-train/logs/xpu-port.log}"
mkdir -p "$(dirname "$LOG")"

{
  echo "=== XPU smoke $(date -Is) image=${IMAGE} ==="
  docker run --rm --network none \
    --device=/dev/dri \
    -e ZE_AFFINITY_MASK="${ZE_AFFINITY_MASK:-0}" \
    -v "${REPO}:/work:ro" \
    -e QSA_DEVICE=xpu \
    -e PYTHONPATH=/work/research \
    -e PYTHONDONTWRITEBYTECODE=1 \
    -e HOME=/tmp \
    --entrypoint python3 \
    "${IMAGE}" \
    /work/research/qsa/run_tests.py
  echo "=== XPU smoke done $(date -Is) ==="
} 2>&1 | tee -a "${LOG}"
