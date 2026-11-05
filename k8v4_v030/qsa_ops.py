"""Device entry points for QSA. Python is the numeric contract.

``XE2_QSA_LIB`` loads ``torch.ops.xe2_qsa`` when the file is present. An
unset variable uses ``libxe2_qsa.so`` under the QSA build directory when
that file exists. CPU tensors, and a missing library, run the same
selection through ``qsa_quant_attn``.
"""

from __future__ import annotations

import os

import torch

from k8v4_v030.qsa_quant_attn import allow_tokens, sparse_from_views

_LOADED: str | None = None
_DEFAULT_LIB = "/mnt/hdd-500gb/model-validation/qsa-k8v4/libxe2_qsa.so"


def library_path() -> str | None:
    raw = os.environ.get("XE2_QSA_LIB", "").strip()
    if raw:
        return raw
    if os.path.isfile(_DEFAULT_LIB):
        return _DEFAULT_LIB
    return None


def ops():
    """Return ``torch.ops.xe2_qsa``, or None when no library is configured."""
    global _LOADED
    path = library_path()
    if path is None:
        return None
    if not os.path.isfile(path):
        raise FileNotFoundError("QSA library is not at %s" % path)
    if _LOADED != path:
        torch.ops.load_library(path)
        _LOADED = path
    return torch.ops.xe2_qsa


def attend_selected(
    query: torch.Tensor,
    views: dict[str, torch.Tensor],
    block_row: torch.Tensor,
    seq_len: int,
    visible: list[list[int]],
    pages_per_block: int,
) -> torch.Tensor:
    """Sparse K8/V4 attention for one request.

    ``query`` is ``[q_len, heads, dim]``. ``visible[q]`` lists token cells.
    The Python path quantizes with ``oracle.quant_k`` after promoting the
    query to fp64, which is exact for fp32 and fp16 values.
    """
    if query.ndim != 3:
        raise ValueError("query is [q_len, heads, dim]")
    if len(visible) != int(query.shape[0]):
        raise ValueError("one visible list per query")
    q_len = int(query.shape[0])
    lists = query.detach().to(dtype=torch.float64).cpu().tolist()
    row = block_row.detach().to(device="cpu")
    out = sparse_from_views(
        lists,
        views,
        row,
        int(seq_len),
        q_len,
        allow_tokens(visible),
        int(pages_per_block),
    )
    return torch.tensor(out, dtype=query.dtype, device=query.device)
