"""Optional QSA path on top of dense K8/V4.

The flag is read on every forward. Off does not call this module. On, a
wrapped Qwen full-attention module stashes the post-norm hidden state, this
module writes the indexer cache, and sparse attention runs only when a query
would drop a block (or when ``K8V4_QSA_FORCE_ALL=1``). Otherwise the packed
or eager K8/V4 kernel runs and the output buffer is left untouched.

An XPU graph capture does not run the Python sparse loop. Until
``libxe2_qsa.so`` is providing the captured op, capture stays on dense
K8/V4 and does not write the indexer cache.
"""

from __future__ import annotations

import contextvars
import inspect
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
from k8v4_v030.qsa_ops import attend_selected, choose_blocks, library_path, mask_query_scores, score_pooled, topk_ids
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


def note_hidden(layer_idx: int, hidden: torch.Tensor, positions: torch.Tensor | None) -> None:
    """Record the hidden state for the matching ``impl.forward`` call."""
    _STASH.set((int(layer_idx), hidden, positions))


def take_hidden(layer_idx: int) -> tuple[torch.Tensor, torch.Tensor | None] | None:
    """Return and clear the stash when it belongs to ``layer_idx``."""
    got = _STASH.get()
    _STASH.set(None)
    if got is None or int(got[0]) != int(layer_idx):
        return None
    return got[1], got[2]


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
        if _wrap_attention_classes():
            _CLASSES_WRAPPED = True
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
        return False
    install_if_requested()
    if _capturing():
        clear_hidden()
        return False
    layer_idx = resolve_layer(layer)
    if layer_idx is None or not is_full_attention_layer(layer_idx):
        clear_hidden()
        return False
    bank = get_bank()
    weights = None if bank is None else bank.get(layer_idx)
    stashed = take_hidden(layer_idx)
    if weights is None or stashed is None:
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
        return False
    if int(hidden.shape[0]) < n or int(hidden.shape[-1]) != hyper.hidden:
        raise RuntimeError(
            "QSA hidden %s does not cover %d tokens of width %d"
            % (tuple(hidden.shape), n, hyper.hidden)
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
    slots = meta.slot_mapping.detach().to(dtype=torch.int64)
    cache.write_tokens(slots[:n], k_raw, pos4, weights.k_block_norm)
    # Every query with count <= n_sel keeps every causal block. Scoring cannot
    # change that, so the packed dense kernel still produces the output.
    # count == n_sel + 1 can collapse back to a full set once the own block is
    # forced in, so that case is scored and checked below.
    if not qsa_force_all() and not _over_budget(requests, hyper):
        return False
    plans = _plans(cache, q_idx, requests, meta, hyper)
    if not qsa_force_all() and all(item[5] for item in plans):
        return False
    views = bind_regions(kv_cache, layout)
    ratio = int(meta.pages_per_block)
    for req, q0, q_len, seq_len, visible, _full in plans:
        piece = attend_selected(
            query3[q0 : q0 + q_len],
            views,
            meta.block_table[req],
            seq_len,
            visible,
            ratio,
        )
        out3[q0 : q0 + q_len].copy_(piece)
    return True


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
        visible_rows: list[list[int]] = []
        fully = True
        for local, cell in enumerate(cells):
            row = None if scores is None else scores[local]
            picked = None if device_ids is None else device_ids[local]
            chosen, width = choose_blocks(row, counts[local], cell, hyper, force, picked)
            tokens = visible_tokens(cell, chosen, width, hyper.ratio)
            if tokens != list(range(cell + 1)):
                fully = False
            visible_rows.append(tokens)
        planned.append((req, q0, q_len, seq_len, visible_rows, fully))
    return planned


def _request_scores(cache, query, block_row, counts, pages_per_block: int, hyper: QsaHyper, force: bool):
    """``(scores, device_ids)`` for one request.

    ``device_ids`` is set when the XPU top-k kernel ranked the rows. CPU
    scores stay fp64 and are ranked by ``choose_blocks``. No scores are built
    when every query in the request is inside the budget.
    """
    if force or not counts or max(counts) <= hyper.n_sel:
        return None, None
    max_count = max(counts)
    matrix, valid = cache.gather_blocks(block_row, max_count, pages_per_block)
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
        ids = topk_ids(scores, hyper.n_sel).detach().to(device="cpu").tolist()
        return scores, ids
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
    cpu = getattr(meta, "seq_lens_cpu", None)
    if cpu is not None:
        return int(cpu[req])
    return int(meta.seq_lens[req])


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
    if pos.ndim >= 1 and int(pos.shape[-1]) == n and pos.shape[0] == 4:
        pos = pos[:, :n]
    elif pos.ndim >= 1 and int(pos.shape[0]) >= n and (pos.ndim == 1 or int(pos.shape[-1]) == 4):
        pos = pos[:n]
    else:
        # A leading batch of 1 is the other shape vLLM sometimes forwards.
        flat = pos.reshape(-1, pos.shape[-1]) if pos.ndim >= 2 else pos
        if flat.ndim == 2 and flat.shape[0] == 4 and flat.shape[1] >= n:
            pos = flat[:, :n]
        elif int(pos.numel()) == n or (pos.ndim == 2 and pos.shape[0] >= n):
            pos = pos[:n]
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
        _stash_module(self, hidden_states, positions)
        return original(self, positions, hidden_states, *args, **kwargs)

    wrapped._qsa_wrapped = True  # type: ignore[attr-defined]
    cls.forward = wrapped  # type: ignore[method-assign]


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
