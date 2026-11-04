"""Opt-in stage timer for one K8/V4 prefill.

K8V4_PROFILE=1 records XPU ranges around the model forward and the
collectives linear.py already bound. The default is off: no events, no
sync, and the oneDNN prefill math is unchanged. Decode graph capture
never records ranges. Two TP ranks write separate JSON files; wall time
is the slower rank, not the sum.

torch.xpu is on Dynamo's module skiplist. Wrappers that Dynamo traces
must not call is_current_stream_capturing. A compiling frame skips the
probe and the ranges. The measured request (nonce file present) also
aggregates XPU profiler kernels, because compiled linears do not enter
Module.__call__.
"""

from __future__ import annotations

import importlib.abc
import importlib.machinery
import json
import os
import sys
import threading
import time
from collections import defaultdict
from contextlib import contextmanager

from k8v4_v030.layout import DECODE_MAX_T

COLLECTIVE_NAMES = (
    "tensor_model_parallel_all_reduce",
    "tensor_model_parallel_all_gather",
    "tensor_model_parallel_reduce_scatter",
    "tensor_model_parallel_gather",
)
_COMM_TARGETS = (
    "vllm.distributed.communication_op",
    "vllm.distributed",
)
_EXPLICIT = ("attn_gather", "attn_sdpa", "kv_store", "collective")
_ROOT_CLASSES = {
    "Qwen3_5Model",
    "Qwen3NextModel",
    "Qwen3_5ForCausalLM",
    "Qwen3_5ForCausalLMBase",
    "Qwen3_5ForConditionalGeneration",
    "Qwen3NextForCausalLM",
    "LogitsProcessor",
}
_LEAF_BUCKET = {
    "qkv_proj": "gemm_qkv",
    "q_proj": "gemm_qkv",
    "k_proj": "gemm_qkv",
    "v_proj": "gemm_qkv",
    "o_proj": "gemm_o",
    "gate_up_proj": "gemm_gate_up",
    "gate_proj": "gemm_gate_up",
    "up_proj": "gemm_gate_up",
    "down_proj": "gemm_down",
}
_GROUP_OF = {
    "attn_gather": "attention",
    "attn_sdpa": "attention",
    "attn_other": "attention",
    "kv_store": "attention",
    "gemm_qkv": "gemm_qkv",
    "gemm_o": "gemm_o",
    "gemm_gate_up": "gemm_gate_up",
    "gemm_down": "gemm_down",
    "gemm_gdn": "gemm_gdn",
    "gemm_other": "gemm_other",
    "gdn": "gdn",
    "gdn_conv": "gdn",
    "collective": "collective",
    "norm": "norm",
    "activation": "activation",
    "embed_logits": "embed_logits",
    "layer_glue": "layer_glue",
    "other": "other",
}

_ORIG_CALL = None
_FINDER = None
_CAPTURE_OVERRIDE = None
_INTERESTING: dict[str, bool] = {}
_QUALNAMES: dict[int, str] = {}
_LOCK = threading.Lock()
_ERRORS: list[str] = []
_IGNORED: list[str] = []
_PHASES: dict[str, dict] = {}
_NONCE = None
_SKIPPED_SHORT = 0


class _Tls(threading.local):
    ready = False


_TLS = _Tls()


def profile_enabled() -> bool:
    return os.environ.get("K8V4_PROFILE") == "1"


def register_root(class_name: str) -> None:
    _ROOT_CLASSES.add(class_name)


