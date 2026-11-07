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
static constexpr int QSA_MAX_K = 1024;
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

struct QsaPick {
  float score;
  int block;
};

// Lower score is worse. Equal scores prefer the lower block id, so the
// higher id is the one a min-heap should evict. This matches the old scan,
// which only replaces a champion when the new score is strictly greater.
static bool qsa_worse(QsaPick a, QsaPick b) {
  if (a.score != b.score) return a.score < b.score;
  return a.block > b.block;
}

static void qsa_sift_down(QsaPick *heap, int n, int i) {
  while (true) {
    const int left = i * 2 + 1;
    const int right = left + 1;
    int smallest = i;
    if (left < n && qsa_worse(heap[left], heap[smallest])) smallest = left;
    if (right < n && qsa_worse(heap[right], heap[smallest])) smallest = right;
    if (smallest == i) break;
    const QsaPick tmp = heap[i];
    heap[i] = heap[smallest];
    heap[smallest] = tmp;
    i = smallest;
  }
}

// Select the top k into a min-heap; equal scores retain lower block ids.
static void qsa_select_heap(const float *row, int count, int k, QsaPick *heap) {
  for (int i = 0; i < k; ++i) {
    heap[i].score = row[i];
    heap[i].block = i;
  }
  for (int i = k / 2 - 1; i >= 0; --i) qsa_sift_down(heap, k, i);
  for (int block = k; block < count; ++block) {
    const QsaPick cur{row[block], block};
    if (!qsa_worse(heap[0], cur)) continue;
    heap[0] = cur;
    qsa_sift_down(heap, k, 0);
  }
}

// Public top-k also promises best-score order.
static void qsa_select_best_first(const float *row, int count, int k, QsaPick *heap) {
  qsa_select_heap(row, count, k, heap);
  for (int i = 1; i < k; ++i) {
    const QsaPick value = heap[i];
    int j = i;
    while (j > 0 && qsa_worse(heap[j - 1], value)) {
      heap[j] = heap[j - 1];
      --j;
    }
    heap[j] = value;
  }
}

// Visible ids need ascending block order, not score order. An in-place max
// heap avoids sorting by score and then doing quadratic insertion sort by id.
static void qsa_sift_id(int32_t *ids, int n, int root) {
  while (true) {
    const int left = root * 2 + 1, right = left + 1;
    int largest = root;
    if (left < n && ids[left] > ids[largest]) largest = left;
    if (right < n && ids[right] > ids[largest]) largest = right;
    if (largest == root) return;
    const int32_t tmp = ids[root]; ids[root] = ids[largest]; ids[largest] = tmp;
    root = largest;
  }
}

static void qsa_sort_ids(int32_t *ids, int n) {
  for (int i = n / 2 - 1; i >= 0; --i) qsa_sift_id(ids, n, i);
  for (int end = n - 1; end > 0; --end) {
    const int32_t tmp = ids[0]; ids[0] = ids[end]; ids[end] = tmp;
    qsa_sift_id(ids, end, 0);
  }
}

static void launch_topk(sycl::queue &q, const float *scores, int32_t *ids, int n_query,
                        int n_blocks, int k) {
  if (n_query < 1) return;
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>(static_cast<size_t>(n_query)), [=](sycl::id<1> id) {
      const int query_i = static_cast<int>(id);
      const float *row = scores + static_cast<size_t>(query_i) * n_blocks;
      int32_t *dst = ids + static_cast<size_t>(query_i) * k;
      QsaPick heap[QSA_MAX_K];
      qsa_select_best_first(row, n_blocks, k, heap);
      for (int i = 0; i < k; ++i) dst[i] = heap[i].block;
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
      QsaPick heap[QSA_MAX_K];
      qsa_select_heap(row, count, k, heap);
      for (int slot = 0; slot < k; ++slot) picked[slot] = heap[slot].block;
      qsa_sort_ids(picked, k);
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

// Decode has too few queries to occupy the GPU with one serial heap per row.
// Select independently in 2048-block shards, then merge their exact top-k
// candidates. A discarded block cannot be in the global top-k.
static void launch_visible_sharded(sycl::queue &q, const float *scores, const int32_t *counts,
                                   const int32_t *cells, int32_t *candidates, int32_t *chosen,
                                   int32_t *out, int nq, int nb, int k, int width, int ratio,
                                   int force, int shards) {
  constexpr int span=2048;
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>((size_t)nq*shards), [=](sycl::id<1> id) {
      const int row=id[0]/shards, shard=id[0]%shards;
      int32_t *dst=candidates+((int64_t)row*shards+shard)*k;
      const int count=counts[row], start=shard*span;
      if (force || count<=k || start>=count) {
        for (int i=0; i<k; ++i) dst[i]=-1;
        return;
      }
      const int n=sycl::min(span,count-start), take=sycl::min(k,n);
      QsaPick heap[QSA_MAX_K];
      qsa_select_heap(scores+(int64_t)row*nb+start,n,take,heap);
      for (int i=0; i<take; ++i) dst[i]=heap[i].block+start;
      for (int i=take; i<k; ++i) dst[i]=-1;
    });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>(nq), [=](sycl::id<1> id) {
      const int qi=id[0], count=counts[qi], cell=cells[qi];
      const int own=cell/ratio, own_width=cell%ratio+1;
      int32_t *tokens=out+(int64_t)qi*width;
      int written=0;
      if (force || count<=k) {
        for (int block=0; block<count; ++block)
          written=emit_block_tokens(tokens,written,width,block,block==own?own_width:ratio,ratio,cell);
        if (own>=count) emit_block_tokens(tokens,written,width,own,own_width,ratio,cell);
        return;
      }
      const int32_t *cand=candidates+(int64_t)qi*shards*k;
      const float *row=scores+(int64_t)qi*nb;
      QsaPick heap[QSA_MAX_K]; int used=0;
      for (int j=0; j<shards*k; ++j) {
        const int block=cand[j]; if (block<0) continue;
        const QsaPick cur{row[block],block};
        if (used<k) {
          heap[used++]=cur;
          if (used==k) for (int i=k/2-1; i>=0; --i) qsa_sift_down(heap,k,i);
        } else if (qsa_worse(heap[0],cur)) {
          heap[0]=cur; qsa_sift_down(heap,k,0);
        }
      }
      int32_t *picked=chosen+(int64_t)qi*k;
      for (int i=0; i<k; ++i) picked[i]=heap[i].block;
      qsa_sort_ids(picked,k);
      bool present=false;
      for (int i=0; i<k; ++i) if (picked[i]==own) present=true;
      bool emitted=present;
      for (int i=0; i<k; ++i) {
        if (!present && !emitted && own<picked[i]) {
          written=emit_block_tokens(tokens,written,width,own,own_width,ratio,cell); emitted=true;
        }
        written=emit_block_tokens(tokens,written,width,picked[i],picked[i]==own?own_width:ratio,ratio,cell);
      }
      if (!present && !emitted) emit_block_tokens(tokens,written,width,own,own_width,ratio,cell);
    });
  });
}

static uint32_t qsa_ordered_score(float score) {
  union {
    float f;
    uint32_t u;
  } bits{score};
  const uint32_t mask = (static_cast<int32_t>(bits.u) >> 31) ? 0xffffffffu : 0x80000000u;
  return bits.u ^ mask;
}

