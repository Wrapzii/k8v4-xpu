"""XPU regression for the packed K8/V4 op, including the ~59.5K MTP case.

Skipped unless this process has an Intel GPU and XE2_KV_LIB points at a
built libxe2_kv.so. CPU layout tests cover the same lengths without the device.
"""

from __future__ import annotations

import json
import os
import unittest
from pathlib import Path

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.dequant import eager_gqa_attention, gather_dequant
from k8v4_v030.layout import D, HKV, HQ, PAGE, PAGE_BYTES, as_int16, visible_lens
from k8v4_v030.ops_api import library_path, ops
from k8v4_v030.plan import workspace_programs
from k8v4_v030.scratch import Scratch


def _xpu_ready() -> bool:
    xpu = getattr(torch, "xpu", None)
    if xpu is None or not xpu.is_available():
        return False
    return os.path.isfile(library_path())


def _max_abs(a: torch.Tensor, b: torch.Tensor) -> float:
    return float((a - b).abs().max().item())


def _finite(t: torch.Tensor) -> bool:
    return bool(torch.isfinite(t).all().item())


class KernelXpuTest(unittest.TestCase):
    def setUp(self):
        if not _xpu_ready():
            self.skipTest("XPU K8/V4 library is not available")
        self.device = torch.device("xpu", torch.xpu.current_device())
        self.records: list[dict] = []

    def tearDown(self):
        out_dir = os.environ.get("K8V4_CORRECTNESS_DIR")
        records = getattr(self, "records", None)
        if not out_dir or not records:
            return
        path = Path(out_dir)
        path.mkdir(parents=True, exist_ok=True)
        dest = path / "kernel-xpu.json"
        previous = []
        if dest.is_file():
            previous = json.loads(dest.read_text(encoding="utf-8"))
        previous.extend(self.records)
        dest.write_text(json.dumps(previous, indent=2), encoding="utf-8")

    def _cache(self, num_pages: int) -> dict[str, torch.Tensor]:
        raw = torch.zeros(num_pages * PAGE_BYTES, dtype=torch.int8, device=self.device)
        return bind_regions(raw)

    def _store(self, views, key: torch.Tensor, value: torch.Tensor, slots: torch.Tensor) -> None:
        ops().kv_store_paged(
            key,
            value,
            slots,
            views["k"],
            views["k_scale"],
            views["v"],
            views["v_scale"],
            views["v_zero"],
        )

    def _attend(
        self,
        views,
        query: torch.Tensor,
        block_table: torch.Tensor,
        seq_lens: torch.Tensor,
        q_len: int,
        pages_per_block: int,
        visible: torch.Tensor | None = None,
    ) -> torch.Tensor:
        nprog = workspace_programs(int(block_table.shape[1]), pages_per_block)
        scratch = Scratch(
            self.device,
            nprog_max=nprog,
            max_store_tokens=1,
            max_out_tokens=int(query.shape[0]),
        )
        q_buf, out_buf = scratch.attention_pair(int(query.shape[0]))
        q_buf.copy_(query)
        out_buf.zero_()
        vis = scratch.visible if visible is None else visible
        partials, m_state, l_state, merged = scratch.workspace(nprog)
        ops().int8k_int4v_attn_batch(
            q_buf,
            scratch.q8,
            scratch.q_scale,
            views["k"],
            views["k_scale"],
            views["v"],
            views["v_scale"],
            views["v_zero"],
            block_table,
            seq_lens,
            vis,
            partials,
            m_state,
            l_state,
            merged,
            out_buf,
            q_len,
            pages_per_block,
        )
        torch.xpu.synchronize()
        return out_buf.detach().clone()

    def _note(self, name: str, **values) -> None:
        self.records.append({"name": name, **values})

    def test_partial_pages_negative_slots_and_dirty_tail(self):
        device = self.device
        views = self._cache(4)
        gen = torch.Generator(device="cpu")
        gen.manual_seed(7)
        key = torch.randn(130, HKV, D, generator=gen, dtype=torch.float16, device="cpu").to(device)
        value = torch.randn(130, HKV, D, generator=gen, dtype=torch.float16, device="cpu").to(device)
        slots = torch.arange(130, dtype=torch.int64, device=device)
        slots[1] = -1
        self._store(views, key, value, slots)
        self.assertEqual(int(views["k"][0, 1].abs().sum().item()), 0)
        self.assertGreater(int(views["k"][0, 0].abs().sum().item()), 0)

        def run(seq_len: int) -> torch.Tensor:
            pages = (seq_len + PAGE - 1) // PAGE
            table = torch.arange(pages, dtype=torch.int32, device=device).view(1, pages)
            query = key[seq_len - 1 : seq_len].to(torch.float16)
            query = query.repeat_interleave(HQ // HKV, dim=1)
            seq = torch.tensor([seq_len], dtype=torch.int32, device=device)
            return self._attend(views, query, table, seq, 1, 1)

        for seq_len in (63, 64, 65, 127, 129):
            out = run(seq_len)
            self.assertTrue(_finite(out), seq_len)
            self.assertGreater(float(out.abs().max().item()), 0.0, seq_len)
            self._note("partial", seq_len=seq_len, max_abs=float(out.abs().max().item()))

        before = run(108)
        seen = run(109)
        huge = torch.full((1, HKV, D), 50.0, dtype=torch.float16, device=device)
        self._store(views, huge, huge, torch.tensor([108], dtype=torch.int64, device=device))
        masked = run(108)
        included = run(109)
        self.assertLess(_max_abs(masked, before), 1e-4)
        self.assertGreater(_max_abs(included, seen), 1e-3)
        self._note("dirty_tail", masked_vs_clean=_max_abs(masked, before))

    def test_mtp7_59500_matches_serial_and_not_int16(self):
        self._long_case(59500, sdpa=True)
        self._long_case(59527, sdpa=False)
        self._long_case(70000, sdpa=False)

    def _long_case(self, seq_len: int, sdpa: bool) -> None:
        device = self.device
        q_len = 7
        n_pages = (seq_len + PAGE - 1) // PAGE
        views = self._cache(n_pages)
        gen = torch.Generator(device="cpu")
        gen.manual_seed(seq_len)
        key = torch.empty(seq_len, HKV, D, dtype=torch.float16, device="cpu")
        value = torch.empty(seq_len, HKV, D, dtype=torch.float16, device="cpu")
        # Chunked fill keeps the CPU allocation from becoming one giant randn call.
        chunk = 4096
        for start in range(0, seq_len, chunk):
            stop = min(seq_len, start + chunk)
            key[start:stop] = torch.randn(stop - start, HKV, D, generator=gen, dtype=torch.float16)
            value[start:stop] = torch.randn(stop - start, HKV, D, generator=gen, dtype=torch.float16)
        key = key.to(device)
        value = value.to(device)
        slots = torch.arange(seq_len, dtype=torch.int64, device=device)
        self._store(views, key, value, slots)
        query = torch.randn(q_len, HQ, D, generator=gen, dtype=torch.float16).to(device)
        identity = torch.arange(n_pages, dtype=torch.int32, device=device).view(1, n_pages)
        seq = torch.tensor([seq_len], dtype=torch.int32, device=device)
        parallel = self._attend(views, query, identity, seq, q_len, 1)
        self.assertTrue(_finite(parallel))
        self.assertGreater(float(parallel.abs().max().item()), 0.0)

        serial = []
        for j in range(q_len):
            one = torch.tensor([seq_len - (q_len - 1 - j)], dtype=torch.int32, device=device)
            serial.append(self._attend(views, query[j : j + 1], identity, one, 1, 1))
        serial_out = torch.cat(serial, dim=0)
        parallel_vs_serial = _max_abs(parallel, serial_out)
        self.assertTrue(_finite(serial_out))
        self.assertLess(parallel_vs_serial, 1e-3)
        self.assertFalse(bool((parallel == 0).all().item()) and bool((serial_out == 0).all().item()))

        vis = torch.tensor(visible_lens(seq_len, q_len), dtype=torch.int32, device=device).view(1, -1)
        explicit = self._attend(views, query, identity, seq, q_len, 1, visible=vis)
        builtin_vs_explicit = _max_abs(parallel, explicit)
        self.assertLess(builtin_vs_explicit, 1e-3)

        wrapped = torch.tensor([as_int16(seq_len)], dtype=torch.int32, device=device)
        truncated = self._attend(views, query, identity, wrapped, q_len, 1)
        int16_gap = _max_abs(parallel, truncated)
        self.assertGreater(int16_gap, 1e-2)

        ratio = 26
        n_blocks = (n_pages + ratio - 1) // ratio
        blocks = torch.arange(n_blocks, dtype=torch.int32, device=device).view(1, n_blocks)
        expanded = self._attend(views, query, blocks, seq, q_len, ratio)
        ratio_gap = _max_abs(parallel, expanded)
        self.assertLess(ratio_gap, 1e-3)

        wide = torch.cat([identity, torch.zeros(1, 4, dtype=torch.int32, device=device)], dim=1)
        padded = self._attend(views, query, wide, seq, q_len, 1)
        pad_gap = _max_abs(parallel, padded)
        self.assertLess(pad_gap, 1e-3)

        dequant_gap = None
        fp_gap = None
        if sdpa:
            k_dq, v_dq = gather_dequant(views, identity.view(-1), seq_len, 1, torch.float16)
            sdpa = eager_gqa_attention(query, k_dq, v_dq, 1.0 / (D ** 0.5))
            dequant_gap = _max_abs(parallel.float(), sdpa.float())
            fp = eager_gqa_attention(query, key, value, 1.0 / (D ** 0.5))
            fp_gap = _max_abs(parallel.float(), fp.float())
            self.assertLess(dequant_gap, 0.08)
            self.assertLess(fp_gap, 0.08)

        lengths = [seq_len, 128, 512, 4096, 20000, 40000, seq_len // 2, seq_len // 3]
        batch_q = query.repeat(8, 1, 1)
        batch_seq = torch.tensor(lengths, dtype=torch.int32, device=device)
        batch_table = identity.expand(8, n_pages).contiguous()
        batched = self._attend(views, batch_q, batch_table, batch_seq, q_len, 1)
        batch_gap = _max_abs(batched[:q_len], parallel)
        self.assertLess(batch_gap, 1e-3)
        self.assertGreater(_max_abs(batched[:q_len], batched[q_len : 2 * q_len]), 1e-4)
        self._note(
            "mtp",
            seq_len=seq_len,
            parallel_vs_serial=parallel_vs_serial,
            builtin_vs_explicit=builtin_vs_explicit,
            int16_gap=int16_gap,
            ratio_gap=ratio_gap,
            pad_gap=pad_gap,
            batch_gap=batch_gap,
            dequant_sdpa=dequant_gap,
            fp_sdpa=fp_gap,
            as_int16=as_int16(seq_len),
        )


if __name__ == "__main__":
    unittest.main()
