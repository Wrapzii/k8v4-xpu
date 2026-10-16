"""CPU dry run of test_cascade_xpu.py with a fake op (checks plumbing only, no kernels)."""
import os, sys, importlib.util
os.environ["K8V4_TEST_DEVICE"] = "cpu"
spec = importlib.util.spec_from_file_location("t", os.path.join(os.path.dirname(__file__), "test_cascade_xpu.py"))
t = importlib.util.module_from_spec(spec); spec.loader.exec_module(t)
class Fake:
    def int8k_int4v_attn_batch(self, q, *a):
        out = a[14]; out.copy_(q * 0.5)
    def int8k_int4v_attn_batch_cascade(self, q, *a):
        out = a[14]; out.copy_(q * 0.5); a[19][:2] = 7
t.ops = lambda: Fake()
sys.argv = ["t"] + sys.argv[1:]
sys.exit(t.main())
