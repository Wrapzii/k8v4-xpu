#!/bin/bash
# usage: LIB=<host .so> run_lib.sh <script> <args...>   (throwaway container, GPU visible via /dev/dri, card 0 used)
cd ~/agent-work/k8v4-attnprof-20261104
S=$1; shift
timeout 2400 docker run --rm --device /dev/dri:/dev/dri --group-add 992 --ipc=host --entrypoint python3 \
  -v ${LIB:?}:/opt/k8v4/libxe2_kv.so:ro \
  -v /mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/k8v4-opt:/opt/k8v4-casc:ro \
  -v $PWD/tools:/tools:ro -v $PWD/results/mp:/out \
  -e PYTHONPATH=/opt/k8v4-casc -e XE2_KV_LIB=/opt/k8v4/libxe2_kv.so \
  -e XE2_KV_S2_NSG=32 -e XE2_KV_S2_NSG_DRAFT=32 -e XE2_KV_S2_NSG_VERIFY=8 -e XE2_KV_COMPACT_SLM=1 -e XE2_KV_SMALL_S1=1 -e XE2_KV_S2_TWO_PASS=0 \
  -e PYTHONFAULTHANDLER=1 -e SYCL_PROGRAM_COMPILE_OPTIONS -e XE2_KV_VERIFY_MP_IMPL=${MPIMPL:-2} -e XE2_KV_VERIFY_PAGES=${VPP:-1} \
  vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 /tools/$S "$@"
