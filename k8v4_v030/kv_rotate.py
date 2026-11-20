"""Opt-in Hadamard rotation of the K8/V4 cache contents (``K8V4_KV_ROTATE``).

The K8/V4 store quantizes each (token, KV head) 256-vector with ONE scale: K symmetric int8
(amax / 127), V asymmetric int4 (range / 15, integer zero). A few large channels set that scale
for the whole vector. Multiplying by an orthonormal 256-point Hadamard matrix H spreads every
channel over all 256, so the stored vector has a smaller peak for the same energy, and
attention does not change in exact arithmetic:

* ``k``: K is stored as K H and the query is multiplied by H before attention
  (Q H (K H)^T = Q K^T).
* ``v``: V is stored as V H and the attention output is multiplied by H afterwards
  (P (V H) H = P V, since H H = I for the symmetric normalized Sylvester matrix).

The rotations are fp32 matmuls on [rows, 256] (no kernel, layout or capacity change). The
rotated K / V are what the cache holds, so a server must not change the knob while it runs
(prefix-cache blocks would mix bases); a restart starts with an empty cache.

Unset (the default) leaves every tensor untouched. Values: ``k``, ``v``, ``kv``; anything else
is an error.
"""
from __future__ import annotations

import math
import os

import torch

ENV = "K8V4_KV_ROTATE"
D = 256
_H: dict[tuple[str, int | None], torch.Tensor] = {}


def parse(raw: str | None) -> tuple[bool, bool]:
    """(rotate K, rotate V). Unset or empty is (False, False)."""
    value = "" if raw is None else raw.strip()
    if value == "":
        return False, False
    if value not in ("k", "v", "kv"):
        raise RuntimeError("%s must be k, v or kv, got %r" % (ENV, raw))
    return "k" in value, "v" in value


def from_env() -> tuple[bool, bool]:
    return parse(os.environ.get(ENV))


def hadamard(n: int = D, device: torch.device | str | None = None) -> torch.Tensor:
    """Normalized Sylvester Hadamard matrix (symmetric, orthonormal), fp32."""
    if n < 1 or n & (n - 1):
        raise ValueError("Hadamard size must be a power of two, got %d" % n)
    dev = torch.device(device) if device is not None else torch.device("cpu")
    key = (dev.type, dev.index)
    h = _H.get(key)
    if h is None or h.shape[0] != n:
        m = torch.ones(1, 1, dtype=torch.float32)
        while m.shape[0] < n:
            m = torch.cat([torch.cat([m, m], 1), torch.cat([m, -m], 1)], 0)
        h = (m / math.sqrt(n)).to(dev)
        _H[key] = h
    return h


def rotate(x: torch.Tensor, dtype: torch.dtype | None = None) -> torch.Tensor:
    """x [..., k * 256] -> every 256-wide head slice times H, in fp32, cast to ``dtype`` (default x's)."""
    if x.shape[-1] % D:
        raise RuntimeError("rotate needs a last dim that is a multiple of %d, got %d" % (D, x.shape[-1]))
    h = hadamard(D, x.device)
    y = torch.matmul(x.reshape(-1, D).to(torch.float32), h)
    return y.to(dtype or x.dtype).reshape(x.shape)


_NOTED = False


def note_once(rot_k: bool, rot_v: bool) -> None:
    """One stderr line per process (the backend module logger is not a vllm.* logger, so vLLM drops it)."""
    global _NOTED
    if _NOTED:
        return
    _NOTED = True
    import sys

    sys.stderr.write("k8v4_kv_rotate: Hadamard-rotated cache, K %s, V %s (%s)\n" % (rot_k, rot_v, ENV))
