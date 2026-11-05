#!/bin/bash
# Step 1 bench resume (build + correctness already done: lib f2411faf). Disk guard: abort if / > 95%.
cd ~/agent-work/k8v4-attnprof-20261104
PROD=/mnt/hdd-500gb/model-validation/launch80-20261013/perf-cascade-deploy-20261015/libxe2_kv_cascade.so
MP=$PWD/kstudy/out-mp/libxe2_kv_mp_jit.so
LOG=results/mp/load-step1.txt
for rep in 1 2; do
 for cfg in prod:1 mp:1 mp:2 mp:4 mp:8; do
  u=$(df --output=pcent / | tail -1 | tr -dc 0-9); if [ $u -gt 95 ]; then echo "ABORT root ${u}%" >> $LOG; exit 3; fi
  n=${cfg%%:*}; p=${cfg##*:}; [ $n = prod ] && L=$PROD || L=$MP
  echo "$(date -u +%T) rep$rep $cfg load=$(cut -d' ' -f1 /proc/loadavg) root=${u}%" >> $LOG
  LIB=$L VPP=$p results/mp/run_lib.sh k8v4_kernel_sweep.py --ctx 2048,32768,131072,204800 --batch 1,2,4 --qlen 1,7 --pf16 1 --iters 40 --out /out/bench-$n-vpp$p-r$rep.jsonl > results/mp/bench-$n-vpp$p-r$rep.log 2>&1
  echo "  rc=$?" >> $LOG
 done
done
echo STEP1_DONE >> $LOG
