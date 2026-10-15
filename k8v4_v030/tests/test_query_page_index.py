import unittest
import torch
from k8v4_v030.query_page_index import QueryPageIndex, dimension_page_scores, group_page_scores


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

    def test_dimension_scan_full_dimension_matches_actual_page_max(self):
        k = (self.k.float()*self.s[..., None]).repeat_interleave(6, dim=2)
        expected = torch.einsum('qhd,pshd->qhps', self.q, k).amax(-1)/4
        actual = dimension_page_scores(self.q, self.k, self.s, 576, 16)
        torch.testing.assert_close(actual, expected, atol=1e-5, rtol=1e-5)

    def test_dimension_scan_partial_tail_and_invalid_dimension_count(self):
        self.s[-1, 3:] = float('nan')
        scores = dimension_page_scores(self.q, self.k, self.s, 515, 8)
        self.assertTrue(bool(torch.isfinite(scores).all()))
        for count in (0, 17):
            with self.assertRaises(ValueError):
                dimension_page_scores(self.q, self.k, self.s, 515, count)

    def test_group_rankings_and_weights(self):
        scores = torch.arange(2*12*9).reshape(2, 12, 9).float()
        grouped = scores.reshape(2, 2, 6, 9)
        torch.testing.assert_close(group_page_scores(scores), grouped.max(2).values)
        torch.testing.assert_close(group_page_scores(scores, mode='top2'), grouped[:, :, -2:].mean(2))
        weights = torch.zeros(2, 12)
        weights[:, ::6] = 1
        torch.testing.assert_close(group_page_scores(scores, mode='weighted', weights=weights), grouped[:, :, 0])
        with self.assertRaises(ValueError):
            group_page_scores(scores, mode='unknown')
        with self.assertRaises(ValueError):
            group_page_scores(scores, mode='weighted')

    def test_one_group_list_is_not_six_head_union(self):
        scores = torch.eye(6).unsqueeze(0)
        individual = scores.topk(1, -1).indices.unique()
        grouped = group_page_scores(scores).topk(1, -1).indices.unique()
        self.assertEqual(individual.numel(), 6)
        self.assertEqual(grouped.numel(), 1)

    def test_normalized_group_ranking_ignores_head_logit_offsets(self):
        generator = torch.Generator().manual_seed(51)
        scores = torch.randn(7,12,32,generator=generator)
        offsets = torch.arange(12).float().reshape(1,12,1)*10
        for mode in ('max','top2','weighted'):
            weights = torch.ones(7,12)
            a = group_page_scores(scores,mode=mode,weights=weights,normalize=True)
            b = group_page_scores(scores+offsets,mode=mode,weights=weights,normalize=True)
            torch.testing.assert_close(a,b,atol=1e-6,rtol=1e-5)


if __name__ == '__main__':
    unittest.main()
