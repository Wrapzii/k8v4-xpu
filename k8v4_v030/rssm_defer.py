"""Optional SLM-staged RecoverSSM verify (K8V4_RSSM_VERIFY=slm) and deferred RecoverSSM commit (K8V4_RSSM_DEFER_COMMIT=1)
for the GDN layers, both under K8V4_GDN_RECOVERSSM=1.

Measured reason (one B70, Qwen3.8-27B GDN shapes, fp16 state, 48 layers; docs/2026-11-20-rssm-verify.md): at 4 x 63K
the GDN RecoverSSM path costs about 2.7 ms per decode step (verify 1.5, commit 1.2), and the commit after sampling
reads and writes every request's state once more after the verify has just read it. Deferring that fold into the next
verify takes 0.54 ms off verify + commit (2.73 -> 2.19 ms, kernel bench) and 0.5 ms off the served 4-user step
(54.7 -> 54.2 ms); staging the verify's inputs in SLM takes 6% off the verify kernel (13% at one request).

- K8V4_RSSM_VERIFY=slm: torch.ops._k8v4_rssm.verify_slm (native/rssm/rssm_verify_slm.hpp) stages the window's
  normalised q / k, values, beta and decay in SLM before the recurrence. Bit-identical outputs and replay records.
- K8V4_RSSM_DEFER_COMMIT=1 (uses the same kernel): the commit no longer folds a window that stays in its state block;
  it leaves the accepted count in ``pending[slot]`` and the next verify of that request folds those records into the
  state it loads anyway, writes the state once and verifies from it (vLLM PR 66595's deferred commit for KDA, here
  for GDN). The replay buffer gets two halves per request slot (``parity[slot]`` is the half a step writes; the plan
  kernel flips it after each commit). Windows that cross or end on a block boundary in align mode (prefix caching)
  commit at once as before, so every block the prefix cache can hand out holds its exact state. A request slot that
  runs a prefill gets its pending count cleared (a new request may reuse a finished request's slot). Bit-identical
  to commit-then-verify: the fold is the commit kernel's own update and rounding.
"""

from __future__ import annotations

import os
from dataclasses import dataclass

VERIFY_ENV = 'K8V4_RSSM_VERIFY'
DEFER_ENV = 'K8V4_RSSM_DEFER_COMMIT'
VERIFY_VALUES = ('', 'stock', 'slm')
MAX_WINDOW = 16  # the SLM kernel's window bound (num_speculative_tokens + 1; 16 = deep drafting at depth 15)


def verify_mode() -> str:
    value = os.environ.get(VERIFY_ENV, '')
    if value not in VERIFY_VALUES:
        raise ValueError('%s must be stock or slm, got %r' % (VERIFY_ENV, value))
    return value or 'stock'


def defer_enabled() -> bool:
    value = os.environ.get(DEFER_ENV, '')
    if value not in ('', '0', '1'):
        raise ValueError('%s must be 0 or 1, got %r' % (DEFER_ENV, value))
    return value == '1'


def check_window(num_spec: int) -> None:
    """The SLM kernel and the deferred commit take windows of at most MAX_WINDOW tokens."""
    if (verify_mode() != 'stock' or defer_enabled()) and num_spec + 1 > MAX_WINDOW:
        raise ValueError('%s / %s take at most %d speculative tokens per window, got %d'
                         % (VERIFY_ENV, DEFER_ENV, MAX_WINDOW - 1, num_spec))


def replay_rows(max_num_seqs: int) -> int:
    """Rows of a layer's replay buffer: one per request slot, two (one per parity half) with the deferred commit."""
    return 2 * max_num_seqs if defer_enabled() else max_num_seqs


try:  # the knob helpers stay importable without vLLM (CPU contract tests)
    from vllm.triton_utils import tl, triton
except ImportError:  # pragma: no cover
    tl = triton = None

