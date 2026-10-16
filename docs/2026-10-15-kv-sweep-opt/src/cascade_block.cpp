// ============================================================================
// Exact shared-prefix cascade (agent-work kv-sweep-opt-20261015).
//
// C4 decode walks the same physically shared prefix pages once per request.
// The cascade walks every shared page ONCE per layer for all participating
// requests, then walks each request's private tail with the unchanged
// per-request kernel, and merges with the unchanged log-sum-exp S2 merge.
//
// Exactness: every (request, row, page) partial (M, L, normalized PV) is
// computed with the same instructions in the same order as the serial path,
// and S2 merges the same pages in the same order with the same N_SG chunking.
// Only the address of a prefix-page partial changes.  Output is designed to be
// bit-identical to int8k_int4v_attn_batch (gate: GPU A/B, max abs diff 0).
//
// Graph legality: the shared-page count is computed ON DEVICE by a one-WG
// plan kernel from the block table and causal ends.  Launch geometry is the
// same as the serial path (n_splits x HKV work-groups, early exit).
//   plan[0] = S shared pages, plan[1] = leader request,
//   plan[2+i] = S if request i participates else 0 (its tail then starts at 0).
// A page is shared only if it is fully visible to every query row of every
// participant and its block-table entry is identical for all participants.
// ============================================================================
class Xe2KvCascadePlanKernel;
template <int HKV, bool PF16> class Xe2KvCascadeS1PackedKernel;
template <int HKV, bool PF16> class Xe2KvCascadeS1MultiKernel;
template <int HKV> class Xe2KvCascadeS2Half8;
template <int HKV> class Xe2KvCascadeS2Half16;
template <int HKV> class Xe2KvCascadeS2Half32;

static constexpr int CASC_MAX_B = 8;
static constexpr int CASC_PLAN_WG = 256;
static constexpr int CASC_PLAN_LEN = 2 + CASC_MAX_B;

static void launch_cascade_plan(sycl::queue &q, const std::int32_t *bt, int n_table, int batch,
                                int ratio, const std::int32_t *seq_lens,
                                const std::int32_t *visible, int vis_stride, int q_len,
                                int cap_pages, int n_splits, std::int32_t *plan) {
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<std::int32_t, 1> full(sycl::range<1>(CASC_MAX_B), h);
    h.parallel_for<Xe2KvCascadePlanKernel>(
        sycl::nd_range<1>(sycl::range<1>(CASC_PLAN_WG), sycl::range<1>(CASC_PLAN_WG)),
        [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          auto grp = item.get_group();
          if (lid < CASC_MAX_B) {
            std::int32_t pages = 0;
            if (lid < batch) {
              // Same ends the per-request S1 uses: page-valid length and the
              // causal end of each query row.  The prefix must be unmasked for all.
              const std::int64_t sl = visible
                  ? static_cast<std::int64_t>(visible[static_cast<size_t>(lid) * vis_stride])
                  : static_cast<std::int64_t>(seq_lens[lid]);
              std::int64_t qe = sl;
              for (int j = 0; j < q_len; ++j) {
                const std::int64_t e = visible
                    ? static_cast<std::int64_t>(visible[static_cast<size_t>(lid) * vis_stride + 1 + j])
                    : static_cast<std::int64_t>(seq_lens[lid]) - q_len + j + 1;
                qe = e < qe ? e : qe;
              }
              pages = qe >= BM ? static_cast<std::int32_t>(qe / BM) : 0;
            }
            full[lid] = pages;
          }
          item.barrier(sycl::access::fence_space::local_space);
          int leader = -1, npart = 0;
          std::int32_t min_full = 0x7fffffff;
          for (int i = 0; i < batch; ++i) {
            const std::int32_t f = full[i];
            if (f > 0) {
              if (leader < 0) leader = i;
              ++npart;
              min_full = f < min_full ? f : min_full;
            }
          }
          // First block-table entry where a participant differs from the leader.
          int first_mis = n_table;
          if (leader >= 0) {
            const std::int32_t *lrow = bt + static_cast<size_t>(leader) * n_table;
            for (int e = lid; e < n_table; e += CASC_PLAN_WG) {
              bool mis = false;
              for (int i = 0; i < batch; ++i) {
                if (i == leader || full[i] <= 0) continue;
                if (bt[static_cast<size_t>(i) * n_table + e] != lrow[e]) mis = true;
              }
              if (mis) { first_mis = e; break; }
            }
          }
          first_mis = sycl::reduce_over_group(grp, first_mis, sycl::minimum<int>());
          std::int64_t S = static_cast<std::int64_t>(first_mis) * ratio;
          if (S > min_full) S = min_full;
          if (S > cap_pages) S = cap_pages;
          if (S > n_splits) S = n_splits;
          if (npart < 2 || S < 0) S = 0;
          if (lid == 0) {
            plan[0] = static_cast<std::int32_t>(S);
            plan[1] = leader < 0 ? 0 : leader;
          }
          if (lid < CASC_MAX_B) {
            plan[2 + lid] = (lid < batch && full[lid] > 0) ? static_cast<std::int32_t>(S) : 0;
          }
        });
  });
}

