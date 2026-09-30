#!/bin/bash
# Build build/libxe2_kv.so. Does not use the GPU and does not define a stamp build.
# On a 12 GB host, stop the model server first. The container is capped at 2200 MB.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
mkdir -p "$ROOT/build"
docker run --rm --memory=2200m --memory-swap=7g --entrypoint bash \
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
nice -n 19 "$ICPX" -O2 -fsycl -fPIC -shared -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1 \
  -Wno-deprecated-declarations \
  -I"$TORCH/include" -I"$TORCH/include/torch/csrc/api/include" -I"$PY" \
  /src/xe2_kv_ops.cpp -o /out/libxe2_kv.so \
  -L"$TORCH/lib" -L/opt/venv/lib \
  -Wl,--no-as-needed \
  -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -ltorch_python \
  /opt/venv/lib/libsycl.so.9 \
  -Wl,-rpath,/opt/venv/lib -Wl,-rpath,/opt/venv/lib/python3.12/site-packages/torch/lib
'
sha256sum "$ROOT/build/libxe2_kv.so"
echo "Measured serving library: 0b7e2dc92262b1778aadefc8ab71e484408d6b6e90ccb8641616ee078f92623a"
echo "A rebuild can hash differently. The build still succeeds."
echo DECODE_COMPILE_OK
