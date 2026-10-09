"""CPU quantization and causal GQA reference for the K8/V4 kernels.

The store and the score path use the same rounding as xe2_kv_ops.cpp:
K is symmetric int8 with scale amax/127 and rint; V is affine int4 with
scale max((hi-lo)/15, 1e-8) and round-half-up via floor(x+0.5). Low nibble
is the even dimension. Scores are the int8 dot times the two scales over
sqrt(256).
"""

from __future__ import annotations

import math
import random

from k8v4_v030.layout import D, GQA, PageLayout, builtin_q_end


def _rint(value: float) -> int:
    return int(math.floor(value + 0.5)) if value >= 0 else int(math.ceil(value - 0.5))


def quant_k(row: list[float]) -> tuple[list[int], float]:
    if len(row) != D:
        raise ValueError("K row must be %d" % D)
    amax = 0.0
    for value in row:
        amax = max(amax, abs(value))
    if amax == 0.0:
        return [0] * D, 0.0
    scale = amax / 127.0
    inv = 1.0 / scale
    packed = []
    for value in row:
        q = _rint(value * inv)
        if q < -127:
            q = -127
        elif q > 127:
            q = 127
        packed.append(q)
    return packed, scale


def dequant_k(packed: list[int], scale: float) -> list[float]:
    return [q * scale for q in packed]


def quant_v(row: list[float]) -> tuple[list[int], float, float]:
    if len(row) != D:
        raise ValueError("V row must be %d" % D)
    lo = min(row)
    hi = max(row)
    scale = max((hi - lo) / 15.0, 1.0e-8)
    zero = math.floor(-lo / scale + 0.5)
    if zero < 0:
        zero = 0
    elif zero > 15:
        zero = 15
    nibbles = []
    for value in row:
        q = math.floor(value / scale + zero + 0.5)
        if q < 0:
            q = 0
        elif q > 15:
            q = 15
        nibbles.append(int(q))
    packed = []
    for i in range(0, D, 2):
        packed.append(nibbles[i] | (nibbles[i + 1] << 4))
    return packed, scale, float(zero)


def dequant_v(packed: list[int], scale: float, zero: float) -> list[float]:
    out: list[float] = []
    for byte in packed:
        out.append((float(byte & 0xF) - zero) * scale)
        out.append((float(byte >> 4) - zero) * scale)
    return out


def _dot(a: list[int], b: list[int]) -> int:
    acc = 0
    for x, y in zip(a, b):
        acc += x * y
    return acc


def _softmax(scores: list[float]) -> list[float]:
    finite = [s for s in scores if s != float("-inf")]
    if not finite:
        return [0.0] * len(scores)
    peak = max(finite)
    exps = [0.0 if s == float("-inf") else math.exp(s - peak) for s in scores]
    total = sum(exps)
    if total == 0.0:
        return [0.0] * len(scores)
    inv = 1.0 / total
    return [e * inv for e in exps]


def causal_gqa(
    query: list[list[list[float]]],
    key: list[list[list[float]]],
    value: list[list[list[float]]],
    seq_len: int,
    q_len: int,
) -> list[list[list[float]]]:
    """Quantized causal GQA. query is [q_len, HQ, D] over the last q_len tokens.

    key/value are the full dequant-ready fp lists [seq_len, HKV, D], quantized
    here with the same rule as the store so the reference matches the kernel
    rather than fp16 SDPA.
    """
    if len(query) != q_len:
        raise ValueError("query width")
    if len(key) < seq_len or len(value) < seq_len:
        raise ValueError("cache shorter than seq_len")
    if q_len == 0:
        # origin/main built no output rows for an empty query; keep that.
        return []
    # An empty cache has no head row to read, so the layout then comes from
    # the query heads alone (origin/main used module constants here).
    kv_heads = len(key[0]) if key else len(query[0]) // GQA
    layout = PageLayout.for_heads(len(query[0]), kv_heads)
    hkv, hq = layout.hkv, layout.hq
    kq = []
    vq = []
    for t in range(seq_len):
        k_heads = []
        v_heads = []
        for h in range(hkv):
            k_packed, k_scale = quant_k(key[t][h])
            v_packed, v_scale, v_zero = quant_v(value[t][h])
            k_heads.append((k_packed, k_scale))
            v_heads.append((dequant_v(v_packed, v_scale, v_zero)))
        kq.append(k_heads)
        vq.append(v_heads)

    out: list[list[list[float]]] = []
    inv_sqrt = 1.0 / math.sqrt(D)
    for q_tok in range(q_len):
        end = builtin_q_end(seq_len, q_len, q_tok)
        heads: list[list[float]] = []
        for h in range(hq):
            kv_head = h // GQA
            q_packed, q_scale = quant_k(query[q_tok][h])
            scores = []
            for t in range(seq_len):
                if t >= end:
                    scores.append(float("-inf"))
                    continue
                k_packed, k_scale = kq[t][kv_head]
                scores.append(_dot(q_packed, k_packed) * q_scale * k_scale * inv_sqrt)
            probs = _softmax(scores)
            acc = [0.0] * D
            for t, prob in enumerate(probs):
                if prob == 0.0:
                    continue
                row = vq[t][kv_head]
                for d in range(D):
                    acc[d] += prob * row[d]
            heads.append(acc)
        out.append(heads)
    return out


def deterministic_rows(n: int, heads: int, seed: int) -> list[list[list[float]]]:
    rng = random.Random(seed)
    rows = []
    for _ in range(n):
        heads_out = []
        for _h in range(heads):
            heads_out.append([rng.uniform(-1.0, 1.0) for _d in range(D)])
        rows.append(heads_out)
    return rows
