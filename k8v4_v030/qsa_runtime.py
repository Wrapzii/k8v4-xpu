"""Optional QSA path on top of dense K8/V4.

The flag is read on every forward. Off does not call this module. On, a
wrapped Qwen full-attention module stashes the post-norm hidden state, this
module writes the indexer cache, and sparse attention runs only when a query
would drop a block (or when ``K8V4_QSA_FORCE_ALL=1``). Otherwise the packed
or eager K8/V4 kernel runs and the output buffer is left untouched.

An XPU graph replay does not re-enter this function. ``qsa_sparse_attn``
bakes ``seq_len`` into the launch, and ``qsa_visible`` allocates on every
call, so the captured decode cannot follow a growing context. Capture
therefore stays on dense K8/V4. ``K8V4_QSA_EAGER=1`` makes the builder
report no cudagraph support; vLLM then runs the step eagerly and the
device planner below can drop blocks. The eager XPU planner keeps the
visible-token matrix on device. ``K8V4_QSA_STATS=1`` counts each
decision; ``k8v4_v030.qsa_stats.qsa_stats_snapshot`` reads the counters.
"""

from __future__ import annotations

import contextvars
import inspect
import os
import time
import re
import sys

import torch

from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import D, PAGE, PageLayout
from k8v4_v030.plan import query_lengths
from k8v4_v030.qsa_cache import all_banks, bank_for
from k8v4_v030.qsa_config import (
    is_full_attention_layer,
    qsa_enabled,
    qsa_force_all,
    weights_path,
)
from k8v4_v030.dequant import gather_dequant
from k8v4_v030.qsa_ops import (
    attend_decode_k8v4,
    attend_selected,
    choose_blocks,
    library_path,
    mask_query_scores,
    packed_visible_rows,
    rows_from_packed,
    score_pooled,
    score_pooled_paged,
)
from k8v4_v030.qsa_stats import note_qsa, note_qsa_width, qsa_stats_enabled
from k8v4_v030.qsa_ref import (
    QsaHyper,
    apply_q_rope,
    cells_for_queries,
    complete_blocks,
    project_indexer,
    score_blocks,
    visible_tokens,
)
from k8v4_v030.qsa_rope import normalize_positions
from k8v4_v030.qsa_weights import get_bank, load_bank_file, set_bank

_LAYER = re.compile(r"layers\.(\d+)")
_STASH: contextvars.ContextVar[tuple | None] = contextvars.ContextVar("k8v4_qsa_stash", default=None)
_INSTALLED = False
_CLASSES_WRAPPED = False
_ATTN_CLASSES = ("Qwen3NextAttention",)



def _descriptor_is_exact_mtp6(desc) -> bool:
    """True for one MTP6 exact-verifier key of 1..8 requests.

    Eight requests is 56 tokens, the top of the speedfix capture list.
    Nine is outside max-num-seqs 8. A test double may pass a mode whose
    ``name`` is ``FULL``; the live key is ``CUDAGraphMode.FULL``.
    """
    if desc is None or getattr(desc, "qsa_exact_verifier", None) is not True:
        return False
    from vllm.config.compilation import CUDAGraphMode
    mode = getattr(desc, "cg_mode", None)
    if mode != CUDAGraphMode.FULL and getattr(mode, "name", None) != "FULL":
        return False
    reqs = getattr(desc, "num_reqs", None)
    if type(reqs) is not int or not 1 <= reqs <= 8:
        return False
    if getattr(desc, "uniform_token_count", None) != 7 or getattr(desc, "num_ubatches", None) != 1:
        return False
    return getattr(desc, "num_tokens", None) == 7 * reqs


def _verified_v2_graph_descriptor():
    """Return only the manager's exact-seven descriptor, never a v1 hint."""
    if os.environ.get("K8V4_QSA_V2_EXACT7", "0") != "1":
        return None
    try:
        from vllm.forward_context import get_forward_context
        from vllm.v1.worker.gpu.cudagraph_utils import BatchExecutionDescriptor
        ctx = get_forward_context()
    except (ImportError, AssertionError, RuntimeError):
        return None
    desc = getattr(ctx, "qsa_exact_verifier_descriptor", None)
    if not isinstance(desc, BatchExecutionDescriptor):
        return None
    if not _descriptor_is_exact_mtp6(desc):
        return None
    return desc


def _verified_v2_graph_padding(ntok, device=None):
    """Return the live token mask, without reading tensor contents on the host."""
    desc = _verified_v2_graph_descriptor()
    if desc is None or desc.num_tokens != ntok:
        return None
    from vllm.forward_context import get_forward_context
    mask = getattr(get_forward_context(), "is_padding", None)
    if (not torch.is_tensor(mask) or mask.dtype != torch.bool or mask.ndim != 1
            or mask.shape[0] != ntok or not mask.is_contiguous()
            or (device is not None and mask.device != torch.device(device))):
        return None
    return mask



def _stage(label: str, start: float, extra: str = "") -> float:
    """Sync and append one stage time. No-op unless K8V4_QSA_STAGE=1."""
    if os.environ.get("K8V4_QSA_STAGE", "0") != "1":
        return start
    if getattr(torch, "xpu", None) is not None and torch.xpu.is_available():
        torch.xpu.synchronize()
    ms = (time.perf_counter() - start) * 1000.0
    path = os.environ.get("K8V4_QSA_STAGE_FILE", "/ops/attn-profile/qsa-stage.txt")
    with open(path, "a", encoding="utf-8") as handle:
        handle.write("%s %.1f %s\n" % (label, ms, extra))
    return time.perf_counter()


_LAST_HIDDEN: dict = {}


def note_hidden(layer_idx: int, hidden: torch.Tensor, positions: torch.Tensor | None) -> None:
    """Record the hidden state for the matching ``impl.forward`` call."""
    _STASH.set((int(layer_idx), hidden, positions))
    # This is the fallback for the current stash op, not a layer history.
    # Dummy/profile forwards may never call the attention consumer.
    _LAST_HIDDEN.clear()
    _LAST_HIDDEN[int(layer_idx)] = (hidden, positions)


def take_hidden(layer_idx: int) -> tuple[torch.Tensor, torch.Tensor | None] | None:
    """Return the stash for ``layer_idx``.

    A capture pass can drop the ContextVar write and still have the op's
    dict entry. Replay does not call this.
    """
    got = _STASH.get()
    _STASH.set(None)
    fallback = _LAST_HIDDEN.pop(int(layer_idx), None)
    if got is not None and int(got[0]) == int(layer_idx):
        return got[1], got[2]
    return fallback


def clear_hidden() -> None:
    _STASH.set(None)


def layer_index_from_name(name: str) -> int | None:
    """Parse ``layers.{i}``, including an MTP draft module with that index."""
    text = str(name or "")
    match = _LAYER.search(text)
    if match is None:
        return None
    return int(match.group(1))


def resolve_layer(layer: object) -> int | None:
    """Layer index from an explicit attribute or a ``layers.{i}`` name."""
    if layer is None:
        return None
    explicit = getattr(layer, "qsa_layer_idx", None)
    if explicit is not None:
        return int(explicit)
    for attr in ("layer_name", "prefix"):
        found = layer_index_from_name(str(getattr(layer, attr, "") or ""))
        if found is not None:
            return found
    attn = getattr(layer, "attn", None)
    if attn is not None:
        return layer_index_from_name(str(getattr(attn, "layer_name", "") or ""))
    return None


def _register_stash_op() -> None:
    """Register the hidden-state stash as a real op so Dynamo keeps the call.

    ContextVar.set inside a compiled forward is either rejected or dropped.
    A custom op runs its body on every step, and ``vllm::qsa_stash`` is added
    to the compilation splitting list so that call stays outside cudagraph
    replay. The returned tensor is the same hidden state.
    """
    if hasattr(torch.ops, "vllm") and hasattr(torch.ops.vllm, "qsa_stash"):
        return

    @torch.library.custom_op("vllm::qsa_stash", mutates_args=())
    def qsa_stash(hidden: torch.Tensor, positions: torch.Tensor, layer_idx: int) -> torch.Tensor:
        note_hidden(int(layer_idx), hidden, positions)
        # A custom op may not return one of its inputs. The scalar is only
        # a data dependency so the compiler cannot drop the call.
        return hidden.new_zeros(())

    @qsa_stash.register_fake
    def _qsa_stash_fake(hidden, positions, layer_idx):
        # Tracing calls the fake, not the real op. The sparse branch has to
        # see the hidden state while Dynamo is recording it.
        note_hidden(int(layer_idx), hidden, positions)
        return hidden.new_empty(())


_register_stash_op()


def register_qsa_split(vllm_config) -> None:
    """Ask vLLM to split the compiled graph at the stash.

    With QSA enabled the attention backend reports no cudagraph support, so
    FULL_DECODE_ONLY downgrades to PIECEWISE when attention is already a
    splitting op. The stash has to be one too, or the compiled piece before
    attention replays a captured hidden state.
    """
    _register_stash_op()
    compilation = getattr(vllm_config, "compilation_config", None)
    splitting = getattr(compilation, "splitting_ops", None)
    if splitting is None:
        return
    name = "vllm::qsa_stash"
    if name not in splitting:
        splitting.append(name)


