"""Load the K8/V4 SYCL library once per process."""

from __future__ import annotations

import os

_LOADED: str | None = None


def library_path() -> str:
    return os.environ.get("XE2_KV_LIB", "/opt/k8v4/libxe2_kv.so")


def ops():
    """Return ``torch.ops.xe2_kv`` after loading ``XE2_KV_LIB``."""
    global _LOADED
    import torch

    path = library_path()
    if _LOADED != path:
        if not os.path.isfile(path):
            raise FileNotFoundError("K8/V4 library is not at %s" % path)
        torch.ops.load_library(path)
        _LOADED = path
    return torch.ops.xe2_kv
