#!/bin/bash
# CPU-only throwaway build container; host oneAPI mounted read-only.
cd ~/agent-work/k8v4-attnprof-20261104/kstudy
docker run --rm --entrypoint bash -v /opt/intel/oneapi:/opt/intel/oneapi:ro -v $PWD:/k \
 vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 -c '
source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1
T=/opt/venv/lib/python3.12/site-packages/torch
icpx -O2 -fsycl -fsycl-targets=spir64_gen -Xs "-device bmg-g21" -fPIC -shared -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1 \
 -I$T/include -I$T/include/torch/csrc/api/include -I/usr/include/python3.12 \
 /k/src/xe2_kv_ops_mp.cpp -o /k/out-mp/libxe2_kv_mp_aot.so \
 -L$T/lib -L/opt/venv/lib -Wl,--no-as-needed -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -ltorch_python /opt/venv/lib/libsycl.so.9 -Wl,-rpath,$T/lib -Wl,-rpath,/opt/venv/lib 2>&1 | grep -v "^In file included\|warning:\|^ *[0-9]* |\|^ *|\|note:" | tail -40
ls -la /k/out-mp'