def bucket_for(kind: str, qualname: str, cls_name: str) -> str:
    """Map one finished range onto a stage. Explicit kinds win."""
    if kind in _EXPLICIT:
        return kind
    qualname = qualname or ""
    cls_name = cls_name or ""
    leaf = qualname.split(".")[-1] if qualname else ""
    low_cls = cls_name.lower().replace("_", "")
    under_gdn = ".linear_attn" in qualname or "gateddelta" in low_cls or "chunkgated" in low_cls
    if "chunkgated" in low_cls or low_cls in {
        "gateddeltanetattention",
        "qwengateddeltanetattention",
    }:
        return "gdn"
    if under_gdn and (
        "linear" in low_cls
        or leaf in {"conv1d", "in_proj_qkvz", "in_proj_ba", "out_proj"}
        or leaf.endswith("_proj")
    ):
        return "gemm_gdn"
    if under_gdn and "norm" in low_cls:
        return "norm"
    if under_gdn and "conv" in low_cls:
        return "gdn_conv"
    if under_gdn:
        return "gdn"
    if leaf in _LEAF_BUCKET:
        return _LEAF_BUCKET[leaf]
    if "norm" in low_cls:
        return "norm"
    if "silu" in low_cls or "gelu" in low_cls:
        return "activation"
    if (
        "embed" in low_cls
        or "lmhead" in low_cls
        or "logits" in low_cls
        or leaf in {"embed_tokens", "lm_head", "logits_processor"}
    ):
        return "embed_logits"
    if "linear" in low_cls:
        return "gemm_other"
    if "attention" in low_cls:
        return "attn_other"
    if low_cls.endswith("decoderlayer") or low_cls.endswith("model") or "mlp" in low_cls:
        return "layer_glue"
    return "other"


def exclusive_report(records: list[dict]) -> dict:
    """Exclusive time of each range. The exclusive values sum to the roots."""
    children: dict[int, list[int]] = defaultdict(list)
    roots: list[int] = []
    for index, record in enumerate(records):
        parent = record.get("parent")
        if parent is None:
            roots.append(index)
        else:
            children[int(parent)].append(index)
    inclusive = [float(record.get("inclusive_ms") or 0.0) for record in records]
    exclusive = []
    for index, inc in enumerate(inclusive):
        exclusive.append(inc - sum(inclusive[child] for child in children.get(index, ())))
    buckets: dict[str, float] = defaultdict(float)
    labels: dict[str, float] = defaultdict(float)
    for index, record in enumerate(records):
        bucket = bucket_for(
            str(record.get("kind") or "module"),
            str(record.get("qualname") or ""),
            str(record.get("cls") or ""),
        )
        buckets[bucket] += exclusive[index]
        label = "%s %s" % (record.get("cls") or "", (record.get("qualname") or "").split(".")[-1])
        labels[label] += exclusive[index]
    root_ms = sum(inclusive[index] for index in roots)
    balance = root_ms - sum(exclusive)
    groups: dict[str, float] = defaultdict(float)
    for bucket, ms in buckets.items():
        groups[_GROUP_OF.get(bucket, "other")] += ms
    return {
        "buckets_ms": {key: buckets[key] for key in sorted(buckets)},
        "groups_ms": {key: groups[key] for key in sorted(groups)},
        "balance_ms": balance,
        "root_inclusive_ms": root_ms,
        "labels_ms": labels,
    }


def install() -> None:
    """Patch collective import and Module.__call__. No-op unless profiling."""
    if not profile_enabled():
        return
    install_import_hook()
    import torch

    install_module_hook(torch)
    sys.stderr.write("k8v4_profile install pid=%s\n" % os.getpid())
    sys.stderr.flush()
    _write_json()


def install_import_hook(targets: tuple[str, ...] | None = None):
    """Wrap collective functions while their module is first executed."""
    global _FINDER
    if _FINDER is not None and targets is None:
        return _FINDER
    finder = _CommFinder(targets or _COMM_TARGETS)
    sys.meta_path.insert(0, finder)
    if targets is None:
        _FINDER = finder
    return finder


def install_module_hook(torch_module=None) -> None:
    global _ORIG_CALL
    import torch

    module_cls = torch.nn.Module
    current = module_cls.__call__
    if getattr(current, "_k8v4_profile", False):
        return
    _ORIG_CALL = current

    def _call(self, *args, **kwargs):
        return _module_call(self, args, kwargs)

    _call._k8v4_profile = True
    module_cls.__call__ = _call
    del torch_module


def uninstall_module_hook() -> None:
    global _ORIG_CALL
    if _ORIG_CALL is None:
        return
    import torch

    torch.nn.Module.__call__ = _ORIG_CALL
    _ORIG_CALL = None


