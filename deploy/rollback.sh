#!/bin/bash
# Roll back to the pre-profile container kept by recreate_with_profile.py --apply.
set -euo pipefail
B=${1:?backup container name, e.g. vllm-k8v4-tp2-before-attnprof-<ts>}
docker inspect "$B" >/dev/null
docker stop -t 30 vllm-k8v4-tp2
docker rename vllm-k8v4-tp2 vllm-k8v4-tp2-attnprof-rolled-$(date +%Y%m%dT%H%M%S)
docker rename "$B" vllm-k8v4-tp2
docker update --restart=unless-stopped vllm-k8v4-tp2
docker start vllm-k8v4-tp2
until curl -s -m 5 127.0.0.1:8100/v1/models | grep -q '"object":"list"'; do sleep 10; done
docker exec vllm-k8v4-tp2 printenv VLLM_K8V4_PROFILE || echo "VLLM_K8V4_PROFILE unset (expected after rollback)"
