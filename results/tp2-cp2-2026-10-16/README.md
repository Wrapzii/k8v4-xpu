# TP2 × CP2 implementation checks, October 16

These are **component checks**, not a four-GPU server benchmark. See
[validation.json](validation.json) and the
[tester guide/handoff](../../docs/TP2-CP2-FOUR-GPU.md).

- Native library compiled and loaded; the source-pinned runtime adapter applied
  idempotently and imported against the real vLLM API and stock base source.
- CPU suite: 132 tests, zero failures/errors, 10 hardware/API-dependent skips.
- One physical B60, two virtual context shards: 32 native attention cases
  passed against the unsplit kernel, maximum relative L2 **0.03396%**.
- Fused packing/merge passed extreme-LSE, empty-shard and FP16/FP32 checks.
- Two physical B60s: real collective/merge passed q1/q7 and changed-input graph
  replay. This test uses synthetic C4 output tensors, not four model requests.

Raw collective receipts are [eager](merge-pair-eager.json) and
[graphs](merge-pair-graph.json). They were run with a two-CPU container cap,
3 GiB memory cap, two timing iterations and production still resident. Their
wall timings are diagnostics, not a performance qualification:

| C4 synthetic merge | Eager wall ms | Graph wall ms |
| --- | ---: | ---: |
| q1 | 3.590 | 1.151 |
| q7 | 2.122 | 1.131 |

Even these smoke timings remain costly; there is **no demonstrated serving
speedup**. Measure on the idle four-card host without these artificial CPU
caps and include the collective in total attention time. Do not infer a gain
from the half-history walk alone.

The combined native-plus-collective two-rank test did not complete within its
small host-memory caps. No combined result, 128K/200K CP result, four-GPU model
result or maximum-agent count is reported. Production remained the same
container and returned HTTP 200 on its actual bound health endpoint afterward.
