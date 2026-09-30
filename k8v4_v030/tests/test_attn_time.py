"""CPU checks for the opt-in attention timer.

The server calls attention_span around the decode kernel and the prefill
kernel. These tests drive that function: disabled is a pure return, capture
and compile skip device events, and a completed event is converted from
milliseconds to microseconds only after query() is true.
"""

from __future__ import annotations

import os
import tempfile
import time
import unittest

from k8v4_v030 import attn_time
from k8v4_v030.attn_time import add_us, attention_span, reset_for_test, snapshot


class _Event:
    def __init__(self, state):
        self.state = state

    def record(self):
        self.state.records += 1

    def query(self):
        self.state.queries += 1
        return self.state.queries >= self.state.ready_on

    def elapsed_time(self, _end):
        if self.state.queries < self.state.ready_on:
            raise AssertionError("elapsed_time before the event completed")
        self.state.elapsed_calls += 1
        return self.state.milliseconds


class _State:
    def __init__(self, ready_on, milliseconds):
        self.ready_on = ready_on
        self.milliseconds = milliseconds
        self.records = 0
        self.queries = 0
        self.elapsed_calls = 0
        self.built = 0


def _event_cls(state):
    def build(enable_timing=True):
        if not enable_timing:
            raise AssertionError("timing disabled")
        state.built += 1
        return _Event(state)

    return build


class AttnTimeTest(unittest.TestCase):
    def setUp(self):
        self._saved = {
            key: os.environ.get(key)
            for key in ("K8V4_ATTN_TIME", "K8V4_ATTN_TIME_FILE", "LOCAL_RANK", "RANK")
        }
        for key in self._saved:
            os.environ.pop(key, None)
        self._compiling = attn_time._compiling
        self._capturing = attn_time._capturing
        self._event_cls = attn_time._event_cls
        reset_for_test()

    def tearDown(self):
        attn_time._compiling = self._compiling
        attn_time._capturing = self._capturing
        attn_time._event_cls = self._event_cls
        reset_for_test()
        for key, value in self._saved.items():
            if value is None:
                os.environ.pop(key, None)
            else:
                os.environ[key] = value

    def test_disabled_returns_without_counting(self):
        attn_time._event_cls = lambda: (_ for _ in ()).throw(AssertionError("event"))
        seen = []

        def work():
            seen.append("ran")
            return 11

        self.assertEqual(attention_span("decode", work), 11)
        self.assertEqual(seen, ["ran"])
        self.assertEqual(snapshot()["decode_calls"], 0)
        self.assertEqual(snapshot()["decode_us"], 0.0)

    def test_host_fallback_records_elapsed_and_publish(self):
        os.environ["K8V4_ATTN_TIME"] = "1"
        os.environ["LOCAL_RANK"] = "0"
        attn_time._compiling = lambda: False
        attn_time._capturing = lambda: False
        attn_time._event_cls = lambda: None
        with tempfile.TemporaryDirectory() as directory:
            dest = os.path.join(directory, "attn")
            os.environ["K8V4_ATTN_TIME_FILE"] = dest

            def work():
                time.sleep(0.02)
                return "ok"

            self.assertEqual(attention_span("prefill", work), "ok")
            data = snapshot()
            self.assertEqual(data["prefill_calls"], 1)
            self.assertGreater(data["prefill_us"], 1000.0)
            with open(dest + ".r0", encoding="utf-8") as handle:
                text = handle.read()
        self.assertIn("prefill_calls 1", text)
        self.assertIn("prefill_us ", text)

    def test_event_waits_until_query_then_converts_milliseconds(self):
        os.environ["K8V4_ATTN_TIME"] = "1"
        os.environ["RANK"] = "1"
        state = _State(ready_on=3, milliseconds=2.5)
        attn_time._compiling = lambda: False
        attn_time._capturing = lambda: False
        attn_time._event_cls = lambda: _event_cls(state)
        with tempfile.TemporaryDirectory() as directory:
            dest = os.path.join(directory, "attn")
            os.environ["K8V4_ATTN_TIME_FILE"] = dest
            self.assertEqual(attention_span("decode", lambda: 4), 4)
            deadline = time.perf_counter() + 2.0
            while snapshot()["decode_calls"] == 0:
                if time.perf_counter() > deadline:
                    self.fail("drain did not record a completed event: %s" % snapshot())
                time.sleep(0.02)
            data = snapshot()
            with open(dest + ".r1", encoding="utf-8") as handle:
                text = handle.read()
        self.assertEqual(state.built, 2)
        self.assertGreaterEqual(state.queries, 3)
        self.assertEqual(state.elapsed_calls, 1)
        self.assertEqual(data["decode_calls"], 1)
        self.assertAlmostEqual(data["decode_us"], 2500.0)
        self.assertIn("decode_us 2500.000", text)
        self.assertIn("decode_calls 1", text)

    def test_compile_and_capture_skip_events(self):
        os.environ["K8V4_ATTN_TIME"] = "1"
        state = _State(ready_on=1, milliseconds=1.0)
        attn_time._event_cls = lambda: _event_cls(state)
        attn_time._capturing = lambda: False
        attn_time._compiling = lambda: True
        self.assertEqual(attention_span("prefill", lambda: "compile"), "compile")
        attn_time._compiling = lambda: False
        attn_time._capturing = lambda: True
        self.assertEqual(attention_span("decode", lambda: "capture"), "capture")
        time.sleep(0.2)
        self.assertEqual(state.built, 0)
        self.assertEqual(snapshot()["prefill_calls"], 0)
        self.assertEqual(snapshot()["decode_calls"], 0)

    def test_unknown_kind_raises(self):
        with self.assertRaises(RuntimeError):
            add_us("kv", 1.0)
