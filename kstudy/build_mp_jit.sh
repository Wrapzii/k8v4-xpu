#!/bin/bash
# JIT build: oneAPI DPC++ 2026.0 (apt, installed under toolchain-oneapi-2026), matching the image's libsycl.so.9
# (/opt/venv/include) so the .so binds to libsycl.so.9 ABI like the production lib. CPU only.
set -euo pipefail
cd ~/agent-work/k8v4-attnprof-20261104/kstudy
SRC=${1:-xe2_kv_ops_mp.cpp}; OUT=${2:-libxe2_kv_mp_jit.so}
u=$(df --output=pcent / | tail -1 | tr -dc 0-9); [ $u -gt 90 ] && { echo ABORT root $u; exit 3; } # TMPDIR_GUARD
docker run --rm -v /mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/tmp:/tmp -e TMPDIR=/tmp --memory=2500m --memory-swap=6g --entrypoint bash -v /mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/toolchain-oneapi-2026/opt-intel:/opt/intel:ro -v $PWD/src:/src:ro -v /mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/mp-libs:/out \
 vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 -c "
source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1
T=/opt/venv/lib/python3.12/site-packages/torch
nice -n 19 icpx -O2 -fsycl -fPIC -shared -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1 -Wno-deprecated-declarations \
  -I\$T/include -I\$T/include/torch/csrc/api/include -I/usr/include/python3.12 \
  /src/$SRC -o /out/$OUT -L\$T/lib -L/opt/venv/lib -Wl,--no-as-needed \
  -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -ltorch_python /opt/venv/lib/libsycl.so.9 \
  -Wl,-rpath,/opt/venv/lib -Wl,-rpath,\$T/lib 2>&1 | grep -E 'error' | head -20
ldd /out/$OUT | grep -i 'sycl\|not found'
"
sha256sum /mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/mp-libs/$OUT; nm -D --undefined-only /mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/mp-libs/$OUT | c++filt | grep "exception::exception"
