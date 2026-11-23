#pragma once
// K8V4_RSSM_VERIFY=slm: the RecoverSSM verify of gated_delta_rule_recoverssm.hpp (vllm-xpu-kernels v0.1.17,
// Apache-2.0) with the per-token inputs staged in shared local memory before the recurrence.
//
// The stock kernel runs every work-group's token loop as one dependent chain: each token first loads q, k, v, b and
// a from global memory, reduces the q / k norms across the sub-group, and only then touches the state, so every
// token pays a global-load round trip and two norm reductions on the critical path, in every sub-group (8 per
// work-group, all recomputing the same norms). Here the work-group loads the window's inputs once, up front and in
// parallel with the state load: sub-group s normalises token s (the same code as the stock loop, so the same
// floats) into SLM and writes its k / decay replay record, and the value slices go to SLM too. The token loop then
// reads SLM only and keeps the stock arithmetic (state decay, correction, update, output, in the same order), so
// the outputs and the replay records are bit-identical to the stock kernel.
//
// defer = true (K8V4_RSSM_DEFER_COMMIT=1): the deferred commit. The replay buffer has two halves per request slot
// (parity[slot] picks the one this step writes); the commit after sampling no longer folds a window that stays in
// its state block into the checkpoint but leaves pending[slot] accepted records in that step's half. The next
// verify of the slot first folds them into the state it has just loaded, with the commit kernel's own update
// (fma(c, k, h * decay)) and its rounding to the state dtype, writes that state back once and verifies from it:
// the same floats as commit-then-verify, without the commit's separate read and write of the state.
#include <sycl/sycl.hpp>
#include <torch/all.h>

#include "gated_delta_rule.hpp"

namespace k8v4_rssm {

using gdn::sub_group_size;

template <typename T, typename StateT, int k_bucket_size, int max_t, bool defer>
struct verify_slm_kernel {
  static constexpr int group_size = 256;
  static constexpr int sg_per_group = group_size / sub_group_size;
  static constexpr int v_dim_per_sg = 4;
  static constexpr int v_dim_per_group = v_dim_per_sg * sg_per_group;
  static constexpr int head_k = k_bucket_size * sub_group_size;
  static constexpr float eps = 0.000001;
  // SLM: normalised q and k [max_t][head_k], this work-group's value slice [max_t][v_dim_per_group], beta, decay.
  static constexpr int slm_q = 0;
  static constexpr int slm_k = slm_q + max_t * head_k;
  static constexpr int slm_v = slm_k + max_t * head_k;
  static constexpr int slm_beta = slm_v + max_t * v_dim_per_group;
  static constexpr int slm_g = slm_beta + max_t;
  // defer: the pending records' keys [max_t][head_k], corrections of this V slice, decays
  static constexpr int slm_pk = slm_g + max_t;
  static constexpr int slm_pc = slm_pk + (defer ? max_t * head_k : 0);
  static constexpr int slm_pd = slm_pc + (defer ? max_t * v_dim_per_group : 0);
  static constexpr int slm_floats = slm_pd + (defer ? max_t : 0);

  T* core_attn_out;
  const T* q;
  const T* k;
  const T* v;
  const T* b;
  const T* a;
  const float* A_log;
  const T* dt_bias;
  StateT* ssm_state;
  int64_t ssm_state_stride_0;
  float* replay_state;
  int64_t replay_stride_0, replay_stride_1, replay_stride_2, replay_stride_3;
  const int* query_start_loc;
  const int* token_indx;
  const int* state_indices;
  const int* record_indices;
  int null_block_id;
  const int* pending;  // defer: accepted records not yet folded, per request slot
  const int* parity;   // defer: replay half this step writes, per request slot
  int64_t slot_rows;   // defer: rows of one replay half
  int num_k_heads, head_k_dim, num_v_heads, head_v_dim;
  sycl::local_accessor<float, 1> slm;

  static inline float act_sigmoid(float& x) { return 1.0f / (1.0f + sycl::exp(-x)); }

