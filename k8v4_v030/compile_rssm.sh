#!/bin/bash
# Build build/libk8v4_rssm.so: the RecoverSSM spec-decode GDN verify kernel of vllm-xpu-kernels v0.1.17
# (csrc/xpu/gdn_attn/gated_delta_rule_recoverssm.hpp, Apache-2.0) as a standalone torch op
# (torch.ops._k8v4_rssm.verify, native/rssm/k8v4_rssm.cpp), with native/rssm/rssm_record_rows.py giving it
# an optional per-request replay row so the records need no row per state block.
# K8V4_GDN_RECOVERSSM=1 in launch.sh mounts the result (K8V4_RSSM_LIB overrides the path).
#
# Does not use the GPU. Needs network: it fetches the two kernel headers of vllm-xpu-kernels at the pinned
# commit. One small translation unit; about 5 minutes on one job.
# K8V4_COMPILE_IMAGE: vLLM 0.34 base + oneAPI 2026.x at /opt/intel-2026/oneapi (default k8v4-compile-2026:v034);
# it must match the image served (same torch).
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
COMPILE_IMAGE=${K8V4_COMPILE_IMAGE:-k8v4-compile-2026:v034}
AOT=${K8V4_RSSM_AOT:-bmg-g31-a0}
[[ "$AOT" =~ ^[a-z0-9,-]+$ ]] || { echo "K8V4_RSSM_AOT must be a comma-separated device list" >&2; exit 2; }
mkdir -p "$ROOT/build"
docker run --rm --memory=8g --memory-swap=8g --entrypoint bash -e AOT="$AOT" \
  -v "$ROOT/k8v4_v030/native/rssm:/src:ro" \
  -v "$ROOT/build:/out" \
  "$COMPILE_IMAGE" -lc '
set -euo pipefail
have=$(/opt/venv/bin/python -c "import importlib.metadata as m; print(m.version(\"vllm-xpu-kernels\"))")
[ "$have" = 0.1.17 ] || { echo "RecoverSSM needs the vLLM 0.34 image (vllm-xpu-kernels 0.1.17), found $have" >&2; exit 1; }
XK_COMMIT=6a1ec18b69b00eaf67a457e0bdd40e72632feaae  # tag v0.1.17
CMPLR_ROOT=""
for c in /opt/intel-2026/oneapi/compiler/2026.1 /opt/intel-2026/oneapi/compiler/2026.0 /opt/intel-2026/oneapi/compiler/latest; do
  if [ -x "$c/bin/icpx" ]; then CMPLR_ROOT=$c; break; fi
done
test -n "$CMPLR_ROOT"
export PATH="$CMPLR_ROOT/bin:$PATH"
LIBDIR=$(cd "$CMPLR_ROOT/lib" && pwd)
export LD_LIBRARY_PATH="${LIBDIR}${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
icpx --version | head -1
mkdir -p /w
git init -q /w/xk
git -C /w/xk remote add origin https://github.com/vllm-project/vllm-xpu-kernels.git
git -C /w/xk fetch -q --depth 1 origin "$XK_COMMIT"
git -C /w/xk checkout -q FETCH_HEAD
cp /w/xk/csrc/xpu/gdn_attn/gated_delta_rule.hpp /w/xk/csrc/xpu/gdn_attn/gated_delta_rule_recoverssm.hpp /w/
cp /src/k8v4_rssm.cpp /src/*.hpp /w/
/opt/venv/bin/python -I /src/rssm_record_rows.py /w/gated_delta_rule_recoverssm.hpp
T=/opt/venv/lib/python3.12/site-packages/torch
nice -n 19 icpx -fsycl -fsycl-targets=spir64_gen -Xs "-device $AOT" -O2 -fPIC -shared -std=c++20 \
  -D_GLIBCXX_USE_CXX11_ABI=1 -Wno-deprecated-declarations -I/w -I$T/include -I$T/include/torch/csrc/api/include \
  /w/k8v4_rssm.cpp -L$T/lib -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -Wl,-rpath,$T/lib -o /out/libk8v4_rssm.so
sha256sum /out/libk8v4_rssm.so
'
