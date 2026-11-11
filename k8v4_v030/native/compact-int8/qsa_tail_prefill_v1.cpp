// Eager prepared-prefill ABI for compact tails, independent of legacy
// xe2_qsa and qsa_tail_v1. Validate the ENTIRE call, then pool, then retain.
// update() is the FP32 pooled ABI and is left bit-identical.
// update_i8() writes per-row symmetric INT8 pooled keys plus one FP32 scale.
// Status bits: 1 invalid slot, 2 retired history, 8 malformed prepared indices.
#include <sycl/sycl.hpp>
#include <ATen/ATen.h>
#include <ATen/MemoryOverlap.h>
#include <c10/xpu/XPUStream.h>
#include <torch/library.h>
#include <algorithm>
#include <cfloat>
#include <cmath>
#include <cstdint>
#include <vector>

namespace qsa_tail_prefill_v1 {
class Validate;
class Pool;
class Retain;

static inline int lower_bound(const int64_t *a,int n,int64_t value) {
  int lo=0,hi=n;
  while(lo<hi) {const int mid=lo+(hi-lo)/2;if(a[mid]<value)lo=mid+1;else hi=mid;}
  return lo;
}

static void update(const at::Tensor &slots,const at::Tensor &keys,const at::Tensor &positions,
                   const at::Tensor &micros,const at::Tensor &weight,const at::Tensor &freqs,
                   at::Tensor raw,at::Tensor pos,at::Tensor tags,at::Tensor filled,
                   at::Tensor pooled,at::Tensor valid,at::Tensor status,
                   int64_t block,int64_t tail,double eps) {
  const std::vector<at::Tensor> inputs{slots,keys,positions,micros,weight,freqs};
  const std::vector<at::Tensor> outputs{raw,pos,tags,filled,pooled,valid,status};
  for(const auto &t:inputs) {
    TORCH_CHECK(t.is_xpu(),"compact prefill tensor must be XPU");
    TORCH_CHECK(t.device()==slots.device() && t.is_contiguous(),"compact prefill prepared input storage");
  }
  for(size_t i=0;i<outputs.size();++i) {
    const auto &t=outputs[i];
    TORCH_CHECK(t.is_xpu(),"compact prefill tensor must be XPU");
    TORCH_CHECK(t.device()==slots.device() && t.is_contiguous(),"compact prefill output storage");
    at::assert_no_internal_overlap(t);
    for(const auto &a:inputs)at::assert_no_overlap(a,t);
    for(size_t j=0;j<i;++j)at::assert_no_overlap(outputs[j],t);
  }
  TORCH_CHECK(block>0 && block%64==0 && block<=INT32_MAX && tail>0 && tail%4==0 && tail<=block &&
              std::isfinite(eps) && eps>0,"compact prefill geometry");
  const int64_t nslots=filled.numel(),ntail=raw.dim()==2?raw.size(0):0;
  const int64_t n64=slots.numel(),m64=micros.numel();
  TORCH_CHECK(n64>0 && n64<=8192 && m64>0 && m64<=n64 && nslots>0 && nslots<=INT32_MAX &&
              nslots%block==0 && ntail==(nslots/block)*tail,"compact prefill extent");
  const int n=static_cast<int>(n64),m=static_cast<int>(m64);
  TORCH_CHECK(slots.scalar_type()==at::kLong && keys.scalar_type()==at::kFloat &&
              positions.scalar_type()==at::kInt && micros.scalar_type()==at::kLong &&
              weight.scalar_type()==at::kFloat && freqs.scalar_type()==at::kFloat &&
              raw.scalar_type()==at::kFloat && pos.scalar_type()==at::kInt && tags.scalar_type()==at::kLong &&
              filled.scalar_type()==at::kBool && pooled.scalar_type()==at::kFloat &&
              valid.scalar_type()==at::kBool && status.scalar_type()==at::kInt,"compact prefill dtypes");
  TORCH_CHECK(slots.dim()==1 && keys.sizes()==at::IntArrayRef({n,128}) &&
              positions.sizes()==at::IntArrayRef({n,4}) && micros.dim()==1 &&
              weight.dim()==1 && weight.numel()==128 && freqs.dim()==1 && freqs.numel()==32 &&
              raw.sizes()==at::IntArrayRef({ntail,128}) && pos.sizes()==at::IntArrayRef({ntail,4}) &&
              tags.dim()==1 && tags.numel()==ntail && filled.dim()==1 &&
              pooled.sizes()==at::IntArrayRef({nslots/4,128}) && valid.dim()==1 && valid.numel()==nslots/4 &&
              status.dim()==1 && status.numel()==1,"compact prefill shapes");
  const auto *sp=slots.data_ptr<int64_t>();const auto *mp=micros.data_ptr<int64_t>();
  const auto *kp=keys.data_ptr<float>();const auto *pp=positions.data_ptr<int32_t>();
  const auto *wp=weight.data_ptr<float>();const auto *fp=freqs.data_ptr<float>();
  auto *rp=raw.data_ptr<float>();auto *pc=pos.data_ptr<int32_t>();auto *tp=tags.data_ptr<int64_t>();
  auto *fc=filled.data_ptr<bool>();auto *po=pooled.data_ptr<float>();auto *pv=valid.data_ptr<bool>();
  auto *st=status.data_ptr<int32_t>();
  auto &q=c10::xpu::getCurrentXPUStream(slots.device().index()).queue();
  TORCH_CHECK(q.is_in_order(),"compact prefill requires ordered current stream");
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Validate>(sycl::range<1>(std::max(n,m)),[=](sycl::id<1> id) {
      const int i=id[0];int error=0;
      if(i<n) {
        const int64_t slot=sp[i];
        if(slot<0 || slot>=nslots)error|=1;
        else {const int k=lower_bound(mp,m,slot/4);if(k==m || mp[k]!=slot/4)error|=8;}
        if(i>0 && slot<=sp[i-1])error|=8;
      }
      if(i<m) {
        const int64_t micro=mp[i];
        if(i>0 && micro<=mp[i-1])error|=8;
        if(micro<0 || micro>=nslots/4)error|=8;
        else {
          const int64_t first=micro*4;
          const int first_input=lower_bound(sp,n,first);
          if(first_input==n || sp[first_input]>=first+4)error|=8;
          for(int j=0;j<4;++j) {
            const int64_t cell=first+j;
            const int k=lower_bound(sp,n,cell);
            const bool incoming=k<n && sp[k]==cell;
            const int64_t r=(cell/block)*tail+(cell%block)%tail;
            if(!incoming && fc[cell] && tp[r]!=cell)error|=2;
          }
        }
      }
      if(error) {
        sycl::atomic_ref<int32_t,sycl::memory_order::relaxed,sycl::memory_scope::device,
                         sycl::access::address_space::global_space> a(st[0]);
        a.fetch_or(error);
      }
    });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Pool>(sycl::nd_range<1>(sycl::range<1>(m*16),sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        if(st[0])return;
        const int i=it.get_group(0),lane=it.get_local_id(0);
        const int64_t first=mp[i]*4;
        int source[4];int64_t ring[4];bool complete=true;
        for(int j=0;j<4;++j) {
          const int k=lower_bound(sp,n,first+j);
          source[j]=k<n && sp[k]==first+j?k:-1;
          ring[j]=((first+j)/block)*tail+((first+j)%block)%tail;
          complete &= source[j]>=0 || fc[first+j];
        }
        if(lane==0)pv[first/4]=complete;
        if(complete) {
          auto sg=it.get_sub_group();float x[8];float sum=0.f;
          for(int j=0;j<8;++j) {
            const int d=lane*8+j;float v[4];
            for(int t=0;t<4;++t)v[t]=source[t]>=0?kp[source[t]*128+d]:rp[ring[t]*128+d];
            x[j]=(v[0]+v[1]+v[2]+v[3])*0.25f;sum+=x[j]*x[j];
          }
          const float inv=sycl::rsqrt(sycl::reduce_over_group(sg,sum,sycl::plus<float>())/128+(float)eps);
          for(int j=0;j<8;++j)x[j]=x[j]*inv*wp[lane*8+j];
          for(int j=0;j<8;++j) {
            const int d=lane*8+j;
            const float other=sycl::select_from_group(sg,x[j],(uint32_t)(lane^4));
            float result=x[j];
            if(d<64) {
              const int pair=d%32,axis=pair%3;
              const int32_t position=source[0]>=0?pp[source[0]*4+axis]:pc[ring[0]*4+axis];
              const float angle=(float)position*fp[pair];
              const float c=sycl::cos(angle),s=sycl::sin(angle);
              result=d<32?x[j]*c-other*s:other*s+x[j]*c;
            }
            po[(first/4)*128+d]=result;
          }
        }
        if(lane==0)for(int j=0;j<4;++j)if(source[j]>=0)fc[first+j]=true;
      });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for<Retain>(sycl::nd_range<1>(sycl::range<1>(n*16),sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        if(st[0])return;
        const int i=it.get_group(0),lane=it.get_local_id(0);
        const int64_t slot=sp[i],offset=(slot%block)%tail;
        const int end=lower_bound(sp,n,(slot/block+1)*block);
        for(int k=end-1;k>i;--k)if((sp[k]%block)%tail==offset)return;
        const int64_t r=(slot/block)*tail+offset;
        auto sg=it.get_sub_group();
        int keep=lane==0?(slot>=tp[r]):0;
        keep=sycl::group_broadcast(sg,keep,0);
        if(!keep)return;
        for(int d=lane;d<128;d+=16)rp[r*128+d]=kp[i*128+d];
        if(lane<4)pc[r*4+lane]=pp[i*4+lane];
        if(lane==0)tp[r]=slot;
      });
  });
}
class ValidateI8;
class PoolI8;
class RetainI8;

