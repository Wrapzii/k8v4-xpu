// Standalone ESIMD xmx::dpas layout probe for Arc Pro B60 (Xe2).
// Confirms int8 (M8 N16 K32) and fp16 (M8 N16 K16) VNNI register layouts,
// the strided-select transpose into that layout, and lsc load_2d.
#include <sycl/sycl.hpp>
#include <sycl/ext/intel/esimd.hpp>
#include <sycl/ext/intel/esimd/xmx/dpas.hpp>

#include <cstdint>
#include <cstdio>
#include <cstring>
#include <vector>

namespace esimd = sycl::ext::intel::esimd;
namespace xmx = sycl::ext::intel::esimd::xmx;

static constexpr int M = 8;
static constexpr int N = 16;
static constexpr int KI = 32;  // int8 K
static constexpr int KH = 16;  // fp16 K

static void pack_i8_l0(int8_t *dst, const int8_t *B) {
  // B is K-major logical [k][n]. GRF is 64B, exec size 16.
  // dword (k/4, n) holds B[k..k+3][n] little-endian.
  std::memset(dst, 0, static_cast<size_t>(KI) * N);
  for (int k = 0; k < KI; ++k)
    for (int n = 0; n < N; ++n)
      dst[(k / 4) * 64 + n * 4 + (k % 4)] = B[k * N + n];
}

static void ref_i8(int32_t *C, const int8_t *A, const int8_t *B) {
  for (int m = 0; m < M; ++m)
    for (int n = 0; n < N; ++n) {
      int32_t s = 0;
      for (int k = 0; k < KI; ++k) s += static_cast<int32_t>(A[m * KI + k]) * static_cast<int32_t>(B[k * N + n]);
      C[m * N + n] = s;
    }
}

static void ref_f16(float *C, const sycl::half *A, const sycl::half *B) {
  for (int m = 0; m < M; ++m)
    for (int n = 0; n < N; ++n) {
      float s = 0.f;
      for (int k = 0; k < KH; ++k)
        s += static_cast<float>(A[m * KH + k]) * static_cast<float>(B[k * N + n]);
      C[m * N + n] = s;
    }
}

static void pack_f16_l0(sycl::half *dst, const sycl::half *B) {
  std::memset(dst, 0, sizeof(sycl::half) * KH * N);
  for (int k = 0; k < KH; ++k)
    for (int n = 0; n < N; ++n)
      dst[(k / 2) * 32 + n * 2 + (k % 2)] = B[k * N + n];
}

// Device: prepacked B.
SYCL_ESIMD_FUNCTION void k_i8_prepacked(const int8_t *A, const int8_t *B, int32_t *C) {
  esimd::simd<int8_t, M * KI> a(A, esimd::overaligned_tag<16>{});
  esimd::simd<int8_t, KI * N> b(B, esimd::overaligned_tag<16>{});
  esimd::simd<int32_t, M * N> c(0);
  c = xmx::dpas<8, M, int32_t>(c, b, a);
  c.copy_to(C);
}

// Device: row-major K tile [N][KI] (token, dim) -> VNNI via strided select, then dpas.
// A is row-major [M][KI].
SYCL_ESIMD_FUNCTION void k_i8_transpose(const int8_t *A, const int8_t *Krow, int32_t *C) {
  esimd::simd<int8_t, M * KI> a(A, esimd::overaligned_tag<16>{});
  esimd::simd<int8_t, N * KI> raw(Krow, esimd::overaligned_tag<16>{});
  auto raw_dw = raw.template bit_cast_view<uint32_t>();  // [tok][8]
  esimd::simd<uint32_t, (KI / 4) * N> b_dw;
#pragma unroll
  for (int k4 = 0; k4 < KI / 4; ++k4)
    b_dw.template select<N, 1>(k4 * N) = raw_dw.template select<N, KI / 4>(k4);
  esimd::simd<int8_t, KI * N> b(0);
  b.template bit_cast_view<uint32_t>() = b_dw;
  esimd::simd<int32_t, M * N> c(0);
  c = xmx::dpas<8, M, int32_t>(c, b, a);
  c.copy_to(C);
}

