// Short-decode grp3 split attention, tuned build ("g3_exp1").
//
// Same contract and op schema as xe2_qsa::qsa_grp3_split in libxe2_qsa.so:
// one 16-lane subgroup owns three query heads of one GQA group for one query
// row and one token chunk of split_width tokens. Per token it loads the int8 K
// row and int4 V row once for the three heads, runs the online softmax, then a
// second kernel merges the chunk partials. It is registered in its own
// namespace (torch.ops.xe2_qsa_grp3) and built as its own library
// (libxe2_qsa_grp3.so, see compile_qsa_grp3.sh), so it never collides with
// the xe2_qsa or xe2_qsa_batch registrations. qsa_ops falls back to the
// shipped xe2_qsa::qsa_grp3_split when this library is not loaded.
//
// Changes against the shipped grp3_split body, each measured one at a time:
//   1. token -> page: logical / 33 uses an exact multiply-high (the divide
//      sat on the K address chain); other ratios keep the plain divide.
//   2. consecutive tokens on the same logical page reuse the physical page
//      instead of re-reading block_row.
//   3. online softmax computes one exp per head per token; the other factor
//      of (decay, prob) is exactly 1.
// Split width is chosen by the caller (qsa_direct_plan.decode_split_width).
// Kernel-only, TP1 24Q/4KV, 7 rows, 2052 tokens, 16 layers, one Arc Pro B60:
// split 48 was 3.759 ms vs 4.183 ms for shipped grp3_split split 32 in the
// same process (1.11x). Split 32 is about 1.00x, split 64 about 0.94x there.
// The 12Q/2KV (TP2 rank) shape was not measured with this body.
// See docs/qsa-grp3-decode-kernel.md.

#include <sycl/sycl.hpp>

#include <ATen/ATen.h>
#include <c10/xpu/XPUStream.h>
#include <torch/library.h>

