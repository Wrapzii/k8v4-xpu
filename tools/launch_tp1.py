"""Portable Studio TP1 launch, with explicitly enabled KV-capacity fitting.

The shared launch.sh owns the flags. Only a stopped container reporting a
specific KV-capacity failure can trigger a smaller-context retry.
"""
from __future__ import annotations

import os
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CAPACITY_MARKERS = (
    'larger than the maximum number of tokens',
    'larger than the available kv cache memory',
    'not enough memory to hold',
    'no available memory for the cache',
    'maximum model length is too large',
)
FAULT_MARKERS = ('cat error', 'device lost', 'out of memory', 'sigsegv', 'segmentation fault')


def fitted_context(logs: str, requested: int) -> int | None:
    low = logs.lower()
    if any(marker in low for marker in FAULT_MARKERS):
        return None
    if not any(marker in low for marker in CAPACITY_MARKERS):
        return None
    estimates = re.findall(r'estimated maximum model length is\s+(\d+)', low)
    if not estimates:
        return None
    estimate = int(estimates[-1])
    return estimate if 8192 <= estimate < requested else None


def launch() -> int:
    env = dict(os.environ, K8V4_TP='1')
    fitting = env.get('K8V4_FIT_CONTEXT', '0')
    if fitting not in ('0', '1'):
        raise ValueError('K8V4_FIT_CONTEXT must be 0 or 1')
    context = int(env.get('K8V4_MAX_MODEL_LEN', '262144'))
    if context < 1:
        raise ValueError('K8V4_MAX_MODEL_LEN must be positive')
    name = env.get('NAME', 'vllm-k8v4-tp1')
    cache = Path(env.get('K8V4_CACHE', str(ROOT / '.cache/vllm-k8v4-tp1')))
    logs_dir = cache / 'startup'
    for attempt in range(3):
        env['K8V4_MAX_MODEL_LEN'] = str(context)
        result = subprocess.run([env.get('K8V4_BASH', 'bash'), str(ROOT / 'k8v4_v030/launch.sh')], env=env)
        if result.returncode == 0 or env.get('K8V4_DRY_RUN') == '1':
            return result.returncode
        if fitting == '0':
            return result.returncode
        logs = subprocess.run(['docker', 'logs', name], capture_output=True, text=True)
        combined = logs.stdout + logs.stderr
        logs_dir.mkdir(parents=True, exist_ok=True)
        log_path = logs_dir / ('tp1-start-%d.log' % context)
        log_path.write_text(combined, encoding='utf-8')
        state = subprocess.run(['docker', 'inspect', '-f', '{{.State.Running}}', name], capture_output=True, text=True)
        estimate = fitted_context(combined, context)
        if state.returncode or state.stdout.strip() != 'false' or estimate is None or attempt == 2:
            print('TP1 failed; inspect %s (no capacity retry)' % log_path, file=sys.stderr)
            return result.returncode
        print('TP1 context %d exceeds KV capacity; retrying at %d tokens. Log: %s' % (context, estimate, log_path), flush=True)
        context = estimate
    return 1


if __name__ == '__main__':
    try:
        raise SystemExit(launch())
    except (OSError, ValueError) as exc:
        print(str(exc), file=sys.stderr)
        raise SystemExit(1)
