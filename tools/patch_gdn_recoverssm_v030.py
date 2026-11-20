"""GDN RecoverSSM splices for an installed vLLM 0.34 tree (K8V4_GDN_RECOVERSSM, k8v4_v030/gdn_recoverssm.py).

Each splice is anchored on vLLM 0.34 source, applies once (a marker makes a second run a no-op) and refuses
unknown source. Every spliced hook is inert unless K8V4_GDN_RECOVERSSM=1 and vLLM runs with --use-replayssm:

- config/vllm.py validate_mamba_cached_kernel: the GDN models join the RecoverSSM model list (knob on only).
- model_executor/models/qwen3_5.py: Qwen3_5ForCausalLM / Qwen3_5ForConditionalGeneration declare
  supports_replayssm (vLLM consults it only under --use-replayssm), and so does the MTP draft model
  (model_executor/models/qwen3_5_mtp.py); models/qwen3_5/__init__.py gets a comment
  so the model-info cache key (it hashes that package, not the legacy module) moves with it.
- model_executor/layers/mamba/gdn/qwen_gdn_linear_attn.py: QwenGatedDeltaNetAttention gets the replay buffer
  and the RecoverSSM metadata backend when the layer runs RecoverSSM.
- _xpu_ops.py _gdn_attention_core_xpu_impl: steps with spec rows on a RecoverSSM layer go to gdn_core().
- v1/worker/gpu: the profiling teardown drops a recorded RecoverSSM step (its commit contexts reference the
  profiling KV cache), as in vLLM PR 62625.
"""

from __future__ import annotations

import sys
from pathlib import Path

_DEFAULT_ROOTS = (
    Path("/opt/venv/lib/python3.12/site-packages/vllm"),
    Path("/workspace/vllm/vllm"),
)
MARK = "K8V4_GDN_RECOVERSSM_V1"

CONFIG = "config/vllm.py"
_CONFIG_OLD = (
    "        kda_architectures = (\n"
    "            \"KimiLinearForCausalLM\",\n"
    "            \"KimiK3ForConditionalGeneration\",\n"
    "            \"KimiK31ForConditionalGeneration\",\n"
    "        )\n"
)
_CONFIG_NEW = _CONFIG_OLD + (
    "        # %s: Qwen GDN models too when K8V4_GDN_RECOVERSSM=1 (k8v4_v030/gdn_recoverssm.py)\n"
    "        try:\n"
    "            from k8v4_v030.gdn_recoverssm import kda_architectures as _k8v4_rssm_archs\n"
    "        except ImportError:\n"
    "            pass\n"
    "        else:\n"
    "            kda_architectures = _k8v4_rssm_archs(kda_architectures)\n"
) % MARK

MODEL = "model_executor/models/qwen3_5.py"
_CAUSAL_OLD = "class Qwen3_5ForCausalLM(Qwen3_5ForCausalLMBase):\n    pass\n"
_CAUSAL_NEW = (
    "class Qwen3_5ForCausalLM(Qwen3_5ForCausalLMBase):\n"
    "    # %s: the GDN layers can run RecoverSSM (consulted only under --use-replayssm)\n"
    "    supports_replayssm = True\n"
) % MARK
_COND_OLD = (
    "class Qwen3_5ForConditionalGeneration(Qwen3VLForConditionalGeneration, IsHybrid):\n"
    "    supports_multimodal_pruning = True\n"
)
_COND_NEW = _COND_OLD + (
    "    # %s: the GDN layers can run RecoverSSM (consulted only under --use-replayssm)\n"
    "    supports_replayssm = True\n"
) % MARK

MTP = "model_executor/models/qwen3_5_mtp.py"
_MTP_OLD = "class Qwen3_5MTP(LocalArgmaxMixin, nn.Module, SupportsMultiModal, SupportsPP):\n"
_MTP_NEW = _MTP_OLD + (
    "    # %s: the draft config passes the same RecoverSSM model check as the target\n"
    "    supports_replayssm = True\n"
) % MARK

PKG = "models/qwen3_5/__init__.py"
_PKG_OLD = "from typing import TYPE_CHECKING\n"
_PKG_NEW = (
    "# %s: the non-CUDA classes below (model_executor/models/qwen3_5.py) declare supports_replayssm;\n"
    "# this line keeps the model-info cache key, which hashes this package, in step with them.\n"
    "from typing import TYPE_CHECKING\n"
) % MARK

LAYER = "model_executor/layers/mamba/gdn/qwen_gdn_linear_attn.py"
_LAYER_OLD = (
    "direct_register_custom_op(\n"
    "    op_name=\"qwen_gdn_attention_core_fused_norm_packed\",\n"
    "    op_func=qwen_gdn_attention_core_fused_norm_packed,\n"
    "    mutates_args=[\"core_attn_out\"],\n"
    ")\n"
)
_LAYER_NEW = _LAYER_OLD + (
    "\n"
    "# %s: replay buffer + RecoverSSM backend when the layer runs RecoverSSM (k8v4_v030/gdn_recoverssm.py)\n"
    "try:\n"
    "    from k8v4_v030.gdn_recoverssm import install_layer as _k8v4_rssm_install\n"
    "except ImportError:\n"
    "    pass\n"
    "else:\n"
    "    _k8v4_rssm_install(QwenGatedDeltaNetAttention)\n"
) % MARK

