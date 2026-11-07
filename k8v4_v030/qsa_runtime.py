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
    _LAST_HIDDEN[int(layer_idx)] = (hidden, positions)


def take_hidden(layer_idx: int) -> tuple[torch.Tensor, torch.Tensor | None] | None:
    """Return the stash for ``layer_idx``.

    A capture pass can drop the ContextVar write and still have the op's
    dict entry. Replay does not call this.
    """
    got = _STASH.get()
    _STASH.set(None)
    if got is not None and int(got[0]) == int(layer_idx):
        return got[1], got[2]
    return _LAST_HIDDEN.get(int(layer_idx))


def clear_hidden() -> None:
    _STASH.set(None)


def layer_index_from_name(name: str) -> int | None:
    """Parse ``layers.{i}``. MTP prefixes are left dense."""
    text = str(name or "")
    if "mtp" in text.lower():
        return None
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
    if _capturing() and not (
        os.environ.get("K8V4_QSA_GRAPH", "0") == "1" and n_live <= 16
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
    if os.environ.get("K8V4_QSA_GRAPH", "0") == "1" and n <= 16:
        starts = tuple(meta.query_starts)
        # Capture pads query_start_loc out to max_num_seqs. A real one-request
        # decode is the same shape: one span of n and then empty tails.
        if _one_decode_span(starts, n) and positions is not None:
            if _run_graph_decode(
                query3, out3, hidden, positions, meta, kv_cache, layout, hyper, weights, layer_idx, n
            ):
                return True
        if _capturing():
            if not getattr(try_sparse_forward, "_span_logged", False):
                try_sparse_forward._span_logged = True
                print(
                    "QSA_GRAPH skip starts=%s n=%s pos=%s" % (starts, n, positions is not None),
                    flush=True,
                )
            clear_hidden()
            _mark(query, meta, "capturing")
            return False
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
    slots = meta.slot_mapping.detach().to(dtype=torch.int64)
    lengths = query_lengths(tuple(int(x) for x in meta.query_starts))
    if (os.environ.get("K8V4_QSA_NATIVE_CACHE", "0") == "1" and hidden.device.type == "xpu"
            and n <= 128 and lengths and max(lengths) <= 16):
        if cache.lazy:
            last_slot = getattr(meta, "_qsa_max_slot", None)
            if last_slot is None:
                last_slot = int(slots[:n].max().item())
                meta._qsa_max_slot = last_slot
            cache.ensure_capacity(last_slot)
        _write_indexer_cache_native(cache, slots[:n], k_raw, pos4, weights.k_block_norm, hyper)
    else:
        write_t = time.perf_counter()
        cache.write_tokens(slots[:n], k_raw, pos4, weights.k_block_norm)
        _stage("write", write_t, "n=%d" % int(n))
    # Every query with count <= n_sel keeps every causal block. Scoring cannot
    # change that, so the packed dense kernel still produces the output.
    # count == n_sel + 1 can collapse back to a full set once the own block is
    # forced in, so that case is scored and checked below.
    if not qsa_force_all() and not _over_budget(requests, hyper):
        _mark(query, meta, "within_budget")
        return False
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


def _one_decode_span(starts, n: int) -> bool:
    """True when every token is one request and later slots are empty."""
    if len(starts) < 2 or int(starts[1]) - int(starts[0]) != int(n):
        return False
    end = int(starts[1])
    return all(int(item) == end for item in starts[2:])


def _run_graph_decode(query3, out3, hidden, positions, meta, kv_cache, layout, hyper, weights, layer_idx, n) -> bool:
    """Decode QSA with fixed tensor shapes so a full graph can replay it.

    The scored width is the block-table fit, clamped to the pooled indexer
    and to 65536 blocks (262144 tokens). A column past the query's own count
    is -inf, and the visible row is still the top 2048 tokens plus the query
    block. Python does not run again on replay; the cache-update counter is
    flushed from the metadata builder.
    """
    from k8v4_v030.cache_views import bind_regions
    from k8v4_v030.qsa_ops import _visible_graph, attend_decode_direct, score_pooled_paged

    pos4 = _positions(positions, n, [0], hidden.device)
    q_idx, k_raw = project_indexer(
        hidden[:n], weights.q_proj, weights.k_proj, weights.q_norm, weights.k_norm, hyper,
    )
    q_idx = apply_q_rope(q_idx, pos4, hyper)
    num_blocks, block_size = _geometry(kv_cache, meta, layout)
    cache = bank_for(layout.hkv).layer(layer_idx, num_blocks, block_size, hidden.device)
    slots = meta.slot_mapping.detach().to(dtype=torch.int64)
    if not _capturing() and cache.lazy:
        last_slot = getattr(meta, "_qsa_max_slot", None)
        if last_slot is None:
            last_slot = int(slots[:n].max().item())
            meta._qsa_max_slot = last_slot
        cache.ensure_capacity(last_slot)
    _write_indexer_cache_native(
        cache, slots[:n], k_raw, pos4, weights.k_block_norm, hyper, count_hit=True,
    )
    seq = meta.seq_lens[0]
    idx = torch.arange(n, device=hidden.device)
    cells_t = (seq.to(device=hidden.device, dtype=torch.int64) - int(n)) + idx
    counts_t = torch.div(cells_t + 1, int(hyper.ratio), rounding_mode="floor").to(torch.int32)
    block_row = meta.block_table[0]
    ratio = max(int(meta.pages_per_block), 1)
    table_n = int(block_row.reshape(-1).shape[0])
    fit = max(1, (table_n * ratio * 64) // 4 - 1)
    pooled_blocks = max(1, int(cache.pooled.shape[0]))
    width = min(_DECODE_BLOCKS, fit, pooled_blocks)
    capturing = _capturing()
    if capturing and not getattr(_run_graph_decode, "_logged_cap", False):
        _run_graph_decode._logged_cap = True
        print("QSA_GRAPH width=%d bt=%s capturing=True" % (width, tuple(block_row.shape)), flush=True)
    elif not capturing and not getattr(_run_graph_decode, "_logged", False):
        _run_graph_decode._logged = True
        print("QSA_GRAPH width=%d bt=%s capturing=False" % (width, tuple(block_row.shape)), flush=True)
    scores = score_pooled_paged(
        q_idx, cache.pooled, cache.pool_valid, block_row, counts_t, ratio, n_blocks=width,
    )
    visible = _visible_graph(
        scores, counts_t, cells_t.to(torch.int32), hyper,
        int(hyper.budget) + int(hyper.ratio), premasked=True,
    )
    views = bind_regions(kv_cache, layout)
    attend_decode_direct(query3[:n], views, block_row, visible, ratio, out=out3[:n])
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
    """Decode-sized, device-only cache write and reference block pooling."""
    from k8v4_v030.qsa_ops import ops

    if (hyper.dim, hyper.ratio, hyper.n_rot, tuple(hyper.sections), hyper.theta) != (
            128, 4, 64, (11, 11, 10, 0), 10_000_000.0):
        raise RuntimeError("native QSA cache supports the Qwen3.8 indexer geometry")
    device = keys.device
    freq = _CACHE_ROPE_FREQ.get(device)
    if freq is None:
        step = float(hyper.theta) ** (-2.0 / float(hyper.n_rot))
        freq = torch.tensor([step ** p for p in range(32)], dtype=torch.float32, device=device)
        _CACHE_ROPE_FREQ[device] = freq
    native = ops()
    if native is None or not hasattr(native, "qsa_cache_update"):
        raise RuntimeError("native QSA cache requires an updated libxe2_qsa.so")
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


def _request_scores(cache, query, block_row, counts, pages_per_block: int, hyper: QsaHyper, force: bool,
                    cached_blocks=None):
    """``(scores, device_ids)`` for one request.

    XPU scores stay on device. ``packed_visible_rows`` turns them into the
    visible-token matrix with ``qsa_visible`` and does not copy ids back.
    CPU scores stay fp64 and are ranked by ``choose_blocks``. No scores are
    built when every query in the request is inside the budget.
    ``device_ids`` is only set by a caller that already ranked on the host.
    """
    if force or not counts or max(counts) <= hyper.n_sel:
        return None, None
    max_count = max(counts)
    if (query.device.type == "xpu" and int(query.shape[0]) <= 16 and cached_blocks is None
            and os.environ.get("K8V4_QSA_PAGED_SCORE", "0") == "1"):
        return score_pooled_paged(query, cache.pooled, cache.pool_valid, block_row,
                                  counts, pages_per_block), None
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
        raw = score_pooled(query, matrix)
        scores = mask_query_scores(raw, counts, valid)
        return scores, None
    q_cpu = query.detach().to(dtype=torch.float64, device="cpu")
    matrix_cpu = matrix.detach().to(dtype=torch.float64, device="cpu")
    rows = [score_blocks(q_cpu[local], matrix_cpu) for local in range(int(q_cpu.shape[0]))]
    stacked = torch.stack(rows, dim=0) if rows else torch.zeros(0, max_count, dtype=torch.float64)
    scores = mask_query_scores(stacked, counts, valid.detach().to(device="cpu"))
    return scores, None


def _requests(meta, n_tokens: int) -> list[tuple[int, int, int, int]]:
    starts = tuple(int(x) for x in meta.query_starts)
    lengths = query_lengths(starts)
    if sum(lengths) < n_tokens:
        raise RuntimeError("query_start_loc covers %d tokens, step has %d" % (sum(lengths), n_tokens))
    out = []
    covered = 0
    for req, q_len in enumerate(lengths):
        if covered >= n_tokens:
            break
        if covered + q_len > n_tokens:
            raise RuntimeError("QSA step splits a request")
        seq_len = _seq_len(meta, req)
        out.append((req, covered, q_len, seq_len))
        covered += q_len
    if covered != n_tokens:
        raise RuntimeError("QSA requests cover %d of %d tokens" % (covered, n_tokens))
    return out


def _seq_len(meta, req: int) -> int:
    """Use the device's corrected lengths, not the optimistic CPU bound.

    Async MTP corrects rejected drafts on the device before constructing
    seq_lens. The metadata object is created for each forward; cache one
    device-to-host copy on it for the full-attention layers in that forward.
    This synchronization is temporary until selection is fully on device.
    """
    lengths = getattr(meta, "_qsa_actual_seq_lens", None)
    if lengths is None:
        lengths = meta.seq_lens.detach().to(device="cpu").tolist()
        meta._qsa_actual_seq_lens = lengths
    return int(lengths[req])


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