// Device: strided block_load of 16 token rows (stride bytes) + same transpose.
SYCL_ESIMD_FUNCTION void k_i8_strided(const int8_t *A, const int8_t *Kbase, int stride, int32_t *C) {
  esimd::simd<int8_t, M * KI> a(A, esimd::overaligned_tag<16>{});
  esimd::simd<uint32_t, (KI / 4) * N> raw_dw;
#pragma unroll
  for (int t = 0; t < N; ++t) {
    esimd::simd<int8_t, KI> row = esimd::block_load<int8_t, KI>(Kbase + t * stride);
    raw_dw.template select<KI / 4, 1>(t * (KI / 4)) = row.template bit_cast_view<uint32_t>();
  }
  esimd::simd<uint32_t, (KI / 4) * N> b_dw;
#pragma unroll
  for (int k4 = 0; k4 < KI / 4; ++k4)
    b_dw.template select<N, 1>(k4 * N) = raw_dw.template select<N, KI / 4>(k4);
  esimd::simd<int8_t, KI * N> b(0);
  b.template bit_cast_view<uint32_t>() = b_dw;
  esimd::simd<int32_t, M * N> c(0);
  c = xmx::dpas<8, M, int32_t>(c, b, a);
  c.copy_to(C);
}

// load_2d of a tight [height=N][width=KI] int8 tile, then transpose+dpas.
// Surface is exactly the tile: pitch = KI bytes.
SYCL_ESIMD_FUNCTION void k_i8_load2d(const int8_t *A, const int8_t *tile, int32_t *C, int *status) {
  esimd::simd<int8_t, M * KI> a(A, esimd::overaligned_tag<16>{});
  // width/height/pitch are passed as minus-1. Width KI=32 may be under the
  // 64B hardware minimum; the caller also tries a 64-wide surface.
  constexpr int WIDTH = KI;
  constexpr int HEIGHT = N;
  constexpr int PITCH = KI;
  esimd::simd<int8_t, WIDTH * HEIGHT> raw =
      esimd::load_2d<int8_t, WIDTH, HEIGHT>(tile, WIDTH - 1, HEIGHT - 1, PITCH - 1, 0, 0);
  auto raw_dw = raw.template bit_cast_view<uint32_t>();
  esimd::simd<uint32_t, (KI / 4) * N> b_dw;
#pragma unroll
  for (int k4 = 0; k4 < KI / 4; ++k4)
    b_dw.template select<N, 1>(k4 * N) = raw_dw.template select<N, KI / 4>(k4);
  esimd::simd<int8_t, KI * N> b(0);
  b.template bit_cast_view<uint32_t>() = b_dw;
  esimd::simd<int32_t, M * N> c(0);
  c = xmx::dpas<8, M, int32_t>(c, b, a);
  c.copy_to(C);
  *status = 1;
}

// 64-byte-wide load_2d (two K-slices). Uses the low 32 columns as the dpas B tile.
SYCL_ESIMD_FUNCTION void k_i8_load2d_w64(const int8_t *A, const int8_t *tile, int pitch, int32_t *C, int *status) {
  esimd::simd<int8_t, M * KI> a(A, esimd::overaligned_tag<16>{});
  constexpr int WIDTH = 64;
  constexpr int HEIGHT = N;
  esimd::simd<int8_t, WIDTH * HEIGHT> raw =
      esimd::load_2d<int8_t, WIDTH, HEIGHT>(tile, WIDTH - 1, HEIGHT - 1, pitch - 1, 0, 0);
  // raw is [tok][64]. Keep the first 32 bytes of each row: those are K[0:32].
  esimd::simd<int8_t, N * KI> slim;
#pragma unroll
  for (int t = 0; t < N; ++t)
    slim.template select<KI, 1>(t * KI) = raw.template select<KI, 1>(t * WIDTH);
  auto raw_dw = slim.template bit_cast_view<uint32_t>();
  esimd::simd<uint32_t, (KI / 4) * N> b_dw;
#pragma unroll
  for (int k4 = 0; k4 < KI / 4; ++k4)
    b_dw.template select<N, 1>(k4 * N) = raw_dw.template select<N, KI / 4>(k4);
  esimd::simd<int8_t, KI * N> b(0);
  b.template bit_cast_view<uint32_t>() = b_dw;
  esimd::simd<int32_t, M * N> c(0);
  c = xmx::dpas<8, M, int32_t>(c, b, a);
  c.copy_to(C);
  *status = 1;
}