def install_if_requested() -> None:
    """Wrap Qwen full attention and the vLLM block copy. Idempotent.

    A missing vLLM symbol is skipped. A weights path that does not load is
    an error. No path leaves the in-memory bank alone.
    """
    global _INSTALLED, _CLASSES_WRAPPED
    if not qsa_enabled():
        return
    if not _INSTALLED:
        if os.environ.get("K8V4_QSA_SHORTLIST", "0") == "1":
            from k8v4_v030.qsa_ops import _load_shortlist_selector
            _load_shortlist_selector()
        if os.environ.get("K8V4_QSA_FUSED_MASK", "0") == "1":
            from k8v4_v030.qsa_fused_mask_candidate import prewarm
            prewarm()
        path = weights_path()
        if path and get_bank() is None:
            set_bank(load_bank_file(path))
        _INSTALLED = True
    # The model class may be imported after the first forward. Keep scanning
    # until the Qwen attention class has been wrapped.
    if not _CLASSES_WRAPPED:
        # Import before torch.compile traces the class. A later scan wraps a
        # copy the compiled graph never calls, and the cached graph stays dense.
        try:
            from vllm.model_executor.models.qwen3_next import Qwen3NextAttention

            _wrap_forward(Qwen3NextAttention)
            print("QSA_WRAP Qwen3NextAttention", flush=True)
            _CLASSES_WRAPPED = True
        except Exception as exc:
            print("QSA_WRAP import failed %s" % exc, flush=True)
        if not _CLASSES_WRAPPED and _wrap_attention_classes():
            _CLASSES_WRAPPED = True
            print("QSA_WRAP scanned", flush=True)
        _wrap_block_copy()


def apply_scheduled_copies(num_blocks: int, copies) -> None:
    """Mirror a scheduler block copy onto every indexer cache.

    ``copies`` is a sequence of ``(src, dst)`` or objects with
    ``src_block_id`` and ``dst_block_id``. When the indexer cache was split
    into kernel pages, one scheduler id expands to that many consecutive
    pages, matching ``copy_kv_cache_blocks_inplace``.
    """
    src, dst = _pair_lists(copies)
    if not src:
        return
    num_blocks = int(num_blocks)
    if num_blocks < 1:
        raise ValueError("num_blocks")
    for bank in all_banks():
        for cache in bank.layers.values():
            if cache.num_blocks == num_blocks:
                cache.copy_blocks(src, dst)
                continue
            if cache.num_blocks % num_blocks != 0:
                raise RuntimeError(
                    "QSA cache has %d blocks and the scheduler copy has %d"
                    % (cache.num_blocks, num_blocks)
                )
            ratio = cache.num_blocks // num_blocks
            wide_src: list[int] = []
            wide_dst: list[int] = []
            for src_id, dst_id in zip(src, dst):
                for sub in range(ratio):
                    wide_src.append(int(src_id) * ratio + sub)
                    wide_dst.append(int(dst_id) * ratio + sub)
            cache.copy_blocks(wide_src, wide_dst)



_REUSE = {}
_REUSE_ROWS = {}


def _module_text(layer) -> str:
    parts = []
    for attr in ("layer_name", "prefix"):
        parts.append(str(getattr(layer, attr, "") or ""))
    attn = getattr(layer, "attn", None)
    if attn is not None:
        for attr in ("layer_name", "prefix"):
            parts.append(str(getattr(attn, attr, "") or ""))
    return " ".join(parts)


def _remember_visible(layer_idx: int, visible: torch.Tensor) -> None:
    """Keep the target selection so a later MTP step can attend the same tokens."""
    key = int(layer_idx)
    buf = _REUSE.get(key)
    if buf is None or tuple(buf.shape) != tuple(visible.shape) or buf.device != visible.device:
        if _capturing():
            return
        _REUSE[key] = visible.detach()
        return
    buf.copy_(visible)


def _reuse_mtp(impl, query3, out3, meta, kv_cache, layout, layer_idx: int, n: int) -> bool:
    """Attend with the target's last selection. The paper reuses QSA indices for MTP."""
    src = _REUSE.get(int(layer_idx))
    if src is None or int(src.shape[0]) < 1 or n < 1:
        return False
    from k8v4_v030.cache_views import bind_regions
    from k8v4_v030.qsa_ops import attend_decode_direct
    width = int(src.shape[1])
    key = (int(layer_idx), n, width, str(src.device))
    rows = _REUSE_ROWS.get(key)
    if rows is None:
        if _capturing():
            return False
        rows = torch.empty((n, width), dtype=torch.int32, device=src.device)
        _REUSE_ROWS[key] = rows
    rows.copy_(src[-1].view(1, -1).expand(n, width))
    block_row = meta.block_table[0]
    ratio = max(int(meta.pages_per_block), 1)
    views = bind_regions(kv_cache, layout)
    attend_decode_direct(query3[:n], views, block_row, rows, ratio, out=out3[:n])
    return True


