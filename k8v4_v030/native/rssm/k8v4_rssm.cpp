// _k8v4_rssm (K8V4_GDN_RECOVERSSM): vllm-xpu-kernels v0.1.17's RecoverSSM spec-decode GDN kernel (gated_delta_rule_recoverssm.hpp, Apache-2.0,
// upstream PR 618) as a standalone torch op, so it can run beside the image's _xpu_C without rebuilding it
// (the image's own gated_delta_rule_spec_recoverssm addresses replay rows by state block, one row per block).
// Verify off a read-only checkpoint (one state block per request) and write fp32 replay records [rows, HV, T, V+K+1];
// the accepted prefix is committed later by vLLM's RecoverSSM commit.
#include <torch/all.h>
#include <c10/xpu/XPUStream.h>
#include "gated_delta_rule_recoverssm.hpp"
#include "rssm_verify_slm.hpp"

void verify(torch::Tensor& core_attn_out, const torch::Tensor& q, const torch::Tensor& k, const torch::Tensor& v,
            const torch::Tensor& b, const torch::Tensor& a, const torch::Tensor& A_log, const torch::Tensor& dt_bias,
            const torch::Tensor& ssm_state, torch::Tensor& replay_state, const torch::Tensor& query_start_loc,
            const std::optional<torch::Tensor>& token_indx, const torch::Tensor& state_indices, const std::optional<torch::Tensor>& record_indices, int64_t null_block_id) {
  TORCH_CHECK(q.is_contiguous() && k.is_contiguous() && v.is_contiguous() && b.is_contiguous() && a.is_contiguous(),
              "q, k, v, b and a must be contiguous");
  TORCH_CHECK(core_attn_out.is_contiguous(), "core_attn_out must be contiguous");
  TORCH_CHECK(replay_state.scalar_type() == at::kFloat && replay_state.dim() == 4, "replay_state fp32 [rows,HV,T,V+K+1]");
  TORCH_CHECK(state_indices.dim() == 1 && state_indices.scalar_type() == at::kInt, "state_indices int32 [n]");
  TORCH_CHECK(query_start_loc.scalar_type() == at::kInt, "query_start_loc int32");
  if (record_indices.has_value()) TORCH_CHECK(record_indices->scalar_type() == at::kInt && record_indices->is_contiguous(), "record_indices int32");
  if (state_indices.size(0) == 0) return;
  auto& queue = c10::xpu::getCurrentXPUStream().queue();
  gdn::gated_delta_rule_recoverssm(queue, core_attn_out, q, k, v, b, a, A_log, dt_bias, ssm_state, replay_state,
                                   query_start_loc, token_indx, state_indices, record_indices, null_block_id);
}

static void check_common(const torch::Tensor& core_attn_out, const torch::Tensor& q, const torch::Tensor& k,
                         const torch::Tensor& v, const torch::Tensor& b, const torch::Tensor& a,
                         const torch::Tensor& replay_state, const torch::Tensor& query_start_loc,
                         const torch::Tensor& state_indices, const std::optional<torch::Tensor>& record_indices) {
  TORCH_CHECK(q.is_contiguous() && k.is_contiguous() && v.is_contiguous() && b.is_contiguous() && a.is_contiguous(),
              "q, k, v, b and a must be contiguous");
  TORCH_CHECK(core_attn_out.is_contiguous(), "core_attn_out must be contiguous");
  TORCH_CHECK(replay_state.scalar_type() == at::kFloat && replay_state.dim() == 4, "replay_state fp32 [rows,HV,T,V+K+1]");
  TORCH_CHECK(state_indices.dim() == 1 && state_indices.scalar_type() == at::kInt, "state_indices int32 [n]");
  TORCH_CHECK(query_start_loc.scalar_type() == at::kInt, "query_start_loc int32");
  if (record_indices.has_value()) TORCH_CHECK(record_indices->scalar_type() == at::kInt && record_indices->is_contiguous(), "record_indices int32");
}