// Shared prefix S1 for a packed tile: all requests' rows (B*q_len*GQA <= 64)
// in one Q tile.  Same body as launch_int8k_int4v_s1_paged (generic) with
// n_valid = BM and no causal mask (the plan guarantees full visibility).
// Per-row arithmetic is row-local, so each row's partial is bit-identical to
// the per-request (generic or small) kernel's partial for that page.
template <int HKV, bool PF16>
static void launch_cascade_s1_packed(sycl::queue &q, const std::int8_t *Q8, const float *Qsc,
                                     const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                     const float *VS, const float *VZ, const std::int32_t *bt,
                                     int n_table, const std::int32_t *plan, float *Part, float *M,
                                     float *L, int n_splits, int live_rows, int row_base, size_t k_page_stride,
                                     size_t v_page_stride, size_t sc_page_stride, int pages_per_block) {
  const int nprog = n_splits * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(kSlmFloats), h);
    h.parallel_for<Xe2KvCascadeS1PackedKernel<HKV, PF16>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          // Packed rows live in [row_base, row_base + live_rows).  row_base = TM keeps
          // tile rows 0..7 untouched, because a per-request small-kernel tail (q1)
          // publishes rows 0..7 of every page it walks.
          const bool sg_live = row0 >= row_base && row0 - row_base < live_rows;
          const int kv_head = prog / n_splits;
          const int logical = prog - kv_head * n_splits;
          if (logical >= plan[0]) return;  // work-group uniform
          const int n_valid = BM;
          const std::int32_t *lrow = bt + static_cast<size_t>(plan[1]) * n_table;
          const int phys = (pages_per_block <= 1)
                               ? static_cast<int>(lrow[logical])
                               : static_cast<int>(lrow[logical / pages_per_block]) * pages_per_block +
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
          for (int r = 0; r < TM; ++r) qsc[r] = sg_live ? Qsc[qsc_off + (row0 - row_base) + r] : 0.f;
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t)
            ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];

          if (sg_live) {
            jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::a, TM, TK_I8, jm::layout::row_major> a;
            jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::b, TK_I8, TN, jm::layout::col_major> b;
            jm::joint_matrix<sycl::sub_group, std::int32_t, jm::use::accumulator, TM, TN> c0, c1, c2, c3;
            jm::joint_matrix_fill(sg, c0, 0);
            jm::joint_matrix_fill(sg, c1, 0);
            jm::joint_matrix_fill(sg, c2, 0);
            jm::joint_matrix_fill(sg, c3, 0);
            for (int k = 0; k < BK; k += TK_I8) {
              jm::joint_matrix_load(sg, a, pQ8 + (row0 - row_base) * BK + k, BK);
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
              for (int t = 0; t < NTN; ++t) {
                const std::int32_t si = s_i32[row * BN + t * SG_SIZE + lane];
                float s = static_cast<float>(si) * qs * ksc[t] * INV_SQRT_D;
                if (row - row_base >= live_rows) s = -INFINITY;
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
          }
          sycl::group_barrier(sg);
          {
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::a, TM, TK, jm::layout::row_major> a;
            jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::b, TK, TN, jm::layout::row_major> b;
            for (int nbase = 0; nbase < BV; nbase += KV_HALF) {
              decode_v_int4_vec_strided(lid, V4 + v_head_off, v_tok_stride, VS + sc_head_off,
                                        VZ + sc_head_off, sc_tok_stride, nbase, n_valid, kv_tile);
              item.barrier(sycl::access::fence_space::local_space);
              if (sg_live)
              for (int n0 = 0; n0 < KV_HALF; n0 += TN * PV_NCHUNK) {
                jm::joint_matrix<sycl::sub_group, float, jm::use::accumulator, TM, TN> c0, c1, c2, c3;
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
                  jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::accumulator, TM, TN> h0, h1, h2, h3;
                  jm::joint_matrix_copy(sg, c0, h0);
                  jm::joint_matrix_copy(sg, c1, h1);
                  jm::joint_matrix_copy(sg, c2, h2);
                  jm::joint_matrix_copy(sg, c3, h3);
                  jm::joint_matrix_store(sg, h0, pOh + row0 * BV + nbase + n0 + 0 * TN, BV, jm::layout::row_major);
                  jm::joint_matrix_store(sg, h1, pOh + row0 * BV + nbase + n0 + 1 * TN, BV, jm::layout::row_major);
                  jm::joint_matrix_store(sg, h2, pOh + row0 * BV + nbase + n0 + 2 * TN, BV, jm::layout::row_major);
                  jm::joint_matrix_store(sg, h3, pOh + row0 * BV + nbase + n0 + 3 * TN, BV, jm::layout::row_major);
                } else {
                  jm::joint_matrix_store(sg, c0, pO + row0 * BV + nbase + n0 + 0 * TN, BV, jm::layout::row_major);
                  jm::joint_matrix_store(sg, c1, pO + row0 * BV + nbase + n0 + 1 * TN, BV, jm::layout::row_major);
                  jm::joint_matrix_store(sg, c2, pO + row0 * BV + nbase + n0 + 2 * TN, BV, jm::layout::row_major);
                  jm::joint_matrix_store(sg, c3, pO + row0 * BV + nbase + n0 + 3 * TN, BV, jm::layout::row_major);
                }
              }
              if (nbase + KV_HALF < BV) item.barrier(sycl::access::fence_space::local_space);
            }
          }
        });
  });
}

