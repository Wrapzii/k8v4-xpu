# QSA optimization progress

## Status — 2026-11-13

The target remains faster prefill and generation than matched dense attention,
with little throughput loss as retained context grows. The production-shaped
target is concurrency 4, TP2, MTP depth 6, K8/V4, and `FULL_DECODE_ONLY`, with
800K aggregate retained context; 700–750K is the minimum capacity target.
**Neither the 2× dense-throughput target nor that capacity/quality combination
has been demonstrated by the work below.**

## What the quantizer does

An activation quantizer prepares intermediate model values for a lower-precision
matrix multiplication. It produces packed numbers plus the scales and zero-point
metadata needed to interpret them. It is one component of prefill, not the whole
model, attention implementation, or token-generation loop. A faster quantizer
does not imply proportionally faster responses or improved generation speed.

## Measured component result

A lane-local reduction reduced the cost of the native FP16 activation quantizer.
The following are same-process device-event medians, with six samples per arm
per shape on one XPU. The baseline is the **previous native quantizer**, not the
production-default compiled quantizer and not dense model serving.

| Input shape | Previous native median | Lane-local median | Component speedup |
|---|---:|---:|---:|
| 512 × 5,120 | 0.292422 ms | 0.161953 ms | 1.81× |
| 512 × 17,408 | 0.866615 ms | 0.463750 ms | 1.87× |

[Sanitized measurements and individual samples](benchmarks/w4a8-quantizer-component-2026-11-13.json)
retain the original arm/block ordering and both device-event and wall-clock
samples. The table uses device-event medians; it is not a claim about end-to-end
latency. Host paths, credentials, process identifiers, control tokens, container
identifiers, and private launch scripts are deliberately omitted.

### What these numbers do not establish

- No post-change model prefill tokens/s (`pp`) or generation tokens/s (`tg`) has
  been established for this optimization.
- The result does not show a win over the serving-default compiled quantizer.
  A separate compiled-baseline comparison reported a regression at width 17,408;
  broad enablement is therefore not justified. Its figures are not mixed into
  the native-to-native table above.
- Quantize-to-GEMM integration, graph capture/replay, real model quality, and
  concurrency-4 capacity still require independent qualification.
- CPU dispatch tests and source review are not proof of XPU numerical correctness
  or serving performance. Local runtime integration remains under review and is
  not included in this documentation/evidence update.
- Strict per-row attention is a separate experimental policy, not a silently
  equivalent replacement for the incumbent shared-selection policy.

## Next evidence required

1. Resolve runtime integration review findings and preserve default-off behavior.
2. Verify native quantize-to-GEMM results and graph replay against the exact
   serving-default path, using the same inputs and numerical policy.
3. Measure old/new QSA and matched dense through `xpu-llm-bench`, reporting actual
   prefill and generation throughput, time to first token, and quality separately.
4. Repeat under the concurrency-4 retained-context target before claiming either
   near-flat scaling, production capacity, or a model-level speedup.

## Publication boundary

Publish portable implementation, regression tests, and sanitized measurement
summaries. Keep machine-specific orchestration, service/lease configuration,
private model paths, credentials, personal information, and raw host/container
inspection output out of Git. Ignore rules are a guardrail, not a replacement
for reviewing the exact staged diff. Existing Git history is not rewritten by
this progress update.