static void launch_visible_bucket(sycl::queue &q, const at::Tensor &score_tensor, const int32_t *counts,
                                  const int32_t *cells, int32_t *chosen, int32_t *out,
                                  int n_query, int n_blocks, int k, int width, int ratio) {
  const float *scores = score_tensor.data_ptr<float>();
  constexpr int threads = 16;
  constexpr int bins = 256;
  constexpr int bound_cap = 4096;
  auto opts_i = score_tensor.options().dtype(at::kInt);
  auto opts_f = score_tensor.options().dtype(at::kFloat);
  auto meta = at::zeros({n_query, 4}, opts_i);
  auto counters = at::zeros({n_query, 2}, opts_i);
  auto bound_ids = at::empty({n_query, bound_cap}, opts_i);
  auto bound_scores = at::empty({n_query, bound_cap}, opts_f);
  auto *meta_p = meta.data_ptr<int32_t>();
  auto *count_p = counters.data_ptr<int32_t>();
  auto *bound_i = bound_ids.data_ptr<int32_t>();
  auto *bound_s = bound_scores.data_ptr<float>();
  const sycl::range<1> local(threads);
  const sycl::range<1> global(static_cast<size_t>(n_query) * threads);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<int, 1> hist(sycl::range<1>(threads * bins), h);
    h.parallel_for(sycl::nd_range<1>(global, local), [=](sycl::nd_item<1> it) {
      const int tid = static_cast<int>(it.get_local_id(0));
      const int query = static_cast<int>(it.get_group(0));
      const int count = counts[query];
      int local_hist[256];
      for (int i = 0; i < bins; ++i) local_hist[i] = 0;
      const float *row = scores + static_cast<int64_t>(query) * n_blocks;
      for (int block = tid; block < count; block += threads) {
        const int bin = static_cast<int>(qsa_ordered_score(row[block]) >> 24);
        local_hist[bin] += 1;
      }
      for (int i = 0; i < bins; ++i) hist[tid * bins + i] = local_hist[i];
      sycl::group_barrier(it.get_group());
      if (tid == 0) {
        for (int bin = 0; bin < bins; ++bin) {
          int sum = 0;
          for (int t = 0; t < threads; ++t) sum += hist[t * bins + bin];
          hist[bin] = sum;
        }
      }
      sycl::group_barrier(it.get_group());
      if (tid == 0) {
        int above = 0;
        int boundary = 0;
        bool found = false;
        for (int bin = bins - 1; bin >= 0; --bin) {
          if (above + hist[bin] >= k) {
            boundary = bin;
            found = true;
            break;
          }
          above += hist[bin];
        }
        const int need = found ? k - above : 0;
        const int cap = found ? hist[boundary] : count;
        meta_p[query * 4 + 0] = boundary;
        meta_p[query * 4 + 1] = above;
        meta_p[query * 4 + 2] = need;
        meta_p[query * 4 + 3] = (!found || above > k) ? 1 : (cap > bound_cap ? 2 : 0);
        for (int i = 0; i < k; ++i) chosen[static_cast<int64_t>(query) * k + i] = -1;
      }
    });
  });
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<int, 1> hist(sycl::range<1>(bins), h);
    h.parallel_for(sycl::nd_range<1>(global, local), [=](sycl::nd_item<1> it) {
      const int tid = static_cast<int>(it.get_local_id(0));
      const int query = static_cast<int>(it.get_group(0));
      if (meta_p[query * 4 + 3] != 2) return;
      const int coarse = meta_p[query * 4];
      const int count = counts[query];
      for (int i = tid; i < bins; i += threads) hist[i] = 0;
      sycl::group_barrier(it.get_group());
      const float *row = scores + static_cast<int64_t>(query) * n_blocks;
      for (int block = tid; block < count; block += threads) {
        const uint32_t ordered = qsa_ordered_score(row[block]);
        if (static_cast<int>(ordered >> 24) != coarse) continue;
        const int bin = static_cast<int>((ordered >> 16) & 255);
        sycl::atomic_ref<int, sycl::memory_order::relaxed, sycl::memory_scope::work_group,
                         sycl::access::address_space::local_space>
            slot(hist[bin]);
        slot.fetch_add(1);
      }
      sycl::group_barrier(it.get_group());
      if (tid == 0) {
        int above = meta_p[query * 4 + 1];
        int sub = 0;
        bool found = false;
        for (int bin = bins - 1; bin >= 0; --bin) {
          if (above + hist[bin] >= k) {
            sub = bin;
            found = true;
            break;
          }
          above += hist[bin];
        }
        const int need = found ? k - above : 0;
        const int cap = found ? hist[sub] : count;
        meta_p[query * 4 + 0] = (coarse << 8) | sub;
        meta_p[query * 4 + 1] = above;
        meta_p[query * 4 + 2] = need;
        meta_p[query * 4 + 3] = (!found || cap > bound_cap || above > k) ? 1 : 2;
      }
    });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(global, local), [=](sycl::nd_item<1> it) {
      const int tid = static_cast<int>(it.get_local_id(0));
      const int query = static_cast<int>(it.get_group(0));
      const int mode = meta_p[query * 4 + 3];
      if (mode == 1) return;
      const int boundary = meta_p[query * 4];
      const int shift = mode == 2 ? 16 : 24;
      const int count = counts[query];
      const float *row = scores + static_cast<int64_t>(query) * n_blocks;
      for (int block = tid; block < count; block += threads) {
        const int bin = static_cast<int>(qsa_ordered_score(row[block]) >> shift);
        if (bin > boundary) {
          sycl::atomic_ref<int, sycl::memory_order::relaxed, sycl::memory_scope::device,
                           sycl::access::address_space::global_space>
              fill(count_p[query * 2]);
          const int slot = fill.fetch_add(1);
          if (slot >= 0 && slot < k) chosen[static_cast<int64_t>(query) * k + slot] = block;
        } else if (bin == boundary) {
          sycl::atomic_ref<int, sycl::memory_order::relaxed, sycl::memory_scope::device,
                           sycl::access::address_space::global_space>
              fill(count_p[query * 2 + 1]);
          const int slot = fill.fetch_add(1);
          if (slot >= 0 && slot < bound_cap) {
            bound_i[static_cast<int64_t>(query) * bound_cap + slot] = block;
            bound_s[static_cast<int64_t>(query) * bound_cap + slot] = row[block];
          }
        }
      }
    });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>(static_cast<size_t>(n_query)), [=](sycl::id<1> id) {
      const int query = static_cast<int>(id);
      const int count = counts[query];
      const int cell = cells[query];
      const int own = cell / ratio;
      const int own_width = cell % ratio + 1;
      int32_t *tokens = out + static_cast<int64_t>(query) * width;
      int32_t *picked = chosen + static_cast<int64_t>(query) * k;
      const float *row = scores + static_cast<int64_t>(query) * n_blocks;
      const bool fallback = meta_p[query * 4 + 3] != 0 || count_p[query * 2 + 1] > bound_cap;
      if (fallback || count <= k) {
        QsaPick heap[QSA_MAX_K];
        const int use = count < k ? count : k;
        if (count <= k) {
          for (int block = 0; block < count; ++block) picked[block] = block;
          for (int block = count; block < k; ++block) picked[block] = -1;
        } else {
          qsa_select_heap(row, count, k, heap);
          for (int slot = 0; slot < k; ++slot) picked[slot] = heap[slot].block;
        }
      } else {
        const int above = meta_p[query * 4 + 1];
        const int need = meta_p[query * 4 + 2];
        const int bound_count = count_p[query * 2 + 1];
        const int32_t *ids = bound_i + static_cast<int64_t>(query) * bound_cap;
        const float *vals = bound_s + static_cast<int64_t>(query) * bound_cap;
        if (need > 0 && bound_count > 0) {
          QsaPick heap[QSA_MAX_K];
          const int take = need < bound_count ? need : bound_count;
          for (int i = 0; i < take; ++i) {
            heap[i].score = vals[i];
            heap[i].block = ids[i];
          }
          for (int i = take / 2 - 1; i >= 0; --i) qsa_sift_down(heap, take, i);
          for (int i = take; i < bound_count; ++i) {
            const QsaPick cur{vals[i], ids[i]};
            if (!qsa_worse(heap[0], cur)) continue;
            heap[0] = cur;
            qsa_sift_down(heap, take, 0);
          }
          for (int i = 0; i < take; ++i) picked[above + i] = heap[i].block;
          for (int i = above + take; i < k; ++i) picked[i] = -1;
        }
      }
      int live = 0;
      for (int i = 0; i < k; ++i) {
        if (picked[i] >= 0) picked[live++] = picked[i];
      }
      qsa_sort_ids(picked, live);
      int written = 0;
      bool present = false;
      for (int i = 0; i < live; ++i) {
        if (picked[i] == own) present = true;
      }
      bool emitted_own = present;
      for (int i = 0; i < live; ++i) {
        if (!present && !emitted_own && own < picked[i]) {
          written = emit_block_tokens(tokens, written, width, own, own_width, ratio, cell);
          emitted_own = true;
        }
        const int block = picked[i];
        written = emit_block_tokens(tokens, written, width, block, block == own ? own_width : ratio, ratio, cell);
      }
      if (!present && !emitted_own) {
        emit_block_tokens(tokens, written, width, own, own_width, ratio, cell);
      }
    });
  });
  auto host = meta.to(at::kCPU);
  const int32_t *mp = host.data_ptr<int32_t>();
  int fb = 0;
  for (int i = 0; i < n_query; ++i) if (mp[i * 4 + 3] == 1) ++fb;
  printf("qsa_bucket_fallback %d/%d\n", fb, n_query);
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
  TORCH_CHECK(k >= 1 && k <= QSA_MAX_K && ratio >= 1, "qsa_visible k and ratio");
  TORCH_CHECK(counts.size(0) == scores.size(0) && cells.size(0) == scores.size(0) &&
                  out.size(0) == scores.size(0),
              "qsa_visible query count");
  TORCH_CHECK(out.size(1) >= 1, "qsa_visible width");
  const int n_query = static_cast<int>(scores.size(0));
  const int n_blocks = static_cast<int>(scores.size(1));
  TORCH_CHECK(n_blocks >= 1, "qsa_visible needs at least one score column");
  auto scratch = at::empty({scores.size(0), k}, scores.options().dtype(at::kInt));
if (n_query <= 16 && n_blocks >= 4096) {
    const int shards=(n_blocks+2047)/2048;
    auto candidates=at::empty({n_query, shards, k}, scores.options().dtype(at::kInt));
    launch_visible_sharded(current_xpu_queue(), scores.data_ptr<float>(), counts.data_ptr<int32_t>(),
                   cells.data_ptr<int32_t>(), candidates.data_ptr<int32_t>(), scratch.data_ptr<int32_t>(),
                   out.data_ptr<int32_t>(), n_query, n_blocks, static_cast<int>(k),
                   static_cast<int>(out.size(1)), static_cast<int>(ratio), force != 0, shards);
  } else launch_visible(current_xpu_queue(), scores.data_ptr<float>(), counts.data_ptr<int32_t>(),
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

static void qsa_score_paged(const at::Tensor &query, const at::Tensor &pooled,
                            const at::Tensor &valid, const at::Tensor &block_row,
                            const at::Tensor &counts, at::Tensor scores, int64_t ratio) {
  for (const auto &t : {query, pooled, valid, block_row, counts, scores}) {
    check_xpu(t, "qsa_score_paged tensor");
    TORCH_CHECK(t.is_contiguous() && t.device()==query.device(), "QSA paged score device/layout");
  }
  TORCH_CHECK(query.scalar_type()==at::kFloat && pooled.scalar_type()==at::kFloat &&
              valid.scalar_type()==at::kBool && block_row.scalar_type()==at::kInt &&
              counts.scalar_type()==at::kInt && scores.scalar_type()==at::kFloat, "QSA paged score dtypes");
  TORCH_CHECK(query.dim()==3 && query.size(1)==IDX_HEADS && query.size(2)==D_IDX &&
              pooled.dim()==2 && pooled.size(1)==D_IDX && valid.numel()==pooled.size(0) &&
              block_row.dim()==1 && counts.dim()==1 && scores.dim()==2 &&
              counts.size(0)==query.size(0) && scores.size(0)==query.size(0) && ratio>=1,
              "QSA paged score shapes");
  const int nq=query.size(0), nb=scores.size(1), np=pooled.size(0), bt_n=block_row.size(0);
  TORCH_CHECK(nb>0 && ((int64_t)nb*4+PAGE-1)/PAGE <= (int64_t)bt_n*ratio, "QSA score block table capacity");
  const auto *qp=query.data_ptr<float>(); const auto *kp=pooled.data_ptr<float>();
  const auto *ok=valid.data_ptr<bool>(); const auto *bt=block_row.data_ptr<int32_t>();
  const auto *ct=counts.data_ptr<int32_t>(); auto *dst=scores.data_ptr<float>();
  auto &queue=current_xpu_queue();
  const int ratio_i = static_cast<int>(ratio);
  if (nq <= 16) {
    // Decode. One subgroup per block, every query shares that key.
    // The old launch read the same 512-byte key once per query.
    constexpr int WG = 256;
    constexpr int nsg = WG / SG;
    const int nchunks = (nb + nsg - 1) / nsg;
    const int qwords = nq * IDX_HEADS * D_IDX;
    queue.submit([&](sycl::handler &h) {
      sycl::local_accessor<float, 1> qslm(sycl::range<1>(qwords), h);
      h.parallel_for(sycl::nd_range<1>(sycl::range<1>((size_t)nchunks * WG), sycl::range<1>(WG)),
        [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(SG)]] {
          const int lane = (int)it.get_local_id(0);
          const int chunk = (int)it.get_group(0);
          const int sg_id = lane / SG;
          const int sg_lane = lane - sg_id * SG;
          for (int i = lane; i < qwords; i += WG) qslm[i] = qp[i];
          it.barrier(sycl::access::fence_space::local_space);
          const int block = chunk * nsg + sg_id;
          if (block >= nb) return;
          const int tok = block * 4, logical = tok / PAGE, off = tok % PAGE;
          const int page = ratio_i == 1 ? bt[logical] : bt[logical / ratio_i] * ratio_i + logical % ratio_i;
          const int64_t micro = ((int64_t)page * PAGE + off) / 4;
          const bool bad = page < 0 || micro < 0 || micro >= np || !ok[micro];
          float key[8];
          if (!bad) {
            const float *src = kp + micro * D_IDX + sg_lane * 8;
            #pragma unroll
            for (int d = 0; d < 8; ++d) key[d] = src[d];
          }
          auto sg = it.get_sub_group();
          for (int qi = 0; qi < nq; ++qi) {
            if (block >= ct[qi] || bad) {
              if (sg_lane == 0) dst[(int64_t)qi * nb + block] = -INFINITY;
              continue;
            }
            float total = 0.f;
            #pragma unroll
            for (int head = 0; head < IDX_HEADS; ++head) {
              float dot = 0.f;
              const int base = (qi * IDX_HEADS + head) * D_IDX + sg_lane * 8;
              #pragma unroll
              for (int d = 0; d < 8; ++d) dot += qslm[base + d] * key[d];
              dot = sycl::reduce_over_group(sg, dot, sycl::plus<float>());
              total += sycl::fmax(dot, 0.f);
            }
            if (sg_lane == 0) dst[(int64_t)qi * nb + block] = total;
          }
        });
    });
  } else {
    queue.submit([&](sycl::handler &h) {
      h.parallel_for(sycl::nd_range<1>(sycl::range<1>((size_t)nq * nb * SG), sycl::range<1>(SG)),
        [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(SG)]] {
          const int pair = it.get_group(0), qi = pair / nb, block = pair % nb, lane = it.get_local_id(0);
          const int tok = block * 4, logical = tok / PAGE, off = tok % PAGE;
          const int page = ratio_i == 1 ? bt[logical] : bt[logical / ratio_i] * ratio_i + logical % ratio_i;
          const int64_t micro = ((int64_t)page * PAGE + off) / 4;
          if (block >= ct[qi] || page < 0 || micro < 0 || micro >= np || !ok[micro]) {
            if (lane == 0) dst[(int64_t)qi * nb + block] = -INFINITY;
            return;
          }
          auto sg = it.get_sub_group();
          float total = 0.f;
          for (int head = 0; head < IDX_HEADS; ++head) {
            float dot = 0.f;
            for (int d = 0; d < 8; ++d) {
              const int dim = lane * 8 + d;
              dot += qp[((int64_t)qi * IDX_HEADS + head) * D_IDX + dim] * kp[micro * D_IDX + dim];
            }
            dot = sycl::reduce_over_group(sg, dot, sycl::plus<float>());
            total += sycl::fmax(dot, 0.f);
          }
          if (lane == 0) dst[(int64_t)qi * nb + block] = total;
        });
    });
  }
}

