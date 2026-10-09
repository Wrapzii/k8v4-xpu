"""Byte-level pack and unpack of one K8/V4 page.

This is the layout the store kernel writes. Tests check it against the
quantization oracle without a GPU. The attention kernel reads the same bytes.
"""

from __future__ import annotations

import struct

from k8v4_v030.layout import (
    D,
    PageLayout,
    element_byte,
    kernel_page_and_offset,
    region_view_specs,
)
from k8v4_v030.oracle import dequant_k, dequant_v, quant_k, quant_v


def _put_i8(blob: bytearray, offset: int, value: int) -> None:
    blob[offset] = value & 0xFF


def _get_i8(blob: bytearray, offset: int) -> int:
    value = blob[offset]
    return value - 256 if value >= 128 else value


def write_token(
    blob: bytearray,
    slot: int,
    keys: list[list[float]],
    values: list[list[float]],
) -> None:
    """Quantize one token into the packed page that owns ``slot``.

    ``keys`` and ``values`` are ``[HKV][D]``. A negative slot is a no-op,
    matching the store kernel.
    """
    page, off = kernel_page_and_offset(slot)
    if page < 0:
        return
    layout = PageLayout(len(keys))
    if len(values) != layout.hkv:
        raise ValueError("expected %d KV heads" % layout.hkv)
    need = (page + 1) * layout.page_bytes
    if len(blob) < need:
        raise ValueError("blob shorter than page %d" % page)
    specs = region_view_specs(page + 1, layout)
    for head in range(layout.hkv):
        packed, scale = quant_k(keys[head])
        base = element_byte(specs["k"], (page, off, head, 0))
        for dim, q in enumerate(packed):
            _put_i8(blob, base + dim, q)
        scale_at = element_byte(specs["k_scale"], (page, off, head))
        blob[scale_at : scale_at + 4] = struct.pack("<f", scale)
        vpack, vscale, vzero = quant_v(values[head])
        vbase = element_byte(specs["v"], (page, off, head, 0))
        for col, byte in enumerate(vpack):
            blob[vbase + col] = byte & 0xFF
        vs_at = element_byte(specs["v_scale"], (page, off, head))
        vz_at = element_byte(specs["v_zero"], (page, off, head))
        blob[vs_at : vs_at + 4] = struct.pack("<f", vscale)
        blob[vz_at : vz_at + 4] = struct.pack("<f", vzero)


def read_token(
    blob: bytearray, slot: int, layout: PageLayout
) -> tuple[list[list[float]], list[list[float]]]:
    """Dequantize one stored token. Inverse of ``write_token`` up to rounding."""
    page, off = kernel_page_and_offset(slot)
    if page < 0:
        raise ValueError("negative slot")
    specs = region_view_specs(page + 1, layout)
    keys: list[list[float]] = []
    values: list[list[float]] = []
    for head in range(layout.hkv):
        base = element_byte(specs["k"], (page, off, head, 0))
        packed = [_get_i8(blob, base + dim) for dim in range(D)]
        scale_at = element_byte(specs["k_scale"], (page, off, head))
        (scale,) = struct.unpack("<f", blob[scale_at : scale_at + 4])
        keys.append(dequant_k(packed, scale))
        vbase = element_byte(specs["v"], (page, off, head, 0))
        vpack = [blob[vbase + col] for col in range(D // 2)]
        vs_at = element_byte(specs["v_scale"], (page, off, head))
        vz_at = element_byte(specs["v_zero"], (page, off, head))
        (vscale,) = struct.unpack("<f", blob[vs_at : vs_at + 4])
        (vzero,) = struct.unpack("<f", blob[vz_at : vz_at + 4])
        values.append(dequant_v(vpack, vscale, vzero))
    return keys, values
