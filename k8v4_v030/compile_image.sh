#!/bin/bash
# Build the CPU compile image. The oneAPI base layer is large.
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
ROOT=$(cd "$HERE/.." && pwd)
docker build -f "$ROOT/Dockerfile.compile" -t k8v4-compile-2026 "$ROOT"
docker image inspect k8v4-compile-2026 --format '{{.Id}}'
