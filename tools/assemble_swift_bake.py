"""Assemble Swift's nine-linear GPTQ bake and an INT8 embedding side file.

Unchanged shards are hardlinked; changed shards are streamed without loading
them into RAM. Source files are never modified. Dense embedding remains indexed
for stock loading and is replaced by the TP-aware runtime embedding method.
"""
import argparse
import json
import os
from pathlib import Path
import shutil
import struct

import torch
from safetensors import safe_open
from safetensors.torch import save_file

REPLACED = {'lm_head.weight', 'mtp.fc.weight'} | {
    f'mtp.layers.0.{name}.weight' for name in
    ('self_attn.q_proj', 'self_attn.k_proj', 'self_attn.v_proj', 'self_attn.o_proj',
     'mlp.gate_proj', 'mlp.up_proj', 'mlp.down_proj')}
EMBED = 'model.language_model.embed_tokens.weight'


def rewrite(source, destination, keep):
    with source.open('rb') as reader:
        size = struct.unpack('<Q', reader.read(8))[0]
        header = json.loads(reader.read(size))
        base = size + 8
        new, offset = {}, 0
        if '__metadata__' in header:
            new['__metadata__'] = header['__metadata__']
        for name in keep:
            info = dict(header[name])
            length = info['data_offsets'][1] - info['data_offsets'][0]
            info['data_offsets'] = [offset, offset + length]
            new[name] = info
            offset += length
        encoded = json.dumps(new, separators=(',', ':')).encode()
        encoded += b' ' * (-len(encoded) % 8)
        partial = destination.with_suffix('.partial')
        with partial.open('wb') as writer:
            writer.write(struct.pack('<Q', len(encoded)))
            writer.write(encoded)
            for name in keep:
                start, end = header[name]['data_offsets']
                reader.seek(base + start)
                remaining = end - start
                while remaining:
                    block = reader.read(min(remaining, 8 * 1024**2))
                    if not block:
                        raise IOError('Truncated source shard')
                    writer.write(block)
                    remaining -= len(block)
        partial.replace(destination)


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--src', type=Path, required=True)
    p.add_argument('--bake', type=Path, required=True)
    p.add_argument('--dst', type=Path, required=True)
    a = p.parse_args()
    assert not a.dst.exists(), 'Destination must be new; incomplete candidates are retained for inspection'
    assert a.src.resolve() != a.dst.resolve()
    index = json.loads((a.src / 'model.safetensors.index.json').read_text())
    weights = index['weight_map']
    assert REPLACED <= weights.keys()
    with safe_open(str(a.bake / 'bake-int4.safetensors'), framework='pt') as f:
        baked = list(f.keys())
    assert len(baked) == 36
    for name in REPLACED:
        for suffix in ('qweight', 'qzeros', 'scales', 'g_idx'):
            assert name[:-7] + '.' + suffix in baked
    a.dst.mkdir()
    mapped = {}
    for shard in sorted(set(weights.values())):
        assert Path(shard).name == shard
        keep = sorted(k for k, v in weights.items() if v == shard and k not in REPLACED)
        drop = [k for k, v in weights.items() if v == shard and k in REPLACED]
        if drop:
            if keep:
                rewrite(a.src / shard, a.dst / shard, keep)
        else:
            os.link(a.src / shard, a.dst / shard)
        mapped.update({k: shard for k in keep})
        print('ASSEMBLY_SHARD', shard, 'kept', len(keep), 'dropped', drop, flush=True)
    shutil.copy2(a.bake / 'bake-int4.safetensors', a.dst / 'model-bake-int4.safetensors')
    mapped.update({k: 'model-bake-int4.safetensors' for k in baked})
    for file in a.src.iterdir():
        if file.is_file() and not file.name.endswith('.safetensors') and file.name != 'model.safetensors.index.json':
            shutil.copy2(file, a.dst / file.name)

    with safe_open(str(a.src / weights[EMBED]), framework='pt') as f:
        tensor = f.get_slice(EMBED)
        vocab, hidden = tensor.get_shape()
        quant = torch.empty((vocab, hidden), dtype=torch.int8)
        scales = torch.empty((vocab, 1), dtype=torch.float16)
        squared_error = squared_signal = 0.0
        for first in range(0, vocab, 2048):
            last = min(first + 2048, vocab)
            original = tensor[first:last].float()
            scale = (original.abs().amax(1, keepdim=True).clamp_min(1e-12) / 127).half()
            scale.clamp_min_(2**-24)  # Keep zero/tiny rows finite after FP16 scale storage.
            codes = (original / scale.float()).round().clamp(-128, 127).to(torch.int8)
            quant[first:last], scales[first:last] = codes, scale
            error = codes.float() * scale.float() - original
            squared_error += error.square().sum().item()
            squared_signal += original.square().sum().item()
    side = 'model-embed-int8.safetensors'
    save_file({EMBED: quant, EMBED + '_scale': scales}, str(a.dst / side))
    embed_config = {'bits': 8, 'scheme': 'per_row_absmax_symmetric', 'packed': False,
                    'side_file': side, 'key_weight': EMBED, 'key_scale': EMBED + '_scale'}
    config = json.loads((a.dst / 'config.json').read_text())
    q = config['quantization_config']
    q['lm_head'] = True
    q['dynamic'] = {k: v for k, v in q.get('dynamic', {}).items() if 'mtp' not in k}
    config['embed_tokens_quant'] = embed_config
    config['_derivative_of'] = str(a.src.resolve())
    config['_derivative_note'] = 'Swift-specific Hessian GPTQ bake of nine linears; INT8 embedding runtime side file'
    compatibility = json.loads((a.dst / 'COMPATIBILITY.json').read_text())
    compatibility.update(changed_weight_values=True, dense_lm_head=False, dense_mtp=False,
                         dense_embedding=False, weight_stage='Swift-specific GPTQ bake plus resident INT8 embedding')
    (a.dst / 'COMPATIBILITY.json').write_text(json.dumps(compatibility, indent=2) + '\n')
    for name in ('quantize_config.json', 'quantization_config.json'):
        (a.dst / name).write_text(json.dumps(q, indent=2) + '\n')
    (a.dst / 'config.json').write_text(json.dumps(config, indent=2) + '\n')
    total = 0
    for shard in set(mapped.values()):
        with (a.dst / shard).open('rb') as f:
            header = json.loads(f.read(struct.unpack('<Q', f.read(8))[0]))
        assert not (REPLACED & header.keys()), 'Dense replaced tensor survived physically'
        total += sum(v['data_offsets'][1] - v['data_offsets'][0] for k, v in header.items() if k != '__metadata__')
    (a.dst / 'model.safetensors.index.json').write_text(json.dumps(
        {'metadata': {'total_size': total, 'embed_tokens_quant': embed_config},
         'weight_map': dict(sorted(mapped.items()))}, indent=2) + '\n')
    manifest = {'source': str(a.src.resolve()), 'changed_dense_linears': sorted(REPLACED),
                'body_linears_preserved': 400, 'embedding_relative_l2_error': (squared_error/squared_signal)**0.5,
                'special_linear_quantization': {'method':'GPTQ','bits':4,'group_size':128,'sym':True,'desc_act':False,'damp_percent':0.01},
                'bake_manifest': json.loads((a.bake / 'bake-manifest.json').read_text()),
                'calibration': json.loads((a.bake / 'calibration.json').read_text())}
    (a.dst / 'BAKE.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print('SWIFT_BAKE_ASSEMBLED', a.dst, 'embedding_relative_l2_error', manifest['embedding_relative_l2_error'], flush=True)


if __name__ == '__main__':
    main()
