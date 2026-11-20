"""K8V4_MAMBA_SSM_DTYPE contract: the GDN op takes a float16 / bfloat16 recurrent state next to bfloat16 activations.

launch.sh passes --mamba-ssm-cache-dtype only when K8V4_MAMBA_SSM_DTYPE is set (test_launch_profiles). This file
checks the two things the knob relies on: vLLM's Qwen3.5 config hook keeps an explicit value over the
checkpoint's mamba_ssm_dtype (float32 in the Swift bake), and on an XPU the fused GDN op runs with a half
state and bf16 activations and stays close to the float32-state result (it is not bit-identical: the state is
rounded to 16 bits after every token). Both skip when vLLM / an XPU device is not present.
"""
from __future__ import annotations

import unittest

try:
    import torch
except ImportError:  # CPU-only checkout without torch
    torch = None

HK, HV, DK, DV, KS = 16, 48, 128, 128, 4
CONV = 2 * HK * DK + HV * DV


def _has_xpu() -> bool:
    if torch is None or not hasattr(torch, 'xpu') or not torch.xpu.is_available():
        return False
    try:
        import vllm_xpu_kernels._xpu_C  # noqa: F401
    except ImportError:
        return False
    return True


class ConfigHookTest(unittest.TestCase):
    def test_explicit_value_wins_over_the_checkpoint(self):
        try:
            from vllm.model_executor.models.config import Qwen3_5ForConditionalGenerationConfig
        except Exception as exc:  # vLLM not installed on this machine
            self.skipTest('vLLM not importable: %s' % exc)

        class Obj:
            pass

        for requested, expected in (('auto', 'float32'), ('float16', 'float16'), ('bfloat16', 'bfloat16')):
            cfg = Obj()
            cfg.cache_config = Obj()
            cfg.cache_config.mamba_ssm_cache_dtype = requested
            cfg.model_config = Obj()
            cfg.model_config.hf_text_config = Obj()
            cfg.model_config.hf_text_config.mamba_ssm_dtype = 'float32'
            Qwen3_5ForConditionalGenerationConfig.verify_and_update_config(cfg)
            self.assertEqual(cfg.cache_config.mamba_ssm_cache_dtype, expected)


@unittest.skipUnless(_has_xpu(), 'needs an XPU device and vllm_xpu_kernels')
class HalfStateXpuTest(unittest.TestCase):
    def run_case(self, state_dtype, lens, init):
        gen = torch.Generator(device='cpu').manual_seed(20261119)

        def rnd(*shape, scale=1.0, dtype=torch.bfloat16):
            return (torch.randn(*shape, generator=gen) * scale).to(dtype).to('xpu')

        tokens, batch = sum(lens), len(lens)
        conv_w = rnd(CONV, KS, scale=0.3)
        a_log = rnd(HV, dtype=torch.float32)
        dt_bias = rnd(HV, scale=0.5)
        qkvz = rnd(tokens, 2 * HK * DK + 2 * HV * DV)
        ba = rnd(tokens, 2 * HV)
        conv = rnd(batch + 1, KS - 1, CONV, scale=0.5)
        # The initial state is drawn in half precision so both runs start from the same values.
        ssm = rnd(batch + 1, HV, DK, DV, scale=0.1, dtype=torch.float16).to(state_dtype)
        loc = torch.tensor([0] + torch.tensor(lens).cumsum(0).tolist(), dtype=torch.int32, device='xpu')
        has_init = torch.tensor(init, dtype=torch.bool, device='xpu')
        idx = torch.arange(1, batch + 1, dtype=torch.int32, device='xpu')
        out = torch.zeros(tokens, HV, DV, dtype=torch.bfloat16, device='xpu')
        z = torch.zeros(tokens, HV, DV, dtype=torch.bfloat16, device='xpu')
        prefills = sum(1 for n in lens if n > 1)
        torch.ops._xpu_C.gdn_attention(out, z, qkvz, ba, HK, HV, DK, DV, conv, ssm, conv_w, None, 'silu',
                                       a_log, dt_bias, prefills, batch - prefills, 0, has_init, loc, None, idx,
                                       None, None, None, None, tokens, 1, False)
        torch.xpu.synchronize()
        self.assertEqual(ssm.dtype, state_dtype)
        return out.float().cpu(), ssm.float().cpu()

    def test_half_state_tracks_float32(self):
        for lens, init in (([300, 37], [1, 0]), ([1, 1, 1, 1], [1, 1, 1, 1])):
            ref_out, ref_ssm = self.run_case(torch.float32, lens, init)
            for dtype, tol in ((torch.float16, 0.02), (torch.bfloat16, 0.06)):
                with self.subTest(lens=lens, dtype=dtype):
                    out, ssm = self.run_case(dtype, lens, init)
                    self.assertTrue(torch.isfinite(out).all())
                    scale = ref_out.abs().max().item()
                    err = (out - ref_out).abs().max().item() / scale
                    print('lens %s state %s: max |out diff| / max |out| = %.2e' % (lens, dtype, err))
                    self.assertLess(err, tol)
                    serr = (ssm - ref_ssm).abs().max().item() / ref_ssm.abs().max().item()
                    self.assertLess(serr, tol)


if __name__ == '__main__':
    unittest.main()
