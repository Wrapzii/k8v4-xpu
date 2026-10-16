from __future__ import annotations

import os
import sys
from types import SimpleNamespace as NS
import unittest
from unittest.mock import patch

import torch

from k8v4_v030.context_parallel import (
    ContextLane, enabled, global_positions, local_length, merge_partitions,
    paged_prefill, rank_groups, slots_for_positions, validate_vllm_config,
    mtp_new_slots, mtp_step_update,
)


class OwnershipTest(unittest.TestCase):
    def test_two_tp_pairs_and_corresponding_head_cp_pairs(self):
        self.assertEqual(rank_groups(), (((0, 1), (2, 3)), ((0, 2), (1, 3))))

    def test_owned_prefix_lengths_and_inverse_positions(self):
        for end in list(range(260)) + [131071, 131072, 200000, 262144]:
            counts = [local_length(end, rank) for rank in range(2)]
            self.assertEqual(sum(counts), end)
            for rank in range(2):
                indices = torch.arange(counts[rank])
                positions = global_positions(indices, rank)
                self.assertTrue(bool((positions < end).all()))
                self.assertTrue(bool((positions // 64 % 2 == rank).all()))
                self.assertTrue(torch.equal(local_length(positions + 1, rank) - 1, indices))

    def test_visibility_transforms_each_q7_causal_end(self):
        lengths = torch.tensor([0, 1, 64, 65, 66, 128, 129, 200001], dtype=torch.int32)
        for rank in range(2):
            lane = ContextLane(rank, 2, 64, None)
            ends = lane.visible(lengths, 7)
            for b, length in enumerate(lengths.tolist()):
                expected = [local_length(length, rank)]
                expected += [local_length(max(length - 6 + t, 0), rank) for t in range(7)]
                self.assertEqual(ends[b].tolist(), expected)
        # At a stripe boundary later query rows can see zero new local keys.
        lane = ContextLane(0, 2, 64, None)
        self.assertEqual(lane.visible(torch.tensor([68]), 7)[0, 1:].tolist(), [62, 63, 64, 64, 64, 64, 64])

    def test_shuffled_manager_blocks_do_not_change_token_ownership(self):
        for block_size in (64, 2112):
            positions = torch.tensor([-1, 0, 63, 64, 127, 128, 4223, 4224, 4225])
            table = torch.tensor([[13, 7, 21, 2, 5] * 15], dtype=torch.int32)
            for rank in range(2):
                slots = slots_for_positions(positions, torch.zeros_like(positions), table, block_size, rank)
                for pos, actual in zip(positions.tolist(), slots.tolist()):
                    if pos < 0 or pos // 64 % 2 != rank:
                        self.assertEqual(actual, -1)
                    else:
                        local = local_length(pos+1, rank)-1
                        expected = table[0, local//block_size].item()*block_size + local%block_size
                        self.assertEqual(actual, expected)

    def test_other_lane_and_out_of_capacity_slots_are_masked(self):
        table = torch.tensor([[5]], dtype=torch.int32)
        pos = torch.tensor([0, 64, 128, 100000])
        self.assertEqual(slots_for_positions(pos, torch.zeros_like(pos), table, 64, 0).tolist(),
                         [320, -1, -1, -1])

    def test_benchmark_reserves_table_width_for_empty_local_history(self):
        from bench.tp2_cp2_attention import make_cache
        raw,views,table=make_cache([0,0],33,torch.device('cpu'),123)
        self.assertEqual(table.shape,(2,1))
        self.assertEqual(raw.shape[2],2112)


class SoftmaxMergeTest(unittest.TestCase):
    def test_benchmark_rejects_nonfinite_reference(self):
        from bench.tp2_cp2_attention import error
        with patch('bench.tp2_cp2_attention.worst',side_effect=lambda x,_device:x):
            result=error(torch.zeros(1),torch.tensor([torch.nan]),torch.device('cpu'))
        self.assertFalse(result['finite'])
        self.assertEqual(result['relative_l2'],float('inf'))

    def test_merge_is_weighted_not_an_average(self):
        out = torch.tensor([[[[1.0]]], [[[9.0]]]])
        lse = torch.tensor([[[0.0]], [[torch.log(torch.tensor(3.0))]]])
        self.assertAlmostEqual(merge_partitions(out, lse).item(), 7.0, places=5)

    def test_empty_shards_extreme_scores_and_all_empty_padding(self):
        output = torch.tensor([[[[2.0]], [[torch.nan]], [[torch.nan]]],
                               [[[torch.nan]], [[5.0]], [[torch.nan]]]])
        lse = torch.tensor([[[10000.0], [-torch.inf], [-torch.inf]],
                            [[-torch.inf], [-10000.0], [-torch.inf]]])
        merged = merge_partitions(output, lse)
        self.assertTrue(torch.equal(merged.flatten(), torch.tensor([2.0, 5.0, 0.0])))

    def test_replicated_prefill_matches_dense_gqa_at_stripe_boundaries(self):
        generator = torch.Generator().manual_seed(1337)
        for seq_len, q_len in [(1,1), (7,7), (64,7), (65,7), (68,13), (129,65), (257,73)]:
            with self.subTest(seq_len=seq_len, q_len=q_len):
                q = torch.randn(q_len,12,8,generator=generator)
                k = torch.randn(seq_len,2,8,generator=generator)
                v = torch.randn(seq_len,2,8,generator=generator)
                parts, states = [], []
                # Small tiles exercise online accumulation, including tiles
                # whose entire causal mask is false on one CP lane.
                for rank in range(2):
                    owned = torch.arange(seq_len)//64%2 == rank
                    kl, vl = k[owned], v[owned]
                    def gather(_views, _row, start, end, _ratio, _dtype):
                        return kl[start:end], vl[start:end]
                    with patch('k8v4_v030.dequant.gather_dequant_range', side_effect=gather), \
                         patch('k8v4_v030.dequant.attention_tiles', return_value=(5,19)):
                        out, lse = paged_prefill(q, {}, torch.tensor([7]), seq_len, 1, .25,
                                                ContextLane(rank,2,64,None))
                    parts.append(out);states.append(lse)
                scores = q.transpose(0,1) @ k.repeat_interleave(6,dim=1).permute(1,2,0) * .25
                mask = torch.arange(seq_len)[None,:] > seq_len-q_len+torch.arange(q_len)[:,None]
                scores.masked_fill_(mask, -torch.inf)
                expected = (scores.softmax(-1) @ v.repeat_interleave(6,dim=1).transpose(0,1)).transpose(0,1)
                actual = merge_partitions(torch.stack(parts),torch.stack(states))
                torch.testing.assert_close(actual, expected, atol=2e-6, rtol=2e-5)


class MtpSlotsTest(unittest.TestCase):
    def test_mtp_step_changes_owner_at_64_token_boundary_and_handles_aliasing(self):
        for rank in range(2):
            modules={'vllm.distributed':NS(get_dcp_group=lambda:NS(rank_in_group=rank))}
            with patch.dict(sys.modules, modules):
                positions=torch.tensor([62,63,127,128,199])
                seq=torch.tensor([63,64,128,129,200,0,0])
                table=torch.tensor([[3,7,5]]*5,dtype=torch.int32)
                slots=torch.empty(8,dtype=torch.int64)
                mtp_step_update(positions,table,seq,64,200,positions,slots,8)
                self.assertEqual(positions.tolist(),[63,64,128,129,0])
                self.assertEqual(seq.tolist(),[64,65,129,130,1,0,0])
                expected=slots_for_positions(positions,torch.arange(5),table,64,rank)
                expected[-1]=-1
                self.assertTrue(torch.equal(slots[:5],expected))
                self.assertEqual(slots[5:].tolist(),[-1,-1,-1])

    def test_first_pass_rejection_and_out_of_context_remain_masked(self):
        table=torch.tensor([[9,4],[7,3]],dtype=torch.int32)
        cad=NS(block_table_tensor=table,naive_query_lens=lambda:torch.tensor([3,2]))
        positions=torch.tensor([63,64,65,199,200])
        rejected=torch.tensor([False,False,True,False,False])
        for rank in range(2):
            with patch.dict(sys.modules,{'vllm.distributed':NS(get_dcp_group=lambda:NS(rank_in_group=rank))}):
                actual=mtp_new_slots(cad,positions,rejected,64,0,200)
                expected=slots_for_positions(positions,torch.tensor([0,0,0,1,1]),table,64,rank)
                expected[2]=-1;expected[4]=-1
                self.assertTrue(torch.equal(actual,expected))


class ConfigContractTest(unittest.TestCase):
    def config(self):
        return NS(parallel_config=NS(tensor_parallel_size=2, prefill_context_parallel_size=2,
                  decode_context_parallel_size=2,pipeline_parallel_size=1,data_parallel_size=1,
                  cp_kv_cache_interleave_size=64),
                  cache_config=NS(cache_dtype='int8_k_int4_v'),
                  model_config=NS(is_hybrid=True,is_encoder_decoder=False,use_mla=False,
                                  multimodal_config=NS(language_model_only=True)),
                  lora_config=None,kv_transfer_config=None,speculative_config=NS(method='mtp',num_speculative_tokens=6))

    def test_only_explicit_flag_enables_adapter(self):
        with patch.dict(os.environ, {}, clear=True):
            self.assertFalse(enabled())
        with patch.dict(os.environ, {'K8V4_CP':'2'}):
            self.assertTrue(enabled())
        with patch.dict(os.environ, {'K8V4_CP':'4'}):
            self.assertRaises(ValueError, enabled)

    def test_accept_supported_configuration(self):
        validate_vllm_config(self.config())

    def test_reject_stock_topology_interleave_and_multimodal(self):
        for field, value in [('tensor_parallel_size',4),('prefill_context_parallel_size',1),
                             ('decode_context_parallel_size',1),('pipeline_parallel_size',2),
                             ('data_parallel_size',2),('cp_kv_cache_interleave_size',1)]:
            with self.subTest(field=field):
                config=self.config();setattr(config.parallel_config,field,value)
                self.assertRaises(ValueError,validate_vllm_config,config)
        config=self.config();config.model_config.multimodal_config.language_model_only=False
        self.assertRaises(ValueError,validate_vllm_config,config)


if __name__ == '__main__':
    unittest.main()
