// QSA kernels for torch.ops.xe2_qsa. This is not libxe2_kv.so and it does
// not change the K8/V4 page stride.
//
// qsa_score: sum of relu(q · k) over 4 indexer heads. No 1/sqrt(128).
//   One subgroup of 16 owns a (query, block) pair, 8 fp32 values per lane.
//   An ESIMD variant does the same reduction when the header is compiled in
//   and QSA_SCORE_ESIMD=1.
// qsa_topk: k largest scores. Ties keep the lower block id.
// qsa_visible: those blocks expanded to ascending token cells, plus the
//   query's own block. -1 pads the row. Same list as the Python reference.
// qsa_sparse_attn: INT8 K / INT4 V attention over an explicit token list.
//   Q is quantized with amax/127 and rint, matching the dense kernel.
//   Score is int_dot * q_scale * k_scale * (1/16). Online softmax, then
//   the affine int4 V mix. Low nibble is the even dimension.

#include <sycl/sycl.hpp>

#include <ATen/ATen.h>
#include <c10/xpu/XPUStream.h>
#include <torch/library.h>

#include <cstdint>
#include <cstdlib>
#include <functional>

#if !defined(QSA_NO_ESIMD)
#include <sycl/ext/intel/esimd.hpp>
#endif

namespace {

static constexpr int D_ATTN = 256;
static constexpr int D_IDX = 128;
static constexpr int IDX_HEADS = 4;
static constexpr int PAGE = 64;
static constexpr int V4_COLS = 128;
static constexpr int SG = 16;
static constexpr float INV_SQRT_D = 0.0625f;

static sycl::queue &current_xpu_queue() { return c10::xpu::getCurrentXPUStream().queue(); }

static bool env_is_1(const char *name) {
  const char *v = std::getenv(name);
  return v != nullptr && v[0] == '1' && v[1] == '\0';
}

static void check_xpu(const at::Tensor &t, const char *name) {
  TORCH_CHECK(t.is_xpu(), name, " must be XPU");
}

struct Stride4 {
  int64_t s0, s1, s2, s3;
};

static Stride4 strides_of(const at::Tensor &t) {
  Stride4 out{1, 1, 1, 1};
  if (t.dim() > 0) out.s0 = t.stride(0);
  if (t.dim() > 1) out.s1 = t.stride(1);
  if (t.dim() > 2) out.s2 = t.stride(2);
  if (t.dim() > 3) out.s3 = t.stride(3);
  return out;
}

static void launch_score_subgroup(sycl::queue &q, const float *query, const float *pooled,
                                  float *scores, int n_query, int n_blocks) {
  if (n_query < 1 || n_blocks < 1) return;
  const size_t groups = static_cast<size_t>(n_query) * static_cast<size_t>(n_blocks);
  sycl::range<1> local(SG);
  sycl::range<1> global(groups * SG);
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(global, local),
                   [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG)]] {
                     const int pair = static_cast<int>(item.get_group(0));
                     const int query_i = pair / n_blocks;
                     const int block = pair - query_i * n_blocks;
                     auto sg = item.get_sub_group();
                     const int lane = static_cast<int>(sg.get_local_id());
                     float total = 0.f;
                     for (int head = 0; head < IDX_HEADS; ++head) {
                       const float *qv =
                           query + (static_cast<size_t>(query_i) * IDX_HEADS + head) * D_IDX +
                           static_cast<size_t>(lane) * 8;
                       const float *kv =
                           pooled + static_cast<size_t>(block) * D_IDX + static_cast<size_t>(lane) * 8;
                       float partial = 0.f;
#pragma unroll
                       for (int i = 0; i < 8; ++i) partial += qv[i] * kv[i];
                       const float dot =
                           sycl::reduce_over_group(sg, partial, sycl::plus<float>());
                       total += sycl::fmax(dot, 0.f);
                     }
                     if (lane == 0) {
                       scores[static_cast<size_t>(query_i) * n_blocks + block] = total;
                     }
                   });
  });
}

