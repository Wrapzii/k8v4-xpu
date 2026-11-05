"""Interleaved MRoPE as ggml's ``rope_multi`` applies it for Qwen3.8.

``n_rot`` leading dimensions are rotated, NeoX pairing (first half with
second half). Pair ``p`` uses axis ``pair_axis(p)`` and frequency
``pos[axis] * theta ** (-2p / n_rot)``. ``ext_factor == 0`` and
``freq_scale == 1``, so yarn does not mix in. Dimensions at and past
``n_rot`` are copied.
"""

from __future__ import annotations

import math

import torch

from k8v4_v030.qsa_config import N_ROT, ROPE_THETA, SECTIONS


def pair_axis(pair: int, sections: tuple[int, int, int, int] = SECTIONS) -> int:
    """Which MRoPE axis feeds this rotary pair. Matches ``is_imrope``."""
    sect = sum(int(s) for s in sections)
    if sect <= 0:
        raise ValueError("mrope sections are empty")
    sector = int(pair) % sect
    time_n, height_n, width_n, _extra = (int(s) for s in sections)
    if sector % 3 == 1 and sector < 3 * height_n:
        return 1
    if sector % 3 == 2 and sector < 3 * width_n:
        return 2
    if sector % 3 == 0 and sector < 3 * time_n:
        return 0
    return 3


def theta_scale(n_rot: int = N_ROT, theta: float = ROPE_THETA) -> float:
    return float(theta) ** (-2.0 / float(n_rot))


def mrope_row(
    row: list[float],
    pos: tuple[int, int, int, int],
    n_rot: int = N_ROT,
    sections: tuple[int, int, int, int] = SECTIONS,
    theta: float = ROPE_THETA,
) -> list[float]:
    """Rotate one vector. ``pos`` is four MRoPE axes."""
    if len(row) < n_rot:
        raise ValueError("row shorter than n_rot")
    if len(pos) != 4:
        raise ValueError("mrope position needs 4 axes")
    if n_rot < 2 or n_rot % 2 != 0:
        raise ValueError("n_rot must be a positive even count")
    out = list(row)
    half = n_rot // 2
    scale = theta_scale(n_rot, theta)
    for pair in range(half):
        freq = float(pos[pair_axis(pair, sections)]) * (scale ** pair)
        cos_t = math.cos(freq)
        sin_t = math.sin(freq)
        x0 = out[pair]
        x1 = out[half + pair]
        out[pair] = x0 * cos_t - x1 * sin_t
        out[half + pair] = x0 * sin_t + x1 * cos_t
    return out


def normalize_positions(pos: torch.Tensor, n_tokens: int) -> torch.Tensor:
    """Return int64 ``[n_tokens, 4]``.

    A 1-D tensor is a text position broadcast onto every axis. ``[4, T]``
    is the vLLM MRoPE layout. ``[T, 4]`` is already per token.
    """
    if pos.ndim == 1:
        if int(pos.shape[0]) != n_tokens:
            raise ValueError("position length %s is not %s" % (tuple(pos.shape), n_tokens))
        return pos.to(torch.int64).unsqueeze(1).expand(n_tokens, 4).contiguous()
    if pos.ndim != 2:
        raise ValueError("positions rank %d" % pos.ndim)
    if pos.shape[0] == 4 and pos.shape[1] == n_tokens:
        return pos.to(torch.int64).transpose(0, 1).contiguous()
    if pos.shape[0] == n_tokens and pos.shape[1] == 4:
        return pos.to(torch.int64).contiguous()
    raise ValueError("positions shape %s does not match %d tokens" % (tuple(pos.shape), n_tokens))


def mrope(
    values: torch.Tensor,
    pos: torch.Tensor,
    n_rot: int = N_ROT,
    sections: tuple[int, int, int, int] = SECTIONS,
    theta: float = ROPE_THETA,
) -> torch.Tensor:
    """Rotate ``values`` of shape ``[..., dim]``. ``pos`` broadcasts to ``[..., 4]``."""
    if values.shape[-1] < n_rot:
        raise ValueError("width shorter than n_rot")
    pos4 = pos.to(torch.int64)
    if pos4.shape[-1] != 4:
        raise ValueError("mrope pos last dim must be 4")
    if pos4.ndim == values.ndim - 1:
        pos4 = pos4.unsqueeze(-2)
    half = n_rot // 2
    axes = torch.tensor(
        [pair_axis(int(p), sections) for p in range(half)],
        dtype=torch.int64,
        device=values.device,
    )
    # CPU stays on fp64 so the reference tests are exact. Device RoPE is fp32.
    work = torch.float64 if values.device.type == "cpu" else torch.float32
    scale = theta_scale(n_rot, theta)
    freq_scale = torch.tensor([scale ** p for p in range(half)], dtype=work)
    chosen = pos4.to(work)[..., axes]
    freq = chosen * freq_scale.to(chosen.device)
    cos_t = torch.cos(freq)
    sin_t = torch.sin(freq)
    x = values.to(work)
    x0 = x[..., :half]
    x1 = x[..., half:n_rot]
    out = x.clone()
    out[..., :half] = x0 * cos_t - x1 * sin_t
    out[..., half:n_rot] = x0 * sin_t + x1 * cos_t
    return out.to(dtype=values.dtype)
