#!/usr/bin/env python3
"""Launch the experimental four-XPU server without replacing any container.

Dry-run prints the exact Docker argv and launch settings. Start with C4/eager,
then validate graphs and increase --max-seqs on the actual B60/B70 host.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def parser():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--model-dir', required=True, type=Path)
    p.add_argument('--devices', default='0,1,2,3')
    p.add_argument('--image', default='vllm-openai-xpu:v0.30.0-k8v4-tp2cp2')
    p.add_argument('--name', default='vllm-k8v4-tp2cp2')
    p.add_argument('--port', type=int, default=8202)
    p.add_argument('--bind', default='127.0.0.1')
    p.add_argument('--served-name', default='Swift-Qwen-27B-TP2CP2')
    p.add_argument('--max-seqs', type=int, default=4)
    p.add_argument('--context', type=int, default=262144)
    p.add_argument('--batch-tokens', type=int, default=4224)
    p.add_argument('--utilization', type=float, default=.90)
    p.add_argument('--cache', type=Path, default=ROOT/'.cache/tp2cp2')
    p.add_argument('--chat-template', type=Path, default=ROOT/'templates/chat_template.jinja')
    p.add_argument('--graphs', action='store_true', help='enable FULL_DECODE_ONLY after graph correctness gate')
    p.add_argument('--no-mtp', action='store_true', help='no-speculation correctness/control run')
    p.add_argument('--dry-run', action='store_true')
    return p


def command(args):
    try:
        devices = [int(x) for x in args.devices.split(',')]
    except ValueError as error:
        raise ValueError('select four distinct non-negative GPU indices') from error
    if len(devices) != 4 or len(set(devices)) != 4 or min(devices) < 0:
        raise ValueError('select four distinct non-negative GPU indices')
    if args.max_seqs < 1 or args.max_seqs > 32 or args.context < 128 or args.batch_tokens < 128:
        raise ValueError('max-seqs must be 1..32; context and batch-tokens must be >=128')
    if not .1 <= args.utilization <= .95 or not 1 <= args.port <= 65535:
        raise ValueError('utilization must be 0.10..0.95 and port must be 1..65535')
    if not args.model_dir.is_dir() or not args.chat_template.is_file():
        raise ValueError('model directory and chat template must exist')
    if args.no_mtp:
        width, speculative = 1, []
    else:
        width = 7
        speculative = ['--speculative-config='+json.dumps({
            'method':'mtp','num_speculative_tokens':6,'use_local_argmax_reduction':True},separators=(',',':'))]
    capture = [i*width for i in range(1,args.max_seqs+1)]
    env = {
        'K8V4_CP':'2', 'VLLM_USE_V2_MODEL_RUNNER':'0',
        'ZE_AFFINITY_MASK':','.join(map(str, devices)), 'ZE_FLAT_DEVICE_HIERARCHY':'COMPOSITE',
        'PYTHONPATH':'/opt/k8v4', 'XE2_KV_LIB':'/opt/k8v4/libxe2_kv.so',
        'K8V4_SDPA_LIB':'/opt/k8v4/libk8v4_sdpa.so', 'K8V4_PREFILL':'onednn',
        'K8V4_PREFILL_GATHER':'triton', 'K8V4_PREFILL_GEMM':'w4a8',
        'XE2_KV_COMPACT_SLM':'1', 'XE2_KV_PARTIAL_FP16':'1', 'XE2_KV_S2_NSG':'32',
        'XE2_KV_S2_NSG_DRAFT':'32', 'XE2_KV_S2_NSG_VERIFY':'8', 'XE2_KV_S2_TWO_PASS':'0',
        # The serial TP2 cascade remains in this branch. The new CP path must
        # export LSE; its initial q1 implementation does not use the cascade.
        'XE2_KV_CASCADE':'0', 'B70_MTP_BF16_DRAFT':'1', 'B70_WORKER_AFFINITY':'1',
        'CCL_SYCL_ALLREDUCE_LL':'twoshots','CCL_SYCL_ALLREDUCE_SIMPLE_READ':'1',
        'CCL_SYCL_COPY_ENGINE':'1','CCL_SYCL_ALLREDUCE_SIMPLE_THRESHOLD':'4294967296',
        'CCL_SYCL_REDUCE_SCATTER_SIMPLE_THRESHOLD':'4294967296',
        'CCL_SYCL_ALLGATHERV_SIMPLE_THRESHOLD':'4294967296','CCL_SYCL_ALLTOALL_TMP_BUF':'1',
        'PYTORCH_ALLOC_CONF':'expandable_segments:True','HF_HUB_OFFLINE':'1',
        'TRANSFORMERS_OFFLINE':'1','VLLM_TARGET_DEVICE':'xpu',
        'VLLM_XPU_ENABLE_XPU_GRAPH':'1' if args.graphs else '0',
        'VLLM_CACHE_ROOT':'/root/.cache/vllm/tp2cp2-v1',
    }
    cmd = ['docker','run','-d','--name',args.name,'--restart=no','--device','/dev/dri',
           '--ipc=host','--shm-size=8g','-p',f'{args.bind}:{args.port}:8000',
           '-v','/dev/dri:/dev/dri','-v','/dev/dri/by-path:/dev/dri/by-path:ro',
           '-v',f'{args.model_dir.resolve()}:/model:ro',
           '-v',f'{args.chat_template.resolve()}:/model/chat_template.jinja:ro',
           '-v',f'{args.cache.resolve()}:/root/.cache/vllm']
    for key,value in env.items():cmd.extend(['-e',f'{key}={value}'])
    cmd += [args.image,'/model','--host=0.0.0.0','--port=8000',
            '--served-model-name='+args.served_name,'--dtype=float16','--trust-remote-code',
            '--kv-cache-dtype=int8_k_int4_v','--tensor-parallel-size=2',
            '--prefill-context-parallel-size=2','--decode-context-parallel-size=2',
            '--cp-kv-cache-interleave-size=64','--distributed-executor-backend=mp',
            '--max-model-len='+str(args.context),'--max-num-seqs='+str(args.max_seqs),
            '--max-num-batched-tokens='+str(args.batch_tokens),
            '--gpu-memory-utilization='+str(args.utilization),'--enable-prefix-caching',
            '--language-model-only','--no-async-scheduling','--enable-auto-tool-choice',
            '--tool-call-parser=qwen3_xml','--reasoning-parser=qwen3']
    cmd += speculative
    if args.graphs:
        cmd += ['--compilation-config='+json.dumps({'cudagraph_mode':'FULL_DECODE_ONLY',
                                                  'cudagraph_capture_sizes':capture},separators=(',',':'))]
    else:
        cmd += ['--enforce-eager']
    return cmd


def main():
    args=parser().parse_args()
    try:cmd=command(args)
    except ValueError as error:raise SystemExit(str(error))
    if args.dry_run:
        print(json.dumps({'argv':cmd,'world_size':4,'tp_groups':[[0,1],[2,3]],
                          'cp_groups':[[0,2],[1,3]],'experimental':True,
                          'concurrency_limit':args.max_seqs,
                          'capacity_at_requested_context':'must be measured on target hardware'},indent=2))
        return
    args.cache.mkdir(parents=True,exist_ok=True)
    # No docker rm, clock changes, or automatic takeover of production ports.
    subprocess.run(cmd,check=True)
    print(f'Inspect docker logs -f {args.name}; endpoint http://{args.bind}:{args.port}/v1')


if __name__=='__main__':main()
