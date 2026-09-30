// Fused bottom-right causal SDPA for K8/V4 prefill. Separate from libxe2_kv.
//
// The graph pattern is adapted from exl3xpu (MIT License, Copyright (c) 2026 0xSero):
// https://github.com/0xSero/exl3xpu  csrc/exl3_ops.sycl, namespace sdpadnnl.
// MatMul, divide by 1/scale, bottom-right mask, softmax without stats, MatMul.
// Softmax stats are not requested: that partition materializes the scores.

#include <ATen/ATen.h>
#include <c10/xpu/XPUCachingAllocator.h>
#include <c10/xpu/XPUStream.h>
#include <torch/library.h>

#include <oneapi/dnnl/dnnl_graph.hpp>
#include <oneapi/dnnl/dnnl_graph_sycl.hpp>
#include <oneapi/dnnl/dnnl_sycl.hpp>

#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <limits>
#include <map>
#include <tuple>
#include <utility>
#include <vector>

namespace {

void *alloc_fn(size_t bytes, size_t, const void *, const void *) {
  return c10::xpu::XPUCachingAllocator::raw_alloc(bytes);
}

void free_fn(void *ptr, const void *, const void *, void *) {
  c10::xpu::XPUCachingAllocator::raw_delete(ptr);
}

using logical_tensor = dnnl::graph::logical_tensor;
using graph_op = dnnl::graph::op;

struct Engine {
  dnnl::engine eng;
  dnnl::stream stream;
};

struct Partition {
  dnnl::graph::compiled_partition compiled;
  std::vector<logical_tensor> inputs;
  std::vector<logical_tensor> outputs;
};

struct HostScale {
  at::Tensor divisor;
  at::Tensor neg_inf;
  double scale = 0;
  bool ready = false;
};

Engine &engine_for(sycl::queue &queue) {
  static std::map<void *, Engine> engines;
  void *key = static_cast<void *>(&queue);
  auto found = engines.find(key);
  if (found != engines.end()) {
    return found->second;
  }
  auto allocator = dnnl::graph::sycl_interop::make_allocator(alloc_fn, free_fn);
  auto eng = dnnl::graph::sycl_interop::make_engine_with_allocator(
      queue.get_device(), queue.get_context(), allocator);
  auto stream = dnnl::sycl_interop::make_stream(eng, queue);
  return engines.emplace(key, Engine{eng, stream}).first->second;
}

HostScale &scale_for(c10::DeviceIndex index) {
  static std::vector<HostScale> scales(8);
  TORCH_CHECK(index >= 0 && static_cast<size_t>(index) < scales.size(), "sdpa device");
  return scales[static_cast<size_t>(index)];
}

Partition &partition_for(Engine &engine, int64_t q_len, int64_t kv_len, int64_t hq, int64_t hk, int64_t dim) {
  using dt = logical_tensor::data_type;
  static std::map<std::tuple<int64_t, int64_t, int64_t, int64_t, int64_t>, Partition> cache;
  auto shape_key = std::make_tuple(q_len, kv_len, hq, hk, dim);
  auto found = cache.find(shape_key);
  if (found != cache.end()) {
    return found->second;
  }
  const int64_t group = hq / hk;
  size_t id = 0;
  logical_tensor query(id++, dt::f16, {1, hk, group, q_len, dim},
                       {hq * q_len * dim, group * q_len * dim, q_len * dim, dim, 1});
  logical_tensor key(id++, dt::f16, {1, hk, 1, kv_len, dim},
                     {hk * kv_len * dim, kv_len * dim, kv_len * dim, dim, 1});
  logical_tensor score(id++, dt::f32, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op bmm1(id++, graph_op::kind::MatMul, "bmm1");
  bmm1.set_attr<bool>(graph_op::attr::transpose_b, true);
  bmm1.add_inputs({query, key});
  bmm1.add_outputs({score});

  logical_tensor divisor(id++, dt::f16, logical_tensor::dims{1}, logical_tensor::layout_type::strided);
  logical_tensor scaled(id++, dt::f32, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op divide(id++, graph_op::kind::Divide, "scale");
  divide.add_inputs({score, divisor});
  divide.add_outputs({scaled});

  logical_tensor row(id++, dt::s32, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op row_index(id++, graph_op::kind::GenIndex, "row");
  row_index.set_attr<int64_t>(graph_op::attr::axis, -2);
  row_index.add_inputs({scaled});
  row_index.add_outputs({row});
  logical_tensor len_k_lt(id++, dt::s32, 0, logical_tensor::layout_type::strided,
                          logical_tensor::property_type::host_scalar);
  logical_tensor row_plus(id++, dt::s32, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op add(id++, graph_op::kind::Add, "row+L");
  add.add_inputs({row, len_k_lt});
  add.add_outputs({row_plus});
  logical_tensor len_q_lt(id++, dt::s32, 0, logical_tensor::layout_type::strided,
                          logical_tensor::property_type::host_scalar);
  logical_tensor row_adj(id++, dt::s32, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op sub(id++, graph_op::kind::Subtract, "-Q");
  sub.add_inputs({row_plus, len_q_lt});
  sub.add_outputs({row_adj});
  logical_tensor col(id++, dt::s32, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op col_index(id++, graph_op::kind::GenIndex, "col");
  col_index.set_attr<int64_t>(graph_op::attr::axis, -1);
  col_index.add_inputs({scaled});
  col_index.add_outputs({col});
  logical_tensor keep(id++, dt::boolean, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op compare(id++, graph_op::kind::GreaterEqual, "ge");
  compare.add_inputs({row_adj, col});
  compare.add_outputs({keep});
  logical_tensor neg_inf(id++, dt::f32, logical_tensor::dims{1}, logical_tensor::layout_type::strided);
  logical_tensor masked(id++, dt::f32, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op select(id++, graph_op::kind::Select, "sel");
  select.add_inputs({keep, scaled, neg_inf});
  select.add_outputs({masked});

  logical_tensor probs(id++, dt::f16, {1, hk, group, q_len, kv_len}, logical_tensor::layout_type::strided);
  graph_op softmax(id++, graph_op::kind::SoftMax, "softmax");
  softmax.set_attr<int64_t>(graph_op::attr::axis, -1);
  softmax.set_attr<std::string>(graph_op::attr::mode, "inf_as_zero");
  softmax.add_inputs({masked});
  softmax.add_outputs({probs});

  logical_tensor value(id++, dt::f16, {1, hk, 1, kv_len, dim},
                       {hk * kv_len * dim, kv_len * dim, kv_len * dim, dim, 1});
  logical_tensor output(id++, dt::f16, {1, hk, group, q_len, dim},
                        {hq * q_len * dim, group * q_len * dim, q_len * dim, dim, 1});
  graph_op bmm2(id++, graph_op::kind::MatMul, "bmm2");
  bmm2.add_inputs({probs, value});
  bmm2.add_outputs({output});

  dnnl::graph::graph graph(dnnl::engine::kind::gpu);
  for (graph_op *op : {&bmm1, &divide, &row_index, &add, &sub, &col_index, &compare, &select, &softmax, &bmm2}) {
    graph.add_op(*op);
  }
  graph.finalize();
  auto parts = graph.get_partitions();
  TORCH_CHECK(parts.size() == 1, "oneDNN SDPA pattern did not fuse (", parts.size(), " partitions)");
  std::vector<logical_tensor> inputs{query, key, divisor, len_k_lt, len_q_lt, neg_inf, value};
  std::vector<logical_tensor> outputs{output};
  auto t0 = std::chrono::steady_clock::now();
  auto compiled = parts[0].compile(inputs, outputs, engine.eng);
  auto ms = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::steady_clock::now() - t0).count();
  std::fprintf(stderr, "k8v4_sdpa compile q=%lld kv=%lld hq=%lld hk=%lld ms=%lld\n",
               static_cast<long long>(q_len), static_cast<long long>(kv_len), static_cast<long long>(hq),
               static_cast<long long>(hk), static_cast<long long>(ms));
  return cache.emplace(shape_key, Partition{std::move(compiled), std::move(inputs), std::move(outputs)}).first->second;
}

void sdpa_len(at::Tensor query, at::Tensor key, at::Tensor value, at::Tensor out, double scale, int64_t len_k,
              int64_t len_q) {
  TORCH_CHECK(query.scalar_type() == at::kHalf && key.scalar_type() == at::kHalf && value.scalar_type() == at::kHalf &&
                  out.scalar_type() == at::kHalf,
              "k8v4 sdpa expects fp16");
  TORCH_CHECK(query.is_contiguous() && key.is_contiguous() && value.is_contiguous() && out.is_contiguous(),
              "k8v4 sdpa expects contiguous tensors");
  TORCH_CHECK(query.dim() == 3 && key.dim() == 3 && value.dim() == 3 && out.sizes() == query.sizes(),
              "k8v4 sdpa shapes are [heads, rows, dim]");
  const int64_t hq = query.size(0);
  const int64_t q_len = query.size(1);
  const int64_t dim = query.size(2);
  const int64_t hk = key.size(0);
  const int64_t kv_len = key.size(1);
  TORCH_CHECK(value.sizes() == key.sizes(), "k and v shapes differ");
  TORCH_CHECK(hk > 0 && hq % hk == 0 && dim > 0, "bad gqa shape");
  TORCH_CHECK(len_k == kv_len && len_q == q_len, "len_k and len_q must match the tensor rows; do not pad keys");
  TORCH_CHECK(scale > 0.0, "scale");
  auto &queue = c10::xpu::getCurrentXPUStream(query.device().index()).queue();
  auto &engine = engine_for(queue);
  auto &part = partition_for(engine, q_len, kv_len, hq, hk, dim);
  auto &host = scale_for(query.device().index());
  if (!host.ready || host.scale != scale) {
    host.divisor = at::full({1}, static_cast<float>(1.0 / scale), query.options().dtype(at::kHalf));
    host.scale = scale;
    host.ready = true;
  }
  if (!host.neg_inf.defined()) {
    host.neg_inf = at::full({1}, -std::numeric_limits<float>::infinity(), query.options().dtype(at::kFloat));
  }
  int32_t len_k_i = static_cast<int32_t>(len_k);
  int32_t len_q_i = static_cast<int32_t>(len_q);
  using tensor = dnnl::graph::tensor;
  std::vector<tensor> inputs{
      tensor(part.inputs[0], engine.eng, query.data_ptr()),
      tensor(part.inputs[1], engine.eng, key.data_ptr()),
      tensor(part.inputs[2], engine.eng, host.divisor.data_ptr()),
      tensor::make_scalar_tensor(part.inputs[3], &len_k_i),
      tensor::make_scalar_tensor(part.inputs[4], &len_q_i),
      tensor(part.inputs[5], engine.eng, host.neg_inf.data_ptr()),
      tensor(part.inputs[6], engine.eng, value.data_ptr()),
  };
  std::vector<tensor> outputs{tensor(part.outputs[0], engine.eng, out.data_ptr())};
  dnnl::graph::sycl_interop::execute(part.compiled, engine.stream, inputs, outputs);
  // Host scalars are stack memory. The stream must finish reading them before return.
  engine.stream.wait();
}

}  // namespace

TORCH_LIBRARY(k8v4_sdpa, m) {
  m.def("sdpa_len(Tensor q, Tensor k, Tensor v, Tensor(a!) out, float scale, int len_k, int len_q) -> ()");
}

TORCH_LIBRARY_IMPL(k8v4_sdpa, XPU, m) {
  m.impl("sdpa_len", &sdpa_len);
}
