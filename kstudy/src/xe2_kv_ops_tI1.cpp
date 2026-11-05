#include <unordered_set>
// Track I: ESIMD stage-1 (XF&256) + Gate A/B torch ABI: Q-once INT8-K/V4 as torch.ops.xe2_kv.*
// Unique: candidate_a/sycl_stage1/torch_ext/xe2_kv_ops.cpp
//   Gate A: Xe2KvTorchAbiQquantKernel / KstoreKernel / VstoreKernel / S1Kernel
//   Gate B: KstorePaged / VstorePaged / S1Paged / S2Merge / Unpack (vLLM NHD pages)
//   Gate C storage: xe2_kv_cache_layout.hpp / xe2_kv_cache_dtype.py (int8_k_int4_v)
// Does NOT overwrite combined_stage1_int8k_int4v_qonce.cpp / qonce_gate.cpp.
// extra_slm=0 HARD. 24 KiB SLM. 1-tile. Native int8 DPAS.

#include <sycl/sycl.hpp>
#include <sycl/ext/intel/esimd.hpp>
#include <sycl/ext/intel/esimd/xmx/dpas.hpp>
#include <sycl/ext/intel/experimental/esimd/memory.hpp>

#include <c10/xpu/XPUStream.h>
#include <ATen/ATen.h>
#include <torch/library.h>

#include <algorithm>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <stdexcept>
#include <type_traits>

namespace jm = sycl::ext::oneapi::experimental::matrix;

namespace {

static constexpr int BM = 64;
static constexpr int BN = 64;
static constexpr int BK = 256;
static constexpr int BV = 256;
static constexpr int V4_COLS = BK / 2;
static constexpr int TM = 8;
static constexpr int TN = 16;
static constexpr int TK = 16;
static constexpr int TK_I8 = 32;
static constexpr int SG_SIZE = 16;
static constexpr int SG_COUNT = BM / TM;
static constexpr int WG_SIZE = SG_COUNT * SG_SIZE;
static constexpr int NTN = BN / TN;
static constexpr int PV_NCHUNK = 4;
static constexpr int KV_HALF = BK / 2;
static constexpr float INV_SQRT_D = 0.0625f;
// Local KV heads per GPU: a TP2 rank holds 2 (12 Q heads), a single GPU
// holding the whole model holds 4 (24 Q). One library serves both: kernels
// are templated on HKV and the torch ops pick the instantiation from the
// head count their tensors carry (dispatch_hkv below). GQA stays 6.
static constexpr int PAGE = BM;
static constexpr int STORE_WG = 32;
static constexpr int S2_SG_COUNT = 8;

static constexpr int kSbytes = BM * BN * static_cast<int>(sizeof(float));
static constexpr int kP = BM * BN;
static constexpr int kSlmBytes = kSbytes + kP * static_cast<int>(sizeof(sycl::half));
static constexpr int kSlmFloats =
    (kSlmBytes + static_cast<int>(sizeof(float)) - 1) / static_cast<int>(sizeof(float));

static_assert(BK % TK_I8 == 0, "int8 TK=32 must divide head dim 256");
static_assert(TM == 8 && TN == 16, "bmg_g21 int8 tile is M<=8, N=16, K=32");
static_assert(sizeof(at::Half) == sizeof(sycl::half), "fp16 width");

// Head counts for one instantiation. HQ = 6 * HKV is the Qwen3.8-27B GQA
// ratio the kernel math bakes in (one query row block per KV head).
template <int HKV>
struct Heads {
  static constexpr int hkv = HKV;
  static constexpr int hq = 6 * HKV;
  static constexpr int gqa = 6;
  static constexpr int qquant_heads = HKV;
  static constexpr int s2_nwg = HKV * BM / 8;  // one row per stage-2 sub-group, 8 a work-group
  static_assert(s2_nwg * S2_SG_COUNT == HKV * BM, "Stage2 1 row/SG");
};

// Instantiate the op for the layout the tensors name. 2 is TP2, 4 is the
// one-GPU build; anything else fails loudly rather than guessing.
static int checked_hkv(int64_t hkv) {
  TORCH_CHECK(hkv == 2 || hkv == 4, "unsupported per-GPU KV head count ", hkv,
              " (this library serves 2 or 4)");
  return static_cast<int>(hkv);
}

template <class F>
static void dispatch_hkv(int64_t hkv, F &&run) {
  // Validated here so no caller can reach the 4-head kernel with an
  // unchecked count.
  switch (checked_hkv(hkv)) {
  case 2:
    run(std::integral_constant<int, 2>{});
    return;
  case 4:
    run(std::integral_constant<int, 4>{});
    return;
  }
  TORCH_CHECK(false, "unsupported per-GPU KV head count ", hkv, " (this library serves 2 or 4)");
}

static sycl::queue &current_xpu_queue() { return c10::xpu::getCurrentXPUStream().queue(); }

static const sycl::half *as_half_c(const at::Tensor &t) {
  return reinterpret_cast<const sycl::half *>(t.data_ptr<at::Half>());
}

static void check_xpu_contig(const at::Tensor &t, const char *name) {
  TORCH_CHECK(t.is_xpu(), name, " must be XPU");
  TORCH_CHECK(t.is_contiguous(), name, " must be contiguous");
}

static inline void decode_v_int4_vec(int lid, const std::uint8_t *v4_prog, const float *vs_prog,
                                     const float *vz_prog, int nbase, sycl::half *kv_tile) {
  const int tok = lid >> 1;
  const int part = lid & 1;
  const float scale = vs_prog[tok];
  const float zero = vz_prog[tok];
  const int byte0 = (nbase >> 1) + part * 32;
  const std::uint8_t *src = v4_prog + static_cast<size_t>(tok) * V4_COLS + byte0;
  sycl::half *dst = kv_tile + tok * KV_HALF + part * 64;
#pragma unroll
  for (int e = 0; e < 32; e += 8) {
    std::uint64_t raw;
    std::memcpy(&raw, src + e, sizeof(raw));
#pragma unroll
    for (int j = 0; j < 8; ++j) {
      const std::uint8_t b = static_cast<std::uint8_t>(raw >> (8 * j));
      dst[2 * (e + j)] = sycl::half((static_cast<float>(b & 0xFu) - zero) * scale);
      dst[2 * (e + j) + 1] = sycl::half((static_cast<float>(b >> 4) - zero) * scale);
    }
  }
}

static inline void decode_v_int4_vec_strided(int lid, const std::uint8_t *v4_head, int v_tok_stride,
                                             const float *vs_head, const float *vz_head, int sc_stride,
                                             int nbase, int n_valid, sycl::half *kv_tile) {
  const int tok = lid >> 1;
  const int part = lid & 1;
  // The V tile is decoded before PV.  Do not read affine metadata or packed
  // nibbles for rows outside the authoritative logical page length: masked
  // attention still multiplies those rows by zero, and 0*NaN would poison PV.
  sycl::half *dst = kv_tile + tok * KV_HALF + part * 64;
  if (tok >= n_valid) {
#pragma unroll
    for (int e = 0; e < 64; ++e) dst[e] = sycl::half(0.f);
    return;
  }
  const float scale = vs_head[tok * sc_stride];
  const float zero = vz_head[tok * sc_stride];
  const int byte0 = (nbase >> 1) + part * 32;
  const std::uint8_t *src = v4_head + static_cast<size_t>(tok) * v_tok_stride + byte0;
#pragma unroll
  for (int e = 0; e < 32; e += 8) {
    std::uint64_t raw;
    std::memcpy(&raw, src + e, sizeof(raw));
#pragma unroll
    for (int j = 0; j < 8; ++j) {
      const std::uint8_t b = static_cast<std::uint8_t>(raw >> (8 * j));
      dst[2 * (e + j)] = sycl::half((static_cast<float>(b & 0xFu) - zero) * scale);
      dst[2 * (e + j) + 1] = sycl::half((static_cast<float>(b >> 4) - zero) * scale);
    }
  }
}

template <int HKV> class Xe2KvTorchAbiQquantKernel;
template <int HKV> class Xe2KvTorchAbiPackQquantKernel;
class Xe2KvTorchAbiKstoreKernel;
class Xe2KvTorchAbiVstoreKernel;
template <int HKV> class Xe2KvTorchAbiS1Kernel;
template <int HKV> class Xe2KvTorchAbiKstorePagedKernel;
template <int HKV> class Xe2KvTorchAbiVstorePagedKernel;
template <int HKV, bool PF16> class Xe2KvTorchAbiS1PagedKernel;
template <int HKV, bool PF16, int COLS> class Xe2KvTorchAbiS1PagedReuseKernel;
template <int HKV, bool PF16, int COLS, int PPP> class Xe2KvTorchAbiS1PagedReuseMPKernel;
template <int HKV, bool PF16> class Xe2KvTorchAbiS1PagedSmallKernel;
static bool s1_small_enabled() {
  const char *v = std::getenv("XE2_KV_SMALL_S1");
  return v == nullptr || v[0] != '0';
}
template <int HKV> class Xe2KvTorchAbiS2MergeKernel;
template <int HKV> class Xe2KvTorchAbiS2MergeOutKernel;
template <int HKV> class Xe2KvTorchAbiS2MergeOutHalfKernel;
template <int HKV, int N> class Xe2KvTorchAbiS2TwoPassHalf;
template <int HKV> class Xe2KvTorchAbiS2ParallelHalf8;
template <int HKV> class Xe2KvTorchAbiS2ParallelHalf16;
template <int HKV> class Xe2KvTorchAbiS2ParallelHalf32;
template <int HKV> class Xe2KvTorchAbiS2ParallelHalf8P16;
template <int HKV> class Xe2KvTorchAbiS2ParallelHalf16P16;
template <int HKV> class Xe2KvTorchAbiS2ParallelHalf32P16;
template <int HKV> class Xe2KvTorchAbiS2ParallelFloat8;
template <int HKV> class Xe2KvTorchAbiS2ParallelFloat16;
template <int HKV> class Xe2KvTorchAbiS2ParallelFloat32;
template <int HKV> class Xe2KvTorchAbiUnpackKernel;

static bool env_is_1(const char *name) {
  const char *value = std::getenv(name);
  return value != nullptr && value[0] == '1' && value[1] == '\0';
}

// Parallel merge is the decode path. XE2_KV_S2_PARALLEL=0 keeps the serial scan.
static bool s2_parallel_enabled() {
  const char *value = std::getenv("XE2_KV_S2_PARALLEL");
  return value == nullptr || value[0] != '0';
}

// Subgroups per query row for the parallel softmax merge. 32 cuts a 128K
// page chain from ~2000 serial steps to ~63. 8 and 16 stay available so a
// bench can pick the occupancy that actually wins.
static int s2_parallel_subgroups(int tq) {
  const char *value = std::getenv(tq == 1 ? "XE2_KV_S2_NSG_DRAFT" : "XE2_KV_S2_NSG_VERIFY");
  if (value == nullptr) value = std::getenv("XE2_KV_S2_NSG");
  if (value == nullptr) return 32;
  const int n = std::atoi(value);
  if (n == 8 || n == 16 || n == 32) return n;
  return 32;
}


template <int HKV>
static void launch_pack_q_quant(sycl::queue &q, const sycl::half *Qtok, std::int8_t *Q8,
                                float *Qsc, int tq) {
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int QQUANT_HEADS = Heads<HKV>::qquant_heads;
  // Pack [T,HQ,D] -> Q-once layout [HKV,BM,D] and quantize in one submit.
  // Pad rows (row >= tq*GQA) get scale=0 / q8=0.
  sycl::range<1> g(static_cast<size_t>(QQUANT_HEADS) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiPackQquantKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int kv_head = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int lane = static_cast<int>(sg.get_local_id());
          const int row = lid >> 1;
          const int part = lid & 1;
          const size_t q8_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t sc_off = static_cast<size_t>(kv_head) * BM;
          const int live = tq * GQA;
          if (row >= live) {
            if (part == 0) Qsc[sc_off + row] = 0.f;
            std::int8_t *dst = Q8 + q8_off + static_cast<size_t>(row) * BK + part * 128;
#pragma unroll
            for (int c = 0; c < 128; ++c) dst[c] = 0;
            return;
          }
          const int tok = row / GQA;
          const int gqa = row - tok * GQA;
          const int h = kv_head * GQA + gqa;
          const sycl::half *qrow =
              Qtok + (static_cast<size_t>(tok) * HQ + h) * BK + part * 128;
          float amax = 0.f;
#pragma unroll
          for (int c = 0; c < 128; ++c)
            amax = sycl::fmax(amax, sycl::fabs(static_cast<float>(qrow[c])));
          const float amax2 = sycl::select_from_group(sg, amax, lane ^ 1);
          amax = sycl::fmax(amax, amax2);
          const float scale = (amax == 0.f) ? 0.f : (amax / 127.f);
          if (part == 0) Qsc[sc_off + row] = scale;
          const float inv = (scale == 0.f) ? 0.f : (1.f / scale);
          std::int8_t *dst = Q8 + q8_off + static_cast<size_t>(row) * BK + part * 128;
#pragma unroll
          for (int c = 0; c < 128; ++c) {
            float qv = sycl::rint(static_cast<float>(qrow[c]) * inv);
            qv = sycl::clamp(qv, -127.f, 127.f);
            dst[c] = static_cast<std::int8_t>(qv);
          }
        });
  });
}

template <int HKV>
static void launch_q_quant(sycl::queue &q, const sycl::half *Qfp, std::int8_t *Q8, float *Qsc) {
  constexpr int QQUANT_HEADS = Heads<HKV>::qquant_heads;
  sycl::range<1> g(static_cast<size_t>(QQUANT_HEADS) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiQquantKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int kv_head = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int lane = static_cast<int>(sg.get_local_id());
          const int row = lid >> 1;
          const int part = lid & 1;
          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t sc_off = static_cast<size_t>(kv_head) * BM;
          const sycl::half *qrow = Qfp + q_off + static_cast<size_t>(row) * BK + part * 128;
          float amax = 0.f;
#pragma unroll
          for (int c = 0; c < 128; ++c)
            amax = sycl::fmax(amax, sycl::fabs(static_cast<float>(qrow[c])));
          const float amax2 = sycl::select_from_group(sg, amax, lane ^ 1);
          amax = sycl::fmax(amax, amax2);
          const float scale = (amax == 0.f) ? 0.f : (amax / 127.f);
          if (part == 0) Qsc[sc_off + row] = scale;
          const float inv = (scale == 0.f) ? 0.f : (1.f / scale);
          std::int8_t *drow = Q8 + q_off + static_cast<size_t>(row) * BK + part * 128;
#pragma unroll
          for (int c = 0; c < 128; ++c) {
            float qv = sycl::rint(static_cast<float>(qrow[c]) * inv);
            qv = sycl::clamp(qv, -127.f, 127.f);
            drow[c] = static_cast<std::int8_t>(qv);
          }
        });
  });
}

static void launch_k_store(sycl::queue &q, const sycl::half *Kfp, std::int8_t *K8, float *Ksc) {
  sycl::range<1> g(WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiKstoreKernel>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          auto sg = item.get_sub_group();
          const int lane = static_cast<int>(sg.get_local_id());
          const int row = lid >> 1;
          const int part = lid & 1;
          const sycl::half *krow = Kfp + static_cast<size_t>(row) * BK + part * 128;
          float amax = 0.f;
#pragma unroll
          for (int c = 0; c < 128; ++c)
            amax = sycl::fmax(amax, sycl::fabs(static_cast<float>(krow[c])));
          const float amax2 = sycl::select_from_group(sg, amax, lane ^ 1);
          amax = sycl::fmax(amax, amax2);
          const float scale = (amax == 0.f) ? 0.f : (amax / 127.f);
          if (part == 0) Ksc[row] = scale;
          const float inv = (scale == 0.f) ? 0.f : (1.f / scale);
          std::int8_t *drow = K8 + static_cast<size_t>(row) * BK + part * 128;
#pragma unroll
          for (int c = 0; c < 128; ++c) {
            float qv = sycl::rint(static_cast<float>(krow[c]) * inv);
            qv = sycl::clamp(qv, -127.f, 127.f);
            drow[c] = static_cast<std::int8_t>(qv);
          }
        });
  });
}

static void launch_v_store(sycl::queue &q, const sycl::half *Vfp, std::uint8_t *V4, float *VS,
                           float *VZ) {
  sycl::range<1> g(WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiVstoreKernel>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          auto sg = item.get_sub_group();
          const int lane = static_cast<int>(sg.get_local_id());
          const int row = lid >> 1;
          const int part = lid & 1;
          const sycl::half *vrow = Vfp + static_cast<size_t>(row) * BK + part * 128;
          float lo = INFINITY;
          float hi = -INFINITY;
#pragma unroll
          for (int c = 0; c < 128; ++c) {
            const float v = static_cast<float>(vrow[c]);
            lo = sycl::fmin(lo, v);
            hi = sycl::fmax(hi, v);
          }
          const float lo2 = sycl::select_from_group(sg, lo, lane ^ 1);
          const float hi2 = sycl::select_from_group(sg, hi, lane ^ 1);
          lo = sycl::fmin(lo, lo2);
          hi = sycl::fmax(hi, hi2);
          const float scale = sycl::fmax((hi - lo) / 15.f, 1.0e-8f);
          float zero = sycl::floor(-lo / scale + 0.5f);
          zero = sycl::fmax(0.f, sycl::fmin(15.f, zero));
          if (part == 0) {
            VS[row] = scale;
            VZ[row] = zero;
          }
          std::uint8_t *drow = V4 + static_cast<size_t>(row) * V4_COLS + part * 64;
#pragma unroll
          for (int b = 0; b < 64; ++b) {
            const float ve = static_cast<float>(vrow[2 * b]);
            const float vo = static_cast<float>(vrow[2 * b + 1]);
            float qe = sycl::floor(ve / scale + zero + 0.5f);
            float qo = sycl::floor(vo / scale + zero + 0.5f);
            qe = sycl::fmax(0.f, sycl::fmin(15.f, qe));
            qo = sycl::fmax(0.f, sycl::fmin(15.f, qo));
            drow[b] = static_cast<std::uint8_t>(qe) | (static_cast<std::uint8_t>(qo) << 4);
          }
        });
  });
}

template <int HKV>
static void launch_int8k_int4v_s1(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                  const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                  const float *VS, const float *VZ, float *O, int nprog) {
  TORCH_CHECK(nprog > 0 && (nprog % HKV) == 0, "nprog must be a positive multiple of HKV=", HKV);
  const int n_splits = nprog / HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(kSlmFloats), h);
    h.parallel_for<Xe2KvTorchAbiS1Kernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          const int kv_head = prog / n_splits;

          float *base_f = &slm[0];
          auto *base = reinterpret_cast<std::uint8_t *>(base_f);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *p_raw = reinterpret_cast<sycl::half *>(base + kSbytes);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(s_i32);

          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto p_slm = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                sycl::access::decorated::no>(p_raw);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);

          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          const size_t qkv_off = static_cast<size_t>(prog) * BM * BK;
          const size_t v4_off = static_cast<size_t>(prog) * BM * V4_COLS;
          const size_t sc_off = static_cast<size_t>(prog) * BM;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;

          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(Q8 + q_off));
          auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(K8 + qkv_off));
          auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                             sycl::access::decorated::no>(O + o_off);

          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t) ksc[t] = Ksc[sc_off + t * SG_SIZE + lane];

          {
            jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::a, TM, TK_I8,
                             jm::layout::row_major>
                a;
            jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::b, TK_I8, TN,
                             jm::layout::col_major>
                b;
            jm::joint_matrix<sycl::sub_group, std::int32_t, jm::use::accumulator, TM, TN> c0, c1, c2,
                c3;
            jm::joint_matrix_fill(sg, c0, 0);
            jm::joint_matrix_fill(sg, c1, 0);
            jm::joint_matrix_fill(sg, c2, 0);
            jm::joint_matrix_fill(sg, c3, 0);
            for (int k = 0; k < BK; k += TK_I8) {
              jm::joint_matrix_load(sg, a, pQ8 + row0 * BK + k, BK);
              jm::joint_matrix_load(sg, b, pK8 + (0 * TN) * BK + k, BK);
              jm::joint_matrix_mad(sg, c0, a, b, c0);
              jm::joint_matrix_load(sg, b, pK8 + (1 * TN) * BK + k, BK);
              jm::joint_matrix_mad(sg, c1, a, b, c1);
              jm::joint_matrix_load(sg, b, pK8 + (2 * TN) * BK + k, BK);
              jm::joint_matrix_mad(sg, c2, a, b, c2);
              jm::joint_matrix_load(sg, b, pK8 + (3 * TN) * BK + k, BK);
              jm::joint_matrix_mad(sg, c3, a, b, c3);
            }
            jm::joint_matrix_store(sg, c0, s_slm_i + row0 * BN + 0 * TN, BN, jm::layout::row_major);
            jm::joint_matrix_store(sg, c1, s_slm_i + row0 * BN + 1 * TN, BN, jm::layout::row_major);
            jm::joint_matrix_store(sg, c2, s_slm_i + row0 * BN + 2 * TN, BN, jm::layout::row_major);
            jm::joint_matrix_store(sg, c3, s_slm_i + row0 * BN + 3 * TN, BN, jm::layout::row_major);
          }

          sycl::group_barrier(sg);

          {
            for (int r = 0; r < TM; ++r) {
              const int row = row0 + r;
              const float qs = qsc[r];
              float m = -INFINITY;
              float vals[NTN];
              for (int t = 0; t < NTN; ++t) {
                const std::int32_t si = s_i32[row * BN + t * SG_SIZE + lane];
                float s = static_cast<float>(si) * qs * ksc[t] * INV_SQRT_D;
                vals[t] = s;
                m = sycl::max(m, s);
              }
              m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
              float sum = 0.f;
              float e[NTN];
              for (int t = 0; t < NTN; ++t) {
                e[t] = sycl::exp(vals[t] - m);
                sum += e[t];
              }
              sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
              float inv = (sum == 0.f) ? 0.f : 1.f / sum;
              for (int t = 0; t < NTN; ++t) {
                p_slm[row * BN + t * SG_SIZE + lane] = sycl::half(e[t] * inv);
              }
            }
          }

          sycl::group_barrier(sg);

          {
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::a, TM, TK, jm::layout::row_major>
                a;
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::b, TK, TN, jm::layout::row_major>
                b;
            for (int nbase = 0; nbase < BV; nbase += KV_HALF) {
              decode_v_int4_vec(lid, V4 + v4_off, VS + sc_off, VZ + sc_off, nbase, kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              for (int n0 = 0; n0 < KV_HALF; n0 += TN * PV_NCHUNK) {
                jm::joint_matrix<sycl::sub_group, float, jm::use::accumulator, TM, TN> c0, c1, c2,
                    c3;
                jm::joint_matrix_fill(sg, c0, 0.f);
                jm::joint_matrix_fill(sg, c1, 0.f);
                jm::joint_matrix_fill(sg, c2, 0.f);
                jm::joint_matrix_fill(sg, c3, 0.f);
                for (int k0 = 0; k0 < BN; k0 += TK) {
                  jm::joint_matrix_load(sg, a, p_slm + row0 * BN + k0, BN);
                  jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + (n0 + 0 * TN), KV_HALF);
                  jm::joint_matrix_mad(sg, c0, a, b, c0);
                  jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + (n0 + 1 * TN), KV_HALF);
                  jm::joint_matrix_mad(sg, c1, a, b, c1);
                  jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + (n0 + 2 * TN), KV_HALF);
                  jm::joint_matrix_mad(sg, c2, a, b, c2);
                  jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + (n0 + 3 * TN), KV_HALF);
                  jm::joint_matrix_mad(sg, c3, a, b, c3);
                }
                jm::joint_matrix_store(sg, c0, pO + row0 * BV + nbase + n0 + 0 * TN, BV,
                                       jm::layout::row_major);
                jm::joint_matrix_store(sg, c1, pO + row0 * BV + nbase + n0 + 1 * TN, BV,
                                       jm::layout::row_major);
                jm::joint_matrix_store(sg, c2, pO + row0 * BV + nbase + n0 + 2 * TN, BV,
                                       jm::layout::row_major);
                jm::joint_matrix_store(sg, c3, pO + row0 * BV + nbase + n0 + 3 * TN, BV,
                                       jm::layout::row_major);
              }
              if (nbase + KV_HALF < BV) item.barrier(sycl::access::fence_space::local_space);
            }
          }
        });
  });
}

// Gate C decode store: ONE q.submit for all ntok. T=q_len=7 is one kernel,
// grid = ntok * HKV * STORE_WG workgroups, not seven host launches.
template <int HKV>
static void launch_k_store_paged(sycl::queue &q, const sycl::half *Kfp, const std::int64_t *slots,
                                 std::int8_t *K8, float *Ksc, int64_t ntok, int64_t nblocks,
                                 size_t page_stride, size_t sc_page_stride) {
  sycl::range<1> g(static_cast<size_t>(ntok) * HKV * STORE_WG);
  sycl::range<1> l(STORE_WG);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiKstorePagedKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int gid = static_cast<int>(item.get_group(0));
          const int token = gid / HKV;
          const int head = gid - token * HKV;
          const std::int64_t slot = slots[token];
          const int phys = (slot >= 0) ? static_cast<int>(slot / PAGE) : -1;
          const int off = (slot >= 0) ? static_cast<int>(slot % PAGE) : -1;
          const bool valid = (phys >= 0 && phys < nblocks && off >= 0 && off < PAGE);
          const sycl::half *src = Kfp + (static_cast<size_t>(token) * HKV + head) * BK;
          float amax = 0.f;
          for (int c = lid; c < BK; c += STORE_WG)
            amax = sycl::fmax(amax, sycl::fabs(static_cast<float>(src[c])));
          amax = sycl::reduce_over_group(item.get_group(), amax, sycl::maximum<float>());
          item.barrier(sycl::access::fence_space::local_space);
          const float scale = (amax == 0.f) ? 0.f : (amax / 127.f);
          if (lid == 0 && valid)
            Ksc[static_cast<size_t>(phys) * sc_page_stride +
                (static_cast<size_t>(off) * HKV + head)] = scale;
          if (!valid) return;
          const float inv = (scale == 0.f) ? 0.f : (1.f / scale);
          std::int8_t *dst =
              K8 + static_cast<size_t>(phys) * page_stride + (static_cast<size_t>(off) * HKV + head) * BK;
          for (int c = lid; c < BK; c += STORE_WG) {
            float qv = sycl::rint(static_cast<float>(src[c]) * inv);
            qv = sycl::clamp(qv, -127.f, 127.f);
            dst[c] = static_cast<std::int8_t>(qv);
          }
        });
  });
}

// Same batched contract as K: T=7 is one VstorePaged kernel, not 7.
template <int HKV>
static void launch_v_store_paged(sycl::queue &q, const sycl::half *Vfp, const std::int64_t *slots,
                                 std::uint8_t *V4, float *VS, float *VZ, int64_t ntok,
                                 int64_t nblocks, size_t page_stride, size_t sc_page_stride) {
  sycl::range<1> g(static_cast<size_t>(ntok) * HKV * STORE_WG);
  sycl::range<1> l(STORE_WG);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiVstorePagedKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int gid = static_cast<int>(item.get_group(0));
          const int token = gid / HKV;
          const int head = gid - token * HKV;
          const std::int64_t slot = slots[token];
          const int phys = (slot >= 0) ? static_cast<int>(slot / PAGE) : -1;
          const int off = (slot >= 0) ? static_cast<int>(slot % PAGE) : -1;
          const bool valid = (phys >= 0 && phys < nblocks && off >= 0 && off < PAGE);
          const sycl::half *src = Vfp + (static_cast<size_t>(token) * HKV + head) * BK;
          float lo = INFINITY;
          float hi = -INFINITY;
          for (int c = lid; c < BK; c += STORE_WG) {
            const float v = static_cast<float>(src[c]);
            lo = sycl::fmin(lo, v);
            hi = sycl::fmax(hi, v);
          }
          lo = sycl::reduce_over_group(item.get_group(), lo, sycl::minimum<float>());
          hi = sycl::reduce_over_group(item.get_group(), hi, sycl::maximum<float>());
          item.barrier(sycl::access::fence_space::local_space);
          const float scale = sycl::fmax((hi - lo) / 15.f, 1.0e-8f);
          float zero = sycl::floor(-lo / scale + 0.5f);
          zero = sycl::fmax(0.f, sycl::fmin(15.f, zero));
          const size_t sc_i = static_cast<size_t>(phys) * sc_page_stride + (static_cast<size_t>(off) * HKV + head);
          if (lid == 0 && valid) {
            VS[sc_i] = scale;
            VZ[sc_i] = zero;
          }
          if (!valid) return;
          std::uint8_t *dst =
              V4 + static_cast<size_t>(phys) * page_stride + (static_cast<size_t>(off) * HKV + head) * V4_COLS;
          for (int b = lid; b < V4_COLS; b += STORE_WG) {
            const float ve = static_cast<float>(src[2 * b]);
            const float vo = static_cast<float>(src[2 * b + 1]);
            float qe = sycl::floor(ve / scale + zero + 0.5f);
            float qo = sycl::floor(vo / scale + zero + 0.5f);
            qe = sycl::fmax(0.f, sycl::fmin(15.f, qe));
            qo = sycl::fmax(0.f, sycl::fmin(15.f, qo));
            dst[b] = static_cast<std::uint8_t>(qe) | (static_cast<std::uint8_t>(qo) << 4);
          }
        });
  });
}

