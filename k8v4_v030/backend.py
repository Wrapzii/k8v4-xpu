"""Native vLLM 0.30 attention backend for the TP2 K8/V4 kernel.

vLLM owns the block table and the slot map. Decode is one C++ op per
uniform batch. Prefill stays on the eager path unless K8V4_PREFILL=onednn,
which gathers one KV head at a time. Prefill does not run inside an XPU graph.
This module is not the old sidecar overlay.
"""

from __future__ import annotations

from dataclasses import replace

import torch

from k8v4_v030.w4a8_prefill import install_if_requested

install_if_requested()

from k8v4_v030.attn_time import attention_span
from k8v4_v030.cache_views import bind_regions
from k8v4_v030.dequant import eager_prefill
from k8v4_v030.onednn_prefill import head_major_prefill, prefill_mode
from k8v4_v030.stage_profile import profile_enabled, profile_range
from k8v4_v030.layout import CACHE_DTYPE, DECODE_MAX_T, PAGE, SLOT_BYTES_PER_HEAD, PageLayout
from k8v4_v030.ops_api import ops
from k8v4_v030.plan import (
    layout_for_heads,
    query_segments,
    require_decoder,
    scratch_capacity,
    token_span,
    uniform_packed_q_len,
    workspace_programs,
)
from k8v4_v030.scratch import ensure_scratch, get_scratch, scratch_ready
from vllm.logger import init_logger
from vllm.v1.attention.backend import (
    AttentionBackend,
    AttentionCGSupport,
    AttentionImpl,
    AttentionMetadata,
    AttentionMetadataBuilder,
    AttentionType,
    CommonAttentionMetadata,
    MultipleOf,
)
from vllm.v1.attention.backends.registry import (
    AttentionBackendEnum,
    register_backend,
)
from vllm.v1.kv_cache_interface import AttentionSpec

logger = init_logger(__name__)


def _require_page_ratio(cache: torch.Tensor, pages_per_block: int) -> None:
    """The block-table entry must cover the cache block the slot map uses.

    The live layer is ``[block, head, token, 396]``. ``token // 64`` is the
    kernel-page count of one entry. A 64-token kernel block would have split
    that view; a 2112-token entry is 33 pages and must be passed through.
    """
    if cache.ndim != 4 or int(cache.shape[-1]) != SLOT_BYTES_PER_HEAD:
        raise RuntimeError(
            "K8/V4 cache shape %s is not [block, head, token, %d]"
            % (tuple(cache.shape), SLOT_BYTES_PER_HEAD)
        )
    tokens = int(cache.shape[-2])
    if tokens % PAGE != 0:
        raise RuntimeError("K8/V4 block has %d tokens, not a multiple of %d" % (tokens, PAGE))
    ratio = tokens // PAGE
    if ratio != int(pages_per_block):
        raise RuntimeError(
            "K8/V4 pages_per_block %s does not match the %d-token cache block (%d pages)"
            % (pages_per_block, tokens, ratio)
        )


class Xe2K8V4Metadata(AttentionMetadata):
    def __init__(
        self,
        seq_lens: torch.Tensor,
        slot_mapping: torch.Tensor,
        block_table: torch.Tensor,
        query_start_loc: torch.Tensor,
        query_starts: tuple[int, ...],
        seq_lens_cpu: torch.Tensor | None,
        num_actual_tokens: int,
        max_query_len: int,
        max_seq_len: int,
        pages_per_block: int,
        packed_q_len: int,
    ):
        self.seq_lens = seq_lens
        self.slot_mapping = slot_mapping
        self.block_table = block_table
        self.query_start_loc = query_start_loc
        self.query_starts = query_starts
        self.seq_lens_cpu = seq_lens_cpu
        self.num_actual_tokens = num_actual_tokens
        self.max_query_len = max_query_len
        self.max_seq_len = max_seq_len
        self.pages_per_block = pages_per_block
        self.packed_q_len = packed_q_len


