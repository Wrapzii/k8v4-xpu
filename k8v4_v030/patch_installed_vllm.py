"""Register ``int8_k_int4_v`` in an installed vLLM tree.

The stock image is not edited. The experimental image runs this against
each tree that ``import vllm`` might pick up. Running it twice is a no-op.
"""

from __future__ import annotations

import sys
from pathlib import Path

CACHE_DTYPE = "int8_k_int4_v"
BACKEND_PATH = "k8v4_v030.backend.Xe2K8V4AttentionBackend"
BACKEND_FILE = Path("/opt/k8v4/k8v4_v030/backend.py")

_CACHE_OLD = '    "nvfp4_4over6",\n]'
_CACHE_NEW = '    "nvfp4_4over6",\n    "int8_k_int4_v",\n]'
_TORCH_OLD = '    "turboquant_k8v4": torch.uint8,\n'
_TORCH_NEW = '    "turboquant_k8v4": torch.uint8,\n    "int8_k_int4_v": torch.uint8,\n'
_XPU_OLD = (
    '        kv_cache_dtype = attn_selector_config.kv_cache_dtype\n'
    '        if kv_cache_dtype is not None and kv_cache_dtype.startswith("turboquant_"):\n'
)
_XPU_NEW = (
    '        kv_cache_dtype = attn_selector_config.kv_cache_dtype\n'
    '        if kv_cache_dtype == "int8_k_int4_v":\n'
    '            logger.info_once("Using Xe2 K8/V4 attention backend.")\n'
    '            return "k8v4_v030.backend.Xe2K8V4AttentionBackend"\n'
    '        if kv_cache_dtype is not None and kv_cache_dtype.startswith("turboquant_"):\n'
)
_SINKS_MARK = 'sinks: torch.Tensor | None = None,'
_SINKS_OLD = (
    '        kv_sharing_target_layer_name: str | None = None,\n'
    '    ) -> None:\n'
)
_SINKS_NEW = (
    '        kv_sharing_target_layer_name: str | None = None,\n'
    '        sinks: torch.Tensor | None = None,\n'
    '    ) -> None:\n'
    '        # k8v4-sinks patch (draft-quality-plan Phase 1): vLLM 0.30 DFlash draft attention\n'
    '        # always passes sinks= (None unless the draft config sets attention_sink_bias).\n'
    '        # Accept the kwarg; sink bias itself is NOT implemented on this backend - fail\n'
    '        # loud rather than silently dropping a real bias.\n'
    '        if sinks is not None:\n'
    '            raise RuntimeError(\n'
    "                'Xe2K8V4Impl: attention sink bias (sinks) is not implemented on the k8v4 backend'\n"
    '            )\n'
)

_ISLAND_WRAP_OLD = '            return UnquantizedLinearMethod()\n'
_ISLAND_WRAP_NEW = (
    '            try:\n'
    '                from k8v4_v030.int8_island import maybe_island_method as _mk_island\n'
    '                _island = _mk_island(prefix)\n'
    '                if _island is not None:\n'
    '                    return _island\n'
    '            except ImportError:\n'
    '                pass\n'
    '            return UnquantizedLinearMethod()\n'
)


def _splice_island_wrap(path: Path) -> str:
    """Wrap the UnquantizedLinearMethod return so K8V4_INT8_ISLANDS modules
    get the int8 island method instead (see k8v4_v030/int8_island.py)."""
    text = path.read_text(encoding='utf-8')
    if 'maybe_island_method' in text:
        return 'unchanged'
    if text.count(_ISLAND_WRAP_OLD) != 1:
        raise RuntimeError('%s island anchor count %d' % (path, text.count(_ISLAND_WRAP_OLD)))
    path.write_text(text.replace(_ISLAND_WRAP_OLD, _ISLAND_WRAP_NEW, 1), encoding='utf-8')
    return 'patched'


