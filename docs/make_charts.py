#!/usr/bin/env python3
"""Draw the published curves from results/*.json. No network."""

from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "docs" / "charts"
FP8 = "#6b7280"
K8 = "#0f766e"
ACCENT = "#b45309"
REJECT = "#9a3412"


def _esc(text: str) -> str:
    return (
        str(text)
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
    )


def _nice(lo: float, hi: float, ticks: int = 5) -> list[float]:
    if hi <= lo:
        hi = lo + 1
    span = hi - lo
    step = span / ticks
    return [lo + step * i for i in range(ticks + 1)]


def _ytick(tick: float, y1: float) -> str:
    if y1 >= 10:
        return f"{tick:.0f}"
    if y1 >= 1:
        return f"{tick:.1f}"
    return f"{tick:.2f}"


def line_chart(path: Path, title: str, ylabel: str, series: list[tuple], y_top: float | None = None) -> None:
    width, height = 760, 440
    left, right, top, bottom = 72, 24, 72, 58
    xs = sorted({x for _, pts in series for x, _y in pts})
    ys = [y for _, pts in series for _x, y in pts]
    x0, x1 = min(xs), max(xs)
    y0 = 0.0
    y1 = y_top if y_top is not None else max(ys) * 1.12
    pw, ph = width - left - right, height - top - bottom

    def X(x: float) -> float:
        return left + (x - x0) / (x1 - x0) * pw

    def Y(y: float) -> float:
        return top + (1 - (y - y0) / (y1 - y0)) * ph

    parts = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#ffffff"/>',
        f'<text x="{left}" y="24" font-family="Segoe UI, sans-serif" font-size="16" fill="#111827">{_esc(title)}</text>',
    ]
    colors = [K8, FP8, ACCENT]
    for idx, (name, _pts) in enumerate(series):
        color = colors[idx % len(colors)]
        lx = left + idx * 210
        parts.append(f'<line x1="{lx}" y1="42" x2="{lx + 22}" y2="42" stroke="{color}" stroke-width="2.4"/>')
        parts.append(
            f'<text x="{lx + 28}" y="46" font-family="Segoe UI, sans-serif" font-size="12" fill="#111827">{_esc(name)}</text>'
        )
    for tick in _nice(y0, y1):
        yy = Y(tick)
        parts.append(f'<line x1="{left}" y1="{yy:.1f}" x2="{width - right}" y2="{yy:.1f}" stroke="#e5e7eb"/>')
        parts.append(
            f'<text x="{left - 8}" y="{yy + 4:.1f}" text-anchor="end" font-family="Segoe UI, sans-serif" font-size="11" fill="#4b5563">{_ytick(tick, y1)}</text>'
        )
    parts.append(
        f'<text x="18" y="{top + ph / 2:.0f}" transform="rotate(-90 18 {top + ph / 2:.0f})" font-family="Segoe UI, sans-serif" font-size="12" fill="#374151">{_esc(ylabel)}</text>'
    )
    for x in xs:
        parts.append(
            f'<text x="{X(x):.1f}" y="{height - 28}" text-anchor="middle" font-family="Segoe UI, sans-serif" font-size="11" fill="#4b5563">{int(x / 1000)}K</text>'
        )
    parts.append(
        f'<text x="{(left + width - right) / 2:.0f}" y="{height - 8}" text-anchor="middle" font-family="Segoe UI, sans-serif" font-size="12" fill="#374151">prompt tokens</text>'
    )
    for idx, (_name, pts) in enumerate(series):
        color = colors[idx % len(colors)]
        d = " ".join(
            ("M" if i == 0 else "L") + f"{X(x):.1f},{Y(y):.1f}" for i, (x, y) in enumerate(pts)
        )
        parts.append(f'<path d="{d}" fill="none" stroke="{color}" stroke-width="2.4"/>')
        for x, y in pts:
            parts.append(f'<circle cx="{X(x):.1f}" cy="{Y(y):.1f}" r="3.2" fill="{color}"/>')
    parts.append("</svg>")
    path.write_text("\n".join(parts) + "\n", encoding="utf-8")


