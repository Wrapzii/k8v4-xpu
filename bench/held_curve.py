#!/usr/bin/env python3
"""Held-context prefill and decode curve against one already-running server.

The prompt for a (target, concurrency, index) slot is identical on every
server, so temperature-0 token ids compare. ignore_eos keeps the decode
window at DECODE_TOKENS instead of stopping on the first end token.
"""
import glob
import json
import os
import subprocess
import sys
import threading
import time
import urllib.error
import urllib.request

BASE = os.environ.get("CURVE_BASE", "http://127.0.0.1:8200")
MODEL = "Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8"
LABEL = os.environ.get("CURVE_LABEL", "k8v4")
UNIT = "The quick brown fox jumps over the lazy dog. "
def _int_list(name, default):
    raw = os.environ.get(name, "").strip()
    if not raw:
        return list(default)
    return [int(part) for part in raw.split(",") if part.strip()]


TARGETS = _int_list("CURVE_TARGETS", [2000, 8000, 16000, 32000, 64000, 96000, 128000])
CONCURRENCY = _int_list("CURVE_CONCURRENCY", [1])
DECODE_TOKENS = 96
REQUEST_TIMEOUT = int(os.environ.get("CURVE_TIMEOUT", "1800"))
# Gaps larger than this are queue stalls, not verifier steps.
STEADY_GAP_MS = 500.0

COUNTER_PREFIXES = (
    "vllm:spec_decode_num_drafts_total",
    "vllm:spec_decode_num_draft_tokens_total",
    "vllm:spec_decode_num_accepted_tokens_total",
    "vllm:spec_decode_num_accepted_tokens_per_pos_total",
    "vllm:request_decode_time_seconds_sum",
    "vllm:request_decode_time_seconds_count",
    "vllm:request_prefill_time_seconds_sum",
    "vllm:request_prefill_time_seconds_count",
    "vllm:iteration_tokens_total_sum",
    "vllm:iteration_tokens_total_count",
)


def read_num(path):
    try:
        return int(open(path).read().strip())
    except OSError:
        return None


def existing(patterns):
    found = []
    for pattern in patterns:
        found.extend(sorted(glob.glob(pattern)))
    return found


def metrics_text():
    try:
        with urllib.request.urlopen(BASE + "/metrics", timeout=10) as resp:
            return resp.read().decode("utf-8", "replace")
    except Exception as exc:
        return "METRICS_ERR %s" % exc


def counter_map(text):
    out = {}
    for line in text.splitlines():
        if not line or line.startswith("#"):
            continue
        if not any(line.startswith(prefix + "{") or line.startswith(prefix + " ") for prefix in COUNTER_PREFIXES):
            continue
        parts = line.split()
        if len(parts) < 2:
            continue
        try:
            out[parts[0]] = float(parts[1])
        except ValueError:
            continue
    return out


def kv_usage(text):
    vals = []
    for line in text.splitlines():
        if not line.startswith("vllm:kv_cache_usage_perc"):
            continue
        parts = line.split()
        if len(parts) < 2:
            continue
        try:
            vals.append(float(parts[1]))
        except ValueError:
            continue
    return max(vals) if vals else None


def slot_secret(slot):
    # Fixed width so calibration overhead does not depend on the digits.
    total = 0
    for char in slot:
        total = (total * 33 + ord(char)) % 900000
    return "%06d" % (100000 + total)


def build_prompt(n, slot):
    secret = slot_secret(slot)
    head = "CURVE %s. The secret code is %s.\n" % (slot, secret)
    tail = "\nRepeat the secret code, then continue with a comma-separated count.\n"
    return head + (UNIT * n) + tail, secret


