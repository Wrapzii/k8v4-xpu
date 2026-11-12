"""Publication check stays a collective and can skip the host read."""
from __future__ import annotations

import os
import unittest

import torch

from k8v4_v030.qsa_compact_lifecycle import check_statuses_before_publication


class _Group:
    def __init__(self) -> None:
        self.calls = 0

    def all_reduce(self, tensor):
        self.calls += 1
        return tensor


class PublicationSyncTest(unittest.TestCase):
    def tearDown(self) -> None:
        os.environ.pop("K8V4_QSA_PUBLICATION_SYNC", None)

    def test_default_sync_raises_on_failure(self) -> None:
        os.environ["K8V4_QSA_PUBLICATION_SYNC"] = "1"
        status = torch.ones(1, dtype=torch.int32)
        group = _Group()
        with self.assertRaises(RuntimeError):
            check_statuses_before_publication([status], device=status.device, tp_group=group)
        self.assertEqual(group.calls, 1)

    def test_default_sync_accepts_a_healthy_flag(self) -> None:
        os.environ["K8V4_QSA_PUBLICATION_SYNC"] = "1"
        status = torch.zeros(1, dtype=torch.int32)
        group = _Group()
        check_statuses_before_publication([status], device=status.device, tp_group=group)
        self.assertEqual(group.calls, 1)

    def test_async_path_keeps_the_collective_and_does_not_raise(self) -> None:
        os.environ["K8V4_QSA_PUBLICATION_SYNC"] = "0"
        status = torch.ones(1, dtype=torch.int32)
        group = _Group()
        check_statuses_before_publication([status], device=status.device, tp_group=group)
        self.assertEqual(group.calls, 1)

    def test_async_path_called_twice_keeps_both_collectives(self) -> None:
        os.environ["K8V4_QSA_PUBLICATION_SYNC"] = "0"
        status = torch.ones(1, dtype=torch.int32)
        group = _Group()
        check_statuses_before_publication([status], device=status.device, tp_group=group)
        check_statuses_before_publication([status], device=status.device, tp_group=group)
        self.assertEqual(group.calls, 2)


if __name__ == "__main__":
    unittest.main()
