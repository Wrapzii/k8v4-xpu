// Separate lifecycle ABI for the qualified qsa_tail_v1 compact writer.
// copy_block/reset_block stay the FP32 pooled ABI.
// copy_block_i8/reset_block_i8 move INT8 pooled elements and FP32 row scales.
// External stream serialization is required. Sticky writer failures are never
// cleared here. An allocator MUST explicitly reset a block on a new lease.
#include <sycl/sycl.hpp>
#include <ATen/ATen.h>
#include <ATen/MemoryOverlap.h>
#include <c10/xpu/XPUStream.h>
#include <torch/library.h>
#include <cstdint>
#include <vector>

namespace qsa_tail_lifecycle {
class ValidateCopyTags;
class CopyBlock;
class ResetBlock;

static int64_t validate(const at::Tensor &raw,const at::Tensor &pos,
                       const at::Tensor &tags,const at::Tensor &filled,
                       const at::Tensor &pooled,const at::Tensor &valid,
                       const at::Tensor &status,int64_t block,int64_t tail) {
  const std::vector<at::Tensor> tensors{raw,pos,tags,filled,pooled,valid,status};
  for (size_t i=0;i<tensors.size();++i) {
    TORCH_CHECK(tensors[i].is_xpu(),"compact lifecycle tensor must be XPU");
    TORCH_CHECK(tensors[i].device()==raw.device() && tensors[i].is_contiguous(),
                "compact lifecycle same-device contiguous storage required");
    at::assert_no_internal_overlap(tensors[i]);
    for (size_t j=0;j<i;++j) at::assert_no_overlap(tensors[j],tensors[i]);
  }
  TORCH_CHECK(block>0 && block%64==0 && block<=INT32_MAX && tail>0 && tail<=block && tail%4==0,
              "compact lifecycle block/tail geometry");
  const int64_t slots=filled.numel();
  TORCH_CHECK(slots>0 && slots<=INT32_MAX && slots%block==0,"compact lifecycle physical extent");
  const int64_t n=slots/block;
  TORCH_CHECK(raw.scalar_type()==at::kFloat && pos.scalar_type()==at::kInt && tags.scalar_type()==at::kLong &&
              filled.scalar_type()==at::kBool && pooled.scalar_type()==at::kFloat &&
              valid.scalar_type()==at::kBool && status.scalar_type()==at::kInt,"compact lifecycle dtypes");
  TORCH_CHECK(raw.sizes()==at::IntArrayRef({n*tail,128}) && pos.sizes()==at::IntArrayRef({n*tail,4}) &&
              tags.dim()==1 && tags.numel()==n*tail && filled.dim()==1 &&
              pooled.sizes()==at::IntArrayRef({slots/4,128}) && valid.dim()==1 && valid.numel()==slots/4 &&
              status.dim()==1 && status.numel()==1,"compact lifecycle shapes");
  return n;
}

static void copy_block(at::Tensor raw,at::Tensor pos,at::Tensor tags,at::Tensor filled,
                       at::Tensor pooled,at::Tensor valid,at::Tensor status,
                       int64_t block,int64_t tail,int64_t src,int64_t dst) {
  const int64_t n=validate(raw,pos,tags,filled,pooled,valid,status,block,tail);
  TORCH_CHECK(src>=0 && src<n && dst>=0 && dst<n,"compact lifecycle block id");
  if (src==dst) return;
  auto *r=raw.data_ptr<float>();auto *p=pos.data_ptr<int32_t>();auto *t=tags.data_ptr<int64_t>();
  auto *f=filled.data_ptr<bool>();auto *pool=pooled.data_ptr<float>();auto *v=valid.data_ptr<bool>();
  auto *st=status.data_ptr<int32_t>();
  auto &q=c10::xpu::getCurrentXPUStream(raw.device().index()).queue();
  TORCH_CHECK(q.is_in_order(),"compact lifecycle requires ordered current stream");
  q.submit([&](sycl::handler &h) {
    h.parallel_for<ValidateCopyTags>(sycl::range<1>(tail),[=](sycl::id<1> id) {
      const int64_t j=id[0],tag=t[src*tail+j];
      if (tag!=-1 && (tag<src*block || tag>=(src+1)*block || (tag%block)%tail!=j)) {
        sycl::atomic_ref<int32_t,sycl::memory_order::relaxed,sycl::memory_scope::device,
                         sycl::access::address_space::global_space> a(st[0]);
        a.fetch_or(4);
      }
    });
  });
  const int64_t work=sycl::max(block/4*128,tail*128);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<CopyBlock>(sycl::range<1>(work),[=](sycl::id<1> id) {
      if (st[0]) return;
      const int64_t i=id[0];
      if (i<tail*128) r[dst*tail*128+i]=r[src*tail*128+i];
      if (i<tail*4) p[dst*tail*4+i]=p[src*tail*4+i];
      if (i<tail) {const int64_t tag=t[src*tail+i];t[dst*tail+i]=tag<0 ? -1 : tag+(dst-src)*block;}
      if (i<block) f[dst*block+i]=f[src*block+i];
      if (i<block/4*128) pool[dst*(block/4)*128+i]=pool[src*(block/4)*128+i];
      if (i<block/4) v[dst*(block/4)+i]=v[src*(block/4)+i];
    });
  });
}