// q_len * GQA <= TM (the 1-token MTP draft step: 6 live rows). The generic kernel leaves 7 of 8
// sub-groups idle while sub-group 0 does all QK, softmax and PV work for the page. This variant spreads
// the page over all 8: QK by 16-token tile (sub-groups 0..3), softmax by row (one row per sub-group),
// PV by 16-column tile (one tile per sub-group for each 128-column half). Each element is still
// accumulated over the same k order, so the output is bit-identical to the generic kernel.
// A work-group barrier separates every cross-sub-group hand-off, including the last S read and the
// first V write (the decoded V tile aliases the S tile).
template <int HKV, bool PF16>
static void launch_int8k_int4v_s1_paged_small(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                              const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                              const float *VS, const float *VZ, const std::int32_t *bt,
                                              const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                              int n_splits, int q_len, size_t k_page_stride,
                                              size_t v_page_stride, size_t sc_page_stride,
                                              const std::int32_t *visible_lens, int pages_per_block) {
  constexpr int GQA = Heads<HKV>::gqa;
  const int nprog = n_splits * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  constexpr int kSmallFloats =
      (kSbytes + TM * BN * static_cast<int>(sizeof(sycl::half)) + static_cast<int>(sizeof(float)) - 1) /
      static_cast<int>(sizeof(float));
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(kSmallFloats), h);
    h.parallel_for<Xe2KvTorchAbiS1PagedSmallKernel<HKV, PF16>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int lane = static_cast<int>(sg.get_local_id());
          const int kv_head = prog / n_splits;
          const int logical = prog - kv_head * n_splits;
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const std::int64_t n_valid64 = sycl::max(
              static_cast<std::int64_t>(0),
              sycl::min(static_cast<std::int64_t>(BM),
                        seq_len - static_cast<std::int64_t>(logical) * BM));
          const int n_valid = static_cast<int>(n_valid64);
          if (n_valid <= 0) return;  // work-group uniform
          const int phys = (pages_per_block <= 1)
                               ? static_cast<int>(bt[logical])
                               : static_cast<int>(bt[logical / pages_per_block]) * pages_per_block +
                                     (logical % pages_per_block);

          float *base_f = &slm[0];
          auto *base = reinterpret_cast<std::uint8_t *>(base_f);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *p_raw = reinterpret_cast<sycl::half *>(base + kSbytes);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(s_i32);
          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto p_slm = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                sycl::access::decorated::no>(p_raw);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);

          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;
          const size_t k_head_off =
              static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
          const size_t v_head_off =
              static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t sc_head_off =
              static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);
          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(Q8 + q_off));
          auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(K8 + k_head_off));
          auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                             sycl::access::decorated::no>(Part + o_off);
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              reinterpret_cast<sycl::half *>(Part) + o_off);

          // QK: sub-group t owns tokens [16t, 16t+16) for the 8 query rows.
          if (sg_id < NTN) {
            jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::a, TM, TK_I8, jm::layout::row_major> a;
            jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::b, TK_I8, TN, jm::layout::col_major> b;
            jm::joint_matrix<sycl::sub_group, std::int32_t, jm::use::accumulator, TM, TN> c;
            jm::joint_matrix_fill(sg, c, 0);
            for (int k = 0; k < BK; k += TK_I8) {
              jm::joint_matrix_load(sg, a, pQ8 + k, BK);
              jm::joint_matrix_load(sg, b, pK8 + (sg_id * TN) * k_tok_stride + k, k_tok_stride);
              jm::joint_matrix_mad(sg, c, a, b, c);
            }
            jm::joint_matrix_store(sg, c, s_slm_i + sg_id * TN, BN, jm::layout::row_major);
          }
          item.barrier(sycl::access::fence_space::local_space);

          // softmax: sub-group r owns row r (rows >= q_len*GQA are padding and publish M=-inf, L=0)
          {
            const int row = sg_id;
            const float qs = Qsc[qsc_off + row];
            float ksc[NTN];
#pragma unroll
            for (int t = 0; t < NTN; ++t)
              ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];
            float m = -INFINITY;
            float vals[NTN];
            const int q_tok = row / GQA;
            const bool live_q = row < q_len * GQA;
            const std::int64_t q_end = live_q
                ? (visible_lens ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                                : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                : 0;
            for (int t = 0; t < NTN; ++t) {
              const int tok = t * SG_SIZE + lane;
              const std::int32_t si = s_i32[row * BN + t * SG_SIZE + lane];
              float s = static_cast<float>(si) * qs * ksc[t] * INV_SQRT_D;
              const std::int64_t k_abs = static_cast<std::int64_t>(logical) * BM + tok;
              if (tok >= n_valid || row >= q_len * GQA || k_abs >= q_end) s = -INFINITY;
              vals[t] = s;
              m = sycl::max(m, s);
            }
            m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
            float sum = 0.f;
            float e[NTN];
            if (m == -INFINITY) {
              for (int t = 0; t < NTN; ++t) e[t] = 0.f;
            } else {
              for (int t = 0; t < NTN; ++t) {
                e[t] = sycl::exp(vals[t] - m);
                sum += e[t];
              }
              sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
            }
            float inv = (sum == 0.f) ? 0.f : 1.f / sum;
            for (int t = 0; t < NTN; ++t) p_slm[row * BN + t * SG_SIZE + lane] = sycl::half(e[t] * inv);
            if (lane == 0) {
              M[ml_off + row] = m;
              L[ml_off + row] = sum;
            }
          }
          // every S read is finished and P is visible before the V tile overwrites S
          item.barrier(sycl::access::fence_space::local_space);

          {
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::a, TM, TK, jm::layout::row_major> a;
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::b, TK, TN, jm::layout::row_major> b;
            for (int nbase = 0; nbase < BV; nbase += KV_HALF) {
              decode_v_int4_vec_strided(lid, V4 + v_head_off, v_tok_stride, VS + sc_head_off,
                                        VZ + sc_head_off, sc_tok_stride, nbase, n_valid, kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              // sub-group g owns output columns [nbase + 16g, nbase + 16g + 16)
              jm::joint_matrix<sycl::sub_group, float, jm::use::accumulator, TM, TN> c;
              jm::joint_matrix_fill(sg, c, 0.f);
              for (int k0 = 0; k0 < BN; k0 += TK) {
                jm::joint_matrix_load(sg, a, p_slm + k0, BN);
                jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + sg_id * TN, KV_HALF);
                jm::joint_matrix_mad(sg, c, a, b, c);
              }
              if constexpr (PF16) {
                jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::accumulator, TM, TN> hc;
                jm::joint_matrix_copy(sg, c, hc);
                jm::joint_matrix_store(sg, hc, pOh + nbase + sg_id * TN, BV, jm::layout::row_major);
              } else {
                jm::joint_matrix_store(sg, c, pO + nbase + sg_id * TN, BV, jm::layout::row_major);
              }
              if (nbase + KV_HALF < BV) item.barrier(sycl::access::fence_space::local_space);
            }
          }
        });
  });
}

template <int HKV, bool PF16>
static void launch_int8k_int4v_s1_paged(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                        const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                        const float *VS, const float *VZ, const std::int32_t *bt,
                                        const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                        int n_splits, int q_len,
                                        size_t k_page_stride, size_t v_page_stride, size_t sc_page_stride,
                                        const std::int32_t *visible_lens = nullptr,
                                        int pages_per_block = 1) {
  constexpr int GQA = Heads<HKV>::gqa;
  if (q_len * GQA <= TM && s2_parallel_enabled() && s1_small_enabled()) {
    launch_int8k_int4v_s1_paged_small<HKV, PF16>(q, Q8, Qsc, K8, Ksc, V4, VS, VZ, bt, seq_lens, Part, M, L,
                                                 n_splits, q_len, k_page_stride, v_page_stride,
                                                 sc_page_stride, visible_lens, pages_per_block);
    return;
  }
  const int nprog = n_splits * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(kSlmFloats), h);
    h.parallel_for<Xe2KvTorchAbiS1PagedKernel<HKV, PF16>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          // Live-row gating (perf): BM=64 pads the query tile, but a decode step has only
          // q_len*GQA real rows (6 for a draft, 42 for MTP6 verify). A sub-group whose
          // 8 rows are all padding has nothing to compute or store. The flag is uniform
          // per sub-group, so joint_matrix collectives stay legal; every barrier below is
          // still taken by the whole work-group.
          const bool sg_live = row0 < q_len * GQA;
          const int kv_head = prog / n_splits;
          const int logical = prog - kv_head * n_splits;
          // Legacy path uses one final count. Varlen path reserves element 0
          // for max visible length and elements [1..q_len] for each query
          // row, matching Intel's speculative verifier contract.
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const std::int64_t n_valid64 = sycl::max(
              static_cast<std::int64_t>(0),
              sycl::min(static_cast<std::int64_t>(BM),
                        seq_len - static_cast<std::int64_t>(logical) * BM));
          const int n_valid = static_cast<int>(n_valid64);
          // Graph-static n_splits pads past seq_len. S2 only merges n_live
          // splits, so empty groups can return without touching SLM/DPAS.
          if (n_valid <= 0) return;
          // pages_per_block==1: block_table entries are already 64-token pages.
          // Larger vLLM blocks expand as block_id * ratio + page_in_block, which
          // matches slot/64 used by the store. No host-side table is built.
          const int phys = (pages_per_block <= 1)
                               ? static_cast<int>(bt[logical])
                               : static_cast<int>(bt[logical / pages_per_block]) * pages_per_block +
                                     (logical % pages_per_block);

          float *base_f = &slm[0];
          auto *base = reinterpret_cast<std::uint8_t *>(base_f);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *p_raw = reinterpret_cast<sycl::half *>(base + kSbytes);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(s_i32);

          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto p_slm = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                sycl::access::decorated::no>(p_raw);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);

          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;
          const size_t k_head_off =
              static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
          const size_t v_head_off =
              static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t sc_head_off =
              static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);

          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(Q8 + q_off));
          auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(K8 + k_head_off));
          auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                             sycl::access::decorated::no>(Part + o_off);
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              reinterpret_cast<sycl::half *>(Part) + o_off);

          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t)
            ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];

          if (sg_live) {
            jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::a, TM, TK_I8,
                             jm::layout::row_major>
                a;
            jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::b, TK_I8, TN,
                             jm::layout::col_major>
                b;
            jm::joint_matrix<sycl::sub_group, std::int32_t, jm::use::accumulator, TM, TN> c0, c1, c2,
                c3;
            jm::joint_matrix_fill(sg, c0, 0);
            jm::joint_matrix_fill(sg, c1, 0);
            jm::joint_matrix_fill(sg, c2, 0);
            jm::joint_matrix_fill(sg, c3, 0);
            for (int k = 0; k < BK; k += TK_I8) {
              jm::joint_matrix_load(sg, a, pQ8 + row0 * BK + k, BK);
              jm::joint_matrix_load(sg, b, pK8 + (0 * TN) * k_tok_stride + k, k_tok_stride);
              jm::joint_matrix_mad(sg, c0, a, b, c0);
              jm::joint_matrix_load(sg, b, pK8 + (1 * TN) * k_tok_stride + k, k_tok_stride);
              jm::joint_matrix_mad(sg, c1, a, b, c1);
              jm::joint_matrix_load(sg, b, pK8 + (2 * TN) * k_tok_stride + k, k_tok_stride);
              jm::joint_matrix_mad(sg, c2, a, b, c2);
              jm::joint_matrix_load(sg, b, pK8 + (3 * TN) * k_tok_stride + k, k_tok_stride);
              jm::joint_matrix_mad(sg, c3, a, b, c3);
            }
            jm::joint_matrix_store(sg, c0, s_slm_i + row0 * BN + 0 * TN, BN, jm::layout::row_major);
            jm::joint_matrix_store(sg, c1, s_slm_i + row0 * BN + 1 * TN, BN, jm::layout::row_major);
            jm::joint_matrix_store(sg, c2, s_slm_i + row0 * BN + 2 * TN, BN, jm::layout::row_major);
            jm::joint_matrix_store(sg, c3, s_slm_i + row0 * BN + 3 * TN, BN, jm::layout::row_major);
          }

          sycl::group_barrier(sg);

          if (!sg_live) {
            // Padding-only sub-group: publish an empty softmax state so any S2 variant
            // that touches these rows sees M=-inf, L=0 instead of stale workspace.
            if (lane < TM) {
              M[ml_off + row0 + lane] = -INFINITY;
              L[ml_off + row0 + lane] = 0.f;
            }
          } else {
            for (int r = 0; r < TM; ++r) {
              const int row = row0 + r;
              const float qs = qsc[r];
              float m = -INFINITY;
              float vals[NTN];
              const int q_tok = row / GQA;
              // BM=64 pads the packed query tile.  Only live query rows have
              // a visible-lens entry; never read past [1+q_len].
              const bool live_q = row < q_len * GQA;
              const std::int64_t q_end = live_q
                  ? (visible_lens
                         ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                         : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                  : 0;
              for (int t = 0; t < NTN; ++t) {
                const int tok = t * SG_SIZE + lane;
                const std::int32_t si = s_i32[row * BN + t * SG_SIZE + lane];
                float s = static_cast<float>(si) * qs * ksc[t] * INV_SQRT_D;
                // n_valid = tokens in this page; q_end = causal end for this spec Q token.
                // t=1 → q_end==seq_len (same as tok>=n_valid on the last page).
                // t>1 MTP → query i cannot see keys at/after seq_len-t+i+1.
                const std::int64_t k_abs =
                    static_cast<std::int64_t>(logical) * BM + tok;
                if (tok >= n_valid || row >= q_len * GQA || k_abs >= q_end) s = -INFINITY;
                vals[t] = s;
                m = sycl::max(m, s);
              }
              m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
              float sum = 0.f;
              float e[NTN];
              if (m == -INFINITY) {
                for (int t = 0; t < NTN; ++t) e[t] = 0.f;
              } else {
                for (int t = 0; t < NTN; ++t) {
                  e[t] = sycl::exp(vals[t] - m);
                  sum += e[t];
                }
                sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
              }
              float inv = (sum == 0.f) ? 0.f : 1.f / sum;
              for (int t = 0; t < NTN; ++t) {
                p_slm[row * BN + t * SG_SIZE + lane] = sycl::half(e[t] * inv);
              }
              if (lane == 0) {
                M[ml_off + row] = m;
                L[ml_off + row] = sum;
              }
            }
          }

          sycl::group_barrier(sg);

          {
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::a, TM, TK, jm::layout::row_major>
                a;
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::b, TK, TN, jm::layout::row_major>
                b;
            for (int nbase = 0; nbase < BV; nbase += KV_HALF) {
              decode_v_int4_vec_strided(lid, V4 + v_head_off, v_tok_stride, VS + sc_head_off,
                                        VZ + sc_head_off, sc_tok_stride, nbase, n_valid, kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              // The V tile above is decoded cooperatively by the whole work-group (and
              // both barriers stay unconditional). Only sub-groups owning live rows run
              // the PV matmul and write their partial O; padding rows' O is never read.
              if (sg_live)
              for (int n0 = 0; n0 < KV_HALF; n0 += TN * PV_NCHUNK) {
                jm::joint_matrix<sycl::sub_group, float, jm::use::accumulator, TM, TN> c0, c1, c2,
                    c3;
                jm::joint_matrix_fill(sg, c0, 0.f);
                jm::joint_matrix_fill(sg, c1, 0.f);
                jm::joint_matrix_fill(sg, c2, 0.f);
                jm::joint_matrix_fill(sg, c3, 0.f);
                for (int k0 = 0; k0 < BN; k0 += TK) {
                  jm::joint_matrix_load(sg, a, p_slm + row0 * BN + k0, BN);
                  jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + (n0 + 0 * TN), KV_HALF);
                  jm::joint_matrix_mad(sg, c0, a, b, c0);
                  jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + (n0 + 1 * TN), KV_HALF);
                  jm::joint_matrix_mad(sg, c1, a, b, c1);
                  jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + (n0 + 2 * TN), KV_HALF);
                  jm::joint_matrix_mad(sg, c2, a, b, c2);
                  jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + (n0 + 3 * TN), KV_HALF);
                  jm::joint_matrix_mad(sg, c3, a, b, c3);
                }
                if constexpr (PF16) {
                  // fp16 partials: halves S1 stores and S2 loads. Convert accumulator -> half
                  // accumulator, then the normal 2-D store.
                  jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::accumulator, TM, TN> h0, h1,
                      h2, h3;
                  jm::joint_matrix_copy(sg, c0, h0);
                  jm::joint_matrix_copy(sg, c1, h1);
                  jm::joint_matrix_copy(sg, c2, h2);
                  jm::joint_matrix_copy(sg, c3, h3);
                  jm::joint_matrix_store(sg, h0, pOh + row0 * BV + nbase + n0 + 0 * TN, BV,
                                         jm::layout::row_major);
                  jm::joint_matrix_store(sg, h1, pOh + row0 * BV + nbase + n0 + 1 * TN, BV,
                                         jm::layout::row_major);
                  jm::joint_matrix_store(sg, h2, pOh + row0 * BV + nbase + n0 + 2 * TN, BV,
                                         jm::layout::row_major);
                  jm::joint_matrix_store(sg, h3, pOh + row0 * BV + nbase + n0 + 3 * TN, BV,
                                         jm::layout::row_major);
                } else {
                jm::joint_matrix_store(sg, c0, pO + row0 * BV + nbase + n0 + 0 * TN, BV,
                                       jm::layout::row_major);
                jm::joint_matrix_store(sg, c1, pO + row0 * BV + nbase + n0 + 1 * TN, BV,
                                       jm::layout::row_major);
                jm::joint_matrix_store(sg, c2, pO + row0 * BV + nbase + n0 + 2 * TN, BV,
                                       jm::layout::row_major);
                jm::joint_matrix_store(sg, c3, pO + row0 * BV + nbase + n0 + 3 * TN, BV,
                                       jm::layout::row_major);
                }
              }
              if (nbase + KV_HALF < BV) item.barrier(sycl::access::fence_space::local_space);
            }
          }
        });
  });
}

// Round-3 decode variant: VW = bytes per vector load (8 = original, 16 = one 16B load per step).
template<int COLS, int VW>
static inline void decode_v_int4_reuse_vw(int lid,const std::uint8_t *v4_head,int v_tok_stride,
 const float scale,const float zero,int nbase,int n_valid,sycl::half *kv_tile){
 const int tok=lid>>1,part=lid&1;
 auto dst=kv_tile+tok*COLS+part*(COLS/2);
 if(tok>=n_valid){
   #pragma unroll
   for(int j=0;j<COLS/2;++j) dst[j]=sycl::half(0.f);
   return;
 }
 const auto src=v4_head+static_cast<size_t>(tok)*v_tok_stride+(nbase>>1)+part*(COLS/4);
 constexpr int W = (VW > COLS/4) ? COLS/4 : VW;
 #pragma unroll
 for(int offset=0;offset<COLS/4;offset+=W){
   if constexpr (W == 16) {
     const sycl::vec<std::uint32_t,4> raw = *reinterpret_cast<const sycl::vec<std::uint32_t,4>*>(src+offset);
     #pragma unroll
     for(int w=0;w<4;++w){
       const std::uint32_t u = raw[w];
       #pragma unroll
       for(int j=0;j<4;++j){
         const std::uint8_t b=static_cast<std::uint8_t>(u>>(8*j));
         const int e = 2*(offset+w*4+j);
         dst[e]=sycl::half((static_cast<float>(b&0xfu)-zero)*scale);
         dst[e+1]=sycl::half((static_cast<float>(b>>4)-zero)*scale);
       }
     }
   } else {
     std::uint64_t raw;std::memcpy(&raw,src+offset,sizeof(raw));
     #pragma unroll
     for(int j=0;j<8;++j){
       const std::uint8_t b=static_cast<std::uint8_t>(raw>>(8*j));
       dst[2*(offset+j)]=sycl::half((static_cast<float>(b&0xfu)-zero)*scale);
       dst[2*(offset+j)+1]=sycl::half((static_cast<float>(b>>4)-zero)*scale);
     }
   }
 }
}
// Opt-in MTP6 verifier: 8-KiB SLM, original dot products and softmax order.
template<int COLS>
static inline void decode_v_int4_reuse(int lid,const std::uint8_t *v4_head,int v_tok_stride,
 const float scale,const float zero,int nbase,int n_valid,sycl::half *kv_tile){
 const int tok=lid>>1,part=lid&1;
 auto dst=kv_tile+tok*COLS+part*(COLS/2);
 if(tok>=n_valid){
   #pragma unroll
   for(int j=0;j<COLS/2;++j) dst[j]=sycl::half(0.f);
   return;
 }
 const auto src=v4_head+static_cast<size_t>(tok)*v_tok_stride+(nbase>>1)+part*(COLS/4);
 #pragma unroll
 for(int offset=0;offset<COLS/4;offset+=8){
   std::uint64_t raw;std::memcpy(&raw,src+offset,sizeof(raw));
   #pragma unroll
   for(int j=0;j<8;++j){
     const std::uint8_t b=static_cast<std::uint8_t>(raw>>(8*j));
     dst[2*(offset+j)]=sycl::half((static_cast<float>(b&0xfu)-zero)*scale);
     dst[2*(offset+j)+1]=sycl::half((static_cast<float>(b>>4)-zero)*scale);
   }
 }
}
template <int HKV, bool PF16, int COLS>
static void launch_int8k_int4v_s1_paged_reuse(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                        const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                        const float *VS, const float *VZ, const std::int32_t *bt,
                                        const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                        int n_splits, int q_len,
                                        size_t k_page_stride, size_t v_page_stride, size_t sc_page_stride,
                                        const std::int32_t *visible_lens = nullptr,
                                        int pages_per_block = 1) {
  constexpr int GQA = Heads<HKV>::gqa;
  if (q_len * GQA <= TM && s2_parallel_enabled() && s1_small_enabled()) {
    launch_int8k_int4v_s1_paged_small<HKV, PF16>(q, Q8, Qsc, K8, Ksc, V4, VS, VZ, bt, seq_lens, Part, M, L,
                                                 n_splits, q_len, k_page_stride, v_page_stride,
                                                 sc_page_stride, visible_lens, pages_per_block);
    return;
  }
  const int nprog = n_splits * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(8192 / sizeof(float)), h);
    h.parallel_for<Xe2KvTorchAbiS1PagedReuseKernel<HKV, PF16, COLS>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          // Live-row gating (perf): BM=64 pads the query tile, but a decode step has only
          // q_len*GQA real rows (6 for a draft, 42 for MTP6 verify). A sub-group whose
          // 8 rows are all padding has nothing to compute or store. The flag is uniform
          // per sub-group, so joint_matrix collectives stay legal; every barrier below is
          // still taken by the whole work-group.
          const bool sg_live = row0 < q_len * GQA;
          const int kv_head = prog / n_splits;
          const int logical = prog - kv_head * n_splits;
          // Legacy path uses one final count. Varlen path reserves element 0
          // for max visible length and elements [1..q_len] for each query
          // row, matching Intel's speculative verifier contract.
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const std::int64_t n_valid64 = sycl::max(
              static_cast<std::int64_t>(0),
              sycl::min(static_cast<std::int64_t>(BM),
                        seq_len - static_cast<std::int64_t>(logical) * BM));
          const int n_valid = static_cast<int>(n_valid64);
          // Graph-static n_splits pads past seq_len. S2 only merges n_live
          // splits, so empty groups can return without touching SLM/DPAS.
          if (n_valid <= 0) return;
          // pages_per_block==1: block_table entries are already 64-token pages.
          // Larger vLLM blocks expand as block_id * ratio + page_in_block, which
          // matches slot/64 used by the store. No host-side table is built.
          const int phys = (pages_per_block <= 1)
                               ? static_cast<int>(bt[logical])
                               : static_cast<int>(bt[logical / pages_per_block]) * pages_per_block +
                                     (logical % pages_per_block);

          float *base_f = &slm[0];
          auto *base = reinterpret_cast<std::uint8_t *>(base_f);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *p_raw = reinterpret_cast<sycl::half *>(base);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(base);

          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto p_slm = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                sycl::access::decorated::no>(p_raw);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);

          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;
          const size_t k_head_off =
              static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
          const size_t v_head_off =
              static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t sc_head_off =
              static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);

          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(Q8 + q_off));
          auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(K8 + k_head_off));
          auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                             sycl::access::decorated::no>(Part + o_off);
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              reinterpret_cast<sycl::half *>(Part) + o_off);

          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t)
            ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];

          float first_scores[TM][2];
          for(int half=0;half<2;++half){
            if(sg_live){
              jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::a,TM,TK_I8,jm::layout::row_major> a;
              jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::b,TK_I8,TN,jm::layout::col_major> b;
              jm::joint_matrix<sycl::sub_group,std::int32_t,jm::use::accumulator,TM,TN> c0,c1;
              jm::joint_matrix_fill(sg,c0,0);jm::joint_matrix_fill(sg,c1,0);
              for(int k=0;k<BK;k+=TK_I8){
                jm::joint_matrix_load(sg,a,pQ8+row0*BK+k,BK);
                jm::joint_matrix_load(sg,b,pK8+(half*32)*k_tok_stride+k,k_tok_stride);
                jm::joint_matrix_mad(sg,c0,a,b,c0);
                jm::joint_matrix_load(sg,b,pK8+(half*32+16)*k_tok_stride+k,k_tok_stride);
                jm::joint_matrix_mad(sg,c1,a,b,c1);
              }
              jm::joint_matrix_store(sg,c0,s_slm_i+row0*32,32,jm::layout::row_major);
              jm::joint_matrix_store(sg,c1,s_slm_i+row0*32+16,32,jm::layout::row_major);
            }
            sycl::group_barrier(sg);
            if(half==0 && sg_live){
              #pragma unroll
              for(int r=0;r<TM;++r){
                #pragma unroll
                for(int t=0;t<2;++t)
                  first_scores[r][t]=static_cast<float>(s_i32[(row0+r)*32+t*16+lane])*qsc[r]*ksc[t]*INV_SQRT_D;
              }
            }
            // Each subgroup owns its score rows; all first-half reads must
            // finish before it overwrites those rows with the second half.
            sycl::group_barrier(sg);
          }

          sycl::half saved_p[TM][NTN];
          if (!sg_live) {
            // Padding-only sub-group: publish an empty softmax state so any S2 variant
            // that touches these rows sees M=-inf, L=0 instead of stale workspace.
            if (lane < TM) {
              M[ml_off + row0 + lane] = -INFINITY;
              L[ml_off + row0 + lane] = 0.f;
            }
          } else {
            #pragma unroll
            for (int r = 0; r < TM; ++r) {
              const int row = row0 + r;
              const float qs = qsc[r];
              float m = -INFINITY;
              float vals[NTN];
              const int q_tok = row / GQA;
              // BM=64 pads the packed query tile.  Only live query rows have
              // a visible-lens entry; never read past [1+q_len].
              const bool live_q = row < q_len * GQA;
              const std::int64_t q_end = live_q
                  ? (visible_lens
                         ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                         : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                  : 0;
              for (int t = 0; t < NTN; ++t) {
                const int tok = t * SG_SIZE + lane;
                float s;
                if(t<2) s=first_scores[r][t];
                else {
                  const std::int32_t si=s_i32[row*32+(t-2)*SG_SIZE+lane];
                  s=static_cast<float>(si)*qs*ksc[t]*INV_SQRT_D;
                }
                // n_valid = tokens in this page; q_end = causal end for this spec Q token.
                // t=1 → q_end==seq_len (same as tok>=n_valid on the last page).
                // t>1 MTP → query i cannot see keys at/after seq_len-t+i+1.
                const std::int64_t k_abs =
                    static_cast<std::int64_t>(logical) * BM + tok;
                if (tok >= n_valid || row >= q_len * GQA || k_abs >= q_end) s = -INFINITY;
                vals[t] = s;
                m = sycl::max(m, s);
              }
              m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
              float sum = 0.f;
              float e[NTN];
              if (m == -INFINITY) {
                for (int t = 0; t < NTN; ++t) e[t] = 0.f;
              } else {
                for (int t = 0; t < NTN; ++t) {
                  e[t] = sycl::exp(vals[t] - m);
                  sum += e[t];
                }
                sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
              }
              float inv = (sum == 0.f) ? 0.f : 1.f / sum;
              for (int t = 0; t < NTN; ++t) {
                saved_p[r][t] = sycl::half(e[t] * inv);
              }
              if (lane == 0) {
                M[ml_off + row] = m;
                L[ml_off + row] = sum;
              }
            }
          }

          // In-place score -> probability packing changes ownership across
          // sub-groups. Every score read must finish before the first store.
          item.barrier(sycl::access::fence_space::local_space);
          if (sg_live) {
            #pragma unroll
            for (int r=0; r<TM; ++r) {
              #pragma unroll
              for (int t=0; t<NTN; ++t)
                p_slm[(row0+r)*BN + t*SG_SIZE+lane] = saved_p[r][t];
            }
          }
          item.barrier(sycl::access::fence_space::local_space);

          {
            // Four named matrices avoid the known joint_matrix-array issue.
            jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::a,TM,TK,jm::layout::row_major> a0,a1,a2,a3;
            jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::b,TK,TN,jm::layout::row_major> b;
            if(sg_live){
              jm::joint_matrix_load(sg,a0,p_slm+row0*BN,BN);
              jm::joint_matrix_load(sg,a1,p_slm+row0*BN+16,BN);
              jm::joint_matrix_load(sg,a2,p_slm+row0*BN+32,BN);
              jm::joint_matrix_load(sg,a3,p_slm+row0*BN+48,BN);
            }
            // All subgroups finish loading P into registers before V
            // decoding reuses that same shared-memory address range.
            item.barrier(sycl::access::fence_space::local_space);
            // VS/VZ are immutable for this page throughout the column loop.
            // Preserve all arithmetic, valid-token guards, and SLM ownership barriers.
            const int v_tok = lid >> 1;
            const bool v_valid = v_tok < n_valid;
            const float v_scale = v_valid ? VS[sc_head_off + v_tok * sc_tok_stride] : 0.f;
            const float v_zero = v_valid ? VZ[sc_head_off + v_tok * sc_tok_stride] : 0.f;
            #pragma unroll 1
            for(int nbase=0;nbase<BV;nbase+=COLS){
              decode_v_int4_reuse<COLS>(lid,V4+v_head_off,v_tok_stride,v_scale,v_zero,
                                       nbase,n_valid,kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              if(sg_live){
                jm::joint_matrix<sycl::sub_group,float,jm::use::accumulator,TM,TN> c0,c1,c2,c3;
                jm::joint_matrix_fill(sg,c0,0.f);jm::joint_matrix_fill(sg,c1,0.f);
                if constexpr(COLS==64){jm::joint_matrix_fill(sg,c2,0.f);jm::joint_matrix_fill(sg,c3,0.f);}
                #define REUSE_MAD(A,K) \
                  jm::joint_matrix_load(sg,b,pKV+K*COLS,COLS); \
                  jm::joint_matrix_mad(sg,c0,A,b,c0); \
                  jm::joint_matrix_load(sg,b,pKV+K*COLS+16,COLS); \
                  jm::joint_matrix_mad(sg,c1,A,b,c1); \
                  if constexpr(COLS==64){ \
                    jm::joint_matrix_load(sg,b,pKV+K*COLS+32,COLS); \
                    jm::joint_matrix_mad(sg,c2,A,b,c2); \
                    jm::joint_matrix_load(sg,b,pKV+K*COLS+48,COLS); \
                    jm::joint_matrix_mad(sg,c3,A,b,c3); \
                  }
                REUSE_MAD(a0,0);REUSE_MAD(a1,16);REUSE_MAD(a2,32);REUSE_MAD(a3,48);
                #undef REUSE_MAD
                if constexpr(PF16){
                  jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
                  jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
                  jm::joint_matrix_store(sg,h0,pOh+row0*BV+nbase,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h1,pOh+row0*BV+nbase+16,BV,jm::layout::row_major);
                  if constexpr(COLS==64){
                    jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
                    jm::joint_matrix_store(sg,h2,pOh+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h3,pOh+row0*BV+nbase+48,BV,jm::layout::row_major);
                  }
                } else {
                  jm::joint_matrix_store(sg,c0,pO+row0*BV+nbase,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,c1,pO+row0*BV+nbase+16,BV,jm::layout::row_major);
                  if constexpr(COLS==64){
                    jm::joint_matrix_store(sg,c2,pO+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,c3,pO+row0*BV+nbase+48,BV,jm::layout::row_major);
                  }
                }
              }
              if(nbase+COLS<BV) item.barrier(sycl::access::fence_space::local_space);
            }
          }
        });
  });
}

