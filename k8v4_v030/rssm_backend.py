# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: Copyright contributors to the vLLM project
"""GDN attention metadata for RecoverSSM speculative decode (Qwen-style Gated DeltaNet).

Wraps the generic GDN builder: every active decode row runs through the spec path (a
draft-less step is a T=1 window), the spec state indices keep only the checkpoint
column, num_accepted_tokens is always 1 (the checkpoint and the compacted conv window
already hold the accepted state), and the metadata carries what the post-sampling commit
needs. Mirrors the Kimi-K3 KDA builder's RecoverSSM handling.

The verify writes each window's replay record to the layer's per-request-slot buffer
(``QwenGatedDeltaNetAttention.recoverssm_replay``) at the request's persistent slot
(``req_idx``), and the commit reads it from there.

Carried from the vLLM RecoverSSM GDN port (vllm/v1/attention/backends/gdn_recoverssm.py and the two row helpers
of recoverssm_metadata.py); k8v4_v030/gdn_recoverssm.py selects it for the GDN layers under K8V4_GDN_RECOVERSSM."""

from dataclasses import dataclass, field, fields
from typing import Any

import torch

from vllm.logger import init_logger
from vllm.v1.attention.backend import AttentionCGSupport, CommonAttentionMetadata
from vllm.v1.attention.backends.gdn_attn import (
    GDNAttentionBackend,
    GDNAttentionMetadata,
    GDNAttentionMetadataBuilder,
)
from vllm.v1.attention.backends.recoverssm_metadata import (
    RecoverSSMMetadata,
    RecoverSSMPostprocessMetadata,
)
from vllm.v1.utils import CpuGpuBuffer

logger = init_logger(__name__)


def recoverssm_spec_rows(
    is_prefilling_cpu: torch.Tensor,
    query_start_loc_cpu: torch.Tensor,
    num_decode_draft_tokens_cpu: torch.Tensor,
    num_reqs: int,
) -> tuple[torch.Tensor, torch.Tensor]:
    """Which batch rows take the RecoverSSM spec path.

    Every active decode row does (a draft-less step is a window of one token), plus
    every row that has drafts. Only the first ``num_reqs`` rows are real; padding rows
    never take the spec path. Returns the draft-count vector to hand to the base builder
    (1 for spec rows, -1 otherwise, padding included) and the spec rows in batch order,
    which is also the order of the base builder's spec state indices."""
    query_lens = query_start_loc_cpu[: num_reqs + 1].diff()
    active_decode = (~is_prefilling_cpu[:num_reqs]) & (query_lens > 0)
    spec_mask = (num_decode_draft_tokens_cpu[:num_reqs] >= 0) | active_decode
    drafts = torch.full_like(num_decode_draft_tokens_cpu, -1)
    drafts[:num_reqs] = torch.where(spec_mask, 1, -1).to(drafts.dtype)
    return drafts, spec_mask.nonzero().flatten()


def recoverssm_request_indices(
    rows: torch.Tensor, num_spec_decodes: int, device: torch.device
) -> torch.Tensor | None:
    """None when the spec rows are exactly 0..n-1, else their batch rows (the commit
    plan's request mapping). Raises if the base builder counted a different number of
    spec rows than the classification above."""
    if rows.numel() != num_spec_decodes:
        raise ValueError(
            f"RecoverSSM: {rows.numel()} spec rows classified, but the builder "
            f"produced {num_spec_decodes}"
        )
    if num_spec_decodes == 0 or int(rows[-1]) == num_spec_decodes - 1:
        return None
    return rows.to(torch.int32).to(device, non_blocking=True)


@dataclass
class GDNRecoverSSMCommitMetadata:
    state_indices: torch.Tensor  # [num_spec_decodes, 1]
    query_start_loc: torch.Tensor  # [num_spec_decodes + 1]
    request_indices: (
        torch.Tensor | None
    )  # batch rows of the spec requests (None: rows 0..n-1)
    record_indices: torch.Tensor  # [>= num_spec_decodes] replay rows (request slots)
    block_table: torch.Tensor | None  # align mode
    num_computed_tokens: torch.Tensor | None
    block_size: int | None


