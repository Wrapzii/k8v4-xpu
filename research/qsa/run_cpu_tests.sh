#!/bin/bash
# CPU unit tests inside the vLLM XPU image. Does not take the Arc GPUs.
# Do not add --device=/dev/dri, --gpus, or any other device flag.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/../.." && pwd)"
IMAGE="${QSA_IMAGE:-vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2}"
LOG="${QSA_LOG:-/mnt/hdd-500gb/model-validation/qsa-train/logs/xpu-port.log}"
mkdir -p "$(dirname "$LOG")"

{
  echo "=== CPU unit tests $(date -Is) image=${IMAGE} ==="
  docker run --rm --network none \
    -v "${REPO}:/work:ro" \
    -e QSA_DEVICE=cpu \
    -e PYTHONPATH=/work/research \
    -e PYTHONDONTWRITEBYTECODE=1 \
    -e HOME=/tmp \
    --entrypoint python3 \
    "${IMAGE}" \
    /work/research/qsa/run_tests.py
  echo "=== CPU unit tests done $(date -Is) ==="
} 2>&1 | tee -a "${LOG}"
