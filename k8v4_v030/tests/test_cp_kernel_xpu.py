"""Native partition correctness on one GPU; does not qualify CP communication.

Both virtual context lanes are executed serially on this GPU. The separate
torchrun harness is mandatory for actual CP collective and four-rank tests.
"""
import os
import unittest
from unittest.mock import patch

import torch

from bench.tp2_cp2_attention import prepare
from k8v4_v030.context_parallel import ContextLane, merge_partitions
from k8v4_v030.ops_api import library_path


class RecordPartition:
    def all_gather(self, packet, dim=0):
        self.packet=packet.clone()
        empty=torch.zeros_like(packet);empty[...,-1]=-torch.inf
        return torch.cat((packet,empty),dim=0)


class NativeCpPartitionTest(unittest.TestCase):
    def setUp(self):
        if not torch.xpu.is_available() or not os.path.isfile(library_path()):
            self.skipTest('built XPU library required')
        self.device=torch.device('xpu',torch.xpu.current_device())
        flags=patch.dict(os.environ,{'XE2_KV_PARTIAL_FP16':'1','XE2_KV_COMPACT_SLM':'1',
                                    'XE2_KV_S2_NSG_DRAFT':'32','XE2_KV_S2_NSG_VERIFY':'8',
                                    'XE2_KV_S2_TWO_PASS':'0'})
        flags.start();self.addCleanup(flags.stop)

    def test_fused_packet_merge_matches_reference(self):
        from k8v4_v030.cp_merge_triton import pack,merge
        for tokens in (1,4,7,28):
            for dtype in (torch.float16,torch.float32):
                output=torch.randn((2,tokens,12,256),device=self.device,dtype=dtype)
                lse=torch.randn((2,tokens,12),device=self.device)*1000
                lse[:,0,0]=-torch.inf;output[:,0,0]=torch.nan
                lse[1,0,1]=-torch.inf;output[1,0,1]=torch.nan
                packets=[pack(output[i].contiguous(),lse[i].contiguous()) for i in range(2)]
                actual=merge(torch.cat(packets),output.shape[1:],dtype)
                expected=merge_partitions(output,lse).to(dtype)
                torch.testing.assert_close(actual,expected,atol=2e-3 if dtype==torch.float16 else 2e-6,rtol=1e-5)

    def test_native_lse_and_striped_causal_walk_match_unsplit(self):
        torch.manual_seed(8123)
        maximum=0.0
        for ratio in (1,33):
            for context in (7,63,64,65,129,263,2113,4225):
                for q_len in (1,7):
                    with self.subTest(ratio=ratio,context=context,q_len=q_len):
                        parts=[]
                        for rank in range(2):
                            group=RecordPartition()
                            functions=prepare(context,2,q_len,ratio,ContextLane(rank,2,64,group),0,self.device)
                            baseline,walk,merge,combined,q,seq,keep=functions
                            if rank==0:expected=baseline().clone()
                            combined()
                            parts.append(group.packet)
                            del functions,baseline,walk,merge,combined,q,seq,keep,group
                        stacked=torch.stack(parts)
                        actual=merge_partitions(stacked[...,:-1],stacked[...,-1]).half()
                        error=(actual.float()-expected.float()).norm()/expected.float().norm().clamp_min(1e-12)
                        self.assertTrue(bool(torch.isfinite(actual).all()))
                        maximum=max(maximum,error.item())
                        self.assertLess(error.item(),.001)
                        del expected,actual,parts,stacked
        print(f'Native CP virtual-lane cases=32 max_relative_l2={maximum:.8g}',flush=True)


if __name__=='__main__':unittest.main()
