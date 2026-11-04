#!/usr/bin/env python3
"""Growing-conversation overhead bench (profiler off vs on).

One deterministic document D grows by appending fixed text; step k sends
prompt = D[:words_k] + fixed question. D[:words_k] is a byte-identical prefix of
every later step, so prefix caching prefills only the delta. No generated text
is fed back. After a restart, --warm replays all steps once (marked warmup).
Per step it measures TTFT (delta prefill + cache hit), TPOT and decode tok/s at
concurrency 1 and 4 (4 requests with the identical prompt).

usage: bench_conversation.py --label on --steps 2000,8000,16000,32000,64000,128000,200000
       bench_conversation.py --compare A.json B.json
"""
import argparse, concurrent.futures as cf, json, os, statistics as st, sys, time, urllib.request

Q = "\n\nQuestion: list the first ten section numbers above, then describe the pattern in detail."


def doc_words(n):
    # deterministic, varied, tokenizer-stable text: "S<i>: <words>."
    W = ("amber basalt cobalt delta ember fjord granite harbor indigo jasper kelp lagoon "
         "marble nickel onyx prairie quartz rapids sierra tundra umber violet willow xenon yarrow zircon").split()
    out, i = [], 0
    while len(out) < n:
        out += ["S%d:" % i] + [W[(i * 7 + j) % len(W)] for j in range(11)]
        i += 1
    return out[:n]


def post(url, path, body):
    req = urllib.request.Request(url + path, data=json.dumps(body).encode(), headers={"Content-Type": "application/json"})
    return urllib.request.urlopen(req, timeout=3600)


def ntok(url, model, text):
    with post(url.rsplit("/v1", 1)[0], "/tokenize", {"model": model, "prompt": text}) as r:
        return json.load(r)["count"]


def calibrate(url, model, targets):
    words = doc_words(int(max(targets) * 1.2))
    sample = 4000
    ratio = ntok(url, model, " ".join(words[:sample])) / sample
    out = []
    for t in targets:
        n = int(t / ratio)
        out.append(n)
    return out, words, ratio


def one(url, model, prompt, max_tokens):
    t0 = time.perf_counter(); first = None; usage = {}
    with post(url, "/completions", {"model": model, "prompt": prompt, "max_tokens": max_tokens, "temperature": 0,
                                    "ignore_eos": True, "stream": True, "stream_options": {"include_usage": True}}) as r:
        for raw in r:
            line = raw.decode().strip()
            if not line.startswith("data:") or line == "data: [DONE]":
                continue
            ev = json.loads(line[5:])
            if ev.get("usage"):
                usage = ev["usage"]
            if ev.get("choices") and ev["choices"][0].get("text") and first is None:
                first = time.perf_counter()
    t1 = time.perf_counter(); out = usage.get("completion_tokens", 0)
    det = usage.get("prompt_tokens_details") or {}
    return {"prompt_tokens": usage.get("prompt_tokens"), "cached_tokens": det.get("cached_tokens"),
            "completion_tokens": out, "ttft_s": (first or t1) - t0, "e2e_s": t1 - t0,
            "tpot_ms": 1000 * (t1 - first) / max(out - 1, 1) if first else None,
            "decode_tok_s": (out - 1) / (t1 - first) if first and t1 > first else None}


def metrics(url):
    try:
        txt = urllib.request.urlopen(url.rsplit("/v1", 1)[0] + "/metrics", timeout=5).read().decode()
        g = lambda k: sum(float(l.split()[-1]) for l in txt.splitlines() if l.startswith("vllm:" + k + "{"))
        return {"running": g("num_requests_running"), "waiting": g("num_requests_waiting"), "kv_usage": g("kv_cache_usage_perc")}
    except Exception as e:
        return {"err": str(e)}