def try_sparse_forward(impl, layer, query, kv_cache, meta, output) -> bool:
    """Update the indexer cache and maybe write ``output``.

    False means the caller runs dense K8/V4. True means ``output`` holds
    the sparse result for every query in this step.
    """
    if not qsa_enabled():
        _mark(query, meta, "disabled")
        return False
    install_if_requested()
    # Capture pads some batches. The live token count, not the storage shape,
    # decides whether this decode can be recorded into the graph.
    n_live = _step_tokens(query, meta)
    graph_enabled = os.environ.get("K8V4_QSA_GRAPH", "0") == "1"
    c4_spans = _c4_graph_spans(meta, n_live) if graph_enabled else ()
    if _capturing() and not (
        graph_enabled and (n_live <= 16 or c4_spans)
    ):
        clear_hidden()
        _mark(query, meta, "capturing")
        return False
    layer_idx = resolve_layer(layer)
    if layer_idx is None:
        clear_hidden()
        _mark(query, meta, "no_layer")
        return False
    if not is_full_attention_layer(layer_idx):
        clear_hidden()
        _mark(query, meta, "not_full_attn")
        return False
    bank = get_bank()
    weights = None if bank is None else bank.get(layer_idx)
    stashed = take_hidden(layer_idx)
    if weights is None:
        _mark(query, meta, "no_weights")
        return False
    if stashed is None:
        if not getattr(try_sparse_forward, "_hid_logged", False):
            try_sparse_forward._hid_logged = True
            print(
                "QSA_GRAPH no_hidden q=%s n=%s capturing=%s layer=%s"
                % (tuple(query.shape), n_live, _capturing(), layer_idx),
                flush=True,
            )
        _mark(query, meta, "no_hidden")
        return False
    hidden, positions = stashed
    layout = impl.layout
    if not isinstance(layout, PageLayout):
        raise RuntimeError("QSA forward expected a PageLayout")
    hyper = QsaHyper()
    weights.check(hyper)
    query3 = _as_heads(query, layout)
    out3 = _as_heads(output, layout)
    n = _step_tokens(query3, meta)
    if n == 0:
        _mark(query, meta, "empty")
        return False
    if int(hidden.shape[0]) < n or int(hidden.shape[-1]) != hyper.hidden:
        raise RuntimeError(
            "QSA hidden %s does not cover %d tokens of width %d"
            % (tuple(hidden.shape), n, hyper.hidden)
        )
    if "mtp" in _module_text(layer).lower():
        # Reusing the target row raised acceptance only by locking the draft
        # onto one token. The 200K answer then repeated "(V)". Leave the draft
        # dense until the reused indices include each draft token's own block.
        clear_hidden()
        _mark(query, meta, "no_layer")
        return False
    if graph_enabled and (n <= 16 or c4_spans):
        if c4_spans and positions is not None:
            return _run_c4_graph_decode(
                query3, out3, hidden, positions, meta, kv_cache, layout,
                hyper, weights, layer_idx, n, c4_spans,
            )
        starts = tuple(meta.query_starts)
        # Capture pads query_start_loc out to max_num_seqs. A real one-request
        # decode is the same shape: one span of n and then empty tails.
        if _one_decode_span(starts, n) and positions is not None:
            if _run_graph_decode(
                query3, out3, hidden, positions, meta, kv_cache, layout, hyper, weights, layer_idx, n
            ):
                return True
        if _capturing():
            seen = getattr(try_sparse_forward, "_span_logged_ns", None)
            if seen is None:
                seen = set()
                try_sparse_forward._span_logged_ns = seen
            if n not in seen:
                seen.add(n)
                print(
                    "QSA_GRAPH skip starts=%s n=%s pos=%s" % (starts, n, positions is not None),
                    flush=True,
                )
            clear_hidden()
            _mark(query, meta, "capturing")
            return False
    # Eager XPU decode reads corrected lengths from meta.seq_lens. The Python
    # planner copies that tensor to the host, and the draft loop used to drop
    # the copy on every token. Short decode already has a fixed-shape device
    # body; use it for every decode-sized step so the sync cannot come back.
    if (
        not _capturing()
        and positions is not None
        and torch.device(meta.seq_lens.device).type == "xpu"
        and library_path() is not None
    ):
        device_spans = _short_decode_spans(meta, n)
        if device_spans:
            return _run_c4_graph_decode(
                query3, out3, hidden, positions, meta, kv_cache, layout,
                hyper, weights, layer_idx, n, device_spans,
            )
    requests = _requests(meta, n)
    cells: list[int] = []
    for _req, _q0, q_len, seq_len in requests:
        cells.extend(cells_for_queries(seq_len, q_len))
    if len(cells) != n:
        raise RuntimeError("QSA query cells %d do not match %d tokens" % (len(cells), n))
    pos4 = _positions(positions, n, cells, hidden.device)
    q_idx, k_raw = project_indexer(
        hidden[:n],
        weights.q_proj,
        weights.k_proj,
        weights.q_norm,
        weights.k_norm,
        hyper,
    )
    q_idx = apply_q_rope(q_idx, pos4, hyper)
    num_blocks, block_size = _geometry(kv_cache, meta, layout)
    # Default hyper shares one bank per KV-head count. A fresh QsaHyper()
    # each forward must not allocate a new bank.
    cache = bank_for(layout.hkv).layer(layer_idx, num_blocks, block_size, hidden.device)
    # Share physical ownership with K8/V4; logical cells restart per request.
    logical = torch.cat([
        cache.logical_slots(meta.block_table[req],
                            torch.tensor(cells_for_queries(seq_len, q_len),
                                         dtype=torch.int64, device=hidden.device),
                            int(meta.pages_per_block))
        for req, _q0, q_len, seq_len in requests
    ])
    lengths = query_lengths(tuple(int(x) for x in meta.query_starts))
    if (os.environ.get("K8V4_QSA_NATIVE_CACHE", "0") == "1" and hidden.device.type == "xpu"
            and n <= 128 and lengths and max(lengths) <= 16):
        if cache.lazy and int(cache.raw.shape[0]) < cache.num_slots:
            cache.ensure_capacity(int(logical.max()))
        _write_indexer_cache_native(cache, logical, k_raw, pos4, weights.k_block_norm, hyper)
    else:
        write_t = time.perf_counter()
        handled = False
        if os.environ.get("K8V4_QSA_NEW_PREFILL_WRITER", "0") == "1":
            from k8v4_v030.qsa_prefill_sidecar_writer import try_runtime_write
            handled = try_runtime_write(cache, logical, k_raw, pos4,
                                        weights.k_block_norm, hyper, lengths)
        if not handled:
            if getattr(cache, 'storage_contract', '') == 'xpu-fp32-physical-tail-v1':
                # The checkpoint bank is CPU-resident. Reuse the existing
                # per-device norm preparation rather than sending CPU weights
                # directly to the compact native ABI or copying every step.
                _write_indexer_cache_native(cache, logical, k_raw, pos4,
                                            weights.k_block_norm, hyper, count_hit=False)
            else:
                cache.write_tokens(logical, k_raw, pos4, weights.k_block_norm)
        # Off by default. The .item() calls sync the prefill stream, and the
        # print flooded the 131K prefill logs. Set K8V4_QSA_CACHE_DEBUG=1 to
        # restore the layer-3 cache line.
        if (
            os.environ.get("K8V4_QSA_CACHE_DEBUG", "0") == "1"
            and layer_idx == 3
            and n > 16
            and cells
        ):
            _end = int(cells[-1])
            _need = (_end + 1) // 4
            _valid = int(cache.pool_valid[:_need].sum().item()) if _need else 0
            _slot = int(logical.max().item())
            print(
                "QSA_CACHE seq_end=%d need_blocks=%d valid=%d max_slot=%d n=%d"
                % (_end, _need, _valid, _slot, n),
                flush=True,
            )
        _stage("write", write_t, "n=%d" % int(n))
    # Every query with count <= n_sel keeps every causal block. Scoring cannot
    # change that, so the packed dense kernel still produces the output.
    # count == n_sel + 1 can collapse back to a full set once the own block is
    # forced in, so that case is scored and checked below.
    if not qsa_force_all() and not _over_budget(requests, hyper):
        _mark(query, meta, "within_budget")
        return False
    if (
        os.environ.get("K8V4_QSA_EXACT_TILED", "0") == "1"
        and not qsa_force_all()
        and query3.device.type == "xpu"
        and any(int(item[2]) > 16 for item in requests)
    ):
        from k8v4_v030.qsa_ops import _visible_graph, attend_decode_direct, score_pooled_gemm
        from k8v4_v030.qsa_memory_budget import prefill_tile_rows
        if os.environ.get("K8V4_QSA_SCORE_FP16", "0") == "1":
            raise RuntimeError("experimental exact-tiled prefill requires FP32 scoring")
        views = bind_regions(kv_cache, layout)
        requested_tile = max(1, int(os.environ.get("K8V4_QSA_EXACT_TILE", "128")))
        gemm_prefill = os.environ.get("K8V4_QSA_GEMM_SCORE", "0") == "1"
        # Output publication only: cache writes retain their existing contract.
        # Stage actual rows, not caller padding or its potentially strided backing.
        staged = torch.empty_like(out3[:n])
        # Serial request-local tiles bound score/selection workspace independently
        # of batch size. Retain original request rows and full-batch query offsets.
        for req, q0, q_len, seq_len in requests:
            block_row = meta.block_table[req]
            req_cells = cells_for_queries(seq_len, q_len)
            counts = [complete_blocks(cell, hyper.ratio) for cell in req_cells]
            tile = prefill_tile_rows(requested_tile, max(counts))
            # Keep short mixed decode spans on the paged scorer. Gather once
            # per live prefill request, never across requests or in a shape cache.
            use_gemm = gemm_prefill and q_len > 16 and max(counts) > 0
            tile_mask = None
            if use_gemm:
                pooled, valid = cache.gather_blocks(block_row, max(counts), int(meta.pages_per_block))
                if os.environ.get("K8V4_QSA_HOISTED_MASK", "0") == "1":
                    from k8v4_v030.qsa_tile_mask import TileMask
                    tile_mask = TileMask(counts, req_cells, valid, int(pooled.shape[0]), pooled.device)
            for start in range(0, q_len, tile):
                end = min(start + tile, q_len)
                tile_counts, tile_cells = counts[start:end], req_cells[start:end]
                if max(tile_counts) == 0:
                    # No complete blocks exist. The native decode scorer does
                    # not initialize columns beyond its maximum live count;
                    # supply a masked sentinel so only the causal own tail wins.
                    scores = torch.full((end-start, 1), -float("inf"),
                                        dtype=torch.float32, device=q_idx.device)
                elif use_gemm:
                    # Early tiles can have fewer complete blocks than the chunk.
                    # Bound both GEMM and masking to this tile's native width.
                    width = max(tile_counts)
                    scores = None
                    if os.environ.get("K8V4_QSA_FUSED_MASK", "0") == "1":
                        from k8v4_v030.qsa_fused_mask_candidate import score as masked_gemm
                        mask_counts = (tile_mask.counts[start:end] if tile_mask is not None else
                                       torch.tensor(tile_counts, device=query3.device, dtype=torch.int32))
                        scores = masked_gemm(q_idx[q0+start:q0+end], pooled[:width],
                                             mask_counts, valid[:width])
                    if scores is None:
                        raw = score_pooled_gemm(q_idx[q0+start:q0+end], pooled[:width])
                        if tile_mask is None:
                            scores = mask_query_scores(raw, tile_counts, valid[:width])
                        else:
                            mask = tile_mask.columns[:,:width] >= tile_mask.limits[start:end].unsqueeze(1)
                            scores = raw.masked_fill(mask, -float("inf"))
                            del mask
                        del raw
                else:
                    pool, scales = _scoring_pool(cache)
                    scores = score_pooled_paged(
                        q_idx[q0+start:q0+end], pool, cache.pool_valid, block_row,
                        tile_counts, int(meta.pages_per_block), n_blocks=max(tile_counts),
                        scales=scales,
                    )
                if tile_mask is None:
                    counts_t = torch.tensor(tile_counts, device=query3.device, dtype=torch.int32)
                    cells_t = torch.tensor(tile_cells, device=query3.device, dtype=torch.int32)
                else:
                    counts_t = tile_mask.counts[start:end]
                    cells_t = tile_mask.cells[start:end]
                visible = _visible_graph(scores, counts_t, cells_t, hyper,
                                         int(hyper.budget) + int(hyper.ratio), premasked=True,
                                         stable_ties=True)
                if use_gemm and len(requests) == 1:
                    _owned_capture(q_idx[q0+start:q0+end], pooled[:scores.shape[1]],
                                   valid[:scores.shape[1]], scores, visible,
                                   tile_counts, tile_cells, block_row, cache, weights, hyper,
                                   layer_idx, start, seq_len, int(meta.pages_per_block))
                piece = attend_decode_direct(query3[q0+start:q0+end], views, block_row,
                                             visible, int(meta.pages_per_block))
                staged[q0+start:q0+end].copy_(piece)
                del scores, counts_t, cells_t, visible, piece
            if use_gemm:
                del pooled, valid
            del tile_mask
        out3[:n].copy_(staged)
        if qsa_stats_enabled():
            note_qsa_width(int(hyper.budget) + int(hyper.ratio))
        _mark(query, meta, "sparse_ok")
        return True
    if (
        os.environ.get("K8V4_QSA_SHARED", "0") == "1"
        and query3.device.type == "xpu"
        and len(requests) == 1
        and int(requests[0][2]) > 16
    ):
        from k8v4_v030.qsa_ops import attend_shared_prefill

        req, q0, q_len, seq_len = requests[0]
        print("QSA_SHARED enter q=%d seq=%s" % (q_len, seq_len), flush=True)
        block_row = meta.block_table[req]
        cells = cells_for_queries(seq_len, q_len)
        counts = [complete_blocks(cell, hyper.ratio) for cell in cells]
        if os.environ.get("K8V4_QSA_SHARED_LAST_SCORE", "0") == "1":
            # Shared attention consumes only scores[-1]; avoid scoring the other queries.
            from k8v4_v030.qsa_ops import score_pooled_gemm
            matrix, valid = cache.gather_blocks(block_row, counts[-1], int(meta.pages_per_block))
            last_query = q_idx[q0 + q_len - 1:q0 + q_len]
            raw = (score_pooled_gemm(last_query, matrix)
                   if os.environ.get("K8V4_QSA_GEMM_SCORE", "0") == "1"
                   else score_pooled(last_query, matrix))
            scores = mask_query_scores(raw, [counts[-1]], valid)
        else:
            scores, _ids = _request_scores(cache, q_idx[q0:q0 + q_len], block_row, counts, int(meta.pages_per_block), hyper, False)
        if scores is None:
            raise RuntimeError("shared QSA has no scores")
        views = bind_regions(kv_cache, layout)
        piece, visible = attend_shared_prefill(
            query3[q0:q0 + q_len], scores, counts, cells, views, block_row,
            int(meta.pages_per_block), hyper.n_sel,
        )
        out3[q0:q0 + q_len].copy_(piece)
        if qsa_stats_enabled():
            note_qsa_width(int(visible.shape[1]))
        _mark(query, meta, "sparse_ok")
        return True
    stage_t = time.perf_counter()
    plans = _plans(cache, q_idx, requests, meta, hyper)
    stage_t = _stage("plan", stage_t, "q=%d" % int(query3.shape[0]))
    if not qsa_force_all() and all(item[5] for item in plans):
        _mark(query, meta, "full_causal")
        return False
    views = bind_regions(kv_cache, layout)
    ratio = int(meta.pages_per_block)
    scale = float(getattr(impl, "scale", 0.0625))
    _widths: list[int] = []
    for req, q0, q_len, seq_len, visible, _full in plans:
        block_row = meta.block_table[req]
        if query3.device.type == "xpu" and os.environ.get("K8V4_QSA_DIRECT", "0") == "1":
            # Selected K8/V4 cells, one direct kernel. A gathered union SDPA
            # rereads most of a long context because nearby queries do not
            # share their top-2048 sets.
            piece = attend_decode_k8v4(
                query3[q0 : q0 + q_len],
                views,
                block_row,
                visible,
                ratio,
            )
        elif query3.device.type != "xpu":
            piece = attend_selected(
                query3[q0 : q0 + q_len], views, block_row, seq_len, visible, ratio
            )
        elif int(q_len) > 16 and int(seq_len) <= 65536:
            piece = _masked_prefill(
                query3[q0 : q0 + q_len],
                views,
                block_row,
                int(seq_len),
                visible,
                ratio,
                scale,
            )
        elif int(q_len) <= 16:
            piece = attend_decode_k8v4(
                query3[q0 : q0 + q_len],
                views,
                block_row,
                visible,
                ratio,
            )
        else:
            piece = attend_selected(
                query3[q0 : q0 + q_len],
                views,
                block_row,
                seq_len,
                visible,
                ratio,
            )
        out3[q0 : q0 + q_len].copy_(piece)
        if torch.is_tensor(visible):
            _widths.append(int(visible.shape[1]))
    if _widths and qsa_stats_enabled():
        note_qsa_width(max(_widths))
    stage_t = _stage("attn", stage_t, "q=%d" % int(query3.shape[0]))
    _mark(query, meta, "sparse_ok")
    return True



