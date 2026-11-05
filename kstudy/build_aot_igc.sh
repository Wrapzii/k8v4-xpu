#!/bin/bash
# AOT bmg-g21 build with IGC dumps (spill/GRF report). usage: build_aot_igc.sh <src.cpp> <tag>
SRC=$1; TAG=$2
H=/mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/aot-$TAG; rm -rf $H; mkdir -p $H/igc
T=/mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/toolchain-oneapi-2026/opt-intel
cd ~/agent-work/k8v4-attnprof-20261104/kstudy
u=$(df --output=pcent / | tail -1 | tr -dc 0-9); [ $u -gt 90 ] && { echo ABORT root $u; exit 3; } # TMPDIR_GUARD
docker run --rm -v /mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/tmp:/tmp -e TMPDIR=/tmp --memory=6g --entrypoint bash -v $T:/opt/intel:ro -v $PWD/src:/src:ro -v $H:/out \
 -e IGC_ShaderDumpEnable=1 -e IGC_DumpToCustomDir=/out/igc vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 -c "
source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1; T=/opt/venv/lib/python3.12/site-packages/torch
nice -n 19 icpx -O2 -fsycl -fsycl-targets=spir64_gen -Xs '-device bmg-g21' -fPIC -shared -std=c++17 -D_GLIBCXX_USE_CXX11_ABI=1 -Wno-deprecated-declarations \
 -I\$T/include -I\$T/include/torch/csrc/api/include -I/usr/include/python3.12 /src/$SRC -o /out/lib.so \
 -L\$T/lib -L/opt/venv/lib -Wl,--no-as-needed -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -ltorch_python /opt/venv/lib/libsycl.so.9 2>&1 | grep -i error | head"
cd $H/igc; for f in *.asm; do k=$(grep -m1 -o "//.kernel [^ ]*" $f); case "$k" in *PagedReuse*|*S2Parallel*) echo "$k | $(grep -m1 'numGRF' $f | grep -o 'numGRF=[0-9]*') | $(grep -m1 -iE '//\.spill size' $f) | $(grep -m1 instCount $f)";; esac; done | sed 's/.*Xe2KvTorchAbi//' | sort -u > $H/kernel-resources.txt
cat $H/kernel-resources.txt; rm -rf $H/igc/*.ll
