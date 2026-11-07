#!/bin/bash
cd /home/dan/agent-work/k8v4-qsa || exit 1
exec /home/dan/.local/bin/grok --always-approve --cwd /home/dan/agent-work/k8v4-qsa "$(cat /home/dan/agent-work/k8v4-qsa/results/qsa/grok-qsa-prompt.txt)"