def remove_import_hook(finder) -> None:
    try:
        sys.meta_path.remove(finder)
    except ValueError:
        return


def wrap_communication_module(module) -> None:
    for name in COLLECTIVE_NAMES:
        fn = getattr(module, name, None)
        if fn is None or not callable(fn) or getattr(fn, "_k8v4_wrapped", False):
            continue
        setattr(module, name, _collective_wrapper(fn, name))


def snapshot() -> dict:
    with _LOCK:
        return _public_state()


def reset_for_test() -> None:
    """Drop accumulated ranges. Tests call this; the server uses the nonce."""
    global _NONCE, _SKIPPED_SHORT
    with _LOCK:
        _PHASES.clear()
        _ERRORS.clear()
        _IGNORED.clear()
        _NONCE = None
        _SKIPPED_SHORT = 0


def set_capture_override(value: bool | None) -> None:
    global _CAPTURE_OVERRIDE
    _CAPTURE_OVERRIDE = value


@contextmanager
def profile_range(kind: str, name: str | None = None):
    """Record ``kind`` when a profiled forward is on the stack. Otherwise a no-op."""
    tls = _tls()
    if _dynamo_compiling() or tls.depth <= 0 or tls.abort or _capturing():
        yield
        return
    index = _begin(tls, kind, name or kind, name or kind)
    try:
        yield
    finally:
        _end(tls, index)


class _CommFinder(importlib.abc.MetaPathFinder):
    def __init__(self, targets: tuple[str, ...]):
        self.targets = tuple(targets)
        self._busy = False

    def find_spec(self, fullname, path, target=None):
        if self._busy or fullname not in self.targets:
            return None
        self._busy = True
        removed = False
        try:
            try:
                sys.meta_path.remove(self)
                removed = True
            except ValueError:
                removed = False
            try:
                spec = importlib.machinery.PathFinder.find_spec(fullname, path)
            finally:
                if removed:
                    sys.meta_path.insert(0, self)
        finally:
            self._busy = False
        if spec is None or spec.loader is None:
            return None
        if getattr(spec.loader, "_k8v4_loader", False):
            return spec
        spec.loader = _CommLoader(spec.loader)
        return spec


class _CommLoader(importlib.abc.Loader):
    _k8v4_loader = True

    def __init__(self, inner):
        self._inner = inner

    def create_module(self, spec):
        create = getattr(self._inner, "create_module", None)
        if create is None:
            return None
        return create(spec)

    def exec_module(self, module):
        self._inner.exec_module(module)
        wrap_communication_module(module)


def _collective_wrapper(fn, name: str):
    def wrapped(*args, **kwargs):
        tls = _tls()
        # Dynamo traces this wrapper during startup. The XPU capture probe
        # is on the module skiplist, so a compiling frame only calls fn.
        if _dynamo_compiling() or tls.depth <= 0 or tls.abort or _capturing():
            return fn(*args, **kwargs)
        index = _begin(tls, "collective", name, name)
        try:
            return fn(*args, **kwargs)
        finally:
            _end(tls, index)

    wrapped._k8v4_wrapped = True
    wrapped._k8v4_inner = fn
    return wrapped


def _tls() -> _Tls:
    tls = _TLS
    if not tls.ready:
        tls.ready = True
        tls.depth = 0
        tls.stack = []
        tls.nodes = []
        tls.use_events = False
        tls.abort = False
        tls.cpu0 = 0.0
    return tls


def _dynamo_compiling() -> bool:
    """True inside a Dynamo frame. Constant-folds, so the XPU probe stays out."""
    try:
        import torch

        fn = getattr(getattr(torch, "compiler", None), "is_compiling", None)
        if fn is None:
            return False
        return bool(fn())
    except Exception:
        return False


def _xpu_stream_capturing() -> bool:
    """Host-side XPU graph capture check. Never call this from a Dynamo frame."""
    try:
        import torch

        fn = getattr(getattr(torch, "xpu", None), "is_current_stream_capturing", None)
        if fn is None:
            return False
        return bool(fn())
    except Exception:
        return False