static void qsa_topk(const at::Tensor &scores, at::Tensor ids, int64_t k) {
  check_xpu(scores, "scores");
  check_xpu(ids, "ids");
  TORCH_CHECK(scores.is_contiguous() && ids.is_contiguous(), "qsa_topk tensors must be contiguous");
  TORCH_CHECK(scores.scalar_type() == at::kFloat && ids.scalar_type() == at::kInt, "qsa_topk dtypes");
  TORCH_CHECK(scores.dim() == 2 && ids.dim() == 2, "qsa_topk ranks");
  TORCH_CHECK(k >= 1 && k <= QSA_MAX_K && ids.size(1) == k && ids.size(0) == scores.size(0),
              "qsa_topk shape");
  const int n_blocks = static_cast<int>(scores.size(1));
  TORCH_CHECK(n_blocks >= 1 && k <= n_blocks, "qsa_topk k is at most the block count");
  launch_topk(current_xpu_queue(), scores.data_ptr<float>(), ids.data_ptr<int32_t>(),
              static_cast<int>(scores.size(0)), n_blocks, static_cast<int>(k));
}

// Copy the selected quantized rows without a lossy dequantize/requantize pass.
// The visible row is a contiguous prefix followed by -1 padding.
static void qsa_pack_kv(const at::Tensor &k, const at::Tensor &ks,
                        const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                        const at::Tensor &block_row, const at::Tensor &visible,
                        at::Tensor dk, at::Tensor dks, at::Tensor dv, at::Tensor dvs,
                        at::Tensor dvz, at::Tensor lengths, int64_t ratio) {
  for (const auto &t : {k, ks, v, vs, vz, block_row, visible, dk, dks, dv, dvs, dvz, lengths})
    check_xpu(t, "qsa_pack_kv tensor");
  TORCH_CHECK(k.scalar_type() == at::kChar && dk.scalar_type() == at::kChar &&
              v.scalar_type() == at::kByte && dv.scalar_type() == at::kByte, "cache dtypes");
  TORCH_CHECK(ks.scalar_type() == at::kFloat && vs.scalar_type() == at::kFloat &&
              vz.scalar_type() == at::kFloat && dks.scalar_type() == at::kFloat &&
              dvs.scalar_type() == at::kFloat && dvz.scalar_type() == at::kFloat, "scale dtypes");
  TORCH_CHECK(k.dim() == 4 && dk.dim() == 4 && v.dim() == 4 && dv.dim() == 4 &&
              k.size(1) == PAGE && dk.size(1) == PAGE && k.size(3) == D_ATTN &&
              dk.size(3) == D_ATTN && v.size(3) == V4_COLS && dv.size(3) == V4_COLS &&
              k.size(2) == dk.size(2), "cache shapes");
  TORCH_CHECK(block_row.scalar_type() == at::kInt && block_row.dim() == 1 &&
              visible.scalar_type() == at::kInt && visible.dim() == 1 &&
              lengths.scalar_type() == at::kInt && lengths.numel() >= 2 &&
              lengths.is_contiguous() && ratio >= 1, "index shapes");
  const int width = static_cast<int>(visible.numel());
  TORCH_CHECK(width > 0 && dk.size(0) * PAGE >= width, "destination capacity");
  const int heads = static_cast<int>(k.size(2));
  auto &queue = current_xpu_queue();
  const auto sk = strides_of(k), sks = strides_of(ks), sv = strides_of(v);
  const auto svs = strides_of(vs), svz = strides_of(vz);
  const auto tk = strides_of(dk), tks = strides_of(dks), tv = strides_of(dv);
  const auto tvs = strides_of(dvs), tvz = strides_of(dvz);
  const auto *ki = k.data_ptr<int8_t>(); const auto *ksi = ks.data_ptr<float>();
  const auto *vi = v.data_ptr<uint8_t>(); const auto *vsi = vs.data_ptr<float>();
  const auto *vzi = vz.data_ptr<float>(); const auto *bt = block_row.data_ptr<int32_t>();
  const auto *ids = visible.data_ptr<int32_t>(); auto *ko = dk.data_ptr<int8_t>();
  auto *kso = dks.data_ptr<float>(); auto *vo = dv.data_ptr<uint8_t>();
  auto *vso = dvs.data_ptr<float>(); auto *vzo = dvz.data_ptr<float>();
  auto *lens = lengths.data_ptr<int32_t>();
  const auto bs = block_row.stride(0), is = visible.stride(0);
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::range<1>(static_cast<size_t>(width) * heads * D_ATTN), [=](sycl::id<1> id) {
      const size_t x = id[0];
      const int d = x % D_ATTN, head = (x / D_ATTN) % heads;
      const int slot = x / (D_ATTN * heads), token = ids[slot * is];
      if (token < 0) return;
      const int logical = token / PAGE, off = token % PAGE;
      const int phys = ratio == 1 ? bt[logical * bs] :
          bt[(logical / ratio) * bs] * ratio + logical % ratio;
      const int dp = slot / PAGE, dt = slot % PAGE;
      ko[dp*tk.s0 + dt*tk.s1 + head*tk.s2 + d*tk.s3] =
          ki[phys*sk.s0 + off*sk.s1 + head*sk.s2 + d*sk.s3];
      if (d < V4_COLS)
        vo[dp*tv.s0 + dt*tv.s1 + head*tv.s2 + d*tv.s3] =
            vi[phys*sv.s0 + off*sv.s1 + head*sv.s2 + d*sv.s3];
      if (d == 0) {
        kso[dp*tks.s0 + dt*tks.s1 + head*tks.s2] = ksi[phys*sks.s0 + off*sks.s1 + head*sks.s2];
        vso[dp*tvs.s0 + dt*tvs.s1 + head*tvs.s2] = vsi[phys*svs.s0 + off*svs.s1 + head*svs.s2];
        vzo[dp*tvz.s0 + dt*tvz.s1 + head*tvz.s2] = vzi[phys*svz.s0 + off*svz.s1 + head*svz.s2];
      }
    });
  });
  queue.submit([&](sycl::handler &h) {
    h.single_task([=]() {
      int count = 0;
      while (count < width && ids[count * is] >= 0) ++count;
      lens[0] = count; lens[1] = count;
    });
  });
}

// Split-key sparse attention: one subgroup handles one query/head/split,
// reading selected K8/V4 cells directly. Partial online softmax is combined
// by a second kernel; no selected K/V staging or re-quantization is needed.
// Decode-sized indexer cache update. Resolve repeated slots by last write,
// then pool each touched four-token block once, as in build_qsa_blk_update.
static void qsa_cache_update(const at::Tensor &slots, const at::Tensor &keys,
                             const at::Tensor &positions, const at::Tensor &weight,
                             const at::Tensor &freqs, at::Tensor raw, at::Tensor pos_cache,
                             at::Tensor filled, at::Tensor pooled, at::Tensor valid, double eps,
                             at::Tensor counter) {
  for (const auto &t : {slots, keys, positions, weight, freqs, raw, pos_cache, filled, pooled, valid, counter}) {
    check_xpu(t, "qsa_cache_update tensor");
    TORCH_CHECK(t.device() == slots.device(), "QSA cache tensors must share a device");
  }
  TORCH_CHECK(raw.is_contiguous() && pos_cache.is_contiguous() && filled.is_contiguous() &&
              pooled.is_contiguous() && valid.is_contiguous() && freqs.is_contiguous(),
              "QSA cache outputs must be contiguous");
  TORCH_CHECK(slots.scalar_type()==at::kLong && keys.scalar_type()==at::kFloat &&
              (positions.scalar_type()==at::kInt || positions.scalar_type()==at::kLong) &&
              weight.scalar_type()==at::kFloat &&
              freqs.scalar_type()==at::kFloat && raw.scalar_type()==at::kFloat &&
              pos_cache.scalar_type()==at::kInt && filled.scalar_type()==at::kBool &&
              pooled.scalar_type()==at::kFloat && valid.scalar_type()==at::kBool &&
              counter.scalar_type()==at::kInt && counter.numel()>=1, "QSA cache dtypes");
  const int n=slots.numel(), nslots=raw.size(0);
  TORCH_CHECK(n>0 && n<=128 && slots.dim()==1 && keys.sizes()==at::IntArrayRef({n, D_IDX}) &&
              positions.sizes()==at::IntArrayRef({n, 4}) && weight.numel()==D_IDX && freqs.numel()==32 &&
              raw.dim()==2 && raw.size(1)==D_IDX && nslots%4==0 &&
              pos_cache.sizes()==at::IntArrayRef({nslots,4}) && filled.numel()==nslots &&
              pooled.sizes()==at::IntArrayRef({nslots/4,D_IDX}) && valid.numel()==nslots/4 && eps>0,
              "QSA cache shapes");
  const auto *sp=slots.data_ptr<int64_t>(); const auto *kp=keys.data_ptr<float>();
  const bool pos64 = positions.scalar_type()==at::kLong;
  const auto *pp32 = pos64 ? nullptr : positions.data_ptr<int32_t>();
  const auto *pp64 = pos64 ? positions.data_ptr<int64_t>() : nullptr;
  const auto *wp=weight.data_ptr<float>();
  const int64_t s_slot=slots.stride(0), s_k0=keys.stride(0), s_k1=keys.stride(1);
  const int64_t s_p0=positions.stride(0), s_p1=positions.stride(1), s_w=weight.stride(0);
  const auto *fp=freqs.data_ptr<float>(); auto *rp=raw.data_ptr<float>();
  auto *pc=pos_cache.data_ptr<int32_t>(); auto *fc=filled.data_ptr<bool>();
  auto *po=pooled.data_ptr<float>(); auto *pv=valid.data_ptr<bool>();
  auto *hits=counter.data_ptr<int32_t>();
  auto &queue=current_xpu_queue();
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>((size_t)n*16), sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int i=it.get_group(0), lane=it.get_local_id(0); const int64_t slot=sp[i*s_slot];
        if (slot<0 || slot>=nslots) return;
        for (int j=i+1; j<n; ++j) if (sp[j*s_slot]==slot) return;
        for (int d=lane; d<D_IDX; d+=16) rp[slot*D_IDX+d]=kp[(int64_t)i*s_k0+d*s_k1];
        if (lane<4) pc[slot*4+lane]=pos64 ? static_cast<int32_t>(pp64[i*s_p0+lane*s_p1]) : pp32[i*s_p0+lane*s_p1];
        if (lane==0) fc[slot]=true;
      });
  });
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>((size_t)n*16), sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int i=it.get_group(0), lane=it.get_local_id(0); const int64_t slot=sp[i*s_slot];
        if (slot<0 || slot>=nslots) return;
        const int64_t micro=slot/4;
        for (int j=0; j<i; ++j) { const int64_t other=sp[j*s_slot]; if (other>=0 && other<nslots && other/4==micro) return; }
        const int64_t first=micro*4;
        const bool complete=fc[first] && fc[first+1] && fc[first+2] && fc[first+3];
        if (lane==0) pv[micro]=complete;
        if (!complete) return;
        auto sg=it.get_sub_group(); float x[8]; float sum=0.f;
        for (int j=0; j<8; ++j) {
          const int d=lane*8+j;
          x[j]=(rp[(first+0)*D_IDX+d]+rp[(first+1)*D_IDX+d]+
                rp[(first+2)*D_IDX+d]+rp[(first+3)*D_IDX+d])*0.25f;
          sum+=x[j]*x[j];
        }
        const float inv=sycl::rsqrt(sycl::reduce_over_group(sg,sum,sycl::plus<float>())/D_IDX+(float)eps);
        for (int j=0; j<8; ++j) {
          const int d=lane*8+j; x[j]=x[j]*inv*wp[d*s_w];
        }
        for (int j=0; j<8; ++j) {
          const int d=lane*8+j;
          const float other=sycl::select_from_group(sg,x[j],(uint32_t)(lane^4));
          float result=x[j];
          if (d<64) {
            const int pair=d%32, axis=pair%3;
            const float angle=(float)pc[first*4+axis]*fp[pair];
            const float c=sycl::cos(angle), s=sycl::sin(angle);
            result=d<32 ? x[j]*c-other*s : other*s+x[j]*c;
          }
          po[micro*D_IDX+d]=result;
        }
      });
  });
  // One hit per full-attention layer. Replay of a full graph does not
  // re-enter Python, so the counter is the decode sparse_ok source.
  queue.submit([&](sycl::handler &h) {
    h.single_task([=]() { hits[0] += 1; });
  });
}

