#!/bin/bash
# Build vllm-openai-xpu:v0.30.0-k8v4 from the compiled libraries.
# Does not start a server and does not retag the stock image.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
SO=${1:-$ROOT/build/libxe2_kv.so}
SDPA=${2:-$ROOT/build/libk8v4_sdpa.so}
DNNL=${3:-$ROOT/build/libdnnl.so.3}
test -f "$SO"
test -f "$SDPA"
test -f "$DNNL"
STAGE=$(mktemp -d)
cleanup() { rm -rf "$STAGE"; }
trap cleanup EXIT
cp -a "$ROOT/k8v4_v030" "$STAGE/k8v4_v030"
rm -rf "$STAGE/k8v4_v030/__pycache__" "$STAGE/k8v4_v030/tests/__pycache__" "$STAGE/k8v4_v030/mtp-tree"
cp "$SO" "$STAGE/libxe2_kv.so"
cp "$SDPA" "$STAGE/libk8v4_sdpa.so"
cp "$DNNL" "$STAGE/libdnnl.so.3"
cp "$HERE/Dockerfile" "$STAGE/Dockerfile"
docker build -t vllm-openai-xpu:v0.30.0-k8v4 "$STAGE"
docker image inspect vllm-openai-xpu:v0.30.0-k8v4 --format '{{.Id}}'
