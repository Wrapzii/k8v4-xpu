"""CPU-only exercise of the patched manager's actual candidate/dispatch code."""
import ast
from collections import defaultdict
from dataclasses import dataclass, replace
from enum import Enum
from itertools import groupby, product
from pathlib import Path
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from k8v4_v030 import qsa_width


class Mode(Enum):
    NONE = 0
    FULL = 1
    PIECEWISE = 2


class GraphMode:
    def decode_mode(self): return Mode.FULL
    def mixed_mode(self): return None
    def separate_routine(self): return True


def load_manager():
    path = Path(__file__).resolve().parents[2] / 'vllm-patches/cudagraph_utils.py'
    tree = ast.parse(path.read_text())
    names = {'BatchExecutionDescriptor', '_qsa_width_buckets', '_qsa_width_matches',
             '_qsa_widths_for_roster', '_is_compatible'}
    nodes = [n for n in tree.body if getattr(n, 'name', None) in names]
    manager = next(n for n in tree.body if isinstance(n, ast.ClassDef) and n.name == 'CudaGraphManager')
    methods = {'_init_candidates', '_resolve_effective_loras', 'dispatch'}
    nodes.append(ast.ClassDef(name='CudaGraphManager', bases=[], keywords=[],
                             body=[n for n in manager.body if getattr(n, 'name', None) in methods],
                             decorator_list=[]))
    module = ast.fix_missing_locations(ast.Module(body=nodes, type_ignores=[]))
    scope = dict(dataclass=dataclass, replace=replace, CUDAGraphMode=Mode,
                 defaultdict=defaultdict, product=product, groupby=groupby,
                 round_up=lambda x, y: ((x + y - 1) // y) * y,
                 _publish_qsa_width=lambda: None)
    exec(compile(module, str(path), 'exec'), scope)
    return scope


class GraphDispatchTests(unittest.TestCase):
    def setUp(self):
        gate = patch.dict("os.environ", {"K8V4_QSA_ADEQUATE_WIDTH_GRAPH": "1"})
        gate.start()
        self.addCleanup(gate.stop)
        self.ns = load_manager()
        self.mgr = self.ns['CudaGraphManager']()
        m = self.mgr
        m.compilation_config = SimpleNamespace(cudagraph_capture_sizes=[7, 14, 21, 28], max_cudagraph_capture_size=28)
        m.vllm_config = SimpleNamespace(speculative_config=None)
        m.cudagraph_mode = GraphMode()
        m.max_num_reqs = 4
        m.decode_query_len = 7
        m.varlen_decode = False
        m.lora_capture_cases = [0]
        m.qsa_exact_verifier = True
        m._maybe_ubatch_twin = lambda desc: None
        m._lora_dispatch_map = {}
        m._candidates = {}
        m._capture_descs = {}
        m._init_candidates()
        m.graphs = {d: object() for d in m._capture_descs[Mode.FULL]}
        m._graphs_captured = True

    def select(self, tokens, reqs=1, query=7, ubatches=1):
        desired = 0 if tokens is None else qsa_width.bucket_for_blocks(qsa_width.blocks_needed(tokens))
        with patch.object(qsa_width, 'active_width_blocks', return_value=desired):
            return self.mgr.dispatch(reqs, reqs * 7, query, 0, max_query_len=7, num_ubatches=ubatches)

    def test_override_overflow_dispatches_generic(self):
        with patch.dict("os.environ", {"K8V4_QSA_WIDTH_BUCKETS": "4096,8192"}):
            self.setUp()
            self.ns["_publish_qsa_width"] = qsa_width.publish_active_width
            states = SimpleNamespace(req_id_to_index={"r": 0}, num_computed_tokens_np=[0])
            runner = qsa_width._RUNNER.set(SimpleNamespace(req_states=states))
            sched = qsa_width._SCHED.set(SimpleNamespace(num_scheduled_tokens={"r": 7}))
            dummy = qsa_width._DUMMY.set((False, 0))
            try:
                for tokens, exact, required in [(32768, True, 8192), (40000, False, 10000)]:
                    states.num_computed_tokens_np[0] = tokens - 7
                    result = self.mgr.dispatch(1, 7, 7, 0, max_query_len=7)
                    self.assertEqual(qsa_width.active_width_blocks(), required)
                    self.assertEqual(result.qsa_exact_verifier, exact, tokens)
                    self.assertIn(result, self.mgr.graphs)
                    if exact:
                        self.assertEqual(result.qsa_width_blocks, 8192)
                    else:
                        self.assertEqual(result.qsa_width_blocks, 0)
            finally:
                qsa_width._DUMMY.reset(dummy)
                qsa_width._RUNNER.reset(runner)
                qsa_width._SCHED.reset(sched)
                qsa_width._ACTIVE.set(0)

    def test_adequate_width_is_opt_in(self):
        key = "K8V4_QSA_ADEQUATE_WIDTH_GRAPH"
        for value in (None, "0", "true", "1"):
            with self.subTest(value=value), patch.dict("os.environ", {}, clear=False):
                import os
                if value is None:
                    os.environ.pop(key, None)
                else:
                    os.environ[key] = value
                d = self.select(8192)
                self.assertEqual(d.qsa_exact_verifier, value == "1")
                if value == "1":
                    self.assertEqual(d.qsa_width_blocks, 8192)

    def test_8k_uses_existing_smallest_adequate_graph(self):
        exact = [d.qsa_width_blocks for d in self.mgr._capture_descs[Mode.FULL] if d.qsa_exact_verifier and d.num_reqs == 1]
        self.assertEqual(set(exact), {8192, 40960})
        d = self.select(8192)
        self.assertTrue(d.qsa_exact_verifier)
        self.assertEqual(d.qsa_width_blocks, 8192)

    def test_boundaries_and_roster_specific_fallback(self):
        for tokens, width in [(16384, 8192), (16385, 8192), (32768, 8192),
                              (32769, 40960), (163840, 40960)]:
            with self.subTest(tokens=tokens):
                self.assertEqual(self.select(tokens).qsa_width_blocks, width)
        for tokens, reqs in [(163841, 1), (32769, 2), (32769, 4)]:
            with self.subTest(tokens=tokens, reqs=reqs):
                self.assertFalse(self.select(tokens, reqs).qsa_exact_verifier)
        for reqs in (2, 3, 4):
            self.assertEqual(self.select(8192, reqs).qsa_width_blocks, 8192)

    def test_unknown_and_uncaptured_fall_back(self):
        self.assertFalse(self.select(None).qsa_exact_verifier)
        m = self.mgr
        narrow = next(d for d in m.graphs if d.qsa_exact_verifier and d.num_reqs == 1 and d.qsa_width_blocks == 8192)
        wide = next(d for d in m.graphs if d.qsa_exact_verifier and d.num_reqs == 1 and d.qsa_width_blocks == 40960)
        del m.graphs[narrow]
        self.assertEqual(self.select(8192), wide)
        del m.graphs[wide]
        self.assertFalse(self.select(8192).qsa_exact_verifier)

    def test_exact_roster_query_padding_ubatch_and_bound_guards(self):
        d = next(d for d in self.mgr.graphs if d.qsa_exact_verifier and d.num_reqs == 2)
        check = self.ns['_is_compatible']
        with patch.object(qsa_width, 'active_width_blocks', return_value=4096):
            self.assertTrue(check(d, 2, 14, 7, 0, 7, 1))
            for args in [(1, 14, 7, 0, 7, 1), (2, 13, 7, 0, 7, 1),
                         (2, 14, 6, 0, 7, 1), (2, 14, 7, 0, 7, 2),
                         (2, 14, 7, 1, 7, 1)]:
                self.assertFalse(check(d, *args))
            bounded = replace(d, max_query_len=7)
            self.assertFalse(check(bounded, 2, 14, 7, 0, 8, 1))
            self.assertFalse(check(bounded, 2, 14, 7, 0, None, 1))


if __name__ == '__main__':
    unittest.main()