_DECODE_BLOCKS = 65536


def _short_decode_spans(meta, n: int):
    """Per-request ``(req, q0, q_len)`` when every live query is decode-sized.

    QSA treats ``q_len <= 16`` as decode (MTP6 is 7). Prefill and a split
    request return (). Query starts are already on the host. This does not
    read ``seq_lens`` values, so it cannot sync the device.
    """
    starts = tuple(meta.query_starts)
    try:
        lengths = query_lengths(starts)
    except ValueError:
        return ()
    spans = []
    covered = 0
    req = 0
    for q_len in lengths:
        if q_len == 0:
            req += 1
            continue
        if covered >= n:
            break
        if q_len > 16 or covered + q_len > n:
            return ()
        spans.append((req, covered, q_len))
        covered += q_len
        req += 1
    if covered != n or not spans:
        return ()
    seq = getattr(meta, "seq_lens", None)
    table = getattr(meta, "block_table", None)
    if not torch.is_tensor(seq) or not torch.is_tensor(table):
        return ()
    last = spans[-1][0]
    if int(seq.shape[0]) < last + 1 or int(table.shape[0]) < last + 1:
        return ()
    return tuple(spans)


def _one_decode_span(starts, n: int) -> bool:
    """True when every token is one request and later slots are empty."""
    if len(starts) < 2 or int(starts[1]) - int(starts[0]) != int(n):
        return False
    end = int(starts[1])
    return all(int(item) == end for item in starts[2:])



_IDENTITY_PAGES = {}


def _identity_pages(device) -> torch.Tensor:
    """Page table that makes qsa_score_paged read pooled row ``block``."""
    key = str(device)
    found = _IDENTITY_PAGES.get(key)
    if found is None:
        if _capturing():
            raise RuntimeError("QSA identity page table allocated during capture")
        n_pages = (_DECODE_BLOCKS * 4 + 63) // 64
        found = torch.arange(n_pages, dtype=torch.int32, device=device)
        _IDENTITY_PAGES[key] = found
    return found


def _pooled_scales(cache):
    """FP32 per-row scales when pooled keys are INT8, else ``None``."""
    return getattr(cache, "pooled_scale", None)


def _scoring_pool(cache, *, batched: bool = False):
    """Pooled tensor for the score kernel, plus scales when it is still int8.

    The compact int8 cache keeps ``pooled_fp32`` aligned with the rows the
    writer stored. Scoring that mirror skips the full-pool cast. Batched
    decode prefers native INT8 loads when the companion kernel supports them.
    """
    if batched and cache.pooled.dtype == torch.int8:
        from k8v4_v030.qsa_batch_score import batch_ops, _batched_i8_kernel

        scales = _pooled_scales(cache)
        if _batched_i8_kernel(batch_ops(), cache.pooled, scales):
            return cache.pooled, scales
    mirror = getattr(cache, "pooled_fp32", None)
    if torch.is_tensor(mirror):
        return mirror, None
    return cache.pooled, _pooled_scales(cache)


def _logical_blocks(cache, count: int):
    """Pooled logical blocks ``[0, count)``. Row ``b`` is tokens ``4b .. 4b+3``.

    INT8 storage is expanded to FP32 with ``cache.pooled_scale`` so callers
    keep scoring floating rows.
    """
    from k8v4_v030.qsa_pooled_quant import dequantize_pooled_rows
    count = int(count)
    scales = _pooled_scales(cache)
    if count < 1:
        rows = cache.pooled[:0]
        if rows.dtype == torch.int8:
            rows = dequantize_pooled_rows(rows, None if scales is None else scales[:0])
        return rows, cache.pool_valid[:0]
    n_rows = int(cache.pooled.shape[0])
    if count > n_rows:
        raise RuntimeError(
            "QSA logical blocks %d exceed the indexer allocation %d" % (count, n_rows)
        )
    rows = cache.pooled[:count]
    if rows.dtype == torch.int8:
        rows = dequantize_pooled_rows(rows, None if scales is None else scales[:count])
    return rows, cache.pool_valid[:count]


def _c4_graph_spans(meta, n):
    """Admit descriptor-stable, unpadded MTP6 verifier rosters.

    Capture sizes are 7 tokens per request through 8 requests (56).
    A 9-request batch is outside max-num-seqs 8 and stays on the eager path.

    FULL_DECODE_ONLY keys encode uniform=True and num_tokens/7 requests.
    A general FULL key does not encode query spans and must never use this
    Python-unrolled route. Request identities may reorder: tensor rows, not
    host identities, own all stores and reads.
    """
    if n not in (7, 14, 21, 28, 35, 42, 49, 56):
        return ()
    reqs = n // 7
    exact = _verified_v2_graph_descriptor()
    if exact is not None:
        # The exact key already names this roster. Do not read the forward
        # context again here; the padding helper does that itself.
        if exact.num_tokens != n or _verified_v2_graph_padding(n, meta.seq_lens.device) is None:
            return ()
    else:
        from vllm.forward_context import get_forward_context
        ctx = get_forward_context()
        desc = getattr(ctx, "batch_descriptor", None)
        if (n == 7 or desc is None or not desc.uniform or desc.num_tokens != n
                or desc.num_reqs != reqs or getattr(ctx, "is_padding", None) is not None):
            return ()
    starts = tuple(meta.query_starts)
    expected = tuple(range(0, n + 1, 7))
    if starts[:reqs + 1] != expected or any(x != n for x in starts[reqs + 1:]):
        return ()
    if int(meta.seq_lens.shape[0]) < reqs or int(meta.block_table.shape[0]) < reqs:
        return ()
    slots = getattr(meta, "slot_mapping", None)
    if slots is None or slots.ndim != 1 or int(slots.shape[0]) < n:
        return ()
    return tuple((r, r * 7, 7) for r in range(reqs))


def _prepare_graph_decode(query3, out3, hidden, positions, meta, kv_cache, layout, hyper, weights, layer_idx, n):
    """Project, write the indexer, and return the tensors the score needs.

    No score launch. The c4 path scores every request in one call after this
    returns. Shapes stay fixed so a captured graph can replay them.
    """
    from k8v4_v030.qsa_batch_score import static_score_width

    pos4 = _positions(positions, n, [0], hidden.device)
    q_idx, k_raw = project_indexer(
        hidden[:n], weights.q_proj, weights.k_proj, weights.q_norm, weights.k_norm, hyper,
    )
    q_idx = apply_q_rope(q_idx, pos4, hyper)
    num_blocks, block_size = _geometry(kv_cache, meta, layout)
    cache = bank_for(layout.hkv).layer(layer_idx, num_blocks, block_size, hidden.device)
    seq = meta.seq_lens[0]
    idx = torch.arange(n, device=hidden.device)
    cells_t = (seq.to(device=hidden.device, dtype=torch.int64) - int(n)) + idx
    counts_t = torch.div(cells_t + 1, int(hyper.ratio), rounding_mode="floor").to(torch.int32)
    block_row = meta.block_table[0]
    ratio = max(int(meta.pages_per_block), 1)
    padding = getattr(meta, "_qsa_padding", None)
    valid = cells_t >= 0
    if padding is not None:
        valid = valid & ~padding
    # Substitute masked cells BEFORE the mapper indexes its block-table row.
    map_cells = torch.where(valid, cells_t, torch.zeros_like(cells_t)) if padding is not None else cells_t
    slots = cache.logical_slots(block_row, map_cells, ratio)
    slots = torch.where(valid, slots, torch.full_like(slots, -1))
    read_cells = cells_t
    if padding is not None:
        counts_t = torch.where(valid, torch.clamp_min(counts_t, 0), torch.zeros_like(counts_t))
        read_cells = torch.where(valid, cells_t, torch.full_like(cells_t, -1))
    _write_indexer_cache_native(
        cache, slots, k_raw, pos4, weights.k_block_norm, hyper, count_hit=True,
    )
    table_n = int(block_row.reshape(-1).shape[0])
    static_width = static_score_width(table_n, ratio, int(cache.pooled.shape[0]), _DECODE_BLOCKS)
    return {
        "q_idx": q_idx,
        "counts_t": counts_t,
        "block_row": block_row,
        "ratio": ratio,
        "valid": valid,
        "read_cells": read_cells,
        "padding": padding,
        "cells_t": cells_t,
        "static_width": static_width,
        "cache": cache,
        "n": n,
        "query3": query3,
        "out3": out3,
        "kv_cache": kv_cache,
        "layout": layout,
        "hyper": hyper,
        "layer_idx": layer_idx,
    }


