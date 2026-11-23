// k8v4_w4a8: int4 GEMMs with OPTIONAL zero points for K8V4_W4A8_KERNEL=onednn. vllm-xpu-kernels' int4_gemm_w4a8 /
// int4_gemm_w4a16 (csrc/xpu/onednn/) always give oneDNN a weight zero point (u4 weights), and w4a8 also a source zero
// point (per token when the scale is per token). oneDNN then does zero-point compensation in every weight group even
// when both are constants. Here:
//   A_zp None  -> no source zero point (exact when the activation quantizer is symmetric: all its zero points are 0)
//   B_zp None  -> s4 weights, no zero point (u4 with zp 8 == s4 of the same nibbles XOR 0x8, i.e. int32 ^ 0x88888888)
//   accum      -> oneDNN sum post-op: the product is added into `accum` in place, and `accum` is returned
//   A_scale [m, ng] -> per-token scales for each of ng groups of k/ng input channels (oneDNN grouped source scales)
//   bf16_out   -> bf16 result (bf16 models) instead of fp16; int4_gemm_w4a16 takes fp16 or bf16 activations
// Built against xk's own primitive cache and engine/stream glue (onednn_ext.h, onednn_runtime.*), so a call with both
// zero points given is the upstream op, on oneDNN v3.14.2.
#include <torch/torch.h>
#include <torch/library.h>
#include <c10/xpu/XPUStream.h>

#include "onednn_ext.h"
#include "onednn_runtime.h"

namespace oneDNN {
// joint dtypes the upstream enum lacks (enum class: any int is a valid value)
constexpr auto b70_s8_s4 = static_cast<joint_dtypes_t>(1000);
constexpr auto b70_f16_s4 = static_cast<joint_dtypes_t>(1001);
// k8v4 (bf16 models): s8 x s4 -> bf16 and bf16 x s4 -> bf16
constexpr auto b70_s8_s4_bf16 = static_cast<joint_dtypes_t>(1002);
constexpr auto b70_bf16_s4 = static_cast<joint_dtypes_t>(1003);
template <>
struct onednn_types_mapper<b70_s8_s4> {
  static inline std::tuple<memory::data_type, memory::data_type, memory::data_type> get() {
    return std::make_tuple(memory::data_type::s8, memory::data_type::s4, memory::data_type::f16);
  }
};
template <>
struct onednn_types_mapper<b70_f16_s4> {
  static inline std::tuple<memory::data_type, memory::data_type, memory::data_type> get() {
    return std::make_tuple(memory::data_type::f16, memory::data_type::s4, memory::data_type::f16);
  }
};
template <>
struct onednn_types_mapper<b70_s8_s4_bf16> {
  static inline std::tuple<memory::data_type, memory::data_type, memory::data_type> get() {
    return std::make_tuple(memory::data_type::s8, memory::data_type::s4, memory::data_type::bf16);
  }
};
template <>
struct onednn_types_mapper<b70_bf16_s4> {
  static inline std::tuple<memory::data_type, memory::data_type, memory::data_type> get() {
    return std::make_tuple(memory::data_type::bf16, memory::data_type::s4, memory::data_type::bf16);
  }
};
}  // namespace oneDNN

using namespace oneDNN;

namespace {

void check_weights(const torch::Tensor& B, const torch::Tensor& B_scale, const std::optional<torch::Tensor>& B_zp,
                   int64_t k, int64_t group_size) {
  TORCH_CHECK(B.scalar_type() == at::kInt && B.dim() == 2 && B.size(0) * 8 == k && B.stride(0) == 1,
              "B: int32 [k/8, n], the transposed view of a contiguous [n, k/8]");
  TORCH_CHECK(B_scale.is_contiguous() && B_scale.size(0) * group_size == k && B_scale.size(1) == B.size(1),
              "B_scale: contiguous [k/group_size, n]");
  TORCH_CHECK(!B_zp.has_value() || B_zp->numel() == 1, "B_zp: only the symmetric scalar form (or None)");
}

torch::Tensor out_or_accum(const torch::Tensor& A, int64_t m, int64_t n, const std::optional<torch::Tensor>& accum,
                           at::ScalarType dtype = at::kHalf) {
  if (!accum.has_value()) return at::empty({m, n}, A.options().dtype(dtype));
  auto& r = accum.value();
  TORCH_CHECK(r.scalar_type() == at::kHalf && r.dim() == 2 && r.size(0) == m && r.size(1) == n && r.stride(1) == 1,
              "accum: fp16 [m, n] with unit column stride");
  return r;
}

void run(primitive_ext& ext, dnnl::engine& engine, const torch::Tensor& A, const torch::Tensor& B,
         torch::Tensor& result, int arg_off) {
  std::vector<std::pair<int, void*>> args;
  args.reserve(8);
  args.emplace_back(DNNL_ARG_SRC, A.data_ptr());
  args.emplace_back(DNNL_ARG_WEIGHTS, B.data_ptr());
  args.emplace_back(DNNL_ARG_DST, result.data_ptr());
  int scratchpad_size = ext.get_scratchpad_size();
  torch::Tensor scratchpad = at::empty({scratchpad_size}, A.options().dtype(at::kByte), c10::nullopt);
  args.emplace_back(DNNL_ARG_SCRATCHPAD, scratchpad.data_ptr());
  ext.execute(GpuStreamManager::Instance().get_stream(), engine, std::move(args), arg_off);
}

void set_mem(primitive_ext& ext, int slot, int arg, const torch::Tensor& t, dnnl::engine& engine) {
  ext.set_attribute(slot, arg, t.data_ptr(), [&]() { return make_onednn_memory(get_onednn_md(t), engine, t.data_ptr()); });
}

}  // namespace

