"""K8/V4 page geometry for 2 or 4 local KV heads.

One kernel page is 64 tokens and holds K, packed V, and the three fp32
affine tensors together. vLLM copies a whole manager block; that copy stays
correct only when every kernel page inside the block is self-contained.

The head layout is per deployment, not a module constant: a TP2 rank holds
2 KV / 12 Q heads, a single GPU holding the whole model holds 4 / 24.
Byte-level code carries an explicit :class:`PageLayout`; nothing here reads
the environment.
"""
from __future__ import annotations

import dataclasses

PAGE = 64
GQA = 6  # Qwen3.8-27B: 6 query heads share one KV head (baked into the kernel)
D = 256
V4_COLS = D // 2
SCALE_BYTES = 4
# int8 K + packed int4 V + k scale + v scale + v zero, one head, one token.
SLOT_BYTES_PER_HEAD = D + V4_COLS + 3 * SCALE_BYTES
DECODE_MAX_T = PAGE // GQA  # 10; MTP6 uses 7

CACHE_DTYPE = "int8_k_int4_v"
HISTORIC_MTP_LEN = 59500


@dataclasses.dataclass(frozen=True)
class PageLayout:
    """Frozen per-worker head layout and the page geometry it implies.

    ``hkv`` is the per-GPU KV head count: 2 on a TP2 rank, 4 when one GPU
    holds the whole model. Build it with :meth:`for_heads` so a mismatched
    (num_heads, num_kv_heads) pair fails loudly instead of half-working.
    """

    hkv: int

    def __post_init__(self) -> None:
        if self.hkv not in (2, 4):
            raise ValueError(
                "unsupported per-GPU KV head count %r (K8/V4 serves 2 or 4)" % (self.hkv,)
            )

    @classmethod
    def for_heads(cls, num_heads: int, num_kv_heads: int) -> "PageLayout":
        """Layout for one rank's local heads. The pair must agree on GQA=6."""
        num_heads = int(num_heads)
        num_kv_heads = int(num_kv_heads)
        if num_kv_heads not in (2, 4) or num_heads != GQA * num_kv_heads:
            raise ValueError(
                "K8/V4 serves 12/2 (TP2) or 24/4 (single GPU) local heads, got %d Q / %d KV"
                % (num_heads, num_kv_heads)
            )
        return cls(num_kv_heads)

    @property
    def gqa(self) -> int:
        return GQA

    @property
    def hq(self) -> int:
        return GQA * self.hkv

    @property
    def k_bytes_per_page(self) -> int:
        return PAGE * self.hkv * D

    @property
    def v_bytes_per_page(self) -> int:
        return PAGE * self.hkv * V4_COLS

    @property
    def scale_bytes_per_page(self) -> int:
        return PAGE * self.hkv * SCALE_BYTES

    @property
    def page_bytes(self) -> int:
        return self.k_bytes_per_page + self.v_bytes_per_page + 3 * self.scale_bytes_per_page

    @property
    def bytes_per_token(self) -> int:
        return self.page_bytes // PAGE

    @property
    def fp8_bytes_per_token(self) -> int:
        """fp8 K and V for the same local heads: 2 * D bytes per head."""
        return self.hkv * 2 * D


def pages_per_block(block_size: int) -> int:
    block_size = int(block_size)
    if block_size < PAGE or block_size % PAGE != 0:
        raise ValueError("block_size must be a positive multiple of %d" % PAGE)
    return block_size // PAGE


def kernel_page_and_offset(slot: int) -> tuple[int, int]:
    """Store addressing. Negative slots are skipped and never index a page."""
    slot = int(slot)
    if slot < 0:
        return -1, -1
    return slot // PAGE, slot % PAGE


def n_valid(seq_len: int, logical_page: int) -> int:
    """Tokens of this 64-token page that belong to seq_len. The tail is masked."""
    return max(0, min(PAGE, int(seq_len) - int(logical_page) * PAGE))


def expand_block_ids(block_ids: list[int], ratio: int) -> list[int]:
    """vLLM block id -> kernel pages. Matches slot // 64 inside that block."""
    ratio = int(ratio)
    if ratio < 1:
        raise ValueError("pages_per_block must be >= 1")
    out: list[int] = []
    for block_id in block_ids:
        base = int(block_id) * ratio
        out.extend(base + sub for sub in range(ratio))
    return out


def visible_lens(seq_len: int, q_len: int) -> list[int]:
    """Per-query causal ends for one MTP step.

    Index 0 is the longest end (the kernel's page-valid length). Index 1+j is
    the end for query j: seq_len - (q_len - 1 - j), clamped at 1. The values
    are full integers. A length near 59.5K must not be narrowed to 16 bits.
    """
    q_len = int(q_len)
    seq_len = int(seq_len)
    if q_len < 1 or q_len > DECODE_MAX_T:
        raise ValueError("q_len %d outside packed decode tile" % q_len)
    rows = []
    for j in range(q_len):
        end = seq_len - (q_len - 1 - j)
        rows.append(end if end >= 1 else 1)
    return [max(rows)] + rows


def builtin_q_end(seq_len: int, q_len: int, q_tok: int) -> int:
    """Non-varlen kernel end: seq_len - q_len + q_tok + 1."""
    return int(seq_len) - int(q_len) + int(q_tok) + 1


def as_int16(value: int) -> int:
    """The historic ABI bug: the length was narrowed to signed 16-bit."""
    masked = int(value) & 0xFFFF
    return masked - 0x10000 if masked >= 0x8000 else masked