#if !defined(QSA_NO_ESIMD)
static void launch_score_esimd(sycl::queue &q, const float *query, const float *pooled,
                               float *scores, int n_query, int n_blocks) {
  if (n_query < 1 || n_blocks < 1) return;
  namespace es = sycl::ext::intel::esimd;
  const size_t n = static_cast<size_t>(n_query) * static_cast<size_t>(n_blocks);
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>(n), [=](sycl::id<1> id) SYCL_ESIMD_KERNEL {
      const int pair = static_cast<int>(id);
      const int query_i = pair / n_blocks;
      const int block = pair - query_i * n_blocks;
      float total = 0.f;
      for (int head = 0; head < IDX_HEADS; ++head) {
        const float *qv =
            query + (static_cast<size_t>(query_i) * IDX_HEADS + head) * D_IDX;
        const float *kv = pooled + static_cast<size_t>(block) * D_IDX;
        float dot = 0.f;
        for (int base = 0; base < D_IDX; base += 8) {
          es::simd<float, 8> qv8 = es::block_load<float, 8>(qv + base);
          es::simd<float, 8> kv8 = es::block_load<float, 8>(kv + base);
          dot += es::reduce<float>(qv8 * kv8, std::plus<>{});
        }
        total += dot > 0.f ? dot : 0.f;
      }
      scores[static_cast<size_t>(query_i) * n_blocks + block] = total;
    });
  });
}
#endif

static void launch_topk(sycl::queue &q, const float *scores, int32_t *ids, int n_query,
                        int n_blocks, int k) {
  if (n_query < 1) return;
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>(static_cast<size_t>(n_query)), [=](sycl::id<1> id) {
      const int query_i = static_cast<int>(id);
      const float *row = scores + static_cast<size_t>(query_i) * n_blocks;
      int32_t *dst = ids + static_cast<size_t>(query_i) * k;
      // chosen is a scratch of block ids already emitted. k is small enough
      // for the budget of 512; the scan is correct, not a radix select.
      for (int slot = 0; slot < k; ++slot) {
        int best = -1;
        float best_s = 0.f;
        for (int block = 0; block < n_blocks; ++block) {
          bool used = false;
          for (int prev = 0; prev < slot; ++prev) {
            if (dst[prev] == block) {
              used = true;
              break;
            }
          }
          if (used) continue;
          const float s = row[block];
          if (best < 0 || s > best_s) {
            best = block;
            best_s = s;
          }
        }
        dst[slot] = best;
      }
    });
  });
}

static int physical_page(const int32_t *block_row, int64_t block_stride, int token, int ratio) {
  const int logical = token / PAGE;
  if (ratio == 1) return block_row[static_cast<int64_t>(logical) * block_stride];
  const int entry = logical / ratio;
  const int sub = logical - entry * ratio;
  return block_row[static_cast<int64_t>(entry) * block_stride] * ratio + sub;
}