SYCL_ESIMD_FUNCTION void k_f16_prepacked(const sycl::half *A, const sycl::half *B, float *C) {
  esimd::simd<sycl::half, M * KH> a(A, esimd::overaligned_tag<16>{});
  esimd::simd<sycl::half, KH * N> b(B, esimd::overaligned_tag<16>{});
  esimd::simd<float, M * N> c(0.f);
  c = xmx::dpas<8, M, float>(c, b, a);
  c.copy_to(C);
}

// Row-major fp16 V [KH][N] (token, col) -> VNNI via stride-2 select.
SYCL_ESIMD_FUNCTION void k_f16_transpose(const sycl::half *A, const sycl::half *Vrow, float *C) {
  esimd::simd<sycl::half, M * KH> a(A, esimd::overaligned_tag<16>{});
  esimd::simd<sycl::half, KH * N> raw(Vrow, esimd::overaligned_tag<16>{});
  esimd::simd<sycl::half, KH * N> b;
#pragma unroll
  for (int p = 0; p < KH / 2; ++p) {
    b.template select<N, 2>(p * 2 * N) = raw.template select<N, 1>((2 * p) * N);
    b.template select<N, 2>(p * 2 * N + 1) = raw.template select<N, 1>((2 * p + 1) * N);
  }
  esimd::simd<float, M * N> c(0.f);
  c = xmx::dpas<8, M, float>(c, b, a);
  c.copy_to(C);
}

static int cmp_i32(const char *name, const int32_t *got, const int32_t *ref) {
  int bad = 0;
  int32_t maxd = 0;
  for (int i = 0; i < M * N; ++i) {
    int32_t d = got[i] - ref[i];
    if (d < 0) d = -d;
    if (d > maxd) maxd = d;
    if (d != 0) ++bad;
  }
  std::printf("%-18s %s  bad=%d maxabs=%d  got0=%d ref0=%d got1=%d ref1=%d\n", name,
              bad ? "FAIL" : "PASS", bad, maxd, got[0], ref[0], got[1], ref[1]);
  return bad ? 1 : 0;
}

static int cmp_f32(const char *name, const float *got, const float *ref) {
  int bad = 0;
  float maxd = 0.f;
  for (int i = 0; i < M * N; ++i) {
    float d = got[i] - ref[i];
    if (d < 0) d = -d;
    if (d > maxd) maxd = d;
    if (d > 0.05f) ++bad;
  }
  std::printf("%-18s %s  bad=%d maxabs=%.4f  got0=%.3f ref0=%.3f\n", name, bad ? "FAIL" : "PASS", bad, maxd,
              got[0], ref[0]);
  return bad ? 1 : 0;
}

