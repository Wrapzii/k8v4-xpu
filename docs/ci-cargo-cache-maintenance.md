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
`tools/maintain_ci_cargo_cache.py`, installed under `/home/dan/forge-runner`.
It defaults to dry-run; the systemd service uses `--apply`.

- Verify the exact named Cargo volume and target marker.
- Defer during any active CI job or host Cargo/compiler/linker process.
- Pause the idle runner, recheck for a dispatch race, acquire profile Cargo
  locks, and resume the runner in a finally block.
- Act above a 60 GiB cache target or below 40 GiB free space; aim for 50 GiB
  cache and 40 GiB free space.
- Remove only duplicate hash-named ELF executables older than one hour,
  retaining the newest two variants per executable name.
- Below the free-space reserve, also allow removing sole/recent hash-named
  linked executables. Cargo relinks those outputs; dependency libraries remain.
- Preserve all libraries, build-script output, fingerprints, incremental
  compilation state, hardlinked files and symlinks.
- Never remove sources, worktrees, models, registry/Git caches or an entire
  Cargo target tree.

These thresholds are soft targets. The helper stops when there are no eligible
executables; it never deletes protected artifacts merely to meet a budget.
If applying cleanup cannot restore the free-space reserve, it stops the idle
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
