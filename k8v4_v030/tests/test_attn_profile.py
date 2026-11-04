"""CPU-only tests for the sampled attention profiler (no GPU, no vLLM)."""
import ast, json, os, pathlib, random, sys, tempfile, threading, time, unittest

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[2]))
from k8v4_v030 import attn_profile as ap  # noqa: E402


class FakeEvent:
    """Completes `lag` queries after record; any blocking call fails the test."""
    clock = [0.0]
    lag = 2
    def __init__(self, enable_timing=False):
        assert enable_timing
        self.t = None; self.queries = 0; self.lag = FakeEvent.lag
    def record(self):
        FakeEvent.clock[0] += 0.25; self.t = FakeEvent.clock[0]
    def query(self):
        self.queries += 1
        return self.queries > self.lag
    def elapsed_time(self, other):
        assert other.queries > other.lag, "elapsed_time before completion would block"
        return other.t - self.t  # ms
    def synchronize(self):
        raise AssertionError("host sync in profiler")
    def wait(self, *a):
        raise AssertionError("stream wait in profiler")


class CpuLens:
    def __init__(self, v): self.v = v; self.device = "cpu"
    def reshape(self, *_): return self
    def __getitem__(self, s): return CpuLens(self.v[s])
    def tolist(self): return list(self.v)
    def numel(self): return len(self.v)


class Meta:
    def __init__(self, lens): self.seq_lens_cpu = CpuLens(lens) if lens is not None else None


def prof(tmp, rate=1.0):
    return ap._Profiler(event_cls=FakeEvent, out_dir=tmp, rate=rate, flush_s=999,
                        start_thread=False, rng=random.Random(0))


class T(unittest.TestCase):
    def test_bucket(self):
        self.assertEqual(ap.ctx_bucket(1), 64)
        self.assertEqual(ap.ctx_bucket(65), 128)
        self.assertEqual(ap.ctx_bucket(200_000), 262144)
        self.assertEqual(ap.ctx_bucket(10**7), 262144)

    def test_lazy_resolve_and_write(self):
        with tempfile.TemporaryDirectory() as d:
            p = prof(d)
            tok = p.begin(Meta([1000, 200_000, 5]), 1, 2, 7, True)
            p.end(tok)
            self.assertEqual(p.poll(), 0)  # not complete yet: must not block or drop
            self.assertEqual(p.poll(), 0)
            self.assertEqual(p.poll(), 1)
            p.flush()
            lines = [json.loads(l) for l in open(p._path)]
            r = [l for l in lines if l["type"] == "attn"][0]
            self.assertEqual((r["batch"], r["ctx_max"], r["ctx_sum"], r["ctx_bucket"], r["q_len"]),
                             (2, 200_000, 200_005, 262144, 7))
            self.assertEqual(r["n_reqs_step"], 3)
            self.assertAlmostEqual(r["gpu_us"], 250.0)
            self.assertEqual(r["op"], "attn_batch_cascade")
            self.assertEqual(r["kv_bytes"], 200_005 * 396 * 2)

    def test_sample_rate(self):
        with tempfile.TemporaryDirectory() as d:
            p = prof(d, rate=0.01)
            n = sum(p.begin(Meta([10]), 0, 1, 1, False) is not None for _ in range(20000))
            self.assertTrue(120 < n < 280, n)

    def test_skips_without_host_lens(self):
        with tempfile.TemporaryDirectory() as d:
            p = prof(d)
            self.assertIsNone(p.begin(Meta(None), 0, 1, 1, False))
            self.assertEqual(p.counters["skip_no_cpu_lens"], 1)

    def test_backlog_cap(self):
        with tempfile.TemporaryDirectory() as d:
            p = prof(d); p.max_pending = 3
            for _ in range(5):
                t = p.begin(Meta([10]), 0, 1, 1, False)
                t and p.end(t)
            self.assertEqual(p.counters["drop_backlog"], 2)

    def test_thread_drains(self):
        with tempfile.TemporaryDirectory() as d:
            FakeEvent.lag = 0
            self.addCleanup(setattr, FakeEvent, 'lag', 2)
            p = ap._Profiler(event_cls=FakeEvent, out_dir=d, rate=1.0, flush_s=0.1)
            for _ in range(10):
                p.end(p.begin(Meta([4096] * 4), 0, 4, 7, False))
            time.sleep(1.0); p.stop()
            rows = [json.loads(l) for l in open(p._path) if '"attn"' in l]
            self.assertEqual(len(rows), 10)

    def test_disabled_by_default_and_backend_gate(self):
        self.assertNotEqual(os.environ.get("VLLM_K8V4_PROFILE"), "1")
        self.assertFalse(ap.ENABLED)
        src = (pathlib.Path(ap.__file__).parent / "backend.py").read_text()
        self.assertIn("_ATTN_PROFILE = _attn_profile.ENABLED", src)
        tree = ast.parse(src)
        gates = [n for n in ast.walk(tree) if isinstance(n, ast.If)
                 and isinstance(n.test, ast.Name) and n.test.id == "_ATTN_PROFILE"]
        self.assertEqual(len(gates), 1, "exactly one instrumentation point")
        self.assertEqual(src.count("_attn_profile.get()"), 2)

    def test_analysis_runs(self):
        tools = pathlib.Path(ap.__file__).resolve().parents[1] / "tools"
        sys.path.insert(0, str(tools))
        import analyze_attn_profile as an
        with tempfile.TemporaryDirectory() as d:
            p = prof(d)
            rnd = random.Random(1)
            for _ in range(400):
                b = rnd.choice([1, 2, 3, 4]); c = rnd.choice([2048, 32768, 131072, 200000])
                t = p.begin(Meta([c] * b), 0, b, 7, False)
                us = 20 + b * (c / 1000) * 3.0  # synthetic: linear in ctx, serial in batch
                p._done.append(ap._record([c] * b, 7, b, False, time.time(), us, "0"))
            p.flush()
            self.assertEqual(an.main([d, "--telemetry", "/nonexistent", "--json", d + "/r.json"]), 0)
            v = json.load(open(d + "/r.json"))["verdict"]
            self.assertGreater(v["us_per_1k_ctx_at_fixed_batch"], 2.0)


if __name__ == "__main__":
    unittest.main(verbosity=2)