static void launch_sparse(sycl::queue &q, const void *query, bool query_fp16, float *out_fp32,
                          sycl::half *out_fp16, bool out_fp16_flag, const int8_t *k,
                          const float *k_scale, const uint8_t *v, const float *v_scale,
                          const float *v_zero, const int32_t *block_row, const int32_t *visible,
                          Stride4 qs, Stride4 ks, Stride4 kss, Stride4 vs, Stride4 vss, Stride4 vzs,
                          int64_t block_stride, int64_t vis_row, int64_t vis_col, int64_t out_q,
                          int64_t out_h, int64_t out_d, int q_len, int hq, int hkv, int max_vis,
                          int ratio, int seq_len) {
  const int n = q_len * hq;
  if (n < 1) return;
  const int group = hq / hkv;
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>(static_cast<size_t>(n)), [=](sycl::id<1> id) {
      const int flat = static_cast<int>(id);
      const int qi = flat / hq;
      const int head = flat - qi * hq;
      const int kv_head = head / group;

      float qf[D_ATTN];
      float amax = 0.f;
      for (int dim = 0; dim < D_ATTN; ++dim) {
        const int64_t idx = static_cast<int64_t>(qi) * qs.s0 + static_cast<int64_t>(head) * qs.s1 +
                            static_cast<int64_t>(dim) * qs.s2;
        float value;
        if (query_fp16) {
          value = static_cast<float>(reinterpret_cast<const sycl::half *>(query)[idx]);
        } else {
          value = reinterpret_cast<const float *>(query)[idx];
        }
        qf[dim] = value;
        amax = sycl::fmax(amax, sycl::fabs(value));
      }
      const float q_scale = (amax == 0.f) ? 0.f : (amax / 127.f);
      const float inv = (q_scale == 0.f) ? 0.f : (1.f / q_scale);
      int8_t q8[D_ATTN];
      for (int dim = 0; dim < D_ATTN; ++dim) {
        float rounded = sycl::rint(qf[dim] * inv);
        rounded = sycl::clamp(rounded, -127.f, 127.f);
        q8[dim] = static_cast<int8_t>(rounded);
      }

      float acc[D_ATTN];
      for (int dim = 0; dim < D_ATTN; ++dim) acc[dim] = 0.f;
      float running_max = -INFINITY;
      float running_sum = 0.f;
      const int32_t *vis = visible + static_cast<int64_t>(qi) * vis_row;

      for (int slot = 0; slot < max_vis; ++slot) {
        const int token = vis[static_cast<int64_t>(slot) * vis_col];
        if (token < 0) break;
        if (token >= seq_len) continue;
        const int page = physical_page(block_row, block_stride, token, ratio);
        const int offset = token - (token / PAGE) * PAGE;
        const int8_t *krow =
            k + (static_cast<int64_t>(page) * ks.s0 + static_cast<int64_t>(offset) * ks.s1 +
                 static_cast<int64_t>(kv_head) * ks.s2);
        int dot = 0;
        for (int dim = 0; dim < D_ATTN; ++dim) {
          dot += static_cast<int>(q8[dim]) * static_cast<int>(krow[static_cast<int64_t>(dim) * ks.s3]);
        }
        const int64_t scale_idx = static_cast<int64_t>(page) * kss.s0 +
                                  static_cast<int64_t>(offset) * kss.s1 +
                                  static_cast<int64_t>(kv_head) * kss.s2;
        const float score = static_cast<float>(dot) * q_scale * k_scale[scale_idx] * INV_SQRT_D;
        const float next_max = sycl::fmax(running_max, score);
        const float prev_scale = sycl::exp(running_max - next_max);
        const float weight = sycl::exp(score - next_max);
        running_sum = running_sum * prev_scale + weight;
        const int64_t v_base = static_cast<int64_t>(page) * vs.s0 +
                               static_cast<int64_t>(offset) * vs.s1 +
                               static_cast<int64_t>(kv_head) * vs.s2;
        const int64_t z_idx = static_cast<int64_t>(page) * vzs.s0 +
                              static_cast<int64_t>(offset) * vzs.s1 +
                              static_cast<int64_t>(kv_head) * vzs.s2;
        const int64_t vs_idx = static_cast<int64_t>(page) * vss.s0 +
                               static_cast<int64_t>(offset) * vss.s1 +
                               static_cast<int64_t>(kv_head) * vss.s2;
        const float zero = v_zero[z_idx];
        const float vscale = v_scale[vs_idx];
        for (int dim = 0; dim < D_ATTN; dim += 2) {
          const uint8_t byte = v[v_base + static_cast<int64_t>(dim / 2) * vs.s3];
          const float even = (static_cast<float>(byte & 0xF) - zero) * vscale;
          const float odd = (static_cast<float>(byte >> 4) - zero) * vscale;
          acc[dim] = acc[dim] * prev_scale + weight * even;
          acc[dim + 1] = acc[dim + 1] * prev_scale + weight * odd;
        }
        running_max = next_max;
      }
      const float inv_sum = (running_sum == 0.f) ? 0.f : (1.f / running_sum);
      for (int dim = 0; dim < D_ATTN; ++dim) {
        const float value = acc[dim] * inv_sum;
        const int64_t idx = static_cast<int64_t>(qi) * out_q + static_cast<int64_t>(head) * out_h +
                            static_cast<int64_t>(dim) * out_d;
        if (out_fp16_flag) {
          out_fp16[idx] = static_cast<sycl::half>(value);
        } else {
          out_fp32[idx] = value;
        }
      }
    });
  });
}

