"""Install the opt-in replicated-query adapter into a disposable vLLM image.

This is NOT a generic way to bypass vLLM's PCP guards. Changed source/ABI is
rejected. Validate every file before writing any, and keep a hash receipt.
Normal K8V4_CP=1 execution takes the original code paths.
"""
from __future__ import annotations

import ast
import hashlib
import importlib.util
import json
from pathlib import Path

IMPORT = "from k8v4_v030 import context_parallel as _k8cp\n"
MARKER = "# K8V4_REPLICATED_QUERY_CP_V1\n"


def transform(relative: str, source: str) -> str:
    if MARKER in source:
        return source
    edits = {
        "config/vllm.py": [(
            '        if self.parallel_config.prefill_context_parallel_size > 1:\n'
            '            unsupported.append("prefill context parallel")',
            '        if (self.parallel_config.prefill_context_parallel_size > 1\n'
            '                and not _k8cp.allow_legacy_config(self)):\n'
            '            unsupported.append("prefill context parallel")',
        )],
        "config/model.py": [(
            '        if decode_context_parallel_size > 1 and not self.use_mla:\n',
            '        if (decode_context_parallel_size > 1 and not self.use_mla\n'
            '                and not _k8cp.replica_model_parallel(self, parallel_config)):\n',
        )],
        "v1/worker/cp_utils.py": [(
            '        for layer_name, layer in layers.items():\n',
            '        for layer_name, layer in layers.items():\n'
            '            if _k8cp.replicated_gdn(layer):\n'
            '                _k8cp.validate_vllm_config(vllm_config)\n'
            '                continue  # identical queries and replicated GDN state\n',
        )],
        "v1/worker/gpu_model_runner.py": [(
            '            sampler_output = self._sample(logits, spec_decode_metadata)\n',
            '            sampler_output = self._sample(logits, spec_decode_metadata)\n'
            '            _k8cp.synchronize_sampled_tokens(sampler_output.sampled_token_ids)\n',
        )],
        "v1/spec_decode/utils.py": [(
            '    batch_size = positions_1d.shape[0]\n',
            '    if _k8cp.enabled():\n'
            '        return _k8cp.mtp_step_update(\n'
            '            positions_1d, block_table_tensor, seq_lens, block_size,\n'
            '            max_model_len, out_clamped_positions, out_slot_mapping, input_batch_size)\n'
            '    batch_size = positions_1d.shape[0]\n',
        ), (
            '    batch_size, n_blocks_per_req = cad.block_table_tensor.shape\n',
            '    if _k8cp.enabled():\n'
            '        return _k8cp.mtp_new_slots(\n'
            '            cad, new_positions, is_rejected_token_mask, block_size,\n'
            '            num_new_tokens, max_model_len)\n'
            '    batch_size, n_blocks_per_req = cad.block_table_tensor.shape\n',
        )],
    }
    for old, new in edits[relative]:
        if source.count(old) != 1:
            raise RuntimeError(f"{relative}: expected exactly one known CP anchor")
        source = source.replace(old, new, 1)
    # Insert after future imports, if any, preserving their required position.
    tree = ast.parse(source)
    insert = 0
    for node in tree.body:
        if isinstance(node, ast.ImportFrom) and node.module == "__future__":
            insert = node.end_lineno
    lines = source.splitlines(keepends=True)
    lines[insert:insert] = [MARKER, IMPORT]
    result = "".join(lines)
    ast.parse(result)
    return result


def patch(root: Path, contract: dict) -> dict:
    planned = []
    for relative, expected in contract["sources"].items():
        path = root / relative
        original = path.read_bytes()
        source = original.decode()
        if MARKER in source:
            # Validate the exact known patched result, not just a marker.
            if hashlib.sha256(original).hexdigest() != expected["patched_sha256"]:
                raise RuntimeError(f"{relative}: modified CP patch; refusing overwrite")
            continue
        if hashlib.sha256(original).hexdigest() != expected["sha256"]:
            raise RuntimeError(f"{relative}: unsupported vLLM source; no files written")
        updated = transform(relative, source).encode()
        if hashlib.sha256(updated).hexdigest() != expected["patched_sha256"]:
            raise RuntimeError(f"{relative}: patch result disagrees with contract")
        planned.append((path, updated))
    # Existing cache geometry must distinguish sharded FA from replicated GDN.
    for relative, expected in contract["required_unchanged"].items():
        if hashlib.sha256((root / relative).read_bytes()).hexdigest() != expected:
            raise RuntimeError(f"{relative}: unsupported CP cache/group implementation")
    for path, updated in planned:
        path.write_bytes(updated)
    return {"adapter": "replicated-query-cp-v1", "root": str(root),
            "files_written": [str(p.relative_to(root)) for p, _ in planned],
            "four_gpu_serving_validated": False}


def main():
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path)
    parser.add_argument("--contract", type=Path, default=Path(__file__).with_name("cp_runtime_contract.json"))
    args = parser.parse_args()
    root = args.root
    if root is None:
        spec = importlib.util.find_spec("vllm")
        if spec is None or spec.origin is None:
            raise SystemExit("vLLM package not found")
        root = Path(spec.origin).parent
    receipt = patch(root, json.loads(args.contract.read_text()))
    print(json.dumps(receipt, indent=2))


if __name__ == "__main__":
    main()