static void qsa_direct_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                            const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                            const at::Tensor &block_row, const at::Tensor &visible,
                            at::Tensor partial, at::Tensor ml, at::Tensor out,
                            int64_t ratio, int64_t split_width) {
  for (const auto &t : {query, k, ks, v, vs, vz, block_row, visible, partial, ml, out})
    check_xpu(t, "qsa_direct_attn tensor");
  TORCH_CHECK(query.scalar_type() == at::kHalf && out.scalar_type() == at::kHalf &&
              k.scalar_type() == at::kChar && v.scalar_type() == at::kByte &&
              ks.scalar_type() == at::kFloat && vs.scalar_type() == at::kFloat &&
              vz.scalar_type() == at::kFloat && block_row.scalar_type() == at::kInt &&
              visible.scalar_type() == at::kInt && partial.scalar_type() == at::kFloat &&
              ml.scalar_type() == at::kFloat, "QSA direct dtypes");
  TORCH_CHECK(query.dim() == 3 && query.size(2) == D_ATTN && out.sizes() == query.sizes() &&
              k.dim() == 4 && k.size(1) == PAGE && k.size(3) == D_ATTN &&
              v.dim() == 4 && v.size(3) == V4_COLS && block_row.dim() == 1 &&
              visible.dim() == 2 && visible.size(0) == query.size(0) && ratio >= 1 &&
              split_width >= 1 && partial.is_contiguous() && ml.is_contiguous(), "QSA direct shapes");
  const int nq=query.size(0), hq=query.size(1), hkv=k.size(2), width=visible.size(1);
  TORCH_CHECK(hkv > 0 && hq % hkv == 0 && width > 0, "QSA direct heads or width");
  const int ns=(width + split_width - 1)/split_width;
  TORCH_CHECK(partial.numel() == (int64_t)nq*hq*ns*D_ATTN &&
              ml.numel() == (int64_t)nq*hq*ns*2, "QSA direct workspace size");
  auto &queue=current_xpu_queue();
  const auto qs=strides_of(query), ks0=strides_of(k), kss=strides_of(ks),
             vs0=strides_of(v), vss=strides_of(vs), vzs=strides_of(vz), os=strides_of(out);
  const auto *qp=reinterpret_cast<const sycl::half *>(query.data_ptr());
  const auto *kp=k.data_ptr<int8_t>(); const auto *ksp=ks.data_ptr<float>();
  const auto *vp=v.data_ptr<uint8_t>(); const auto *vsp=vs.data_ptr<float>();
  const auto *vzp=vz.data_ptr<float>(); const auto *bt=block_row.data_ptr<int32_t>();
  const auto *ids=visible.data_ptr<int32_t>(); auto *acc=partial.data_ptr<float>();
  auto *stats=ml.data_ptr<float>(); auto *dst=reinterpret_cast<sycl::half *>(out.data_ptr());
  const int64_t bs=block_row.stride(0), ir=visible.stride(0), ic=visible.stride(1);
  const int gqa=hq/hkv;
  constexpr int lanes=16, dims=D_ATTN/lanes;
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>((size_t)nq*hq*ns*lanes), sycl::range<1>(lanes)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int lane=it.get_local_id(0), group=it.get_group(0), split=group%ns;
        const int head=(group/ns)%hq, qi=group/(ns*hq), kh=head/gqa;
        auto sg=it.get_sub_group();
        float qv[dims], av[dims];
        for (int d=0; d<dims; ++d) {
          qv[d]=(float)qp[qi*qs.s0+head*qs.s1+(lane*dims+d)*qs.s2]; av[d]=0.f;
        }
        float m=-INFINITY, l=0.f;
        const int end=sycl::min(width, (split+1)*(int)split_width);
        for (int pos=split*(int)split_width; pos<end; ++pos) {
          const int token=ids[qi*ir+pos*ic];
          if (token < 0) continue;
          const int logical=token/PAGE, off=token%PAGE;
          const int phys=ratio==1 ? bt[logical*bs] : bt[(logical/ratio)*bs]*ratio+logical%ratio;
          const int64_t ko=phys*ks0.s0+off*ks0.s1+kh*ks0.s2;
          float dot=0.f;
          if (ks0.s3 == 1) {
            const auto *src = reinterpret_cast<const uint32_t *>(kp + ko + (int64_t)lane * dims);
            #pragma unroll
            for (int w = 0; w < 4; ++w) {
              const uint32_t word = src[w];
              #pragma unroll
              for (int b = 0; b < 4; ++b) {
                const int8_t kval = static_cast<int8_t>(static_cast<uint8_t>(word >> (8 * b)));
                dot += qv[w * 4 + b] * static_cast<float>(kval);
              }
            }
          } else {
            for (int d=0; d<dims; ++d) dot += qv[d]*(float)kp[ko+(lane*dims+d)*ks0.s3];
          }
          dot=sycl::reduce_over_group(sg, dot, sycl::plus<float>());
          const float score=dot*ksp[phys*kss.s0+off*kss.s1+kh*kss.s2]*INV_SQRT_D;
          const float nm=sycl::fmax(m, score), a=m==-INFINITY ? 0.f : sycl::exp(m-nm);
          const float p=sycl::exp(score-nm);
          const int64_t vo=phys*vs0.s0+off*vs0.s1+kh*vs0.s2;
          const float scale=vsp[phys*vss.s0+off*vss.s1+kh*vss.s2];
          const float zero=vzp[phys*vzs.s0+off*vzs.s1+kh*vzs.s2];
          if (vs0.s3 == 1) {
            const auto *src = reinterpret_cast<const uint32_t *>(vp + vo + (int64_t)lane * dims / 2);
            const uint32_t w0 = src[0], w1 = src[1];
            #pragma unroll
            for (int b = 0; b < 8; ++b) {
              const uint32_t word = b < 4 ? w0 : w1;
              const int shift = (b & 3) * 8;
              const uint8_t packed = static_cast<uint8_t>(word >> shift);
              const float even = (float)(packed & 15) - zero;
              const float odd = (float)(packed >> 4) - zero;
              av[b * 2] = av[b * 2] * a + p * even * scale;
              av[b * 2 + 1] = av[b * 2 + 1] * a + p * odd * scale;
            }
          } else {
            for (int d=0; d<dims; ++d) {
              const int dim=lane*dims+d; const uint8_t packed=vp[vo+(dim/2)*vs0.s3];
              const int nib=(dim&1) ? packed>>4 : packed&15;
              av[d]=av[d]*a+p*((float)nib-zero)*scale;
            }
          }
          l=l*a+p; m=nm;
        }
        for (int d=0; d<dims; ++d) acc[(int64_t)group*D_ATTN+lane*dims+d]=av[d];
        if (lane==0) { stats[(int64_t)group*2]=m; stats[(int64_t)group*2+1]=l; }
      });
  });
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>((size_t)nq*hq*lanes), sycl::range<1>(lanes)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int lane=it.get_local_id(0), row=it.get_group(0), qi=row/hq, head=row%hq;
        float m=-INFINITY, l=0.f, av[dims];
        for (int d=0; d<dims; ++d) av[d]=0.f;
        for (int s=0; s<ns; ++s) {
          const int64_t idx=(int64_t)row*ns+s;
          const float sm=stats[idx*2], sl=stats[idx*2+1];
          if (sl==0.f) continue;
          const float nm=sycl::fmax(m,sm), a=m==-INFINITY ? 0.f : sycl::exp(m-nm), b=sycl::exp(sm-nm);
          for (int d=0; d<dims; ++d) av[d]=av[d]*a+b*acc[idx*D_ATTN+lane*dims+d];
          l=l*a+b*sl; m=nm;
        }
        const float inv=l>0.f ? 1.f/l : 0.f;
        for (int d=0; d<dims; ++d)
          dst[qi*os.s0+head*os.s1+(lane*dims+d)*os.s2]=sycl::half(av[d]*inv);
      });
  });
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


