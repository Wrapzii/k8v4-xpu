"""Optional RecoverSSM speculative verify for the Qwen GDN layers (K8V4_GDN_RECOVERSSM=1).

Stock vLLM 0.34 verifies an MTP window on a GDN layer by writing the full recurrent state after every draft token
into its own state block (num_speculative_tokens + 1 blocks per request), then keeps the accepted column. On one
B70 that is the whole GDN decode cost: at 4 x 63K (depth 3) the spec kernel reads 4 states and writes 16 per layer.
RecoverSSM (vLLM's --use-replayssm, upstream for Kimi KDA; GDN as in vLLM PR 61309 / 62625) verifies the window
off the request's one checkpoint without writing it, records a small per-token replay row (the delta-rule
correction, the normalised key and the decay, fp32), and after sampling folds only the accepted tokens into the
checkpoint once. It also drops the per-draft state blocks from the KV budget. Lossless for greedy verification up
to fp rounding (the commit replays the same per-token terms the verify used); not bit-identical to the stock path.

Pieces (all inert unless K8V4_GDN_RECOVERSSM=1 and vLLM runs with --use-replayssm; launch.sh passes both):
  - kda_architectures(): config/vllm.py adds the Qwen3.5 / Qwen3-Next GDN models to vLLM's RecoverSSM model list.
  - install_layer(): QwenGatedDeltaNetAttention gets the replay buffer and the RecoverSSM metadata backend
    (k8v4_v030/rssm_backend.py; commit kernels in rssm_gdn.py / rssm_kernels.py).
  - gdn_core(): _xpu_ops._gdn_attention_core_xpu_impl hands steps with spec rows here: the extended conv window
    runs through _xpu_C.causal_conv1d_spec on the checkpoint column, the verify through the SYCL RecoverSSM kernel
    of vllm-xpu-kernels 0.1.17 built as a standalone op with per-request replay rows (native/rssm,
    K8V4_RSSM_LIB). Mixed steps (prefill chunks + decodes) run the non-spec rows through the stock fused op in
    their own call, as the stock fused conv is spec XOR non-spec.
"""

from __future__ import annotations

import os

ENV = 'K8V4_GDN_RECOVERSSM'
LIB_ENV = 'K8V4_RSSM_LIB'
DEFAULT_LIB = '/opt/k8v4/libk8v4_rssm.so'
ARCHITECTURES = (
    'Qwen3NextForCausalLM',
    'Qwen3_5ForCausalLM',
    'Qwen3_5MoeForCausalLM',
    'Qwen3_5ForConditionalGeneration',
    'Qwen3_5MoeForConditionalGeneration',
)

_lib_loaded = [False]


def enabled() -> bool:
    value = os.environ.get(ENV, '')
    if value not in ('', '0', '1'):
        raise ValueError('%s must be 0 or 1, got %r' % (ENV, value))
    return value == '1'


def kda_architectures(architectures):
    """config/vllm.py hook: the GDN models join vLLM's RecoverSSM model list only when the knob is on."""
    architectures = tuple(architectures)
    if not enabled():
        return architectures
    return architectures + tuple(a for a in ARCHITECTURES if a not in architectures)


def wants_recoverssm(cache_config, num_spec: int) -> bool:
    return bool(getattr(cache_config, 'use_kda_recoverssm', False)) and num_spec > 0


def install_layer(cls) -> None:
    """qwen_gdn_linear_attn.py hook: replay buffer + RecoverSSM backend on QwenGatedDeltaNetAttention.
    A layer without RecoverSSM (the default) keeps its stock __init__ result and backend."""
    if getattr(cls, '_k8v4_rssm_installed', False):
        return
    stock_init = cls.__init__
    stock_backend = cls.get_attn_backend

    def __init__(self, *args, **kwargs):
        stock_init(self, *args, **kwargs)
        self.use_gdn_recoverssm = wants_recoverssm(self.cache_config, self.num_spec)
        if self.use_gdn_recoverssm:
            import torch
            from vllm.config import get_current_vllm_config

            # Per-token replay records [HV, spec_query_len, V + K + 1] fp32, one row per request slot. Allocated
            # here so the memory profiler counts it (4 seqs: about 0.8 MB per layer at depth 3).
            self.register_buffer(
                'recoverssm_replay',
                torch.zeros(get_current_vllm_config().scheduler_config.max_num_seqs,
                            self.num_v_heads // self.tp_size, self.num_spec + 1,
                            self.head_v_dim + self.head_k_dim + 1, dtype=torch.float32),
                persistent=False)

    def get_attn_backend(self):
        if getattr(self, 'use_gdn_recoverssm', False):
            from k8v4_v030.rssm_backend import GDNRecoverSSMAttentionBackend

            return GDNRecoverSSMAttentionBackend
        return stock_backend(self)

    __init__.__wrapped__ = stock_init
    cls.__init__ = __init__
    cls.get_attn_backend = get_attn_backend
    cls._k8v4_rssm_installed = True