torch::Tensor b70_int4_gemm_w4a8(const torch::Tensor& A, const torch::Tensor& A_scale,
                                 const std::optional<torch::Tensor>& A_zp, const torch::Tensor& B,
                                 const torch::Tensor& B_scale, const std::optional<torch::Tensor>& B_zp,
                                 int64_t group_size, const std::optional<torch::Tensor>& accum, bool bf16_out) {
  const at::DeviceGuard device_guard(A.device());
  TORCH_CHECK(A.scalar_type() == at::kChar && A.dim() == 2 && A.stride(1) == 1, "A: int8 [m, k], row-major");
  const int64_t m = A.size(0), k = A.size(1), n = B.size(1);
  check_weights(B, B_scale, B_zp, k, group_size);
  TORCH_CHECK(A_scale.is_contiguous(), "A_scale must be contiguous");
  const bool per_token = A_scale.numel() == m;
  // B70_W4A8_AGROUP: per token AND per group of k/ng input channels, A_scale [m, ng] (ng > 1 divides k). oneDNN takes
  // it as source scales grouped {1, k/ng}; per token is the same with one group spanning k.
  const int64_t ng = (!per_token && A_scale.dim() == 2 && A_scale.size(0) == m) ? A_scale.size(1) : 1;
  TORCH_CHECK(per_token || ng > 1 || A_scale.numel() == 1, "A_scale: per token [m, 1], grouped [m, ng] or per tensor [1]");
  TORCH_CHECK(ng == 1 || (k % ng == 0 && !A_zp.has_value()), "grouped A_scale: ng must divide k; no source zero point");
  const bool a_zp = A_zp.has_value(), b_zp = B_zp.has_value(), sum = accum.has_value();
  TORCH_CHECK(!bf16_out || (!b_zp && !sum), "bf16_out: s4 weights (B_zp None) and no accum only");
  torch::Tensor result = out_or_accum(A, m, n, accum, bf16_out ? at::kBFloat16 : at::kHalf);

  auto f_attr = [&](primitive_attr& pattr) {
    pattr.set_scratchpad_mode(dnnl::scratchpad_mode::user);
    const int amask = (per_token || ng > 1) ? (1 << 0) + (1 << 1) : 0;
    const memory::dims agroups = per_token ? memory::dims{1, k} : ng > 1 ? memory::dims{1, k / ng} : memory::dims{};
    pattr.set_scales(DNNL_ARG_SRC, amask, agroups, get_onednn_dtype(A_scale));
    if (a_zp) pattr.set_zero_points(DNNL_ARG_SRC, amask, agroups, memory::data_type::s32);
    pattr.set_scales(DNNL_ARG_WEIGHTS, (1 << 0) + (1 << 1), {group_size, 1}, get_onednn_dtype(B_scale));
    if (b_zp) pattr.set_zero_points(DNNL_ARG_WEIGHTS, 0, {}, memory::data_type::s8);
    if (sum) {
      post_ops po;
      po.append_sum(1.f);
      pattr.set_post_ops(po);
    }
  };
  const int dev_id = c10::xpu::getCurrentXPUStream().device_index();
  auto& engine = GpuEngineManager::Instance().get_engine(at::Device(at::kXPU, dev_id));
  // the cache key holds shapes and strides but not the attributes: encode them here
  const int sc_key = int(B_scale.numel()) ^ ((per_token || ng > 1) ? 0 : (1 << 30));
  const int zp_key = (a_zp ? 1 : 0) | (b_zp ? 2 : 0) | (sum ? 4 : 0) | (int(ng > 1 ? ng : 0) << 3);
  // the templated overload: the runtime dispatcher only knows the upstream joint dtypes
  using F = decltype(f_attr);
  const auto bt = get_bias_type(std::nullopt, m, n);
  const int64_t lda = A.stride(0), ldb = B.stride(1) * 8, ldc = result.stride(0);
  auto& ext = b_zp ? matmul_primitive_create_and_cache<joint_dtypes_t::s8_int4, F>(
                         trans_type_t::nt, bt, m, n, k, lda, ldb, ldc, dev_id, f_attr, sc_key, zp_key)
               : bf16_out ? matmul_primitive_create_and_cache<b70_s8_s4_bf16, F>(
                         trans_type_t::nt, bt, m, n, k, lda, ldb, ldc, dev_id, f_attr, sc_key, zp_key)
                   : matmul_primitive_create_and_cache<b70_s8_s4, F>(
                         trans_type_t::nt, bt, m, n, k, lda, ldb, ldc, dev_id, f_attr, sc_key, zp_key);

  int arg_off = 0;
  set_mem(ext, arg_off++, DNNL_ARG_ATTR_SCALES | DNNL_ARG_SRC, A_scale, engine);
  if (a_zp) set_mem(ext, arg_off++, DNNL_ARG_ATTR_ZERO_POINTS | DNNL_ARG_SRC, A_zp.value(), engine);
  set_mem(ext, arg_off++, DNNL_ARG_ATTR_SCALES | DNNL_ARG_WEIGHTS, B_scale, engine);
  if (b_zp) set_mem(ext, arg_off++, DNNL_ARG_ATTR_ZERO_POINTS | DNNL_ARG_WEIGHTS, B_zp.value(), engine);
  run(ext, engine, A, B, result, arg_off);
  return result;
}