static void reset_block(at::Tensor raw,at::Tensor pos,at::Tensor tags,at::Tensor filled,
                        at::Tensor pooled,at::Tensor valid,at::Tensor status,
                        int64_t block,int64_t tail,int64_t id) {
  const int64_t n=validate(raw,pos,tags,filled,pooled,valid,status,block,tail);
  TORCH_CHECK(id>=0 && id<n,"compact lifecycle block id");
  auto *r=raw.data_ptr<float>();auto *p=pos.data_ptr<int32_t>();auto *t=tags.data_ptr<int64_t>();
  auto *f=filled.data_ptr<bool>();auto *pool=pooled.data_ptr<float>();auto *v=valid.data_ptr<bool>();
  auto *st=status.data_ptr<int32_t>();
  auto &q=c10::xpu::getCurrentXPUStream(raw.device().index()).queue();
  TORCH_CHECK(q.is_in_order(),"compact lifecycle requires ordered current stream");
  const int64_t work=sycl::max(block/4*128,tail*128);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<ResetBlock>(sycl::range<1>(work),[=](sycl::id<1> ix) {
      if (st[0]) return;
      const int64_t i=ix[0];
      if (i<tail*128) r[id*tail*128+i]=0.f;
      if (i<tail*4) p[id*tail*4+i]=0;
      if (i<tail) t[id*tail+i]=-1;
      if (i<block) f[id*block+i]=false;
      if (i<block/4*128) pool[id*(block/4)*128+i]=0.f;
      if (i<block/4) v[id*(block/4)+i]=false;
    });
  });
}

class ValidateCopyTagsI8;
class CopyBlockI8;
class ResetBlockI8;

static int64_t validate_i8(const at::Tensor &raw,const at::Tensor &pos,
                       const at::Tensor &tags,const at::Tensor &filled,
                       const at::Tensor &pooled,const at::Tensor &valid,
                       const at::Tensor &status,const at::Tensor &scales,
                       int64_t block,int64_t tail) {
  const std::vector<at::Tensor> tensors{raw,pos,tags,filled,pooled,valid,status,scales};
  for (size_t i=0;i<tensors.size();++i) {
    TORCH_CHECK(tensors[i].is_xpu(),"compact lifecycle tensor must be XPU");
    TORCH_CHECK(tensors[i].device()==raw.device() && tensors[i].is_contiguous(),
                "compact lifecycle same-device contiguous storage required");
    at::assert_no_internal_overlap(tensors[i]);
    for (size_t j=0;j<i;++j) at::assert_no_overlap(tensors[j],tensors[i]);
  }
  TORCH_CHECK(block>0 && block%64==0 && block<=INT32_MAX && tail>0 && tail<=block && tail%4==0,
              "compact lifecycle block/tail geometry");
  const int64_t slots=filled.numel();
  TORCH_CHECK(slots>0 && slots<=INT32_MAX && slots%block==0,"compact lifecycle physical extent");
  const int64_t n=slots/block;
  TORCH_CHECK(raw.scalar_type()==at::kFloat && pos.scalar_type()==at::kInt && tags.scalar_type()==at::kLong &&
              filled.scalar_type()==at::kBool && pooled.scalar_type()==at::kChar &&
              valid.scalar_type()==at::kBool && status.scalar_type()==at::kInt &&
              scales.scalar_type()==at::kFloat,"compact lifecycle int8 dtypes");
  TORCH_CHECK(raw.sizes()==at::IntArrayRef({n*tail,128}) && pos.sizes()==at::IntArrayRef({n*tail,4}) &&
              tags.dim()==1 && tags.numel()==n*tail && filled.dim()==1 &&
              pooled.sizes()==at::IntArrayRef({slots/4,128}) && valid.dim()==1 && valid.numel()==slots/4 &&
              status.dim()==1 && status.numel()==1 &&
              scales.dim()==1 && scales.numel()==slots/4,"compact lifecycle int8 shapes");
  return n;
}

