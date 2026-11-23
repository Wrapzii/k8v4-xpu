"""Optional sliced host-to-device copies for large weight tables.

``K8V4_UPLOAD_SLICE_MB`` (default 0) leaves every copy exactly as before: one ``copy_``.
Set to a positive size (128 is the tested value) to split copies larger than that into row
slices of at most that many MiB.

Why: on an Arc Pro B70 (xe kernel driver, Level Zero), one host-to-device copy of a few
hundred MiB or more from pageable host memory can stall forever. Loading the Swift checkpoint
on one B70 hung in ``VocabParallelEmbedding.weight_loader`` while copying the 2.5 GB BF16
embedding in a single ``copy_`` (main thread spinning, no progress after 10 minutes). With
128 MiB slices the same load finishes. The bytes that land on the device are identical.
"""

from __future__ import annotations

import os

import torch

ENV = "K8V4_UPLOAD_SLICE_MB"


def slice_mib() -> int:
    """Configured slice size in MiB; 0 (the default) disables slicing."""
    value = os.environ.get(ENV, "0").strip() or "0"
    mib = int(value)
    if mib < 0:
        raise ValueError("%s must be >= 0, got %r" % (ENV, value))
    return mib


def copy_rows(dst: torch.Tensor, src: torch.Tensor) -> torch.Tensor:
    """``dst.copy_(src)``, split along dim 0 when slicing is on and the copy is host-to-device."""
    mib = slice_mib()
    if mib == 0 or src.device.type != "cpu" or dst.device.type == "cpu":
        return dst.copy_(src)
    return copy_in_slices(dst, src, mib)


def copy_in_slices(dst: torch.Tensor, src: torch.Tensor, mib: int) -> torch.Tensor:
    """Copy ``src`` into ``dst`` in dim-0 slices of at most ``mib`` MiB (one copy if it already fits)."""
    nbytes = src.numel() * src.element_size()
    if src.dim() == 0 or src.shape[0] < 2 or nbytes <= (mib << 20):
        return dst.copy_(src)
    if dst.shape[0] != src.shape[0]:
        raise ValueError("row count mismatch: dst %s, src %s" % (tuple(dst.shape), tuple(src.shape)))
    row_bytes = max(1, nbytes // src.shape[0])
    step = max(1, (mib << 20) // row_bytes)
    for row in range(0, src.shape[0], step):
        dst[row:row + step].copy_(src[row:row + step])
    return dst


def to_device(src: torch.Tensor, device: torch.device) -> torch.Tensor:
    """``src.to(device)``, through :func:`copy_rows` when slicing applies."""
    if slice_mib() == 0 or device.type == "cpu" or src.device.type != "cpu":
        return src.to(device)
    return copy_rows(torch.empty(src.shape, dtype=src.dtype, device=device), src)
