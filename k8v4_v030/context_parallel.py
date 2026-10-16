"""Replicated-query, sequence-sharded full attention for the four-rank trial.

The two TP groups execute identical token batches. Only full-attention KV is
striped; GDN state and model weights remain replicated between CP lanes.
Nothing in this module enables the experimental mode by default.
"""
from __future__ import annotations

import os
from dataclasses import dataclass

import torch


def enabled() -> bool:
    value = os.environ.get("K8V4_CP", "1")
    if value not in ("1", "2"):
        raise ValueError("K8V4_CP must be 1 or 2")
    return value == "2"


def local_length(end, rank: int, world: int = 2, interleave: int = 64):
    """Number of owned tokens in global [0,end); accepts integers or tensors."""
    if world < 1 or not 0 <= rank < world or interleave < 1:
        raise ValueError("invalid CP ownership")
    span = world * interleave
    tail = end % span - rank * interleave
    if isinstance(end, torch.Tensor):
        return (end // span) * interleave + tail.clamp(0, interleave)
    if end < 0:
        raise ValueError("negative sequence length")
    return (end // span) * interleave + min(max(tail, 0), interleave)


def global_positions(local, rank: int, world: int = 2, interleave: int = 64):
    if world < 1 or not 0 <= rank < world or interleave < 1:
        raise ValueError("invalid CP ownership")
    return (local // interleave * world + rank) * interleave + local % interleave


def rank_groups(tp: int = 2, cp: int = 2):
    if tp != 2 or cp != 2:
        raise ValueError("the trial supports TP2 x CP2 only")
    return ((0, 1), (2, 3)), ((0, 2), (1, 3))


def merge_partitions(outputs: torch.Tensor, lse: torch.Tensor) -> torch.Tensor:
    """Reference/device merge: [CP,T,H,D], natural-log LSE [CP,T,H].

    Empty shards carry LSE=-inf and contribute zero, including all-empty
    padded rows. Averaging the rank outputs would be mathematically wrong.
    """
    if outputs.ndim != 4 or lse.shape != outputs.shape[:-1]:
        raise ValueError("expected [CP,T,H,D] output and [CP,T,H] LSE")
    maximum = lse.amax(dim=0, keepdim=True)
    maximum = torch.where(torch.isfinite(maximum), maximum, 0.0)
    weights = torch.exp(lse - maximum)
    denominator = weights.sum(dim=0).clamp_min(torch.finfo(torch.float32).tiny)
    present = weights[..., None] > 0
    values = torch.where(present, outputs.float(), 0.0)
    return (values * weights[..., None]).sum(dim=0) / denominator[..., None]


def validate_vllm_config(config) -> None:
    """Narrow contract for the legacy replicated-query adapter, not stock PCP."""
    p = config.parallel_config
    actual = (p.tensor_parallel_size, p.prefill_context_parallel_size,
              p.decode_context_parallel_size, p.pipeline_parallel_size,
              p.data_parallel_size)
    if actual != (2, 2, 2, 1, 1):
        raise ValueError(f"K8V4 CP trial needs TP2/PCP2/DCP2/PP1/DP1, got {actual}")
    if p.cp_kv_cache_interleave_size != 64:
        raise ValueError("CP interleave must equal one 64-token K8/V4 page")
    if config.cache_config.cache_dtype != "int8_k_int4_v":
        raise ValueError("CP adapter requires the K8/V4 backend")
    m = config.model_config
    if getattr(m, "is_encoder_decoder", False) or getattr(m, "use_mla", False):
        raise ValueError("CP adapter supports decoder GQA only")
    if not getattr(m, "is_hybrid", False):
        raise ValueError("CP trial is scoped to the Qwen hybrid model")
    # The launcher explicitly uses --language-model-only. Image feature
    # scheduling/encoder synchronization is outside this first trial.
    mm = getattr(m, "multimodal_config", None)
    if mm is not None and not getattr(mm, "language_model_only", False):
        raise ValueError("first CP trial requires --language-model-only")
    if config.lora_config is not None or config.kv_transfer_config is not None:
        raise ValueError("CP trial does not support LoRA or KV transfer connectors")
    spec = config.speculative_config
    if spec is not None and (spec.method != "mtp" or spec.num_speculative_tokens != 6):
        raise ValueError("CP trial supports no speculation or the existing MTP6")


def allow_legacy_config(config) -> bool:
    if not enabled():
        return False
    validate_vllm_config(config)
    return True


def replica_model_parallel(model, parallel) -> bool:
    """Replace stock DCP's head-replica assumption only for this topology."""
    if not enabled():
        return False
    if (parallel.tensor_parallel_size, parallel.prefill_context_parallel_size,
        parallel.decode_context_parallel_size, parallel.pipeline_parallel_size,
        parallel.data_parallel_size) != (2, 2, 2, 1, 1):
        raise ValueError("CP head replicas require the TP2 x CP2 topology")
    if model.get_total_num_kv_heads() != 4 or not model.is_hybrid:
        raise ValueError("four-rank trial requires Qwen hybrid with four KV heads")
    return True


def replicated_gdn(layer) -> bool:
    if not enabled():
        return False
    from vllm.model_executor.layers.mamba.gdn.qwen_gdn_linear_attn import QwenGatedDeltaNetAttention
    return isinstance(layer, QwenGatedDeltaNetAttention)


def synchronize_sampled_tokens(sampled):
    if enabled():
        from vllm.distributed import get_dcp_group
        get_dcp_group().broadcast(sampled, src=0)


def slots_for_positions(positions, request_ids, table, block_size, rank):
    """Local physical token slots; -1 for the other lane or invalid positions."""
    valid = positions >= 0
    safe = positions.clamp_min(0)
    local = local_length(safe + 1, rank) - 1
    column = local.clamp_min(0) // block_size
    valid = valid & (safe // 64 % 2 == rank) & (column < table.shape[1])
    block = table[request_ids.long(), column.clamp(0, table.shape[1]-1).long()]
    slot = block.long() * block_size + local % block_size
    return torch.where(valid, slot, -1)


def mtp_new_slots(cad, new_positions, is_rejected_token_mask, block_size,
                  num_new_tokens, max_model_len):
    from vllm.distributed import get_dcp_group
    requests = torch.repeat_interleave(
        torch.arange(cad.block_table_tensor.shape[0], device=new_positions.device),
        cad.naive_query_lens() + num_new_tokens, output_size=len(new_positions),
    )
    slots = slots_for_positions(new_positions, requests, cad.block_table_tensor,
                               block_size, get_dcp_group().rank_in_group)
    return slots.masked_fill(is_rejected_token_mask | (new_positions >= max_model_len), -1)


def mtp_step_update(positions_1d, block_table_tensor, seq_lens, block_size,
                    max_model_len, out_clamped_positions, out_slot_mapping,
                    input_batch_size=None):
    from vllm.distributed import get_dcp_group
    batch = positions_1d.shape[0]
    positions = positions_1d + 1
    exceeds = positions >= max_model_len
    clamped = torch.where(exceeds, 0, positions)
    # Input/output position buffers can alias: finish all reads first.
    slots = slots_for_positions(clamped, torch.arange(batch, device=positions.device),
                               block_table_tensor, block_size, get_dcp_group().rank_in_group)
    slots.masked_fill_(exceeds, -1)
    seq_lens[:batch].copy_(torch.where(exceeds, 1, (seq_lens[:batch] + 1).clamp_max(max_model_len)))
    out_clamped_positions.copy_(clamped)
    out_slot_mapping.fill_(-1)
    out_slot_mapping[:batch].copy_(slots)


@dataclass(frozen=True)
class ContextLane:
    rank: int
    world: int
    interleave: int
    group: object

    def __post_init__(self):
        if self.world != 2 or self.interleave != 64 or self.rank not in (0, 1):
            raise ValueError("context lane must use two ranks and 64-token stripes")

    @classmethod
    def from_vllm(cls):
        if not enabled():
            return None
        from vllm.config import get_current_vllm_config
        from vllm.distributed import get_dcp_group, get_tp_group, get_pcp_group
        config = get_current_vllm_config()
        validate_vllm_config(config)
        group = get_dcp_group()
        if (group.world_size, get_tp_group().world_size, get_pcp_group().world_size) != (2, 2, 2):
            raise RuntimeError("four-rank CP/TP groups were not initialized")
        return cls(group.rank_in_group, 2, 64, group)

    def visible(self, seq_lens, q_len):
        # Transform EVERY causal end. Subtracting q_len from a sharded final
        # length leaks future verifier tokens at a stripe boundary.
        offsets = torch.arange(q_len, device=seq_lens.device, dtype=seq_lens.dtype)
        ends = seq_lens[:, None] - q_len + offsets[None, :] + 1
        ends = ends.clamp_min(0)
        return torch.cat((local_length(seq_lens, self.rank)[:, None],
                          local_length(ends, self.rank)), dim=1).contiguous()

    def merge(self, output, lse):
        # One collective, with FP32 LSE and FP32 transport. Allocation is
        # capture-pool owned under XPU graphs; no device->host synchronization.
        if output.device.type == 'xpu':
            from k8v4_v030.cp_merge_triton import pack, merge
            output = output.contiguous()
            lse = lse.contiguous()
            packet = pack(output, lse)
            gathered = self.group.all_gather(packet, dim=0)
            return merge(gathered, output.shape, output.dtype)
        packet = torch.cat((output.float(), lse[..., None]), dim=-1).contiguous()
        gathered = self.group.all_gather(packet, dim=0)
        shards = gathered.reshape(self.world, *packet.shape)
        return merge_partitions(shards[..., :-1], shards[..., -1]).to(output.dtype)


def paged_prefill(query, views, block_row, seq_len, pages_per_block, scale, lane):
    """Bounded-memory correctness path, returning local O and natural-log LSE.

    Queries and GDN prefill are replicated, NOT DualChunkSwap partitioned.
    This intentionally prioritizes correctness; it is not the oneDNN production
    prefill fast path. Timings must include this cost in the four-GPU trial.
    """
    from k8v4_v030.dequant import gather_dequant_range, attention_tiles
    q_len, hq, dim = query.shape
    local_len = local_length(int(seq_len), lane.rank, lane.world, lane.interleave)
    out = torch.zeros_like(query)
    lse = torch.full((q_len, hq), -torch.inf, device=query.device, dtype=torch.float32)
    if local_len == 0:
        return out, lse
    rows, key_tile = attention_tiles(q_len, local_len, hq)
    for row0 in range(0, q_len, rows):
        row1 = min(row0 + rows, q_len)
        q = query[row0:row1].float().transpose(0, 1)
        q_end = seq_len - q_len + torch.arange(row0, row1, device=query.device)
        maximum = torch.full((hq, row1-row0), -torch.inf, device=query.device)
        total = torch.zeros_like(maximum)
        accum = torch.zeros((hq, row1-row0, dim), dtype=torch.float32, device=query.device)
        for key0 in range(0, local_len, key_tile):
            key1 = min(key0 + key_tile, local_len)
            k, v = gather_dequant_range(views, block_row, key0, key1, pages_per_block, query.dtype)
            k = k.repeat_interleave(6, dim=1).transpose(0, 1).float()
            v = v.repeat_interleave(6, dim=1).transpose(0, 1).float()
            positions = global_positions(torch.arange(key0, key1, device=query.device),
                                         lane.rank, lane.world, lane.interleave)
            score = (q @ k.transpose(-1, -2)) * scale
            score.masked_fill_(positions[None, :] > q_end[:, None], -torch.inf)
            new_max = torch.maximum(maximum, score.amax(dim=-1))
            safe_max = torch.where(torch.isfinite(new_max), new_max, 0.0)
            alpha = torch.exp(maximum - safe_max)
            probability = torch.exp(score - safe_max[..., None])
            accum = accum * alpha[..., None] + probability @ v
            total = total * alpha + probability.sum(dim=-1)
            maximum = new_max
        out[row0:row1] = (accum / total.clamp_min(1e-30)[..., None]).transpose(0, 1).to(out.dtype)
        lse[row0:row1] = torch.where(total > 0, maximum + total.clamp_min(1e-30).log(),
                                     -torch.inf).transpose(0, 1)
    return out, lse
