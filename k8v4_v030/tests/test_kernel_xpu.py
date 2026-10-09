"""XPU regression for the packed K8/V4 op, including the ~59.5K MTP case.

Skipped unless this process has an Intel GPU and XE2_KV_LIB points at a
built libxe2_kv.so. CPU layout tests cover the same lengths without the
device. Every case runs for both layouts the one library serves: 2 KV
heads (a TP2 rank) and 4 (a single GPU holding the whole model).
"""

from __future__ import annotations

import hashlib
import json
import os
import struct
import unittest
from pathlib import Path

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.dequant import eager_gqa_attention, gather_dequant
from k8v4_v030.layout import (
    D,
    PAGE,
    PageLayout,
    as_int16,
    block_byte_span,
    element_byte,
    pages_per_block,
    region_view_specs,
    visible_lens,
)
from k8v4_v030.ops_api import library_path, ops
from k8v4_v030.plan import workspace_programs
from k8v4_v030.scratch import Scratch

TP2 = PageLayout(2)
TP1 = PageLayout(4)
LAYOUTS = (TP2, TP1)


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
        count = int(torch.xpu.device_count())
        if os.environ.get("K8V4_REQUIRE_TP2") == "1" and count < 2:
            self.fail("TP2 corpus requires 2 XPU devices, found %d" % count)
        self.device = torch.device("xpu", torch.xpu.current_device())
        self.records: list[dict] = []
        self.layout = TP2

    def _device_indices(self) -> list[int]:
        count = int(torch.xpu.device_count())
        if os.environ.get("K8V4_REQUIRE_TP2") == "1":
            return list(range(count))
        return [int(torch.xpu.current_device())]

    def _use_device(self, index: int) -> None:
        torch.xpu.set_device(index)
        self.device = torch.device("xpu", index)

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
        raw = torch.zeros(num_pages * self.layout.page_bytes, dtype=torch.int8, device=self.device)
        return bind_regions(raw, self.layout)

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
        nprog = workspace_programs(int(block_table.shape[1]), pages_per_block, self.layout)
        scratch = Scratch(
            self.device,
            self.layout,
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
        row = {"name": name, **values}
        self.records.append(row)
        print("CORPUS %s" % json.dumps(row), flush=True)

    def test_serving_library_and_device_count(self):
        path = library_path()
        digest = hashlib.sha256(Path(path).read_bytes()).hexdigest()
        count = int(torch.xpu.device_count())
        self._note(
            "environment",
            sha256=digest,
            device_count=count,
            affinity=os.environ.get("ZE_AFFINITY_MASK"),
            image=os.environ.get("K8V4_IMAGE_NAME"),
            require_tp2=os.environ.get("K8V4_REQUIRE_TP2") == "1",
        )
        expect = os.environ.get("K8V4_EXPECT_SO")
        if expect:
            self.assertEqual(digest, expect)
        if os.environ.get("K8V4_REQUIRE_TP2") == "1":
            self.assertGreaterEqual(count, 2)
            self.assertNotEqual(os.environ.get("ZE_AFFINITY_MASK"), "0")

    def test_partial_pages_negative_slots_and_dirty_tail(self):
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                self.layout = layout
                for index in self._device_indices():
                    self._use_device(index)
                    self._partial_pages(index)

    def _partial_pages(self, device_index: int):
        device = self.device
        hkv, hq = self.layout.hkv, self.layout.hq
        views = self._cache(4)
        gen = torch.Generator(device="cpu")
        gen.manual_seed(7)
        key = torch.randn(130, hkv, D, generator=gen, dtype=torch.float16, device="cpu").to(device)
        value = torch.randn(130, hkv, D, generator=gen, dtype=torch.float16, device="cpu").to(device)
        slots = torch.arange(130, dtype=torch.int64, device=device)
        slots[1] = -1
        self._store(views, key, value, slots)
        self.assertEqual(int(views["k"][0, 1].abs().sum().item()), 0)
        self.assertGreater(int(views["k"][0, 0].abs().sum().item()), 0)

        def run(seq_len: int) -> torch.Tensor:
            pages = (seq_len + PAGE - 1) // PAGE
            table = torch.arange(pages, dtype=torch.int32, device=device).view(1, pages)
            query = key[seq_len - 1 : seq_len].to(torch.float16)
            query = query.repeat_interleave(hq // hkv, dim=1)
            seq = torch.tensor([seq_len], dtype=torch.int32, device=device)
            return self._attend(views, query, table, seq, 1, 1)

        for seq_len in (63, 64, 65, 127, 129):
            out = run(seq_len)
            self.assertTrue(_finite(out), seq_len)
            self.assertGreater(float(out.abs().max().item()), 0.0, seq_len)
            self._note(
                "partial",
                device=device_index,
                hkv=hkv,
                seq_len=seq_len,
                max_abs=float(out.abs().max().item()),
                passed=True,
            )

        before = run(108)
        seen = run(109)
        huge = torch.full((1, hkv, D), 50.0, dtype=torch.float16, device=device)
        self._store(views, huge, huge, torch.tensor([108], dtype=torch.int64, device=device))
        masked = run(108)
        included = run(109)
        self.assertLess(_max_abs(masked, before), 1e-4)
        self.assertGreater(_max_abs(included, seen), 1e-3)
        masked_gap = _max_abs(masked, before)
        self._note(
            "dirty_tail",
            device=device_index,
            hkv=hkv,
            masked_vs_clean=masked_gap,
            passed=masked_gap < 1e-4,
        )

    def test_prefix_cow_matches_source_and_mutation_diverges(self):
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                self.layout = layout
                for index in self._device_indices():
                    self._use_device(index)
                    self._prefix_cow(index)

    def _prefix_cow(self, device_index: int) -> None:
        """Copy one manager block on device and attend from the copy."""
        device = self.device
        hkv, hq = self.layout.hkv, self.layout.hq
        block_size = 2112
        ratio = pages_per_block(block_size)
        raw = torch.zeros(2 * ratio * self.layout.page_bytes, dtype=torch.int8, device=device)
        views = bind_regions(raw, self.layout)
        ntok = 60
        gen = torch.Generator(device="cpu")
        gen.manual_seed(2112 + device_index)
        key = torch.randn(ntok, hkv, D, generator=gen, dtype=torch.float16).to(device)
        value = torch.randn(ntok, hkv, D, generator=gen, dtype=torch.float16).to(device)
        slots = torch.arange(ratio * PAGE, ratio * PAGE + ntok, dtype=torch.int64, device=device)
        self._store(views, key, value, slots)
        query = key[-1:].repeat_interleave(hq // hkv, dim=1)
        seq = torch.tensor([ntok], dtype=torch.int32, device=device)
        table_src = torch.tensor([[1]], dtype=torch.int32, device=device)
        table_dst = torch.tensor([[0]], dtype=torch.int32, device=device)
        src_out = self._attend(views, query, table_src, seq, 1, ratio)
        before = self._attend(views, query, table_dst, seq, 1, ratio)
        self.assertGreater(_max_abs(src_out, before), 1e-3)
        src, nbytes = block_byte_span(1, block_size, self.layout)
        dst, _ = block_byte_span(0, block_size, self.layout)
        raw[dst : dst + nbytes].copy_(raw[src : src + nbytes])
        torch.xpu.synchronize()
        copied = self._attend(views, query, table_dst, seq, 1, ratio)
        copied_gap = _max_abs(src_out, copied)
        self.assertLess(copied_gap, 1e-4)
        # Query matches the last key, so softmax sits on that token. Changing
        # token 0's first K byte rounds away. Doubling the last token's V
        # scale changes the value the kernel actually returns.
        last = ntok - 1
        specs = region_view_specs(1, self.layout)
        blob = raw.view(torch.uint8)
        scale_before: list[float] = []
        scale_after: list[float] = []
        for head in range(hkv):
            byte = element_byte(specs["v_scale"], (0, last, head))
            word = bytes(int(blob[byte + i].item()) for i in range(4))
            (value,) = struct.unpack("<f", word)
            new_value = value * 2.0 if value != 0.0 else 0.25
            packed = struct.pack("<f", new_value)
            self.assertNotEqual(packed, word)
            for i, piece in enumerate(packed):
                blob[byte + i] = piece
            check = bytes(int(blob[byte + i].item()) for i in range(4))
            self.assertEqual(check, packed)
            scale_before.append(value)
            scale_after.append(new_value)
        torch.xpu.synchronize()
        mutated = self._attend(views, query, table_dst, seq, 1, ratio)
        mutated_gap = _max_abs(src_out, mutated)
        self.assertTrue(_finite(mutated))
        self.assertGreater(mutated_gap, 1e-3)
        self._note(
            "prefix_cow",
            device=device_index,
            hkv=hkv,
            block_size=block_size,
            seq_len=ntok,
            copied_gap=copied_gap,
            mutated_gap=mutated_gap,
            scale_before=scale_before,
            scale_after=scale_after,
            passed=True,
        )

    def test_mtp7_59500_matches_serial_and_not_int16(self):
        for layout in LAYOUTS:
            with self.subTest(hkv=layout.hkv):
                self.layout = layout
                for index in self._device_indices():
                    self._use_device(index)
                    # The fp16 reference is large. One device is enough for that gap.
                    self._long_case(59500, sdpa=(index == self._device_indices()[0]), device_index=index)
                    self._long_case(59527, sdpa=False, device_index=index)
                    self._long_case(63932, sdpa=False, device_index=index)
                    self._long_case(70000, sdpa=False, device_index=index)

    def _long_case(self, seq_len: int, sdpa: bool, device_index: int = 0) -> None:
        device = self.device
        hkv, hq = self.layout.hkv, self.layout.hq
        q_len = 7
        n_pages = (seq_len + PAGE - 1) // PAGE
        views = self._cache(n_pages)
        gen = torch.Generator(device="cpu")
        gen.manual_seed(seq_len)
        key = torch.empty(seq_len, hkv, D, dtype=torch.float16, device="cpu")
        value = torch.empty(seq_len, hkv, D, dtype=torch.float16, device="cpu")
        # Chunked fill keeps the CPU allocation from becoming one giant randn call.
        chunk = 4096
        for start in range(0, seq_len, chunk):
            stop = min(seq_len, start + chunk)
            key[start:stop] = torch.randn(stop - start, hkv, D, generator=gen, dtype=torch.float16)
            value[start:stop] = torch.randn(stop - start, hkv, D, generator=gen, dtype=torch.float16)
        key = key.to(device)
        value = value.to(device)
        slots = torch.arange(seq_len, dtype=torch.int64, device=device)
        self._store(views, key, value, slots)
        query = torch.randn(q_len, hq, D, generator=gen, dtype=torch.float16).to(device)
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

        try:
            del k_dq, v_dq, fp, sdpa
        except NameError:
            pass
        del views, key, value, parallel, serial_out, query
        torch.xpu.synchronize()
        row_gaps = self._concurrent_oracles(seq_len, q_len, gen)
        self._note(
            "mtp",
            device=device_index,
            hkv=hkv,
            seq_len=seq_len,
            q_len=q_len,
            parallel_vs_serial=parallel_vs_serial,
            builtin_vs_explicit=builtin_vs_explicit,
            int16_gap=int16_gap,
            ratio_gap=ratio_gap,
            pad_gap=pad_gap,
            row_gaps=row_gaps,
            dequant_sdpa=dequant_gap,
            fp_sdpa=fp_gap,
            as_int16=as_int16(seq_len),
            passed=max(row_gaps) < 1e-3,
        )

    def _concurrent_oracles(self, seq_len: int, q_len: int, gen: torch.Generator) -> list[float]:
        """Eight sequences, each with its own pages, query, and oracle."""
        device = self.device
        hkv, hq = self.layout.hkv, self.layout.hq
        lengths = [seq_len, 128, 512, 4096, 20000, 40000, max(seq_len // 2, 128), max(seq_len // 3, 128)]
        # Row 0 is not the long sequence. A kernel that ignores the row index fails.
        order = [1, 2, 4, 0, 6, 3, 7, 5]
        page_counts = [(length + PAGE - 1) // PAGE for length in lengths]
        offsets = []
        cursor = 0
        for count in page_counts:
            offsets.append(cursor)
            cursor += count
        raw = torch.zeros(cursor * self.layout.page_bytes, dtype=torch.int8, device=device)
        views = bind_regions(raw, self.layout)
        queries = []
        oracles = []
        tables = []
        for index, length in enumerate(lengths):
            key = torch.empty(length, hkv, D, dtype=torch.float16, device="cpu")
            value = torch.empty(length, hkv, D, dtype=torch.float16, device="cpu")
            chunk = 4096
            for start in range(0, length, chunk):
                stop = min(length, start + chunk)
                key[start:stop] = torch.randn(stop - start, hkv, D, generator=gen, dtype=torch.float16)
                value[start:stop] = torch.randn(stop - start, hkv, D, generator=gen, dtype=torch.float16)
            key = key.to(device)
            value = value.to(device)
            slots = torch.arange(
                offsets[index] * PAGE,
                offsets[index] * PAGE + length,
                dtype=torch.int64,
                device=device,
            )
            self._store(views, key, value, slots)
            del key, value
            query_i = torch.randn(q_len, hq, D, generator=gen, dtype=torch.float16).to(device)
            table = torch.arange(
                offsets[index],
                offsets[index] + page_counts[index],
                dtype=torch.int32,
                device=device,
            ).view(1, -1)
            seq_i = torch.tensor([length], dtype=torch.int32, device=device)
            oracles.append(self._attend(views, query_i, table, seq_i, q_len, 1))
            queries.append(query_i)
            tables.append(table.view(-1))
        width = max(page_counts)
        batch_table = torch.zeros((8, width), dtype=torch.int32, device=device)
        batch_q = torch.empty((8 * q_len, hq, D), dtype=torch.float16, device=device)
        batch_lengths = []
        ordered_oracles = []
        for row, src in enumerate(order):
            count = page_counts[src]
            batch_table[row, :count] = tables[src]
            batch_q[row * q_len : (row + 1) * q_len] = queries[src]
            batch_lengths.append(lengths[src])
            ordered_oracles.append(oracles[src])
        batched = self._attend(
            views,
            batch_q,
            batch_table,
            torch.tensor(batch_lengths, dtype=torch.int32, device=device),
            q_len,
            1,
        )
        gaps = []
        for row in range(8):
            got = batched[row * q_len : (row + 1) * q_len]
            gap = _max_abs(got, ordered_oracles[row])
            self.assertLess(gap, 1e-3, "row %d len %d" % (row, batch_lengths[row]))
            gaps.append(gap)
        self.assertGreater(max(gaps[0], _max_abs(ordered_oracles[0], ordered_oracles[1])), 0.0)
        return gaps


if __name__ == "__main__":
    unittest.main()