class Xe2K8V4MetadataBuilder(AttentionMetadataBuilder[Xe2K8V4Metadata]):
    _cudagraph_support = AttentionCGSupport.UNIFORM_BATCH

    def __init__(self, kv_cache_spec, layer_names, vllm_config, device):
        super().__init__(kv_cache_spec, layer_names, vllm_config, device)
        # The spec carries this rank's KV head count (2 on a TP2 rank, 4 on
        # one GPU); scratch geometry follows it instead of a module constant.
        self.layout = PageLayout(kv_cache_spec.num_kv_heads)
        logger.info_once(
            "K8/V4 local heads: %d KV / %d Q", self.layout.hkv, self.layout.hq
        )
        # MTP6 with no parallel drafting pulls q=7 into the decode group.
        self._init_reorder_batch_threshold(1, supports_spec_as_decode=True)

    def set_kernel_block_size(self, kernel_block_size: int) -> None:
        super().set_kernel_block_size(kernel_block_size)
        manager = int(self.kv_cache_spec.block_size)
        ratio = attention_pages(manager, self.kernel_block_size)
        logger.info_once(
            "K8/V4 pages per block-table entry: %d (manager block %d, kernel block %s)",
            ratio,
            manager,
            self.kernel_block_size,
        )
        self._ensure_scratch()

    def _ensure_scratch(self) -> None:
        spec = self.kv_cache_spec
        manager = int(spec.block_size)
        model = self.vllm_config.model_config
        sched = self.vllm_config.scheduler_config
        comp = getattr(self.vllm_config, "compilation_config", None)
        capture = []
        if comp is not None:
            capture = list(getattr(comp, "cudagraph_capture_sizes", None) or [])
        nprog, store_tokens, out_tokens = scratch_capacity(
            int(model.max_model_len),
            manager,
            self.kernel_block_size,
            int(sched.max_num_batched_tokens),
            int(sched.max_num_seqs),
            capture,
            self.layout,
        )
        ensure_scratch(self.device, self.layout, nprog, store_tokens, out_tokens)

    def build(
        self,
        common_prefix_len: int,
        common_attn_metadata: CommonAttentionMetadata,
        fast_build: bool = False,
    ) -> Xe2K8V4Metadata:
        del common_prefix_len, fast_build
        if not scratch_ready(self.device, self.layout):
            self._ensure_scratch()
        cam = common_attn_metadata
        starts_cpu = cam.query_start_loc_cpu
        starts = tuple(int(x) for x in starts_cpu.tolist())
        spec = self.kv_cache_spec
        return Xe2K8V4Metadata(
            seq_lens=cam.seq_lens,
            slot_mapping=cam.slot_mapping,
            block_table=cam.block_table_tensor,
            query_start_loc=cam.query_start_loc,
            query_starts=starts,
            seq_lens_cpu=cam.seq_lens_cpu_upper_bound,
            num_actual_tokens=int(cam.num_actual_tokens),
            max_query_len=int(cam.max_query_len),
            max_seq_len=int(cam.max_seq_len),
            pages_per_block=attention_pages(spec.block_size, self.kernel_block_size),
            packed_q_len=uniform_packed_q_len(starts),
        )


def attention_pages(manager_block: int, kernel_block: int | None) -> int:
    from k8v4_v030.layout import attention_pages_per_block

    return attention_pages_per_block(int(manager_block), kernel_block)