static int emit_block_tokens(int32_t *tokens, int written, int width, int block, int span,
                             int ratio, int cell) {
  if (block < 0 || span < 1) return written;
  const int start = block * ratio;
  for (int off = 0; off < span && written < width; ++off) {
    const int token = start + off;
    if (token <= cell) tokens[written++] = token;
  }
  return written;
}

static void launch_visible(sycl::queue &q, const float *scores, const int32_t *counts,
                           const int32_t *cells, int32_t *chosen, int32_t *out, int n_query,
                           int n_blocks, int k, int width, int ratio, int force) {
  if (n_query < 1) return;
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>(static_cast<size_t>(n_query)), [=](sycl::id<1> id) {
      const int query_i = static_cast<int>(id);
      const int count = counts[query_i];
      const int cell = cells[query_i];
      const int own = cell / ratio;
      const int own_width = cell % ratio + 1;
      int32_t *tokens = out + static_cast<int64_t>(query_i) * width;
      int written = 0;
      if (force || count <= k) {
        for (int block = 0; block < count; ++block) {
          written = emit_block_tokens(tokens, written, width, block, block == own ? own_width : ratio,
                                      ratio, cell);
        }
        if (own >= count) {
          written = emit_block_tokens(tokens, written, width, own, own_width, ratio, cell);
        }
        return;
      }
      int32_t *picked = chosen + static_cast<int64_t>(query_i) * k;
      const float *row = scores + static_cast<int64_t>(query_i) * n_blocks;
      for (int slot = 0; slot < k; ++slot) {
        int best = -1;
        float best_s = 0.f;
        for (int block = 0; block < count; ++block) {
          bool used = false;
          for (int prev = 0; prev < slot; ++prev) {
            if (picked[prev] == block) {
              used = true;
              break;
            }
          }
          if (used) continue;
          const float s = row[block];
          if (best < 0 || s > best_s) {
            best = block;
            best_s = s;
          }
        }
        picked[slot] = best;
      }
      for (int i = 1; i < k; ++i) {
        const int32_t value = picked[i];
        int j = i;
        while (j > 0 && picked[j - 1] > value) {
          picked[j] = picked[j - 1];
          --j;
        }
        picked[j] = value;
      }
      bool present = false;
      for (int i = 0; i < k; ++i) {
        if (picked[i] == own) present = true;
      }
      bool emitted_own = present;
      for (int i = 0; i < k; ++i) {
        if (!present && !emitted_own && own < picked[i]) {
          written = emit_block_tokens(tokens, written, width, own, own_width, ratio, cell);
          emitted_own = true;
        }
        const int block = picked[i];
        written = emit_block_tokens(tokens, written, width, block, block == own ? own_width : ratio,
                                    ratio, cell);
      }
      if (!present && !emitted_own) {
        written = emit_block_tokens(tokens, written, width, own, own_width, ratio, cell);
      }
    });
  });
}

static void qsa_visible(const at::Tensor &scores, const at::Tensor &counts, const at::Tensor &cells,
                        at::Tensor out, int64_t k, int64_t ratio, int64_t force) {
  check_xpu(scores, "scores");
  check_xpu(counts, "counts");
  check_xpu(cells, "cells");
  check_xpu(out, "out");
  TORCH_CHECK(scores.is_contiguous() && counts.is_contiguous() && cells.is_contiguous() &&
                  out.is_contiguous(),
              "qsa_visible tensors must be contiguous");
  TORCH_CHECK(scores.scalar_type() == at::kFloat, "qsa_visible scores are fp32");
  TORCH_CHECK(counts.scalar_type() == at::kInt && cells.scalar_type() == at::kInt &&
                  out.scalar_type() == at::kInt,
              "qsa_visible index dtypes");
  TORCH_CHECK(scores.dim() == 2 && counts.dim() == 1 && cells.dim() == 1 && out.dim() == 2,
              "qsa_visible ranks");
  TORCH_CHECK(k >= 1 && ratio >= 1, "qsa_visible k and ratio");
  TORCH_CHECK(counts.size(0) == scores.size(0) && cells.size(0) == scores.size(0) &&
                  out.size(0) == scores.size(0),
              "qsa_visible query count");
  TORCH_CHECK(out.size(1) >= 1, "qsa_visible width");
  const int n_query = static_cast<int>(scores.size(0));
  const int n_blocks = static_cast<int>(scores.size(1));
  TORCH_CHECK(n_blocks >= 1, "qsa_visible needs at least one score column");
  auto scratch = at::empty({scores.size(0), k}, scores.options().dtype(at::kInt));
  launch_visible(current_xpu_queue(), scores.data_ptr<float>(), counts.data_ptr<int32_t>(),
                 cells.data_ptr<int32_t>(), scratch.data_ptr<int32_t>(), out.data_ptr<int32_t>(),
                 n_query, n_blocks, static_cast<int>(k), static_cast<int>(out.size(1)),
                 static_cast<int>(ratio), force != 0 ? 1 : 0);
}

