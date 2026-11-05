#!/bin/bash
# usage: LIB=... gpubench.sh <script> <args...>
# Serialized GPU run (flock), CI hold via Face CI_HOLD flag (time-limited), disk guard,
# rerun if CI appeared. Never mask the runner. On exit: clear hold and start runner again
# so open PRs get CI between benchmark runs.
set -euo pipefail
cd ~/agent-work/k8v4-attnprof-20261104
LOG=results/mp/ci-stopped-session.txt
HOLD_FILE="${FACE_CI_HOLD_FILE:-$HOME/hermes-face/data/CI_HOLD}"
HOLD_HOURS="${CI_HOLD_HOURS:-2}"

ci_hold_set() {
  local until by reason
  until=$(date -u -d "+${HOLD_HOURS} hours" +%s 2>/dev/null || python3 -c "import time; print(int(time.time()+${HOLD_HOURS}*3600))")
  by=${CI_HOLD_BY:-gpubench}
  reason=${CI_HOLD_REASON:-k8v4 gpu bench}
  mkdir -p "$(dirname "$HOLD_FILE")"
  printf 'until=%s\ncreated=%s\nby=%s\nreason=%s\n' "$until" "$(date -u +%s)" "$by" "$reason" > "$HOLD_FILE"
  echo "$(date -u +%FT%TZ) gpubench: CI_HOLD until=$until by=$by ($HOLD_HOURS h) file=$HOLD_FILE" >> "$LOG"
}

ci_hold_clear_and_restart() {
  if [ "${KEEP_CI_HOLD:-0}" = "1" ]; then
    echo "$(date -u +%FT%TZ) gpubench: KEEP_CI_HOLD=1 -> skip clear/restart" >> "$LOG"
    return 0
  fi
  rm -f "$HOLD_FILE"
  # Never leave a runtime mask behind
  if [ -L /run/systemd/system/forge-runner-hdd.service ]; then
    sudo -n systemctl unmask --runtime forge-runner-hdd.service >/dev/null 2>&1 || true
    echo "$(date -u +%FT%TZ) gpubench: unmask --runtime forge-runner-hdd.service" >> "$LOG"
  fi
  if ! systemctl is-active -q forge-runner-hdd.service 2>/dev/null; then
    sudo -n systemctl reset-failed forge-runner-hdd.service >/dev/null 2>&1 || true
    sudo -n systemctl start forge-runner-hdd.service >/dev/null 2>&1 || true
    echo "$(date -u +%FT%TZ) gpubench: systemctl start forge-runner-hdd.service (hold released)" >> "$LOG"
  fi
}

ci_stop() {
  # Hold flag first (watchdog honors it); then stop job + runner containers. Do NOT mask.
  ci_hold_set
  local n=0
  for c in $(docker ps --format '{{.Names}}' | grep -E '^(FORGEJO-ACTIONS-TASK|wrapzii-server-runner$|forgejo-runner$)' || true); do
    docker stop -t 20 "$c" >/dev/null 2>&1 || true
    echo "$(date -u +%FT%TZ) gpubench: docker stop $c" >> "$LOG"
    n=$((n+1))
  done
  if systemctl is-active -q forge-runner-hdd.service 2>/dev/null; then
    sudo -n systemctl stop forge-runner-hdd.service >/dev/null 2>&1 || true
    echo "$(date -u +%FT%TZ) gpubench: systemctl stop forge-runner-hdd.service" >> "$LOG"
  fi
  echo "$n"
}

# Always release CI when this wrapper exits (success, fail, or signal)
trap 'ci_hold_clear_and_restart' EXIT

exec 9>/tmp/k8v4-gpu.lock; flock 9
for attempt in 1 2 3; do
  u=$(df --output=pcent / | tail -1 | tr -dc 0-9); [ "$u" -gt 90 ] && { echo "ABORT root ${u}%" >&2; exit 3; }
  ci_stop >/dev/null
  results/mp/run_lib.sh "$@"; rc=$?
  n=$(docker ps --format '{{.Names}}' | grep -cE '^(FORGEJO-ACTIONS-TASK|wrapzii-server-runner$|forgejo-runner$)' || true)
  if [ "$n" -eq 0 ]; then exit "$rc"; fi
  echo "$(date -u +%FT%TZ) gpubench: CI containers ($n) appeared during run attempt $attempt -> contaminated, rerun" | tee -a "$LOG" >&2
done
exit 4