OPS = "_xpu_ops.py"
_OPS_OLD = (
    "    conv_weights = self.conv1d.weight.view(\n"
    "        self.conv1d.weight.size(0), self.conv1d.weight.size(2)\n"
    "    )\n"
    "\n"
    "    torch.ops._xpu_C.gdn_attention(\n"
)
_OPS_NEW = (
    "    conv_weights = self.conv1d.weight.view(\n"
    "        self.conv1d.weight.size(0), self.conv1d.weight.size(2)\n"
    "    )\n"
    "\n"
    "    # %s: spec rows of a RecoverSSM layer verify off the checkpoint (k8v4_v030/gdn_recoverssm.py)\n"
    "    if num_spec_decodes > 0 and getattr(self, \"use_gdn_recoverssm\", False):\n"
    "        from k8v4_v030.gdn_recoverssm import gdn_core as _k8v4_rssm_core\n"
    "\n"
    "        _k8v4_rssm_core(self, attn_metadata, core_attn_out, z, projected_states_qkvz,\n"
    "                        projected_states_ba, conv_weights)\n"
    "        return\n"
    "\n"
    "    torch.ops._xpu_C.gdn_attention(\n"
) % MARK

STATE = "v1/worker/gpu/model_states/recoverssm.py"
_STATE_OLD = (
    "    def __init__(self) -> None:\n"
    "        self._step: tuple[RecoverSSMMetadata, ...] | None = None\n"
)
_STATE_NEW = _STATE_OLD + (
    "\n"
    "    def reset(self) -> None:\n"
    "        \"\"\"%s: drop the recorded step; its metadata holds commit contexts that\n"
    "        reference the KV cache tensors they were built for.\"\"\"\n"
    "        self._step = None\n"
) % MARK
GRAPH = "v1/worker/gpu/cudagraph_utils.py"
_GRAPH_OLD = (
    "    if hasattr(runner.model_state, \"_mamba_ctx\"):\n"
    "        runner.model_state._mamba_ctx = None\n"
)
_GRAPH_NEW = _GRAPH_OLD + (
    "    # %s: a profiling capture may have recorded a RecoverSSM step (vLLM PR 62625)\n"
    "    if (_k8v4_rssm := getattr(runner.model_state, \"recoverssm\", None)) is not None:\n"
    "        _k8v4_rssm.reset()\n"
) % MARK

SPLICES = (
    (CONFIG, _CONFIG_OLD, _CONFIG_NEW, "rssm_config"),
    (MODEL, _CAUSAL_OLD, _CAUSAL_NEW, "rssm_causal"),
    (MODEL, _COND_OLD, _COND_NEW, "rssm_cond"),
    (MTP, _MTP_OLD, _MTP_NEW, "rssm_mtp"),
    (PKG, _PKG_OLD, _PKG_NEW, "rssm_pkg"),
    (LAYER, _LAYER_OLD, _LAYER_NEW, "rssm_layer"),
    (OPS, _OPS_OLD, _OPS_NEW, "rssm_ops"),
    (STATE, _STATE_OLD, _STATE_NEW, "rssm_reset"),
    (GRAPH, _GRAPH_OLD, _GRAPH_NEW, "rssm_teardown"),
)


def _splice(path: Path, old: str, new: str, label: str) -> str:
    if not path.is_file():
        raise RuntimeError("missing %s" % path)
    text = path.read_text(encoding="utf-8")
    if new in text:
        return "%s:unchanged" % label
    count = text.count(old)
    if count != 1:
        raise RuntimeError("%s: %s anchor count %d; unexpected vLLM source, patch refused" % (path, label, count))
    text = text.replace(old, new, 1)
    compile(text, str(path), "exec")
    path.write_text(text, encoding="utf-8")
    return "%s:patched" % label


def patch_vllm_tree(root: Path) -> list[str]:
    """Apply every GDN RecoverSSM splice to one vLLM package root (all anchors are checked first)."""
    root = Path(root)
    for rel, old, new, label in SPLICES:
        path = root / rel
        if not path.is_file():
            raise RuntimeError("missing %s" % path)
        text = path.read_text(encoding="utf-8")
        if new not in text and text.count(old) != 1:
            raise RuntimeError("%s: %s anchor count %d; unexpected vLLM source, patch refused"
                               % (path, label, text.count(old)))
    return [_splice(root / rel, old, new, label) for rel, old, new, label in SPLICES]


def patch_installed(roots: tuple[Path, ...] = _DEFAULT_ROOTS) -> list[str]:
    notes: list[str] = []
    for root in roots:
        if (root / STATE).is_file():
            notes.extend("%s %s" % (root, item) for item in patch_vllm_tree(root))
    if not notes:
        raise RuntimeError("no vLLM 0.34 tree with RecoverSSM model state found")
    return notes


def main(argv: list[str]) -> int:
    roots = tuple(Path(arg) for arg in argv) if argv else _DEFAULT_ROOTS
    for line in patch_installed(roots):
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
