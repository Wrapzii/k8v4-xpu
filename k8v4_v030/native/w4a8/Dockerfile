# libk8v4_w4a8.so for K8V4_W4A8_KERNEL=onednn (k8v4_v030/w4a8_prefill.py), built from source as an image that
# holds that one file at /libk8v4_w4a8.so. Build (CPU only, ~20 min the first time, needs network for the two
# git fetches; written for the legacy builder: no heredocs, no RUN --mount):
#   DOCKER_BUILDKIT=0 docker build -t k8v4-w4a8ext k8v4_v030/native/w4a8
#   id=$(docker create k8v4-w4a8ext /x) && docker cp $id:/libk8v4_w4a8.so build/ && docker rm $id
# Serve with K8V4_W4A8_KERNEL=onednn K8V4_W4A8_LIB=$PWD/build/libk8v4_w4a8.so (launch.sh mounts it).
#
# k8v4_w4a8.cpp: vllm-xpu-kernels' oneDNN int4 GEMMs (int4_gemm_w4a8 / int4_gemm_w4a16) with the zero points made
#   optional, s4 weights, grouped per-token activation scales ([m, k/G]) and a bf16 output for bf16 models. The stock
#   ops always give oneDNN a u4 weight zero point and, for W4A8, a per-token source zero point; oneDNN then does
#   zero-point compensation in every weight group even though both are constants.
# vllm-xpu-kernels ddf336d8 csrc/xpu/onednn/ (unmodified): its primitive cache and engine/stream glue. Apache-2.0,
#   LICENSE-vllm-xpu-kernels.
# oneDNN v3.14.2 (4db28466), linked static (GPU only, matmul + reorder, Xe2 kernels), with three Xe2 edits in
#   patches/: a backport of oneDNN d05d595e (nGEN null dpas src0, waits only), a 4x8 work-group for the s8 x s4
#   prefill catalog entry and a 9-16-row fp16 x int4 decode entry. Each edit is output bit-identical on the shapes
#   it touches; see the patch headers.
# Built with oneAPI DPC++ 2026.0 against the torch 2.15 headers of the vLLM 0.34 XPU image.
ARG ONEAPI_IMAGE=intel/deep-learning-essentials:2026.0.0-devel-ubuntu24.04@sha256:aeb924ed73a4707576dcc6e9d9afb0f24435390a3f6596cdd88cee967dede0a0
ARG BUILD_IMAGE=vllm/vllm-openai-xpu@sha256:cb55d8cffeb1851c552c4b002a5e8be21daa99a51a678d53c57f271e7c16b3f0

FROM ${ONEAPI_IMAGE} AS oneapi

# The vLLM image is the build environment (torch headers and libraries, git, cmake, ninja); only the DPC++ compiler
# comes from the oneAPI image.
FROM ${BUILD_IMAGE} AS build
COPY --from=oneapi /opt/intel/oneapi/compiler /opt/intel/oneapi/compiler
# -11 (2026-11-06): patches/onednn-ngen-dpas-null-operand.diff = oneDNN d05d595e7a (main 2026-10-19, PR 6287,
# not in v3.14.2) backported: nGEN decoded a null dpas src0 as r0, so auto-SWSB tracked a phantom r0-r7 read and
# made every dpas chain wait on any load landing in r1-r7. Only wait placement changes: GEMM output bit-identical
# on all six prefill shapes (rice gemm_ngen.py), sustained 1.022x, cold 64K prefill +3.0%.
# -11: patches/mk_u32wg84.py edits oneDNN's kernel catalog entry that every W4A8 prefill shape uses (Xe2, s8 x s4,
# unroll 64x16, wg 2x8) to unroll 32x32 and an 8x4 work-group - the best of three GEMM_KERNEL search rounds (rice
# gemm_search*.py, dev-mode build): bit-identical output, 1.039-1.043x sustained; cold 64K prefill 1,850 -> 1,903.
COPY patches/ /w/patches/
RUN git init -q /w/onednn && git -C /w/onednn remote add origin https://github.com/uxlfoundation/oneDNN.git \
 && git -C /w/onednn fetch -q --depth 1 origin 4db284662a37cf46401655b5ee99391d9de52c00 \
 && git -C /w/onednn checkout -q FETCH_HEAD \
 && git -C /w/onednn apply /w/patches/onednn-ngen-dpas-null-operand.diff \
 && /opt/venv/bin/python -I /w/patches/mk_u32wg84.py /w/onednn \
 && /opt/venv/bin/python -I /w/patches/mk_dec16.py /w/onednn \
 && git init -q /w/xk && git -C /w/xk remote add origin https://github.com/vllm-project/vllm-xpu-kernels.git \
 && git -C /w/xk fetch -q --depth 1 origin ddf336d86e3c8602888572a3502f951abd51df12 \
 && git -C /w/xk checkout -q FETCH_HEAD
ARG JOBS=8
ENV CMPLR_ROOT=/opt/intel/oneapi/compiler/2026.0
RUN export PATH=$CMPLR_ROOT/bin:$PATH \
 && cmake -S /w/onednn -B /w/onednn-build -G Ninja -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
      -DDNNL_LIBRARY_TYPE=STATIC -DDNNL_CPU_RUNTIME=NONE -DDNNL_GPU_RUNTIME=SYCL -DDNNL_BUILD_TESTS=OFF \
      -DDNNL_BUILD_EXAMPLES=OFF -DDNNL_ENABLE_PRIMITIVE_CACHE=ON -DDNNL_ENABLE_CONCURRENT_EXEC=ON -DDNNL_EXPERIMENTAL=ON \
      -DONEDNN_BUILD_GRAPH=OFF "-DONEDNN_ENABLE_PRIMITIVE=MATMUL;REORDER" -DONEDNN_ENABLE_PRIMITIVE_GPU_ISA=XE2 \
 && ninja -C /w/onednn-build -j $JOBS dnnl
# oneDNN's include dirs go before torch's, which carry an older dnnl.hpp
COPY k8v4_w4a8.cpp /w/ext/
RUN export PATH=$CMPLR_ROOT/bin:$PATH && T=/opt/venv/lib/python3.12/site-packages/torch \
 && icpx -fsycl -O2 -fPIC -shared -std=c++20 -D_GLIBCXX_USE_CXX11_ABI=1 -Wno-deprecated-declarations \
      -I/w/onednn/include -I/w/onednn-build/include -I/w/xk/csrc/xpu/onednn \
      -I$T/include -I$T/include/torch/csrc/api/include \
      /w/ext/k8v4_w4a8.cpp /w/xk/csrc/xpu/onednn/onednn_runtime.cpp /w/onednn-build/src/libdnnl.a \
      -L$T/lib -ltorch -ltorch_cpu -ltorch_xpu -lc10 -lc10_xpu -Wl,-rpath,$T/lib -o /w/ext/libk8v4_w4a8.so \
 && sha256sum /w/ext/libk8v4_w4a8.so

FROM scratch
COPY --from=build /w/ext/libk8v4_w4a8.so /libk8v4_w4a8.so
