"""Refuse runner startup if its dedicated ext4 disk or free-space reserve is missing."""
import argparse
from pathlib import Path
import shutil
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--mount', default='/mnt/hdd-500gb')
    parser.add_argument('--uuid', required=True)
    parser.add_argument('--minimum-gib', type=float, default=10)
    args = parser.parse_args()
    root = Path(args.mount)
    if args.minimum_gib <= 0 or root.is_symlink() or not root.is_mount():
        raise RuntimeError('Dedicated runner disk is not mounted')
    found = subprocess.check_output(['findmnt', '-n', '-o', 'UUID,FSTYPE', '--mountpoint', str(root)], text=True).split()
    if found != [args.uuid, 'ext4']:
        raise RuntimeError('Unexpected runner storage disk or filesystem')
    for path in (root, Path('/')):
        free = shutil.disk_usage(path).free / 1024**3
        if free < args.minimum_gib:
            raise RuntimeError(f'{path}: only {free:.2f} GiB free; runner startup refused')
        print(f'{path}: {free:.2f} GiB free')


if __name__ == '__main__':
    main()
