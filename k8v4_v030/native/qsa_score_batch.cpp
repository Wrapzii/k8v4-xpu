// Companion paged indexer score for a whole decode roster.
//
// This is not libxe2_qsa.so. The shared library's qsa_score_paged takes one
// block-table row and, on the nq<=16 path, loads the pooled key before it
// checks the live count. Four c4 requests therefore scanned the padded
// 65536-block width four times.
//
// qsa_score_paged_multi scores R requests, each with its own block-table row
// and one representative query [R, 4, 128]. A subgroup owns one (request,
// block) pair. It writes -inf and returns before the 512-byte key load when
// the block is past that request's count or the pooled row is invalid.
// The output width is chosen by the caller and stays at the captured static
// width, so a short warmup graph can replay a longer context.

#include <sycl/sycl.hpp>

#include <ATen/ATen.h>
#include <c10/xpu/XPUStream.h>
#include <torch/library.h>

#include <cstdint>

namespace {

constexpr int D_IDX = 128;
constexpr int IDX_HEADS = 4;
constexpr int PAGE = 64;
constexpr int SG = 16;

sycl::queue &current_xpu_queue() { return c10::xpu::getCurrentXPUStream().queue(); }

void check_xpu(const at::Tensor &t, const char *name) {
  TORCH_CHECK(t.is_xpu(), name, " must be XPU");
}

// kInt8 loads the pooled row as int8 and applies the per-row scale in
// registers. That is the same value as dequantize_pooled_rows (int8 cast to
// fp32, then multiply by the row scale) and it does not materialize the
// full pool. The fp32 entry point is unchanged.
template <bool kInt8>
void submit_score(sycl::queue &queue, const float *qp, const float *kp, const int8_t *ip,
                  const float *sp, const bool *ok, const int32_t *table, const int32_t *ct,
                  float *dst, int requests, int nb, int np, int bt_n, int ratio_i) {
  const size_t pairs = static_cast<size_t>(requests) * static_cast<size_t>(nb);
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(
        sycl::nd_range<1>(sycl::range<1>(pairs * SG), sycl::range<1>(SG)),
        [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(SG)]] {
          const int64_t pair = static_cast<int64_t>(it.get_group(0));
          const int req = static_cast<int>(pair / nb);
          const int block = static_cast<int>(pair - static_cast<int64_t>(req) * nb);
          const int lane = static_cast<int>(it.get_local_id(0));
          float *dst_row = dst + static_cast<int64_t>(req) * nb;
          // Live prefix first. Padded columns must not touch the key.
          if (block >= ct[req]) {
            if (lane == 0) dst_row[block] = -INFINITY;
            return;
          }
          const int32_t *bt = table + static_cast<int64_t>(req) * bt_n;
          const int tok = block * 4;
          const int logical = tok / PAGE;
          const int off = tok - logical * PAGE;
          const int page = ratio_i == 1 ? bt[logical]
                                        : bt[logical / ratio_i] * ratio_i + logical % ratio_i;
          const int64_t micro = (static_cast<int64_t>(page) * PAGE + off) / 4;
          const bool bad = page < 0 || micro < 0 || micro >= np || !ok[micro];
          if (bad) {
            if (lane == 0) dst_row[block] = -INFINITY;
            return;
          }
          auto sg = it.get_sub_group();
          float total = 0.f;
#pragma unroll
          for (int head = 0; head < IDX_HEADS; ++head) {
            const float *qv = qp + (static_cast<int64_t>(req) * IDX_HEADS + head) * D_IDX +
                              static_cast<int64_t>(lane) * 8;
            float partial = 0.f;
            if constexpr (kInt8) {
              const int8_t *src = ip + micro * D_IDX + static_cast<int64_t>(lane) * 8;
              const float scale = sp[micro];
#pragma unroll
              for (int d = 0; d < 8; ++d) {
                const float kv = static_cast<float>(src[d]) * scale;
                partial += qv[d] * kv;
              }
            } else {
              const float *kv = kp + micro * D_IDX + static_cast<int64_t>(lane) * 8;
#pragma unroll
              for (int d = 0; d < 8; ++d) partial += qv[d] * kv[d];
            }
            partial = sycl::reduce_over_group(sg, partial, sycl::plus<float>());
            total += sycl::fmax(partial, 0.f);
          }
          if (lane == 0) dst_row[block] = total;
        });
  });
}