// Row-scale an 8xN fp32 accumulator. Xe2 DPAS C layout: work-item element i is row i
// of the tile (one column per lane). Verified by the mp correctness check (per-row
// factors differ, so a wrong mapping shows up as error vs fp32).
template <typename JM>
static inline void mp_scale_rows_lane(sycl::sub_group sg, JM &c, float lane_val) {
  // lane r (< TM) carries row r's factor; broadcast it per row.
#if defined(__SYCL_DEVICE_ONLY__)
  auto w = sycl::ext::oneapi::detail::get_wi_data(sg, c);
#pragma unroll
  for (int i = 0; i < TM; ++i) { const float f = sycl::select_from_group(sg, lane_val, i); float e = w[i]; w[i] = e * f; }
#else
  std::ignore = sg; std::ignore = c; std::ignore = lane_val;
#endif
}
template <typename JM>
static inline void mp_scale_rows(sycl::sub_group sg, JM &c, const float (&al)[TM]) {
#if defined(__SYCL_DEVICE_ONLY__)
  auto w = sycl::ext::oneapi::detail::get_wi_data(sg, c);
#pragma unroll
  for (int i = 0; i < TM; ++i) { float e = w[i]; w[i] = e * al[i]; }
#else
  std::ignore = sg; std::ignore = c; std::ignore = al;
#endif
}
template <int HKV, bool PF16, int COLS, int PPP>
static void launch_int8k_int4v_s1_paged_reuse_mp(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                        const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                        const float *VS, const float *VZ, const std::int32_t *bt,
                                        const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                        int n_splits, int q_len,
                                        size_t k_page_stride, size_t v_page_stride, size_t sc_page_stride,
                                        const std::int32_t *visible_lens = nullptr,
                                        int pages_per_block = 1) {
  constexpr int GQA = Heads<HKV>::gqa;
  static_assert(PF16, "mp path is fp16-partial only");
  const int n_groups = (n_splits + PPP - 1) / PPP;
  const int nprog = n_groups * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(8192 / sizeof(float)), h);
    h.parallel_for<Xe2KvTorchAbiS1PagedReuseMPKernel<HKV, PF16, COLS, PPP>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          // Live-row gating (perf): BM=64 pads the query tile, but a decode step has only
          // q_len*GQA real rows (6 for a draft, 42 for MTP6 verify). A sub-group whose
          // 8 rows are all padding has nothing to compute or store. The flag is uniform
          // per sub-group, so joint_matrix collectives stay legal; every barrier below is
          // still taken by the whole work-group.
          const bool sg_live = row0 < q_len * GQA;
          const int kv_head = prog / n_groups;
          const int gidx = prog - kv_head * n_groups;
          // Legacy path uses one final count. Varlen path reserves element 0
          // for max visible length and elements [1..q_len] for each query
          // row, matching Intel's speculative verifier contract.
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const std::int64_t live_pages64 = sycl::min(static_cast<std::int64_t>(n_splits),
              (seq_len + BM - 1) / BM);
          const int npg = static_cast<int>(sycl::min(static_cast<std::int64_t>(PPP),
              live_pages64 - static_cast<std::int64_t>(gidx) * PPP));
          if (npg <= 0) return;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;
          // fp32 running accumulator lives right after the fp16 partials in the fp32-sized
          // workspace: fp16 uses 2*G bytes/elt, acc 4*G; host guarantees 3*n_groups <= 2*n_splits.
          const size_t acc_off = (static_cast<size_t>(n_groups) * HKV * BM * BV) / 2 +
                                 static_cast<size_t>(prog) * BM * BV;
          auto pAcc = sycl::address_space_cast<sycl::access::address_space::global_space,
                                               sycl::access::decorated::no>(Part + acc_off);
          // Per-row running state, lane-distributed: lane r holds row r (3 GRFs, not 24).
          float gm_l = -INFINITY, ls_l = 0.f, al_l = 0.f;
          #pragma unroll 1
          for (int pj = 0; pj < npg; ++pj) {
          const bool last = (pj == npg - 1);
          const int logical = gidx * PPP + pj;
          if (pj > 0) item.barrier(sycl::access::fence_space::local_space);
          const int n_valid = static_cast<int>(sycl::min(static_cast<std::int64_t>(BM),
              seq_len - static_cast<std::int64_t>(logical) * BM));
          const int phys = (pages_per_block <= 1)
                               ? static_cast<int>(bt[logical])
                               : static_cast<int>(bt[logical / pages_per_block]) * pages_per_block +
                                     (logical % pages_per_block);

          float *base_f = &slm[0];
          auto *base = reinterpret_cast<std::uint8_t *>(base_f);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *p_raw = reinterpret_cast<sycl::half *>(base);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(base);

          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto p_slm = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                sycl::access::decorated::no>(p_raw);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);

          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          const size_t k_head_off =
              static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
          const size_t v_head_off =
              static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t sc_head_off =
              static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);

          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(Q8 + q_off));
          auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(K8 + k_head_off));
          auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                             sycl::access::decorated::no>(Part + o_off);
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              reinterpret_cast<sycl::half *>(Part) + o_off);

          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t)
            ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];

          float first_scores[TM][2];
          for(int half=0;half<2;++half){
            if(sg_live){
              jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::a,TM,TK_I8,jm::layout::row_major> a;
              jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::b,TK_I8,TN,jm::layout::col_major> b;
              jm::joint_matrix<sycl::sub_group,std::int32_t,jm::use::accumulator,TM,TN> c0,c1;
              jm::joint_matrix_fill(sg,c0,0);jm::joint_matrix_fill(sg,c1,0);
              for(int k=0;k<BK;k+=TK_I8){
                jm::joint_matrix_load(sg,a,pQ8+row0*BK+k,BK);
                jm::joint_matrix_load(sg,b,pK8+(half*32)*k_tok_stride+k,k_tok_stride);
                jm::joint_matrix_mad(sg,c0,a,b,c0);
                jm::joint_matrix_load(sg,b,pK8+(half*32+16)*k_tok_stride+k,k_tok_stride);
                jm::joint_matrix_mad(sg,c1,a,b,c1);
              }
              jm::joint_matrix_store(sg,c0,s_slm_i+row0*32,32,jm::layout::row_major);
              jm::joint_matrix_store(sg,c1,s_slm_i+row0*32+16,32,jm::layout::row_major);
            }
            sycl::group_barrier(sg);
            if(half==0 && sg_live){
              #pragma unroll
              for(int r=0;r<TM;++r){
                #pragma unroll
                for(int t=0;t<2;++t)
                  first_scores[r][t]=static_cast<float>(s_i32[(row0+r)*32+t*16+lane])*qsc[r]*ksc[t]*INV_SQRT_D;
              }
            }
            // Each subgroup owns its score rows; all first-half reads must
            // finish before it overwrites those rows with the second half.
            sycl::group_barrier(sg);
          }

          sycl::half saved_p[TM][NTN];
          if (!sg_live) {
            // Padding-only sub-group: publish an empty softmax state so any S2 variant
            // that touches these rows sees M=-inf, L=0 instead of stale workspace.
            if (lane < TM) {
              M[ml_off + row0 + lane] = -INFINITY;
              L[ml_off + row0 + lane] = 0.f;
            }
          } else {
            #pragma unroll
            for (int r = 0; r < TM; ++r) {
              const int row = row0 + r;
              const float qs = qsc[r];
              float m = -INFINITY;
              float vals[NTN];
              const int q_tok = row / GQA;
              // BM=64 pads the packed query tile.  Only live query rows have
              // a visible-lens entry; never read past [1+q_len].
              const bool live_q = row < q_len * GQA;
              const std::int64_t q_end = live_q
                  ? (visible_lens
                         ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                         : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                  : 0;
              for (int t = 0; t < NTN; ++t) {
                const int tok = t * SG_SIZE + lane;
                float s;
                if(t<2) s=first_scores[r][t];
                else {
                  const std::int32_t si=s_i32[row*32+(t-2)*SG_SIZE+lane];
                  s=static_cast<float>(si)*qs*ksc[t]*INV_SQRT_D;
                }
                // n_valid = tokens in this page; q_end = causal end for this spec Q token.
                // t=1 → q_end==seq_len (same as tok>=n_valid on the last page).
                // t>1 MTP → query i cannot see keys at/after seq_len-t+i+1.
                const std::int64_t k_abs =
                    static_cast<std::int64_t>(logical) * BM + tok;
                if (tok >= n_valid || row >= q_len * GQA || k_abs >= q_end) s = -INFINITY;
                vals[t] = s;
                m = sycl::max(m, s);
              }
              m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
              const float gm_old = sycl::select_from_group(sg, gm_l, r);
              const float ls_old = sycl::select_from_group(sg, ls_l, r);
              const float m_new = sycl::max(gm_old, m);
              const float alpha = (gm_old == -INFINITY) ? 0.f : sycl::exp(gm_old - m_new);
              float sum = 0.f;
              float e[NTN];
              if (m_new == -INFINITY) {
                for (int t = 0; t < NTN; ++t) e[t] = 0.f;
              } else {
                for (int t = 0; t < NTN; ++t) {
                  e[t] = sycl::exp(vals[t] - m_new);
                  sum += e[t];
                }
                sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
              }
              for (int t = 0; t < NTN; ++t) saved_p[r][t] = sycl::half(e[t]);
              const float ls_new = ls_old * alpha + sum;
              if (lane == r) { gm_l = m_new; ls_l = ls_new; al_l = alpha; }
              if (last && lane == 0) {
                M[ml_off + row] = m_new;
                L[ml_off + row] = ls_new;
              }
            }
          }

          // In-place score -> probability packing changes ownership across
          // sub-groups. Every score read must finish before the first store.
          item.barrier(sycl::access::fence_space::local_space);
          if (sg_live) {
            #pragma unroll
            for (int r=0; r<TM; ++r) {
              #pragma unroll
              for (int t=0; t<NTN; ++t)
                p_slm[(row0+r)*BN + t*SG_SIZE+lane] = saved_p[r][t];
            }
          }
          item.barrier(sycl::access::fence_space::local_space);

          {
            // Four named matrices avoid the known joint_matrix-array issue.
            jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::a,TM,TK,jm::layout::row_major> a0,a1,a2,a3;
            jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::b,TK,TN,jm::layout::row_major> b;
            if(sg_live){
              jm::joint_matrix_load(sg,a0,p_slm+row0*BN,BN);
              jm::joint_matrix_load(sg,a1,p_slm+row0*BN+16,BN);
              jm::joint_matrix_load(sg,a2,p_slm+row0*BN+32,BN);
              jm::joint_matrix_load(sg,a3,p_slm+row0*BN+48,BN);
            }
            // All subgroups finish loading P into registers before V
            // decoding reuses that same shared-memory address range.
            item.barrier(sycl::access::fence_space::local_space);
            // VS/VZ are immutable for this page throughout the column loop.
            // Preserve all arithmetic, valid-token guards, and SLM ownership barriers.
            const int v_tok = lid >> 1;
            const bool v_valid = v_tok < n_valid;
            const float v_scale = v_valid ? VS[sc_head_off + v_tok * sc_tok_stride] : 0.f;
            const float v_zero = v_valid ? VZ[sc_head_off + v_tok * sc_tok_stride] : 0.f;
            #pragma unroll 1
            for(int nbase=0;nbase<BV;nbase+=COLS){
              decode_v_int4_reuse<COLS>(lid,V4+v_head_off,v_tok_stride,v_scale,v_zero,
                                       nbase,n_valid,kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              if(sg_live){
                jm::joint_matrix<sycl::sub_group,float,jm::use::accumulator,TM,TN> c0,c1,c2,c3;
                if (pj == 0) {
                  jm::joint_matrix_fill(sg,c0,0.f);jm::joint_matrix_fill(sg,c1,0.f);
                  if constexpr(COLS==64){jm::joint_matrix_fill(sg,c2,0.f);jm::joint_matrix_fill(sg,c3,0.f);}
                } else {
                  jm::joint_matrix_load(sg,c0,pAcc+row0*BV+nbase,BV,jm::layout::row_major);
                  jm::joint_matrix_load(sg,c1,pAcc+row0*BV+nbase+16,BV,jm::layout::row_major);
                  mp_scale_rows_lane(sg,c0,al_l);mp_scale_rows_lane(sg,c1,al_l);
                  if constexpr(COLS==64){
                    jm::joint_matrix_load(sg,c2,pAcc+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_load(sg,c3,pAcc+row0*BV+nbase+48,BV,jm::layout::row_major);
                    mp_scale_rows_lane(sg,c2,al_l);mp_scale_rows_lane(sg,c3,al_l);
                  }
                }
                #define REUSE_MAD(A,K) \
                  jm::joint_matrix_load(sg,b,pKV+K*COLS,COLS); \
                  jm::joint_matrix_mad(sg,c0,A,b,c0); \
                  jm::joint_matrix_load(sg,b,pKV+K*COLS+16,COLS); \
                  jm::joint_matrix_mad(sg,c1,A,b,c1); \
                  if constexpr(COLS==64){ \
                    jm::joint_matrix_load(sg,b,pKV+K*COLS+32,COLS); \
                    jm::joint_matrix_mad(sg,c2,A,b,c2); \
                    jm::joint_matrix_load(sg,b,pKV+K*COLS+48,COLS); \
                    jm::joint_matrix_mad(sg,c3,A,b,c3); \
                  }
                REUSE_MAD(a0,0);REUSE_MAD(a1,16);REUSE_MAD(a2,32);REUSE_MAD(a3,48);
                #undef REUSE_MAD
                if (last) {
                  const float il_l = (ls_l == 0.f) ? 0.f : 1.f / ls_l;
                  mp_scale_rows_lane(sg,c0,il_l);mp_scale_rows_lane(sg,c1,il_l);
                  jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
                  jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
                  jm::joint_matrix_store(sg,h0,pOh+row0*BV+nbase,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h1,pOh+row0*BV+nbase+16,BV,jm::layout::row_major);
                  if constexpr(COLS==64){
                    mp_scale_rows_lane(sg,c2,il_l);mp_scale_rows_lane(sg,c3,il_l);
                    jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
                    jm::joint_matrix_store(sg,h2,pOh+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h3,pOh+row0*BV+nbase+48,BV,jm::layout::row_major);
                  }
                } else {
                  jm::joint_matrix_store(sg,c0,pAcc+row0*BV+nbase,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,c1,pAcc+row0*BV+nbase+16,BV,jm::layout::row_major);
                  if constexpr(COLS==64){
                    jm::joint_matrix_store(sg,c2,pAcc+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,c3,pAcc+row0*BV+nbase+48,BV,jm::layout::row_major);
                  }
                }
              }
              if(nbase+COLS<BV) item.barrier(sycl::access::fence_space::local_space);
            }
          }
          } // page loop
        });
  });
}

// Multi-page verifier v3: P pages per work-group, no global accumulator.
// Phase A (per page): QK -> page-local softmax numerators e=exp(s-m_j) as fp16 in an SLM P-buffer,
//   (m_j, l_j) kept lane-distributed (lane r = row r).
// Phase B: per row gm = max_j m_j, f_j = exp(m_j - gm); P-buffer rows scaled by f_j; L = sum f_j l_j.
// Phase C: per 64-col chunk, fp32 accumulators stay in registers across the P pages
//   (V chunk of page j decoded to the shared V tile), then normalized by 1/L, stored once as fp16.
// Global traffic per P pages: KV + one fp16 partial (vs P partials). SLM = 8 KiB * (1 + P).
template <int HKV, int PPP> class Xe2KvTorchAbiS1PagedReuseMP3Kernel;
template <int HKV, int PPP>
static void launch_int8k_int4v_s1_paged_reuse_mp3(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                        const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                        const float *VS, const float *VZ, const std::int32_t *bt,
                                        const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                        int n_splits, int q_len,
                                        size_t k_page_stride, size_t v_page_stride, size_t sc_page_stride,
                                        const std::int32_t *visible_lens, int pages_per_block) {
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int COLS = 64;
  const int n_groups = (n_splits + PPP - 1) / PPP;
  const int nprog = n_groups * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  constexpr int TILE_BYTES = 8192;                       // QK int32 scratch / V tile (aliased)
  constexpr int PBUF_HALFS = BM * BN;                     // one page of P: 64 x 64 fp16 = 8 KiB
  constexpr int SLM_BYTES = TILE_BYTES + PPP * PBUF_HALFS * 2;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(SLM_BYTES / sizeof(float)), h);
    h.parallel_for<Xe2KvTorchAbiS1PagedReuseMP3Kernel<HKV, PPP>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          const bool sg_live = row0 < q_len * GQA;
          const int kv_head = prog / n_groups;
          const int gidx = prog - kv_head * n_groups;
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const std::int64_t live_pages64 = sycl::min(static_cast<std::int64_t>(n_splits), (seq_len + BM - 1) / BM);
          const int npg = static_cast<int>(sycl::min(static_cast<std::int64_t>(PPP),
              live_pages64 - static_cast<std::int64_t>(gidx) * PPP));
          if (npg <= 0) return;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;

          auto *base = reinterpret_cast<std::uint8_t *>(&slm[0]);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(base);
          sycl::half *pbuf = reinterpret_cast<sycl::half *>(base + TILE_BYTES);
          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);
          auto pP = sycl::address_space_cast<sycl::access::address_space::local_space,
                                             sycl::access::decorated::no>(pbuf);
          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(const_cast<std::int8_t *>(Q8 + q_off));
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(reinterpret_cast<sycl::half *>(Part) + o_off);
          auto phys_of = [&](int logical) {
            return (pages_per_block <= 1) ? static_cast<int>(bt[logical])
                 : static_cast<int>(bt[logical / pages_per_block]) * pages_per_block + (logical % pages_per_block);
          };
          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];

          // ---- Phase A: per page scores -> fp16 numerators in pbuf[j] (rows owned by this SG).
          float m_l[PPP], l_l[PPP];
#pragma unroll
          for (int j = 0; j < PPP; ++j) { m_l[j] = -INFINITY; l_l[j] = 0.f; }
          if (sg_live) {
#pragma unroll
            for (int j = 0; j < PPP; ++j) {
              if (j < npg) {
              const int logical = gidx * PPP + j;
              const int n_valid = static_cast<int>(sycl::min(static_cast<std::int64_t>(BM),
                  seq_len - static_cast<std::int64_t>(logical) * BM));
              const int phys = phys_of(logical);
              const size_t k_head_off = static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
              const size_t sc_head_off = static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);
              auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                                  sycl::access::decorated::no>(const_cast<std::int8_t *>(K8 + k_head_off));
              float ksc[NTN];
#pragma unroll
              for (int t = 0; t < NTN; ++t)
                ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];
              float sc[TM][NTN];
              for (int half = 0; half < 2; ++half) {
                jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::a,TM,TK_I8,jm::layout::row_major> a;
                jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::b,TK_I8,TN,jm::layout::col_major> b;
                jm::joint_matrix<sycl::sub_group,std::int32_t,jm::use::accumulator,TM,TN> c0,c1;
                jm::joint_matrix_fill(sg,c0,0);jm::joint_matrix_fill(sg,c1,0);
                for (int k = 0; k < BK; k += TK_I8) {
                  jm::joint_matrix_load(sg,a,pQ8+row0*BK+k,BK);
                  jm::joint_matrix_load(sg,b,pK8+(half*32)*k_tok_stride+k,k_tok_stride);
                  jm::joint_matrix_mad(sg,c0,a,b,c0);
                  jm::joint_matrix_load(sg,b,pK8+(half*32+16)*k_tok_stride+k,k_tok_stride);
                  jm::joint_matrix_mad(sg,c1,a,b,c1);
                }
                jm::joint_matrix_store(sg,c0,s_slm_i+row0*32,32,jm::layout::row_major);
                jm::joint_matrix_store(sg,c1,s_slm_i+row0*32+16,32,jm::layout::row_major);
                sycl::group_barrier(sg);
#pragma unroll
                for (int r = 0; r < TM; ++r)
#pragma unroll
                  for (int t = 0; t < 2; ++t)
                    sc[r][half*2+t] = static_cast<float>(s_i32[(row0+r)*32+t*16+lane])*qsc[r]*ksc[half*2+t]*INV_SQRT_D;
                sycl::group_barrier(sg);
              }
#pragma unroll
              for (int r = 0; r < TM; ++r) {
                const int row = row0 + r;
                const int q_tok = row / GQA;
                const bool live_q = row < q_len * GQA;
                const std::int64_t q_end = live_q
                    ? (visible_lens ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                                    : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                    : 0;
                float m = -INFINITY;
#pragma unroll
                for (int t = 0; t < NTN; ++t) {
                  const int tok = t * SG_SIZE + lane;
                  const std::int64_t k_abs = static_cast<std::int64_t>(logical) * BM + tok;
                  if (tok >= n_valid || !live_q || k_abs >= q_end) sc[r][t] = -INFINITY;
                  m = sycl::max(m, sc[r][t]);
                }
                m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
                float sum = 0.f;
#pragma unroll
                for (int t = 0; t < NTN; ++t) {
                  const float e = (m == -INFINITY) ? 0.f : sycl::exp(sc[r][t] - m);
                  sum += e;
                  pbuf[j * PBUF_HALFS + row * BN + t * SG_SIZE + lane] = sycl::half(e);
                }
                sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
                if (lane == r) { m_l[j] = m; l_l[j] = sum; }
              }
              }
            }
            // ---- Phase B: combine page states per row, rescale this SG's pbuf rows.
            float gm = -INFINITY;
#pragma unroll
            for (int j = 0; j < PPP; ++j) gm = sycl::max(gm, m_l[j]);
            float Lt = 0.f; float f_l[PPP];
#pragma unroll
            for (int j = 0; j < PPP; ++j) {
              f_l[j] = (m_l[j] == -INFINITY) ? 0.f : sycl::exp(m_l[j] - gm);
              Lt += f_l[j] * l_l[j];
            }
            sycl::group_barrier(sg);
#pragma unroll
            for (int j = 0; j < PPP; ++j) {
              if (j < npg) {
#pragma unroll
                for (int r = 0; r < TM; ++r) {
                  const float f = sycl::select_from_group(sg, f_l[j], r);
#pragma unroll
                  for (int t = 0; t < NTN; ++t) {
                    sycl::half &x = pbuf[j * PBUF_HALFS + (row0 + r) * BN + t * SG_SIZE + lane];
                    x = sycl::half(static_cast<float>(x) * f);
                  }
                }
              }
            }
            if (lane < TM) { M[ml_off + row0 + lane] = gm; L[ml_off + row0 + lane] = Lt; }
            m_l[0] = (Lt == 0.f) ? 0.f : 1.f / Lt;   // reuse: lane r holds 1/L for row r
            sycl::group_barrier(sg);
          } else {
            if (lane < TM) { M[ml_off + row0 + lane] = -INFINITY; L[ml_off + row0 + lane] = 0.f; }
          }
          const float inv_l = m_l[0];

          // ---- Phase C: PV with register accumulators across pages.
          const int v_tok = lid >> 1;
          #pragma unroll 1
          for (int nbase = 0; nbase < BV; nbase += COLS) {
            jm::joint_matrix<sycl::sub_group,float,jm::use::accumulator,TM,TN> c0,c1,c2,c3;
            jm::joint_matrix_fill(sg,c0,0.f);jm::joint_matrix_fill(sg,c1,0.f);
            jm::joint_matrix_fill(sg,c2,0.f);jm::joint_matrix_fill(sg,c3,0.f);
            #pragma unroll 1
            for (int j = 0; j < npg; ++j) {
              const int logical = gidx * PPP + j;
              const int n_valid = static_cast<int>(sycl::min(static_cast<std::int64_t>(BM),
                  seq_len - static_cast<std::int64_t>(logical) * BM));
              const int phys = phys_of(logical);
              const size_t v_head_off = static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
              const size_t sc_head_off = static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);
              const bool v_valid = v_tok < n_valid;
              const float v_scale = v_valid ? VS[sc_head_off + v_tok * sc_tok_stride] : 0.f;
              const float v_zero = v_valid ? VZ[sc_head_off + v_tok * sc_tok_stride] : 0.f;
              item.barrier(sycl::access::fence_space::local_space);   // previous V tile / QK scratch consumers done
              decode_v_int4_reuse<COLS>(lid, V4 + v_head_off, v_tok_stride, v_scale, v_zero, nbase, n_valid, kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              if (sg_live) {
                jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::a,TM,TK,jm::layout::row_major> a0,a1,a2,a3;
                jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::b,TK,TN,jm::layout::row_major> b;
                auto pPj = pP + j * PBUF_HALFS + row0 * BN;
                jm::joint_matrix_load(sg,a0,pPj,BN);
                jm::joint_matrix_load(sg,a1,pPj+16,BN);
                jm::joint_matrix_load(sg,a2,pPj+32,BN);
                jm::joint_matrix_load(sg,a3,pPj+48,BN);
#define MP3_MAD(A,K) \
                jm::joint_matrix_load(sg,b,pKV+K*COLS,COLS);    jm::joint_matrix_mad(sg,c0,A,b,c0); \
                jm::joint_matrix_load(sg,b,pKV+K*COLS+16,COLS); jm::joint_matrix_mad(sg,c1,A,b,c1); \
                jm::joint_matrix_load(sg,b,pKV+K*COLS+32,COLS); jm::joint_matrix_mad(sg,c2,A,b,c2); \
                jm::joint_matrix_load(sg,b,pKV+K*COLS+48,COLS); jm::joint_matrix_mad(sg,c3,A,b,c3);
                MP3_MAD(a0,0) MP3_MAD(a1,16) MP3_MAD(a2,32) MP3_MAD(a3,48)
#undef MP3_MAD
              }
            }
            if (sg_live) {
              mp_scale_rows_lane(sg,c0,inv_l);mp_scale_rows_lane(sg,c1,inv_l);
              mp_scale_rows_lane(sg,c2,inv_l);mp_scale_rows_lane(sg,c3,inv_l);
              jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
              jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
              jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
              jm::joint_matrix_store(sg,h0,pOh+row0*BV+nbase,BV,jm::layout::row_major);
              jm::joint_matrix_store(sg,h1,pOh+row0*BV+nbase+16,BV,jm::layout::row_major);
              jm::joint_matrix_store(sg,h2,pOh+row0*BV+nbase+32,BV,jm::layout::row_major);
              jm::joint_matrix_store(sg,h3,pOh+row0*BV+nbase+48,BV,jm::layout::row_major);
            }
          }
        });
  });
}

// Multi-page verifier v3: P pages per work-group, no global accumulator.
// Phase A (per page): QK -> page-local softmax numerators e=exp(s-m_j) as fp16 in an SLM P-buffer,
//   (m_j, l_j) kept lane-distributed (lane r = row r).
// Phase B: per row gm = max_j m_j, f_j = exp(m_j - gm); P-buffer rows scaled by f_j; L = sum f_j l_j.
// Phase C: per 64-col chunk, fp32 accumulators stay in registers across the P pages
//   (V chunk of page j decoded to the shared V tile), then normalized by 1/L, stored once as fp16.
// Global traffic per P pages: KV + one fp16 partial (vs P partials). SLM = 8 KiB * (1 + P).
template <int HKV, int PPP> class Xe2KvTorchAbiS1PagedReuseMP4Kernel;
template <int HKV, int PPP>
static void launch_int8k_int4v_s1_paged_reuse_mp4(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                        const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                        const float *VS, const float *VZ, const std::int32_t *bt,
                                        const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                        int n_splits, int q_len,
                                        size_t k_page_stride, size_t v_page_stride, size_t sc_page_stride,
                                        const std::int32_t *visible_lens, int pages_per_block) {
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int COLS = 64;
  const int n_groups = (n_splits + PPP - 1) / PPP;
  const int nprog = n_groups * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  constexpr int TILE_BYTES = 8192;                       // QK int32 scratch / V tile (aliased)
  constexpr int PBUF_HALFS = BM * BN;                     // one page of P: 64 x 64 fp16 = 8 KiB
  constexpr int SLM_BYTES = TILE_BYTES + PBUF_HALFS * 2;   // fixed 16 KiB: P staged per (chunk,page)
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(SLM_BYTES / sizeof(float)), h);
    h.parallel_for<Xe2KvTorchAbiS1PagedReuseMP4Kernel<HKV, PPP>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          const bool sg_live = row0 < q_len * GQA;
          const int kv_head = prog / n_groups;
          const int gidx = prog - kv_head * n_groups;
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const std::int64_t live_pages64 = sycl::min(static_cast<std::int64_t>(n_splits), (seq_len + BM - 1) / BM);
          const int npg = static_cast<int>(sycl::min(static_cast<std::int64_t>(PPP),
              live_pages64 - static_cast<std::int64_t>(gidx) * PPP));
          if (npg <= 0) return;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;

          auto *base = reinterpret_cast<std::uint8_t *>(&slm[0]);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(base);
          sycl::half *pbuf = reinterpret_cast<sycl::half *>(base + TILE_BYTES);
          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);
          auto pP = sycl::address_space_cast<sycl::access::address_space::local_space,
                                             sycl::access::decorated::no>(pbuf);
          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(const_cast<std::int8_t *>(Q8 + q_off));
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(reinterpret_cast<sycl::half *>(Part) + o_off);
          auto phys_of = [&](int logical) {
            return (pages_per_block <= 1) ? static_cast<int>(bt[logical])
                 : static_cast<int>(bt[logical / pages_per_block]) * pages_per_block + (logical % pages_per_block);
          };
          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];

          // ---- Phase A: per page scores -> fp16 numerators in pbuf[j] (rows owned by this SG).
          float m_l[PPP], l_l[PPP];
          sycl::half sp[PPP][TM][NTN];
#pragma unroll
          for (int j = 0; j < PPP; ++j) { m_l[j] = -INFINITY; l_l[j] = 0.f; }
          if (sg_live) {
#pragma unroll
            for (int j = 0; j < PPP; ++j) {
              if (j < npg) {
              const int logical = gidx * PPP + j;
              const int n_valid = static_cast<int>(sycl::min(static_cast<std::int64_t>(BM),
                  seq_len - static_cast<std::int64_t>(logical) * BM));
              const int phys = phys_of(logical);
              const size_t k_head_off = static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
              const size_t sc_head_off = static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);
              auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                                  sycl::access::decorated::no>(const_cast<std::int8_t *>(K8 + k_head_off));
              float ksc[NTN];
#pragma unroll
              for (int t = 0; t < NTN; ++t)
                ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];
              float sc[TM][NTN];
              for (int half = 0; half < 2; ++half) {
                jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::a,TM,TK_I8,jm::layout::row_major> a;
                jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::b,TK_I8,TN,jm::layout::col_major> b;
                jm::joint_matrix<sycl::sub_group,std::int32_t,jm::use::accumulator,TM,TN> c0,c1;
                jm::joint_matrix_fill(sg,c0,0);jm::joint_matrix_fill(sg,c1,0);
                for (int k = 0; k < BK; k += TK_I8) {
                  jm::joint_matrix_load(sg,a,pQ8+row0*BK+k,BK);
                  jm::joint_matrix_load(sg,b,pK8+(half*32)*k_tok_stride+k,k_tok_stride);
                  jm::joint_matrix_mad(sg,c0,a,b,c0);
                  jm::joint_matrix_load(sg,b,pK8+(half*32+16)*k_tok_stride+k,k_tok_stride);
                  jm::joint_matrix_mad(sg,c1,a,b,c1);
                }
                jm::joint_matrix_store(sg,c0,s_slm_i+row0*32,32,jm::layout::row_major);
                jm::joint_matrix_store(sg,c1,s_slm_i+row0*32+16,32,jm::layout::row_major);
                sycl::group_barrier(sg);
#pragma unroll
                for (int r = 0; r < TM; ++r)
#pragma unroll
                  for (int t = 0; t < 2; ++t)
                    sc[r][half*2+t] = static_cast<float>(s_i32[(row0+r)*32+t*16+lane])*qsc[r]*ksc[half*2+t]*INV_SQRT_D;
                sycl::group_barrier(sg);
              }
#pragma unroll
              for (int r = 0; r < TM; ++r) {
                const int row = row0 + r;
                const int q_tok = row / GQA;
                const bool live_q = row < q_len * GQA;
                const std::int64_t q_end = live_q
                    ? (visible_lens ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                                    : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                    : 0;
                float m = -INFINITY;
#pragma unroll
                for (int t = 0; t < NTN; ++t) {
                  const int tok = t * SG_SIZE + lane;
                  const std::int64_t k_abs = static_cast<std::int64_t>(logical) * BM + tok;
                  if (tok >= n_valid || !live_q || k_abs >= q_end) sc[r][t] = -INFINITY;
                  m = sycl::max(m, sc[r][t]);
                }
                m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
                float sum = 0.f;
#pragma unroll
                for (int t = 0; t < NTN; ++t) {
                  const float e = (m == -INFINITY) ? 0.f : sycl::exp(sc[r][t] - m);
                  sum += e;
                  sp[j][r][t] = sycl::half(e);
                }
                sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
                if (lane == r) { m_l[j] = m; l_l[j] = sum; }
              }
              }
            }
            // ---- Phase B: combine page states per row, rescale this SG's pbuf rows.
            float gm = -INFINITY;