def _attend_graph_decode(state, scores, shared_row: bool = False) -> None:
    """Top-k and sparse attention for one request.

    ``scores`` is ``[n, width]``. A shared historical row is ``[1, width]``
    with ``shared_row=True``: top-k runs once, then each query unions its
    own block. ``shared_row`` is constant for a captured graph.
    """
    from k8v4_v030.cache_views import bind_regions
    from k8v4_v030.qsa_ops import _visible_graph, attend_decode_direct

    n = int(state["n"])
    hyper = state["hyper"]
    padding = state["padding"]
    cells_t = state["cells_t"]
    visible = _visible_graph(
        scores, state["counts_t"], state["read_cells"].to(torch.int32), hyper,
        int(hyper.budget) + int(hyper.ratio), premasked=True,
        shared_row=shared_row,
    )
    if padding is not None:
        # A masked current-step token must not become an older query's KV read.
        relative = (visible.to(torch.int64) - cells_t[0]).clamp(0, n - 1)
        current = (visible >= cells_t[0]) & (visible <= cells_t[-1])
        visible = visible.masked_fill(padding.unsqueeze(1) | (current & padding[relative]), -1)
    views = bind_regions(state["kv_cache"], state["layout"])
    attend_decode_direct(
        state["query3"][:n], views, state["block_row"], visible, state["ratio"],
        out=state["out3"][:n],
    )
    _remember_visible(state["layer_idx"], visible)



def _bucketed_score_width(static_width, counts, *, capturing: bool) -> int:
    """Score columns for this decode step.

    A captured exact graph carries ``qsa_width_blocks``. Capture must launch
    that width even when the dummy sequence is short, because replay will not
    run this function again. Outside capture, the execute hook publishes the
    smallest bucket that covers the live sequences. Device counts stay unread.
    """
    from k8v4_v030.qsa_batch_score import scored_width

    static_width = int(static_width)
    desc = _verified_v2_graph_descriptor()
    baked = int(getattr(desc, "qsa_width_blocks", 0) or 0) if desc is not None else 0
    if baked > 0:
        return min(static_width, baked)
    try:
        from k8v4_v030.qsa_width import active_width_blocks
        live = int(active_width_blocks())
    except Exception:
        live = 0
    if live > 0:
        return min(static_width, live)
    host_counts = torch.is_tensor(counts) and torch.device(counts.device).type == "cpu"
    return scored_width(
        static_width, counts, capturing=bool(capturing), host_counts=host_counts,
    )


def _run_c4_graph_decode(query3, out3, hidden, positions, meta, kv_cache,
                         layout, hyper, weights, layer_idx, n, spans):
    """Score every c4 request in one paged launch, then attend each request.

    Projection, the indexer write, and attention stay per request. The four
    indexer scans do not. Capture launches the descriptor bucket, not the
    dummy sequence, so replay keeps that width. A live step uses the bucket
    published before dispatch. The companion kernel skips the pooled-key load
    past each count and on invalid pooled rows.
    """
    from copy import copy

    from k8v4_v030.qsa_batch_score import score_paged_multi

    pos4 = _positions(positions, n, [0], hidden.device)
    padding = _verified_v2_graph_padding(n, hidden.device)
    states = []
    for req, q0, width in spans:
        local = copy(meta)
        # Views retain the original storage; replay rereads advanced lengths
        # and remapped physical rows without any Python scalar synchronization.
        local.seq_lens = meta.seq_lens[req:req + 1]
        local.block_table = meta.block_table[req:req + 1]
        local.slot_mapping = meta.slot_mapping[q0:q0 + width]
        local._qsa_padding = None if padding is None else padding[q0:q0 + width]
        states.append(_prepare_graph_decode(
            query3[q0:q0 + width], out3[q0:q0 + width], hidden[q0:q0 + width],
            pos4[q0:q0 + width], local, kv_cache, layout, hyper, weights,
            layer_idx, width,
        ))
    if not states:
        raise RuntimeError("QSA c4 graph body has no spans")
    static = int(states[0]["static_width"])
    for state in states[1:]:
        if int(state["static_width"]) != static:
            raise RuntimeError("QSA c4 score width is not uniform")
    reps = []
    creps = []
    tables = []
    for state in states:
        rep = _first_live_index(state["n"], state["valid"], state["q_idx"].device)
        reps.append(state["q_idx"].index_select(0, rep))
        creps.append(state["counts_t"].reshape(-1).index_select(0, rep))
        row = state["block_row"].reshape(-1)
        if row.dtype != torch.int32:
            row = row.to(dtype=torch.int32)
        tables.append(row.contiguous())
    query_b = torch.cat(reps, 0)
    counts_b = torch.cat(creps, 0)
    table_b = torch.stack(tables, 0)
    capturing = _capturing()
    width_b = _bucketed_score_width(static, counts_b, capturing=capturing)
    seen_batches = getattr(_run_c4_graph_decode, "_logged_batches", None)
    if seen_batches is None:
        seen_batches = set()
        _run_c4_graph_decode._logged_batches = seen_batches
    batch_key = (len(states), bool(capturing), int(width_b))
    if batch_key not in seen_batches:
        seen_batches.add(batch_key)
        print(
            "QSA_GRAPH width=%d static=%d bt=%s capturing=%s batch=%d"
            % (width_b, static, tuple(table_b.shape), capturing, len(states)),
            flush=True,
        )
    cache = states[0]["cache"]
    pool, scales = _scoring_pool(cache, batched=True)
    rows = score_paged_multi(
        query_b, pool, cache.pool_valid, table_b, counts_b,
        states[0]["ratio"], width_b, scales=scales,
    )
    if int(rows.shape[0]) != len(states) or int(rows.shape[1]) != int(width_b):
        raise RuntimeError(
            "QSA batched scores %s do not match %d requests of width %d"
            % (tuple(rows.shape), len(states), int(width_b))
        )
    for index, state in enumerate(states):
        # One historical row. Top-k broadcasts the narrow selection; the
        # wide score matrix is not replicated for the seven MTP queries.
        _attend_graph_decode(state, rows[index:index + 1], shared_row=True)
    return True


def _run_graph_decode(query3, out3, hidden, positions, meta, kv_cache, layout, hyper, weights, layer_idx, n) -> bool:
    """Decode QSA with fixed tensor shapes so a full graph can replay it.

    The scored width is the block-table fit, clamped to the pooled indexer
    and to 65536 blocks (262144 tokens). Historical top-k is the first live
    query's score row. The narrow selection is broadcast, and each position
    still unions its own block. Python does not run again on replay; the
    cache-update counter is flushed from the metadata builder. One request
    still uses ``score_pooled_paged``. The c4 roster uses ``score_paged_multi``.
    """
    from k8v4_v030.qsa_ops import score_pooled_paged

    state = _prepare_graph_decode(
        query3, out3, hidden, positions, meta, kv_cache, layout, hyper, weights, layer_idx, n,
    )
    block_row = state["block_row"]
    capturing = _capturing()
    width = _bucketed_score_width(
        int(state["static_width"]), state["counts_t"], capturing=capturing,
    )
    if capturing and not getattr(_run_graph_decode, "_logged_cap", False):
        _run_graph_decode._logged_cap = True
        print("QSA_GRAPH width=%d bt=%s capturing=True" % (width, tuple(block_row.shape)), flush=True)
    elif not capturing and not getattr(_run_graph_decode, "_logged", False):
        _run_graph_decode._logged = True
        print("QSA_GRAPH width=%d bt=%s capturing=False" % (width, tuple(block_row.shape)), flush=True)
    cache = state["cache"]
    ratio = state["ratio"]
    # One historical selection per step. Top-k sees the single score row.
    # ``_visible_graph`` broadcasts that selection and unions each own block.
    scores = _score_once_and_expand(
        state["q_idx"],
        state["counts_t"],
        lambda q_rep, counts_rep: score_pooled_paged(
            q_rep, _scoring_pool(cache)[0], cache.pool_valid, block_row,
            counts_rep, ratio, n_blocks=width, scales=_scoring_pool(cache)[1],
        ),
        valid=state["valid"],
        expand=False,
    )
    _attend_graph_decode(state, scores, shared_row=True)
    return True


def _mark(query, meta, reason: str) -> None:
    """Count a fallback. The helper returns before any work when stats are off."""
    if qsa_stats_enabled():
        note_qsa(query, meta, reason)


_CACHE_ROPE_FREQ = {}
_CACHE_WEIGHT = {}


_LAYER_HITS: dict = {}
_LAYER_SEEN: dict = {}
_LAYER_DUMMY: dict = {}


def _device_key(device) -> str:
    """One key for ``xpu`` and ``xpu:0``. A mismatch drops the replay count."""
    dev = torch.device(device)
    if dev.type == "xpu" and dev.index is None:
        dev = torch.device("xpu", torch.xpu.current_device())
    return str(dev)


def ensure_layer_hits(device) -> None:
    """Allocate the replay counter before graph capture tries to."""
    key = _device_key(device)
    if key not in _LAYER_HITS:
        _LAYER_HITS[key] = torch.zeros(1, dtype=torch.int32, device=key)


def _hit_tensor(device, record: bool) -> torch.Tensor:
    key = _device_key(device)
    store = _LAYER_HITS if record else _LAYER_DUMMY
    tensor = store.get(key)
    if tensor is None:
        if _capturing():
            raise RuntimeError("QSA hit counter allocated during graph capture")
        tensor = torch.zeros(1, dtype=torch.int32, device=key)
        store[key] = tensor
    return tensor


_HIT_COPY: dict = {}
_HIT_EVENT: dict = {}


