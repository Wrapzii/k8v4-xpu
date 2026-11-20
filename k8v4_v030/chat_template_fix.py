"""Opt-in chat-template fix-ups for agent clients (K8V4_CHAT_TEMPLATE_FIX=1).

The Qwen3.8 / Swift templates raise "System message must be at the beginning." on any later system
message. vLLM's Anthropic endpoint (/v1/messages, e.g. Claude Code's per-turn reminders) probes the template
with [system, user, system, user]; when it raises, vLLM merges every inline system message into the leading
system prompt, so the prompt prefix changes every turn and the whole conversation misses the prefix cache
(measured on the B70 production stack; vLLM logs a warning saying so). The OpenAI endpoint returns HTTP 400 for
the same messages. With the fix, non-leading system messages render in place; conversations without them
render byte-identically.

The templates also accept only xhigh / medium / low for ``reasoning_effort`` and return HTTP 400 for the
OpenAI-style values clients send ('high' is Hermes' default). The fix maps 'high' -> 'xhigh' and
'minimal' -> 'low'; every accepted value renders as before.

Both edits are anchored: a template without the anchors is refused (exit 2) instead of served half-fixed.

Usage:
  python3 -I chat_template_fix.py IN OUT          write the fixed copy of IN to OUT
  python3 -I chat_template_fix.py --serve MODEL [vllm serve args...]
      (container entrypoint used by launch.sh) fix MODEL/chat_template.jinja into /tmp and exec
      ``vllm serve MODEL --chat-template <fixed> args...``
"""

from __future__ import annotations

import os
import re
import sys

SYSTEM_OLD = """    {%- if message.role == "system" %}
        {%- if not loop.first %}
            {{- raise_exception('System message must be at the beginning.') }}
        {%- endif %}
"""
SYSTEM_NEW = """    {%- if message.role == "system" %}
        {#- k8v4: non-leading system messages render in place instead of raising, so the prompt prefix
            stays cacheable (K8V4_CHAT_TEMPLATE_FIX). #}
        {%- if not loop.first %}
            {{- '<|im_start|>system\\n' + content + '<|im_end|>\\n' }}
        {%- endif %}
"""
EFFORT_RE = re.compile(r"^( *)\{%- set resolved_reasoning_effort = reasoning_effort\|default\('(xhigh|medium|low)'\) %\}\n",
                       re.M)
EFFORT_ALIASES = (
    "{#- k8v4: OpenAI-style effort values clients send, instead of HTTP 400 (K8V4_CHAT_TEMPLATE_FIX) #}\n"
    "%(indent)s{%%- if resolved_reasoning_effort == 'high' %%}{%%- set resolved_reasoning_effort = 'xhigh' %%}\n"
    "%(indent)s{%%- elif resolved_reasoning_effort == 'minimal' %%}"
    "{%%- set resolved_reasoning_effort = 'low' %%}{%%- endif %%}\n"
)
SERVE_OUT = "/tmp/k8v4_chat_template.jinja"


class TemplateError(RuntimeError):
    pass


def fix_template(src: str) -> str:
    """Return the fixed template; raise TemplateError when an anchor is missing or repeated."""
    if src.count(SYSTEM_OLD) != 1:
        raise TemplateError("K8V4_CHAT_TEMPLATE_FIX: the non-leading system message anchor was found %d times "
                            "(expected once); refusing an unknown template" % src.count(SYSTEM_OLD))
    matches = list(EFFORT_RE.finditer(src))
    if len(matches) != 1:
        raise TemplateError("K8V4_CHAT_TEMPLATE_FIX: the reasoning_effort default anchor was found %d times "
                            "(expected once); refusing an unknown template" % len(matches))
    out = src.replace(SYSTEM_OLD, SYSTEM_NEW, 1)
    match = EFFORT_RE.search(out)
    indent = match.group(1)
    return out[:match.end()] + indent + EFFORT_ALIASES % {"indent": indent} + out[match.end():]


def _write(src_path: str, out_path: str) -> None:
    with open(src_path, encoding="utf-8") as handle:
        fixed = fix_template(handle.read())
    with open(out_path, "w", encoding="utf-8", newline="") as handle:
        handle.write(fixed)


def main(argv: list[str]) -> int:
    try:
        if argv[:1] == ["--serve"]:
            if len(argv) < 2:
                raise TemplateError("usage: chat_template_fix.py --serve MODEL [vllm serve args...]")
            model = argv[1]
            _write(os.path.join(model, "chat_template.jinja"), SERVE_OUT)
            sys.stderr.write("k8v4: chat template fixes (inline system messages, effort aliases) -> %s\n"
                             % SERVE_OUT)
            os.execvp("vllm", ["vllm", "serve", model, "--chat-template", SERVE_OUT] + argv[2:])
        if len(argv) != 2:
            raise TemplateError("usage: chat_template_fix.py IN OUT")
        _write(argv[0], argv[1])
        return 0
    except (OSError, TemplateError) as err:
        sys.stderr.write("%s\n" % err)
        return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
