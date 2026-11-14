import torch
from k8v4_v030.qsa_ops import _visible_graph, _prefill_prefix_visible
from k8v4_v030.qsa_ref import QsaHyper, complete_blocks


def test_prefix_matches_stock_and_rejects_over_budget():
    hyper = QsaHyper(top_tokens=2048)
    cells = torch.tensor([0, 2043, 2048, 2050], dtype=torch.int32)
    counts = [complete_blocks(int(cell), hyper.ratio) for cell in cells]
    scores = torch.rand(4, 512)
    scores[0, :] = -float("inf")
    scores[1, 511:] = -float("inf")
    expected = _visible_graph(scores, torch.tensor(counts), cells, hyper, 2052,
                              premasked=True, stable_ties=True)
    actual = _prefill_prefix_visible(counts, cells, hyper, 2052)
    assert torch.equal(actual, expected)
    assert _prefill_prefix_visible([513], torch.tensor([2051]), hyper, 2052) is None


def test_tile_boundary_and_complete_visible_id_rows():
    hyper = QsaHyper(top_tokens=2048)
    cells = torch.tensor([0, 3, 4, 2047, 2048, 2050], dtype=torch.int32)
    counts = [complete_blocks(int(cell), hyper.ratio) for cell in cells]
    result = _prefill_prefix_visible(counts, cells, hyper, 2052)
    for row, cell in zip(result, cells.tolist()):
        expected = torch.full((2052,), -1, dtype=torch.int32)
        expected[:cell + 1] = torch.arange(cell + 1, dtype=torch.int32)
        assert torch.equal(row, expected)
    assert _prefill_prefix_visible(counts + [513], torch.tensor(cells.tolist() + [2051]), hyper, 2052) is None
    assert _prefill_prefix_visible([], torch.tensor([], dtype=torch.int32), hyper, 2052) is None


def test_prefix_matches_torch_fallback_for_nonfinite_scored_block():
    # The torch fallback explicitly uses the full prefix for within-budget rows.
    hyper = QsaHyper(top_tokens=2048)
    cells = torch.tensor([11], dtype=torch.int32)
    counts = [complete_blocks(11, hyper.ratio)]
    scores = torch.tensor([[-float("inf"), 1.0, 1.0]])
    stock = _visible_graph(scores, torch.tensor(counts), cells, hyper, 2052,
                           premasked=True, stable_ties=True)
    bypass = _prefill_prefix_visible(counts, cells, hyper, 2052)
    assert torch.equal(stock, bypass)
