"""Insert the MTP top-k hooks into local copies of vLLM 0.30 files.

The copies are bind-mounted into the experimental container only.
Stock vLLM is not modified. Running this twice is refused.

The live XPU worker is the V2 model runner. Its drafter replays a FULL
graph, so the V2 hooks also force that drafter eager while logging.
The target FULL_DECODE_ONLY graphs are a different manager and stay on.
"""

from __future__ import annotations

import sys
from pathlib import Path

PROPOSER_HELPERS = '''

def _mtp_begin(owner, attn):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return
    from k8v4_v030.mtp_topk_log import begin
    begin(owner, attn)


def _mtp_note_logits(owner, logits):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return
    from k8v4_v030.mtp_topk_log import note_logits
    note_logits(owner, logits)


def _mtp_flush(owner, draft_token_ids):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return
    from k8v4_v030.mtp_topk_log import flush
    flush(owner, draft_token_ids)
'''

SAMPLER_HELPERS = '''

def _mtp_verify(draft_token_ids, target_argmax, num_draft_tokens):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return
    from k8v4_v030.mtp_topk_log import verify
    verify(draft_token_ids, target_argmax, num_draft_tokens)
'''


def _replace_once(text: str, old: str, new: str, label: str) -> str:
    count = text.count(old)
    if count != 1:
        raise SystemExit("%s found %d times" % (label, count))
    return text.replace(old, new, 1)


def patch_proposer(text: str) -> str:
    if "_mtp_note_logits" in text:
        raise SystemExit("proposer already patched")
    text = _replace_once(
        text,
        "        return self.model.compute_logits(hidden_states).argmax(dim=-1)\n",
        "        logits = self.model.compute_logits(hidden_states)\n"
        "        _mtp_note_logits(self, logits)\n"
        "        return logits.argmax(dim=-1)\n",
        "greedy argmax",
    )
    text = _replace_once(
        text,
        "        self._last_draft_probs = None\n        batch_size = common_attn_metadata.batch_size()\n",
        "        self._last_draft_probs = None\n"
        "        _mtp_begin(self, common_attn_metadata)\n"
        "        batch_size = common_attn_metadata.batch_size()\n",
        "propose begin",
    )
    text = _replace_once(
        text,
        "            return draft_token_ids.view(-1, self.num_speculative_tokens)\n",
        "            _mtp_flush(self, draft_token_ids.view(-1, self.num_speculative_tokens))\n"
        "            return draft_token_ids.view(-1, self.num_speculative_tokens)\n",
        "early flush",
    )
    text = _replace_once(
        text,
        "        if draft_probs_list is not None:\n"
        "            self._last_draft_probs = torch.stack(draft_probs_list, dim=1).contiguous()\n"
        "        return draft_token_ids\n",
        "        if draft_probs_list is not None:\n"
        "            self._last_draft_probs = torch.stack(draft_probs_list, dim=1).contiguous()\n"
        "        _mtp_flush(self, draft_token_ids)\n"
        "        return draft_token_ids\n",
        "final flush",
    )
    return text + PROPOSER_HELPERS


def patch_sampler(text: str) -> str:
    if "_mtp_verify" in text:
        raise SystemExit("sampler already patched")
    text = _replace_once(
        text,
        "        target_argmax = target_logits.argmax(dim=-1)\n        _rejection_greedy_sample(\n",
        "        target_argmax = target_logits.argmax(dim=-1)\n"
        "        if sampling_metadata.all_greedy:\n"
        "            _mtp_verify(draft_token_ids, target_argmax, num_draft_tokens)\n"
        "        _rejection_greedy_sample(\n",
        "verify hook",
    )
    return text + SAMPLER_HELPERS


GPU_SPEC_HELPERS = '''

def _mtp_note_logits(owner, logits):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return
    from k8v4_v030.mtp_topk_log import note_logits
    note_logits(owner, logits)
'''

AR_HELPERS = '''

def _mtp_drafter_mode(cudagraph_mode):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return cudagraph_mode
    from vllm.config.compilation import CUDAGraphMode
    from k8v4_v030.mtp_topk_log import drafter_mode
    return drafter_mode(cudagraph_mode, CUDAGraphMode.NONE)


def _mtp_skip_drafter_capture():
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return False
    from k8v4_v030.mtp_topk_log import skip_drafter_capture
    return bool(skip_drafter_capture())


def _mtp_begin(owner, dummy_run):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return
    from k8v4_v030.mtp_topk_log import begin
    begin(owner, dummy_run)


def _mtp_flush(owner, draft_token_ids, dummy_run):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return
    from k8v4_v030.mtp_topk_log import flush
    flush(owner, draft_token_ids, dummy_run)
'''

GPU_REJECTION_HELPERS = '''

def _mtp_verify_v2(processed_logits, draft_sampled, cu_num_logits, expanded_local_pos, num_speculative_steps):
    import os
    if os.environ.get("MTP_TOPK_LOG") != "1":
        return
    from k8v4_v030.mtp_topk_log import verify_v2
    verify_v2(processed_logits, draft_sampled, cu_num_logits, expanded_local_pos, num_speculative_steps)
'''


def patch_gpu_speculator(text: str) -> str:
    if "_mtp_note_logits" in text:
        raise SystemExit("gpu speculator already patched")
    text = _replace_once(
        text,
        "            logits = self.model.compute_logits(hidden_states)\n"
        "            sampled = logits.argmax(dim=-1)\n",
        "            logits = self.model.compute_logits(hidden_states)\n"
        "            _mtp_note_logits(self, logits)\n"
        "            sampled = logits.argmax(dim=-1)\n",
        "v2 greedy argmax",
    )
    return text + GPU_SPEC_HELPERS


