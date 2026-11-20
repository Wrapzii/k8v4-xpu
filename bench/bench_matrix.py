"""Bounded benchmark matrix for the production endpoint (refuses to run unless it is idle).

  prefill : cold, unique prompts of ~L tokens, max_tokens=1  ->  prompt_tokens / wall seconds
  decode  : k concurrent streams of the same code task over ~L-token cached prefixes, fixed 192
            output tokens (ignore_eos). Per-stream rate is measured only while ALL streams are decoding
            (after any prefill stall), so prefill interference is reported separately as stall_s.

    python3 bench_matrix.py --out RESULTS.jsonl --tag base \
        --prefill-lens 2048,8192,32768 --decode-lens 8192,32768 --conc 1,2,4

Every row is appended to --out. A summary table (per-stream tok/s and loss vs C1) is printed at the end.
"""
import argparse
import json
import statistics as st
import threading
import time
import urllib.request

BASE = "http://127.0.0.1:8100"
MODEL = "Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8"
NOTE = "Background note: interval endpoints are integers. Sort before merging.\n"
TASK = ("Write a Python function merge_intervals(intervals) that merges overlapping [start, end] "
        "intervals and returns them sorted. Include a docstring and two doctests.")
SPEC = ("vllm:spec_decode_num_drafts_total", "vllm:spec_decode_num_draft_tokens_total",
        "vllm:spec_decode_num_accepted_tokens_total")


def metrics():
    text = urllib.request.urlopen(BASE + "/metrics", timeout=10).read().decode()
    out = {"running": 0.0, "waiting": 0.0, "success": 0.0, "gen": 0.0, "preempt": 0.0}
    for k in SPEC:
        out[k] = 0.0
    for line in text.splitlines():
        if not line or line[0] == "#":
            continue
        name = line.split("{")[0].split(" ")[0]
        val = float(line.rsplit(" ", 1)[1])
        if name == "vllm:num_requests_running":
            out["running"] += val
        elif name == "vllm:num_requests_waiting":
            out["waiting"] += val
        elif name == "vllm:request_success_total":
            out["success"] += val
        elif name == "vllm:generation_tokens_total":
            out["gen"] += val
        elif name == "vllm:num_preemptions_total":
            out["preempt"] += val
        elif name in SPEC:
            out[name] += val
    return out


def idle_or_die():
    m = metrics()
    if m["running"] or m["waiting"]:
        raise SystemExit("endpoint busy; refusing to benchmark")
    return m


