"""Streaming token blocks for distillation and evaluation."""

from __future__ import annotations

import itertools
from collections.abc import Iterator

import torch


def iter_token_blocks(
    tokenizer,
    seq_len: int,
    n_blocks: int,
    dataset: str = "HuggingFaceFW/fineweb-edu",
    subset: str = "sample-10BT",
    split: str = "train",
    text_key: str = "text",
    skip_docs: int = 0,
    revision: str | None = None,
) -> Iterator[torch.Tensor]:
    """Yield ``n_blocks`` contiguous ``seq_len``-token chunks of streamed text.

    Documents are concatenated with an EOS token between them; the token stream
    is cut into equal blocks, so a block may span documents.
    """
    from datasets import load_dataset

    ds = load_dataset(dataset, subset, split=split, streaming=True,
                      revision=revision)
    if skip_docs:
        ds = ds.skip(skip_docs)

    eos = tokenizer.eos_token_id
    buffer: list[int] = []
    produced = 0
    for example in ds:
        ids = tokenizer(example[text_key], add_special_tokens=False)["input_ids"]
        buffer.extend(ids)
        buffer.append(eos)
        while len(buffer) >= seq_len and produced < n_blocks:
            yield torch.tensor(buffer[:seq_len], dtype=torch.long)
            del buffer[:seq_len]
            produced += 1
        if produced >= n_blocks:
            return