def _capturing() -> bool:
    if _CAPTURE_OVERRIDE is not None:
        return bool(_CAPTURE_OVERRIDE)
    if _dynamo_compiling():
        return True
    return _xpu_stream_capturing()


def bucket_kernel(name: str) -> str:
    """Classify one profiler op. Generic aten pointwise stays ``other``."""
    low = (name or "").lower().replace(" ", "")
    if any(
        token in low
        for token in (
            "allreduce",
            "all_reduce",
            "allgather",
            "all_gather",
            "alltoall",
            "reduce_scatter",
            "reducescatter",
            "oneccl",
            "xccl",
        )
    ):
        return "collective"
    if any(
        token in low
        for token in (
            "gated_delta",
            "gateddelta",
            "chunk_gated",
            "chunkgated",
            "chunk_scan",
        )
    ):
        return "gdn"
    if any(token in low for token in ("sdpa", "k8v4_sdpa", "flash_attn", "scaled_dot")):
        return "attention"
    if any(
        token in low
        for token in (
            "int4_gemm",
            "int8_gemm",
            "w4a16",
            "w4a8",
            "w8a8",
            "_gemm",
            "matmul",
        )
    ):
        return "gemm"
    if any(token in low for token in ("dequant", "quantiz", "pack_int", "unpack")):
        return "quant"
    if "rmsnorm" in low or "rms_norm" in low or "layer_norm" in low:
        return "norm"
    if any(token in low for token in ("silu", "gelu", "swiglu")):
        return "activation"
    return "other"


def kernel_report(rows: list[tuple[str, float, int]]) -> dict:
    """Sum device milliseconds. ``rows`` are ``(name, device_ms, count)``."""
    groups: dict[str, float] = defaultdict(float)
    counts: dict[str, int] = defaultdict(int)
    for name, device_ms, count in rows:
        bucket = bucket_kernel(name)
        groups[bucket] += float(device_ms)
        counts[bucket] += int(count)
    return {
        "groups_ms": {key: groups[key] for key in sorted(groups)},
        "counts": {key: counts[key] for key in sorted(counts)},
    }


def _interesting(class_name: str) -> bool:
    cached = _INTERESTING.get(class_name)
    if cached is not None:
        return cached
    low = class_name.lower().replace("_", "")
    mark = (
        "linear" in low
        or "norm" in low
        or "attention" in low
        or "gateddelta" in low
        or "chunkgated" in low
        or "embed" in low
        or "lmhead" in low
        or "logits" in low
        or "silu" in low
        or "gelu" in low
        or low.endswith("decoderlayer")
        or low.endswith("mlp")
        or ("conv" in low and "linear" not in low)
    )
    _INTERESTING[class_name] = mark
    return mark


def _module_call(self, args, kwargs):
    tls = _tls()
    if _ORIG_CALL is None:
        raise RuntimeError("K8/V4 profile hook is not installed")
    if tls.depth <= 0:
        if _dynamo_compiling() or _capturing():
            return _ORIG_CALL(self, *args, **kwargs)
        class_name = type(self).__name__
        if class_name not in _ROOT_CLASSES:
            _note_ignored(class_name)
            return _ORIG_CALL(self, *args, **kwargs)
        return _root_call(self, args, kwargs, class_name)
    if not _interesting(type(self).__name__):
        return _ORIG_CALL(self, *args, **kwargs)
    qualname = _QUALNAMES.get(id(self), type(self).__name__)
    index = _begin(tls, "module", qualname, type(self).__name__)
    try:
        return _ORIG_CALL(self, *args, **kwargs)
    finally:
        _end(tls, index)