static void qsa_score(const at::Tensor &query, const at::Tensor &pooled, at::Tensor scores) {
  check_xpu(query, "query");
  check_xpu(pooled, "pooled");
  check_xpu(scores, "scores");
  TORCH_CHECK(query.is_contiguous() && pooled.is_contiguous() && scores.is_contiguous(),
              "qsa_score tensors must be contiguous");
  TORCH_CHECK(query.scalar_type() == at::kFloat && pooled.scalar_type() == at::kFloat &&
                  scores.scalar_type() == at::kFloat,
              "qsa_score is fp32");
  TORCH_CHECK(query.dim() == 3 && query.size(1) == IDX_HEADS && query.size(2) == D_IDX,
              "query is [queries, 4, 128]");
  TORCH_CHECK(pooled.dim() == 2 && pooled.size(1) == D_IDX, "pooled is [blocks, 128]");
  const int n_query = static_cast<int>(query.size(0));
  const int n_blocks = static_cast<int>(pooled.size(0));
  TORCH_CHECK(scores.sizes() == at::IntArrayRef({query.size(0), pooled.size(0)}),
              "scores is [queries, blocks]");
  auto &queue = current_xpu_queue();
#if !defined(QSA_NO_ESIMD)
  if (env_is_1("QSA_SCORE_ESIMD")) {
    launch_score_esimd(queue, query.data_ptr<float>(), pooled.data_ptr<float>(),
                       scores.data_ptr<float>(), n_query, n_blocks);
    return;
  }
#endif
  launch_score_subgroup(queue, query.data_ptr<float>(), pooled.data_ptr<float>(),
                        scores.data_ptr<float>(), n_query, n_blocks);
}

static void qsa_topk(const at::Tensor &scores, at::Tensor ids, int64_t k) {
  check_xpu(scores, "scores");
  check_xpu(ids, "ids");
  TORCH_CHECK(scores.is_contiguous() && ids.is_contiguous(), "qsa_topk tensors must be contiguous");
  TORCH_CHECK(scores.scalar_type() == at::kFloat && ids.scalar_type() == at::kInt, "qsa_topk dtypes");
  TORCH_CHECK(scores.dim() == 2 && ids.dim() == 2, "qsa_topk ranks");
  TORCH_CHECK(k >= 1 && ids.size(1) == k && ids.size(0) == scores.size(0), "qsa_topk shape");
  const int n_blocks = static_cast<int>(scores.size(1));
  TORCH_CHECK(n_blocks >= 1 && k <= n_blocks, "qsa_topk k is at most the block count");
  launch_topk(current_xpu_queue(), scores.data_ptr<float>(), ids.data_ptr<int32_t>(),
              static_cast<int>(scores.size(0)), n_blocks, static_cast<int>(k));
}

