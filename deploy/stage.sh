#!/bin/bash
# Stage the attn-profile package next to the live one. Copies only: does not
# touch the running container, its image, or the live mount source.
set -euo pipefail
SRC=${SRC:-$HOME/agent-work/k8v4-attnprof-20261104}
LIVE=/mnt/hdd-500gb/model-validation/launch80-20261013/perf-cascade-deploy-20261015/k8v4-opt
D=/mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104
[ -e "$D" ] && { echo "refusing: $D exists"; exit 1; }
mkdir -p "$D/k8v4-opt" "$D/receipts" "$HOME/ops/vllm-telemetry/attn-profile"
# Start from an exact copy of the live package, then lay the two changed/new files on top.
rsync -a --exclude=__pycache__ "$LIVE/k8v4_v030" "$D/k8v4-opt/"
diff -u "$LIVE/k8v4_v030/backend.py" "$SRC/k8v4_v030/backend.py" > "$D/receipts/backend.diff" || true
cp -p "$SRC/k8v4_v030/backend.py" "$SRC/k8v4_v030/attn_profile.py" "$D/k8v4-opt/k8v4_v030/"
cp -p "$SRC/k8v4_v030/tests/test_attn_profile.py" "$D/k8v4-opt/k8v4_v030/tests/"
chmod -R a+rX "$D"
# Only backend.py may differ from live (besides the new files).
diff -rq --exclude=__pycache__ "$LIVE/k8v4_v030" "$D/k8v4-opt/k8v4_v030" | tee "$D/receipts/diff-vs-live.txt"
(cd "$D" && sha256sum k8v4-opt/k8v4_v030/backend.py k8v4-opt/k8v4_v030/attn_profile.py > receipts/sha256.txt)
docker inspect vllm-k8v4-tp2 > "$D/receipts/docker-inspect-before.json"
echo "staged at $D"
