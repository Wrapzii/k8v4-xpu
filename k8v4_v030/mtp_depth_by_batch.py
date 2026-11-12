"""Draft depth by batch for MTP. Default off.

``K8V4_MTP_DEPTH_BY_BATCH=1`` selects 6 draft tokens when one request is
running and 3 draft tokens when two or more are running. Unset, or any
value other than ``1``, keeps today's fixed ``num_speculative_tokens``
(6 on the serving launch).

The choice is a Python int. vLLM already stores it as
``num_speculative_tokens_per_batch_size`` and the scheduler copies it to
``num_spec_tokens_to_schedule`` before the proposer runs. The proposer
assigns that int and drafts that many tokens. Nothing here reads a device
tensor.

Steady verify rows with the flag on and a configured depth of 6, one
combined batch (not N separate 7-row decodes):

    1 running -> 7
    2 running -> 8
    3 running -> 12
    4 running -> 16

Those shapes are not a cleared grp3 GPU test. 7-row 1-user grp3 is banned.
8, 12, and 16 are not cleared either. Do not capture or run them until
that shape is explicitly allowed. Rejection sampling stays the standard
sampler; this module does not switch it.
"""

from __future__ import annotations

import os

ENV_NAME = "K8V4_MTP_DEPTH_BY_BATCH"
ALONE_DEPTH = 6
SHARED_DEPTH = 3
# Serving launch uses --max-num-seqs=4. Write every steady verify count.
STEADY_VERIFY_ROWS = {1: 7, 2: 8, 3: 12, 4: 16}
SCHEDULE_MAX_BATCH = 1024

_INSTALLED = False


def enabled(environ: dict[str, str] | None = None) -> bool:
    """True only for the exact opt-in value ``1``."""
    source = os.environ if environ is None else environ
    return source.get(ENV_NAME) == "1"


def draft_depth(
    num_requests: int,
    configured_k: int = ALONE_DEPTH,
    environ: dict[str, str] | None = None,
) -> int:
    """Draft tokens for this step.

    Flag off: ``configured_k`` for every batch (today).
    Flag on: 1 request -> min(configured, 6); 2 or more -> min(configured, 3).
    Zero requests is not a shared step; it keeps the alone depth.
    """
    configured = int(configured_k)
    if not enabled(environ):
        return configured
    if int(num_requests) <= 1:
        return min(configured, ALONE_DEPTH)
    return min(configured, SHARED_DEPTH)


def verify_rows(
    num_requests: int,
    configured_k: int = ALONE_DEPTH,
    environ: dict[str, str] | None = None,
) -> int:
    """Query rows in one combined verify batch: ``n * (1 + k)``."""
    n = int(num_requests)
    if n < 1:
        raise ValueError("num_requests must be >= 1")
    return n * (1 + draft_depth(n, configured_k, environ))


def batch_schedule(
    configured_k: int = ALONE_DEPTH,
    max_batch: int = SCHEDULE_MAX_BATCH,
) -> list[tuple[int, int, int]]:
    """vLLM inclusive ranges ``(start, end, k)``.

    Batch 1 keeps the alone depth. Every larger batch through ``max_batch``
    uses the shared depth. vLLM carries the last k out to its own max.
    """
    if int(max_batch) < 2:
        raise ValueError("max_batch must be >= 2")
    alone = min(int(configured_k), ALONE_DEPTH)
    shared = min(int(configured_k), SHARED_DEPTH)
    return [(1, 1, alone), (2, int(max_batch), shared)]


def merge_capture_sizes(
    sizes: list[int] | tuple[int, ...] | None,
    max_reqs: int = 4,
    configured_k: int = ALONE_DEPTH,
    environ: dict[str, str] | None = None,
) -> list[int]:
    """Union the steady verify rows into the capture list when the flag is on.

    Flag off returns the input unchanged, including its order. Flag on adds
    one combined row count per user count from 1 through ``max_reqs``.
    """
    existing = [int(x) for x in (sizes or [])]
    if not enabled(environ):
        return existing
    merged = set(existing)
    for n in range(1, int(max_reqs) + 1):
        merged.add(verify_rows(n, configured_k, environ))
    return sorted(merged)


def qsa_verify_plan(
    num_requests: int,
    configured_k: int = ALONE_DEPTH,
    environ: dict[str, str] | None = None,
) -> dict[str, int]:
    """One scheduler batch. Shared depth is not N calls of 7 rows.

    ``per_request_rows`` is ``1 + k`` for that step. A shared step with the
    flag on has k=3, so each request is 4 rows and ``seven_row_calls`` is 0.
    """
    n = int(num_requests)
    k = draft_depth(n, configured_k, environ)
    per_request = 1 + k
    seven_row_calls = n if per_request == 7 and n > 1 else 0
    if enabled(environ) and n > 1 and seven_row_calls:
        raise RuntimeError("shared depth must not split into 7-row calls")
    return {
        "batch_calls": 1,
        "query_rows": n * per_request,
        "draft_tokens": k,
        "per_request_rows": per_request,
        "seven_row_calls": seven_row_calls,
    }


