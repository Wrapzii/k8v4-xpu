"""No build or deletion: exercise the destructive-policy candidate allowlist."""
import os
from pathlib import Path
import tempfile
import time
from maintain_ci_cargo_cache import candidates

with tempfile.TemporaryDirectory() as temporary:
    root = Path(temporary).resolve()
    deps = root / 'debug/deps'
    deps.mkdir(parents=True)
    now = time.time()
    def binary(name, age, content=b'\x7fELFfixture'):
        file = deps / name
        file.write_bytes(content)
        file.chmod(0o755)
        os.utime(file, (now-age, now-age))
        return file
    old = binary('test_case-0000000000000001', 7200)
    binary('test_case-0000000000000002', 600)
    binary('test_case-0000000000000003', 100)
    binary('libdependency-0000000000000001.rlib', 7200)
    binary('unhashed_executable', 7200)
    binary('not_elf-0000000000000001', 7200, b'plain text')
    binary('recent-0000000000000001', 900)
    binary('recent-0000000000000002', 600)
    binary('recent-0000000000000003', 100)
    (deps / 'escape-0000000000000001').symlink_to('/bin/sh')
    hardlink = binary('shared-0000000000000001', 7200)
    os.link(hardlink, root / 'hardlinked')
    binary('shared-0000000000000002', 600)
    binary('shared-0000000000000003', 100)
    selected = candidates(root, now)
    assert [entry[1] for entry in selected] == [old], selected
    assert old.exists(), 'Candidate selection must not delete'
    print('PASS: newest variants, libraries, fresh files, symlinks and hardlinks retained; selection is read-only')

    emergency = candidates(root, now, min_age=0, keep=0)
    assert len(emergency) == 8, emergency
    assert all(x[1].name.startswith(('test_case-', 'recent-', 'shared-')) for x in emergency)
    assert old.exists(), 'Emergency selection must not delete'
    print('PASS: emergency includes sole/new binaries, still excludes libraries/symlinks/hardlinks')
