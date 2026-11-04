#!/usr/bin/env python3
"""Before/after overhead benchmark: run once against the server with the
profiler OFF and once with it ON (same image, same args); compare.

Measures per request: TTFT, TPOT (mean inter-chunk gap after the first token),
end-to-end, output tok/s; and aggregate throughput per concurrency level.
Prompts are FIXED per context size (identical for every request, every phase)
so the prefix cache is hit: TTFT is mostly a cache hit and the timings
reflect decode/attention. One warm-up request per context size (excluded)
fills the cache after a restart.

usage: bench_overhead.py --label off --url http://127.0.0.1:8100/v1 \
         --ctx 2000,32000,128000 --conc 1,4 --reps 3 --max-tokens 256 --out results/
       bench_overhead.py --compare results/off.json results/on.json
Run in a quiet window: Hermes traffic adds noise larger than the expected
overhead (<1%). Acceptance: |delta| of p50 TPOT and TTFT within run-to-run
noise (measure noise with two OFF runs).
"""
import argparse, concurrent.futures as cf, json, os, statistics as st, sys, time, urllib.request, uuid

WORDS = ("alpha bravo charlie delta echo foxtrot golf hotel india juliet kilo lima mike "
         "november oscar papa quebec romeo sierra tango uniform victor whiskey xray yankee zulu").split()


def model_id(url):
    with urllib.request.urlopen(url + "/models", timeout=30) as r:
        return json.load(r)["data"][0]["id"]


def prompt(ntok, nonce=None):
    # ~1 token per word for these words; exact length is reported by the server.
    body = " ".join(WORDS[i % len(WORDS)] for i in range(ntok))
    return "%s\nSummarise the list above in one long paragraph." % body


def one(url, model, ntok, max_tokens):
    data = json.dumps({"model": model, "prompt": prompt(ntok), "max_tokens": max_tokens,
                       "temperature": 0, "ignore_eos": True, "stream": True,
                       "stream_options": {"include_usage": True}}).encode()
    req = urllib.request.Request(url + "/completions", data=data, headers={"Content-Type": "application/json"})
    t0 = time.perf_counter(); first = None; stamps = []; usage = {}
    with urllib.request.urlopen(req, timeout=3600) as r:
        for raw in r:
            line = raw.decode().strip()
            if not line.startswith("data:") or line == "data: [DONE]":
                continue
            ev = json.loads(line[5:])
            if ev.get("usage"):
                usage = ev["usage"]
            if ev.get("choices") and ev["choices"][0].get("text"):
                now = time.perf_counter()
                first = first or now
                stamps.append(now)
    t1 = time.perf_counter()
    out = usage.get("completion_tokens", 0)
    return {"ctx": ntok, "prompt_tokens": usage.get("prompt_tokens"), "completion_tokens": out,
            "ttft_s": (first or t1) - t0, "e2e_s": t1 - t0,
            "tpot_ms": 1000 * ((t1 - first) / max(out - 1, 1)) if first else None,
            "out_tok_s": out / (t1 - first) if first and t1 > first else None}


def run(a):
    url = a.url.rstrip("/"); model = a.model or model_id(url)
    res = {"label": a.label, "model": model, "started": time.time(), "points": []}
    for ctx in [int(x) for x in a.ctx.split(",")]:
        w = one(url, model, ctx, a.max_tokens)  # cache warm-up, excluded
        res.setdefault("warmups", []).append(w)
        print(json.dumps({"warmup_ctx": ctx, "ttft_s": round(w["ttft_s"], 3)}), flush=True)
        for conc in [int(x) for x in a.conc.split(",")]:
            for rep in range(1, a.reps + 1):
                t0 = time.perf_counter()
                with cf.ThreadPoolExecutor(conc) as ex:
                    reqs = list(ex.map(lambda _: one(url, model, ctx, a.max_tokens), range(conc)))
                wall = time.perf_counter() - t0
                pt = {"ctx": ctx, "conc": conc, "rep": rep, "wall_s": wall,
                      "agg_out_tok_s": sum(r["completion_tokens"] for r in reqs) / wall, "reqs": reqs}
                res["points"].append(pt)
                print(json.dumps({k: v for k, v in pt.items() if k != "reqs"}), flush=True)
    os.makedirs(a.out, exist_ok=True)
    path = os.path.join(a.out, "%s-%d.json" % (a.label, int(time.time())))
    json.dump(res, open(path, "w"), indent=1)
    print("wrote", path)


def summarise(path):
    d = json.load(open(path)); g = {}
    for p in d["points"]:
        k = (p["ctx"], p["conc"]); s = g.setdefault(k, {"ttft": [], "tpot": [], "agg": []})
        s["agg"].append(p["agg_out_tok_s"])
        for r in p["reqs"]:
            s["ttft"].append(r["ttft_s"]); r["tpot_ms"] and s["tpot"].append(r["tpot_ms"])
    return {k: {m: st.median(v) for m, v in s.items() if v} for k, s in g.items()}


def compare(a_path, b_path):
    A, B = summarise(a_path), summarise(b_path)
    print("%-8s %-5s %12s %12s %12s %8s %8s %8s" % ("ctx", "conc", "ttft_s A/B", "tpot_ms A/B", "agg tok/s A/B", "dTTFT%", "dTPOT%", "dTHR%"))
    for k in sorted(set(A) & set(B)):
        x, y = A[k], B[k]
        d = lambda m: 100 * (y[m] - x[m]) / x[m]
        print("%-8d %-5d %5.2f/%-6.2f %5.1f/%-6.1f %6.1f/%-6.1f %+7.2f %+7.2f %+7.2f" % (
            k[0], k[1], x["ttft"], y["ttft"], x["tpot"], y["tpot"], x["agg"], y["agg"], d("ttft"), d("tpot"), d("agg")))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--label"); ap.add_argument("--url", default="http://127.0.0.1:8100/v1")
    ap.add_argument("--model"); ap.add_argument("--ctx", default="2000,32000,128000")
    ap.add_argument("--conc", default="1,4"); ap.add_argument("--reps", type=int, default=3)
    ap.add_argument("--max-tokens", type=int, default=256); ap.add_argument("--out", default="results")
    ap.add_argument("--compare", nargs=2)
    a = ap.parse_args()
    compare(*a.compare) if a.compare else run(a)