static void qsa_sparse_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &k_scale,
                            const at::Tensor &v, const at::Tensor &v_scale, const at::Tensor &v_zero,
                            const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                            int64_t pages_per_block, int64_t seq_len) {
  check_xpu(query, "query");
  check_xpu(k, "k");
  check_xpu(k_scale, "k_scale");
  check_xpu(v, "v");
  check_xpu(v_scale, "v_scale");
  check_xpu(v_zero, "v_zero");
  check_xpu(block_row, "block_row");
  check_xpu(visible, "visible");
  check_xpu(out, "out");
  TORCH_CHECK(query.dim() == 3 && query.size(2) == D_ATTN, "query is [tokens, heads, 256]");
  TORCH_CHECK(out.sizes() == query.sizes(), "out shape");
  TORCH_CHECK(query.scalar_type() == at::kFloat || query.scalar_type() == at::kHalf, "query dtype");
  TORCH_CHECK(out.scalar_type() == query.scalar_type(), "out dtype");
  TORCH_CHECK(k.scalar_type() == at::kChar && k.dim() == 4 && k.size(1) == PAGE && k.size(3) == D_ATTN,
              "K view");
  TORCH_CHECK(v.scalar_type() == at::kByte && v.dim() == 4 && v.size(3) == V4_COLS, "V view");
  TORCH_CHECK(k_scale.scalar_type() == at::kFloat && v_scale.scalar_type() == at::kFloat &&
                  v_zero.scalar_type() == at::kFloat,
              "scales");
  TORCH_CHECK(k_scale.dim() == 3 && v_scale.dim() == 3 && v_zero.dim() == 3, "scale rank");
  TORCH_CHECK(block_row.scalar_type() == at::kInt && block_row.dim() == 1, "block_row");
  TORCH_CHECK(visible.scalar_type() == at::kInt && visible.dim() == 2 &&
                  visible.size(0) == query.size(0),
              "visible");
  TORCH_CHECK(pages_per_block >= 1 && seq_len >= 0, "pages");
  const int hkv = static_cast<int>(k.size(2));
  const int hq = static_cast<int>(query.size(1));
  TORCH_CHECK(hkv == 2 || hkv == 4, "QSA sparse attention serves 2 or 4 KV heads");
  TORCH_CHECK(hq % hkv == 0, "query heads are not a multiple of KV heads");
  const bool fp16 = query.scalar_type() == at::kHalf;
  const Stride4 qs = strides_of(query);
  launch_sparse(current_xpu_queue(), query.data_ptr(), fp16,
                fp16 ? nullptr : out.data_ptr<float>(),
                fp16 ? reinterpret_cast<sycl::half *>(out.data_ptr()) : nullptr, fp16,
                k.data_ptr<int8_t>(), k_scale.data_ptr<float>(), v.data_ptr<uint8_t>(),
                v_scale.data_ptr<float>(), v_zero.data_ptr<float>(), block_row.data_ptr<int32_t>(),
                visible.data_ptr<int32_t>(), qs, strides_of(k), strides_of(k_scale), strides_of(v),
                strides_of(v_scale), strides_of(v_zero), block_row.stride(0), visible.stride(0),
                visible.stride(1), out.stride(0), out.stride(1), out.stride(2),
                static_cast<int>(query.size(0)), hq, hkv, static_cast<int>(visible.size(1)),
                static_cast<int>(pages_per_block), static_cast<int>(seq_len));
}

}  // namespace

TORCH_LIBRARY(xe2_qsa, m) {
  m.def("qsa_score(Tensor query, Tensor pooled, Tensor(a!) scores) -> ()");
  m.def("qsa_topk(Tensor scores, Tensor(a!) ids, int k) -> ()");
  m.def(
      "qsa_visible(Tensor scores, Tensor counts, Tensor cells, Tensor(a!) out, int k, int ratio, "
      "int force) -> ()");
  m.def(
      "qsa_sparse_attn(Tensor query, Tensor k, Tensor k_scale, Tensor v, Tensor v_scale, "
      "Tensor v_zero, Tensor block_row, Tensor visible, Tensor(a!) out, int pages_per_block, "
      "int seq_len) -> ()");
}

TORCH_LIBRARY_IMPL(xe2_qsa, XPU, m) {
  m.impl("qsa_score", &qsa_score);
  m.impl("qsa_topk", &qsa_topk);
  m.impl("qsa_visible", &qsa_visible);
  m.impl("qsa_sparse_attn", &qsa_sparse_attn);
}