_EMBED_COPY_OLD = '        param[: loaded_weight.shape[0]].data.copy_(loaded_weight)\n'
_EMBED_COPY_NEW = (
    '        try:  # k8v4: K8V4_UPLOAD_SLICE_MB (default 0 = this same single copy_)\n'
    '            from k8v4_v030.upload import copy_rows as _k8v4_copy_rows\n'
    '        except ImportError:\n'
    '            _k8v4_copy_rows = None\n'
    '        if _k8v4_copy_rows is None:\n'
    '            param[: loaded_weight.shape[0]].data.copy_(loaded_weight)\n'
    '        else:\n'
    '            _k8v4_copy_rows(param[: loaded_weight.shape[0]].data, loaded_weight)\n'
)


# vLLM 0.34 routes the same copy through model_executor.utils.copy_weight_
# (a plain copy_ off integrated GPUs).
_EMBED_COPY_OLD_034 = '        copy_weight_(param[: loaded_weight.shape[0]].data, loaded_weight)\n'
_EMBED_COPY_NEW_034 = (
    '        try:  # k8v4: K8V4_UPLOAD_SLICE_MB (default 0 = this same copy_weight_)\n'
    '            from k8v4_v030.upload import copy_rows as _k8v4_copy_rows\n'
    '        except ImportError:\n'
    '            _k8v4_copy_rows = None\n'
    '        if _k8v4_copy_rows is None:\n'
    '            copy_weight_(param[: loaded_weight.shape[0]].data, loaded_weight)\n'
    '        else:\n'
    '            _k8v4_copy_rows(param[: loaded_weight.shape[0]].data, loaded_weight)\n'
)


def _splice_embed_copy(path: Path) -> str:
    """Route VocabParallelEmbedding.weight_loader's table copy through k8v4_v030.upload.copy_rows,
    which is a plain copy_ unless K8V4_UPLOAD_SLICE_MB is set (see k8v4_v030/upload.py)."""
    text = path.read_text(encoding='utf-8')
    if '_k8v4_copy_rows' in text:
        return 'unchanged'
    for old, new in ((_EMBED_COPY_OLD, _EMBED_COPY_NEW), (_EMBED_COPY_OLD_034, _EMBED_COPY_NEW_034)):
        if text.count(old) == 1:
            path.write_text(text.replace(old, new, 1), encoding='utf-8')
            return 'patched'
    raise RuntimeError('%s embed copy anchor count %d (0.30) / %d (0.34)'
                       % (path, text.count(_EMBED_COPY_OLD), text.count(_EMBED_COPY_OLD_034)))


def _splice_all(path: Path, pairs: tuple[tuple[str, str], ...], mark: str) -> str:
    """Apply every (old, new) pair to one file, or none: each anchor must occur exactly once."""
    text = path.read_text(encoding="utf-8")
    if mark in text:
        return "unchanged"
    for old, new in pairs:
        if text.count(old) != 1:
            raise RuntimeError("%s anchor count %d for %r" % (path, text.count(old), old.splitlines()[0]))
        text = text.replace(old, new, 1)
    path.write_text(text, encoding="utf-8")
    return "patched"


_WARM_PREFIX_FILE = "v1/worker/gpu_worker.py"
_WARM_PREFIX_MARK = "K8V4_WARMUP_WARM_PREFIX"
_WARM_PREFIX_OLD = (
    '            warmup_kernels(self.model_runner, self.execute_model, self.sample_tokens)\n'
)
_WARM_PREFIX_NEW = _WARM_PREFIX_OLD + (
    '            try:  # k8v4: K8V4_WARMUP_WARM_PREFIX (default 0 = no extra warmup)\n'
    '                from k8v4_v030.warm_prefix_warmup import maybe_warmup as _k8v4_warm_prefix\n'
    '            except ImportError:\n'
    '                _k8v4_warm_prefix = None\n'
    '            if _k8v4_warm_prefix is not None:\n'
    '                _k8v4_warm_prefix(self)\n'
)