#pragma unroll
            for (int j = 0; j < PPP; ++j) gm = sycl::max(gm, m_l[j]);
            float Lt = 0.f; float f_l[PPP];
#pragma unroll
            for (int j = 0; j < PPP; ++j) {
              f_l[j] = (m_l[j] == -INFINITY) ? 0.f : sycl::exp(m_l[j] - gm);
              Lt += f_l[j] * l_l[j];
            }
#pragma unroll
            for (int j = 0; j < PPP; ++j)
#pragma unroll
              for (int r = 0; r < TM; ++r) {
                const float f = sycl::select_from_group(sg, f_l[j], r);
#pragma unroll
                for (int t = 0; t < NTN; ++t) sp[j][r][t] = sycl::half(static_cast<float>(sp[j][r][t]) * f);
              }
            if (lane < TM) { M[ml_off + row0 + lane] = gm; L[ml_off + row0 + lane] = Lt; }
            m_l[0] = (Lt == 0.f) ? 0.f : 1.f / Lt;   // reuse: lane r holds 1/L for row r
            sycl::group_barrier(sg);
          } else {
            if (lane < TM) { M[ml_off + row0 + lane] = -INFINITY; L[ml_off + row0 + lane] = 0.f; }
          }
          const float inv_l = m_l[0];

          // ---- Phase C: PV with register accumulators across pages.
          const int v_tok = lid >> 1;
          #pragma unroll 1
          for (int nbase = 0; nbase < BV; nbase += COLS) {
            jm::joint_matrix<sycl::sub_group,float,jm::use::accumulator,TM,TN> c0,c1,c2,c3;
            jm::joint_matrix_fill(sg,c0,0.f);jm::joint_matrix_fill(sg,c1,0.f);
            jm::joint_matrix_fill(sg,c2,0.f);jm::joint_matrix_fill(sg,c3,0.f);
            #pragma unroll 1
            for (int j = 0; j < npg; ++j) {
              const int logical = gidx * PPP + j;
              const int n_valid = static_cast<int>(sycl::min(static_cast<std::int64_t>(BM),
                  seq_len - static_cast<std::int64_t>(logical) * BM));
              const int phys = phys_of(logical);
              const size_t v_head_off = static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
              const size_t sc_head_off = static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);
              const bool v_valid = v_tok < n_valid;
              const float v_scale = v_valid ? VS[sc_head_off + v_tok * sc_tok_stride] : 0.f;
              const float v_zero = v_valid ? VZ[sc_head_off + v_tok * sc_tok_stride] : 0.f;
              item.barrier(sycl::access::fence_space::local_space);   // previous V tile / QK scratch consumers done
              decode_v_int4_reuse<COLS>(lid, V4 + v_head_off, v_tok_stride, v_scale, v_zero, nbase, n_valid, kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              if (sg_live) {
                jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::a,TM,TK,jm::layout::row_major> a0,a1,a2,a3;
                jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::b,TK,TN,jm::layout::row_major> b;
                // stage this SG's rows of P_j (registers -> SG-private SLM rows), j is dynamic: select by unrolled compare
#pragma unroll
                for (int jj = 0; jj < PPP; ++jj) if (jj == j) {
#pragma unroll
                  for (int r = 0; r < TM; ++r)
#pragma unroll
                    for (int t = 0; t < NTN; ++t) pbuf[(row0 + r) * BN + t * SG_SIZE + lane] = sp[jj][r][t];
                }
                sycl::group_barrier(sg);
                auto pPj = pP + row0 * BN;
                jm::joint_matrix_load(sg,a0,pPj,BN);
                jm::joint_matrix_load(sg,a1,pPj+16,BN);
                jm::joint_matrix_load(sg,a2,pPj+32,BN);
                jm::joint_matrix_load(sg,a3,pPj+48,BN);
#define MP4_MAD(A,K) \
                jm::joint_matrix_load(sg,b,pKV+K*COLS,COLS);    jm::joint_matrix_mad(sg,c0,A,b,c0); \
                jm::joint_matrix_load(sg,b,pKV+K*COLS+16,COLS); jm::joint_matrix_mad(sg,c1,A,b,c1); \
                jm::joint_matrix_load(sg,b,pKV+K*COLS+32,COLS); jm::joint_matrix_mad(sg,c2,A,b,c2); \
                jm::joint_matrix_load(sg,b,pKV+K*COLS+48,COLS); jm::joint_matrix_mad(sg,c3,A,b,c3);
                MP4_MAD(a0,0) MP4_MAD(a1,16) MP4_MAD(a2,32) MP4_MAD(a3,48)
#undef MP4_MAD
                sycl::group_barrier(sg);   // a-loads done before next page restages
              }
            }
            if (sg_live) {
              mp_scale_rows_lane(sg,c0,inv_l);mp_scale_rows_lane(sg,c1,inv_l);
              mp_scale_rows_lane(sg,c2,inv_l);mp_scale_rows_lane(sg,c3,inv_l);
              jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
              jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
              jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
              jm::joint_matrix_store(sg,h0,pOh+row0*BV+nbase,BV,jm::layout::row_major);
              jm::joint_matrix_store(sg,h1,pOh+row0*BV+nbase+16,BV,jm::layout::row_major);
              jm::joint_matrix_store(sg,h2,pOh+row0*BV+nbase+32,BV,jm::layout::row_major);
              jm::joint_matrix_store(sg,h3,pOh+row0*BV+nbase+48,BV,jm::layout::row_major);
            }
          }
        });
  });
}


template <typename JM>
static inline void mp_add(sycl::sub_group sg, JM &a, JM &b) {
#if defined(__SYCL_DEVICE_ONLY__)
  auto wa = sycl::ext::oneapi::detail::get_wi_data(sg, a);
  auto wb = sycl::ext::oneapi::detail::get_wi_data(sg, b);
#pragma unroll
  for (int i = 0; i < TM; ++i) { float x = wa[i]; float y = wb[i]; wa[i] = x + y; }
#else
  std::ignore = sg; std::ignore = a; std::ignore = b;
#endif
}
// Subgroup-team-per-page verifier (impl 5): G teams of 8 SGs in one WG each take one page
// concurrently; partials combined in SLM, one fp16 partial per WG.
template <int HKV, int G, int MODE> class Xe2KvTorchAbiS1PagedReuseTeamKernel;
// MODE 0: per-chunk fp32 SLM combine; 1: lean (fp16 SLM, one combine after PV); 2: stub (no combine, timing only)
// MODE 3: per-chunk fp16 combine aliased onto each team's own V tile (no extra SLM, +2 barriers/chunk)
template <int HKV, int G, int MODE>
static void launch_int8k_int4v_s1_paged_reuse_team(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                        const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                        const float *VS, const float *VZ, const std::int32_t *bt,
                                        const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                        int n_splits, int q_len,
                                        size_t k_page_stride, size_t v_page_stride, size_t sc_page_stride,
                                        const std::int32_t *visible_lens = nullptr,
                                        int pages_per_block = 1) {
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr bool PF16 = true; constexpr int COLS = 64;
  const int n_groups = (n_splits + G - 1) / G;
  const int nprog = n_groups * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE * G);
  sycl::range<1> l(WG_SIZE * G);
  constexpr int TILE = 8192; constexpr int ML_BYTES = 2 * G * BM * 4; constexpr int COMB = BM * COLS * 4;
  constexpr int LR = 48;   // live rows for the q_len 7 verifier (42 rounded to 8)
  constexpr int COMBH = LR * BV * 2;
  constexpr int SLM_BYTES = G * TILE + ML_BYTES + (MODE == 0 ? (G - 1) * COMB : MODE == 1 ? (G - 1) * COMBH : 0);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(SLM_BYTES / sizeof(float)), h);
    h.parallel_for<Xe2KvTorchAbiS1PagedReuseTeamKernel<HKV, G, MODE>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid_g = static_cast<int>(item.get_local_id(0));
          const int team = lid_g / WG_SIZE;
          const int lid = lid_g - team * WG_SIZE;
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id()) - team * SG_COUNT;
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          // Live-row gating (perf): BM=64 pads the query tile, but a decode step has only
          // q_len*GQA real rows (6 for a draft, 42 for MTP6 verify). A sub-group whose
          // 8 rows are all padding has nothing to compute or store. The flag is uniform
          // per sub-group, so joint_matrix collectives stay legal; every barrier below is
          // still taken by the whole work-group.
          bool sg_live = row0 < q_len * GQA;
          const int kv_head = prog / n_groups;
          const int gidx = prog - kv_head * n_groups;
          const int logical_raw = gidx * G + team;
          // Legacy path uses one final count. Varlen path reserves element 0
          // for max visible length and elements [1..q_len] for each query
          // row, matching Intel's speculative verifier contract.
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const std::int64_t n_valid64 = sycl::max(
              static_cast<std::int64_t>(0),
              sycl::min(static_cast<std::int64_t>(BM),
                        seq_len - static_cast<std::int64_t>(logical_raw) * BM));
          const int n_valid = static_cast<int>(n_valid64);
          // Graph-static n_splits pads past seq_len. S2 only merges n_live
          // splits, so empty groups can return without touching SLM/DPAS.
          const std::int64_t live_pages64 = sycl::min(static_cast<std::int64_t>(n_splits), (seq_len + BM - 1) / BM);
          const bool team_valid = n_valid > 0 && logical_raw < live_pages64;
          if (gidx * G >= live_pages64) return;              // whole WG empty (uniform)
          const int logical = team_valid ? logical_raw : gidx * G;  // safe page for idle teams
          sg_live = sg_live && team_valid;
          // pages_per_block==1: block_table entries are already 64-token pages.
          // Larger vLLM blocks expand as block_id * ratio + page_in_block, which
          // matches slot/64 used by the store. No host-side table is built.
          const int phys = (pages_per_block <= 1)
                               ? static_cast<int>(bt[logical])
                               : static_cast<int>(bt[logical / pages_per_block]) * pages_per_block +
                                     (logical % pages_per_block);

          float *base_f = &slm[0] + team * (TILE / 4);
          float *ml_s = &slm[0] + G * (TILE / 4);                 // [2][G][BM]: m then l
          float *comb = ml_s + 2 * G * BM;                        // [G-1][BM][COLS] fp32 (MODE 0)
          sycl::half *combh = reinterpret_cast<sycl::half *>(comb);  // [G-1][LR][BV] fp16 (MODE 1)
          auto *base = reinterpret_cast<std::uint8_t *>(base_f);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *p_raw = reinterpret_cast<sycl::half *>(base);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(base);

          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto p_slm = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                sycl::access::decorated::no>(p_raw);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);

          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;
          const size_t k_head_off =
              static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
          const size_t v_head_off =
              static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t sc_head_off =
              static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);

          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(Q8 + q_off));
          auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(K8 + k_head_off));
          auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                             sycl::access::decorated::no>(Part + o_off);
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              reinterpret_cast<sycl::half *>(Part) + o_off);

          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t)
            ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];

          float first_scores[TM][2];
          for(int half=0;half<2;++half){
            if(sg_live){
              jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::a,TM,TK_I8,jm::layout::row_major> a;
              jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::b,TK_I8,TN,jm::layout::col_major> b;
              jm::joint_matrix<sycl::sub_group,std::int32_t,jm::use::accumulator,TM,TN> c0,c1;
              jm::joint_matrix_fill(sg,c0,0);jm::joint_matrix_fill(sg,c1,0);
              for(int k=0;k<BK;k+=TK_I8){
                jm::joint_matrix_load(sg,a,pQ8+row0*BK+k,BK);
                jm::joint_matrix_load(sg,b,pK8+(half*32)*k_tok_stride+k,k_tok_stride);
                jm::joint_matrix_mad(sg,c0,a,b,c0);
                jm::joint_matrix_load(sg,b,pK8+(half*32+16)*k_tok_stride+k,k_tok_stride);
                jm::joint_matrix_mad(sg,c1,a,b,c1);
              }
              jm::joint_matrix_store(sg,c0,s_slm_i+row0*32,32,jm::layout::row_major);
              jm::joint_matrix_store(sg,c1,s_slm_i+row0*32+16,32,jm::layout::row_major);
            }
            sycl::group_barrier(sg);
            if(half==0 && sg_live){
              #pragma unroll
              for(int r=0;r<TM;++r){
                #pragma unroll
                for(int t=0;t<2;++t)
                  first_scores[r][t]=static_cast<float>(s_i32[(row0+r)*32+t*16+lane])*qsc[r]*ksc[t]*INV_SQRT_D;
              }
            }
            // Each subgroup owns its score rows; all first-half reads must
            // finish before it overwrites those rows with the second half.
            sycl::group_barrier(sg);
          }

          sycl::half saved_p[TM][NTN];
          if (!sg_live) {
            // Padding-only sub-group: publish an empty softmax state so any S2 variant
            // that touches these rows sees M=-inf, L=0 instead of stale workspace.
            if (lane < TM) {
              ml_s[team * BM + row0 + lane] = -INFINITY;
              ml_s[(G + team) * BM + row0 + lane] = 0.f;
            }
          } else {
            #pragma unroll
            for (int r = 0; r < TM; ++r) {
              const int row = row0 + r;
              const float qs = qsc[r];
              float m = -INFINITY;
              float vals[NTN];
              const int q_tok = row / GQA;
              // BM=64 pads the packed query tile.  Only live query rows have
              // a visible-lens entry; never read past [1+q_len].
              const bool live_q = row < q_len * GQA;
              const std::int64_t q_end = live_q
                  ? (visible_lens
                         ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                         : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                  : 0;
              for (int t = 0; t < NTN; ++t) {
                const int tok = t * SG_SIZE + lane;
                float s;
                if(t<2) s=first_scores[r][t];
                else {
                  const std::int32_t si=s_i32[row*32+(t-2)*SG_SIZE+lane];
                  s=static_cast<float>(si)*qs*ksc[t]*INV_SQRT_D;
                }
                // n_valid = tokens in this page; q_end = causal end for this spec Q token.
                // t=1 → q_end==seq_len (same as tok>=n_valid on the last page).
                // t>1 MTP → query i cannot see keys at/after seq_len-t+i+1.
                const std::int64_t k_abs =
                    static_cast<std::int64_t>(logical) * BM + tok;
                if (tok >= n_valid || row >= q_len * GQA || k_abs >= q_end) s = -INFINITY;
                vals[t] = s;
                m = sycl::max(m, s);
              }
              m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
              float sum = 0.f;
              float e[NTN];
              if (m == -INFINITY) {
                for (int t = 0; t < NTN; ++t) e[t] = 0.f;
              } else {
                for (int t = 0; t < NTN; ++t) {
                  e[t] = sycl::exp(vals[t] - m);
                  sum += e[t];
                }
                sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
              }
              float inv = (sum == 0.f) ? 0.f : 1.f / sum;
              for (int t = 0; t < NTN; ++t) {
                saved_p[r][t] = sycl::half(e[t] * inv);
              }
              if (lane == 0) {
                ml_s[team * BM + row] = m;
                ml_s[(G + team) * BM + row] = sum;
              }
            }
          }

          // In-place score -> probability packing changes ownership across
          // sub-groups. Every score read must finish before the first store.
          item.barrier(sycl::access::fence_space::local_space);
          if (sg_live) {
            #pragma unroll
            for (int r=0; r<TM; ++r) {
              #pragma unroll
              for (int t=0; t<NTN; ++t)
                p_slm[(row0+r)*BN + t*SG_SIZE+lane] = saved_p[r][t];
            }
          }
          item.barrier(sycl::access::fence_space::local_space);

          {
            // Four named matrices avoid the known joint_matrix-array issue.
            jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::a,TM,TK,jm::layout::row_major> a0,a1,a2,a3;
            jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::b,TK,TN,jm::layout::row_major> b;
            if(sg_live){
              jm::joint_matrix_load(sg,a0,p_slm+row0*BN,BN);
              jm::joint_matrix_load(sg,a1,p_slm+row0*BN+16,BN);
              jm::joint_matrix_load(sg,a2,p_slm+row0*BN+32,BN);
              jm::joint_matrix_load(sg,a3,p_slm+row0*BN+48,BN);
            }
            // All subgroups finish loading P into registers before V
            // decoding reuses that same shared-memory address range.
            item.barrier(sycl::access::fence_space::local_space);
            // VS/VZ are immutable for this page throughout the column loop.
            // Preserve all arithmetic, valid-token guards, and SLM ownership barriers.
            const int v_tok = lid >> 1;
            const bool v_valid = v_tok < n_valid;
            const float v_scale = v_valid ? VS[sc_head_off + v_tok * sc_tok_stride] : 0.f;
            const float v_zero = v_valid ? VZ[sc_head_off + v_tok * sc_tok_stride] : 0.f;
            #pragma unroll 1
            for(int nbase=0;nbase<BV;nbase+=COLS){
              decode_v_int4_reuse<COLS>(lid,V4+v_head_off,v_tok_stride,v_scale,v_zero,
                                       nbase,n_valid,kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              jm::joint_matrix<sycl::sub_group,float,jm::use::accumulator,TM,TN> c0,c1,c2,c3;
              float c_il = 0.f;
              if(sg_live){
                jm::joint_matrix_fill(sg,c0,0.f);jm::joint_matrix_fill(sg,c1,0.f);
                if constexpr(COLS==64){jm::joint_matrix_fill(sg,c2,0.f);jm::joint_matrix_fill(sg,c3,0.f);}
                #define REUSE_MAD(A,K) \
                  jm::joint_matrix_load(sg,b,pKV+K*COLS,COLS); \
                  jm::joint_matrix_mad(sg,c0,A,b,c0); \
                  jm::joint_matrix_load(sg,b,pKV+K*COLS+16,COLS); \
                  jm::joint_matrix_mad(sg,c1,A,b,c1); \
                  if constexpr(COLS==64){ \
                    jm::joint_matrix_load(sg,b,pKV+K*COLS+32,COLS); \
                    jm::joint_matrix_mad(sg,c2,A,b,c2); \
                    jm::joint_matrix_load(sg,b,pKV+K*COLS+48,COLS); \
                    jm::joint_matrix_mad(sg,c3,A,b,c3); \
                  }
                REUSE_MAD(a0,0);REUSE_MAD(a1,16);REUSE_MAD(a2,32);REUSE_MAD(a3,48);
                #undef REUSE_MAD
                // per-row combine weights (lane r <-> row row0+r)
                float w_l = 0.f, il_l = 0.f;
                if (lane < TM) {
                  const int rr = row0 + lane;
                  float gm = -INFINITY;
#pragma unroll
                  for (int t = 0; t < G; ++t) gm = sycl::max(gm, ml_s[t * BM + rr]);
                  float Lt = 0.f;
#pragma unroll
                  for (int t = 0; t < G; ++t) {
                    const float mt = ml_s[t * BM + rr];
                    const float wt = (mt == -INFINITY) ? 0.f : sycl::exp(mt - gm) * ml_s[(G + t) * BM + rr];
                    Lt += wt; if (t == team) w_l = wt;
                  }
                  il_l = (Lt == 0.f) ? 0.f : 1.f / Lt;
                  if (team == 0 && nbase == 0) { M[ml_off + rr] = gm; L[ml_off + rr] = Lt; }
                }
                mp_scale_rows_lane(sg,c0,w_l);mp_scale_rows_lane(sg,c1,w_l);
                mp_scale_rows_lane(sg,c2,w_l);mp_scale_rows_lane(sg,c3,w_l);
                if constexpr (MODE == 0) {
                if (team > 0) {
                  auto pc = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                     sycl::access::decorated::no>(comb + (team - 1) * BM * COLS);
                  jm::joint_matrix_store(sg,c0,pc+row0*COLS,COLS,jm::layout::row_major);
                  jm::joint_matrix_store(sg,c1,pc+row0*COLS+16,COLS,jm::layout::row_major);
                  jm::joint_matrix_store(sg,c2,pc+row0*COLS+32,COLS,jm::layout::row_major);
                  jm::joint_matrix_store(sg,c3,pc+row0*COLS+48,COLS,jm::layout::row_major);
                }
                c_il = il_l;
                } else if constexpr (MODE == 3) {
                  mp_scale_rows_lane(sg,c0,il_l);mp_scale_rows_lane(sg,c1,il_l);
                  mp_scale_rows_lane(sg,c2,il_l);mp_scale_rows_lane(sg,c3,il_l);
                } else {
                  // MODE 1/2: scale to final weight w_t/L now, store fp16 (team0 -> global, others -> SLM)
                  mp_scale_rows_lane(sg,c0,il_l);mp_scale_rows_lane(sg,c1,il_l);
                  mp_scale_rows_lane(sg,c2,il_l);mp_scale_rows_lane(sg,c3,il_l);
                  jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
                  jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
                  jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
                  if (team == 0) {
                    jm::joint_matrix_store(sg,h0,pOh+row0*BV+nbase,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h1,pOh+row0*BV+nbase+16,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h2,pOh+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h3,pOh+row0*BV+nbase+48,BV,jm::layout::row_major);
                  } else if constexpr (MODE == 1) {
                    auto pch = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                        sycl::access::decorated::no>(combh + (team - 1) * LR * BV);
                    jm::joint_matrix_store(sg,h0,pch+row0*BV+nbase,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h1,pch+row0*BV+nbase+16,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h2,pch+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h3,pch+row0*BV+nbase+48,BV,jm::layout::row_major);
                  }
                }
              }
              if constexpr (MODE == 3) {
                item.barrier(sycl::access::fence_space::local_space);   // all teams done reading their V tile
                if (team > 0 && sg_live) {
                  auto pt = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                     sycl::access::decorated::no>(kv_tile);   // own tile, 48x64 fp16
                  jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
                  jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
                  jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
                  jm::joint_matrix_store(sg,h0,pt+row0*COLS,COLS,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h1,pt+row0*COLS+16,COLS,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h2,pt+row0*COLS+32,COLS,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h3,pt+row0*COLS+48,COLS,jm::layout::row_major);
                }
                item.barrier(sycl::access::fence_space::local_space);
                if (team == 0 && sg_live) {
#pragma unroll
                  for (int t = 1; t < G; ++t) if (gidx * G + t < live_pages64) {
                    auto pt = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                       sycl::access::decorated::no>(
                        reinterpret_cast<sycl::half *>(&slm[0] + t * (TILE / 4)));
                    jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> xh;
                    jm::joint_matrix<sycl::sub_group,float,jm::use::accumulator,TM,TN> x;
#define TEAM_ADDH(K,OFF) jm::joint_matrix_load(sg,xh,pt+row0*COLS+OFF,COLS,jm::layout::row_major); jm::joint_matrix_copy(sg,xh,x); mp_add(sg,K,x);
                    TEAM_ADDH(c0,0) TEAM_ADDH(c1,16) TEAM_ADDH(c2,32) TEAM_ADDH(c3,48)
#undef TEAM_ADDH
                  }
                  jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
                  jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
                  jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
                  jm::joint_matrix_store(sg,h0,pOh+row0*BV+nbase,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h1,pOh+row0*BV+nbase+16,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h2,pOh+row0*BV+nbase+32,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h3,pOh+row0*BV+nbase+48,BV,jm::layout::row_major);
                }
              }
              if constexpr (MODE == 0) {
              item.barrier(sycl::access::fence_space::local_space);   // team>0 partials visible
              if (team == 0 && sg_live) {
#pragma unroll
                for (int t = 1; t < G; ++t) if (gidx * G + t < live_pages64) {
                  auto pc = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                     sycl::access::decorated::no>(comb + (t - 1) * BM * COLS);
                  jm::joint_matrix<sycl::sub_group,float,jm::use::accumulator,TM,TN> x;
#define TEAM_ADD(K,OFF) jm::joint_matrix_load(sg,x,pc+row0*COLS+OFF,COLS,jm::layout::row_major); mp_add(sg,K,x);
                  TEAM_ADD(c0,0) TEAM_ADD(c1,16) TEAM_ADD(c2,32) TEAM_ADD(c3,48)
#undef TEAM_ADD
                }
                mp_scale_rows_lane(sg,c0,c_il);mp_scale_rows_lane(sg,c1,c_il);
                mp_scale_rows_lane(sg,c2,c_il);mp_scale_rows_lane(sg,c3,c_il);
                jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
                jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
                jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
                jm::joint_matrix_store(sg,h0,pOh+row0*BV+nbase,BV,jm::layout::row_major);
                jm::joint_matrix_store(sg,h1,pOh+row0*BV+nbase+16,BV,jm::layout::row_major);
                jm::joint_matrix_store(sg,h2,pOh+row0*BV+nbase+32,BV,jm::layout::row_major);
                jm::joint_matrix_store(sg,h3,pOh+row0*BV+nbase+48,BV,jm::layout::row_major);
              }
              }
              if(nbase+COLS<BV) item.barrier(sycl::access::fence_space::local_space);
            }
          }
          if constexpr (MODE == 1) {
            item.barrier(sycl::access::fence_space::global_and_local);
            if (team == 0 && sg_live) {
#pragma unroll
              for (int r = 0; r < TM; ++r) {
#pragma unroll
                for (int cc = lane * 8; cc < BV; cc += SG_SIZE * 8) {
                  sycl::half *gp = reinterpret_cast<sycl::half *>(Part) + o_off + (row0 + r) * BV + cc;
                  sycl::vec<sycl::half, 8> acc = *reinterpret_cast<sycl::vec<sycl::half, 8> *>(gp);
                  sycl::vec<float, 8> f = acc.template convert<float>();
#pragma unroll
                  for (int tt = 1; tt < G; ++tt) if (gidx * G + tt < live_pages64) {
                    const sycl::vec<sycl::half, 8> x = *reinterpret_cast<const sycl::vec<sycl::half, 8> *>(
                        combh + (tt - 1) * LR * BV + (row0 + r) * BV + cc);
                    f += x.template convert<float>();
                  }
                  *reinterpret_cast<sycl::vec<sycl::half, 8> *>(gp) = f.template convert<sycl::half>();
                }
              }
            }
          }
        });
  });
}


// Track I: ESIMD stage-1 (correct-first). One ESIMD hardware thread = one sub-group's work.
// Grid: nprog * ESG groups, ESG=6 (verifier). Each thread owns TM=8 query rows.
// V: LSC block_load of packed int4 + in-register nibble decode (no SLM shuffle for V).
// QK/PV: xmx::dpas. Softmax in simd registers. XF&256 selects this path (lo = 40|256 = 296).
template <int HKV> class Xe2KvTorchAbiS1PagedReuseEsimdKernel;

template <int HKV>
static void launch_int8k_int4v_s1_paged_reuse_esimd(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
    const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4, const float *VS, const float *VZ,
    const std::int32_t *bt, const std::int32_t *seq_lens, float *Part, float *M, float *L,
    int n_splits, int q_len, size_t k_page_stride, size_t v_page_stride, size_t sc_page_stride,
    const std::int32_t *visible_lens = nullptr, int pages_per_block = 1) {
  namespace ei = sycl::ext::intel;
  namespace esimd = ei::esimd;
  namespace xmx = ei::esimd::xmx;
  namespace expm = ei::experimental::esimd;
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int ESG = 6; // verifier-shaped: 6 ESIMD threads / page (== wg6 SGs)
  TORCH_CHECK(q_len * GQA <= ESG * TM, "esimd S1 needs q_len*GQA <= 48");
  const int nprog = n_splits * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  // One nd-item per ESIMD thread; local size 1 (Explicit SIMD model).
  sycl::range<1> g(static_cast<size_t>(nprog) * ESG);
  sycl::range<1> l(1);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiS1PagedReuseEsimdKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) SYCL_ESIMD_KERNEL {
          const int tid = static_cast<int>(item.get_global_id(0));
          const int prog = tid / ESG;
          const int sg_id = tid - prog * ESG;
          const int row0 = sg_id * TM;
          const bool sg_live = row0 < q_len * GQA;
          // Head-interleaved launch order (same as XF&32).
          const int prog_x = (prog % HKV) * n_splits + prog / HKV;
          const int kv_head = prog_x / n_splits;
          const int logical = prog_x - kv_head * n_splits;
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const int n_valid = static_cast<int>(sycl::min<std::int64_t>(BM, sycl::max<std::int64_t>(0, seq_len - static_cast<std::int64_t>(logical) * BM)));
          if (n_valid <= 0) return;
          const int phys_raw = bt[logical];
          const int phys = (pages_per_block > 1) ? (phys_raw * pages_per_block) : phys_raw;
          if (phys < 0) return;

          const size_t k_head_off = static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
          const size_t v_head_off = static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t sc_head_off = static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);
          const size_t o_off = (static_cast<size_t>(prog_x) * BM + row0) * BV;
          float *pO = Part + static_cast<size_t>(prog_x) * BM * BV + row0 * BV;
          sycl::half *pOh = reinterpret_cast<sycl::half *>(Part) + static_cast<size_t>(prog_x) * BM * BV + row0 * BV;

          // ---- QK scores: for each of TM rows x n_valid tokens, int8 dpas-ish via scalar fallback for v1 correctness ----
          // Milestone v1: scalar QK+softmax+PV matching lo math (ESIMD used for V block loads + decode).
          // This establishes bit-identical baseline; v2 replaces scalar with xmx::dpas.
          float scores[TM][BM];
          float row_max[TM];
          float row_sum[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) {
            row_max[r] = -INFINITY;
            row_sum[r] = 0.f;
#pragma unroll
            for (int t = 0; t < BM; ++t) scores[r][t] = -INFINITY;
          }
          if (sg_live) {
            const std::int8_t *qbase = Q8 + (static_cast<size_t>(kv_head) * BM + row0) * BK;
            const float *qsc = Qsc + static_cast<size_t>(kv_head) * BM + row0;
            for (int t = 0; t < n_valid; ++t) {
              const std::int8_t *krow = K8 + k_head_off + static_cast<size_t>(t) * k_tok_stride;
              const float ksc = Ksc[sc_head_off + static_cast<size_t>(t) * sc_tok_stride];
#pragma unroll
              for (int r = 0; r < TM; ++r) {
                if (row0 + r >= q_len * GQA) continue;
                const std::int8_t *qrow = qbase + r * BK;
                int32_t acc = 0;
#pragma unroll
                for (int d = 0; d < BK; ++d) acc += static_cast<int32_t>(qrow[d]) * static_cast<int32_t>(krow[d]);
                const float s = static_cast<float>(acc) * qsc[r] * ksc * INV_SQRT_D;
                scores[r][t] = s;
                row_max[r] = sycl::fmax(row_max[r], s);
              }
            }
#pragma unroll
            for (int r = 0; r < TM; ++r) {
              if (row0 + r >= q_len * GQA) continue;
              float sm = 0.f;
              for (int t = 0; t < n_valid; ++t) {
                const float e = sycl::exp(scores[r][t] - row_max[r]);
                scores[r][t] = e;
                sm += e;
              }
              row_sum[r] = sm;
              M[static_cast<size_t>(prog_x) * BM + row0 + r] = row_max[r];
              L[static_cast<size_t>(prog_x) * BM + row0 + r] = sm;
            }
          }

          // ---- PV: ESIMD block_load V nibbles, in-register decode, accumulate ----
          // Process COLS=32 chunks; each chunk: 16 bytes/token.
          constexpr int COLS = 32;
          if (sg_live) {
#pragma unroll 1
            for (int nbase = 0; nbase < BV; nbase += COLS) {
              float acc[TM][COLS];
#pragma unroll
              for (int r = 0; r < TM; ++r)
#pragma unroll
                for (int c = 0; c < COLS; ++c) acc[r][c] = 0.f;
              for (int t = 0; t < n_valid; ++t) {
                const float v_scale = VS[sc_head_off + static_cast<size_t>(t) * sc_tok_stride];
                const float v_zero = VZ[sc_head_off + static_cast<size_t>(t) * sc_tok_stride];
                const std::uint8_t *vsrc = V4 + v_head_off + static_cast<size_t>(t) * v_tok_stride + (nbase >> 1);
                // ESIMD block_load 16B (=COLS/2 bytes) of packed int4
                esimd::simd<std::uint8_t, 16> raw = esimd::block_load<std::uint8_t, 16>(vsrc);
                sycl::half vdec[COLS];
#pragma unroll
                for (int j = 0; j < 16; ++j) {
                  const std::uint8_t b = raw[j];
                  vdec[2 * j] = sycl::half((static_cast<float>(b & 0xfu) - v_zero) * v_scale);
                  vdec[2 * j + 1] = sycl::half((static_cast<float>(b >> 4) - v_zero) * v_scale);
                }
#pragma unroll
                for (int r = 0; r < TM; ++r) {
                  if (row0 + r >= q_len * GQA) continue;
                  const float p = scores[r][t]; // already exp(s-m)
#pragma unroll
                  for (int c = 0; c < COLS; ++c) acc[r][c] += p * static_cast<float>(vdec[c]);
                }
              }
              // normalize by L and store fp16 partial
#pragma unroll
              for (int r = 0; r < TM; ++r) {
                if (row0 + r >= q_len * GQA) continue;
                const float inv = row_sum[r] > 0.f ? (1.f / row_sum[r]) : 0.f;
#pragma unroll
                for (int c = 0; c < COLS; ++c)
                  pOh[r * BV + nbase + c] = sycl::half(acc[r][c] * inv);
              }
            }
          }
        });
  });
}