static void copy_block_i8(at::Tensor raw,at::Tensor pos,at::Tensor tags,at::Tensor filled,
                       at::Tensor pooled,at::Tensor valid,at::Tensor status,at::Tensor scales,
                       int64_t block,int64_t tail,int64_t src,int64_t dst) {
  const int64_t n=validate_i8(raw,pos,tags,filled,pooled,valid,status,scales,block,tail);
  TORCH_CHECK(src>=0 && src<n && dst>=0 && dst<n,"compact lifecycle block id");
  if (src==dst) return;
  auto *r=raw.data_ptr<float>();auto *p=pos.data_ptr<int32_t>();auto *t=tags.data_ptr<int64_t>();
  auto *f=filled.data_ptr<bool>();auto *pool=pooled.data_ptr<int8_t>();auto *v=valid.data_ptr<bool>();
  auto *st=status.data_ptr<int32_t>();auto *sc=scales.data_ptr<float>();
  auto &q=c10::xpu::getCurrentXPUStream(raw.device().index()).queue();
  TORCH_CHECK(q.is_in_order(),"compact lifecycle requires ordered current stream");
  q.submit([&](sycl::handler &h) {
    h.parallel_for<ValidateCopyTagsI8>(sycl::range<1>(tail),[=](sycl::id<1> id) {
      const int64_t j=id[0],tag=t[src*tail+j];
      if (tag!=-1 && (tag<src*block || tag>=(src+1)*block || (tag%block)%tail!=j)) {
        sycl::atomic_ref<int32_t,sycl::memory_order::relaxed,sycl::memory_scope::device,
                         sycl::access::address_space::global_space> a(st[0]);
        a.fetch_or(4);
      }
    });
  });
  const int64_t work=sycl::max(block/4*128,tail*128);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<CopyBlockI8>(sycl::range<1>(work),[=](sycl::id<1> id) {
      if (st[0]) return;
      const int64_t i=id[0];
      if (i<tail*128) r[dst*tail*128+i]=r[src*tail*128+i];
      if (i<tail*4) p[dst*tail*4+i]=p[src*tail*4+i];
      if (i<tail) {const int64_t tag=t[src*tail+i];t[dst*tail+i]=tag<0 ? -1 : tag+(dst-src)*block;}
      if (i<block) f[dst*block+i]=f[src*block+i];
      // Element copy. INT8 rows are not floats.
      if (i<block/4*128) pool[dst*(block/4)*128+i]=pool[src*(block/4)*128+i];
      if (i<block/4) v[dst*(block/4)+i]=v[src*(block/4)+i];
      if (i<block/4) sc[dst*(block/4)+i]=sc[src*(block/4)+i];
    });
  });
}

static void reset_block_i8(at::Tensor raw,at::Tensor pos,at::Tensor tags,at::Tensor filled,
                        at::Tensor pooled,at::Tensor valid,at::Tensor status,at::Tensor scales,
                        int64_t block,int64_t tail,int64_t id) {
  const int64_t n=validate_i8(raw,pos,tags,filled,pooled,valid,status,scales,block,tail);
  TORCH_CHECK(id>=0 && id<n,"compact lifecycle block id");
  auto *r=raw.data_ptr<float>();auto *p=pos.data_ptr<int32_t>();auto *t=tags.data_ptr<int64_t>();
  auto *f=filled.data_ptr<bool>();auto *pool=pooled.data_ptr<int8_t>();auto *v=valid.data_ptr<bool>();
  auto *st=status.data_ptr<int32_t>();auto *sc=scales.data_ptr<float>();
  auto &q=c10::xpu::getCurrentXPUStream(raw.device().index()).queue();
  TORCH_CHECK(q.is_in_order(),"compact lifecycle requires ordered current stream");
  const int64_t work=sycl::max(block/4*128,tail*128);
  q.submit([&](sycl::handler &h) {
    h.parallel_for<ResetBlockI8>(sycl::range<1>(work),[=](sycl::id<1> ix) {
      if (st[0]) return;
      const int64_t i=ix[0];
      if (i<tail*128) r[id*tail*128+i]=0.f;
      if (i<tail*4) p[id*tail*4+i]=0;
      if (i<tail) t[id*tail+i]=-1;
      if (i<block) f[id*block+i]=false;
      if (i<block/4*128) pool[id*(block/4)*128+i]=0;
      if (i<block/4) v[id*(block/4)+i]=false;
      if (i<block/4) sc[id*(block/4)+i]=0.f;
    });
  });
}

} // namespace qsa_tail_lifecycle

TORCH_LIBRARY(qsa_tail_lifecycle,m) {
  m.def("copy_block(Tensor(a!) raw, Tensor(b!) pos, Tensor(c!) tags, Tensor(d!) filled, Tensor(e!) pooled, Tensor(f!) valid, Tensor(g!) status, int block, int tail, int src, int dst) -> ()");
  m.impl("copy_block",TORCH_FN(qsa_tail_lifecycle::copy_block));
  m.def("reset_block(Tensor(a!) raw, Tensor(b!) pos, Tensor(c!) tags, Tensor(d!) filled, Tensor(e!) pooled, Tensor(f!) valid, Tensor(g!) status, int block, int tail, int id) -> ()");
  m.impl("reset_block",TORCH_FN(qsa_tail_lifecycle::reset_block));
  m.def("copy_block_i8(Tensor(a!) raw, Tensor(b!) pos, Tensor(c!) tags, Tensor(d!) filled, Tensor(e!) pooled, Tensor(f!) valid, Tensor(g!) status, Tensor(h!) scales, int block, int tail, int src, int dst) -> ()");
  m.impl("copy_block_i8",TORCH_FN(qsa_tail_lifecycle::copy_block_i8));
  m.def("reset_block_i8(Tensor(a!) raw, Tensor(b!) pos, Tensor(c!) tags, Tensor(d!) filled, Tensor(e!) pooled, Tensor(f!) valid, Tensor(g!) status, Tensor(h!) scales, int block, int tail, int id) -> ()");
  m.impl("reset_block_i8",TORCH_FN(qsa_tail_lifecycle::reset_block_i8));
}