def page_regions(page_index: int, layout: PageLayout) -> dict[str, tuple[int, int]]:
    """Byte offset and length of each region inside one kernel page."""
    base = int(page_index) * layout.page_bytes
    k0 = base
    v0 = k0 + layout.k_bytes_per_page
    s0 = v0 + layout.v_bytes_per_page
    return {
        "k": (k0, layout.k_bytes_per_page),
        "v": (v0, layout.v_bytes_per_page),
        "k_scale": (s0, layout.scale_bytes_per_page),
        "v_scale": (s0 + layout.scale_bytes_per_page, layout.scale_bytes_per_page),
        "v_zero": (s0 + 2 * layout.scale_bytes_per_page, layout.scale_bytes_per_page),
    }


def block_byte_span(block_id: int, block_size: int, layout: PageLayout) -> tuple[int, int]:
    """Start and length of one vLLM block in the packed blob."""
    ratio = pages_per_block(block_size)
    start = int(block_id) * ratio * layout.page_bytes
    return start, ratio * layout.page_bytes


def attention_pages_per_block(manager_block: int, kernel_block: int | None) -> int:
    """How many 64-token pages one attention block-table entry stands for.

    The runner's kernel block is the unit of ``block_table``. A 64-token
    kernel block is already one page. A larger entry expands as
    ``block_id * ratio + page_in_block``, which is the same page ``slot // 64``
    writes. ``kernel_block is None`` means the table is still in manager blocks.
    """
    manager_block = int(manager_block)
    if manager_block < PAGE or manager_block % PAGE != 0:
        raise ValueError("manager block %s is not a multiple of %s" % (manager_block, PAGE))
    if kernel_block is None:
        return manager_block // PAGE
    kernel_block = int(kernel_block)
    if kernel_block == PAGE:
        return 1
    if kernel_block < PAGE or kernel_block % PAGE != 0:
        raise ValueError("kernel block %s is not a multiple of %s" % (kernel_block, PAGE))
    return kernel_block // PAGE


def table_block_size(manager_block: int, kernel_block: int | None) -> int:
    """Token width of one block-table entry."""
    if kernel_block is None:
        return int(manager_block)
    return int(kernel_block)


def max_kernel_pages(max_model_len: int, manager_block: int, kernel_block: int | None) -> int:
    """Kernel pages addressable by a full-length block table."""
    unit = table_block_size(manager_block, kernel_block)
    ratio = attention_pages_per_block(manager_block, kernel_block)
    width = (int(max_model_len) + unit - 1) // unit
    if width < 1:
        width = 1
    return width * ratio


def region_view_specs(num_pages: int, layout: PageLayout) -> dict[str, dict[str, object]]:
    """as_strided specs for one contiguous run of kernel pages.

    Stride is in elements of that region. Byte offset is from the start of
    page 0. Page stride leaves the gap the other regions occupy, so K of
    page ``p+1`` is not adjacent to K of page ``p``.
    """
    num_pages = int(num_pages)
    if num_pages < 1:
        raise ValueError("num_pages")
    scale0 = layout.k_bytes_per_page + layout.v_bytes_per_page
    float_stride0 = layout.page_bytes // SCALE_BYTES
    return {
        "k": {
            "dtype": "int8",
            "shape": (num_pages, PAGE, layout.hkv, D),
            "stride": (layout.page_bytes, layout.hkv * D, D, 1),
            "byte_offset": 0,
        },
        "v": {
            "dtype": "uint8",
            "shape": (num_pages, PAGE, layout.hkv, V4_COLS),
            "stride": (layout.page_bytes, layout.hkv * V4_COLS, V4_COLS, 1),
            "byte_offset": layout.k_bytes_per_page,
        },
        "k_scale": {
            "dtype": "float32",
            "shape": (num_pages, PAGE, layout.hkv),
            "stride": (float_stride0, layout.hkv, 1),
            "byte_offset": scale0,
        },
        "v_scale": {
            "dtype": "float32",
            "shape": (num_pages, PAGE, layout.hkv),
            "stride": (float_stride0, layout.hkv, 1),
            "byte_offset": scale0 + layout.scale_bytes_per_page,
        },
        "v_zero": {
            "dtype": "float32",
            "shape": (num_pages, PAGE, layout.hkv),
            "stride": (float_stride0, layout.hkv, 1),
            "byte_offset": scale0 + 2 * layout.scale_bytes_per_page,
        },
    }


def element_byte(spec: dict[str, object], index: tuple[int, ...]) -> int:
    """Byte address of one element. Used by the CPU layout test."""
    shape = spec["shape"]
    stride = spec["stride"]
    if len(index) != len(shape) or len(stride) != len(shape):
        raise ValueError("index rank")
    elem = {"int8": 1, "uint8": 1, "float32": 4}[str(spec["dtype"])]
    off = int(spec["byte_offset"])
    for i, size, step in zip(index, shape, stride):
        i = int(i)
        if i < 0 or i >= int(size):
            raise IndexError(i)
        off += i * int(step) * elem
    return off


def region_stays_inside_block(block_size: int, layout: PageLayout) -> bool:
    """K, V, and scales of every kernel page sit inside that manager block."""
    ratio = pages_per_block(block_size)
    start, length = block_byte_span(0, block_size, layout)
    end = start + length
    for page in range(ratio):
        for off, nbytes in page_regions(page, layout).values():
            if off < start or off + nbytes > end:
                return False
    return True