int main() {
  sycl::queue q(sycl::gpu_selector_v);
  std::printf("device: %s\n", q.get_device().get_info<sycl::info::device::name>().c_str());

  std::vector<int8_t> A(M * KI), B(KI * N), Krow(N * KI), Bpk(KI * N);
  for (int m = 0; m < M; ++m)
    for (int k = 0; k < KI; ++k) A[m * KI + k] = static_cast<int8_t>(((m * 3 + k * 5) % 11) - 5);
  for (int k = 0; k < KI; ++k)
    for (int n = 0; n < N; ++n) {
      int8_t v = static_cast<int8_t>(((k * 2 + n * 7) % 9) - 4);
      B[k * N + n] = v;
      Krow[n * KI + k] = v;  // token-major, dim contiguous
    }
  pack_i8_l0(Bpk.data(), B.data());
  std::vector<int32_t> Cref(M * N), Cgot(M * N);
  ref_i8(Cref.data(), A.data(), B.data());

  auto *dA = sycl::malloc_shared<int8_t>(A.size(), q);
  auto *dB = sycl::malloc_shared<int8_t>(Bpk.size(), q);
  auto *dK = sycl::malloc_shared<int8_t>(Krow.size(), q);
  auto *dC = sycl::malloc_shared<int32_t>(Cgot.size(), q);
  std::memcpy(dA, A.data(), A.size());
  std::memcpy(dB, Bpk.data(), Bpk.size());
  std::memcpy(dK, Krow.data(), Krow.size());

  int fails = 0;
  q.single_task([=]() SYCL_ESIMD_KERNEL { k_i8_prepacked(dA, dB, dC); }).wait();
  fails += cmp_i32("i8-prepack-L0", dC, Cref.data());

  q.single_task([=]() SYCL_ESIMD_KERNEL { k_i8_transpose(dA, dK, dC); }).wait();
  fails += cmp_i32("i8-select-transpose", dC, Cref.data());

  // Strided like K cache: each token row is KI bytes, pitch 512.
  constexpr int STRIDE = 512;
  auto *dS = sycl::malloc_shared<int8_t>(static_cast<size_t>(N) * STRIDE + 64, q);
  std::memset(dS, 0x5a, static_cast<size_t>(N) * STRIDE);
  for (int t = 0; t < N; ++t) std::memcpy(dS + t * STRIDE, Krow.data() + t * KI, KI);
  q.single_task([=]() SYCL_ESIMD_KERNEL { k_i8_strided(dA, dS, STRIDE, dC); }).wait();
  fails += cmp_i32("i8-strided-load", dC, Cref.data());

  auto *st = sycl::malloc_shared<int>(1, q);
  *st = 0;
  try {
    q.single_task([=]() SYCL_ESIMD_KERNEL { k_i8_load2d(dA, dK, dC, st); }).wait();
    if (*st == 1) fails += cmp_i32("i8-load2d-w32", dC, Cref.data());
    else {
      std::printf("%-18s SKIP status=%d\n", "i8-load2d-w32", *st);
    }
  } catch (const std::exception &e) {
    std::printf("%-18s EXC %s\n", "i8-load2d-w32", e.what());
  }

  // 64-wide surface, pitch 64, first 32 cols are the K tile. Pad high 32 with 0.
  auto *dW = sycl::aligned_alloc_shared<int8_t>(64, static_cast<size_t>(N) * 64, q);
  std::memset(dW, 0, static_cast<size_t>(N) * 64);
  for (int t = 0; t < N; ++t) std::memcpy(dW + t * 64, Krow.data() + t * KI, KI);
  *st = 0;
  try {
    q.single_task([=]() SYCL_ESIMD_KERNEL { k_i8_load2d_w64(dA, dW, 64, dC, st); }).wait();
    if (*st == 1) fails += cmp_i32("i8-load2d-w64", dC, Cref.data());
    else std::printf("%-18s SKIP status=%d\n", "i8-load2d-w64", *st);
  } catch (const std::exception &e) {
    std::printf("%-18s EXC %s\n", "i8-load2d-w64", e.what());
  }

  // fp16
  std::vector<sycl::half> Ah(M * KH), Bh(KH * N), Vrow(KH * N), Bpkh(KH * N);
  for (int m = 0; m < M; ++m)
    for (int k = 0; k < KH; ++k) Ah[m * KH + k] = sycl::half(0.25f * static_cast<float>(((m + k) % 5) - 2));
  for (int k = 0; k < KH; ++k)
    for (int n = 0; n < N; ++n) {
      sycl::half v = sycl::half(0.5f * static_cast<float>(((k * 3 + n) % 7) - 3));
      Bh[k * N + n] = v;
      Vrow[k * N + n] = v;
    }
  pack_f16_l0(Bpkh.data(), Bh.data());
  std::vector<float> Fref(M * N), Fgot(M * N);
  ref_f16(Fref.data(), Ah.data(), Bh.data());
  auto *fA = sycl::malloc_shared<sycl::half>(Ah.size(), q);
  auto *fB = sycl::malloc_shared<sycl::half>(Bpkh.size(), q);
  auto *fV = sycl::malloc_shared<sycl::half>(Vrow.size(), q);
  auto *fC = sycl::malloc_shared<float>(Fgot.size(), q);
  std::memcpy(fA, Ah.data(), Ah.size() * sizeof(sycl::half));
  std::memcpy(fB, Bpkh.data(), Bpkh.size() * sizeof(sycl::half));
  std::memcpy(fV, Vrow.data(), Vrow.size() * sizeof(sycl::half));

  try {
    q.single_task([=]() SYCL_ESIMD_KERNEL { k_f16_prepacked(fA, fB, fC); }).wait();
    fails += cmp_f32("f16-prepack-L0", fC, Fref.data());
  } catch (const std::exception &e) {
    std::printf("%-18s EXC %s\n", "f16-prepack-L0", e.what());
    ++fails;
  }
  try {
    q.single_task([=]() SYCL_ESIMD_KERNEL { k_f16_transpose(fA, fV, fC); }).wait();
    fails += cmp_f32("f16-select-transpose", fC, Fref.data());
  } catch (const std::exception &e) {
    std::printf("%-18s EXC %s\n", "f16-select-transpose", e.what());
    ++fails;
  }

  std::printf("FAILS %d\n", fails);
  return fails ? 1 : 0;
}
