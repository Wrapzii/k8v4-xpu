"""Native CP q1 cascade + LSE vs unchanged serial walk; single GPU only."""
import os
import unittest
from unittest.mock import patch
import torch
from k8v4_v030.cache_views import bind_regions
from k8v4_v030.cascade import CascadeScratch
from k8v4_v030.layout import PageLayout, PAGE
from k8v4_v030.ops_api import ops, library_path
from k8v4_v030.plan import workspace_programs
from k8v4_v030.scratch import Scratch
from k8v4_v030.tests.test_cascade_xpu import make_case


class CpCascadeXpuTest(unittest.TestCase):
    def setUp(self):
        if not torch.xpu.is_available() or not os.path.isfile(library_path()):
            self.skipTest('XPU native library required')
        self.device=torch.device('xpu',torch.xpu.current_device())
        flags=patch.dict(os.environ,{'XE2_KV_CASCADE':'1','XE2_KV_PARTIAL_FP16':'1',
            'XE2_KV_COMPACT_SLM':'1','XE2_KV_S2_NSG_DRAFT':'32','XE2_KV_S2_NSG_VERIFY':'8','XE2_KV_S2_TWO_PASS':'0'})
        flags.start();self.addCleanup(flags.stop)

    def test_empty_partition_ignores_poisoned_previous_request_workspace(self):
        layout=PageLayout(2)
        raw=torch.zeros(layout.page_bytes,device=self.device,dtype=torch.int8)
        v=bind_regions(raw,layout)
        for qlen in (1,7):
            for parallel in ('0','1'):
                for fp16 in ('0','1'):
                    with patch.dict(os.environ,{'XE2_KV_S2_PARALLEL':parallel,'XE2_KV_PARTIAL_FP16':fp16}):
                        sc=Scratch(self.device,layout,2,1,qlen)
                        q,out=sc.attention_pair(qlen);q.normal_()
                        part,m,l,merged=sc.workspace(2)
                        part.fill_(1);m.fill_(1);l.fill_(1);merged.fill_(1)
                        bt=torch.zeros((1,1),device=self.device,dtype=torch.int32)
                        seq=torch.zeros(1,device=self.device,dtype=torch.int32)
                        vis=torch.zeros((1,qlen+1),device=self.device,dtype=torch.int32)
                        lse=torch.empty((qlen,12),device=self.device)
                        ops().int8k_int4v_attn_batch_lse(q,sc.q8,sc.q_scale,v['k'],v['k_scale'],v['v'],v['v_scale'],v['v_zero'],bt,seq,vis,part,m,l,merged,out,lse,qlen,1)
                        self.assertEqual(out.count_nonzero().item(),0)
                        self.assertTrue(bool(torch.isneginf(lse).all()))

    def test_shared_and_independent_q1_lse_and_changed_graph_replay(self):
        layout=PageLayout(2)
        for batch,seq,ratio,share in ((1,129,1,0),(4,4225,33,0),(4,4225,33,1),
                                     (8,4225,33,.5),(4,100003,33,.75)):
            with self.subTest(batch=batch,seq=seq,share=share):
                blocks=batch*((seq+300+64*ratio-1)//(64*ratio))+8
                raw=torch.zeros(blocks*ratio*layout.page_bytes,device=self.device,dtype=torch.int8)
                views=bind_regions(raw,layout)
                views['k'].random_(-127,128);views['v'].random_(0,256)
                views['k_scale'].fill_(.01);views['v_scale'].fill_(.02);views['v_zero'].fill_(7.5)
                bt,sl,q=make_case(torch.Generator().manual_seed(123),batch,seq,ratio,share,1,blocks)
                bt,sl,q=bt.to(self.device),sl.to(self.device),q.to(self.device)
                vis=torch.stack((sl,sl),dim=1).contiguous()
                # Include a fully empty lane/request, including graph replay.
                if batch>1:sl[-1]=0;vis[-1]=0
                n=workspace_programs(bt.shape[1],ratio,layout)
                sc=Scratch(self.device,layout,n,1,batch);qb,ob=sc.attention_pair(batch);qb.copy_(q)
                part,m,l,merged=sc.workspace(n);lse=torch.empty((batch,12),device=self.device)
                cs=CascadeScratch(self.device,2,batch,0,8)
                base=(qb,sc.q8,sc.q_scale,views['k'],views['k_scale'],views['v'],views['v_scale'],views['v_zero'],bt,sl,vis,part,m,l,merged,ob)
                def serial():ops().int8k_int4v_attn_batch_lse(*base,lse,1,ratio)
                def cascade():ops().int8k_int4v_attn_batch_cascade_lse(*base,1,ratio,cs.q8,cs.qsc,cs.plan,cs.part,cs.m,cs.l,cs.cap,cs.slot_rows,lse)
                serial();expected=ob.clone();expected_lse=lse.clone();cascade()
                self.assertTrue(torch.equal(ob,expected),'ordinary q1 output bits changed')
                if batch>1:self.assertEqual(ob[-1].count_nonzero().item(),0)
                torch.testing.assert_close(lse,expected_lse,atol=3e-5,rtol=2e-6)
                cascade();torch.xpu.synchronize()
                graph=torch.xpu.XPUGraph()
                with torch.xpu.graph(graph):cascade()
                qb.neg_();bt.copy_(bt.flip(0));sl.copy_(sl.flip(0));vis.copy_(torch.stack((sl,sl),1))
                serial();expected=ob.clone();expected_lse=lse.clone();graph.replay()
                self.assertTrue(torch.equal(ob,expected),'changed-input graph output bits changed')
                torch.testing.assert_close(lse,expected_lse,atol=3e-5,rtol=2e-6)
                print(f'CP_CASCADE B={batch} seq={seq} ratio={ratio} share={share} graph=PASS',flush=True)


if __name__=='__main__':unittest.main()
