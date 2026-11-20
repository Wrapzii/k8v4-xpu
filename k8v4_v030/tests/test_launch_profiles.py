"""Exercise the real Bash argv builder without touching Docker or GPUs."""
from __future__ import annotations

import json
import os
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BASH = os.environ.get('K8V4_BASH') or shutil.which('bash')
if os.name == 'nt' and Path('C:/Program Files/Git/bin/bash.exe').exists():
    BASH = 'C:/Program Files/Git/bin/bash.exe'


def _no_temp(args):
    """argv without the per-call temporary model and cache paths."""
    return [x for x in args if '/model:ro' not in x and ':/root/.cache/vllm' not in x]


@unittest.skipUnless(BASH, 'Bash is needed to exercise launch.sh')
class LaunchProfileTest(unittest.TestCase):
    def command(self, **overrides):
        with tempfile.TemporaryDirectory() as temp:
            env = {k: v for k, v in os.environ.items() if not k.startswith(('K8V4_', 'XE2_KV_', 'MTP_PATCH_'))
                   and k not in ('IMAGE', 'NAME', 'PORT', 'BIND_HOST', 'MODEL_DIR', 'CHAT_TEMPLATE', 'VLLM_CACHE_ROOT')}
            cache = Path(temp) / 'cache'
            env.update(K8V4_DRY_RUN='1', K8V4_CACHE=str(cache), MODEL_DIR=temp, CHAT_TEMPLATE=str(ROOT / 'templates/chat_template.jinja'))
            env.update(overrides)
            result = subprocess.run([BASH, str(ROOT / 'k8v4_v030/launch.sh')], env=env, capture_output=True)
            if result.returncode:
                return result, []
            self.assertFalse(cache.exists())
            return result, result.stdout.decode().rstrip('\0').split('\0')

    def test_tp2_retains_the_measured_settings(self):
        result, args = self.command()
        self.assertEqual(result.returncode, 0, result.stderr)
        for arg in ('--tensor-parallel-size=2', '--max-num-seqs=4', '--max-num-batched-tokens=4224',
                    '--gpu-memory-utilization=0.95', '--enable-prefix-caching', 'ZE_AFFINITY_MASK=0,1',
                    'CCL_SYCL_ALLREDUCE_LL=twoshots', '127.0.0.1:8200:8000', 'vllm-openai-xpu:v0.34.0-k8v4-unified'):
            self.assertIn(arg, args)
        graph = next(arg for arg in args if arg.startswith('--compilation-config='))
        self.assertEqual(json.loads(graph.split('=', 1)[1])['cudagraph_capture_sizes'], [7, 14, 21, 28])
        self.assertNotIn('--mamba-cache-mode=none', args)

    def test_tp1_selects_one_gpu_with_separate_cache_and_no_collectives(self):
        result, args = self.command(K8V4_TP='1', K8V4_DEVICES='1')
        self.assertEqual(result.returncode, 0, result.stderr)
        for arg in ('--tensor-parallel-size=1', '--max-num-seqs=1', '--gpu-memory-utilization=0.92',
                    '--no-enable-prefix-caching', '--mamba-cache-mode=none', 'ZE_AFFINITY_MASK=1',
                    'NEOReadDebugKeys=1', 'ForceZeDeviceCanAccessPerReturnValue=0',
                    '127.0.0.1:8201:8000', 'vllm-openai-xpu:v0.34.0-k8v4-unified'):
            self.assertIn(arg, args)
        self.assertFalse(any(arg.startswith('CCL_') for arg in args))
        self.assertIn('VLLM_CACHE_ROOT=/root/.cache/vllm/w4a8-tp1-v1', args)
        graph = next(arg for arg in args if arg.startswith('--compilation-config='))
        self.assertEqual(json.loads(graph.split('=', 1)[1])['cudagraph_capture_sizes'], [7])

    def test_explicit_tp1_overrides_apply_to_command(self):
        result, args = self.command(K8V4_TP='1', K8V4_PREFIX_CACHING='1', K8V4_MAX_SEQS='2', K8V4_MAX_MODEL_LEN='133056')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('--enable-prefix-caching', args)
        self.assertNotIn('--mamba-cache-mode=none', args)
        self.assertIn('--max-num-seqs=2', args)
        self.assertIn('--max-model-len=133056', args)

    def test_ncontig_is_passed_only_when_set(self):
        result, default = self.command(K8V4_TP='1')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertFalse(any('K8V4_NCONTIG_RE' in arg for arg in default))
        result, args = self.command(K8V4_TP='1', K8V4_NCONTIG_RE='in_proj_ba')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('K8V4_NCONTIG_RE=in_proj_ba', args)
        self.assertIn('VLLM_CACHE_ROOT=/root/.cache/vllm/w4a8-tp1-v1-ncontig', args)
    def test_onednn_deterministic_is_passed_only_when_set(self):
        result, default = self.command(K8V4_TP='1')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertFalse(any('K8V4_ONEDNN_DETERMINISTIC' in arg for arg in default))
        result, args = self.command(K8V4_TP='1', K8V4_ONEDNN_DETERMINISTIC='1')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('K8V4_ONEDNN_DETERMINISTIC=1', args)
        self.assertIn('VLLM_CACHE_ROOT=/root/.cache/vllm/w4a8-tp1-v1', args)
        i = args.index('K8V4_ONEDNN_DETERMINISTIC=1')
        self.assertEqual(args[i - 1], '-e')
        model = lambda xs: [x.split('/', 3)[-1] if x.startswith('/tmp/') else x for x in xs]  # temp dirs differ per call
        self.assertEqual(model(args[:i - 1] + args[i + 1:]), model(default))
        result, _ = self.command(K8V4_TP='1', K8V4_ONEDNN_DETERMINISTIC='yes')
        self.assertEqual(result.returncode, 2)
        self.assertIn(b'K8V4_ONEDNN_DETERMINISTIC must be 0 or 1', result.stderr)

    def test_invalid_gpu_selections_are_rejected_before_launch(self):
        for options in ({'K8V4_TP': '4'}, {'K8V4_TP': '1', 'K8V4_DEVICES': '0,1'},
                        {'K8V4_TP': '2', 'K8V4_DEVICES': '0'}, {'K8V4_DEVICES': '1,1'},
                        {'K8V4_DEVICES': '0,01'}, {'K8V4_TP': '1', 'K8V4_PREFIX_CACHING': 'yes'}):
            with self.subTest(options=options):
                result, args = self.command(**options)
                self.assertEqual(result.returncode, 2)
                self.assertEqual(args, [])

    def test_kv_rotate_is_passed_only_when_set(self):
        result, default = self.command(K8V4_TP='1')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertFalse(any('K8V4_KV_ROTATE' in arg for arg in default))
        result, args = self.command(K8V4_TP='1', K8V4_KV_ROTATE='v')
        self.assertEqual(result.returncode, 0, result.stderr)
        i = args.index('K8V4_KV_ROTATE=v')
        self.assertEqual(args[i - 1], '-e')
        own = lambda argv: [a for a in argv if not a.startswith(tempfile.gettempdir())]  # per-call temp mounts
        self.assertEqual(own(args[:i - 1] + args[i + 1:]), own(default))
        result, _ = self.command(K8V4_TP='1', K8V4_KV_ROTATE='hadamard')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn(b'K8V4_KV_ROTATE must be', result.stderr)


