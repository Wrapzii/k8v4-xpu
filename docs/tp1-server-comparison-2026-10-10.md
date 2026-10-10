# Existing B60 TP1 deployment versus PR #1

The October 8 Studio integration already runs Swift 1.5 Qwen 27B on one B60,
leaving the second GPU for the image editor. The October 10 inspection confirms
that this is an isolated four-head build. [davetha's PR #1](https://github.com/Wrapzii/k8v4-xpu/pull/1)
solves a broader packaging problem: one native library and Python package handle
both layouts from the actual tensor/layer head counts.

This integration branch retains the contributor's commits and adds portable
launch controls from our server. The running server still uses its older isolated
build; the new unified library has not been deployed there.

## Exact overlap and differences

Compared with published main `b38db4b87f7238b63271a1d06e69dea3f40f1f03`, the
deployed TP1 C++ source differs only in these three constants:

```cpp
HKV = 4;      // main: 2 local KV heads
HQ = 24;     // main: 12 local query heads
S2_NWG = 32; // main: 16 stage-2 work groups
```

The deployed Python package differs only in `layout.py`'s `HKV=4`, `HQ=24`.
The other deployed top-level package modules match main, ignoring line endings.
The Studio preparation script copied the serving package into a separate directory,
changed those constants, compiled a separate library and mounted the matching pair.

| Area | Existing B60 deployment | PR #1, head `79aebb1` |
| --- | --- | --- |
| Native layout | Separate TP1 library, fixed 4 KV / 24 Q heads | Templates instantiate both layouts; dispatch from tensors |
| Python geometry | Separate package with module constants | Frozen `PageLayout` passed through cache, scratch, prefill and backend |
| Stage-2 work groups | 32 for TP1, 16 for TP2 | `HKV * 64 / 8`, yielding the same counts |
| Scratch | Static deployment geometry | Indexed by device and layout; mismatch checks |
| TP1 and TP2 packaging | Must pair each library and package correctly | One library/package avoids that deployment mismatch |
| Drafting | Native MTP, six draft tokens | Also adds an optional DFlash2/stock-FP8 skip-layer integration |
| Launcher | Studio-specific clone of the existing TP2 container | PR did not adapt this repo's TP2-only `launch.sh` |
| Capacity | Retries a specific KV-capacity error at the reported fitted length | B70 example reports 262K context; it is a different card/checkpoint/configuration |

The runtime refactor is preferable for the shared repository. Replacing it with
our old constant substitutions would lose its ability to serve both layouts safely.
Our contribution here is the deployment profile and capacity policy, plus an
explicit record of the already tested B60 implementation.

## Observed B60 profile

The sanitized [settings snapshot](../results/tp1-b60-server-2026-10-10/settings.json)
records the actual running container on October 10:

- One B60, TP1, one active sequence, **133,056-token actual maximum context**.
- The requested 262,144-token vision-enabled configuration had exceeded KV
  capacity. Startup fitted the window to the estimate; this is not a 262K TP1 result.
- GPU memory utilization 0.92; four image inputs, 1,048,576 image pixels,
  0.125 GiB multimodal processor cache; no video input.
- K8/V4, oneDNN prefill, fused Triton gather, MLP W4A8 and INT8 embedding.
- Native MTP with six draft tokens; `FULL_DECODE_ONLY` graphs.
- Prefix caching disabled and Mamba cache mode `none`; distinct TP1 cache directory.
- Device affinity selects GPU 0; cross-card peer access is disabled for this profile.

The deployed container inherited TP2 graph capture sizes `[7,14,21,28]` despite
one active sequence. The portable launcher derives `[7]` for one sequence and
preserves `[7,14,21,28]` for the default four-sequence TP2 profile. No new speed
measurement is claimed for this change.

The saved [native correctness receipt](../results/tp1-b60-server-2026-10-10/kernel-xpu.json)
contains **11 successful checks**: MTP lengths 59,500, 59,527, 63,932 and 70,000;
partial-page boundaries; dirty-tail masking; and prefix-block copying/mutation.
Its environment record names the same library currently installed:

```text
TP1 source:  70773b1119e2be534e4fdef13c2c89343c68a4a1f3911a55347342b67a33af2a
TP1 library: 23bc4c95dd7fefb7f7fef3b8f2066ee0ece58f2b301b12f20675bf4db26b39e5
```

These receipts validate the **older fixed-layout** library. They do not validate
the PR's new two-layout binary. Its author reports tests on one B70, including
bitwise comparison with the old TP2 math, and explicitly did not run actual
two-GPU TP2 serving. Our current Windows CPU run of the integration is recorded
below; new GPU testing must run separately before replacing the deployed library.

## Portable TP1 launch

Build the unified library/image as described in [TP1-B70.md](../TP1-B70.md).
The native layout continues to come from tensors; `K8V4_TP` only chooses vLLM's
launch configuration.

```bash
MODEL_DIR=/path/to/Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8 \
K8V4_TP=1 K8V4_DEVICES=0 K8V4_MAX_MODEL_LEN=133056 \
bash k8v4_v030/launch.sh
```

Defaults for TP1: image `vllm-openai-xpu:v0.30.0-k8v4-tp1`, container
`vllm-k8v4-tp1`, localhost port 8201, one sequence, GPU memory fraction 0.92,
prefix caching off, and a separate cache namespace. `K8V4_DEVICES=1` chooses
the second card instead. TP2 keeps its existing image/name/8200 port, four
sequences, prefix caching and collectives. The launcher only configures the
selected GPU indices. The other card can run the editor if host RAM permits;
device affinity does not isolate system RAM.

To start at a larger requested window and explicitly permit fitting:

```bash
MODEL_DIR=/path/to/weights K8V4_FIT_CONTEXT=1 \
python3 tools/launch_tp1.py
```

The wrapper saves failed startup logs under the chosen cache's `startup/`
directory and prints the effective context before retrying. It only retries a
stopped container after a recognized KV-capacity error and a smaller reported
estimate of at least 8192 tokens. It stops after three launches. Driver faults,
allocation errors, unknown failures and a still-running unresponsive container
are not treated as capacity problems. Fitting is off unless explicitly enabled.
Use `/v1/models` to verify the final served context.

`K8V4_PREFIX_CACHING=1` is an explicit override; TP1 prefix/Mamba caching was
disabled in Studio, so this integration does not claim it is validated there.
For argv inspection, `K8V4_DRY_RUN=1` emits NUL-separated Docker arguments
without starting containers, creating caches or configuring GPUs.

## Validation for this integration

The PR's original 87-test suite passed on Windows CPU (seven skipped: six XPU
tests and one test requiring vLLM). The complete integration suite has 96 tests,
with 89 passing and the same seven skipped. The integration adds real Bash command
construction checks for TP1/TP2 and capacity retry tests. These exercise defaults,
GPU selection, graph sizes, optional overrides, invalid device lists, fault
classification, saved logs and refusal to restart a running container. No live service was restarted and
no new TP1/TP2 generation performance benchmark was run during this comparison.
