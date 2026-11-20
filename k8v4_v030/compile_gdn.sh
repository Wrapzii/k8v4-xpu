#!/bin/bash
# Build build/libgdn_attn_kernels_xe_2.so: the GDN kernel library of the
# vllm-xpu-kernels release the compile image's vLLM ships (0.1.14.1 for vLLM
# 0.30, 0.1.17 for vLLM 0.34; the source commit is pinned per release) with the
# head-parallel chunk_compute_A / chunk_compute_wu schedule from
# native/gdn_heads_patch.py. Short prefills (agent turns, <2K tokens) spend
# ~30 ms per request in two GDN kernels that run on a handful of work-groups;
# the patch removes that without changing any output bit.
# K8V4_GDN_HEADS=1 in launch.sh mounts the result over the image's copy.
#
# Does not use the GPU. Needs network: it clones vllm-xpu-kernels at the
# pinned commit and CMake fetches sycl-tla. One icpx job peaks near 18 GB of
# container memory, so the default is one job under a 20g cap; 2-3 min on a 24-core host.
# K8V4_GDN_PATCH=0 builds the unpatched library instead (the control for the
# bit-identity check, tools/gdn_exact_v030.py), as
# build/libgdn_attn_kernels_xe_2.stock-rebuild.so.
# K8V4_GDN_AOT overrides the AOT device list (default bmg-g31-a0: B70/B65).
# K8V4_COMPILE_IMAGE: vLLM base + oneAPI 2026.x at /opt/intel-2026/oneapi
# (default k8v4-compile-2026, Dockerfile.compile); it must match the image served.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
COMPILE_IMAGE=${K8V4_COMPILE_IMAGE:-k8v4-compile-2026}
PATCH=${K8V4_GDN_PATCH:-1}
AOT=${K8V4_GDN_AOT:-bmg-g31-a0}
JOBS=${K8V4_GDN_BUILD_JOBS:-1}
MEM=${K8V4_GDN_BUILD_MEMORY:-20g}
[[ "$PATCH" =~ ^[01]$ ]] || { echo "K8V4_GDN_PATCH must be 0 or 1" >&2; exit 2; }
[[ "$JOBS" =~ ^[1-9][0-9]*$ ]] || { echo "K8V4_GDN_BUILD_JOBS must be a positive integer" >&2; exit 2; }
[[ "$AOT" =~ ^[a-z0-9,-]+$ ]] || { echo "K8V4_GDN_AOT must be a comma-separated device list" >&2; exit 2; }
OUT=libgdn_attn_kernels_xe_2.so
[ "$PATCH" = 1 ] || OUT=libgdn_attn_kernels_xe_2.stock-rebuild.so
mkdir -p "$ROOT/build"
docker run --rm --memory="$MEM" --memory-swap="$MEM" --entrypoint bash \
  -e PATCH="$PATCH" -e AOT="$AOT" -e JOBS="$JOBS" -e OUT="$OUT" \
  -v "$ROOT/k8v4_v030/native:/src:ro" \
  -v "$ROOT/build:/out" \
  "$COMPILE_IMAGE" -lc '
set -euo pipefail
have=$(/opt/venv/bin/python -c "import importlib.metadata as m; print(m.version(\"vllm-xpu-kernels\"))")
case "$have" in
  0.1.14.1) XK_COMMIT=6d92b1bfbf32767ecda8e819613eb151e70030ad ;;  # tag 0.1.14.1 (vLLM 0.30)
  0.1.17) XK_COMMIT=6a1ec18b69b00eaf67a457e0bdd40e72632feaae ;;    # tag v0.1.17 (vLLM 0.34)
  *) echo "no pinned vllm-xpu-kernels source for installed version $have" >&2; exit 1 ;;
esac
echo "vllm-xpu-kernels $have -> $XK_COMMIT"
CMPLR_ROOT=""
for c in /opt/intel-2026/oneapi/compiler/2026.1 /opt/intel-2026/oneapi/compiler/2026.0 /opt/intel-2026/oneapi/compiler/latest; do
  if [ -x "$c/bin/icpx" ]; then CMPLR_ROOT=$c; break; fi
done
test -n "$CMPLR_ROOT"
export CMPLR_ROOT PATH="$CMPLR_ROOT/bin:$PATH"
export VLLM_XPU_AOT_DEVICES="$AOT" VLLM_XPU_XE2_AOT_DEVICES="$AOT"
icpx --version | head -1
git clone -q https://github.com/vllm-project/vllm-xpu-kernels.git /w/xk
git -C /w/xk checkout -q "$XK_COMMIT"
if [ "$PATCH" = 1 ]; then /opt/venv/bin/python -I /src/gdn_heads_patch.py /w/xk; fi
cd /w/xk
cmake -S . -B /w/build -G Ninja -DCMAKE_BUILD_TYPE=Release -DVLLM_TARGET_DEVICE=xpu \
  -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain.cmake -DVLLM_PYTHON_EXECUTABLE=/opt/venv/bin/python \
  -DVLLM_XPU_ENABLE_XE3P=OFF -DVLLM_XPU_ENABLE_ONEDNN=OFF -DVLLM_XPU_ENABLE_XE_DEFAULT=OFF -DBASIC_KERNELS_ENABLED=OFF -DMOE_KERNELS_ENABLED=OFF \
  -DGDN_KERNELS_ENABLED=ON -DMQA_LOGITS_KERNELS_ENABLED=OFF -DMHC_KERNELS_ENABLED=OFF \
  -DXPU_SPECIFIC_KERNELS_ENABLED=OFF -DXPUMEM_ALLOCATOR_ENABLED=OFF -DFA2_KERNELS_ENABLED=OFF > /w/cmake.log \
  || { tail -40 /w/cmake.log; exit 1; }
nice -n 19 ninja -C /w/build -j "$JOBS" gdn_attn_kernels_xe_2
cp /w/build/libgdn_attn_kernels_xe_2.so "/out/$OUT"
'
sha256sum "$ROOT/build/$OUT"
echo GDN_COMPILE_OK
