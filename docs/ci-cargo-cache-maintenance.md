# Persistent Cargo cache with conservative cleanup

The AI server runner already persists registry, Git dependencies and target
artifacts in named Docker volumes. Its jobs use `CARGO_TARGET_DIR=/cache/target`,
`CARGO_INCREMENTAL=1`, and four concurrent compilation jobs. Eight CPU cores
remain available to the container.

Cargo normally reuses unchanged units. Changed crates also invalidate dependent
crates and test executables. Fresh source timestamps, changed compiler versions,
features, profiles, flags or checkout paths can cause additional rebuilds.
The repository workflow installs `stable` for each job; it is not a pinned
toolchain. Its `RUSTFLAGS=-D warnings` overrides the repository configuration
that requests LLD. The observed jobs used GNU `ld`, with four linkers each
occupying around 1 GiB while the VM swapped heavily. The cache is therefore
not the only reason jobs take over twelve minutes.

## Installed maintenance

`ai01-cargo-cache.timer` checks every minute. The helper is
`tools/maintain_ci_cargo_cache.py`, installed under `<runner-home>/forge-runner`.
It defaults to dry-run; the systemd service uses `--apply`.

- Verify the exact named Cargo volume and target marker.
- Defer during any active CI job or host Cargo/compiler/linker process.
- Pause the idle runner, recheck for a dispatch race, acquire profile Cargo
  locks, and resume the runner in a finally block.
- Act above a 60 GiB cache target or below 40 GiB free space; aim for 50 GiB
  cache and 40 GiB free space.
- Remove only duplicate hash-named ELF executables older than one hour,
  retaining the newest two variants per executable name.
- Below 10 GiB free space, also allow removing sole/recent hash-named
  linked executables. Cargo relinks those outputs; dependency libraries remain.
- Preserve all libraries, build-script output, fingerprints, incremental
  compilation state, hardlinked files and symlinks.
- Never remove sources, worktrees, models, registry/Git caches or an entire
  Cargo target tree.

These thresholds are soft targets. The helper stops when there are no eligible
executables; it never deletes protected artifacts merely to meet a budget.
If applying cleanup cannot restore at least 10 GiB free, it stops the idle
runner and reports failure. Reclaim storage and explicitly start the runner.
The timer defers during builds; this is not a per-job admission reservation.
The current cache was about 80 GiB, of which 71 GiB was under `debug/deps`
and 8.1 GiB was incremental state. Initial read-only selection found zero
eligible superseded executables. Installing this helper did not reclaim that
80 GiB or demonstrate faster compilation.

## Verification and remaining improvements

The Linux fixture `tools/test_ci_cargo_cache.py` checks that newest variants,
libraries, recent files, symlinks and hardlinks are retained. It passed.
The first service execution correctly deferred during an active CI job; the
runner remained running and the timer is enabled. No extra engine build was run.

The engine workflow was not changed. A separate reviewed workflow change can
reduce debug information, retain stable build inputs, and restore LLD usage.
Changing debug/profile/link flags causes an initial cold build and creates a
different cache variant, so it should be planned with disk headroom and verified
before retiring the old artifacts. Additional VM RAM would also reduce swap
stalls. A repeated warm CI run is needed to measure actual build reuse.

## 2026-10-02 disk-exhaustion correction

A CI link failed with ENOSPC at 2.72 GiB free and 90.21 GiB of target cache.
The old duplicate-only policy reported unmet budgets but continued serving jobs.
Idle emergency cleanup removed 106 disposable linked executables (40.50 GiB),
leaving about 44 GiB free. Libraries and incremental state were retained.
Normal and emergency allowlist fixtures passed. No full engine rerun or speedup
was measured as part of this repair. A single build can still exceed available
space; additional storage or reduced debug information is needed for that case.

Immediately afterward, a separate concurrent process removed the remaining
Cargo build artifacts; disk free rose to about 94 GiB. The actor was not
identified. Subsequent CI will need a cold build. The helper safely defers
when no populated Cargo cache exists, rather than fabricating cache markers.

Emergency cleanup automatically triggers below 10 GiB free (every-minute idle
check), aiming to restore 40 GiB free. Between 10 and 40 GiB, only conservative
superseded-output cleanup runs. Active jobs defer deletion until they finish.

## Dedicated runner HDD (2026-10-02)

The server now has a dedicated 500 GB Seagate ST500DM002 HDD passed through to
AI VM 200. At the owner's request its previous NTFS partition was erased and
formatted as ext4, label `runner-data`, with 1% reserved blocks. It mounts by
filesystem UUID at `/mnt/hdd-500gb`. This is separate storage, not a root-disk
extension. SMART reported no reallocated, pending or uncorrectable sectors;
the drive has approximately 73,909 power-on hours.

Runner data lives under `/mnt/hdd-500gb/forge-runner`:

- `cargo-target`, `cargo-registry`, `cargo-git`: the existing Docker volume names
  now use the local driver's explicit bind sources on the HDD.
- `host-workdir`, `cache`, `workspace`: bind mounts preserve the runner's
  existing `<runner-home>/forge-runner/...` paths.

The idle runner was stopped before copying its existing build cache with
`rsync -aHAX --numeric-ids`; a second dry-run compared the source and copy.
Registration and credentials remain in their existing private directory.
Docker images, disposable job-container layers, and automatic per-job checkout
volumes still use Docker's system-disk storage; they are not the persistent
Cargo target. Qwen's container and model files were not relocated or restarted.

`forge-runner-hdd.service` manages runner startup. Docker automatic restart is
disabled for this runner so it cannot bypass the service's disk guard. The unit
requires the HDD and workdir mounts, binds its lifetime to the HDD mount, and
runs `tools/runner_storage_guard.py` before starting Compose. The guard checks
the exact ext4 filesystem UUID and at least 10 GiB free on both disks.

Maintenance still checks every minute and defers during builds. Its service
sets `CI_CARGO_STORAGE_ROOT` to the HDD target directory and
`CI_CARGO_STORAGE_UUID` to the mounted disk's UUID. The helper validates the
Docker volume's exact local bind source before deletion. Installed cache
thresholds are now 220 GiB maximum, 180 GiB cleanup target, 40 GiB free reserve,
and 10 GiB emergency reserve. If the system disk falls below 10 GiB, idle
maintenance stops the runner rather than attempting to fix it by deleting
HDD files. These remain idle checks, not a guarantee that every running build
fits within available capacity.

The migration's verification covers volume mapping and container access to the
HDD, disk guards, and the cleanup candidate fixtures. No full engine benchmark
or claim of faster compilation is implied; an HDD can be slower for file I/O
than the previous SSD-backed volume.

Post-migration verification: all three Cargo mounts were writable ext4 from a
test container, and the existing `.rustc_info.json` marker was retained. The
runner re-declared its existing registration and began processing tasks
17553â€“17555. Both runner service and cleanup timer are active and enabled;
maintenance correctly deferred for an active CI job. System-disk free space
increased from approximately 48 GiB to 96 GiB, with approximately 403 GiB free
on the HDD. A deliberately mismatched UUID was rejected by the startup guard.
No full engine CI pass or reboot was performed as part of this migration.
