"""Head-parallel schedule for two GDN prefill kernels of vllm-xpu-kernels (0.1.14.1 and 0.1.17).

chunk_compute_A_kernel and chunk_compute_wu_kernel give each work-group one
64-token chunk and loop over all value heads (48 on Qwen3.8-27B) inside it.
A short prefill has few chunks (200 tokens = 4), so 4 work-groups run 48
serial head iterations each while the rest of the GPU idles: about 30 ms per
prefill (48 GDN layers) at any length below ~2K tokens.

This splice spreads flattened (chunk, v_head) units over the same persistent
work-groups instead. Each unit runs exactly the per-(chunk, head) code it ran
before, on the same data, so the outputs are bit-identical; only the
work-group -> unit assignment changes. Measured on one B70 (xk 0.1.15.4
build, same kernel text): GDN op time per 48-layer prefill 65 tok 28.6 ->
9.6 ms, 200 tok 31.1 -> 10.1 ms, 2K 64.6 -> 49.8 ms, 8K unchanged.

Anchored, refuses unknown source, and refuses to apply twice.
usage: python3 gdn_heads_patch.py <vllm-xpu-kernels source root>
"""
from __future__ import annotations

import pathlib
import sys

TARGET = 'csrc/xpu/gdn_attn/xe_2/chunk_gated_delta_rule_kernels_xe2.hpp'
MARKER = 'K8V4_GDN_HEADS_V1'
FUNCTIONS = ('CUTE_DEVICE void chunk_compute_A_kernel(',
             'CUTE_DEVICE void chunk_compute_wu_kernel(')
REPLACEMENTS = (
    ('  int chunk_id = item.get_group(1);\n',
     '  int unit = item.get_group(1);  // %s: flattened (chunk, v_head) unit\n' % MARKER),
    ('    if (chunk_id >= cumsum_chunks) {\n',
     '    if (unit >= cumsum_chunks * num_v_heads) {\n'),
    ('    while (chunk_id < cumsum_chunks) {\n      const int chunk_start_offset = chunk_id * chunk_size;\n',
     '    while (unit < cumsum_chunks * num_v_heads) {\n      const int chunk_id = unit / num_v_heads;\n'
     '      const int chunk_start_offset = chunk_id * chunk_size;\n'),
    ('      for (int v_head_id = 0; v_head_id < num_v_heads; ++v_head_id) {\n',
     '      {\n        const int v_head_id = unit % num_v_heads;\n'),
    ('      chunk_id += global_chunk_range;\n',
     '      unit += global_chunk_range;\n'),
)


def patch_function(src: str, signature: str) -> str:
    if src.count(signature) != 1:
        raise RuntimeError('expected one %r, found %d' % (signature, src.count(signature)))
    start = src.index(signature)
    end = src.index('\ntemplate <', start)
    body = src[start:end]
    for old, new in REPLACEMENTS:
        if body.count(old) != 1:
            raise RuntimeError('unknown source in %s: anchor %r found %d times'
                               % (signature.split()[2], old.strip(), body.count(old)))
        body = body.replace(old, new)
    return src[:start] + body + src[end:]


def patch_source(src: str) -> str:
    if MARKER in src:
        raise RuntimeError('%s already applied' % MARKER)
    for signature in FUNCTIONS:
        src = patch_function(src, signature)
    return src


def main(argv: list[str]) -> int:
    if len(argv) != 2:
        print(__doc__.strip().splitlines()[-1], file=sys.stderr)
        return 2
    path = pathlib.Path(argv[1]) / TARGET
    path.write_text(patch_source(path.read_text()))
    print('gdn_heads_patch: chunk_compute_A and chunk_compute_wu now distribute (chunk, v_head) units')
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