static void qsa_gather_fp16(const at::Tensor &k, const at::Tensor &ks, const at::Tensor &v,
                            const at::Tensor &vs, const at::Tensor &vz, const at::Tensor &block_row,
                            const at::Tensor &visible, at::Tensor k_out, at::Tensor v_out,
                            int64_t ratio) {
  const int nq = visible.size(0), width = visible.size(1), hkv = k.size(2);
  TORCH_CHECK(k_out.sizes() == at::IntArrayRef({nq, hkv, width, D_ATTN}), "QSA gather K");
  TORCH_CHECK(v_out.sizes() == k_out.sizes(), "QSA gather V");
  const auto ks0 = strides_of(k), kss = strides_of(ks), vs0 = strides_of(v), vss = strides_of(vs),
             vzs = strides_of(vz);
  const auto *kp = k.data_ptr<int8_t>();
  const auto *ksp = ks.data_ptr<float>();
  const auto *vp = v.data_ptr<uint8_t>();
  const auto *vsp = vs.data_ptr<float>();
  const auto *vzp = vz.data_ptr<float>();
  const auto *bt = block_row.data_ptr<int32_t>();
  const auto *ids = visible.data_ptr<int32_t>();
  auto *dk = reinterpret_cast<sycl::half *>(k_out.data_ptr());
  auto *dv = reinterpret_cast<sycl::half *>(v_out.data_ptr());
  const int64_t bs = block_row.stride(0), ir = visible.stride(0), ic = visible.stride(1);
  const int64_t n = static_cast<int64_t>(nq) * width * hkv;
  current_xpu_queue().parallel_for(sycl::range<1>(static_cast<size_t>(n)), [=](sycl::id<1> id) {
    int64_t tmp = static_cast<int64_t>(id);
    const int kh = static_cast<int>(tmp % hkv);
    tmp /= hkv;
    const int pos = static_cast<int>(tmp % width);
    const int qi = static_cast<int>(tmp / width);
    const int token = ids[qi * ir + pos * ic];
    sycl::half *kdst = dk + (((static_cast<int64_t>(qi) * hkv + kh) * width + pos) * D_ATTN);
    sycl::half *vdst = dv + (((static_cast<int64_t>(qi) * hkv + kh) * width + pos) * D_ATTN);
    if (token < 0) {
      for (int d = 0; d < D_ATTN; ++d) {
        kdst[d] = sycl::half(0.f);
        vdst[d] = sycl::half(0.f);
      }
      return;
    }
    const int logical = token / PAGE, off = token % PAGE;
    const int phys = ratio == 1 ? bt[logical * bs] : bt[(logical / ratio) * bs] * static_cast<int>(ratio) + logical % static_cast<int>(ratio);
    const int64_t ko = phys * ks0.s0 + off * ks0.s1 + kh * ks0.s2;
    const float kscale = ksp[phys * kss.s0 + off * kss.s1 + kh * kss.s2];
    if (ks0.s3 == 1) {
      const auto *src = reinterpret_cast<const uint32_t *>(kp + ko);
      for (int w = 0; w < D_ATTN / 4; ++w) {
        const uint32_t word = src[w];
        #pragma unroll
        for (int b = 0; b < 4; ++b) {
          const float kval = static_cast<float>(static_cast<int8_t>(static_cast<uint8_t>(word >> (8 * b))));
          kdst[w * 4 + b] = sycl::half(kval * kscale);
        }
      }
    } else {
      for (int d = 0; d < D_ATTN; ++d)
        kdst[d] = sycl::half(static_cast<float>(kp[ko + d * ks0.s3]) * kscale);
    }
    const int64_t vo = phys * vs0.s0 + off * vs0.s1 + kh * vs0.s2;
    const float scale = vsp[phys * vss.s0 + off * vss.s1 + kh * vss.s2];
    const float zero = vzp[phys * vzs.s0 + off * vzs.s1 + kh * vzs.s2];
    if (vs0.s3 == 1) {
      const auto *src = reinterpret_cast<const uint32_t *>(vp + vo);
      for (int w = 0; w < V4_COLS / 4; ++w) {
        const uint32_t word = src[w];
        #pragma unroll
        for (int b = 0; b < 4; ++b) {
          const uint8_t packed = static_cast<uint8_t>(word >> (8 * b));
          vdst[(w * 4 + b) * 2] = sycl::half((static_cast<float>(packed & 15) - zero) * scale);
          vdst[(w * 4 + b) * 2 + 1] = sycl::half((static_cast<float>(packed >> 4) - zero) * scale);
        }
      }
    } else {
      for (int d = 0; d < D_ATTN; ++d) {
        const uint8_t packed = vp[vo + (d / 2) * vs0.s3];
        const int nib = (d & 1) ? packed >> 4 : packed & 15;
        vdst[d] = sycl::half((static_cast<float>(nib) - zero) * scale);
      }
    }
  });
}

// One workgroup owns one query and one KV head. Six subgroups own the
// query heads that share that KV. A tile of four selected tokens is loaded
// into SLM once and reused, instead of rereading K8/V4 from HBM per head.
// Double buffered so the next tile's gather overlaps the current dot.
static void qsa_gqa_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                         const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                         const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                         int64_t ratio) {
  for (const auto &t : {query, k, ks, v, vs, vz, block_row, visible, out})
    check_xpu(t, "qsa_gqa_attn tensor");
  TORCH_CHECK(query.scalar_type() == at::kHalf && out.scalar_type() == at::kHalf &&
              k.scalar_type() == at::kChar && v.scalar_type() == at::kByte &&
              ks.scalar_type() == at::kFloat && vs.scalar_type() == at::kFloat &&
              vz.scalar_type() == at::kFloat && block_row.scalar_type() == at::kInt &&
              visible.scalar_type() == at::kInt, "QSA gqa dtypes");
  TORCH_CHECK(query.dim() == 3 && query.size(2) == D_ATTN && out.sizes() == query.sizes() &&
              k.dim() == 4 && k.size(1) == PAGE && k.size(3) == D_ATTN && k.stride(3) == 1 &&
              v.dim() == 4 && v.size(3) == V4_COLS && v.stride(3) == 1 &&
              block_row.dim() == 1 && visible.dim() == 2 && visible.size(0) == query.size(0) &&
              ratio >= 1, "QSA gqa shapes");
  const int nq = static_cast<int>(query.size(0));
  const int hq = static_cast<int>(query.size(1));
  const int hkv = static_cast<int>(k.size(2));
  const int width = static_cast<int>(visible.size(1));
  TORCH_CHECK(hkv > 0 && hq % hkv == 0 && width > 0, "QSA gqa heads or width");
  const int gqa = hq / hkv;
  TORCH_CHECK(gqa <= 6, "QSA gqa covers at most 6 query heads per KV head");
  constexpr int TILE = 4;
  constexpr int THREADS = 96;  // 6 subgroups, even when gqa is smaller
  constexpr int K_U32 = D_ATTN / 4;
  constexpr int V_U32 = V4_COLS / 4;
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
  auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr());
  const int64_t bs = block_row.stride(0), ir = visible.stride(0), ic = visible.stride(1);
  const size_t groups = static_cast<size_t>(nq) * static_cast<size_t>(hkv);
  queue.submit([&](sycl::handler &h) {
    sycl::local_accessor<uint32_t, 1> kslm(sycl::range<1>(2 * TILE * K_U32), h);
    sycl::local_accessor<uint32_t, 1> vslm(sycl::range<1>(2 * TILE * V_U32), h);
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(groups * THREADS), sycl::range<1>(THREADS)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int tid = static_cast<int>(it.get_local_id(0));
        const int lane = tid & 15;
        const int sg = tid >> 4;
        const int group = static_cast<int>(it.get_group(0));
        const int qi = group / hkv;
        const int kh = group - qi * hkv;
        const bool active = sg < gqa;
        const int head = kh * gqa + sg;
        auto subgroup = it.get_sub_group();
        float qv[16], av[16];
        #pragma unroll
        for (int d = 0; d < 16; ++d) {
          qv[d] = active ? (float)qp[qi * qs.s0 + head * qs.s1 + (lane * 16 + d) * qs.s2] : 0.f;
          av[d] = 0.f;
        }
        float m = -INFINITY, l = 0.f;

        auto load_tile = [&](int buf, int base) {
          int phys[TILE], off[TILE], live[TILE];
          #pragma unroll
          for (int t = 0; t < TILE; ++t) {
            const int p = base + t;
            int token = -1;
            if (p < width) token = ids[qi * ir + (int64_t)p * ic];
            live[t] = token >= 0;
            if (token >= 0) {
              const int logical = token / PAGE;
              off[t] = token - logical * PAGE;
              phys[t] = ratio == 1 ? bt[logical * bs]
                                   : bt[(logical / ratio) * bs] * (int)ratio + logical % (int)ratio;
            } else {
              phys[t] = 0;
              off[t] = 0;
            }
          }
          if (tid < TILE * 16) {
            const int t = tid >> 4;
            const int vec = tid & 15;
            if (live[t]) {
              const int64_t ko = (int64_t)phys[t] * ks0.s0 + off[t] * ks0.s1 + kh * ks0.s2 + vec * 16;
              const uint32_t *src = reinterpret_cast<const uint32_t *>(kp + ko);
              const int dsti = buf * TILE * K_U32 + t * K_U32 + vec * 4;
              kslm[dsti] = src[0];
              kslm[dsti + 1] = src[1];
              kslm[dsti + 2] = src[2];
              kslm[dsti + 3] = src[3];
            }
          }
          const int vt = tid - TILE * 16;
          if (vt >= 0 && vt < TILE * 8) {
            const int t = vt >> 3;
            const int vec = vt & 7;
            if (live[t]) {
              const int64_t vo = (int64_t)phys[t] * vs0.s0 + off[t] * vs0.s1 + kh * vs0.s2 + vec * 16;
              const uint32_t *src = reinterpret_cast<const uint32_t *>(vp + vo);
              const int dsti = buf * TILE * V_U32 + t * V_U32 + vec * 4;
              vslm[dsti] = src[0];
              vslm[dsti + 1] = src[1];
              vslm[dsti + 2] = src[2];
              vslm[dsti + 3] = src[3];
            }
          }
        };

        load_tile(0, 0);
        sycl::group_barrier(it.get_group());
        for (int pos = 0; pos < width; pos += TILE) {
          const int buf = (pos / TILE) & 1;
          if (active) {
            #pragma unroll
            for (int t = 0; t < TILE; ++t) {
              const int col = pos + t;
              if (col >= width) continue;
              const int token = ids[qi * ir + (int64_t)col * ic];
              if (token < 0) continue;
              const int logical = token / PAGE;
              const int off = token - logical * PAGE;
              const int phys = ratio == 1 ? bt[logical * bs]
                                          : bt[(logical / ratio) * bs] * (int)ratio + logical % (int)ratio;
              float dot = 0.f;
              const int kbase = buf * TILE * K_U32 + t * K_U32 + lane * 4;
              #pragma unroll
              for (int w = 0; w < 4; ++w) {
                const uint32_t word = kslm[kbase + w];
                #pragma unroll
                for (int b = 0; b < 4; ++b) {
                  const int8_t kval = static_cast<int8_t>(static_cast<uint8_t>(word >> (8 * b)));
                  dot += qv[w * 4 + b] * static_cast<float>(kval);
                }
              }
              dot = sycl::reduce_over_group(subgroup, dot, sycl::plus<float>());
              const float score = dot * ksp[(int64_t)phys * kss.s0 + off * kss.s1 + kh * kss.s2] * INV_SQRT_D;
              const float nm = sycl::fmax(m, score);
              const float a = m == -INFINITY ? 0.f : sycl::exp(m - nm);
              const float p = sycl::exp(score - nm);
              const float scale = vsp[(int64_t)phys * vss.s0 + off * vss.s1 + kh * vss.s2];
              const float zero = vzp[(int64_t)phys * vzs.s0 + off * vzs.s1 + kh * vzs.s2];
              const int vbase = buf * TILE * V_U32 + t * V_U32 + lane * 2;
              const uint32_t w0 = vslm[vbase], w1 = vslm[vbase + 1];
              #pragma unroll
              for (int b = 0; b < 8; ++b) {
                const uint32_t word = b < 4 ? w0 : w1;
                const uint8_t packed = static_cast<uint8_t>(word >> ((b & 3) * 8));
                const float even = (float)(packed & 15) - zero;
                const float odd = (float)(packed >> 4) - zero;
                av[b * 2] = av[b * 2] * a + p * even * scale;
                av[b * 2 + 1] = av[b * 2 + 1] * a + p * odd * scale;
              }
              l = l * a + p;
              m = nm;
            }
          }
          const int next = pos + TILE;
          if (next < width) load_tile(buf ^ 1, next);
          sycl::group_barrier(it.get_group());
        }
        if (active) {
          const float inv = l > 0.f ? 1.f / l : 0.f;
          #pragma unroll
          for (int d = 0; d < 16; ++d)
            dst[qi * os.s0 + head * os.s1 + (lane * 16 + d) * os.s2] = sycl::half(av[d] * inv);
        }
      });
  });
}



