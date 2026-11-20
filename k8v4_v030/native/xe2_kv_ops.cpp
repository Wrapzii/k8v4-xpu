// GPU1 unique Gate A/B torch ABI: Q-once INT8-K/V4 as torch.ops.xe2_kv.*
// Unique: candidate_a/sycl_stage1/torch_ext/xe2_kv_ops.cpp
//   Gate A: Xe2KvTorchAbiQquantKernel / KstoreKernel / VstoreKernel / S1Kernel
//   Gate B: KstorePaged / VstorePaged / S1Paged / S2Merge / Unpack (vLLM NHD pages)
//   Gate C storage: xe2_kv_cache_layout.hpp / xe2_kv_cache_dtype.py (int8_k_int4_v)
// Does NOT overwrite combined_stage1_int8k_int4v_qonce.cpp / qonce_gate.cpp.
// extra_slm=0 HARD. 24 KiB SLM. 1-tile. Native int8 DPAS.

#include <sycl/sycl.hpp>
#include <sycl/ext/intel/experimental/grf_size_properties.hpp>

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

// decode_v_int4_vec_strided into a blocked tile (FAST multi-page S1): element (tok, c) of the 128
// columns starting at nbase lands in 16x16 block (tok / 16) * 8 + c / 16, row tok % 16, column c % 16,
// so each PV operand load reads one contiguous 512-byte block. Same arithmetic.
static inline void decode_v_int4_blk(int lid, const std::uint8_t *v4_head, int v_tok_stride,
                                     const float *vs_head, const float *vz_head, int sc_stride,
                                     int nbase, int n_valid, sycl::half *tile) {
  const int tok = lid >> 1;
  const int part = lid & 1;
  sycl::half *row = tile + ((tok >> 4) * 8 + part * 4) * 256 + (tok & 15) * 16;
  if (tok >= n_valid) {
#pragma unroll
    for (int e = 0; e < 64; ++e) row[(e >> 4) * 256 + (e & 15)] = sycl::half(0.f);
    return;
  }
  const float scale = vs_head[tok * sc_stride];
  const float zero = vz_head[tok * sc_stride];
  const std::uint8_t *src = v4_head + static_cast<size_t>(tok) * v_tok_stride + (nbase >> 1) + part * 32;
#pragma unroll
  for (int e = 0; e < 32; e += 8) {
    std::uint64_t raw;
    std::memcpy(&raw, src + e, sizeof(raw));
#pragma unroll
    for (int j = 0; j < 8; ++j) {
      const std::uint8_t b = static_cast<std::uint8_t>(raw >> (8 * j));
      const int c = 2 * (e + j);
      row[(c >> 4) * 256 + (c & 15)] = sycl::half((static_cast<float>(b & 0xFu) - zero) * scale);
      row[((c + 1) >> 4) * 256 + ((c + 1) & 15)] =
          sycl::half((static_cast<float>(b >> 4) - zero) * scale);
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

template <int HKV> class Xe2KvTorchAbiPackQquantBatchKernel;
// launch_pack_q_quant for nreq requests of q_len tokens each in one launch: request r's tokens
// [r * q_len, (r + 1) * q_len) go to Q tile r (Q8 + r * HKV * BM * BK, Qsc + r * HKV * BM).
template <int HKV>
static void launch_pack_q_quant_batch(sycl::queue &q, const sycl::half *Qtok, std::int8_t *Q8,
                                      float *Qsc, int q_len, int nreq) {
  constexpr int HQ = Heads<HKV>::hq;
  constexpr int GQA = Heads<HKV>::gqa;
  sycl::range<1> g(static_cast<size_t>(nreq) * HKV * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Xe2KvTorchAbiPackQquantBatchKernel<HKV>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int grp = static_cast<int>(item.get_group(0));
          const int req = grp / HKV;
          const int kv_head = grp - req * HKV;
          auto sg = item.get_sub_group();
          const int lane = static_cast<int>(sg.get_local_id());
          const int row = lid >> 1;
          const int part = lid & 1;
          const size_t q8_off = (static_cast<size_t>(req) * HKV + kv_head) * BM * BK;
          const size_t sc_off = (static_cast<size_t>(req) * HKV + kv_head) * BM;
          const int live = q_len * GQA;
          if (row >= live) {
            if (part == 0) Qsc[sc_off + row] = 0.f;
            std::int8_t *dst = Q8 + q8_off + static_cast<size_t>(row) * BK + part * 128;
#pragma unroll
            for (int c = 0; c < 128; ++c) dst[c] = 0;
            return;
          }
          const int tok = req * q_len + row / GQA;
          const int gqa = row - (row / GQA) * GQA;
          const int hq = kv_head * GQA + gqa;
          const sycl::half *qrow = Qtok + (static_cast<size_t>(tok) * HQ + hq) * BK + part * 128;
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

// Multi-page S1 (opt-in). One work-group walks consecutive 64-token pages of one KV head with an
// online softmax and keeps the PV accumulators in registers, so the partial round trip to S2
// shrinks by the page count. Two modes, both only for q_len * GQA <= 48 with the parallel S2:
//   XE2_KV_S1_PAGES=N   N pages per program, grid ceil(n_splits / N) per head.
//   XE2_KV_S1_SPLITS=S  S programs per head, ceil(live pages / S) pages each (chosen on device, so
//                       the graph-static grid has no padded programs). S=32 fills one wave of a
//                       32-Xe-core B70 at 4 work-groups per core for 4 KV heads.
// Large GRF (256) by default; XE2_KV_S1_GRF=128 selects the compiler default, which spills.
// SLM holds one page at a time exactly like the single-page kernel (S/V alias, P), plus two
// 64-float row vectors (alpha, 1/l).
//   QK:      (row tile, 16-token tile) jobs spread over all 8 sub-groups.
//   softmax: row r on sub-group r % 8, which keeps that row's running m, l in registers and
//            writes P = exp(s - m_new) (unnormalized, <= 1) and alpha = exp(m_old - m_new).
//   PV:      sub-group g owns columns [16g, 16g+16) of each 128-column V half for every live
//            row tile; the accumulator is rescaled by alpha per row before each page's mad.
// The end writes acc / l, M = m, L = l, so the S2 merge math is unchanged (split = N pages).
// TMAX bounds the live 8-row tiles (q_len * GQA <= 8 * TMAX); GRF selects the register file.
template <int HKV, bool PF16, int TMAX, int GRF, bool FAST> class Xe2KvTorchAbiS1MultiKernel;

static int s1_pages_per_program() {
  const char *v = std::getenv("XE2_KV_S1_PAGES");
  if (v == nullptr) return 1;
  const int n = std::atoi(v);
  return n < 1 ? 1 : (n > 256 ? 256 : n);
}

static constexpr int kMultiMaxRows = 48;

// XE2_KV_S1_FAST=1 (multi-page S1 only): lazy-rescale online softmax in the log2 domain, no masks on
// fully visible pages, padding rows skipped, one K load per k step for all row tiles of a sub-group,
// and P / V tiles stored as contiguous blocks for the PV operand loads.
// Not bit-exact with the default multi-page kernel (fp16-level differences). Unset or 0: off.
static bool s1_fast_enabled() {
  const char *v = std::getenv("XE2_KV_S1_FAST");
  if (v == nullptr || (v[0] == '0' && v[1] == '\0')) return false;
  TORCH_CHECK(v[0] == '1' && v[1] == '\0', "XE2_KV_S1_FAST must be 0 or 1, got '", v, "'");
  return true;
}

// Pages per S1 program, computed on device from the live length so S1 and S2 agree inside a
// graph-static launch: fixed npg, or with splits > 0 the live pages divided evenly over that many
// programs per KV head (no padded grid, every program gets ceil(live / splits) pages).
static inline int s1_pages_for(std::int64_t seq_len, int npg, int splits) {
  if (splits <= 0) return npg < 1 ? 1 : npg;
  const std::int64_t live = (seq_len + BM - 1) / BM;
  return static_cast<int>(sycl::max(static_cast<std::int64_t>(1), (live + splits - 1) / splits));
}

template <int HKV, bool PF16, int TMAX, int GRF, bool FAST>
static void launch_int8k_int4v_s1_multi(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                        const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                        const float *VS, const float *VZ, const std::int32_t *bt,
                                        const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                        int n_groups, int npg, int q_len, size_t k_page_stride,
                                        size_t v_page_stride, size_t sc_page_stride,
                                        const std::int32_t *visible_lens, int pages_per_block,
                                        int splits, int nreq = 1, int bt_stride = 0,
                                        int vis_stride = 0) {
  constexpr int GQA = Heads<HKV>::gqa;
  // nreq > 1 (XE2_KV_BATCH_REQS): request r owns programs [r * n_groups * HKV, (r + 1) * ...), its
  // own Q tile (Q8 / Qsc + r * one tile), block-table row, seq_lens[r] and visible_lens row.
  const int nprog = n_groups * HKV * nreq;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    // FAST adds 64 bytes: one "max moved" byte per (row tile, sub-group).
    sycl::local_accessor<float, 1> slm(sycl::range<1>(kSlmFloats + 2 * BM + (FAST ? 16 : 0)), h);
    auto body = [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
      const int lid = static_cast<int>(item.get_local_id(0));
      const int prog = static_cast<int>(item.get_group(0));
      auto sg = item.get_sub_group();
      const int sg_id = static_cast<int>(sg.get_group_id());
      const int lane = static_cast<int>(sg.get_local_id());
      const int req = prog / (n_groups * HKV);
      const int prog_r = prog - req * (n_groups * HKV);
      const int kv_head = prog_r / n_groups;
      const int grp = prog_r - kv_head * n_groups;
      const std::int32_t *visr =
          visible_lens ? visible_lens + static_cast<size_t>(req) * vis_stride : nullptr;
      const std::int32_t *btr = bt + static_cast<size_t>(req) * bt_stride;
      const std::int64_t seq_len =
          static_cast<std::int64_t>(visr ? visr[0] : seq_lens[req]);
      const int npg_eff = s1_pages_for(seq_len, npg, splits);
      const int first = grp * npg_eff;
      const std::int64_t left = seq_len - static_cast<std::int64_t>(first) * BM;
      // Graph-static capacity pads the grid; S2 merges only the live groups.
      if (left <= 0) return;  // work-group uniform
      const int npages = static_cast<int>(
          sycl::min(static_cast<std::int64_t>(npg_eff), (left + BM - 1) / BM));
      auto phys_of = [&](int lg) {
        return (pages_per_block <= 1)
                   ? static_cast<int>(btr[lg])
                   : static_cast<int>(btr[lg / pages_per_block]) * pages_per_block +
                         (lg % pages_per_block);
      };
      const int R = q_len * GQA;
      const int T = (R + TM - 1) / TM;  // live row tiles, <= TMAX

      float *base_f = &slm[0];
      auto *base = reinterpret_cast<std::uint8_t *>(base_f);
      std::int32_t *s_i32 = reinterpret_cast<std::int32_t *>(base);
      sycl::half *p_raw = reinterpret_cast<sycl::half *>(base + kSbytes);
      sycl::half *kv_tile = reinterpret_cast<sycl::half *>(s_i32);
      float *alpha_s = base_f + kSlmFloats;
      float *linv_s = alpha_s + BM;
      std::uint8_t *moved_s = reinterpret_cast<std::uint8_t *>(linv_s + BM);  // FAST only
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
      auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                          sycl::access::decorated::no>(
          const_cast<std::int8_t *>(Q8 + static_cast<size_t>(req) * HKV * BM * BK + q_off));

      // Softmax rows of this sub-group: r = sg_id + 8 * i, i < T.
      float m_run[TMAX], l_run[TMAX], qs_row[TMAX];
      std::int64_t q_end[TMAX];
#pragma unroll
      for (int i = 0; i < TMAX; ++i) {
        const int r = sg_id + SG_COUNT * i;
        m_run[i] = -INFINITY;
        l_run[i] = 0.f;
        const bool live = r < R;
        qs_row[i] = live ? Qsc[static_cast<size_t>(req) * HKV * BM + qsc_off + r] : 0.f;
        const int q_tok = r / GQA;
        q_end[i] = live ? (visr ? static_cast<std::int64_t>(visr[1 + q_tok])
                                        : seq_len - static_cast<std::int64_t>(q_len) + q_tok + 1)
                        : 0;
      }
      // P element (row, token): row-major [64][64], or contiguous 8x16 blocks for FAST.
      auto pix = [&](int r, int tok) {
        if constexpr (FAST) return ((r >> 3) * NTN + (tok >> 4)) * (TM * TK) + (r & 7) * TK + (tok & 15);
        else return r * BN + tok;
      };
      // FAST: scores in the log2 domain, int32 causal ends, and the smallest end over the query
      // tokens (pages ending at or before it need no mask). Row sums stay per lane until the end.
      constexpr float LOG2E = 1.4426950408889634f;
      constexpr float LN2 = 0.6931471805599453f;
      float qsl[TMAX], l_lane[TMAX];
      int qend32[TMAX];
      int min_qend = 0x7fffffff;
      if constexpr (FAST) {
#pragma unroll
        for (int i = 0; i < TMAX; ++i) {
          qsl[i] = qs_row[i] * (INV_SQRT_D * LOG2E);
          qend32[i] = static_cast<int>(q_end[i]);
          l_lane[i] = 0.f;
        }
        for (int qt = 0; qt < q_len; ++qt) {
          const int e = visr ? visr[1 + qt] : static_cast<int>(seq_len) - q_len + qt + 1;
          min_qend = e < min_qend ? e : min_qend;
        }
        // Padding rows of the last live tile: P stays 0 for the whole program.
#pragma unroll
        for (int i = 0; i < TMAX; ++i) {
          const int r = sg_id + SG_COUNT * i;
          if (i < T && r >= R) {
#pragma unroll
            for (int t = 0; t < NTN; ++t) p_slm[pix(r, t * SG_SIZE + lane)] = sycl::half(0.f);
          }
        }
      }
      // FAST: did any row of tile t move its running max on this page?
      auto tile_moved = [&](int t) {
        std::uint32_t a, b;
        std::memcpy(&a, moved_s + t * SG_COUNT, 4);
        std::memcpy(&b, moved_s + t * SG_COUNT + 4, 4);
        return (a | b) != 0;
      };

      using AccT = jm::joint_matrix<sycl::sub_group, float, jm::use::accumulator, TM, TN>;
      AccT acc[TMAX][2];
#pragma unroll
      for (int t = 0; t < TMAX; ++t) {
        jm::joint_matrix_fill(sg, acc[t][0], 0.f);
        jm::joint_matrix_fill(sg, acc[t][1], 0.f);
      }

      for (int j = 0; j < npages; ++j) {
        const int logical = first + j;
        const int n_valid = static_cast<int>(sycl::min(
            static_cast<std::int64_t>(BM), seq_len - static_cast<std::int64_t>(logical) * BM));
        const int phys = phys_of(logical);
        const size_t k_head_off =
            static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
        const size_t v_head_off =
            static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
        const size_t sc_head_off =
            static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);
        auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                            sycl::access::decorated::no>(
            const_cast<std::int8_t *>(K8 + k_head_off));

        if constexpr (FAST) {
          // Sub-group g owns 16-token tile g % 4 of row tiles g / 4, g / 4 + 2, ...: one K load per
          // k step feeds every row tile of the sub-group (same jobs as below, K read once).
          constexpr int TJ = (TMAX + 1) / 2;
          const int nt = sg_id % NTN;
          const int t0 = sg_id / NTN;
          jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::a, TM, TK_I8, jm::layout::row_major> a;
          jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::b, TK_I8, TN, jm::layout::col_major> b;
          jm::joint_matrix<sycl::sub_group, std::int32_t, jm::use::accumulator, TM, TN> c[TJ];
#pragma unroll
          for (int u = 0; u < TJ; ++u) jm::joint_matrix_fill(sg, c[u], 0);
          for (int k = 0; k < BK; k += TK_I8) {
            jm::joint_matrix_load(sg, b, pK8 + (nt * TN) * k_tok_stride + k, k_tok_stride);
#pragma unroll
            for (int u = 0; u < TJ; ++u) {
              const int t = t0 + 2 * u;
              if (t < T) {
                jm::joint_matrix_load(sg, a, pQ8 + (t * TM) * BK + k, BK);
                jm::joint_matrix_mad(sg, c[u], a, b, c[u]);
              }
            }
          }
#pragma unroll
          for (int u = 0; u < TJ; ++u) {
            const int t = t0 + 2 * u;
            if (t < T)
              jm::joint_matrix_store(sg, c[u], s_slm_i + (t * TM) * BN + nt * TN, BN,
                                     jm::layout::row_major);
          }
        } else
        // QK: job = (row tile, 16-token tile).
        for (int job = sg_id; job < T * NTN; job += SG_COUNT) {
          const int t = job / NTN;
          const int nt = job - t * NTN;
          jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::a, TM, TK_I8, jm::layout::row_major> a;
          jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::b, TK_I8, TN, jm::layout::col_major> b;
          jm::joint_matrix<sycl::sub_group, std::int32_t, jm::use::accumulator, TM, TN> c;
          jm::joint_matrix_fill(sg, c, 0);
          for (int k = 0; k < BK; k += TK_I8) {
            jm::joint_matrix_load(sg, a, pQ8 + (t * TM) * BK + k, BK);
            jm::joint_matrix_load(sg, b, pK8 + (nt * TN) * k_tok_stride + k, k_tok_stride);
            jm::joint_matrix_mad(sg, c, a, b, c);
          }
          jm::joint_matrix_store(sg, c, s_slm_i + (t * TM) * BN + nt * TN, BN, jm::layout::row_major);
        }
        item.barrier(sycl::access::fence_space::local_space);

        {
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t)
            ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];
          if constexpr (FAST) {
            // Lazy rescale: the running max (log2 domain) moves only when a score exceeds it by more
            // than 8, so P <= 2^8 still fits half and alpha is exactly 1 on almost every page; the
            // max reduction runs only on pages that move it. Padding rows are skipped.
            constexpr float TAU = 8.f;
            const bool interior = n_valid == BM && logical * BM + BM <= min_qend;
#pragma unroll
            for (int i = 0; i < TMAX; ++i) {
              const int r = sg_id + SG_COUNT * i;
              if (i < T && r < R) {
                float vals[NTN];
                float lm = -INFINITY;
#pragma unroll
                for (int t = 0; t < NTN; ++t) {
                  const int tok = t * SG_SIZE + lane;
                  float sv = static_cast<float>(s_i32[r * BN + tok]) * (qsl[i] * ksc[t]);
                  if (!interior && (tok >= n_valid || logical * BM + tok >= qend32[i])) sv = -INFINITY;
                  vals[t] = sv;
                  lm = sycl::max(lm, sv);
                }
                float alpha = 1.f;
                if (sycl::any_of_group(sg, lm > m_run[i] + TAU)) {
                  const float m_new = sycl::reduce_over_group(sg, lm, sycl::maximum<float>());
                  alpha = sycl::exp2(m_run[i] - m_new);  // 0 when m_run is -inf
                  m_run[i] = m_new;
                }
                float sum = 0.f;
                float e[NTN];
#pragma unroll
                for (int t = 0; t < NTN; ++t) {
                  e[t] = (m_run[i] == -INFINITY) ? 0.f : sycl::exp2(vals[t] - m_run[i]);
                  sum += e[t];
                }
                l_lane[i] = l_lane[i] * alpha + sum;
#pragma unroll
                for (int t = 0; t < NTN; ++t) p_slm[pix(r, t * SG_SIZE + lane)] = sycl::half(e[t]);
                if (lane == 0) {
                  alpha_s[r] = alpha;
                  moved_s[i * SG_COUNT + sg_id] = alpha != 1.f ? 1 : 0;
                }
              } else if (i < T && lane == 0) {
                moved_s[i * SG_COUNT + sg_id] = 0;
              }
            }
          } else
#pragma unroll
          for (int i = 0; i < TMAX; ++i) {
            const int r = sg_id + SG_COUNT * i;
            if (i < T) {
              float vals[NTN];
              float pm = -INFINITY;
#pragma unroll
              for (int t = 0; t < NTN; ++t) {
                const int tok = t * SG_SIZE + lane;
                float s = static_cast<float>(s_i32[r * BN + tok]) * qs_row[i] * ksc[t] * INV_SQRT_D;
                const std::int64_t k_abs = static_cast<std::int64_t>(logical) * BM + tok;
                if (tok >= n_valid || r >= R || k_abs >= q_end[i]) s = -INFINITY;
                vals[t] = s;
                pm = sycl::max(pm, s);
              }
              pm = sycl::reduce_over_group(sg, pm, sycl::maximum<float>());
              const float m_new = sycl::max(m_run[i], pm);
              float alpha = 1.f;
              float sum = 0.f;
              float e[NTN];
              if (m_new == -INFINITY) {
#pragma unroll
                for (int t = 0; t < NTN; ++t) e[t] = 0.f;
              } else {
                alpha = sycl::exp(m_run[i] - m_new);  // 0 when m_run is -inf
#pragma unroll
                for (int t = 0; t < NTN; ++t) {
                  e[t] = sycl::exp(vals[t] - m_new);
                  sum += e[t];
                }
                sum = sycl::reduce_over_group(sg, sum, sycl::plus<float>());
              }
              l_run[i] = l_run[i] * alpha + sum;
              m_run[i] = m_new;
#pragma unroll
              for (int t = 0; t < NTN; ++t) p_slm[r * BN + t * SG_SIZE + lane] = sycl::half(e[t]);
              if (lane == 0) alpha_s[r] = alpha;
            }
          }
        }
        // P and alpha visible; every S read done before the V tile overwrites S.
        item.barrier(sycl::access::fence_space::local_space);

        jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::a, TM, TK, jm::layout::row_major> a;
        jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::b, TK, TN, jm::layout::row_major> b;
        // PREG (FAST, up to 3 row tiles): P fragments loaded once per page, reused by both V halves.
        constexpr bool PREG = FAST && TMAX <= 3;
        jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::a, TM, TK, jm::layout::row_major>
            pa[PREG ? TMAX : 1][PREG ? NTN : 1];
        if constexpr (PREG) {
#pragma unroll
          for (int t = 0; t < TMAX; ++t)
            if (t < T)
#pragma unroll
              for (int kc = 0; kc < NTN; ++kc)
                jm::joint_matrix_load(sg, pa[t][kc], p_slm + (t * NTN + kc) * (TM * TK), TK);
        }
#pragma unroll
        for (int hv = 0; hv < 2; ++hv) {
          if constexpr (FAST)
            decode_v_int4_blk(lid, V4 + v_head_off, v_tok_stride, VS + sc_head_off, VZ + sc_head_off,
                              sc_tok_stride, hv * KV_HALF, n_valid, kv_tile);
          else
            decode_v_int4_vec_strided(lid, V4 + v_head_off, v_tok_stride, VS + sc_head_off,
                                      VZ + sc_head_off, sc_tok_stride, hv * KV_HALF, n_valid, kv_tile);
          item.barrier(sycl::access::fence_space::local_space);
#pragma unroll
          for (int t = 0; t < TMAX; ++t) {
            if (t < T && (!FAST || tile_moved(t))) {
              const float *al = alpha_s + t * TM;
              sycl::ext::intel::experimental::matrix::joint_matrix_apply(
                  sg, acc[t][hv], [=](float &x, size_t row, size_t) { x *= al[row]; });
            }
          }
          // One V slab load per k step, reused by every live row tile.
#pragma unroll
          for (int k0 = 0; k0 < BN; k0 += TK) {
            if constexpr (FAST)
              jm::joint_matrix_load(sg, b, pKV + ((k0 >> 4) * 8 + sg_id) * 256, TN);
            else
              jm::joint_matrix_load(sg, b, pKV + k0 * KV_HALF + sg_id * TN, KV_HALF);
#pragma unroll
            for (int t = 0; t < TMAX; ++t) {
              if (t < T) {
                if constexpr (PREG) {
                  jm::joint_matrix_mad(sg, acc[t][hv], pa[PREG ? t : 0][PREG ? (k0 >> 4) : 0], b,
                                       acc[t][hv]);
                } else {
                  if constexpr (FAST)
                    jm::joint_matrix_load(sg, a, p_slm + (t * NTN + (k0 >> 4)) * (TM * TK), TK);
                  else
                    jm::joint_matrix_load(sg, a, p_slm + (t * TM) * BN + k0, BN);
                  jm::joint_matrix_mad(sg, acc[t][hv], a, b, acc[t][hv]);
                }
              }
            }
          }
          // Next half's decode / next page's QK overwrite the S/V region.
          item.barrier(sycl::access::fence_space::local_space);
        }
      }

      if constexpr (FAST) {
#pragma unroll
        for (int i = 0; i < TMAX; ++i) {
          if (i < T) l_run[i] = sycl::reduce_over_group(sg, l_lane[i], sycl::plus<float>());
          m_run[i] *= LN2;  // S2 merges natural-log maxima
        }
      }
#pragma unroll
      for (int i = 0; i < TMAX; ++i) {
        const int r = sg_id + SG_COUNT * i;
        if (i < T && lane == 0) {
          linv_s[r] = l_run[i] > 0.f ? 1.f / l_run[i] : 0.f;
          M[ml_off + r] = r < R ? m_run[i] : -INFINITY;
          L[ml_off + r] = r < R ? l_run[i] : 0.f;
        }
      }
      if (lid < BM && lid >= T * TM) {
        M[ml_off + lid] = -INFINITY;
        L[ml_off + lid] = 0.f;
      }
      item.barrier(sycl::access::fence_space::local_space);
      auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                         sycl::access::decorated::no>(Part + o_off);
      auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                          sycl::access::decorated::no>(
          reinterpret_cast<sycl::half *>(Part) + o_off);
#pragma unroll
      for (int t = 0; t < TMAX; ++t) {
        if (t < T) {
          const float *li = linv_s + t * TM;
#pragma unroll
          for (int hv = 0; hv < 2; ++hv) {
            sycl::ext::intel::experimental::matrix::joint_matrix_apply(
                sg, acc[t][hv], [=](float &x, size_t row, size_t) { x *= li[row]; });
            const size_t off = static_cast<size_t>(t * TM) * BV + hv * KV_HALF + sg_id * TN;
            if constexpr (PF16) {
              jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::accumulator, TM, TN> hc;
              jm::joint_matrix_copy(sg, acc[t][hv], hc);
              jm::joint_matrix_store(sg, hc, pOh + off, BV, jm::layout::row_major);
            } else {
              jm::joint_matrix_store(sg, acc[t][hv], pO + off, BV, jm::layout::row_major);
            }
          }
        }
      }
    };
    if constexpr (GRF == 256) {
      sycl::ext::oneapi::experimental::properties props{
          sycl::ext::intel::experimental::grf_size<256>};
      h.parallel_for<Xe2KvTorchAbiS1MultiKernel<HKV, PF16, TMAX, GRF, FAST>>(sycl::nd_range<1>(g, l),
                                                                             props, body);
    } else {
      h.parallel_for<Xe2KvTorchAbiS1MultiKernel<HKV, PF16, TMAX, GRF, FAST>>(sycl::nd_range<1>(g, l),
                                                                             body);
    }
  });
}