static void update_i8(const at::Tensor &slots,const at::Tensor &keys,const at::Tensor &positions,
                   const at::Tensor &micros,const at::Tensor &weight,const at::Tensor &freqs,
                   at::Tensor raw,at::Tensor pos,at::Tensor tags,at::Tensor filled,
                   at::Tensor pooled,at::Tensor valid,at::Tensor status, const at::Tensor &scales,
                   int64_t block,int64_t tail,double eps) {
  const std::vector<at::Tensor> inputs{slots,keys,positions,micros,weight,freqs};
  const std::vector<at::Tensor> outputs{raw,pos,tags,filled,pooled,valid,status,scales};
  for(const auto &t:inputs) {
    TORCH_CHECK(t.is_xpu(),"compact prefill tensor must be XPU");
    TORCH_CHECK(t.device()==slots.device() && t.is_contiguous(),"compact prefill prepared input storage");
  }
  for(size_t i=0;i<outputs.size();++i) {
    const auto &t=outputs[i];
    TORCH_CHECK(t.is_xpu(),"compact prefill tensor must be XPU");
    TORCH_CHECK(t.device()==slots.device() && t.is_contiguous(),"compact prefill output storage");
    at::assert_no_internal_overlap(t);
    for(const auto &a:inputs)at::assert_no_overlap(a,t);
    for(size_t j=0;j<i;++j)at::assert_no_overlap(outputs[j],t);
  }
  TORCH_CHECK(block>0 && block%64==0 && block<=INT32_MAX && tail>0 && tail%4==0 && tail<=block &&
              std::isfinite(eps) && eps>0,"compact prefill geometry");
  const int64_t nslots=filled.numel(),ntail=raw.dim()==2?raw.size(0):0;
  const int64_t n64=slots.numel(),m64=micros.numel();
  TORCH_CHECK(n64>0 && n64<=8192 && m64>0 && m64<=n64 && nslots>0 && nslots<=INT32_MAX &&
              nslots%block==0 && ntail==(nslots/block)*tail,"compact prefill extent");
  const int n=static_cast<int>(n64),m=static_cast<int>(m64);
  TORCH_CHECK(slots.scalar_type()==at::kLong && keys.scalar_type()==at::kFloat &&
              positions.scalar_type()==at::kInt && micros.scalar_type()==at::kLong &&
              weight.scalar_type()==at::kFloat && freqs.scalar_type()==at::kFloat &&
              raw.scalar_type()==at::kFloat && pos.scalar_type()==at::kInt && tags.scalar_type()==at::kLong &&
              filled.scalar_type()==at::kBool && pooled.scalar_type()==at::kChar &&
              valid.scalar_type()==at::kBool && status.scalar_type()==at::kInt && scales.scalar_type()==at::kFloat,"compact prefill dtypes");
  TORCH_CHECK(slots.dim()==1 && keys.sizes()==at::IntArrayRef({n,128}) &&
              positions.sizes()==at::IntArrayRef({n,4}) && micros.dim()==1 &&
              weight.dim()==1 && weight.numel()==128 && freqs.dim()==1 && freqs.numel()==32 &&
              raw.sizes()==at::IntArrayRef({ntail,128}) && pos.sizes()==at::IntArrayRef({ntail,4}) &&
              tags.dim()==1 && tags.numel()==ntail && filled.dim()==1 &&
              pooled.sizes()==at::IntArrayRef({nslots/4,128}) && valid.dim()==1 && valid.numel()==nslots/4 &&
              status.dim()==1 && status.numel()==1 && scales.dim()==1 && scales.numel()==nslots/4,"compact prefill shapes");
  const auto *sp=slots.data_ptr<int64_t>();const auto *mp=micros.data_ptr<int64_t>();
  const auto *kp=keys.data_ptr<float>();const auto *pp=positions.data_ptr<int32_t>();
  const auto *wp=weight.data_ptr<float>();const auto *fp=freqs.data_ptr<float>();
  auto *rp=raw.data_ptr<float>();auto *pc=pos.data_ptr<int32_t>();auto *tp=tags.data_ptr<int64_t>();
  auto *fc=filled.data_ptr<bool>();auto *po=pooled.data_ptr<int8_t>();auto *pv=valid.data_ptr<bool>();
  auto *st=status.data_ptr<int32_t>();
  auto *sc=scales.data_ptr<float>();
  auto &q=c10::xpu::getCurrentXPUStream(slots.device().index()).queue();
  TORCH_CHECK(q.is_in_order(),"compact prefill requires ordered current stream");
  q.submit([&](sycl::handler &h) {
    h.parallel_for<ValidateI8>(sycl::range<1>(std::max(n,m)),[=](sycl::id<1> id) {
      const int i=id[0];int error=0;
      if(i<n) {
        const int64_t slot=sp[i];
        if(slot<0 || slot>=nslots)error|=1;
        else {const int k=lower_bound(mp,m,slot/4);if(k==m || mp[k]!=slot/4)error|=8;}
        if(i>0 && slot<=sp[i-1])error|=8;
      }
      if(i<m) {
        const int64_t micro=mp[i];
        if(i>0 && micro<=mp[i-1])error|=8;
        if(micro<0 || micro>=nslots/4)error|=8;
        else {
          const int64_t first=micro*4;
          const int first_input=lower_bound(sp,n,first);
          if(first_input==n || sp[first_input]>=first+4)error|=8;
          for(int j=0;j<4;++j) {
            const int64_t cell=first+j;
            const int k=lower_bound(sp,n,cell);
            const bool incoming=k<n && sp[k]==cell;
            const int64_t r=(cell/block)*tail+(cell%block)%tail;
            if(!incoming && fc[cell] && tp[r]!=cell)error|=2;
          }
        }
      }
      if(error) {
        sycl::atomic_ref<int32_t,sycl::memory_order::relaxed,sycl::memory_scope::device,
                         sycl::access::address_space::global_space> a(st[0]);
        a.fetch_or(error);
      }
    });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for<PoolI8>(sycl::nd_range<1>(sycl::range<1>(m*16),sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        if(st[0])return;
        const int i=it.get_group(0),lane=it.get_local_id(0);
        const int64_t first=mp[i]*4;
        int source[4];int64_t ring[4];bool complete=true;
        for(int j=0;j<4;++j) {
          const int k=lower_bound(sp,n,first+j);
          source[j]=k<n && sp[k]==first+j?k:-1;
          ring[j]=((first+j)/block)*tail+((first+j)%block)%tail;
          complete &= source[j]>=0 || fc[first+j];
        }
        if(lane==0)pv[first/4]=complete;
        if(complete) {
          auto sg=it.get_sub_group();float x[8];float sum=0.f;
          for(int j=0;j<8;++j) {
            const int d=lane*8+j;float v[4];
            for(int t=0;t<4;++t)v[t]=source[t]>=0?kp[source[t]*128+d]:rp[ring[t]*128+d];
            x[j]=(v[0]+v[1]+v[2]+v[3])*0.25f;sum+=x[j]*x[j];
          }
          const float inv=sycl::rsqrt(sycl::reduce_over_group(sg,sum,sycl::plus<float>())/128+(float)eps);
          for(int j=0;j<8;++j)x[j]=x[j]*inv*wp[lane*8+j];
          float result_lane[8];
          float local_amax=0.f;
          for(int j=0;j<8;++j) {
            const int d=lane*8+j;
            const float other=sycl::select_from_group(sg,x[j],(uint32_t)(lane^4));
            float result=x[j];
            if(d<64) {
              const int pair=d%32,axis=pair%3;
              const int32_t position=source[0]>=0?pp[source[0]*4+axis]:pc[ring[0]*4+axis];
              const float angle=(float)position*fp[pair];
              const float c=sycl::cos(angle),s=sycl::sin(angle);
              result=d<32?x[j]*c-other*s:other*s+x[j]*c;
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
        if(lane==0)for(int j=0;j<4;++j)if(source[j]>=0)fc[first+j]=true;
      });
  });
  q.submit([&](sycl::handler &h) {
    h.parallel_for<RetainI8>(sycl::nd_range<1>(sycl::range<1>(n*16),sycl::range<1>(16)),
      [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(16)]] {
        if(st[0])return;
        const int i=it.get_group(0),lane=it.get_local_id(0);
        const int64_t slot=sp[i],offset=(slot%block)%tail;
        const int end=lower_bound(sp,n,(slot/block+1)*block);
        for(int k=end-1;k>i;--k)if((sp[k]%block)%tail==offset)return;
        const int64_t r=(slot/block)*tail+offset;
        auto sg=it.get_sub_group();
        int keep=lane==0?(slot>=tp[r]):0;
        keep=sycl::group_broadcast(sg,keep,0);
        if(!keep)return;
        for(int d=lane;d<128;d+=16)rp[r*128+d]=kp[i*128+d];
        if(lane<4)pc[r*4+lane]=pp[i*4+lane];
        if(lane==0)tp[r]=slot;
      });
  });
}

} // namespace qsa_tail_prefill_v1

TORCH_LIBRARY(qsa_tail_prefill_v1,m) {
  m.def("update(Tensor slots, Tensor keys, Tensor positions, Tensor micros, Tensor weight, Tensor freqs, Tensor(a!) raw, Tensor(b!) pos, Tensor(c!) tags, Tensor(d!) filled, Tensor(e!) pooled, Tensor(f!) valid, Tensor(g!) status, int block, int tail, float eps) -> ()");
  m.impl("update",TORCH_FN(qsa_tail_prefill_v1::update));
  m.def("update_i8(Tensor slots, Tensor keys, Tensor positions, Tensor micros, Tensor weight, Tensor freqs, Tensor(a!) raw, Tensor(b!) pos, Tensor(c!) tags, Tensor(d!) filled, Tensor(e!) pooled, Tensor(f!) valid, Tensor(g!) status, Tensor(h!) scales, int block, int tail, float eps) -> ()");
  m.impl("update_i8",TORCH_FN(qsa_tail_prefill_v1::update_i8));
}
