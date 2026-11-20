# GDN recurrent-state dtype knob (K8V4_MAMBA_SSM_DTYPE, 2026-11-19)

`K8V4_MAMBA_SSM_DTYPE=float16|bfloat16|float32` passes `--mamba-ssm-cache-dtype`; unset keeps the Swift bake's
`mamba_ssm_dtype` (float32) and the default launch command is unchanged. Changes numerics (state rounded to 16
bits each token); our B70 prod runs float16.

Measured on one B70, config A + draft vocab (`dpS16` vs `gapVf` / `dpD-base`): KV 384,176 -> 444,505 tokens; step
time unchanged (gap p50 44 / 63-64 ms at 1 / 4 users): the stock spec kernel stores the 16-bit state element by
element, so in the serving profile it is no faster (4.19 -> 4.68 ms per 4-user step). Use it together with
`K8V4_GDN_RECOVERSSM=1` (branch `b70/gdn-recoverssm`), which reads and writes the state vectorised: 1 user
44 -> 42 ms per step, 4 users 63 -> 61 ms, KV 509K. Full numbers: docs/2026-11-19-decode-push.md on that branch.
