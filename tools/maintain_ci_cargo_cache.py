"""Bound disposable CI artifacts while retaining dependency/build caches.

Linux only. Defaults to dry-run. With --apply, pauses the idle runner before
rechecking jobs/processes and taking Cargo's target-directory advisory lock.
Under low disk space, linked executables may be discarded and relinked next job.
Never deletes libraries, sources, model files, or whole target directories.
"""
import argparse
from contextlib import ExitStack
import fcntl
import json
import os
from pathlib import Path
import re
import shutil
import signal
import subprocess
import time

VOLUME = 'wrapzii-cargo-target-ai01'
RUNNER = 'wrapzii-server-runner'
ROOT = Path('/var/lib/docker/volumes') / VOLUME / '_data'
GIB = 1024**3
ARTIFACT = re.compile(r'^(.*)-([0-9a-f]{16})$')

def docker(*args):
    return subprocess.check_output(['docker', *args], text=True, timeout=30).strip()

def active_build():
    names = docker('ps', '--format', '{{.Names}}').splitlines()
    if any(n.startswith('FORGEJO-ACTIONS-TASK') for n in names):
        return 'active CI job'
    for proc in Path('/proc').iterdir():
        if not proc.name.isdigit():
            continue
        try:
            comm = (proc / 'comm').read_text().strip()
        except FileNotFoundError:
            continue
        if comm in {'cargo', 'rustc', 'rustup', 'ld', 'ld.lld', 'sccache'}:
            return 'active build process'
        for link in (proc / 'exe', proc / 'cwd'):
            try:
                value = os.readlink(link)
            except FileNotFoundError:
                continue
            if value == str(ROOT) or value.startswith(str(ROOT) + '/'):
                return 'process using Cargo target'
    return None

def safe_file(path, root):
    return not path.is_symlink() and path.is_file() and path.resolve().is_relative_to(root)

def candidates(root, now, min_age=3600, keep=2):
    """Only duplicate hash-named ELF executables; keep newest variants."""
    groups = {}
    for folder in (root / 'debug/deps', root / 'release/deps'):
        if not folder.is_dir() or folder.is_symlink():
            continue
        for file in folder.iterdir():
            match = ARTIFACT.fullmatch(file.name)
            if not match or not safe_file(file, root):
                continue
            stat = file.stat()
            if not stat.st_mode & 0o111 or stat.st_nlink != 1:
                continue
            with file.open('rb') as reader:
                if reader.read(4) != b'\x7fELF':
                    continue
            groups.setdefault((folder, match[1]), []).append((stat.st_mtime, file, stat.st_size))
    result = []
    for values in groups.values():
        values.sort(reverse=True)
        for modified, file, size in values[keep:]:
            # Inspecting executable headers does not affect this mtime gate.
            if now - modified >= min_age:
                result.append((modified, file, file.stat().st_blocks * 512))
    return sorted(result)

def main():
    # Preserve the finally/unpause path on systemd stop or timeout.
    def terminate(signum, frame):
        raise SystemExit(128 + signum)
    signal.signal(signal.SIGTERM, terminate)
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--apply', action='store_true')
    p.add_argument('--max-gib', type=float, default=60)
    p.add_argument('--target-gib', type=float, default=50)
    p.add_argument('--reserve-gib', type=float, default=40)
    a = p.parse_args()
    if not 0 < a.target_gib < a.max_gib or a.reserve_gib <= 0:
        raise ValueError('Invalid thresholds')
    root = ROOT.resolve(strict=True)
    if ROOT.is_symlink() or root != ROOT or docker('volume', 'inspect', VOLUME, '--format', '{{.Mountpoint}}') != str(root):
        raise RuntimeError('Unexpected Cargo volume path')
    if not any((root / name).is_file() for name in ('.rustc_info.json', 'CACHEDIR.TAG')):
        raise RuntimeError('Missing Cargo cache marker')
    with Path('/run/lock/ai01-cargo-cache.lock').open('w') as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            print('Deferred: another maintenance run')
            return
        reason = active_build()
        if reason:
            print('Deferred:', reason)
            return
        paused = False
        try:
            if a.apply:
                status = docker('inspect', RUNNER, '--format', '{{.State.Status}} {{.State.Paused}}')
                if status != 'running false':
                    print('Deferred: runner not in expected running state')
                    return
                docker('pause', RUNNER)
                paused = True
                # A poll may have dispatched just before pause. Recheck.
                reason = active_build()
                if reason:
                    print('Deferred after dispatch check:', reason)
                    return
            with ExitStack() as cargo_locks:
                try:
                    # Lock each profile, including current fine-grained locks.
                    for profile in ('debug', 'release'):
                        directory = root / profile
                        if not directory.is_dir() or directory.is_symlink():
                            continue
                        for name in ('.cargo-lock', '.cargo-build-lock', '.cargo-artifact-lock'):
                            cargo_lock = cargo_locks.enter_context((directory / name).open('a'))
                            fcntl.flock(cargo_lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                except BlockingIOError:
                    print('Deferred: Cargo target is locked')
                    return
                total = int(subprocess.check_output(['du', '-s', '-B1', str(root)], text=True).split()[0])
                free = shutil.disk_usage(root).free
                if total <= a.max_gib * GIB and free >= a.reserve_gib * GIB:
                    print(json.dumps({'action': 'none', 'cache_gib': round(total/GIB, 2), 'free_gib': round(free/GIB, 2)}))
                    return
                emergency = free < a.reserve_gib * GIB
                plan = candidates(root, time.time(), min_age=0, keep=0) if emergency else candidates(root, time.time())
                reclaimed = 0
                removed = 0
                for _, file, size in plan:
                    if total - reclaimed <= a.target_gib * GIB and free + reclaimed >= a.reserve_gib * GIB:
                        break
                    if a.apply:
                        if not safe_file(file, root):
                            raise RuntimeError('Candidate path changed')
                        if file.stat().st_nlink != 1:
                            continue
                        file.unlink()
                    reclaimed += size
                    removed += 1
                print(json.dumps({'action': 'applied' if a.apply else 'dry_run',
                    'cache_gib_before': round(total/GIB, 2), 'free_gib_before': round(free/GIB, 2),
                    'duplicate_executables': removed, 'reclaimable_gib': round(reclaimed/GIB, 2),
                    'budget_met_estimate': total-reclaimed <= a.target_gib*GIB and free+reclaimed >= a.reserve_gib*GIB,
                    'emergency': emergency,
                    'policy': ('low-space: discard linked executables; preserve libraries/incremental/build/fingerprints' if emergency else 'retain newest two variants per executable name; minimum age one hour; preserve all libraries/incremental/build/fingerprints')}))
                if a.apply and shutil.disk_usage(root).free < a.reserve_gib * GIB:
                    # Do not admit another job when the allowlist cannot make space.
                    docker('stop', '--time', '30', RUNNER)
                    paused = False
                    raise RuntimeError('Insufficient disk reserve after cleanup; runner stopped. Reclaim storage, then start runner explicitly.')
        finally:
            if paused:
                docker('unpause', RUNNER)

if __name__ == '__main__':
    main()
