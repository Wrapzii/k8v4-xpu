#!/bin/bash
# Build libxe2_qsa.so. Does not replace libxe2_kv.so, does not use the GPU,
# and does not start or modify the serving container.
# Output goes to the QSA build directory on the large disk.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
OUT=${QSA_OUT:-$ROOT/build/qsa}
TOOL=${QSA_ICPX_ROOT:-/opt/intel}
IMAGE=${QSA_BUILD_IMAGE:-vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2}
mkdir -p "$OUT" "$OUT/tmp"
test -x "$TOOL/oneapi/compiler/2026.0/bin/icpx"
# Temps stay on the large disk. The cap stays under the serving process.
docker run --rm --network none --memory=1800m --memory-swap=4g --entrypoint bash \
  -v "$TOOL":/opt/intel-2026:ro \
  -v "$ROOT/k8v4_v030/native":/src:ro \
  -v "$OUT":/out \
  -v "$OUT/tmp":/tmp \
  -e TMPDIR=/tmp \
  "$IMAGE" -lc '
set -euo pipefail
export TMPDIR=/tmp
ICPX=/opt/intel-2026/oneapi/compiler/2026.0/bin/icpx
test -x "$ICPX"
LIBDIR=$(cd "$(dirname "$ICPX")/../lib" && pwd)
export LD_LIBRARY_PATH="${LIBDIR}:/opt/venv/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
"$ICPX" --version
TORCH=/opt/venv/lib/python3.12/site-packages/torch
PY=/usr/include/python3.12
NICE=
if command -v nice >/dev/null 2>&1; then NICE="nice -n 19"; fi
compile() {
  local extra="$1"
  local dest="$2"
  # shellcheck disable=SC2086
  $NICE "$ICPX" -O2 -fsycl -fPIC -shared -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1 \
    -Wno-deprecated-declarations $extra \
    -I"$TORCH/include" -I"$TORCH/include/torch/csrc/api/include" -I"$PY" \
    /src/qsa_xpu.cpp -o "$dest" \
    -L"$TORCH/lib" -L/opt/venv/lib \
    -Wl,--no-as-needed \
    -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -ltorch_python \
    /opt/venv/lib/libsycl.so.9 \
    -Wl,-rpath,/opt/venv/lib -Wl,-rpath,/opt/venv/lib/python3.12/site-packages/torch/lib
}
if compile "" /out/libxe2_qsa.so; then
  echo QSA_COMPILE_ESIMD_OK
else
  echo "ESIMD build failed; retrying without the ESIMD header"
  compile "-DQSA_NO_ESIMD" /out/libxe2_qsa.so
  echo QSA_COMPILE_NO_ESIMD_OK
fi
rm -rf /tmp/icpx-* /tmp/core* || true
'
ls -l "$OUT/libxe2_qsa.so"
sha256sum "$OUT/libxe2_qsa.so"
echo QSA_COMPILE_OK