void check_score_args(const at::Tensor &query, const at::Tensor &pooled, const at::Tensor &valid,
                      const at::Tensor &block_table, const at::Tensor &counts, const at::Tensor &scores,
                      int64_t ratio, const char *what) {
  for (const auto &t : {query, pooled, valid, block_table, counts, scores}) {
    check_xpu(t, what);
    TORCH_CHECK(t.is_contiguous() && t.device() == query.device(),
                "QSA batched score device/layout");
  }
  TORCH_CHECK(valid.scalar_type() == at::kBool && block_table.scalar_type() == at::kInt &&
                  counts.scalar_type() == at::kInt && scores.scalar_type() == at::kFloat &&
                  query.scalar_type() == at::kFloat,
              "QSA batched score dtypes");
  TORCH_CHECK(query.dim() == 3 && query.size(1) == IDX_HEADS && query.size(2) == D_IDX &&
                  pooled.dim() == 2 && pooled.size(1) == D_IDX &&
                  valid.numel() == pooled.size(0) && block_table.dim() == 2 &&
                  counts.dim() == 1 && scores.dim() == 2 &&
                  block_table.size(0) == query.size(0) && counts.size(0) == query.size(0) &&
                  scores.size(0) == query.size(0) && ratio >= 1,
              "QSA batched score shapes");
  const int requests = static_cast<int>(query.size(0));
  const int nb = static_cast<int>(scores.size(1));
  const int bt_n = static_cast<int>(block_table.size(1));
  TORCH_CHECK(requests > 0 && nb > 0 && bt_n > 0, "QSA batched score is empty");
  TORCH_CHECK(((int64_t)nb * 4 + PAGE - 1) / PAGE <= (int64_t)bt_n * ratio,
              "QSA batched score block table capacity");
}

void qsa_score_paged_multi(const at::Tensor &query, const at::Tensor &pooled,
                           const at::Tensor &valid, const at::Tensor &block_table,
                           const at::Tensor &counts, at::Tensor scores, int64_t ratio) {
  check_score_args(query, pooled, valid, block_table, counts, scores, ratio,
                   "qsa_score_paged_multi tensor");
  TORCH_CHECK(pooled.scalar_type() == at::kFloat, "QSA batched score pooled dtype");
  submit_score<false>(current_xpu_queue(), query.data_ptr<float>(), pooled.data_ptr<float>(),
                      nullptr, nullptr, valid.data_ptr<bool>(), block_table.data_ptr<int32_t>(),
                      counts.data_ptr<int32_t>(), scores.data_ptr<float>(),
                      static_cast<int>(query.size(0)), static_cast<int>(scores.size(1)),
                      static_cast<int>(pooled.size(0)), static_cast<int>(block_table.size(1)),
                      static_cast<int>(ratio));
}

void qsa_score_paged_multi_i8(const at::Tensor &query, const at::Tensor &pooled,
                              const at::Tensor &scales, const at::Tensor &valid,
                              const at::Tensor &block_table, const at::Tensor &counts,
                              at::Tensor scores, int64_t ratio) {
  check_score_args(query, pooled, valid, block_table, counts, scores, ratio,
                   "qsa_score_paged_multi_i8 tensor");
  check_xpu(scales, "qsa_score_paged_multi_i8 scales");
  TORCH_CHECK(pooled.scalar_type() == at::kChar, "QSA int8 score pooled dtype");
  TORCH_CHECK(scales.is_contiguous() && scales.device() == query.device() &&
                  scales.scalar_type() == at::kFloat && scales.dim() == 1 &&
                  scales.numel() == pooled.size(0),
              "QSA int8 score scales");
  submit_score<true>(current_xpu_queue(), query.data_ptr<float>(), nullptr,
                     pooled.data_ptr<int8_t>(), scales.data_ptr<float>(), valid.data_ptr<bool>(),
                     block_table.data_ptr<int32_t>(), counts.data_ptr<int32_t>(),
                     scores.data_ptr<float>(), static_cast<int>(query.size(0)),
                     static_cast<int>(scores.size(1)), static_cast<int>(pooled.size(0)),
                     static_cast<int>(block_table.size(1)), static_cast<int>(ratio));
}

}  // namespace

TORCH_LIBRARY(xe2_qsa_batch, m) {
  m.def(
      "qsa_score_paged_multi(Tensor query, Tensor pooled, Tensor valid, Tensor block_table, "
      "Tensor counts, Tensor(a!) scores, int ratio) -> ()");
  m.def(
      "qsa_score_paged_multi_i8(Tensor query, Tensor pooled, Tensor scales, Tensor valid, "
      "Tensor block_table, Tensor counts, Tensor(a!) scores, int ratio) -> ()");
}

TORCH_LIBRARY_IMPL(xe2_qsa_batch, XPU, m) {
  m.impl("qsa_score_paged_multi", &qsa_score_paged_multi);
  m.impl("qsa_score_paged_multi_i8", &qsa_score_paged_multi_i8);
}