template <int HKV, bool PF16, int COLS, int VW, int Q8P, int FUSE, int XF> class Xe2KvTorchAbiS1PagedReuseVWKernel;
// Round-4 helper: quantize one 8xTN fp32 accumulator tile row-wise to int8 using a
// per-(row,chunk) scale computed over the whole column chunk (passed in as inv[]).
template <bool BLK, typename JM>
static inline void q8_tile_store(sycl::sub_group sg, JM &c, const float (&inv)[TM], std::int8_t *dst, int lane) {
#if defined(__SYCL_DEVICE_ONLY__)
  auto w = sycl::ext::oneapi::detail::get_wi_data(sg, c);
#pragma unroll
  for (int i = 0; i < TM; ++i) { float e = w[i]; float qv = sycl::rint(e * inv[i]); qv = sycl::fmin(127.f, sycl::fmax(-127.f, qv));
    if constexpr (BLK) sg.store(sycl::address_space_cast<sycl::access::address_space::global_space, sycl::access::decorated::yes>(dst + i * BV), static_cast<std::int8_t>(qv));
    else dst[i * BV + lane] = static_cast<std::int8_t>(qv); }
#else
  std::ignore = sg; std::ignore = c; std::ignore = inv; std::ignore = dst; std::ignore = lane;
#endif
}
// col8 layout: per 8-row tile, byte (col*8 + r). One 64-bit block store per lane.
template <typename JM>
static inline void q8_tile_store_c8(sycl::sub_group sg, JM &c, const float (&inv)[TM], std::int8_t *tile_base, int col0) {
#if defined(__SYCL_DEVICE_ONLY__)
  auto w = sycl::ext::oneapi::detail::get_wi_data(sg, c);
  std::uint64_t pk = 0;
#pragma unroll
  for (int i = 0; i < TM; ++i) { float e = w[i]; float qv = sycl::rint(e * inv[i]); qv = sycl::fmin(127.f, sycl::fmax(-127.f, qv));
    pk |= static_cast<std::uint64_t>(static_cast<std::uint8_t>(static_cast<std::int8_t>(qv))) << (8 * i); }
  auto *d = reinterpret_cast<std::uint64_t *>(tile_base + static_cast<size_t>(col0) * 8);
  sg.store(sycl::address_space_cast<sycl::access::address_space::global_space, sycl::access::decorated::yes>(d), pk);
#else
  std::ignore = sg; std::ignore = c; std::ignore = inv; std::ignore = tile_base; std::ignore = col0;
#endif
}
template <typename JM>
static inline void q8_tile_absmax(sycl::sub_group sg, JM &c, float (&am)[TM]) {
#if defined(__SYCL_DEVICE_ONLY__)
  auto w = sycl::ext::oneapi::detail::get_wi_data(sg, c);
#pragma unroll
  for (int i = 0; i < TM; ++i) { float e = w[i]; am[i] = sycl::fmax(am[i], sycl::fabs(e)); }
#else
  std::ignore = sg; std::ignore = c; std::ignore = am;
#endif
}
// Round-3: P=1 reuse kernel with selectable V-load width / column chunk.
template <int HKV, bool PF16, int COLS, int VW, int Q8P = 0, int FUSE = 0, int XF = 0>
static void launch_int8k_int4v_s1_paged_reuse_vw(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                        const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                        const float *VS, const float *VZ, const std::int32_t *bt,
                                        const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                        int n_splits, int q_len,
                                        size_t k_page_stride, size_t v_page_stride, size_t sc_page_stride,
                                        const std::int32_t *visible_lens = nullptr,
                                        int pages_per_block = 1) {
  constexpr int GQA = Heads<HKV>::gqa;
  if (q_len * GQA <= TM && s2_parallel_enabled() && s1_small_enabled()) {
    launch_int8k_int4v_s1_paged_small<HKV, PF16>(q, Q8, Qsc, K8, Ksc, V4, VS, VZ, bt, seq_lens, Part, M, L,
                                                 n_splits, q_len, k_page_stride, v_page_stride,
                                                 sc_page_stride, visible_lens, pages_per_block);
    return;
  }
  const int nprog = n_splits * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  // Track B (XF&8): verifier-shaped work-group, 6 sub-groups (48 rows >= q_len*GQA=42).
  constexpr int WGK = (XF & 8) ? 6 * SG_SIZE : WG_SIZE;
  if constexpr ((XF & 8) != 0) TORCH_CHECK(q_len * GQA <= 48, "WG6 needs q_len*GQA<=48");
  sycl::range<1> g(static_cast<size_t>(nprog) * WGK);
  sycl::range<1> l(WGK);
  constexpr int fstub = 0;
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(((XF & 1) ? 16384 : 8192) / sizeof(float)), h);
    h.parallel_for<Xe2KvTorchAbiS1PagedReuseVWKernel<HKV, PF16, COLS, VW, Q8P, FUSE, XF>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int pid_ = static_cast<int>(item.get_group(0));
          // XF&32: head-interleaved launch order (all KV heads of one page adjacent -> contiguous DRAM rows).
          const int prog = ((XF & 32) != 0) ? ((pid_ % HKV) * n_splits + pid_ / HKV) : pid_;
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          // Live-row gating (perf): BM=64 pads the query tile, but a decode step has only
          // q_len*GQA real rows (6 for a draft, 42 for MTP6 verify). A sub-group whose
          // 8 rows are all padding has nothing to compute or store. The flag is uniform
          // per sub-group, so joint_matrix collectives stay legal; every barrier below is
          // still taken by the whole work-group.
          const bool sg_live = row0 < q_len * GQA;
          const int kv_head = prog / n_splits;
          const int logical = prog - kv_head * n_splits;
          // Legacy path uses one final count. Varlen path reserves element 0
          // for max visible length and elements [1..q_len] for each query
          // row, matching Intel's speculative verifier contract.
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const std::int64_t n_valid64 = sycl::max(
              static_cast<std::int64_t>(0),
              sycl::min(static_cast<std::int64_t>(BM),
                        seq_len - static_cast<std::int64_t>(logical) * BM));
          const int n_valid = static_cast<int>(n_valid64);
          // Graph-static n_splits pads past seq_len. S2 only merges n_live
          // splits, so empty groups can return without touching SLM/DPAS.
          if (n_valid <= 0) return;
          // pages_per_block==1: block_table entries are already 64-token pages.
          // Larger vLLM blocks expand as block_id * ratio + page_in_block, which
          // matches slot/64 used by the store. No host-side table is built.
          const int phys = (pages_per_block <= 1)
                               ? static_cast<int>(bt[logical])
                               : static_cast<int>(bt[logical / pages_per_block]) * pages_per_block +
                                     (logical % pages_per_block);

          float *base_f = &slm[0];
          auto *base = reinterpret_cast<std::uint8_t *>(base_f);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *p_raw = reinterpret_cast<sycl::half *>(base);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(base);

          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                  sycl::access::decorated::no>(s_i32);
          auto p_slm = sycl::address_space_cast<sycl::access::address_space::local_space,
                                                sycl::access::decorated::no>(p_raw);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(kv_tile);

          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;
          const size_t k_head_off =
              static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
          const size_t v_head_off =
              static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t sc_head_off =
              static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);

          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(Q8 + q_off));
          auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(K8 + k_head_off));
          auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                             sycl::access::decorated::no>(Part + o_off);
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              reinterpret_cast<sycl::half *>(Part) + o_off);

          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t)
            ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];

          float first_scores[TM][2];
          // Track B (XF&1): stage each 32-token K half once in SLM [8K,16K) and let all
          // live sub-groups read their DPAS B operand from SLM instead of 6x from global/L1.
          std::int8_t *ks_raw = reinterpret_cast<std::int8_t *>(base) + 8192;
          auto pKs = sycl::address_space_cast<sycl::access::address_space::local_space,
                                              sycl::access::decorated::no>(ks_raw);
          for(int half=0;half<2;++half){
            if constexpr((XF & 1) != 0){
              const int t = lid >> 2, qd = (lid & 3) * 64;
              const std::int8_t *src = K8 + k_head_off + static_cast<size_t>(half * 32 + t) * k_tok_stride + qd;
              std::int8_t *dk = ks_raw + t * BK + qd;
#pragma unroll
              for (int u = 0; u < 4; ++u)
                *reinterpret_cast<sycl::vec<std::uint32_t, 4> *>(dk + u * 16) =
                    *reinterpret_cast<const sycl::vec<std::uint32_t, 4> *>(src + u * 16);
              item.barrier(sycl::access::fence_space::local_space);
            }
            if(sg_live){
              jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::a,TM,TK_I8,jm::layout::row_major> a;
              jm::joint_matrix<sycl::sub_group,std::int8_t,jm::use::b,TK_I8,TN,jm::layout::col_major> b;
              jm::joint_matrix<sycl::sub_group,std::int32_t,jm::use::accumulator,TM,TN> c0,c1;
              jm::joint_matrix_fill(sg,c0,0);jm::joint_matrix_fill(sg,c1,0);
              for(int k=0;k<BK;k+=TK_I8){
                jm::joint_matrix_load(sg,a,pQ8+row0*BK+k,BK);
                if constexpr((XF & 1) != 0) jm::joint_matrix_load(sg,b,pKs+k,BK);
                else jm::joint_matrix_load(sg,b,pK8+(half*32)*k_tok_stride+k,k_tok_stride);
                jm::joint_matrix_mad(sg,c0,a,b,c0);
                if constexpr((XF & 1) != 0) jm::joint_matrix_load(sg,b,pKs+16*BK+k,BK);
                else jm::joint_matrix_load(sg,b,pK8+(half*32+16)*k_tok_stride+k,k_tok_stride);
                jm::joint_matrix_mad(sg,c1,a,b,c1);
              }
              jm::joint_matrix_store(sg,c0,s_slm_i+row0*32,32,jm::layout::row_major);
              jm::joint_matrix_store(sg,c1,s_slm_i+row0*32+16,32,jm::layout::row_major);
            }
            sycl::group_barrier(sg);
            if(half==0 && sg_live){
              #pragma unroll
              for(int r=0;r<TM;++r){
                #pragma unroll
                for(int t=0;t<2;++t)
                  first_scores[r][t]=static_cast<float>(s_i32[(row0+r)*32+t*16+lane])*qsc[r]*ksc[t]*INV_SQRT_D;
              }
            }
            // Each subgroup owns its score rows; all first-half reads must
            // finish before it overwrites those rows with the second half.
            if constexpr((XF & 1) != 0) item.barrier(sycl::access::fence_space::local_space);
            else sycl::group_barrier(sg);
          }

          sycl::half saved_p[TM][NTN];
          if (!sg_live) {
            // Padding-only sub-group: publish an empty softmax state so any S2 variant
            // that touches these rows sees M=-inf, L=0 instead of stale workspace.
            if (lane < TM) {
              M[ml_off + row0 + lane] = -INFINITY;
              L[ml_off + row0 + lane] = 0.f;
            }
          } else {
            #pragma unroll
            for (int r = 0; r < TM; ++r) {
              const int row = row0 + r;
              const float qs = qsc[r];
              float m = -INFINITY;
              float vals[NTN];
              const int q_tok = row / GQA;
              // BM=64 pads the packed query tile.  Only live query rows have
              // a visible-lens entry; never read past [1+q_len].
              const bool live_q = row < q_len * GQA;
              const std::int64_t q_end = live_q
                  ? (visible_lens
                         ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                         : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                  : 0;
              for (int t = 0; t < NTN; ++t) {
                const int tok = t * SG_SIZE + lane;
                float s;
                if(t<2) s=first_scores[r][t];
                else {
                  const std::int32_t si=s_i32[row*32+(t-2)*SG_SIZE+lane];
                  s=static_cast<float>(si)*qs*ksc[t]*INV_SQRT_D;
                }
                // n_valid = tokens in this page; q_end = causal end for this spec Q token.
                // t=1 → q_end==seq_len (same as tok>=n_valid on the last page).
                // t>1 MTP → query i cannot see keys at/after seq_len-t+i+1.
                const std::int64_t k_abs =
                    static_cast<std::int64_t>(logical) * BM + tok;
                if (tok >= n_valid || row >= q_len * GQA || k_abs >= q_end) s = -INFINITY;
                vals[t] = s;
                m = sycl::max(m, s);
              }
              m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
              float sum = 0.f;
              float e[NTN];
              if (m == -INFINITY) {
                for (int t = 0; t < NTN; ++t) e[t] = 0.f;
              } else {
                for (int t = 0; t < NTN; ++t) {
                  e[t] = sycl::exp(vals[t] - m);
                  sum += e[t];
                }
                sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
              }
              float inv = (sum == 0.f) ? 0.f : 1.f / sum;
              for (int t = 0; t < NTN; ++t) {
                saved_p[r][t] = sycl::half(e[t] * inv);
              }
              if (lane == 0) {
                M[ml_off + row] = m;
                L[ml_off + row] = sum;
              }
            }
          }

          // In-place score -> probability packing changes ownership across
          // sub-groups. Every score read must finish before the first store.
          item.barrier(sycl::access::fence_space::local_space);
          if (sg_live) {
            #pragma unroll
            for (int r=0; r<TM; ++r) {
              #pragma unroll
              for (int t=0; t<NTN; ++t)
                p_slm[(row0+r)*BN + t*SG_SIZE+lane] = saved_p[r][t];
            }
          }
          item.barrier(sycl::access::fence_space::local_space);

          {
            // Four named matrices avoid the known joint_matrix-array issue.
            jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::a,TM,TK,jm::layout::row_major> a0,a1,a2,a3;
            jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::b,TK,TN,jm::layout::row_major> b;
            if(sg_live){
              jm::joint_matrix_load(sg,a0,p_slm+row0*BN,BN);
              jm::joint_matrix_load(sg,a1,p_slm+row0*BN+16,BN);
              jm::joint_matrix_load(sg,a2,p_slm+row0*BN+32,BN);
              jm::joint_matrix_load(sg,a3,p_slm+row0*BN+48,BN);
            }
            // All subgroups finish loading P into registers before V
            // decoding reuses that same shared-memory address range.
            item.barrier(sycl::access::fence_space::local_space);
            // VS/VZ are immutable for this page throughout the column loop.
            // Preserve all arithmetic, valid-token guards, and SLM ownership barriers.
            const int v_tok = lid >> 1;
            const bool v_valid = v_tok < n_valid;
            const float v_scale = v_valid ? VS[sc_head_off + v_tok * sc_tok_stride] : 0.f;
            const float v_zero = v_valid ? VZ[sc_head_off + v_tok * sc_tok_stride] : 0.f;
            float v_scale2 = 0.f, v_zero2 = 0.f;
            if constexpr ((XF & 8) != 0) {
              const int t2 = (lid + WGK) >> 1;
              if (lid < 128 - WGK && t2 < n_valid) { v_scale2 = VS[sc_head_off + t2 * sc_tok_stride]; v_zero2 = VZ[sc_head_off + t2 * sc_tok_stride]; }
            }
            float vbound=0.f;
            if constexpr(Q8P==2){
              // |o| <= max_tok |(q-z)*s|, q in [0,15]: one WG max per page.
              const float bb = v_valid ? sycl::fabs(v_scale)*sycl::fmax(sycl::fabs(v_zero),sycl::fabs(15.f-v_zero)) : 0.f;
              vbound = sycl::reduce_over_group(item.get_group(), bb, sycl::maximum<float>());
            }
            // XF&64 (COLS==32): ping-pong the 4KB V chunk tile inside the same 8KB SLM; the
            // next chunk is decoded before this chunk's DPAS, one WG barrier per chunk (4 vs 7/page).
            constexpr bool DBC = ((XF & 64) != 0) && COLS == 32;
            auto vdec = [&](int nb, sycl::half *dst) {
              if constexpr ((XF & 8) != 0) {
                decode_v_int4_reuse_vw<COLS, VW>(lid,V4+v_head_off,v_tok_stride,v_scale,v_zero,nb,n_valid,dst);
                if (lid < 128 - WGK) decode_v_int4_reuse_vw<COLS, VW>(lid + WGK,V4+v_head_off,v_tok_stride,v_scale2,v_zero2,nb,n_valid,dst);
              } else decode_v_int4_reuse_vw<COLS, VW>(lid,V4+v_head_off,v_tok_stride,v_scale,v_zero,nb,n_valid,dst);
            };
            if constexpr (DBC) { vdec(0, kv_tile); item.barrier(sycl::access::fence_space::local_space); }
            #pragma unroll 1
            for(int nbase=0;nbase<BV;nbase+=COLS){
              const int cbuf = DBC ? (((nbase / COLS) & 1) * 64 * COLS) : 0;
              auto pKVc = pKV + cbuf;
              if constexpr (DBC) { if (nbase + COLS < BV) vdec(nbase + COLS, kv_tile + (64 * COLS - cbuf)); }
              else
              if constexpr ((XF & 8) != 0) {
                decode_v_int4_reuse_vw<COLS, VW>(lid,V4+v_head_off,v_tok_stride,v_scale,v_zero,nbase,n_valid,kv_tile);
                if (lid < 128 - WGK) decode_v_int4_reuse_vw<COLS, VW>(lid + WGK,V4+v_head_off,v_tok_stride,v_scale2,v_zero2,nbase,n_valid,kv_tile);
              } else
              decode_v_int4_reuse_vw<COLS, VW>(lid,V4+v_head_off,v_tok_stride,v_scale,v_zero,
                                       nbase,n_valid,kv_tile);
              if constexpr (!DBC) item.barrier(sycl::access::fence_space::local_space);
              if(sg_live){
                jm::joint_matrix<sycl::sub_group,float,jm::use::accumulator,TM,TN> c0,c1,c2,c3;
                jm::joint_matrix_fill(sg,c0,0.f);jm::joint_matrix_fill(sg,c1,0.f);
                if constexpr(COLS==64){jm::joint_matrix_fill(sg,c2,0.f);jm::joint_matrix_fill(sg,c3,0.f);}
                #define REUSE_MAD(A,K) \
                  jm::joint_matrix_load(sg,b,pKVc+K*COLS,COLS); \
                  jm::joint_matrix_mad(sg,c0,A,b,c0); \
                  jm::joint_matrix_load(sg,b,pKVc+K*COLS+16,COLS); \
                  jm::joint_matrix_mad(sg,c1,A,b,c1); \
                  if constexpr(COLS==64){ \
                    jm::joint_matrix_load(sg,b,pKVc+K*COLS+32,COLS); \
                    jm::joint_matrix_mad(sg,c2,A,b,c2); \
                    jm::joint_matrix_load(sg,b,pKVc+K*COLS+48,COLS); \
                    jm::joint_matrix_mad(sg,c3,A,b,c3); \
                  }
                REUSE_MAD(a0,0);REUSE_MAD(a1,16);REUSE_MAD(a2,32);REUSE_MAD(a3,48);
                #undef REUSE_MAD
                if constexpr(Q8P){
                  // int8 partial + per-(row, COLS chunk) fp16 scale; halves S1 writes / S2 reads.
                  float am[TM];
                  #pragma unroll
                  for(int i=0;i<TM;++i) am[i]=0.f;
                  if constexpr(Q8P!=2){
                  q8_tile_absmax(sg,c0,am);q8_tile_absmax(sg,c1,am);
                  if constexpr(COLS==64){q8_tile_absmax(sg,c2,am);q8_tile_absmax(sg,c3,am);}
                  }
                  float inv[TM];
                  constexpr int NCH = BV / COLS; constexpr bool Q8BLK = true;
                  std::int8_t *qb = reinterpret_cast<std::int8_t *>(Part) + o_off;
                  sycl::half *sb = reinterpret_cast<sycl::half *>(reinterpret_cast<std::int8_t *>(Part) + static_cast<size_t>(nprog) * BM * BV) + static_cast<size_t>(prog) * BM * NCH;
                  #pragma unroll
                  for(int i=0;i<TM;++i){
                    const float a=(Q8P!=2)?sycl::reduce_over_group(sg,am[i],sycl::maximum<float>()):vbound;
                    inv[i]= a>0.f ? 127.f/a : 0.f;
                    if(lane==i) sb[(row0+i)*NCH + nbase/COLS]=sycl::half(a*(1.f/127.f));
                  }
                  if constexpr(Q8P==3){
                    std::int8_t *tb=qb+row0*BV;
                    q8_tile_store_c8(sg,c0,inv,tb,nbase);q8_tile_store_c8(sg,c1,inv,tb,nbase+16);
                    if constexpr(COLS==64){q8_tile_store_c8(sg,c2,inv,tb,nbase+32);q8_tile_store_c8(sg,c3,inv,tb,nbase+48);}
                  } else {
                  std::int8_t *dst=qb+row0*BV+nbase;
                  q8_tile_store<Q8BLK>(sg,c0,inv,dst,lane);q8_tile_store<Q8BLK>(sg,c1,inv,dst+16,lane);
                  if constexpr(COLS==64){q8_tile_store<Q8BLK>(sg,c2,inv,dst+32,lane);q8_tile_store<Q8BLK>(sg,c3,inv,dst+48,lane);}
                  }
                } else
                if constexpr(PF16){
                  jm::joint_matrix<sycl::sub_group,sycl::half,jm::use::accumulator,TM,TN> h0,h1,h2,h3;
                  jm::joint_matrix_copy(sg,c0,h0);jm::joint_matrix_copy(sg,c1,h1);
                  jm::joint_matrix_store(sg,h0,pOh+row0*BV+nbase,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,h1,pOh+row0*BV+nbase+16,BV,jm::layout::row_major);
                  if constexpr(COLS==64){
                    jm::joint_matrix_copy(sg,c2,h2);jm::joint_matrix_copy(sg,c3,h3);
                    jm::joint_matrix_store(sg,h2,pOh+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,h3,pOh+row0*BV+nbase+48,BV,jm::layout::row_major);
                  }
                } else {
                  jm::joint_matrix_store(sg,c0,pO+row0*BV+nbase,BV,jm::layout::row_major);
                  jm::joint_matrix_store(sg,c1,pO+row0*BV+nbase+16,BV,jm::layout::row_major);
                  if constexpr(COLS==64){
                    jm::joint_matrix_store(sg,c2,pO+row0*BV+nbase+32,BV,jm::layout::row_major);
                    jm::joint_matrix_store(sg,c3,pO+row0*BV+nbase+48,BV,jm::layout::row_major);
                  }
                }
              }
              if(nbase+COLS<BV) item.barrier(sycl::access::fence_space::local_space);
            }
          }
          if constexpr (FUSE > 1 && PF16 && Q8P == 0) {
            // Fused stage-2 pre-reduction: the last work-group to finish in each run of FUSE
            // consecutive pages (same kv head) merges their partials (likely L2-resident)
            // into one group partial. Stage 2 then reads n_splits/FUSE partials.
            const int NG = (n_splits + FUSE - 1) / FUSE;
            const int g = logical / FUSE;
            const int live_pages = static_cast<int>((seq_len + BM - 1) / BM);
            const int expected = sycl::min(FUSE, live_pages - g * FUSE);
            sycl::half *Pg = reinterpret_cast<sycl::half *>(Part) + static_cast<size_t>(nprog) * BM * BV;
            const size_t ng_tot = static_cast<size_t>(HKV) * NG;
            float *Mg = reinterpret_cast<float *>(Pg + ng_tot * BM * BV);
            float *Lg = Mg + ng_tot * BM;
            int *Cnt = reinterpret_cast<int *>(Lg + ng_tot * BM);
            const size_t pg = static_cast<size_t>(kv_head) * NG + g;
            if (fstub == 1) return;  // timing: no fence/atomic/merge
            if (fstub != 3) sycl::atomic_fence(sycl::memory_order::release, sycl::memory_scope::device);
            item.barrier(sycl::access::fence_space::global_and_local);
            if (lid == 0) {
              sycl::atomic_ref<int, sycl::memory_order::acq_rel, sycl::memory_scope::device,
                               sycl::access::address_space::global_space> c(Cnt[pg]);
              const int old = c.fetch_add(1);
              const int last = (old == expected - 1) ? 1 : 0;
              if (last) c.store(0);
              s_i32[0] = last;
            }
            item.barrier(sycl::access::fence_space::local_space);
            const bool am_last = s_i32[0] != 0;
            if (!am_last || fstub == 2) return;  // 2: fence+atomic, no merge
            sycl::atomic_fence(sycl::memory_order::acquire, sycl::memory_scope::device);
            const int nrow = q_len * GQA;
            const int p_first = kv_head * n_splits + g * FUSE;
            const sycl::half *Ph = reinterpret_cast<const sycl::half *>(Part);
            for (int r = sg_id; r < nrow; r += WGK / SG_SIZE) {
              float mj[FUSE], gm = -INFINITY;
#pragma unroll
              for (int j = 0; j < FUSE; ++j) {
                { const float mm = M[static_cast<size_t>(p_first + sycl::min(j, expected - 1)) * BM + r]; mj[j] = (j < expected) ? mm : -INFINITY; }
                gm = sycl::max(gm, mj[j]);
              }
              float Lt = 0.f;
              float wj[FUSE];
#pragma unroll
              for (int j = 0; j < FUSE; ++j) {
                const float lv0 = L[static_cast<size_t>(p_first + sycl::min(j, expected - 1)) * BM + r]; const float lv = (j < expected) ? lv0 : 0.f;
                wj[j] = (mj[j] == -INFINITY || gm == -INFINITY) ? 0.f : sycl::exp(mj[j] - gm) * lv;
                Lt += wj[j];
              }
              const float invL = Lt > 0.f ? 1.f / Lt : 0.f;
              sycl::vec<float, 16> acc(0.f);
              // Branch-free, 4-deep batches so the L2 loads overlap (missing pages: weight 0,
              // index clamped to a live page so the load stays in bounds).
#pragma unroll
              for (int j0 = 0; j0 < FUSE; j0 += 4) {
                sycl::vec<sycl::half, 16> vb[4];
#pragma unroll
                for (int u = 0; u < 4; ++u) {
                  const int jj = sycl::min(j0 + u, expected - 1);
                  vb[u].load(0, sycl::address_space_cast<sycl::access::address_space::global_space, sycl::access::decorated::no>(
                      const_cast<sycl::half *>(Ph + (static_cast<size_t>(p_first + jj) * BM + r) * BV + lane * 16)));
                }
#pragma unroll
                for (int u = 0; u < 4; ++u) acc += vb[u].template convert<float>() * (wj[j0 + u] * invL);
              }
              sycl::vec<sycl::half, 16> o = acc.template convert<sycl::half>();
              o.store(0, sycl::address_space_cast<sycl::access::address_space::global_space, sycl::access::decorated::no>(
                  Pg + (pg * BM + r) * BV + lane * 16));
              if (lane == 0) { Mg[pg * BM + r] = gm; Lg[pg * BM + r] = Lt; }
            }
          }
        });
  });
}

