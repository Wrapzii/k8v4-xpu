"""Bucket the QSA decode score width onto a captured graph.

The full decode graph replays kernels and does not re-run this planner.
``_DECODE_BLOCKS`` used to bake 65536 score blocks into every exact MTP
graph, so an 8K step paid for a 262K prefix. Each exact roster is captured
once per bucket. Dispatch selects the narrowest bucket that covers the
live sequences.

128K and 256K blocks are above the 65536-block static score and above the
262144-token model cap, so they are not buckets.
"""

from __future__ import annotations

import contextvars
import logging

from k8v4_v030.qsa_config import RATIO

logger = logging.getLogger("k8v4_v030.qsa_width")

# Score blocks, not tokens. 4096 blocks is 16384 tokens at RATIO 4.
# An 8K ladder stays near 2500 blocks, so it selects 4096.
# 2048 blocks is one step of an 8192-token prompt, then the next token
# needs 2049. That bucket is not captured.
# 8192 blocks is 32768 tokens. Contexts past 16384 tokens use it.
# 32768 blocks is exactly 131072 tokens. The next token needs 32769
# blocks and would select 65536, so a 131K window would not sit there.
# 40960 blocks covers through 163840 tokens.
BUCKETS = (4096, 8192, 40960, 65536)

_RUNNER = contextvars.ContextVar("k8v4_qsa_width_runner", default=None)
_SCHED = contextvars.ContextVar("k8v4_qsa_width_sched", default=None)
_DUMMY = contextvars.ContextVar("k8v4_qsa_width_dummy", default=(False, 0))
_ACTIVE = contextvars.ContextVar("k8v4_qsa_width_active", default=0)
_INSTALLED = False
_LAST_LOGGED = 0
_LAST_TOKEN_LOG = -1
_PUBLISHED_TOKENS = 0


def published_tokens() -> int:
    """Tokens seen by the most recent publish_active_width call."""
    return int(_PUBLISHED_TOKENS)


def buckets() -> tuple[int, ...]:
    """Capture widths. ``K8V4_QSA_WIDTH_BUCKETS`` overrides the default list."""
    import os

    raw = os.environ.get("K8V4_QSA_WIDTH_BUCKETS", "").strip()
    if not raw:
        return BUCKETS
    values = tuple(int(part) for part in raw.split(",") if part.strip())
    if not values or any(v < 1 or v > BUCKETS[-1] for v in values):
        raise ValueError("K8V4_QSA_WIDTH_BUCKETS must be 1..%d" % BUCKETS[-1])
    return tuple(sorted(set(values)))


def blocks_needed(tokens: int) -> int:
    """Indexer blocks that cover ``tokens`` (one block is ``RATIO`` tokens)."""
    tokens = int(tokens)
    if tokens < 1:
        return 0
    return (tokens + RATIO - 1) // RATIO


def bucket_for_blocks(blocks: int) -> int:
    """Smallest adequate bucket, or the required width if none is adequate."""
    needed = int(blocks)
    if needed < 1:
        return buckets()[0]
    for width in buckets():
        if needed <= width:
            return width
    # Preserve overflow as a positive requirement, not unknown or a clamp.
    return needed


def width_matches(have: int, want: int, widest: int) -> bool:
    """True when this captured graph is the one dispatch should replay.

    ``want`` 0 means the live length is not known yet (capture warmup).
    Only the widest graph is safe then. A positive ``want`` must match.
    """
    have = int(have)
    want = int(want)
    if want > 0:
        return have == want
    return have == 0 or have == int(widest)


def active_width_blocks() -> int:
    """Bucket chosen for the execute call that is on the stack, or 0."""
    return int(_ACTIVE.get() or 0)


def _call_flags(args, kwargs) -> tuple[bool, int]:
    """Read dummy_run and context_len from GPUModelRunner.execute_model."""
    dummy = kwargs.get("dummy_run", False)
    context_len = kwargs.get("context_len", 0)
    if len(args) >= 2:
        dummy = args[1]
    if len(args) >= 5:
        context_len = args[4]
    return bool(dummy), int(context_len or 0)