def _root_call(self, args, kwargs, class_name: str):
    tls = _tls()
    ntok = _first_tensor_len(args, kwargs)
    phase = "logits" if "Logits" in class_name else "model"
    if phase == "model" and ntok is not None and ntok <= DECODE_MAX_T:
        global _SKIPPED_SHORT
        with _LOCK:
            _SKIPPED_SHORT += 1
        return _ORIG_CALL(self, *args, **kwargs)
    _maybe_reset()
    _bind_names(self)
    tls.depth = 1
    tls.nodes = []
    tls.stack = []
    tls.abort = False
    tls.use_events = _wants_events(args, kwargs)
    tls.cpu0 = time.perf_counter()
    # Boot compiles and captures graphs before the client writes the nonce.
    # The kernel profiler stays off until that measured request.
    kernel_prof = _try_start_kernels() if _NONCE and tls.use_events else None
    index = _begin(tls, "module", class_name, class_name)
    try:
        return _ORIG_CALL(self, *args, **kwargs)
    finally:
        _end(tls, index)
        if tls.use_events:
            _sync_device()
        kernel_rows = _finish_kernels(kernel_prof)
        cpu_ms = (time.perf_counter() - tls.cpu0) * 1000.0
        records = _records_from(tls)
        tls.depth = 0
        tls.nodes = []
        tls.stack = []
        _store_forward(phase, ntok, cpu_ms, records, kernel_rows)
        _write_json()


def _bind_names(root) -> None:
    global _QUALNAMES
    mapping = {id(root): type(root).__name__}
    for name, module in root.named_modules():
        mapping[id(module)] = name or type(module).__name__
    _QUALNAMES = mapping


def _first_tensor_len(args, kwargs) -> int | None:
    import torch

    values = list(args)
    for key in ("input_ids", "inputs_embeds", "hidden_states", "positions"):
        if key in kwargs:
            values.append(kwargs[key])
    for value in values:
        if value is None or not torch.is_tensor(value) or value.ndim < 1:
            continue
        return int(value.shape[0])
    return None


def _wants_events(args, kwargs) -> bool:
    import torch

    if not hasattr(torch, "xpu"):
        return False
    values = list(args) + [
        kwargs[key]
        for key in ("input_ids", "inputs_embeds", "hidden_states")
        if key in kwargs
    ]
    for value in values:
        if torch.is_tensor(value) and value.device.type == "xpu":
            return True
    return False


def _begin(tls, kind: str, qualname: str, cls_name: str) -> int:
    parent = tls.stack[-1] if tls.stack else None
    node = {
        "parent": parent,
        "kind": kind,
        "qualname": qualname,
        "cls": cls_name,
        "t0": None,
        "t1": None,
        "start_event": None,
        "end_event": None,
    }
    if tls.use_events:
        try:
            import torch

            start = torch.xpu.Event(enable_timing=True)
            start.record()
            node["start_event"] = start
        except Exception as exc:
            tls.use_events = False
            _remember_error("event_begin %s" % exc)
            node["t0"] = time.perf_counter()
    else:
        node["t0"] = time.perf_counter()
    tls.nodes.append(node)
    index = len(tls.nodes) - 1
    tls.stack.append(index)
    return index


def _end(tls, index: int) -> None:
    if not tls.stack or tls.stack[-1] != index:
        _remember_error("profile stack mismatch")
        tls.abort = True
        return
    tls.stack.pop()
    node = tls.nodes[index]
    if node["start_event"] is not None:
        try:
            import torch

            end = torch.xpu.Event(enable_timing=True)
            end.record()
            node["end_event"] = end
        except Exception as exc:
            _remember_error("event_end %s" % exc)
            node["t1"] = time.perf_counter()
    else:
        node["t1"] = time.perf_counter()


def _records_from(tls) -> list[dict]:
    records = []
    for node in tls.nodes:
        records.append(
            {
                "parent": node["parent"],
                "kind": node["kind"],
                "qualname": node["qualname"],
                "cls": node["cls"],
                "inclusive_ms": _inclusive_ms(node),
            }
        )
    return records


def _inclusive_ms(node: dict) -> float:
    start = node.get("start_event")
    end = node.get("end_event")
    if start is not None and end is not None:
        try:
            return float(start.elapsed_time(end))
        except Exception as exc:
            _remember_error("elapsed %s" % exc)
            return 0.0
    t0 = node.get("t0")
    t1 = node.get("t1")
    if t0 is None or t1 is None:
        return 0.0
    return (float(t1) - float(t0)) * 1000.0


