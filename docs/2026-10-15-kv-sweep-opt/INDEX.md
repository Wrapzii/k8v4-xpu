# INDEX: KV-sweep optimisation work, Thu 15 Oct 2026 (ai01)

> Published copy. Host-specific paths and addresses are redacted to placeholders: `<HOME>` (server home), `<DATA_DIR>` (server data disk), `<SRV>`, `<BOX_WORKSPACE>`, `<DESKTOP>`, `<DESKTOP_HOME>`, `<DESKTOP_REPO_CLONE>`, `<TAILSCALE_IP>`, `<FORGE_HOST>`. Paths such as `/opt/k8v4`, `/opt/venv` and `/w` are container-internal. Small receipts are in [`receipts/`](receipts/); binaries, tensors, traces and docker-inspect receipts are not checked in.
> In this repo: the report is [`../2026-10-15-kv-sweep-opt.md`](../2026-10-15-kv-sweep-opt.md); the cascade kernel is `k8v4_v030/native/xe2_kv_ops.cpp` (= `xe2_kv_cascade.cpp`, v2, reproducible with `src/patch_cpp.py`); Python is `k8v4_v030/cascade.py` + the cascade hooks in `k8v4_v030/backend.py`; tests are `k8v4_v030/tests/{test_cascade_xpu,emulate_cascade,dryrun}.py`. File paths in the inventory below refer to the server archive, not this repo.

All times are **ET (America/New_York, UTC-4)**. ai01's clock and file mtimes are UTC, so
21:12Z = 5:12 PM ET. The file inventory at the bottom was generated automatically on ai01 at
the time shown in its heading. Sources were **copied, not moved**. Nothing was deleted.

## 0. Where things are

| location | what | when (ET) |
|---|---|---|
| `ai01:<HOME>/grok-c4-analysis-20261015/` | Grok's C4 200K step-time analysis (REPORT.md, findings.json, proposed/, measure/, sweep-20261015T195903Z/) | 3:37 PM – 5:11 PM |
| `ai01:<HOME>/agent-work/kv-sweep-opt-20261015/` | Agent worktree: cascade, chunk, vsg and reg kernels; tests; window scripts; windows A, 2, 2-rerun, 3 and 4; docs/REPORT.md; **this INDEX** | 4:18 PM – 8:39 PM |
| `box:<BOX_WORKSPACE>/ai01-sweep/` | Box mirror of Grok's production sweep (same points.jsonl, summary.*, sweep.py) plus box-only `analysis.txt`, `analyze.py`, `launch.sh`. A copy is at `kv-sweep-opt-20261015/box-ai01-sweep/` | 3:58 PM – 5:16 PM |
| `ai01:<HOME>/k8v4-concurrency-handoff-2026-10-15/` | Handoff notes read by both agents (START-HERE.md, HANDOFF-2026-10-15-attention-next-steps.md, Astra PR4 audit). Included in the tarball as context | through 3:16 PM |
| `ai01:<HOME>/agent-work/archives/kv-sweep-opt-20261015-results.tar.gz` | Compact results and docs tarball (see §6) | built at index time |
| `box:<BOX_WORKSPACE>/ai01-archive/` | Copy of that tarball, its .sha256, and INDEX.md | same |
| GitHub `Wrapzii/k8v4-xpu` PR #4, branch `codex/compact-slm-concurrency` | The repo and PR these source changes belong to. Local clone on <DESKTOP>: `<DESKTOP_REPO_CLONE>` | PR head 4d515c6, Oct 14, 11:41 PM |