// Two query heads that share a KV head. K and V are loaded once per token.
static void qsa_pair_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                          const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                          const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                          int64_t ratio) {
  for (const auto &t : {query, k, ks, v, vs, vz, block_row, visible, out})
    check_xpu(t, "qsa_pair_attn tensor");
  TORCH_CHECK(query.scalar_type() == at::kHalf && out.scalar_type() == at::kHalf &&
              k.scalar_type() == at::kChar && v.scalar_type() == at::kByte &&
              ks.scalar_type() == at::kFloat && vs.scalar_type() == at::kFloat &&
              vz.scalar_type() == at::kFloat && block_row.scalar_type() == at::kInt &&
              visible.scalar_type() == at::kInt, "QSA pair dtypes");
  TORCH_CHECK(query.dim() == 3 && query.size(2) == D_ATTN && out.sizes() == query.sizes() &&
              k.dim() == 4 && k.size(1) == PAGE && k.size(3) == D_ATTN && k.stride(3) == 1 &&
              v.dim() == 4 && v.size(3) == V4_COLS && v.stride(3) == 1 &&
              block_row.dim() == 1 && visible.dim() == 2 && visible.size(0) == query.size(0) &&
              ratio >= 1, "QSA pair shapes");
  const int nq = static_cast<int>(query.size(0));
  const int hq = static_cast<int>(query.size(1));
  const int hkv = static_cast<int>(k.size(2));
  const int width = static_cast<int>(visible.size(1));
  TORCH_CHECK(hkv > 0 && hq % hkv == 0 && hq % 2 == 0 && width > 0, "QSA pair heads");
  const int gqa = hq / hkv;
  TORCH_CHECK(gqa % 2 == 0, "QSA pair needs an even GQA ratio");
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
  auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr());
  const int64_t bs = block_row.stride(0), ir = visible.stride(0), ic = visible.stride(1);
  const int npairs = hq / 2;
  const size_t groups = static_cast<size_t>(nq) * static_cast<size_t>(npairs);
  constexpr int lanes = 16;
  constexpr int dims = D_ATTN / lanes;
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(groups * lanes), sycl::range<1>(lanes)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int lane = it.get_local_id(0);
        const int group = it.get_group(0);
        const int pair = group % npairs;
        const int qi = group / npairs;
        const int head0 = pair * 2;
        const int head1 = head0 + 1;
        const int kh = head0 / gqa;
        auto sg = it.get_sub_group();
        float q0[dims], q1[dims], a0[dims], a1[dims];
        #pragma unroll
        for (int d = 0; d < dims; ++d) {
          q0[d] = (float)qp[qi * qs.s0 + head0 * qs.s1 + (lane * dims + d) * qs.s2];
          q1[d] = (float)qp[qi * qs.s0 + head1 * qs.s1 + (lane * dims + d) * qs.s2];
          a0[d] = 0.f;
          a1[d] = 0.f;
        }
        float m0 = -INFINITY, l0 = 0.f, m1 = -INFINITY, l1 = 0.f;
        for (int pos = 0; pos < width; ++pos) {
          const int token = ids[qi * ir + (int64_t)pos * ic];
          if (token < 0) continue;
          const int logical = token / PAGE;
          const int off = token - logical * PAGE;
          const int phys = ratio == 1 ? bt[logical * bs]
                                      : bt[(logical / ratio) * bs] * (int)ratio + logical % (int)ratio;
          const int64_t ko = (int64_t)phys * ks0.s0 + off * ks0.s1 + kh * ks0.s2;
          const uint32_t *ksrc = reinterpret_cast<const uint32_t *>(kp + ko + (int64_t)lane * dims);
          float dot0 = 0.f, dot1 = 0.f;
          #pragma unroll
          for (int w = 0; w < 4; ++w) {
            const uint32_t word = ksrc[w];
            #pragma unroll
            for (int b = 0; b < 4; ++b) {
              const float kval = (float)static_cast<int8_t>(static_cast<uint8_t>(word >> (8 * b)));
              dot0 += q0[w * 4 + b] * kval;
              dot1 += q1[w * 4 + b] * kval;
            }
          }
          dot0 = sycl::reduce_over_group(sg, dot0, sycl::plus<float>());
          dot1 = sycl::reduce_over_group(sg, dot1, sycl::plus<float>());
          const float kscale = ksp[(int64_t)phys * kss.s0 + off * kss.s1 + kh * kss.s2] * INV_SQRT_D;
          const float s0 = dot0 * kscale;
          const float s1 = dot1 * kscale;
          const float n0 = sycl::fmax(m0, s0);
          const float n1 = sycl::fmax(m1, s1);
          const float d0 = m0 == -INFINITY ? 0.f : sycl::exp(m0 - n0);
          const float d1 = m1 == -INFINITY ? 0.f : sycl::exp(m1 - n1);
          const float p0 = sycl::exp(s0 - n0);
          const float p1 = sycl::exp(s1 - n1);
          const int64_t vo = (int64_t)phys * vs0.s0 + off * vs0.s1 + kh * vs0.s2;
          const float scale = vsp[(int64_t)phys * vss.s0 + off * vss.s1 + kh * vss.s2];
          const float zero = vzp[(int64_t)phys * vzs.s0 + off * vzs.s1 + kh * vzs.s2];
          const uint32_t *vsrc = reinterpret_cast<const uint32_t *>(vp + vo + (int64_t)lane * dims / 2);
          const uint32_t w0 = vsrc[0], w1b = vsrc[1];
          #pragma unroll
          for (int b = 0; b < 8; ++b) {
            const uint32_t word = b < 4 ? w0 : w1b;
            const uint8_t packed = static_cast<uint8_t>(word >> ((b & 3) * 8));
            const float even = ((float)(packed & 15) - zero) * scale;
            const float odd = ((float)(packed >> 4) - zero) * scale;
            a0[b * 2] = a0[b * 2] * d0 + p0 * even;
            a0[b * 2 + 1] = a0[b * 2 + 1] * d0 + p0 * odd;
            a1[b * 2] = a1[b * 2] * d1 + p1 * even;
            a1[b * 2 + 1] = a1[b * 2 + 1] * d1 + p1 * odd;
          }
          l0 = l0 * d0 + p0;
          l1 = l1 * d1 + p1;
          m0 = n0;
          m1 = n1;
        }
        const float inv0 = l0 > 0.f ? 1.f / l0 : 0.f;
        const float inv1 = l1 > 0.f ? 1.f / l1 : 0.f;
        #pragma unroll
        for (int d = 0; d < dims; ++d) {
          dst[qi * os.s0 + head0 * os.s1 + (lane * dims + d) * os.s2] = sycl::half(a0[d] * inv0);
          dst[qi * os.s0 + head1 * os.s1 + (lane * dims + d) * os.s2] = sycl::half(a1[d] * inv1);
        }
      });
  });
}



// N query heads that share one KV head. K and V are loaded once per token.
template <int N>
static void launch_grp_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                            const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                            const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                            int64_t ratio) {
  const int nq = static_cast<int>(query.size(0));
  const int hq = static_cast<int>(query.size(1));
  const int hkv = static_cast<int>(k.size(2));
  const int width = static_cast<int>(visible.size(1));
  const int gqa = hq / hkv;
  TORCH_CHECK(gqa % N == 0, "QSA group size must divide the GQA ratio");
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
  auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr());
  const int64_t bs = block_row.stride(0), ir = visible.stride(0), ic = visible.stride(1);
  const int ngroups = hq / N;
  const size_t groups = static_cast<size_t>(nq) * static_cast<size_t>(ngroups);
  constexpr int lanes = 16;
  constexpr int dims = D_ATTN / lanes;
  queue.submit([&](sycl::handler &h) {
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(groups * lanes), sycl::range<1>(lanes)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int lane = it.get_local_id(0);
        const int group = it.get_group(0);
        const int bundle = group % ngroups;
        const int qi = group / ngroups;
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
        for (int pos = 0; pos < width; ++pos) {
          const int token = ids[qi * ir + (int64_t)pos * ic];
          if (token < 0) continue;
          const int logical = token / PAGE;
          const int off = token - logical * PAGE;
          const int phys = ratio == 1 ? bt[logical * bs]
                                      : bt[(logical / ratio) * bs] * (int)ratio + logical % (int)ratio;
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
            const float nm = sycl::fmax(mv[n], score);
            decay[n] = mv[n] == -INFINITY ? 0.f : sycl::exp(mv[n] - nm);
            prob[n] = sycl::exp(score - nm);
            lv[n] = lv[n] * decay[n] + prob[n];
            mv[n] = nm;
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
          const float inv = lv[n] > 0.f ? 1.f / lv[n] : 0.f;
          #pragma unroll
          for (int d = 0; d < dims; ++d)
            dst[qi * os.s0 + (head0 + n) * os.s1 + (lane * dims + d) * os.s2] =
                sycl::half(acc[n][d] * inv);
        }
      });
  });
}

static void qsa_grp_check(const at::Tensor &query, const at::Tensor &k, const at::Tensor &v,
                          const at::Tensor &block_row, const at::Tensor &visible, const at::Tensor &out,
                          int64_t ratio, const char *name) {
  for (const auto &t : {query, k, v, block_row, visible, out}) check_xpu(t, name);
  TORCH_CHECK(query.scalar_type() == at::kHalf && out.sizes() == query.sizes() &&
              k.stride(3) == 1 && v.stride(3) == 1 && visible.size(0) == query.size(0) &&
              query.size(1) % k.size(2) == 0 && ratio >= 1, name);
}

static void qsa_grp3_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                          const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                          const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                          int64_t ratio) {
  qsa_grp_check(query, k, v, block_row, visible, out, ratio, "qsa_grp3");
  launch_grp_attn<3>(query, k, ks, v, vs, vz, block_row, visible, out, ratio);
}

static void qsa_grp6_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                          const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                          const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                          int64_t ratio) {
  qsa_grp_check(query, k, v, block_row, visible, out, ratio, "qsa_grp6");
  launch_grp_attn<6>(query, k, ks, v, vs, vz, block_row, visible, out, ratio);
}



