"""View one vLLM layer allocation as K8/V4 regions.

vLLM's logical page is ``[block, head, token, 396]`` and is not C-contiguous:
memory order is ``[block, token, head, cell]``. Those bytes are still one
dense span. Kernel pages are that span in address order (64-token
region-major pages), not the logical head/token order. A logical
``.contiguous()`` would permute the bytes and split pages. A gapped,
overlapping, or negatively strided layer is refused.
"""

from __future__ import annotations

import torch

from k8v4_v030.layout import PageLayout, region_view_specs

_FLOAT = "float32"
_BYTE = (torch.uint8, torch.int8)


def _dense_reason(kv_cache: torch.Tensor) -> str:
    return "K8/V4 layer cache is not a dense byte span (shape=%s stride=%s)" % (
        tuple(kv_cache.shape),
        tuple(kv_cache.stride()),
    )


def memory_order_bytes(kv_cache: torch.Tensor) -> torch.Tensor:
    """One int8 vector of ``kv_cache`` in address order. No copy.

    Size-1 dimensions are ignored. Every other stride must be positive and
    must tile the span with no gaps and no overlap. Element 0 is the lowest
    address, so the vector starts at ``storage_offset``.
    """
    if kv_cache.dtype not in _BYTE:
        raise RuntimeError("K8/V4 cache dtype %s is not a byte tensor" % kv_cache.dtype)
    if kv_cache.numel() == 0:
        raise RuntimeError("K8/V4 cache tensor is empty")
    dims = [
        (int(size), int(stride))
        for size, stride in zip(kv_cache.shape, kv_cache.stride())
        if int(size) != 1
    ]
    for _size, stride in dims:
        if stride <= 0:
            raise RuntimeError(_dense_reason(kv_cache))
    covered = 1
    for size, stride in sorted(dims, key=lambda item: item[1]):
        if stride != covered:
            raise RuntimeError(_dense_reason(kv_cache))
        covered *= size
    if covered != int(kv_cache.numel()):
        raise RuntimeError(_dense_reason(kv_cache))
    base = int(kv_cache.storage_offset())
    if base % 4 != 0:
        raise RuntimeError("K8/V4 cache storage is not 4-byte aligned")
    flat = torch.as_strided(
        kv_cache,
        size=(int(kv_cache.numel()),),
        stride=(1,),
        storage_offset=base,
    )
    if flat.dtype == torch.int8:
        return flat
    return flat.view(torch.int8)


def bind_regions(kv_cache: torch.Tensor, layout: PageLayout) -> dict[str, torch.Tensor]:
    """Five region views sharing ``kv_cache`` storage. No copy."""
    # vLLM hands us [block, head, token, cell]; the head dim names the true
    # KV head count. A 4-head cache bound with the 2-head layout would pass
    # the byte-multiple check below and alias garbage.
    if kv_cache.dim() == 4 and kv_cache.shape[1] > 1 and kv_cache.shape[1] != layout.hkv:
        raise RuntimeError(
            "K8/V4 cache has %d KV heads, layout serves %d"
            % (int(kv_cache.shape[1]), layout.hkv)
        )
    raw = memory_order_bytes(kv_cache)
    if raw.numel() % layout.page_bytes != 0:
        raise RuntimeError(
            "K8/V4 cache has %d bytes, not a multiple of the %d-byte page"
            % (raw.numel(), layout.page_bytes)
        )
    num_pages = raw.numel() // layout.page_bytes
    specs = region_view_specs(num_pages, layout)
    base = int(raw.storage_offset())
    uint8 = raw.view(torch.uint8)
    floats = raw.view(torch.float32)
    views: dict[str, torch.Tensor] = {}
    for name, spec in specs.items():
        byte_off = int(spec["byte_offset"])
        if spec["dtype"] == _FLOAT:
            storage = floats
            offset = (base + byte_off) // 4
        elif spec["dtype"] == "uint8":
            storage = uint8
            offset = int(uint8.storage_offset()) + byte_off
        elif spec["dtype"] == "int8":
            storage = raw
            offset = base + byte_off
        else:
            raise RuntimeError("unknown region dtype %s" % spec["dtype"])
        views[name] = torch.as_strided(
            storage,
            size=spec["shape"],
            stride=spec["stride"],
            storage_offset=offset,
        )
    return views
