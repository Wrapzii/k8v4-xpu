# TP2 × CP2: reproducible four-card qualification

Use branch `codex/tp2-cp2-four-gpu`. This is a qualification candidate, not a
verified four-card speed improvement. Read the [architecture guide](TP2-CP2-FOUR-GPU.md)
and [October 19 component results](../results/tp2-cp2-2026-10-19/README.md).
The screenshots do not establish the cause of the 32K/C4 collapse or the
128K/200K C4 serving performance. Those are explicit tests below.

## What changed

* CP prefill now reconstructs complete chronological K/V one head at a time
  and calls the existing fused oneDNN operator. The previous tiled Python
  partition implementation is `--cp-prefill reference`, for diagnosis only.
  The new operator returns complete attention: it must **not** be followed by
  another CP softmax merge. Decode still reads compressed, sharded history.
* CP q1 supports the physical shared-prefix cascade and exports the matching
  softmax normalization. q7 retains compact SLM and the ordinary partition-LSE
  path; the slower experimental q7 cascade is not enabled.
* Empty histories no longer force a read of page-zero scratch from a previous
  request. Output is zero and normalization is `-inf`.
* The launcher supplies a same-image ordinary TP2 control. Both arms retain
  the same FP16 target, MTP6/local argmax, BF16 draft override, compact SLM,
  FP16 partials, subgroup settings, W4A8/oneDNN prefill and synchronous scheduler.
* Rank reports, build inventories and raw per-token-event serving receipts
  distinguish actual topology, cold prefill, simultaneous decode and wall time.

The prefill fix deliberately trades communication and temporary memory for
the reliable production fused operator. At 200K, two heads/GPU and FP16,
the gather/reconstruction buffers can temporarily need about 600 MiB,
plus query/output buffers, allocator reserve and oneDNN workspace. Each head
exchanges roughly 100 MB per lane per long prefill chunk. Actual PCIe time,
peak memory and whole-request TTFT must be measured on the four-card host.
This does not claim zero-copy prefill or a measured endpoint speedup.

## 1. Freeze and build

Use four B60s or four B70s on one Linux host, idle for the experiment. Do not
compare mixed hardware, models, weights or context templates. Keep weights
on SSD. Record model-file hashes, driver, firmware, CPU, RAM, PCIe link widths
and topology (`lspci -D -nn`, `lspci -tv`, `lspci -vv`). Record the selected
physical device order and any peer-access/collective transport diagnostics.
Do not assume that visible indices encode physical PCIe adjacency.

```bash
git fetch origin
git switch codex/tp2-cp2-four-gpu
git pull --ff-only
git rev-parse HEAD
git status --porcelain
mkdir -p results/qualification

bash k8v4_v030/compile_image.sh       # if the compiler image is absent
bash k8v4_v030/compile_decode.sh
bash k8v4_v030/compile_sdpa.sh
sha256sum build/libxe2_kv.so build/libk8v4_sdpa.so build/libdnnl.so.3
docker build -f Dockerfile.unified -t vllm-openai-xpu:v0.30.0-k8v4-unified .
docker build -f Dockerfile.tp2cp2 -t vllm-openai-xpu:v0.30.0-k8v4-tp2cp2 .
docker image inspect vllm-openai-xpu:v0.30.0-k8v4-tp2cp2 \
  > results/qualification/image.json
```

Rebuild both images after the native build. A stale library is an error, not
a reason to disable ABI checks. Unknown runtime hashes must stop installation;
reconcile the adapter against that source instead of editing guards to pass.
Use the **same resulting image ID for both arms**. Keep the original production
image and launcher unchanged for rollback.

## 2. Component gates on idle cards

