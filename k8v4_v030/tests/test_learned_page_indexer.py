import torch

from k8v4_v030.learned_page_indexer import (
    CapacityPageIndexer, LearnedPageIndexer, mandatory_mask, mass_and_ranking_loss, merge_attention_states, page_features,
    page_ids_to_token_indices, select_pages,
)


def test_cached_projection_matches_uncached_and_groups_are_independent():
    torch.manual_seed(7)
    model = LearnedPageIndexer(2, 6, 8, 4)
    q, features = torch.randn(7, 12, 8), torch.randn(16, 2, 24)
    expected = model(q, features)
    assert torch.equal(expected, model.score_projected(q, model.project_pages(features)))
    changed = features.clone()
    changed[:, 1] += 4
    assert torch.equal(expected[:, 0], model(q, changed)[:, 0])


def test_fixed_budget_includes_mandatory_without_duplicates():
    scores = torch.randn(7, 2, 100)
    ids = select_pages(scores, .2)
    assert ids.shape == (7, 2, 20)
    assert (ids[..., 1:] > ids[..., :-1]).all()
    mask = torch.zeros_like(scores, dtype=torch.bool).scatter_(-1, ids, True)
    assert mask[..., mandatory_mask(100)].all()


def test_device_indices_respect_each_query_causality_and_group():
    ids = torch.tensor([[[0, 2], [1, 2]], [[0, 2], [1, 2]]])
    indices = page_ids_to_token_indices(ids, torch.tensor([130, 133]), 133)
    assert (indices[0][indices[0] >= 0] < 130).all()
    assert (indices[1][indices[1] >= 0] < 133).all()
    assert indices[0, 1, 0] == 64
    assert indices[0, 0, 66] == -1


def test_page_features_do_not_mix_kv_groups():
    keys = torch.zeros(2, 64, 2, 8)
    keys[:, :, 1] = 3
    features = page_features(keys)
    assert torch.equal(features[:, 0], torch.zeros(2, 24))
    assert torch.equal(features[:, 1], torch.full((2, 24), 3.))


def test_high_mass_misses_cost_more_and_have_finite_gradients():
    mass = torch.ones(1, 1, 64) * .001
    mass[..., 10] = .9
    good, bad = torch.zeros_like(mass), torch.zeros_like(mass)
    good[..., 10], bad[..., 30] = 8, 8
    bad.requires_grad_()
    good_loss, _, _ = mass_and_ranking_loss(good, mass)
    bad_loss, _, _ = mass_and_ranking_loss(bad, mass)
    assert bad_loss > good_loss
    bad_loss.backward()
    assert torch.isfinite(bad.grad).all()
    assert bad.grad[..., 10] < 0


def test_capacity_variants_keep_the_same_cached_key_shape():
    q, features = torch.randn(7, 12, 8), torch.randn(32, 2, 24)
    for hidden in (0, 16):
        model = CapacityPageIndexer(2, 6, 8, 4, hidden)
        projected = model.project_pages(features)
        assert projected.shape == (2, 32, 4)
        assert model.score_projected(q, projected).shape == (7, 2, 32)


def test_shared_prefix_merge_matches_dense_for_all_q7_endpoints():
    torch.manual_seed(4)
    q, k, v = torch.randn(7, 8, dtype=torch.float64), torch.randn(40, 8, dtype=torch.float64), torch.randn(40, 8, dtype=torch.float64)
    scores = q @ k.T / 8**.5
    for i in range(7):
        end, split = 34 + i, 32
        prefix, tail = scores[i, :split], scores[i, split:end]
        a, b = prefix.softmax(-1) @ v[:split], tail.softmax(-1) @ v[split:end]
        merged, _ = merge_attention_states(a, prefix.logsumexp(-1), b, tail.logsumexp(-1))
        torch.testing.assert_close(merged, scores[i, :end].softmax(-1) @ v[:end], atol=1e-12, rtol=1e-12)
    out, lse = merge_attention_states(torch.ones(8), torch.tensor(0.), torch.zeros(8), torch.tensor(-float('inf')))
    assert torch.equal(out, torch.ones(8)) and lse == 0
