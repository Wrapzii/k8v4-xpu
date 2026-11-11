# QSA experimental runtime snapshot

This branch contains a snapshot of work in progress on K8/V4 QSA for Intel XPU. It is not a validated production release. The code includes compact indexer-cache experiments, pooled INT8 scoring, batched scoring, MTP scheduling guards and graph-width experiments. The snapshot also includes the vLLM graph utility patch and the Python startup hook used by the experiment.

The original experimental setup loaded several separately built native libraries. Sources for the available compact-tail variants are included under `k8v4_v030/native/compact-fp` and `k8v4_v030/native/compact-int8`, but binary-to-source correspondence has not been verified for every library. The external prefill sidecar source and full build/launch configuration have not yet been assembled here. In particular, do not assume the checked-in `qsa_xpu.cpp` reproduces the native library used in the reported server run. Rebuilding and validating the complete combination remains required.

The experiments used model weights and a modified vLLM XPU environment that are not bundled. The host-specific build paths have been replaced with configurable paths. The broader test suite was reported to have failures and the speed and quality results are still being investigated. Results from synthetic tests, differing cache states, or short responses should not be treated as validated production throughput.

The current code snapshot comes from the local speed-fix repository at its 2026-11-11 `cd0097d` state. It is published for inspection and collaboration; do not deploy this branch without independently validating correctness, build provenance, concurrency, memory limits and end-to-end performance.

The INT8 pooled-key row-mirror change from local commit 08547cb is also included. It has not been established as a measured end-to-end speedup.
