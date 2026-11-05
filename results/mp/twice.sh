#!/bin/bash
# bench-hold is acquired/released inside gpubench.sh (not duplicated here).
# usage: twice.sh <tag> <lib1> <lib2> <variants> [ctx]  -- fast loop from two separate builds, separate processes.
# A variant is a WIN only if it beats the first (baseline) variant by >=3% in BOTH runs.
cd ~/agent-work/k8v4-attnprof-20261104; T=$1; L1=$2; L2=$3; V=$4; C=${5:-204800}
for i in 1 2; do L=$L1; [ $i = 2 ] && L=$L2
  LIB=$L results/mp/gpubench.sh k8v4_fastloop.py --ctx $C --variants $V --rounds 6 --drop 1.05 --out /out/fast/$T-$C-b$i.jsonl > results/mp/fast/$T-$C-b$i.log 2>&1; echo "build$i rc=$?"
done
python3 - "$T" "$C" <<'PY'
import json,sys,collections
T,C=sys.argv[1],sys.argv[2]; best=[]
for i in (1,2):
    d=collections.defaultdict(list)
    for ln in open(f"results/mp/fast/{T}-{C}-b{i}.jsonl"):
        r=json.loads(ln); d[r["name"]].append(r)
    best.append({k:min(v,key=lambda x:x["p50_us"]) for k,v in d.items()})
names=list(best[0]); base=names[0]
for n in names:
    a=best[0][n]; b=best[1].get(n)
    sa=best[0][base]["p50_us"]/a["p50_us"]; sb=(best[1][base]["p50_us"]/b["p50_us"]) if b else 0
    tag="WIN" if n!=base and sa>=1.03 and sb>=1.03 else ""
    print("%-10s b1=%7.1f (s1 %6.1f s2 %5.1f) x%.3f | b2=%s x%.3f maxabs_vs_base=%s %s"%(n,a["p50_us"],a["s1_us"],a["s2_us"],sa,("%7.1f"%b["p50_us"]) if b else "  dropped",sb,a.get("maxabs_vs_P1"),tag))
PY
