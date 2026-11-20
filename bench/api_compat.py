"""OpenAI API compatibility check for an agent client (Turnstone-style) against a vLLM server.

What an agent platform relies on, checked one request at a time: the served model name and context, the
rendered prompt (default reasoning effort, accepted effort values, non-leading system messages), tool calls
with tool_choice auto / required / named, json_schema structured output, streamed tool calls with a usage
chunk, thinking on/off, prompt_tokens_details.cached_tokens on a repeated prompt, four concurrent streamed
requests with thinking, images per request (count and a 1920x1080 screenshot's token cost), and whether an idle
keep-alive connection survives a pause.

Prints one ``COMPAT <name> <PASS|FAIL|INFO> <detail>`` line per check and a final JSON line.
Usage: python3 -I api_compat.py BASE_URL [MODEL]   (stdlib only; e.g. http://127.0.0.1:8002 qwen38)
"""

from __future__ import annotations

import http.client
import json
import sys
import threading
import time
import urllib.error
import urllib.parse
import urllib.request

BASE = sys.argv[1].rstrip("/") if len(sys.argv) > 1 else "http://127.0.0.1:8002"
MODEL = sys.argv[2] if len(sys.argv) > 2 else "qwen38"
RESULTS = {}

WEATHER = {
    "type": "function",
    "function": {
        "name": "get_weather",
        "description": "Get the current weather for a city.",
        "parameters": {
            "type": "object",
            "properties": {
                "city": {"type": "string", "description": "City name"},
                "unit": {"type": "string", "enum": ["celsius", "fahrenheit"]},
            },
            "required": ["city"],
        },
    },
}
SHELL = {
    "type": "function",
    "function": {
        "name": "run_shell",
        "description": "Run a shell command in the workspace and return its output.",
        "parameters": {
            "type": "object",
            "properties": {"command": {"type": "string"}},
            "required": ["command"],
        },
    },
}
LOW = {"enable_thinking": True, "reasoning_effort": "low"}
OFF = {"enable_thinking": False}


def record(name, ok, detail):
    status = "INFO" if ok is None else ("PASS" if ok else "FAIL")
    RESULTS[name] = {"status": status, "detail": detail}
    print("COMPAT %s %s %s" % (name, status, detail), flush=True)


def post(path, body, timeout=600):
    req = urllib.request.Request(BASE + path, data=json.dumps(body).encode(),
                                 headers={"Content-Type": "application/json"})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return resp.status, json.loads(resp.read())
    except urllib.error.HTTPError as err:
        text = err.read().decode(errors="replace")
        try:
            return err.code, json.loads(text)
        except ValueError:
            return err.code, {"raw": text[:300]}


def chat(messages, **kw):
    body = {"model": MODEL, "messages": messages, "max_tokens": kw.pop("max_tokens", 1024)}
    body.update(kw)
    return post("/v1/chat/completions", body)


def stream_chat(messages, **kw):
    """Streamed chat; returns (status, reasoning, content, tool_calls, usage, finish, error)."""
    body = {"model": MODEL, "messages": messages, "stream": True,
            "stream_options": {"include_usage": True}, "max_tokens": kw.pop("max_tokens", 1024)}
    body.update(kw)
    req = urllib.request.Request(BASE + "/v1/chat/completions", data=json.dumps(body).encode(),
                                 headers={"Content-Type": "application/json"})
    reasoning, content, calls, usage, finish = [], [], {}, None, None
    try:
        with urllib.request.urlopen(req, timeout=900) as resp:
            for raw in resp:
                line = raw.decode().strip()
                if not line.startswith("data:"):
                    continue
                data = line[5:].strip()
                if data == "[DONE]":
                    break
                chunk = json.loads(data)
                if chunk.get("usage"):
                    usage = chunk["usage"]
                for choice in chunk.get("choices") or []:
                    delta = choice.get("delta") or {}
                    if delta.get("reasoning_content") or delta.get("reasoning"):
                        reasoning.append(delta.get("reasoning_content") or delta.get("reasoning"))
                    if delta.get("content"):
                        content.append(delta["content"])
                    for tc in delta.get("tool_calls") or []:
                        slot = calls.setdefault(tc.get("index", 0), {"name": "", "arguments": ""})
                        fn = tc.get("function") or {}
                        slot["name"] += fn.get("name") or ""
                        slot["arguments"] += fn.get("arguments") or ""
                    if choice.get("finish_reason"):
                        finish = choice["finish_reason"]
        return 200, "".join(reasoning), "".join(content), calls, usage, finish, None
    except urllib.error.HTTPError as err:
        return err.code, "", "", {}, None, None, err.read().decode(errors="replace")[:200]


