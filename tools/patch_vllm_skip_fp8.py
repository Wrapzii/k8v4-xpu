"""Patch vLLM 0.30's skip-layer KV dtype and padded-page handling in an isolated serving image.

Lets kv_cache_dtype_skip_layers fall back to a chosen dtype (VLLM_KV_SKIP_DTYPE, e.g. fp8)
instead of always "auto", and gives skipped full-attention layers the padded shared page the
sliding-window branch already has. Lets the 27B keep K8/V4 (int8_k_int4_v) while the DFlash2
drafter's layers run the stock XPU backend on fp8. Default (unset) behaves as upstream.
"""
import importlib.util
from pathlib import Path

spec = importlib.util.find_spec('vllm')
root = Path(spec.origin).parent


def patch(path, pairs):
    """Apply each (old, new) hunk once. Already-applied hunks are skipped; a
    hunk matching neither the original nor the patched text fails loudly."""
    s = path.read_text()
    changed = False
    for old, new in pairs:
        if old in s:
            assert s.count(old) == 1, (path, s.count(old), old[:70])
            s = s.replace(old, new, 1)
            changed = True
        else:
            assert s.count(new) == 1, (
                path, 'hunk matches neither original nor patched text', old[:70])
    if changed:
        path.write_text(s)
        print('patched', path)
    else:
        print('already patched', path)


att = root / 'model_executor/layers/attention/attention.py'
patch(att, [
    # 0. the DFlash2 drafter's layers are sliding-window: their padded block comes from this helper
    ("""    sizes = attn_backend.get_supported_kernel_block_sizes()
    max_block_size = page_budget // per_token_bytes""",
     """    from vllm.platforms import current_platform as _cp

    if _cp.is_xpu():  # local patch: XPU spreads page padding over the tokens, so the block must divide the page
        _fit = [n for n in range(64, page_budget // per_token_bytes + 1, 64)
                if page_budget % n == 0 and page_budget // n % 16 == 0]
        # prefer a block dividing the primary one: prefix-cache hits land on the blocks' LCM
        _div = [n for n in _fit if fallback % n == 0]
        if _div or _fit:
            return max(_div or _fit)
    sizes = attn_backend.get_supported_kernel_block_sizes()
    max_block_size = page_budget // per_token_bytes"""),
    # 1. the skipped layers' dtype
    ("""            if skip:
                kv_cache_dtype = "auto\"""",
     """            if skip:
                # local patch: VLLM_KV_SKIP_DTYPE picks the skipped layers' dtype (upstream: always auto)
                import os as _os

                kv_cache_dtype = _os.environ.get("VLLM_KV_SKIP_DTYPE", "auto")"""),
    # 2. skipped full-attention layers pad up to the shared page, like the sliding-window branch
    ("""        else:
            return FullAttentionSpec(
                block_size=block_size,
                num_kv_heads=self.num_kv_heads,
                head_size=self.head_size,
                head_size_v=self.head_size_v,
                dtype=self.kv_cache_torch_dtype,
                kv_quant_mode=quant_mode,
            )""",
     """        else:
            # local patch: a skipped layer (its dtype differs from the primary's) pads up to the shared page
            shared_page = vllm_config.cache_config.skip_page_size_padded
            if shared_page and self.kv_cache_dtype != vllm_config.cache_config.cache_dtype:
                fa_per_token = self.attn_backend.customize_spec(
                    FullAttentionSpec(
                        block_size=1,
                        num_kv_heads=self.num_kv_heads,
                        head_size=self.head_size,
                        head_size_v=self.head_size_v,
                        dtype=self.kv_cache_torch_dtype,
                        kv_quant_mode=quant_mode,
                    )
                ).real_page_size_bytes
                # largest multiple of 64 tokens that divides the shared page with a 16-byte aligned token
                # stride: the padding is spread over the tokens (see create_kv_cache_views)
                fa_block = max(
                    (n for n in range(64, shared_page // fa_per_token + 1, 64)
                     if shared_page % n == 0 and shared_page // n % 16 == 0),
                    default=None,
                )
                if fa_block is None:
                    raise ValueError(f"no 64-multiple block divides the shared KV page {shared_page}")
                return FullAttentionSpec(
                    block_size=fa_block,
                    num_kv_heads=self.num_kv_heads,
                    head_size=self.head_size,
                    head_size_v=self.head_size_v,
                    dtype=self.kv_cache_torch_dtype,
                    kv_quant_mode=quant_mode,
                    page_size_padded=shared_page,
                )
            return FullAttentionSpec(
                block_size=block_size,
                num_kv_heads=self.num_kv_heads,
                head_size=self.head_size,
                head_size_v=self.head_size_v,
                dtype=self.kv_cache_torch_dtype,
                kv_quant_mode=quant_mode,
            )"""),
])