def spec_tokens_for_window(
    configured_k: int,
    num_running: int,
    environ: dict[str, str] | None = None,
) -> int:
    """k the uniform-spec window should treat as full. Flag off: configured."""
    configured = int(configured_k)
    if configured <= 0 or not enabled(environ):
        return configured
    return draft_depth(num_running, configured, environ)


def align_scheduled_window(
    *,
    configured_k: int,
    num_running: int,
    num_new_tokens: int,
    num_computed_tokens: int,
    num_tokens: int,
    num_output_placeholders: int,
    has_spec_token_ids: bool,
    environ: dict[str, str] | None = None,
) -> int:
    """Token count after the uniform-spec rule.

    Flag off delegates to ``drop_partial_spec_window`` with the configured
    k, which is today's behaviour. Flag on keeps a window only when it is
    exactly ``1 + k`` for this running count, or when it has no draft tail
    (a prefill chunk). A leftover depth-6 window in a shared step becomes
    one real token so the step does not mix 7-row and 4-row spec decodes.
    """
    from k8v4_v030.uniform_spec import drop_partial_spec_window, scheduled_spec_rows

    if not enabled(environ):
        return drop_partial_spec_window(
            num_spec_tokens=int(configured_k),
            num_new_tokens=int(num_new_tokens),
            num_computed_tokens=int(num_computed_tokens),
            num_tokens=int(num_tokens),
            num_output_placeholders=int(num_output_placeholders),
            has_spec_token_ids=bool(has_spec_token_ids),
        )
    k = spec_tokens_for_window(configured_k, num_running, environ)
    new = int(num_new_tokens)
    if k <= 0 or not has_spec_token_ids:
        return new
    if new == 1 + k:
        return new
    rows = scheduled_spec_rows(
        new,
        num_computed_tokens,
        num_tokens,
        num_output_placeholders,
    )
    if rows <= 0:
        return new
    real_room = (
        int(num_tokens)
        + int(num_output_placeholders)
        - int(num_computed_tokens)
    )
    if real_room >= 1:
        return 1
    return 0


def _assign(spec: object, name: str, value: object) -> None:
    try:
        setattr(spec, name, value)
    except Exception:
        object.__setattr__(spec, name, value)


def apply_schedule(spec: object, environ: dict[str, str] | None = None) -> bool:
    """Fill the vLLM dynamic schedule when the flag is on and the field is empty.

    Does not change ``rejection_sample_method``. An explicit schedule already
    on the config is left alone. Flag off does not write the field.
    """
    if not enabled(environ):
        return False
    current = getattr(spec, "num_speculative_tokens_per_batch_size", None)
    if current:
        return False
    configured = int(getattr(spec, "num_speculative_tokens", ALONE_DEPTH) or ALONE_DEPTH)
    _assign(spec, "num_speculative_tokens_per_batch_size", batch_schedule(configured))
    return True


def install() -> bool:
    """Wrap vLLM init. No-op unless the flag is already set.

    Sitecustomize calls this at process start, before the scheduler exists.
    Unset therefore never patches the scheduler or the capture-size list.
    The scheduler wrapper fills the schedule before vLLM builds its lookup.
    The capture wrapper unions 7, 8, 12, and 16 into an explicit size list.
    """
    global _INSTALLED
    if not enabled():
        return False
    if _INSTALLED:
        return True
    from vllm.config.compilation import CompilationConfig
    from vllm.v1.core.sched.scheduler import Scheduler

    orig_init = Scheduler.__init__
    if not getattr(orig_init, "_k8v4_depth_by_batch", False):

        def _init(self, vllm_config, *args, **kwargs):
            spec = getattr(vllm_config, "speculative_config", None)
            if spec is not None:
                apply_schedule(spec)
            return orig_init(self, vllm_config, *args, **kwargs)

        _init._k8v4_depth_by_batch = True  # type: ignore[attr-defined]
        Scheduler.__init__ = _init  # type: ignore[method-assign]

    orig_sizes = CompilationConfig.post_init_cudagraph_sizes
    if not getattr(orig_sizes, "_k8v4_depth_by_batch", False):

        def _sizes(self, *args, **kwargs):
            sizes = getattr(self, "cudagraph_capture_sizes", None)
            if sizes:
                merged = merge_capture_sizes(list(sizes))
                self.cudagraph_capture_sizes = merged
                current_max = getattr(self, "max_cudagraph_capture_size", None)
                if merged and (current_max is None or int(merged[-1]) > int(current_max)):
                    self.max_cudagraph_capture_size = merged[-1]
            return orig_sizes(self, *args, **kwargs)

        _sizes._k8v4_depth_by_batch = True  # type: ignore[attr-defined]
        CompilationConfig.post_init_cudagraph_sizes = _sizes  # type: ignore[method-assign]

    _INSTALLED = True
    return True


def install_if_vllm_present() -> bool:
    """Sitecustomize hook. Skip when the flag is off or vLLM is absent."""
    if not enabled():
        return False
    try:
        import vllm.config.speculative  # noqa: F401
    except Exception:
        return False
    return install()