def msg_of(resp):
    return ((resp.get("choices") or [{}])[0]).get("message") or {}


def reasoning_of(message):
    return message.get("reasoning_content") or message.get("reasoning") or ""


def render(messages, **kw):
    """The prompt text the server's chat template renders (POST /tokenize, then /detokenize)."""
    body = {"model": MODEL, "messages": messages, "add_generation_prompt": True}
    body.update(kw)
    status, out = post("/tokenize", body, timeout=60)
    if status != 200:
        return status, (out.get("error") or {}).get("message") or out.get("message") or str(out)[:200]
    status, text = post("/detokenize", {"model": MODEL, "tokens": out["tokens"]}, timeout=60)
    return status, text.get("prompt", "")


def effort_in(prompt):
    for level in ("xhigh", "medium", "low"):
        if "Reasoning effort is set to %s" % level in prompt:
            return level
    # The Qwen3.8 templates state xhigh and low; medium adds no line.
    return "medium (no effort line)" if prompt.rstrip().endswith("<think>") else "thinking off"


def check_models():
    with urllib.request.urlopen(BASE + "/v1/models", timeout=30) as resp:
        data = json.loads(resp.read())["data"]
    ids = [m["id"] for m in data]
    lens = {m["id"]: m.get("max_model_len") for m in data}
    record("served_name", MODEL in ids, "ids=%s max_model_len=%s" % (ids, lens.get(MODEL)))


def check_template():
    user = [{"role": "user", "content": "Say hi."}]
    status, prompt = render(user)
    record("default_effort", None if status == 200 else False,
           "no kwargs -> %s (status %s)" % (effort_in(prompt) if status == 200 else prompt, status))
    for level in ("low", "medium", "xhigh", "high", "minimal"):
        status, prompt = render(user, chat_template_kwargs={"reasoning_effort": level})
        shown = effort_in(prompt) if status == 200 else str(prompt)[:80]
        record("effort_%s" % level, status == 200 if level in ("low", "medium", "xhigh") else None,
               "status %s -> %s" % (status, shown))
    status, prompt = render(user, chat_template_kwargs=OFF)
    record("thinking_off_render", status == 200 and prompt.rstrip().endswith("</think>"),
           "status %s ends with empty think block: %s" % (status, status == 200 and prompt.rstrip().endswith("</think>")))
    inline = [{"role": "system", "content": "You are terse."}, {"role": "user", "content": "Hi."},
              {"role": "assistant", "content": "Hello."}, {"role": "system", "content": "Reminder: be brief."},
              {"role": "user", "content": "Again."}]
    status, prompt = render(inline)
    record("inline_system", None, "status %s%s" % (status, "" if status == 200 else " " + str(prompt)[:90]))


def check_tools():
    ask = [{"role": "user", "content": "What is the weather in Paris right now? Use the tool."}]
    status, out = chat(ask, tools=[WEATHER, SHELL], tool_choice="auto", chat_template_kwargs=LOW)
    m = msg_of(out) if status == 200 else {}
    calls = m.get("tool_calls") or []
    ok = status == 200 and calls and calls[0]["function"]["name"] == "get_weather"
    args = calls[0]["function"]["arguments"] if calls else ""
    record("tool_auto", bool(ok and "paris" in args.lower()),
           "status %s finish=%s calls=%s args=%s" % (status, (out.get("choices") or [{}])[0].get("finish_reason"),
                                                   [c["function"]["name"] for c in calls], args[:80]))
    status, out = chat([{"role": "user", "content": "Tell me about Rome."}], tools=[WEATHER],
                       tool_choice="required", chat_template_kwargs=LOW)
    calls = msg_of(out).get("tool_calls") or [] if status == 200 else []
    record("tool_required", status == 200 and len(calls) >= 1 and calls[0]["function"]["name"] == "get_weather",
           "status %s calls=%s %s" % (status, [c["function"]["name"] for c in calls],
                                       "" if status == 200 else str(out)[:120]))
    status, out = chat([{"role": "user", "content": "List the files here."}], tools=[WEATHER, SHELL],
                       tool_choice={"type": "function", "function": {"name": "run_shell"}}, chat_template_kwargs=LOW)
    calls = msg_of(out).get("tool_calls") or [] if status == 200 else []
    record("tool_named", status == 200 and calls and calls[0]["function"]["name"] == "run_shell",
           "status %s calls=%s" % (status, [c["function"]["name"] for c in calls]))
    # A tool result round trip: the second turn must answer from the tool output.
    if calls:
        history = [{"role": "user", "content": "What is the weather in Paris right now? Use the tool."},
                   {"role": "assistant", "content": "", "tool_calls": [{"id": "call_1", "type": "function",
                    "function": {"name": "get_weather", "arguments": json.dumps({"city": "Paris"})}}]},
                   {"role": "tool", "tool_call_id": "call_1", "content": "{\"temp_c\": 17, \"sky\": \"rain\"}"}]
        status, out = chat(history, tools=[WEATHER], chat_template_kwargs=LOW)
        text = (msg_of(out).get("content") or "") if status == 200 else ""
        record("tool_result_turn", status == 200 and "17" in text, "status %s content=%r" % (status, text[:80]))