if triton is not None:
    @triton.jit
    def _defer_plan_kernel(
        state_indices_ptr,
        record_indices_ptr,
        commit_lens_ptr,
        final_state_indices_ptr,
        boundary_state_indices_ptr,
        pending_ptr,
        parity_ptr,
        fold_lens_ptr,
        fold_rows_ptr,
        null_block_id,
        slot_rows,
        stride_si,
        stride_ri,
    ):
        # After prepare_commit_plan_kernel: per window, fold now (crossing or boundary-ending window, align mode) or leave
        # its accepted records pending for the next verify of the slot. Flips the slot's replay half either way.
        i = tl.program_id(0)
        src = tl.load(state_indices_ptr + i * stride_si).to(tl.int64)
        if src <= null_block_id:
            tl.store(fold_lens_ptr + i, 0)
            tl.store(fold_rows_ptr + i, 0)
            return
        slot = tl.load(record_indices_ptr + i * stride_ri)
        n = tl.load(commit_lens_ptr + i)
        final = tl.load(final_state_indices_ptr + i).to(tl.int64)
        bnd = tl.load(boundary_state_indices_ptr + i).to(tl.int64)
        p = tl.load(parity_ptr + slot)
        defer = (n > 0) & (final == src) & (bnd <= null_block_id)
        tl.store(fold_rows_ptr + i, p * slot_rows + slot)
        tl.store(fold_lens_ptr + i, tl.where(defer, 0, n))
        tl.store(pending_ptr + slot, tl.where(defer, n, 0))
        tl.store(parity_ptr + slot, 1 - p)


@dataclass
class DeferState:
    pending: 'torch.Tensor'  # int32 [slots]: accepted records not yet folded into the slot's state block
    parity: 'torch.Tensor'  # int32 [slots]: replay half the next verify of the slot writes
    fold_lens: 'torch.Tensor'  # int32 [max_reqs]: per window, tokens the commit folds now (0 = deferred)
    fold_rows: 'torch.Tensor'  # int32 [max_reqs]: per window, replay row its verify wrote
    clear_slots: 'torch.Tensor'  # int64 [slots]: staging for the prefill-slot clear

    @classmethod
    def create(cls, slots: int, device) -> 'DeferState':
        import torch

        z = lambda dtype=torch.int32: torch.zeros(slots, dtype=dtype, device=device)
        return cls(z(), z(), z(), z(), z(torch.int64))


def attach(ctx, slots: int) -> None:
    """Give a GDNRecoverSSMCommitContext the deferred-commit state (replay rows must be 2 x slots)."""
    rows = ctx.replays[0].shape[0]
    if rows != 2 * slots:
        raise ValueError('%s=1 needs replay buffers of %d rows, found %d' % (DEFER_ENV, 2 * slots, rows))
    ctx.k8v4_defer = DeferState.create(slots, ctx.checkpoints[0].device)


def clear_slots(ctx, slots) -> None:
    """Drop the pending records of these request slots (they run a prefill: new or recomputed requests)."""
    d = getattr(ctx, 'k8v4_defer', None)
    if d is None or len(slots) == 0:
        return
    import numpy as np
    from vllm.utils.torch_utils import async_tensor_h2d

    n = len(slots)
    buf = d.clear_slots[:n]
    async_tensor_h2d(np.asarray(slots, dtype=np.int64), out=buf)
    d.pending.index_fill_(0, buf, 0)


