"""Native INT8-K / INT4-V attention for vLLM 0.34 XPU (package name kept from 0.30)."""

from k8v4_v030.layout import CACHE_DTYPE, D, GQA, PAGE, PageLayout

__all__ = ["CACHE_DTYPE", "D", "GQA", "PAGE", "PageLayout"]
