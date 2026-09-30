"""Coding and agent prompts against the instrumented MTP server.

One request at a time. Long prompts are skipped once prefill falls under
1000 tok/s. The JSONL rows are the client-side timing; draft distributions
are written by the server.
"""

from __future__ import annotations

import json
import os
import sys
import time
import urllib.error
import urllib.request

BASE = os.environ.get("MTP_BASE", "http://127.0.0.1:8200")
MODEL = "Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8"
_MTP_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "mtp-tree")
OUT = os.environ.get("MTP_RUNS_FILE", os.path.join(_MTP_DIR, "runs.jsonl"))
TOPK = os.environ.get("MTP_TOPK_FILE", os.path.join(_MTP_DIR, "topk.jsonl"))
DECODE_TOKENS = int(os.environ.get("MTP_DECODE_TOKENS", "96"))
TIMEOUT = float(os.environ.get("MTP_TIMEOUT", "300"))

SHORT_RETRY = (
    "Write a Python function retry(fn, attempts) that retries fn with "
    "exponential backoff starting at 0.01 seconds. Include a short docstring "
    "and raise the last exception. Reply with code only."
)
SHORT_BUG = (
    "Fix the off-by-one bug. Reply with the function only.\n\n"
    "def slice_tail(items, count):\n"
    "    if count <= 0:\n"
    "        return []\n"
    "    return items[len(items) - count + 1 :]\n"
)
AGENT_FILE = (
    "def parse_config(text):\n"
    "    found = {}\n"
    "    for line in text.splitlines():\n"
    "        line = line.strip()\n"
    "        if not line or line.startswith('#'):\n"
    "            continue\n"
    "        key, value = line.split('=', 1)\n"
    "        found[key.strip()] = value.strip()\n"
    "    return found\n"
)
AGENT_ASK = (
    "You are editing parser.py. Reject unknown keys; the only allowed keys "
    "are host, port, and name. Return only the replacement function.\n\n"
    + AGENT_FILE
)
LONG_TASK = (
    "The functions above are the current module. Add total(values) that "
    "calls step_0 through the last step in order and returns the sum of "
    "their results. Reply with only that function."
)


def function_block(index: int) -> str:
    scale = (index % 17) + 1
    shift = index % 5
    return (
        "def step_%d(value):\n"
        "    # lane %d keeps its own offset\n"
        "    return (value + %d) * %d - %d\n\n" % (index, index, index, scale, shift)
    )


def corpus(count: int) -> str:
    return "".join(function_block(index) for index in range(count)) + "\n" + LONG_TASK


def post(prompt: str, max_tokens: int) -> dict:
    body = {
        "model": MODEL,
        "messages": [{"role": "user", "content": prompt}],
        "max_tokens": max_tokens,
        "temperature": 0,
        "ignore_eos": True,
        "stream": True,
        "stream_options": {"include_usage": True},
        "chat_template_kwargs": {"enable_thinking": False},
    }
    request = urllib.request.Request(
        BASE + "/v1/chat/completions",
        data=json.dumps(body).encode("utf-8"),
        headers={"Content-Type": "application/json"},
    )
    started = time.time()
    first = None
    text = []
    usage = {}
    try:
        with urllib.request.urlopen(request, timeout=TIMEOUT) as response:
            for raw in response:
                line = raw.decode("utf-8", errors="replace").strip()
                if not line.startswith("data:"):
                    continue
                payload = line[5:].strip()
                if payload == "[DONE]":
                    break
                chunk = json.loads(payload)
                if chunk.get("usage"):
                    usage = chunk["usage"]
                choices = chunk.get("choices") or []
                if not choices:
                    continue
                delta = (choices[0].get("delta") or {}).get("content") or ""
                if delta and first is None:
                    first = time.time()
                if delta:
                    text.append(delta)
    except urllib.error.HTTPError as exc:
        detail = exc.read().decode("utf-8", errors="replace")[:500]
        return {"error": "http %s %s" % (exc.code, detail), "t0": started, "t1": time.time()}
    except Exception as exc:
        return {"error": str(exc), "t0": started, "t1": time.time()}
    ended = time.time()
    prompt_tokens = usage.get("prompt_tokens")
    completion = usage.get("completion_tokens")
    ttft = None if first is None else first - started
    decode = None
    if first is not None and completion:
        span = ended - first
        if span > 0:
            decode = completion / span
    prefill = None
    if ttft and prompt_tokens and ttft > 0:
        prefill = prompt_tokens / ttft
    return {
        "t0": started,
        "t1": ended,
        "ttft_s": None if ttft is None else round(ttft, 3),
        "prefill_tok_s": None if prefill is None else round(prefill, 1),
        "decode_tok_s": None if decode is None else round(decode, 2),
        "prompt_tokens": prompt_tokens,
        "completion_tokens": completion,
        "text_head": "".join(text)[:240],
        "error": None,
    }


