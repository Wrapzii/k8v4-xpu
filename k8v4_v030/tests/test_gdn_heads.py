"""CPU contract tests for the head-parallel GDN kernel splice (native/gdn_heads_patch.py)."""
from __future__ import annotations

import importlib.util
import tempfile
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('gdn_heads_patch', HERE / 'native/gdn_heads_patch.py')
gdn = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gdn)

# The loop skeleton both kernels share in vllm-xpu-kernels 0.1.14.1, reduced to the anchored lines.
KERNEL = '''CUTE_DEVICE void %s(
    const int num_v_heads) {
  auto item = sycl::ext::oneapi::this_work_item::get_nd_item<3>();
  int chunk_id = item.get_group(1);
  const int global_chunk_range = item.get_group_range(1);
  for (int batch_id = 0; batch_id < batch_size; ++batch_id) {
    if (chunk_id >= cumsum_chunks) {
      pre_chunks = cumsum_chunks;
      continue;
    }

    while (chunk_id < cumsum_chunks) {
      const int chunk_start_offset = chunk_id * chunk_size;

      for (int v_head_id = 0; v_head_id < num_v_heads; ++v_head_id) {
        work(chunk_id, v_head_id);
      }
      chunk_id += global_chunk_range;
    }
    pre_chunks = cumsum_chunks;
  }
}
'''
SOURCE = ''.join(('template <typename T>\n' + KERNEL % name)
                 for name in ('chunk_compute_A_kernel', 'chunk_inverse_kernel', 'chunk_compute_wu_kernel'))
SOURCE += 'template <typename T>\nvoid launcher() {}\n'


class GdnHeadsPatchTest(unittest.TestCase):
    def test_both_kernels_iterate_flattened_units(self):
        out = gdn.patch_source(SOURCE)
        for name in ('chunk_compute_A_kernel', 'chunk_compute_wu_kernel'):
            body = out[out.index(name):out.index('\ntemplate <', out.index(name))]
            self.assertIn('int unit = item.get_group(1);', body)
            self.assertIn('while (unit < cumsum_chunks * num_v_heads) {', body)
            self.assertIn('const int chunk_id = unit / num_v_heads;', body)
            self.assertIn('const int v_head_id = unit % num_v_heads;', body)
            self.assertIn('unit += global_chunk_range;', body)
            self.assertNotIn('for (int v_head_id', body)
        inverse = out[out.index('chunk_inverse_kernel'):out.index('chunk_compute_wu_kernel')]
        self.assertIn('for (int v_head_id = 0; v_head_id < num_v_heads; ++v_head_id) {', inverse)
        self.assertEqual(out.count(gdn.MARKER), 2)

    def test_refuses_to_apply_twice(self):
        with self.assertRaisesRegex(RuntimeError, 'already applied'):
            gdn.patch_source(gdn.patch_source(SOURCE))

    def test_refuses_unknown_source(self):
        changed = SOURCE.replace('      chunk_id += global_chunk_range;\n', '      chunk_id += 1;\n', 1)
        with self.assertRaisesRegex(RuntimeError, 'unknown source'):
            gdn.patch_source(changed)
        with self.assertRaisesRegex(RuntimeError, 'expected one'):
            gdn.patch_source(SOURCE.replace('chunk_compute_wu_kernel', 'other_kernel'))

    def test_main_patches_tree_in_place(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / gdn.TARGET
            path.parent.mkdir(parents=True)
            path.write_text(SOURCE)
            self.assertEqual(gdn.main(['gdn_heads_patch.py', temp]), 0)
            self.assertEqual(path.read_text(), gdn.patch_source(SOURCE))
            self.assertEqual(gdn.main(['gdn_heads_patch.py']), 2)


if __name__ == '__main__':
    unittest.main()
