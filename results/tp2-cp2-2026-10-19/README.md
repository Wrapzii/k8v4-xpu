# October 19 TP2 × CP2 fixes and component qualification

**Status: component-validated candidate; four-card model serving and speed
remain unqualified.** The screenshot's slow prefill has an identified code
path and replacement. Its 32K/C4 collapse has not been reproduced or proven
fixed on this host. Missing 128K/200K C2/C4 serving results remain missing.
The [tester procedure](../../docs/TP2-CP2-TESTING.md) makes these explicit gates.

## Changes

1. Replace default CP Python partition prefill with head-at-a-time striped-KV
   gather/reconstruction and production fused oneDNN attention. Do not apply
   another output/LSE merge to this complete result. Retain explicit slow
   reference mode for diagnosis; no silent fallback on the XPU path.
2. Restore q1 physical-prefix cascade for CP, including normalization exported
   before scratch reuse. Ordinary TP2's cascade operator/schema remains
   available. Keep q7 on its compact native path, not the slower q7 cascade.
3. Fix an actual empty-history bug in S2: forcing at least one live page read
   stale M/L/partial data left by a previous request. Empty output is now zero,
   LSE is `-inf`; no nonempty page order/arithmetic is changed by that fix.
4. Add matched TP2 launcher mode, actual rank/device/group reports, image/ABI
   identity checks, real-collective prefill/cascade harnesses and repeated
   serving measurements with raw SSE/token counters and strict validity gates.

## Executed checks

All GPU checks used **one free B60, selected by ZE_AFFINITY_MASK=0**. Two CP
lanes were simulated on that device where stated. They do not measure real
CP communication. A different manual workload owned the other B60 and was
left untouched. The production vLLM container was already stopped and remains
stopped; no production image or startup configuration was replaced.

| Check | Observed result | Receipt |
| --- | --- | --- |
| Local CPU suite | 148 run, 15 skipped, no failures | [log](cpu-local.log) |
| CPU suite in patched vLLM image | 148 run, 14 skipped, no failures; device-specific tests skipped without device access | [log](cpu-runtime-image.log) |
| Focused XPU run | 9 tests pass (7 device tests and 2 CPU reconstruction/mode tests) | [log](gpu-components.log) |
| Full-size prefill chunk | 4224 query rows at 4225/200003 history; both virtual lanes, original/changed Q; relative L2 **0** against independently packed ordinary oneDNN cache | [log](gpu-components.log) |
| Prefill vs float32 partition reference | Finite, worst relative L2 **0.00035763651 = 0.035763651%**; stripe edges and 200K history | [log](gpu-components.log) |
| Native striped decode/LSE | q1/q7, manager ratios 1/33, edge lengths, fused merge; worst relative L2 **0.00033956626 = 0.033956626%** | [log](gpu-components.log) |
| CP q1 cascade | Bitwise output match vs serial, LSE tolerance 3e-5 absolute / 2e-6 relative; B1/B4/B8, independent/shared prefixes, empty request, changed-input graph replay | [log](gpu-components.log) |
| Empty partition | Poisoned previous-request scratch; q1/q7, serial/parallel S2, FP16/FP32 partial settings; zero output and `-inf` LSE | [log](gpu-components.log) |
| Native build | Intel 2026 compiler succeeds; two existing C++20-extension warnings | [log](native-build.log) |
| Runtime installation / ABI | Hash-guarded adapter install and both partition/cascade LSE symbols load in isolated image | [build log](runtime-image-build.log), [metadata](component-metadata.json) |

The native library SHA256 was
`909f7dd3201685fbfb769bbc20408f763b5e170be62b4550944d2cf8defb8998`.
Library, SDPA, oneDNN, device, Torch and installer identity are recorded in
the metadata. The installation smoke build used the existing
`vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2` base with an explicit build-arg
and a separate `k8v4-tp2cp2-fixes:20261019` tag. It did not rebuild the complete
unified base image from scratch or start a model server. The active runtime
source root was checked by the installer. Testers should build the documented
unified/CP image sequence and retain its exact image ID.

One small local timing was recorded with 200003 history / 128 query rows:

| Local operation | Warm mean, three calls |
| --- | ---: |
| Old Python **local partition**, without CP output merge | 83.502 ms |
| New complete oneDNN output, **virtual** gather | 29.567 ms |

This is a local implementation check, **not an endpoint or real-collective
speedup**. The two operations have different communication requirements;
the virtual gather does not transfer K/V between GPUs. The real four-rank
prefill harness measures that missing transfer and temporary workspace cost.
Do not multiply a model token rate by this timing ratio.

## Rejected / corrected during validation

* A direct packed-cache Triton attention candidate passed small cases but
  caused an Intel IGC floating-point internal compiler error at a larger tile.
  Smaller tiles still failed. That implementation is **not in the branch**.
* Early cascade tests exposed the stale empty-page read. The final native
  build includes the zero-page fix and explicit poisoned-workspace regression.
* The standalone backend geometry unit test now explicitly disables CP,
  because that test constructs no model/group context. CP guards themselves
  remain mandatory in the runtime. Early remote suite attempts lacked public
  documentation fixtures; the complete-tree suite above passes with them.

## Still required before promotion

Run the complete [four-card qualification](../../docs/TP2-CP2-TESTING.md):
actual all-gather/merge timings and peak memory, four unique selected devices
and correct groups, model/task and recurrent-state fidelity, MTP sampling and
graph behavior, then matched three-repeat 128K/200K C1/C2/C4 serving and the
200K + 10K-output capacity run. Diagnose the 32K/C4 loss from those raw
receipts. Do not call it fixed based on these single-device tests.

The new prefill path replicates complete attention and exchanges full FP16
K/V temporarily. PCIe cost can erase its local compute gain. q1 cascade
only helps identical physical prefixes; it cannot combine unrelated histories
or reuse arbitrary matching files in the middle of a prompt. CP retains
replicated GDN/MLP/weights. None of these changes promises that four cards
will beat two at short contexts, or that C8 will preserve a C4 latency gain.