def append(row: dict) -> None:
    with open(OUT, "a", encoding="utf-8") as handle:
        handle.write(json.dumps(row, separators=(",", ":")) + "\n")
    printable = {key: row[key] for key in row if key != "text_head"}
    printable["text_head"] = row.get("text_head")
    print(json.dumps(printable), flush=True)


def is_step_line(line: str) -> bool:
    text = line.strip()
    if not text:
        return False
    try:
        row = json.loads(text)
    except json.JSONDecodeError:
        return False
    return isinstance(row, dict) and "positions" in row and row.get("kind") != "breadcrumb"


def load_steps() -> list[dict]:
    if not os.path.isfile(TOPK):
        return []
    rows = []
    with open(TOPK, encoding="utf-8") as handle:
        for line in handle:
            if not is_step_line(line):
                continue
            rows.append(json.loads(line))
    return rows


def skip_longer(name: str, prefill: float | None) -> bool:
    """The 1000 tok/s floor applies to held-context fills, not a 50-token prompt."""
    if not str(name).startswith("code-ctx-"):
        return False
    if prefill is None:
        return False
    return float(prefill) < 1000.0


def run_named(name: str, prompt: str, max_tokens: int) -> dict:
    before = len(load_steps())
    row = post(prompt, max_tokens)
    time.sleep(0.5)
    steps = load_steps()
    fresh = steps[before:]
    row["name"] = name
    row["topk_new"] = len(fresh)
    row["max_draft"] = max((int(item.get("n_draft") or 0) for item in fresh), default=0)
    row["matched_new"] = sum(1 for item in fresh if item.get("matched_proposal"))
    append(row)
    return row


def fit_scale() -> tuple[float, float]:
    small = run_named("fit-small", corpus(8), 8)
    large = run_named("fit-large", corpus(24), 8)
    if small.get("error") or large.get("error"):
        raise SystemExit("FIT_FAILED")
    tok_small = small.get("prompt_tokens") or 0
    tok_large = large.get("prompt_tokens") or 0
    per = (tok_large - tok_small) / 16.0
    overhead = tok_small - per * 8.0
    print(json.dumps({"kind": "fit", "per": per, "overhead": overhead}), flush=True)
    if per <= 0:
        raise SystemExit("FIT_FAILED")
    return per, overhead


def count_for(target: int, per: float, overhead: float) -> int:
    return max(1, int(round((target - overhead) / per)))


def main() -> int:
    open(OUT, "w", encoding="utf-8").close()
    short = run_named("code-retry", SHORT_RETRY, DECODE_TOKENS)
    if short.get("error") or not short.get("completion_tokens"):
        print("SHORT_FAILED", flush=True)
        return 1
    if short["topk_new"] <= 0:
        print("NO_TOPK", flush=True)
        return 2
    if short["matched_new"] <= 0:
        print("UNMATCHED_TOPK", flush=True)
        return 2
    if short["max_draft"] < 6:
        print("SHALLOW_TOPK", flush=True)
        return 2
    bug = run_named("code-bugfix", SHORT_BUG, DECODE_TOKENS)
    agent = run_named("agent-edit", AGENT_ASK, DECODE_TOKENS)
    if bug.get("error") or agent.get("error"):
        print("SHORT_FAILED", flush=True)
        return 1
    per, overhead = fit_scale()
    # 120k leaves room for the chat template and the 96 completion tokens
    # under the 131072 context limit.
    for target in (8000, 32000, 64000, 120000):
        count = count_for(target, per, overhead)
        row = run_named("code-ctx-%d" % target, corpus(count), DECODE_TOKENS)
        if row.get("error"):
            if target >= 120000:
                print("SKIP_120K %s" % row["error"], flush=True)
                break
            print("POINT_FAILED %d" % target, flush=True)
            return 1
        prefill = row.get("prefill_tok_s")
        print(
            json.dumps(
                {
                    "kind": "gate",
                    "target": target,
                    "prompt_tokens": row.get("prompt_tokens"),
                    "prefill": prefill,
                }
            ),
            flush=True,
        )
        if skip_longer(row["name"], prefill):
            print("SKIP_LONGER prefill", flush=True)
            break
    print("PROBES_DONE", flush=True)
    ready = os.environ.get("MTP_READY_FILE", os.path.join(_MTP_DIR, "probe-ready"))
    release = os.environ.get("MTP_RELEASE_FILE", os.path.join(_MTP_DIR, "release"))
    with open(ready, "w", encoding="utf-8") as handle:
        handle.write("ready\n")
    print("HOLDING", flush=True)
    while not os.path.exists(release):
        time.sleep(5)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