```bash
docker run --rm --device /dev/dri --ipc=host --entrypoint bash \
  -v /dev/dri/by-path:/dev/dri/by-path:ro \
  -e ZE_AFFINITY_MASK=0,1,2,3 -e ZE_FLAT_DEVICE_HIERARCHY=COMPOSITE \
  -e PYTHONPATH=/repo -e XE2_KV_LIB=/opt/k8v4/libxe2_kv.so \
  -e K8V4_SDPA_LIB=/opt/k8v4/libk8v4_sdpa.so \
  -e LD_LIBRARY_PATH=/opt/k8v4:/opt/venv/lib:/opt/venv/lib/python3.12/site-packages/torch/lib \
  -v "$PWD:/repo" -w /repo \
  vllm-openai-xpu:v0.30.0-k8v4-tp2cp2 -lc '
  set -euo pipefail
  python3 -m unittest discover -s k8v4_v030/tests -p "test_*.py" \
    > results/qualification/unit-tests.log 2>&1
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --merge-only --graphs \
    --output results/qualification/merge.json
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --contexts 63,64,65,129,263,2113,4225 \
    --concurrencies 1,2,4 --iters 3 --q1-cascade \
    --output results/qualification/edges.json
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --q1-cascade \
    --output results/qualification/long-eager.json
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --q1-cascade --graphs \
    --output results/qualification/long-graphs.json
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.tp2_cp2_attention --q1-cascade --shared-fraction .75 --graphs \
    --output results/qualification/shared-graphs.json
  python3 -m torch.distributed.run --standalone --nproc-per-node=4 \
    -m bench.cp_prefill --output results/qualification/prefill.json
  '
```

Repeat the edge attention and prefill tests with `--pages-per-block 1` and
fresh output names. Long attention defaults to 131072/200003 tokens, C1/C2/C4,
q1/q7. Prefill includes the real 4224-row chunk, not just q1-like microbatches.
`--skip-reference-timing` can omit expensive old Python timing, but never the
ordinary oneDNN numerical comparison. `--pair-only` receipts cannot qualify
four GPUs. Tests must execute rather than silently skip for absent libraries.

Require finite results, attention relative L2 <=0.001 (0.1%), zero empty
outputs, correct LSE and changed-input graph replay. This is an operation
screen, not model fidelity. Native q1 serial/cascade output must be bitwise
equal. Compare **combined** attention cost, including normalization and
communication, against the matched unsplit path; the historical 1.8× number
used a different control and is not a production model prediction.

## 3. Model fidelity before speed

Launch the TP2 control first. Use a fresh cache directory for each layout;
both read the exact same model and template. These commands are sequential:
the two layouts compete for the same cards and must not run together.

```bash
python3 tools/launch_tp2_cp2.py --layout tp2 --model-dir /ssd/model \
  --name cpqual-tp2 --port 8200 --cache .cache/cpqual-tp2 --no-mtp --dry-run
python3 tools/launch_tp2_cp2.py --layout tp2 --model-dir /ssd/model \
  --name cpqual-tp2 --port 8200 --cache .cache/cpqual-tp2 --no-mtp
# Wait for /health and save startup/cache-capacity logs before sending work.
python3 tools/cp_inventory.py --layout tp2 --container cpqual-tp2 \
  --output results/qualification/tp2-no-mtp-inventory.json
```

For the candidate, after the control tests:

```bash
docker logs cpqual-tp2 > results/qualification/tp2-no-mtp-server.log 2>&1
docker stop cpqual-tp2
docker rm cpqual-tp2
python3 tools/launch_tp2_cp2.py --layout tp2cp2 --model-dir /ssd/model \
  --name cpqual-cp2 --port 8202 --cache .cache/cpqual-cp2 --no-mtp
python3 tools/cp_inventory.py --layout tp2cp2 --container cpqual-cp2 \
  --output results/qualification/cp2-no-mtp-inventory.json
```

Require actual ranks 0–3, TP groups [0,1]/[2,3], CP groups [0,2]/[1,3], correct
lane/device mapping, and the new prefill/cascade paths in the inventory.
Save actual image/native/SDPA/model hashes, arguments, KV pool tokens and
memory by rank. Missing rank reports are a failed gate.

