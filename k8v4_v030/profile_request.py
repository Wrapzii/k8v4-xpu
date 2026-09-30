#!/usr/bin/env python3
"""One cold held-context request. Same prompt builder as the kept 64K curve."""

from __future__ import annotations

import json
import os
import sys
import time
import urllib.error
import urllib.request

BASE = os.environ.get("CURVE_BASE", "http://127.0.0.1:8200")
MODEL = "Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8"
UNIT = "The quick brown fox jumps over the lazy dog. "
SLOT = os.environ.get("PROFILE_SLOT", "t64000-c1-i0")
UNITS = int(os.environ.get("PROFILE_UNITS", "6388"))
MAX_TOKENS = int(os.environ.get("PROFILE_MAX_TOKENS", "16"))
TIMEOUT = int(os.environ.get("CURVE_TIMEOUT", "300"))


def slot_secret(slot: str) -> str:
    total = 0
    for char in slot:
        total = (total * 33 + ord(char)) % 900000
    return "%06d" % (100000 + total)


def build_prompt(n: int, slot: str) -> tuple[str, str]:
    secret = slot_secret(slot)
    head = "CURVE %s. The secret code is %s.\n" % (slot, secret)
    tail = "\nRepeat the secret code, then continue with a comma-separated count.\n"
    return head + (UNIT * n) + tail, secret


def main() -> int:
    out_path = sys.argv[1]
    prompt, secret = build_prompt(UNITS, SLOT)
    payload = {
        "model": MODEL,
        "messages": [{"role": "user", "content": prompt}],
        "max_tokens": MAX_TOKENS,
        "temperature": 0,
        "ignore_eos": True,
        "stream": True,
        "stream_options": {"include_usage": True, "continuous_usage_stats": True},
        "chat_template_kwargs": {"enable_thinking": False},
        "return_token_ids": True,
    }
    body = json.dumps(payload).encode()
    request = urllib.request.Request(
        BASE + "/v1/chat/completions",
        data=body,
        headers={"Content-Type": "application/json"},
    )
    t0 = time.perf_counter()
    ttft = None
    usage = None
    text = []
    token_ids = []
    try:
        response = urllib.request.urlopen(request, timeout=TIMEOUT)
    except urllib.error.HTTPError as exc:
        detail = exc.read().decode("utf-8", "replace")[:800]
        _write(out_path, {"error": "HTTP_%s" % exc.code, "body": detail, "secret": secret})
        print("PROFILE_REQUEST_FAIL HTTP_%s" % exc.code, flush=True)
        return 1
    except urllib.error.URLError as exc:
        _write(out_path, {"error": "URL", "body": str(exc), "secret": secret})
        print("PROFILE_REQUEST_FAIL URL %s" % exc, flush=True)
        return 1
    with response:
        for raw in response:
            now = time.perf_counter()
            line = raw.decode("utf-8", "replace").strip()
            if not line.startswith("data:"):
                continue
            data = line[5:].strip()
            if data == "[DONE]":
                break
            event = json.loads(data)
            if event.get("usage"):
                usage = event["usage"]
            choices = event.get("choices") or []
            if not choices:
                continue
            choice = choices[0]
            delta = choice.get("delta") or {}
            piece = delta.get("content") or ""
            ids = delta.get("token_ids") or choice.get("token_ids")
            if ids:
                token_ids.extend(ids)
            if piece and ttft is None:
                ttft = now - t0
            if piece:
                text.append(piece)
    wall = time.perf_counter() - t0
    if ttft is None:
        ttft = wall
    prompt_tokens = None if not usage else usage.get("prompt_tokens")
    completion_tokens = None if not usage else usage.get("completion_tokens")
    joined = "".join(text)
    row = {
        "slot": SLOT,
        "units": UNITS,
        "secret": secret,
        "secret_in_text": secret in joined,
        "ttft_s": ttft,
        "wall_s": wall,
        "prompt_tokens": prompt_tokens,
        "completion_tokens": completion_tokens,
        "prefill_tok_s": (prompt_tokens / ttft) if prompt_tokens and ttft else None,
        "text": joined[:240],
        "token_ids": token_ids,
        "max_tokens": MAX_TOKENS,
    }
    _write(out_path, row)
    print(
        "PROFILE_REQUEST prompt=%s ttft=%.3f prefill=%s secret=%s"
        % (
            prompt_tokens,
            ttft,
            ("%.1f" % row["prefill_tok_s"]) if row["prefill_tok_s"] else "none",
            row["secret_in_text"],
        ),
        flush=True,
    )
    if not prompt_tokens:
        return 1
    return 0


def _write(path: str, row: dict) -> None:
    tmp = path + ".tmp"
    with open(tmp, "w", encoding="utf-8") as handle:
        json.dump(row, handle, indent=2)
    os.replace(tmp, path)


if __name__ == "__main__":
    sys.exit(main())
