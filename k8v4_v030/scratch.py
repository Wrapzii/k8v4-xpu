"""Process-wide decode scratch. Layers run one at a time and reuse it.

Allocation happens when the kernel block size is known, before graph
capture. Forward only narrows these tensors. A narrow is a view, so the
captured op keeps a stable address.
"""

from __future__ import annotations

import torch

from k8v4_v030.layout import D, PAGE, PageLayout

_SLOTS: dict[tuple[str, int | None, int], "Scratch"] = {}


class Scratch:
    def __init__(
        self,
        device: torch.device,
        layout: PageLayout,
        nprog_max: int,
        max_store_tokens: int,
        max_out_tokens: int,
    ):
        if nprog_max < 1 or max_store_tokens < 1 or max_out_tokens < 1:
            raise ValueError("scratch capacity")
        self.device = device
        self.layout = layout
        self.nprog_max = int(nprog_max)
        self.max_store_tokens = int(max_store_tokens)
        self.max_out_tokens = int(max_out_tokens)
        hkv, hq = layout.hkv, layout.hq
        self.q8 = torch.empty((hkv, PAGE, D), dtype=torch.int8, device=device)
        self.q_scale = torch.empty((hkv, PAGE), dtype=torch.float32, device=device)
        self.k_fp16 = torch.empty((self.max_store_tokens, hkv, D), dtype=torch.float16, device=device)
        self.v_fp16 = torch.empty((self.max_store_tokens, hkv, D), dtype=torch.float16, device=device)
        self.q_fp16 = torch.empty((self.max_out_tokens, hq, D), dtype=torch.float16, device=device)
        self.out_fp16 = torch.empty((self.max_out_tokens, hq, D), dtype=torch.float16, device=device)
        self.partials = torch.empty((self.nprog_max, PAGE, D), dtype=torch.float32, device=device)
        self.m = torch.empty((self.nprog_max, PAGE), dtype=torch.float32, device=device)
        self.l = torch.empty((self.nprog_max, PAGE), dtype=torch.float32, device=device)
        self.merged = torch.empty((hkv, PAGE, D), dtype=torch.float32, device=device)
        # numel 0: the batch op treats this as "use the builtin causal ends".
        self.visible = torch.empty((0,), dtype=torch.int32, device=device)

    def workspace(self, nprog: int) -> tuple[torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor]:
        nprog = int(nprog)
        if nprog < 1 or nprog > self.nprog_max:
            raise RuntimeError(
                "K8/V4 workspace needs %d programs and was allocated for %d"
                % (nprog, self.nprog_max)
            )
        return (
            self.partials.narrow(0, 0, nprog),
            self.m.narrow(0, 0, nprog),
            self.l.narrow(0, 0, nprog),
            self.merged,
        )

    def store_pair(self, ntok: int) -> tuple[torch.Tensor, torch.Tensor]:
        ntok = int(ntok)
        if ntok < 1 or ntok > self.max_store_tokens:
            raise RuntimeError(
                "K8/V4 store buffer holds %d tokens, got %d" % (self.max_store_tokens, ntok)
            )
        return self.k_fp16.narrow(0, 0, ntok), self.v_fp16.narrow(0, 0, ntok)

    def attention_pair(self, ntok: int) -> tuple[torch.Tensor, torch.Tensor]:
        ntok = int(ntok)
        if ntok < 1 or ntok > self.max_out_tokens:
            raise RuntimeError(
                "K8/V4 attention buffer holds %d tokens, got %d" % (self.max_out_tokens, ntok)
            )
        return self.q_fp16.narrow(0, 0, ntok), self.out_fp16.narrow(0, 0, ntok)


def scratch_key(device: torch.device, layout: PageLayout) -> tuple[str, int | None, int]:
    return (device.type, device.index, layout.hkv)


def ensure_scratch(
    device: torch.device,
    layout: PageLayout,
    nprog_max: int,
    max_store_tokens: int,
    max_out_tokens: int,
) -> Scratch:
    key = scratch_key(device, layout)
    current = _SLOTS.get(key)
    if (
        current is not None
        and current.nprog_max >= int(nprog_max)
        and current.max_store_tokens >= int(max_store_tokens)
        and current.max_out_tokens >= int(max_out_tokens)
    ):
        return current
    current = Scratch(device, layout, nprog_max, max_store_tokens, max_out_tokens)
    _SLOTS[key] = current
    return current


def get_scratch(device: torch.device, layout: PageLayout) -> Scratch:
    key = scratch_key(device, layout)
    if key not in _SLOTS:
        raise RuntimeError("K8/V4 scratch was not allocated before attention")
    return _SLOTS[key]


def scratch_ready(device: torch.device, layout: PageLayout) -> bool:
    return scratch_key(device, layout) in _SLOTS


def clear_scratch() -> None:
    _SLOTS.clear()
