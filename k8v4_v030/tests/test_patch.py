"""The vLLM registration edits are idempotent and stay off the TurboQuant path."""

from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from k8v4_v030.patch_installed_vllm import BACKEND_PATH, patch_vllm_tree

CACHE = '''\
CacheDType = Literal[
    "auto",
    "nvfp4",
    "nvfp4_4over6",
]
'''
TORCH = '''\
STR_DTYPE_TO_TORCH_DTYPE = {
    "turboquant_k8v4": torch.uint8,
    "nvfp4_4over6": torch.uint8,
}
'''
XPU = '''\
    def get_attn_backend_cls(cls, selected_backend, attn_selector_config, num_heads=None):
        kv_cache_dtype = attn_selector_config.kv_cache_dtype
        if kv_cache_dtype is not None and kv_cache_dtype.startswith("turboquant_"):
            return AttentionBackendEnum.TURBOQUANT.get_path()
        return AttentionBackendEnum.FLASH_ATTN.get_path()
'''


class PatchTest(unittest.TestCase):
    def test_three_anchors_patch_once(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "config").mkdir()
            (root / "utils").mkdir()
            (root / "platforms").mkdir()
            (root / "config" / "cache.py").write_text(CACHE, encoding="utf-8")
            (root / "utils" / "torch_utils.py").write_text(TORCH, encoding="utf-8")
            (root / "platforms" / "xpu.py").write_text(XPU, encoding="utf-8")
            first = patch_vllm_tree(root)
            second = patch_vllm_tree(root)
            self.assertEqual(first, ["cache:patched", "torch_utils:patched", "xpu:patched"])
            self.assertEqual(second, ["cache:unchanged", "torch_utils:unchanged", "xpu:unchanged"])
            cache = (root / "config" / "cache.py").read_text(encoding="utf-8")
            torch_utils = (root / "utils" / "torch_utils.py").read_text(encoding="utf-8")
            xpu = (root / "platforms" / "xpu.py").read_text(encoding="utf-8")
            self.assertEqual(cache.count('"int8_k_int4_v"'), 1)
            self.assertIn('"nvfp4_4over6",\n    "int8_k_int4_v",', cache)
            self.assertEqual(torch_utils.count('"int8_k_int4_v"'), 1)
            self.assertLess(
                torch_utils.index("turboquant_k8v4"),
                torch_utils.index("int8_k_int4_v"),
            )
            self.assertLess(xpu.index('== "int8_k_int4_v"'), xpu.index('startswith("turboquant_")'))
            self.assertEqual(xpu.count('startswith("turboquant_")'), 1)
            self.assertIn(BACKEND_PATH, xpu)
            self.assertIn("return AttentionBackendEnum.TURBOQUANT.get_path()", xpu)
            self.assertIn("return AttentionBackendEnum.FLASH_ATTN.get_path()", xpu)


if __name__ == "__main__":
    unittest.main()
