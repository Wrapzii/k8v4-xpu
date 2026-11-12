// Split decode attention that loads each selected K/V once per KV head.
//
// qsa_direct_attn gives every query head its own subgroup. This model is
// GQA 6 (24 query heads, 4 KV heads, halved again by TP2), so a 2048-token
// decode loaded the same int8 K and int4 V six times. That walk was 6.4 ms
// of the 6.65 ms qsa_direct_attn total; the merge kernel was 0.27 ms.
//
// Six query-head accumulators do not fit in registers (qsa_grp6 spilled).
// They live in SLM. Each subgroup still owns one 64-token split, so the
// short MTP roster (7 queries x 2 KV heads x 32 splits) stays wide enough
// to cover the device. Per-head dot order matches qsa_direct_attn: the lane
// sums dims 0..15, then one subgroup reduction, and the int4 update is
// acc * decay + (prob * (nibble - zero)) * scale.

#include <sycl/sycl.hpp>

#include <ATen/ATen.h>
#include <c10/xpu/XPUStream.h>
#include <torch/library.h>

#include <cstdint>

namespace {

constexpr int D_ATTN = 256;
constexpr int PAGE = 64;
constexpr int V4_COLS = 128;
constexpr int LANES = 16;
constexpr int DIMS = D_ATTN / LANES;
constexpr int GQA6 = 6;
constexpr float INV_SQRT_D = 0.0625f;

sycl::queue &current_xpu_queue() { return c10::xpu::getCurrentXPUStream().queue(); }

void check_xpu(const at::Tensor &t, const char *name) {
  TORCH_CHECK(t.is_xpu(), name, " must be XPU");
}

struct Stride4 {
  int64_t s0, s1, s2, s3;
};

Stride4 strides_of(const at::Tensor &t) {
  Stride4 s{1, 1, 1, 1};
  if (t.dim() > 0) s.s0 = t.stride(0);
  if (t.dim() > 1) s.s1 = t.stride(1);
  if (t.dim() > 2) s.s2 = t.stride(2);
  if (t.dim() > 3) s.s3 = t.stride(3);
  return s;
}

void qsa_gqa6_split(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                    const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                    const at::Tensor &block_row, const at::Tensor &visible, at::Tensor partial,
                    at::Tensor ml, at::Tensor out, int64_t ratio, int64_t split_width) {
  for (const auto &t : {query, k, ks, v, vs, vz, block_row, visible, partial, ml, out})
    check_xpu(t, "qsa_gqa6_split tensor");
  TORCH_CHECK(query.scalar_type() == at::kHalf && out.scalar_type() == at::kHalf &&
                  k.scalar_type() == at::kChar && v.scalar_type() == at::kByte &&
                  ks.scalar_type() == at::kFloat && vs.scalar_type() == at::kFloat &&
                  vz.scalar_type() == at::kFloat && block_row.scalar_type() == at::kInt &&
                  visible.scalar_type() == at::kInt && partial.scalar_type() == at::kFloat &&
                  ml.scalar_type() == at::kFloat,
              "qsa_gqa6_split dtypes");
  TORCH_CHECK(query.dim() == 3 && query.size(2) == D_ATTN && out.sizes() == query.sizes() &&
                  k.dim() == 4 && k.size(1) == PAGE && k.size(3) == D_ATTN && k.stride(3) == 1 &&
                  v.dim() == 4 && v.size(3) == V4_COLS && v.stride(3) == 1 && block_row.dim() == 1 &&
                  visible.dim() == 2 && visible.size(0) == query.size(0) && ratio >= 1 &&
                  split_width >= 1 && partial.is_contiguous() && ml.is_contiguous(),
              "qsa_gqa6_split shapes");
  const int nq = static_cast<int>(query.size(0));
  const int hq = static_cast<int>(query.size(1));
  const int hkv = static_cast<int>(k.size(2));
  const int width = static_cast<int>(visible.size(1));
  TORCH_CHECK(hkv > 0 && hq == hkv * GQA6 && width > 0, "qsa_gqa6_split heads");
  const int sw = static_cast<int>(split_width);
  const int ns = (width + sw - 1) / sw;
  TORCH_CHECK(partial.numel() == (int64_t)nq * hq * ns * D_ATTN &&
                  ml.numel() == (int64_t)nq * hq * ns * 2,
              "qsa_gqa6_split workspace");

  auto &queue = current_xpu_queue();
  const auto qs = strides_of(query), ks0 = strides_of(k), kss = strides_of(ks);
  const auto vs0 = strides_of(v), vss = strides_of(vs), vzs = strides_of(vz), os = strides_of(out);
  const auto *qp = reinterpret_cast<const sycl::half *>(query.data_ptr());
  const auto *kp = k.data_ptr<int8_t>();
  const auto *ksp = ks.data_ptr<float>();
  const auto *vp = v.data_ptr<uint8_t>();
  const auto *vsp = vs.data_ptr<float>();
  const auto *vzp = vz.data_ptr<float>();
  const auto *bt = block_row.data_ptr<int32_t>();
  const auto *ids = visible.data_ptr<int32_t>();
  auto *part = partial.data_ptr<float>();
  auto *stats = ml.data_ptr<float>();
  auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr());
  const int64_t bs = block_row.stride(0), ir = visible.stride(0), ic = visible.stride(1);
  const size_t groups = static_cast<size_t>(nq) * static_cast<size_t>(hkv) * static_cast<size_t>(ns);