def patch_ar_speculator(text: str) -> str:
    if "_mtp_drafter_mode" in text or "_mtp_begin" in text:
        raise SystemExit("autoregressive speculator already patched")
    text = _replace_once(
        text,
        "    def init_cudagraph_manager(self, cudagraph_mode: CUDAGraphMode) -> None:\n"
        "        # Initialize cudagraph manager for draft prefill (draft position 0).\n",
        "    def init_cudagraph_manager(self, cudagraph_mode: CUDAGraphMode) -> None:\n"
        "        cudagraph_mode = _mtp_drafter_mode(cudagraph_mode)\n"
        "        # Initialize cudagraph manager for draft prefill (draft position 0).\n",
        "drafter mode",
    )
    text = _replace_once(
        text,
        "    def capture(self) -> None:\n"
        "        logger.info(\"Capturing model for speculator...\")\n",
        "    def capture(self) -> None:\n"
        "        if _mtp_skip_drafter_capture():\n"
        "            logger.info(\"MTP_TOPK_LOG: skipping speculator CUDA graph capture\")\n"
        "            return\n"
        "        logger.info(\"Capturing model for speculator...\")\n",
        "drafter capture",
    )
    text = _replace_once(
        text,
        "        num_tokens = input_batch.num_tokens\n"
        "        num_tokens_padded = input_batch.num_tokens_after_padding\n"
        "        num_reqs = input_batch.num_reqs\n"
        "        max_query_len = input_batch.num_scheduled_tokens.max()\n",
        "        num_tokens = input_batch.num_tokens\n"
        "        num_tokens_padded = input_batch.num_tokens_after_padding\n"
        "        num_reqs = input_batch.num_reqs\n"
        "        _mtp_begin(self, dummy_run)\n"
        "        max_query_len = input_batch.num_scheduled_tokens.max()\n",
        "v2 propose begin",
    )
    text = _replace_once(
        text,
        "        if self.num_speculative_steps == 1:\n"
        "            # Early exit.\n"
        "            return self.draft_tokens[:num_reqs, :1]\n",
        "        if self.num_speculative_steps == 1:\n"
        "            # Early exit.\n"
        "            _mtp_flush(self, self.draft_tokens[:num_reqs, :1], dummy_run)\n"
        "            return self.draft_tokens[:num_reqs, :1]\n",
        "v2 early flush",
    )
    text = _replace_once(
        text,
        "        self.on_multi_step_decode_end(num_reqs)\n"
        "\n"
        "        return self.draft_tokens[:num_reqs]\n",
        "        self.on_multi_step_decode_end(num_reqs)\n"
        "        _mtp_flush(\n"
        "            self,\n"
        "            self.draft_tokens[:num_reqs, : self.num_speculative_steps],\n"
        "            dummy_run,\n"
        "        )\n"
        "        return self.draft_tokens[:num_reqs]\n",
        "v2 final flush",
    )
    if "compilation_config.cudagraph_mode" in text and "compilation_config.cudagraph_mode =" in text:
        raise SystemExit("refusing to assign the shared cudagraph mode")
    return text + AR_HELPERS


def patch_gpu_rejection(text: str) -> str:
    if "_mtp_verify_v2" in text:
        raise SystemExit("gpu rejection sampler already patched")
    text = _replace_once(
        text,
        "        processed_logits = self.sampler.apply_sampling_params(\n"
        "            logits,\n"
        "            expanded_idx_mapping,\n"
        "            idx_mapping,\n"
        "            idx_mapping_np,\n"
        "            pos,\n"
        "            draft_sampled,\n"
        "            expanded_local_pos,\n"
        "        )\n"
        "        sampled, num_sampled = rejection_sample(\n",
        "        processed_logits = self.sampler.apply_sampling_params(\n"
        "            logits,\n"
        "            expanded_idx_mapping,\n"
        "            idx_mapping,\n"
        "            idx_mapping_np,\n"
        "            pos,\n"
        "            draft_sampled,\n"
        "            expanded_local_pos,\n"
        "        )\n"
        "        _mtp_verify_v2(\n"
        "            processed_logits,\n"
        "            draft_sampled,\n"
        "            cu_num_logits,\n"
        "            expanded_local_pos,\n"
        "            self.num_speculative_steps,\n"
        "        )\n"
        "        sampled, num_sampled = rejection_sample(\n",
        "v2 verify",
    )
    return text + GPU_REJECTION_HELPERS


def _write_patched(path: Path, patched: str) -> None:
    path.write_text(patched, encoding="utf-8", newline="\n")


def main(argv: list[str]) -> int:
    if len(argv) not in (3, 6):
        raise SystemExit(
            "usage: patch_mtp_topk.py PROPOSER SAMPLER [GPU_SPEC AR_SPEC GPU_REJECTION]"
        )
    proposer = Path(argv[1])
    sampler = Path(argv[2])
    _write_patched(proposer, patch_proposer(proposer.read_text(encoding="utf-8")))
    _write_patched(sampler, patch_sampler(sampler.read_text(encoding="utf-8")))
    if len(argv) == 6:
        gpu_spec = Path(argv[3])
        ar_spec = Path(argv[4])
        gpu_reject = Path(argv[5])
        _write_patched(gpu_spec, patch_gpu_speculator(gpu_spec.read_text(encoding="utf-8")))
        _write_patched(ar_spec, patch_ar_speculator(ar_spec.read_text(encoding="utf-8")))
        _write_patched(gpu_reject, patch_gpu_rejection(gpu_reject.read_text(encoding="utf-8")))
    print("PATCH_OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
