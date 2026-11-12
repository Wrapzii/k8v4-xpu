"""MLP row choice for the existing W4A8 op. Default off.

``K8V4_OVH_SMALL_M_BAND=1`` sends MLP rows 9 through 16 down the oneDNN
W4A8 path and keeps rows 8 and below on w4a16. Rows above 16 keep today's
cutoff: oneDNN only when the row count is greater than 128. Unset, or any
value other than ``1``, is that cutoff alone.

Attention and Gated DeltaNet projections do not call this. The caller is
the MLP gemm. The decision is a Python comparison on the row count. It does
not read a device tensor.
"""

from __future__ import annotations

import os

ENV_NAME = "K8V4_OVH_SMALL_M_BAND"
CUTOFF = 128
BAND_LO = 9
BAND_HI = 16


def enabled(environ: dict[str, str] | None = None) -> bool:
    """True only for the exact opt-in value ``1``."""
    source = os.environ if environ is None else environ
    return source.get(ENV_NAME) == "1"


def onednn_rows(
    rows: int,
    *,
    band: bool | None = None,
    cutoff: int = CUTOFF,
    environ: dict[str, str] | None = None,
) -> bool:
    """True when this MLP row count should use the W4A8 op.

    ``band`` overrides the environment so a contract test can pass either
    mode without mutating process state. None reads the environment.
    """
    use_band = enabled(environ) if band is None else bool(band)
    if use_band and rows >= BAND_LO and rows <= BAND_HI:
        return True
    return rows > cutoff