// Track D (pp2): one 6-sub-group work-group covers TWO consecutive 64-token pages.
// Each page gets its own QK + page-local softmax (P normalized by its own sum), P0/P1 are
// held as DPAS A operands in registers, and the PV loop decodes both pages' V chunks into
// two 4 KB SLM tiles and combines o = w0*o0 + w1*o1 per row (w_j = e^(m_j-gm) l_j / L).
// One fp16 partial + one (max, sum) per row is written per page PAIR: half the partials.
template <int HKV, bool PS> class Xe2KvS1PP2Wg6Kernel;
// PS=true: P0/P1 kept in SLM (no register-held A operands; avoids the 1088 B spill).
template <int HKV, bool PS = false>
static void launch_s1_pp2_wg6(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                              const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                              const float *VS, const float *VZ, const std::int32_t *bt,
                              const std::int32_t *seq_lens, sycl::half *Part, float *M, float *L,
                              int n_splits, int q_len, size_t k_page_stride, size_t v_page_stride,
                              size_t sc_page_stride, const std::int32_t *visible_lens, int pages_per_block) {
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int COLS = 32;
  constexpr int WGK = 6 * SG_SIZE;
  TORCH_CHECK(q_len * GQA <= 48, "pp2 wg6 needs q_len*GQA<=48");
  const int ns2 = (n_splits + 1) / 2;
  const int nprog = ns2 * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WGK);
  sycl::range<1> l(WGK);
  q.submit([&](sycl::handler &h) {
    constexpr int PB = PS ? 2 * 48 * BN * 2 : 0;  // two 6 KB P buffers
    sycl::local_accessor<float, 1> slm(sycl::range<1>((8192 + 2 * 48 * 2 * 4 + PB) / 4), h);
    h.parallel_for<Xe2KvS1PP2Wg6Kernel<HKV, PS>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          const int kv_head = prog / ns2;
          const int gidx = prog - kv_head * ns2;
          const std::int32_t seq_len32 = visible_lens ? visible_lens[0] : seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const int lp0 = 2 * gidx, lp1 = 2 * gidx + 1;
          auto nval = [&](int lp) -> int {
            return static_cast<int>(sycl::max(static_cast<std::int64_t>(0),
                sycl::min(static_cast<std::int64_t>(BM), seq_len - static_cast<std::int64_t>(lp) * BM)));
          };
          const int nv0 = nval(lp0);
          const int nv1 = (lp1 < n_splits) ? nval(lp1) : 0;
          if (nv0 <= 0) return;
          auto physf = [&](int lp) -> int {
            return (pages_per_block <= 1) ? static_cast<int>(bt[lp])
                : static_cast<int>(bt[lp / pages_per_block]) * pages_per_block + (lp % pages_per_block);
          };
          const int ph0 = physf(lp0);
          const int ph1 = nv1 > 0 ? physf(lp1) : ph0;

          float *base_f = &slm[0];
          auto *base = reinterpret_cast<std::uint8_t *>(base_f);
          std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
          sycl::half *p_raw = reinterpret_cast<sycl::half *>(base);
          sycl::half *kv_tile = reinterpret_cast<sycl::half *>(base);
          float *mls = reinterpret_cast<float *>(base + 8192);
          sycl::half *pbuf = reinterpret_cast<sycl::half *>(base + 8192 + 2 * 48 * 2 * 4);
          auto pP = sycl::address_space_cast<sycl::access::address_space::local_space, sycl::access::decorated::no>(pbuf);
          auto s_slm_i = sycl::address_space_cast<sycl::access::address_space::local_space, sycl::access::decorated::no>(s_i32);
          auto p_slm = sycl::address_space_cast<sycl::access::address_space::local_space, sycl::access::decorated::no>(p_raw);
          auto pKV = sycl::address_space_cast<sycl::access::address_space::local_space, sycl::access::decorated::no>(kv_tile);

          const size_t q_off = static_cast<size_t>(kv_head) * BM * BK;
          const size_t qsc_off = static_cast<size_t>(kv_head) * BM;
          const size_t o_off = static_cast<size_t>(prog) * BM * BV;
          const size_t ml_off = static_cast<size_t>(prog) * BM;
          auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space, sycl::access::decorated::no>(
              const_cast<std::int8_t *>(Q8 + q_off));
          auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space, sycl::access::decorated::no>(Part + o_off);
          float qsc[TM];
#pragma unroll
          for (int r = 0; r < TM; ++r) qsc[r] = Qsc[qsc_off + row0 + r];

          jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::a, TM, TK, jm::layout::row_major> a0, a1, a2, a3, e0, e1, e2, e3;
          for (int pj = 0; pj < 2; ++pj) {
            const int nv = pj ? nv1 : nv0;
            const int ph = pj ? ph1 : ph0;
            const int lp = pj ? lp1 : lp0;
            sycl::half saved_p[TM][NTN];
            if (nv > 0) {
              const size_t k_head_off = static_cast<size_t>(ph) * k_page_stride + static_cast<size_t>(kv_head) * BK;
              const size_t sc_head_off = static_cast<size_t>(ph) * sc_page_stride + static_cast<size_t>(kv_head);
              auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space, sycl::access::decorated::no>(
                  const_cast<std::int8_t *>(K8 + k_head_off));
              float ksc[NTN];
#pragma unroll
              for (int t = 0; t < NTN; ++t) ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];
              float first_scores[TM][2];
              for (int half = 0; half < 2; ++half) {
                {
                  jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::a, TM, TK_I8, jm::layout::row_major> a;
                  jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::b, TK_I8, TN, jm::layout::col_major> b;
                  jm::joint_matrix<sycl::sub_group, std::int32_t, jm::use::accumulator, TM, TN> c0, c1;
                  jm::joint_matrix_fill(sg, c0, 0); jm::joint_matrix_fill(sg, c1, 0);
                  for (int k = 0; k < BK; k += TK_I8) {
                    jm::joint_matrix_load(sg, a, pQ8 + row0 * BK + k, BK);
                    jm::joint_matrix_load(sg, b, pK8 + (half * 32) * k_tok_stride + k, k_tok_stride);
                    jm::joint_matrix_mad(sg, c0, a, b, c0);
                    jm::joint_matrix_load(sg, b, pK8 + (half * 32 + 16) * k_tok_stride + k, k_tok_stride);
                    jm::joint_matrix_mad(sg, c1, a, b, c1);
                  }
                  jm::joint_matrix_store(sg, c0, s_slm_i + row0 * 32, 32, jm::layout::row_major);
                  jm::joint_matrix_store(sg, c1, s_slm_i + row0 * 32 + 16, 32, jm::layout::row_major);
                }
                sycl::group_barrier(sg);
                if (half == 0) {
#pragma unroll
                  for (int r = 0; r < TM; ++r)
#pragma unroll
                    for (int t = 0; t < 2; ++t)
                      first_scores[r][t] = static_cast<float>(s_i32[(row0 + r) * 32 + t * 16 + lane]) * qsc[r] * ksc[t] * INV_SQRT_D;
                }
                sycl::group_barrier(sg);
              }
#pragma unroll
              for (int r = 0; r < TM; ++r) {
                const int row = row0 + r;
                const float qs = qsc[r];
                float m = -INFINITY;
                float vals[NTN];
                const int q_tok = row / GQA;
                const bool live_q = row < q_len * GQA;
                const std::int64_t q_end = live_q
                    ? (visible_lens ? static_cast<std::int64_t>(visible_lens[1 + q_tok])
                                    : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                    : 0;
                for (int t = 0; t < NTN; ++t) {
                  const int tok = t * SG_SIZE + lane;
                  float s;
                  if (t < 2) s = first_scores[r][t];
                  else s = static_cast<float>(s_i32[row * 32 + (t - 2) * SG_SIZE + lane]) * qs * ksc[t] * INV_SQRT_D;
                  const std::int64_t k_abs = static_cast<std::int64_t>(lp) * BM + tok;
                  if (tok >= nv || !live_q || k_abs >= q_end) s = -INFINITY;
                  vals[t] = s;
                  m = sycl::max(m, s);
                }
                m = sycl::reduce_over_group(sg, m, sycl::maximum<float>());
                float sum = 0.f;
                float e[NTN];
                if (m == -INFINITY) {
                  for (int t = 0; t < NTN; ++t) e[t] = 0.f;
                } else {
                  for (int t = 0; t < NTN; ++t) { e[t] = sycl::exp(vals[t] - m); sum += e[t]; }
                  sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
                }
                const float inv = (sum == 0.f) ? 0.f : 1.f / sum;
                for (int t = 0; t < NTN; ++t) saved_p[r][t] = sycl::half(e[t] * inv);
                if (lane == 0) { mls[(pj * 48 + row) * 2] = m; mls[(pj * 48 + row) * 2 + 1] = sum; }
              }
            }
            if constexpr (PS) {
              // rows are sub-group owned: no work-group barrier needed between pages
              if (nv > 0) {
#pragma unroll
                for (int r = 0; r < TM; ++r)
#pragma unroll
                  for (int t = 0; t < NTN; ++t) pbuf[pj * 48 * BN + (row0 + r) * BN + t * SG_SIZE + lane] = saved_p[r][t];
              }
              sycl::group_barrier(sg);
              continue;
            }
            item.barrier(sycl::access::fence_space::local_space);
            if (nv > 0) {
#pragma unroll
              for (int r = 0; r < TM; ++r)
#pragma unroll
                for (int t = 0; t < NTN; ++t) p_slm[(row0 + r) * BN + t * SG_SIZE + lane] = saved_p[r][t];
            }
            item.barrier(sycl::access::fence_space::local_space);
            if (nv > 0) {
              if (pj == 0) {
                jm::joint_matrix_load(sg, a0, p_slm + row0 * BN, BN); jm::joint_matrix_load(sg, a1, p_slm + row0 * BN + 16, BN);
                jm::joint_matrix_load(sg, a2, p_slm + row0 * BN + 32, BN); jm::joint_matrix_load(sg, a3, p_slm + row0 * BN + 48, BN);
              } else {
                jm::joint_matrix_load(sg, e0, p_slm + row0 * BN, BN); jm::joint_matrix_load(sg, e1, p_slm + row0 * BN + 16, BN);
                jm::joint_matrix_load(sg, e2, p_slm + row0 * BN + 32, BN); jm::joint_matrix_load(sg, e3, p_slm + row0 * BN + 48, BN);
              }
            }
            item.barrier(sycl::access::fence_space::local_space);
          }
          if constexpr (PS) item.barrier(sycl::access::fence_space::local_space);
          // per-row combine weights, lane-distributed (lane i holds row row0+i)
          float w0l = 0.f, w1l = 0.f;
          {
            const int rr = row0 + (lane < TM ? lane : 0);
            const float m0 = mls[rr * 2], l0 = mls[rr * 2 + 1];
            const float m1 = nv1 > 0 ? mls[(48 + rr) * 2] : -INFINITY;
            const float l1 = nv1 > 0 ? mls[(48 + rr) * 2 + 1] : 0.f;
            const float gm = sycl::max(m0, m1);
            float f0 = 0.f, f1 = 0.f;
            if (gm != -INFINITY) {
              f0 = (m0 == -INFINITY) ? 0.f : sycl::exp(m0 - gm) * l0;
              f1 = (m1 == -INFINITY) ? 0.f : sycl::exp(m1 - gm) * l1;
            }
            const float Lt = f0 + f1;
            const float il = Lt > 0.f ? 1.f / Lt : 0.f;
            w0l = f0 * il; w1l = f1 * il;
            if (lane < TM) { M[ml_off + rr] = gm; L[ml_off + rr] = Lt; }
          }
          const size_t v_off0 = static_cast<size_t>(ph0) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t v_off1 = static_cast<size_t>(ph1) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t s_off0 = static_cast<size_t>(ph0) * sc_page_stride + static_cast<size_t>(kv_head);
          const size_t s_off1 = static_cast<size_t>(ph1) * sc_page_stride + static_cast<size_t>(kv_head);
          const int ta = lid >> 1, tb = (lid + WGK) >> 1;
          const bool hb = lid < 128 - WGK;
          const float vs0a = ta < nv0 ? VS[s_off0 + ta * sc_tok_stride] : 0.f, vz0a = ta < nv0 ? VZ[s_off0 + ta * sc_tok_stride] : 0.f;
          const float vs0b = (hb && tb < nv0) ? VS[s_off0 + tb * sc_tok_stride] : 0.f, vz0b = (hb && tb < nv0) ? VZ[s_off0 + tb * sc_tok_stride] : 0.f;
          const float vs1a = ta < nv1 ? VS[s_off1 + ta * sc_tok_stride] : 0.f, vz1a = ta < nv1 ? VZ[s_off1 + ta * sc_tok_stride] : 0.f;
          const float vs1b = (hb && tb < nv1) ? VS[s_off1 + tb * sc_tok_stride] : 0.f, vz1b = (hb && tb < nv1) ? VZ[s_off1 + tb * sc_tok_stride] : 0.f;
          sycl::half *kv_tile1 = kv_tile + 64 * COLS;
          auto pKV1 = pKV + 64 * COLS;
          jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::b, TK, TN, jm::layout::row_major> b;
#pragma unroll 1
          for (int nbase = 0; nbase < BV; nbase += COLS) {
            decode_v_int4_reuse_vw<COLS, 8>(lid, V4 + v_off0, v_tok_stride, vs0a, vz0a, nbase, nv0, kv_tile);
            if (hb) decode_v_int4_reuse_vw<COLS, 8>(lid + WGK, V4 + v_off0, v_tok_stride, vs0b, vz0b, nbase, nv0, kv_tile);
            if (nv1 > 0) {
              decode_v_int4_reuse_vw<COLS, 8>(lid, V4 + v_off1, v_tok_stride, vs1a, vz1a, nbase, nv1, kv_tile1);
              if (hb) decode_v_int4_reuse_vw<COLS, 8>(lid + WGK, V4 + v_off1, v_tok_stride, vs1b, vz1b, nbase, nv1, kv_tile1);
            }
            item.barrier(sycl::access::fence_space::local_space);
            jm::joint_matrix<sycl::sub_group, float, jm::use::accumulator, TM, TN> c0, c1, d0, d1;
            jm::joint_matrix_fill(sg, c0, 0.f); jm::joint_matrix_fill(sg, c1, 0.f);
#define PP2_MAD(A, K, T, X0, X1) \
            jm::joint_matrix_load(sg, b, T + K * COLS, COLS); jm::joint_matrix_mad(sg, X0, A, b, X0); \
            jm::joint_matrix_load(sg, b, T + K * COLS + 16, COLS); jm::joint_matrix_mad(sg, X1, A, b, X1);
            if constexpr (PS) {
              jm::joint_matrix_load(sg, a0, pP + row0 * BN, BN); jm::joint_matrix_load(sg, a1, pP + row0 * BN + 16, BN);
              jm::joint_matrix_load(sg, a2, pP + row0 * BN + 32, BN); jm::joint_matrix_load(sg, a3, pP + row0 * BN + 48, BN);
            }
            PP2_MAD(a0, 0, pKV, c0, c1) PP2_MAD(a1, 16, pKV, c0, c1) PP2_MAD(a2, 32, pKV, c0, c1) PP2_MAD(a3, 48, pKV, c0, c1)
            mp_scale_rows_lane(sg, c0, w0l); mp_scale_rows_lane(sg, c1, w0l);
            if (nv1 > 0) {
              jm::joint_matrix_fill(sg, d0, 0.f); jm::joint_matrix_fill(sg, d1, 0.f);
              if constexpr (PS) {
                jm::joint_matrix_load(sg, a0, pP + 48 * BN + row0 * BN, BN); jm::joint_matrix_load(sg, a1, pP + 48 * BN + row0 * BN + 16, BN);
                jm::joint_matrix_load(sg, a2, pP + 48 * BN + row0 * BN + 32, BN); jm::joint_matrix_load(sg, a3, pP + 48 * BN + row0 * BN + 48, BN);
                PP2_MAD(a0, 0, pKV1, d0, d1) PP2_MAD(a1, 16, pKV1, d0, d1) PP2_MAD(a2, 32, pKV1, d0, d1) PP2_MAD(a3, 48, pKV1, d0, d1)
              } else {
              PP2_MAD(e0, 0, pKV1, d0, d1) PP2_MAD(e1, 16, pKV1, d0, d1) PP2_MAD(e2, 32, pKV1, d0, d1) PP2_MAD(e3, 48, pKV1, d0, d1)
              }
              mp_scale_rows_lane(sg, d0, w1l); mp_scale_rows_lane(sg, d1, w1l);
              mp_add(sg, c0, d0); mp_add(sg, c1, d1);
            }
#undef PP2_MAD
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::accumulator, TM, TN> h0, h1;
            jm::joint_matrix_copy(sg, c0, h0); jm::joint_matrix_copy(sg, c1, h1);
            jm::joint_matrix_store(sg, h0, pOh + row0 * BV + nbase, BV, jm::layout::row_major);
            jm::joint_matrix_store(sg, h1, pOh + row0 * BV + nbase + 16, BV, jm::layout::row_major);
            if (nbase + COLS < BV) item.barrier(sycl::access::fence_space::local_space);
          }
        });
  });
}

template <int HKV>
static void launch_s2_merge(sycl::queue &q, const float *M, const float *L, const float *Acc,
                            float *Merged, const std::int32_t *seq_lens, int n_splits) {
  constexpr int S2_NWG = Heads<HKV>::s2_nwg;
  constexpr int VEC = 4;
  constexpr int NV = BV / (SG_SIZE * VEC);
  constexpr int WG = S2_SG_COUNT * SG_SIZE;
  sycl::range<1> g(static_cast<size_t>(S2_NWG) * WG);
  sycl::range<1> l(WG);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiS2MergeKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          auto sg = item.get_sub_group();
          const int gid = static_cast<int>(item.get_group(0));
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int lane = static_cast<int>(sg.get_local_id());
          const int row_linear = gid * S2_SG_COUNT + sg_id;
          const int head = row_linear / BM;
          const int row = row_linear - head * BM;
          const int p0 = head * n_splits;
          const std::int32_t seq_len32 = seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const int n_live = static_cast<int>(sycl::max(
              static_cast<std::int64_t>(1),
              sycl::min(static_cast<std::int64_t>(n_splits),
                        (seq_len + BM - 1) / BM)));
          float gm = -INFINITY;
          float lsum = 0.f;
          sycl::vec<float, VEC> ov[NV];
#pragma unroll
          for (int t = 0; t < NV; ++t) ov[t] = sycl::vec<float, VEC>(0.f);
          for (int s = 0; s < n_live; ++s) {
            const size_t mr = static_cast<size_t>(p0 + s) * BM + row;
            const float mv = M[mr];
            const float lv = L[mr];
            const float new_gm = sycl::max(gm, mv);
            const float alpha = (gm == -INFINITY) ? 0.f : sycl::exp(gm - new_gm);
            const float w = (mv == -INFINITY || new_gm == -INFINITY) ? 0.f : sycl::exp(mv - new_gm);
            const float wl = w * lv;
            lsum = lsum * alpha + wl;
            const float *ap = Acc + mr * BV;
#pragma unroll
            for (int t = 0; t < NV; ++t) {
              const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
              sycl::vec<float, VEC> v;
              v.load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                 sycl::access::decorated::no>(
                            const_cast<float *>(ap + d0)));
              ov[t] = ov[t] * alpha + wl * v;
            }
            gm = new_gm;
          }
          const float inv = 1.f / sycl::fmax(lsum, 1.0e-20f);
          float *op = Merged + (static_cast<size_t>(head) * BM + row) * BV;
#pragma unroll
          for (int t = 0; t < NV; ++t) {
            const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
#pragma unroll
            for (int k = 0; k < VEC; ++k) op[d0 + k] = ov[t][k] * inv;
          }
        });
  });
}


template <int HKV>
static void launch_s2_merge_to_out(sycl::queue &q, const float *M, const float *L, const float *Acc,
                                   float *Out, const std::int32_t *seq_lens, int n_splits, int tq) {
  // Stage2 online-softmax merge + HQ unpack in ONE submit (no Merged staging).
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int S2_NWG = Heads<HKV>::s2_nwg;
  constexpr int VEC = 4;
  constexpr int NV = BV / (SG_SIZE * VEC);
  constexpr int WG = S2_SG_COUNT * SG_SIZE;
  sycl::range<1> g(static_cast<size_t>(S2_NWG) * WG);
  sycl::range<1> l(WG);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiS2MergeOutKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          auto sg = item.get_sub_group();
          const int gid = static_cast<int>(item.get_group(0));
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int lane = static_cast<int>(sg.get_local_id());
          const int row_linear = gid * S2_SG_COUNT + sg_id;
          const int head = row_linear / BM;
          const int row = row_linear - head * BM;
          const int p0 = head * n_splits;
          const std::int32_t seq_len32 = seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const int n_live = static_cast<int>(sycl::max(
              static_cast<std::int64_t>(1),
              sycl::min(static_cast<std::int64_t>(n_splits),
                        (seq_len + BM - 1) / BM)));
          float gm = -INFINITY;
          float lsum = 0.f;
          sycl::vec<float, VEC> ov[NV];
#pragma unroll
          for (int t = 0; t < NV; ++t) ov[t] = sycl::vec<float, VEC>(0.f);
          for (int s = 0; s < n_live; ++s) {
            const size_t mr = static_cast<size_t>(p0 + s) * BM + row;
            const float mv = M[mr];
            const float lv = L[mr];
            const float new_gm = sycl::max(gm, mv);
            const float alpha = (gm == -INFINITY) ? 0.f : sycl::exp(gm - new_gm);
            const float w = (mv == -INFINITY || new_gm == -INFINITY) ? 0.f : sycl::exp(mv - new_gm);
            const float wl = w * lv;
            lsum = lsum * alpha + wl;
            const float *ap = Acc + mr * BV;
#pragma unroll
            for (int t = 0; t < NV; ++t) {
              const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
              sycl::vec<float, VEC> v;
              v.load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                 sycl::access::decorated::no>(
                            const_cast<float *>(ap + d0)));
              ov[t] = ov[t] * alpha + wl * v;
            }
            gm = new_gm;
          }
          const float inv = 1.f / sycl::fmax(lsum, 1.0e-20f);
          // Unpack map: row = t*GQA + gqa  ->  Out[t, head*GQA+gqa]
          const int gqa = row % GQA;
          const int tok = row / GQA;
          if (tok >= tq) return;
          const int h = head * GQA + gqa;
          float *op = Out + (static_cast<size_t>(tok) * HQ + h) * BV;
#pragma unroll
          for (int t = 0; t < NV; ++t) {
            const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
#pragma unroll
            for (int k = 0; k < VEC; ++k) op[d0 + k] = ov[t][k] * inv;
          }
        });
  });
}

// Same as launch_s2_merge_to_out but writes sycl::half (skips Python f32→f16 copy).
template <int HKV>
static void launch_s2_merge_to_out_half(sycl::queue &q, const float *M, const float *L,
                                        const float *Acc, sycl::half *Out,
                                        const std::int32_t *seq_lens, int n_splits, int tq) {
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int S2_NWG = Heads<HKV>::s2_nwg;
  constexpr int VEC = 4;
  constexpr int NV = BV / (SG_SIZE * VEC);
  constexpr int WG = S2_SG_COUNT * SG_SIZE;
  sycl::range<1> g(static_cast<size_t>(S2_NWG) * WG);
  sycl::range<1> l(WG);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiS2MergeOutHalfKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          auto sg = item.get_sub_group();
          const int gid = static_cast<int>(item.get_group(0));
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int lane = static_cast<int>(sg.get_local_id());
          const int row_linear = gid * S2_SG_COUNT + sg_id;
          const int head = row_linear / BM;
          const int row = row_linear - head * BM;
          const int p0 = head * n_splits;
          const std::int32_t seq_len32 = seq_lens[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_len32);
          const int n_live = static_cast<int>(sycl::max(
              static_cast<std::int64_t>(1),
              sycl::min(static_cast<std::int64_t>(n_splits),
                        (seq_len + BM - 1) / BM)));
          float gm = -INFINITY;
          float lsum = 0.f;
          sycl::vec<float, VEC> ov[NV];
#pragma unroll
          for (int t = 0; t < NV; ++t) ov[t] = sycl::vec<float, VEC>(0.f);
          for (int s = 0; s < n_live; ++s) {
            const size_t mr = static_cast<size_t>(p0 + s) * BM + row;
            const float mv = M[mr];
            const float lv = L[mr];
            const float new_gm = sycl::max(gm, mv);
            const float alpha = (gm == -INFINITY) ? 0.f : sycl::exp(gm - new_gm);
            const float w = (mv == -INFINITY || new_gm == -INFINITY) ? 0.f : sycl::exp(mv - new_gm);
            const float wl = w * lv;
            lsum = lsum * alpha + wl;
            const float *ap = Acc + mr * BV;
#pragma unroll
            for (int t = 0; t < NV; ++t) {
              const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
              sycl::vec<float, VEC> v;
              v.load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                 sycl::access::decorated::no>(
                            const_cast<float *>(ap + d0)));
              ov[t] = ov[t] * alpha + wl * v;
            }
            gm = new_gm;
          }
          const float inv = 1.f / sycl::fmax(lsum, 1.0e-20f);
          const int gqa = row % GQA;
          const int tok = row / GQA;
          if (tok >= tq) return;
          const int h = head * GQA + gqa;
          sycl::half *op = Out + (static_cast<size_t>(tok) * HQ + h) * BV;
#pragma unroll
          for (int t = 0; t < NV; ++t) {
            const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
#pragma unroll
            for (int k = 0; k < VEC; ++k)
              op[d0 + k] = static_cast<sycl::half>(ov[t][k] * inv);
          }
        });
  });
}

// One workgroup per live query row. N_SG subgroups each online-merge a
// contiguous run of pages, then subgroup 0 combines those N_SG states.
// Page Acc is normalized, so the page update scales by w*L. A subgroup
// state is already the weighted numerator, so the second update scales by w.
template <typename OutT, typename KernelName, int HKV, int N_SG, bool TWO_PASS = false,
          typename PartT = float>
static void launch_s2_parallel(sycl::queue &q, const float *M, const float *L, const PartT *Acc,
                               OutT *Out, const std::int32_t *seq_lens, int n_splits, int tq,
                               int pps = 1) {
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int VEC = 4;
  constexpr int NV = BV / (SG_SIZE * VEC);
  constexpr int WG = N_SG * SG_SIZE;
  constexpr int SLM_FLOATS = N_SG * (2 + BV);
  const int nrows = tq * HQ;
  sycl::range<1> g(static_cast<size_t>(nrows) * WG);
  sycl::range<1> l(WG);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(SLM_FLOATS), h);
    h.parallel_for<KernelName>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int lane = static_cast<int>(sg.get_local_id());
          const int gid = static_cast<int>(item.get_group(0));
          const int tok = gid / HQ;
          const int h = gid - tok * HQ;
          const int head = h / GQA;
          const int row = tok * GQA + (h - head * GQA);
          const int p0 = head * n_splits;
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_lens[0]);
          const int n_live = static_cast<int>(sycl::max(
              static_cast<std::int64_t>(1),
              sycl::min(static_cast<std::int64_t>(n_splits),
                        ((seq_len + BM - 1) / BM + pps - 1) / pps)));
          const int chunk = (n_live + N_SG - 1) / N_SG;
          const int s0 = sg_id * chunk;
          const int s1 = s0 + chunk < n_live ? s0 + chunk : n_live;

          float gm = -INFINITY;
          float lsum = 0.f;
          sycl::vec<float, VEC> ov[NV];
#pragma unroll
          for (int t = 0; t < NV; ++t) ov[t] = sycl::vec<float, VEC>(0.f);
          // Fixed maximum removes the loop-carried rescale of every vector.
          // Empty causal pages have M=-inf and L=0; retain the explicit guard.
          if constexpr (TWO_PASS) {
            for (int s = s0; s < s1; ++s)
              gm = sycl::max(gm, M[static_cast<size_t>(p0 + s) * BM + row]);
          }
          if constexpr (std::is_same_v<PartT, sycl::half> && !TWO_PASS) {
            // One-page lookahead: load the next immutable state while merging
            // the current page. Preserve original page/arithmetic order and
            // never access an empty subgroup or a page past its chunk.
            float next_m = -INFINITY, next_l = 0.f;
            sycl::vec<sycl::half, VEC> next_v[NV];
            if (s0 < s1) {
              const size_t first = static_cast<size_t>(p0 + s0) * BM + row;
              next_m = M[first];
              next_l = L[first];
#pragma unroll
              for (int t = 0; t < NV; ++t) {
                const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
                next_v[t].load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                           sycl::access::decorated::no>(
                                      const_cast<sycl::half *>(Acc + first * BV + d0)));
              }
            }
            for (int s = s0; s < s1; ++s) {
              const float mv = next_m, lv = next_l;
              sycl::vec<float, VEC> current_v[NV];
#pragma unroll
              for (int t = 0; t < NV; ++t) current_v[t] = next_v[t].template convert<float>();
              if (s + 1 < s1) {
                const size_t next = static_cast<size_t>(p0 + s + 1) * BM + row;
                next_m = M[next];
                next_l = L[next];
#pragma unroll
                for (int t = 0; t < NV; ++t) {
                  const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
                  next_v[t].load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                             sycl::access::decorated::no>(
                                        const_cast<sycl::half *>(Acc + next * BV + d0)));
                }
              }
              const float new_gm = sycl::max(gm, mv);
              const float alpha = (gm == -INFINITY) ? 0.f : sycl::exp(gm - new_gm);
              const float w = (mv == -INFINITY || new_gm == -INFINITY) ? 0.f : sycl::exp(mv - new_gm);
              const float wl = w * lv;
              lsum = lsum * alpha + wl;
#pragma unroll
              for (int t = 0; t < NV; ++t) ov[t] = ov[t] * alpha + wl * current_v[t];
              gm = new_gm;
            }
          } else {
          for (int s = s0; s < s1; ++s) {
            const size_t mr = static_cast<size_t>(p0 + s) * BM + row;
            const float mv = M[mr];
            const float lv = L[mr];
            const float new_gm = TWO_PASS ? gm : sycl::max(gm, mv);
            const float alpha = TWO_PASS ? 1.f : ((gm == -INFINITY) ? 0.f : sycl::exp(gm - new_gm));
            const float w = (mv == -INFINITY || new_gm == -INFINITY) ? 0.f : sycl::exp(mv - new_gm);
            const float wl = w * lv;
            lsum = lsum * alpha + wl;
            const PartT *ap = Acc + mr * BV;
#pragma unroll
            for (int t = 0; t < NV; ++t) {
              const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
              sycl::vec<float, VEC> v;
              if constexpr (std::is_same_v<PartT, float>) {
                v.load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                   sycl::access::decorated::no>(
                              const_cast<float *>(ap + d0)));
              } else {
                sycl::vec<sycl::half, VEC> hv;
                hv.load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                    sycl::access::decorated::no>(
                               const_cast<sycl::half *>(ap + d0)));
                v = hv.template convert<float>();
              }
              ov[t] = ov[t] * alpha + wl * v;
            }
            gm = new_gm;
          }
          }

          if (lane == 0) {
            slm[sg_id] = gm;
            slm[N_SG + sg_id] = lsum;
          }
#pragma unroll
          for (int t = 0; t < NV; ++t) {
            const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
#pragma unroll
            for (int k = 0; k < VEC; ++k)
              slm[2 * N_SG + sg_id * BV + d0 + k] = ov[t][k];
          }
          item.barrier(sycl::access::fence_space::local_space);
          if (sg_id != 0) return;

          gm = -INFINITY;
          lsum = 0.f;
#pragma unroll
          for (int t = 0; t < NV; ++t) ov[t] = sycl::vec<float, VEC>(0.f);
          if constexpr (TWO_PASS) {
            for (int i = 0; i < N_SG; ++i) gm = sycl::max(gm, slm[i]);
          }
          for (int i = 0; i < N_SG; ++i) {
            const float mv = slm[i];
            const float lv = slm[N_SG + i];
            const float new_gm = TWO_PASS ? gm : sycl::max(gm, mv);
            const float alpha = TWO_PASS ? 1.f : ((gm == -INFINITY) ? 0.f : sycl::exp(gm - new_gm));
            const float w = (mv == -INFINITY || new_gm == -INFINITY) ? 0.f : sycl::exp(mv - new_gm);
            lsum = lsum * alpha + w * lv;
#pragma unroll
            for (int t = 0; t < NV; ++t) {
              const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
              sycl::vec<float, VEC> v;
#pragma unroll
              for (int k = 0; k < VEC; ++k)
                v[k] = slm[2 * N_SG + i * BV + d0 + k];
              ov[t] = ov[t] * alpha + w * v;
            }
            gm = new_gm;
          }
          const float inv = 1.f / sycl::fmax(lsum, 1.0e-20f);
          OutT *op = Out + (static_cast<size_t>(tok) * HQ + h) * BV;
#pragma unroll
          for (int t = 0; t < NV; ++t) {
            const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
#pragma unroll
            for (int k = 0; k < VEC; ++k)
              op[d0 + k] = static_cast<OutT>(ov[t][k] * inv);
          }
        });
  });
}

template <int HKV>
static void launch_s2_parallel_half(sycl::queue &q, const float *M, const float *L, const float *Acc,
                                    sycl::half *Out, const std::int32_t *seq_lens, int n_splits,
                                    int tq, int nsg) {
  if (env_is_1("XE2_KV_S2_TWO_PASS")) {
    if (nsg == 8)
      launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2TwoPassHalf<HKV, 8>, HKV, 8, true>(q, M, L, Acc, Out, seq_lens, n_splits, tq);
    else if (nsg == 16)
      launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2TwoPassHalf<HKV, 16>, HKV, 16, true>(q, M, L, Acc, Out, seq_lens, n_splits, tq);
    else
      launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2TwoPassHalf<HKV, 32>, HKV, 32, true>(q, M, L, Acc, Out, seq_lens, n_splits, tq);
    return;
  }
  if (nsg == 8) {
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf8<HKV>, HKV, 8>(q, M, L, Acc, Out,
                                                                            seq_lens, n_splits, tq);
  } else if (nsg == 16) {
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf16<HKV>, HKV, 16>(q, M, L, Acc, Out,
                                                                              seq_lens, n_splits,
                                                                              tq);
  } else {
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf32<HKV>, HKV, 32>(q, M, L, Acc, Out,
                                                                              seq_lens, n_splits,
                                                                              tq);
  }
}