@dataclass
class GDNRecoverSSMMetadata(GDNAttentionMetadata, RecoverSSMMetadata):
    recoverssm_commit: GDNRecoverSSMCommitMetadata | None = None
    recoverssm_context: Any = field(default=None, repr=False, compare=False)
    # replay-buffer row per spec window (its request slot), padded like the state
    # indices
    recoverssm_record_indices: torch.Tensor | None = None

    def commit_recoverssm_state(
        self, num_accepted_tokens: torch.Tensor
    ) -> RecoverSSMPostprocessMetadata | None:
        c = self.recoverssm_commit
        if c is None:
            return None
        n = self.num_spec_decodes
        commit = self.recoverssm_context.commit
        if getattr(self.recoverssm_context, "k8v4_defer", None) is not None:
            from k8v4_v030 import rssm_defer

            commit = lambda *a, **kw: rssm_defer.commit(self.recoverssm_context, *a, **kw)  # noqa: E731
        commit(
            num_accepted_tokens,
            c.state_indices[:n, 0],
            c.query_start_loc[: n + 1],
            request_indices=c.request_indices,
            block_table=c.block_table,
            num_computed_tokens=c.num_computed_tokens,
            mamba_block_size=c.block_size,
            record_indices=c.record_indices,
        )
        if c.block_table is None:
            return None
        assert c.block_size is not None and c.num_computed_tokens is not None
        return RecoverSSMPostprocessMetadata(
            num_spec_decodes=n,
            request_indices=c.request_indices,
            block_table=c.block_table,
            num_computed_tokens=c.num_computed_tokens,
            block_size=c.block_size,
        )


