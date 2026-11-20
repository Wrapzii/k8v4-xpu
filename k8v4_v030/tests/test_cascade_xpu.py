"""XE2_KV_CASCADE (shared-prefix cascade for the one-row drafter batch) against the plain batched path.

XPU only (skips without a device or the library). Requests share their leading block-table
entries (stored once); the cascade output must match the batched path at fp16 level, be
bit-identical when nothing is shared, and replay identically from an XPU graph.
"""

from __future__ import annotations

import os
import unittest

try:
    import torch
except ImportError:  # pragma: no cover - CPU-only environments without torch
    torch = None

HAVE_XPU = bool(torch is not None and hasattr(torch, "xpu") and torch.xpu.is_available()
                and os.environ.get("XE2_KV_LIB"))

BASE_ENV = {"XE2_KV_S1_SPLITS": "32", "XE2_KV_S1_FAST": "1", "XE2_KV_BATCH_REQS": "1",
            "XE2_KV_S2_NSG": "32", "XE2_KV_S2_TWO_PASS": "0"}


@unittest.skipUnless(HAVE_XPU, "needs an XPU device and XE2_KV_LIB")
class CascadeXpuTest(unittest.TestCase):
    def setUp(self):
        self.saved = {k: os.environ.get(k) for k in list(BASE_ENV) + ["XE2_KV_CASCADE"]}
        os.environ.update(BASE_ENV)

    def tearDown(self):
        for k, v in self.saved.items():
            if v is None:
                os.environ.pop(k, None)
            else:
                os.environ[k] = v

    def _case(self, length, batch, shared, ppb=33, capacity=32768):
        from k8v4_v030.cache_views import bind_regions
        from k8v4_v030.layout import D, PAGE, PageLayout
        from k8v4_v030.ops_api import ops
        from k8v4_v030.plan import workspace_programs
        from k8v4_v030.scratch import Scratch

        device = torch.device("xpu", 0)
        layout = PageLayout(4)
        bs = PAGE * ppb
        blocks = (max(length, capacity) + bs - 1) // bs
        pages = blocks * ppb
        raw = torch.zeros(batch * pages * layout.page_bytes, dtype=torch.int8, device=device)
        views = bind_regions(raw, layout)
        gen = torch.Generator(device="cpu").manual_seed(length + batch)
        perm = torch.randperm(batch * blocks, generator=gen).to(torch.int64).reshape(batch, blocks)
        lens = [length - 37 * r for r in range(batch)]
        shared_blocks = int(shared * min(lens)) // bs
        perm[:, :shared_blocks] = perm[0, :shared_blocks]
        for r in range(batch):
            for start in range(shared_blocks * bs if r else 0, lens[r], 2048):
                count = min(2048, lens[r] - start)
                k = torch.randn(count, layout.hkv, D, generator=gen, dtype=torch.float16).to(device)
                v = torch.randn(count, layout.hkv, D, generator=gen, dtype=torch.float16).to(device)
                pos = torch.arange(start, start + count, dtype=torch.int64)
                slots = (perm[r][pos // bs] * bs + pos % bs).to(device)
                ops().kv_store_paged(k, v, slots, views["k"], views["k_scale"], views["v"],
                                     views["v_scale"], views["v_zero"])
        table = perm.to(torch.int32).to(device).contiguous()
        seq = torch.tensor(lens, dtype=torch.int32, device=device)
        nprog = workspace_programs(blocks, ppb, layout)
        scratch = Scratch(device, layout, nprog, 1, batch)
        query, out = scratch.attention_pair(batch)
        query.copy_(torch.randn(batch, layout.hq, D, generator=gen, dtype=torch.float16).to(device))
        ws = scratch.workspace(nprog)

        def run():
            ops().int8k_int4v_attn_batch(query, scratch.q8, scratch.q_scale, views["k"], views["k_scale"],
                                         views["v"], views["v_scale"], views["v_zero"], table, seq,
                                         scratch.visible, *ws, out, 1, ppb)

        def eager(cascade):
            os.environ["XE2_KV_CASCADE"] = cascade
            for t in ws[:3]:
                t.fill_(float("nan"))
            run()
            torch.xpu.synchronize()
            return out.clone().float()

        plain = eager("0")
        casc = eager("1")
        graph = torch.xpu.XPUGraph()
        with torch.xpu.graph(graph):
            run()
        out.zero_()
        graph.replay()
        torch.xpu.synchronize()
        replay = out.clone().float()
        return plain, casc, replay

    def test_shared_prefix_matches_the_batched_path(self):
        for length, batch, shared in ((16000, 4, 0.95), (16000, 4, 0.5), (9000, 2, 0.9), (16000, 8, 0.95)):
            with self.subTest(length=length, batch=batch, shared=shared):
                plain, casc, replay = self._case(length, batch, shared)
                self.assertTrue(bool(torch.isfinite(casc).all()))
                self.assertLessEqual((casc - plain).abs().max().item(), 2e-3)
                self.assertTrue(torch.equal(replay, casc))

    def test_nothing_shared_is_bit_identical(self):
        plain, casc, replay = self._case(16000, 4, 0.0)
        self.assertTrue(torch.equal(casc, plain))
        self.assertTrue(torch.equal(replay, casc))


if __name__ == "__main__":
    unittest.main()
