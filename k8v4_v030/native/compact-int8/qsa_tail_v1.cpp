// Separate compact QSA decode ABI. Legacy xe2_qsa is unchanged.
// update() is the FP32 pooled ABI and is left bit-identical.
// update_i8() writes per-row symmetric INT8 pooled keys plus one FP32 scale.
// Requires externally serialized calls and fresh/rebased block-generation tags.
// status is sticky: bit 1 invalid physical slot, bit 2 retired raw history.
// No serving adapter is enabled by this library. A completion boundary must
// reject status!=0 before model output publication. Prefill/copy/reset are NOT
// implemented by this decode-only ABI. Never route production to it implicitly.
#include <sycl/sycl.hpp>
#include <ATen/ATen.h>
#include <ATen/MemoryOverlap.h>
#include <c10/xpu/XPUStream.h>
#include <torch/library.h>
#include <cfloat>
#include <cmath>
#include <cstdint>
#include <vector>

namespace qsa_tail_v1 {
class Validate;
class Pool;
class Retain;

static void update(const at::Tensor &slots, const at::Tensor &keys,
                   const at::Tensor &positions, const at::Tensor &weight,
                   const at::Tensor &freqs, at::Tensor raw, at::Tensor pos,
                   at::Tensor tags, at::Tensor filled, at::Tensor pooled,
                   at::Tensor valid, at::Tensor status, int64_t block,
                   int64_t tail, double eps) {
  const std::vector<at::Tensor> inputs{slots, keys, positions, weight, freqs};
  const std::vector<at::Tensor> outputs{raw, pos, tags, filled, pooled, valid, status};
  for (const auto &t : inputs) {
    TORCH_CHECK(t.is_xpu(), "compact QSA tensor must be XPU");
    TORCH_CHECK(t.device() == slots.device(), "compact QSA same-device contract");
  }
  for (size_t i=0; i<outputs.size(); ++i) {
    const auto &t=outputs[i];
    TORCH_CHECK(t.is_xpu(), "compact QSA tensor must be XPU");
    TORCH_CHECK(t.device()==slots.device() && t.is_contiguous(), "compact QSA output storage");
    at::assert_no_internal_overlap(t);
    for (const auto &a : inputs) at::assert_no_overlap(a, t);
    for (size_t j=0; j<i; ++j) at::assert_no_overlap(outputs[j], t);
  }
  TORCH_CHECK(block>0 && block%64==0 && tail>0 && tail%4==0 && tail<=block &&
              block<=INT32_MAX && tail<=INT32_MAX && std::isfinite(eps) && eps>0,
              "compact QSA geometry");
  const int64_t nslots=filled.numel(), ntail=raw.dim()==2 ? raw.size(0) : 0;
  const int64_t n64=slots.numel();
  TORCH_CHECK(n64>0 && n64<=128 && nslots>0 && nslots<=INT32_MAX && nslots%block==0 &&
              ntail==(nslots/block)*tail, "compact QSA extent");
  const int n=static_cast<int>(n64);
  TORCH_CHECK(slots.scalar_type()==at::kLong && keys.scalar_type()==at::kFloat &&
              (positions.scalar_type()==at::kInt || positions.scalar_type()==at::kLong) &&
              weight.scalar_type()==at::kFloat && freqs.scalar_type()==at::kFloat &&
              raw.scalar_type()==at::kFloat && pos.scalar_type()==at::kInt &&
              tags.scalar_type()==at::kLong && filled.scalar_type()==at::kBool &&
              pooled.scalar_type()==at::kFloat && valid.scalar_type()==at::kBool &&
              status.scalar_type()==at::kInt, "compact QSA dtypes");
  TORCH_CHECK(slots.dim()==1 && keys.sizes()==at::IntArrayRef({n,128}) &&
              positions.sizes()==at::IntArrayRef({n,4}) && weight.dim()==1 && weight.numel()==128 &&
              freqs.dim()==1 && freqs.numel()==32 && freqs.is_contiguous() &&
              raw.sizes()==at::IntArrayRef({ntail,128}) && pos.sizes()==at::IntArrayRef({ntail,4}) &&
              tags.dim()==1 && tags.numel()==ntail && filled.dim()==1 &&
              pooled.sizes()==at::IntArrayRef({nslots/4,128}) && valid.dim()==1 &&
              valid.numel()==nslots/4 && status.dim()==1 && status.numel()==1,
              "compact QSA shapes");
  const auto *sp=slots.data_ptr<int64_t>(); const auto *kp=keys.data_ptr<float>();
  const bool p64=positions.scalar_type()==at::kLong;
  const auto *p32=p64 ? nullptr : positions.data_ptr<int32_t>();
  const auto *p64p=p64 ? positions.data_ptr<int64_t>() : nullptr;
  const auto *wp=weight.data_ptr<float>(); const auto *fp=freqs.data_ptr<float>();
  const int64_t ss=slots.stride(0), ks0=keys.stride(0), ks1=keys.stride(1);
  const int64_t ps0=positions.stride(0), ps1=positions.stride(1), ws=weight.stride(0);
  auto *rp=raw.data_ptr<float>(); auto *pc=pos.data_ptr<int32_t>();
  auto *tp=tags.data_ptr<int64_t>(); auto *fc=filled.data_ptr<bool>();
  auto *po=pooled.data_ptr<float>(); auto *pv=valid.data_ptr<bool>();
  auto *st=status.data_ptr<int32_t>();
  auto &q=c10::xpu::getCurrentXPUStream(slots.device().index()).queue();
  // Separate validation launch completes before any mutable cache is touched.
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Validate>(sycl::range<1>(n), [=](sycl::id<1> id) {
      const int i=id[0]; const int64_t slot=sp[i*ss];
      int error=0;
      if (slot>=nslots) error=1;
      else if (slot>=0) {
        const int64_t first=(slot/4)*4;
        for (int j=0; j<4; ++j) {
          const int64_t cell=first+j;
          bool incoming=false;
          for (int k=0; k<n; ++k) incoming |= sp[k*ss]==cell;
          const int64_t r=(cell/block)*tail+(cell%block)%tail;
          if (!incoming && fc[cell] && tp[r]!=cell) error|=2;
        }
      }
      if (error) {
        sycl::atomic_ref<int32_t,sycl::memory_order::relaxed,sycl::memory_scope::device,
                         sycl::access::address_space::global_space> a(st[0]);
        a.fetch_or(error);
      }
    });
  });
  // All pooled results consume immutable incoming keys or the OLD raw bank.
  // Retention runs only after every pool group completes, avoiding ring races.
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Pool>(sycl::nd_range<1>(sycl::range<1>(n*16),sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        if (st[0]) return;
        const int i=it.get_group(0), lane=it.get_local_id(0);
        const int64_t slot=sp[i*ss];
        if (slot<0) return;
        const int64_t first=(slot/4)*4;
        for (int k=0; k<i; ++k) if (sp[k*ss]>=0 && sp[k*ss]/4==slot/4) return;
        int source[4]; int64_t ring[4]; bool complete=true;
        for (int j=0; j<4; ++j) {
          source[j]=-1;
          for (int k=0; k<n; ++k) if (sp[k*ss]==first+j) source[j]=k;
          ring[j]=((first+j)/block)*tail+((first+j)%block)%tail;
          complete &= source[j]>=0 || fc[first+j];
        }
        if (lane==0) pv[first/4]=complete;
        if (complete) {
          auto sg=it.get_sub_group(); float x[8]; float sum=0.f;
          for (int j=0; j<8; ++j) {
            const int d=lane*8+j;
            float v[4];
            for (int t=0; t<4; ++t)
              v[t]=source[t]>=0 ? kp[source[t]*ks0+d*ks1] : rp[ring[t]*128+d];
            // Preserve the pinned legacy FP32 expression and subgroup reduction.
            x[j]=(v[0]+v[1]+v[2]+v[3])*0.25f; sum+=x[j]*x[j];
          }
          const float inv=sycl::rsqrt(sycl::reduce_over_group(sg,sum,sycl::plus<float>())/128+(float)eps);
          for (int j=0; j<8; ++j) x[j]=x[j]*inv*wp[(lane*8+j)*ws];
          for (int j=0; j<8; ++j) {
            const int d=lane*8+j;
            const float other=sycl::select_from_group(sg,x[j],(uint32_t)(lane^4));
            float result=x[j];
            if (d<64) {
              const int pair=d%32, axis=pair%3;
              const int32_t position=source[0]>=0 ? (p64 ? (int32_t)p64p[source[0]*ps0+axis*ps1] : p32[source[0]*ps0+axis*ps1]) : pc[ring[0]*4+axis];
              const float angle=(float)position*fp[pair];
              const float c=sycl::cos(angle), s=sycl::sin(angle);
              result=d<32 ? x[j]*c-other*s : other*s+x[j]*c;
            }
            po[(first/4)*128+d]=result;
          }
        }
        if (lane==0) for (int j=0; j<4; ++j) if (source[j]>=0) fc[first+j]=true;
      });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Retain>(sycl::nd_range<1>(sycl::range<1>(n*16),sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        if (st[0]) return;
        const int i=it.get_group(0), lane=it.get_local_id(0);
        const int64_t slot=sp[i*ss]; if (slot<0) return;
        const int64_t r=(slot/block)*tail+(slot%block)%tail;
        for (int k=0; k<n; ++k) {
          const int64_t other=sp[k*ss];
          if (other<0) continue;
          const int64_t rr=(other/block)*tail+(other%block)%tail;
          if (rr==r && (other>slot || (other==slot && k>i))) return;
        }
        // Elect before reading mutable tags: all other workgroups sharing r
        // have returned. Only lane zero reads/writes tp[r], preventing the
        // inter-group and intra-group read/write races in the old ordering.
        const int64_t old_tag=sycl::group_broadcast(it.get_group(),lane==0 ? tp[r] : int64_t{-1},0);
        if (slot<old_tag) return;
        for (int d=lane; d<128; d+=16) rp[r*128+d]=kp[i*ks0+d*ks1];
        if (lane<4) pc[r*4+lane]=p64 ? (int32_t)p64p[i*ps0+lane*ps1] : p32[i*ps0+lane*ps1];
        if (lane==0) tp[r]=slot;
      });
  });
}
class ValidateI8;
class PoolI8;
class RetainI8;

