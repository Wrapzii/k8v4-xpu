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

`ai01-cargo-cache.timer` checks every fifteen minutes. The helper is
`tools/maintain_ci_cargo_cache.py`, installed under `/home/dan/forge-runner`.
It defaults to dry-run; the systemd service uses `--apply`.

- Verify the exact named Cargo volume and target marker.
- Defer during any active CI job or host Cargo/compiler/linker process.
- Pause the idle runner, recheck for a dispatch race, acquire profile Cargo
  locks, and resume the runner in a finally block.
- Act above a 60 GiB cache target or below 20 GiB free space; aim for 50 GiB
  cache and 20 GiB free space.
- Remove only duplicate hash-named ELF executables older than one hour,
  retaining the newest two variants per executable name.
- Preserve all libraries, build-script output, fingerprints, incremental
  compilation state, hardlinked files, and recently produced artifacts.
- Never remove sources, worktrees, models, registry/Git caches or an entire
  Cargo target tree.

These thresholds are soft targets. The helper stops when there are no eligible
duplicates; it never deletes protected artifacts merely to meet a budget.
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
