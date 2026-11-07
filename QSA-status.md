# Current status — November 6, 2026, 9:45 PM ET

Indexer retrain finished. New weights beat the old local pack and match the author pack on a real Hermes holdout (0.931 vs 0.615 vs 0.927). A 200K exact-path run with dense prefill plus QSA decode was coherent (768 tokens, no heading loop). Prefill is ~1,026 client tok/s at 200K (engine ~2,028 on 10K prompts). Decode is ~48 tok/s at 200K; concurrency 4 is ~20 aggregate tok/s, not 75/user. Production remains stopped. Details in QSA-handoff.md.

---

# Current takeover status - November 6, 2026, 6:05 PM ET

Work is active; production remains stopped. Shared prefill repeated, while per-query FP32 generated 768 tokens without an obvious loop in two single-user tests. The tie-checked selector measured about 585 prefill and 66.5 decode tokens/s on one 200K run, versus 422 and 66.1 before that selector. The split-attention model comparison is starting. Concurrent logical indexer isolation and four 200K capacity are not solved. See QSA-handoff.md and the project audit for details.

---

# QSA status (Nov 6, 2026, 5:02 PM ET)

Handoff: `C:\Users\WhiteWidow\QSA-handoff.md` and `/home/dan/agent-work/qsa-fix/QSA-handoff.md`. Nothing is committed. Production is still stopped. Work stopped here on request.

Logical token indexing fixed the `1. 1. 1` collapse. Shared prefill on the 200K architecture prompt is about 1,600 tok/s and beats dense prefill. Decode on a real answer is 51–57 tok/s. Dense real text on the short repeated-word prompt was about 127 tok/s. MTP acceptance is about 2.8 tokens per step. Reusing the target's selected row for the draft made acceptance look high only by repeating `(V)`.

A later shared run still ends in `###` after a real opening (character 1710 of 2213). Exact per-query stayed on topic and was slow (about 427 tok/s prefill).

Four 200K streams cannot reside (KV 718,202 tokens). After the visible-matrix fix they no longer crash the engine. Peak was 2 running, 2 waiting.

At 5:02 PM ET the dense test server is stopped, the bench hold is released, and `/run/vllm-intentional-stop` is still set. `vllm-k8v4-tp2` was not started. A dense bench started at 5:00 PM ET wrote empty files and is not a result.