itf = root / 'platforms/interface.py'
patch(itf, [
    # 3. size the skipped layers' page with their own dtype, without the primary backend's packing
    ("""        if cache_config.kv_cache_dtype_skip_layers:
            padded_pages.append(per_token_page_bytes(model_config.dtype, "auto"))""",
     """        if cache_config.kv_cache_dtype_skip_layers:
            # local patch: the skipped layers run the stock backend in VLLM_KV_SKIP_DTYPE (default auto)
            import os as _os

            _skip = _os.environ.get("VLLM_KV_SKIP_DTYPE", "auto")
            _skip_dtype = model_config.dtype if _skip == "auto" else STR_DTYPE_TO_TORCH_DTYPE[_skip]
            padded_pages.append(
                FullAttentionSpec(
                    block_size=1,
                    num_kv_heads=model_config.get_num_kv_heads(parallel_config),
                    head_size=model_config.get_head_size(),
                    dtype=_skip_dtype,
                    kv_quant_mode=get_kv_quant_mode(_skip),
                ).page_size_bytes
            )"""),
])

fa = root / 'v1/attention/backends/flash_attn.py'
patch(fa, [
    # 4. the XPU flash kernel (vllm_xpu_kernels chunk_prefill) takes 16, 32 or multiples of 64; advertising
    #    MultipleOf(16) lets block selection land on sizes it rejects (e.g. 1680)
    ("""            return [block_size]
        return [MultipleOf(16)]""",
     """            return [block_size]
        from vllm.platforms import current_platform as _cp

        if _cp.is_xpu():  # local patch
            return [MultipleOf(64)]
        return [MultipleOf(16)]"""),
])

kvi = root / 'v1/kv_cache_interface.py'
patch(kvi, [
    # 5. the XPU flash kernel steps blocks by num_heads * head stride and ignores the block stride, so a
    #    padded page (skipped layers sharing the K8/V4 page) is read from the wrong place. Spread the
    #    padding over the tokens (NHD) instead of leaving it at the page tail.
    ("""    dtype = getattr(spec, "dtype", None)

    view_5d = torch.as_strided(""",
     """    dtype = getattr(spec, "dtype", None)

    from vllm.platforms import current_platform as _cp  # local patch

    _pad = getattr(spec, "page_size_padded", None)
    if _cp.is_xpu() and _pad is not None and isinstance(spec, AttentionSpec):
        _h, _n, _c = shape_bytes[1], shape_bytes[2], shape_bytes[3]
        if not (strides[1] == _pad and strides[2] == _c and strides[3] == _h * _c
                and _pad % _n == 0 and _pad // _n % 16 == 0):
            raise ValueError(
                f"XPU padded KV page needs an NHD layout, block stride == page and a 16-byte token stride: "
                f"strides {strides}, page {_pad}, tokens {_n}"
            )
        strides = (strides[0], strides[1], strides[2], _pad // _n, strides[4])

    view_5d = torch.as_strided("""),
])
print('Verified skip-layer fp8 patch:', root)
