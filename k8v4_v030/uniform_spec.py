"""Keep MTP spec-decode steps uniform for the XPU GDN kernel.

The kernel rejects a batch unless

    spec_token == num_spec_decodes * (num_speculative_tokens + 1)

Every spec-decode request must contribute exactly ``1 + k`` query rows.
``Scheduler`` clips a request that has reached ``max_model_len`` (and the
same thing happens when the token budget or mamba alignment clips a
window) and still emits the shortened draft list. On the pooled-int8
ladder that was 2 rows and 1 draft beside a full 7-row request
(total 9, expected 14), and ``gdn_attention`` aborted.

``drop_partial_spec_window`` turns that clipped window into a single real
token and no drafts. The runner marks a row as spec-decode only when
``scheduled == draft_len + 1`` and ``draft_len > 0``, so the short request
stays a normal decode. GDN already runs one-token non-spec rows next to
full spec rows by reclassifying them as prefill.
"""

from __future__ import annotations

import logging

logger = logging.getLogger("k8v4_v030.uniform_spec")

_INSTALLED = False


def scheduled_spec_rows(
    num_new_tokens: int,
    num_computed_tokens: int,
    num_tokens: int,
    num_output_placeholders: int,
) -> int:
    """Draft rows the scheduler would attach for this token count.

    This is the expression in ``Scheduler.schedule`` that slices
    ``request.spec_token_ids``.
    """
    return (
        int(num_new_tokens)
        + int(num_computed_tokens)
        - int(num_tokens)
        - int(num_output_placeholders)
    )


def drop_partial_spec_window(
    *,
    num_spec_tokens: int,
    num_new_tokens: int,
    num_computed_tokens: int,
    num_tokens: int,
    num_output_placeholders: int,
    has_spec_token_ids: bool,
) -> int:
    """Token count to schedule after refusing a short spec window.

    Full windows (``1 + num_spec_tokens``) and prefills (no positive draft
    rows) are unchanged. A window that would have carried some but not all
    drafts keeps one real token when one fits, and otherwise schedules
    nothing. One real token makes ``scheduled_spec_rows`` non-positive, so
    the caller attaches no spec ids.
    """
    if int(num_spec_tokens) <= 0 or not has_spec_token_ids:
        return int(num_new_tokens)
    full = 1 + int(num_spec_tokens)
    new = int(num_new_tokens)
    if new <= 0 or new >= full:
        return new
    if (
        scheduled_spec_rows(
            new,
            num_computed_tokens,
            num_tokens,
            num_output_placeholders,
        )
        <= 0
    ):
        return new
    real_room = (
        int(num_tokens)
        + int(num_output_placeholders)
        - int(num_computed_tokens)
    )
    if real_room >= 1:
        return 1
    return 0


def install() -> bool:
    """Wrap ``Scheduler._reserve_prefill_lookahead`` once.

    That helper is the last adjustment before the running-request loop
    decides the token count is zero, allocates KV, and attaches drafts.
    The new-request path calls it too; a full padded window and a prefill
    chunk do not meet the partial-spec predicate, so they pass through.
    """
    global _INSTALLED
    if _INSTALLED:
        return True
    from vllm.v1.core.sched.scheduler import Scheduler

    current = Scheduler._reserve_prefill_lookahead
    if getattr(current, "_k8v4_uniform_spec", False):
        _INSTALLED = True
        return True

    def _reserve_prefill_lookahead(self, request, num_computed_tokens, num_new_tokens):
        adjusted = current(self, request, num_computed_tokens, num_new_tokens)
        return drop_partial_spec_window(
            num_spec_tokens=int(getattr(self, "num_spec_tokens", 0) or 0),
            num_new_tokens=int(adjusted),
            num_computed_tokens=int(num_computed_tokens),
            num_tokens=int(request.num_tokens),
            num_output_placeholders=int(getattr(request, "num_output_placeholders", 0) or 0),
            has_spec_token_ids=bool(getattr(request, "spec_token_ids", None)),
        )

    _reserve_prefill_lookahead._k8v4_uniform_spec = True
    Scheduler._reserve_prefill_lookahead = _reserve_prefill_lookahead
    _INSTALLED = True
    logger.warning(
        "K8V4 uniform spec window on: partial MTP drafts schedule one real token"
    )
    return True


def install_if_vllm_present() -> bool:
    """Sitecustomize hook. Skip when this interpreter has no vLLM."""
    try:
        import vllm.v1.core.sched.scheduler  # noqa: F401
    except Exception as exc:
        logger.warning("K8V4 uniform spec window not installed: %s", exc)
        return False
    return install()