Run the same saved natural-EOS math, code, edit and tool tasks on both layouts.
Check answers and run their task tests in an isolated test workspace; HTTP
200 and output length are insufficient. Preserve complete text, prompt IDs,
logprobs where supported, finish reason, seeds, sampling and thinking settings.
Use long-context retrieval sentinels at early/middle/late history positions.

The existing coding probe is one small natural-EOS smoke test:

```bash
python3 -m bench.serve_coding --base http://127.0.0.1:8200 \
  --model Swift-Qwen-27B-TP2CP2 --lengths 2000,32000,128000,200000 \
  --repeats 3 --max-tokens 2048 --needle --cold-prefix cpqual-tp2 \
  > results/qualification/tp2-coding.jsonl
```

Run that command during the control phase; use port 8202, a fresh marker and
a separate output for CP. Inspect `quality.embedded_tests`, `quality.needle`,
syntax, truncation and exceptions in **every** non-warmup row. The script's
exit status alone does not declare those quality checks passed. It is not a
complete general fidelity benchmark or exactly-tokenized 200K speed test.

Then repeat the two layouts with MTP6 (omit `--no-mtp`), and finally MTP6 plus
`--graphs`. Stop/remove only the two named qualification containers between
launches. Keep max-seqs=4 and all other parameters matched. Validate:

| Case | Required observation |
| --- | --- |
| Prefill and continuations | Same task answers; no recurrent-state drift over a long continuation |
| Stripe/block edges | q7 acceptance/rejection around 63/64/65, 127/128/129 and 2111/2112/2113 |
| Sampling | Greedy and non-greedy CP lanes remain synchronized; no hangs |
| Scheduler/state | Cancel, partial prefix hit, chunked/mixed prefill, preemption/resume preserve task correctness |
| Graphs | No stale Q, sequence length, physical page table or sampled token after replay |

Floating-point CP merging is not globally bit-exact. Establish ordinary TP2
repeat variability before diagnosing token differences. Never waive wrong
answers, recurrent divergence or crashes as expected numerical noise. Do not
publish serving speed as qualified until this matrix has actual receipts.

## 4. Matched speed matrix

Use a dedicated idle endpoint, identical model image and max-seqs=4 on both
layouts. Prepare fixtures **once** while either server is running. The fixture
file contains exact token IDs and hashes and is reused without regeneration.

```bash
python3 -m bench.cp_serving --base http://127.0.0.1:8200 --prepare \
  --fixtures results/qualification/fixtures.json
python3 -m bench.cp_serving --base http://127.0.0.1:8200 --label tp2 \
  --fixtures results/qualification/fixtures.json --mode cold \
  --output results/qualification/tp2-cold.jsonl
python3 -m bench.cp_serving --base http://127.0.0.1:8200 --label tp2 \
  --fixtures results/qualification/fixtures.json --mode warm \
  --output results/qualification/tp2-warm.jsonl
```

Repeat the last two commands against CP on 8202 with `--label tp2cp2` and
fresh `cp2-cold.jsonl`/`cp2-warm.jsonl` outputs. After each arm, save its final
inventory, logs, `/metrics`, device memory and GPU utilization/clock/temperature
trace. Do not run other model workloads during either arm.

Defaults cover **2048, 32768, 131072 and 200000 exact input tokens × C1/C2/C4,
three repetitions, 2048 forced output tokens per stream**. Warm trials prime
each independent history outside the measured interval. Cold trials use fresh
cache salts and must report no prefix hits. The shared-prefix experiment is a
separate workload; reading similar files later in an unrelated prompt does not
create physical-prefix reuse. No cache-flush or server restart is required
between salted cold cells.

For the final capacity/long-run check, repeat both arms with:

