# QSA indexer training

Device selection is `research/qsa/device.py`.

`resolve_device()` returns:

1. `xpu` when `torch.xpu.is_available()`
2. `cuda` when CUDA is available
3. `cpu` otherwise

`QSA_DEVICE` may be set to `xpu`, `cuda`, or `cpu` to override that order. The named accelerator has to be available. `to_device()` moves a tensor, or every tensor in a mapping, onto that device. `empty_cache()` and `synchronize()` talk to the same device and do nothing on CPU.

`train_indexer.py` and `train_mm.py` load the backbone with `device_map` set to `resolve_device()` and move batches with `to_device()`. Full 27B distillation still refuses CPU, because that run needs an Arc or NVIDIA GPU. It does not require CUDA. Indexers follow the backbone parameter device when `hf_qsa.install` attaches them.

These unit tests do not read `/srv` weights and do not need the 27B checkpoint.

## CPU tests while vLLM holds the Arc GPUs

`vllm-k8v4-tp2` owns the GPUs. Do not pass `--device`, `--gpus`, or `/dev/dri` into the test container.

```bash
research/qsa/run_cpu_tests.sh
```

The script is equivalent to:

```bash
docker run --rm --network none \
  -v "$REPO:/work:ro" \
  -e QSA_DEVICE=cpu \
  -e PYTHONPATH=/work/research \
  -e PYTHONDONTWRITEBYTECODE=1 \
  -e HOME=/tmp \
  --entrypoint python3 \
  vllm-openai-xpu:v0.30.0-k8v4-swift-bake-v2 \
  /work/research/qsa/run_tests.py
```

`QSA_DEVICE=cpu` keeps the suite on CPU. The image's PyTorch is `2.13.0+xpu`; with no Level Zero device visible, `torch.xpu.is_available()` is false and the suite still runs. Output is appended to `/mnt/hdd-500gb/model-validation/qsa-train/logs/xpu-port.log`.

## XPU smoke after the training window

Run this only when `vllm-k8v4-tp2` is stopped and the Arc Pro B60s are free. The script exits if that container is still running. It does not load model weights. It runs the same tests on one GPU (`ZE_AFFINITY_MASK=0`).

```bash
research/qsa/run_xpu_smoke.sh
```
