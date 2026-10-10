"""vLLM tree patches: the registration edits and the skip-layer fp8 tool."""

from __future__ import annotations

import tempfile
import unittest
from pathlib import Path
import ast
import os
import subprocess
import sys


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


TOOL = Path(__file__).resolve().parents[2] / "tools" / "patch_vllm_skip_fp8.py"


class SkipFp8PatchTest(unittest.TestCase):
    """The skip-layer fp8 tool runs in a subprocess on a fake vllm tree.

    Importing it would patch this interpreter's real vllm install.
    """

    @staticmethod
    def _hunks() -> dict[str, list[tuple[str, str, str]]]:
        """(old, new, marker) triples per file, parsed out of the tool."""
        tree = ast.parse(TOOL.read_text(encoding="utf-8"))
        rel = {}
        for node in tree.body:
            if (
                isinstance(node, ast.Assign)
                and len(node.targets) == 1
                and isinstance(node.targets[0], ast.Name)
                and isinstance(node.value, ast.BinOp)
                and isinstance(node.value.op, ast.Div)
                and isinstance(node.value.right, ast.Constant)
            ):
                rel[node.targets[0].id] = node.value.right.value
        out: dict[str, list[tuple[str, str, str]]] = {}
        for node in tree.body:
            if (
                isinstance(node, ast.Expr)
                and isinstance(node.value, ast.Call)
                and isinstance(node.value.func, ast.Name)
                and node.value.func.id == "patch"
            ):
                triples = [ast.literal_eval(t) for t in node.value.args[1].elts]
                out[rel[node.value.args[0].id]] = triples
        return out

    def _write_tree(self, root: Path) -> None:
        hunks = self._hunks()
        self.assertGreater(len(hunks), 2)
        (root / "vllm").mkdir()
        (root / "vllm" / "__init__.py").write_text("", encoding="utf-8")
        for name, triples in hunks.items():
            target = root / "vllm" / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text("\n".join(old for old, _new, _marker in triples) + "\n", encoding="utf-8")

    def _run(self, root: Path) -> subprocess.CompletedProcess:
        env = dict(os.environ, PYTHONPATH=str(root))
        return subprocess.run(
            [sys.executable, str(TOOL)], capture_output=True, text=True, env=env
        )

    def test_unpatched_tree_patches_once_and_is_idempotent(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._write_tree(root)
            first = self._run(root)
            self.assertEqual(first.returncode, 0, first.stderr)
            self.assertIn("patched", first.stdout)
            for name, triples in self._hunks().items():
                text = (root / "vllm" / name).read_text(encoding="utf-8")
                for _old, new, marker in triples:
                    self.assertEqual(text.count(marker), 1, (name, marker))
                    self.assertIn(new, text)
            second = self._run(root)
            self.assertEqual(second.returncode, 0, second.stderr)
            self.assertIn("already patched", second.stdout)
            self.assertIn("present exactly once per hunk", second.stdout)

    def test_double_applied_tree_fails_loudly(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._write_tree(root)
            self.assertEqual(self._run(root).returncode, 0)
            # Duplicate one hunk's patched text, as a bad manual fixup would.
            name, triples = next(iter(self._hunks().items()))
            target = root / "vllm" / name
            _old, new, _marker = triples[0]
            text = target.read_text(encoding="utf-8")
            target.write_text(text.replace(new, new + new, 1), encoding="utf-8")
            result = self._run(root)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("marker present 2 times, expected exactly one", result.stderr)


if __name__ == "__main__":
    unittest.main()
