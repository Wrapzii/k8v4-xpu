#!/bin/bash
# swap.sh <name-for-current> <container-to-make-live>
set -euo pipefail
docker stop -t 30 vllm-k8v4-tp2
docker update --restart=no vllm-k8v4-tp2
docker rename vllm-k8v4-tp2 "$1"
docker rename "$2" vllm-k8v4-tp2
docker update --restart=unless-stopped vllm-k8v4-tp2
docker start vllm-k8v4-tp2
echo started $(date -u +%T)
