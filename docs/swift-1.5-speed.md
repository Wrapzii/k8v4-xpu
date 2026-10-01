# Swift speed check — October 1, 2026

These are live-load observations, not isolated concurrency-one benchmarks. An attempt to obtain an idle endpoint was abandoned because another client was actively using it and the operator requested that client remain running. Wrapzii's gateway was restored. Each benchmark request was sent serially, but every recorded request observed overlapping traffic. There is no matching live-load Qwen bake baseline.

The Swift AutoRound checkpoint retains its original weights: output head, MTP modules and embedding are dense. Only GPTQ loader metadata and deterministic group indices were adapted. The service uses the Xe2 K8/V4 backend (`int8_k_int4_v`), TP2, MTP6, `FULL_DECODE_ONLY`, max length 262144, max sequences 4, batch cap 4224, vision enabled and the existing decode library. Thinking is disabled for these probes, matching the previous coding benchmark. This does not change Hermes's low default.

The task and behavior checks are the same as `bench/serve_coding.py`. A unique marker at the beginning of each context size prevents reuse of an earlier request's long prefix. Each size has one initial cold request and two warmed requests. Decode excludes the tokens in the first streamed update and stops at natural EOS. All twelve generated functions passed the embedded behavior checks.

| Prompt tokens | Cold TTFT | Effective cold prefill | Warmed median decode | Warmed decode range | Peak running requests |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 2,177 | 1.88 s | 1,157 tok/s | 71.0 tok/s | 59.3–82.6 tok/s | 2–3 |
| 8,183 | 4.80 s | 1,704 tok/s | 55.3 tok/s | 52.0–58.6 tok/s | 2 |
| 128,188 | 118.56 s | 1,081 tok/s | 43.6 tok/s | 42.8–44.3 tok/s | 2 |
| 200,182 | 224.01 s | 894 tok/s | 29.4 tok/s | 28.4–30.5 tok/s | 2 |

Effective cold prefill is prompt tokens divided by client time to first token. It includes queueing, cold kernel work and serving overhead. The 128K and 200K initial requests also observed one waiting request. Cached-request TTFT is not a cold-prefill measurement. Concurrency was sampled once per second and is an observation rather than proof that no shorter overlap occurred.

The previously published Qwen bake results of 77.06 tok/s at approximately 128K and 62.49 tok/s at approximately 200K were isolated, used a different serving profile, and cannot establish Swift's relative speed from this run. Dense special weights are another material configuration difference; their individual cost has not been measured. No additional weight bake was applied after these observations.

Raw records: [swift-coding-live.jsonl](../results/2026-10-01/swift-coding-live.jsonl). Server-wide prefill and speculation metric deltas in this file include other requests and must not be attributed to the benchmark request. Only its streamed timestamps and token counts support the table.

Reproduce with live traffic explicitly allowed:

```bash
python3 bench/serve_coding.py --base http://127.0.0.1:8100 \
  --model Swift-1.5-Qwen3.8-27b-AutoRound-GPTQ-compat \
  --lengths 2000,8000,128000,200000 --repeats 2 \
  --cold-prefix YOUR_UNIQUE_RUN_MARKER --allow-busy
```

Omit `--allow-busy` for an idle-endpoint attempt, then inspect observed concurrency to reject overlapping samples. Retain the older checkpoint for rollback and validate Swift-specific quantization separately before comparing a head/MTP/embedding bake.