template <int HKV, int N_SG, bool C8> class Xe2KvTorchAbiS2ParallelQ8;
// Round-4: stage-2 merge over int8 partials with per-(row,chunk) fp16 scales.
template <int HKV, int N_SG, bool C8 = false>
static void launch_s2_parallel_q8(sycl::queue &q, const float *M, const float *L, const std::int8_t *Acc,
                                  sycl::half *Out, const std::int32_t *seq_lens, int n_splits, int tq, int cols) {
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int VEC = 4;
  constexpr int NV = BV / (SG_SIZE * VEC);
  constexpr int WG = N_SG * SG_SIZE;
  constexpr int SLM_FLOATS = N_SG * (2 + BV);
  const int nrows = tq * HQ;
  const int nch = BV / cols;
  const int csh = cols == 64 ? 6 : 5;
  const sycl::half *S = reinterpret_cast<const sycl::half *>(Acc + static_cast<size_t>(HKV) * n_splits * BM * BV);
  sycl::range<1> g(static_cast<size_t>(nrows) * WG);
  sycl::range<1> l(WG);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(SLM_FLOATS), h);
    h.parallel_for<Xe2KvTorchAbiS2ParallelQ8<HKV, N_SG, C8>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int lane = static_cast<int>(sg.get_local_id());
          const int gid = static_cast<int>(item.get_group(0));
          const int tok = gid / HQ;
          const int h = gid - tok * HQ;
          const int head = h / GQA;
          const int row = tok * GQA + (h - head * GQA);
          const int p0 = head * n_splits;
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_lens[0]);
          const int n_live = static_cast<int>(sycl::max(static_cast<std::int64_t>(1),
              sycl::min(static_cast<std::int64_t>(n_splits), (seq_len + BM - 1) / BM)));
          const int chunk = (n_live + N_SG - 1) / N_SG;
          const int s0 = sg_id * chunk;
          const int s1 = s0 + chunk < n_live ? s0 + chunk : n_live;
          float gm = -INFINITY, lsum = 0.f;
          sycl::vec<float, VEC> ov[NV];
#pragma unroll
          for (int t = 0; t < NV; ++t) ov[t] = sycl::vec<float, VEC>(0.f);
          for (int s = s0; s < s1; ++s) {
            const size_t mr = static_cast<size_t>(p0 + s) * BM + row;
            const float mv = M[mr];
            const float lv = L[mr];
            const std::int8_t *ap = Acc + mr * BV;
            const sycl::half *sp = S + mr * nch;
            sycl::vec<std::int8_t, VEC> qv[NV];
            float sc[NV];
#pragma unroll
            for (int t = 0; t < NV; ++t) {
              const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
              if constexpr (C8) {
                const std::int8_t *tp = Acc + (static_cast<size_t>(p0 + s) * BM + (row & ~7)) * BV + (row & 7);
#pragma unroll
                for (int k = 0; k < VEC; ++k) qv[t][k] = tp[(d0 + k) * 8];
              } else
              qv[t].load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                     sycl::access::decorated::no>(const_cast<std::int8_t *>(ap + d0)));
              sc[t] = static_cast<float>(sp[d0 >> csh]);
            }
            const float new_gm = sycl::max(gm, mv);
            const float alpha = (gm == -INFINITY) ? 0.f : sycl::exp(gm - new_gm);
            const float w = (mv == -INFINITY || new_gm == -INFINITY) ? 0.f : sycl::exp(mv - new_gm);
            const float wl = w * lv;
            lsum = lsum * alpha + wl;
#pragma unroll
            for (int t = 0; t < NV; ++t) ov[t] = ov[t] * alpha + (wl * sc[t]) * qv[t].template convert<float>();
            gm = new_gm;
          }
          if (lane == 0) { slm[sg_id] = gm; slm[N_SG + sg_id] = lsum; }
#pragma unroll
          for (int t = 0; t < NV; ++t) {
            const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
#pragma unroll
            for (int k = 0; k < VEC; ++k) slm[2 * N_SG + sg_id * BV + d0 + k] = ov[t][k];
          }
          item.barrier(sycl::access::fence_space::local_space);
          if (sg_id != 0) return;
          gm = -INFINITY; lsum = 0.f;
#pragma unroll
          for (int t = 0; t < NV; ++t) ov[t] = sycl::vec<float, VEC>(0.f);
          for (int i = 0; i < N_SG; ++i) {
            const float mv = slm[i];
            const float lv = slm[N_SG + i];
            const float new_gm = sycl::max(gm, mv);
            const float alpha = (gm == -INFINITY) ? 0.f : sycl::exp(gm - new_gm);
            const float w = (mv == -INFINITY || new_gm == -INFINITY) ? 0.f : sycl::exp(mv - new_gm);
            lsum = lsum * alpha + w * lv;
#pragma unroll
            for (int t = 0; t < NV; ++t) {
              const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
              sycl::vec<float, VEC> v;
#pragma unroll
              for (int k = 0; k < VEC; ++k) v[k] = slm[2 * N_SG + i * BV + d0 + k];
              ov[t] = ov[t] * alpha + w * v;
            }
            gm = new_gm;
          }
          const float inv = 1.f / sycl::fmax(lsum, 1.0e-20f);
          sycl::half *op = Out + (static_cast<size_t>(tok) * HQ + h) * BV;
#pragma unroll
          for (int t = 0; t < NV; ++t) {
            const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
#pragma unroll
            for (int k = 0; k < VEC; ++k) op[d0 + k] = static_cast<sycl::half>(ov[t][k] * inv);
          }
        });
  });
}

template <int HKV>
static void launch_s2_parallel_half_p16(sycl::queue &q, const float *M, const float *L,
                                        const sycl::half *Acc, sycl::half *Out,
                                        const std::int32_t *seq_lens, int n_splits, int tq,
                                        int nsg, int pps = 1) {
  if (nsg == 8)
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf8P16<HKV>, HKV, 8, false,
                       sycl::half>(q, M, L, Acc, Out, seq_lens, n_splits, tq, pps);
  else if (nsg == 16)
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf16P16<HKV>, HKV, 16, false,
                       sycl::half>(q, M, L, Acc, Out, seq_lens, n_splits, tq, pps);
  else
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf32P16<HKV>, HKV, 32, false,
                       sycl::half>(q, M, L, Acc, Out, seq_lens, n_splits, tq, pps);
}

template <int HKV>
static void launch_s2_parallel_float(sycl::queue &q, const float *M, const float *L, const float *Acc,
                                     float *Out, const std::int32_t *seq_lens, int n_splits, int tq,
                                     int nsg) {
  if (nsg == 8) {
    launch_s2_parallel<float, Xe2KvTorchAbiS2ParallelFloat8<HKV>, HKV, 8>(q, M, L, Acc, Out,
                                                                        seq_lens, n_splits, tq);
  } else if (nsg == 16) {
    launch_s2_parallel<float, Xe2KvTorchAbiS2ParallelFloat16<HKV>, HKV, 16>(q, M, L, Acc, Out,
                                                                          seq_lens, n_splits, tq);
  } else {
    launch_s2_parallel<float, Xe2KvTorchAbiS2ParallelFloat32<HKV>, HKV, 32>(q, M, L, Acc, Out,
                                                                          seq_lens, n_splits, tq);
  }
}

template <int HKV>
static void launch_unpack(sycl::queue &q, const float *Merged, float *Out, int tq) {
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  sycl::range<1> g(static_cast<size_t>(tq) * HQ * SG_SIZE);
  sycl::range<1> l(SG_SIZE);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiUnpackKernel<HKV>>(sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) {
      const int gid = static_cast<int>(item.get_group(0));
      const int lane = static_cast<int>(item.get_local_id(0));
      const int t = gid / HQ;
      const int h = gid - t * HQ;
      const int hkv = h / GQA;
      const int gqa = h - hkv * GQA;
      const int row = t * GQA + gqa;
      float *dst = Out + (static_cast<size_t>(t) * HQ + h) * BV;
      if (row >= BM) {
        for (int d = lane; d < BV; d += SG_SIZE) dst[d] = 0.f;
        return;
      }
      const float *src = Merged + (static_cast<size_t>(hkv) * BM + row) * BV;
      for (int d = lane; d < BV; d += SG_SIZE) dst[d] = src[d];
    });
  });
}

static void q_quant_once(const at::Tensor &q_fp16, at::Tensor q8, at::Tensor q_scale) {
  check_xpu_contig(q_fp16, "q_fp16");
  check_xpu_contig(q8, "q8");
  check_xpu_contig(q_scale, "q_scale");
  TORCH_CHECK(q_fp16.scalar_type() == at::kHalf, "q_fp16 must be float16");
  TORCH_CHECK(q8.scalar_type() == at::kChar, "q8 must be int8");
  TORCH_CHECK(q_scale.scalar_type() == at::kFloat, "q_scale must be float32");
  TORCH_CHECK(q_fp16.dim() == 3 && q_fp16.size(1) == BM && q_fp16.size(2) == BK,
              "q_fp16 shape [HKV,64,256]");
  dispatch_hkv(q_fp16.size(0), [&](auto hkv) {
    constexpr int HKV = decltype(hkv)::value;
    TORCH_CHECK(q_fp16.numel() == static_cast<int64_t>(HKV) * BM * BK, "q_fp16 numel [HKV,64,256]");
    TORCH_CHECK(q8.numel() == q_fp16.numel(), "q8 numel");
    TORCH_CHECK(q_scale.numel() == static_cast<int64_t>(HKV) * BM, "q_scale numel [HKV,64]");
    launch_q_quant<HKV>(current_xpu_queue(), as_half_c(q_fp16), q8.data_ptr<int8_t>(),
                       q_scale.data_ptr<float>());
  });
}

static void k_store(const at::Tensor &k_fp16, at::Tensor k8, at::Tensor k_scale) {
  check_xpu_contig(k_fp16, "k_fp16");
  check_xpu_contig(k8, "k8");
  check_xpu_contig(k_scale, "k_scale");
  TORCH_CHECK(k_fp16.scalar_type() == at::kHalf, "k_fp16 must be float16");
  TORCH_CHECK(k8.scalar_type() == at::kChar, "k8 must be int8");
  TORCH_CHECK(k_scale.scalar_type() == at::kFloat, "k_scale must be float32");
  TORCH_CHECK(k_fp16.numel() == static_cast<int64_t>(BM) * BK, "k_fp16 numel [64,256] pad-64 page");
  TORCH_CHECK(k8.numel() == k_fp16.numel(), "k8 numel");
  TORCH_CHECK(k_scale.numel() == BM, "k_scale numel [64]");
  launch_k_store(current_xpu_queue(), as_half_c(k_fp16), k8.data_ptr<int8_t>(),
                 k_scale.data_ptr<float>());
}

static void v_store(const at::Tensor &v_fp16, at::Tensor v4, at::Tensor v_scale,
                    at::Tensor v_zero) {
  check_xpu_contig(v_fp16, "v_fp16");
  check_xpu_contig(v4, "v4");
  check_xpu_contig(v_scale, "v_scale");
  check_xpu_contig(v_zero, "v_zero");
  TORCH_CHECK(v_fp16.scalar_type() == at::kHalf, "v_fp16 must be float16");
  TORCH_CHECK(v4.scalar_type() == at::kByte, "v4 must be uint8");
  TORCH_CHECK(v_scale.scalar_type() == at::kFloat && v_zero.scalar_type() == at::kFloat,
              "v scale/zero float32");
  TORCH_CHECK(v_fp16.numel() == static_cast<int64_t>(BM) * BK, "v_fp16 numel [64,256] pad-64 page");
  TORCH_CHECK(v4.numel() == static_cast<int64_t>(BM) * V4_COLS, "v4 numel [64,128]");
  TORCH_CHECK(v_scale.numel() == BM && v_zero.numel() == BM, "v scale/zero numel [64]");
  launch_v_store(current_xpu_queue(), as_half_c(v_fp16), v4.data_ptr<uint8_t>(),
                 v_scale.data_ptr<float>(), v_zero.data_ptr<float>());
}

static void int8k_int4v_s1(const at::Tensor &q8, const at::Tensor &q_scale, const at::Tensor &k8,
                           const at::Tensor &k_scale, const at::Tensor &v4,
                           const at::Tensor &v_scale, const at::Tensor &v_zero, at::Tensor out) {
  check_xpu_contig(q8, "q8");
  check_xpu_contig(q_scale, "q_scale");
  check_xpu_contig(k8, "k8");
  check_xpu_contig(k_scale, "k_scale");
  check_xpu_contig(v4, "v4");
  check_xpu_contig(v_scale, "v_scale");
  check_xpu_contig(v_zero, "v_zero");
  check_xpu_contig(out, "out");
  TORCH_CHECK(q8.scalar_type() == at::kChar && k8.scalar_type() == at::kChar, "q8/k8 int8");
  TORCH_CHECK(v4.scalar_type() == at::kByte, "v4 uint8");
  TORCH_CHECK(out.scalar_type() == at::kFloat, "out float32");
  TORCH_CHECK(q8.dim() == 3 && q8.size(1) == BM && q8.size(2) == BK, "q8 shape [HKV,64,256]");
  dispatch_hkv(q8.size(0), [&](auto hkv) {
    constexpr int HKV = decltype(hkv)::value;
    TORCH_CHECK(q8.numel() == static_cast<int64_t>(HKV) * BM * BK, "q8 unique [HKV,64,256]");
    const int64_t k_rows = k8.numel() / BK;
    TORCH_CHECK(k8.numel() % BK == 0, "k8 must be rows x 256");
    TORCH_CHECK(k_rows % BM == 0, "k8 rows must be a multiple of BM=64");
    const int nprog = static_cast<int>(k_rows / BM);
    TORCH_CHECK(nprog > 0 && (nprog % HKV) == 0, "nprog multiple of HKV");
    TORCH_CHECK(k_scale.numel() == k_rows && v_scale.numel() == k_rows && v_zero.numel() == k_rows,
                "scales [nprog,64]");
    TORCH_CHECK(v4.numel() == k_rows * V4_COLS, "v4 [nprog,64,128]");
    TORCH_CHECK(out.numel() == k_rows * BV, "out [nprog,64,256]");
    launch_int8k_int4v_s1<HKV>(current_xpu_queue(), q8.data_ptr<int8_t>(),
                               q_scale.data_ptr<float>(), k8.data_ptr<int8_t>(),
                               k_scale.data_ptr<float>(), v4.data_ptr<uint8_t>(),
                               v_scale.data_ptr<float>(), v_zero.data_ptr<float>(),
                               out.data_ptr<float>(), nprog);
  });
}

template <int HKV>
static void check_paged_k(const at::Tensor &k_cache, const at::Tensor &k_scale) {
  TORCH_CHECK(k_cache.is_xpu() && k_scale.is_xpu(), "k_cache/k_scale XPU");
  TORCH_CHECK(k_cache.scalar_type() == at::kChar, "k_cache int8");
  TORCH_CHECK(k_scale.scalar_type() == at::kFloat, "k_scale float32");
  TORCH_CHECK(k_cache.dim() == 4 && k_cache.size(1) == PAGE && k_cache.size(2) == HKV &&
                  k_cache.size(3) == BK,
              "k_cache [num_blocks,64,", HKV, ",256] NHD");
  TORCH_CHECK(k_scale.dim() == 3 && k_scale.size(0) == k_cache.size(0) && k_scale.size(1) == PAGE &&
                  k_scale.size(2) == HKV,
              "k_scale [num_blocks,64,", HKV, "]");
  TORCH_CHECK(k_cache.stride(3) == 1 && k_cache.stride(2) == BK &&
                  k_cache.stride(1) == HKV * BK,
              "k_cache within-page strides");
  TORCH_CHECK(k_scale.stride(2) == 1 && k_scale.stride(1) == HKV,
              "k_scale within-page strides");
}

template <int HKV>
static void check_paged_v(const at::Tensor &v_cache, const at::Tensor &v_scale,
                          const at::Tensor &v_zero) {
  TORCH_CHECK(v_cache.is_xpu() && v_scale.is_xpu() && v_zero.is_xpu(), "v_* XPU");
  TORCH_CHECK(v_cache.scalar_type() == at::kByte, "v_cache uint8 packed int4");
  TORCH_CHECK(v_scale.scalar_type() == at::kFloat && v_zero.scalar_type() == at::kFloat,
              "v scale/zero float32");
  TORCH_CHECK(v_cache.dim() == 4 && v_cache.size(1) == PAGE && v_cache.size(2) == HKV &&
                  v_cache.size(3) == V4_COLS,
              "v_cache [num_blocks,64,", HKV, ",128] NHD packed");
  TORCH_CHECK(v_scale.sizes() == v_zero.sizes(), "v_scale/v_zero shape");
  TORCH_CHECK(v_scale.dim() == 3 && v_scale.size(0) == v_cache.size(0) && v_scale.size(1) == PAGE &&
                  v_scale.size(2) == HKV,
              "v_scale [num_blocks,64,", HKV, "]");
  TORCH_CHECK(v_cache.stride(3) == 1 && v_cache.stride(2) == V4_COLS &&
                  v_cache.stride(1) == HKV * V4_COLS,
              "v_cache within-page strides");
  TORCH_CHECK(v_scale.stride(2) == 1 && v_scale.stride(1) == HKV, "v_scale within-page");
  TORCH_CHECK(v_zero.stride(2) == 1 && v_zero.stride(1) == HKV, "v_zero within-page");
}

static void k_store_paged(const at::Tensor &k_fp16, const at::Tensor &slot_mapping,
                          at::Tensor k_cache, at::Tensor k_scale) {
  check_xpu_contig(k_fp16, "k_fp16");
  check_xpu_contig(slot_mapping, "slot_mapping");
  TORCH_CHECK(k_fp16.dim() == 3 && k_fp16.size(2) == BK, "k_fp16 [T,HKV,256]");
  TORCH_CHECK(k_fp16.scalar_type() == at::kHalf, "k_fp16 float16");
  TORCH_CHECK(slot_mapping.scalar_type() == at::kLong, "slot_mapping int64");
  dispatch_hkv(k_fp16.size(1), [&](auto hkv) {
    constexpr int HKV = decltype(hkv)::value;
    check_paged_k<HKV>(k_cache, k_scale);
    TORCH_CHECK(slot_mapping.numel() == k_fp16.size(0), "slot_mapping [T]");
    launch_k_store_paged<HKV>(current_xpu_queue(), as_half_c(k_fp16),
                              slot_mapping.data_ptr<int64_t>(), k_cache.data_ptr<int8_t>(),
                              k_scale.data_ptr<float>(), k_fp16.size(0), k_cache.size(0),
                              static_cast<size_t>(k_cache.stride(0)),
                              static_cast<size_t>(k_scale.stride(0)));
  });
}

static void v_store_paged(const at::Tensor &v_fp16, const at::Tensor &slot_mapping,
                          at::Tensor v_cache, at::Tensor v_scale, at::Tensor v_zero) {
  check_xpu_contig(v_fp16, "v_fp16");
  check_xpu_contig(slot_mapping, "slot_mapping");
  TORCH_CHECK(v_fp16.dim() == 3 && v_fp16.size(2) == BK, "v_fp16 [T,HKV,256]");
  TORCH_CHECK(v_fp16.scalar_type() == at::kHalf, "v_fp16 float16");
  TORCH_CHECK(slot_mapping.scalar_type() == at::kLong, "slot_mapping int64");
  dispatch_hkv(v_fp16.size(1), [&](auto hkv) {
    constexpr int HKV = decltype(hkv)::value;
    check_paged_v<HKV>(v_cache, v_scale, v_zero);
    TORCH_CHECK(slot_mapping.numel() == v_fp16.size(0), "slot_mapping [T]");
    launch_v_store_paged<HKV>(current_xpu_queue(), as_half_c(v_fp16),
                              slot_mapping.data_ptr<int64_t>(), v_cache.data_ptr<uint8_t>(),
                              v_scale.data_ptr<float>(), v_zero.data_ptr<float>(),
                              v_fp16.size(0), v_cache.size(0),
                              static_cast<size_t>(v_cache.stride(0)),
                              static_cast<size_t>(v_scale.stride(0)));
  });
}

// One Python→C++ entry for decode K+V pack (two SYCL submits, one ABI hop).
static void kv_store_paged(const at::Tensor &k_fp16, const at::Tensor &v_fp16,
                           const at::Tensor &slot_mapping, at::Tensor k_cache, at::Tensor k_scale,
                           at::Tensor v_cache, at::Tensor v_scale, at::Tensor v_zero) {
  check_xpu_contig(k_fp16, "k_fp16");
  check_xpu_contig(v_fp16, "v_fp16");
  check_xpu_contig(slot_mapping, "slot_mapping");
  TORCH_CHECK(k_fp16.dim() == 3 && k_fp16.size(2) == BK, "k_fp16 [T,HKV,256]");
  TORCH_CHECK(k_fp16.scalar_type() == at::kHalf && v_fp16.scalar_type() == at::kHalf,
              "k/v_fp16 float16");
  TORCH_CHECK(slot_mapping.scalar_type() == at::kLong, "slot_mapping int64");
  TORCH_CHECK(v_fp16.sizes() == k_fp16.sizes(), "v_fp16 must match k_fp16");
  TORCH_CHECK(k_cache.size(0) == v_cache.size(0), "k/v num_blocks");
  auto &q = current_xpu_queue();
  const int64_t ntok = k_fp16.size(0);
  const int64_t nblocks = k_cache.size(0);
  const auto *slots = slot_mapping.data_ptr<int64_t>();
  dispatch_hkv(k_fp16.size(1), [&](auto hkv) {
    constexpr int HKV = decltype(hkv)::value;
    check_paged_k<HKV>(k_cache, k_scale);
    check_paged_v<HKV>(v_cache, v_scale, v_zero);
    TORCH_CHECK(slot_mapping.numel() == k_fp16.size(0), "slot_mapping [T]");
    launch_k_store_paged<HKV>(q, as_half_c(k_fp16), slots, k_cache.data_ptr<int8_t>(),
                              k_scale.data_ptr<float>(), ntok, nblocks,
                              static_cast<size_t>(k_cache.stride(0)),
                              static_cast<size_t>(k_scale.stride(0)));
    launch_v_store_paged<HKV>(q, as_half_c(v_fp16), slots, v_cache.data_ptr<uint8_t>(),
                              v_scale.data_ptr<float>(), v_zero.data_ptr<float>(), ntok, nblocks,
                              static_cast<size_t>(v_cache.stride(0)),
                              static_cast<size_t>(v_scale.stride(0)));
  });
}