def decode_stats(updates, t0, t1, ttft, completion_tokens):
    """Decode rate from durations. ttft and update times are seconds since t0."""
    gaps = []
    deltas = []
    prev_t = None
    prev_n = 0
    for row in updates:
        n = row["completion_tokens"] or 0
        if n <= 1 or row["t"] < (ttft or 0):
            prev_t = row["t"]
            prev_n = n
            continue
        if prev_t is not None and n > prev_n:
            gaps.append((row["t"] - prev_t) * 1000.0)
            deltas.append(n - prev_n)
        prev_t = row["t"]
        prev_n = n
    wall = t1 - t0
    decode_s = (wall - ttft) if ttft is not None else 0.0
    if decode_s < 0:
        decode_s = 0.0
    decode_tokens = max((completion_tokens or 0) - 1, 0)
    steady = [(gap, delta) for gap, delta in zip(gaps, deltas) if gap < STEADY_GAP_MS]
    chosen = steady or list(zip(gaps, deltas))
    gap_ms = None
    tokens_per_update = None
    if chosen:
        ordered_gaps = sorted(gap for gap, _delta in chosen)
        ordered_deltas = sorted(delta for _gap, delta in chosen)
        gap_ms = ordered_gaps[len(ordered_gaps) // 2]
        tokens_per_update = ordered_deltas[len(ordered_deltas) // 2]
    return {
        "decode_s": decode_s,
        "decode_tok_s": (decode_tokens / decode_s) if decode_s > 0 else None,
        "tokens_per_update": tokens_per_update,
        "update_gap_ms": gap_ms,
        "update_count": len(deltas),
        "steady_updates": len(steady),
    }


def post(payload, timeout):
    req = urllib.request.Request(
        BASE + "/v1/chat/completions",
        data=json.dumps(payload).encode(),
        headers={"Content-Type": "application/json"},
    )
    return urllib.request.urlopen(req, timeout=timeout)


def one_request(prompt, secret, max_tokens, timeout):
    payload = {
        "model": MODEL,
        "messages": [{"role": "user", "content": prompt}],
        "max_tokens": max_tokens,
        "temperature": 0,
        "ignore_eos": True,
        "stream": True,
        "stream_options": {"include_usage": True, "continuous_usage_stats": True},
        "chat_template_kwargs": {"enable_thinking": False},
        "return_token_ids": True,
    }
    t0 = time.perf_counter()
    ttft = None
    usage = None
    text = []
    token_ids = []
    updates = []
    finish_reason = None
    try:
        resp = post(payload, timeout)
    except urllib.error.HTTPError as exc:
        body = exc.read().decode("utf-8", "replace")
        return {"error": "HTTP_%s" % exc.code, "body": body[:500]}
    with resp:
        for raw in resp:
            now = time.perf_counter()
            line = raw.decode("utf-8", "replace").strip()
            if not line.startswith("data:"):
                continue
            data = line[5:].strip()
            if data == "[DONE]":
                break
            ev = json.loads(data)
            if ev.get("usage"):
                usage = ev["usage"]
                updates.append(
                    {
                        "t": now - t0,
                        "completion_tokens": usage.get("completion_tokens"),
                    }
                )
            choices = ev.get("choices") or []
            if not choices:
                continue
            choice = choices[0]
            if choice.get("finish_reason"):
                finish_reason = choice["finish_reason"]
            delta = choice.get("delta") or {}
            piece = delta.get("content") or ""
            ids = delta.get("token_ids") or choice.get("token_ids")
            if ids:
                token_ids.extend(ids)
            if piece and ttft is None:
                ttft = now - t0
            if piece:
                text.append(piece)
    t1 = time.perf_counter()
    if ttft is None:
        ttft = t1 - t0
    prompt_tokens = None if not usage else usage.get("prompt_tokens")
    completion_tokens = None if not usage else usage.get("completion_tokens")
    stats = decode_stats(updates, t0, t1, ttft, completion_tokens)
    joined = "".join(text)
    stats.update(
        {
            "ttft_s": ttft,
            "wall_s": t1 - t0,
            "prompt_tokens": prompt_tokens,
            "completion_tokens": completion_tokens,
            "prefill_tok_s": (prompt_tokens / ttft) if prompt_tokens and ttft else None,
            "finish_reason": finish_reason,
            "secret": secret,
            "secret_in_text": secret in joined,
            "text": joined[:180],
            "token_ids": token_ids,
        }
    )
    return stats


def xpu_mem_mib():
    """GPU Memory Used from xpu-smi. The xe sysfs on this host has no used-byte file."""
    used = []
    for device in (0, 1):
        try:
            text = subprocess.check_output(
                ["xpu-smi", "stats", "-d", str(device)],
                text=True,
                timeout=10,
                stderr=subprocess.DEVNULL,
            )
        except (OSError, subprocess.SubprocessError):
            used.append(None)
            continue
        value = None
        for line in text.splitlines():
            if "GPU Memory Used" not in line:
                continue
            cells = [cell.strip() for cell in line.split("|") if cell.strip()]
            if len(cells) >= 2:
                try:
                    value = int(cells[-1])
                except ValueError:
                    value = None
        used.append(value)
    return used


class Sampler:
    def __init__(self):
        self.vram = []
        self.freqs = []
        self.energy = []
        self.kv = []
        self.stop = False
        self.fpaths = [
            "/sys/class/drm/card%d/device/tile0/gt0/freq0/cur_freq" % card for card in (0, 1)
        ]
        self.epaths = existing(["/sys/class/drm/card*/device/hwmon/hwmon*/energy1_input"])

    def run(self):
        tick = 0
        while not self.stop:
            now = time.perf_counter()
            self.freqs.append([read_num(path) for path in self.fpaths])
            self.energy.append((now, [read_num(path) for path in self.epaths]))
            self.kv.append(kv_usage(metrics_text()))
            if tick % 3 == 0:
                self.vram.append(xpu_mem_mib())
            tick += 1
            time.sleep(1.0)

    def summary(self):
        def col_max(rows):
            if not rows:
                return []
            width = max(len(row) for row in rows)
            out = []
            for index in range(width):
                vals = [row[index] for row in rows if len(row) > index and row[index] is not None]
                out.append(max(vals) if vals else None)
            return out

        def col_min(rows):
            if not rows:
                return []
            width = max(len(row) for row in rows)
            out = []
            for index in range(width):
                vals = [row[index] for row in rows if len(row) > index and row[index] is not None]
                out.append(min(vals) if vals else None)
            return out

        watts = {}
        previous = None
        for stamp, row in self.energy:
            if previous is not None:
                dt = stamp - previous[0]
                if dt > 0.2:
                    for index, value in enumerate(row):
                        prev = previous[1][index] if index < len(previous[1]) else None
                        if value is None or prev is None:
                            continue
                        # energy1_input is microjoules. Idle checked at about 33 W.
                        sample = (value - prev) / dt / 1e6
                        if sample > watts.get(index, 0):
                            watts[index] = sample
            previous = (stamp, row)
        kv_vals = [value for value in self.kv if value is not None]
        return {
            "vram_mib_max": col_max(self.vram),
            "freq_min": col_min(self.freqs),
            "freq_max": col_max(self.freqs),
            "power_w_max": [round(watts[index], 1) for index in sorted(watts)],
            "kv_cache_usage_max": max(kv_vals) if kv_vals else None,
        }


def attn_snapshot():
    """Cumulative timer files, one per rank. Top-level times later use the slower rank."""
    path = os.environ.get("CURVE_ATTN_TIME_FILE", "").strip()
    if not path:
        return None
    time.sleep(float(os.environ.get("CURVE_ATTN_DRAIN_S", "0.5")))
    keys = ("prefill_us", "decode_us", "prefill_calls", "decode_calls")
    found = {}
    for rank in range(8):
        file_path = "%s.r%d" % (path, rank)
        if not os.path.isfile(file_path):
            continue
        row = {key: 0.0 for key in keys}
        with open(file_path, encoding="utf-8") as handle:
            for line in handle:
                parts = line.split()
                if len(parts) == 2 and parts[0] in row:
                    row[parts[0]] = float(parts[1])
        found[str(rank)] = row
    return found or None


def attn_delta(before, after):
    if not before or not after:
        return None
    ranks = {}
    for rank, row in after.items():
        prev = before.get(rank) or {}
        ranks[rank] = {key: row[key] - float(prev.get(key, 0.0)) for key in row}

    def pick(name):
        vals = [row[name] for row in ranks.values()]
        return max(vals) if vals else None

    return {
        "ranks": ranks,
        "prefill_us": pick("prefill_us"),
        "decode_us": pick("decode_us"),
        "prefill_calls": pick("prefill_calls"),
        "decode_calls": pick("decode_calls"),
    }


def fit_units():
    lo_prompt, lo_secret = build_prompt(40, "cal-lo")
    hi_prompt, hi_secret = build_prompt(120, "cal-hi")
    lo = one_request(lo_prompt, lo_secret, 1, 180)
    hi = one_request(hi_prompt, hi_secret, 1, 180)
    print(json.dumps({"kind": "cal", "lo": lo, "hi": hi}), flush=True)
    a = lo.get("prompt_tokens") or 0
    b = hi.get("prompt_tokens") or 0
    per = (b - a) / 80.0
    overhead = a - 40 * per
    return per, overhead


def run_point(target, conc, per, overhead):
    n = max(1, int(round((target - overhead) / per)))
    before = counter_map(metrics_text())
    attn_before = attn_snapshot()
    sampler = Sampler()
    thread = threading.Thread(target=sampler.run, daemon=True)
    thread.start()
    results = [None] * conc
    errors = []

    def work(index):
        slot = "t%d-c%d-i%d" % (target, conc, index)
        try:
            prompt, secret = build_prompt(n, slot)
            results[index] = one_request(prompt, secret, DECODE_TOKENS, REQUEST_TIMEOUT)
        except Exception as exc:
            errors.append("%s:%s" % (index, exc))

    workers = [threading.Thread(target=work, args=(index,)) for index in range(conc)]
    t0 = time.perf_counter()
    for worker in workers:
        worker.start()
    for worker in workers:
        worker.join()
    wall = time.perf_counter() - t0
    sampler.stop = True
    thread.join(timeout=2)
    after = counter_map(metrics_text())
    attn_after = attn_snapshot()
    delta = {}
    for key, value in after.items():
        if key in before:
            delta[key] = value - before[key]
    completion = 0
    for item in results:
        if item and item.get("completion_tokens"):
            completion += item["completion_tokens"]
    row = {
        "kind": "point",
        "label": LABEL,
        "base": BASE,
        "target": target,
        "concurrency": conc,
        "units": n,
        "wall_s": wall,
        "combined_completion_tok_s": (completion / wall) if wall > 0 else None,
        "results": results,
        "errors": errors,
        "metric_delta": delta,
        "attn_time": attn_delta(attn_before, attn_after),
        "sampler": sampler.summary(),
    }
    print(json.dumps(row), flush=True)
    prefills = [
        float(item["prefill_tok_s"])
        for item in results
        if item and item.get("prefill_tok_s")
    ]
    prefill = max(prefills) if prefills else None
    if errors:
        return False, prefill
    for item in results:
        if not item or item.get("error") or item.get("completion_tokens") != DECODE_TOKENS:
            return False, prefill
        if not item.get("secret_in_text"):
            return False, prefill
    return True, prefill


def gate_skip(skip_larger_than, target, conc, prefill, min_prefill):
    """Skip a later, longer target after a concurrency-1 prefill misses the floor."""
    if skip_larger_than is not None and target > skip_larger_than:
        return skip_larger_than, True
    updated = skip_larger_than
    if conc == 1 and min_prefill and (prefill is None or prefill < min_prefill):
        updated = target
    return updated, False


def main():
    print(
        json.dumps(
            {
                "kind": "begin",
                "label": LABEL,
                "base": BASE,
                "decode_tokens": DECODE_TOKENS,
                "ignore_eos": True,
                "t": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
            }
        ),
        flush=True,
    )
    warm_prompt, warm_secret = build_prompt(20, "warmup")
    warm = one_request(warm_prompt, warm_secret, 32, 180)
    print(
        json.dumps(
            {
                "kind": "warmup",
                "prompt_tokens": warm.get("prompt_tokens"),
                "completion_tokens": warm.get("completion_tokens"),
                "error": warm.get("error"),
                "finish_reason": warm.get("finish_reason"),
            }
        ),
        flush=True,
    )
    if warm.get("error"):
        return 2
    per, overhead = fit_units()
    print(json.dumps({"kind": "fit", "per_unit": per, "overhead": overhead}), flush=True)
    if per <= 0:
        print(json.dumps({"kind": "fit_fail"}), flush=True)
        return 2
    ok = True
    skip_larger_than = None
    min_prefill = float(os.environ.get("CURVE_MIN_PREFILL", "0") or 0)
    for target in TARGETS:
        if skip_larger_than is not None and target > skip_larger_than:
            print(
                json.dumps(
                    {
                        "kind": "skip",
                        "target": target,
                        "reason": "prefill_below_min",
                        "min_prefill": min_prefill,
                    }
                ),
                flush=True,
            )
            continue
        for conc in CONCURRENCY:
            good, prefill = run_point(target, conc, per, overhead)
            if not good:
                ok = False
            skip_larger_than, _skipped = gate_skip(
                skip_larger_than, target, conc, prefill, min_prefill
            )
    print(json.dumps({"kind": "end", "label": LABEL, "ok": ok}), flush=True)
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