def _live_tokens(runner, scheduler_output) -> int:
    """Upper bound on sequence length for the requests scheduled this step.

    ``update_requests`` has already stored this step's computed count.
    Adding the scheduled rows matches the runner's seq_lens CPU upper bound.
    """
    scheduled = getattr(scheduler_output, "num_scheduled_tokens", None) or {}
    states = getattr(runner, "req_states", None)
    if states is None or not scheduled:
        return 0
    index = getattr(states, "req_id_to_index", {}) or {}
    counts = getattr(states, "num_computed_tokens_np", None)
    best = 0
    for req_id, n_sched in scheduled.items():
        computed = 0
        idx = index.get(req_id)
        if counts is not None and idx is not None:
            computed = int(counts[idx])
        best = max(best, computed + int(n_sched))
    return best


def publish_active_width() -> int:
    """Set the bucket from the runner stashed around execute_model.

    Called from cudagraph dispatch, which runs after ``update_requests``
    and before the forward. Zero leaves dispatch on the widest graph.
    """
    global _LAST_LOGGED, _LAST_TOKEN_LOG, _PUBLISHED_TOKENS
    runner = _RUNNER.get()
    sched = _SCHED.get()
    dummy, context_len = _DUMMY.get()
    if runner is None or sched is None:
        _ACTIVE.set(0)
        _PUBLISHED_TOKENS = 0
        return 0
    tokens = int(context_len or 0) if dummy else _live_tokens(runner, sched)
    _PUBLISHED_TOKENS = int(tokens)
    if tokens < 1:
        _ACTIVE.set(0)
        return 0
    width = bucket_for_blocks(blocks_needed(tokens))
    previous = int(_ACTIVE.get() or 0)
    _ACTIVE.set(width)
    moved = tokens >= 4096 and (
        _LAST_TOKEN_LOG < 0 or abs(tokens - _LAST_TOKEN_LOG) >= 4096
    )
    changed = width != previous and width != _LAST_LOGGED
    if changed:
        _LAST_LOGGED = width
    if moved:
        _LAST_TOKEN_LOG = tokens
    if changed or moved:
        print(
            "QSA_WIDTH_BUCKET tokens=%d blocks=%d width=%d"
            % (tokens, blocks_needed(tokens), width),
            flush=True,
        )
    return width


def install() -> bool:
    """Wrap execute_model so dispatch can see this step's sequence lengths."""
    global _INSTALLED
    if _INSTALLED:
        return True
    from vllm.v1.worker.gpu.model_runner import GPUModelRunner

    current = GPUModelRunner.execute_model
    if getattr(current, "_k8v4_qsa_width", False):
        _INSTALLED = True
        return True

    def execute_model(self, scheduler_output, *args, **kwargs):
        dummy, context_len = _call_flags(args, kwargs)
        token_runner = _RUNNER.set(self)
        token_sched = _SCHED.set(scheduler_output)
        token_dummy = _DUMMY.set((dummy, context_len))
        try:
            return current(self, scheduler_output, *args, **kwargs)
        finally:
            _RUNNER.reset(token_runner)
            _SCHED.reset(token_sched)
            _DUMMY.reset(token_dummy)
            _ACTIVE.set(0)

    execute_model._k8v4_qsa_width = True
    GPUModelRunner.execute_model = execute_model
    _INSTALLED = True
    print("QSA width hook on buckets=%s" % (buckets(),), flush=True)
    return True


def install_if_vllm_present() -> bool:
    """Sitecustomize hook. The API process may not import the runner."""
    try:
        import vllm.v1.worker.gpu.model_runner  # noqa: F401
    except Exception as exc:
        logger.warning("QSA width hook not installed: %s", exc)
        return False
    return install()