// One workgroup per query and KV head: two subgroups each own three query
// heads. The token's K8/V4 bytes are staged once in SLM.
static void qsa_slm6_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                          const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                          const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                          int64_t ratio) {
  qsa_grp_check(query, k, v, block_row, visible, out, ratio, "qsa_slm6");
  const int nq = static_cast<int>(query.size(0));
  const int hq = static_cast<int>(query.size(1));
  const int hkv = static_cast<int>(k.size(2));
  const int width = static_cast<int>(visible.size(1));
  const int gqa = hq / hkv;
  TORCH_CHECK(gqa == 6, "qsa_slm6 is the 6-query-head GQA case");
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
  auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr());
  const int64_t bs = block_row.stride(0), ir = visible.stride(0), ic = visible.stride(1);
  constexpr int lanes = 16;
  constexpr int dims = 16;
  constexpr int threads = 32;
  constexpr int heads_per_sg = 3;
  const size_t groups = static_cast<size_t>(nq) * static_cast<size_t>(hkv);
  queue.submit([&](sycl::handler &h) {
    sycl::local_accessor<uint32_t, 1> kslm(sycl::range<1>(D_ATTN / 4), h);
    sycl::local_accessor<uint32_t, 1> vslm(sycl::range<1>(V4_COLS / 4), h);
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(groups * threads), sycl::range<1>(threads)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int tid = static_cast<int>(it.get_local_id(0));
        const int lane = tid & 15;
        const int sg = tid >> 4;
        const int group = static_cast<int>(it.get_group(0));
        const int qi = group / hkv;
        const int kh = group - qi * hkv;
        const int head0 = kh * gqa + sg * heads_per_sg;
        auto subgroup = it.get_sub_group();
        float qv[heads_per_sg][dims];
        float acc[heads_per_sg][dims];
        float mv[heads_per_sg], lv[heads_per_sg];
        #pragma unroll
        for (int n = 0; n < heads_per_sg; ++n) {
          mv[n] = -INFINITY;
          lv[n] = 0.f;
          #pragma unroll
          for (int d = 0; d < dims; ++d) {
            qv[n][d] = (float)qp[qi * qs.s0 + (head0 + n) * qs.s1 + (lane * dims + d) * qs.s2];
            acc[n][d] = 0.f;
          }
        }
        for (int pos = 0; pos < width; ++pos) {
          const int token = ids[qi * ir + (int64_t)pos * ic];
          const bool live = token >= 0;
          int phys = 0, off = 0;
          if (live) {
            const int logical = token / PAGE;
            off = token - logical * PAGE;
            phys = ratio == 1 ? bt[logical * bs]
                              : bt[(logical / ratio) * bs] * (int)ratio + logical % (int)ratio;
          }
          if (tid < 16 && live) {
            const int64_t ko = (int64_t)phys * ks0.s0 + off * ks0.s1 + kh * ks0.s2 + tid * 16;
            const uint32_t *src = reinterpret_cast<const uint32_t *>(kp + ko);
            kslm[tid * 4] = src[0];
            kslm[tid * 4 + 1] = src[1];
            kslm[tid * 4 + 2] = src[2];
            kslm[tid * 4 + 3] = src[3];
          }
          if (tid >= 16 && tid < 24 && live) {
            const int vt = tid - 16;
            const int64_t vo = (int64_t)phys * vs0.s0 + off * vs0.s1 + kh * vs0.s2 + vt * 16;
            const uint32_t *src = reinterpret_cast<const uint32_t *>(vp + vo);
            vslm[vt * 4] = src[0];
            vslm[vt * 4 + 1] = src[1];
            vslm[vt * 4 + 2] = src[2];
            vslm[vt * 4 + 3] = src[3];
          }
          sycl::group_barrier(it.get_group());
          if (live) {
            float dots[heads_per_sg];
            #pragma unroll
            for (int n = 0; n < heads_per_sg; ++n) dots[n] = 0.f;
            #pragma unroll
            for (int w = 0; w < 4; ++w) {
              const uint32_t word = kslm[lane * 4 + w];
              #pragma unroll
              for (int b = 0; b < 4; ++b) {
                const float kval = (float)static_cast<int8_t>(static_cast<uint8_t>(word >> (8 * b)));
                #pragma unroll
                for (int n = 0; n < heads_per_sg; ++n) dots[n] += qv[n][w * 4 + b] * kval;
              }
            }
            #pragma unroll
            for (int n = 0; n < heads_per_sg; ++n)
              dots[n] = sycl::reduce_over_group(subgroup, dots[n], sycl::plus<float>());
            const float kscale = ksp[(int64_t)phys * kss.s0 + off * kss.s1 + kh * kss.s2] * INV_SQRT_D;
            const float scale = vsp[(int64_t)phys * vss.s0 + off * vss.s1 + kh * vss.s2];
            const float zero = vzp[(int64_t)phys * vzs.s0 + off * vzs.s1 + kh * vzs.s2];
            const uint32_t w0 = vslm[lane * 2];
            const uint32_t w1b = vslm[lane * 2 + 1];
            float decay[heads_per_sg], prob[heads_per_sg];
            #pragma unroll
            for (int n = 0; n < heads_per_sg; ++n) {
              const float score = dots[n] * kscale;
              const float nm = sycl::fmax(mv[n], score);
              decay[n] = mv[n] == -INFINITY ? 0.f : sycl::exp(mv[n] - nm);
              prob[n] = sycl::exp(score - nm);
              lv[n] = lv[n] * decay[n] + prob[n];
              mv[n] = nm;
            }
            #pragma unroll
            for (int b = 0; b < 8; ++b) {
              const uint32_t word = b < 4 ? w0 : w1b;
              const uint8_t packed = static_cast<uint8_t>(word >> ((b & 3) * 8));
              const float even = ((float)(packed & 15) - zero) * scale;
              const float odd = ((float)(packed >> 4) - zero) * scale;
              #pragma unroll
              for (int n = 0; n < heads_per_sg; ++n) {
                acc[n][b * 2] = acc[n][b * 2] * decay[n] + prob[n] * even;
                acc[n][b * 2 + 1] = acc[n][b * 2 + 1] * decay[n] + prob[n] * odd;
              }
            }
          }
          sycl::group_barrier(it.get_group());
        }
        #pragma unroll
        for (int n = 0; n < heads_per_sg; ++n) {
          const float inv = lv[n] > 0.f ? 1.f / lv[n] : 0.f;
          #pragma unroll
          for (int d = 0; d < dims; ++d)
            dst[qi * os.s0 + (head0 + n) * os.s1 + (lane * dims + d) * os.s2] =
                sycl::half(acc[n][d] * inv);
        }
      });
  });
}