def _load_lib() -> None:
    if not _lib_loaded[0]:
        import torch

        torch.ops.load_library(os.environ.get(LIB_ENV, DEFAULT_LIB))
        _lib_loaded[0] = True


def _i32(t):
    import torch

    if t is None:
        return None
    if t.dtype != torch.int32:
        t = t.to(torch.int32)
    return t.contiguous()


def _verify(layer, md, out, z, qkvz, ba, conv_weights, sp_loc, sp_idx, sp_state, n_spec, n_tok) -> None:
    """Spec rows only: conv over the extended window on the checkpoint column, then the RecoverSSM verify, which
    reads the checkpoint and writes this step's replay records (the commit after sampling folds them)."""
    import torch

    _load_lib()
    q, k, v, b, a = torch.ops._xpu_C.causal_conv1d_spec(
        z, qkvz, ba, layer.num_k_heads, layer.num_v_heads, layer.head_k_dim, layer.head_v_dim,
        layer.kv_cache[0], conv_weights, layer.conv1d.bias, layer.activation, 0, 0, n_spec,
        sp_loc.contiguous(), sp_idx.contiguous(),
        # one checkpoint column; the conv kernel reads the window width from the column count
        sp_state[:, :1].expand(-1, layer.num_spec + 1).contiguous(),
        md.num_accepted_tokens.contiguous(), n_tok, layer.tp_size, not layer.gqa_interleaved_layout)
    rec = md.recoverssm_record_indices
    torch.ops._k8v4_rssm.verify(
        out, q, k, v, b, a, layer.A_log, layer.dt_bias, layer.kv_cache[1], layer.recoverssm_replay,
        sp_loc[: n_spec + 1].contiguous(), sp_idx, sp_state[:n_spec, 0].contiguous(),
        None if rec is None else rec[:n_spec].contiguous(), 0)


def gdn_core(layer, md, core_attn_out, z, qkvz, ba, conv_weights) -> None:
    """_gdn_attention_core_xpu_impl for a step with spec rows on a RecoverSSM layer."""
    import torch

    n_pref, n_dec, n_spec = md.num_prefills, md.num_decodes, md.num_spec_decodes
    ns_idx, sp_idx = _i32(md.non_spec_token_indx), _i32(md.spec_token_indx)
    if n_pref + n_dec == 0:
        _verify(layer, md, core_attn_out, z, qkvz, ba, conv_weights, md.spec_query_start_loc, sp_idx,
                md.spec_state_indices_tensor, n_spec, md.num_actual_tokens)
        return
    # Mixed step: the stock fused op takes the non-spec rows (n_spec = 0), the verify the spec rows; both on
    # compacted copies, scattered back.
    dev = core_attn_out.device
    n_ns, n_sp = int(ns_idx.numel()), int(sp_idx.numel())

    def compact(src, idx):
        return src.index_select(0, idx.long()).contiguous()

    if n_ns > 0:
        z_ns, qkvz_ns, ba_ns = compact(z, ns_idx), compact(qkvz, ns_idx), compact(ba, ns_idx)
        out_ns = core_attn_out.new_empty((n_ns,) + tuple(core_attn_out.shape[1:]))
        ns_state = md.non_spec_state_indices_tensor
        torch.ops._xpu_C.gdn_attention(
            out_ns, z_ns, qkvz_ns, ba_ns, layer.num_k_heads, layer.num_v_heads, layer.head_k_dim,
            layer.head_v_dim, conv_state=layer.kv_cache[0], ssm_state=layer.kv_cache[1],
            conv_weights=conv_weights, conv_bias=layer.conv1d.bias, activation=layer.activation,
            A_log=layer.A_log, dt_bias=layer.dt_bias, num_prefills=n_pref, num_decodes=n_dec,
            num_spec_decodes=0, has_initial_state=md.has_initial_state,
            non_spec_query_start_loc=md.non_spec_query_start_loc,
            non_spec_token_indx=torch.arange(n_ns, dtype=torch.int32, device=dev),
            non_spec_state_indices_tensor=None if ns_state is None else ns_state.contiguous(),
            spec_query_start_loc=None, spec_token_indx=None, spec_state_indices_tensor=None,
            num_accepted_tokens=None, num_actual_tokens=n_ns, tp_size=layer.tp_size,
            reorder_input=not layer.gqa_interleaved_layout)
        core_attn_out.index_copy_(0, ns_idx.long(), out_ns)
        z.index_copy_(0, ns_idx.long(), z_ns)
    if n_sp > 0:
        z_sp, qkvz_sp, ba_sp = compact(z, sp_idx), compact(qkvz, sp_idx), compact(ba, sp_idx)
        out_sp = core_attn_out.new_empty((n_sp,) + tuple(core_attn_out.shape[1:]))
        _verify(layer, md, out_sp, z_sp, qkvz_sp, ba_sp, conv_weights, md.spec_query_start_loc,
                torch.arange(n_sp, dtype=torch.int32, device=dev), md.spec_state_indices_tensor, n_spec, n_sp)
        core_attn_out.index_copy_(0, sp_idx.long(), out_sp)
        z.index_copy_(0, sp_idx.long(), z_sp)
