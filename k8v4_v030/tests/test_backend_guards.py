"""The layout-mismatch guards added with the builder/impl split raise loudly.

The builder reads the KV cache spec, the impl reads the attention module, and
bind_regions reads the cache's head dim; a silent mismatch would alias pages
across heads instead of failing. CPU-only: both guards fire before any
device work.
"""

from __future__ import annotations

import importlib.util
import unittest

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import CACHE_DTYPE, PAGE, SLOT_BYTES_PER_HEAD, PageLayout

HAVE_VLLM = importlib.util.find_spec("vllm") is not None


class BindRegionsGuardTest(unittest.TestCase):
    def test_head_mismatched_4d_cache_is_refused(self):
        layout = PageLayout(2)
        # 4 heads x 64 tokens x 396 bytes IS a multiple of the 2-head page, so
        # only the head check keeps these views from aliasing garbage.
        cache = torch.zeros(1, 4, PAGE, SLOT_BYTES_PER_HEAD, dtype=torch.int8)
        with self.assertRaisesRegex(
            RuntimeError, r"K8/V4 cache has 4 KV heads, layout serves 2"
        ):
            bind_regions(cache, layout)


@unittest.skipUnless(HAVE_VLLM, "the vLLM attention base classes are needed")
class BackendForwardGuardTest(unittest.TestCase):
    def _metadata(self, layout: PageLayout):
        from k8v4_v030.backend import Xe2K8V4Metadata

        return Xe2K8V4Metadata(
            seq_lens=torch.tensor([1], dtype=torch.int32),
            slot_mapping=torch.zeros(1, dtype=torch.int64),
            block_table=torch.zeros((1, 1), dtype=torch.int32),
            query_start_loc=torch.tensor([0, 1], dtype=torch.int32),
            query_starts=(0, 1),
            seq_lens_cpu=torch.tensor([1], dtype=torch.int32),
            num_actual_tokens=1,
            max_query_len=1,
            max_seq_len=1,
            pages_per_block=1,
            packed_q_len=0,
            layout=layout,
        )

    def test_builder_impl_layout_mismatch_is_refused(self):
        from k8v4_v030.backend import Xe2K8V4Impl

        impl = Xe2K8V4Impl(
            12, 256, 0.0625, num_kv_heads=2, kv_cache_dtype=CACHE_DTYPE
        )
        cache = torch.zeros(1, 2, PAGE, SLOT_BYTES_PER_HEAD, dtype=torch.int8)
        query = torch.zeros(1, 12, 256)
        output = torch.zeros(1, 12, 256)
        with self.assertRaisesRegex(
            RuntimeError,
            r"KV cache was built for 4 KV / 24 Q heads but the attention "
            r"impl derived 2 KV / 12 Q",
        ):
            impl.forward(
                None, query, query, query, cache, self._metadata(PageLayout(4)), output
            )


if __name__ == "__main__":
    unittest.main()
