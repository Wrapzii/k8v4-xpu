#!/bin/bash
# usage: LIB=... gpubench.sh <script> <args...>
# Serialized GPU run (flock), CI hold via Face CI_HOLD flag (time-limited), Hermes Face
# bench-hold (pauses agent boots/resumes/new runs; max 4h), disk guard, rerun if CI
# appeared. Never mask the runner. On exit: release bench-hold; clear CI hold and start
# runner again (unless KEEP_CI_HOLD=1) so open PRs get CI between benchmark runs.
# Daniel's manual Face chats are not gated — keep fastloop contamination sentinel/retry.
set -euo pipefail
cd ~/agent-work/k8v4-attnprof-20261104
LOG=results/mp/ci-stopped-session.txt
HOLD_FILE="${FACE_CI_HOLD_FILE:-$HOME/hermes-face/data/CI_HOLD}"
HOLD_HOURS="${CI_HOLD_HOURS:-2}"
BENCH_HOLD_BIN="${BENCH_HOLD_BIN:-$HOME/.local/bin/bench-hold}"
# Max 4h per Face bench-hold; default match CI hold window (hours -> minutes, capped).
BENCH_HOLD_MINUTES="${BENCH_HOLD_MINUTES:-$(( HOLD_HOURS * 60 ))}"
if [ "$BENCH_HOLD_MINUTES" -gt 240 ]; then BENCH_HOLD_MINUTES=240; fi
BENCH_HOLD_REASON="${BENCH_HOLD_REASON:-k8v4 gpu bench}"
BENCH_HOLD_WAIT_IDLE="${BENCH_HOLD_WAIT_IDLE:-120}"
BENCH_HOLD_ACQUIRED=0

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

bench_hold_acquire() {
  if [ ! -x "$BENCH_HOLD_BIN" ]; then
    echo "$(date -u +%FT%TZ) gpubench: bench-hold binary missing at $BENCH_HOLD_BIN (skip)" | tee -a "$LOG" >&2
    return 0
  fi
  "$BENCH_HOLD_BIN" acquire "$BENCH_HOLD_MINUTES" "$BENCH_HOLD_REASON" --by k8v4 | tee -a "$LOG"
  BENCH_HOLD_ACQUIRED=1
  # Pauses Hermes agent boots; manual Face chats still run — wait for vLLM/Face idle.
  if ! "$BENCH_HOLD_BIN" wait-idle "$BENCH_HOLD_WAIT_IDLE"; then
    echo "$(date -u +%FT%TZ) gpubench: bench-hold wait-idle timed out after ${BENCH_HOLD_WAIT_IDLE}s (continuing; sentinel/retry still active)" | tee -a "$LOG" >&2
  else
    echo "$(date -u +%FT%TZ) gpubench: bench-hold wait-idle ok" >> "$LOG"
  fi
}

bench_hold_release() {
  if [ "$BENCH_HOLD_ACQUIRED" != "1" ]; then
    return 0
  fi
  if [ ! -x "$BENCH_HOLD_BIN" ]; then
    return 0
  fi
  "$BENCH_HOLD_BIN" release | tee -a "$LOG" || true
  BENCH_HOLD_ACQUIRED=0
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

on_exit() {
  bench_hold_release
  ci_hold_clear_and_restart
}
trap 'on_exit' EXIT

exec 9>/tmp/k8v4-gpu.lock; flock 9
for attempt in 1 2 3; do
  u=$(df --output=pcent / | tail -1 | tr -dc 0-9); [ "$u" -gt 90 ] && { echo "ABORT root ${u}%" >&2; exit 3; }
  ci_stop >/dev/null
  bench_hold_acquire
  results/mp/run_lib.sh "$@"; rc=$?
  n=$(docker ps --format '{{.Names}}' | grep -cE '^(FORGEJO-ACTIONS-TASK|wrapzii-server-runner$|forgejo-runner$)' || true)
  if [ "$n" -eq 0 ]; then exit "$rc"; fi
  echo "$(date -u +%FT%TZ) gpubench: CI containers ($n) appeared during run attempt $attempt -> contaminated, rerun" | tee -a "$LOG" >&2
  # release before re-acquire on next attempt
  bench_hold_release
done
exit 4