def bars(path: Path, title: str, ylabel: str, groups: list[tuple[str, list[tuple[str, float, str]]]]) -> None:
    names = []
    for _g, items in groups:
        for name, _v, color in items:
            if name not in [n for n, _c in names]:
                names.append((name, color))
    width = max(760, 120 + 110 * len(groups))
    height = 440
    left, right, top, bottom = 64, 16, 78, 48
    vals = [v for _, items in groups for _n, v, _c in items]
    y1 = max(vals) * 1.18
    pw, ph = width - left - right, height - top - bottom
    slot = pw / max(1, len(groups))

    def Y(y: float) -> float:
        return top + (1 - y / y1) * ph

    parts = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#ffffff"/>',
        f'<text x="{left}" y="24" font-family="Segoe UI, sans-serif" font-size="16" fill="#111827">{_esc(title)}</text>',
    ]
    for idx, (name, color) in enumerate(names):
        lx = left + (idx % 4) * 170
        ly = 44 + (idx // 4) * 16
        parts.append(f'<rect x="{lx}" y="{ly - 8}" width="12" height="12" fill="{color}"/>')
        parts.append(
            f'<text x="{lx + 18}" y="{ly + 2}" font-family="Segoe UI, sans-serif" font-size="12" fill="#111827">{_esc(name)}</text>'
        )
    for tick in _nice(0, y1):
        yy = Y(tick)
        parts.append(f'<line x1="{left}" y1="{yy:.1f}" x2="{width - right}" y2="{yy:.1f}" stroke="#e5e7eb"/>')
        parts.append(
            f'<text x="{left - 8}" y="{yy + 4:.1f}" text-anchor="end" font-family="Segoe UI, sans-serif" font-size="11" fill="#4b5563">{_ytick(tick, y1)}</text>'
        )
    parts.append(
        f'<text x="16" y="{top + ph / 2:.0f}" transform="rotate(-90 16 {top + ph / 2:.0f})" font-family="Segoe UI, sans-serif" font-size="12" fill="#374151">{_esc(ylabel)}</text>'
    )
    for gi, (gname, items) in enumerate(groups):
        bw = min(28, (slot - 28) / max(1, len(items)))
        cluster = len(items) * bw + (len(items) - 1) * 6
        origin = left + gi * slot + (slot - cluster) / 2
        for ii, (_name, value, color) in enumerate(items):
            x = origin + ii * (bw + 6)
            y = Y(value)
            h = top + ph - y
            parts.append(f'<rect x="{x:.1f}" y="{y:.1f}" width="{bw:.1f}" height="{h:.1f}" fill="{color}"/>')
            shown = f"{value:.1f}" if isinstance(value, float) and not float(value).is_integer() else f"{value:.0f}"
            parts.append(
                f'<text x="{x + bw / 2:.1f}" y="{y - 6:.1f}" text-anchor="middle" font-family="Segoe UI, sans-serif" font-size="11" fill="#111827">{shown}</text>'
            )
        parts.append(
            f'<text x="{left + gi * slot + slot / 2:.1f}" y="{height - 18}" text-anchor="middle" font-family="Segoe UI, sans-serif" font-size="12" fill="#111827">{_esc(gname)}</text>'
        )
    parts.append("</svg>")
    path.write_text("\n".join(parts) + "\n", encoding="utf-8")


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    fp8 = json.loads((ROOT / "results" / "fp8-held-c1.json").read_text(encoding="utf-8"))["points"]
    k8_rows = []
    for line in (ROOT / "results" / "k8v4-held-c1.jsonl").read_text(encoding="utf-8").splitlines():
        row = json.loads(line)
        if row.get("kind") == "point" and row.get("concurrency") == 1:
            one = row["results"][0]
            k8_rows.append(
                {
                    "prompt_tokens": one["prompt_tokens"],
                    "prefill_tok_s": one["prefill_tok_s"],
                    "decode_tok_s": one["decode_tok_s"],
                    "step_ms": one["update_gap_ms"],
                    "ttft_s": one["ttft_s"],
                    "kv": row["sampler"]["kv_cache_usage_max"],
                    "attn_s": row["attn_time"]["prefill_us"] / 1e6,
                    "accepted": row["metric_delta"][
                        'vllm:spec_decode_num_accepted_tokens_total{engine="0",model_name="Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8"}'
                    ],
                    "drafted": row["metric_delta"][
                        'vllm:spec_decode_num_draft_tokens_total{engine="0",model_name="Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8"}'
                    ],
                }
            )
    k8_pts = lambda key: [(r["prompt_tokens"], r[key]) for r in k8_rows]
    fp_pts = lambda key: [(r["prompt_tokens"], r[key]) for r in fp8]
    line_chart(OUT / "fox-prefill.svg", "Single stream prefill", "prefill tok/s", [("K8/V4", k8_pts("prefill_tok_s")), ("FP8", fp_pts("prefill_tok_s"))])
    line_chart(OUT / "fox-decode.svg", "Single stream decode", "decode tok/s", [("K8/V4", k8_pts("decode_tok_s")), ("FP8", fp_pts("decode_tok_s"))])
    line_chart(OUT / "fox-step.svg", "Verifier step", "milliseconds", [("K8/V4", k8_pts("step_ms")), ("FP8", fp_pts("step_ms"))])
    line_chart(OUT / "fox-ttft.svg", "Time to first token", "seconds", [("K8/V4", k8_pts("ttft_s")), ("FP8", fp_pts("ttft_s")), ("K8/V4 prefill attention", [(r["prompt_tokens"], r["attn_s"]) for r in k8_rows])])
    line_chart(
        OUT / "fox-kv.svg",
        "KV pool used at the same prompt",
        "fraction of pool",
        [("K8/V4", k8_pts("kv")), ("FP8", fp_pts("kv_cache_usage"))],
        y_top=0.30,
    )
    accept = [(r["prompt_tokens"], r["accepted"] / r["drafted"]) for r in k8_rows]
    accept_fp = [(r["prompt_tokens"], r["accepted"] / r["drafted"]) for r in fp8]
    line_chart(OUT / "fox-accept.svg", "Draft tokens accepted", "acceptance", [("K8/V4", accept), ("FP8", accept_fp)], y_top=1.0)

    bench = json.loads((ROOT / "results" / "betterbench-quick.json").read_text(encoding="utf-8"))
    levels = [1, 2, 4, 8]
    groups = []
    for level in levels:
        fp = next(x for x in bench["fp8"]["concurrency"] if x["level"] == level)
        kv = next(x for x in bench["k8v4"]["concurrency"] if x["level"] == level)
        groups.append((f"c={level}", [("K8/V4", kv["aggregate_tok_s"], K8), ("FP8", fp["aggregate_tok_s"], FP8)]))
    bars(OUT / "bench-concurrency.svg", "BetterBench aggregate decode", "tok/s", groups)
    per = []
    for level in levels:
        fp = next(x for x in bench["fp8"]["concurrency"] if x["level"] == level)
        kv = next(x for x in bench["k8v4"]["concurrency"] if x["level"] == level)
        per.append((f"c={level}", [("K8/V4", kv["per_request_tok_s"], K8), ("FP8", fp["per_request_tok_s"], FP8)]))
    bars(OUT / "bench-per-request.svg", "BetterBench per-request decode median", "tok/s", per)
    pref = []
    for fp, kv in zip(bench["fp8"]["prefill"], bench["k8v4"]["prefill"]):
        pref.append((fp["depth"], [("K8/V4", kv["tok_s"], K8), ("FP8", fp["tok_s"], FP8)]))
    bars(OUT / "bench-prefill.svg", "BetterBench cold prefill", "tok/s", pref)

    pieces_prefill = [
        (
            "64K fox prefill",
            [
                ("FP8", 1161, FP8),
                ("oneDNN", 1394, ACCENT),
                ("+ MLP W4A8", 1638, K8),
                ("all-GEMM", 1732, REJECT),
            ],
        )
    ]
    pieces_decode = [
        (
            "128K fox decode",
            [
                ("FP8", 35.2, FP8),
                ("serial K8", 33.6, REJECT),
                ("parallel", 53.9, ACCENT),
                ("+ MLP W4A8", 57.2, K8),
            ],
        )
    ]
    bars(OUT / "pieces-prefill.svg", "What moved 64K prefill", "tok/s", pieces_prefill)
    bars(OUT / "pieces-decode.svg", "What moved 128K decode", "tok/s", pieces_decode)

    per_head = 256 + 128 + 12
    k8_tok = per_head * 2
    fp8_tok = 2 * 2 * 256
    saved_tok = (fp8_tok - k8_tok) * 16 * 2
    full = 131072
    print("k8_bytes", k8_tok, "fp8_bytes", fp8_tok, "saved_per_token", saved_tok)
    print("saved_mib_131072", saved_tok * full / (1024 * 1024))
    print("saved_mib_127853", saved_tok * 127853 / (1024 * 1024))
    print("fp8_gib", fp8_tok * 16 * 2 * full / (1024 ** 3))
    print("k8_gib", k8_tok * 16 * 2 * full / (1024 ** 3))
    print("charts", len(list(OUT.glob('*.svg'))))


if __name__ == "__main__":
    main()
