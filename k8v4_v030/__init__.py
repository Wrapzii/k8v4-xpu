"""Native INT8-K / INT4-V attention for vLLM 0.30 XPU, TP2 local heads."""

from k8v4_v030.layout import CACHE_DTYPE, HKV, HQ, PAGE, PAGE_BYTES

__all__ = ["CACHE_DTYPE", "HKV", "HQ", "PAGE", "PAGE_BYTES"]
