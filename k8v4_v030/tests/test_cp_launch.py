import tempfile
import unittest
from pathlib import Path

from tools.launch_tp2_cp2 import command, parser


class CpLaunchTest(unittest.TestCase):
    def args(self, directory, *extra):
        return parser().parse_args(['--model-dir',directory,*extra])

    def test_four_rank_profile_and_current_native_options(self):
        with tempfile.TemporaryDirectory() as temp:
            cmd=command(self.args(temp))
            for arg in ('--tensor-parallel-size=2','--prefill-context-parallel-size=2',
                        '--decode-context-parallel-size=2','--cp-kv-cache-interleave-size=64',
                        '--max-num-seqs=4','--dtype=float16','--enforce-eager',
                        'K8V4_CP=2','VLLM_USE_V2_MODEL_RUNNER=0','XE2_KV_COMPACT_SLM=1',
                        'K8V4_CP_PREFILL=onednn','XE2_KV_CASCADE=1',
                        'XE2_KV_PARTIAL_FP16=1','XE2_KV_S2_NSG_VERIFY=8',
                        '--language-model-only','--no-async-scheduling'):
                self.assertIn(arg,cmd)
            self.assertIn('/dev/dri/by-path:/dev/dri/by-path:ro',cmd)
            self.assertNotIn('rm',cmd)
            self.assertFalse((Path(temp)/'cache').exists())

    def test_four_distinct_devices_required(self):
        with tempfile.TemporaryDirectory() as temp:
            for devices in ('0,1','0,1,2,2','0,1,2,-1','0,1,2,x'):
                self.assertRaises(ValueError,command,self.args(temp,'--devices',devices))

    def test_configurable_concurrency_and_graph_widths(self):
        with tempfile.TemporaryDirectory() as temp:
            import json
            cmd=command(self.args(temp,'--max-seqs','8','--graphs'))
            graph=next(x for x in cmd if x.startswith('--compilation-config='))
            self.assertEqual(json.loads(graph.split('=',1)[1])['cudagraph_capture_sizes'],[7,14,21,28,35,42,49,56])
            cmd=command(self.args(temp,'--no-mtp','--graphs'))
            self.assertFalse(any('speculative-config' in arg for arg in cmd))
            graph=next(x for x in cmd if x.startswith('--compilation-config='))
            self.assertEqual(json.loads(graph.split('=',1)[1])['cudagraph_capture_sizes'],[1,2,3,4])

    def test_slow_reference_and_no_cascade_are_explicit(self):
        with tempfile.TemporaryDirectory() as temp:
            cmd=command(self.args(temp,'--cp-prefill','reference','--no-cascade'))
            self.assertIn('K8V4_CP_PREFILL=reference',cmd)
            self.assertIn('XE2_KV_CASCADE=0',cmd)

    def test_same_image_tp2_control_uses_two_cards_and_onednn(self):
        with tempfile.TemporaryDirectory() as temp:
            cmd=command(self.args(temp,'--layout','tp2','--graphs'))
            self.assertIn('K8V4_CP=1',cmd);self.assertIn('ZE_AFFINITY_MASK=0,1',cmd)
            self.assertIn('K8V4_PREFILL=onednn',cmd);self.assertIn('XE2_KV_CASCADE=1',cmd)
            self.assertNotIn('--prefill-context-parallel-size=2',cmd)
            self.assertNotIn('--decode-context-parallel-size=2',cmd)


if __name__=='__main__':unittest.main()
