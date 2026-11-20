"""K8V4_CHAT_TEMPLATE_FIX: anchored template edits (CPU only; rendering checks need jinja2)."""
from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from k8v4_v030 import chat_template_fix as fix

ROOT = Path(__file__).resolve().parents[2]
TEMPLATE = (ROOT / 'templates/chat_template.jinja').read_text(encoding='utf-8')
# Swift 1.5's chat_template_low.jinja is the repository template with a low default effort.
LOW = TEMPLATE.replace("reasoning_effort|default('xhigh')", "reasoning_effort|default('low')")

try:
    import jinja2
except ImportError:  # pragma: no cover - the serving image has it
    jinja2 = None


def render(src, messages, **kwargs):
    env = jinja2.Environment(trim_blocks=True, lstrip_blocks=True)
    env.globals['raise_exception'] = lambda msg: (_ for _ in ()).throw(ValueError(msg))
    return env.from_string(src).render(messages=messages, add_generation_prompt=True, **kwargs)


class ChatTemplateFixTest(unittest.TestCase):
    def test_both_templates_take_both_edits_once(self):
        for src in (TEMPLATE, LOW):
            out = fix.fix_template(src)
            self.assertNotIn('System message must be at the beginning', out)
            self.assertEqual(out.count("resolved_reasoning_effort == 'high'"), 1)
            self.assertEqual(out.count("resolved_reasoning_effort == 'minimal'"), 1)

    def test_unknown_templates_are_refused(self):
        with self.assertRaises(fix.TemplateError):
            fix.fix_template('{{ messages }}')
        with self.assertRaises(fix.TemplateError):
            fix.fix_template(TEMPLATE.replace(fix.SYSTEM_OLD, ''))
        with self.assertRaises(fix.TemplateError):
            fix.fix_template(fix.fix_template(TEMPLATE))

    def test_cli_writes_the_fixed_copy_and_refuses_bad_input(self):
        with tempfile.TemporaryDirectory() as temp:
            src, out = Path(temp) / 'in.jinja', Path(temp) / 'out.jinja'
            src.write_text(LOW, encoding='utf-8')
            self.assertEqual(fix.main([str(src), str(out)]), 0)
            self.assertEqual(out.read_text(encoding='utf-8'), fix.fix_template(LOW))
            src.write_text('{{ messages }}', encoding='utf-8')
            self.assertEqual(fix.main([str(src), str(out)]), 2)
            self.assertEqual(fix.main([]), 2)

    @unittest.skipUnless(jinja2, 'jinja2 renders the templates')
    def test_rendering(self):
        plain = [{'role': 'system', 'content': 'Be terse.'}, {'role': 'user', 'content': 'Hi.'}]
        for src in (TEMPLATE, LOW):
            out = fix.fix_template(src)
            for kwargs in ({}, {'reasoning_effort': 'low'}, {'reasoning_effort': 'medium'},
                           {'reasoning_effort': 'xhigh'}, {'enable_thinking': False}):
                self.assertEqual(render(out, plain, **kwargs), render(src, plain, **kwargs))
            self.assertEqual(render(out, plain, reasoning_effort='high'),
                             render(src, plain, reasoning_effort='xhigh'))
            self.assertEqual(render(out, plain, reasoning_effort='minimal'),
                             render(src, plain, reasoning_effort='low'))
            with self.assertRaises(ValueError):
                render(src, plain, reasoning_effort='high')
            inline = plain + [{'role': 'assistant', 'content': 'Hello.'},
                              {'role': 'system', 'content': 'Reminder.'}, {'role': 'user', 'content': 'Again.'}]
            with self.assertRaises(ValueError):
                render(src, inline)
            text = render(out, inline)
            self.assertTrue(text.startswith(render(src, plain).split('<|im_start|>assistant')[0]))
            self.assertIn('<|im_end|>\n<|im_start|>system\nReminder.<|im_end|>\n<|im_start|>user\nAgain.', text)


if __name__ == '__main__':
    unittest.main()