def patch_warm_prefix_warmup(root: Path) -> list[str]:
    """K8V4_WARMUP_WARM_PREFIX hook after vLLM's JIT warmup (k8v4_v030/warm_prefix_warmup.py)."""
    path = root / _WARM_PREFIX_FILE
    if not path.is_file():
        return []
    return ["warm_prefix_warmup:%s" % _splice_all(path, ((_WARM_PREFIX_OLD, _WARM_PREFIX_NEW),),
                                                  _WARM_PREFIX_MARK)]


_MTP_FILE = "model_executor/models/qwen3_5_mtp.py"
_EAGLE_FILE = "v1/worker/gpu/spec_decode/eagle/utils.py"
_DRAFT_SHARED_MARK = "K8V4_DRAFT_SKIP_SHARED"
_DRAFT_EMBED_OLD = (
    '        self.embed_tokens = VocabParallelEmbedding(\n'
    '            self.vocab_size,\n'
    '            config.hidden_size,\n'
    '        )\n'
)
_DRAFT_EMBED_NEW = (
    '        try:  # k8v4: K8V4_DRAFT_SKIP_SHARED (default 0 = full draft table)\n'
    '            from k8v4_v030.draft_shared import table_rows as _k8v4_rows\n'
    '        except ImportError:\n'
    '            _k8v4_rows = None\n'
    '        self.embed_tokens = VocabParallelEmbedding(\n'
    '            self.vocab_size if _k8v4_rows is None else _k8v4_rows(self.vocab_size, config),\n'
    '            config.hidden_size,\n'
    '        )\n'
)
_DRAFT_HEAD_OLD = (
    '            self.lm_head = ParallelLMHead(\n'
    '                config.vocab_size,\n'
    '                config.hidden_size,\n'
    '                quant_config=self.quant_config,\n'
)
_DRAFT_HEAD_NEW = (
    '            try:  # k8v4: K8V4_DRAFT_SKIP_SHARED (default 0 = full draft head)\n'
    '                from k8v4_v030.draft_shared import table_rows as _k8v4_rows\n'
    '            except ImportError:\n'
    '                _k8v4_rows = None\n'
    '            self.lm_head = ParallelLMHead(\n'
    '                config.vocab_size if _k8v4_rows is None else _k8v4_rows(config.vocab_size, config),\n'
    '                config.hidden_size,\n'
    '                quant_config=self.quant_config,\n'
)
_DRAFT_LOAD_OLD = (
    '        loader = AutoWeightsLoader(self)\n'
    '        return loader.load_weights(remap_weight_names(weights))\n'
)
_DRAFT_LOAD_NEW = (
    '        loader = AutoWeightsLoader(self)\n'
    '        try:  # k8v4: K8V4_DRAFT_SKIP_SHARED placeholders skip the shared tables\n'
    '            from k8v4_v030.draft_shared import load_without_shared as _k8v4_load\n'
    '        except ImportError:\n'
    '            _k8v4_load = None\n'
    '        if _k8v4_load is not None:\n'
    '            return _k8v4_load(self, loader, remap_weight_names(weights))\n'
    '        return loader.load_weights(remap_weight_names(weights))\n'
)
_DRAFT_CHECK_OLD = '    # MTP shares topk_indices_buffer with the target model. We update\n'
_DRAFT_CHECK_NEW = (
    '    try:  # k8v4: K8V4_DRAFT_SKIP_SHARED placeholders must now be the target tables\n'
    '        from k8v4_v030.draft_shared import check_replaced as _k8v4_check\n'
    '    except ImportError:\n'
    '        _k8v4_check = None\n'
    '    if _k8v4_check is not None:\n'
    '        _k8v4_check(eagle_model)\n'
    '\n' + _DRAFT_CHECK_OLD
)


