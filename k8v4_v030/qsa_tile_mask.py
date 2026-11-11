"""Opt-in exact-tiled QSA mask state; one instance per request/layer."""
import torch


class TileMask:
    def __init__(self, counts, cells, valid, blocks, device):
        if len(counts) != len(cells):
            raise ValueError("one count and cell per query")
        if valid.ndim != 1 or int(valid.shape[0]) != int(blocks):
            raise ValueError("validity width")
        self.counts = torch.tensor(counts, device=device, dtype=torch.int32)
        self.cells = torch.tensor(cells, device=device, dtype=torch.int32)
        # Keep the reference mask's int64 count conversion (independent of
        # the int32 selector ABI), including behavior outside int32 range.
        self.limits = torch.tensor(list(counts), device=device, dtype=torch.int64)
        columns = torch.arange(int(blocks), device=device)
        valid = valid.to(device=device, dtype=torch.bool)
        # An invalid block must compare >= every representable int64 count.
        self.columns = torch.where(valid, columns, torch.iinfo(torch.int64).max).unsqueeze(0)

    def mask_tile(self, scores, start, end):
        if scores.ndim != 2 or int(scores.shape[0]) != end - start:
            raise ValueError("one complete-block count per query")
        if int(scores.shape[1]) != int(self.columns.shape[1]):
            raise ValueError("validity width")
        mask = self.columns >= self.limits[start:end].unsqueeze(1)
        return scores.masked_fill(mask, float('-inf'))
