#!/bin/bash
# Step 1 pipeline: build mp lib, correctness, then bench prod vs mp VPP=1/2/4/8 (same sweep harness as broad.jsonl).
cd ~/agent-work/k8v4-attnprof-20261104
PROD=/mnt/hdd-500gb/model-validation/launch80-20261013/perf-cascade-deploy-20261015/libxe2_kv_cascade.so
MP=$PWD/kstudy/out-mp/libxe2_kv_mp_jit.so
kstudy/build_mp_jit.sh xe2_kv_ops_mp.cpp libxe2_kv_mp_jit.so 2>&1 | tail -2
sha256sum kstudy/src/xe2_kv_ops_mp.cpp $MP tools/k8v4_mp_check.py tools/k8v4_kernel_sweep.py $PROD > results/mp/sha256-step1.txt
C=1000,2048,2085,4160,32768,32868,131072,131135,204800,204863
LIB=$MP results/mp/run_lib.sh k8v4_mp_check.py --tag mp --ctx $C > results/mp/mpcheck-mp.log 2>&1; echo check rc=$?
uptime > results/mp/load-step1.txt
for rep in 1 2; do
 for cfg in prod:1 mp:1 mp:2 mp:4 mp:8; do
  n=${cfg%%:*}; p=${cfg##*:}; [ $n = prod ] && L=$PROD || L=$MP
  echo "$(date -u +%T) rep$rep $cfg load=$(cut -d' ' -f1 /proc/loadavg)" >> results/mp/load-step1.txt
  LIB=$L VPP=$p results/mp/run_lib.sh k8v4_kernel_sweep.py --ctx 2048,32768,131072,204800 --batch 1,2,4 --qlen 1,7 --pf16 1 --iters 40 --out /out/bench-$n-vpp$p-r$rep.jsonl > results/mp/bench-$n-vpp$p-r$rep.log 2>&1
  echo "  rc=$?" >> results/mp/load-step1.txt
 done
done
echo STEP1_DONE >> results/mp/load-step1.txt