// Host dispatch for the multi-page kernel: picks the row-tile bound from q_len and the register
// file from XE2_KV_S1_GRF (256 = large GRF; default: the compiler's choice).
template <int HKV, bool PF16>
static void launch_s1_multi_dispatch(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                     const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                     const float *VS, const float *VZ, const std::int32_t *bt,
                                     const std::int32_t *seq_lens, float *Part, float *M, float *L,
                                     int n_groups, int npg, int q_len, size_t k_page_stride,
                                     size_t v_page_stride, size_t sc_page_stride,
                                     const std::int32_t *visible_lens, int pages_per_block,
                                     int splits, int nreq = 1, int bt_stride = 0,
                                     int vis_stride = 0) {
  const int tiles = (q_len * Heads<HKV>::gqa + TM - 1) / TM;
  // Large GRF by default: the register-resident accumulators spill in the 128-GRF mode.
  const char *gv = std::getenv("XE2_KV_S1_GRF");
  const bool big = !(gv != nullptr && std::atoi(gv) == 128);
  const bool fast = s1_fast_enabled();
  auto go = [&](auto tmax, auto grf, auto fst) {
    launch_int8k_int4v_s1_multi<HKV, PF16, decltype(tmax)::value, decltype(grf)::value,
                                decltype(fst)::value>(
        q, Q8, Qsc, K8, Ksc, V4, VS, VZ, bt, seq_lens, Part, M, L, n_groups, npg, q_len,
        k_page_stride, v_page_stride, sc_page_stride, visible_lens, pages_per_block, splits, nreq,
        bt_stride, vis_stride);
  };
  auto pick = [&](auto grf, auto fst) {
    if (tiles <= 1) go(std::integral_constant<int, 1>{}, grf, fst);
    else if (tiles <= 3) go(std::integral_constant<int, 3>{}, grf, fst);
    else go(std::integral_constant<int, 6>{}, grf, fst);
  };
  if (fast) {
    if (big) pick(std::integral_constant<int, 256>{}, std::true_type{});
    else pick(std::integral_constant<int, 0>{}, std::true_type{});
  } else {
    if (big) pick(std::integral_constant<int, 256>{}, std::false_type{});
    else pick(std::integral_constant<int, 0>{}, std::false_type{});
  }
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
          typename PartT = float, bool BATCH = false>
static void launch_s2_parallel(sycl::queue &q, const float *M, const float *L, const PartT *Acc,
                               OutT *Out, const std::int32_t *seq_lens, int n_splits, int tq,
                               int s1_pages = 1, int s1_splits = 0, int q_per_req = 1,
                               int seq_stride = 0) {
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
          // BATCH: token tok belongs to request tok / q_per_req, whose S1 programs start at
          // req * HKV * n_splits (XE2_KV_BATCH_REQS).
          int req = 0, tok_r = tok;
          if constexpr (BATCH) {
            req = tok / q_per_req;
            tok_r = tok - req * q_per_req;
          }
          const int row = tok_r * GQA + (h - head * GQA);
          const int p0 = (req * HKV + head) * n_splits;
          const std::int64_t seq_len =
              static_cast<std::int64_t>(seq_lens[BATCH ? static_cast<size_t>(req) * seq_stride : 0]);
          // One split = s1_pages pages (multi-page S1); the same rule as the S1 kernel.
          const std::int64_t split_tok =
              static_cast<std::int64_t>(BM) * s1_pages_for(seq_len, s1_pages, s1_splits);
          const int n_live = static_cast<int>(sycl::max(
              static_cast<std::int64_t>(1),
              sycl::min(static_cast<std::int64_t>(n_splits), (seq_len + split_tok - 1) / split_tok)));
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
                                    int tq, int nsg, int s1_pages = 1, int s1_splits = 0) {
  if (env_is_1("XE2_KV_S2_TWO_PASS")) {
    if (nsg == 8)
      launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2TwoPassHalf<HKV, 8>, HKV, 8, true>(q, M, L, Acc, Out, seq_lens, n_splits, tq, s1_pages, s1_splits);
    else if (nsg == 16)
      launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2TwoPassHalf<HKV, 16>, HKV, 16, true>(q, M, L, Acc, Out, seq_lens, n_splits, tq, s1_pages, s1_splits);
    else
      launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2TwoPassHalf<HKV, 32>, HKV, 32, true>(q, M, L, Acc, Out, seq_lens, n_splits, tq, s1_pages, s1_splits);
    return;
  }
  if (nsg == 8) {
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf8<HKV>, HKV, 8>(q, M, L, Acc, Out,
                                                                            seq_lens, n_splits, tq, s1_pages, s1_splits);
  } else if (nsg == 16) {
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf16<HKV>, HKV, 16>(q, M, L, Acc, Out,
                                                                              seq_lens, n_splits,
                                                                              tq, s1_pages, s1_splits);
  } else {
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf32<HKV>, HKV, 32>(q, M, L, Acc, Out,
                                                                              seq_lens, n_splits,
                                                                              tq, s1_pages, s1_splits);
  }
}

template <int HKV>
static void launch_s2_parallel_half_p16(sycl::queue &q, const float *M, const float *L,
                                        const sycl::half *Acc, sycl::half *Out,
                                        const std::int32_t *seq_lens, int n_splits, int tq,
                                        int nsg, int s1_pages = 1, int s1_splits = 0) {
  if (nsg == 8)
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf8P16<HKV>, HKV, 8, false,
                       sycl::half>(q, M, L, Acc, Out, seq_lens, n_splits, tq, s1_pages, s1_splits);
  else if (nsg == 16)
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf16P16<HKV>, HKV, 16, false,
                       sycl::half>(q, M, L, Acc, Out, seq_lens, n_splits, tq, s1_pages, s1_splits);
  else
    launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2ParallelHalf32P16<HKV>, HKV, 32, false,
                       sycl::half>(q, M, L, Acc, Out, seq_lens, n_splits, tq, s1_pages, s1_splits);
}

template <int HKV>
static void launch_s2_parallel_float(sycl::queue &q, const float *M, const float *L, const float *Acc,
                                     float *Out, const std::int32_t *seq_lens, int n_splits, int tq,
                                     int nsg, int s1_pages = 1, int s1_splits = 0) {
  if (nsg == 8) {
    launch_s2_parallel<float, Xe2KvTorchAbiS2ParallelFloat8<HKV>, HKV, 8>(q, M, L, Acc, Out,
                                                                        seq_lens, n_splits, tq, s1_pages, s1_splits);
  } else if (nsg == 16) {
    launch_s2_parallel<float, Xe2KvTorchAbiS2ParallelFloat16<HKV>, HKV, 16>(q, M, L, Acc, Out,
                                                                          seq_lens, n_splits, tq, s1_pages, s1_splits);
  } else {
    launch_s2_parallel<float, Xe2KvTorchAbiS2ParallelFloat32<HKV>, HKV, 32>(q, M, L, Acc, Out,
                                                                          seq_lens, n_splits, tq, s1_pages, s1_splits);
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
  // Opt-in multi-page S1 (XE2_KV_S1_PAGES=N > 1 or XE2_KV_S1_SPLITS=S > 0); S2 merges the
  // groups with the same pages-per-program rule. Both unset keeps the one-page path.
  const int npg = s1_pages_per_program();
  const char *sv = std::getenv("XE2_KV_S1_SPLITS");
  const int splits_env = sv == nullptr ? 0 : std::max(0, std::atoi(sv));
  const bool multi = (npg > 1 || splits_env > 0) && tq * GQA <= kMultiMaxRows && s2_parallel_enabled();
  const int splits = multi ? splits_env : 0;
  // XE2_KV_S1_SPLITS=S > 0 instead: S programs per KV head, pages per program from the live length.
  const int n_groups = !multi ? n_splits
                              : (splits > 0 ? std::min(splits, n_splits) : (n_splits + npg - 1) / npg);
  const int s2_pages = multi ? npg : 1;
  auto launch_s1 = [&]() {
    auto run = [&](auto pf) {
    if (multi) {
      launch_s1_multi_dispatch<HKV, decltype(pf)::value>(
          current_xpu_queue(), q8.data_ptr<int8_t>(), q_scale.data_ptr<float>(),
          k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(), v_cache.data_ptr<uint8_t>(),
          v_scale.data_ptr<float>(), v_zero.data_ptr<float>(), bt.data_ptr<int32_t>(),
          seq_lens.data_ptr<int32_t>(), partials.data_ptr<float>(), m.data_ptr<float>(),
          l.data_ptr<float>(), n_groups, npg, tq, static_cast<size_t>(k_cache.stride(0)),
          static_cast<size_t>(v_cache.stride(0)), static_cast<size_t>(k_scale.stride(0)),
          visible_ptr, ratio, splits);
      return;
    }
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
    };
    if (pf16) run(std::true_type{}); else run(std::false_type{});
  };
  auto launch_s2 = [&]() {
    const bool parallel = s2_parallel_enabled();
    const int nsg = s2_parallel_subgroups(tq);
    if (half_out) {
      auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr<at::Half>());
      if (parallel && pf16)
        launch_s2_parallel_half_p16<HKV>(current_xpu_queue(), m_ptr, l_ptr,
                                         reinterpret_cast<const sycl::half *>(part_ptr), dst, s2_seq,
                                         n_groups, tq, nsg, s2_pages, splits);
      else if (parallel)
        launch_s2_parallel_half<HKV>(current_xpu_queue(), m_ptr, l_ptr, part_ptr, dst, s2_seq,
                                     n_groups, tq, nsg, s2_pages, splits);
      else
        launch_s2_merge_to_out_half<HKV>(current_xpu_queue(), m_ptr, l_ptr, part_ptr, dst, s2_seq,
                                    n_splits, tq);
    } else if (parallel) {
      launch_s2_parallel_float<HKV>(current_xpu_queue(), m_ptr, l_ptr, part_ptr,
                                out.data_ptr<float>(), s2_seq, n_groups, tq, nsg, s2_pages, splits);
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
                 "[xe2_kv_time] s1_us=%.1f s2_us=%.1f n_splits=%d seq0=%d tq=%d parallel=%d nsg=%d\n",
                 s1_us, s2_us, n_splits, seq0, tq, s2_parallel_enabled() ? 1 : 0,
                 s2_parallel_subgroups(tq));
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

template <int HKV, int NSG, bool P16> class Xe2KvTorchAbiS2BatchHalf;
template <int HKV, int NSG> class Xe2KvTorchAbiS2BatchFloat;

// XE2_KV_BATCH_REQS=1: all requests of int8k_int4v_attn_batch in one q-pack, one S1 and one S2
// launch (multi-page S1 only). Off unless set; 0 or 1 only.
static bool batch_reqs_enabled() {
  const char *v = std::getenv("XE2_KV_BATCH_REQS");
  if (v == nullptr || (v[0] == '0' && v[1] == '\0')) return false;
  TORCH_CHECK(v[0] == '1' && v[1] == '\0', "XE2_KV_BATCH_REQS must be 0 or 1, got '", v, "'");
  return true;
}

// Returns false (caller keeps the per-request loop) when the batched path does not apply. The
// per-request Q tiles live in the unused tail of the caller's partials workspace, so no allocation
// happens inside graph capture.
template <int HKV>
static bool attn_batch_fused(const at::Tensor &q_fp16, const at::Tensor &k_cache,
                             const at::Tensor &k_scale, const at::Tensor &v_cache,
                             const at::Tensor &v_scale, const at::Tensor &v_zero,
                             const at::Tensor &block_table, const at::Tensor &seq_lens,
                             const at::Tensor &visible_lens, const at::Tensor &partials_ws,
                             const at::Tensor &m_ws, const at::Tensor &l_ws, at::Tensor out,
                             int q_len, int batch, int pages_per_block) {
  constexpr int GQA = Heads<HKV>::gqa;
  const int npg = s1_pages_per_program();
  const char *sv = std::getenv("XE2_KV_S1_SPLITS");
  const int splits = sv == nullptr ? 0 : std::max(0, std::atoi(sv));
  if (!(npg > 1 || splits > 0) || q_len * GQA > kMultiMaxRows || !s2_parallel_enabled() ||
      env_is_1("XE2_KV_S2_TWO_PASS"))
    return false;
  if (!partials_ws.defined() || !m_ws.defined() || !l_ws.defined()) return false;
  check_paged_k<HKV>(k_cache, k_scale);
  check_paged_v<HKV>(v_cache, v_scale, v_zero);
  TORCH_CHECK(partials_ws.scalar_type() == at::kFloat && partials_ws.dim() == 3 &&
                  partials_ws.size(1) == BM && partials_ws.size(2) == BV,
              "partials_ws [P,64,256] float32");
  const int ratio = pages_per_block < 1 ? 1 : pages_per_block;
  const int width = static_cast<int>(block_table.size(1));
  const int n_splits = width * ratio;
  const int n_groups = splits > 0 ? std::min(splits, n_splits) : (n_splits + npg - 1) / npg;
  const int64_t ws_progs = partials_ws.size(0);
  if (m_ws.numel() < ws_progs * BM || l_ws.numel() < ws_progs * BM) return false;
  const int64_t used_progs = static_cast<int64_t>(batch) * n_groups * HKV;
  // Q tiles after the used partials, 256-byte aligned.
  const int64_t part_bytes = ws_progs * BM * BV * static_cast<int64_t>(sizeof(float));
  const int64_t q_off = (used_progs * BM * BV * static_cast<int64_t>(sizeof(float)) + 255) / 256 * 256;
  const int64_t q8_bytes = static_cast<int64_t>(batch) * HKV * BM * BK;
  const int64_t qsc_off = (q_off + q8_bytes + 255) / 256 * 256;
  const int64_t need = qsc_off + static_cast<int64_t>(batch) * HKV * BM * sizeof(float);
  if (used_progs > ws_progs || need > part_bytes) return false;
  const bool has_vis = visible_lens.defined() && visible_lens.numel() > 0;
  const bool half_out = out.scalar_type() == at::kHalf;
  const bool pf16 = half_out && env_is_1("XE2_KV_PARTIAL_FP16");
  auto &queue = current_xpu_queue();
  auto *base = reinterpret_cast<std::uint8_t *>(partials_ws.data_ptr<float>());
  auto *q8 = reinterpret_cast<std::int8_t *>(base + q_off);
  auto *qsc = reinterpret_cast<float *>(base + qsc_off);
  launch_pack_q_quant_batch<HKV>(queue, as_half_c(q_fp16), q8, qsc, q_len, batch);
  const std::int32_t *vis = has_vis ? visible_lens.data_ptr<int32_t>() : nullptr;
  const int vis_stride = has_vis ? static_cast<int>(visible_lens.size(1)) : 0;
  if (!block_table.is_contiguous() || !seq_lens.is_contiguous() ||
      (has_vis && !visible_lens.is_contiguous()))
    return false;
  const at::Tensor &bt = block_table;
  auto run_s1 = [&](auto pf) {
    launch_s1_multi_dispatch<HKV, decltype(pf)::value>(
        queue, q8, qsc, k_cache.data_ptr<int8_t>(), k_scale.data_ptr<float>(),
        v_cache.data_ptr<uint8_t>(), v_scale.data_ptr<float>(), v_zero.data_ptr<float>(),
        bt.data_ptr<int32_t>(), seq_lens.data_ptr<int32_t>(), partials_ws.data_ptr<float>(),
        m_ws.data_ptr<float>(), l_ws.data_ptr<float>(), n_groups, npg, q_len,
        static_cast<size_t>(k_cache.stride(0)), static_cast<size_t>(v_cache.stride(0)),
        static_cast<size_t>(k_scale.stride(0)), vis, ratio, splits, batch, width, vis_stride);
  };
  if (pf16) run_s1(std::true_type{}); else run_s1(std::false_type{});
  const int tq = batch * q_len;
  const int nsg = s2_parallel_subgroups(q_len);
  const std::int32_t *s2_seq = vis ? vis : seq_lens.data_ptr<int32_t>();
  const int seq_stride = vis ? vis_stride : 1;
  const float *mp = m_ws.data_ptr<float>();
  const float *lp = l_ws.data_ptr<float>();
  const int s2_pages = npg;
  if (half_out) {
    auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr<at::Half>());
    auto go = [&](auto n, auto p16) {
      constexpr int N = decltype(n)::value;
      constexpr bool P = decltype(p16)::value;
      using PartT = std::conditional_t<P, sycl::half, float>;
      launch_s2_parallel<sycl::half, Xe2KvTorchAbiS2BatchHalf<HKV, N, P>, HKV, N, false, PartT, true>(
          queue, mp, lp, reinterpret_cast<const PartT *>(partials_ws.data_ptr<float>()), dst, s2_seq,
          n_groups, tq, s2_pages, splits, q_len, seq_stride);
    };
    auto pick = [&](auto p16) {
      if (nsg == 8) go(std::integral_constant<int, 8>{}, p16);
      else if (nsg == 16) go(std::integral_constant<int, 16>{}, p16);
      else go(std::integral_constant<int, 32>{}, p16);
    };
    if (pf16) pick(std::true_type{}); else pick(std::false_type{});
  } else {
    auto go = [&](auto n) {
      constexpr int N = decltype(n)::value;
      launch_s2_parallel<float, Xe2KvTorchAbiS2BatchFloat<HKV, N>, HKV, N, false, float, true>(
          queue, mp, lp, partials_ws.data_ptr<float>(), out.data_ptr<float>(), s2_seq, n_groups, tq,
          s2_pages, splits, q_len, seq_stride);
    };
    if (nsg == 8) go(std::integral_constant<int, 8>{});
    else if (nsg == 16) go(std::integral_constant<int, 16>{});
    else go(std::integral_constant<int, 32>{});
  }
  return true;
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
    if (batch_reqs_enabled() &&
        attn_batch_fused<HKV>(q_fp16, k_cache, k_scale, v_cache, v_scale, v_zero, block_table,
                              seq_flat, visible_lens, partials_ws, m_ws, l_ws, out,
                              static_cast<int>(q_len), batch, static_cast<int>(pages_per_block)))
      return;
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
