# How to hold Hollow CI for a GPU / cleanup session

Face's watchdog only treats a CI stop as a deliberate hold when
`~/hermes-face/data/CI_HOLD` exists with a future `until=<unix-epoch>` line.
Masking or stopping `forge-runner-hdd.service` without that file is not a hold:
the watchdog unmasks and restarts the runner, then re-runs killed jobs
(`ci_hold_killed`).

## Request a hold

```bash
HOLD_FILE=~/hermes-face/data/CI_HOLD
UNTIL=$(date -u -d '+2 hours' +%s)
printf 'until=%s\ncreated=%s\nby=%s\nreason=%s\n' \
  "$UNTIL" "$(date -u +%s)" "k8v4-my-session" "gpu bench" > "$HOLD_FILE"

# Then stop the runner (do NOT systemctl mask):
sudo -n systemctl stop forge-runner-hdd.service
docker ps --format '{{.Names}}' | grep '^FORGEJO-ACTIONS-TASK' | xargs -r docker stop -t 20
```

Or use `gpubench.sh` (sets the flag via `CI_HOLD_HOURS`, default 2, before stopping).
On exit it clears the flag and starts the runner again so open PRs get CI between runs.

## Release early / between runs

```bash
rm -f ~/hermes-face/data/CI_HOLD
sudo -n systemctl unmask --runtime forge-runner-hdd.service 2>/dev/null || true
sudo -n systemctl start forge-runner-hdd.service
```

When `until` passes with no flag refresh, the watchdog clears the hold itself (unmask+start).

Also: `results/mp/ci_hold.sh acquire 2 trackH 'gpu'` / `release`.

