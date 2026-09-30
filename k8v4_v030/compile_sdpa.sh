#!/bin/bash
# Build build/libk8v4_sdpa.so and copy libdnnl.so.3 beside it.
# Does not rebuild the decode library and does not use the GPU.
# On a 12 GB host, stop the model server first.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
mkdir -p "$ROOT/build"
docker run --rm --memory=1200m --memory-swap=3g --entrypoint bash \
  -v "$ROOT/k8v4_v030/native:/src:ro" \
  -v "$ROOT/build:/out" \
  k8v4-compile-2026 -lc '
set -euo pipefail
ICPX=""
for c in /opt/intel-2026/oneapi/compiler/2026.0/bin/icpx /opt/intel-2026/oneapi/compiler/latest/bin/icpx; do
  if [ -x "$c" ]; then ICPX=$c; break; fi
done
test -n "$ICPX"
LIBDIR=$(cd "$(dirname "$ICPX")/../lib" && pwd)
export LD_LIBRARY_PATH="${LIBDIR}${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
"$ICPX" --version
TORCH=/opt/venv/lib/python3.12/site-packages/torch
PY=/usr/include/python3.12
DNNL_INC=""
for c in /opt/intel-2026/oneapi/dnnl/latest/include /opt/intel/oneapi/dnnl/latest/include "$TORCH/include"; do
  if [ -f "$c/oneapi/dnnl/dnnl_graph.hpp" ]; then DNNL_INC=$c; break; fi
done
test -n "$DNNL_INC"
DNNL_LIB=""
for c in "$TORCH/lib" /opt/venv/lib /opt/intel-2026/oneapi/dnnl/latest/lib /opt/intel/oneapi/dnnl/latest/lib; do
  if [ -e "$c/libdnnl.so" ] || [ -e "$c/libdnnl.so.3" ]; then DNNL_LIB=$c; break; fi
done
test -n "$DNNL_LIB"
echo "DNNL_INC $DNNL_INC"
echo "DNNL_LIB $DNNL_LIB"
nice -n 19 "$ICPX" -O2 -fsycl -fPIC -shared -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1 \
  -Wno-deprecated-declarations \
  -I"$TORCH/include" -I"$TORCH/include/torch/csrc/api/include" -I"$PY" -I"$DNNL_INC" \
  /src/k8v4_sdpa.cpp -o /out/libk8v4_sdpa.so \
  -L"$TORCH/lib" -L/opt/venv/lib -L"$DNNL_LIB" \
  -Wl,--no-as-needed \
  -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -ltorch_python -ldnnl \
  /opt/venv/lib/libsycl.so.9 \
  -Wl,-rpath,/opt/k8v4 -Wl,-rpath,/opt/venv/lib -Wl,-rpath,/opt/venv/lib/python3.12/site-packages/torch/lib
cp -L "$DNNL_LIB/libdnnl.so.3" /out/libdnnl.so.3
'
sha256sum "$ROOT/build/libk8v4_sdpa.so" "$ROOT/build/libdnnl.so.3"
echo SDPA_COMPILE_OK