torch::Tensor b70_int4_gemm_w4a16(const torch::Tensor& A, const torch::Tensor& B, const torch::Tensor& B_scale,
                                  const std::optional<torch::Tensor>& B_zp, int64_t group_size) {
  const at::DeviceGuard device_guard(A.device());
  const bool bf = A.scalar_type() == at::kBFloat16;
  TORCH_CHECK((bf || A.scalar_type() == at::kHalf) && A.dim() == 2 && A.stride(1) == 1,
              "A: fp16 or bf16 [m, k], row-major");
  const int64_t m = A.size(0), k = A.size(1), n = B.size(1);
  check_weights(B, B_scale, B_zp, k, group_size);
  const bool b_zp = B_zp.has_value();
  torch::Tensor result = out_or_accum(A, m, n, std::nullopt, A.scalar_type());

  auto f_attr = [&](primitive_attr& pattr) {  // as upstream dnnl_matmul_w4a16_int4 (fp16 path)
    pattr.set_scratchpad_mode(dnnl::scratchpad_mode::user);
    pattr.set_scales(DNNL_ARG_WEIGHTS, (1 << 0) + (1 << 1), {group_size, 1}, get_onednn_dtype(B_scale));
    if (b_zp) pattr.set_zero_points(DNNL_ARG_WEIGHTS, 0, {}, memory::data_type::s8);
    pattr.set_fpmath_mode(bf ? dnnl::fpmath_mode::bf16 : dnnl::fpmath_mode::f16, true);
  };
  const int dev_id = c10::xpu::getCurrentXPUStream().device_index();
  auto& engine = GpuEngineManager::Instance().get_engine(at::Device(at::kXPU, dev_id));
  using F = decltype(f_attr);
  const auto bt = get_bias_type(std::nullopt, m, n);
  const int64_t lda = A.stride(0), ldb = B.stride(1) * 8, ldc = result.stride(0);
  auto& ext = bf ? (b_zp ? matmul_primitive_create_and_cache<joint_dtypes_t::bf16_int4, F>(
                              trans_type_t::nt, bt, m, n, k, lda, ldb, ldc, dev_id, f_attr, int(group_size), 1)
                        : matmul_primitive_create_and_cache<b70_bf16_s4, F>(
                              trans_type_t::nt, bt, m, n, k, lda, ldb, ldc, dev_id, f_attr, int(group_size), 0))
             : b_zp ? matmul_primitive_create_and_cache<joint_dtypes_t::f16_int4, F>(
                         trans_type_t::nt, bt, m, n, k, lda, ldb, ldc, dev_id, f_attr, int(group_size), 1)
                   : matmul_primitive_create_and_cache<b70_f16_s4, F>(
                         trans_type_t::nt, bt, m, n, k, lda, ldb, ldc, dev_id, f_attr, int(group_size), 0);

  int arg_off = 0;
  set_mem(ext, arg_off++, DNNL_ARG_ATTR_SCALES | DNNL_ARG_WEIGHTS, B_scale, engine);
  if (b_zp) set_mem(ext, arg_off++, DNNL_ARG_ATTR_ZERO_POINTS | DNNL_ARG_WEIGHTS, B_zp.value(), engine);
  run(ext, engine, A, B, result, arg_off);
  return result;
}

std::string b70_onednn_version() { return get_onednn_version(); }

TORCH_LIBRARY(k8v4_w4a8, m) {
  m.def("int4_gemm_w4a8(Tensor A, Tensor A_scale, Tensor? A_zp, Tensor B, Tensor B_scale, Tensor? B_zp, "
        "int group_size, Tensor(a!)? accum=None, bool bf16_out=False) -> Tensor");
  m.def("int4_gemm_w4a16(Tensor A, Tensor B, Tensor B_scale, Tensor? B_zp, int group_size) -> Tensor");
  m.def("onednn_version() -> str", &b70_onednn_version);
}

TORCH_LIBRARY_IMPL(k8v4_w4a8, XPU, m) {
  m.impl("int4_gemm_w4a8", &b70_int4_gemm_w4a8);
  m.impl("int4_gemm_w4a16", &b70_int4_gemm_w4a16);
}