def _sync_device() -> None:
    try:
        import torch

        torch.xpu.synchronize()
    except Exception as exc:
        _remember_error("sync %s" % exc)


def _event_us(evt, names: tuple[str, ...]) -> tuple[float, str]:
    for name in names:
        value = getattr(evt, name, None)
        if isinstance(value, (int, float)) and value:
            return float(value), name
    return 0.0, ""


def _try_start_kernels():
    """XPU profiler for one measured forward. Failure leaves the forward timed."""
    try:
        import torch

        activities = [torch.profiler.ProfilerActivity.CPU]
        xpu_act = getattr(torch.profiler.ProfilerActivity, "XPU", None)
        if xpu_act is not None:
            activities.append(xpu_act)
        attempts = (
            {"with_modules": True},
            {},
        )
        last_error = None
        for extra in attempts:
            try:
                profiler = torch.profiler.profile(
                    activities=activities,
                    record_shapes=False,
                    profile_memory=False,
                    with_stack=False,
                    **extra,
                )
                profiler.start()
                return profiler
            except Exception as exc:
                last_error = exc
        _remember_error("kernel_profile_start %s" % last_error)
        return None
    except Exception as exc:
        _remember_error("kernel_profile_start %s" % exc)
        return None


def _finish_kernels(profiler) -> list[tuple[str, float, float, int]]:
    """Return ``(name, device_us, cpu_us, count)`` rows. Times stay in microseconds."""
    if profiler is None:
        return []
    try:
        profiler.stop()
        rows = []
        for evt in profiler.key_averages():
            device_us, _device_attr = _event_us(
                evt,
                (
                    "self_device_time_total",
                    "self_xpu_time_total",
                    "device_time_total",
                    "xpu_time_total",
                ),
            )
            cpu_us, _cpu_attr = _event_us(evt, ("self_cpu_time_total", "cpu_time_total"))
            count = int(getattr(evt, "count", 0) or 0)
            name = str(getattr(evt, "key", "") or "")
            if device_us <= 0.0 and cpu_us < 200.0:
                continue
            rows.append((name, device_us, cpu_us, count))
        return rows
    except Exception as exc:
        _remember_error("kernel_profile_stop %s" % exc)
        return []


def _empty_phase() -> dict:
    return {
        "forwards": 0,
        "token_counts": [],
        "gpu_inclusive_ms": 0.0,
        "cpu_wall_ms": 0.0,
        "buckets_ms": defaultdict(float),
        "groups_ms": defaultdict(float),
        "labels_ms": defaultdict(float),
        "per_forward": [],
        "balance_ms": 0.0,
        "kernel_groups_us": defaultdict(float),
        "kernel_counts": defaultdict(int),
        "kernel_top": {},
    }


def _store_forward(
    phase: str,
    ntok: int | None,
    cpu_ms: float,
    records: list[dict],
    kernel_rows: list[tuple[str, float, float, int]] | None = None,
) -> None:
    report = exclusive_report(records)
    with _LOCK:
        slot = _PHASES.get(phase)
        if slot is None:
            slot = _empty_phase()
            _PHASES[phase] = slot
        slot["forwards"] += 1
        slot["token_counts"].append(ntok)
        slot["gpu_inclusive_ms"] += report["root_inclusive_ms"]
        slot["cpu_wall_ms"] += cpu_ms
        slot["balance_ms"] += report["balance_ms"]
        for key, value in report["buckets_ms"].items():
            slot["buckets_ms"][key] += value
        for key, value in report["groups_ms"].items():
            slot["groups_ms"][key] += value
        for key, value in report["labels_ms"].items():
            slot["labels_ms"][key] += value
        _merge_kernel_rows(slot, kernel_rows or [])
        if len(slot["per_forward"]) < 64:
            slot["per_forward"].append(
                {
                    "tokens": ntok,
                    "inclusive_ms": report["root_inclusive_ms"],
                    "cpu_ms": cpu_ms,
                    "groups_ms": report["groups_ms"],
                }
            )