def check_json_schema():
    schema = {"type": "object", "properties": {"name": {"type": "string"}, "age": {"type": "integer"}},
              "required": ["name", "age"], "additionalProperties": False}
    status, out = chat([{"role": "user", "content": "Invent a person. Reply as JSON with name and age."}],
                       response_format={"type": "json_schema",
                                        "json_schema": {"name": "person", "schema": schema, "strict": True}},
                       chat_template_kwargs=LOW)
    text = (msg_of(out).get("content") or "") if status == 200 else str(out)[:120]
    try:
        obj = json.loads(text)
        ok = set(obj) == {"name", "age"} and isinstance(obj["age"], int)
    except ValueError:
        ok = False
    record("json_schema", ok, "status %s content=%r" % (status, text[:100]))
    status, out = chat([{"role": "user", "content": "Reply with a JSON object with a key ok set to true."}],
                       response_format={"type": "json_object"}, chat_template_kwargs=OFF)
    text = (msg_of(out).get("content") or "") if status == 200 else str(out)[:120]
    try:
        ok = isinstance(json.loads(text), dict)
    except ValueError:
        ok = False
    record("json_object", ok, "status %s content=%r" % (status, text[:60]))


def check_stream_tools():
    st, reasoning, content, calls, usage, finish, err = stream_chat(
        [{"role": "user", "content": "Check the weather in Oslo and in Lima. Call the tool for each city."}],
        tools=[WEATHER], tool_choice="auto", chat_template_kwargs=LOW)
    names = [c["name"] for c in calls.values()]
    parsed = True
    for c in calls.values():
        try:
            json.loads(c["arguments"])
        except ValueError:
            parsed = False
    record("stream_tools", st == 200 and names and all(n == "get_weather" for n in names) and parsed
           and finish == "tool_calls",
           "status %s calls=%d finish=%s args_json=%s reasoning_chars=%d %s"
           % (st, len(names), finish, parsed, len(reasoning), err or ""))
    record("stream_usage", st == 200 and bool(usage and usage.get("completion_tokens")),
           "usage=%s" % json.dumps(usage)[:160])


def check_thinking():
    q = [{"role": "user", "content": "What is 17 * 23? Answer with the number."}]
    status, out = chat(q, chat_template_kwargs=LOW)
    m = msg_of(out)
    record("thinking_on", status == 200 and len(reasoning_of(m)) > 0 and "391" in (m.get("content") or ""),
           "status %s reasoning_chars=%d content=%r" % (status, len(reasoning_of(m)), (m.get("content") or "")[:40]))
    status, out = chat(q, chat_template_kwargs=OFF)
    m = msg_of(out)
    record("thinking_off", status == 200 and not reasoning_of(m) and "391" in (m.get("content") or ""),
           "status %s reasoning_chars=%d content=%r" % (status, len(reasoning_of(m)), (m.get("content") or "")[:40]))
    status, out = chat(q, max_tokens=4096)
    m = msg_of(out)
    usage = out.get("usage") or {}
    record("thinking_default", None, "status %s (no kwargs) reasoning_chars=%d completion_tokens=%s"
           % (status, len(reasoning_of(m)), usage.get("completion_tokens")))
    status, out = chat(q, reasoning_effort="low", max_tokens=4096)
    record("top_level_effort", None, "reasoning_effort=low top-level field: status %s reasoning_chars=%d"
           % (status, len(reasoning_of(msg_of(out)))))


