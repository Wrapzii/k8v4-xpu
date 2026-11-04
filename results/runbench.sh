#!/bin/bash
cd ~/agent-work/k8v4-attnprof-20261104
for L in "$@"; do
  echo "== $L pre-metrics $(date -u +%T)"; curl -s -m 5 127.0.0.1:8100/metrics | grep -E "^vllm:num_requests_(running|waiting)"
  python3 -u tools/bench_overhead.py --label $L --ctx 2000,16000 --conc 1,4 --reps 2 --max-tokens 128 --out results
  echo "== $L post-metrics $(date -u +%T)"; curl -s -m 5 127.0.0.1:8100/metrics | grep -E "^vllm:num_requests_(running|waiting)"
done