def run(a):
    url = a.url.rstrip("/")
    model = a.model or json.load(urllib.request.urlopen(url + "/models"))["data"][0]["id"]
    targets = [int(x) for x in a.steps.split(",")]
    nwords, words, ratio = calibrate(url, model, targets)
    res = {"label": a.label, "model": model, "ratio_tok_per_word": ratio, "steps": [], "warmup": [],
           "outside_load_before": metrics(url), "started": time.time()}
    print("outside load before:", res["outside_load_before"], flush=True)
    prompts = [" ".join(words[:n]) + Q for n in nwords]
    for t, p in zip(targets, prompts):  # cache rebuild, marked warm-up
        w = one(url, model, p, 8); w["target"] = t; res["warmup"].append(w)
        print(json.dumps({"warmup": t, **{k: w[k] for k in ("prompt_tokens", "cached_tokens", "ttft_s")}}), flush=True)
    for t, p in zip(targets, prompts):
        for conc in [int(x) for x in a.conc.split(",")]:
            for rep in range(1, a.reps + 1):
                m = metrics(url)
                t0 = time.perf_counter()
                with cf.ThreadPoolExecutor(conc) as ex:
                    reqs = list(ex.map(lambda _: one(url, model, p, a.max_tokens), range(conc)))
                wall = time.perf_counter() - t0
                pt = {"target": t, "conc": conc, "rep": rep, "load_before": m, "wall_s": wall,
                      "agg_decode_tok_s": sum(r["decode_tok_s"] or 0 for r in reqs), "reqs": reqs}
                res["steps"].append(pt)
                print(json.dumps({"target": t, "conc": conc, "rep": rep, "prompt_tokens": reqs[0]["prompt_tokens"],
                                  "cached": reqs[0]["cached_tokens"], "ttft_s": round(st.median(r["ttft_s"] for r in reqs), 3),
                                  "tpot_ms": round(st.median(r["tpot_ms"] for r in reqs), 2),
                                  "agg_decode_tok_s": round(pt["agg_decode_tok_s"], 1), "load_before": m}), flush=True)
    os.makedirs(a.out, exist_ok=True)
    path = os.path.join(a.out, "conv-%s-%d.json" % (a.label, int(time.time())))
    json.dump(res, open(path, "w"), indent=1); print("wrote", path)


def summ(path):
    d = json.load(open(path)); g = {}
    for p in d["steps"]:
        s = g.setdefault((p["target"], p["conc"]), {"ttft": [], "tpot": [], "agg": []})
        s["agg"].append(p["agg_decode_tok_s"])
        for r in p["reqs"]:
            s["ttft"].append(r["ttft_s"]); r["tpot_ms"] and s["tpot"].append(r["tpot_ms"])
    return {k: {m: st.median(v) for m, v in s.items() if v} for k, s in g.items()}


def compare(a, b):
    A, B = summ(a), summ(b)
    print("%-7s %-4s %15s %15s %17s %7s %7s %7s" % ("ctx", "conc", "TTFT s A/B", "TPOT ms A/B", "agg dec tok/s A/B", "dTTFT%", "dTPOT%", "dTHR%"))
    for k in sorted(set(A) & set(B)):
        x, y = A[k], B[k]; d = lambda m: 100 * (y[m] - x[m]) / x[m]
        print("%-7d %-4d %7.3f/%-7.3f %7.2f/%-7.2f %8.1f/%-8.1f %+7.2f %+7.2f %+7.2f" % (
            k[0], k[1], x["ttft"], y["ttft"], x["tpot"], y["tpot"], x["agg"], y["agg"], d("ttft"), d("tpot"), d("agg")))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--label"); ap.add_argument("--url", default="http://127.0.0.1:8100/v1"); ap.add_argument("--model")
    ap.add_argument("--steps", default="2000,8000,16000,32000,64000,128000,200000")
    ap.add_argument("--conc", default="1,4"); ap.add_argument("--reps", type=int, default=2)
    ap.add_argument("--max-tokens", type=int, default=192); ap.add_argument("--out", default="results")
    ap.add_argument("--compare", nargs=2)
    a = ap.parse_args()
    compare(*a.compare) if a.compare else run(a)
