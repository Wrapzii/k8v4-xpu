"""Give the v0.1.17 RecoverSSM verify kernel an optional record-index array, so replay records live in a
per-request-slot buffer (upstream PR 62625's layout) instead of one row per state block."""
import sys

p = sys.argv[1] if len(sys.argv) > 1 else "gated_delta_rule_recoverssm.hpp"
s = open(p).read()


def rep(old, new, cnt=1):
    global s
    n = s.count(old)
    assert n == cnt, (old, n)
    s = s.replace(old, new)


rep("      const int* state_indices,\n      const int null_block_id,",
    "      const int* state_indices,\n      const int* record_indices,\n      const int null_block_id,")
rep("    const int* state_indices,\n    const int null_block_id,",
    "    const int* state_indices,\n    const int* record_indices,\n    const int null_block_id,")
rep("        state_indices(state_indices),\n", "        state_indices(state_indices),\n        record_indices(record_indices),\n")
rep("  const int* state_indices;\n  const int null_block_id;",
    "  const int* state_indices;\n  const int* record_indices;\n  const int null_block_id;")
rep("        state_indices,\n        null_block_id,", "        state_indices,\n        record_indices,\n        null_block_id,")
rep("static_cast<int64_t>(state_idx) * replay_stride_0 +",
    "static_cast<int64_t>(record_indices ? record_indices[batch_id] : state_idx) * replay_stride_0 +")
rep("    const torch::Tensor& state_indices,              // [num_spec_decodes]\n    const int64_t null_block_id) {",
    "    const torch::Tensor& state_indices,              // [num_spec_decodes]\n"
    "    const std::optional<torch::Tensor>& record_indices,  // replay row per window\n"
    "    const int64_t null_block_id) {")
key = "      reinterpret_cast<int*>(state_indices.data_ptr()),"
i = s.index(key)
j = s.index("\n", i) + 1
assert s.count(key) == 1
s = s[:j] + "      record_indices.has_value() ? reinterpret_cast<int*>(record_indices->data_ptr()) : nullptr, \\\n" + s[j:]
open(p, "w").write(s)

print("ok")
