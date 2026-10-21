# swift-27b-tp2-b70 — Swift-1.5-Qwen3.8-27B, TP2 on two Arc Pro B70

Companion to `swift-27b-tp2-b70.json`, which holds the authoritative reproduction
input: image `vllm-openai-xpu:v0.30.0-k8v4-tp2cp2-q2` (`sha256:e85f8ae9…`), the exact
`docker run` argv, the 34-entry environment and the 21-argument `vllm` command line.
This file covers what the JSON cannot: the hardware that makes the shape work, and
what it measured.

## Result

| metric | value |
|---|---|
| single-stream decode | **120.5 tok/s** (pooled median of 9 samples over two boots; boot medians 120.0 and 121.0) |
| aggregate decode, 4 concurrent streams | **328.3 tok/s** (91.9 per stream, median of 5 rounds) |
| prefill, ~5.9K-token prompt | 3,393 tok/s |
| prefill, ~23.2K-token prompt | 3,157 tok/s |
| KV pool at util 0.90 | **1,284,329 tokens = 4.90x the 262,144 window** |
| package power, both cards, during the 4-stream rounds | ~498 W (~250 W/card) |

Method, so the numbers can be reproduced or challenged: one 300-token code prompt per
request, temperature 0, streamed; decode rate is tokens over the interval from first
to last streamed delta, with the token count from the server's usage block; prefill is
prompt tokens over time-to-first-token with a nonce-salted prefix, so the prefix cache
cannot inflate it. Single-stream is 3 samples in one boot plus 6 in a second (9
pooled); the 4-stream aggregate is the median of 5 rounds in the second boot. Raw arm
records carry every sample.

A second harness on the same image, layout, MTP6 and graph shape (BetterBench 0.6.1,
corpus v1.0, greedy, 20 passes per category) reports 162.1 tok/s decode, 87 ms TTFT,
139.0 / 222.6 / 339.2 aggregate at C1/C2/C4, and 3,460 / 2,967 tok/s prefill at
1.5K / 47K. It uses a different corpus with longer generations, and that row ran the
launcher default `util 0.95` rather than this recipe's 0.90, which is why its
single-stream figure is higher. Compare its concurrency column only, where the two
agree (339 vs 328 at four streams). Neither number is a fidelity claim — see caveats.

## Hardware that makes it possible

- **2x Intel Arc Pro B70, 32 GB each** (BMG-G31). The checkpoint is ~18.3 GB
  (17.1 GiB) of INT4; TP2 puts ~9 GiB of weights on each card (7.47 GiB per rank once
  the embedding is baked to int8), leaving ~19.3 GiB per card for KV at `util 0.90`.
  One card would fit the weights but not a 262,144-token window with useful
  concurrency; four cards are unnecessary, and this lane leaves two idle.
- **VRAM, not host memory, is the constraint.** The host has 61.2 GiB and no
  host-memory KV tier is used — the whole pool lives in device memory.
- **KV accounting:** per card, per full-attention layer, per token the K8/V4 layout
  costs 792 bytes against 1,024 for FP8 K+V (scales included; 16 of the 64 layers are
  full attention, the other 48 are GDN). That is 12,672 B/token across the 16 layers,
  or ~15.2 GiB of the 19.35 GiB budget at the measured pool. The remainder is GDN
  recurrent state plus page padding, so do not expect the two figures to reconcile
  exactly.
- **PCIe topology:** Gen4 x16 negotiated end to end — the root port and the switch
  uplink are Gen4, and the card-facing downstream ports are Gen5-capable but negotiate
  16 GT/s. There is no GPU-to-GPU link (BMG-G31 has no Xe Link); peer traffic rides
  the switch. Measured peer DMA is 28.2-28.6 GB/s one-way and 49.8 GB/s aggregate
  duplex per ordered pair, with peer atomics unsupported. This lane deliberately does
  **not** depend on peer DMA: topo-P2P collectives measured neutral at its decode
  sizes (40-290 KB, where the cost is handshake latency rather than bytes), so it runs
  plain oneCCL with the ring low-latency algorithm. Peer DMA is available headroom,
  not a requirement.
