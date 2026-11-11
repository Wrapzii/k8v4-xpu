"""CPU checks for the QSA score-width buckets. No GPU."""

import unittest

from k8v4_v030.qsa_width import (
    bucket_for_blocks,
    blocks_needed,
    buckets,
    width_matches,
)


class WidthBucketTests(unittest.TestCase):
    def test_default_buckets_stay_inside_the_static_score(self):
        self.assertEqual(buckets(), (8192, 40960, 65536))

    def test_blocks_cover_the_audit_rungs(self):
        self.assertEqual(blocks_needed(8192), 2048)
        self.assertEqual(blocks_needed(8193), 2049)
        self.assertEqual(blocks_needed(131072), 32768)
        self.assertEqual(blocks_needed(262144), 65536)
        self.assertEqual(bucket_for_blocks(blocks_needed(8192)), 8192)
        self.assertEqual(bucket_for_blocks(blocks_needed(8193)), 8192)
        self.assertEqual(bucket_for_blocks(blocks_needed(20000)), 8192)
        self.assertEqual(bucket_for_blocks(blocks_needed(32768)), 8192)
        self.assertEqual(bucket_for_blocks(blocks_needed(32769)), 40960)
        self.assertEqual(bucket_for_blocks(blocks_needed(131072)), 40960)
        self.assertEqual(bucket_for_blocks(blocks_needed(131073)), 40960)
        self.assertEqual(bucket_for_blocks(blocks_needed(163840)), 40960)
        self.assertEqual(bucket_for_blocks(blocks_needed(163841)), 65536)
        self.assertEqual(bucket_for_blocks(blocks_needed(262144)), 65536)
        self.assertEqual(bucket_for_blocks(blocks_needed(300000)), 65536)

    def test_dispatch_matches_only_the_selected_bucket(self):
        widest = buckets()[-1]
        self.assertTrue(width_matches(8192, 8192, widest))
        self.assertFalse(width_matches(40960, 8192, widest))
        self.assertFalse(width_matches(65536, 8192, widest))
        self.assertTrue(width_matches(widest, 0, widest))
        self.assertTrue(width_matches(0, 0, widest))
        self.assertFalse(width_matches(8192, 0, widest))


if __name__ == "__main__":
    unittest.main()