def check_cached_tokens():
    filler = " ".join("Line %d: the quick brown fox jumps over the lazy dog near the river bank." % i
                      for i in range(250))
    msgs = [{"role": "system", "content": "You answer briefly. Reference text follows. " + filler},
            {"role": "user", "content": "How many lines are in the reference text? %d" % int(time.time())}]
    first = chat(msgs, max_tokens=8, chat_template_kwargs=OFF)
    second = chat(msgs, max_tokens=8, chat_template_kwargs=OFF)
    u1, u2 = first[1].get("usage") or {}, second[1].get("usage") or {}
    d2 = u2.get("prompt_tokens_details")
    cached = (d2 or {}).get("cached_tokens")
    record("cached_tokens", bool(cached), "prompt_tokens=%s second prompt_tokens_details=%s"
           % (u1.get("prompt_tokens"), json.dumps(d2)))


def check_concurrent():
    results = [None] * 4
    prompts = ["Write a Python function that reverses a linked list, then call the shell tool to run its test.",
               "Explain in three sentences why the sky is blue.",
               "What is the weather in Tokyo? Use the tool.",
               "Compute 123 * 456 step by step and give the result."]

    def one(i):
        results[i] = stream_chat([{"role": "user", "content": prompts[i]}], tools=[WEATHER, SHELL],
                                 chat_template_kwargs={"enable_thinking": True, "reasoning_effort": "medium"},
                                 max_tokens=2048)

    t0 = time.time()
    threads = [threading.Thread(target=one, args=(i,)) for i in range(4)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    rows = []
    ok = True
    for r in results:
        st, reasoning, content, calls, usage, finish, err = r
        rows.append("%s/%s/r%d/c%d/t%d" % (st, finish, len(reasoning), len(content), len(calls)))
        ok = ok and st == 200 and finish in ("stop", "tool_calls", "length") and bool(reasoning) and (
            bool(content) or bool(calls) or finish == "length")
    record("concurrent4_stream_thinking", ok, "%.1fs %s" % (time.time() - t0, " ".join(rows)))


def _png(width, height, rgb):
    """A solid-colour PNG as a data URL (stdlib only)."""
    import base64
    import struct
    import zlib

    def chunk(kind, data):
        return struct.pack(">I", len(data)) + kind + data + struct.pack(">I", zlib.crc32(kind + data) & 0xFFFFFFFF)

    raw = b"".join(b"\x00" + bytes(rgb) * width for _ in range(height))
    png = (b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0))
           + chunk(b"IDAT", zlib.compress(raw)) + chunk(b"IEND", b""))
    return "data:image/png;base64," + base64.b64encode(png).decode()


def check_images():
    """Agent screenshots pile up in a conversation: how many images per request, and how big."""
    img = {"type": "image_url", "image_url": {"url": _png(64, 64, (200, 30, 30))}}
    for count in (1, 5):
        content = [img] * count + [{"type": "text", "text": "What colour are these images? One word."}]
        status, out = chat([{"role": "user", "content": content}], max_tokens=16, chat_template_kwargs=OFF)
        detail = (msg_of(out).get("content") or "")[:30] if status == 200 else str(out)[:120]
        record("images_%d" % count, status == 200 if count == 1 else None, "status %s %r" % (status, detail))
    big = {"type": "image_url", "image_url": {"url": _png(1920, 1080, (30, 30, 200))}}
    status, out = chat([{"role": "user", "content": [big, {"type": "text", "text": "Colour? One word."}]}],
                       max_tokens=8, chat_template_kwargs=OFF)
    record("image_1920x1080_tokens", None, "status %s prompt_tokens=%s"
           % (status, (out.get("usage") or {}).get("prompt_tokens")))


def check_keepalive():
    u = urllib.parse.urlparse(BASE)
    conn = http.client.HTTPConnection(u.hostname, u.port, timeout=60)
    conn.request("GET", "/v1/models")
    conn.getresponse().read()
    time.sleep(8)
    try:
        conn.request("GET", "/v1/models")
        status = conn.getresponse().status
        record("keepalive_8s", status == 200, "reused connection after 8 s idle: status %s" % status)
    except (http.client.HTTPException, OSError) as err:
        record("keepalive_8s", False, "reused connection after 8 s idle failed: %s" % type(err).__name__)
    finally:
        conn.close()


def main():
    for check in (check_models, check_template, check_tools, check_json_schema, check_stream_tools,
                  check_thinking, check_cached_tokens, check_concurrent, check_images, check_keepalive):
        try:
            check()
        except Exception as err:  # one failing check must not hide the others
            record(check.__name__, False, "exception %s: %s" % (type(err).__name__, str(err)[:160]))
    fails = [k for k, v in RESULTS.items() if v["status"] == "FAIL"]
    print("COMPAT-SUMMARY " + json.dumps({"base": BASE, "fail": fails,
                                          "pass": sum(v["status"] == "PASS" for v in RESULTS.values())}))


if __name__ == "__main__":
    main()