// verify with the window's inputs staged in SLM first (K8V4_RSSM_VERIFY=slm; rssm_verify_slm.hpp): same contract,
// same bits, windows of at most 16 tokens.
void verify_slm(torch::Tensor& core_attn_out, const torch::Tensor& q, const torch::Tensor& k, const torch::Tensor& v,
                const torch::Tensor& b, const torch::Tensor& a, const torch::Tensor& A_log, const torch::Tensor& dt_bias,
                const torch::Tensor& ssm_state, torch::Tensor& replay_state, const torch::Tensor& query_start_loc,
                const std::optional<torch::Tensor>& token_indx, const torch::Tensor& state_indices,
                const std::optional<torch::Tensor>& record_indices, int64_t null_block_id) {
  check_common(core_attn_out, q, k, v, b, a, replay_state, query_start_loc, state_indices, record_indices);
  if (state_indices.size(0) == 0) return;
  auto& queue = c10::xpu::getCurrentXPUStream().queue();
  k8v4_rssm::verify_slm(queue, core_attn_out, q, k, v, b, a, A_log, dt_bias, ssm_state, replay_state, query_start_loc,
                        token_indx, state_indices, record_indices, null_block_id, std::nullopt, std::nullopt);
}

// The deferred commit (K8V4_RSSM_DEFER_COMMIT=1; rssm_verify_slm.hpp): verify_slm that first folds the slot's
// pending accepted records (pending[slot] of them, in replay half parity[slot] ^ 1) into its state block, writes
// that state once, and writes this step's records to half parity[slot]. replay_state: [2 x slots, HV, T, V+K+1].
void verify_deferred(torch::Tensor& core_attn_out, const torch::Tensor& q, const torch::Tensor& k,
                     const torch::Tensor& v, const torch::Tensor& b, const torch::Tensor& a, const torch::Tensor& A_log,
                     const torch::Tensor& dt_bias, torch::Tensor& ssm_state, torch::Tensor& replay_state,
                     const torch::Tensor& query_start_loc, const std::optional<torch::Tensor>& token_indx,
                     const torch::Tensor& state_indices, const torch::Tensor& record_indices, int64_t null_block_id,
                     const torch::Tensor& pending, const torch::Tensor& parity) {
  check_common(core_attn_out, q, k, v, b, a, replay_state, query_start_loc, state_indices, record_indices);
  if (state_indices.size(0) == 0) return;
  auto& queue = c10::xpu::getCurrentXPUStream().queue();
  k8v4_rssm::verify_slm(queue, core_attn_out, q, k, v, b, a, A_log, dt_bias, ssm_state, replay_state, query_start_loc,
                        token_indx, state_indices, record_indices, null_block_id, pending, parity);
}

TORCH_LIBRARY(_k8v4_rssm, m) {
  m.def("verify(Tensor! core_attn_out, Tensor q, Tensor k, Tensor v, Tensor b, Tensor a, Tensor A_log, "
        "Tensor dt_bias, Tensor ssm_state, Tensor! replay_state, Tensor query_start_loc, Tensor? token_indx, "
        "Tensor state_indices, Tensor? record_indices, int null_block_id) -> ()");
  m.def("verify_slm(Tensor! core_attn_out, Tensor q, Tensor k, Tensor v, Tensor b, Tensor a, Tensor A_log, "
        "Tensor dt_bias, Tensor ssm_state, Tensor! replay_state, Tensor query_start_loc, Tensor? token_indx, "
        "Tensor state_indices, Tensor? record_indices, int null_block_id) -> ()");
  m.def("verify_deferred(Tensor! core_attn_out, Tensor q, Tensor k, Tensor v, Tensor b, Tensor a, Tensor A_log, "
        "Tensor dt_bias, Tensor! ssm_state, Tensor! replay_state, Tensor query_start_loc, Tensor? token_indx, "
        "Tensor state_indices, Tensor record_indices, int null_block_id, Tensor pending, Tensor parity) -> ()");
}
TORCH_LIBRARY_IMPL(_k8v4_rssm, XPU, m) {
  m.impl("verify", &verify);
  m.impl("verify_slm", &verify_slm);
  m.impl("verify_deferred", &verify_deferred);
}
