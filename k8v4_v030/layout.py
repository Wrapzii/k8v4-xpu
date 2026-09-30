"""TP2 K8/V4 page geometry.

One kernel page is 64 tokens and holds K, packed V, and the three fp32
affine tensors together. vLLM copies a whole manager block; that copy stays
correct only when every kernel page inside the block is self-contained.
Head count is the TP2 local count (2 KV / 12 Q). The one-GPU 4-KV-head
page is larger than FP8 on a rank and is not this layout.
"""

from __future__ import annotations

PAGE = 64
HKV = 2
HQ = 12
GQA = HQ // HKV
D = 256
V4_COLS = D // 2
SCALE_BYTES = 4
# int8 K + packed int4 V + k scale + v scale + v zero, one head, one token.
SLOT_BYTES_PER_HEAD = D + V4_COLS + 3 * SCALE_BYTES
DECODE_MAX_T = PAGE // GQA  # 10; MTP6 uses 7

K_BYTES_PER_PAGE = PAGE * HKV * D
V_BYTES_PER_PAGE = PAGE * HKV * V4_COLS
SCALE_BYTES_PER_PAGE = PAGE * HKV * SCALE_BYTES
PAGE_BYTES = K_BYTES_PER_PAGE + V_BYTES_PER_PAGE + 3 * SCALE_BYTES_PER_PAGE
BYTES_PER_TOKEN = PAGE_BYTES // PAGE
# fp8 K and V for the same local head count: 2 * 256 bytes per head.
FP8_BYTES_PER_TOKEN = HKV * 2 * D
# What a TP rank would pay if it padded 2 KV heads out to the one-GPU kernel.
PADDED_HKV4_BYTES_PER_TOKEN = 4 * SLOT_BYTES_PER_HEAD

CACHE_DTYPE = "int8_k_int4_v"
HISTORIC_MTP_LEN = 59500


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


def page_regions(page_index: int) -> dict[str, tuple[int, int]]:
    """Byte offset and length of each region inside one kernel page."""
    base = int(page_index) * PAGE_BYTES
    k0 = base
    v0 = k0 + K_BYTES_PER_PAGE
    s0 = v0 + V_BYTES_PER_PAGE
    return {
        "k": (k0, K_BYTES_PER_PAGE),
        "v": (v0, V_BYTES_PER_PAGE),
        "k_scale": (s0, SCALE_BYTES_PER_PAGE),
        "v_scale": (s0 + SCALE_BYTES_PER_PAGE, SCALE_BYTES_PER_PAGE),
        "v_zero": (s0 + 2 * SCALE_BYTES_PER_PAGE, SCALE_BYTES_PER_PAGE),
    }


def block_byte_span(block_id: int, block_size: int) -> tuple[int, int]:
    """Start and length of one vLLM block in the packed blob."""
    ratio = pages_per_block(block_size)
    start = int(block_id) * ratio * PAGE_BYTES
    return start, ratio * PAGE_BYTES


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


def region_view_specs(num_pages: int) -> dict[str, dict[str, object]]:
    """as_strided specs for one contiguous run of kernel pages.

    Stride is in elements of that region. Byte offset is from the start of
    page 0. Page stride leaves the gap the other regions occupy, so K of
    page ``p+1`` is not adjacent to K of page ``p``.
    """
    num_pages = int(num_pages)
    if num_pages < 1:
        raise ValueError("num_pages")
    scale0 = K_BYTES_PER_PAGE + V_BYTES_PER_PAGE
    float_stride0 = PAGE_BYTES // SCALE_BYTES
    return {
        "k": {
            "dtype": "int8",
            "shape": (num_pages, PAGE, HKV, D),
            "stride": (PAGE_BYTES, HKV * D, D, 1),
            "byte_offset": 0,
        },
        "v": {
            "dtype": "uint8",
            "shape": (num_pages, PAGE, HKV, V4_COLS),
            "stride": (PAGE_BYTES, HKV * V4_COLS, V4_COLS, 1),
            "byte_offset": K_BYTES_PER_PAGE,
        },
        "k_scale": {
            "dtype": "float32",
            "shape": (num_pages, PAGE, HKV),
            "stride": (float_stride0, HKV, 1),
            "byte_offset": scale0,
        },
        "v_scale": {
            "dtype": "float32",
            "shape": (num_pages, PAGE, HKV),
            "stride": (float_stride0, HKV, 1),
            "byte_offset": scale0 + SCALE_BYTES_PER_PAGE,
        },
        "v_zero": {
            "dtype": "float32",
            "shape": (num_pages, PAGE, HKV),
            "stride": (float_stride0, HKV, 1),
            "byte_offset": scale0 + 2 * SCALE_BYTES_PER_PAGE,
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


def region_stays_inside_block(block_size: int) -> bool:
    """K, V, and scales of every kernel page sit inside that manager block."""
    ratio = pages_per_block(block_size)
    start, length = block_byte_span(0, block_size)
    end = start + length
    for page in range(ratio):
        for off, nbytes in page_regions(page).values():
            if off < start or off + nbytes > end:
                return False
    return True