static void update_i8(const at::Tensor &slots, const at::Tensor &keys,
                   const at::Tensor &positions, const at::Tensor &weight,
                   const at::Tensor &freqs, at::Tensor raw, at::Tensor pos,
                   at::Tensor tags, at::Tensor filled, at::Tensor pooled,
                   at::Tensor valid, at::Tensor status, const at::Tensor &scales, int64_t block,
                   int64_t tail, double eps) {
  const std::vector<at::Tensor> inputs{slots, keys, positions, weight, freqs};
  const std::vector<at::Tensor> outputs{raw, pos, tags, filled, pooled, valid, status, scales};
  for (const auto &t : inputs) {
    TORCH_CHECK(t.is_xpu(), "compact QSA tensor must be XPU");
    TORCH_CHECK(t.device() == slots.device(), "compact QSA same-device contract");
  }
  for (size_t i=0; i<outputs.size(); ++i) {
    const auto &t=outputs[i];
    TORCH_CHECK(t.is_xpu(), "compact QSA tensor must be XPU");
    TORCH_CHECK(t.device()==slots.device() && t.is_contiguous(), "compact QSA output storage");
    at::assert_no_internal_overlap(t);
    for (const auto &a : inputs) at::assert_no_overlap(a, t);
    for (size_t j=0; j<i; ++j) at::assert_no_overlap(outputs[j], t);
  }
  TORCH_CHECK(block>0 && block%64==0 && tail>0 && tail%4==0 && tail<=block &&
              block<=INT32_MAX && tail<=INT32_MAX && std::isfinite(eps) && eps>0,
              "compact QSA geometry");
  const int64_t nslots=filled.numel(), ntail=raw.dim()==2 ? raw.size(0) : 0;
  const int64_t n64=slots.numel();
  TORCH_CHECK(n64>0 && n64<=128 && nslots>0 && nslots<=INT32_MAX && nslots%block==0 &&
              ntail==(nslots/block)*tail, "compact QSA extent");
  const int n=static_cast<int>(n64);
  TORCH_CHECK(slots.scalar_type()==at::kLong && keys.scalar_type()==at::kFloat &&
              (positions.scalar_type()==at::kInt || positions.scalar_type()==at::kLong) &&
              weight.scalar_type()==at::kFloat && freqs.scalar_type()==at::kFloat &&
              raw.scalar_type()==at::kFloat && pos.scalar_type()==at::kInt &&
              tags.scalar_type()==at::kLong && filled.scalar_type()==at::kBool &&
              pooled.scalar_type()==at::kChar && valid.scalar_type()==at::kBool &&
              status.scalar_type()==at::kInt && scales.scalar_type()==at::kFloat, "compact QSA dtypes");
  TORCH_CHECK(slots.dim()==1 && keys.sizes()==at::IntArrayRef({n,128}) &&
              positions.sizes()==at::IntArrayRef({n,4}) && weight.dim()==1 && weight.numel()==128 &&
              freqs.dim()==1 && freqs.numel()==32 && freqs.is_contiguous() &&
              raw.sizes()==at::IntArrayRef({ntail,128}) && pos.sizes()==at::IntArrayRef({ntail,4}) &&
              tags.dim()==1 && tags.numel()==ntail && filled.dim()==1 &&
              pooled.sizes()==at::IntArrayRef({nslots/4,128}) && valid.dim()==1 &&
              valid.numel()==nslots/4 && status.dim()==1 && status.numel()==1 && scales.dim()==1 && scales.numel()==nslots/4,
              "compact QSA shapes");
  const auto *sp=slots.data_ptr<int64_t>(); const auto *kp=keys.data_ptr<float>();
  const bool p64=positions.scalar_type()==at::kLong;
  const auto *p32=p64 ? nullptr : positions.data_ptr<int32_t>();
  const auto *p64p=p64 ? positions.data_ptr<int64_t>() : nullptr;
  const auto *wp=weight.data_ptr<float>(); const auto *fp=freqs.data_ptr<float>();
  const int64_t ss=slots.stride(0), ks0=keys.stride(0), ks1=keys.stride(1);
  const int64_t ps0=positions.stride(0), ps1=positions.stride(1), ws=weight.stride(0);
  auto *rp=raw.data_ptr<float>(); auto *pc=pos.data_ptr<int32_t>();
  auto *tp=tags.data_ptr<int64_t>(); auto *fc=filled.data_ptr<bool>();
  auto *po=pooled.data_ptr<int8_t>(); auto *pv=valid.data_ptr<bool>();
  auto *st=status.data_ptr<int32_t>();
  auto *sc=scales.data_ptr<float>();
  auto &q=c10::xpu::getCurrentXPUStream(slots.device().index()).queue();
  // Separate validation launch completes before any mutable cache is touched.
  q.submit([&](sycl::handler &h) {
    h.parallel_for<ValidateI8>(sycl::range<1>(n), [=](sycl::id<1> id) {
      const int i=id[0]; const int64_t slot=sp[i*ss];
      int error=0;
      if (slot>=nslots) error=1;
      else if (slot>=0) {
        const int64_t first=(slot/4)*4;
        for (int j=0; j<4; ++j) {
          const int64_t cell=first+j;
          bool incoming=false;
          for (int k=0; k<n; ++k) incoming |= sp[k*ss]==cell;
          const int64_t r=(cell/block)*tail+(cell%block)%tail;
          if (!incoming && fc[cell] && tp[r]!=cell) error|=2;
        }
      }
      if (error) {
        sycl::atomic_ref<int32_t,sycl::memory_order::relaxed,sycl::memory_scope::device,
                         sycl::access::address_space::global_space> a(st[0]);
        a.fetch_or(error);
      }
    });
  });
  // All pooled results consume immutable incoming keys or the OLD raw bank.
  // Retention runs only after every pool group completes, avoiding ring races.
  q.submit([&](sycl::handler &h) {
    h.parallel_for<PoolI8>(sycl::nd_range<1>(sycl::range<1>(n*16),sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        if (st[0]) return;
        const int i=it.get_group(0), lane=it.get_local_id(0);
        const int64_t slot=sp[i*ss];
        if (slot<0) return;
        const int64_t first=(slot/4)*4;
        for (int k=0; k<i; ++k) if (sp[k*ss]>=0 && sp[k*ss]/4==slot/4) return;
        int source[4]; int64_t ring[4]; bool complete=true;
        for (int j=0; j<4; ++j) {
          source[j]=-1;
          for (int k=0; k<n; ++k) if (sp[k*ss]==first+j) source[j]=k;
          ring[j]=((first+j)/block)*tail+((first+j)%block)%tail;
          complete &= source[j]>=0 || fc[first+j];
        }
        if (lane==0) pv[first/4]=complete;
        if (complete) {
          auto sg=it.get_sub_group(); float x[8]; float sum=0.f;
          for (int j=0; j<8; ++j) {
            const int d=lane*8+j;
            float v[4];
            for (int t=0; t<4; ++t)
              v[t]=source[t]>=0 ? kp[source[t]*ks0+d*ks1] : rp[ring[t]*128+d];
            // Preserve the pinned legacy FP32 expression and subgroup reduction.
            x[j]=(v[0]+v[1]+v[2]+v[3])*0.25f; sum+=x[j]*x[j];
          }
          const float inv=sycl::rsqrt(sycl::reduce_over_group(sg,sum,sycl::plus<float>())/128+(float)eps);
          for (int j=0; j<8; ++j) x[j]=x[j]*inv*wp[(lane*8+j)*ws];
          float result_lane[8];
          float local_amax=0.f;
          for (int j=0; j<8; ++j) {
            const int d=lane*8+j;
            const float other=sycl::select_from_group(sg,x[j],(uint32_t)(lane^4));
            float result=x[j];
            if (d<64) {
              const int pair=d%32, axis=pair%3;
              const int32_t position=source[0]>=0 ? (p64 ? (int32_t)p64p[source[0]*ps0+axis*ps1] : p32[source[0]*ps0+axis*ps1]) : pc[ring[0]*4+axis];
              const float angle=(float)position*fp[pair];
              const float c=sycl::cos(angle), s=sycl::sin(angle);
              result=d<32 ? x[j]*c-other*s : other*s+x[j]*c;
            }
            result_lane[j]=result;
            local_amax=sycl::fmax(local_amax, sycl::fabs(result));
          }

          float amax=local_amax;
          amax=sycl::fmax(amax, sycl::select_from_group(sg, amax, (uint32_t)(lane^8)));
          amax=sycl::fmax(amax, sycl::select_from_group(sg, amax, (uint32_t)(lane^4)));
          amax=sycl::fmax(amax, sycl::select_from_group(sg, amax, (uint32_t)(lane^2)));
          amax=sycl::fmax(amax, sycl::select_from_group(sg, amax, (uint32_t)(lane^1)));
          // FLT_MIN matches torch.finfo(torch.float32).tiny. Same clamp-then-round as quantize_pooled_rows.
          const float scale=sycl::fmax(amax, FLT_MIN)/127.f;
          const int64_t row=first/4;
          if (lane==0) sc[row]=scale;
          for (int j=0; j<8; ++j) {
            float scaled=result_lane[j]/scale;
            scaled=sycl::min(127.f, sycl::max(-127.f, scaled));
            po[row*128+lane*8+j]=static_cast<int8_t>(sycl::rint(scaled));
          }
        }
        if (lane==0) for (int j=0; j<4; ++j) if (source[j]>=0) fc[first+j]=true;
      });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for<RetainI8>(sycl::nd_range<1>(sycl::range<1>(n*16),sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        if (st[0]) return;
        const int i=it.get_group(0), lane=it.get_local_id(0);
        const int64_t slot=sp[i*ss]; if (slot<0) return;
        const int64_t r=(slot/block)*tail+(slot%block)%tail;
        for (int k=0; k<n; ++k) {
          const int64_t other=sp[k*ss];
          if (other<0) continue;
          const int64_t rr=(other/block)*tail+(other%block)%tail;
          if (rr==r && (other>slot || (other==slot && k>i))) return;
        }
        // Elect before reading mutable tags: all other workgroups sharing r
        // have returned. Only lane zero reads/writes tp[r], preventing the
        // inter-group and intra-group read/write races in the old ordering.
        const int64_t old_tag=sycl::group_broadcast(it.get_group(),lane==0 ? tp[r] : int64_t{-1},0);
        if (slot<old_tag) return;
        for (int d=lane; d<128; d+=16) rp[r*128+d]=kp[i*ks0+d*ks1];
        if (lane<4) pc[r*4+lane]=p64 ? (int32_t)p64p[i*ps0+lane*ps1] : p32[i*ps0+lane*ps1];
        if (lane==0) tp[r]=slot;
      });
  });
}

} // namespace qsa_tail_v1

TORCH_LIBRARY(qsa_tail_v1, m) {
  m.def("update(Tensor slots, Tensor keys, Tensor positions, Tensor weight, Tensor freqs, Tensor(a!) raw, Tensor(b!) pos, Tensor(c!) tags, Tensor(d!) filled, Tensor(e!) pooled, Tensor(f!) valid, Tensor(g!) status, int block, int tail, float eps) -> ()");
  m.impl("update", TORCH_FN(qsa_tail_v1::update));
  m.def("update_i8(Tensor slots, Tensor keys, Tensor positions, Tensor weight, Tensor freqs, Tensor(a!) raw, Tensor(b!) pos, Tensor(c!) tags, Tensor(d!) filled, Tensor(e!) pooled, Tensor(f!) valid, Tensor(g!) status, Tensor(h!) scales, int block, int tail, float eps) -> ()");
  m.impl("update_i8", TORCH_FN(qsa_tail_v1::update_i8));
}