  queue.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> qslm(sycl::range<1>(GQA6 * D_ATTN), h);
    sycl::local_accessor<float, 1> aslm(sycl::range<1>(GQA6 * D_ATTN), h);
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(groups * LANES), sycl::range<1>(LANES)),
                   [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(LANES)]] {
                     const int lane = static_cast<int>(it.get_local_id(0));
                     const int group = static_cast<int>(it.get_group(0));
                     const int split = group % ns;
                     const int rest = group / ns;
                     const int kh = rest % hkv;
                     const int qi = rest / hkv;
                     const int head0 = kh * GQA6;
                     auto sg = it.get_sub_group();
                     float mv[GQA6], lv[GQA6];
#pragma unroll
                     for (int n = 0; n < GQA6; ++n) {
                       mv[n] = -INFINITY;
                       lv[n] = 0.f;
                       const int base = n * D_ATTN + lane * DIMS;
#pragma unroll
                       for (int d = 0; d < DIMS; ++d) {
                         qslm[base + d] = static_cast<float>(
                             qp[qi * qs.s0 + (head0 + n) * qs.s1 + (lane * DIMS + d) * qs.s2]);
                         aslm[base + d] = 0.f;
                       }
                     }
                     const int begin = split * sw;
                     const int end = sycl::min(width, begin + sw);
                     for (int pos = begin; pos < end; ++pos) {
                       const int token = ids[qi * ir + static_cast<int64_t>(pos) * ic];
                       if (token < 0) continue;
                       const int logical = token / PAGE;
                       const int off = token - logical * PAGE;
                       const int phys = ratio == 1 ? bt[static_cast<int64_t>(logical) * bs]
                                                   : bt[(logical / static_cast<int>(ratio)) * bs] *
                                                             static_cast<int>(ratio) +
                                                         logical % static_cast<int>(ratio);
                       const int64_t ko = static_cast<int64_t>(phys) * ks0.s0 +
                                          static_cast<int64_t>(off) * ks0.s1 +
                                          static_cast<int64_t>(kh) * ks0.s2;
                       const uint32_t *ksrc = reinterpret_cast<const uint32_t *>(
                           kp + ko + static_cast<int64_t>(lane) * DIMS);
                       float kf[DIMS];
#pragma unroll
                       for (int w = 0; w < 4; ++w) {
                         const uint32_t word = ksrc[w];
#pragma unroll
                         for (int b = 0; b < 4; ++b) {
                           kf[w * 4 + b] = static_cast<float>(static_cast<int8_t>(
                               static_cast<uint8_t>(word >> (8 * b))));
                         }
                       }
                       float dots[GQA6];
#pragma unroll
                       for (int n = 0; n < GQA6; ++n) {
                         const int base = n * D_ATTN + lane * DIMS;
                         float dot = 0.f;
#pragma unroll
                         for (int d = 0; d < DIMS; ++d) dot += qslm[base + d] * kf[d];
                         dots[n] = dot;
                       }
#pragma unroll
                       for (int n = 0; n < GQA6; ++n)
                         dots[n] = sycl::reduce_over_group(sg, dots[n], sycl::plus<float>());
                       const float kscale =
                           ksp[static_cast<int64_t>(phys) * kss.s0 + static_cast<int64_t>(off) * kss.s1 +
                               static_cast<int64_t>(kh) * kss.s2] *
                           INV_SQRT_D;
                       const int64_t vo = static_cast<int64_t>(phys) * vs0.s0 +
                                          static_cast<int64_t>(off) * vs0.s1 +
                                          static_cast<int64_t>(kh) * vs0.s2;
                       const float scale =
                           vsp[static_cast<int64_t>(phys) * vss.s0 + static_cast<int64_t>(off) * vss.s1 +
                               static_cast<int64_t>(kh) * vss.s2];
                       const float zero =
                           vzp[static_cast<int64_t>(phys) * vzs.s0 + static_cast<int64_t>(off) * vzs.s1 +
                               static_cast<int64_t>(kh) * vzs.s2];
                       const uint32_t *vsrc = reinterpret_cast<const uint32_t *>(
                           vp + vo + static_cast<int64_t>(lane) * DIMS / 2);
                       const uint32_t w0 = vsrc[0], w1 = vsrc[1];
                       float vf[DIMS];
#pragma unroll
                       for (int b = 0; b < 8; ++b) {
                         const uint32_t word = b < 4 ? w0 : w1;
                         const uint8_t packed = static_cast<uint8_t>(word >> ((b & 3) * 8));
                         vf[b * 2] = static_cast<float>(packed & 15) - zero;
                         vf[b * 2 + 1] = static_cast<float>(packed >> 4) - zero;
                       }
                       float decay[GQA6], prob[GQA6];
#pragma unroll
                       for (int n = 0; n < GQA6; ++n) {
                         const float score = dots[n] * kscale;
                         const float nm = sycl::fmax(mv[n], score);
                         decay[n] = mv[n] == -INFINITY ? 0.f : sycl::exp(mv[n] - nm);
                         prob[n] = sycl::exp(score - nm);
                         lv[n] = lv[n] * decay[n] + prob[n];
                         mv[n] = nm;
                       }
#pragma unroll
                       for (int n = 0; n < GQA6; ++n) {
                         const int base = n * D_ATTN + lane * DIMS;
#pragma unroll
                         for (int d = 0; d < DIMS; ++d) {
                           const float updated =
                               aslm[base + d] * decay[n] + (prob[n] * vf[d]) * scale;
                           aslm[base + d] = updated;
                         }
                       }
                     }
#pragma unroll
                     for (int n = 0; n < GQA6; ++n) {
                       const int head = head0 + n;
                       const int64_t slot =
                           ((static_cast<int64_t>(qi) * hq + head) * ns + split) * D_ATTN +
                           static_cast<int64_t>(lane) * DIMS;
                       const int base = n * D_ATTN + lane * DIMS;
#pragma unroll
                       for (int d = 0; d < DIMS; ++d) part[slot + d] = aslm[base + d];
                       if (lane == 0) {
                         float *st = stats + ((static_cast<int64_t>(qi) * hq + head) * ns + split) * 2;
                         st[0] = mv[n];
                         st[1] = lv[n];
                       }
                     }
                   });
  });

  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(static_cast<size_t>(nq) * hq * LANES),
                                    sycl::range<1>(LANES)),
                   [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(LANES)]] {
                     const int lane = static_cast<int>(it.get_local_id(0));
                     const int row = static_cast<int>(it.get_group(0));
                     const int qi = row / hq;
                     const int head = row - qi * hq;
                     float mv = -INFINITY, lv = 0.f, acc[DIMS];
#pragma unroll
                     for (int d = 0; d < DIMS; ++d) acc[d] = 0.f;
                     for (int s = 0; s < ns; ++s) {
                       const int64_t base = static_cast<int64_t>(row) * ns + s;
                       const float sm = stats[base * 2];
                       const float sl = stats[base * 2 + 1];
                       if (sl == 0.f) continue;
                       const float nm = sycl::fmax(mv, sm);
                       const float a = mv == -INFINITY ? 0.f : sycl::exp(mv - nm);
                       const float b = sycl::exp(sm - nm);
                       const float *src = part + base * D_ATTN + static_cast<int64_t>(lane) * DIMS;
#pragma unroll
                       for (int d = 0; d < DIMS; ++d) acc[d] = acc[d] * a + b * src[d];
                       lv = lv * a + b * sl;
                       mv = nm;
                     }
                     const float inv = lv > 0.f ? 1.f / lv : 0.f;
#pragma unroll
                     for (int d = 0; d < DIMS; ++d)
                       dst[qi * os.s0 + head * os.s1 + (lane * DIMS + d) * os.s2] =
                           sycl::half(acc[d] * inv);
                   });
  });
}

}  // namespace

TORCH_LIBRARY_FRAGMENT(xe2_qsa_batch, m) {
  m.def(
      "qsa_gqa6_split(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, "
      "Tensor block_row, Tensor visible, Tensor(a!) partial, Tensor(b!) ml, Tensor(c!) out, "
      "int ratio, int split_width) -> ()");
}

TORCH_LIBRARY_IMPL(xe2_qsa_batch, XPU, m) {
  m.impl("qsa_gqa6_split", &qsa_gqa6_split);
}
