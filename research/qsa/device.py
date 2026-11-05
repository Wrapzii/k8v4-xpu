"""Device selection for QSA training.

Preference is Intel XPU, then CUDA, then CPU. Training scripts call these
helpers instead of pinning tensors to a CUDA device, so the same code runs
on Arc and NVIDIA GPUs.
"""

from __future__ import annotations

import os
from collections.abc import Mapping

import torch


_DEVICES = ("xpu", "cuda", "cpu")


def _xpu_is_available() -> bool:
    xpu = getattr(torch, "xpu", None)
    if xpu is None:
        return False
    try:
        return bool(xpu.is_available())
    except Exception:
        return False


def _cuda_is_available() -> bool:
    try:
        return bool(torch.cuda.is_available())
    except Exception:
        return False


def resolve_device() -> str:
    """Return ``xpu``, ``cuda``, or ``cpu``.

    ``QSA_DEVICE`` overrides detection when set to one of those three names.
    The override must actually be available (``cpu`` always is).
    """
    forced = os.environ.get("QSA_DEVICE", "").strip().lower()
    if forced:
        if forced not in _DEVICES:
            raise ValueError(
                f"QSA_DEVICE must be one of {_DEVICES}, got {forced!r}"
            )
        if forced == "xpu" and not _xpu_is_available():
            raise RuntimeError("QSA_DEVICE=xpu but torch.xpu.is_available() is false")
        if forced == "cuda" and not _cuda_is_available():
            raise RuntimeError("QSA_DEVICE=cuda but torch.cuda.is_available() is false")
        return forced
    if _xpu_is_available():
        return "xpu"
    if _cuda_is_available():
        return "cuda"
    return "cpu"


def to_device(obj, device: str | torch.device | None = None):
    """Move a tensor, or every tensor in a mapping, onto ``device``.

    Non-tensors are returned unchanged. The default device is
    :func:`resolve_device`.
    """
    if device is None:
        device = resolve_device()
    if torch.is_tensor(obj):
        return obj.to(device)
    if isinstance(obj, Mapping):
        return {key: to_device(value, device) for key, value in obj.items()}
    return obj


def empty_cache() -> None:
    """Release cached blocks on the resolved accelerator. No-op on CPU."""
    device = resolve_device()
    if device == "xpu":
        torch.xpu.empty_cache()
    elif device == "cuda":
        torch.cuda.empty_cache()


def synchronize() -> None:
    """Wait for the resolved accelerator. No-op on CPU."""
    device = resolve_device()
    if device == "xpu":
        torch.xpu.synchronize()
    elif device == "cuda":
        torch.cuda.synchronize()
