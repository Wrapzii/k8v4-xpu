"""Env-gated INT8 pooled keys. CPU only. The default path stays FP32."""

from __future__ import annotations

import os
import unittest

import torch

from k8v4_v030.qsa_cache import QsaBlockCache, QsaCacheBank, reset_caches
from k8v4_v030.qsa_config import pooled_key_dtype
from k8v4_v030.qsa_memory_budget import plan, reserve_worker
from k8v4_v030.qsa_ops import score_pooled, score_pooled_gemm, score_pooled_paged
from k8v4_v030.qsa_pooled_quant import dequantize_pooled_rows, quantize_pooled_rows
from k8v4_v030.qsa_ref import QsaHyper, pool_block, score_blocks
from k8v4_v030.qsa_tail_cache import QsaTailCache, _compact_int8_op

_ENV = (
    "K8V4_QSA_POOLED_KEY_DTYPE",
    "K8V4_QSA_LAZY_CACHE",
    "K8V4_QSA_GRAPH",
    "K8V4_QSA_COMPACT_TAIL",
)
_KS = (32, 128, 512, 2048)
_RECALL_FLOOR = 0.99
_AVAILABLE = 12_739_498_804
_MAIN_PER_BLOCK = 28_435_968
_BLOCK = 2112
_B_PER_TOK = 16154.78


def _set_dtype(value):
    if value is None:
        os.environ.pop("K8V4_QSA_POOLED_KEY_DTYPE", None)
    else:
        os.environ["K8V4_QSA_POOLED_KEY_DTYPE"] = value