# The default argv of b70/vllm-034 (vLLM 0.34 base, every opt-in knob unset), recorded from its launch.sh with
# K8V4_DRY_RUN=1; <ROOT> is the checkout. Every opt-in port on b70/combined-final must leave it byte-identical.
DEFAULT_TP1_034 = [
    'docker',
    'run',
    '-d',
    '--name',
    'vllm-k8v4-tp1',
    '--restart=no',
    '--device',
    '/dev/dri',
    '--group-add',
    '0',
    '--ipc=host',
    '--shm-size=8g',
    '-p',
    '127.0.0.1:8201:8000',
    '-v',
    '/dev/dri:/dev/dri',
    '-v',
    '/dev/dri/by-path:/dev/dri/by-path:ro',
    '-v',
    '-v',
    '<ROOT>/templates/chat_template.jinja:/model/chat_template.jinja:ro',
    '-v',
    '-v',
    '<ROOT>/k8v4_v030:/opt/k8v4/k8v4_v030:ro',
    '-e',
    'NEOReadDebugKeys=1',
    '-e',
    'ForceZeDeviceCanAccessPerReturnValue=0',
    '-e',
    'PYTHONPATH=/opt/k8v4',
    '-e',
    'XE2_KV_LIB=/opt/k8v4/libxe2_kv.so',
    '-e',
    'K8V4_SDPA_LIB=/opt/k8v4/libk8v4_sdpa.so',
    '-e',
    'K8V4_PREFILL=onednn',
    '-e',
    'K8V4_PREFILL_GATHER=triton',
    '-e',
    'K8V4_SDPA_ASYNC=0',
    '-e',
    'K8V4_PREFILL_GEMM=w4a8',
    '-e',
    'VLLM_CACHE_ROOT=/root/.cache/vllm/w4a8-tp1-v1',
    '-e',
    'XE2_KV_S2_NSG=32',
    '-e',
    'XE2_KV_S2_NSG_DRAFT=32',
    '-e',
    'XE2_KV_S2_NSG_VERIFY=8',
    '-e',
    'XE2_KV_S2_TWO_PASS=0',
    '-e',
    'B70_MTP_BF16_DRAFT=1',
    '-e',
    'B70_WORKER_AFFINITY=1',
    '-e',
    'HF_HUB_OFFLINE=1',
    '-e',
    'TRANSFORMERS_OFFLINE=1',
    '-e',
    'PYTORCH_ALLOC_CONF=expandable_segments:True',
    '-e',
    'VLLM_TARGET_DEVICE=xpu',
    '-e',
    'VLLM_XPU_ENABLE_XPU_GRAPH=1',
    '-e',
    'ZE_AFFINITY_MASK=0',
    '-e',
    'ZE_FLAT_DEVICE_HIERARCHY=COMPOSITE',
    'vllm-openai-xpu:v0.34.0-k8v4-unified',
    '/model',
    '--host=0.0.0.0',
    '--port=8000',
    '--served-model-name=Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8',
    '--gpu-memory-utilization=0.92',
    '--dtype=bfloat16',
    '--max-model-len=262144',
    '--kv-cache-dtype=int8_k_int4_v',
    '--tensor-parallel-size=1',
    '--max-num-seqs=1',
    '--max-num-batched-tokens=4224',
    '--enable-auto-tool-choice',
    '--tool-call-parser=qwen3_xml',
    '--reasoning-parser=qwen3',
    '--no-enable-prefix-caching',
    '--mamba-cache-mode=none',
    '--limit-mm-per-prompt={"image":4,"video":0}',
    '--mm-processor-kwargs={"max_pixels":1048576}',
    '--mm-processor-cache-gb=0.125',
    '--trust-remote-code',
    '--speculative-config={"method":"mtp","num_speculative_tokens":6}',
    '--compilation-config={"cudagraph_mode":"FULL_DECODE_ONLY","cudagraph_capture_sizes":[7]}',
]