// Shared prefix S1 for the MTP6 verifier (q7, compact path): one work-group
// per (shared page, KV head) walks the page for every participating request in
// turn.  The page's K/V comes from DRAM once; requests 1..B-1 re-read it from
// the Xe-core cache instead of four separate full-context sweeps.
// The per-request body is launch_int8k_int4v_s1_paged_reuse<.., 64> verbatim
// (n_valid = BM, no causal mask needed).  Request r writes its prefix partials
// to region r: r == 0 -> the main workspace (64-row slots, slot = head *
// n_splits + page); r >= 1 -> extra region (slot_rows-row slots, slot =
// ((r-1) * HKV + head) * cap_pages + page).
template <int HKV, bool PF16>
static void launch_cascade_s1_multi(sycl::queue &q, const std::int8_t *Q8all, const float *Qscall,
                                    const std::int8_t *K8, const float *Ksc, const std::uint8_t *V4,
                                    const float *VS, const float *VZ, const std::int32_t *bt,
                                    int n_table, const std::int32_t *plan, int batch,
                                    float *Part0, float *M0, float *L0, sycl::half *PartX,
                                    float *MX, float *LX, int cap_pages, int slot_rows,
                                    int n_splits, int q_len, size_t k_page_stride,
                                    size_t v_page_stride, size_t sc_page_stride,
                                    int pages_per_block) {
  constexpr int GQA = Heads<HKV>::gqa;
  constexpr int COLS = 64;
  const int nprog = n_splits * HKV;
  const int k_tok_stride = HKV * BK;
  const int v_tok_stride = HKV * V4_COLS;
  const int sc_tok_stride = HKV;
  sycl::range<1> g(static_cast<size_t>(nprog) * WG_SIZE);
  sycl::range<1> l(WG_SIZE);
  q.submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> slm(sycl::range<1>(8192 / sizeof(float)), h);
    h.parallel_for<Xe2KvCascadeS1MultiKernel<HKV, PF16>>(
        sycl::nd_range<1>(g, l), [=](sycl::nd_item<1> item) [[sycl::reqd_sub_group_size(SG_SIZE)]] {
          const int lid = static_cast<int>(item.get_local_id(0));
          const int prog = static_cast<int>(item.get_group(0));
          auto sg = item.get_sub_group();
          const int sg_id = static_cast<int>(sg.get_group_id());
          const int row0 = sg_id * TM;
          const int lane = static_cast<int>(sg.get_local_id());
          const bool sg_live = row0 < q_len * GQA;
          const int kv_head = prog / n_splits;
          const int logical = prog - kv_head * n_splits;
          if (logical >= plan[0]) return;  // work-group uniform
          const int n_valid = BM;
          const std::int32_t *lrow = bt + static_cast<size_t>(plan[1]) * n_table;
          const int phys = (pages_per_block <= 1)
                               ? static_cast<int>(lrow[logical])
                               : static_cast<int>(lrow[logical / pages_per_block]) * pages_per_block +
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
          const size_t k_head_off =
              static_cast<size_t>(phys) * k_page_stride + static_cast<size_t>(kv_head) * BK;
          const size_t v_head_off =
              static_cast<size_t>(phys) * v_page_stride + static_cast<size_t>(kv_head) * V4_COLS;
          const size_t sc_head_off =
              static_cast<size_t>(phys) * sc_page_stride + static_cast<size_t>(kv_head);
          auto pK8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                              sycl::access::decorated::no>(
              const_cast<std::int8_t *>(K8 + k_head_off));
          float ksc[NTN];
#pragma unroll
          for (int t = 0; t < NTN; ++t)
            ksc[t] = Ksc[sc_head_off + static_cast<size_t>(t * SG_SIZE + lane) * sc_tok_stride];
          const int v_tok = lid >> 1;
          const float v_scale = VS[sc_head_off + v_tok * sc_tok_stride];
          const float v_zero = VZ[sc_head_off + v_tok * sc_tok_stride];

#pragma unroll 1
          for (int req = 0; req < batch; ++req) {
            if (plan[2 + req] == 0) continue;  // work-group uniform
            // Previous request's PV still reads the aliased SLM tile.
            item.barrier(sycl::access::fence_space::local_space);
            const size_t q_off = (static_cast<size_t>(req) * HKV + kv_head) * BM * BK;
            const size_t qsc_off = (static_cast<size_t>(req) * HKV + kv_head) * BM;
            float *Mr;
            float *Lr;
            float *PartF = nullptr;
            sycl::half *PartH;
            size_t ml_off, o_off;
            int rows_cap;
            if (req == 0) {
              Mr = M0;
              Lr = L0;
              PartF = Part0;
              PartH = reinterpret_cast<sycl::half *>(Part0);
              ml_off = static_cast<size_t>(prog) * BM;
              o_off = static_cast<size_t>(prog) * BM * BV;
              rows_cap = BM;
            } else {
              const size_t slot =
                  (static_cast<size_t>(req - 1) * HKV + kv_head) * cap_pages + logical;
              Mr = MX;
              Lr = LX;
              PartH = PartX;
              ml_off = slot * slot_rows;
              o_off = slot * slot_rows * BV;
              rows_cap = slot_rows;
            }
            auto pQ8 = sycl::address_space_cast<sycl::access::address_space::global_space,
                                                sycl::access::decorated::no>(
                const_cast<std::int8_t *>(Q8all + q_off));
            auto pOh = sycl::address_space_cast<sycl::access::address_space::global_space,
                                                sycl::access::decorated::no>(PartH + o_off);
            float qsc[TM];
#pragma unroll
            for (int r = 0; r < TM; ++r) qsc[r] = Qscall[qsc_off + row0 + r];

            float first_scores[TM][2];
            for (int half = 0; half < 2; ++half) {
              if (sg_live) {
                jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::a, TM, TK_I8, jm::layout::row_major> a;
                jm::joint_matrix<sycl::sub_group, std::int8_t, jm::use::b, TK_I8, TN, jm::layout::col_major> b;
                jm::joint_matrix<sycl::sub_group, std::int32_t, jm::use::accumulator, TM, TN> c0, c1;
                jm::joint_matrix_fill(sg, c0, 0);
                jm::joint_matrix_fill(sg, c1, 0);
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
              if (half == 0 && sg_live) {
#pragma unroll
                for (int r = 0; r < TM; ++r) {
#pragma unroll
                  for (int t = 0; t < 2; ++t)
                    first_scores[r][t] =
                        static_cast<float>(s_i32[(row0 + r) * 32 + t * 16 + lane]) * qsc[r] * ksc[t] * INV_SQRT_D;
                }
              }
              sycl::group_barrier(sg);
            }

            sycl::half saved_p[TM][NTN];
            if (!sg_live) {
              if (lane < TM && row0 + lane < rows_cap) {
                Mr[ml_off + row0 + lane] = -INFINITY;
                Lr[ml_off + row0 + lane] = 0.f;
              }
            } else {
#pragma unroll
              for (int r = 0; r < TM; ++r) {
                const int row = row0 + r;
                const float qs = qsc[r];
                float m = -INFINITY;
                float vals[NTN];
                for (int t = 0; t < NTN; ++t) {
                  float s;
                  if (t < 2) s = first_scores[r][t];
                  else {
                    const std::int32_t si = s_i32[row * 32 + (t - 2) * SG_SIZE + lane];
                    s = static_cast<float>(si) * qs * ksc[t] * INV_SQRT_D;
                  }
                  if (row >= q_len * GQA) s = -INFINITY;
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
                for (int t = 0; t < NTN; ++t) saved_p[r][t] = sycl::half(e[t] * inv);
                if (lane == 0) {
                  Mr[ml_off + row] = m;
                  Lr[ml_off + row] = sum;
                }
              }
            }
            item.barrier(sycl::access::fence_space::local_space);
            if (sg_live) {
#pragma unroll
              for (int r = 0; r < TM; ++r) {
#pragma unroll
                for (int t = 0; t < NTN; ++t) p_slm[(row0 + r) * BN + t * SG_SIZE + lane] = saved_p[r][t];
              }
            }
            item.barrier(sycl::access::fence_space::local_space);
            {
              jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::a, TM, TK, jm::layout::row_major> a0, a1, a2, a3;
              jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::b, TK, TN, jm::layout::row_major> b;
              if (sg_live) {
                jm::joint_matrix_load(sg, a0, p_slm + row0 * BN, BN);
                jm::joint_matrix_load(sg, a1, p_slm + row0 * BN + 16, BN);
                jm::joint_matrix_load(sg, a2, p_slm + row0 * BN + 32, BN);
                jm::joint_matrix_load(sg, a3, p_slm + row0 * BN + 48, BN);
              }
              item.barrier(sycl::access::fence_space::local_space);
#pragma unroll 1
              for (int nbase = 0; nbase < BV; nbase += COLS) {
                decode_v_int4_reuse<COLS>(lid, V4 + v_head_off, v_tok_stride, v_scale, v_zero, nbase,
                                          n_valid, kv_tile);
                item.barrier(sycl::access::fence_space::local_space);
                if (sg_live) {
                  jm::joint_matrix<sycl::sub_group, float, jm::use::accumulator, TM, TN> c0, c1, c2, c3;
                  jm::joint_matrix_fill(sg, c0, 0.f);
                  jm::joint_matrix_fill(sg, c1, 0.f);
                  jm::joint_matrix_fill(sg, c2, 0.f);
                  jm::joint_matrix_fill(sg, c3, 0.f);
#define CASC_MAD(A, K)                                                    \
  jm::joint_matrix_load(sg, b, pKV + K * COLS, COLS);                     \
  jm::joint_matrix_mad(sg, c0, A, b, c0);                                 \
  jm::joint_matrix_load(sg, b, pKV + K * COLS + 16, COLS);                \
  jm::joint_matrix_mad(sg, c1, A, b, c1);                                 \
  jm::joint_matrix_load(sg, b, pKV + K * COLS + 32, COLS);                \
  jm::joint_matrix_mad(sg, c2, A, b, c2);                                 \
  jm::joint_matrix_load(sg, b, pKV + K * COLS + 48, COLS);                \
  jm::joint_matrix_mad(sg, c3, A, b, c3);
                  CASC_MAD(a0, 0);
                  CASC_MAD(a1, 16);
                  CASC_MAD(a2, 32);
                  CASC_MAD(a3, 48);
#undef CASC_MAD
                  if constexpr (PF16) {
                    jm::joint_matrix<sycl::sub_group, sycl::half, jm::use::accumulator, TM, TN> h0, h1, h2, h3;
                    jm::joint_matrix_copy(sg, c0, h0);
                    jm::joint_matrix_copy(sg, c1, h1);
                    jm::joint_matrix_copy(sg, c2, h2);
                    jm::joint_matrix_copy(sg, c3, h3);
                    jm::joint_matrix_store(sg, h0, pOh + row0 * BV + nbase, BV, jm::layout::row_major);
                    jm::joint_matrix_store(sg, h1, pOh + row0 * BV + nbase + 16, BV, jm::layout::row_major);
                    jm::joint_matrix_store(sg, h2, pOh + row0 * BV + nbase + 32, BV, jm::layout::row_major);
                    jm::joint_matrix_store(sg, h3, pOh + row0 * BV + nbase + 48, BV, jm::layout::row_major);
                  } else {
                    // fp32 partials exist only for region 0 (host enforces PF16 for B>1 regions).
                    auto pO = sycl::address_space_cast<sycl::access::address_space::global_space,
                                                       sycl::access::decorated::no>(PartF + o_off);
                    jm::joint_matrix_store(sg, c0, pO + row0 * BV + nbase, BV, jm::layout::row_major);
                    jm::joint_matrix_store(sg, c1, pO + row0 * BV + nbase + 16, BV, jm::layout::row_major);
                    jm::joint_matrix_store(sg, c2, pO + row0 * BV + nbase + 32, BV, jm::layout::row_major);
                    jm::joint_matrix_store(sg, c3, pO + row0 * BV + nbase + 48, BV, jm::layout::row_major);
                  }
                }
                if (nbase + COLS < BV) item.barrier(sycl::access::fence_space::local_space);
              }
            }
          }
        });
  });
}