class Xe2K8V4Impl(AttentionImpl[Xe2K8V4Metadata]):
    def __init__(
        self,
        num_heads: int,
        head_size: int,
        scale: float,
        num_kv_heads: int | None = None,
        alibi_slopes: torch.Tensor | None = None,
        sliding_window: int | None = None,
        kv_cache_dtype: str = "auto",
        logits_soft_cap: float | None = None,
        attn_type: str = AttentionType.DECODER,
        kv_sharing_target_layer_name: str | None = None,
    ) -> None:
        if kv_cache_dtype != CACHE_DTYPE:
            raise RuntimeError("K8/V4 impl got kv dtype %s" % kv_cache_dtype)
        if num_kv_heads is None:
            num_kv_heads = num_heads
        self.layout = layout_for_heads(num_heads, num_kv_heads, head_size)
        require_decoder(attn_type, sliding_window, alibi_slopes, logits_soft_cap, scale)
        self.num_heads = num_heads
        self.num_kv_heads = num_kv_heads
        self.head_size = head_size
        self.scale = float(scale)
        self.kv_cache_dtype = kv_cache_dtype
        self.kv_sharing_target_layer_name = kv_sharing_target_layer_name

    def do_kv_cache_update(
        self,
        layer: torch.nn.Module,
        key: torch.Tensor,
        value: torch.Tensor,
        kv_cache: torch.Tensor,
        slot_mapping: torch.Tensor,
    ) -> None:
        del layer
        cache = _one_cache(kv_cache)
        if cache.numel() == 0:
            return
        if slot_mapping.ndim != 1:
            raise RuntimeError("slot_mapping rank %d" % slot_mapping.ndim)
        ntok = int(slot_mapping.shape[0])
        if ntok == 0:
            return
        if slot_mapping.dtype != torch.int64 or not slot_mapping.is_contiguous():
            raise RuntimeError(
                "slot_mapping must be contiguous int64, got %s stride %s"
                % (slot_mapping.dtype, tuple(slot_mapping.stride()))
            )
        if key.shape[0] < ntok or value.shape[0] < ntok:
            raise RuntimeError("key/value shorter than slot_mapping")
        if profile_enabled():
            with profile_range("kv_store", "kv_store_paged"):
                _store_kv(key, value, cache, slot_mapping, ntok, self.layout)
            return
        _store_kv(key, value, cache, slot_mapping, ntok, self.layout)

    def forward(
        self,
        layer: torch.nn.Module,
        query: torch.Tensor,
        key: torch.Tensor,
        value: torch.Tensor,
        kv_cache: torch.Tensor,
        attn_metadata: Xe2K8V4Metadata,
        output: torch.Tensor,
        output_scale: torch.Tensor | None = None,
        output_block_scale: torch.Tensor | None = None,
    ) -> torch.Tensor:
        del layer, key, value
        if output_scale is not None or output_block_scale is not None:
            raise RuntimeError("K8/V4 does not take an output scale")
        cache = _one_cache(kv_cache)
        if cache.numel() == 0 or query.shape[0] == 0:
            return output
        if attn_metadata.packed_q_len:
            self._packed(query, cache, attn_metadata, output)
            return output
        if _capturing():
            raise RuntimeError("K8/V4 prefill cannot run inside an XPU graph")
        self._eager(query, cache, attn_metadata, output)
        return output

    def _packed(
        self,
        query: torch.Tensor,
        cache: torch.Tensor,
        meta: Xe2K8V4Metadata,
        output: torch.Tensor,
    ) -> None:
        q_len = int(meta.packed_q_len)
        if q_len < 1 or q_len > DECODE_MAX_T:
            raise RuntimeError("packed q_len %d" % q_len)
        segments = query_segments(meta.query_starts)
        if len(segments) != 1 or segments[0][2] != q_len:
            raise RuntimeError("packed metadata does not match query starts")
        first, count, _ = segments[0]
        self._attn_batch(query, cache, meta, output, first, count, q_len)

    def _attn_batch(
        self,
        query: torch.Tensor,
        cache: torch.Tensor,
        meta: Xe2K8V4Metadata,
        output: torch.Tensor,
        first: int,
        count: int,
        q_len: int,
    ) -> None:
        _require_page_ratio(cache, meta.pages_per_block)
        tok0, width = token_span(meta.query_starts, first, count, q_len)
        if query.shape[0] < tok0 + width:
            raise RuntimeError("query shorter than the packed segment")
        block_table = meta.block_table
        if block_table.ndim != 2 or block_table.shape[0] < first + count:
            raise RuntimeError("block_table shape %s" % (tuple(block_table.shape),))
        block_table = block_table.narrow(0, first, count)
        if block_table.dtype != torch.int32 or not block_table.is_contiguous():
            raise RuntimeError(
                "block_table must be contiguous int32, got %s stride %s"
                % (block_table.dtype, tuple(block_table.stride()))
            )
        seq_lens = meta.seq_lens
        if seq_lens.dtype != torch.int32 or not seq_lens.is_contiguous():
            raise RuntimeError(
                "seq_lens must be contiguous int32, got %s stride %s"
                % (seq_lens.dtype, tuple(seq_lens.stride()))
            )
        seq_lens = seq_lens.reshape(-1).narrow(0, first, count)
        scratch = get_scratch(query.device, self.layout)
        q_buf, out_buf = scratch.attention_pair(width)
        q_buf.copy_(query.narrow(0, tok0, width))
        nprog = workspace_programs(int(block_table.shape[1]), meta.pages_per_block, self.layout)
        partials, m_state, l_state, merged = scratch.workspace(nprog)
        views = bind_regions(cache, self.layout)

        def _decode_attn() -> None:
            ops().int8k_int4v_attn_batch(
                q_buf,
                scratch.q8,
                scratch.q_scale,
                views["k"],
                views["k_scale"],
                views["v"],
                views["v_scale"],
                views["v_zero"],
                block_table,
                seq_lens,
                scratch.visible,
                partials,
                m_state,
                l_state,
                merged,
                out_buf,
                q_len,
                meta.pages_per_block,
            )

        attention_span("decode", _decode_attn)
        output.narrow(0, tok0, width).copy_(out_buf)

    def _eager(
        self,
        query: torch.Tensor,
        cache: torch.Tensor,
        meta: Xe2K8V4Metadata,
        output: torch.Tensor,
    ) -> None:
        views = bind_regions(cache, self.layout)
        _require_page_ratio(cache, meta.pages_per_block)
        cpu_lens = meta.seq_lens_cpu
        if cpu_lens is None:
            cpu_lens = meta.seq_lens.detach().to("cpu")
        for first, count, q_len in query_segments(meta.query_starts):
            if q_len == 0:
                continue
            if 1 <= q_len <= DECODE_MAX_T:
                self._attn_batch(query, cache, meta, output, first, count, q_len)
                continue
            for offset in range(count):
                req = first + offset
                tok0, width = token_span(meta.query_starts, req, 1, q_len)
                seq_len = int(cpu_lens[req])
                if seq_len < width:
                    raise RuntimeError(
                        "seq_len %d does not cover query %d; the kernel expects "
                        "the length to include this step" % (seq_len, width)
                    )
                row = meta.block_table[req]
                q_fp = query.narrow(0, tok0, width).to(torch.float16)
                prefill = head_major_prefill if prefill_mode() == "onednn" else eager_prefill

                def _prefill_attn():
                    return prefill(
                        q_fp, views, row, seq_len, meta.pages_per_block, self.scale
                    )

                attn = attention_span("prefill", _prefill_attn)
                output.narrow(0, tok0, width).copy_(attn)
                del q_fp, attn