```bash
python3 -m bench.cp_serving --base http://127.0.0.1:8202 --label tp2cp2 \
  --fixtures results/qualification/fixtures.json --contexts 200000 \
  --concurrencies 4 --max-tokens 10000 --repeats 3 --mode warm \
  --output results/qualification/cp2-c4-200k-10k.jsonl
```

Use port 8200/label tp2/a fresh output for its control. Budget enough time:
this is a real 120K generated-token test per arm. Read startup capacity first;
200K+10K at C4 must fit without preemption. If it does not, record that failure
instead of changing context/utilization in only one arm or silently reducing
output. Forced output is a throughput stress test, **not** a quality benchmark.

```bash
python3 -m bench.cp_compare results/qualification/tp2-warm.jsonl \
  results/qualification/cp2-warm.jsonl > results/qualification/warm-comparison.json
python3 -m bench.cp_compare results/qualification/tp2-cold.jsonl \
  results/qualification/cp2-cold.jsonl > results/qualification/cold-comparison.json
```

The harness excludes **all** first-burst tokens from decode rate and records
absolute SSE timestamps/cumulative token counts. Its common decode interval
starts after the last stream begins and ends before the first stream finishes.
It requires at least 3 seconds and 16 updates per stream in that interval.
It reports per-request rates, common-interval rates and total wall throughput
separately. Only cold **C1** derives PP rate from server prefill-time totals;
summing concurrent prefill times is not a throughput rate. MTP acceptance,
raw metric deltas, prefix hits, complete outputs and token lengths are saved.
Other traffic, missing counters, preemption or mismatched lengths fail the
request cell. Insufficient overlap fails the warm decode cell. In a cold trial,
one request can finish decoding before another finishes prefill: TTFT/wall
measurements remain usable, but common-decode values are explicitly unavailable.
The comparison leaves that decode column blank rather than converting prefill
delay into a decode slowdown. Preserve failed receipts; do not average them away.

Publish per-stream decode median/range, common-interval aggregate, wall
aggregate, TTFT, actual prefix hits and MTP acceptance for every cell. The
comparison requires three distinct repeats and identical fixture/output
lengths. Range overlap is descriptive, not a confidence interval. A claimed
improvement must exceed measured variation without a quality regression.

## 5. Diagnose losses; do not hide them

For a repeat of the screenshot's 32K/C4 collapse, save the raw SSE timeline,
queued/running requests, preemptions and graph logs. Compare eager vs graphs,
actual q1 vs q7 dispatch, padded capture widths (7/14/21/28 for MTP6 C1–C4),
MTP accepted tokens per update/position, and actual allocated cache lengths.
Use attention primitive times to distinguish the local walk, LSE export and
collective; use prefill primitive times to expose full-KV communication.
Neither this code change nor a screenshot alone proves that collapse solved.

The launcher has `--no-cascade` and `--cp-prefill reference` for one-variable
diagnosis, not automatic fallback. Do not leave reference prefill enabled in
a speed comparison. Preserve other launch settings while toggling one option.
If rank/device order changes collective time substantially, repeat both
orders and record topology rather than picking a favorable number silently.

C8 is optional **after C4 passes**. It still splits each request across four
GPUs; CP does not divide configured concurrency by two. Doubling request count
consumes the saved per-GPU KV volume, so do not promise the C4 latency benefit
at C8. Also compare two ordinary TP2 replicas (0,1 and 2,3) for four-card
aggregate serving; CP needs to earn its advantage over that use of four cards.

## Acceptance / rollback

Promote only after component, four-rank topology, model/task, graph, capacity
and repeated speed gates pass. Keep failing data alongside passing data.
Report B60 and B70 separately. Package commit, image/model/library hashes,
inventories, raw JSONL, logs and the final table so another person can reproduce
it. A primitive speedup never substitutes for model serving results.

On failure, stop only `cpqual-cp2` / `cpqual-tp2` and return to the previously
recorded production image/launcher if it was running before the test. Do not
alter source contracts, retry failed jobs into a passing average, remove
unrelated containers or change another workload's clocks or memory settings.