def prompt(tag, length):
    return (f"Benchmark document {tag}.\n" + NOTE * max(1, length // 13) +
            "\nIgnore irrelevant background notes. Complete only this task:\n" + TASK)


def payload(text, max_tokens, stream, ignore_eos=False):
    p = {"model": MODEL, "messages": [{"role": "user", "content": text}], "temperature": 0, "seed": 12345,
         "max_tokens": max_tokens, "chat_template_kwargs": {"enable_thinking": False}}
    if stream:
        p["stream"] = True
        p["stream_options"] = {"include_usage": True, "continuous_usage_stats": True}
    if ignore_eos:
        p["ignore_eos"] = True
    return p


def post(p, timeout=3600):
    req = urllib.request.Request(BASE + "/v1/chat/completions", json.dumps(p).encode(),
                                 {"Content-Type": "application/json"})
    return urllib.request.urlopen(req, timeout=timeout)


def stream(text, max_tokens, barrier):
    barrier.wait(timeout=120)
    t0 = time.perf_counter()
    events, usage = [], {}
    with post(payload(text, max_tokens, True, True)) as r:
        for line in r:
            if not line.startswith(b"data:"):
                continue
            data = line[5:].strip()
            if data == b"[DONE]":
                break
            ev = json.loads(data)
            usage = ev.get("usage") or usage
            n = usage.get("completion_tokens")
            if n is not None and (not events or n > events[-1][1]):
                events.append((time.perf_counter() - t0, n))
    return {"events": events, "usage": usage, "seconds": time.perf_counter() - t0}


def tok_at(ev, t):
    prev = ev[0]
    for p in ev:
        if p[0] > t:
            break
        prev = p
    return prev[1]


def last_gap_end(ev):
    best, gap = None, 0.0
    for a, b in zip(ev, ev[1:]):
        if b[0] - a[0] > 1.0:
            best, gap = b[0], max(gap, b[0] - a[0])
    return best, gap


def steady(replies):
    evs = [r["events"] for r in replies]
    starts, stalls = [], []
    for ev in evs:
        end, gap = last_gap_end(ev)
        starts.append(end if end is not None else ev[0][0])
        stalls.append(gap)
    t0 = max(starts)
    t1 = min(ev[-1][0] for ev in evs)
    if t1 - t0 < 0.5:
        return None
    rates = [(tok_at(ev, t1) - tok_at(ev, t0)) / (t1 - t0) for ev in evs]
    return dict(window_s=round(t1 - t0, 2), per_stream=[round(x, 1) for x in rates],
                mean_per_stream=round(st.mean(rates), 1), combined=round(sum(rates), 1),
                stall_s=round(max(stalls), 2), ttft_s=[round(ev[0][0], 2) for ev in evs])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", required=True)
    ap.add_argument("--tag", default="")
    ap.add_argument("--prefill-lens", default="")
    ap.add_argument("--decode-lens", default="")
    ap.add_argument("--conc", default="1,2,4")
    ap.add_argument("--tokens", type=int, default=192)
    ap.add_argument("--trials", type=int, default=3)
    a = ap.parse_args()
    out = open(a.out, "a")

    def emit(**row):
        row["tag"] = a.tag
        out.write(json.dumps(row) + "\n")
        out.flush()
        print(json.dumps(row), flush=True)

    idle_or_die()
    if a.prefill_lens:
        # tiny warm-up so first-use JIT does not pollute the first measured length
        post(payload(prompt("warm-" + str(time.time()), 1500), 1, False)).read()
        for L in map(int, a.prefill_lens.split(",")):
            for rep in range(2):
                idle_or_die()
                m0 = metrics()
                t0 = time.perf_counter()
                body = json.loads(post(payload(prompt(f"prefill-{L}-{rep}-{time.time()}", L), 1, False)).read())
                wall = time.perf_counter() - t0
                n = body["usage"]["prompt_tokens"]
                emit(kind="prefill", target_len=L, rep=rep, prompt_tokens=n, wall_s=round(wall, 2),
                     prefill_tok_s=round(n / wall, 0), preempt=metrics()["preempt"] - m0["preempt"])
    table = {}
    for L in map(int, a.decode_lens.split(",")) if a.decode_lens else []:
        for k in map(int, a.conc.split(",")):
            texts = [prompt(f"decode-L{L}-actor{i}", L) for i in range(k)]
            for i, t in enumerate(texts):          # fill / refresh the prefix cache, one at a time
                idle_or_die()
                post(payload(t, 1, False)).read()
            rates = []
            for trial in range(a.trials):
                m0 = idle_or_die()
                barrier = threading.Barrier(k)
                replies = [None] * k

                def work(i):
                    replies[i] = stream(texts[i], a.tokens, barrier)

                ths = [threading.Thread(target=work, args=(i,)) for i in range(k)]
                [t.start() for t in ths]
                [t.join() for t in ths]
                m1 = metrics()
                s = steady(replies)
                drafted = m1[SPEC[1]] - m0[SPEC[1]]
                acc = (m1[SPEC[2]] - m0[SPEC[2]]) / drafted if drafted else None
                controlled = (m1["success"] - m0["success"] == k)
                emit(kind="decode", L=L, k=k, trial=trial, controlled=controlled, acceptance=acc and round(acc, 3),
                     preempt=m1["preempt"] - m0["preempt"], **(s or {"window_s": 0}))
                if s:
                    rates.append(s["mean_per_stream"])
            table[(L, k)] = st.median(rates) if rates else None
    if table:
        print("\nper-stream steady decode tok/s (median over trials) and loss vs C1")
        for (L, k), v in table.items():
            base = table.get((L, 1))
            loss = f"{(1 - v / base) * 100:5.1f}%" if v and base else "   n/a"
            print(f"  L={L:>7} C{k}: {v}   loss vs C1 {loss}")


if __name__ == "__main__":
    main()
