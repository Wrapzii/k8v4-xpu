import unittest
import torch
from k8v4_v030.query_page_index import QueryPageIndex


class QueryPageIndexTest(unittest.TestCase):
    def setUp(self):
        generator = torch.Generator().manual_seed(501)
        self.k = torch.randint(-127, 128, (9, 64, 2, 16), generator=generator, dtype=torch.int8)
        self.s = torch.rand(9, 64, 2, generator=generator) * 0.1
        self.q = torch.randn(7, 12, 16, generator=generator)

    def test_bounds_cover_all_gqa_heads_and_signs(self):
        idx = QueryPageIndex.build(self.k, self.s, 576)
        bounds = idx.score_bounds(self.q)
        keys = (self.k.float() * self.s[..., None]).repeat_interleave(6, dim=2)
        actual = torch.einsum('qhd,pshd->qhps', self.q, keys).amax(-1) / 4
        self.assertTrue(bool((bounds + 1e-4 >= actual).all()))

    def test_dirty_partial_tail_is_excluded(self):
        self.s[-1, 3:] = float('nan')
        index = QueryPageIndex.build(self.k, self.s, 515)
        expected = self.k[-1, :3].float() * self.s[-1, :3, :, None]
        torch.testing.assert_close(index.minimum[-1], expected.amin(0))
        torch.testing.assert_close(index.maximum[-1], expected.amax(0))

    def test_full_budget_is_identity(self):
        index = QueryPageIndex.build(self.k, self.s, 576)
        ids = index.select(self.q, 1)
        self.assertEqual(ids.tolist(), list(range(9)))
        self.assertEqual(index.compact_length(ids, 7), 576)

    def test_union_preserves_sinks_tail_and_each_head(self):
        index = QueryPageIndex.build(self.k, self.s, 576)
        ids = index.select(self.q, .1, 1, 2)
        expected = set(index.score_bounds(self.q).topk(1, -1).indices.reshape(-1).tolist()) | {0, 7, 8}
        self.assertEqual(set(ids.tolist()), expected)
        self.assertEqual(ids.tolist(), sorted(expected))

    def test_causal_remap_across_two_tail_pages(self):
        index = QueryPageIndex.build(self.k, self.s, 515)
        self.assertEqual(index.compact_length(torch.tensor([0, 5, 7, 8]), 7), 195)
        with self.assertRaises(ValueError):
            index.compact_length(torch.tensor([0, 5, 8]), 7)

    def test_invalid_index_or_budget_refuses_silent_selection(self):
        self.s[0, 0] = float('nan')
        with self.assertRaises(ValueError):
            QueryPageIndex.build(self.k, self.s, 576)
        self.s[0, 0] = 1
        index = QueryPageIndex.build(self.k, self.s, 576)
        for fraction in (0, -1, 1.1):
            with self.assertRaises(ValueError):
                index.select(self.q, fraction)
        for ids in ([0, 0, 8], [8, 0], [-1, 8], [0, 9]):
            with self.assertRaises(ValueError):
                index.compact_length(torch.tensor(ids), 1)

    def test_nonconsecutive_pages_keep_original_causal_attention(self):
        index = QueryPageIndex.build(self.k, self.s, 515)
        selected = torch.tensor([0, 5, 7, 8])
        original_positions = torch.cat([torch.arange(int(p)*64, min(int(p)*64+64, 515)) for p in selected])
        keys = (self.k.float()*self.s[..., None]).reshape(-1, 2, 16)
        keys = keys[original_positions].repeat_interleave(6, 1)
        logits = torch.einsum('qhd,thd->qht', self.q, keys)/4
        original_ends = 515-7+torch.arange(7)+1
        compact_ends = index.compact_length(selected, 7)-7+torch.arange(7)+1
        original_mask = original_positions[None, :] >= original_ends[:, None]
        compact_mask = torch.arange(len(original_positions))[None, :] >= compact_ends[:, None]
        self.assertTrue(torch.equal(original_mask, compact_mask))
        a = logits.masked_fill(original_mask[:, None, :], -float('inf')).softmax(-1)
        b = logits.masked_fill(compact_mask[:, None, :], -float('inf')).softmax(-1)
        self.assertTrue(torch.equal(a, b))


if __name__ == '__main__':
    unittest.main()
