# TP2 × CP2 implementation checks, October 16

**The two-card attention primitive now has combined long-context results.
Four-card model serving and model/task fidelity remain untested.**
See [validation.json](validation.json) and the
[tester guide/handoff](../../docs/TP2-CP2-FOUR-GPU.md).

- CPU suite: 132 tests, zero failures/errors, 10 hardware/API-dependent skips.
- Source-pinned vLLM adapter: real-source application, idempotency and backend
  import checks passed; the stock compiler image source contract also passed.
- Rebuilt native library: one physical B60 executing two virtual shards passed
  32 native cases, worst relative L2 **0.03396%**. Fused merge covered extreme
  LSE and empty shards. [Native test log](native-parallel-lse.log).
- Two physical B60s: **24 combined checks** passed at 128K/about 200K,
  C1/C2/C4, q1/q7, eager and changed-input graph replay, under the **0.1%**
  attention-output relative L2 gate. Every merged/reference output was finite.

## Combined attention timing with parallel LSE export

Production was stopped. The test container had no CPU quota, an 8 GiB memory
limit and 12 GiB memory-plus-swap limit. Twenty synchronized repetitions after
three warmup calls; reported time is the slowest rank. These are single-run
microbenchmarks, with clocks left unchanged, not endpoint throughput.
Independent shuffled request histories; two local KV heads; 2112-token manager
blocks; 64-token CP stripes. Graph replay changed Q and sequence lengths.

Raw receipts: [eager](pair-long-eager.json), [graphs](pair-long-graph.json).
The table is the graph result. Component timings are separate measurements
and need not sum to the directly measured combined time.

| Context | Batch | Query rows/request | Unsplit ms | Local walk + LSE ms | Collective + merge ms | Combined CP ms | Attention speedup | Relative L2 |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 131072 | C1 | 1 | 1.482 | 0.821 | 0.180 | 0.761 | 1.95× | 0.0668% |
| 131072 | C1 | 7 | 2.099 | 1.243 | 0.189 | 1.281 | 1.64× | 0.0680% |
| 131072 | C2 | 1 | 2.134 | 1.263 | 0.200 | 1.306 | 1.63× | 0.0658% |
| 131072 | C2 | 7 | 4.129 | 2.323 | 0.225 | 2.391 | 1.73× | 0.0678% |
| 131072 | C4 | 1 | 4.165 | 2.353 | 0.184 | 2.417 | 1.72× | 0.0674% |
| 131072 | C4 | 7 | 8.171 | 4.498 | 0.275 | 4.623 | 1.77× | 0.0671% |
| 200003 | C1 | 1 | 1.609 | 0.988 | 0.196 | 1.036 | 1.55× | 0.0685% |
| 200003 | C1 | 7 | 3.146 | 1.772 | 0.205 | 1.830 | 1.72× | 0.0688% |
| 200003 | C2 | 1 | 3.131 | 1.776 | 0.190 | 1.789 | 1.75× | 0.0657% |
| 200003 | C2 | 7 | 6.126 | 3.395 | 0.229 | 3.465 | 1.77× | 0.0684% |
| 200003 | C4 | 1 | 6.182 | 3.386 | 0.197 | 3.431 | 1.80× | 0.0691% |
| 200003 | C4 | 7 | 12.170 | 6.622 | 0.282 | 6.744 | 1.80× | 0.0680% |

“Unsplit” is this harness's ordinary native per-request attention on each rank,
not a model server or the shared-prefix drafter cascade. “Combined” includes
the real two-device collective and device merge. This tests **one CP pair**;
it does not include competing TP collectives/a second CP pair or the rest of
the model. Do not translate its speedup directly into tokens/second.

## Why the first version lost

The initial implementation scanned all M/L page statistics serially per output
row to export the local softmax normalization. It passed correctness but
erased the half-history savings: at 200K/C4, graph total was **7.311 ms q1**
versus 6.174 ms unsplit, and **12.469 ms q7** versus 12.162 ms unsplit.
Those losing receipts are preserved:
[serial eager](serial-lse-pair-long-eager.json),
[serial graphs](serial-lse-pair-long-graph.json).

The replacement parallelizes the M/L logsumexp over a 256-thread workgroup.
It reads no K/V and changes only the CP export; ordinary TP2 dispatch is
unchanged. The same numerical and timing tests were rerun on the rebuilt
library. Integrating export into S2 may remove another launch, but has not
been implemented or measured.

## Remaining qualification

Four physical GPUs, actual full-model startup, MTP/recurrent state, model/task
fidelity, serving speed and useful maximum concurrency still need the guide's
gates. CP prefill remains a correctness path, and CP q1 does not yet use the
shared-prefix drafter cascade. Compare against ordinary TP2 and two TP2
replicas before selecting the production layout.

The exact original production container was restarted and its actual bound
health endpoint returned **HTTP 200**. No CP runtime or candidate native
library was installed into that production container. Maintenance receipts:
[restoration](maintenance-result.json).

Earlier memory-capped diagnostic merge-only checks are retained in
[merge eager](merge-pair-eager.json) and [merge graphs](merge-pair-graph.json).
They used two CPUs/3 GiB/two iterations with production resident; their timings
are superseded for performance interpretation by the idle combined tests.