def commit(ctx, num_accepted_tokens, state_indices, query_start_loc, request_indices=None, block_table=None,
           num_computed_tokens=None, mamba_block_size=None, commit_conv=True, record_indices=None) -> None:
    """GDNRecoverSSMCommitContext.commit with the deferred state fold (same arguments; record_indices = slots)."""
    from k8v4_v030.rssm_gdn import NULL_BLOCK_ID, _commit_gdn_state_kernel
    from k8v4_v030.rssm_kernels import compact_conv_state_kernel, prepare_commit_plan_kernel

    d = ctx.k8v4_defer
    batch = state_indices.shape[0]
    if batch == 0:
        return
    if record_indices is None or record_indices.ndim != 1 or record_indices.shape[0] < batch:
        raise ValueError('%s=1: the commit needs one record row (request slot) per window' % DEFER_ENV)
    if batch > ctx.commit_lens.shape[0] or query_start_loc.shape[0] != batch + 1:
        raise ValueError('%s=1: commit metadata is incompatible' % DEFER_ENV)
    align = (block_table, num_computed_tokens, mamba_block_size)
    if not (all(x is None for x in align) or all(x is not None for x in align)):
        raise ValueError('%s=1: align metadata is incomplete' % DEFER_ENV)
    bt_stride = (0, 0) if block_table is None else block_table.stride()
    prepare_commit_plan_kernel[(batch,)](
        num_accepted_tokens, request_indices, state_indices, query_start_loc, block_table, num_computed_tokens,
        ctx.commit_lens, ctx.final_state_indices, ctx.boundary_state_indices, ctx.boundary_recovery_lens,
        NULL_BLOCK_ID, mamba_block_size or 1, block_table.shape[1] if block_table is not None else 1,
        num_accepted_tokens.stride(0), request_indices.stride(0) if request_indices is not None else 0,
        state_indices.stride(0), query_start_loc.stride(0), bt_stride[0], bt_stride[1],
        0 if num_computed_tokens is None else num_computed_tokens.stride(0),
        SPEC_QUERY_LEN=ctx.spec_query_len, num_warps=1)
    _defer_plan_kernel[(batch,)](
        state_indices, record_indices, ctx.commit_lens, ctx.final_state_indices, ctx.boundary_state_indices,
        d.pending, d.parity, d.fold_lens, d.fold_rows, NULL_BLOCK_ID, d.pending.shape[0], state_indices.stride(0),
        record_indices.stride(0), num_warps=1)
    num_layers = len(ctx.checkpoints)
    if commit_conv:
        conv_ref = ctx.conv_states[0]
        conv_dim = conv_ref.shape[1]
        compact_conv_state_kernel[(triton.cdiv(conv_dim, 256), batch, num_layers)](
            conv_ref, ctx.conv_state_base_addrs, ctx.conv_state_block_strides, ctx.conv_state_dim_strides,
            ctx.conv_state_token_strides, state_indices, ctx.commit_lens, ctx.final_state_indices,
            ctx.boundary_state_indices, ctx.boundary_recovery_lens, NULL_BLOCK_ID, conv_dim, ctx.conv_history_len,
            state_indices.stride(0), BLOCK_D=256, BLOCK_HISTORY=triton.next_power_of_2(ctx.conv_history_len),
            ALIGN_MODE=block_table is not None, num_warps=4)
    ref = ctx.checkpoints[0]
    _, HV, V, K = ref.shape
    rr = ctx.replays[0]
    args = (ref, ctx.state_base_addrs, ctx.state_block_strides, rr, ctx.replay_base_addrs, ctx.replay_block_strides,
            state_indices, d.fold_rows, d.fold_lens, ctx.final_state_indices, ctx.boundary_state_indices,
            ctx.boundary_recovery_lens, NULL_BLOCK_ID, ref.stride(1), ref.stride(2), ref.stride(3), rr.stride(1),
            rr.stride(2), rr.stride(3), state_indices.stride(0), d.fold_rows.stride(0))
    grid = (triton.cdiv(V, min(triton.next_power_of_2(V), 16)), batch, num_layers * HV)
    for boundary in (False, True) if block_table is not None else (False,):
        _commit_gdn_state_kernel[grid](
            *args, K=K, V=V, BK=triton.next_power_of_2(K), BV=min(triton.next_power_of_2(V), 16), NUM_HEADS=HV,
            BOUNDARY=boundary, num_warps=4, num_stages=2)


__all__ = ['DEFER_ENV', 'VERIFY_ENV', 'attach', 'check_window', 'clear_slots', 'commit', 'defer_enabled',
           'replay_rows', 'verify_mode']
