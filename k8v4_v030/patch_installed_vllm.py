"""Register ``int8_k_int4_v`` in an installed vLLM tree.

The stock image is not edited. The experimental image runs this against
each tree that ``import vllm`` might pick up. Running it twice is a no-op.
"""

from __future__ import annotations

import sys
from pathlib import Path

CACHE_DTYPE = "int8_k_int4_v"
BACKEND_PATH = "k8v4_v030.backend.Xe2K8V4AttentionBackend"

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


_DEFAULT_ROOTS = (
    Path("/opt/venv/lib/python3.12/site-packages/vllm"),
    Path("/workspace/vllm/vllm"),
    Path("/workspace/vllm/build/lib.linux-x86_64-cpython-312/vllm"),
)


def _splice(path: Path, old: str, new: str, label: str) -> str:
    text = path.read_text(encoding="utf-8")
    if CACHE_DTYPE in text and (label != "xpu" or BACKEND_PATH in text):
        return "unchanged"
    if old not in text:
        raise RuntimeError("%s is missing the %s anchor" % (path, label))
    path.write_text(text.replace(old, new, 1), encoding="utf-8")
    return "patched"


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
    return notes


def main(argv: list[str]) -> int:
    roots = tuple(Path(arg) for arg in argv) if argv else _DEFAULT_ROOTS
    for line in patch_installed(roots):
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
