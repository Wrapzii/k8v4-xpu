#!/bin/bash
# usage: run.sh <outname> <sweep args...>
OUT=$1; shift
cd ~/agent-work/k8v4-attnprof-20261104
timeout 1500 docker run --rm --device /dev/dri:/dev/dri --group-add 992 --ipc=host --entrypoint python3 \
  -v /mnt/hdd-500gb/model-validation/launch80-20261013/perf-cascade-deploy-20261015/libxe2_kv_cascade.so:/opt/k8v4/libxe2_kv.so:ro \
  -v /mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/k8v4-opt:/opt/k8v4-casc:ro \
  -v $PWD/tools:/tools:ro -v $PWD/results/kernel:/out \
  -e PYTHONPATH=/opt/k8v4-casc -e XE2_KV_LIB=/opt/k8v4/libxe2_kv.so \
  -e XE2_KV_S2_NSG=32 -e XE2_KV_S2_NSG_DRAFT=32 -e XE2_KV_S2_NSG_VERIFY=${NSGV:-8} -e XE2_KV_COMPACT_SLM=${CSLM:-1} -e XE2_KV_SMALL_S1=${SMALLS1:-1} -e XE2_KV_S2_TWO_PASS=0 \
  vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 /tools/k8v4_kernel_sweep.py --out /out/$OUT.jsonl "$@"