def _store_kv(key, value, cache, slot_mapping, ntok: int, layout) -> None:
    scratch = get_scratch(key.device, layout)
    k_buf, v_buf = scratch.store_pair(ntok)
    k_buf.copy_(key.narrow(0, 0, ntok))
    v_buf.copy_(value.narrow(0, 0, ntok))
    views = bind_regions(cache, layout)
    ops().kv_store_paged(
        k_buf,
        v_buf,
        slot_mapping,
        views["k"],
        views["k_scale"],
        views["v"],
        views["v_scale"],
        views["v_zero"],
    )


def _one_cache(kv_cache: torch.Tensor | list[torch.Tensor] | tuple[torch.Tensor, ...]) -> torch.Tensor:
    if isinstance(kv_cache, (list, tuple)):
        if len(kv_cache) != 1:
            raise RuntimeError("K8/V4 cache is one packed tensor, got %d pieces" % len(kv_cache))
        return kv_cache[0]
    return kv_cache


def _capturing() -> bool:
    xpu = getattr(torch, "xpu", None)
    fn = getattr(xpu, "is_current_stream_capturing", None)
    if fn is None:
        return False
    return bool(fn())


@register_backend(AttentionBackendEnum.CUSTOM)
class Xe2K8V4AttentionBackend(AttentionBackend):
    accept_output_buffer: bool = True
    forward_includes_kv_cache_update: bool = False
    supported_kv_cache_dtypes = [CACHE_DTYPE]

    @staticmethod
    def get_name() -> str:
        # Attention.__init__ does AttentionBackendEnum[get_name()]. The enum
        # has no XE2 slot; CUSTOM is the registered out-of-tree member.
        return AttentionBackendEnum.CUSTOM.name

    @staticmethod
    def get_impl_cls() -> type[Xe2K8V4Impl]:
        return Xe2K8V4Impl

    @staticmethod
    def get_builder_cls() -> type[Xe2K8V4MetadataBuilder]:
        return Xe2K8V4MetadataBuilder

    @staticmethod
    def get_supported_kernel_block_sizes() -> list[MultipleOf]:
        return [MultipleOf(64)]

    @classmethod
    def get_supported_head_sizes(cls) -> list[int]:
        return [256]

    @classmethod
    def supports_kv_cache_dtype(cls, kv_cache_dtype: str | None) -> bool:
        return kv_cache_dtype == CACHE_DTYPE

    @classmethod
    def supports_attn_type(cls, attn_type: str) -> bool:
        return attn_type == AttentionType.DECODER

    @classmethod
    def customize_spec(cls, spec: AttentionSpec) -> AttentionSpec:
        return replace(spec, state_content_bytes=SLOT_BYTES_PER_HEAD)
