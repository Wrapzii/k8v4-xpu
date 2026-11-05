#!/bin/bash
# usage: LIB=... soak.sh <tag> <variant> : run one variant hot (~3000 calls/measure) and sample xpu-smi EU active/stall/idle + mem BW on GPU0
cd ~/agent-work/k8v4-attnprof-20261104; T=$1; V=$2
( sleep 1; sudo -n timeout 200 xpu-smi dump -d 0 -m 0,2,9,10,11,35 -i 1 -n 180 > results/mp/fast/soak-$T.xpusmi 2>&1 ) &
results/mp/gpubench.sh k8v4_fastloop.py --variants $V --rounds 1 --iters 20000 --drop 10 --out /out/fast/soak-$T.jsonl > results/mp/fast/soak-$T.log 2>&1
wait; cat results/mp/fast/soak-$T.xpusmi