#include <cstdint>
#include <cstdlib>
#include <functional>
namespace {
constexpr int D_ATTN = 256; constexpr int PAGE = 64; constexpr int V4_COLS = 128;
constexpr float INV_SQRT_D = 0.0625f;
static sycl::queue &current_xpu_queue() { return c10::xpu::getCurrentXPUStream().queue(); }

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
static void qsa_grp_check(const at::Tensor &query, const at::Tensor &k, const at::Tensor &v,
                          const at::Tensor &block_row, const at::Tensor &visible, const at::Tensor &out,
                          int64_t ratio, const char *name) {
  for (const auto &t : {query, k, v, block_row, visible, out}) check_xpu(t, name);
  TORCH_CHECK(query.scalar_type() == at::kHalf && out.sizes() == query.sizes() &&
              k.stride(3) == 1 && v.stride(3) == 1 && visible.size(0) == query.size(0) &&
              query.size(1) % k.size(2) == 0 && ratio >= 1, name);
}
// grp3 with the token row split across workgroups so the 2052-step walk
// is shorter. Partials are merged with the same online-softmax rule.
static void qsa_grp3_split(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                           const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                           const at::Tensor &block_row, const at::Tensor &visible,
                           at::Tensor partial, at::Tensor ml, at::Tensor out,
                           int64_t ratio, int64_t split_width) {
  qsa_grp_check(query, k, v, block_row, visible, out, ratio, "qsa_grp3_split");
  TORCH_CHECK(partial.is_contiguous() && ml.is_contiguous() && split_width >= 1, "split");
  const int nq = static_cast<int>(query.size(0));
  const int hq = static_cast<int>(query.size(1));
  const int hkv = static_cast<int>(k.size(2));
  const int width = static_cast<int>(visible.size(1));
  const int gqa = hq / hkv;
  TORCH_CHECK(gqa % 3 == 0, "grp3 split");
  constexpr int N = 3;
  const int ngroups = hq / N;
  const int ns = (width + static_cast<int>(split_width) - 1) / static_cast<int>(split_width);
  TORCH_CHECK(partial.numel() == (int64_t)nq * hq * ns * D_ATTN &&
              ml.numel() == (int64_t)nq * hq * ns * 2, "split workspace");
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
  constexpr int lanes = 16;
  constexpr int dims = D_ATTN / lanes;
  const int sw = static_cast<int>(split_width);
  const size_t groups = static_cast<size_t>(nq) * static_cast<size_t>(ngroups) * static_cast<size_t>(ns);
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(groups * lanes), sycl::range<1>(lanes)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int lane = it.get_local_id(0);
        const int group = it.get_group(0);
        const int split = group % ns;
        const int rest = group / ns;
        const int bundle = rest % ngroups;
        const int qi = rest / ngroups;
        const int head0 = bundle * N;
        const int kh = head0 / gqa;
        auto sg = it.get_sub_group();
        float qv[N][dims];
        float acc[N][dims];
        float mv[N], lv[N];
        #pragma unroll
        for (int n = 0; n < N; ++n) {
          mv[n] = -INFINITY;
          lv[n] = 0.f;
          #pragma unroll
          for (int d = 0; d < dims; ++d) {
            qv[n][d] = (float)qp[qi * qs.s0 + (head0 + n) * qs.s1 + (lane * dims + d) * qs.s2];
            acc[n][d] = 0.f;
          }
        }
        const int begin = split * sw;
        const int end = sycl::min(width, begin + sw);
        int prev_logical = -1;
        int prev_phys = 0;
        for (int pos = begin; pos < end; ++pos) {
          const int token = ids[qi * ir + (int64_t)pos * ic];
          if (token < 0) continue;
          const int logical = token / PAGE;
          const int off = token - logical * PAGE;
          int phys;
          if (logical == prev_logical) {
            phys = prev_phys;
          } else {
            int q = logical, r = 0;
            if (ratio == 33 && (unsigned)logical < 16384u) {
              q = (int)((static_cast<uint64_t>(logical) * 0x7c1f07du) >> 32);
              r = logical - q * 33;
            } else if (ratio != 1) {
              q = (int)(logical / ratio);
              r = (int)(logical % ratio);
            }
            phys = ratio == 1 ? bt[logical * bs] : bt[(int64_t)q * bs] * (int)ratio + r;
            prev_logical = logical;
            prev_phys = phys;
          }
          const int64_t ko = (int64_t)phys * ks0.s0 + off * ks0.s1 + kh * ks0.s2;
          const uint32_t *ksrc = reinterpret_cast<const uint32_t *>(kp + ko + (int64_t)lane * dims);
          float dots[N];
          #pragma unroll
          for (int n = 0; n < N; ++n) dots[n] = 0.f;
          #pragma unroll
          for (int w = 0; w < 4; ++w) {
            const uint32_t word = ksrc[w];
            #pragma unroll
            for (int b = 0; b < 4; ++b) {
              const float kval = (float)static_cast<int8_t>(static_cast<uint8_t>(word >> (8 * b)));
              #pragma unroll
              for (int n = 0; n < N; ++n) dots[n] += qv[n][w * 4 + b] * kval;
            }
          }
          #pragma unroll
          for (int n = 0; n < N; ++n)
            dots[n] = sycl::reduce_over_group(sg, dots[n], sycl::plus<float>());
          const float kscale = ksp[(int64_t)phys * kss.s0 + off * kss.s1 + kh * kss.s2] * INV_SQRT_D;
          const int64_t vo = (int64_t)phys * vs0.s0 + off * vs0.s1 + kh * vs0.s2;
          const float scale = vsp[(int64_t)phys * vss.s0 + off * vss.s1 + kh * vss.s2];
          const float zero = vzp[(int64_t)phys * vzs.s0 + off * vzs.s1 + kh * vzs.s2];
          const uint32_t *vsrc = reinterpret_cast<const uint32_t *>(vp + vo + (int64_t)lane * dims / 2);
          const uint32_t w0 = vsrc[0], w1b = vsrc[1];
          float decay[N], prob[N];
          #pragma unroll
          for (int n = 0; n < N; ++n) {
            const float score = dots[n] * kscale;
            // One exp per head. The other factor is exactly 1.
            // First token: mv is -inf, exp(-inf - score) is 0, prob is 1.
            const bool higher = score > mv[n];
            const float e = sycl::exp(higher ? (mv[n] - score) : (score - mv[n]));
            decay[n] = higher ? e : 1.f;
            prob[n] = higher ? 1.f : e;
            mv[n] = higher ? score : mv[n];
            lv[n] = lv[n] * decay[n] + prob[n];
          }
          #pragma unroll
          for (int b = 0; b < 8; ++b) {
            const uint32_t word = b < 4 ? w0 : w1b;
            const uint8_t packed = static_cast<uint8_t>(word >> ((b & 3) * 8));
            const float even = ((float)(packed & 15) - zero) * scale;
            const float odd = ((float)(packed >> 4) - zero) * scale;
            #pragma unroll
            for (int n = 0; n < N; ++n) {
              acc[n][b * 2] = acc[n][b * 2] * decay[n] + prob[n] * even;
              acc[n][b * 2 + 1] = acc[n][b * 2 + 1] * decay[n] + prob[n] * odd;
            }
          }
        }
        #pragma unroll
        for (int n = 0; n < N; ++n) {
          const int head = head0 + n;
          float *slot = part + (((int64_t)qi * hq + head) * ns + split) * D_ATTN + lane * dims;
          #pragma unroll
          for (int d = 0; d < dims; ++d) slot[d] = acc[n][d];
          if (lane == 0) {
            float *st = stats + (((int64_t)qi * hq + head) * ns + split) * 2;
            st[0] = mv[n];
            st[1] = lv[n];
          }
        }
      });
  });
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>((size_t)nq * hq * lanes), sycl::range<1>(lanes)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int lane = it.get_local_id(0);
        const int row = it.get_group(0);
        const int qi = row / hq;
        const int head = row - qi * hq;
        float mv = -INFINITY, lv = 0.f, acc[dims];
        #pragma unroll
        for (int d = 0; d < dims; ++d) acc[d] = 0.f;
        for (int s = 0; s < ns; ++s) {
          const int64_t base = ((int64_t)row * ns + s);
          const float sm = stats[base * 2];
          const float sl = stats[base * 2 + 1];
          if (sl == 0.f) continue;
          const float nm = sycl::fmax(mv, sm);
          const float a = mv == -INFINITY ? 0.f : sycl::exp(mv - nm);
          const float b = sycl::exp(sm - nm);
          const float *src = part + base * D_ATTN + lane * dims;
          #pragma unroll
          for (int d = 0; d < dims; ++d) acc[d] = acc[d] * a + b * src[d];
          lv = lv * a + b * sl;
          mv = nm;
        }
        const float inv = lv > 0.f ? 1.f / lv : 0.f;
        #pragma unroll
        for (int d = 0; d < dims; ++d)
          dst[qi * os.s0 + head * os.s1 + (lane * dims + d) * os.s2] = sycl::half(acc[d] * inv);
      });
  });
}
}  // namespace
TORCH_LIBRARY(xe2_qsa_grp3, m) {
  m.def(
      "qsa_grp3_split(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, "
      "Tensor block_row, Tensor visible, Tensor(a!) partial, Tensor(b!) ml, Tensor(c!) out, "
      "int ratio, int split_width) -> ()");
}

TORCH_LIBRARY_IMPL(xe2_qsa_grp3, XPU, m) {
  m.impl("qsa_grp3_split", &qsa_grp3_split);
}
