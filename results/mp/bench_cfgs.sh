#!/bin/bash
# usage: bench_cfgs.sh <tag> <reps> <cfg...>   cfg = name:lib:impl:vpp   (lib basename in mp-libs or 'prod')
cd ~/agent-work/k8v4-attnprof-20261104
PROD=/mnt/hdd-500gb/model-validation/launch80-20261013/perf-cascade-deploy-20261015/libxe2_kv_cascade.so
H=/mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/mp-libs
TAG=$1; REPS=$2; shift 2; D=results/mp/$TAG; mkdir -p $D; LOG=$D/load.txt
for rep in $(seq 1 $REPS); do for cfg in "$@"; do
  IFS=: read n lib impl p <<< "$cfg"
  u=$(df --output=pcent / | tail -1 | tr -dc 0-9); if [ $u -gt 95 ]; then echo "ABORT root ${u}%" >> $LOG; exit 3; fi
  [ $lib = prod ] && L=$PROD || L=$H/$lib
  # gate: wait (max 20 min) until vLLM has had 0 running requests for 3 consecutive 5 s samples
  ok=0; for w in $(seq 1 240); do vr=$(curl -s -m 2 localhost:8100/metrics | grep -m1 "^vllm:num_requests_running" | awk '{print $2}'); if [ "$vr" = "0.0" ]; then ok=$((ok+1)); else ok=0; fi; [ $ok -ge 3 ] && break; sleep 5; done
  echo "$(date -u +%T) rep$rep $cfg root=${u}% vllm_running=$vr" >> $LOG
  MPIMPL=$impl VPP=$p LIB=$L results/mp/run_lib.sh k8v4_kernel_sweep.py --ctx 2048,32768,131072,204800 --batch 1,2,4 --qlen 1,7 --pf16 1 --iters 40 --out /out/$TAG/$n-r$rep.jsonl > $D/$n-r$rep.log 2>&1
  rc=$?; vr=$(curl -s -m 2 localhost:8100/metrics | grep -m1 "^vllm:num_requests_running" | awk '{print $2}')
  echo "  rc=$rc vllm_running_after=$vr gen_tokens=$(curl -s -m 2 localhost:8100/metrics | grep -m1 '^vllm:generation_tokens_total' | awk '{print $2}')" >> $LOG
done; done
echo DONE >> $LOG