def _fp32_components(layers, compact_tail=None):
    """Today's sidecar formula, including key order."""
    layers = tuple(layers)
    raw_tokens = (compact_tail,) * len(layers) if compact_tail is not None else layers
    components = {
        "raw_keys": sum(t * 128 * 4 for t in raw_tokens),
        "positions": sum(t * 4 * 4 for t in raw_tokens),
        "filled": sum(layers),
        "pooled_keys": sum((t // 4) * 128 * 4 for t in layers),
        "pool_valid": sum(t // 4 for t in layers),
    }
    if compact_tail is not None:
        components["raw_slots"] = sum(t * 8 for t in raw_tokens)
    return components


class _Spec:
    def __init__(self, block_size):
        self.num_kv_heads = 4
        self.head_size = 256
        self.block_size = block_size


def _roster(block_size=_BLOCK):
    spec = _Spec(block_size)
    return [("model.layers.%d.self_attn" % i, spec) for i in range(3, 64, 4)]


def _fixed_passed_by_reserve_vllm():
    return 16 * (5120 * 128 * 5 + 128 * 3) * 4 + (256 << 20)


def _recall_at(reference, approx, ks=_KS):
    """Mean fraction of the FP32 top-k still selected after dequant.

    Stable argsort keeps the lower row id when scores tie.
    """
    order_ref = torch.argsort(-reference, dim=-1, stable=True)
    order_hat = torch.argsort(-approx, dim=-1, stable=True)
    found = {}
    n_q = int(reference.shape[0])
    for k in ks:
        hits = []
        for row in range(n_q):
            left = set(order_ref[row, :k].tolist())
            right = set(order_hat[row, :k].tolist())
            hits.append(len(left & right) / float(k))
        found[k] = sum(hits) / float(n_q)
    return found


def _print_recall(rows):
    print("RECALL TABLE  mean over queries, dequant INT8 vs FP32", flush=True)
    print("%-14s %6s %8s %8s %8s %8s %8s" % ("kind", "seed", "n", "@32", "@128", "@512", "@2048"), flush=True)
    for kind, seed, n, rec in rows:
        print(
            "%-14s %6d %8d %8.4f %8.4f %8.4f %8.4f"
            % (kind, seed, n, rec[32], rec[128], rec[512], rec[2048]),
            flush=True,
        )


def _rows(kind, n, dim, gen):
    if kind == "gaussian":
        return torch.randn(n, dim, generator=gen)
    if kind == "row_scaled":
        scale = torch.exp(torch.randn(n, 1, generator=gen))
        return torch.randn(n, dim, generator=gen) * scale
    if kind == "laplace":
        u = torch.rand(n, dim, generator=gen).clamp(1e-6, 1.0 - 1e-6)
        return torch.sign(u - 0.5) * -torch.log1p(-2.0 * (u - 0.5).abs())
    if kind == "spikes":
        rows = torch.randn(n, dim, generator=gen)
        hot = torch.rand(n, generator=gen) < 0.05
        rows = rows * torch.where(hot.unsqueeze(-1), torch.full((n, 1), 25.0), torch.ones(n, 1))
        coord = torch.randint(0, dim, (n,), generator=gen)
        rows[torch.arange(n), coord] = rows[torch.arange(n), coord] + torch.randn(n, generator=gen) * 10
        return rows
    raise AssertionError(kind)


def _score_pair(rows, queries):
    quantized, scales = quantize_pooled_rows(rows)
    hat = dequantize_pooled_rows(quantized, scales)
    return score_blocks(queries, rows), score_blocks(queries, hat)


class PooledInt8Test(unittest.TestCase):
    def setUp(self):
        self._saved = {key: os.environ.get(key) for key in _ENV}
        for key in _ENV:
            os.environ.pop(key, None)
        reset_caches()

    def tearDown(self):
        for key, value in self._saved.items():
            if value is None:
                os.environ.pop(key, None)
            else:
                os.environ[key] = value
        reset_caches()

    def test_off_is_bit_identical(self):
        hyper = QsaHyper()
        norm = torch.randn(hyper.dim, dtype=torch.float64)
        keys = torch.randn(8, hyper.dim, dtype=torch.float64)
        pos = torch.arange(32, dtype=torch.int64).reshape(8, 4)
        for label in (None, "", "fp32", "float32", " fp32 "):
            _set_dtype(label)
            self.assertEqual(pooled_key_dtype(), "fp32")
            for dtype in (torch.float32, torch.float64):
                one = QsaBlockCache(num_blocks=1, block_size=64, hyper=hyper, dtype=dtype)
                two = QsaBlockCache(num_blocks=1, block_size=64, hyper=hyper, dtype=dtype)
                self.assertIsNone(one.pooled_scale)
                self.assertEqual(one.pooled.dtype, dtype)
                self.assertEqual(one.pooled_key_dtype, "fp32")
                for slot in range(4):
                    one.write_token(slot, keys[slot], pos[slot], norm)
                two.write_tokens(torch.arange(4), keys[:4], pos[:4], norm)
                # The cache casts stored keys to its dtype, then pools in fp64.
                # The norm weight stays at the caller's dtype until that pool.
                expect = pool_block(keys[:4].to(dtype), norm, pos[0], hyper)
                self.assertTrue(torch.equal(one.pooled, two.pooled))
                self.assertTrue(torch.equal(one.raw, two.raw))
                self.assertTrue(torch.equal(one.pos, two.pos))
                self.assertTrue(torch.equal(one.filled, two.filled))
                self.assertTrue(torch.equal(one.pool_valid, two.pool_valid))
                self.assertTrue(torch.equal(one.pooled[0], expect.to(dtype=dtype)))
                empty, _valid = one.gather_blocks(torch.arange(2), 0, 1)
                self.assertEqual(empty.dtype, dtype)
        layers = (64, 128, 256)
        for compact in (None, 16):
            got = plan(10**12, 1000, layers, compact_tail_tokens=compact)
            expect = _fp32_components(layers, compact)
            self.assertEqual(got["sidecar_components_per_block"], expect)
            self.assertNotIn("pooled_scales", got["sidecar_components_per_block"])
            self.assertEqual(got["sidecar_bytes_per_block"], sum(expect.values()))
            self.assertEqual(
                got["storage_contract"],
                "legacy-full-raw" if compact is None else "xpu-fp32-physical-tail-v1",
            )
        prod = ( _BLOCK,) * 16
        compact_expect = _fp32_components(prod, 16)
        fixed = _fixed_passed_by_reserve_vllm()
        got = plan(
            _AVAILABLE,
            _MAIN_PER_BLOCK,
            prod,
            fixed_bytes=fixed,
            compact_tail_tokens=16,
        )
        self.assertEqual(got["sidecar_components_per_block"], compact_expect)
        self.assertEqual(got["sidecar_bytes_per_block"], 4_504_832)
        self.assertEqual(got["blocks"], 372)

    def test_memory_plan_math(self):
        self.assertEqual(_fixed_passed_by_reserve_vllm(), 478_175_232)
        layers = _roster()
        fixed = _fixed_passed_by_reserve_vllm()
        fp32 = reserve_worker(
            _AVAILABLE,
            _MAIN_PER_BLOCK,
            layers,
            fixed_bytes=fixed,
            compact_tail_tokens=16,
            pooled_key_dtype="fp32",
        )
        int8 = reserve_worker(
            _AVAILABLE,
            _MAIN_PER_BLOCK,
            layers,
            fixed_bytes=fixed,
            compact_tail_tokens=16,
            pooled_key_dtype="int8",
        )
        i8 = reserve_worker(
            _AVAILABLE,
            _MAIN_PER_BLOCK,
            layers,
            fixed_bytes=fixed,
            compact_tail_tokens=16,
            pooled_key_dtype="i8",
        )
        self.assertEqual(fp32["fixed_bytes"], 478_177_344)
        self.assertEqual(int8["fixed_bytes"], 478_177_344)
        self.assertEqual(fp32["storage_contract"], "xpu-fp32-physical-tail-v1")
        self.assertEqual(int8["storage_contract"], "xpu-fp32-physical-tail-v1")
        self.assertEqual(fp32["blocks"], 372)
        self.assertEqual(fp32["sidecar_bytes_per_block"], 4_504_832)
        self.assertEqual(fp32["sidecar_bytes"], 1_675_797_504)
        self.assertEqual(fp32["sidecar_components_bytes"]["pooled_keys"], 1_609_039_872)
        self.assertEqual(fp32["main_bytes"], 372 * _MAIN_PER_BLOCK)
        self.assertNotIn("pooled_scales", fp32["sidecar_components_per_block"])
        per = int8["sidecar_components_per_block"]
        self.assertEqual(per["pooled_keys"], 1_081_344)
        self.assertEqual(per["pooled_scales"], 33_792)
        self.assertEqual(int8["sidecar_bytes_per_block"], 1_294_592)
        self.assertEqual(
            int8["sidecar_bytes_per_block"],
            4_504_832 - 4_325_376 + 1_081_344 + 33_792,
        )
        self.assertEqual(int8["blocks"], 412)
        self.assertEqual(int8["main_bytes"], 412 * _MAIN_PER_BLOCK)
        self.assertGreater(int8["main_bytes"], fp32["main_bytes"])
        self.assertEqual(i8["blocks"], int8["blocks"])
        self.assertEqual(i8["sidecar_bytes_per_block"], int8["sidecar_bytes_per_block"])
        self.assertEqual(i8["main_bytes"], int8["main_bytes"])
        keys = list(per)
        self.assertLess(keys.index("pooled_scales"), keys.index("raw_slots"))
        _set_dtype(None)
        via_default = reserve_worker(
            _AVAILABLE, _MAIN_PER_BLOCK, layers, fixed_bytes=fixed, compact_tail_tokens=16,
        )
        self.assertEqual(via_default["blocks"], 372)
        self.assertEqual(via_default["main_bytes"], fp32["main_bytes"])
        _set_dtype("int8")
        via_env = reserve_worker(
            _AVAILABLE, _MAIN_PER_BLOCK, layers, fixed_bytes=fixed, compact_tail_tokens=16,
        )
        self.assertEqual(via_env["blocks"], 412)
        self.assertEqual(via_env["main_bytes"], int8["main_bytes"])
        # An explicit fp32 argument wins over the env so callers can lock the old formula.
        forced = plan(
            _AVAILABLE, _MAIN_PER_BLOCK, (_BLOCK,) * 16,
            fixed_bytes=fixed, compact_tail_tokens=16, pooled_key_dtype="fp32",
        )
        self.assertEqual(forced["blocks"], 372)
        for bad in ("fp8", "bf16", "INT8", "garbage", "float16"):
            _set_dtype(bad)
            with self.assertRaises(ValueError):
                pooled_key_dtype()
            with self.assertRaises(ValueError):
                plan(1000, 100, (64,), pooled_key_dtype=bad)
        print("MEMORY fp32 blocks=%d main_bytes=%d sidecar_per_block=%d sidecar_total=%d pooled_keys=%d fixed=%d" % (
            fp32["blocks"], fp32["main_bytes"], fp32["sidecar_bytes_per_block"],
            fp32["sidecar_bytes"], fp32["sidecar_components_bytes"]["pooled_keys"], fp32["fixed_bytes"]), flush=True)
        print("MEMORY int8 blocks=%d main_bytes=%d sidecar_per_block=%d pooled_keys_per_block=%d scales_per_block=%d" % (
            int8["blocks"], int8["main_bytes"], int8["sidecar_bytes_per_block"],
            per["pooled_keys"], per["pooled_scales"]), flush=True)
        print("MEMORY tokens_at_16154.78 fp32=%.6f int8=%.6f delta=%.6f" % (
            fp32["main_bytes"] / _B_PER_TOK,
            int8["main_bytes"] / _B_PER_TOK,
            (int8["main_bytes"] - fp32["main_bytes"]) / _B_PER_TOK,
        ), flush=True)
        print("MEMORY physical_tokens fp32=%d int8=%d" % (372 * _BLOCK, 412 * _BLOCK), flush=True)

    def test_quant_scheme_and_score_dequant(self):
        zero = torch.zeros(1, 128)
        q, scale = quantize_pooled_rows(zero)
        self.assertEqual(q.dtype, torch.int8)
        self.assertEqual(scale.dtype, torch.float32)
        self.assertTrue(torch.equal(q, torch.zeros(1, 128, dtype=torch.int8)))
        hat = dequantize_pooled_rows(q, scale)
        self.assertTrue(torch.equal(hat, torch.zeros(1, 128)))
        one = torch.zeros(1, 128)
        one[0, 0] = 3.0
        q, scale = quantize_pooled_rows(one)
        self.assertEqual(int(q[0, 0]), 127)
        self.assertTrue(torch.equal(dequantize_pooled_rows(q, scale)[0, 0], torch.tensor(3.0)))
        half = torch.zeros(1, 128)
        half[0, 0] = 127.0
        half[0, 1] = 0.5
        half[0, 2] = 1.5
        half[0, 3] = 2.5
        half[0, 4] = -0.5
        half[0, 5] = -1.5
        half[0, 6] = -2.5
        q, scale = quantize_pooled_rows(half)
        self.assertEqual(float(scale[0]), 1.0)
        # torch.round is half-to-even, matching sycl::rint in the patched writers.
        self.assertEqual([int(v) for v in q[0, :7].tolist()], [127, 0, 2, 2, 0, -2, -2])
        with self.assertRaises(ValueError):
            dequantize_pooled_rows(q, None)
        queries = torch.randn(3, 4, 128)
        rows = torch.randn(17, 128)
        quantized, scales = quantize_pooled_rows(rows)
        floating = dequantize_pooled_rows(quantized, scales)
        self.assertTrue(torch.equal(score_pooled(queries, quantized, scales), score_pooled(queries, floating)))
        self.assertTrue(torch.equal(
            score_pooled_gemm(queries, quantized, scales),
            score_pooled_gemm(queries, floating),
        ))
        with self.assertRaises(ValueError):
            score_pooled(queries, quantized)
        valid = torch.ones(17, dtype=torch.bool)
        table = torch.arange(4, dtype=torch.int32)
        with self.assertRaises(ValueError):
            score_pooled_paged(queries, quantized, valid, table, [4], 1)
        with self.assertRaises(RuntimeError) as caught:
            score_pooled_paged(queries, quantized, valid, table, [4], 1, scales=scales)
        self.assertIn("libxe2_qsa", str(caught.exception))

    def test_recall_synthetic(self):
        n = 8192
        n_q = 8
        dim = 128
        table = []
        short = []
        for seed in (0, 1, 2):
            for kind in ("gaussian", "row_scaled", "laplace", "spikes"):
                gen = torch.Generator().manual_seed(seed * 10 + {"gaussian": 1, "row_scaled": 2, "laplace": 3, "spikes": 4}[kind])
                rows = _rows(kind, n, dim, gen)
                queries = torch.randn(n_q, 4, dim, generator=gen)
                reference, approx = _score_pair(rows, queries)
                rec = _recall_at(reference, approx)
                table.append((kind, seed, n, rec))
                if rec[2048] < _RECALL_FLOOR:
                    short.append((kind, seed, rec[2048]))
        _print_recall(table)
        self.assertFalse(
            short,
            "recall@2048 below %.2f: %s" % (_RECALL_FLOOR, short),
        )

    def test_recall_stored_caches(self):
        hyper = QsaHyper()
        n_rows = 8192
        n_tokens = n_rows * hyper.ratio
        block_size = 64
        num_blocks = n_tokens // block_size
        gen = torch.Generator().manual_seed(7)
        keys = torch.randn(n_tokens, hyper.dim, generator=gen)
        pos = torch.arange(n_tokens * 4, dtype=torch.int64).reshape(n_tokens, 4)
        norm = torch.randn(hyper.dim, generator=gen)
        slots = torch.arange(n_tokens)

        def fill(cache):
            cache.write_tokens(slots, keys, pos, norm)

        _set_dtype("fp32")
        fp32 = QsaBlockCache(num_blocks, block_size, hyper=hyper)
        fill(fp32)
        _set_dtype("int8")
        int8 = QsaBlockCache(num_blocks, block_size, hyper=hyper)
        fill(int8)
        self.assertEqual(fp32.pooled.dtype, torch.float32)
        self.assertIsNone(fp32.pooled_scale)
        self.assertEqual(int8.pooled.dtype, torch.int8)
        self.assertEqual(tuple(int8.pooled_scale.shape), (n_rows,))
        self.assertTrue(torch.equal(fp32.raw, int8.raw))
        self.assertTrue(torch.equal(fp32.pos, int8.pos))
        self.assertTrue(torch.equal(fp32.filled, int8.filled))
        self.assertTrue(torch.equal(fp32.pool_valid, int8.pool_valid))
        self.assertTrue(bool(fp32.pool_valid.all()))
        quantized, scales = quantize_pooled_rows(fp32.pooled)
        self.assertTrue(torch.equal(quantized, int8.pooled))
        self.assertTrue(torch.equal(scales, int8.pooled_scale))
        hat = dequantize_pooled_rows(int8.pooled, int8.pooled_scale)
        err = (hat - fp32.pooled).abs()
        self.assertTrue(torch.all(err <= 0.5 * int8.pooled_scale.unsqueeze(-1) + 1e-5))
        table = torch.arange(num_blocks, dtype=torch.int32)
        gathered, valid = int8.gather_blocks(table, n_rows, 1)
        self.assertEqual(gathered.dtype, torch.float32)
        self.assertTrue(bool(valid.all()))
        self.assertTrue(torch.equal(gathered, hat))
        direct = int8.pooled_row(table, 0, 1)
        self.assertTrue(torch.equal(direct, hat[0]))
        queries = torch.randn(8, 4, hyper.dim, generator=gen)
        rec = _recall_at(score_blocks(queries, fp32.pooled), score_blocks(queries, hat))
        stored = [("cache_block", 7, n_rows, rec)]

        _set_dtype("fp32")
        tail_fp = QsaTailCache(num_blocks, block_size, tail_tokens=16, hyper=hyper)
        fill(tail_fp)
        _set_dtype("int8")
        tail_i8 = QsaTailCache(num_blocks, block_size, tail_tokens=16, hyper=hyper)
        fill(tail_i8)
        self.assertEqual(tail_i8.pooled.dtype, torch.int8)
        self.assertTrue(torch.equal(tail_fp.raw, tail_i8.raw))
        self.assertTrue(torch.equal(tail_fp.pool_valid, tail_i8.pool_valid))
        self.assertTrue(bool(tail_fp.pool_valid.all()))
        q_tail, s_tail = quantize_pooled_rows(tail_fp.pooled)
        self.assertTrue(torch.equal(q_tail, tail_i8.pooled))
        self.assertTrue(torch.equal(s_tail, tail_i8.pooled_scale))
        hat_tail = dequantize_pooled_rows(tail_i8.pooled, tail_i8.pooled_scale)
        rec_tail = _recall_at(score_blocks(queries, tail_fp.pooled), score_blocks(queries, hat_tail))
        stored.append(("cache_tail", 7, n_rows, rec_tail))
        _print_recall(stored)
        self.assertGreaterEqual(rec[2048], _RECALL_FLOOR)
        self.assertGreaterEqual(rec_tail[2048], _RECALL_FLOOR)

        # Scales follow the block on copy and return to zero on reset.
        small_slots = torch.arange(64)
        _set_dtype("int8")
        src = QsaTailCache(2, 64, tail_tokens=16, hyper=hyper)
        src.write_tokens(small_slots, keys[:64], pos[:64], norm)
        src.copy_blocks([0], [1])
        m = 64 // hyper.ratio
        self.assertTrue(torch.equal(src.pooled_scale[:m], src.pooled_scale[m:2 * m]))
        self.assertTrue(torch.equal(src.pooled[:m], src.pooled[m:2 * m]))
        src.pooled_scale[0] = 9.0
        self.assertNotEqual(float(src.pooled_scale[m]), 9.0)
        src.reset_blocks([1])
        self.assertTrue(torch.equal(src.pooled[m:2 * m], torch.zeros_like(src.pooled[m:2 * m])))
        self.assertTrue(torch.equal(src.pooled_scale[m:2 * m], torch.zeros(m)))
        self.assertFalse(bool(src.pool_valid[m:2 * m].any()))

        block = QsaBlockCache(2, 64, hyper=hyper)
        block.write_tokens(small_slots, keys[:64], pos[:64], norm)
        block.copy_blocks([0], [1])
        self.assertTrue(torch.equal(block.pooled_scale[:m], block.pooled_scale[m:2 * m]))

    def test_bank_locks_dtype(self):
        _set_dtype("fp32")
        bank = QsaCacheBank()
        first = bank.layer(0, 1, 64)
        self.assertIsNone(first.pooled_scale)
        _set_dtype("int8")
        with self.assertRaises(RuntimeError) as caught:
            bank.layer(0, 1, 64)
        self.assertIn("pooled key dtype", str(caught.exception))

    def test_lazy_grows_scales(self):
        _set_dtype("int8")
        os.environ["K8V4_QSA_LAZY_CACHE"] = "1"
        cache = QsaBlockCache(num_blocks=8, block_size=64)
        self.assertEqual(cache.pooled.shape[0], 32)
        self.assertEqual(tuple(cache.pooled_scale.shape), (32,))
        cache.write_token(200, torch.randn(128), torch.zeros(4, dtype=torch.int64), torch.ones(128))
        self.assertGreater(cache.pooled.shape[0], 32)
        self.assertEqual(tuple(cache.pooled_scale.shape), (cache.pooled.shape[0],))
        self.assertEqual(cache.pooled_scale.dtype, torch.float32)

    def test_missing_int8_op(self):
        with self.assertRaises(RuntimeError) as caught:
            _compact_int8_op("qsa_tail_v1", "update_i8")
        self.assertIn("cannot store int8", str(caught.exception))

    def test_logical_blocks_dequantizes(self):
        from k8v4_v030.qsa_runtime import _logical_blocks

        _set_dtype("int8")
        cache = QsaBlockCache(1, 64)
        cache.pooled[0] = 1
        cache.pooled_scale[0] = 0.5
        cache.pool_valid[0] = True
        rows, valid = _logical_blocks(cache, 1)
        self.assertEqual(rows.dtype, torch.float32)
        self.assertTrue(torch.equal(rows[0], torch.full((128,), 0.5)))
        self.assertTrue(bool(valid[0]))
        _set_dtype(None)
        plain = QsaBlockCache(1, 64, dtype=torch.float64)
        plain.pooled[0] = 1.25
        got, _valid = _logical_blocks(plain, 1)
        self.assertEqual(got.dtype, torch.float64)
        self.assertTrue(torch.equal(got[0], plain.pooled[0]))


if __name__ == "__main__":
    unittest.main()
