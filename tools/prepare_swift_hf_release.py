"""Stage a publication copy without changing the serving checkpoint.

Unchanged shards are hardlinked. Changed metadata and shards are copied;
safetensors notices change headers only, preserving tensor payload bytes.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import struct

SOURCE = 'ukisai/Swift-1.5-Qwen3.8-27b-W4A16-AutoRound'
NOTICE = 'Modified by Wrapzii, 2026-10-01: Swift-specific GPTQ head/MTP bake, INT8 embedding side file, GPTQ compatibility and low-default chat template; see MODIFICATIONS.json.'
CHANGED_SHARDS = {'model-bake-int4.safetensors', 'model-embed-int8.safetensors', 'model_extra_tensors.safetensors', 'compat_g_idx.safetensors'}

def annotated_shard(src, dst):
    digest = hashlib.sha256()
    with src.open('rb') as reader, dst.open('xb') as writer:
        size = struct.unpack('<Q', reader.read(8))[0]
        header = json.loads(reader.read(size))
        header.setdefault('__metadata__', {})['modification_notice'] = NOTICE
        encoded = json.dumps(header, separators=(',', ':')).encode()
        encoded += b' ' * (-len(encoded) % 8)
        writer.write(struct.pack('<Q', len(encoded)))
        writer.write(encoded)
        while block := reader.read(8 * 1024**2):
            writer.write(block)
            digest.update(block)
    return digest.hexdigest()

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--src', type=Path, required=True)
    p.add_argument('--dst', type=Path, required=True)
    p.add_argument('--repo', type=Path, required=True)
    a = p.parse_args()
    if a.dst.exists() or a.src.resolve() == a.dst.resolve():
        raise ValueError('Destination must be new and separate from source')
    a.dst.mkdir(parents=True)
    modifications = {}
    for src in sorted(a.src.iterdir()):
        if not src.is_file():
            continue
        name = src.name
        if name.endswith('.upstream') or name in {'README.md', 'UPLOAD_MANIFEST.json', 'QUANTIZATION_MANIFEST.json'}:
            continue
        dst = a.dst / name
        if name.endswith('.safetensors'):
            if name in CHANGED_SHARDS:
                modifications[name] = {'notice': NOTICE, 'tensor_payload_sha256': annotated_shard(src, dst), 'payload_changed_during_publication': False}
                dst.chmod(0o644)
            else:
                os.link(src, dst)
        else:
            shutil.copyfile(src, dst)
            dst.chmod(0o644)
    for name in ('config.json', 'BAKE.json', 'model.safetensors.index.json', 'quantization_config.json', 'quantize_config.json', 'COMPATIBILITY.json'):
        file = a.dst / name
        obj = json.loads(file.read_text())
        obj['_modification_notice'] = NOTICE
        if name == 'config.json':
            obj['_derivative_of'] = SOURCE
        elif name == 'BAKE.json':
            obj['source'] = SOURCE
        elif name == 'COMPATIBILITY.json':
            obj['dense_embedding_on_disk'] = True
            obj['dense_embedding_resident_with_patched_loader'] = False
        file.write_text(json.dumps(obj, indent=2) + '\n')
        modifications[name] = {'notice': NOTICE}
    template = (a.src / 'chat_template_low.jinja').read_text()
    template = '{# ' + NOTICE + ' #}\n' + template
    for name in ('chat_template.jinja', 'chat_template_low.jinja'):
        (a.dst / name).write_text(template)
        modifications[name] = {'notice': NOTICE}
    tokpath = a.dst / 'tokenizer_config.json'
    tok = json.loads(tokpath.read_text())
    tok['chat_template'] = template
    tok['_modification_notice'] = NOTICE
    tokpath.write_text(json.dumps(tok, indent=2) + '\n')
    modifications[tokpath.name] = {'notice': NOTICE}
    for src in (a.repo / 'huggingface/swift-baked').iterdir():
        if src.is_file():
            shutil.copyfile(src, a.dst / src.name)
    (a.dst / 'MODIFICATIONS.json').write_text(json.dumps({'author': 'Wrapzii', 'date': '2026-10-01', 'source': SOURCE, 'files': modifications}, indent=2) + '\n')
    results = a.dst / 'benchmarks'
    results.mkdir()
    for name in ('swift-bake-manifest.json', 'swift-bake-validation.json', 'swift-coding-live.jsonl', 'swift-baked-coding-live.jsonl', 'swift-baked-coding-c1.jsonl'):
        shutil.copyfile(a.repo / 'results/2026-10-01' / name, results / name)
    index = json.loads((a.dst / 'model.safetensors.index.json').read_text())
    count = 0
    for name in sorted(set(index['weight_map'].values())):
        file = a.dst / name
        with file.open('rb') as f:
            header = json.loads(f.read(struct.unpack('<Q', f.read(8))[0]))
        for key, shard in index['weight_map'].items():
            if shard == name:
                assert key in header, (key, name)
                count += 1
    assert count == 2426, count
    assert (a.dst / 'model-embed-int8.safetensors').is_file()
    manifest = {str(f.relative_to(a.dst)): f.stat().st_size for f in sorted(a.dst.rglob('*')) if f.is_file()}
    (a.dst / 'RELEASE_FILES.json').write_text(json.dumps({'files': manifest, 'total_bytes': sum(manifest.values()), 'indexed_tensors': count}, indent=2) + '\n')
    print(json.dumps({'destination': str(a.dst), 'indexed_tensors': count, 'files': len(manifest), 'bytes': sum(manifest.values())}))

if __name__ == '__main__':
    main()