// One subgroup owns one query and one KV head, and all six query heads.
// Query vectors and partial outputs sit in SLM so the register file does not
// spill. K and V are loaded once per token.
static void qsa_acc6_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                          const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                          const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                          int64_t ratio) {
  qsa_grp_check(query, k, v, block_row, visible, out, ratio, "qsa_acc6");
  const int nq = static_cast<int>(query.size(0));
  const int hq = static_cast<int>(query.size(1));
  const int hkv = static_cast<int>(k.size(2));
  const int width = static_cast<int>(visible.size(1));
  const int gqa = hq / hkv;
  TORCH_CHECK(gqa == 6, "qsa_acc6 is the 6-query-head case");
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
  auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr());
  const int64_t bs = block_row.stride(0), ir = visible.stride(0), ic = visible.stride(1);
  constexpr int lanes = 16;
  constexpr int dims = 16;
  constexpr int heads = 6;
  const size_t groups = static_cast<size_t>(nq) * static_cast<size_t>(hkv);
  queue.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> qslm(sycl::range<1>(heads * D_ATTN), h);
    sycl::local_accessor<float, 1> aslm(sycl::range<1>(heads * D_ATTN), h);
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(groups * lanes), sycl::range<1>(lanes)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int lane = static_cast<int>(it.get_local_id(0));
        const int group = static_cast<int>(it.get_group(0));
        const int qi = group / hkv;
        const int kh = group - qi * hkv;
        const int head0 = kh * gqa;
        auto sg = it.get_sub_group();
        float mv[heads], lv[heads];
        #pragma unroll
        for (int n = 0; n < heads; ++n) {
          mv[n] = -INFINITY;
          lv[n] = 0.f;
          #pragma unroll
          for (int d = 0; d < dims; ++d) {
            const int slot = n * D_ATTN + lane * dims + d;
            qslm[slot] = (float)qp[qi * qs.s0 + (head0 + n) * qs.s1 + (lane * dims + d) * qs.s2];
            aslm[slot] = 0.f;
          }
        }
        for (int pos = 0; pos < width; ++pos) {
          const int token = ids[qi * ir + (int64_t)pos * ic];
          if (token < 0) continue;
          const int logical = token / PAGE;
          const int off = token - logical * PAGE;
          const int phys = ratio == 1 ? bt[logical * bs]
                                      : bt[(logical / ratio) * bs] * (int)ratio + logical % (int)ratio;
          const int64_t ko = (int64_t)phys * ks0.s0 + off * ks0.s1 + kh * ks0.s2;
          const uint32_t *ksrc = reinterpret_cast<const uint32_t *>(kp + ko + (int64_t)lane * dims);
          float kval[dims];
          #pragma unroll
          for (int w = 0; w < 4; ++w) {
            const uint32_t word = ksrc[w];
            #pragma unroll
            for (int b = 0; b < 4; ++b)
              kval[w * 4 + b] = (float)static_cast<int8_t>(static_cast<uint8_t>(word >> (8 * b)));
          }
          float dots[heads];
          #pragma unroll
          for (int n = 0; n < heads; ++n) {
            float dot = 0.f;
            #pragma unroll
            for (int d = 0; d < dims; ++d)
              dot += qslm[n * D_ATTN + lane * dims + d] * kval[d];
            dots[n] = dot;
          }
          #pragma unroll
          for (int n = 0; n < heads; ++n)
            dots[n] = sycl::reduce_over_group(sg, dots[n], sycl::plus<float>());
          const float kscale = ksp[(int64_t)phys * kss.s0 + off * kss.s1 + kh * kss.s2] * INV_SQRT_D;
          const int64_t vo = (int64_t)phys * vs0.s0 + off * vs0.s1 + kh * vs0.s2;
          const float scale = vsp[(int64_t)phys * vss.s0 + off * vss.s1 + kh * vss.s2];
          const float zero = vzp[(int64_t)phys * vzs.s0 + off * vzs.s1 + kh * vzs.s2];
          const uint32_t *vsrc = reinterpret_cast<const uint32_t *>(vp + vo + (int64_t)lane * dims / 2);
          const uint32_t w0 = vsrc[0], w1b = vsrc[1];
          float decay[heads], prob[heads];
          #pragma unroll
          for (int n = 0; n < heads; ++n) {
            const float score = dots[n] * kscale;
            const float nm = sycl::fmax(mv[n], score);
            decay[n] = mv[n] == -INFINITY ? 0.f : sycl::exp(mv[n] - nm);
            prob[n] = sycl::exp(score - nm);
            lv[n] = lv[n] * decay[n] + prob[n];
            mv[n] = nm;
          }
          #pragma unroll
          for (int b = 0; b < 8; ++b) {
            const uint32_t word = b < 4 ? w0 : w1b;
            const uint8_t packed = static_cast<uint8_t>(word >> ((b & 3) * 8));
            const float even = ((float)(packed & 15) - zero) * scale;
            const float odd = ((float)(packed >> 4) - zero) * scale;
            #pragma unroll
            for (int n = 0; n < heads; ++n) {
              const int e = n * D_ATTN + lane * dims + b * 2;
              aslm[e] = aslm[e] * decay[n] + prob[n] * even;
              aslm[e + 1] = aslm[e + 1] * decay[n] + prob[n] * odd;
            }
          }
        }
        #pragma unroll
        for (int n = 0; n < heads; ++n) {
          const float inv = lv[n] > 0.f ? 1.f / lv[n] : 0.f;
          #pragma unroll
          for (int d = 0; d < dims; ++d) {
            const float value = aslm[n * D_ATTN + lane * dims + d] * inv;
            dst[qi * os.s0 + (head0 + n) * os.s1 + (lane * dims + d) * os.s2] = sycl::half(value);
          }
        }
      });
  });
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
        for (int pos = begin; pos < end; ++pos) {
          const int token = ids[qi * ir + (int64_t)pos * ic];
          if (token < 0) continue;
          const int logical = token / PAGE;
          const int off = token - logical * PAGE;
          const int phys = ratio == 1 ? bt[logical * bs]
                                      : bt[(logical / ratio) * bs] * (int)ratio + logical % (int)ratio;
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
            const float nm = sycl::fmax(mv[n], score);
            decay[n] = mv[n] == -INFINITY ? 0.f : sycl::exp(mv[n] - nm);
            prob[n] = sycl::exp(score - nm);
            lv[n] = lv[n] * decay[n] + prob[n];
            mv[n] = nm;
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



// One subgroup, six query heads, one K/V load. Head state lives in SLM
// between tokens, but each dot runs from registers.
static void qsa_stream6_attn(const at::Tensor &query, const at::Tensor &k, const at::Tensor &ks,
                             const at::Tensor &v, const at::Tensor &vs, const at::Tensor &vz,
                             const at::Tensor &block_row, const at::Tensor &visible, at::Tensor out,
                             int64_t ratio) {
  qsa_grp_check(query, k, v, block_row, visible, out, ratio, "qsa_stream6");
  const int nq = static_cast<int>(query.size(0));
  const int hq = static_cast<int>(query.size(1));
  const int hkv = static_cast<int>(k.size(2));
  const int width = static_cast<int>(visible.size(1));
  const int gqa = hq / hkv;
  TORCH_CHECK(gqa == 6, "qsa_stream6 is the 6-query-head case");
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
  auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr());
  const int64_t bs = block_row.stride(0), ir = visible.stride(0), ic = visible.stride(1);
  constexpr int lanes = 16;
  constexpr int dims = 16;
  constexpr int heads = 6;
  const size_t groups = static_cast<size_t>(nq) * static_cast<size_t>(hkv);
  queue.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> qslm(sycl::range<1>(heads * D_ATTN), h);
    sycl::local_accessor<float, 1> aslm(sycl::range<1>(heads * D_ATTN), h);
    h.parallel_for(sycl::nd_range<1>(sycl::range<1>(groups * lanes), sycl::range<1>(lanes)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        const int lane = static_cast<int>(it.get_local_id(0));
        const int group = static_cast<int>(it.get_group(0));
        const int qi = group / hkv;
        const int kh = group - qi * hkv;
        const int head0 = kh * gqa;
        auto sg = it.get_sub_group();
        float mv[heads], lv[heads];
        #pragma unroll
        for (int n = 0; n < heads; ++n) {
          mv[n] = -INFINITY;
          lv[n] = 0.f;
          #pragma unroll
          for (int d = 0; d < dims; ++d) {
            const int slot = n * D_ATTN + lane * dims + d;
            qslm[slot] = (float)qp[qi * qs.s0 + (head0 + n) * qs.s1 + (lane * dims + d) * qs.s2];
            aslm[slot] = 0.f;
          }
        }
        for (int pos = 0; pos < width; ++pos) {
          const int token = ids[qi * ir + (int64_t)pos * ic];
          if (token < 0) continue;
          const int logical = token / PAGE;
          const int off = token - logical * PAGE;
          const int phys = ratio == 1 ? bt[logical * bs]
                                      : bt[(logical / ratio) * bs] * (int)ratio + logical % (int)ratio;
          const int64_t ko = (int64_t)phys * ks0.s0 + off * ks0.s1 + kh * ks0.s2;
          const uint32_t *ksrc = reinterpret_cast<const uint32_t *>(kp + ko + (int64_t)lane * dims);
          float kval[dims];
          #pragma unroll
          for (int w = 0; w < 4; ++w) {
            const uint32_t word = ksrc[w];
            #pragma unroll
            for (int b = 0; b < 4; ++b)
              kval[w * 4 + b] = (float)static_cast<int8_t>(static_cast<uint8_t>(word >> (8 * b)));
          }
          const int64_t vo = (int64_t)phys * vs0.s0 + off * vs0.s1 + kh * vs0.s2;
          const float scale = vsp[(int64_t)phys * vss.s0 + off * vss.s1 + kh * vss.s2];
          const float zero = vzp[(int64_t)phys * vzs.s0 + off * vzs.s1 + kh * vzs.s2];
          const uint32_t *vsrc = reinterpret_cast<const uint32_t *>(vp + vo + (int64_t)lane * dims / 2);
          const uint32_t w0 = vsrc[0], w1b = vsrc[1];
          float vval[dims];
          #pragma unroll
          for (int b = 0; b < 8; ++b) {
            const uint32_t word = b < 4 ? w0 : w1b;
            const uint8_t packed = static_cast<uint8_t>(word >> ((b & 3) * 8));
            vval[b * 2] = ((float)(packed & 15) - zero) * scale;
            vval[b * 2 + 1] = ((float)(packed >> 4) - zero) * scale;
          }
          const float kscale = ksp[(int64_t)phys * kss.s0 + off * kss.s1 + kh * kss.s2] * INV_SQRT_D;
          // Not unrolled: one head's registers at a time, so six heads do not spill.
          for (int n = 0; n < heads; ++n) {
            float qv[dims], av[dims], dot = 0.f;
            #pragma unroll
            for (int d = 0; d < dims; ++d) {
              qv[d] = qslm[n * D_ATTN + lane * dims + d];
              av[d] = aslm[n * D_ATTN + lane * dims + d];
              dot += qv[d] * kval[d];
            }
            dot = sycl::reduce_over_group(sg, dot, sycl::plus<float>());
            const float score = dot * kscale;
            const float nm = sycl::fmax(mv[n], score);
            const float decay = mv[n] == -INFINITY ? 0.f : sycl::exp(mv[n] - nm);
            const float prob = sycl::exp(score - nm);
            #pragma unroll
            for (int d = 0; d < dims; ++d)
              aslm[n * D_ATTN + lane * dims + d] = av[d] * decay + prob * vval[d];
            lv[n] = lv[n] * decay + prob;
            mv[n] = nm;
          }
        }
        #pragma unroll
        for (int n = 0; n < heads; ++n) {
          const float inv = lv[n] > 0.f ? 1.f / lv[n] : 0.f;
          #pragma unroll
          for (int d = 0; d < dims; ++d)
            dst[qi * os.s0 + (head0 + n) * os.s1 + (lane * dims + d) * os.s2] =
                sycl::half(aslm[n * D_ATTN + lane * dims + d] * inv);
        }
      });
  });
}


}  // namespace

TORCH_LIBRARY(xe2_qsa, m) {
  m.def("qsa_score_paged(Tensor query, Tensor pooled, Tensor valid, Tensor block_row, Tensor counts, Tensor(a!) scores, int ratio) -> ()");
  m.def("qsa_cache_update(Tensor slots, Tensor keys, Tensor positions, Tensor weight, Tensor freqs, Tensor(a!) raw, Tensor(b!) pos_cache, Tensor(c!) filled, Tensor(d!) pooled, Tensor(e!) valid, float eps, Tensor(f!) counter) -> ()");
  m.def("qsa_direct_attn(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) partial, Tensor(b!) ml, Tensor(c!) out, int ratio, int split_width) -> ()");
  m.def("qsa_gqa_attn(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) out, int ratio) -> ()");
  m.def("qsa_pair_attn(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) out, int ratio) -> ()");
  m.def("qsa_grp3_attn(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) out, int ratio) -> ()");
  m.def("qsa_grp3_split(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) partial, Tensor(b!) ml, Tensor(c!) out, int ratio, int split_width) -> ()");
  m.def("qsa_stream6_attn(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) out, int ratio) -> ()");
  m.def("qsa_grp6_attn(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) out, int ratio) -> ()");
  m.def("qsa_slm6_attn(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) out, int ratio) -> ()");
  m.def("qsa_acc6_attn(Tensor query, Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) out, int ratio) -> ()");
  m.def("qsa_pack_kv(Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) dk, Tensor(b!) dks, Tensor(c!) dv, Tensor(d!) dvs, Tensor(e!) dvz, Tensor(f!) lengths, int ratio) -> ()");
  m.def("qsa_score(Tensor query, Tensor pooled, Tensor(a!) scores) -> ()");
  m.def("qsa_topk(Tensor scores, Tensor(a!) ids, int k) -> ()");
  m.def(
      "qsa_visible(Tensor scores, Tensor counts, Tensor cells, Tensor(a!) out, int k, int ratio, "
      "int force) -> ()");
  m.def(
      "qsa_sparse_attn(Tensor query, Tensor k, Tensor k_scale, Tensor v, Tensor v_scale, "
      "Tensor v_zero, Tensor block_row, Tensor visible, Tensor(a!) out, int pages_per_block, "
      "int seq_len) -> ()");
  m.def("qsa_gather_fp16(Tensor k, Tensor ks, Tensor v, Tensor vs, Tensor vz, Tensor block_row, Tensor visible, Tensor(a!) k_out, Tensor(b!) v_out, int ratio) -> ()");
}

TORCH_LIBRARY_IMPL(xe2_qsa, XPU, m) {
  m.impl("qsa_score_paged", &qsa_score_paged);
  m.impl("qsa_cache_update", &qsa_cache_update);
  m.impl("qsa_direct_attn", &qsa_direct_attn);
  m.impl("qsa_gqa_attn", &qsa_gqa_attn);
  m.impl("qsa_pair_attn", &qsa_pair_attn);
  m.impl("qsa_grp3_attn", &qsa_grp3_attn);
  m.impl("qsa_grp3_split", &qsa_grp3_split);
  m.impl("qsa_stream6_attn", &qsa_stream6_attn);
  m.impl("qsa_grp6_attn", &qsa_grp6_attn);
  m.impl("qsa_slm6_attn", &qsa_slm6_attn);
  m.impl("qsa_acc6_attn", &qsa_acc6_attn);
  m.impl("qsa_pack_kv", &qsa_pack_kv);
  m.impl("qsa_score", &qsa_score);
  m.impl("qsa_topk", &qsa_topk);
  m.impl("qsa_visible", &qsa_visible);
  m.impl("qsa_sparse_attn", &qsa_sparse_attn);
  m.impl("qsa_gather_fp16", &qsa_gather_fp16);
}