- **Engine:** vLLM 0.30.0 with the K8/V4 native attention backend (`libxe2_kv.so`),
  oneDNN prefill and MLP-only W4A8, on torch 2.13 with the native XCCL process group.
  Decode runs as `FULL_DECODE_ONLY` graphs at capture sizes `[7,14,21,28]`, i.e.
  max-seqs 4 x (1 + 6 speculative tokens).

## Settings that carry the performance

1. **MTP speculation with 6 draft tokens** and `use_local_argmax_reduction`. Without
   MTP this lane measured 26 tok/s; speculation is what turns it into 120.
2. **Decode graphs sized exactly to the spec arithmetic** (4 sequences x 7 = 28,
   captured at 7/14/21/28). Capture sizes that do not match the batch shape fall back
   to eager and lose most of the benefit: dropping `--graphs` measured 88 tok/s on
   this branch's earlier runs, against 120-162 with them.
3. **Async scheduler** (`--async-scheduling`): +4.2 tok/s single-stream at util 0.95
   and +6.1 at util 0.90 (roughly +4-5%), and ~+10% per-stream under four concurrent
   streams, measured with alternating boots. This is a scheduler class swap, not a
   streams or precision change.
4. **Ring all-reduce** instead of two-shot: 35.6 vs 38.6 us per graph-replayed 287 KB
   all-reduce (-8%).

Prefix caching is enabled. Worth knowing before anyone quotes a speedup for it: the
attention block here is 2112 tokens, so only shared prefixes longer than that can hit
— short repeat turns get nothing, which is why we make no multiplier claim for this
lane.

Measured and rejected here, so nobody re-runs them: the newer V2 model runner (no
throughput gain, and a smaller pool in both boots — 1.26M and 1.19M tokens against
1.28M), larger batched-token budgets (8192 neutral, 16384 -9% at concurrency), 8
sequences with capture to 56 (-6% at concurrency), topo-P2P / IPC-handle caching /
all-gather LL algorithm (neutral or worse), and the recordable peer-to-peer
all-reduce kernel from the 4-card B70 tree (12% per collective on that build, needs a
patch this image does not carry; our end-to-end estimate of under 2% was an estimate,
not a re-measurement). FP8 KV is *not* in that list: it is supported on this model
family — the stock server runs `fp8` — and is 29.3% larger per token than
`int8_k_int4_v` (1,024 vs 792 bytes per layer per token), so it is a capacity trade,
not a free option, and it was not A/B'd here.

## Caveats

- **Candidate, not qualified.** The branch's own gates still fail on the parent
  commit: attention rel-L2 1.336e-3 against a 1e-3 screen at 131,072 tokens, and the
  prefill comparison aborts with `DEVICE_LOST`. These throughput numbers are valid
  measurements of that candidate, not a fidelity sign-off.
- **Power-limited at concurrency.** The pair draws ~250 W per card against a 275 W
  firmware cap the driver refuses to raise, so most config changes land inside the
  noise once four streams are running. Single-stream work is limited by per-step
  fixed cost — on the order of a hundred all-reduces per decode step (64 layers x 2
  row-parallel projections, ~36 us each at the largest decode size) plus graph gaps —
  not by bandwidth.
- **`util 0.90` is deliberate.** 0.95 grows the pool to 1,384,612 tokens (+7.8%) at no
  measured throughput cost, but 0.90 is the value kept for headroom against the
  driver's memory-reclaim behaviour; treat 0.95 as a capacity lever that needs its own
  soak.
- **The launcher is not in this directory.** The argv above was produced by
  `tools/launch_tp2_cp2.py --layout tp2 --graphs --utilization 0.90` driven by
  `qual-build/run_arm.sh` (invoked with `B70_PORT=19622 B70_BIND=0.0.0.0
  B70_UTIL=0.90`), both in the qualification fork of this branch. The `docker_argv`,
  `gpu_env` and `vllm_argv` in the JSON are the authoritative reproduction input; the
  scripts only generate them.
