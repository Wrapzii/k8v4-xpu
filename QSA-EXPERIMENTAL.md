# QSA experimental runtime snapshot

This branch contains a snapshot of work in progress on K8/V4 QSA for Intel XPU. It is not a validated production release. The code includes compact indexer-cache experiments, pooled INT8 scoring, batched scoring, MTP scheduling guards and graph-width experiments. The snapshot also includes the vLLM graph utility patch and the Python startup hook used by the experiment.

The original experimental setup loaded several separately built native libraries. Sources for the available compact-tail variants are included under `k8v4_v030/native/compact-fp` and `k8v4_v030/native/compact-int8`, but binary-to-source correspondence has not been verified for every library. The external prefill sidecar source and full build/launch configuration have not yet been assembled here. In particular, do not assume the checked-in `qsa_xpu.cpp` reproduces the native library used in the reported server run. Rebuilding and validating the complete combination remains required.

The experiments used model weights and a modified vLLM XPU environment that are not bundled. The host-specific build paths have been replaced with configurable paths. The broader test suite was reported to have failures and the speed and quality results are still being investigated. Results from synthetic tests, differing cache states, or short responses should not be treated as validated production throughput.

The current code snapshot comes from the local speed-fix repository at its 2026-11-11 `cd0097d` state. It is published for inspection and collaboration; do not deploy this branch without independently validating correctness, build provenance, concurrency, memory limits and end-to-end performance.

The INT8 pooled-key row-mirror change from local commit 08547cb is also included. It has not been established as a measured end-to-end speedup.

## Progress and evidence

See [QSA optimization progress](docs/qsa-optimization-progress.md) for current
component results, limitations, and the distinction between kernel timing and
end-to-end serving throughput. Only portable code and sanitized evidence belong
in this branch; host-specific orchestration and private raw artifacts stay local.

## Later additions (Nov 12 2026)

Short-decode attention gained a tuned three-head grp3 split kernel in its own library
(`k8v4_v030/native/qsa_grp3_split_fast.cpp`, built by `k8v4_v030/compile_qsa_grp3.sh`),
a per-layout split-width pick (TP1 24Q/4KV: 32 for the shipped kernel, 48 for the tuned
one; TP2 12Q/2KV: 64; override with `K8V4_QSA_DECODE_SPLIT`), and an opt-in
`K8V4_QSA_PUBLICATION_SYNC=0` switch that skips the post-step host wait. The tuned
kernel's gain is about 1.11x kernel-only in matched same-process timing; it has not been
measured in serving. Details, numbers and their caveats: `docs/qsa-grp3-decode-kernel.md`.