class GDNRecoverSSMMetadataBuilder(GDNAttentionMetadataBuilder):
    # Uniform spec-decode batches replay as FULL graphs: the base builder stages the
    # state indices, query offsets and accepted counts into persistent buffers and pads
    # the batch with null-state, zero-length rows, which the verify kernel skips. The
    # commit runs after sampling, outside the graph, on the staged tensors.
    _cudagraph_support = AttentionCGSupport.UNIFORM_BATCH

    def __init__(self, kv_cache_spec, layer_names, vllm_config, device) -> None:
        super().__init__(kv_cache_spec, layer_names, vllm_config, device)
        max_reqs = vllm_config.scheduler_config.max_num_seqs
        self._ones = torch.ones(max_reqs, dtype=torch.int32, device=device)
        # Persistent so FULL CUDA graphs replay the verify with this step's rows.
        self._record_indices = CpuGpuBuffer(max_reqs, dtype=torch.int32, device=device)
        self._context: Any = None
        self._logged = False
        self._capturing = False
        from k8v4_v030 import rssm_defer

        self._defer = rssm_defer.defer_enabled()

    def _get_context(self):
        if self._context is None:
            from k8v4_v030.rssm_gdn import GDNRecoverSSMCommitContext

            fc = self.vllm_config.compilation_config.static_forward_context
            layers = [fc[name] for name in self.layer_names]
            self._context = GDNRecoverSSMCommitContext.create(
                layers,
                spec_query_len=1 + self.num_spec,
                max_num_reqs=self.vllm_config.scheduler_config.max_num_seqs,
            )
            if self._defer:
                from k8v4_v030 import rssm_defer

                rssm_defer.attach(self._context, self.vllm_config.scheduler_config.max_num_seqs)
                logger.info("GDN RecoverSSM deferred commit (K8V4_RSSM_DEFER_COMMIT=1)")
            logger.info(
                "GDN RecoverSSM commit context: %d layers, spec_query_len %d",
                len(layers),
                1 + self.num_spec,
            )
        return self._context

    def build(  # type: ignore[override]
        self,
        common_prefix_len: int,
        common_attn_metadata: CommonAttentionMetadata,
        num_accepted_tokens: torch.Tensor | None = None,
        num_decode_draft_tokens_cpu: torch.Tensor | None = None,
        fast_build: bool = False,
    ) -> "GDNRecoverSSMMetadata":
        m = common_attn_metadata
        rows = None
        if self.use_spec_decode and num_decode_draft_tokens_cpu is not None:
            if self._capturing and m.is_prefilling is None:
                # CUDA graph capture: dummy decode batches, every row a spec window.
                m = m.replace(is_prefilling=torch.zeros(m.num_reqs, dtype=torch.bool))
            if m.is_prefilling is None or m.is_prefilling.device.type != "cpu":
                raise ValueError("GDN RecoverSSM needs the CPU is_prefilling mask")
            # Positive counts only defeat the base builder's "no drafts -> regular
            # decode" shortcut: RecoverSSM keeps every post-prefill row on the spec path
            # (extended conv window).
            num_decode_draft_tokens_cpu, rows = recoverssm_spec_rows(
                m.is_prefilling,
                m.query_start_loc_cpu,
                num_decode_draft_tokens_cpu,
                m.num_reqs,
            )
        meta = super().build(
            common_prefix_len,
            m,
            num_accepted_tokens=num_accepted_tokens,
            num_decode_draft_tokens_cpu=num_decode_draft_tokens_cpu,
            fast_build=fast_build,
        )
        if self._defer:
            if m.req_idx is None and meta.num_spec_decodes > 0 and not self._capturing:
                raise ValueError(
                    "K8V4_RSSM_DEFER_COMMIT=1 needs the request slots in the attention metadata "
                    "(tools/patch_rssm_defer_v030.py)"
                )
            self._clear_prefill_slots(m, rows)
        base = {f.name: getattr(meta, f.name) for f in fields(meta)}
        commit = None
        if meta.num_spec_decodes > 0:
            n = meta.num_spec_decodes
            assert meta.spec_state_indices_tensor is not None
            base["spec_state_indices_tensor"] = meta.spec_state_indices_tensor[:, :1]
            # One accepted token per row: the checkpoint already holds the accepted
            # state. Sized like the (possibly graph-padded) state indices.
            base["num_accepted_tokens"] = self._ones[
                : base["spec_state_indices_tensor"].shape[0]
            ]
            if rows is None:
                raise ValueError("GDN RecoverSSM: spec rows without draft counts")
            request_indices = recoverssm_request_indices(
                rows, n, m.query_start_loc.device
            )
            record_indices = self._stage_record_indices(
                m, rows, base["spec_state_indices_tensor"].shape[0]
            )
            align = self.vllm_config.cache_config.mamba_cache_mode == "align"
            commit = GDNRecoverSSMCommitMetadata(
                state_indices=base["spec_state_indices_tensor"],
                query_start_loc=meta.spec_query_start_loc,
                request_indices=request_indices,
                record_indices=record_indices,
                block_table=m.block_table_tensor if align else None,
                num_computed_tokens=m.compute_num_computed_tokens() if align else None,
                block_size=self.kv_cache_spec.block_size if align else None,
            )
            if not self._logged:
                self._logged = True
                logger.info(
                    "GDN RecoverSSM path taken: %d spec rows, align=%s", n, align
                )
        return GDNRecoverSSMMetadata(
            **base,
            recoverssm_commit=commit,
            recoverssm_context=self._get_context() if commit is not None else None,
            recoverssm_record_indices=(
                commit.record_indices if commit is not None else None
            ),
        )

    def _stage_record_indices(
        self, m: CommonAttentionMetadata, rows: torch.Tensor, padded_len: int
    ) -> torch.Tensor:
        """Replay-buffer rows of the spec windows: each request's persistent slot
        (``req_idx``), so two requests never share a record row. Padding windows (null
        state, skipped by the kernels) get row 0."""
        # Stage through a FRESH pinned buffer per step (async_tensor_h2d: the XPU copy records an event on
        # it, so the host allocator cannot hand it out again before the copy has run). The persistent pinned
        # CpuGpuBuffer was rewritten by the next step's build while this step's non_blocking copy was still queued
        # (async scheduling) -> wrong replay rows whenever the batch layout changed. The destination stays the
        # persistent GPU buffer, whose address the captured FULL graphs read.
        import numpy as _np
        from vllm.utils.torch_utils import async_tensor_h2d
        n = rows.numel()
        rows_np = rows.numpy()
        host = _np.zeros(padded_len, dtype=_np.int32)
        host[:n] = rows_np if m.req_idx is None else m.req_idx[rows_np]
        gpu = self._record_indices.gpu[:padded_len]
        async_tensor_h2d(host, out=gpu)
        return gpu

    def _clear_prefill_slots(self, m: CommonAttentionMetadata, spec_rows) -> None:
        """K8V4_RSSM_DEFER_COMMIT: a request slot that runs a prefill starts a new (or recomputed) state, so the
        pending records a finished request left in that slot must not be folded into it."""
        if self._capturing or self._context is None:
            return
        if m.is_prefilling is None or m.is_prefilling.device.type != "cpu" or m.req_idx is None:
            # dummy / profile batches (no request slots); every real model-runner step carries both
            return
        prefill = m.is_prefilling[: m.num_reqs].clone()
        if spec_rows is not None and spec_rows.numel():
            prefill[spec_rows] = False
        rows = prefill.nonzero().flatten().numpy()
        if rows.size:
            from k8v4_v030 import rssm_defer

            rssm_defer.clear_slots(self._context, m.req_idx[rows])

    def build_for_cudagraph_capture(
        self, common_attn_metadata: CommonAttentionMetadata
    ):
        self._capturing = True
        try:
            return super().build_for_cudagraph_capture(common_attn_metadata)
        finally:
            self._capturing = False


class GDNRecoverSSMAttentionBackend(GDNAttentionBackend):
    @staticmethod
    def get_name() -> str:
        return "GDN_RECOVERSSM"

    @staticmethod
    def get_builder_cls() -> type[GDNRecoverSSMMetadataBuilder]:
        return GDNRecoverSSMMetadataBuilder