def flush_layer_hits(device) -> int:
    """Return hits from the last finished copy. Do not wait on the GPU.

    A blocking read here stalled every decode step and lost to dense.
    The copy is one step behind, which is still inside the generation.
    """
    key = _device_key(device)
    counter = _LAYER_HITS.get(key)
    if counter is None or _capturing():
        return 0
    slot = _HIT_COPY.get(key)
    if slot is None:
        slot = torch.empty(1, dtype=torch.int32, pin_memory=True)
        _HIT_COPY[key] = slot
    event = _HIT_EVENT.get(key)
    delta = 0
    ready = event is None
    if event is not None:
        try:
            ready = bool(event.query())
        except Exception:
            ready = False
    if ready and event is not None:
        current = int(slot[0])
        last = _LAYER_SEEN.get(key)
        _LAYER_SEEN[key] = current
        if last is not None and current >= last:
            delta = current - last
    if ready:
        slot.copy_(counter.detach(), non_blocking=True)
        try:
            recorded = torch.xpu.Event()
            recorded.record()
            _HIT_EVENT[key] = recorded
        except Exception:
            _HIT_EVENT[key] = None
            current = int(counter.item())
            last = _LAYER_SEEN.get(key)
            _LAYER_SEEN[key] = current
            if last is not None and current >= last:
                delta = current - last
    return delta


def _write_indexer_cache_native(cache, slots, keys, positions, weight, hyper, count_hit: bool = False):
    """Device-only decode write or explicit compact eager-prefill dispatch."""
    if (hyper.dim, hyper.ratio, hyper.n_rot, tuple(hyper.sections), hyper.theta) != (
            128, 4, 64, (11, 11, 10, 0), 10_000_000.0):
        raise RuntimeError("native QSA cache supports the Qwen3.8 indexer geometry")
    device = keys.device
    freq = _CACHE_ROPE_FREQ.get(device)
    if freq is None:
        step = float(hyper.theta) ** (-2.0 / float(hyper.n_rot))
        freq = torch.tensor([step ** p for p in range(32)], dtype=torch.float32, device=device)
        _CACHE_ROPE_FREQ[device] = freq
    # Copies during XPU graph capture wait on the recording queue and abort it.
    # The kernel reads these with their own strides. The norm weight is prepared
    # on the first eager call and reused.
    global _CACHE_WEIGHT
    try:
        _CACHE_WEIGHT
    except NameError:
        _CACHE_WEIGHT = {}
    wkey = (int(weight.data_ptr()), str(device))
    w = _CACHE_WEIGHT.get(wkey)
    if w is None:
        w = weight.detach().to(device=device, dtype=torch.float32).contiguous()
        _CACHE_WEIGHT[wkey] = w
    if getattr(cache, 'storage_contract', '') == 'xpu-fp32-physical-tail-v1':
        cache.write_tokens(slots,keys,positions,w)
        if count_hit:
            _hit_tensor(device,True).add_(cache.status.eq(0).to(dtype=torch.int32))
        return
    if cache.pooled.dtype == torch.int8:
        raise RuntimeError(
            "int8 pooled keys cannot use libxe2_qsa qsa_cache_update, which stores FP32. "
            "Use K8V4_QSA_COMPACT_TAIL=1 and the patched compact libraries from native-src/. "
            "Do not overwrite /compact-libs."
        )
    from k8v4_v030.qsa_ops import ops
    native = ops()
    if native is None or not hasattr(native, "qsa_cache_update"):
        raise RuntimeError("native QSA cache requires an updated libxe2_qsa.so")
    native.qsa_cache_update(slots, keys, positions, w, freq,
                            cache.raw, cache.pos, cache.filled, cache.pooled, cache.pool_valid,
                            float(hyper.eps), _hit_tensor(device, count_hit))


def _visible_tensor(visible, q_len: int, device: torch.device) -> torch.Tensor:
    if torch.is_tensor(visible):
        return visible.to(device=device, dtype=torch.long)
    width = 1
    for row in visible:
        if len(row) > width:
            width = len(row)
    out = torch.full((q_len, width), -1, dtype=torch.long, device=device)
    for i, row in enumerate(visible):
        if row:
            out[i, : len(row)] = torch.tensor(row, dtype=torch.long, device=device)
    return out


def _masked_prefill(query, views, block_row, seq_len: int, visible, pages_per_block: int, scale: float):
    """Full-cache attention with the QSA allow-mask.

    Unselected keys get score -inf, which is the author's prefill mask.
    The KV rows come from the same page gather the K8/V4 prefill uses.
    """
    if os.environ.get("K8V4_QSA_FUSED_PREFILL", "0") == "1" and query.device.type == "xpu":
        return _masked_prefill_onednn(query, views, block_row, seq_len, visible, pages_per_block, scale)
    key, value = gather_dequant(views, block_row, seq_len, pages_per_block, torch.float16)
    q_len, hq, _dim = query.shape
    hkv = int(key.shape[1])
    gqa = hq // hkv
    key = key.repeat_interleave(gqa, dim=1)
    value = value.repeat_interleave(gqa, dim=1)
    vis = _visible_tensor(visible, q_len, query.device)
    allow = torch.zeros(q_len, seq_len, dtype=torch.bool, device=query.device)
    valid = (vis >= 0) & (vis < seq_len)
    rows = torch.arange(q_len, device=query.device).view(-1, 1).expand_as(vis)
    allow[rows[valid], vis[valid]] = True
    mask = torch.zeros(q_len, seq_len, dtype=torch.float16, device=query.device)
    mask.masked_fill_(~allow, torch.finfo(torch.float16).min)
    attn = torch.nn.functional.scaled_dot_product_attention(
        query.to(torch.float16).transpose(0, 1).unsqueeze(0),
        key.transpose(0, 1).unsqueeze(0),
        value.transpose(0, 1).unsqueeze(0),
        attn_mask=mask,
        scale=float(scale),
    )
    return attn.squeeze(0).transpose(0, 1).contiguous().to(dtype=query.dtype)


