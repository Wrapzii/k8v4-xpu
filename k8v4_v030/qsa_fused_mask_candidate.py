"""Experimental, default-off exact FP32 prefill scorer; not production qualified."""
import hashlib
import os
import threading
import torch

_pid = os.getpid()
_lock = threading.Lock()
_path = None


def prewarm():
    global _path
    if os.getpid() != _pid:
        raise RuntimeError('fused mask scorer requires a spawned worker')
    path = os.environ.get('K8V4_QSA_FUSED_MASK_LIB', '').strip()
    expected = os.environ.get('K8V4_QSA_FUSED_MASK_SHA256', '').strip().lower()
    if not os.path.isabs(path) or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise RuntimeError('fused mask scorer requires an absolute path and SHA256 pin')
    with _lock:
        if _path is not None:
            if path != _path:
                raise RuntimeError('fused mask scorer library path changed')
            return
        capture = getattr(getattr(torch, 'xpu', None), 'is_current_stream_capturing', None)
        if not callable(capture) or capture():
            raise RuntimeError('fused mask scorer requires prewarm outside graph capture')
        with open(path, 'rb') as source:
            digest = hashlib.file_digest(source, 'sha256').hexdigest()
        if digest != expected:
            raise RuntimeError('fused mask scorer library hash mismatch')
        torch.ops.load_library(path)
        if not hasattr(torch.ops.qsa_fused_score_mask_exp, 'run'):
            raise RuntimeError('fused mask scorer operator missing')
        _path = path


def score(query, pooled, counts, valid):
    """Return masked scores, or None when exact candidate should not dispatch."""
    if os.environ.get('K8V4_QSA_FUSED_MASK', '0') != '1':
        return None
    if (os.environ.get('K8V4_QSA_SCORE_FP16', '0') == '1'
        or os.environ.get('K8V4_QSA_SCORE_INT8_EXPERIMENTAL', '0') == '1'
        or torch.is_grad_enabled()):
        return None
    if (query.device.type != 'xpu' or query.dtype != torch.float32
        or query.ndim != 3 or tuple(query.shape[1:]) != (4, 128)
        or pooled.device != query.device or pooled.dtype != torch.float32
        or pooled.ndim != 2 or pooled.shape[1] != 128
        or counts.device != query.device or counts.dtype != torch.int32
        or counts.ndim != 1 or counts.numel() != query.shape[0]
        or valid.device != query.device or valid.dtype != torch.bool
        or valid.ndim != 1 or valid.numel() != pooled.shape[0]
        or not query.is_contiguous() or not pooled.is_contiguous()
        or not counts.is_contiguous() or not valid.is_contiguous()
        or not query.shape[0] or not pooled.shape[0]):
        return None
    if _path is None or os.environ.get('K8V4_QSA_FUSED_MASK_LIB', '').strip() != _path:
        raise RuntimeError('fused mask scorer must be prewarmed before use')
    rows, _, dim = query.shape
    cols = pooled.shape[0]
    chunk = max(1, min(rows, (256 << 20) // (cols * 4 * 4)))
    result = torch.empty((rows, cols), dtype=torch.float32, device=query.device)
    kt = pooled.transpose(0, 1)
    for start in range(0, rows, chunk):
        end = min(start + chunk, rows)
        part = query[start:end].reshape(-1, dim).matmul(kt).reshape(-1, 4, cols)
        torch.ops.qsa_fused_score_mask_exp.run(part, counts[start:end], valid, result[start:end])
    return result
