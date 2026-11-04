#!/usr/bin/env python3
"""p50/p95 of sampled K8/V4 decode-attention GPU time by context bucket and by
concurrency, plus a joint table and a context-vs-concurrency verdict.

usage: analyze_attn_profile.py [DIR_OR_FILES...] [--since HOURS] [--q-len N]
       [--telemetry ~/ops/vllm-telemetry/samples.csv] [--json OUT]
Default DIR: ~/ops/vllm-telemetry/attn-profile. B60 peak DRAM BW = 456 GB/s.
"""
import argparse, bisect, csv, glob, json, math, os, sys, time
from collections import defaultdict

PEAK_GBPS = 456.0


def pct(v, p):
    if not v:
        return float("nan")
    v = sorted(v)
    k = (len(v) - 1) * p / 100.0
    f, c = math.floor(k), math.ceil(k)
    return v[f] if f == c else v[f] + (v[c] - v[f]) * (k - f)


def load(paths, since_ts, q_len):
    files = []
    for p in paths:
        p = os.path.expanduser(p)
        files += sorted(glob.glob(os.path.join(p, "*.jsonl"))) if os.path.isdir(p) else [p]
    rows, stats = [], []
    for f in files:
        with open(f) as fh:
            for line in fh:
                try:
                    r = json.loads(line)
                except ValueError:
                    continue
                if r.get("ts", 0) < since_ts:
                    continue
                if r.get("type") == "stats":
                    stats.append(r)
                elif r.get("type") == "attn" and (q_len is None or r["q_len"] == q_len):
                    rows.append(r)
    return rows, stats


def join_running(rows, csv_path):
    """Attach vLLM num_requests_running from the concurrency collector (nearest earlier sample)."""
    csv_path = os.path.expanduser(csv_path)
    if not os.path.exists(csv_path):
        return False
    ts, run = [], []
    with open(csv_path) as fh:
        for r in csv.DictReader(fh):
            try:
                ts.append(float(r["ts"])); run.append(float(r["running"]))
            except (KeyError, ValueError):
                pass
    if not ts:
        return False
    order = sorted(range(len(ts)), key=ts.__getitem__)
    ts = [ts[i] for i in order]; run = [run[i] for i in order]
    for r in rows:
        i = bisect.bisect_right(ts, r["ts"]) - 1
        r["running"] = int(run[i]) if i >= 0 and r["ts"] - ts[i] < 120 else None
    return True


def table(rows, key, title):
    g = defaultdict(list)
    for r in rows:
        g[key(r)].append(r)
    out = []
    print("\n## " + title)
    print("%-14s %6s %10s %10s %10s %10s %8s" % ("group", "n", "p50_us", "p95_us", "p50_us/req", "p50_GB/s", "%peak"))
    for k in sorted(g, key=lambda x: (x is None, x)):
        v = g[k]
        t = [r["gpu_us"] for r in v]
        per = [r["gpu_us"] / max(r["batch"], 1) for r in v]
        bw = [r["kv_gbps"] for r in v if r.get("kv_gbps")]
        p50bw = pct(bw, 50)
        print("%-14s %6d %10.1f %10.1f %10.1f %10.1f %7.1f%%" % (
            k, len(v), pct(t, 50), pct(t, 95), pct(per, 50), p50bw, 100 * p50bw / PEAK_GBPS))
        out.append({"group": k, "n": len(v), "p50_us": pct(t, 50), "p95_us": pct(t, 95),
                    "p50_us_per_req": pct(per, 50), "p50_gbps": p50bw})
    return out


def slope(xs, ys):
    n = len(xs)
    if n < 3:
        return float("nan")
    mx, my = sum(xs) / n, sum(ys) / n
    den = sum((x - mx) ** 2 for x in xs)
    return sum((x - mx) * (y - my) for x, y in zip(xs, ys)) / den if den else float("nan")


def verdict(rows):
    """Within one ctx bucket, does per-call time grow with batch? Within one batch, with ctx?"""
    by_b = defaultdict(list)
    for r in rows:
        by_b[r["batch"]].append(r)
    ctx_us_per_ktok = [slope([r["ctx_max"] / 1000 for r in v], [r["gpu_us"] for r in v]) for v in by_b.values()]
    by_c = defaultdict(list)
    for r in rows:
        by_c[r["ctx_bucket"]].append(r)
    conc_us_per_req = [slope([r["batch"] for r in v], [r["gpu_us"] for r in v]) for v in by_c.values()]
    f = lambda a: [x for x in a if x == x]
    a, b = f(ctx_us_per_ktok), f(conc_us_per_req)
    res = {"us_per_1k_ctx_at_fixed_batch": pct(a, 50) if a else None,
           "us_per_extra_req_at_fixed_ctx_bucket": pct(b, 50) if b else None}
    print("\n## verdict")
    print("median slope: +%.2f us per 1K context tokens (fixed batch)" % (res["us_per_1k_ctx_at_fixed_batch"] or float("nan")))
    print("median slope: +%.1f us per extra concurrent request (fixed ctx bucket)" % (res["us_per_extra_req_at_fixed_ctx_bucket"] or float("nan")))
    print("Per-request cost is serial inside attn_batch, so a pure-bandwidth kernel shows us/req ~ "
          "constant in batch and linear in context; growth beyond that is contention/occupancy.")
    return res


def main(argv=None):
    ap = argparse.ArgumentParser()
    ap.add_argument("paths", nargs="*", default=["~/ops/vllm-telemetry/attn-profile"])
    ap.add_argument("--since", type=float, default=None, help="hours back")
    ap.add_argument("--q-len", type=int, default=None, help="1=draft, 7=MTP verify")
    ap.add_argument("--telemetry", default="~/ops/vllm-telemetry/samples.csv")
    ap.add_argument("--json", default=None)
    a = ap.parse_args(argv)
    since = time.time() - a.since * 3600 if a.since else 0
    rows, stats = load(a.paths, since, a.q_len)
    if not rows:
        print("no samples"); return 1
    print("samples: %d  (q_len mix: %s)" % (len(rows), dict(sorted(
        __import__("collections").Counter(r["q_len"] for r in rows).items()))))
    if stats:
        print("last stats:", {k: v for k, v in stats[-1].items() if k not in ("type",)})
    res = {"by_ctx": table(rows, lambda r: r["ctx_bucket"], "by context bucket (max ctx in call, pow2)"),
           "by_batch": table(rows, lambda r: r["batch"], "by concurrent sequences in the attention call"),
           "by_ctx_batch": table(rows, lambda r: "%d/b%d" % (r["ctx_bucket"], r["batch"]), "ctx bucket x batch")}
    if join_running(rows, a.telemetry):
        res["by_running"] = table(rows, lambda r: r.get("running"), "by vLLM running requests (joined telemetry)")
    res["verdict"] = verdict(rows)
    if a.json:
        with open(a.json, "w") as fh:
            json.dump(res, fh, indent=1, default=str)
    return 0


if __name__ == "__main__":
    sys.exit(main())