def _merge_kernel_rows(slot: dict, rows: list[tuple[str, float, float, int]]) -> None:
    groups = slot["kernel_groups_us"]
    counts = slot["kernel_counts"]
    tops = slot["kernel_top"]
    for name, device_us, cpu_us, count in rows:
        bucket = bucket_kernel(name)
        groups[bucket] += float(device_us)
        counts[bucket] += int(count)
        prev = tops.get(name)
        if prev is None:
            tops[name] = [float(device_us), float(cpu_us), int(count)]
        else:
            prev[0] += float(device_us)
            prev[1] += float(cpu_us)
            prev[2] += int(count)


def _maybe_reset() -> None:
    global _NONCE, _SKIPPED_SHORT
    nonce = _read_nonce()
    with _LOCK:
        if nonce == _NONCE:
            return
        _PHASES.clear()
        _IGNORED.clear()
        _ERRORS.clear()
        _SKIPPED_SHORT = 0
        _NONCE = nonce


def _read_nonce() -> str:
    directory = os.environ.get("K8V4_PROFILE_DIR", "").strip()
    if not directory:
        return ""
    path = os.path.join(directory, "nonce")
    try:
        with open(path, "r", encoding="utf-8") as handle:
            return handle.read().strip()
    except OSError:
        return ""


def _note_ignored(class_name: str) -> None:
    with _LOCK:
        if class_name in _IGNORED or len(_IGNORED) >= 48:
            return
        _IGNORED.append(class_name)
    _write_json()


def _remember_error(text: str) -> None:
    with _LOCK:
        if len(_ERRORS) < 20:
            _ERRORS.append(text)


def _top_kernels(tops: dict) -> list[list]:
    ordered = sorted(tops.items(), key=lambda item: item[1][0], reverse=True)[:40]
    return [
        [name, float(values[0]), float(values[1]), int(values[2])]
        for name, values in ordered
    ]


def _plain_phase(slot: dict) -> dict:
    labels = sorted(slot["labels_ms"].items(), key=lambda item: item[1], reverse=True)[:40]
    gpu = float(slot["gpu_inclusive_ms"])
    cpu = float(slot["cpu_wall_ms"])
    return {
        "forwards": slot["forwards"],
        "token_counts": list(slot["token_counts"]),
        "gpu_inclusive_ms": gpu,
        "cpu_wall_ms": cpu,
        "host_inside_ms": cpu - gpu,
        "buckets_ms": {key: float(value) for key, value in sorted(slot["buckets_ms"].items())},
        "groups_ms": {key: float(value) for key, value in sorted(slot["groups_ms"].items())},
        "balance_ms": float(slot["balance_ms"]),
        "per_forward": slot["per_forward"],
        "top_labels_ms": [[name, float(value)] for name, value in labels],
        "kernel_groups_us": {
            key: float(value) for key, value in sorted(slot["kernel_groups_us"].items())
        },
        "kernel_counts": {
            key: int(value) for key, value in sorted(slot["kernel_counts"].items())
        },
        "kernel_top": _top_kernels(slot["kernel_top"]),
    }


def _public_state() -> dict:
    phases = {name: _plain_phase(slot) for name, slot in _PHASES.items()}
    rank_env = {
        key: os.environ.get(key, "")
        for key in ("RANK", "LOCAL_RANK", "VLLM_DP_RANK")
    }
    return {
        "pid": os.getpid(),
        "rank_env": rank_env,
        "nonce": _NONCE or "",
        "skipped_short": _SKIPPED_SHORT,
        "ignored_top": list(_IGNORED),
        "errors": list(_ERRORS),
        "phases": phases,
    }


def _write_json() -> None:
    directory = os.environ.get("K8V4_PROFILE_DIR", "").strip()
    if not directory:
        return
    try:
        os.makedirs(directory, exist_ok=True)
        path = os.path.join(directory, "profile_%s.json" % os.getpid())
        tmp = path + ".tmp"
        with _LOCK:
            payload = _public_state()
        with open(tmp, "w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2, sort_keys=True)
        os.replace(tmp, path)
    except OSError as exc:
        _remember_error("write %s" % exc)
