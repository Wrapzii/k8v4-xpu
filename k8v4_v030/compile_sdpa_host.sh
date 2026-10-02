#!/bin/bash
# Build only host glue against the serving image's matching SYCL ABI.
# Does not compile device kernels or replace the native decode library.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
IMAGE=${K8V4_SDPA_BUILD_IMAGE:-vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2}
mkdir -p "$ROOT/build"
docker run --rm --memory=1200m --memory-swap=3g --network none --entrypoint bash \
  -v "$HERE/native:/src:ro" -v "$ROOT/build:/out" "$IMAGE" -lc '
set -euo pipefail
TORCH=/opt/venv/lib/python3.12/site-packages/torch
test -f /opt/venv/include/sycl/sycl.hpp
test -f /opt/venv/lib/libsycl.so.9
test -f /opt/k8v4/libdnnl.so.3
g++ -O2 -fPIC -shared -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1 \
  -Wno-deprecated-declarations \
  -I/opt/venv/include -I"$TORCH/include" -I"$TORCH/include/torch/csrc/api/include" \
  -I/usr/include/python3.12 /src/k8v4_sdpa.cpp -o /out/libk8v4_sdpa_host.so \
  -L"$TORCH/lib" -L/opt/venv/lib -L/opt/k8v4 -Wl,--no-as-needed \
  -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -ltorch_python \
  -l:libdnnl.so.3 /opt/venv/lib/libsycl.so.9 \
  -Wl,-rpath,/opt/k8v4 -Wl,-rpath,/opt/venv/lib \
  -Wl,-rpath,/opt/venv/lib/python3.12/site-packages/torch/lib
'
sha256sum "$ROOT/build/libk8v4_sdpa_host.so"