def _masked_prefill_onednn(query, views, block_row, seq_len: int, visible,
                           pages_per_block: int, scale: float):
    """Reference-style mask on the fused oneDNN attention partition."""
    from k8v4_v030.onednn_prefill import sdpa_ops_for
    from k8v4_v030.prefill_gather_triton import gather_dequant_head_fused

    q_len, hq, _ = query.shape
    hkv = int(views["k"].shape[2])
    if hq % hkv:
        raise RuntimeError("QSA query heads do not match KV heads")
    gqa = hq // hkv
    vis = _visible_tensor(visible, q_len, query.device)
    ops = sdpa_ops_for(query.device.type)
    if ops is None or not hasattr(ops, "sdpa_masked"):
        raise RuntimeError("QSA fused prefill needs an updated K8V4_SDPA_LIB")
    out = torch.empty_like(query)
    # The float mask is bounded even at the 65,536-token cutoff. Every row
    # is independent, so splitting queries preserves the reference selection.
    limit = max(1, (128 << 20) // (seq_len * 4))
    override = int(os.environ.get("K8V4_QSA_MASK_CHUNK", "0"))
    chunk = max(1, min(q_len, limit, override if override > 0 else 1024))
    for head in range(hkv):
        key, value = gather_dequant_head_fused(views, block_row, seq_len, head,
                                               pages_per_block, torch.float16)
        k = key.view(1, seq_len, key.shape[-1])
        v = value.view(1, seq_len, value.shape[-1])
        for start in range(0, q_len, chunk):
            end = min(q_len, start + chunk)
            ids = vis[start:end]
            valid = (ids >= 0) & (ids < seq_len)
            rows = torch.arange(end-start, device=query.device).view(-1, 1).expand_as(ids)
            mask = torch.full((end-start, seq_len), float("-inf"), dtype=torch.float32, device=query.device)
            mask[rows[valid], ids[valid]] = 0.0
            q = query[start:end, head*gqa:(head+1)*gqa].transpose(0, 1).contiguous().to(torch.float16)
            scored = torch.empty_like(q)
            ops.sdpa_masked(q, k, v, mask, scored, float(scale))
            out[start:end, head*gqa:(head+1)*gqa].copy_(scored.transpose(0, 1))
    return out


def _over_budget(requests, hyper: QsaHyper) -> bool:
    """True when any query has more complete blocks than the selection budget."""
    for _req, _q0, q_len, seq_len in requests:
        for cell in cells_for_queries(seq_len, q_len):
            if complete_blocks(cell, hyper.ratio) > hyper.n_sel:
                return True
    return False


def _plans(cache, q_idx, requests, meta, hyper: QsaHyper):
    """``(req, q0, q_len, seq_len, visible, fully_causal)`` per request."""
    ratio = int(meta.pages_per_block)
    force = qsa_force_all()
    planned = []
    cursor = 0
    for req, q0, q_len, seq_len in requests:
        block_row = meta.block_table[req]
        q_req = q_idx[cursor : cursor + q_len]
        cursor += q_len
        cells = cells_for_queries(seq_len, q_len)
        counts = [complete_blocks(cell, hyper.ratio) for cell in cells]
        scores, device_ids = _request_scores(cache, q_req, block_row, counts, ratio, hyper, force)
        if device_ids is None:
            packed = packed_visible_rows(scores, counts, cells, hyper, force)
            # An XPU matrix stays on device and is handed to qsa_sparse_attn.
            # The full-causal check is one boolean, not the token lists.
            if packed.device.type != "cpu":
                # Direct sparse attention is also correct for a full causal
                # selection. Avoid synchronizing every layer just to choose
                # the optional dense fallback near the budget boundary.
                fully = True if force else (
                    False if os.environ.get("K8V4_QSA_DIRECT", "0") == "1"
                    else _packed_is_full_causal(packed, cells)
                )
                planned.append((req, q0, q_len, seq_len, packed, fully))
                continue
            visible_rows = rows_from_packed(packed)
        else:
            visible_rows = []
            for local, cell in enumerate(cells):
                row = None if scores is None else scores[local]
                chosen, width = choose_blocks(row, counts[local], cell, hyper, force, device_ids[local])
                visible_rows.append(visible_tokens(cell, chosen, width, hyper.ratio))
        fully = True
        for cell, tokens in zip(cells, visible_rows):
            if tokens != list(range(cell + 1)):
                fully = False
                break
        planned.append((req, q0, q_len, seq_len, visible_rows, fully))
    return planned


def _packed_is_full_causal(packed: torch.Tensor, cells: list[int]) -> bool:
    """True when every row is ``0 .. cell`` and nothing else.

    ``qsa_visible`` writes ascending unique cells ``<= cell`` and leaves
    ``-1`` after that prefix, so the row is the full causal set exactly
    when the prefix length is ``cell + 1``.
    """
    if int(packed.shape[0]) != len(cells):
        raise RuntimeError("QSA visible rows do not match queries")
    got = (packed >= 0).sum(dim=1)
    expect = torch.tensor([int(cell) + 1 for cell in cells], dtype=got.dtype, device=got.device)
    return bool(torch.equal(got, expect))


def _first_live_index(n: int, valid: torch.Tensor | None, device) -> torch.Tensor:
    """``[1]`` int64 index of the first live query. Device ops only."""
    if valid is None:
        return torch.zeros(1, dtype=torch.long, device=device)
    live = valid.reshape(-1)
    if int(live.shape[0]) != n:
        raise RuntimeError("QSA live mask does not match queries")
    if live.device != torch.device(device) or live.dtype != torch.bool:
        live = live.to(device=device, dtype=torch.bool)
    index = torch.arange(n, device=device, dtype=torch.long)
    missing = torch.full((n,), n, dtype=torch.long, device=device)
    first = torch.where(live, index, missing).min()
    fallback = torch.zeros((), dtype=torch.long, device=device)
    return torch.where(first < n, first, fallback).reshape(1)


def _score_once_and_expand(query, counts, score_one, valid=None, expand: bool = True):
    """Score the first live query and broadcast that historical row.

    One selection per MTP step. The caller unions each position's own block.
    Returned scores stay ``[queries, blocks]`` when ``expand`` is true, so an
    older captured top-k keeps its shape. ``expand=False`` leaves the
    ``[1, blocks]`` row for a shared top-k.
    """
    n = int(query.shape[0])
    if n < 1:
        raise RuntimeError("QSA score reuse needs a query")
    rep = _first_live_index(n, valid, query.device)
    q_rep = query.index_select(0, rep)
    counts_rep = counts
    if torch.is_tensor(counts):
        counts_rep = counts.reshape(-1).index_select(0, rep)
    elif counts is not None:
        if valid is not None:
            raise RuntimeError("QSA host counts cannot track a device live mask")
        counts_rep = [counts[0]]
    one = score_one(q_rep, counts_rep)
    if one.ndim != 2 or int(one.shape[0]) != 1:
        raise RuntimeError("QSA reused score row has shape %s" % (tuple(one.shape),))
    if n == 1 or not expand:
        return one
    return one.expand(n, int(one.shape[1])).contiguous()


def _reuse_short_decode(query, counts, hyper: QsaHyper) -> bool:
    """Eager MTP verify: a short span whose target query is past the budget.

    A prefill chunk that still starts inside the budget keeps per-query scores.
    ``q_len > 16`` is that prefill path and is unchanged.
    """
    n = int(query.shape[0])
    if n <= 1 or n > 16 or not counts:
        return False
    return int(counts[0]) > int(hyper.n_sel)


def _request_scores(cache, query, block_row, counts, pages_per_block: int, hyper: QsaHyper, force: bool,
                    cached_blocks=None):
    """``(scores, device_ids)`` for one request.

    XPU scores stay on device. ``packed_visible_rows`` turns them into the
    visible-token matrix with ``qsa_visible`` and does not copy ids back.
    CPU scores stay fp64 and are ranked by ``choose_blocks``. No scores are
    built when every query in the request is inside the budget.
    ``device_ids`` is only set by a caller that already ranked on the host.
    A short decode whose first query is past the budget reuses that query's
    score row. Later positions still add their own block in ``choose_blocks``.
    """
    if force or not counts or max(counts) <= hyper.n_sel:
        return None, None
    max_count = max(counts)
    reuse = _reuse_short_decode(query, counts, hyper)
    if (query.device.type == "xpu" and int(query.shape[0]) <= 16 and cached_blocks is None
            and os.environ.get("K8V4_QSA_PAGED_SCORE", "0") == "1"):
        if reuse:
            counts_t = torch.tensor(list(counts), dtype=torch.int32, device=query.device)
            return _score_once_and_expand(
                query,
                counts_t,
                lambda q_rep, counts_rep: score_pooled_paged(
                    q_rep, _scoring_pool(cache)[0], cache.pool_valid, block_row,
                    counts_rep, pages_per_block, n_blocks=max_count,
                    scales=_scoring_pool(cache)[1],
                ),
            ), None
        pool, scales = _scoring_pool(cache)
        return score_pooled_paged(
            query, pool, cache.pool_valid, block_row,
            counts, pages_per_block, n_blocks=max_count,
            scales=scales,
        ), None
    matrix, valid = (cache.gather_blocks(block_row, max_count, pages_per_block)
                     if cached_blocks is None else cached_blocks)
    use_kernel = (
        query.device.type == "xpu"
        and matrix.device.type == "xpu"
        and library_path() is not None
        and int(query.shape[1]) == 4
        and int(query.shape[2]) == 128
    )
    if use_kernel:
        if reuse:
            raw = _score_once_and_expand(
                query, None, lambda q_rep, _counts_rep: score_pooled(q_rep, matrix),
            )
            rep = int(counts[0])
            return mask_query_scores(raw, [rep] * int(query.shape[0]), valid), None
        raw = score_pooled(query, matrix)
        scores = mask_query_scores(raw, counts, valid)
        return scores, None
    q_cpu = query.detach().to(dtype=torch.float64, device="cpu")
    matrix_cpu = matrix.detach().to(dtype=torch.float64, device="cpu")
    valid_cpu = valid.detach().to(device="cpu")
    if reuse:
        raw = _score_once_and_expand(
            q_cpu, None, lambda q_rep, _counts_rep: score_blocks(q_rep, matrix_cpu),
        )
        rep = int(counts[0])
        return mask_query_scores(raw, [rep] * int(q_cpu.shape[0]), valid_cpu), None
    rows = [score_blocks(q_cpu[local], matrix_cpu) for local in range(int(q_cpu.shape[0]))]
    stacked = torch.stack(rows, dim=0) if rows else torch.zeros(0, max_count, dtype=torch.float64)
    scores = mask_query_scores(stacked, counts, valid_cpu)
    return scores, None


def _requests(meta, n_tokens: int) -> list[tuple[int, int, int, int]]:
    starts = tuple(int(x) for x in meta.query_starts)
    lengths = query_lengths(starts)
    if sum(lengths) < n_tokens:
        raise RuntimeError("query_start_loc covers %d tokens, step has %d" % (sum(lengths), n_tokens))
    out = []
    covered = 0
    for req, q_len in enumerate(lengths):
        if q_len == 0:
            continue
        if covered >= n_tokens:
            break
        if covered + q_len > n_tokens:
            raise RuntimeError("QSA step splits a request")
        seq_len = _request_seq_len(meta, req, q_len)
        out.append((req, covered, q_len, seq_len))
        covered += q_len
    if covered != n_tokens:
        raise RuntimeError("QSA requests cover %d of %d tokens" % (covered, n_tokens))
    return out


def _seq_len(meta, req: int) -> int:
    """Live corrected length. Never copies a device tensor to the host.

    CPU planners read ``meta.seq_lens`` in place, so a draft step that
    advances the tensor is visible without a host snapshot. XPU decode
    does not call this: ``_run_graph_decode`` indexes the same tensor.
    """
    seq = meta.seq_lens
    if torch.device(seq.device).type != "cpu":
        raise RuntimeError(
            "QSA keeps seq_lens on device; refusing a host sync for request %d" % int(req)
        )
    return int(seq[req].item())


def _prefill_host_seq_len(meta, req: int) -> int:
    """One host copy for the prefill planner.

    Decode does not use this. The list is not cleared between draft tokens,
    because those steps read ``meta.seq_lens`` on device. Sixteen full
    attention layers in one prefill share the copy.
    """
    cached = getattr(meta, "_qsa_prefill_seq_lens_cpu", None)
    if cached is None:
        cached = [int(v) for v in meta.seq_lens.detach().to(device="cpu").tolist()]
        meta._qsa_prefill_seq_lens_cpu = cached
    return int(cached[req])


def _request_seq_len(meta, req: int, q_len: int) -> int:
    """Host length for the Python planner.

    CPU reads stay live. Device prefill (``q_len > 16``) copies the batch
    once per metadata object. A device decode that did not take the graph
    body reads one live scalar and does not cache it, so a draft step that
    advances ``seq_lens`` in place cannot observe a stale host list.
    """
    if torch.device(meta.seq_lens.device).type == "cpu":
        return _seq_len(meta, req)
    if int(q_len) <= 16:
        return int(meta.seq_lens[req].item())
    return _prefill_host_seq_len(meta, req)


def _step_tokens(query: torch.Tensor, meta) -> int:
    n = int(query.shape[0])
    slots = getattr(meta, "slot_mapping", None)
    if slots is not None:
        n = min(n, int(slots.shape[0]))
    actual = getattr(meta, "num_actual_tokens", None)
    if actual:
        n = min(n, int(actual))
    return n


def _positions(positions, n: int, cells: list[int], device) -> torch.Tensor:
    if positions is None:
        pos = torch.tensor(cells, dtype=torch.int64, device=device)
        return normalize_positions(pos, n)
    pos = positions.detach()
    # [4, T] stays on the historical slice, including a rank>2 tensor whose
    # first axis is 4 and whose last axis is exactly this step.
    if pos.ndim >= 1 and int(pos.shape[-1]) == n and pos.shape[0] == 4:
        pos = pos[:, :n]
    elif pos.ndim == 2 and int(pos.shape[0]) in (1, 3) and int(pos.shape[1]) >= n:
        # Qwen3.8 forwards [3, T]. A single text row arrives as [1, T].
        # The token axis may be longer than this step. Two-axis tensors
        # are not a layout this model forwards.
        pos = pos[:, :n]
    elif pos.ndim >= 1 and int(pos.shape[0]) >= n and (pos.ndim == 1 or int(pos.shape[-1]) == 4):
        pos = pos[:n]
    elif pos.ndim == 2 and int(pos.shape[0]) >= n and int(pos.shape[-1]) in (1, 3):
        pos = pos[:n]
    else:
        # A leading batch of 1 is the other shape vLLM sometimes forwards.
        flat = pos.reshape(-1, pos.shape[-1]) if pos.ndim >= 2 else pos
        if flat.ndim == 2 and flat.shape[0] == 4 and flat.shape[1] >= n:
            pos = flat[:, :n]
        elif flat.ndim == 2 and int(flat.shape[0]) in (1, 3) and int(flat.shape[1]) >= n:
            pos = flat[:, :n]
        elif int(pos.numel()) == n:
            pos = pos.reshape(n)
        else:
            raise RuntimeError("QSA positions %s do not match %d tokens" % (tuple(pos.shape), n))
    return normalize_positions(pos, n)


def _geometry(cache: torch.Tensor, meta, layout: PageLayout) -> tuple[int, int]:
    if cache.ndim == 4:
        num_blocks = int(cache.shape[0])
        block_size = int(cache.shape[-2])
    elif cache.ndim == 1:
        if int(cache.numel()) % layout.page_bytes != 0:
            raise RuntimeError("QSA saw a K8/V4 blob that is not a whole number of pages")
        pages = int(cache.numel()) // layout.page_bytes
        explicit = getattr(meta, "qsa_block_tokens", None)
        block_size = int(explicit) if explicit else int(meta.pages_per_block) * PAGE
        if block_size % PAGE != 0:
            raise RuntimeError("QSA block is %d tokens, not a multiple of %d" % (block_size, PAGE))
        tokens = pages * PAGE
        if tokens % block_size != 0:
            raise RuntimeError("QSA blob tokens %d do not divide into blocks of %d" % (tokens, block_size))
        num_blocks = tokens // block_size
    else:
        raise RuntimeError("QSA cache rank %d" % cache.ndim)
    if num_blocks < 1 or block_size % PAGE != 0:
        raise RuntimeError("QSA cache geometry %d x %d" % (num_blocks, block_size))
    return num_blocks, block_size


def _as_heads(tensor: torch.Tensor, layout: PageLayout) -> torch.Tensor:
    if tensor.ndim == 3:
        if int(tensor.shape[1]) != layout.hq or int(tensor.shape[2]) != D:
            raise RuntimeError("QSA head view %s" % (tuple(tensor.shape),))
        return tensor
    if tensor.ndim == 2 and int(tensor.shape[1]) == layout.hq * D:
        return tensor.view(int(tensor.shape[0]), layout.hq, D)
    raise RuntimeError("QSA tensor shape %s" % (tuple(tensor.shape),))


def _pair_lists(copies) -> tuple[list[int], list[int]]:
    src: list[int] = []
    dst: list[int] = []
    if copies is None:
        return src, dst
    for item in copies:
        if hasattr(item, "src_block_id"):
            src.append(int(item.src_block_id))
            dst.append(int(item.dst_block_id))
        else:
            src_id, dst_id = item
            src.append(int(src_id))
            dst.append(int(dst_id))
    if len(src) != len(dst):
        raise ValueError("block copy pairs")
    return src, dst


def _capturing() -> bool:
    xpu = getattr(torch, "xpu", None)
    fn = getattr(xpu, "is_current_stream_capturing", None)
    if fn is None:
        return False
    try:
        return bool(fn())
    except Exception:
        return False


def _wrap_attention_classes() -> bool:
    found = False
    for module in list(sys.modules.values()):
        if module is None:
            continue
        name = getattr(module, "__name__", "")
        if "vllm" not in name:
            continue
        for cls_name in _ATTN_CLASSES:
            cls = getattr(module, cls_name, None)
            if isinstance(cls, type):
                _wrap_forward(cls)
                found = True
    return found


def _wrap_forward(cls: type) -> None:
    forward = cls.forward
    if getattr(forward, "_qsa_wrapped", False):
        return
    try:
        params = inspect.signature(forward).parameters
    except (TypeError, ValueError):
        return
    if "hidden_states" not in params or "positions" not in params:
        return
    original = forward

    def wrapped(self, positions, hidden_states, *args, **kwargs):
        # The stash is an op, not a ContextVar write inside the compiled
        # region. compiler.disable on this wrapper is rejected by Dynamo
        # ("Skip inlining") and is what forced the eager-only server.
        if torch.is_tensor(hidden_states) and torch.is_tensor(positions):
            layer_idx = _layer_idx_of_module(self)
            if layer_idx is not None:
                flag = torch.ops.vllm.qsa_stash(hidden_states, positions, int(layer_idx))
                hidden_states = hidden_states + flag.to(dtype=hidden_states.dtype)
        return original(self, positions, hidden_states, *args, **kwargs)

    wrapped._qsa_wrapped = True  # type: ignore[attr-defined]
    cls.forward = wrapped  # type: ignore[method-assign]


def _layer_idx_of_module(module) -> int | None:
    """Full-attention index from the inner Attention or this module's prefix."""
    names = []
    attn = getattr(module, "attn", None)
    if attn is not None:
        names.append(getattr(attn, "layer_name", ""))
    names.append(getattr(module, "prefix", ""))
    names.append(getattr(module, "layer_name", ""))
    for name in names:
        layer_idx = layer_index_from_name(str(name or ""))
        if layer_idx is not None and is_full_attention_layer(layer_idx):
            return layer_idx
    return None


def _stash_module(module, hidden, positions) -> None:
    attn = getattr(module, "attn", None)
    name = str(getattr(attn, "layer_name", "") or "")
    layer_idx = layer_index_from_name(name)
    if layer_idx is None or not is_full_attention_layer(layer_idx):
        return
    note_hidden(layer_idx, hidden, positions)


def _wrap_block_copy() -> None:
    try:
        import vllm.v1.worker.utils as utils
    except Exception:
        return
    original = getattr(utils, "copy_kv_cache_blocks_inplace", None)
    if original is None or getattr(original, "_qsa_wrapped", False):
        return

    def wrapped(kv_caches, num_blocks, kv_cache_block_copies):
        result = original(kv_caches, num_blocks, kv_cache_block_copies)
        apply_scheduled_copies(num_blocks, kv_cache_block_copies)
        return result

    wrapped._qsa_wrapped = True  # type: ignore[attr-defined]
    utils.copy_kv_cache_blocks_inplace = wrapped


# Injected only into the isolated exact-tiled eager runtime after selection.
def _owned_capture(q, matrix, valid, scores, visible, counts, cells, block_row, cache, weights, hyper, layer_idx, start, seq_len, pages_per_block):
    import os, pathlib, json, hashlib, time, torch
    root = pathlib.Path('/owned')
    if matrix.shape[0] < 8600 or not (root/'request-started').exists():
        return
    capture = getattr(torch.xpu, 'is_current_stream_capturing', None)
    if not callable(capture):
        raise RuntimeError('capture-state API unavailable')
    if capture():
        raise RuntimeError('refusing capture during graph recording')
    try:
        (root/'capture-lock').mkdir()
    except FileExistsError:
        return
    try:
        nr = min(8, int(q.shape[0]))
        rows = torch.linspace(0, int(q.shape[0])-1, nr, dtype=torch.int64, device=q.device)
        logical_tokens = torch.arange(int(matrix.shape[0]), dtype=torch.int64) * int(hyper.ratio)
        physical_ids = torch.div(cache.logical_slots(block_row, logical_tokens, int(pages_per_block)), int(hyper.ratio), rounding_mode='floor')
        data = {'query': q.index_select(0, rows).detach().cpu(), 'pooled': matrix.detach().cpu(),
                'valid': valid.detach().cpu(), 'masked_scores': scores.index_select(0,rows).detach().cpu(),
                'visible_tokens': visible.index_select(0,rows).detach().cpu(), 'physical_micro_ids': physical_ids.detach().cpu(),
                'block_row': block_row.detach().cpu(), 'rows': rows.cpu(),
                'counts': torch.tensor(counts, dtype=torch.int32).index_select(0, rows.cpu()),
                'cells': torch.tensor(cells, dtype=torch.int32).index_select(0, rows.cpu()),
                'weights': {name: getattr(weights,name).detach().cpu() for name in ('q_proj','k_proj','q_norm','k_norm','k_block_norm')},
                'metadata': {'layer_idx':int(layer_idx),'seq_len':int(seq_len),'tile_start':int(start),
                  'ratio':int(hyper.ratio),'n_sel':int(hyper.n_sel),'budget_tokens':int(hyper.budget),
                  'pages_per_block':int(pages_per_block),'rank':os.environ.get('LOCAL_RANK'),
                  'pid':os.getpid(),'time_ns':time.time_ns(),'score':'original masked production scorer output',
                  'heads_reduction':'unweighted sum of relu per-head dot products',
                  'graph_recording':False,'rows_sampled':nr}}
        tmp=root/'capture.pt.tmp'; dest=root/'capture.pt'
        torch.save(data,tmp); os.replace(tmp,dest)
        with dest.open('rb') as f: digest=hashlib.file_digest(f,'sha256').hexdigest()
        def desc(v):
            if isinstance(v,dict): return {k:desc(x) for k,x in v.items()}
            if isinstance(v,torch.Tensor): return {'shape':list(v.shape),'dtype':str(v.dtype)}
            return v
        info={'sha256':digest,'bytes':dest.stat().st_size,'contents':desc(data)}
        (root/'capture-manifest.json').write_text(json.dumps(info,indent=2))
    except Exception as exc:
        (root/'capture-error.txt').write_text(repr(exc))
        raise
