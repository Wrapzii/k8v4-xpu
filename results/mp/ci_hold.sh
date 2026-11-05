#!/bin/bash
# Request or release a time-limited Hollow CI hold (Face data/CI_HOLD).
# Usage:
#   ci_hold.sh acquire [hours] [by] [reason]   # default 2h; then stop runner (no mask)
#   ci_hold.sh release                        # clear flag, unmask, start runner
set -euo pipefail
HOLD_FILE="${FACE_CI_HOLD_FILE:-$HOME/hermes-face/data/CI_HOLD}"
LOG="${CI_HOLD_LOG:-$HOME/agent-work/k8v4-attnprof-20261104/results/mp/ci-stopped-session.txt}"
cmd=${1:-}
case "$cmd" in
  acquire|set|hold)
    hours=${2:-2}; by=${3:-manual}; reason=${4:-manual CI hold}
    until=$(date -u -d "+${hours} hours" +%s 2>/dev/null || python3 -c "import time; print(int(time.time()+${hours}*3600))")
    mkdir -p "$(dirname "$HOLD_FILE")"
    printf 'until=%s\ncreated=%s\nby=%s\nreason=%s\n' "$until" "$(date -u +%s)" "$by" "$reason" > "$HOLD_FILE"
    echo "$(date -u +%FT%TZ) ci_hold: acquire until=$until by=$by" | tee -a "$LOG"
    # stop only (never mask)
    for c in $(docker ps --format '{{.Names}}' | grep -E '^(FORGEJO-ACTIONS-TASK|wrapzii-server-runner$|forgejo-runner$)' || true); do
      docker stop -t 20 "$c" >/dev/null 2>&1 || true
      echo "$(date -u +%FT%TZ) ci_hold: docker stop $c" >> "$LOG"
    done
    sudo -n systemctl stop forge-runner-hdd.service >/dev/null 2>&1 || true
    echo "$(date -u +%FT%TZ) ci_hold: systemctl stop forge-runner-hdd.service" >> "$LOG"
    ;;
  release|clear)
    rm -f "$HOLD_FILE"
    if [ -L /run/systemd/system/forge-runner-hdd.service ]; then
      sudo -n systemctl unmask --runtime forge-runner-hdd.service >/dev/null 2>&1 || true
    fi
    sudo -n systemctl reset-failed forge-runner-hdd.service >/dev/null 2>&1 || true
    sudo -n systemctl start forge-runner-hdd.service >/dev/null 2>&1 || true
    echo "$(date -u +%FT%TZ) ci_hold: release + start forge-runner-hdd.service" | tee -a "$LOG"
    ;;
  *)
    echo "usage: $0 acquire [hours] [by] [reason] | release" >&2; exit 2;;
esac
