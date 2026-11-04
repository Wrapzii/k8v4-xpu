"""Capacity retries must not hide driver faults or restart healthy processes."""
from __future__ import annotations

import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from tools.launch_tp1 import fitted_context, launch

CAPACITY_LOG = 'The maximum model length is too large: not enough memory to hold it. The estimated maximum model length is 133056.'


class CapacityTest(unittest.TestCase):
    def test_only_a_smaller_viable_capacity_estimate_is_accepted(self):
        self.assertEqual(fitted_context(CAPACITY_LOG, 262144), 133056)
        for logs, requested in ((CAPACITY_LOG, 133056), (CAPACITY_LOG, 131072),
                                (CAPACITY_LOG.replace('133056', '4096'), 262144),
                                ('The estimated maximum model length is 133056', 262144),
                                ('No available memory for the cache', 262144)):
            self.assertIsNone(fitted_context(logs, requested))

    def test_hardware_and_allocation_failures_do_not_fit(self):
        for fault in ('CAT error', 'device lost', 'out of memory', 'segmentation fault'):
            self.assertIsNone(fitted_context(CAPACITY_LOG + '\n' + fault, 262144))

    def test_stopped_capacity_failure_retries_and_records_effective_context(self):
        with tempfile.TemporaryDirectory() as cache:
            calls = []
            def run(args, **kwargs):
                calls.append((list(args), dict(kwargs.get('env', {}))))
                if args[0] == 'bash':
                    rc = 1 if kwargs['env']['K8V4_MAX_MODEL_LEN'] == '262144' else 0
                    return subprocess.CompletedProcess(args, rc)
                text = CAPACITY_LOG if args[1] == 'logs' else 'false\n'
                return subprocess.CompletedProcess(args, 0, stdout=text, stderr='')
            with patch.dict(os.environ, {'K8V4_FIT_CONTEXT': '1', 'K8V4_CACHE': cache}, clear=True), patch('tools.launch_tp1.subprocess.run', side_effect=run):
                self.assertEqual(launch(), 0)
            contexts = [env['K8V4_MAX_MODEL_LEN'] for args, env in calls if args[0] == 'bash']
            self.assertEqual(contexts, ['262144', '133056'])
            self.assertEqual((Path(cache) / 'startup/tp1-start-262144.log').read_text(), CAPACITY_LOG)

    def test_a_still_running_container_is_not_restarted(self):
        with tempfile.TemporaryDirectory() as cache:
            def run(args, **kwargs):
                if args[0] == 'bash':
                    return subprocess.CompletedProcess(args, 1)
                return subprocess.CompletedProcess(args, 0, stdout=CAPACITY_LOG if args[1] == 'logs' else 'true\n', stderr='')
            with patch.dict(os.environ, {'K8V4_FIT_CONTEXT': '1', 'K8V4_CACHE': cache}, clear=True), patch('tools.launch_tp1.subprocess.run', side_effect=run) as mocked:
                self.assertEqual(launch(), 1)
            self.assertEqual(sum(call.args[0][0] == 'bash' for call in mocked.call_args_list), 1)

    def test_fitting_is_disabled_by_default(self):
        with patch.dict(os.environ, {}, clear=True), patch('tools.launch_tp1.subprocess.run', return_value=subprocess.CompletedProcess([], 1)) as mocked:
            self.assertEqual(launch(), 1)
        self.assertEqual(mocked.call_count, 1)
