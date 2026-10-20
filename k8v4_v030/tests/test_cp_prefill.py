import os
import time
import unittest
from unittest.mock import patch
import torch
from k8v4_v030.cp_prefill import reassemble, head_major_prefill
from k8v4_v030.context_parallel import ContextLane, local_length, prefill_mode, merge_partitions, reference_prefill, slots_for_positions


class ReconstructionTest(unittest.TestCase):
    def test_uneven_stripes_padding_and_empty_lane(self):
        for length in (0,1,63,64,65,127,128,129,263,4225):
            cap=((length+127)//128)*64
            packet=torch.full((2,2,cap,3),float('nan'))
            expected=torch.arange(length*3).reshape(length,3).float()
            for pos in range(length):
                lane=pos//64%2;local=pos//128*64+pos%64
                packet[lane,0,local]=expected[pos];packet[lane,1,local]=-expected[pos]
            k,v=reassemble(packet,length)
            self.assertTrue(torch.equal(k,expected));self.assertTrue(torch.equal(v,-expected))

    def test_mode_rejects_unknown_or_unimplemented_path(self):
        for mode in ('flash','auto','typo'):
            with patch.dict(os.environ,{'K8V4_CP_PREFILL':mode}):
                with self.assertRaises(ValueError):prefill_mode()


def case(seq,rows,ratio,device,with_full=False):
    from bench.tp2_cp2_attention import make_cache,store
    from k8v4_v030.dequant import gather_dequant_head
    gen=torch.Generator(device=device).manual_seed(739)
    k=torch.randn((seq,2,256),device=device,dtype=torch.float16,generator=gen)
    v=torch.randn(k.shape,device=device,dtype=k.dtype,generator=gen)
    q=torch.randn((rows,12,256),device=device,dtype=k.dtype,generator=gen)
    parts=[];packets=[[],[]];cap=((seq+127)//128)*64;keep=[]
    for rank in range(2):
        length=local_length(seq,rank)
        raw,views,table=make_cache([length],ratio,device,114+rank);keep.append(raw)
        positions=torch.arange(seq,device=device)
        slots=slots_for_positions(positions,torch.zeros_like(positions),table,64*ratio,rank)
        store(views,k,v,slots)
        for head in range(2):
            kh,vh=gather_dequant_head(views,table[0],length,head,ratio,q.dtype)
            packet=torch.zeros((2,cap,256),device=device,dtype=q.dtype)
            packet[0,:length]=kh;packet[1,:length]=vh;packets[head].append(packet)
        parts.append((views,table[0]))
    if with_full:
        raw,views,table=make_cache([seq],ratio,device,996);keep.append(raw)
        pos=torch.arange(seq,device=device);manager=64*ratio
        store(views,k,v,table[0,pos//manager].long()*manager+pos%manager)
        return q,parts,packets,keep,(views,table[0])
    return q,parts,packets,keep


class FakeGroup:
    def __init__(self,rank,packets):self.rank=rank;self.packets=packets;self.head=0
    def all_gather(self,packet,dim=0):
        other=self.packets[self.head][1-self.rank];self.head=(self.head+1)%len(self.packets)
        return torch.cat((packet,other) if self.rank==0 else (other,packet),dim=0)


class OneDnnCpXpuTest(unittest.TestCase):
    def setUp(self):
        if not torch.xpu.is_available():self.skipTest('XPU required')
        from k8v4_v030.ops_api import library_path
        if not os.path.isfile(library_path()):self.skipTest('built native KV store required')
        self.device=torch.device('xpu',torch.xpu.current_device())

    def test_production_query_chunk_against_independent_full_cache(self):
        from k8v4_v030.onednn_prefill import head_major_prefill as dense
        with patch.dict(os.environ,{'K8V4_PREFILL_GATHER':'triton'}):
            for seq in (4225,200003):
                q,parts,packets,keep,full=case(seq,4224,33,self.device,with_full=True)
                for changed in (False,True):
                    if changed:q.neg_()
                    expected=dense(q,full[0],full[1],seq,33,1/16)
                    for rank,(views,table) in enumerate(parts):
                        actual=head_major_prefill(q,views,table,seq,33,1/16,ContextLane(rank,2,64,FakeGroup(rank,packets)))
                        error=((actual.float()-expected.float()).norm()/expected.float().norm()).item()
                        self.assertTrue(bool(torch.isfinite(actual).all()));self.assertLess(error,.001)
                        print(f'CP_ONEDNN_FULL_CHUNK seq={seq} q=4224 lane={rank} changed={changed} l2={error:.8g}',flush=True)

    def test_complete_attention_matches_two_local_partitions(self):
        for seq,rows,ratio in ((1,1,1),(65,65,1),(129,65,33),(263,128,33),(4225,257,33),(32769,128,33)):
            with self.subTest(seq=seq,rows=rows,ratio=ratio):
                q,parts,packets,keep=case(seq,rows,ratio,self.device)
                local=[];lse=[]
                for rank,(views,table) in enumerate(parts):
                    o,l=reference_prefill(q,views,table,seq,ratio,1/16,ContextLane(rank,2,64,None))
                    local.append(o);lse.append(l)
                expected=merge_partitions(torch.stack(local),torch.stack(lse))
                for rank,(views,table) in enumerate(parts):
                    lane=ContextLane(rank,2,64,FakeGroup(rank,packets))
                    actual=head_major_prefill(q,views,table,seq,ratio,1/16,lane)
                    error=((actual.float()-expected).norm()/expected.norm().clamp_min(1e-12)).item()
                    self.assertTrue(bool(torch.isfinite(actual).all()));self.assertLess(error,.001)
                    print(f'CP_ONEDNN seq={seq} q={rows} r={ratio} lane={rank} l2={error:.8g}',flush=True)

    def test_long_local_cost_and_changed_query(self):
        seq=200003;rows=128;ratio=33
        q,parts,packets,keep=case(seq,rows,ratio,self.device)
        views,table=parts[0];lane=ContextLane(0,2,64,FakeGroup(0,packets))
        def fast():return head_major_prefill(q,views,table,seq,ratio,1/16,lane)
        def ref():return reference_prefill(q,views,table,seq,ratio,1/16,lane)
        # Independent reference returns a LOCAL partition, so compare the new
        # complete result against the weighted combination of both partitions.
        def expected():
            vals=[];stats=[]
            for rank,(vv,tt) in enumerate(parts):
                o,l=reference_prefill(q,vv,tt,seq,ratio,1/16,ContextLane(rank,2,64,None))
                vals.append(o);stats.append(l)
            return merge_partitions(torch.stack(vals),torch.stack(stats))
        refout=expected();actual=fast()
        error=((actual.float()-refout).norm()/refout.norm()).item();self.assertLess(error,.001)
        times={}
        for name,fn in (('old_local_reference',ref),('new_complete_virtual_gather',fast)):
            fn();torch.xpu.synchronize();start=time.perf_counter()
            for _ in range(3):fn()
            torch.xpu.synchronize();times[name]=(time.perf_counter()-start)*1000/3
        q.neg_();refout=expected();actual=fast()
        error2=((actual.float()-refout).norm()/refout.norm()).item();self.assertLess(error2,.001)
        print(f'CP_ONEDNN_LONG scope=one-device-virtual-gather milliseconds={times} l2={error:.8g} changed_l2={error2:.8g}',flush=True)


if __name__=='__main__':unittest.main()