def patch_draft_shared(root: Path) -> list[str]:
    """K8V4_DRAFT_SKIP_SHARED hooks: placeholder draft tables (qwen3_5_mtp.py), share check (eagle/utils.py)."""
    mtp, eagle = root / _MTP_FILE, root / _EAGLE_FILE
    if not (mtp.is_file() and eagle.is_file()):
        return []
    return [
        "draft_shared_mtp:%s" % _splice_all(
            mtp, ((_DRAFT_EMBED_OLD, _DRAFT_EMBED_NEW), (_DRAFT_HEAD_OLD, _DRAFT_HEAD_NEW),
                  (_DRAFT_LOAD_OLD, _DRAFT_LOAD_NEW)), _DRAFT_SHARED_MARK),
        "draft_shared_check:%s" % _splice_all(eagle, ((_DRAFT_CHECK_OLD, _DRAFT_CHECK_NEW),), _DRAFT_SHARED_MARK),
    ]


_DEFAULT_ROOTS = (
    Path("/opt/venv/lib/python3.12/site-packages/vllm"),
    Path("/workspace/vllm/vllm"),
    Path("/workspace/vllm/build/lib.linux-x86_64-cpython-312/vllm"),
)


def _splice(path: Path, old: str, new: str, label: str, done_mark: str | None = None) -> str:
    text = path.read_text(encoding="utf-8")
    if CACHE_DTYPE in text and (label != "xpu" or BACKEND_PATH in text):
        return "unchanged"
    if done_mark is not None and done_mark in text:
        return "unchanged"
    if old not in text:
        raise RuntimeError("%s is missing the %s anchor" % (path, label))
    path.write_text(text.replace(old, new, 1), encoding="utf-8")
    return "patched"


def patch_k8v4_backend(path: Path = BACKEND_FILE) -> str:
    """Accept sinks=None in the DFlash draft-attention path of the installed backend.

    Older images ship a backend whose __init__ lacks the ``sinks`` kwarg that
    vLLM 0.30 DFlash draft attention always passes; until the image is rebuilt
    from a fixed tree this splice applies the same change the launcher's
    bind-mount used to make. A real sink tensor still raises loudly.
    """
    if not path.is_file():
        raise RuntimeError("missing %s" % path)
    return _splice(path, _SINKS_OLD, _SINKS_NEW, "sinks", done_mark=_SINKS_MARK)


def patch_vllm_tree(root: Path) -> list[str]:
    """Patch one vLLM package root. Returns a status word per file."""
    root = Path(root)
    jobs = (
        (root / "config" / "cache.py", _CACHE_OLD, _CACHE_NEW, "cache"),
        (root / "utils" / "torch_utils.py", _TORCH_OLD, _TORCH_NEW, "torch_utils"),
        (root / "platforms" / "xpu.py", _XPU_OLD, _XPU_NEW, "xpu"),
    )
    notes: list[str] = []
    for path, old, new, label in jobs:
        if not path.is_file():
            raise RuntimeError("missing %s" % path)
        notes.append("%s:%s" % (label, _splice(path, old, new, label)))
    gptq_utils = root / "model_executor/layers/quantization/utils/gptq_utils.py"
    if gptq_utils.exists():
        notes.append("int8_island:%s" % _splice_island_wrap(gptq_utils))
    vocab = root / "model_executor/layers/vocab_parallel_embedding.py"
    if vocab.exists():
        notes.append("embed_copy:%s" % _splice_embed_copy(vocab))
    notes.extend(patch_warm_prefix_warmup(root))
    notes.extend(patch_draft_shared(root))
    return notes


def patch_installed(roots: tuple[Path, ...] = _DEFAULT_ROOTS) -> list[str]:
    notes: list[str] = []
    found = False
    for root in roots:
        if (root / "config" / "cache.py").is_file():
            found = True
            for item in patch_vllm_tree(root):
                notes.append("%s %s" % (root, item))
    if not found:
        raise RuntimeError("no vLLM tree found")
    if BACKEND_FILE.is_file():
        notes.append("%s sinks:%s" % (BACKEND_FILE, patch_k8v4_backend()))
    return notes


def main(argv: list[str]) -> int:
    roots = tuple(Path(arg) for arg in argv) if argv else _DEFAULT_ROOTS
    for line in patch_installed(roots):
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