DEFAULT_TP2_034 = [
    'docker',
    'run',
    '-d',
    '--name',
    'vllm-k8v4-tp2',
    '--restart=no',
    '--device',
    '/dev/dri',
    '--group-add',
    '0',
    '--ipc=host',
    '--shm-size=8g',
    '-p',
    '127.0.0.1:8200:8000',
    '-v',
    '/dev/dri:/dev/dri',
    '-v',
    '/dev/dri/by-path:/dev/dri/by-path:ro',
    '-v',
    '-v',
    '<ROOT>/templates/chat_template.jinja:/model/chat_template.jinja:ro',
    '-v',
    '-v',
    '<ROOT>/k8v4_v030:/opt/k8v4/k8v4_v030:ro',
    '-e',
    'CCL_SYCL_ALLREDUCE_LL=twoshots',
    '-e',
    'CCL_SYCL_ALLREDUCE_SIMPLE_READ=1',
    '-e',
    'CCL_SYCL_COPY_ENGINE=1',
    '-e',
    'CCL_SYCL_ALLREDUCE_SIMPLE_THRESHOLD=4294967296',
    '-e',
    'CCL_SYCL_REDUCE_SCATTER_SIMPLE_THRESHOLD=4294967296',
    '-e',
    'CCL_SYCL_ALLGATHERV_SIMPLE_THRESHOLD=4294967296',
    '-e',
    'CCL_SYCL_ALLTOALL_TMP_BUF=1',
    '-e',
    'PYTHONPATH=/opt/k8v4',
    '-e',
    'XE2_KV_LIB=/opt/k8v4/libxe2_kv.so',
    '-e',
    'K8V4_SDPA_LIB=/opt/k8v4/libk8v4_sdpa.so',
    '-e',
    'K8V4_PREFILL=onednn',
    '-e',
    'K8V4_PREFILL_GATHER=triton',
    '-e',
    'K8V4_SDPA_ASYNC=0',
    '-e',
    'K8V4_PREFILL_GEMM=w4a8',
    '-e',
    'VLLM_CACHE_ROOT=/root/.cache/vllm/w4a8-wired-v1',
    '-e',
    'XE2_KV_S2_NSG=32',
    '-e',
    'XE2_KV_S2_NSG_DRAFT=32',
    '-e',
    'XE2_KV_S2_NSG_VERIFY=8',
    '-e',
    'XE2_KV_S2_TWO_PASS=0',
    '-e',
    'B70_MTP_BF16_DRAFT=1',
    '-e',
    'B70_WORKER_AFFINITY=1',
    '-e',
    'HF_HUB_OFFLINE=1',
    '-e',
    'TRANSFORMERS_OFFLINE=1',
    '-e',
    'PYTORCH_ALLOC_CONF=expandable_segments:True',
    '-e',
    'VLLM_TARGET_DEVICE=xpu',
    '-e',
    'VLLM_XPU_ENABLE_XPU_GRAPH=1',
    '-e',
    'ZE_AFFINITY_MASK=0,1',
    '-e',
    'ZE_FLAT_DEVICE_HIERARCHY=COMPOSITE',
    'vllm-openai-xpu:v0.34.0-k8v4-unified',
    '/model',
    '--host=0.0.0.0',
    '--port=8000',
    '--served-model-name=Qwen3.8-27B-GPTQ-Int4-baked-v2-embed-int8',
    '--gpu-memory-utilization=0.95',
    '--dtype=bfloat16',
    '--max-model-len=262144',
    '--kv-cache-dtype=int8_k_int4_v',
    '--tensor-parallel-size=2',
    '--max-num-seqs=4',
    '--max-num-batched-tokens=4224',
    '--enable-auto-tool-choice',
    '--tool-call-parser=qwen3_xml',
    '--reasoning-parser=qwen3',
    '--enable-prefix-caching',
    '--limit-mm-per-prompt={"image":4,"video":0}',
    '--mm-processor-kwargs={"max_pixels":1048576}',
    '--mm-processor-cache-gb=0.125',
    '--trust-remote-code',
    '--speculative-config={"method":"mtp","num_speculative_tokens":6}',
    '--compilation-config={"cudagraph_mode":"FULL_DECODE_ONLY","cudagraph_capture_sizes":[7,14,21,28]}',
]


@unittest.skipUnless(BASH, 'Bash is needed to exercise launch.sh')
class DefaultCommandTest(unittest.TestCase):
    command = LaunchProfileTest.command

    def test_default_commands_are_byte_identical_to_the_034_base(self):
        for tp, want in (('1', DEFAULT_TP1_034), ('2', DEFAULT_TP2_034)):
            with self.subTest(tp=tp):
                env = {} if tp == '2' else {'K8V4_TP': '1'}
                result, args = self.command(**env)
                self.assertEqual(result.returncode, 0, result.stderr)
                got = [a.replace(str(ROOT), '<ROOT>') for a in _no_temp(args)]
                self.assertEqual(got, want)
