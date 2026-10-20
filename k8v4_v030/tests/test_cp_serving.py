import unittest
from bench.cp_serving import common_decode, rates, total
from bench.cp_compare import compare
from tools.cp_inventory import rank_gate


class MeasurementTest(unittest.TestCase):
    def test_excludes_entire_first_burst(self):
        self.assertEqual(rates([{'t':10,'tokens':7},{'t':11,'tokens':14},{'t':12,'tokens':21}]),7)

    def test_missing_or_nonmonotonic_usage_is_not_a_speed(self):
        for events in ([],[{'t':0,'tokens':7}],
                       [{'t':0,'tokens':7},{'t':1,'tokens':7}],
                       [{'t':1,'tokens':7},{'t':0,'tokens':8}]):
            with self.assertRaises(ValueError):rates(events)

    def test_common_interval_excludes_prefill_overlap_and_drain(self):
        rows=[{'events':[{'t':i+offset,'tokens':7*i+7} for i in range(50)]} for offset in (0,3,5,10)]
        result=common_decode(rows)
        self.assertTrue(result['valid']);self.assertEqual(result['seconds'],39)
        self.assertEqual(result['per_stream_tps'],[7]*4)

    def test_no_overlap_or_short_overlap_fails(self):
        rows=[{'events':[{'t':offset+i,'tokens':7*i+7} for i in range(20)]} for offset in (0,25)]
        self.assertFalse(common_decode(rows)['valid'])

    def test_labelled_and_unlabelled_metrics(self):
        values={'vllm:x':2,'vllm:x{engine="0"}':3,'vllm:xy':99}
        self.assertEqual(total(values,'vllm:x'),5)

    def test_inventory_checks_each_actual_rank_not_just_group_names(self):
        reports=[{'global_rank':i,'tp_ranks':[0,1] if i<2 else [2,3],
                  'cp_ranks':[0,2] if i%2==0 else [1,3],'cp_lane':i//2,
                  'affinity':'0,1,2,3','device':i} for i in range(4)]
        self.assertTrue(rank_gate(reports))
        self.assertFalse(rank_gate(reports[:2]))
        reports[0]['device']=1
        self.assertFalse(rank_gate(reports))
        reports[0]['device']=0
        reports[0]['cp_lane']=1
        self.assertFalse(rank_gate(reports))

    def test_comparison_rejects_missing_invalid_or_duplicate_cells(self):
        import copy
        def rows():
            return [{'repeat':i,'fixture_sha256':'f','max_tokens':2048,'valid_decode_measurement':True,'valid_request_measurement':True,
                     'steady_common_decode':{'per_stream_tps':[30]*4},'aggregate_wall_tps':100,
                     'requests':[{'ttft_seconds':2}]*4,'acceptance':.7} for i in range(3)]
        a={('warm',200000,4):rows()};b=copy.deepcopy(a)
        self.assertEqual(compare(a,b)[0]['decode_change_percent'],0)
        with self.assertRaises(ValueError):compare(a,{})
        for field,value in (('valid_decode_measurement',False),('fixture_sha256','other'),
                            ('max_tokens',512),('repeat',1),('valid_request_measurement',False)):
            b=copy.deepcopy(a);b[('warm',200000,4)][0][field]=value
            with self.assertRaises(ValueError):compare(a,b)
        cold=copy.deepcopy(a[('warm',200000,4)])
        for row in cold:
            row['valid_decode_measurement']=False
            row['steady_common_decode']={'per_stream_tps':None,'reason':'insufficient simultaneous-decode coverage'}
        report=compare({('cold',200000,4):cold},{('cold',200000,4):cold})[0]
        self.assertIsNone(report['decode_change_percent'])
        self.assertEqual(report['a']['wall_aggregate_median'],100)


if __name__=='__main__':unittest.main()