  static inline float act_softplus(float& x, float beta = 1.0f, float threshold = 20.0f) {
    if (beta * x < threshold) {
      return sycl::log(1.0f + sycl::exp(beta * x)) / beta;
    } else
      return x;
  }

  static inline sycl::nd_range<3> get_nd_range(const int num_spec_decodes, const int num_v_heads,
                                               const int head_v_dim) {
    int num_v_bucket = (head_v_dim + v_dim_per_group - 1) / v_dim_per_group;
    sycl::range<3> local(1, 1, group_size);
    sycl::range<3> global(num_spec_decodes, num_v_heads, num_v_bucket);
    return sycl::nd_range<3>(global * local, local);
  }

  [[sycl::reqd_sub_group_size(sub_group_size)]] void operator()(sycl::nd_item<3> item) const {
    const int batch_id = item.get_group(0);
    const int num_v_heads_id = item.get_group(1);
    const int v_bucket_id = item.get_group(2);
    auto sg = item.get_sub_group();
    const int sg_id = sg.get_group_id();
    const int sg_local_id = sg.get_local_id();
    const int local_id = item.get_local_id(2);

    const int kv_ratio = num_v_heads / num_k_heads;
    const int head_v_dim_id = v_bucket_id * v_dim_per_group + sg_id * v_dim_per_sg;
    const int token_start = query_start_loc[batch_id];
    const int token_end = query_start_loc[batch_id + 1];
    const int n_tok = token_end - token_start;
    const int state_idx = state_indices[batch_id];

    if (state_idx <= null_block_id) {  // whole work-group: same batch row
      if (sg_local_id == 0) {
        for (int t = token_start; t < token_end; ++t) {
          const int global_t = (token_indx != nullptr) ? token_indx[t] : t;
#pragma unroll
          for (int i = 0; i < v_dim_per_sg; ++i) {
            core_attn_out[static_cast<int64_t>(global_t) * num_v_heads * head_v_dim + num_v_heads_id * head_v_dim +
                          head_v_dim_id + i] = T(0.0f);
          }
        }
      }
      return;
    }

    const float scale = 1.0f / sycl::sqrt(float(head_k_dim));
    float A_log_local = A_log[num_v_heads_id];
    float dt_bias_local = dt_bias[num_v_heads_id];
    A_log_local = -sycl::exp(A_log_local);

    float state_local[v_dim_per_sg * k_bucket_size];
    float q_local[k_bucket_size];
    float k_local[k_bucket_size];
    float v_local[v_dim_per_sg];

    StateT* init_state_ptr = ssm_state + static_cast<int64_t>(state_idx) * ssm_state_stride_0;
#pragma unroll
    for (int j = 0; j < v_dim_per_sg; ++j) {
#pragma unroll
      for (int i = 0; i < k_bucket_size; ++i) {
        state_local[j * k_bucket_size + i] = static_cast<float>(
            init_state_ptr[num_v_heads_id * head_k_dim * head_v_dim + (k_bucket_size * sg_local_id + i) +
                           (head_v_dim_id + j) * head_k_dim]);
      }
    }

    int record_row = record_indices ? record_indices[batch_id] : state_idx;
    int n_prev = 0;
    float* s = slm.template get_multi_ptr<sycl::access::decorated::no>().get();
    if constexpr (defer) {
      const int slot = record_row;
      const int p = parity[slot];
      record_row = p * slot_rows + slot;
      n_prev = pending[slot];
      const float* prev_base = replay_state + static_cast<int64_t>((p ^ 1) * slot_rows + slot) * replay_stride_0 +
                               static_cast<int64_t>(num_v_heads_id) * replay_stride_1;
      for (int e = local_id; e < n_prev * head_k; e += group_size) {
        const int tp = e / head_k;
        s[slm_pk + e] = prev_base[static_cast<int64_t>(tp) * replay_stride_2 +
                                  static_cast<int64_t>(head_v_dim + e - tp * head_k) * replay_stride_3];
      }
      for (int e = local_id; e < n_prev * v_dim_per_group; e += group_size) {
        const int tp = e / v_dim_per_group;
        s[slm_pc + e] = prev_base[static_cast<int64_t>(tp) * replay_stride_2 +
                                  static_cast<int64_t>(v_bucket_id * v_dim_per_group + e - tp * v_dim_per_group) *
                                      replay_stride_3];
      }
      if (local_id < n_prev) {
        s[slm_pd + local_id] = prev_base[static_cast<int64_t>(local_id) * replay_stride_2 +
                                         static_cast<int64_t>(head_v_dim + head_k_dim) * replay_stride_3];
      }
    }
    float* replay_base = replay_state + static_cast<int64_t>(record_row) * replay_stride_0 +
                         static_cast<int64_t>(num_v_heads_id) * replay_stride_1;

    // -- Stage the window: sub-group tl normalises token tl (stock loop code) ---------------------------------
    for (int tl = sg_id; tl < n_tok; tl += sg_per_group) {
      const int t = token_start + tl;
      float b_local = static_cast<float>(b[t * num_v_heads + num_v_heads_id]);
      float beta = act_sigmoid(b_local);
      float a_local = static_cast<float>(a[t * num_v_heads + num_v_heads_id]) + dt_bias_local;
      float g = sycl::exp(A_log_local * act_softplus(a_local));

      float q_sum = 0.0f;
      float k_sum = 0.0f;
#pragma unroll
      for (int i = 0; i < k_bucket_size; ++i) {
        q_local[i] = q[t * num_k_heads * head_k_dim + (num_v_heads_id / kv_ratio) * head_k_dim +
                       (k_bucket_size * sg_local_id + i)];
        k_local[i] = k[t * num_k_heads * head_k_dim + (num_v_heads_id / kv_ratio) * head_k_dim +
                       (k_bucket_size * sg_local_id + i)];
        q_sum += q_local[i] * q_local[i];
        k_sum += k_local[i] * k_local[i];
      }
      q_sum = sycl::reduce_over_group(sg, q_sum, sycl::plus<>());
      k_sum = sycl::reduce_over_group(sg, k_sum, sycl::plus<>());
      q_sum += eps;
      k_sum += eps;
#pragma unroll
      for (int i = 0; i < k_bucket_size; ++i) {
        q_local[i] /= sycl::sqrt(q_sum);
        q_local[i] *= scale;
        k_local[i] /= sycl::sqrt(k_sum);
        s[slm_q + tl * head_k + k_bucket_size * sg_local_id + i] = q_local[i];
        s[slm_k + tl * head_k + k_bucket_size * sg_local_id + i] = k_local[i];
      }
      if (sg_local_id == 0) {
        s[slm_beta + tl] = beta;
        s[slm_g + tl] = g;
      }
      // k and the decay are shared by every V slice of this head; the first V bucket writes them.
      if (v_bucket_id == 0) {
        float* rec = replay_base + static_cast<int64_t>(tl) * replay_stride_2;
#pragma unroll
        for (int i = 0; i < k_bucket_size; ++i) {
          rec[static_cast<int64_t>(head_v_dim + k_bucket_size * sg_local_id + i) * replay_stride_3] = k_local[i];
        }
        if (sg_local_id == 0) {
          rec[static_cast<int64_t>(head_v_dim + head_k_dim) * replay_stride_3] = g;
        }
      }
    }
    for (int e = local_id; e < n_tok * v_dim_per_group; e += group_size) {
      const int tl = e / v_dim_per_group;
      const int c = e - tl * v_dim_per_group;
      s[slm_v + e] = static_cast<float>(v[static_cast<int64_t>(token_start + tl) * num_v_heads * head_v_dim +
                                          num_v_heads_id * head_v_dim + v_bucket_id * v_dim_per_group + c]);
    }
    sycl::group_barrier(item.get_group());

    if constexpr (defer) {
      if (n_prev > 0) {
        // The commit's fold (rssm_gdn._commit_gdn_state_kernel) over the pending records, then its store.
        for (int tp = 0; tp < n_prev; ++tp) {
          const float d = s[slm_pd + tp];
#pragma unroll
          for (int j = 0; j < v_dim_per_sg; ++j) {
            const float c = s[slm_pc + tp * v_dim_per_group + sg_id * v_dim_per_sg + j];
#pragma unroll
            for (int i = 0; i < k_bucket_size; ++i) {
              const float kk = s[slm_pk + tp * head_k + k_bucket_size * sg_local_id + i];
              state_local[j * k_bucket_size + i] = sycl::fma(c, kk, state_local[j * k_bucket_size + i] * d);
            }
          }
        }
#pragma unroll
        for (int j = 0; j < v_dim_per_sg; ++j) {
#pragma unroll
          for (int i = 0; i < k_bucket_size; ++i) {
            const StateT h = static_cast<StateT>(state_local[j * k_bucket_size + i]);
            init_state_ptr[num_v_heads_id * head_k_dim * head_v_dim + (k_bucket_size * sg_local_id + i) +
                           (head_v_dim_id + j) * head_k_dim] = h;
            state_local[j * k_bucket_size + i] = static_cast<float>(h);
          }
        }
      }
    }

    // -- Recurrence over the window, SLM inputs only (stock arithmetic) ---------------------------------------
    for (int tl = 0; tl < n_tok; ++tl) {
      const int t = token_start + tl;
#pragma unroll
      for (int i = 0; i < k_bucket_size; ++i) {
        q_local[i] = s[slm_q + tl * head_k + k_bucket_size * sg_local_id + i];
        k_local[i] = s[slm_k + tl * head_k + k_bucket_size * sg_local_id + i];
      }
      const float beta = s[slm_beta + tl];
      const float g = s[slm_g + tl];

      float kv_mem[v_dim_per_sg];
#pragma unroll
      for (int i = 0; i < v_dim_per_sg; ++i) {
        kv_mem[i] = 0.0f;
      }
#pragma unroll
      for (int j = 0; j < v_dim_per_sg; ++j) {
#pragma unroll
        for (int i = 0; i < k_bucket_size; ++i) {
          state_local[j * k_bucket_size + i] *= g;
          kv_mem[j] += state_local[j * k_bucket_size + i] * k_local[i];
        }
      }
#pragma unroll
      for (int i = 0; i < v_dim_per_sg; ++i) {
        kv_mem[i] = sycl::reduce_over_group(sg, kv_mem[i], sycl::plus<>());
      }
#pragma unroll
      for (int i = 0; i < v_dim_per_sg; ++i) {
        v_local[i] = s[slm_v + tl * v_dim_per_group + sg_id * v_dim_per_sg + i];
      }
      float delta[v_dim_per_sg];
#pragma unroll
      for (int i = 0; i < v_dim_per_sg; ++i) {
        delta[i] = (v_local[i] - kv_mem[i]) * beta;
      }
      float res[v_dim_per_sg];
#pragma unroll
      for (int i = 0; i < v_dim_per_sg; ++i) {
        res[i] = 0.0f;
      }
#pragma unroll
      for (int j = 0; j < v_dim_per_sg; ++j) {
#pragma unroll
        for (int i = 0; i < k_bucket_size; ++i) {
          state_local[j * k_bucket_size + i] += k_local[i] * delta[j];
          res[j] += state_local[j * k_bucket_size + i] * q_local[i];
        }
      }
#pragma unroll
      for (int i = 0; i < v_dim_per_sg; ++i) {
        res[i] = sycl::reduce_over_group(sg, res[i], sycl::plus<>());
      }
      float* rec = replay_base + static_cast<int64_t>(tl) * replay_stride_2;
      if (sg_local_id == 0) {
        const int global_t = (token_indx != nullptr) ? token_indx[t] : t;
#pragma unroll
        for (int i = 0; i < v_dim_per_sg; ++i) {
          core_attn_out[static_cast<int64_t>(global_t) * num_v_heads * head_v_dim + num_v_heads_id * head_v_dim +
                        head_v_dim_id + i] = res[i];
          rec[static_cast<int64_t>(head_v_dim_id + i) * replay_stride_3] = delta[i];
        }
      }
    }
  }
};

template <typename T, typename StateT, int k_bucket_size, int max_t, bool defer>
void launch_verify_slm(sycl::queue& queue, torch::Tensor& core_attn_out, const torch::Tensor& q,
                       const torch::Tensor& k, const torch::Tensor& v, const torch::Tensor& b,
                       const torch::Tensor& a, const torch::Tensor& A_log, const torch::Tensor& dt_bias,
                       const torch::Tensor& ssm_state, torch::Tensor& replay_state,
                       const torch::Tensor& query_start_loc, const std::optional<torch::Tensor>& token_indx,
                       const torch::Tensor& state_indices, const std::optional<torch::Tensor>& record_indices,
                       int64_t null_block_id, const int* pending, const int* parity, int64_t slot_rows) {
  using K = verify_slm_kernel<T, StateT, k_bucket_size, max_t, defer>;
  const int num_spec_decodes = state_indices.size(0);
  const int num_v_heads = v.size(1);
  const int head_v_dim = v.size(2);
  TORCH_CHECK(head_v_dim % K::v_dim_per_group == 0, "head_v_dim must be a multiple of ", K::v_dim_per_group);
  auto range = K::get_nd_range(num_spec_decodes, num_v_heads, head_v_dim);
  queue.submit([&](sycl::handler& cgh) {
    K task{reinterpret_cast<T*>(core_attn_out.data_ptr()),
           reinterpret_cast<const T*>(q.data_ptr()),
           reinterpret_cast<const T*>(k.data_ptr()),
           reinterpret_cast<const T*>(v.data_ptr()),
           reinterpret_cast<const T*>(b.data_ptr()),
           reinterpret_cast<const T*>(a.data_ptr()),
           reinterpret_cast<const float*>(A_log.data_ptr()),
           reinterpret_cast<const T*>(dt_bias.data_ptr()),
           reinterpret_cast<StateT*>(ssm_state.data_ptr()),
           ssm_state.stride(0),
           reinterpret_cast<float*>(replay_state.data_ptr()),
           replay_state.stride(0),
           replay_state.stride(1),
           replay_state.stride(2),
           replay_state.stride(3),
           reinterpret_cast<const int*>(query_start_loc.data_ptr()),
           token_indx.has_value() ? reinterpret_cast<const int*>(token_indx->data_ptr()) : nullptr,
           reinterpret_cast<const int*>(state_indices.data_ptr()),
           record_indices.has_value() ? reinterpret_cast<const int*>(record_indices->data_ptr()) : nullptr,
           static_cast<int>(null_block_id),
           pending,
           parity,
           slot_rows,
           static_cast<int>(q.size(1)),
           static_cast<int>(q.size(2)),
           num_v_heads,
           head_v_dim,
           sycl::local_accessor<float, 1>(sycl::range<1>(K::slm_floats), cgh)};
    cgh.parallel_for(range, task);
  });
}

// Same contract as gdn::gated_delta_rule_recoverssm (+ record_indices); windows of at most 16 tokens (the replay
// buffer's position count bounds every window). The SLM layout is sized by that count: buffers of up to 8
// positions (MTP depth <= 7) launch the max_t = 8 kernel exactly as before; 9-16 (deep copy drafting, depth 15)
// launch max_t = 16, the same code with a larger staging area (29 KB of SLM with the deferred commit). pending / parity given: the deferred commit (see above).
inline void verify_slm(sycl::queue& queue, torch::Tensor& core_attn_out, const torch::Tensor& q,
                       const torch::Tensor& k, const torch::Tensor& v, const torch::Tensor& b,
                       const torch::Tensor& a, const torch::Tensor& A_log, const torch::Tensor& dt_bias,
                       const torch::Tensor& ssm_state, torch::Tensor& replay_state,
                       const torch::Tensor& query_start_loc, const std::optional<torch::Tensor>& token_indx,
                       const torch::Tensor& state_indices, const std::optional<torch::Tensor>& record_indices,
                       int64_t null_block_id, const std::optional<torch::Tensor>& pending,
                       const std::optional<torch::Tensor>& parity) {
  const int num_k_heads = q.size(1);
  const int head_k_dim = q.size(2);
  const int num_v_heads = v.size(1);
  TORCH_CHECK(num_v_heads % num_k_heads == 0);
  TORCH_CHECK(head_k_dim == 4 * sub_group_size, "verify_slm is built for head_k_dim ", 4 * sub_group_size);
  TORCH_CHECK(replay_state.size(2) <= 16, "verify_slm takes windows of at most 16 tokens");
  const bool wide = replay_state.size(2) > 8;
  const bool defer = pending.has_value();
  TORCH_CHECK(defer == parity.has_value(), "the deferred commit needs both pending and parity");
  int64_t slot_rows = 0;
  if (defer) {
    TORCH_CHECK(record_indices.has_value(), "the deferred commit needs record_indices (request slots)");
    TORCH_CHECK(pending->scalar_type() == at::kInt && parity->scalar_type() == at::kInt && pending->is_contiguous() &&
                    parity->is_contiguous() && pending->numel() == parity->numel(),
                "pending and parity: int32 [slots]");
    slot_rows = pending->numel();
    TORCH_CHECK(replay_state.size(0) == 2 * slot_rows, "the deferred commit needs a replay buffer of 2 x slots rows");
  }
  const int* pend = defer ? reinterpret_cast<const int*>(pending->data_ptr()) : nullptr;
  const int* par = defer ? reinterpret_cast<const int*>(parity->data_ptr()) : nullptr;
#define K8V4_SLM_LAUNCH_T(scalar_t, state_t, max_t)                                                              \
  do {                                                                                                          \
    if (defer)                                                                                                  \
      launch_verify_slm<scalar_t, state_t, 4, max_t, true>(queue, core_attn_out, q, k, v, b, a, A_log, dt_bias,   \
                                                           ssm_state, replay_state, query_start_loc, token_indx,   \
                                                           state_indices, record_indices, null_block_id, pend,     \
                                                           par, slot_rows);                                       \
    else                                                                                                        \
      launch_verify_slm<scalar_t, state_t, 4, max_t, false>(queue, core_attn_out, q, k, v, b, a, A_log, dt_bias,  \
                                                            ssm_state, replay_state, query_start_loc, token_indx,  \
                                                            state_indices, record_indices, null_block_id, nullptr, \
                                                            nullptr, 0);                                          \
  } while (0)
#define K8V4_SLM_LAUNCH(scalar_t, state_t)                                                                       \
  do {                                                                                                          \
    if (wide)                                                                                                   \
      K8V4_SLM_LAUNCH_T(scalar_t, state_t, 16);                                                                 \
    else                                                                                                        \
      K8V4_SLM_LAUNCH_T(scalar_t, state_t, 8);                                                                  \
  } while (0)
#define K8V4_SLM_STATE(scalar_t)                                                                                 \
  do {                                                                                                          \
    if (ssm_state.scalar_type() == at::kFloat) {                                                                 \
      K8V4_SLM_LAUNCH(scalar_t, float);                                                                          \
    } else if (ssm_state.scalar_type() == at::kBFloat16) {                                                       \
      K8V4_SLM_LAUNCH(scalar_t, sycl::ext::oneapi::bfloat16);                                                    \
    } else if (ssm_state.scalar_type() == at::kHalf) {                                                           \
      K8V4_SLM_LAUNCH(scalar_t, sycl::half);                                                                     \
    } else {                                                                                                    \
      TORCH_CHECK(false, "ssm_state dtype must be float32/float16/bfloat16, got ", ssm_state.scalar_type());     \
    }                                                                                                           \
  } while (0)
  if (core_attn_out.scalar_type() == at::kBFloat16) {
    K8V4_SLM_STATE(sycl::ext::oneapi::bfloat16);
  } else if (core_attn_out.scalar_type() == at::kHalf) {
    K8V4_SLM_STATE(sycl::half);
  } else {
    K8V4_SLM_STATE(float);
  }
#undef K8V4_SLM_STATE
#undef K8V4_SLM_LAUNCH
#undef K8V4_SLM_LAUNCH_T
}

}  // namespace k8v4_rssm
