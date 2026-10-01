"""Capture Swift-specific GPTQ Hessians through vLLM 0.30 worker RPCs.

Uses eager TP2 execution. Row-parallel inputs are gathered before calibration,
so the on-disk full-width tensors receive full-width Hessians.
"""
import argparse
import hashlib
import json
from pathlib import Path
import time
import urllib.request


def install(worker):
    import torch
    from vllm.distributed import get_tensor_model_parallel_rank
    from vllm.distributed.communication_op import tensor_model_parallel_all_gather
    from vllm.model_executor.layers.linear import RowParallelLinear

    runner = worker.model_runner
    target = runner.get_model()
    draft = runner.get_draft_model()
    assert draft is not None
    rank = get_tensor_model_parallel_rank()
    state = {'H': {}, 'Xe': {}, 'nrows': {}, 'hooks': [], 'rank': rank}
    worker._swift_calibration = state
    modules = dict(draft.named_modules())

    def find(suffix):
        found = [(n, m) for n, m in modules.items() if n.endswith(suffix)]
        assert len(found) == 1, (suffix, [n for n, _ in found])
        return found[0][1]

    def capture(name, x, gather=False):
        x = x.detach().reshape(-1, x.shape[-1])
        if gather:
            x = tensor_model_parallel_all_gather(x, dim=-1)
        if rank != 0:
            return
        x = x.float()
        if name not in state['H']:
            state['H'][name] = torch.zeros((x.shape[1], x.shape[1]), device=x.device)
            state['Xe'][name] = []
            state['nrows'][name] = 0
        row_ids = torch.arange(x.shape[0], device=x.device) + state['nrows'][name]
        held = row_ids.remainder(64) == 0
        remaining = 1024 - sum(t.shape[0] for t in state['Xe'][name])
        if remaining > 0:
            state['Xe'][name].append(x[held][:remaining].clone())
        training = x[~held]
        state['H'][name].add_(training.t() @ training)
        state['nrows'][name] += x.shape[0]

    suffixes = {
        'model.fc': '.fc',
        'model.layers.0.self_attn.qkv_proj': 'layers.0.self_attn.qkv_proj',
        'model.layers.0.self_attn.o_proj': 'layers.0.self_attn.o_proj',
        'model.layers.0.mlp.gate_up_proj': 'layers.0.mlp.gate_up_proj',
        'model.layers.0.mlp.down_proj': 'layers.0.mlp.down_proj',
    }
    for name, suffix in suffixes.items():
        module = find(suffix)
        assert getattr(module, 'weight', None) is not None
        assert module.weight.dtype in (torch.float16, torch.bfloat16)
        gather = isinstance(module, RowParallelLinear) and module.input_is_parallel
        def hook(mod, inputs, key=name, collect=gather):
            capture(key, inputs[0], collect)
        state['hooks'].append(module.register_forward_pre_hook(hook))

    processors = []
    for model in (target, draft):
        processors += [m for n, m in model.named_modules() if n.endswith('logits_processor')]
    processors = list({id(m): m for m in processors}.values())
    assert processors
    for processor in processors:
        original = processor._apply_head
        def apply_head(head, hidden, bias, original=original):
            assert head.weight.dtype in (torch.float16, torch.bfloat16)
            capture('language_model.lm_head', hidden)
            return original(head, hidden, bias)
        processor._apply_head = apply_head
    return {'rank': rank, 'hooked_linears': len(suffixes), 'head_processors': len(processors)}


def report(worker):
    state = worker._swift_calibration
    return {'rank': state['rank'], 'rows': state['nrows']}


def finish(worker, output):
    import torch
    state = worker._swift_calibration
    for hook in state['hooks']:
        hook.remove()
    if state['rank'] != 0:
        return {'rank': state['rank']}
    assert len(state['H']) == 6, state['H'].keys()
    assert min(state['nrows'].values()) >= 1000, state['nrows']
    checkpoint = {
        'H': {k: v.cpu() for k, v in state['H'].items()},
        'Xe': {k: [t.cpu() for t in v] for k, v in state['Xe'].items()},
        'nrows': state['nrows'],
    }
    path = Path(output) / 'hessians.pt'
    torch.save(checkpoint, str(path) + '.partial')
    Path(str(path) + '.partial').replace(path)
    return {'rows': state['nrows'], 'dimensions': {k: list(v.shape) for k, v in checkpoint['H'].items()}}


class CalibrationWorkerExtension:
    def install_swift_calibration(self):
        return install(self)

    def report_swift_calibration(self):
        return report(self)

    def finish_swift_calibration(self, output):
        return finish(self, output)


def main():
    from vllm import LLM, SamplingParams
    p = argparse.ArgumentParser()
    p.add_argument('--model', required=True)
    p.add_argument('--out', required=True)
    p.add_argument('--prompts', type=int, default=128)
    p.add_argument('--seq-len', type=int, default=384)
    p.add_argument('--gen', type=int, default=64)
    args = p.parse_args()
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    source = 'https://raw.githubusercontent.com/pytorch/examples/main/word_language_model/data/wikitext-2/valid.txt'
    cache = out / 'calib.txt'
    if not cache.exists():
        cache.write_bytes(urllib.request.urlopen(source, timeout=60).read())
    manifest = {'source': source, 'sha256': hashlib.sha256(cache.read_bytes()).hexdigest(),
                'prompts': args.prompts, 'seq_len': args.seq_len, 'generation_limit': args.gen,
                'tensor_parallel': 2, 'heldout_stride': 64, 'heldout_cap': 1024}
    (out / 'calibration.json').write_text(json.dumps(manifest, indent=2))
    llm = LLM(model=args.model, quantization='gptq', dtype='bfloat16',
              tensor_parallel_size=2, max_model_len=1024, max_num_seqs=4,
              max_num_batched_tokens=2048, gpu_memory_utilization=0.65,
              language_model_only=True, enable_prefix_caching=False,
              enforce_eager=True, compilation_config={'mode': 0},
              kv_cache_dtype='int8_k_int4_v',
              worker_extension_cls='calibrate_swift_bake.CalibrationWorkerExtension',
              speculative_config={'method': 'mtp', 'num_speculative_tokens': 6})
    print('CALIBRATION_HOOKS', llm.collective_rpc('install_swift_calibration'), flush=True)
    tokenizer = llm.get_tokenizer()
    ids = tokenizer(cache.read_text(), add_special_tokens=False)['input_ids']
    assert len(ids) >= args.prompts * args.seq_len
    prompts = [tokenizer.decode(ids[i*args.seq_len:(i+1)*args.seq_len]) for i in range(args.prompts)]
    start = time.time()
    for begin in range(0, len(prompts), 4):
        llm.generate(prompts[begin:begin+4], SamplingParams(max_tokens=args.gen, temperature=0), use_tqdm=False)
        if begin % 16 == 0:
            print('CALIBRATION_PROGRESS', begin+4, 'elapsed', round(time.time()-start), llm.collective_rpc('report_swift_calibration'), flush=True)
    print('CALIBRATION_SAVED', llm.collective_rpc('finish_swift_calibration', args=(str(out),)), flush=True)


if __name__ == '__main__':
    main()