Production baseline throughout: container `vllm-k8v4-tp2` (646e52f57a5e), `/opt/k8v4/libxe2_kv.so` =
`perf-layout-merge-20261015/libxe2_kv_lookahead.so`, sha256 `e789e4f9e078ce885a4102b0fabcad20e920b0b14b53a7503abf17f2c80b5d76`,
built from `ref/xe2_kv_lookahead.cpp` (sha `982cad72…`, byte-identical to the repo's working-tree
`k8v4_v030/native/xe2_kv_ops.cpp`). Every window restored that lib and verified it: /v1/models, lib sha
and one completion. At 8:36–8:39 PM a separate job started redeploying production (`casc-s*.sh` in this dir are
that job's read-only probes). This index does not cover that redeploy.

## 1. Timeline (ET)

| time | event | where |
|---|---|---|
| 3:37–3:55 PM | Grok analysis. The C4 200K step is 166 ms, 69% of it in the full-attention KV sweep (97.3 ms verifier + 18.0 ms drafter). Non-invasive A/B: 8K C4 55.5 ms, 200K C1 64, C2 99, C4 166 ms | grok REPORT.md, findings.json, measure/ |
| 3:59–5:11 PM | Production sweep (sweep.py), shared or unique × 100/200/258K × C1/2/4. Shared 200K: C1 70.8, C4 105.4 t/s combined (reps 98.9 / 111.8) | grok sweep-20261015T195903Z/, box ai01-sweep/ |
| 4:18–4:43 PM | Cascade implemented (`patch_cpp.py`, `cascade_block.cpp`, then `xe2_kv_cascade.cpp`), CPU-only build of `libxe2_kv_cascade.so`, emulator 32/32 bit-exact | root files, tests/ |
| **5:12–5:18 PM** | **Window A** (6.6 min downtime): cascade kernel exactness and latency | win/ |
| 5:19 PM | v2: verifier cascade gated behind `XE2_KV_CASCADE_VERIFY=1`, `libxe2_kv_cascade_v2.so` | root |
| 5:30–5:39 PM | Chunked S1 (#2): `chunk/`, `xe2_kv_chunk.cpp`, `libxe2_kv_chunk.so`, emulator 64/64 | chunk/, tests/ |
| 5:45–5:52 PM | **Window 2** (first attempt): chunk test failed (test bug), AR bench ran | win2-20261015T214517Z/ |
| **6:11–6:18 PM** | **Window 2 rerun** (7.0 min): chunk kernel tests | win2-20261015T221109Z/ |
| 6:30–6:34 PM | Verifier sub-group-packed cascade (vsg) and P2P all-reduce prototype | vsg/ |
| **6:35–7:00 PM** | **Window 3** (25.1 min): vsg kernels, P2P AR, TP2 serving A/B with drafter cascade | win3-20261015T223528Z/ |
| 7:31–7:46 PM | Register-accumulator verifier S1 (#2b): `reg/`, `xe2_kv_reg.cpp`, `libxe2_kv_reg.so` | reg/ |
| 7:42 PM | Window 4 scripts | w4/ |
| **7:49–8:29 PM** | **Window 4** (40.1 min): reg kernels, profiled candidate, MTP k=7 candidate | win4-20261015T234904Z/ |
| 8:30 PM | docs/REPORT.md final (31.6 KB) | docs/ |

## 2. Key measured results per window

**Window A, 5:12–5:18 PM** (lib `libxe2_kv_cascade.so` cf32e82d…, GPU0; production lib serial on GPU1; 200K, B=4, ratio 33 and 1, share 100/98/90/0%)
- Exactness: the cascade op is bitwise equal to production in 16/16 cases (max abs 0, max rel 0). Graph capture and replay are bitwise in 16/16.
- ms per layer call:

  | case | serial | cascade |
  |---|---:|---:|
  | q1 drafter, share 100% | 3.20 | 1.64 |
  | q1, 98% | 3.00 | 1.67 |
  | q1, 90% | 3.00 | 1.79 |
  | q1, 0% | 2.97 | 3.00 |
  | q7 verifier, 98–100% | 6.06 | 7.16–7.17 (**18% slower**) |
  | q7, 0% | 6.05 | 6.06 |

- Outcome: the drafter cascade lands (−45%). The verifier cascade went opt-in (v2).

**Window 2 first attempt, 5:45–5:52 PM**: the chunk test exited 1 (test script bug, kept as `tests/test_chunk_xpu.win2-failed.py`). AR bench at decode sizes: AR 0.039 ms, 0.054 ms exposed per layer, so overlap is worth ≈0.

**Window 2 rerun, 6:11–6:18 PM** (`libxe2_kv_chunk.so` 26b7e64b…)
- chunk4 and chunk8 match serial's fp64 error. chunk+cascade is bitwise equal to chunk-only.
- Slow: q1 chunk 5.8–5.9 ms (with cascade 4.1–4.7) vs serial 3.07; q7 chunk 21.5–21.8 vs serial 6.03.
- **Dead** (SLM accumulator occupancy).

**Window 3, 6:35–7:00 PM** (`libxe2_kv_vsg.so` 6d20bea7…)
- q7 at 98–100% share: serial 6.03–6.05, casc 7.08–7.09, vsg2 6.57–6.58, vsg4 7.40. B3 at 98%: serial 4.55, casc 5.39, vsg2 5.79.
- q1 casc 1.58–1.60 vs serial 3.09. All variants bitwise. Serial vs production: 12/12 bitwise.
- P2P fused AR: 0.103 ms (T4) and 0.608 ms (T28) vs copy engine 0.047 / 0.060 ms. **Dead.**
- Serving A/B on :8101 with `XE2_KV_CASCADE=1` (vsg lib), shared 200K, 2048 output tokens:
  - C1: 72.8 t/s.
  - C4 combined: 116.2 / 115.9 t/s, acceptance 0.61. Baseline was 98.9 / 111.8 (acceptance 0.52 / 0.63), so ≈+4% at matched acceptance.
  - The drafter cascade saves ≈8.9 ms per step (DERIVED).
- Candidate cold compile took 733 s. The cache copy failed: root-only files left `vllm-cache-copy*` behind.

**Window 4, 7:49–8:29 PM** (`libxe2_kv_reg.so` f1565f84…)
- reg4 and reg8 are bitwise equal to chunk4 and chunk8. Graph replay is bitwise. fp64 error matches serial.
- q7 200K B4: serial 6.03 / 6.06 ms, reg8 14.14, reg16 14.1–14.2, chunk8 21.5. q1 reg8 12.8 vs serial 3.1. **Dead.**
- Picked flags: `XE2_KV_CASCADE=1` only.
- Profiler: decode graphs are invisible to it, and profiling inflated steps 3–7×. Not representative.
- Serving, shared 200K, 2048 output tokens:
  - k=6 + cascade: C1 71.9 t/s (acceptance 0.607), C4 111.1 combined (acceptance 0.575), step 64.6 / 169.6 ms.
  - k=7 + cascade: C1 76.9, C4 107.5 / 99.1 t/s (acceptance 0.568 / 0.514). +7% at C1, −3 to −11% at C4. **Not adopted.**
- Production restored: lib e789e4f9, OK at 8:29 PM.

## 3. Libraries (all CPU-only builds in a capped container; sha256 recomputed on ai01 at index time, see §7)

| lib | source (sha256) | flags it adds | GPU-tested | status |
|---|---|---|---|---|
| `libxe2_kv_cascade.so` = `libxe2_kv_cascade.window-tested.so` | `xe2_kv_cascade.window-tested.cpp` (e98970cf…) | `XE2_KV_CASCADE=1` (q1 packed and q7 multi) | Window A | superseded by v2. Drafter path proven bit-exact |
| `libxe2_kv_cascade_v2.so` | `xe2_kv_cascade.cpp` (6a4b7c8c…) | + `XE2_KV_CASCADE_VERIFY=1` gate for q7 | no (gate change only) | **the cascade source to commit**. The drafter path is identical to Window A |
| `libxe2_kv_chunk.so` | `xe2_kv_chunk.cpp` (af45647d…) = v2 + chunk/patch_chunk.py | `XE2_KV_CHUNK=4\|8` | Window 2 rerun | **dead** (3.6× slower q7) |
| `libxe2_kv_vsg.so` | `xe2_kv_vsg.cpp` (5a986b0c…) = chunk + vsg/patch_vsg.py + sgpack_block.cpp | vsg2/vsg4 verifier packing | Window 3 kernels + serving A/B (CASCADE=1 only) | vsg verifier **dead**. The lib served the drafter-cascade A/B |
| `libxe2_kv_reg.so` (`.v1` = first build) | `xe2_kv_reg.cpp` (1fbed0ff…), v1 eec02a81… = vsg + reg/patch_reg.py | `XE2_KV_CHUNK=4\|8\|16` + `XE2_KV_CHUNK_REG=1`, `XE2_KV_CHUNK_MINQ=2` | Window 4 kernels + serving (CASCADE=1 only) | reg **dead**. The lib served the window-4 drafter-cascade runs |

**Flags summary.**
- Shippable: `XE2_KV_CASCADE=1`. It is the drafter q1 packed cascade: exact, −45% per call, ≈+4% C4 t/s.
- Dead: `XE2_KV_CASCADE_VERIFY=1`, `XE2_KV_CHUNK=*`, `XE2_KV_CHUNK_REG=1`, vsg, P2P AR, MTP k=7.
- Production flags left as they were: `XE2_KV_COMPACT_SLM=1 XE2_KV_PARTIAL_FP16=1 XE2_KV_S2_NSG=32 XE2_KV_S2_NSG_DRAFT=32 XE2_KV_S2_NSG_VERIFY=8 XE2_KV_S2_TWO_PASS=0`.
- Candidate memory: q7 verify cascade extra memory needs `--gpu-memory-utilization 0.93`. It is not needed for the drafter-only path.

## 4. Directory guide: `<HOME>/agent-work/kv-sweep-opt-20261015/`

| path | contents |
|---|---|
| `docs/REPORT.md` | **Main write-up** (final 8:30 PM). `REPORT.md.before-{s2,win3,win4}` are earlier snapshots. `decode_ar_overlap_bench.py` is the decode AR overlap bench (torchrun, 2 ranks) |
| `INDEX.md` | this file |
| `patch_cpp.py`, `cascade_block.cpp` | reproducible cascade patch over `ref/xe2_kv_lookahead.cpp` (asserts anchor counts) |
| `xe2_kv_cascade.cpp`, `xe2_kv_cascade.window-tested.cpp` | patched full sources (v2 and window-A) |
| `xe2_kv_chunk.cpp`, `xe2_kv_vsg.cpp`, `xe2_kv_reg.cpp`, `xe2_kv_reg.v1.cpp` | later stacked experimental sources (dead variants) |
| `patch_backend.py` | applies the backend.py cascade hook |
| `k8v4-opt/k8v4_v030/` | agent copy of the **container** package. `cascade.py` (new) and the `backend.py` cascade and prealloc hooks are the only intended changes. `cascade.py.before-reg` and `backend.py.before-never-mix` are snapshots. Other files are older container copies (see PR notes) |
| `build-cascade.sh`, `run-build.sh`, `build-chunk.sh`, `run-build-chunk.sh`, `build-*.log` | capped CPU-only compile container scripts and logs |
| `check_load.py`, `check_load2.py` | lib loads, op schema check |
| `tests/` | `emulate_cascade.py` (32 cases), `emulate_chunk.py` (64; `.v1` kept), `test_cascade_xpu.py`, `test_chunk_xpu.py` (+ `.win2-failed`), `test_vsg_xpu.py`, `test_reg_xpu.py`, `dryrun*.py` |
| `chunk/` | `chunk_block.cpp`, `patch_chunk.py`, `ab_launch.py`, `make_ab_sweep.py`, `report_s2.md`, `window2.v1.sh`, `cascade.py.before-chunk` |
| `vsg/` | `sgpack_block.cpp`, `patch_vsg.py`, `build-vsg.sh`, `p2p_ar.cpp` (+ built `p2p_ar` binary), `emulate_sgpack_layout.py`, `patch_backend_prealloc.py`, `pick_flags.py`, `window3.sh`, `backend.py.before-prealloc` |
| `reg/` | `regacc_block.cpp`, `patch_reg.py`, `patch_cascade_ch16.py`, `emulate_regacc.py` (126 cases), `test_reg_xpu.py`, `build-reg.sh`, build and AOT logs (`.v1` variants kept) |
| `w4/` | `window4.sh`, `ab_launch2.py`, `make_prof_sweep.py`, `parse_trace.py`, `pick_reg.py`, `window4.nohup.log` |
| `window.sh`, `window2.sh`, `ab_sweep.py` | window A and 2 runners; serving A/B client |
| `win/` | Window A raw: `cand.log`, `prod.log`, `compare.json.log`, `window.log`, receipts, `cand.pt` and `prod.pt` tensors |
| `win2-20261015T214517Z/` | Window 2 first attempt: AR bench json/log (`ar-prodenv`, `ar-ce0`), chunk.log (failed), receipts |
| `win2-20261015T221109Z/` | Window 2 rerun: `chunk.json`, `chunk.log`, `compare.log`, receipts, `.pt` tensors |
| `win3-20261015T223528Z/` | Window 3: `vsg.json`/`.log`, `vsg-b3.json`, `p2p.json`, `pick.json`, `ab/` (serving A/B summary), `candidate.log`, `ab-launch.log`, receipts |
| `win4-20261015T234904Z/` | Window 4: `reg.json`/`.log`, `reg-edge{130,3000}.json`, `pick.json`, `ab/` (profiled k=6), `k7/` (k=7), candidate logs, `prof/` + `trace-rank*.json.gz` (+ `.summary.json`), receipts |
| `win-runner.out`, `win2.nohup`, `win3.nohup` | runner stdout |
| `ref/`, `ref-bundle.tgz`, `perf20261014.tgz` | inputs: deployed `xe2_kv_lookahead.cpp`, container package copies (`ref/container`, `ref/ko`), repo tarball, the earlier perf-20261014 AR attempt |
| `box-ai01-sweep/` | copy of box `<BOX_WORKSPACE>/ai01-sweep` (added at index time) |
| `casc-s1..s5.sh` | 8:36–8:39 PM, **another job's** read-only redeploy probes. Not part of this work |
| `vllm-cache-copy/` (root-owned, 749 MB), `vllm-cache-copy.tmp/` (2.1 GB) | window-3 candidate compile cache and a failed partial copy. **Excluded from the tarball.** Kept, not deleted |
| `*.so` | built libs (see §3 and §7). Excluded from the tarball |

## 5. Grok analysis directory guide: `<HOME>/grok-c4-analysis-20261015/`

| path | contents |
|---|---|
| `REPORT.md` (3:55 PM) | C4 200K verifier-pass breakdown, bandwidth table, ranked ideas (rank 1 = exact shared-prefix walk) |
| `findings.json` | machine-readable: model geometry, production run stats (77.3 t/s overlap, acceptance 0.567, 4.401 tok/step), step ms, native ms, breakdown |
| `STATUS.md`, `PROMPT.md`, `EXTERNAL-AGENT-START-HERE.md` | Grok's progress log, task prompt, briefing |
| `proposed/` | `shared-prefix-fusion.md` (became the cascade), `decode-stage-timer.md`, README |
| `measure/` | `ab_step_time.py`, `ab-results.json`, Prometheus metrics before and after, `derived-preview.json` |
| `sweep-20261015T195903Z/` | production sweep 3:59–5:11 PM: `sweep.py`, `points.jsonl`, `summary.{csv,json}`, `progress.log`, docker inspect and logs |
| `grok.log` (2.9 MB), `session-id.txt`, `grok.pid`, `.monitor.py` | session log and housekeeping |
| `inputs/` | `astra-review-20261015(.tgz)` (82 MB, 1240 files) and `github-k8v4-xpu(.tgz)` repo snapshot. **Excluded from the tarball** (copies of inputs) |

## 6. Tarball `kv-sweep-opt-20261015-results.tar.gz`
Members are rooted at `kv-sweep-opt-20261015/`, `grok-c4-analysis-20261015/` and `k8v4-concurrency-handoff-2026-10-15/`.

**Excluded:** `vllm-cache-copy*`, `*.so`, `*.pt` (raw tensors), `*.tgz`/`*.tar` bundles, `ref/ko`, `__pycache__`/`*.pyc`, the `vsg/p2p_ar` binary, the duplicate `prof/*.trace.json.gz`, and grok `inputs/`. Everything excluded stays in place on ai01.

Its sha256 is in `kv-sweep-opt-20261015-results.tar.gz.sha256` next to it.

## 7. sha256 of every built library and key source (computed 2026-10-15 8:46 PM ET)
```
cf32e82d7a5edf71f228ce23a44fdbcf0c78324e8b40cce2c567e5c461e61c8a  libxe2_kv_cascade.so
cf32e82d7a5edf71f228ce23a44fdbcf0c78324e8b40cce2c567e5c461e61c8a  libxe2_kv_cascade.window-tested.so
400d1265dd37d20eba8fcccd3b82e23e130e88dec19ec8574f1a174a5473c503  libxe2_kv_cascade_v2.so
26b7e64b74fc53bd90740f047a0964bcd096a9ac709584346f03023b60722e28  libxe2_kv_chunk.so
f1565f8415f4b09834ac514460881bb9bb70f2bd98a00af4e222e453013b3b95  libxe2_kv_reg.so
9c87e413f47cc5845a4e3185daf8440e653a340ef3f12b197dc07517c8e3292a  libxe2_kv_reg.v1.so
6d20bea77ddb181f62a151d079874a673c7f0e39d236b2526067b0a5c40e483e  libxe2_kv_vsg.so
4e862c27aac60e40af4bc8e990024b8b6792c783e9e6946ae101b4063fac6f2b  vsg/p2p_ar
982cad72de5e5892b3f226a247c30b11d377381370bd15aabc84a20c05ad0c70  ref/xe2_kv_lookahead.cpp
6a4b7c8cf7019abab5ec28c95941a79902dc72a64f91db69be4dd126c3e0ba0e  xe2_kv_cascade.cpp
e98970cfee2e3a31813e6c181be056e4ddbeb56892c1754c6fd1f4ba8bf9cd26  xe2_kv_cascade.window-tested.cpp
af45647d837fedfdf2d869723ac337c05755378db2f2e492830920852b8203cc  xe2_kv_chunk.cpp
1fbed0ff1bf39dbb8c064ff2719283096f0c570bb9dfeaecb9a3f64fa14a4eab  xe2_kv_reg.cpp
eec02a81840403b8cbace07f7232dbf2e055ed023ea7b27fde5414de8589a5ed  xe2_kv_reg.v1.cpp
5a986b0cd9196daa4a22124493fd268dfa9a2d25e16bdc91549dd70b6b2834d9  xe2_kv_vsg.cpp
f0be0a46dffac03aead3b682547c62c21cec3d6df4de3018de5d9d5301599a24  cascade_block.cpp
9171aac47d510e2c2ce449ff38b3fc70702b35b624885c49bd1b5599050ec3b5  patch_cpp.py
72ed8a5da6ea167a4686ffe2d734acc21e4edfac28e4781f0f1cc53c65d23857  patch_backend.py
82fe8b81df48833598a81f762d2e68fc01fa84aa6ec08cecd6bc9539d703a9c1  k8v4-opt/k8v4_v030/cascade.py
74a8a87ff6f331db75b7f42c1d3649339512aa75901b68e962557c1d70f43bbc  k8v4-opt/k8v4_v030/backend.py
bf6f488f3a01e83873a3412a0bb8b01265328031a18c5607b81ed9da138338a4  docs/REPORT.md
```
Box mirror vs grok sweep-20261015T195903Z: same:points.jsonl same:summary.csv same:summary.json same:sweep.py same:progress.log same:docker-inspect.json same:docker-log-kv.txt 

## 8. File inventory (generated 2026-10-15 8:46 PM ET; mtime ET, size bytes; T = in tarball)

### <HOME>/agent-work/kv-sweep-opt-20261015/
(omitted: vllm-cache-copy*/ contents, ref/ko/ (87 files, container package copy), __pycache__)
```
T 2026-10-15 17:34      14864 ./ab_sweep.py
T 2026-10-15 17:16       3549 ./box-ai01-sweep/analysis.txt
T 2026-10-15 16:37       1848 ./box-ai01-sweep/analyze.py
T 2026-10-15 17:16      14850 ./box-ai01-sweep/docker-inspect.json
T 2026-10-15 17:16       8250 ./box-ai01-sweep/docker-log-kv.txt
T 2026-10-15 15:58        606 ./box-ai01-sweep/launch.sh
T 2026-10-15 17:15    1119326 ./box-ai01-sweep/points.jsonl
T 2026-10-15 17:15       7170 ./box-ai01-sweep/progress.log
T 2026-10-15 17:15      13303 ./box-ai01-sweep/summary.csv
T 2026-10-15 17:15      34561 ./box-ai01-sweep/summary.json
T 2026-10-15 15:58      14521 ./box-ai01-sweep/sweep.py
T 2026-10-15 17:19       2821 ./build-cascade-v2.log
T 2026-10-15 16:42       3070 ./build-cascade.attempt1-entrypoint.log
T 2026-10-15 16:43       2818 ./build-cascade.log
T 2026-10-15 17:19        731 ./build-cascade.sh
T 2026-10-15 17:31       2812 ./build-chunk.log
T 2026-10-15 17:30        719 ./build-chunk.sh
T 2026-10-15 20:42       6455 ./casc-deploy/deploy.py
T 2026-10-15 20:42        660 ./casc-deploy/rollback.sh
T 2026-10-15 20:42       1920 ./casc-deploy/stage.sh
T 2026-10-15 20:36        710 ./casc-s1.sh
T 2026-10-15 20:38        455 ./casc-s2.sh
T 2026-10-15 20:38        825 ./casc-s3.sh
T 2026-10-15 20:39        468 ./casc-s4.sh
T 2026-10-15 20:40        599 ./casc-s5.sh
T 2026-10-15 20:41        668 ./casc-s6.sh
T 2026-10-15 16:35      50724 ./cascade_block.cpp
T 2026-10-15 16:44        210 ./check_load.py
T 2026-10-15 17:34        141 ./check_load2.py
T 2026-10-15 17:34       2195 ./chunk/ab_launch.py
T 2026-10-15 17:19       3114 ./chunk/cascade.py.before-chunk
T 2026-10-15 17:30      33273 ./chunk/chunk_block.cpp
T 2026-10-15 17:34        785 ./chunk/make_ab_sweep.py
T 2026-10-15 17:30       1731 ./chunk/patch_chunk.py
T 2026-10-15 17:39       4818 ./chunk/report_s2.md
T 2026-10-15 18:11       5212 ./chunk/window2.v1.sh
T 2026-10-15 20:30      31653 ./docs/REPORT.md
T 2026-10-15 17:39      15715 ./docs/REPORT.md.before-s2
T 2026-10-15 19:46      20533 ./docs/REPORT.md.before-win3
T 2026-10-15 20:30      29244 ./docs/REPORT.md.before-win4
T 2026-10-15 17:39       4835 ./docs/decode_ar_overlap_bench.py
T 2026-10-10 15:47         24 ./k8v4-opt/k8v4_v030/.dockerignore
T 2026-10-10 15:47        806 ./k8v4-opt/k8v4_v030/Dockerfile
T 2026-10-10 15:47        245 ./k8v4-opt/k8v4_v030/Dockerfile.swift-bake
T 2026-10-10 15:47        906 ./k8v4-opt/k8v4_v030/Dockerfile.tp1-skip
T 2026-10-10 15:47        187 ./k8v4-opt/k8v4_v030/__init__.py
T 2026-10-10 15:47       4470 ./k8v4-opt/k8v4_v030/attn_time.py
T 2026-10-15 18:34      19151 ./k8v4-opt/k8v4_v030/backend.py
T 2026-10-15 01:03      17800 ./k8v4-opt/k8v4_v030/backend.py.before-never-mix
T 2026-10-10 15:47        857 ./k8v4-opt/k8v4_v030/build_image.sh
T 2026-10-10 15:47       4085 ./k8v4-opt/k8v4_v030/cache_views.py
T 2026-10-15 19:31       3565 ./k8v4-opt/k8v4_v030/cascade.py
T 2026-10-15 19:31       3483 ./k8v4-opt/k8v4_v030/cascade.py.before-reg
T 2026-10-10 15:47       1812 ./k8v4-opt/k8v4_v030/compile_decode.sh
T 2026-10-10 15:47        288 ./k8v4-opt/k8v4_v030/compile_image.sh
T 2026-10-10 15:47       2050 ./k8v4-opt/k8v4_v030/compile_sdpa.sh
T 2026-10-10 15:47       1255 ./k8v4-opt/k8v4_v030/compile_sdpa_host.sh
T 2026-10-10 15:47      17899 ./k8v4-opt/k8v4_v030/dequant.py
T 2026-10-10 15:47       2592 ./k8v4-opt/k8v4_v030/embed_int8_runtime.py
T 2026-10-10 16:01       9535 ./k8v4-opt/k8v4_v030/launch.sh
T 2026-10-10 15:47      10316 ./k8v4-opt/k8v4_v030/layout.py
T 2026-10-10 15:47       9609 ./k8v4-opt/k8v4_v030/mtp_probe_client.py
T 2026-10-10 15:47      15514 ./k8v4-opt/k8v4_v030/mtp_topk_log.py
T 2026-10-10 15:47       7413 ./k8v4-opt/k8v4_v030/mtp_topk_report.py
T 2026-10-10 15:47      10822 ./k8v4-opt/k8v4_v030/native/k8v4_sdpa.cpp
T 2026-10-10 15:47      94309 ./k8v4-opt/k8v4_v030/native/xe2_kv_ops.cpp
T 2026-10-15 01:03       2116 ./k8v4-opt/k8v4_v030/never_mix_sched.py
T 2026-10-10 15:47       8581 ./k8v4-opt/k8v4_v030/onednn_prefill.py
T 2026-10-10 15:47        588 ./k8v4-opt/k8v4_v030/ops_api.py
T 2026-10-10 15:47       5420 ./k8v4-opt/k8v4_v030/oracle.py
T 2026-10-10 15:47       3404 ./k8v4-opt/k8v4_v030/paged.py
T 2026-10-10 15:47       3013 ./k8v4-opt/k8v4_v030/patch_installed_vllm.py
T 2026-10-10 15:47      11353 ./k8v4-opt/k8v4_v030/patch_mtp_topk.py
T 2026-10-10 15:47       5293 ./k8v4-opt/k8v4_v030/plan.py
T 2026-10-10 15:47       3305 ./k8v4-opt/k8v4_v030/prefill_gather_triton.py
T 2026-10-10 15:47       4607 ./k8v4-opt/k8v4_v030/profile_request.py
T 2026-10-10 15:47       4468 ./k8v4-opt/k8v4_v030/scratch.py
T 2026-10-10 15:47      27924 ./k8v4-opt/k8v4_v030/stage_profile.py
T 2026-10-10 15:47         42 ./k8v4-opt/k8v4_v030/tests/__init__.py
T 2026-10-10 15:47       5841 ./k8v4-opt/k8v4_v030/tests/test_attn_time.py
T 2026-10-10 15:47       2667 ./k8v4-opt/k8v4_v030/tests/test_backend_guards.py
T 2026-10-10 15:47      20503 ./k8v4-opt/k8v4_v030/tests/test_cache_bytes.py
T 2026-10-10 15:47      27019 ./k8v4-opt/k8v4_v030/tests/test_kernel_xpu.py
T 2026-10-10 16:01       4167 ./k8v4-opt/k8v4_v030/tests/test_launch_profiles.py
T 2026-10-10 15:47      11937 ./k8v4-opt/k8v4_v030/tests/test_layout_mtp.py
T 2026-10-10 15:47      18176 ./k8v4-opt/k8v4_v030/tests/test_mtp_topk_log.py
T 2026-10-10 15:47       9611 ./k8v4-opt/k8v4_v030/tests/test_onednn_prefill.py
T 2026-10-10 15:47       6413 ./k8v4-opt/k8v4_v030/tests/test_patch.py
T 2026-10-10 15:47       5273 ./k8v4-opt/k8v4_v030/tests/test_plan_scratch.py
T 2026-10-10 15:47       4196 ./k8v4-opt/k8v4_v030/tests/test_public_package.py
T 2026-10-10 15:47      13959 ./k8v4-opt/k8v4_v030/tests/test_stage_profile.py
T 2026-10-10 15:47       3307 ./k8v4-opt/k8v4_v030/tests/test_tp1_startup.py
T 2026-10-10 15:47      10688 ./k8v4-opt/k8v4_v030/tests/test_w4a8_prefill.py
T 2026-10-10 15:47       2673 ./k8v4-opt/k8v4_v030/tests/test_w4a8_runtime.py
T 2026-10-10 15:47      14270 ./k8v4-opt/k8v4_v030/w4a8_prefill.py
- 2026-10-15 16:43    1252896 ./libxe2_kv_cascade.so
- 2026-10-15 17:19    1252896 ./libxe2_kv_cascade.window-tested.so
- 2026-10-15 17:19    1252896 ./libxe2_kv_cascade_v2.so
- 2026-10-15 17:31    1487240 ./libxe2_kv_chunk.so
- 2026-10-15 19:43    1772544 ./libxe2_kv_reg.so
- 2026-10-15 19:42    1772544 ./libxe2_kv_reg.v1.so
- 2026-10-15 18:30    1542728 ./libxe2_kv_vsg.so
T 2026-10-15 16:41       1252 ./patch_backend.py
T 2026-10-15 16:35       3989 ./patch_cpp.py
- 2026-10-15 16:18    2188462 ./perf20261014.tgz
- 2026-10-15 16:18    2655754 ./ref-bundle.tgz
T 2026-10-15 16:18      17953 ./ref/container/backend.py
- 2026-10-15 16:18    1034240 ./ref/container/k8v4-opt.tar
T 2026-10-15 16:18      10316 ./ref/container/layout.py
T 2026-10-15 16:18       4453 ./ref/container/ls.txt
- 2026-10-15 16:18    2313046 ./ref/github-k8v4-xpu.tgz
T 2026-10-15 16:18     129756 ./ref/xe2_kv_lookahead.cpp
T 2026-10-15 19:46       3827 ./reg/aot.log
T 2026-10-15 19:42       3827 ./reg/aot.v1.log
T 2026-10-15 19:31       1467 ./reg/build-reg.sh
T 2026-10-15 19:36       4792 ./reg/build.log
T 2026-10-15 19:46       4792 ./reg/build2.log
T 2026-10-15 19:42        632 ./reg/dryrun_reg.py
T 2026-10-15 19:46        803 ./reg/emu-box.log
T 2026-10-15 19:31      14389 ./reg/emulate_regacc.py
T 2026-10-15 19:31        368 ./reg/patch_cascade_ch16.py
T 2026-10-15 19:42       2560 ./reg/patch_reg.py
T 2026-10-15 19:42       2194 ./reg/patch_reg.v1.py
T 2026-10-15 19:33      15628 ./reg/regacc_block.cpp
T 2026-10-15 19:33      15207 ./reg/regacc_block.v1.cpp
T 2026-10-15 19:42      13738 ./reg/test_reg_xpu.py
T 2026-10-15 19:42      13131 ./reg/test_reg_xpu.v1.py
T 2026-10-15 17:30        414 ./run-build-chunk.sh
T 2026-10-15 16:43        416 ./run-build.sh
T 2026-10-15 16:57        626 ./tests/dryrun.py
T 2026-10-15 17:34        634 ./tests/dryrun_chunk.py
T 2026-10-15 19:42        632 ./tests/dryrun_reg.py
T 2026-10-15 18:30        632 ./tests/dryrun_vsg.py
T 2026-10-15 16:41      11270 ./tests/emulate_cascade.py
T 2026-10-15 17:39      15359 ./tests/emulate_chunk.py
T 2026-10-15 17:39      15049 ./tests/emulate_chunk.v1.py
T 2026-10-15 16:57       9134 ./tests/test_cascade_xpu.py
T 2026-10-15 17:55      11913 ./tests/test_chunk_xpu.py
T 2026-10-15 17:51      11681 ./tests/test_chunk_xpu.win2-failed.py
T 2026-10-15 19:42      13738 ./tests/test_reg_xpu.py
T 2026-10-15 18:34      12405 ./tests/test_vsg_xpu.py
T 2026-10-15 18:34      18750 ./vsg/backend.py.before-prealloc
T 2026-10-15 18:30       1386 ./vsg/build-vsg.sh
T 2026-10-15 18:31       4108 ./vsg/build.log
T 2026-10-15 18:30       3948 ./vsg/emulate_sgpack_layout.py
- 2026-10-15 18:30     143112 ./vsg/p2p_ar
T 2026-10-15 18:30       7957 ./vsg/p2p_ar.cpp
T 2026-10-15 18:34        968 ./vsg/patch_backend_prealloc.py
T 2026-10-15 18:30        711 ./vsg/patch_vsg.py
T 2026-10-15 18:34       1983 ./vsg/pick_flags.py
T 2026-10-15 18:30      15293 ./vsg/sgpack_block.cpp
T 2026-10-15 18:34       5938 ./vsg/window3.sh
T 2026-10-15 19:42       2808 ./w4/ab_launch2.py
T 2026-10-15 19:42       2186 ./w4/make_prof_sweep.py
T 2026-10-15 19:42       4827 ./w4/parse_trace.py
T 2026-10-15 19:42       1891 ./w4/pick_reg.py
T 2026-10-15 20:29       1905 ./w4/window4.nohup.log
T 2026-10-15 19:42       8365 ./w4/window4.sh
T 2026-10-15 17:18       1389 ./win-runner.out
T 2026-10-15 17:13       4830 ./win/cand.log
- 2026-10-15 17:13    3155025 ./win/cand.pt
T 2026-10-15 17:13       4411 ./win/compare.json.log
T 2026-10-15 17:13       1062 ./win/prod.log
- 2026-10-15 17:13    1578225 ./win/prod.pt
T 2026-10-15 17:12      14850 ./win/receipt-docker-inspect-before.json
T 2026-10-15 17:12        166 ./win/receipt-lib-sha-before.txt
T 2026-10-15 17:18       1417 ./win/window.log
T 2026-10-15 17:47       1394 ./win2-20261015T214517Z/ar-ce0.json
T 2026-10-15 17:47       4243 ./win2-20261015T214517Z/ar-ce0.log
T 2026-10-15 17:46       1386 ./win2-20261015T214517Z/ar-prodenv.json
T 2026-10-15 17:46       4330 ./win2-20261015T214517Z/ar-prodenv.log
T 2026-10-15 17:46        942 ./win2-20261015T214517Z/chunk.log
T 2026-10-15 17:52       1038 ./win2-20261015T214517Z/compare.log
T 2026-10-15 17:52        207 ./win2-20261015T214517Z/free-after.txt
T 2026-10-15 17:45        207 ./win2-20261015T214517Z/free-before.txt
T 2026-10-15 17:45       1227 ./win2-20261015T214517Z/prod.env
T 2026-10-15 17:46        678 ./win2-20261015T214517Z/prod.log
- 2026-10-15 17:46    1183689 ./win2-20261015T214517Z/prod.pt
T 2026-10-15 17:45      14860 ./win2-20261015T214517Z/receipt-docker-inspect-before.json
T 2026-10-15 17:45        166 ./win2-20261015T214517Z/receipt-lib-sha-before.txt
T 2026-10-15 17:52       1110 ./win2-20261015T214517Z/window.log
T 2026-10-15 18:12      22532 ./win2-20261015T221109Z/chunk.json
T 2026-10-15 18:12      18868 ./win2-20261015T221109Z/chunk.log
- 2026-10-15 18:12    7094127 ./win2-20261015T221109Z/chunk.pt
T 2026-10-15 18:18       1333 ./win2-20261015T221109Z/compare.log
T 2026-10-15 18:18        207 ./win2-20261015T221109Z/free-after.txt
T 2026-10-15 18:11        207 ./win2-20261015T221109Z/free-before.txt
T 2026-10-15 18:11       1227 ./win2-20261015T221109Z/prod.env
T 2026-10-15 18:12        678 ./win2-20261015T221109Z/prod.log
- 2026-10-15 18:12    1183689 ./win2-20261015T221109Z/prod.pt
T 2026-10-15 18:11      14860 ./win2-20261015T221109Z/receipt-docker-inspect-before.json
T 2026-10-15 18:11        166 ./win2-20261015T221109Z/receipt-lib-sha-before.txt
T 2026-10-15 18:18       1059 ./win2-20261015T221109Z/window.log
T 2026-10-15 17:52       1082 ./win2.nohup
T 2026-10-15 18:37       3502 ./win3-20261015T223528Z/ab-launch.log
T 2026-10-15 18:55       1183 ./win3-20261015T223528Z/ab/ab.out
T 2026-10-15 18:47      14864 ./win3-20261015T223528Z/ab/ab_sweep.py
T 2026-10-15 18:55     122483 ./win3-20261015T223528Z/ab/points.jsonl
T 2026-10-15 18:55       1183 ./win3-20261015T223528Z/ab/progress.log
T 2026-10-15 18:55       1728 ./win3-20261015T223528Z/ab/summary.csv
T 2026-10-15 18:55       3368 ./win3-20261015T223528Z/ab/summary.json
T 2026-10-15 18:55      62937 ./win3-20261015T223528Z/candidate.log
T 2026-10-15 18:37       1333 ./win3-20261015T223528Z/compare.log
T 2026-10-15 19:00        207 ./win3-20261015T223528Z/free-after.txt
T 2026-10-15 18:35        207 ./win3-20261015T223528Z/free-before.txt
T 2026-10-15 18:37          0 ./win3-20261015T223528Z/p2p.err
T 2026-10-15 18:37        846 ./win3-20261015T223528Z/p2p.json
T 2026-10-15 18:37        294 ./win3-20261015T223528Z/pick.json
T 2026-10-15 18:35       1227 ./win3-20261015T223528Z/prod.env
T 2026-10-15 18:36        678 ./win3-20261015T223528Z/prod.log
- 2026-10-15 18:36    1183689 ./win3-20261015T223528Z/prod.pt
T 2026-10-15 18:35      14860 ./win3-20261015T223528Z/receipt-docker-inspect-before.json
T 2026-10-15 18:35        249 ./win3-20261015T223528Z/receipt-lib-sha-before.txt
T 2026-10-15 18:37       1149 ./win3-20261015T223528Z/vsg-b3.json
T 2026-10-15 18:36       9951 ./win3-20261015T223528Z/vsg.json
T 2026-10-15 18:37       9350 ./win3-20261015T223528Z/vsg.log
- 2026-10-15 18:36    4432271 ./win3-20261015T223528Z/vsg.pt
T 2026-10-15 19:00       1610 ./win3-20261015T223528Z/window.log
T 2026-10-15 19:00      10828 ./win3.nohup
T 2026-10-15 19:51       3765 ./win4-20261015T234904Z/ab-launch.log
T 2026-10-15 20:04     101927 ./win4-20261015T234904Z/ab/points.jsonl
T 2026-10-15 20:04       1861 ./win4-20261015T234904Z/ab/prof.out
T 2026-10-15 19:58      16247 ./win4-20261015T234904Z/ab/prof_sweep.py
T 2026-10-15 20:04       1861 ./win4-20261015T234904Z/ab/progress.log
T 2026-10-15 20:04       1721 ./win4-20261015T234904Z/ab/summary.csv
T 2026-10-15 20:04       3361 ./win4-20261015T234904Z/ab/summary.json
T 2026-10-15 20:04      86384 ./win4-20261015T234904Z/candidate.log
T 2026-10-15 19:51        449 ./win4-20261015T234904Z/compare.log
T 2026-10-15 20:29        207 ./win4-20261015T234904Z/free-after.txt
T 2026-10-15 19:49        207 ./win4-20261015T234904Z/free-before.txt
T 2026-10-15 20:23      69341 ./win4-20261015T234904Z/k7-candidate.log
T 2026-10-15 20:05       3503 ./win4-20261015T234904Z/k7-launch.log
T 2026-10-15 20:23       1182 ./win4-20261015T234904Z/k7/ab.out
T 2026-10-15 20:15      14864 ./win4-20261015T234904Z/k7/ab_sweep.py
T 2026-10-15 20:23     118732 ./win4-20261015T234904Z/k7/points.jsonl
T 2026-10-15 20:23       1182 ./win4-20261015T234904Z/k7/progress.log
T 2026-10-15 20:23       1723 ./win4-20261015T234904Z/k7/summary.csv
T 2026-10-15 20:23       3363 ./win4-20261015T234904Z/k7/summary.json
T 2026-10-15 19:51        237 ./win4-20261015T234904Z/pick.json
T 2026-10-15 19:49       1227 ./win4-20261015T234904Z/prod.env
T 2026-10-15 19:50        273 ./win4-20261015T234904Z/prod.log
- 2026-10-15 19:50     395455 ./win4-20261015T234904Z/prod.pt
T 2026-10-15 20:02      20650 ./win4-20261015T234904Z/prof/profiler_out_0.txt
T 2026-10-15 20:02      20650 ./win4-20261015T234904Z/prof/profiler_out_1.txt
- 2026-10-15 20:01     669337 ./win4-20261015T234904Z/prof/rank0.1792108915169244571.pt.trace.json.gz
- 2026-10-15 20:01     669061 ./win4-20261015T234904Z/prof/rank1.1792108915379328507.pt.trace.json.gz
T 2026-10-15 19:49      14859 ./win4-20261015T234904Z/receipt-docker-inspect-before.json
T 2026-10-15 19:49        249 ./win4-20261015T234904Z/receipt-lib-sha-before.txt
T 2026-10-15 19:51       5435 ./win4-20261015T234904Z/reg-edge130.json
T 2026-10-15 19:51      10973 ./win4-20261015T234904Z/reg-edge3000.json
T 2026-10-15 19:51      11463 ./win4-20261015T234904Z/reg.json
T 2026-10-15 19:51      23469 ./win4-20261015T234904Z/reg.log
- 2026-10-15 19:51    3203037 ./win4-20261015T234904Z/reg.pt
T 2026-10-15 20:29     669337 ./win4-20261015T234904Z/trace-rank0.1792108915169244571.pt.trace.json.gz
T 2026-10-15 20:29      10060 ./win4-20261015T234904Z/trace-rank0.1792108915169244571.pt.trace.json.gz.summary.json
T 2026-10-15 20:29     669061 ./win4-20261015T234904Z/trace-rank1.1792108915379328507.pt.trace.json.gz
T 2026-10-15 20:29      10085 ./win4-20261015T234904Z/trace-rank1.1792108915379328507.pt.trace.json.gz.summary.json
T 2026-10-15 20:29       2201 ./win4-20261015T234904Z/window.log
T 2026-10-15 16:57       3387 ./window.sh
T 2026-10-15 18:11       5290 ./window2.sh
T 2026-10-15 17:19     182152 ./xe2_kv_cascade.cpp
T 2026-10-15 17:19     181979 ./xe2_kv_cascade.window-tested.cpp
T 2026-10-15 17:30     215806 ./xe2_kv_chunk.cpp
T 2026-10-15 19:42     247716 ./xe2_kv_reg.cpp
T 2026-10-15 19:42     247614 ./xe2_kv_reg.v1.cpp
T 2026-10-15 18:30     231473 ./xe2_kv_vsg.cpp
```

### <HOME>/grok-c4-analysis-20261015/
(inputs/astra-review-20261015/ and inputs/github-k8v4-xpu/ expanded trees omitted: 1240 and 254 files)
```
T 2026-10-15 15:44        781 ./.monitor.py
T 2026-10-15 15:37      13036 ./EXTERNAL-AGENT-START-HERE.md
T 2026-10-15 15:38      10535 ./PROMPT.md
T 2026-10-15 15:55      17258 ./REPORT.md
T 2026-10-15 15:54       1053 ./STATUS.md
T 2026-10-15 15:55       5382 ./findings.json
T 2026-10-15 15:55    2971014 ./grok.log
T 2026-10-15 15:39          8 ./grok.pid
- 2026-10-15 15:37   82408586 ./inputs/astra-review-20261015.tgz
- 2026-10-15 15:37    2313046 ./inputs/github-k8v4-xpu.tgz
T 2026-10-15 15:48      25384 ./measure/ab-results.json
T 2026-10-15 15:46      14093 ./measure/ab_step_time.py
T 2026-10-15 15:52        605 ./measure/derived-preview.json
T 2026-10-15 15:52          4 ./measure/health-after.txt
T 2026-10-15 15:52      79171 ./measure/metrics-after.txt
T 2026-10-15 15:47      79143 ./measure/metrics-before.txt
T 2026-10-15 15:52        655 ./proposed/README.md
T 2026-10-15 15:52       3050 ./proposed/decode-stage-timer.md
T 2026-10-15 15:52       2485 ./proposed/shared-prefix-fusion.md
T 2026-10-15 15:39         37 ./session-id.txt
T 2026-10-15 15:59      14850 ./sweep-20261015T195903Z/docker-inspect.json
T 2026-10-15 15:59       8250 ./sweep-20261015T195903Z/docker-log-kv.txt
T 2026-10-15 15:59      79172 ./sweep-20261015T195903Z/metrics-start.txt
T 2026-10-15 15:59       1409 ./sweep-20261015T195903Z/models.json
T 2026-10-15 17:11    1119326 ./sweep-20261015T195903Z/points.jsonl
T 2026-10-15 17:11       7170 ./sweep-20261015T195903Z/progress.log
T 2026-10-15 17:11       7170 ./sweep-20261015T195903Z/stdout.log
T 2026-10-15 17:11      13303 ./sweep-20261015T195903Z/summary.csv
T 2026-10-15 17:11      34561 ./sweep-20261015T195903Z/summary.json
T 2026-10-15 15:59      14521 ./sweep-20261015T195903Z/sweep.py
```

### <HOME>/k8v4-concurrency-handoff-2026-10-15/ (context, all in tarball)
```
2026-10-15 15:16       9163 ./2026-10-15-200k-attention-counter-results.md
2026-10-15 15:16       5798 ./2026-10-15-astra-audit-review.md
2026-10-15 15:16       3715 ./2026-10-15-b70-external-comparison.md
2026-10-15 12:00      11614 ./2026-10-15-counter-decision-plan.md
2026-10-15 15:16       3966 ./2026-10-15-exact-kernel-throughput.md
2026-10-15 15:16       8255 ./2026-10-15-layout-merge-experiments.md
2026-10-15 12:00       4825 ./2026-10-15-narrow-attention-capture.md
2026-10-15 15:16       8803 ./2026-10-15-native-hotpath-followup.md
2026-10-15 15:16      13969 ./2026-10-15-native-instruction-experiments.md
2026-10-15 15:16       6783 ./2026-10-15-production-c4-observations.md
2026-10-15 11:11       4482 ./2026-10-15-recovered-telemetry.md
2026-10-15 15:16       7113 ./2026-10-15-reserved-c2-investigation.md
2026-10-15 15:16      13036 ./HANDOFF-2026-10-15-attention-next-steps.md
2026-10-15 13:59       8871 ./START-HERE.before-20261015T175934Z.md
2026-10-15 14:50      10085 ./START-HERE.before-20261015T185014Z.md
2026-10-15 14:58      12319 ./START-HERE.before-20261015T185828Z.md
2026-10-15 15:16      12784 ./START-HERE.before-20261015T191629Z.md
2026-10-15 15:16      13036 ./START-HERE.md
2026-10-15 01:22      14557 ./astra-FINAL-RECOMMENDATIONS.md
2026-10-15 01:22       7231 ./astra-NEXT-AGENT-HANDOFF.md
2026-10-15 01:22      40967 ./astra-data-audit.md
2026-10-15 01:22      32197 ./astra-native-audit.md
2026-10-15 11:24       3282 ./devicewide-capability-active.summary.json
2026-10-15 11:31       4836 ./devicewide-vector-stalls.summary.json
2026-10-15 01:22       5798 ./our-astra-audit-review.md
2026-10-15 10:27       5272 ./prefix-cache-launcher.patch
2026-10-15 10:27       1815 ./prefix64-candidate.json
2026-10-15 10:04       6783 ./production-c4-observations.md
2026-10-15 11:11      24978 ./recovered-counter-summary.json
2026-10-15 10:27       7113 ./reserved-c2-investigation.md
2026-10-15 12:00        957 ./restore-validation.json
2026-10-15 10:27       1847 ./runtime-import-paths.json
```
