"""QSA constants and the default-off switch.

Importing this module does not allocate a cache and does not change the
dense K8/V4 page layout. ``K8V4_QSA`` is read on each call.
"""

from __future__ import annotations

import os

HIDDEN = 5120
IDX_HEADS = 4
IDX_DIM = 128
RATIO = 4
TOP_TOKENS = 2048
RMS_EPS = 1e-6
N_ROT = 64
SECTIONS = (11, 11, 10, 0)
ROPE_THETA = 10_000_000.0
N_LAYERS = 64
FULL_ATTN_INTERVAL = 4
# Main attention head dim is 256, so 1/sqrt(256) is exactly 1/16.
INV_SQRT_ATTN = 1.0 / 16.0

PARAMS_PER_LAYER = IDX_HEADS * IDX_DIM * HIDDEN + IDX_DIM * HIDDEN + 3 * IDX_DIM
N_FULL_LAYERS = N_LAYERS // FULL_ATTN_INTERVAL
PARAMS_TOTAL = PARAMS_PER_LAYER * N_FULL_LAYERS


def qsa_enabled() -> bool:
    """True only when the process asked for QSA. The default is dense K8/V4."""
    return os.environ.get("K8V4_QSA", "0") == "1"


def qsa_force_all() -> bool:
    """Attend every causal block. Used to prove the sparse kernel matches dense."""
    return os.environ.get("K8V4_QSA_FORCE_ALL", "0") == "1"


def qsa_eager() -> bool:
    """Run QSA outside an XPU graph.

    Full decode graphs replay the captured kernels and do not re-enter this
    planner. ``K8V4_QSA_EAGER=1`` is read by the attention builder, which
    then reports no cudagraph support so vLLM leaves that step eager.
    """
    return os.environ.get("K8V4_QSA_EAGER", "0") == "1"


def top_tokens() -> int:
    """Token budget. ``K8V4_QSA_TOP_TOKENS`` overrides the 2048 default in tests."""
    raw = os.environ.get("K8V4_QSA_TOP_TOKENS", "").strip()
    if not raw:
        return TOP_TOKENS
    value = int(raw)
    if value < RATIO or value % RATIO != 0:
        raise ValueError("K8V4_QSA_TOP_TOKENS must be a positive multiple of %d" % RATIO)
    return value


def is_full_attention_layer(
    layer_idx: int,
    interval: int = FULL_ATTN_INTERVAL,
    n_layers: int = N_LAYERS,
) -> bool:
    """Qwen3.8 full attention is every ``interval``th layer, 1-based."""
    layer_idx = int(layer_idx)
    if layer_idx < 0 or layer_idx >= int(n_layers):
        return False
    return (layer_idx + 1) % int(interval) == 0


def full_attention_layers(
    interval: int = FULL_ATTN_INTERVAL,
    n_layers: int = N_LAYERS,
) -> tuple[int, ...]:
    return tuple(i for i in range(int(n_layers)) if is_full_attention_layer(i, interval, n_layers))


def weights_path() -> str | None:
    raw = os.environ.get("K8V4_QSA_WEIGHTS", "").strip()
    return raw or None


def pooled_key_dtype() -> str:
    """Storage of indexer pooled keys. Default ``fp32`` matches today's bytes.

    ``K8V4_QSA_POOLED_KEY_DTYPE`` unset, empty, ``fp32``, or ``float32``
    keeps FP32 pooled keys. ``int8`` or ``i8`` selects per-row symmetric
    INT8 plus one FP32 scale per row. Any other value is an error.
    """
    raw = os.environ.get("K8V4_QSA_POOLED_KEY_DTYPE")
    if raw is None:
        return "fp32"
    key = raw.strip()
    if key in ("", "fp32", "float32"):
        return "fp32"
    if key in ("int8", "i8"):
        return "int8"
    raise ValueError(
        "K8V4_QSA_POOLED_KEY_DTYPE must be unset, empty, fp32, float32, int8, or i8 (got %r)"
        % (raw,)
    )