// S2 for one request of a cascade.  Identical to launch_s2_parallel's
// fp16-partial one-page-lookahead path (same n_live, same N_SG chunking, same
// page order and arithmetic); only a page s < S_r reads its state from the
// prefix region: slot = pre_base + head * pre_nsplits + s, row = row + pre_row_off,
// slot rows = pre_rows.
template <typename KernelName, int HKV, int N_SG>
static void launch_s2_cascade_half(sycl::queue &q, const float *M, const float *L, const sycl::half *Acc,
                                   const float *Mp, const float *Lp, const sycl::half *Ap,
                                   size_t pre_base, int pre_nsplits, int pre_rows, int pre_row_off,
                                   const std::int32_t *s_ptr, sycl::half *Out,
                                   const std::int32_t *seq_lens, int n_splits, int tq) {
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
          const int S = s_ptr[0];
          const std::int64_t seq_len = static_cast<std::int64_t>(seq_lens[0]);
          const int n_live = static_cast<int>(sycl::max(
              static_cast<std::int64_t>(1),
              sycl::min(static_cast<std::int64_t>(n_splits), (seq_len + BM - 1) / BM)));
          const int chunk = (n_live + N_SG - 1) / N_SG;
          const int s0 = sg_id * chunk;
          const int s1 = s0 + chunk < n_live ? s0 + chunk : n_live;
          auto ml_index = [&](int s) -> size_t {
            return s < S ? (pre_base + static_cast<size_t>(head) * pre_nsplits + s) * pre_rows + row + pre_row_off
                         : static_cast<size_t>(p0 + s) * BM + row;
          };
          float gm = -INFINITY;
          float lsum = 0.f;
          sycl::vec<float, VEC> ov[NV];
#pragma unroll
          for (int t = 0; t < NV; ++t) ov[t] = sycl::vec<float, VEC>(0.f);
          float next_m = -INFINITY, next_l = 0.f;
          sycl::vec<sycl::half, VEC> next_v[NV];
          if (s0 < s1) {
            const size_t first = ml_index(s0);
            const bool pre = s0 < S;
            next_m = (pre ? Mp : M)[first];
            next_l = (pre ? Lp : L)[first];
            const sycl::half *ab = pre ? Ap : Acc;
#pragma unroll
            for (int t = 0; t < NV; ++t) {
              const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
              next_v[t].load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                         sycl::access::decorated::no>(
                                    const_cast<sycl::half *>(ab + first * BV + d0)));
            }
          }
          for (int s = s0; s < s1; ++s) {
            const float mv = next_m, lv = next_l;
            sycl::vec<float, VEC> current_v[NV];
#pragma unroll
            for (int t = 0; t < NV; ++t) current_v[t] = next_v[t].template convert<float>();
            if (s + 1 < s1) {
              const size_t next = ml_index(s + 1);
              const bool pre = (s + 1) < S;
              next_m = (pre ? Mp : M)[next];
              next_l = (pre ? Lp : L)[next];
              const sycl::half *ab = pre ? Ap : Acc;
#pragma unroll
              for (int t = 0; t < NV; ++t) {
                const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
                next_v[t].load(0, sycl::address_space_cast<sycl::access::address_space::global_space,
                                                           sycl::access::decorated::no>(
                                      const_cast<sycl::half *>(ab + next * BV + d0)));
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
          if (lane == 0) {
            slm[sg_id] = gm;
            slm[N_SG + sg_id] = lsum;
          }
#pragma unroll
          for (int t = 0; t < NV; ++t) {
            const int d0 = t * (SG_SIZE * VEC) + lane * VEC;
#pragma unroll
            for (int k = 0; k < VEC; ++k) slm[2 * N_SG + sg_id * BV + d0 + k] = ov[t][k];
          }
          item.barrier(sycl::access::fence_space::local_space);
          if (sg_id != 0) return;
          gm = -INFINITY;
          lsum = 0.f;
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
static void launch_s2_cascade_half_nsg(sycl::queue &q, int nsg, const float *M, const float *L,
                                       const sycl::half *Acc, const float *Mp, const float *Lp,
                                       const sycl::half *Ap, size_t pre_base, int pre_nsplits,
                                       int pre_rows, int pre_row_off, const std::int32_t *s_ptr,
                                       sycl::half *Out, const std::int32_t *seq_lens, int n_splits,
                                       int tq) {
  if (nsg == 8)
    launch_s2_cascade_half<Xe2KvCascadeS2Half8<HKV>, HKV, 8>(q, M, L, Acc, Mp, Lp, Ap, pre_base, pre_nsplits,
                                                             pre_rows, pre_row_off, s_ptr, Out, seq_lens,
                                                             n_splits, tq);
  else if (nsg == 16)
    launch_s2_cascade_half<Xe2KvCascadeS2Half16<HKV>, HKV, 16>(q, M, L, Acc, Mp, Lp, Ap, pre_base, pre_nsplits,
                                                               pre_rows, pre_row_off, s_ptr, Out, seq_lens,
                                                               n_splits, tq);
  else
    launch_s2_cascade_half<Xe2KvCascadeS2Half32<HKV>, HKV, 32>(q, M, L, Acc, Mp, Lp, Ap, pre_base, pre_nsplits,
                                                               pre_rows, pre_row_off, s_ptr, Out, seq_lens,
                                                               n_splits, tq);
}

// Host decision (capture-time constant): which cascade path, if any.
// 0 = serial fallback, 1 = packed tile (B*q_len*GQA <= 64), 2 = multi (q7 compact).
static int cascade_mode(int batch, int q_len, int gqa, bool half_out) {
  if (!env_is_1("XE2_KV_CASCADE")) return 0;
  if (batch < 2 || batch > CASC_MAX_B) return 0;
  // Bit-exactness is defined against the deployed fp16-partial parallel S2.
  if (!half_out || !s2_parallel_enabled() || !env_is_1("XE2_KV_PARTIAL_FP16") ||
      env_is_1("XE2_KV_S2_TWO_PASS"))
    return 0;
  // Packed tile: q1 drafts whose tails use the 8-row small kernel; packed rows sit at
  // rows TM.. so the tails (rows 0..7) never overwrite a participant's prefix rows.
  if (q_len * gqa <= TM && s1_small_enabled() && TM + batch * q_len * gqa <= BM) return 1;
  if (q_len == 7 && env_is_1("XE2_KV_COMPACT_SLM")) return 2;
  return 0;
}



// One graph-legal op: serial attn_batch semantics, cascade schedule.
// casc_q8 [CASC_MAX_B+1, HKV, 64, 256] int8, casc_qsc [CASC_MAX_B+1, HKV, 64] f32,
// casc_plan [>= CASC_PLAN_LEN] i32, casc_part [R, HKV, cap, slot_rows, 256] f16,
// casc_m / casc_l [R, HKV, cap, slot_rows] f32 with R >= batch-1 (multi path only).
static void int8k_int4v_attn_batch_cascade(
    const at::Tensor &q_fp16, at::Tensor q8, at::Tensor q_scale, const at::Tensor &k_cache,
    const at::Tensor &k_scale, const at::Tensor &v_cache, const at::Tensor &v_scale,
    const at::Tensor &v_zero, const at::Tensor &block_table, const at::Tensor &seq_lens,
    const at::Tensor &visible_lens, const at::Tensor &partials_ws, const at::Tensor &m_ws,
    const at::Tensor &l_ws, const at::Tensor &merged_ws, at::Tensor out, int64_t q_len,
    int64_t pages_per_block, at::Tensor casc_q8, at::Tensor casc_qsc, at::Tensor casc_plan,
    at::Tensor casc_part, at::Tensor casc_m, at::Tensor casc_l, int64_t cap_pages,
    int64_t slot_rows) {
  constexpr int GQA6 = Heads<2>::gqa;
  TORCH_CHECK(q_fp16.dim() == 3 && q_fp16.size(2) == BK, "q_fp16 [T,HQ,D]");
  TORCH_CHECK(q_len > 0 && q_len * GQA6 <= BM, "q_len*GQA exceeds BM");
  const int batch_h = static_cast<int>(q_fp16.size(0) / q_len);
  const bool half_out = out.scalar_type() == at::kHalf;
  const int mode = cascade_mode(batch_h, static_cast<int>(q_len), GQA6, half_out);
  if (mode == 0) {
    int8k_int4v_attn_batch(q_fp16, q8, q_scale, k_cache, k_scale, v_cache, v_scale, v_zero,
                           block_table, seq_lens, visible_lens, partials_ws, m_ws, l_ws, merged_ws,
                           out, q_len, pages_per_block);
    return;
  }
  if (mode == 2) {
    const int need_rows = static_cast<int>(((q_len * GQA6 + TM - 1) / TM) * TM);
    if (slot_rows < need_rows || cap_pages < 1) {
      int8k_int4v_attn_batch(q_fp16, q8, q_scale, k_cache, k_scale, v_cache, v_scale, v_zero,
                             block_table, seq_lens, visible_lens, partials_ws, m_ws, l_ws, merged_ws,
                             out, q_len, pages_per_block);
      return;
    }
  }
  dispatch_hkv(q_fp16.size(1) / GQA6, [&](auto hkv) {
    constexpr int HKV = decltype(hkv)::value;
    constexpr int HQ = Heads<HKV>::hq;
    constexpr int GQA = Heads<HKV>::gqa;
    const int tq = static_cast<int>(q_len);
    const int batch = batch_h;
    TORCH_CHECK(q_fp16.size(1) == HQ && q_fp16.is_contiguous() && q_fp16.scalar_type() == at::kHalf,
                "q_fp16 [T,HQ,D] fp16 contiguous");
    TORCH_CHECK(out.sizes() == q_fp16.sizes() && out.is_contiguous(), "out shape");
    TORCH_CHECK(q_fp16.size(0) % q_len == 0, "T must be B*q_len");
    TORCH_CHECK(block_table.dim() == 2 && block_table.size(0) == batch && block_table.is_contiguous() &&
                    block_table.scalar_type() == at::kInt,
                "block_table [B, n] int32 contiguous");
    TORCH_CHECK(seq_lens.numel() >= batch && seq_lens.is_contiguous() && seq_lens.scalar_type() == at::kInt,
                "seq_lens [B] int32");
    check_paged_k<HKV>(k_cache, k_scale);
    check_paged_v<HKV>(v_cache, v_scale, v_zero);
    const int ratio = pages_per_block < 1 ? 1 : static_cast<int>(pages_per_block);
    const int n_table = static_cast<int>(block_table.size(1));
    const int n_splits = n_table * ratio;
    const int nprog = n_splits * HKV;
    TORCH_CHECK(partials_ws.dim() == 3 && partials_ws.size(0) == nprog && partials_ws.size(1) == BM &&
                    partials_ws.size(2) == BV && partials_ws.scalar_type() == at::kFloat &&
                    partials_ws.is_contiguous(),
                "partials_ws [nprog,64,256] f32");
    TORCH_CHECK(m_ws.numel() >= static_cast<int64_t>(nprog) * BM && l_ws.numel() >= static_cast<int64_t>(nprog) * BM,
                "m/l workspace");
    TORCH_CHECK(casc_q8.scalar_type() == at::kChar && casc_q8.is_contiguous() &&
                    casc_q8.numel() >= static_cast<int64_t>(CASC_MAX_B + 1) * HKV * BM * BK,
                "casc_q8 [CASC_MAX_B+1,HKV,64,256] int8");
    TORCH_CHECK(casc_qsc.scalar_type() == at::kFloat && casc_qsc.is_contiguous() &&
                    casc_qsc.numel() >= static_cast<int64_t>(CASC_MAX_B + 1) * HKV * BM,
                "casc_qsc");
    TORCH_CHECK(casc_plan.scalar_type() == at::kInt && casc_plan.is_contiguous() &&
                    casc_plan.numel() >= CASC_PLAN_LEN,
                "casc_plan");
    const bool has_vis = visible_lens.defined() && visible_lens.numel() > 0;
    int vis_stride = 0;
    if (has_vis) {
      TORCH_CHECK(visible_lens.dim() == 2 && visible_lens.size(0) == batch &&
                      visible_lens.size(1) >= q_len + 1 && visible_lens.is_contiguous() &&
                      visible_lens.scalar_type() == at::kInt,
                  "visible_lens [B, 1+q_len]");
      vis_stride = static_cast<int>(visible_lens.size(1));
    }
    const std::int32_t *vis = has_vis ? visible_lens.data_ptr<int32_t>() : nullptr;
    const std::int32_t *bt = block_table.data_ptr<int32_t>();
    const std::int32_t *sl = seq_lens.data_ptr<int32_t>();
    std::int32_t *plan = casc_plan.data_ptr<int32_t>();
    std::int8_t *cq8 = casc_q8.data_ptr<int8_t>();
    float *cqs = casc_qsc.data_ptr<float>();
    float *part = partials_ws.data_ptr<float>();
    float *mw = m_ws.data_ptr<float>();
    float *lw = l_ws.data_ptr<float>();
    const auto *parth = reinterpret_cast<const sycl::half *>(part);
    auto *dst = reinterpret_cast<sycl::half *>(out.data_ptr<at::Half>());
    const size_t kps = static_cast<size_t>(k_cache.stride(0));
    const size_t vps = static_cast<size_t>(v_cache.stride(0));
    const size_t sps = static_cast<size_t>(k_scale.stride(0));
    const std::int8_t *K8 = k_cache.data_ptr<int8_t>();
    const float *KS = k_scale.data_ptr<float>();
    const std::uint8_t *V4 = v_cache.data_ptr<uint8_t>();
    const float *VS = v_scale.data_ptr<float>();
    const float *VZ = v_zero.data_ptr<float>();
    const auto *qtok = as_half_c(q_fp16);
    const size_t tile_q8 = static_cast<size_t>(HKV) * BM * BK;
    const size_t tile_qs = static_cast<size_t>(HKV) * BM;
    const int nsg = s2_parallel_subgroups(tq);
    auto &queue = current_xpu_queue();
    sycl::half *xpart = nullptr;
    float *xm = nullptr, *xl = nullptr;
    if (mode == 2) {
      const int64_t need = static_cast<int64_t>(batch - 1) * HKV * cap_pages * slot_rows;
      TORCH_CHECK(casc_part.scalar_type() == at::kHalf && casc_part.is_contiguous() &&
                      casc_part.numel() >= need * BV,
                  "casc_part [R,HKV,cap,slot_rows,256] f16 too small");
      TORCH_CHECK(casc_m.scalar_type() == at::kFloat && casc_l.scalar_type() == at::kFloat &&
                      casc_m.numel() >= need && casc_l.numel() >= need,
                  "casc_m/l too small");
      xpart = reinterpret_cast<sycl::half *>(casc_part.data_ptr<at::Half>());
      xm = casc_m.data_ptr<float>();
      xl = casc_l.data_ptr<float>();
    }
    launch_cascade_plan(queue, bt, n_table, batch, ratio, sl, vis, vis_stride, tq,
                        mode == 2 ? static_cast<int>(cap_pages) : n_splits, n_splits, plan);
    if (mode == 1) {
      // Packed tile CASC_MAX_B holds every request's rows: request i at rows i*tq*GQA.
      launch_pack_q_quant<HKV>(queue, qtok, cq8 + CASC_MAX_B * tile_q8, cqs + CASC_MAX_B * tile_qs, batch * tq);
      launch_cascade_s1_packed<HKV, true>(queue, cq8 + CASC_MAX_B * tile_q8, cqs + CASC_MAX_B * tile_qs, K8, KS,
                                          V4, VS, VZ, bt, n_table, plan, part, mw, lw, n_splits,
                                          batch * tq * GQA, TM, kps, vps, sps, ratio);
    } else {
      for (int i = 0; i < batch; ++i)
        launch_pack_q_quant<HKV>(queue, qtok + static_cast<size_t>(i) * tq * HQ * BK, cq8 + i * tile_q8,
                                 cqs + i * tile_qs, tq);
      launch_cascade_s1_multi<HKV, true>(queue, cq8, cqs, K8, KS, V4, VS, VZ, bt, n_table, plan, batch,
                                         part, mw, lw, xpart, xm, xl, static_cast<int>(cap_pages),
                                         static_cast<int>(slot_rows), n_splits, tq, kps, vps, sps, ratio);
    }
    for (int i = 0; i < batch; ++i) {
      const std::int32_t *bt_i = bt + static_cast<size_t>(i) * n_table;
      const std::int32_t *sl_i = sl + i;
      const std::int32_t *vis_i = has_vis ? vis + static_cast<size_t>(i) * vis_stride : nullptr;
      const std::int32_t *pb_i = plan + 2 + i;
      std::int8_t *q8_i = cq8 + i * tile_q8;
      float *qs_i = cqs + i * tile_qs;
      if (mode == 1)  // tail Q tile for request i (multi mode packed it above)
        launch_pack_q_quant<HKV>(queue, qtok + static_cast<size_t>(i) * tq * HQ * BK, q8_i, qs_i, tq);
      // Tail S1: the same kernel choice as int8k_int4v_s1_paged_impl, skipping pages < plan[2+i].
      if (tq == 7 && env_is_1("XE2_KV_COMPACT_SLM"))
        launch_int8k_int4v_s1_paged_reuse<HKV, true, 64>(queue, q8_i, qs_i, K8, KS, V4, VS, VZ, bt_i, sl_i, part,
                                                          mw, lw, n_splits, tq, kps, vps, sps, vis_i, ratio, pb_i);
      else
        launch_int8k_int4v_s1_paged<HKV, true>(queue, q8_i, qs_i, K8, KS, V4, VS, VZ, bt_i, sl_i, part, mw, lw,
                                               n_splits, tq, kps, vps, sps, vis_i, ratio, pb_i);
      const std::int32_t *s2_seq = vis_i ? vis_i : sl_i;
      sycl::half *dst_i = dst + static_cast<size_t>(i) * tq * HQ * BV;
      if (mode == 1) {
        launch_s2_cascade_half_nsg<HKV>(queue, nsg, mw, lw, parth, mw, lw, parth, 0, n_splits, BM,
                                        TM + i * tq * GQA, pb_i, dst_i, s2_seq, n_splits, tq);
      } else if (i == 0) {
        launch_s2_cascade_half_nsg<HKV>(queue, nsg, mw, lw, parth, mw, lw, parth, 0, n_splits, BM, 0, pb_i,
                                        dst_i, s2_seq, n_splits, tq);
      } else {
        launch_s2_cascade_half_nsg<HKV>(queue, nsg, mw, lw, parth, xm, xl, xpart,
                                        static_cast<size_t>(i - 1) * HKV * cap_pages,
                                        static_cast<int>(cap_pages), static_cast<int>(slot_rows), 0, pb_i,
                                        dst_i, s2_seq, n_splits, tq);
      }
    }
  });
}