template <int HKV>
static void int8k_int4v_s1_paged_impl(const at::Tensor &q8, const at::Tensor &q_scale,
                                 const at::Tensor &k_cache, const at::Tensor &k_scale,
                                 const at::Tensor &v_cache, const at::Tensor &v_scale,
                                 const at::Tensor &v_zero, const at::Tensor &block_table,
                                 const at::Tensor &seq_lens, at::Tensor out,
                                 const at::Tensor &visible_lens,
                                 const at::Tensor &partials_ws,
                                 const at::Tensor &m_ws,
                                 const at::Tensor &l_ws,
                                 const at::Tensor &merged_ws,
                                 int pages_per_block = 1) {
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  check_xpu_contig(q8, "q8");
  check_xpu_contig(q_scale, "q_scale");
  check_paged_k<HKV>(k_cache, k_scale);
  check_paged_v<HKV>(v_cache, v_scale, v_zero);
  check_xpu_contig(block_table, "block_table");
  check_xpu_contig(out, "out");
  TORCH_CHECK(q8.scalar_type() == at::kChar, "q8 int8");
  TORCH_CHECK(q_scale.scalar_type() == at::kFloat, "q_scale float32");
  TORCH_CHECK(block_table.scalar_type() == at::kInt, "block_table int32");
  TORCH_CHECK(out.scalar_type() == at::kFloat || out.scalar_type() == at::kHalf,
              "out float32 or float16");
  TORCH_CHECK(q8.numel() == static_cast<int64_t>(HKV) * BM * BK, "q8 unique [HKV,64,256]");
  TORCH_CHECK(k_cache.size(0) == v_cache.size(0), "k/v num_blocks");
  TORCH_CHECK(seq_lens.scalar_type() == at::kInt && seq_lens.numel() >= 1, "seq_lens int32");
  TORCH_CHECK(seq_lens.is_xpu() && seq_lens.is_contiguous(), "seq_lens XPU contig (graph input)");
  const int ratio = pages_per_block < 1 ? 1 : pages_per_block;
  const int n_table = static_cast<int>(block_table.dim() == 1 ? block_table.size(0)
                                                             : block_table.size(-1));
  const int n_splits = n_table * ratio;
  TORCH_CHECK(n_table > 0, "block_table n_splits");
  TORCH_CHECK(block_table.numel() >= n_table, "block_table shorter than n_splits");
  if (std::getenv("XE2_KV_ABI_LOG")) {
    static int nlog = 0;
    if (nlog < 32) {
      const int sl = seq_lens.to(at::kCPU).item<int>();
      const auto sl_u16 = static_cast<std::uint16_t>(static_cast<unsigned>(sl));
      const auto sl_i16 = static_cast<std::int16_t>(sl);
      std::fprintf(stderr,
                   "[xe2_kv_abi] seq_lens=%d n_splits=%d as_uint16=%u as_int16=%d wrap16=%d\n",
                   sl, n_splits, static_cast<unsigned>(sl_u16), static_cast<int>(sl_i16),
                   sl != static_cast<int>(sl_u16) ? 1 : 0);
      std::fflush(stderr);
      nlog++;
    }
  }
  TORCH_CHECK(out.dim() == 3 && out.size(1) == HQ && out.size(2) == BV,
              "out [Tq,HQ,256]");
  const int tq = static_cast<int>(out.size(0));
  TORCH_CHECK(tq > 0 && tq * GQA <= BM, "Tq*GQA must fit BM=64 pad");
  const std::int32_t *visible_ptr = nullptr;
  if (visible_lens.defined()) {
    check_xpu_contig(visible_lens, "visible_lens");
    TORCH_CHECK(visible_lens.scalar_type() == at::kInt && visible_lens.numel() >= tq + 1,
                "visible_lens int32 [1+Tq]");
    TORCH_CHECK(visible_lens.is_xpu(), "visible_lens XPU");
    visible_ptr = visible_lens.data_ptr<int32_t>();
  }
  auto opts = q8.options().dtype(at::kFloat);
  const int nprog = n_splits * HKV;
  // Persistent workspace: at::empty every decode waits inside XPU command graphs.
  struct Ws {
    at::Tensor partials, m, l, merged;
    int n_splits = -1;
    c10::DeviceIndex dev = -1;
  };
  at::Tensor partials, m, l, merged;
  const bool caller_ws = partials_ws.defined() || m_ws.defined() || l_ws.defined() || merged_ws.defined();
  if (caller_ws) {
    TORCH_CHECK(partials_ws.defined() && m_ws.defined() && l_ws.defined() && merged_ws.defined(),
                "varlen workspace tensors must be supplied together");
    check_xpu_contig(partials_ws, "partials_ws");
    check_xpu_contig(m_ws, "m_ws");
    check_xpu_contig(l_ws, "l_ws");
    check_xpu_contig(merged_ws, "merged_ws");
    TORCH_CHECK(partials_ws.scalar_type() == at::kFloat && m_ws.scalar_type() == at::kFloat &&
                    l_ws.scalar_type() == at::kFloat && merged_ws.scalar_type() == at::kFloat,
                "varlen workspace float32");
    TORCH_CHECK(partials_ws.dim() == 3 && partials_ws.size(0) == nprog &&
                    partials_ws.size(1) == BM && partials_ws.size(2) == BV &&
                    m_ws.dim() == 2 && m_ws.size(0) == nprog && m_ws.size(1) == BM &&
                    l_ws.dim() == 2 && l_ws.size(0) == nprog && l_ws.size(1) == BM &&
                    merged_ws.dim() == 3 && merged_ws.size(0) == HKV && merged_ws.size(1) == BM &&
                    merged_ws.size(2) == BV,
                "varlen workspace shape");
    TORCH_CHECK(partials_ws.device() == q8.device() && m_ws.device() == q8.device() &&
                    l_ws.device() == q8.device() && merged_ws.device() == q8.device(),
                "varlen workspace device");
    partials = partials_ws;
    m = m_ws;
    l = l_ws;
    merged = merged_ws;
  } else {
    // Legacy ABI retains its compatibility cache. Native varlen always uses
    // caller-owned tensors so graph capture has stable storage and lifetime.
    struct LegacyWs {
      at::Tensor partials, m, l, merged;
      int n_splits = -1;
      c10::DeviceIndex dev = -1;
    };
    // Function-template statics are per specialization, so the 2- and 4-head
    // instantiations each own this cache; sizes depend on HKV by construction.
    static LegacyWs ws;
    if (ws.n_splits != n_splits || ws.dev != q8.device().index() || !ws.partials.defined() ||
        ws.partials.device() != q8.device()) {
      ws.partials = at::empty({nprog, BM, BV}, opts);
      ws.m = at::empty({nprog, BM}, opts);
      ws.l = at::empty({nprog, BM}, opts);
      ws.merged = at::empty({HKV, BM, BV}, opts);
      ws.n_splits = n_splits;
      ws.dev = q8.device().index();
    }
    partials = ws.partials;
    m = ws.m;
    l = ws.l;
    merged = ws.merged;
  }
  auto bt = block_table.view({-1});
  TORCH_CHECK(bt.is_contiguous(), "block_table view contig");
  const float *m_ptr = m.data_ptr<float>();
  const float *l_ptr = l.data_ptr<float>();
  const float *part_ptr = partials.data_ptr<float>();
  const std::int32_t *s2_seq = visible_ptr ? visible_ptr : seq_lens.data_ptr<int32_t>();
  const bool half_out = out.scalar_type() == at::kHalf;
  const bool pf16 = half_out && s2_parallel_enabled() && env_is_1("XE2_KV_PARTIAL_FP16");
  int vpp = 1;
  if (const char *e = std::getenv("XE2_KV_VERIFY_PAGES")) vpp = std::atoi(e);
  if (!(vpp == 2 || vpp == 4 || vpp == 8)) vpp = 1;
  /* impl 5 supports G=2,4 */
  if (!(pf16 && tq == 7 && env_is_1("XE2_KV_COMPACT_SLM"))) vpp = 1;
  int reuse_var = 0;
  if (const char *e = std::getenv("XE2_KV_REUSE_VAR")) reuse_var = std::atoi(e);
  const bool q8p = pf16 && tq == 7 && env_is_1("XE2_KV_COMPACT_SLM") && (std::getenv("XE2_KV_PARTIAL_I8") && std::atoi(std::getenv("XE2_KV_PARTIAL_I8")) > 0);
  int fuse = 0;
  int xf = 0;
  if (const char *e = std::getenv("XE2_KV_XF")) xf = std::atoi(e);
  if (const char *e = std::getenv("XE2_KV_S2_FUSE")) fuse = std::atoi(e);
  if (!(fuse == 4 || fuse == 8 || fuse == 16)) fuse = 0;
  const int q8mode = q8p ? std::atoi(std::getenv("XE2_KV_PARTIAL_I8")) : 0;
  if (q8p) { vpp = 1; if (reuse_var == 0) reuse_var = 3; }
  if (fuse && (q8p || !pf16 || tq != 7 || !env_is_1("XE2_KV_COMPACT_SLM"))) fuse = 0;
  if (fuse) { vpp = 1; if (reuse_var == 0) reuse_var = 3; }
  const int fuse_ng = fuse ? (n_splits + fuse - 1) / fuse : 0;
  if (fuse) {
    // Group counters self-reset after each merge; zero once per workspace buffer.
    static std::unordered_set<const void *> zeroed;
    const size_t np = static_cast<size_t>(n_splits) * HKV, ngt = static_cast<size_t>(HKV) * fuse_ng;
    TORCH_CHECK(partials.numel() * 4 >= static_cast<int64_t>(np * BM * BV * 2 + ngt * BM * BV * 2 + ngt * BM * 8 + ngt * 4), "fuse ws");
    // Default: zero the counters every call (async, ordered before S1 on the in-order queue),
    // so a recycled/poisoned workspace is always safe. ZERO_ONCE=1 skips it after first use.
    const bool once = env_is_1("XE2_KV_FUSE_ZERO_ONCE");
    if (!once || !zeroed.count(part_ptr)) {
      auto *cnt = reinterpret_cast<std::uint8_t *>(const_cast<float *>(part_ptr)) + np * BM * BV * 2 + ngt * BM * BV * 2 + ngt * BM * 8;
      current_xpu_queue().memset(cnt, 0, ngt * 4);
      zeroed.insert(part_ptr);
    }
  }
  int mp_impl = 2;
  if (const char *e = std::getenv("XE2_KV_VERIFY_MP_IMPL")) { const int v = std::atoi(e); mp_impl = (v == 3 || v == 4 || v == 5) ? v : 2; }
  if (mp_impl == 2 && vpp > 1 && 3 * ((n_splits + vpp - 1) / vpp) > 2 * n_splits) vpp = 1;
  if (mp_impl == 5 && vpp == 8) vpp = 4;
  const bool pp2 = pf16 && tq == 7 && env_is_1("XE2_KV_COMPACT_SLM") && (std::getenv("XE2_KV_PP2") && std::atoi(std::getenv("XE2_KV_PP2")) > 0);
  const int pp2mode = pp2 ? std::atoi(std::getenv("XE2_KV_PP2")) : 0;
  if (pp2) vpp = 2;
  const int s2_splits = (n_splits + vpp - 1) / vpp;
  auto launch_s1 = [&]() {
    if (pp2) {
      (pp2mode == 2 ? launch_s1_pp2_wg6<HKV, true> : launch_s1_pp2_wg6<HKV, false>)(current_xpu_queue(), q8.data_ptr<int8_t>(), q_scale.data_ptr<float>(),
                             k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(), v_cache.data_ptr<uint8_t>(),
                             v_scale.data_ptr<float>(), v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
                             seq_lens.data_ptr<int32_t>(), reinterpret_cast<sycl::half *>(partials.data_ptr<float>()),
                             m.data_ptr<float>(), l.data_ptr<float>(), n_splits, tq,
                             static_cast<size_t>(k_cache.stride(0)), static_cast<size_t>(v_cache.stride(0)),
                             static_cast<size_t>(k_scale.stride(0)), visible_ptr, ratio);
      return;
    }
    auto run = [&](auto pf) {
    if constexpr (decltype(pf)::value) {
      if (vpp > 1) {
        auto go = [&](auto pc) {
          launch_int8k_int4v_s1_paged_reuse_mp<HKV, true, 64, decltype(pc)::value>(current_xpu_queue(), q8.data_ptr<int8_t>(),
                                q_scale.data_ptr<float>(),
                                k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(),
                                v_cache.data_ptr<uint8_t>(), v_scale.data_ptr<float>(),
                                v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
                                seq_lens.data_ptr<int32_t>(), partials.data_ptr<float>(),
                                m.data_ptr<float>(), l.data_ptr<float>(), n_splits, tq,
                                static_cast<size_t>(k_cache.stride(0)),
                                static_cast<size_t>(v_cache.stride(0)),
                                static_cast<size_t>(k_scale.stride(0)),
                                visible_ptr, ratio);
        };
        if (mp_impl == 5) {
          auto go5 = [&](auto pc, auto md) {
            launch_int8k_int4v_s1_paged_reuse_team<HKV, decltype(pc)::value, decltype(md)::value>(current_xpu_queue(), q8.data_ptr<int8_t>(),
                                q_scale.data_ptr<float>(),
                                k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(),
                                v_cache.data_ptr<uint8_t>(), v_scale.data_ptr<float>(),
                                v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
                                seq_lens.data_ptr<int32_t>(), partials.data_ptr<float>(),
                                m.data_ptr<float>(), l.data_ptr<float>(), n_splits, tq,
                                static_cast<size_t>(k_cache.stride(0)),
                                static_cast<size_t>(v_cache.stride(0)),
                                static_cast<size_t>(k_scale.stride(0)),
                                visible_ptr, ratio);
          };
          int tm = 0; if (const char *e = std::getenv("XE2_KV_TEAM_MODE")) tm = std::atoi(e);
          using I2 = std::integral_constant<int, 2>; using I4 = std::integral_constant<int, 4>;
          using M0 = std::integral_constant<int, 0>; using M1 = std::integral_constant<int, 1>; using M2 = std::integral_constant<int, 2>; using M3 = std::integral_constant<int, 3>;
          if (vpp == 2) { if (tm == 1) go5(I2{}, M1{}); else if (tm == 2) go5(I2{}, M2{}); else if (tm == 3) go5(I2{}, M3{}); else go5(I2{}, M0{}); }
          else          { if (tm == 1) go5(I4{}, M1{}); else if (tm == 2) go5(I4{}, M2{}); else if (tm == 3) go5(I4{}, M3{}); else go5(I4{}, M0{}); }
          return;
        }
        if (mp_impl == 4) {
          auto go4 = [&](auto pc) {
            launch_int8k_int4v_s1_paged_reuse_mp4<HKV, decltype(pc)::value>(current_xpu_queue(), q8.data_ptr<int8_t>(),
                                q_scale.data_ptr<float>(),
                                k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(),
                                v_cache.data_ptr<uint8_t>(), v_scale.data_ptr<float>(),
                                v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
                                seq_lens.data_ptr<int32_t>(), partials.data_ptr<float>(),
                                m.data_ptr<float>(), l.data_ptr<float>(), n_splits, tq,
                                static_cast<size_t>(k_cache.stride(0)),
                                static_cast<size_t>(v_cache.stride(0)),
                                static_cast<size_t>(k_scale.stride(0)),
                                visible_ptr, ratio);
          };
          if (vpp == 2) go4(std::integral_constant<int, 2>{});
          else if (vpp == 4) go4(std::integral_constant<int, 4>{});
          else go4(std::integral_constant<int, 8>{});
          return;
        }
        if (mp_impl == 3) {
          auto go3 = [&](auto pc) {
            launch_int8k_int4v_s1_paged_reuse_mp3<HKV, decltype(pc)::value>(current_xpu_queue(), q8.data_ptr<int8_t>(),
                                q_scale.data_ptr<float>(),
                                k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(),
                                v_cache.data_ptr<uint8_t>(), v_scale.data_ptr<float>(),
                                v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
                                seq_lens.data_ptr<int32_t>(), partials.data_ptr<float>(),
                                m.data_ptr<float>(), l.data_ptr<float>(), n_splits, tq,
                                static_cast<size_t>(k_cache.stride(0)),
                                static_cast<size_t>(v_cache.stride(0)),
                                static_cast<size_t>(k_scale.stride(0)),
                                visible_ptr, ratio);
          };
          if (vpp == 2) go3(std::integral_constant<int, 2>{});
          else if (vpp == 4) go3(std::integral_constant<int, 4>{});
          else go3(std::integral_constant<int, 8>{});
          return;
        }
        if (vpp == 2) go(std::integral_constant<int, 2>{});
        else if (vpp == 4) go(std::integral_constant<int, 4>{});
        else go(std::integral_constant<int, 8>{});
        return;
      }
    }
    if (tq == 7 && env_is_1("XE2_KV_COMPACT_SLM") && reuse_var != 0) {
      auto gov = [&](auto cols, auto vw) {
        auto gq0 = [&](auto qq, auto fz, auto xv) {
        launch_int8k_int4v_s1_paged_reuse_vw<HKV, decltype(pf)::value, decltype(cols)::value, decltype(vw)::value, (decltype(pf)::value ? decltype(qq)::value : 0), decltype(fz)::value, (decltype(qq)::value == 0 ? decltype(xv)::value : 0)>(current_xpu_queue(), q8.data_ptr<int8_t>(),
                                q_scale.data_ptr<float>(),
                                k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(),
                                v_cache.data_ptr<uint8_t>(), v_scale.data_ptr<float>(),
                                v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
                                seq_lens.data_ptr<int32_t>(), partials.data_ptr<float>(),
                                m.data_ptr<float>(), l.data_ptr<float>(), n_splits, tq,
                                static_cast<size_t>(k_cache.stride(0)),
                                static_cast<size_t>(v_cache.stride(0)),
                                static_cast<size_t>(k_scale.stride(0)),
                                visible_ptr, ratio);
        };
        auto gq = [&](auto qq, auto fz) {
          if (xf == 0) gq0(qq, fz, std::integral_constant<int, 0>{});
          else if (xf == 1) gq0(qq, fz, std::integral_constant<int, 1>{});
          else if (xf == 8) gq0(qq, fz, std::integral_constant<int, 8>{});
          else if (xf == 40) gq0(qq, fz, std::integral_constant<int, 40>{});
          else if (xf == 72) gq0(qq, fz, std::integral_constant<int, 72>{});
          else if (xf == 104) gq0(qq, fz, std::integral_constant<int, 104>{});
          else gq0(qq, fz, std::integral_constant<int, 0>{});
        };
        using F0 = std::integral_constant<int, 0>; using Z0 = std::integral_constant<int, 0>;
        if (fuse == 4) gq(Z0{}, std::integral_constant<int, 4>{}); else if (fuse == 8) gq(Z0{}, std::integral_constant<int, 8>{}); else if (fuse == 16) gq(Z0{}, std::integral_constant<int, 16>{});
        else if (q8mode == 3) gq(std::integral_constant<int, 3>{}, F0{}); else if (q8mode == 2) gq(std::integral_constant<int, 2>{}, F0{}); else if (q8p) gq(std::integral_constant<int, 1>{}, F0{}); else gq(Z0{}, F0{});
      };
      using C64 = std::integral_constant<int, 64>; using C32 = std::integral_constant<int, 32>;
      using W8 = std::integral_constant<int, 8>; using W16 = std::integral_constant<int, 16>;
      if (reuse_var == 1) gov(C64{}, W16{});
      else if (reuse_var == 2) gov(C32{}, W8{});
      else gov(C64{}, W8{});   // 3: cloned baseline (codegen control)
    } else if (tq == 7 && env_is_1("XE2_KV_COMPACT_SLM")) {
    launch_int8k_int4v_s1_paged_reuse<HKV, decltype(pf)::value, 64>(current_xpu_queue(), q8.data_ptr<int8_t>(),
                                q_scale.data_ptr<float>(),
                                k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(),
                                v_cache.data_ptr<uint8_t>(), v_scale.data_ptr<float>(),
                                v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
                                seq_lens.data_ptr<int32_t>(), partials.data_ptr<float>(),
                                m.data_ptr<float>(), l.data_ptr<float>(), n_splits, tq,
                                static_cast<size_t>(k_cache.stride(0)),
                                static_cast<size_t>(v_cache.stride(0)),
                                static_cast<size_t>(k_scale.stride(0)),
                                visible_ptr, ratio);
    } else {
    launch_int8k_int4v_s1_paged<HKV, decltype(pf)::value>(current_xpu_queue(), q8.data_ptr<int8_t>(),
                                q_scale.data_ptr<float>(),
                                k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(),
                                v_cache.data_ptr<uint8_t>(), v_scale.data_ptr<float>(),
                                v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
                                seq_lens.data_ptr<int32_t>(), partials.data_ptr<float>(),
                                m.data_ptr<float>(), l.data_ptr<float>(), n_splits, tq,
                                static_cast<size_t>(k_cache.stride(0)),
                                static_cast<size_t>(v_cache.stride(0)),
                                static_cast<size_t>(k_scale.stride(0)),
                                visible_ptr, ratio);
    }
    };
    if (pf16) run(std::true_type{}); else run(std::false_type{});
  };
  auto launch_s2 = [&]() {
    const bool parallel = s2_parallel_enabled();
    const int nsg = s2_parallel_subgroups(tq);
    if (half_out) {
      auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr<at::Half>());
      if (fuse) {
        const size_t np = static_cast<size_t>(n_splits) * HKV, ngt = static_cast<size_t>(HKV) * fuse_ng;
        const sycl::half *Pg = reinterpret_cast<const sycl::half *>(part_ptr) + np * BM * BV;
        const float *Mg = reinterpret_cast<const float *>(Pg + ngt * BM * BV);
        const float *Lg = Mg + ngt * BM;
        launch_s2_parallel_half_p16<HKV>(current_xpu_queue(), Mg, Lg, Pg, dst, s2_seq, fuse_ng, tq, nsg, fuse);
      } else if (q8p) {
        const int cols = (reuse_var == 2) ? 32 : 64;
        const auto *qa = reinterpret_cast<const std::int8_t *>(part_ptr);
        if (nsg == 8) (q8mode == 3 ? launch_s2_parallel_q8<HKV, 8, true> : launch_s2_parallel_q8<HKV, 8, false>)(current_xpu_queue(), m_ptr, l_ptr, qa, dst, s2_seq, n_splits, tq, cols);
        else if (nsg == 16) (q8mode == 3 ? launch_s2_parallel_q8<HKV, 16, true> : launch_s2_parallel_q8<HKV, 16, false>)(current_xpu_queue(), m_ptr, l_ptr, qa, dst, s2_seq, n_splits, tq, cols);
        else (q8mode == 3 ? launch_s2_parallel_q8<HKV, 32, true> : launch_s2_parallel_q8<HKV, 32, false>)(current_xpu_queue(), m_ptr, l_ptr, qa, dst, s2_seq, n_splits, tq, cols);
      } else if (parallel && pf16)
        launch_s2_parallel_half_p16<HKV>(current_xpu_queue(), m_ptr, l_ptr,
                                         reinterpret_cast<const sycl::half *>(part_ptr), dst, s2_seq,
                                         s2_splits, tq, nsg, vpp);
      else if (parallel)
        launch_s2_parallel_half<HKV>(current_xpu_queue(), m_ptr, l_ptr, part_ptr, dst, s2_seq,
                                     n_splits, tq, nsg);
      else
        launch_s2_merge_to_out_half<HKV>(current_xpu_queue(), m_ptr, l_ptr, part_ptr, dst, s2_seq,
                                    n_splits, tq);
    } else if (parallel) {
      launch_s2_parallel_float<HKV>(current_xpu_queue(), m_ptr, l_ptr, part_ptr,
                                out.data_ptr<float>(), s2_seq, n_splits, tq, nsg);
    } else {
      launch_s2_merge_to_out<HKV>(current_xpu_queue(), m_ptr, l_ptr, part_ptr,
                             out.data_ptr<float>(), s2_seq, n_splits, tq);
    }
  };
  // Host waits are bench-only. Graph replay must not take this branch.
  if (env_is_1("XE2_KV_TIME_SPLITS")) {
    auto &q = current_xpu_queue();
    q.wait();
    const auto t0 = std::chrono::steady_clock::now();
    launch_s1();
    q.wait();
    const auto t1 = std::chrono::steady_clock::now();
    launch_s2();
    q.wait();
    const auto t2 = std::chrono::steady_clock::now();
    const double s1_us = std::chrono::duration<double, std::micro>(t1 - t0).count();
    const double s2_us = std::chrono::duration<double, std::micro>(t2 - t1).count();
    const int seq0 = seq_lens.numel() > 0 ? seq_lens.reshape({-1})[0].item<int>() : -1;
    std::fprintf(stderr,
                 "[xe2_kv_time] s1_us=%.1f s2_us=%.1f n_splits=%d seq0=%d tq=%d parallel=%d nsg=%d vpp=%d impl=%d\n",
                 s1_us, s2_us, n_splits, seq0, tq, s2_parallel_enabled() ? 1 : 0,
                 s2_parallel_subgroups(tq), vpp, mp_impl);
    std::fflush(stderr);
  } else {
    launch_s1();
    launch_s2();
  }
}

static void int8k_int4v_s1_paged(const at::Tensor &q8, const at::Tensor &q_scale,
                                 const at::Tensor &k_cache, const at::Tensor &k_scale,
                                 const at::Tensor &v_cache, const at::Tensor &v_scale,
                                 const at::Tensor &v_zero, const at::Tensor &block_table,
                                 const at::Tensor &seq_lens, at::Tensor out) {
  TORCH_CHECK(k_cache.dim() == 4, "k_cache [num_blocks,64,HKV,256] NHD");
  dispatch_hkv(k_cache.size(2), [&](auto hkv) {
    int8k_int4v_s1_paged_impl<decltype(hkv)::value>(
        q8, q_scale, k_cache, k_scale, v_cache, v_scale, v_zero, block_table, seq_lens, out,
        at::Tensor(), at::Tensor(), at::Tensor(), at::Tensor(), at::Tensor());
  });
}

static void int8k_int4v_s1_varlen_paged(const at::Tensor &q8, const at::Tensor &q_scale,
                                         const at::Tensor &k_cache, const at::Tensor &k_scale,
                                         const at::Tensor &v_cache, const at::Tensor &v_scale,
                                         const at::Tensor &v_zero, const at::Tensor &block_table,
                                         const at::Tensor &seq_lens,
                                         const at::Tensor &visible_lens,
                                         const at::Tensor &partials_ws, const at::Tensor &m_ws,
                                         const at::Tensor &l_ws, const at::Tensor &merged_ws,
                                         at::Tensor out, int64_t pages_per_block = 1) {
  TORCH_CHECK(k_cache.dim() == 4, "k_cache [num_blocks,64,HKV,256] NHD");
  dispatch_hkv(k_cache.size(2), [&](auto hkv) {
    int8k_int4v_s1_paged_impl<decltype(hkv)::value>(
        q8, q_scale, k_cache, k_scale, v_cache, v_scale, v_zero, block_table, seq_lens, out,
        visible_lens, partials_ws, m_ws, l_ws, merged_ws, static_cast<int>(pages_per_block));
  });
}


template <int HKV>
static void int8k_int4v_s1_varlen_from_q_impl(
    const at::Tensor &q_fp16, at::Tensor q8, at::Tensor q_scale, const at::Tensor &k_cache,
    const at::Tensor &k_scale, const at::Tensor &v_cache, const at::Tensor &v_scale,
    const at::Tensor &v_zero, const at::Tensor &block_table, const at::Tensor &seq_lens,
    const at::Tensor &visible_lens, const at::Tensor &partials_ws, const at::Tensor &m_ws,
    const at::Tensor &l_ws, const at::Tensor &merged_ws, at::Tensor out, int64_t pages_per_block = 1) {
  // Native direct entry: pack+quant (token Q) or quant (padded Q), then varlen S1+S2.
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  check_xpu_contig(q_fp16, "q_fp16");
  check_xpu_contig(q8, "q8");
  check_xpu_contig(q_scale, "q_scale");
  TORCH_CHECK(q_fp16.scalar_type() == at::kHalf, "q_fp16 must be float16");
  TORCH_CHECK(q8.scalar_type() == at::kChar, "q8 must be int8");
  TORCH_CHECK(q_scale.scalar_type() == at::kFloat, "q_scale must be float32");
  TORCH_CHECK(q8.numel() == static_cast<int64_t>(HKV) * BM * BK, "q8 numel [HKV,64,256]");
  TORCH_CHECK(q_scale.numel() == static_cast<int64_t>(HKV) * BM, "q_scale numel [HKV,64]");
  auto &queue = current_xpu_queue();
  if (q_fp16.dim() == 3 && q_fp16.size(1) == HQ && q_fp16.size(2) == BK) {
    // Token layout [T,HQ,D] — pack+quant in one submit (no Python pack_q).
    const int tq = static_cast<int>(q_fp16.size(0));
    TORCH_CHECK(tq > 0 && tq * GQA <= BM, "tq*GQA exceeds BM");
    launch_pack_q_quant<HKV>(queue, as_half_c(q_fp16), q8.data_ptr<int8_t>(),
                             q_scale.data_ptr<float>(), tq);
  } else {
    // Legacy padded layout [HKV,BM,D].
    TORCH_CHECK(q_fp16.numel() == static_cast<int64_t>(HKV) * BM * BK, "q_fp16 numel");
    launch_q_quant<HKV>(queue, as_half_c(q_fp16), q8.data_ptr<int8_t>(),
                        q_scale.data_ptr<float>());
  }
  int8k_int4v_s1_paged_impl<HKV>(q8, q_scale, k_cache, k_scale, v_cache, v_scale, v_zero,
                                 block_table, seq_lens, out, visible_lens, partials_ws, m_ws, l_ws,
                                 merged_ws, static_cast<int>(pages_per_block));
}

static void int8k_int4v_s1_varlen_from_q(const at::Tensor &q_fp16, at::Tensor q8,
                                         at::Tensor q_scale, const at::Tensor &k_cache,
                                         const at::Tensor &k_scale, const at::Tensor &v_cache,
                                         const at::Tensor &v_scale, const at::Tensor &v_zero,
                                         const at::Tensor &block_table, const at::Tensor &seq_lens,
                                         const at::Tensor &visible_lens,
                                         const at::Tensor &partials_ws, const at::Tensor &m_ws,
                                         const at::Tensor &l_ws, const at::Tensor &merged_ws,
                                         at::Tensor out, int64_t pages_per_block = 1) {
  TORCH_CHECK(k_cache.dim() == 4, "k_cache [num_blocks,64,HKV,256] NHD");
  dispatch_hkv(k_cache.size(2), [&](auto hkv) {
    int8k_int4v_s1_varlen_from_q_impl<decltype(hkv)::value>(
        q_fp16, q8, q_scale, k_cache, k_scale, v_cache, v_scale, v_zero, block_table, seq_lens,
        visible_lens, partials_ws, m_ws, l_ws, merged_ws, out, pages_per_block);
  });
}

// Decode one-shot: kv_store_paged + pack_q_quant + varlen S1/S2 on the same queue.
static void int8k_int4v_decode_step(const at::Tensor &q_fp16, const at::Tensor &k_fp16,
                                    const at::Tensor &v_fp16, const at::Tensor &slot_mapping,
                                    at::Tensor q8, at::Tensor q_scale, at::Tensor k_cache,
                                    at::Tensor k_scale, at::Tensor v_cache, at::Tensor v_scale,
                                    at::Tensor v_zero, const at::Tensor &block_table,
                                    const at::Tensor &seq_lens, const at::Tensor &visible_lens,
                                    const at::Tensor &partials_ws, const at::Tensor &m_ws,
                                    const at::Tensor &l_ws, const at::Tensor &merged_ws,
                                    at::Tensor out) {
  kv_store_paged(k_fp16, v_fp16, slot_mapping, k_cache, k_scale, v_cache, v_scale, v_zero);
  int8k_int4v_s1_varlen_from_q(q_fp16, q8, q_scale, k_cache, k_scale, v_cache, v_scale, v_zero,
                               block_table, seq_lens, visible_lens, partials_ws, m_ws, l_ws,
                               merged_ws, out);
}

// One graph-legal op for a uniform decode batch. Each request is one varlen
// launch on the same in-order queue, so the single q8 tile and the split
// workspace are reused without a Python loop and without a new matmul.
// q_len is a host constant (1 or 7 inside a FULL_DECODE_ONLY capture).
static void int8k_int4v_attn_batch(const at::Tensor &q_fp16, at::Tensor q8, at::Tensor q_scale,
                                   const at::Tensor &k_cache, const at::Tensor &k_scale,
                                   const at::Tensor &v_cache, const at::Tensor &v_scale,
                                   const at::Tensor &v_zero, const at::Tensor &block_table,
                                   const at::Tensor &seq_lens, const at::Tensor &visible_lens,
                                   const at::Tensor &partials_ws, const at::Tensor &m_ws,
                                   const at::Tensor &l_ws, const at::Tensor &merged_ws,
                                   at::Tensor out, int64_t q_len, int64_t pages_per_block) {
  constexpr int GQA = Heads<2>::gqa;
  TORCH_CHECK(pages_per_block >= 1, "pages_per_block");
  TORCH_CHECK(q_len > 0 && q_len * GQA <= BM, "q_len*GQA exceeds BM");
  TORCH_CHECK(q_fp16.dim() == 3 && q_fp16.size(2) == BK, "q_fp16 [T,HQ,D]");
  TORCH_CHECK(q_fp16.size(1) % GQA == 0, "q_fp16 heads must be a multiple of GQA=6");
  dispatch_hkv(q_fp16.size(1) / GQA, [&](auto hkv) {
    constexpr int HKV = decltype(hkv)::value;
    constexpr int HQ = Heads<HKV>::hq;
    TORCH_CHECK(q_fp16.size(1) == HQ, "q_fp16 [T,HQ,D]");
    TORCH_CHECK(out.sizes() == q_fp16.sizes(), "out shape");
    TORCH_CHECK(q_fp16.size(0) % q_len == 0, "T must be B*q_len");
    const int batch = static_cast<int>(q_fp16.size(0) / q_len);
    TORCH_CHECK(batch >= 1, "empty batch");
    TORCH_CHECK(block_table.dim() == 2 && block_table.size(0) == batch, "block_table [B, splits]");
    TORCH_CHECK(seq_lens.numel() >= batch, "seq_lens [B]");
    const bool has_vis = visible_lens.defined() && visible_lens.numel() > 0;
    if (has_vis) {
      TORCH_CHECK(visible_lens.dim() == 2 && visible_lens.size(0) == batch &&
                      visible_lens.size(1) >= q_len + 1,
                  "visible_lens [B, 1+q_len]");
    }
    auto seq_flat = seq_lens.reshape({-1});
    for (int i = 0; i < batch; ++i) {
      const int64_t begin = static_cast<int64_t>(i) * q_len;
      auto q_i = q_fp16.narrow(0, begin, q_len);
      auto out_i = out.narrow(0, begin, q_len);
      auto bt_i = block_table.select(0, i);
      auto sl_i = seq_flat.narrow(0, i, 1);
      at::Tensor vis_i;
      if (has_vis) vis_i = visible_lens.select(0, i);
      int8k_int4v_s1_varlen_from_q_impl<HKV>(q_i, q8, q_scale, k_cache, k_scale, v_cache, v_scale,
                                             v_zero, bt_i, sl_i, vis_i, partials_ws, m_ws, l_ws,
                                             merged_ws, out_i, pages_per_block);
    }
  });
}

}  // namespace

TORCH_LIBRARY(xe2_kv, m) {
  m.def("q_quant_once(Tensor q_fp16, Tensor(a!) q8, Tensor(b!) q_scale) -> ()");
  m.def("k_store(Tensor k_fp16, Tensor(a!) k8, Tensor(b!) k_scale) -> ()");
  m.def("v_store(Tensor v_fp16, Tensor(a!) v4, Tensor(b!) v_scale, Tensor(c!) v_zero) -> ()");
  m.def(
      "int8k_int4v_s1(Tensor q8, Tensor q_scale, Tensor k8, Tensor k_scale, Tensor v4, Tensor "
      "v_scale, Tensor v_zero, Tensor(a!) out) -> ()");
  m.def(
      "k_store_paged(Tensor k_fp16, Tensor slot_mapping, Tensor(a!) k_cache, Tensor(b!) k_scale) "
      "-> ()");
  m.def(
      "v_store_paged(Tensor v_fp16, Tensor slot_mapping, Tensor(a!) v_cache, Tensor(b!) v_scale, "
      "Tensor(c!) v_zero) -> ()");
  m.def(
      "kv_store_paged(Tensor k_fp16, Tensor v_fp16, Tensor slot_mapping, Tensor(a!) k_cache, "
      "Tensor(b!) k_scale, Tensor(c!) v_cache, Tensor(d!) v_scale, Tensor(e!) v_zero) -> ()");
  m.def(
      "int8k_int4v_s1_paged(Tensor q8, Tensor q_scale, Tensor k_cache, Tensor k_scale, Tensor "
      "v_cache, Tensor v_scale, Tensor v_zero, Tensor block_table, Tensor seq_lens, Tensor(a!) "
      "out) -> ()");
  m.def(
      "int8k_int4v_s1_varlen_paged(Tensor q8, Tensor q_scale, Tensor k_cache, Tensor k_scale, "
      "Tensor v_cache, Tensor v_scale, Tensor v_zero, Tensor block_table, Tensor seq_lens, "
      "Tensor visible_lens, Tensor(a!) partials_ws, Tensor(b!) m_ws, Tensor(c!) l_ws, "
      "Tensor(d!) merged_ws, Tensor(e!) out, int pages_per_block) -> ()");
  m.def(
      "int8k_int4v_s1_varlen_from_q(Tensor q_fp16, Tensor(a!) q8, Tensor(b!) q_scale, "
      "Tensor k_cache, Tensor k_scale, Tensor v_cache, Tensor v_scale, Tensor v_zero, "
      "Tensor block_table, Tensor seq_lens, Tensor visible_lens, Tensor(c!) partials_ws, "
      "Tensor(d!) m_ws, Tensor(e!) l_ws, Tensor(f!) merged_ws, Tensor(g!) out, "
      "int pages_per_block) -> ()");
  m.def(
      "int8k_int4v_decode_step(Tensor q_fp16, Tensor k_fp16, Tensor v_fp16, Tensor slot_mapping, "
      "Tensor(a!) q8, Tensor(b!) q_scale, Tensor(c!) k_cache, Tensor(d!) k_scale, "
      "Tensor(e!) v_cache, Tensor(f!) v_scale, Tensor(g!) v_zero, Tensor block_table, "
      "Tensor seq_lens, Tensor visible_lens, Tensor(h!) partials_ws, Tensor(i!) m_ws, "
      "Tensor(j!) l_ws, Tensor(k!) merged_ws, Tensor(l!) out) -> ()");
  m.def(
      "int8k_int4v_attn_batch(Tensor q_fp16, Tensor(a!) q8, Tensor(b!) q_scale, "
      "Tensor k_cache, Tensor k_scale, Tensor v_cache, Tensor v_scale, Tensor v_zero, "
      "Tensor block_table, Tensor seq_lens, Tensor visible_lens, Tensor(c!) partials_ws, "
      "Tensor(d!) m_ws, Tensor(e!) l_ws, Tensor(f!) merged_ws, Tensor(g!) out, "
      "int q_len, int pages_per_block) -> ()");
}

TORCH_LIBRARY_IMPL(xe2_kv, XPU, m) {
  m.impl("q_quant_once", &q_quant_once);
  m.impl("k_store", &k_store);
  m.impl("v_store", &v_store);
  m.impl("int8k_int4v_s1", &int8k_int4v_s1);
  m.impl("k_store_paged", &k_store_paged);
  m.impl("v_store_paged", &v_store_paged);
  m.impl("kv_store_paged", &kv_store_paged);
  m.impl("int8k_int4v_s1_paged", &int8k_int4v_s1_paged);
  m.impl("int8k_int4v_s1_varlen_paged", &int8k_int4v_s1_varlen_paged);
  m.impl("int8k_int4v_s1_varlen_from_q", &int8k_int4v_s1_varlen_from_q);
  m.impl("int8k_int4v_decode_step", &int8k_int4v_decode_step);
  m.impl("int8k_int4v_attn_batch", &int8k_int4v_attn_batch);
}
