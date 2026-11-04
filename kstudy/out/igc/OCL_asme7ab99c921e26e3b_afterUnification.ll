; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_afterUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::detail::half_impl::half" = type { half }
%"class.sycl::_V1::vec" = type { %"class.sycl::_V1::detail::vec_base" }
%"class.sycl::_V1::detail::vec_base" = type { [4 x float] }
%"class.sycl::_V1::vec.46" = type { %"class.sycl::_V1::detail::vec_base.83" }
%"class.sycl::_V1::detail::vec_base.83" = type { [4 x %"class.sycl::_V1::detail::half_impl::half"] }

@gVar = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.190 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.191 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.192 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.193 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.194 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.195 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.196 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.197 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.198 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.199 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.200 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.201 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.202 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.203 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.204 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.205 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.206 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.207 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.208 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.209 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.210 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.211 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.212 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.213 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.214 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.215 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.216 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.217 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.218 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.219 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.220 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.221 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.222 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.223 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.224 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.225 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@gVar.226 = internal unnamed_addr addrspace(2) constant [16 x i8] zeroinitializer, align 16, !spirv.Decorations !0
@0 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@1 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@2 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@3 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@4 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@5 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@6 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@7 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@8 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@9 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@10 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@11 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@12 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@13 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@14 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@15 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@16 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@17 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@18 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@19 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@20 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@21 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@22 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@23 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@24 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@25 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@26 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@27 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@28 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@29 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@GenSLM.LocalMemPoolOnGetMemPoolPtr = addrspace(3) global [4096 x i8] zeroinitializer, section "localSLM", align 4
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@llvm.used = appending global [56 x ptr] [ptr addrspacecast (ptr addrspace(2) @gVar to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.190 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.191 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.192 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.193 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.194 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.195 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.196 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.197 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.198 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.199 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.200 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.201 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.202 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.203 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.204 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.205 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.206 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.207 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.208 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.209 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.210 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.211 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.212 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.213 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.214 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.215 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.216 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.217 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.218 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.219 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.220 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.221 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.222 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.223 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.224 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.225 to ptr), ptr addrspacecast (ptr addrspace(2) @gVar.226 to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE-ExtSLM to ptr)], section "llvm.metadata"

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiKstoreKernelE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4, i32 %bindlessOffset5) #0 {
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %4 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %4)
  %5 = lshr i16 %localIdX, 1
  %6 = zext i16 %5 to i64
  %7 = and i16 %localIdX, 1
  %8 = shl nuw nsw i64 %6, 8, !spirv.Decorations !853
  %9 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %8
  %10 = shl nuw nsw i16 %7, 7
  %11 = zext i16 %10 to i64
  %12 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %9, i64 %11
  br label %13

13:                                               ; preds = %22, %3
  %14 = phi i32 [ 0, %3 ], [ %31, %22 ]
  %15 = phi float [ 0.000000e+00, %3 ], [ %30, %22 ]
  %16 = icmp ult i32 %14, 128
  br i1 %16, label %22, label %17

17:                                               ; preds = %13
  %18 = xor i16 %simdLaneId16, 1
  %19 = zext i16 %18 to i32
  %simdShuffle = call float @llvm.genx.GenISA.WaveShuffleIndex.f32(float %15, i32 %19, i32 0)
  %20 = call float @llvm.maxnum.f32(float %15, float %simdShuffle)
  %21 = fcmp reassoc nsz arcp contract oeq float %20, 0.000000e+00, !spirv.Decorations !856
  br i1 %21, label %34, label %32

22:                                               ; preds = %13
  %23 = zext i32 %14 to i64
  %24 = getelementptr inbounds half, ptr addrspace(1) %12, i64 %23
  %25 = load half, ptr addrspace(1) %24, align 2
  %26 = fpext half %25 to float
  %27 = bitcast float %26 to i32
  %28 = and i32 %27, 2147483647
  %29 = bitcast i32 %28 to float
  %30 = call float @llvm.maxnum.f32(float %15, float %29)
  %31 = add nuw nsw i32 %14, 1, !spirv.Decorations !853
  br label %13, !llvm.loop !858

32:                                               ; preds = %17
  %33 = fmul reassoc nsz arcp contract float %20, 0x3F80204080000000
  br label %34

34:                                               ; preds = %32, %17
  %35 = phi float [ %33, %32 ], [ 0.000000e+00, %17 ]
  %36 = icmp eq i16 %7, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %34
  %38 = getelementptr inbounds float, ptr addrspace(1) %1, i64 %6
  store float %35, ptr addrspace(1) %38, align 4
  br label %39

39:                                               ; preds = %37, %34
  %40 = fcmp reassoc nsz arcp contract oeq float %35, 0.000000e+00, !spirv.Decorations !856
  br i1 %40, label %43, label %41

41:                                               ; preds = %39
  %42 = fdiv reassoc nsz arcp contract float 1.000000e+00, %35, !spirv.Decorations !856
  br label %43

43:                                               ; preds = %41, %39
  %44 = phi float [ %42, %41 ], [ 0.000000e+00, %39 ]
  %45 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %8
  %46 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 %11
  br label %47

47:                                               ; preds = %50, %43
  %48 = phi i32 [ 0, %43 ], [ %61, %50 ]
  %49 = icmp ult i32 %48, 128
  br i1 %49, label %50, label %62

50:                                               ; preds = %47
  %51 = zext i32 %48 to i64
  %52 = getelementptr inbounds half, ptr addrspace(1) %12, i64 %51
  %53 = load half, ptr addrspace(1) %52, align 2
  %54 = fpext half %53 to float
  %55 = fmul reassoc nsz arcp contract float %44, %54, !spirv.Decorations !856
  %56 = call float @llvm.genx.GenISA.ROUNDNE(float %55)
  %57 = call float @llvm.maxnum.f32(float %56, float -1.270000e+02)
  %58 = call float @llvm.minnum.f32(float %57, float 1.270000e+02)
  %59 = fptosi float %58 to i8
  %60 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 %51
  store i8 %59, ptr addrspace(1) %60, align 1
  %61 = add nuw nsw i32 %48, 1, !spirv.Decorations !853
  br label %47, !llvm.loop !860

62:                                               ; preds = %47
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiVstoreKernelE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 1 %3, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bindlessOffset, i32 %bindlessOffset4, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7) #0 {
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %5 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %5)
  %6 = lshr i16 %localIdX, 1
  %7 = zext i16 %6 to i64
  %8 = and i16 %localIdX, 1
  %9 = zext i16 %8 to i32
  %10 = shl nuw nsw i64 %7, 8, !spirv.Decorations !853
  %11 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %10
  %12 = shl nuw nsw i32 %9, 7, !spirv.Decorations !853
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %11, i64 %13
  br label %15

15:                                               ; preds = %34, %4
  %16 = phi i32 [ 0, %4 ], [ %41, %34 ]
  %17 = phi float [ 0xFFF0000000000000, %4 ], [ %40, %34 ]
  %18 = phi float [ 0x7FF0000000000000, %4 ], [ %39, %34 ]
  %19 = icmp ult i32 %16, 128
  br i1 %19, label %34, label %20

20:                                               ; preds = %15
  %21 = xor i16 %simdLaneId16, 1
  %22 = zext i16 %21 to i32
  %simdShuffle = call float @llvm.genx.GenISA.WaveShuffleIndex.f32(float %18, i32 %22, i32 0)
  %simdShuffle9 = call float @llvm.genx.GenISA.WaveShuffleIndex.f32(float %17, i32 %22, i32 0)
  %23 = call float @llvm.minnum.f32(float %18, float %simdShuffle)
  %24 = call float @llvm.maxnum.f32(float %17, float %simdShuffle9)
  %25 = fsub reassoc nsz arcp contract float %24, %23, !spirv.Decorations !856
  %26 = fmul reassoc nsz arcp contract float %25, 0x3FB1111120000000
  %27 = call float @llvm.maxnum.f32(float %26, float 0x3E45798EE0000000)
  %28 = fdiv reassoc nsz arcp contract float %23, %27
  %29 = fsub reassoc nsz arcp contract float 5.000000e-01, %28
  %30 = call float @llvm.floor.f32(float %29)
  %31 = call float @llvm.minnum.f32(float %30, float 1.500000e+01)
  %32 = call float @llvm.maxnum.f32(float %31, float 0.000000e+00)
  %33 = icmp eq i16 %8, 0
  br i1 %33, label %42, label %45

34:                                               ; preds = %15
  %35 = zext i32 %16 to i64
  %36 = getelementptr inbounds half, ptr addrspace(1) %14, i64 %35
  %37 = load half, ptr addrspace(1) %36, align 2
  %38 = fpext half %37 to float
  %39 = call float @llvm.minnum.f32(float %18, float %38)
  %40 = call float @llvm.maxnum.f32(float %17, float %38)
  %41 = add nuw nsw i32 %16, 1, !spirv.Decorations !853
  br label %15, !llvm.loop !861

42:                                               ; preds = %20
  %43 = getelementptr inbounds float, ptr addrspace(1) %1, i64 %7
  store float %27, ptr addrspace(1) %43, align 4
  %44 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %7
  store float %32, ptr addrspace(1) %44, align 4
  br label %45

45:                                               ; preds = %42, %20
  %46 = shl nuw nsw i64 %7, 7, !spirv.Decorations !853
  %47 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %46
  %48 = shl nuw nsw i32 %9, 6, !spirv.Decorations !853
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i8, ptr addrspace(1) %47, i64 %49
  br label %51

51:                                               ; preds = %54, %45
  %52 = phi i32 [ 0, %45 ], [ %81, %54 ]
  %53 = icmp ult i32 %52, 64
  br i1 %53, label %54, label %82

54:                                               ; preds = %51
  %55 = shl nuw nsw i32 %52, 1, !spirv.Decorations !853
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %14, i64 %56
  %58 = load half, ptr addrspace(1) %57, align 2
  %59 = fpext half %58 to float
  %60 = getelementptr half, ptr addrspace(1) %57, i64 1
  %61 = load half, ptr addrspace(1) %60, align 2
  %62 = fpext half %61 to float
  %63 = fdiv reassoc nsz arcp contract float %59, %27, !spirv.Decorations !856
  %64 = fadd reassoc nsz arcp contract float %63, %32, !spirv.Decorations !856
  %65 = fadd reassoc nsz arcp contract float %64, 5.000000e-01, !spirv.Decorations !856
  %66 = call float @llvm.floor.f32(float %65)
  %67 = fdiv reassoc nsz arcp contract float %62, %27, !spirv.Decorations !856
  %68 = fadd reassoc nsz arcp contract float %67, %32, !spirv.Decorations !856
  %69 = fadd reassoc nsz arcp contract float %68, 5.000000e-01, !spirv.Decorations !856
  %70 = call float @llvm.floor.f32(float %69)
  %71 = call float @llvm.minnum.f32(float %66, float 1.500000e+01)
  %72 = call float @llvm.maxnum.f32(float %71, float 0.000000e+00)
  %73 = call float @llvm.minnum.f32(float %70, float 1.500000e+01)
  %74 = call float @llvm.maxnum.f32(float %73, float 0.000000e+00)
  %75 = fptoui float %72 to i8
  %76 = fptoui float %74 to i8
  %77 = shl i8 %76, 4
  %78 = or i8 %77, %75
  %79 = zext i32 %52 to i64
  %80 = getelementptr inbounds i8, ptr addrspace(1) %50, i64 %79
  store i8 %78, ptr addrspace(1) %80, align 1
  %81 = add nuw nsw i32 %52, 1, !spirv.Decorations !853
  br label %51, !llvm.loop !862

82:                                               ; preds = %51
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi2EEE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4, i32 %bindlessOffset5) #0 {
  %4 = extractelement <8 x i32> %r0, i32 0
  %5 = extractelement <8 x i32> %r0, i32 1
  %6 = extractelement <8 x i32> %r0, i32 2
  %7 = extractelement <8 x i32> %r0, i32 3
  %8 = extractelement <8 x i32> %r0, i32 4
  %9 = extractelement <8 x i32> %r0, i32 5
  %10 = extractelement <8 x i32> %r0, i32 6
  %11 = extractelement <8 x i32> %r0, i32 7
  %12 = zext i32 %5 to i64
  %13 = icmp sgt i32 %5, -1
  call void @llvm.assume(i1 %13)
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %14 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %14)
  %15 = lshr i16 %localIdX, 1
  %16 = zext i16 %15 to i64
  %17 = and i16 %localIdX, 1
  %18 = shl nuw nsw i64 %12, 8, !spirv.Decorations !853
  %19 = shl nuw nsw i64 %12, 14, !spirv.Decorations !853
  %20 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %19
  %21 = shl nuw nsw i64 %16, 8, !spirv.Decorations !853
  %22 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %20, i64 %21
  %23 = shl nuw nsw i16 %17, 7
  %24 = zext i16 %23 to i64
  %25 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %22, i64 %24
  br label %26

26:                                               ; preds = %35, %3
  %27 = phi i32 [ 0, %3 ], [ %44, %35 ]
  %28 = phi float [ 0.000000e+00, %3 ], [ %43, %35 ]
  %29 = icmp ult i32 %27, 128
  br i1 %29, label %35, label %30

30:                                               ; preds = %26
  %31 = xor i16 %simdLaneId16, 1
  %32 = zext i16 %31 to i32
  %simdShuffle = call float @llvm.genx.GenISA.WaveShuffleIndex.f32(float %28, i32 %32, i32 0)
  %33 = call float @llvm.maxnum.f32(float %28, float %simdShuffle)
  %34 = fcmp reassoc nsz arcp contract oeq float %33, 0.000000e+00, !spirv.Decorations !856
  br i1 %34, label %47, label %45

35:                                               ; preds = %26
  %36 = zext i32 %27 to i64
  %37 = getelementptr inbounds half, ptr addrspace(1) %25, i64 %36
  %38 = load half, ptr addrspace(1) %37, align 2
  %39 = fpext half %38 to float
  %40 = bitcast float %39 to i32
  %41 = and i32 %40, 2147483647
  %42 = bitcast i32 %41 to float
  %43 = call float @llvm.maxnum.f32(float %28, float %42)
  %44 = add nuw nsw i32 %27, 1, !spirv.Decorations !853
  br label %26, !llvm.loop !863

45:                                               ; preds = %30
  %46 = fmul reassoc nsz arcp contract float %33, 0x3F80204080000000
  br label %47

47:                                               ; preds = %45, %30
  %48 = phi float [ %46, %45 ], [ 0.000000e+00, %30 ]
  %49 = icmp eq i16 %17, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = getelementptr i8, ptr addrspace(1) %1, i64 %18
  %52 = getelementptr float, ptr addrspace(1) %51, i64 %16
  store float %48, ptr addrspace(1) %52, align 4
  br label %53

53:                                               ; preds = %50, %47
  %54 = fcmp reassoc nsz arcp contract oeq float %48, 0.000000e+00, !spirv.Decorations !856
  br i1 %54, label %57, label %55

55:                                               ; preds = %53
  %56 = fdiv reassoc nsz arcp contract float 1.000000e+00, %48, !spirv.Decorations !856
  br label %57

57:                                               ; preds = %55, %53
  %58 = phi float [ %56, %55 ], [ 0.000000e+00, %53 ]
  %59 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %19
  %60 = getelementptr inbounds i8, ptr addrspace(1) %59, i64 %21
  %61 = getelementptr inbounds i8, ptr addrspace(1) %60, i64 %24
  br label %62

62:                                               ; preds = %65, %57
  %63 = phi i32 [ 0, %57 ], [ %76, %65 ]
  %64 = icmp ult i32 %63, 128
  br i1 %64, label %65, label %77

65:                                               ; preds = %62
  %66 = zext i32 %63 to i64
  %67 = getelementptr inbounds half, ptr addrspace(1) %25, i64 %66
  %68 = load half, ptr addrspace(1) %67, align 2
  %69 = fpext half %68 to float
  %70 = fmul reassoc nsz arcp contract float %58, %69, !spirv.Decorations !856
  %71 = call float @llvm.genx.GenISA.ROUNDNE(float %70)
  %72 = call float @llvm.maxnum.f32(float %71, float -1.270000e+02)
  %73 = call float @llvm.minnum.f32(float %72, float 1.270000e+02)
  %74 = fptosi float %73 to i8
  %75 = getelementptr inbounds i8, ptr addrspace(1) %61, i64 %66
  store i8 %74, ptr addrspace(1) %75, align 1
  %76 = add nuw nsw i32 %63, 1, !spirv.Decorations !853
  br label %62, !llvm.loop !864

77:                                               ; preds = %62
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi4EEE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4, i32 %bindlessOffset5) #0 {
  %4 = extractelement <8 x i32> %r0, i32 0
  %5 = extractelement <8 x i32> %r0, i32 1
  %6 = extractelement <8 x i32> %r0, i32 2
  %7 = extractelement <8 x i32> %r0, i32 3
  %8 = extractelement <8 x i32> %r0, i32 4
  %9 = extractelement <8 x i32> %r0, i32 5
  %10 = extractelement <8 x i32> %r0, i32 6
  %11 = extractelement <8 x i32> %r0, i32 7
  %12 = zext i32 %5 to i64
  %13 = icmp sgt i32 %5, -1
  call void @llvm.assume(i1 %13)
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %14 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %14)
  %15 = lshr i16 %localIdX, 1
  %16 = zext i16 %15 to i64
  %17 = and i16 %localIdX, 1
  %18 = shl nuw nsw i64 %12, 8, !spirv.Decorations !853
  %19 = shl nuw nsw i64 %12, 14, !spirv.Decorations !853
  %20 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %19
  %21 = shl nuw nsw i64 %16, 8, !spirv.Decorations !853
  %22 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %20, i64 %21
  %23 = shl nuw nsw i16 %17, 7
  %24 = zext i16 %23 to i64
  %25 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %22, i64 %24
  br label %26

26:                                               ; preds = %35, %3
  %27 = phi i32 [ 0, %3 ], [ %44, %35 ]
  %28 = phi float [ 0.000000e+00, %3 ], [ %43, %35 ]
  %29 = icmp ult i32 %27, 128
  br i1 %29, label %35, label %30

30:                                               ; preds = %26
  %31 = xor i16 %simdLaneId16, 1
  %32 = zext i16 %31 to i32
  %simdShuffle = call float @llvm.genx.GenISA.WaveShuffleIndex.f32(float %28, i32 %32, i32 0)
  %33 = call float @llvm.maxnum.f32(float %28, float %simdShuffle)
  %34 = fcmp reassoc nsz arcp contract oeq float %33, 0.000000e+00, !spirv.Decorations !856
  br i1 %34, label %47, label %45

35:                                               ; preds = %26
  %36 = zext i32 %27 to i64
  %37 = getelementptr inbounds half, ptr addrspace(1) %25, i64 %36
  %38 = load half, ptr addrspace(1) %37, align 2
  %39 = fpext half %38 to float
  %40 = bitcast float %39 to i32
  %41 = and i32 %40, 2147483647
  %42 = bitcast i32 %41 to float
  %43 = call float @llvm.maxnum.f32(float %28, float %42)
  %44 = add nuw nsw i32 %27, 1, !spirv.Decorations !853
  br label %26, !llvm.loop !865

45:                                               ; preds = %30
  %46 = fmul reassoc nsz arcp contract float %33, 0x3F80204080000000
  br label %47

47:                                               ; preds = %45, %30
  %48 = phi float [ %46, %45 ], [ 0.000000e+00, %30 ]
  %49 = icmp eq i16 %17, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = getelementptr i8, ptr addrspace(1) %1, i64 %18
  %52 = getelementptr float, ptr addrspace(1) %51, i64 %16
  store float %48, ptr addrspace(1) %52, align 4
  br label %53

53:                                               ; preds = %50, %47
  %54 = fcmp reassoc nsz arcp contract oeq float %48, 0.000000e+00, !spirv.Decorations !856
  br i1 %54, label %57, label %55

55:                                               ; preds = %53
  %56 = fdiv reassoc nsz arcp contract float 1.000000e+00, %48, !spirv.Decorations !856
  br label %57

57:                                               ; preds = %55, %53
  %58 = phi float [ %56, %55 ], [ 0.000000e+00, %53 ]
  %59 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %19
  %60 = getelementptr inbounds i8, ptr addrspace(1) %59, i64 %21
  %61 = getelementptr inbounds i8, ptr addrspace(1) %60, i64 %24
  br label %62

62:                                               ; preds = %65, %57
  %63 = phi i32 [ 0, %57 ], [ %76, %65 ]
  %64 = icmp ult i32 %63, 128
  br i1 %64, label %65, label %77

65:                                               ; preds = %62
  %66 = zext i32 %63 to i64
  %67 = getelementptr inbounds half, ptr addrspace(1) %25, i64 %66
  %68 = load half, ptr addrspace(1) %67, align 2
  %69 = fpext half %68 to float
  %70 = fmul reassoc nsz arcp contract float %58, %69, !spirv.Decorations !856
  %71 = call float @llvm.genx.GenISA.ROUNDNE(float %70)
  %72 = call float @llvm.maxnum.f32(float %71, float -1.270000e+02)
  %73 = call float @llvm.minnum.f32(float %72, float 1.270000e+02)
  %74 = fptosi float %73 to i8
  %75 = getelementptr inbounds i8, ptr addrspace(1) %61, i64 %66
  store i8 %74, ptr addrspace(1) %75, align 1
  %76 = add nuw nsw i32 %63, 1, !spirv.Decorations !853
  br label %62, !llvm.loop !866

77:                                               ; preds = %62
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi2EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, ptr addrspace(1) align 4 %3, i64 %4, ptr addrspace(1) align 1 %5, i64 %6, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bindlessOffset, i32 %bindlessOffset4, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7) #0 {
  %8 = extractelement <3 x i32> %localSize, i32 0
  %9 = extractelement <3 x i32> %localSize, i32 1
  %10 = extractelement <3 x i32> %localSize, i32 2
  %11 = extractelement <8 x i32> %r0, i32 0
  %12 = extractelement <8 x i32> %r0, i32 1
  %13 = extractelement <8 x i32> %r0, i32 2
  %14 = extractelement <8 x i32> %r0, i32 3
  %15 = extractelement <8 x i32> %r0, i32 4
  %16 = extractelement <8 x i32> %r0, i32 5
  %17 = extractelement <8 x i32> %r0, i32 6
  %18 = extractelement <8 x i32> %r0, i32 7
  %19 = zext i16 %localIdX to i32
  %20 = zext i32 %12 to i64
  %21 = icmp sgt i32 %12, -1
  call void @llvm.assume(i1 %21)
  %22 = lshr i64 %20, 1
  %23 = and i64 %20, 1
  %24 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %22
  %25 = load i64, ptr addrspace(1) %24, align 8
  %26 = icmp sgt i64 %25, -1
  %27 = lshr i64 %25, 6
  %28 = trunc i64 %27 to i32
  %29 = select i1 %26, i32 %28, i32 -1
  %30 = trunc i64 %25 to i32
  %31 = and i32 %30, 63
  %32 = select i1 %26, i32 %31, i32 -1
  %33 = icmp sgt i32 %29, -1
  br i1 %33, label %34, label %38

34:                                               ; preds = %7
  %35 = zext i32 %29 to i64
  %36 = icmp slt i64 %35, %1
  %37 = and i1 %36, %26
  br label %38

38:                                               ; preds = %34, %7
  %39 = phi i1 [ false, %7 ], [ %37, %34 ]
  %40 = shl nuw nsw i64 %22, 9, !spirv.Decorations !853
  %41 = shl nuw nsw i64 %23, 8, !spirv.Decorations !853
  %42 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %2, i64 %40
  %43 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %42, i64 %41
  br label %44

44:                                               ; preds = %189, %38
  %45 = phi i32 [ %19, %38 ], [ %198, %189 ]
  %46 = phi float [ 0.000000e+00, %38 ], [ %197, %189 ]
  %47 = icmp ult i32 %45, 256
  br i1 %47, label %189, label %48

48:                                               ; preds = %44
  %49 = call float @llvm.genx.GenISA.WaveAll.f32(float %46, i8 12, i1 true, i32 0)
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %50 = bitcast <8 x i32> %r0 to <32 x i8>
  %51 = extractelement <32 x i8> %50, i32 0
  %52 = extractelement <32 x i8> %50, i32 1
  %53 = extractelement <32 x i8> %50, i32 2
  %54 = extractelement <32 x i8> %50, i32 3
  %55 = extractelement <32 x i8> %50, i32 4
  %56 = extractelement <32 x i8> %50, i32 5
  %57 = extractelement <32 x i8> %50, i32 6
  %58 = extractelement <32 x i8> %50, i32 7
  %59 = extractelement <32 x i8> %50, i32 8
  %60 = extractelement <32 x i8> %50, i32 9
  %61 = extractelement <32 x i8> %50, i32 10
  %62 = extractelement <32 x i8> %50, i32 11
  %63 = extractelement <32 x i8> %50, i32 12
  %64 = extractelement <32 x i8> %50, i32 13
  %65 = extractelement <32 x i8> %50, i32 14
  %66 = extractelement <32 x i8> %50, i32 15
  %67 = extractelement <32 x i8> %50, i32 16
  %68 = extractelement <32 x i8> %50, i32 17
  %69 = extractelement <32 x i8> %50, i32 18
  %70 = extractelement <32 x i8> %50, i32 19
  %71 = extractelement <32 x i8> %50, i32 20
  %72 = extractelement <32 x i8> %50, i32 21
  %73 = extractelement <32 x i8> %50, i32 22
  %74 = extractelement <32 x i8> %50, i32 23
  %75 = extractelement <32 x i8> %50, i32 24
  %76 = extractelement <32 x i8> %50, i32 25
  %77 = extractelement <32 x i8> %50, i32 26
  %78 = extractelement <32 x i8> %50, i32 27
  %79 = extractelement <32 x i8> %50, i32 28
  %80 = extractelement <32 x i8> %50, i32 29
  %81 = extractelement <32 x i8> %50, i32 30
  %82 = extractelement <32 x i8> %50, i32 31
  %localThreadId9 = zext i8 %59 to i32
  %83 = mul i32 %9, %8
  %84 = mul i32 %83, %10
  %85 = add i32 %84, 15
  %86 = lshr i32 %85, 4
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %87 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %87)
  %88 = mul i32 %9, %8
  %89 = mul i32 %88, %10
  %90 = and i32 %89, 15
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %132, label %92

92:                                               ; preds = %48
  %93 = bitcast <8 x i32> %r0 to <32 x i8>
  %94 = extractelement <32 x i8> %93, i32 0
  %95 = extractelement <32 x i8> %93, i32 1
  %96 = extractelement <32 x i8> %93, i32 2
  %97 = extractelement <32 x i8> %93, i32 3
  %98 = extractelement <32 x i8> %93, i32 4
  %99 = extractelement <32 x i8> %93, i32 5
  %100 = extractelement <32 x i8> %93, i32 6
  %101 = extractelement <32 x i8> %93, i32 7
  %102 = extractelement <32 x i8> %93, i32 8
  %103 = extractelement <32 x i8> %93, i32 9
  %104 = extractelement <32 x i8> %93, i32 10
  %105 = extractelement <32 x i8> %93, i32 11
  %106 = extractelement <32 x i8> %93, i32 12
  %107 = extractelement <32 x i8> %93, i32 13
  %108 = extractelement <32 x i8> %93, i32 14
  %109 = extractelement <32 x i8> %93, i32 15
  %110 = extractelement <32 x i8> %93, i32 16
  %111 = extractelement <32 x i8> %93, i32 17
  %112 = extractelement <32 x i8> %93, i32 18
  %113 = extractelement <32 x i8> %93, i32 19
  %114 = extractelement <32 x i8> %93, i32 20
  %115 = extractelement <32 x i8> %93, i32 21
  %116 = extractelement <32 x i8> %93, i32 22
  %117 = extractelement <32 x i8> %93, i32 23
  %118 = extractelement <32 x i8> %93, i32 24
  %119 = extractelement <32 x i8> %93, i32 25
  %120 = extractelement <32 x i8> %93, i32 26
  %121 = extractelement <32 x i8> %93, i32 27
  %122 = extractelement <32 x i8> %93, i32 28
  %123 = extractelement <32 x i8> %93, i32 29
  %124 = extractelement <32 x i8> %93, i32 30
  %125 = extractelement <32 x i8> %93, i32 31
  %localThreadId1718 = zext i8 %102 to i32
  %126 = mul i32 %9, %8
  %127 = mul i32 %126, %10
  %128 = add i32 %127, 15
  %129 = lshr i32 %128, 4
  %130 = add nsw i32 %129, -1
  %131 = icmp ugt i32 %130, %localThreadId1718
  br i1 %131, label %132, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i

132:                                              ; preds = %92, %48
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i:        ; preds = %132, %92
  %133 = phi i32 [ 16, %132 ], [ %90, %92 ]
  %134 = icmp eq i16 %simdLaneId16, 0
  br i1 %134, label %135, label %138

135:                                              ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i
  %136 = zext i8 %59 to i64
  %137 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %136
  store float %49, ptr addrspace(3) %137, align 4, !tbaa !867
  br label %138

138:                                              ; preds = %135, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %139 = shl nuw nsw i32 %localThreadId9, 4
  %140 = add nuw nsw i32 %139, %simdLaneId
  %141 = icmp ugt i32 %85, 271
  br i1 %141, label %142, label %163

142:                                              ; preds = %138
  %143 = zext i32 %140 to i64
  %144 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %143
  %145 = zext i8 %59 to i64
  %146 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %145
  br label %147

147:                                              ; preds = %161, %142
  %148 = phi i32 [ %86, %142 ], [ %150, %161 ]
  %149 = add nuw nsw i32 %148, 15
  %150 = lshr i32 %149, 4
  %151 = and i32 %149, 536870896
  %152 = icmp ult i32 %140, %148
  br i1 %152, label %153, label %155

153:                                              ; preds = %147
  %154 = load float, ptr addrspace(3) %144, align 4, !tbaa !867
  br label %155

155:                                              ; preds = %153, %147
  %156 = phi float [ %154, %153 ], [ 0xFFF0000000000000, %147 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %157 = icmp ult i32 %140, %151
  br i1 %157, label %158, label %161

158:                                              ; preds = %155
  %159 = call float @llvm.genx.GenISA.WaveAll.f32(float %156, i8 12, i1 true, i32 0)
  br i1 %134, label %160, label %161

160:                                              ; preds = %158
  store float %159, ptr addrspace(3) %146, align 4, !tbaa !867
  br label %161

161:                                              ; preds = %160, %158, %155
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %162 = icmp ugt i32 %148, 256
  br i1 %162, label %147, label %163

163:                                              ; preds = %161, %138
  %164 = phi i32 [ %86, %138 ], [ %150, %161 ]
  %165 = icmp ugt i32 %164, %133
  br i1 %165, label %166, label %178

166:                                              ; preds = %163
  %167 = load float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, align 4, !tbaa !867
  %168 = icmp ugt i32 %164, 1
  br i1 %168, label %169, label %_Z17__spirv_GroupFMaxiif.exit

169:                                              ; preds = %169, %166
  %170 = phi i32 [ %176, %169 ], [ 1, %166 ]
  %171 = phi float [ %175, %169 ], [ %167, %166 ]
  %172 = zext i32 %170 to i64
  %173 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %172
  %174 = load float, ptr addrspace(3) %173, align 4, !tbaa !867
  %175 = call float @llvm.maxnum.f32(float %171, float %174)
  %176 = add nuw nsw i32 %170, 1
  %177 = icmp ult i32 %176, %164
  br i1 %177, label %169, label %_Z17__spirv_GroupFMaxiif.exit

178:                                              ; preds = %163
  %179 = icmp ugt i32 %164, %simdLaneId
  br i1 %179, label %180, label %184

180:                                              ; preds = %178
  %181 = zext i16 %simdLaneId16 to i64
  %182 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %181
  %183 = load float, ptr addrspace(3) %182, align 4, !tbaa !867
  br label %184

184:                                              ; preds = %180, %178
  %185 = phi float [ %183, %180 ], [ 0xFFF0000000000000, %178 ]
  %186 = call float @llvm.genx.GenISA.WaveAll.f32(float %185, i8 12, i1 true, i32 0)
  br label %_Z17__spirv_GroupFMaxiif.exit

_Z17__spirv_GroupFMaxiif.exit:                    ; preds = %166, %169, %184
  %187 = phi float [ %186, %184 ], [ %167, %166 ], [ %175, %169 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %188 = fcmp reassoc nsz arcp contract oeq float %187, 0.000000e+00, !spirv.Decorations !856
  br i1 %188, label %201, label %199

189:                                              ; preds = %44
  %190 = zext i32 %45 to i64
  %191 = getelementptr inbounds half, ptr addrspace(1) %43, i64 %190
  %192 = load half, ptr addrspace(1) %191, align 2
  %193 = fpext half %192 to float
  %194 = bitcast float %193 to i32
  %195 = and i32 %194, 2147483647
  %196 = bitcast i32 %195 to float
  %197 = call float @llvm.maxnum.f32(float %46, float %196)
  %198 = add nuw nsw i32 %45, 32, !spirv.Decorations !853
  br label %44

199:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit
  %200 = fmul reassoc nsz arcp contract float %187, 0x3F80204080000000
  br label %201

201:                                              ; preds = %199, %_Z17__spirv_GroupFMaxiif.exit
  %202 = phi float [ %200, %199 ], [ 0.000000e+00, %_Z17__spirv_GroupFMaxiif.exit ]
  %203 = icmp eq i16 %localIdX, 0
  %204 = and i1 %203, %39
  br i1 %204, label %205, label %213

205:                                              ; preds = %201
  %206 = sext i32 %29 to i64
  %207 = mul i64 %206, %4
  %208 = sext i32 %32 to i64
  %209 = shl nsw i64 %208, 1, !spirv.Decorations !871
  %210 = getelementptr float, ptr addrspace(1) %3, i64 %207
  %211 = getelementptr float, ptr addrspace(1) %210, i64 %209
  %212 = getelementptr float, ptr addrspace(1) %211, i64 %23
  store float %202, ptr addrspace(1) %212, align 4
  br label %213

213:                                              ; preds = %205, %201
  br i1 %39, label %214, label %242

214:                                              ; preds = %213
  %215 = fcmp reassoc nsz arcp contract oeq float %202, 0.000000e+00, !spirv.Decorations !856
  br i1 %215, label %218, label %216

216:                                              ; preds = %214
  %217 = fdiv reassoc nsz arcp contract float 1.000000e+00, %202, !spirv.Decorations !856
  br label %218

218:                                              ; preds = %216, %214
  %219 = phi float [ %217, %216 ], [ 0.000000e+00, %214 ]
  %220 = sext i32 %29 to i64
  %221 = mul i64 %220, %6
  %222 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %221
  %223 = sext i32 %32 to i64
  %224 = shl nsw i64 %223, 9, !spirv.Decorations !871
  %225 = getelementptr i8, ptr addrspace(1) %222, i64 %224
  %226 = getelementptr i8, ptr addrspace(1) %225, i64 %41
  br label %227

227:                                              ; preds = %230, %218
  %228 = phi i32 [ %19, %218 ], [ %241, %230 ]
  %229 = icmp ult i32 %228, 256
  br i1 %229, label %230, label %.loopexit

230:                                              ; preds = %227
  %231 = zext i32 %228 to i64
  %232 = getelementptr inbounds half, ptr addrspace(1) %43, i64 %231
  %233 = load half, ptr addrspace(1) %232, align 2
  %234 = fpext half %233 to float
  %235 = fmul reassoc nsz arcp contract float %219, %234, !spirv.Decorations !856
  %236 = call float @llvm.genx.GenISA.ROUNDNE(float %235)
  %237 = call float @llvm.maxnum.f32(float %236, float -1.270000e+02)
  %238 = call float @llvm.minnum.f32(float %237, float 1.270000e+02)
  %239 = fptosi float %238 to i8
  %240 = getelementptr inbounds i8, ptr addrspace(1) %226, i64 %231
  store i8 %239, ptr addrspace(1) %240, align 1
  %241 = add nuw nsw i32 %228, 32, !spirv.Decorations !853
  br label %227

.loopexit:                                        ; preds = %227
  br label %242

242:                                              ; preds = %.loopexit, %213
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi4EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, ptr addrspace(1) align 4 %3, i64 %4, ptr addrspace(1) align 1 %5, i64 %6, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bindlessOffset, i32 %bindlessOffset4, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7) #0 {
  %8 = extractelement <3 x i32> %localSize, i32 0
  %9 = extractelement <3 x i32> %localSize, i32 1
  %10 = extractelement <3 x i32> %localSize, i32 2
  %11 = extractelement <8 x i32> %r0, i32 0
  %12 = extractelement <8 x i32> %r0, i32 1
  %13 = extractelement <8 x i32> %r0, i32 2
  %14 = extractelement <8 x i32> %r0, i32 3
  %15 = extractelement <8 x i32> %r0, i32 4
  %16 = extractelement <8 x i32> %r0, i32 5
  %17 = extractelement <8 x i32> %r0, i32 6
  %18 = extractelement <8 x i32> %r0, i32 7
  %19 = zext i16 %localIdX to i32
  %20 = zext i32 %12 to i64
  %21 = icmp sgt i32 %12, -1
  call void @llvm.assume(i1 %21)
  %22 = lshr i64 %20, 2
  %23 = and i64 %20, 3
  %24 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %22
  %25 = load i64, ptr addrspace(1) %24, align 8
  %26 = icmp sgt i64 %25, -1
  %27 = lshr i64 %25, 6
  %28 = trunc i64 %27 to i32
  %29 = select i1 %26, i32 %28, i32 -1
  %30 = trunc i64 %25 to i32
  %31 = and i32 %30, 63
  %32 = select i1 %26, i32 %31, i32 -1
  %33 = icmp sgt i32 %29, -1
  br i1 %33, label %34, label %38

34:                                               ; preds = %7
  %35 = zext i32 %29 to i64
  %36 = icmp slt i64 %35, %1
  %37 = and i1 %36, %26
  br label %38

38:                                               ; preds = %34, %7
  %39 = phi i1 [ false, %7 ], [ %37, %34 ]
  %40 = shl nuw nsw i64 %22, 10, !spirv.Decorations !853
  %41 = shl nuw nsw i64 %23, 8, !spirv.Decorations !853
  %42 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %2, i64 %40
  %43 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %42, i64 %41
  br label %44

44:                                               ; preds = %189, %38
  %45 = phi i32 [ %19, %38 ], [ %198, %189 ]
  %46 = phi float [ 0.000000e+00, %38 ], [ %197, %189 ]
  %47 = icmp ult i32 %45, 256
  br i1 %47, label %189, label %48

48:                                               ; preds = %44
  %49 = call float @llvm.genx.GenISA.WaveAll.f32(float %46, i8 12, i1 true, i32 0)
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %50 = bitcast <8 x i32> %r0 to <32 x i8>
  %51 = extractelement <32 x i8> %50, i32 0
  %52 = extractelement <32 x i8> %50, i32 1
  %53 = extractelement <32 x i8> %50, i32 2
  %54 = extractelement <32 x i8> %50, i32 3
  %55 = extractelement <32 x i8> %50, i32 4
  %56 = extractelement <32 x i8> %50, i32 5
  %57 = extractelement <32 x i8> %50, i32 6
  %58 = extractelement <32 x i8> %50, i32 7
  %59 = extractelement <32 x i8> %50, i32 8
  %60 = extractelement <32 x i8> %50, i32 9
  %61 = extractelement <32 x i8> %50, i32 10
  %62 = extractelement <32 x i8> %50, i32 11
  %63 = extractelement <32 x i8> %50, i32 12
  %64 = extractelement <32 x i8> %50, i32 13
  %65 = extractelement <32 x i8> %50, i32 14
  %66 = extractelement <32 x i8> %50, i32 15
  %67 = extractelement <32 x i8> %50, i32 16
  %68 = extractelement <32 x i8> %50, i32 17
  %69 = extractelement <32 x i8> %50, i32 18
  %70 = extractelement <32 x i8> %50, i32 19
  %71 = extractelement <32 x i8> %50, i32 20
  %72 = extractelement <32 x i8> %50, i32 21
  %73 = extractelement <32 x i8> %50, i32 22
  %74 = extractelement <32 x i8> %50, i32 23
  %75 = extractelement <32 x i8> %50, i32 24
  %76 = extractelement <32 x i8> %50, i32 25
  %77 = extractelement <32 x i8> %50, i32 26
  %78 = extractelement <32 x i8> %50, i32 27
  %79 = extractelement <32 x i8> %50, i32 28
  %80 = extractelement <32 x i8> %50, i32 29
  %81 = extractelement <32 x i8> %50, i32 30
  %82 = extractelement <32 x i8> %50, i32 31
  %localThreadId9 = zext i8 %59 to i32
  %83 = mul i32 %9, %8
  %84 = mul i32 %83, %10
  %85 = add i32 %84, 15
  %86 = lshr i32 %85, 4
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %87 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %87)
  %88 = mul i32 %9, %8
  %89 = mul i32 %88, %10
  %90 = and i32 %89, 15
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %132, label %92

92:                                               ; preds = %48
  %93 = bitcast <8 x i32> %r0 to <32 x i8>
  %94 = extractelement <32 x i8> %93, i32 0
  %95 = extractelement <32 x i8> %93, i32 1
  %96 = extractelement <32 x i8> %93, i32 2
  %97 = extractelement <32 x i8> %93, i32 3
  %98 = extractelement <32 x i8> %93, i32 4
  %99 = extractelement <32 x i8> %93, i32 5
  %100 = extractelement <32 x i8> %93, i32 6
  %101 = extractelement <32 x i8> %93, i32 7
  %102 = extractelement <32 x i8> %93, i32 8
  %103 = extractelement <32 x i8> %93, i32 9
  %104 = extractelement <32 x i8> %93, i32 10
  %105 = extractelement <32 x i8> %93, i32 11
  %106 = extractelement <32 x i8> %93, i32 12
  %107 = extractelement <32 x i8> %93, i32 13
  %108 = extractelement <32 x i8> %93, i32 14
  %109 = extractelement <32 x i8> %93, i32 15
  %110 = extractelement <32 x i8> %93, i32 16
  %111 = extractelement <32 x i8> %93, i32 17
  %112 = extractelement <32 x i8> %93, i32 18
  %113 = extractelement <32 x i8> %93, i32 19
  %114 = extractelement <32 x i8> %93, i32 20
  %115 = extractelement <32 x i8> %93, i32 21
  %116 = extractelement <32 x i8> %93, i32 22
  %117 = extractelement <32 x i8> %93, i32 23
  %118 = extractelement <32 x i8> %93, i32 24
  %119 = extractelement <32 x i8> %93, i32 25
  %120 = extractelement <32 x i8> %93, i32 26
  %121 = extractelement <32 x i8> %93, i32 27
  %122 = extractelement <32 x i8> %93, i32 28
  %123 = extractelement <32 x i8> %93, i32 29
  %124 = extractelement <32 x i8> %93, i32 30
  %125 = extractelement <32 x i8> %93, i32 31
  %localThreadId1718 = zext i8 %102 to i32
  %126 = mul i32 %9, %8
  %127 = mul i32 %126, %10
  %128 = add i32 %127, 15
  %129 = lshr i32 %128, 4
  %130 = add nsw i32 %129, -1
  %131 = icmp ugt i32 %130, %localThreadId1718
  br i1 %131, label %132, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i

132:                                              ; preds = %92, %48
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i:        ; preds = %132, %92
  %133 = phi i32 [ 16, %132 ], [ %90, %92 ]
  %134 = icmp eq i16 %simdLaneId16, 0
  br i1 %134, label %135, label %138

135:                                              ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i
  %136 = zext i8 %59 to i64
  %137 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %136
  store float %49, ptr addrspace(3) %137, align 4, !tbaa !867
  br label %138

138:                                              ; preds = %135, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %139 = shl nuw nsw i32 %localThreadId9, 4
  %140 = add nuw nsw i32 %139, %simdLaneId
  %141 = icmp ugt i32 %85, 271
  br i1 %141, label %142, label %163

142:                                              ; preds = %138
  %143 = zext i32 %140 to i64
  %144 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %143
  %145 = zext i8 %59 to i64
  %146 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %145
  br label %147

147:                                              ; preds = %161, %142
  %148 = phi i32 [ %86, %142 ], [ %150, %161 ]
  %149 = add nuw nsw i32 %148, 15
  %150 = lshr i32 %149, 4
  %151 = and i32 %149, 536870896
  %152 = icmp ult i32 %140, %148
  br i1 %152, label %153, label %155

153:                                              ; preds = %147
  %154 = load float, ptr addrspace(3) %144, align 4, !tbaa !867
  br label %155

155:                                              ; preds = %153, %147
  %156 = phi float [ %154, %153 ], [ 0xFFF0000000000000, %147 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %157 = icmp ult i32 %140, %151
  br i1 %157, label %158, label %161

158:                                              ; preds = %155
  %159 = call float @llvm.genx.GenISA.WaveAll.f32(float %156, i8 12, i1 true, i32 0)
  br i1 %134, label %160, label %161

160:                                              ; preds = %158
  store float %159, ptr addrspace(3) %146, align 4, !tbaa !867
  br label %161

161:                                              ; preds = %160, %158, %155
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %162 = icmp ugt i32 %148, 256
  br i1 %162, label %147, label %163

163:                                              ; preds = %161, %138
  %164 = phi i32 [ %86, %138 ], [ %150, %161 ]
  %165 = icmp ugt i32 %164, %133
  br i1 %165, label %166, label %178

166:                                              ; preds = %163
  %167 = load float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, align 4, !tbaa !867
  %168 = icmp ugt i32 %164, 1
  br i1 %168, label %169, label %_Z17__spirv_GroupFMaxiif.exit

169:                                              ; preds = %169, %166
  %170 = phi i32 [ %176, %169 ], [ 1, %166 ]
  %171 = phi float [ %175, %169 ], [ %167, %166 ]
  %172 = zext i32 %170 to i64
  %173 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %172
  %174 = load float, ptr addrspace(3) %173, align 4, !tbaa !867
  %175 = call float @llvm.maxnum.f32(float %171, float %174)
  %176 = add nuw nsw i32 %170, 1
  %177 = icmp ult i32 %176, %164
  br i1 %177, label %169, label %_Z17__spirv_GroupFMaxiif.exit

178:                                              ; preds = %163
  %179 = icmp ugt i32 %164, %simdLaneId
  br i1 %179, label %180, label %184

180:                                              ; preds = %178
  %181 = zext i16 %simdLaneId16 to i64
  %182 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %181
  %183 = load float, ptr addrspace(3) %182, align 4, !tbaa !867
  br label %184

184:                                              ; preds = %180, %178
  %185 = phi float [ %183, %180 ], [ 0xFFF0000000000000, %178 ]
  %186 = call float @llvm.genx.GenISA.WaveAll.f32(float %185, i8 12, i1 true, i32 0)
  br label %_Z17__spirv_GroupFMaxiif.exit

_Z17__spirv_GroupFMaxiif.exit:                    ; preds = %166, %169, %184
  %187 = phi float [ %186, %184 ], [ %167, %166 ], [ %175, %169 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %188 = fcmp reassoc nsz arcp contract oeq float %187, 0.000000e+00, !spirv.Decorations !856
  br i1 %188, label %201, label %199

189:                                              ; preds = %44
  %190 = zext i32 %45 to i64
  %191 = getelementptr inbounds half, ptr addrspace(1) %43, i64 %190
  %192 = load half, ptr addrspace(1) %191, align 2
  %193 = fpext half %192 to float
  %194 = bitcast float %193 to i32
  %195 = and i32 %194, 2147483647
  %196 = bitcast i32 %195 to float
  %197 = call float @llvm.maxnum.f32(float %46, float %196)
  %198 = add nuw nsw i32 %45, 32, !spirv.Decorations !853
  br label %44

199:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit
  %200 = fmul reassoc nsz arcp contract float %187, 0x3F80204080000000
  br label %201

201:                                              ; preds = %199, %_Z17__spirv_GroupFMaxiif.exit
  %202 = phi float [ %200, %199 ], [ 0.000000e+00, %_Z17__spirv_GroupFMaxiif.exit ]
  %203 = icmp eq i16 %localIdX, 0
  %204 = and i1 %203, %39
  br i1 %204, label %205, label %213

205:                                              ; preds = %201
  %206 = sext i32 %29 to i64
  %207 = mul i64 %206, %4
  %208 = sext i32 %32 to i64
  %209 = shl nsw i64 %208, 2, !spirv.Decorations !871
  %210 = getelementptr float, ptr addrspace(1) %3, i64 %207
  %211 = getelementptr float, ptr addrspace(1) %210, i64 %209
  %212 = getelementptr float, ptr addrspace(1) %211, i64 %23
  store float %202, ptr addrspace(1) %212, align 4
  br label %213

213:                                              ; preds = %205, %201
  br i1 %39, label %214, label %242

214:                                              ; preds = %213
  %215 = fcmp reassoc nsz arcp contract oeq float %202, 0.000000e+00, !spirv.Decorations !856
  br i1 %215, label %218, label %216

216:                                              ; preds = %214
  %217 = fdiv reassoc nsz arcp contract float 1.000000e+00, %202, !spirv.Decorations !856
  br label %218

218:                                              ; preds = %216, %214
  %219 = phi float [ %217, %216 ], [ 0.000000e+00, %214 ]
  %220 = sext i32 %29 to i64
  %221 = mul i64 %220, %6
  %222 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %221
  %223 = sext i32 %32 to i64
  %224 = shl nsw i64 %223, 10, !spirv.Decorations !871
  %225 = getelementptr i8, ptr addrspace(1) %222, i64 %224
  %226 = getelementptr i8, ptr addrspace(1) %225, i64 %41
  br label %227

227:                                              ; preds = %230, %218
  %228 = phi i32 [ %19, %218 ], [ %241, %230 ]
  %229 = icmp ult i32 %228, 256
  br i1 %229, label %230, label %.loopexit

230:                                              ; preds = %227
  %231 = zext i32 %228 to i64
  %232 = getelementptr inbounds half, ptr addrspace(1) %43, i64 %231
  %233 = load half, ptr addrspace(1) %232, align 2
  %234 = fpext half %233 to float
  %235 = fmul reassoc nsz arcp contract float %219, %234, !spirv.Decorations !856
  %236 = call float @llvm.genx.GenISA.ROUNDNE(float %235)
  %237 = call float @llvm.maxnum.f32(float %236, float -1.270000e+02)
  %238 = call float @llvm.minnum.f32(float %237, float 1.270000e+02)
  %239 = fptosi float %238 to i8
  %240 = getelementptr inbounds i8, ptr addrspace(1) %226, i64 %231
  store i8 %239, ptr addrspace(1) %240, align 1
  %241 = add nuw nsw i32 %228, 32, !spirv.Decorations !853
  br label %227

.loopexit:                                        ; preds = %227
  br label %242

242:                                              ; preds = %.loopexit, %213
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi2EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, i64 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 1 %6, i64 %7, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %9 = extractelement <3 x i32> %localSize, i32 0
  %10 = extractelement <3 x i32> %localSize, i32 1
  %11 = extractelement <3 x i32> %localSize, i32 2
  %12 = extractelement <8 x i32> %r0, i32 0
  %13 = extractelement <8 x i32> %r0, i32 1
  %14 = extractelement <8 x i32> %r0, i32 2
  %15 = extractelement <8 x i32> %r0, i32 3
  %16 = extractelement <8 x i32> %r0, i32 4
  %17 = extractelement <8 x i32> %r0, i32 5
  %18 = extractelement <8 x i32> %r0, i32 6
  %19 = extractelement <8 x i32> %r0, i32 7
  %20 = zext i16 %localIdX to i32
  %21 = zext i32 %13 to i64
  %22 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %22)
  %23 = lshr i64 %21, 1
  %24 = and i64 %21, 1
  %25 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %23
  %26 = load i64, ptr addrspace(1) %25, align 8
  %27 = icmp sgt i64 %26, -1
  %28 = lshr i64 %26, 6
  %29 = trunc i64 %28 to i32
  %30 = select i1 %27, i32 %29, i32 -1
  %31 = icmp sgt i32 %30, -1
  br i1 %31, label %32, label %36

32:                                               ; preds = %8
  %33 = zext i32 %30 to i64
  %34 = icmp slt i64 %33, %1
  %35 = and i1 %34, %27
  br label %36

36:                                               ; preds = %32, %8
  %37 = phi i1 [ false, %8 ], [ %35, %32 ]
  %38 = shl nuw nsw i64 %23, 9, !spirv.Decorations !853
  %39 = shl nuw nsw i64 %24, 8, !spirv.Decorations !853
  %40 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %2, i64 %38
  %41 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %40, i64 %39
  br label %42

42:                                               ; preds = %341, %36
  %43 = phi i32 [ %20, %36 ], [ %348, %341 ]
  %44 = phi float [ 0xFFF0000000000000, %36 ], [ %347, %341 ]
  %45 = phi float [ 0x7FF0000000000000, %36 ], [ %346, %341 ]
  %46 = icmp ult i32 %43, 256
  br i1 %46, label %341, label %47

47:                                               ; preds = %42
  %48 = call float @llvm.genx.GenISA.WaveAll.f32(float %45, i8 11, i1 true, i32 0)
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %49 = bitcast <8 x i32> %r0 to <32 x i8>
  %50 = extractelement <32 x i8> %49, i32 0
  %51 = extractelement <32 x i8> %49, i32 1
  %52 = extractelement <32 x i8> %49, i32 2
  %53 = extractelement <32 x i8> %49, i32 3
  %54 = extractelement <32 x i8> %49, i32 4
  %55 = extractelement <32 x i8> %49, i32 5
  %56 = extractelement <32 x i8> %49, i32 6
  %57 = extractelement <32 x i8> %49, i32 7
  %58 = extractelement <32 x i8> %49, i32 8
  %59 = extractelement <32 x i8> %49, i32 9
  %60 = extractelement <32 x i8> %49, i32 10
  %61 = extractelement <32 x i8> %49, i32 11
  %62 = extractelement <32 x i8> %49, i32 12
  %63 = extractelement <32 x i8> %49, i32 13
  %64 = extractelement <32 x i8> %49, i32 14
  %65 = extractelement <32 x i8> %49, i32 15
  %66 = extractelement <32 x i8> %49, i32 16
  %67 = extractelement <32 x i8> %49, i32 17
  %68 = extractelement <32 x i8> %49, i32 18
  %69 = extractelement <32 x i8> %49, i32 19
  %70 = extractelement <32 x i8> %49, i32 20
  %71 = extractelement <32 x i8> %49, i32 21
  %72 = extractelement <32 x i8> %49, i32 22
  %73 = extractelement <32 x i8> %49, i32 23
  %74 = extractelement <32 x i8> %49, i32 24
  %75 = extractelement <32 x i8> %49, i32 25
  %76 = extractelement <32 x i8> %49, i32 26
  %77 = extractelement <32 x i8> %49, i32 27
  %78 = extractelement <32 x i8> %49, i32 28
  %79 = extractelement <32 x i8> %49, i32 29
  %80 = extractelement <32 x i8> %49, i32 30
  %81 = extractelement <32 x i8> %49, i32 31
  %localThreadId11 = zext i8 %58 to i32
  %82 = mul i32 %10, %9
  %83 = mul i32 %82, %11
  %84 = add i32 %83, 15
  %85 = lshr i32 %84, 4
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %86 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %86)
  %87 = mul i32 %10, %9
  %88 = mul i32 %87, %11
  %89 = and i32 %88, 15
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %131, label %91

91:                                               ; preds = %47
  %92 = bitcast <8 x i32> %r0 to <32 x i8>
  %93 = extractelement <32 x i8> %92, i32 0
  %94 = extractelement <32 x i8> %92, i32 1
  %95 = extractelement <32 x i8> %92, i32 2
  %96 = extractelement <32 x i8> %92, i32 3
  %97 = extractelement <32 x i8> %92, i32 4
  %98 = extractelement <32 x i8> %92, i32 5
  %99 = extractelement <32 x i8> %92, i32 6
  %100 = extractelement <32 x i8> %92, i32 7
  %101 = extractelement <32 x i8> %92, i32 8
  %102 = extractelement <32 x i8> %92, i32 9
  %103 = extractelement <32 x i8> %92, i32 10
  %104 = extractelement <32 x i8> %92, i32 11
  %105 = extractelement <32 x i8> %92, i32 12
  %106 = extractelement <32 x i8> %92, i32 13
  %107 = extractelement <32 x i8> %92, i32 14
  %108 = extractelement <32 x i8> %92, i32 15
  %109 = extractelement <32 x i8> %92, i32 16
  %110 = extractelement <32 x i8> %92, i32 17
  %111 = extractelement <32 x i8> %92, i32 18
  %112 = extractelement <32 x i8> %92, i32 19
  %113 = extractelement <32 x i8> %92, i32 20
  %114 = extractelement <32 x i8> %92, i32 21
  %115 = extractelement <32 x i8> %92, i32 22
  %116 = extractelement <32 x i8> %92, i32 23
  %117 = extractelement <32 x i8> %92, i32 24
  %118 = extractelement <32 x i8> %92, i32 25
  %119 = extractelement <32 x i8> %92, i32 26
  %120 = extractelement <32 x i8> %92, i32 27
  %121 = extractelement <32 x i8> %92, i32 28
  %122 = extractelement <32 x i8> %92, i32 29
  %123 = extractelement <32 x i8> %92, i32 30
  %124 = extractelement <32 x i8> %92, i32 31
  %localThreadId1920 = zext i8 %101 to i32
  %125 = mul i32 %10, %9
  %126 = mul i32 %125, %11
  %127 = add i32 %126, 15
  %128 = lshr i32 %127, 4
  %129 = add nsw i32 %128, -1
  %130 = icmp ugt i32 %129, %localThreadId1920
  br i1 %130, label %131, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i

131:                                              ; preds = %91, %47
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i:        ; preds = %131, %91
  %132 = phi i32 [ 16, %131 ], [ %89, %91 ]
  %133 = icmp eq i16 %simdLaneId16, 0
  br i1 %133, label %134, label %137

134:                                              ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i
  %135 = zext i8 %58 to i64
  %136 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %135
  store float %48, ptr addrspace(3) %136, align 4, !tbaa !867
  br label %137

137:                                              ; preds = %134, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %138 = shl nuw nsw i32 %localThreadId11, 4
  %139 = add nuw nsw i32 %138, %simdLaneId
  %140 = icmp ugt i32 %84, 271
  br i1 %140, label %141, label %162

141:                                              ; preds = %137
  %142 = zext i32 %139 to i64
  %143 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %142
  %144 = zext i8 %58 to i64
  %145 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %144
  br label %146

146:                                              ; preds = %160, %141
  %147 = phi i32 [ %85, %141 ], [ %149, %160 ]
  %148 = add nuw nsw i32 %147, 15
  %149 = lshr i32 %148, 4
  %150 = and i32 %148, 536870896
  %151 = icmp ult i32 %139, %147
  br i1 %151, label %152, label %154

152:                                              ; preds = %146
  %153 = load float, ptr addrspace(3) %143, align 4, !tbaa !867
  br label %154

154:                                              ; preds = %152, %146
  %155 = phi float [ %153, %152 ], [ 0x7FF0000000000000, %146 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %156 = icmp ult i32 %139, %150
  br i1 %156, label %157, label %160

157:                                              ; preds = %154
  %158 = call float @llvm.genx.GenISA.WaveAll.f32(float %155, i8 11, i1 true, i32 0)
  br i1 %133, label %159, label %160

159:                                              ; preds = %157
  store float %158, ptr addrspace(3) %145, align 4, !tbaa !867
  br label %160

160:                                              ; preds = %159, %157, %154
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %161 = icmp ugt i32 %147, 256
  br i1 %161, label %146, label %162

162:                                              ; preds = %160, %137
  %163 = phi i32 [ %85, %137 ], [ %149, %160 ]
  %164 = icmp ugt i32 %163, %132
  br i1 %164, label %165, label %177

165:                                              ; preds = %162
  %166 = load float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, align 4, !tbaa !867
  %167 = icmp ugt i32 %163, 1
  br i1 %167, label %168, label %_Z17__spirv_GroupFMiniif.exit

168:                                              ; preds = %168, %165
  %169 = phi i32 [ %175, %168 ], [ 1, %165 ]
  %170 = phi float [ %174, %168 ], [ %166, %165 ]
  %171 = zext i32 %169 to i64
  %172 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %171
  %173 = load float, ptr addrspace(3) %172, align 4, !tbaa !867
  %174 = call float @llvm.minnum.f32(float %170, float %173)
  %175 = add nuw nsw i32 %169, 1
  %176 = icmp ult i32 %175, %163
  br i1 %176, label %168, label %_Z17__spirv_GroupFMiniif.exit

177:                                              ; preds = %162
  %178 = icmp ugt i32 %163, %simdLaneId
  br i1 %178, label %179, label %183

179:                                              ; preds = %177
  %180 = zext i16 %simdLaneId16 to i64
  %181 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %180
  %182 = load float, ptr addrspace(3) %181, align 4, !tbaa !867
  br label %183

183:                                              ; preds = %179, %177
  %184 = phi float [ %182, %179 ], [ 0x7FF0000000000000, %177 ]
  %185 = call float @llvm.genx.GenISA.WaveAll.f32(float %184, i8 11, i1 true, i32 0)
  br label %_Z17__spirv_GroupFMiniif.exit

_Z17__spirv_GroupFMiniif.exit:                    ; preds = %165, %168, %183
  %186 = phi float [ %185, %183 ], [ %166, %165 ], [ %174, %168 ]
  %187 = call float @llvm.genx.GenISA.WaveAll.f32(float %44, i8 12, i1 true, i32 0)
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %188 = bitcast <8 x i32> %r0 to <32 x i8>
  %189 = extractelement <32 x i8> %188, i32 0
  %190 = extractelement <32 x i8> %188, i32 1
  %191 = extractelement <32 x i8> %188, i32 2
  %192 = extractelement <32 x i8> %188, i32 3
  %193 = extractelement <32 x i8> %188, i32 4
  %194 = extractelement <32 x i8> %188, i32 5
  %195 = extractelement <32 x i8> %188, i32 6
  %196 = extractelement <32 x i8> %188, i32 7
  %197 = extractelement <32 x i8> %188, i32 8
  %198 = extractelement <32 x i8> %188, i32 9
  %199 = extractelement <32 x i8> %188, i32 10
  %200 = extractelement <32 x i8> %188, i32 11
  %201 = extractelement <32 x i8> %188, i32 12
  %202 = extractelement <32 x i8> %188, i32 13
  %203 = extractelement <32 x i8> %188, i32 14
  %204 = extractelement <32 x i8> %188, i32 15
  %205 = extractelement <32 x i8> %188, i32 16
  %206 = extractelement <32 x i8> %188, i32 17
  %207 = extractelement <32 x i8> %188, i32 18
  %208 = extractelement <32 x i8> %188, i32 19
  %209 = extractelement <32 x i8> %188, i32 20
  %210 = extractelement <32 x i8> %188, i32 21
  %211 = extractelement <32 x i8> %188, i32 22
  %212 = extractelement <32 x i8> %188, i32 23
  %213 = extractelement <32 x i8> %188, i32 24
  %214 = extractelement <32 x i8> %188, i32 25
  %215 = extractelement <32 x i8> %188, i32 26
  %216 = extractelement <32 x i8> %188, i32 27
  %217 = extractelement <32 x i8> %188, i32 28
  %218 = extractelement <32 x i8> %188, i32 29
  %219 = extractelement <32 x i8> %188, i32 30
  %220 = extractelement <32 x i8> %188, i32 31
  %localThreadId2526 = zext i8 %197 to i32
  %221 = mul i32 %10, %9
  %222 = mul i32 %221, %11
  %223 = add i32 %222, 15
  %224 = lshr i32 %223, 4
  %simdLaneId1639 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId40 = zext i16 %simdLaneId1639 to i32
  %225 = icmp ult i16 %simdLaneId1639, 32
  call void @llvm.assume(i1 %225)
  %226 = mul i32 %10, %9
  %227 = mul i32 %226, %11
  %228 = and i32 %227, 15
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %270, label %230

230:                                              ; preds = %_Z17__spirv_GroupFMiniif.exit
  %231 = bitcast <8 x i32> %r0 to <32 x i8>
  %232 = extractelement <32 x i8> %231, i32 0
  %233 = extractelement <32 x i8> %231, i32 1
  %234 = extractelement <32 x i8> %231, i32 2
  %235 = extractelement <32 x i8> %231, i32 3
  %236 = extractelement <32 x i8> %231, i32 4
  %237 = extractelement <32 x i8> %231, i32 5
  %238 = extractelement <32 x i8> %231, i32 6
  %239 = extractelement <32 x i8> %231, i32 7
  %240 = extractelement <32 x i8> %231, i32 8
  %241 = extractelement <32 x i8> %231, i32 9
  %242 = extractelement <32 x i8> %231, i32 10
  %243 = extractelement <32 x i8> %231, i32 11
  %244 = extractelement <32 x i8> %231, i32 12
  %245 = extractelement <32 x i8> %231, i32 13
  %246 = extractelement <32 x i8> %231, i32 14
  %247 = extractelement <32 x i8> %231, i32 15
  %248 = extractelement <32 x i8> %231, i32 16
  %249 = extractelement <32 x i8> %231, i32 17
  %250 = extractelement <32 x i8> %231, i32 18
  %251 = extractelement <32 x i8> %231, i32 19
  %252 = extractelement <32 x i8> %231, i32 20
  %253 = extractelement <32 x i8> %231, i32 21
  %254 = extractelement <32 x i8> %231, i32 22
  %255 = extractelement <32 x i8> %231, i32 23
  %256 = extractelement <32 x i8> %231, i32 24
  %257 = extractelement <32 x i8> %231, i32 25
  %258 = extractelement <32 x i8> %231, i32 26
  %259 = extractelement <32 x i8> %231, i32 27
  %260 = extractelement <32 x i8> %231, i32 28
  %261 = extractelement <32 x i8> %231, i32 29
  %262 = extractelement <32 x i8> %231, i32 30
  %263 = extractelement <32 x i8> %231, i32 31
  %localThreadId3435 = zext i8 %240 to i32
  %264 = mul i32 %10, %9
  %265 = mul i32 %264, %11
  %266 = add i32 %265, 15
  %267 = lshr i32 %266, 4
  %268 = add nsw i32 %267, -1
  %269 = icmp ugt i32 %268, %localThreadId3435
  br i1 %269, label %270, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1

270:                                              ; preds = %230, %_Z17__spirv_GroupFMiniif.exit
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1:       ; preds = %270, %230
  %271 = phi i32 [ 16, %270 ], [ %228, %230 ]
  %272 = icmp eq i16 %simdLaneId1639, 0
  br i1 %272, label %273, label %276

273:                                              ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1
  %274 = zext i8 %197 to i64
  %275 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %274
  store float %187, ptr addrspace(3) %275, align 4, !tbaa !867
  br label %276

276:                                              ; preds = %273, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %277 = shl nuw nsw i32 %localThreadId2526, 4
  %278 = add nuw nsw i32 %277, %simdLaneId40
  %279 = icmp ugt i32 %223, 271
  br i1 %279, label %280, label %301

280:                                              ; preds = %276
  %281 = zext i32 %278 to i64
  %282 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %281
  %283 = zext i8 %197 to i64
  %284 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %283
  br label %285

285:                                              ; preds = %299, %280
  %286 = phi i32 [ %224, %280 ], [ %288, %299 ]
  %287 = add nuw nsw i32 %286, 15
  %288 = lshr i32 %287, 4
  %289 = and i32 %287, 536870896
  %290 = icmp ult i32 %278, %286
  br i1 %290, label %291, label %293

291:                                              ; preds = %285
  %292 = load float, ptr addrspace(3) %282, align 4, !tbaa !867
  br label %293

293:                                              ; preds = %291, %285
  %294 = phi float [ %292, %291 ], [ 0xFFF0000000000000, %285 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %295 = icmp ult i32 %278, %289
  br i1 %295, label %296, label %299

296:                                              ; preds = %293
  %297 = call float @llvm.genx.GenISA.WaveAll.f32(float %294, i8 12, i1 true, i32 0)
  br i1 %272, label %298, label %299

298:                                              ; preds = %296
  store float %297, ptr addrspace(3) %284, align 4, !tbaa !867
  br label %299

299:                                              ; preds = %298, %296, %293
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %300 = icmp ugt i32 %286, 256
  br i1 %300, label %285, label %301

301:                                              ; preds = %299, %276
  %302 = phi i32 [ %224, %276 ], [ %288, %299 ]
  %303 = icmp ugt i32 %302, %271
  br i1 %303, label %304, label %316

304:                                              ; preds = %301
  %305 = load float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, align 4, !tbaa !867
  %306 = icmp ugt i32 %302, 1
  br i1 %306, label %307, label %_Z17__spirv_GroupFMaxiif.exit

307:                                              ; preds = %307, %304
  %308 = phi i32 [ %314, %307 ], [ 1, %304 ]
  %309 = phi float [ %313, %307 ], [ %305, %304 ]
  %310 = zext i32 %308 to i64
  %311 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %310
  %312 = load float, ptr addrspace(3) %311, align 4, !tbaa !867
  %313 = call float @llvm.maxnum.f32(float %309, float %312)
  %314 = add nuw nsw i32 %308, 1
  %315 = icmp ult i32 %314, %302
  br i1 %315, label %307, label %_Z17__spirv_GroupFMaxiif.exit

316:                                              ; preds = %301
  %317 = icmp ugt i32 %302, %simdLaneId40
  br i1 %317, label %318, label %322

318:                                              ; preds = %316
  %319 = zext i16 %simdLaneId1639 to i64
  %320 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %319
  %321 = load float, ptr addrspace(3) %320, align 4, !tbaa !867
  br label %322

322:                                              ; preds = %318, %316
  %323 = phi float [ %321, %318 ], [ 0xFFF0000000000000, %316 ]
  %324 = call float @llvm.genx.GenISA.WaveAll.f32(float %323, i8 12, i1 true, i32 0)
  br label %_Z17__spirv_GroupFMaxiif.exit

_Z17__spirv_GroupFMaxiif.exit:                    ; preds = %304, %307, %322
  %325 = phi float [ %324, %322 ], [ %305, %304 ], [ %313, %307 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %326 = fsub reassoc nsz arcp contract float %325, %186, !spirv.Decorations !856
  %327 = fmul reassoc nsz arcp contract float %326, 0x3FB1111120000000
  %328 = call float @llvm.maxnum.f32(float %327, float 0x3E45798EE0000000)
  %329 = fdiv reassoc nsz arcp contract float %186, %328
  %330 = fsub reassoc nsz arcp contract float 5.000000e-01, %329
  %331 = call float @llvm.floor.f32(float %330)
  %332 = call float @llvm.minnum.f32(float %331, float 1.500000e+01)
  %333 = call float @llvm.maxnum.f32(float %332, float 0.000000e+00)
  %334 = sext i32 %30 to i64
  %335 = shl i64 %26, 1
  %336 = and i64 %335, 126
  %337 = select i1 %27, i64 %336, i64 -2
  %338 = or i64 %337, %24
  %339 = icmp eq i16 %localIdX, 0
  %340 = and i1 %339, %37
  br i1 %340, label %349, label %354

341:                                              ; preds = %42
  %342 = zext i32 %43 to i64
  %343 = getelementptr inbounds half, ptr addrspace(1) %41, i64 %342
  %344 = load half, ptr addrspace(1) %343, align 2
  %345 = fpext half %344 to float
  %346 = call float @llvm.minnum.f32(float %45, float %345)
  %347 = call float @llvm.maxnum.f32(float %44, float %345)
  %348 = add nuw nsw i32 %43, 32, !spirv.Decorations !853
  br label %42

349:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit
  %350 = mul i64 %334, %3
  %351 = add i64 %350, %338
  %352 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %351
  store float %328, ptr addrspace(1) %352, align 4
  %353 = getelementptr inbounds float, ptr addrspace(1) %5, i64 %351
  store float %333, ptr addrspace(1) %353, align 4
  br label %354

354:                                              ; preds = %349, %_Z17__spirv_GroupFMaxiif.exit
  br i1 %37, label %355, label %391

355:                                              ; preds = %354
  %356 = mul i64 %334, %7
  %357 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %356
  %358 = shl nsw i64 %338, 7, !spirv.Decorations !871
  %359 = getelementptr inbounds i8, ptr addrspace(1) %357, i64 %358
  br label %360

360:                                              ; preds = %363, %355
  %361 = phi i32 [ %20, %355 ], [ %390, %363 ]
  %362 = icmp ult i32 %361, 128
  br i1 %362, label %363, label %.loopexit

363:                                              ; preds = %360
  %364 = shl nuw nsw i32 %361, 1, !spirv.Decorations !853
  %365 = zext i32 %364 to i64
  %366 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %41, i64 %365
  %367 = load half, ptr addrspace(1) %366, align 2
  %368 = fpext half %367 to float
  %369 = getelementptr half, ptr addrspace(1) %366, i64 1
  %370 = load half, ptr addrspace(1) %369, align 2
  %371 = fpext half %370 to float
  %372 = fdiv reassoc nsz arcp contract float %368, %328, !spirv.Decorations !856
  %373 = fadd reassoc nsz arcp contract float %372, %333, !spirv.Decorations !856
  %374 = fadd reassoc nsz arcp contract float %373, 5.000000e-01, !spirv.Decorations !856
  %375 = call float @llvm.floor.f32(float %374)
  %376 = fdiv reassoc nsz arcp contract float %371, %328, !spirv.Decorations !856
  %377 = fadd reassoc nsz arcp contract float %376, %333, !spirv.Decorations !856
  %378 = fadd reassoc nsz arcp contract float %377, 5.000000e-01, !spirv.Decorations !856
  %379 = call float @llvm.floor.f32(float %378)
  %380 = call float @llvm.minnum.f32(float %375, float 1.500000e+01)
  %381 = call float @llvm.maxnum.f32(float %380, float 0.000000e+00)
  %382 = call float @llvm.minnum.f32(float %379, float 1.500000e+01)
  %383 = call float @llvm.maxnum.f32(float %382, float 0.000000e+00)
  %384 = fptoui float %381 to i8
  %385 = fptoui float %383 to i8
  %386 = shl i8 %385, 4
  %387 = or i8 %386, %384
  %388 = zext i32 %361 to i64
  %389 = getelementptr inbounds i8, ptr addrspace(1) %359, i64 %388
  store i8 %387, ptr addrspace(1) %389, align 1
  %390 = add nuw nsw i32 %361, 32, !spirv.Decorations !853
  br label %360

.loopexit:                                        ; preds = %360
  br label %391

391:                                              ; preds = %.loopexit, %354
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi4EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, i64 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 1 %6, i64 %7, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %9 = extractelement <3 x i32> %localSize, i32 0
  %10 = extractelement <3 x i32> %localSize, i32 1
  %11 = extractelement <3 x i32> %localSize, i32 2
  %12 = extractelement <8 x i32> %r0, i32 0
  %13 = extractelement <8 x i32> %r0, i32 1
  %14 = extractelement <8 x i32> %r0, i32 2
  %15 = extractelement <8 x i32> %r0, i32 3
  %16 = extractelement <8 x i32> %r0, i32 4
  %17 = extractelement <8 x i32> %r0, i32 5
  %18 = extractelement <8 x i32> %r0, i32 6
  %19 = extractelement <8 x i32> %r0, i32 7
  %20 = zext i16 %localIdX to i32
  %21 = zext i32 %13 to i64
  %22 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %22)
  %23 = lshr i64 %21, 2
  %24 = and i64 %21, 3
  %25 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %23
  %26 = load i64, ptr addrspace(1) %25, align 8
  %27 = icmp sgt i64 %26, -1
  %28 = lshr i64 %26, 6
  %29 = trunc i64 %28 to i32
  %30 = select i1 %27, i32 %29, i32 -1
  %31 = icmp sgt i32 %30, -1
  br i1 %31, label %32, label %36

32:                                               ; preds = %8
  %33 = zext i32 %30 to i64
  %34 = icmp slt i64 %33, %1
  %35 = and i1 %34, %27
  br label %36

36:                                               ; preds = %32, %8
  %37 = phi i1 [ false, %8 ], [ %35, %32 ]
  %38 = shl nuw nsw i64 %23, 10, !spirv.Decorations !853
  %39 = shl nuw nsw i64 %24, 8, !spirv.Decorations !853
  %40 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %2, i64 %38
  %41 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %40, i64 %39
  br label %42

42:                                               ; preds = %341, %36
  %43 = phi i32 [ %20, %36 ], [ %348, %341 ]
  %44 = phi float [ 0xFFF0000000000000, %36 ], [ %347, %341 ]
  %45 = phi float [ 0x7FF0000000000000, %36 ], [ %346, %341 ]
  %46 = icmp ult i32 %43, 256
  br i1 %46, label %341, label %47

47:                                               ; preds = %42
  %48 = call float @llvm.genx.GenISA.WaveAll.f32(float %45, i8 11, i1 true, i32 0)
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %49 = bitcast <8 x i32> %r0 to <32 x i8>
  %50 = extractelement <32 x i8> %49, i32 0
  %51 = extractelement <32 x i8> %49, i32 1
  %52 = extractelement <32 x i8> %49, i32 2
  %53 = extractelement <32 x i8> %49, i32 3
  %54 = extractelement <32 x i8> %49, i32 4
  %55 = extractelement <32 x i8> %49, i32 5
  %56 = extractelement <32 x i8> %49, i32 6
  %57 = extractelement <32 x i8> %49, i32 7
  %58 = extractelement <32 x i8> %49, i32 8
  %59 = extractelement <32 x i8> %49, i32 9
  %60 = extractelement <32 x i8> %49, i32 10
  %61 = extractelement <32 x i8> %49, i32 11
  %62 = extractelement <32 x i8> %49, i32 12
  %63 = extractelement <32 x i8> %49, i32 13
  %64 = extractelement <32 x i8> %49, i32 14
  %65 = extractelement <32 x i8> %49, i32 15
  %66 = extractelement <32 x i8> %49, i32 16
  %67 = extractelement <32 x i8> %49, i32 17
  %68 = extractelement <32 x i8> %49, i32 18
  %69 = extractelement <32 x i8> %49, i32 19
  %70 = extractelement <32 x i8> %49, i32 20
  %71 = extractelement <32 x i8> %49, i32 21
  %72 = extractelement <32 x i8> %49, i32 22
  %73 = extractelement <32 x i8> %49, i32 23
  %74 = extractelement <32 x i8> %49, i32 24
  %75 = extractelement <32 x i8> %49, i32 25
  %76 = extractelement <32 x i8> %49, i32 26
  %77 = extractelement <32 x i8> %49, i32 27
  %78 = extractelement <32 x i8> %49, i32 28
  %79 = extractelement <32 x i8> %49, i32 29
  %80 = extractelement <32 x i8> %49, i32 30
  %81 = extractelement <32 x i8> %49, i32 31
  %localThreadId11 = zext i8 %58 to i32
  %82 = mul i32 %10, %9
  %83 = mul i32 %82, %11
  %84 = add i32 %83, 15
  %85 = lshr i32 %84, 4
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %86 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %86)
  %87 = mul i32 %10, %9
  %88 = mul i32 %87, %11
  %89 = and i32 %88, 15
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %131, label %91

91:                                               ; preds = %47
  %92 = bitcast <8 x i32> %r0 to <32 x i8>
  %93 = extractelement <32 x i8> %92, i32 0
  %94 = extractelement <32 x i8> %92, i32 1
  %95 = extractelement <32 x i8> %92, i32 2
  %96 = extractelement <32 x i8> %92, i32 3
  %97 = extractelement <32 x i8> %92, i32 4
  %98 = extractelement <32 x i8> %92, i32 5
  %99 = extractelement <32 x i8> %92, i32 6
  %100 = extractelement <32 x i8> %92, i32 7
  %101 = extractelement <32 x i8> %92, i32 8
  %102 = extractelement <32 x i8> %92, i32 9
  %103 = extractelement <32 x i8> %92, i32 10
  %104 = extractelement <32 x i8> %92, i32 11
  %105 = extractelement <32 x i8> %92, i32 12
  %106 = extractelement <32 x i8> %92, i32 13
  %107 = extractelement <32 x i8> %92, i32 14
  %108 = extractelement <32 x i8> %92, i32 15
  %109 = extractelement <32 x i8> %92, i32 16
  %110 = extractelement <32 x i8> %92, i32 17
  %111 = extractelement <32 x i8> %92, i32 18
  %112 = extractelement <32 x i8> %92, i32 19
  %113 = extractelement <32 x i8> %92, i32 20
  %114 = extractelement <32 x i8> %92, i32 21
  %115 = extractelement <32 x i8> %92, i32 22
  %116 = extractelement <32 x i8> %92, i32 23
  %117 = extractelement <32 x i8> %92, i32 24
  %118 = extractelement <32 x i8> %92, i32 25
  %119 = extractelement <32 x i8> %92, i32 26
  %120 = extractelement <32 x i8> %92, i32 27
  %121 = extractelement <32 x i8> %92, i32 28
  %122 = extractelement <32 x i8> %92, i32 29
  %123 = extractelement <32 x i8> %92, i32 30
  %124 = extractelement <32 x i8> %92, i32 31
  %localThreadId1920 = zext i8 %101 to i32
  %125 = mul i32 %10, %9
  %126 = mul i32 %125, %11
  %127 = add i32 %126, 15
  %128 = lshr i32 %127, 4
  %129 = add nsw i32 %128, -1
  %130 = icmp ugt i32 %129, %localThreadId1920
  br i1 %130, label %131, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i

131:                                              ; preds = %91, %47
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i:        ; preds = %131, %91
  %132 = phi i32 [ 16, %131 ], [ %89, %91 ]
  %133 = icmp eq i16 %simdLaneId16, 0
  br i1 %133, label %134, label %137

134:                                              ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i
  %135 = zext i8 %58 to i64
  %136 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %135
  store float %48, ptr addrspace(3) %136, align 4, !tbaa !867
  br label %137

137:                                              ; preds = %134, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %138 = shl nuw nsw i32 %localThreadId11, 4
  %139 = add nuw nsw i32 %138, %simdLaneId
  %140 = icmp ugt i32 %84, 271
  br i1 %140, label %141, label %162

141:                                              ; preds = %137
  %142 = zext i32 %139 to i64
  %143 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %142
  %144 = zext i8 %58 to i64
  %145 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %144
  br label %146

146:                                              ; preds = %160, %141
  %147 = phi i32 [ %85, %141 ], [ %149, %160 ]
  %148 = add nuw nsw i32 %147, 15
  %149 = lshr i32 %148, 4
  %150 = and i32 %148, 536870896
  %151 = icmp ult i32 %139, %147
  br i1 %151, label %152, label %154

152:                                              ; preds = %146
  %153 = load float, ptr addrspace(3) %143, align 4, !tbaa !867
  br label %154

154:                                              ; preds = %152, %146
  %155 = phi float [ %153, %152 ], [ 0x7FF0000000000000, %146 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %156 = icmp ult i32 %139, %150
  br i1 %156, label %157, label %160

157:                                              ; preds = %154
  %158 = call float @llvm.genx.GenISA.WaveAll.f32(float %155, i8 11, i1 true, i32 0)
  br i1 %133, label %159, label %160

159:                                              ; preds = %157
  store float %158, ptr addrspace(3) %145, align 4, !tbaa !867
  br label %160

160:                                              ; preds = %159, %157, %154
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %161 = icmp ugt i32 %147, 256
  br i1 %161, label %146, label %162

162:                                              ; preds = %160, %137
  %163 = phi i32 [ %85, %137 ], [ %149, %160 ]
  %164 = icmp ugt i32 %163, %132
  br i1 %164, label %165, label %177

165:                                              ; preds = %162
  %166 = load float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, align 4, !tbaa !867
  %167 = icmp ugt i32 %163, 1
  br i1 %167, label %168, label %_Z17__spirv_GroupFMiniif.exit

168:                                              ; preds = %168, %165
  %169 = phi i32 [ %175, %168 ], [ 1, %165 ]
  %170 = phi float [ %174, %168 ], [ %166, %165 ]
  %171 = zext i32 %169 to i64
  %172 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %171
  %173 = load float, ptr addrspace(3) %172, align 4, !tbaa !867
  %174 = call float @llvm.minnum.f32(float %170, float %173)
  %175 = add nuw nsw i32 %169, 1
  %176 = icmp ult i32 %175, %163
  br i1 %176, label %168, label %_Z17__spirv_GroupFMiniif.exit

177:                                              ; preds = %162
  %178 = icmp ugt i32 %163, %simdLaneId
  br i1 %178, label %179, label %183

179:                                              ; preds = %177
  %180 = zext i16 %simdLaneId16 to i64
  %181 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %180
  %182 = load float, ptr addrspace(3) %181, align 4, !tbaa !867
  br label %183

183:                                              ; preds = %179, %177
  %184 = phi float [ %182, %179 ], [ 0x7FF0000000000000, %177 ]
  %185 = call float @llvm.genx.GenISA.WaveAll.f32(float %184, i8 11, i1 true, i32 0)
  br label %_Z17__spirv_GroupFMiniif.exit

_Z17__spirv_GroupFMiniif.exit:                    ; preds = %165, %168, %183
  %186 = phi float [ %185, %183 ], [ %166, %165 ], [ %174, %168 ]
  %187 = call float @llvm.genx.GenISA.WaveAll.f32(float %44, i8 12, i1 true, i32 0)
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %188 = bitcast <8 x i32> %r0 to <32 x i8>
  %189 = extractelement <32 x i8> %188, i32 0
  %190 = extractelement <32 x i8> %188, i32 1
  %191 = extractelement <32 x i8> %188, i32 2
  %192 = extractelement <32 x i8> %188, i32 3
  %193 = extractelement <32 x i8> %188, i32 4
  %194 = extractelement <32 x i8> %188, i32 5
  %195 = extractelement <32 x i8> %188, i32 6
  %196 = extractelement <32 x i8> %188, i32 7
  %197 = extractelement <32 x i8> %188, i32 8
  %198 = extractelement <32 x i8> %188, i32 9
  %199 = extractelement <32 x i8> %188, i32 10
  %200 = extractelement <32 x i8> %188, i32 11
  %201 = extractelement <32 x i8> %188, i32 12
  %202 = extractelement <32 x i8> %188, i32 13
  %203 = extractelement <32 x i8> %188, i32 14
  %204 = extractelement <32 x i8> %188, i32 15
  %205 = extractelement <32 x i8> %188, i32 16
  %206 = extractelement <32 x i8> %188, i32 17
  %207 = extractelement <32 x i8> %188, i32 18
  %208 = extractelement <32 x i8> %188, i32 19
  %209 = extractelement <32 x i8> %188, i32 20
  %210 = extractelement <32 x i8> %188, i32 21
  %211 = extractelement <32 x i8> %188, i32 22
  %212 = extractelement <32 x i8> %188, i32 23
  %213 = extractelement <32 x i8> %188, i32 24
  %214 = extractelement <32 x i8> %188, i32 25
  %215 = extractelement <32 x i8> %188, i32 26
  %216 = extractelement <32 x i8> %188, i32 27
  %217 = extractelement <32 x i8> %188, i32 28
  %218 = extractelement <32 x i8> %188, i32 29
  %219 = extractelement <32 x i8> %188, i32 30
  %220 = extractelement <32 x i8> %188, i32 31
  %localThreadId2526 = zext i8 %197 to i32
  %221 = mul i32 %10, %9
  %222 = mul i32 %221, %11
  %223 = add i32 %222, 15
  %224 = lshr i32 %223, 4
  %simdLaneId1639 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId40 = zext i16 %simdLaneId1639 to i32
  %225 = icmp ult i16 %simdLaneId1639, 32
  call void @llvm.assume(i1 %225)
  %226 = mul i32 %10, %9
  %227 = mul i32 %226, %11
  %228 = and i32 %227, 15
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %270, label %230

230:                                              ; preds = %_Z17__spirv_GroupFMiniif.exit
  %231 = bitcast <8 x i32> %r0 to <32 x i8>
  %232 = extractelement <32 x i8> %231, i32 0
  %233 = extractelement <32 x i8> %231, i32 1
  %234 = extractelement <32 x i8> %231, i32 2
  %235 = extractelement <32 x i8> %231, i32 3
  %236 = extractelement <32 x i8> %231, i32 4
  %237 = extractelement <32 x i8> %231, i32 5
  %238 = extractelement <32 x i8> %231, i32 6
  %239 = extractelement <32 x i8> %231, i32 7
  %240 = extractelement <32 x i8> %231, i32 8
  %241 = extractelement <32 x i8> %231, i32 9
  %242 = extractelement <32 x i8> %231, i32 10
  %243 = extractelement <32 x i8> %231, i32 11
  %244 = extractelement <32 x i8> %231, i32 12
  %245 = extractelement <32 x i8> %231, i32 13
  %246 = extractelement <32 x i8> %231, i32 14
  %247 = extractelement <32 x i8> %231, i32 15
  %248 = extractelement <32 x i8> %231, i32 16
  %249 = extractelement <32 x i8> %231, i32 17
  %250 = extractelement <32 x i8> %231, i32 18
  %251 = extractelement <32 x i8> %231, i32 19
  %252 = extractelement <32 x i8> %231, i32 20
  %253 = extractelement <32 x i8> %231, i32 21
  %254 = extractelement <32 x i8> %231, i32 22
  %255 = extractelement <32 x i8> %231, i32 23
  %256 = extractelement <32 x i8> %231, i32 24
  %257 = extractelement <32 x i8> %231, i32 25
  %258 = extractelement <32 x i8> %231, i32 26
  %259 = extractelement <32 x i8> %231, i32 27
  %260 = extractelement <32 x i8> %231, i32 28
  %261 = extractelement <32 x i8> %231, i32 29
  %262 = extractelement <32 x i8> %231, i32 30
  %263 = extractelement <32 x i8> %231, i32 31
  %localThreadId3435 = zext i8 %240 to i32
  %264 = mul i32 %10, %9
  %265 = mul i32 %264, %11
  %266 = add i32 %265, 15
  %267 = lshr i32 %266, 4
  %268 = add nsw i32 %267, -1
  %269 = icmp ugt i32 %268, %localThreadId3435
  br i1 %269, label %270, label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1

270:                                              ; preds = %230, %_Z17__spirv_GroupFMiniif.exit
  br label %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1

_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1:       ; preds = %270, %230
  %271 = phi i32 [ 16, %270 ], [ %228, %230 ]
  %272 = icmp eq i16 %simdLaneId1639, 0
  br i1 %272, label %273, label %276

273:                                              ; preds = %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1
  %274 = zext i8 %197 to i64
  %275 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %274
  store float %187, ptr addrspace(3) %275, align 4, !tbaa !867
  br label %276

276:                                              ; preds = %273, %_Z27__spirv_BuiltInSubgroupSizev.exit.i.i1
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %277 = shl nuw nsw i32 %localThreadId2526, 4
  %278 = add nuw nsw i32 %277, %simdLaneId40
  %279 = icmp ugt i32 %223, 271
  br i1 %279, label %280, label %301

280:                                              ; preds = %276
  %281 = zext i32 %278 to i64
  %282 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %281
  %283 = zext i8 %197 to i64
  %284 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %283
  br label %285

285:                                              ; preds = %299, %280
  %286 = phi i32 [ %224, %280 ], [ %288, %299 ]
  %287 = add nuw nsw i32 %286, 15
  %288 = lshr i32 %287, 4
  %289 = and i32 %287, 536870896
  %290 = icmp ult i32 %278, %286
  br i1 %290, label %291, label %293

291:                                              ; preds = %285
  %292 = load float, ptr addrspace(3) %282, align 4, !tbaa !867
  br label %293

293:                                              ; preds = %291, %285
  %294 = phi float [ %292, %291 ], [ 0xFFF0000000000000, %285 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %295 = icmp ult i32 %278, %289
  br i1 %295, label %296, label %299

296:                                              ; preds = %293
  %297 = call float @llvm.genx.GenISA.WaveAll.f32(float %294, i8 12, i1 true, i32 0)
  br i1 %272, label %298, label %299

298:                                              ; preds = %296
  store float %297, ptr addrspace(3) %284, align 4, !tbaa !867
  br label %299

299:                                              ; preds = %298, %296, %293
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 3)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %300 = icmp ugt i32 %286, 256
  br i1 %300, label %285, label %301

301:                                              ; preds = %299, %276
  %302 = phi i32 [ %224, %276 ], [ %288, %299 ]
  %303 = icmp ugt i32 %302, %271
  br i1 %303, label %304, label %316

304:                                              ; preds = %301
  %305 = load float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, align 4, !tbaa !867
  %306 = icmp ugt i32 %302, 1
  br i1 %306, label %307, label %_Z17__spirv_GroupFMaxiif.exit

307:                                              ; preds = %307, %304
  %308 = phi i32 [ %314, %307 ], [ 1, %304 ]
  %309 = phi float [ %313, %307 ], [ %305, %304 ]
  %310 = zext i32 %308 to i64
  %311 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %310
  %312 = load float, ptr addrspace(3) %311, align 4, !tbaa !867
  %313 = call float @llvm.maxnum.f32(float %309, float %312)
  %314 = add nuw nsw i32 %308, 1
  %315 = icmp ult i32 %314, %302
  br i1 %315, label %307, label %_Z17__spirv_GroupFMaxiif.exit

316:                                              ; preds = %301
  %317 = icmp ugt i32 %302, %simdLaneId40
  br i1 %317, label %318, label %322

318:                                              ; preds = %316
  %319 = zext i16 %simdLaneId1639 to i64
  %320 = getelementptr inbounds float, ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr, i64 %319
  %321 = load float, ptr addrspace(3) %320, align 4, !tbaa !867
  br label %322

322:                                              ; preds = %318, %316
  %323 = phi float [ %321, %318 ], [ 0xFFF0000000000000, %316 ]
  %324 = call float @llvm.genx.GenISA.WaveAll.f32(float %323, i8 12, i1 true, i32 0)
  br label %_Z17__spirv_GroupFMaxiif.exit

_Z17__spirv_GroupFMaxiif.exit:                    ; preds = %304, %307, %322
  %325 = phi float [ %324, %322 ], [ %305, %304 ], [ %313, %307 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %326 = fsub reassoc nsz arcp contract float %325, %186, !spirv.Decorations !856
  %327 = fmul reassoc nsz arcp contract float %326, 0x3FB1111120000000
  %328 = call float @llvm.maxnum.f32(float %327, float 0x3E45798EE0000000)
  %329 = fdiv reassoc nsz arcp contract float %186, %328
  %330 = fsub reassoc nsz arcp contract float 5.000000e-01, %329
  %331 = call float @llvm.floor.f32(float %330)
  %332 = call float @llvm.minnum.f32(float %331, float 1.500000e+01)
  %333 = call float @llvm.maxnum.f32(float %332, float 0.000000e+00)
  %334 = sext i32 %30 to i64
  %335 = shl i64 %26, 2
  %336 = and i64 %335, 252
  %337 = select i1 %27, i64 %336, i64 -4
  %338 = or i64 %337, %24
  %339 = icmp eq i16 %localIdX, 0
  %340 = and i1 %339, %37
  br i1 %340, label %349, label %354

341:                                              ; preds = %42
  %342 = zext i32 %43 to i64
  %343 = getelementptr inbounds half, ptr addrspace(1) %41, i64 %342
  %344 = load half, ptr addrspace(1) %343, align 2
  %345 = fpext half %344 to float
  %346 = call float @llvm.minnum.f32(float %45, float %345)
  %347 = call float @llvm.maxnum.f32(float %44, float %345)
  %348 = add nuw nsw i32 %43, 32, !spirv.Decorations !853
  br label %42

349:                                              ; preds = %_Z17__spirv_GroupFMaxiif.exit
  %350 = mul i64 %334, %3
  %351 = add i64 %350, %338
  %352 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %351
  store float %328, ptr addrspace(1) %352, align 4
  %353 = getelementptr inbounds float, ptr addrspace(1) %5, i64 %351
  store float %333, ptr addrspace(1) %353, align 4
  br label %354

354:                                              ; preds = %349, %_Z17__spirv_GroupFMaxiif.exit
  br i1 %37, label %355, label %391

355:                                              ; preds = %354
  %356 = mul i64 %334, %7
  %357 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %356
  %358 = shl nsw i64 %338, 7, !spirv.Decorations !871
  %359 = getelementptr inbounds i8, ptr addrspace(1) %357, i64 %358
  br label %360

360:                                              ; preds = %363, %355
  %361 = phi i32 [ %20, %355 ], [ %390, %363 ]
  %362 = icmp ult i32 %361, 128
  br i1 %362, label %363, label %.loopexit

363:                                              ; preds = %360
  %364 = shl nuw nsw i32 %361, 1, !spirv.Decorations !853
  %365 = zext i32 %364 to i64
  %366 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %41, i64 %365
  %367 = load half, ptr addrspace(1) %366, align 2
  %368 = fpext half %367 to float
  %369 = getelementptr half, ptr addrspace(1) %366, i64 1
  %370 = load half, ptr addrspace(1) %369, align 2
  %371 = fpext half %370 to float
  %372 = fdiv reassoc nsz arcp contract float %368, %328, !spirv.Decorations !856
  %373 = fadd reassoc nsz arcp contract float %372, %333, !spirv.Decorations !856
  %374 = fadd reassoc nsz arcp contract float %373, 5.000000e-01, !spirv.Decorations !856
  %375 = call float @llvm.floor.f32(float %374)
  %376 = fdiv reassoc nsz arcp contract float %371, %328, !spirv.Decorations !856
  %377 = fadd reassoc nsz arcp contract float %376, %333, !spirv.Decorations !856
  %378 = fadd reassoc nsz arcp contract float %377, 5.000000e-01, !spirv.Decorations !856
  %379 = call float @llvm.floor.f32(float %378)
  %380 = call float @llvm.minnum.f32(float %375, float 1.500000e+01)
  %381 = call float @llvm.maxnum.f32(float %380, float 0.000000e+00)
  %382 = call float @llvm.minnum.f32(float %379, float 1.500000e+01)
  %383 = call float @llvm.maxnum.f32(float %382, float 0.000000e+00)
  %384 = fptoui float %381 to i8
  %385 = fptoui float %383 to i8
  %386 = shl i8 %385, 4
  %387 = or i8 %386, %384
  %388 = zext i32 %361 to i64
  %389 = getelementptr inbounds i8, ptr addrspace(1) %359, i64 %388
  store i8 %387, ptr addrspace(1) %389, align 1
  %390 = add nuw nsw i32 %361, 32, !spirv.Decorations !853
  br label %360

.loopexit:                                        ; preds = %360
  br label %391

391:                                              ; preds = %.loopexit, %354
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !873
  %18 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %19 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %20 = bitcast <8 x i32> %r0 to <32 x i8>
  %21 = extractelement <32 x i8> %20, i32 0
  %22 = extractelement <32 x i8> %20, i32 1
  %23 = extractelement <32 x i8> %20, i32 2
  %24 = extractelement <32 x i8> %20, i32 3
  %25 = extractelement <32 x i8> %20, i32 4
  %26 = extractelement <32 x i8> %20, i32 5
  %27 = extractelement <32 x i8> %20, i32 6
  %28 = extractelement <32 x i8> %20, i32 7
  %29 = extractelement <32 x i8> %20, i32 8
  %30 = extractelement <32 x i8> %20, i32 9
  %31 = extractelement <32 x i8> %20, i32 10
  %32 = extractelement <32 x i8> %20, i32 11
  %33 = extractelement <32 x i8> %20, i32 12
  %34 = extractelement <32 x i8> %20, i32 13
  %35 = extractelement <32 x i8> %20, i32 14
  %36 = extractelement <32 x i8> %20, i32 15
  %37 = extractelement <32 x i8> %20, i32 16
  %38 = extractelement <32 x i8> %20, i32 17
  %39 = extractelement <32 x i8> %20, i32 18
  %40 = extractelement <32 x i8> %20, i32 19
  %41 = extractelement <32 x i8> %20, i32 20
  %42 = extractelement <32 x i8> %20, i32 21
  %43 = extractelement <32 x i8> %20, i32 22
  %44 = extractelement <32 x i8> %20, i32 23
  %45 = extractelement <32 x i8> %20, i32 24
  %46 = extractelement <32 x i8> %20, i32 25
  %47 = extractelement <32 x i8> %20, i32 26
  %48 = extractelement <32 x i8> %20, i32 27
  %49 = extractelement <32 x i8> %20, i32 28
  %50 = extractelement <32 x i8> %20, i32 29
  %51 = extractelement <32 x i8> %20, i32 30
  %52 = extractelement <32 x i8> %20, i32 31
  %localThreadId10 = zext i8 %29 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %53 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %53)
  %54 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %54)
  %55 = udiv i32 %9, 12
  %56 = mul nsw i32 %55, -12, !spirv.Decorations !871
  %57 = add nsw i32 %56, %9, !spirv.Decorations !871
  %58 = sdiv i32 %57, 6
  %59 = mul nuw nsw i32 %55, 6, !spirv.Decorations !853
  %60 = mul nsw i32 %58, -6, !spirv.Decorations !871
  %61 = add nsw i32 %60, %57, !spirv.Decorations !871
  %62 = add nsw i32 %59, %61, !spirv.Decorations !871
  %63 = mul nsw i32 %58, %0, !spirv.Decorations !871
  %64 = load i32, ptr addrspace(1) %1, align 4
  %65 = sext i32 %64 to i64
  %66 = sext i32 %0 to i64
  %67 = add nsw i64 %65, 63, !spirv.Decorations !871
  %68 = sdiv i64 %67, 64
  %69 = call i64 @llvm.smin.i64(i64 %66, i64 %68)
  %70 = call i64 @llvm.smax.i64(i64 %69, i64 1)
  %71 = trunc i64 %70 to i32
  %72 = add nsw i32 %71, 7, !spirv.Decorations !871
  %73 = sdiv i32 %72, 8
  %74 = mul nsw i32 %73, %localThreadId10, !spirv.Decorations !871
  %75 = add nsw i32 %74, %73, !spirv.Decorations !871
  %76 = call i32 @llvm.smin.i32(i32 %75, i32 %71)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %77

77:                                               ; preds = %82, %7
  %78 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %79 = icmp ult i32 %78, 4
  br i1 %79, label %82, label %80

80:                                               ; preds = %77
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %17)
  %81 = icmp slt i32 %74, %76
  br i1 %81, label %86, label %120

82:                                               ; preds = %77
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %78, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar, i64 16, i1 false)
  br label %77, !llvm.loop !875

86:                                               ; preds = %80
  %87 = add nsw i32 %63, %74, !spirv.Decorations !871
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 6, !spirv.Decorations !871
  %90 = sext i32 %62 to i64
  %91 = add nsw i64 %89, %90, !spirv.Decorations !871
  %92 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %91
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %97 = shl nsw i64 %91, 8, !spirv.Decorations !871
  %98 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %97
  br label %99

99:                                               ; preds = %118, %86
  %100 = phi i32 [ 0, %86 ], [ %119, %118 ]
  %101 = icmp ult i32 %100, 4
  br i1 %101, label %102, label %.loopexit2

102:                                              ; preds = %99
  %103 = shl nuw nsw i32 %100, 6, !spirv.Decorations !853
  %104 = add nuw nsw i32 %103, %96, !spirv.Decorations !853
  %105 = zext i32 %100 to i64
  %106 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %105
  %107 = zext i32 %104 to i64
  %108 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %98, i64 %107
  br label %109

109:                                              ; preds = %112, %102
  %110 = phi i32 [ 0, %102 ], [ %117, %112 ]
  %111 = icmp ult i32 %110, 4
  br i1 %111, label %112, label %118

112:                                              ; preds = %109
  %113 = zext i32 %110 to i64
  %114 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %108, i64 %113
  %115 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %106, i64 0, i32 0, i64 %113
  %116 = load half, ptr addrspace(1) %114, align 2
  store half %116, ptr %115, align 2
  %117 = add nuw nsw i32 %110, 1, !spirv.Decorations !853
  br label %109

118:                                              ; preds = %109
  %119 = add nuw nsw i32 %100, 1, !spirv.Decorations !853
  br label %99, !llvm.loop !876

.loopexit2:                                       ; preds = %99
  br label %120

120:                                              ; preds = %.loopexit2, %80
  %121 = phi float [ 0.000000e+00, %80 ], [ %95, %.loopexit2 ]
  %122 = phi float [ 0xFFF0000000000000, %80 ], [ %93, %.loopexit2 ]
  %123 = add i32 %63, 1
  %124 = sext i32 %62 to i64
  %125 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %126

126:                                              ; preds = %238, %120
  %127 = phi i32 [ %74, %120 ], [ %140, %238 ]
  %128 = phi float [ %121, %120 ], [ %193, %238 ]
  %129 = phi float [ %122, %120 ], [ %194, %238 ]
  %130 = phi float [ 0.000000e+00, %120 ], [ %234, %238 ]
  %131 = phi float [ 0xFFF0000000000000, %120 ], [ %195, %238 ]
  %132 = icmp slt i32 %127, %76
  br i1 %132, label %135, label %133

133:                                              ; preds = %126
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %17)
  %134 = icmp eq i16 %simdLaneId16, 0
  br i1 %134, label %270, label %274

135:                                              ; preds = %126
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %18)
  br label %136

136:                                              ; preds = %142, %135
  %137 = phi i32 [ 0, %135 ], [ %159, %142 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %142, label %139

139:                                              ; preds = %136
  %140 = add nsw i32 %127, 1, !spirv.Decorations !871
  %141 = icmp slt i32 %140, %76
  br i1 %141, label %160, label %192

142:                                              ; preds = %136
  %143 = zext i32 %137 to i64
  %144 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %143
  %145 = load <4 x half>, ptr %144, align 8, !noalias !877
  %146 = extractelement <4 x half> %145, i32 0
  %147 = extractelement <4 x half> %145, i32 1
  %148 = extractelement <4 x half> %145, i32 2
  %149 = extractelement <4 x half> %145, i32 3
  %150 = fpext half %146 to float
  %151 = fpext half %147 to float
  %152 = fpext half %148 to float
  %153 = fpext half %149 to float
  %154 = insertelement <4 x float> undef, float %150, i32 0
  %155 = insertelement <4 x float> %154, float %151, i32 1
  %156 = insertelement <4 x float> %155, float %152, i32 2
  %157 = insertelement <4 x float> %156, float %153, i32 3
  %158 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %143
  store <4 x float> %157, ptr %158, align 16
  %159 = add nuw nsw i32 %137, 1, !spirv.Decorations !853
  br label %136, !llvm.loop !880

160:                                              ; preds = %139
  %161 = add i32 %127, %123
  %162 = sext i32 %161 to i64
  %163 = shl nsw i64 %162, 6, !spirv.Decorations !871
  %164 = add nsw i64 %163, %124, !spirv.Decorations !871
  %165 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %164
  %166 = load float, ptr addrspace(1) %165, align 4
  %167 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %164
  %168 = load float, ptr addrspace(1) %167, align 4
  %169 = shl nsw i64 %164, 8, !spirv.Decorations !871
  %170 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %169
  br label %171

171:                                              ; preds = %190, %160
  %172 = phi i32 [ 0, %160 ], [ %191, %190 ]
  %173 = icmp ult i32 %172, 4
  br i1 %173, label %174, label %.loopexit1

174:                                              ; preds = %171
  %175 = shl nuw nsw i32 %172, 6, !spirv.Decorations !853
  %176 = add nuw nsw i32 %175, %125, !spirv.Decorations !853
  %177 = zext i32 %172 to i64
  %178 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %177
  %179 = zext i32 %176 to i64
  %180 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %170, i64 %179
  br label %181

181:                                              ; preds = %184, %174
  %182 = phi i32 [ 0, %174 ], [ %189, %184 ]
  %183 = icmp ult i32 %182, 4
  br i1 %183, label %184, label %190

184:                                              ; preds = %181
  %185 = zext i32 %182 to i64
  %186 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %180, i64 %185
  %187 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %178, i64 0, i32 0, i64 %185
  %188 = load half, ptr addrspace(1) %186, align 2
  store half %188, ptr %187, align 2
  %189 = add nuw nsw i32 %182, 1, !spirv.Decorations !853
  br label %181

190:                                              ; preds = %181
  %191 = add nuw nsw i32 %172, 1, !spirv.Decorations !853
  br label %171, !llvm.loop !881

.loopexit1:                                       ; preds = %171
  br label %192

192:                                              ; preds = %.loopexit1, %139
  %193 = phi float [ %128, %139 ], [ %168, %.loopexit1 ]
  %194 = phi float [ %129, %139 ], [ %166, %.loopexit1 ]
  %195 = call float @llvm.maxnum.f32(float %131, float %129)
  %196 = fcmp reassoc nsz arcp contract oeq float %131, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %196, label %211, label %197

197:                                              ; preds = %192
  %198 = fsub reassoc nsz arcp contract float %131, %195, !spirv.Decorations !856
  %199 = fmul float %198, 0x3FF7154760000000
  %200 = call float @llvm.trunc.f32(float %199)
  %201 = call float @llvm.fma.f32(float %200, float 0xBFE62E4000000000, float %198)
  %202 = call float @llvm.fma.f32(float %200, float 0xBEB7F7D1C0000000, float %201)
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = call float @llvm.exp2.f32(float %200)
  %205 = call float @llvm.exp2.f32(float %203)
  %206 = fmul float %204, %205
  %207 = fcmp olt float %198, -1.050000e+02
  %208 = select i1 %207, float 0.000000e+00, float %206
  %209 = fcmp ogt float %198, 1.050000e+02
  %210 = select i1 %209, float 0x7FF0000000000000, float %208
  br label %211

211:                                              ; preds = %197, %192
  %212 = phi float [ %210, %197 ], [ 0.000000e+00, %192 ]
  %213 = fcmp reassoc nsz arcp contract oeq float %129, 0xFFF0000000000000, !spirv.Decorations !856
  %214 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !856
  %215 = or i1 %213, %214
  br i1 %215, label %230, label %216

216:                                              ; preds = %211
  %217 = fsub reassoc nsz arcp contract float %129, %195, !spirv.Decorations !856
  %218 = fmul float %217, 0x3FF7154760000000
  %219 = call float @llvm.trunc.f32(float %218)
  %220 = call float @llvm.fma.f32(float %219, float 0xBFE62E4000000000, float %217)
  %221 = call float @llvm.fma.f32(float %219, float 0xBEB7F7D1C0000000, float %220)
  %222 = fmul float %221, 0x3FF7154760000000
  %223 = call float @llvm.exp2.f32(float %219)
  %224 = call float @llvm.exp2.f32(float %222)
  %225 = fmul float %223, %224
  %226 = fcmp olt float %217, -1.050000e+02
  %227 = select i1 %226, float 0.000000e+00, float %225
  %228 = fcmp ogt float %217, 1.050000e+02
  %229 = select i1 %228, float 0x7FF0000000000000, float %227
  br label %230

230:                                              ; preds = %216, %211
  %231 = phi float [ %229, %216 ], [ 0.000000e+00, %211 ]
  %232 = fmul reassoc nsz arcp contract float %231, %128, !spirv.Decorations !856
  %233 = fmul reassoc nsz arcp contract float %130, %212, !spirv.Decorations !856
  %234 = fadd reassoc nsz arcp contract float %233, %232, !spirv.Decorations !856
  br label %235

235:                                              ; preds = %239, %230
  %236 = phi i32 [ 0, %230 ], [ %269, %239 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %239, label %238

238:                                              ; preds = %235
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %18)
  br label %126

239:                                              ; preds = %235
  %240 = zext i32 %236 to i64
  %241 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %240
  %242 = load <4 x float>, ptr %241, align 16, !noalias !882
  %243 = extractelement <4 x float> %242, i32 0
  %244 = extractelement <4 x float> %242, i32 1
  %245 = extractelement <4 x float> %242, i32 2
  %246 = extractelement <4 x float> %242, i32 3
  %247 = fmul reassoc nsz arcp contract float %243, %212, !spirv.Decorations !856
  %248 = fmul reassoc nsz arcp contract float %244, %212, !spirv.Decorations !856
  %249 = fmul reassoc nsz arcp contract float %245, %212, !spirv.Decorations !856
  %250 = fmul reassoc nsz arcp contract float %246, %212, !spirv.Decorations !856
  %251 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %240
  %252 = load <4 x float>, ptr %251, align 16, !noalias !891
  %253 = extractelement <4 x float> %252, i32 0
  %254 = extractelement <4 x float> %252, i32 1
  %255 = extractelement <4 x float> %252, i32 2
  %256 = extractelement <4 x float> %252, i32 3
  %257 = fmul reassoc nsz arcp contract float %232, %253, !spirv.Decorations !856
  %258 = fmul reassoc nsz arcp contract float %232, %254, !spirv.Decorations !856
  %259 = fmul reassoc nsz arcp contract float %232, %255, !spirv.Decorations !856
  %260 = fmul reassoc nsz arcp contract float %232, %256, !spirv.Decorations !856
  %261 = fadd reassoc nsz arcp contract float %247, %257, !spirv.Decorations !856
  %262 = fadd reassoc nsz arcp contract float %248, %258, !spirv.Decorations !856
  %263 = fadd reassoc nsz arcp contract float %249, %259, !spirv.Decorations !856
  %264 = fadd reassoc nsz arcp contract float %250, %260, !spirv.Decorations !856
  %265 = insertelement <4 x float> undef, float %261, i32 0
  %266 = insertelement <4 x float> %265, float %262, i32 1
  %267 = insertelement <4 x float> %266, float %263, i32 2
  %268 = insertelement <4 x float> %267, float %264, i32 3
  store <4 x float> %268, ptr %241, align 16
  %269 = add nuw nsw i32 %236, 1, !spirv.Decorations !853
  br label %235, !llvm.loop !900

270:                                              ; preds = %133
  %271 = zext i8 %29 to i64
  %272 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE-ExtSLM, i64 %271
  store float %131, ptr addrspace(3) %272, align 4
  %273 = getelementptr float, ptr addrspace(3) %272, i64 8
  store float %130, ptr addrspace(3) %273, align 4
  br label %274

274:                                              ; preds = %270, %133
  %275 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %276 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %277 = or i32 %276, 16
  %278 = add nuw nsw i32 %275, %277, !spirv.Decorations !853
  br label %279

279:                                              ; preds = %292, %274
  %280 = phi i32 [ 0, %274 ], [ %293, %292 ]
  %281 = icmp ult i32 %280, 4
  br i1 %281, label %284, label %282

282:                                              ; preds = %279
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %283 = icmp eq i8 %29, 0
  br i1 %283, label %.preheader, label %448

.preheader:                                       ; preds = %282
  br label %302

284:                                              ; preds = %279
  %285 = shl nuw nsw i32 %280, 6, !spirv.Decorations !853
  %286 = zext i32 %280 to i64
  %287 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %286
  %288 = add nuw nsw i32 %285, %278, !spirv.Decorations !853
  br label %289

289:                                              ; preds = %294, %284
  %290 = phi i32 [ 0, %284 ], [ %301, %294 ]
  %291 = icmp ult i32 %290, 4
  br i1 %291, label %294, label %292

292:                                              ; preds = %289
  %293 = add nuw nsw i32 %280, 1, !spirv.Decorations !853
  br label %279, !llvm.loop !901

294:                                              ; preds = %289
  %295 = zext i32 %290 to i64
  %296 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %287, i64 0, i32 0, i64 %295
  %297 = load float, ptr %296, align 4
  %298 = or i32 %288, %290
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE-ExtSLM, i64 %299
  store float %297, ptr addrspace(3) %300, align 4
  %301 = add nuw nsw i32 %290, 1, !spirv.Decorations !853
  br label %289, !llvm.loop !902

302:                                              ; preds = %307, %.preheader
  %303 = phi i32 [ %310, %307 ], [ 0, %.preheader ]
  %304 = icmp ult i32 %303, 4
  br i1 %304, label %307, label %305

305:                                              ; preds = %302
  %306 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %311

307:                                              ; preds = %302
  %308 = zext i32 %303 to i64
  %309 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %308
  %310 = add nuw nsw i32 %303, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %309, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.190, i64 16, i1 false)
  br label %302, !llvm.loop !903

311:                                              ; preds = %379, %305
  %312 = phi i32 [ %380, %379 ], [ 0, %305 ]
  %313 = phi float [ %372, %379 ], [ 0.000000e+00, %305 ]
  %314 = phi float [ %333, %379 ], [ 0xFFF0000000000000, %305 ]
  %315 = icmp ult i32 %312, 8
  br i1 %315, label %325, label %316

316:                                              ; preds = %311
  %317 = call float @llvm.maxnum.f32(float %313, float 0x3BC79CA100000000)
  %318 = mul nuw i32 %55, 12, !spirv.Decorations !904
  %319 = zext i32 %318 to i64
  %320 = sext i32 %57 to i64
  %321 = add nsw i64 %319, %320, !spirv.Decorations !871
  %322 = shl nsw i64 %321, 8, !spirv.Decorations !871
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %322
  %324 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %425

325:                                              ; preds = %311
  %326 = zext i32 %312 to i64
  %327 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE-ExtSLM, i64 %326
  %328 = load float, ptr addrspace(3) %327, align 4
  %329 = zext i32 %312 to i64
  %330 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE-ExtSLM, i64 0, i64 32
  %331 = getelementptr inbounds float, ptr addrspace(3) %330, i64 %329
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = call float @llvm.maxnum.f32(float %314, float %328)
  %334 = fcmp reassoc nsz arcp contract oeq float %314, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %334, label %349, label %335

335:                                              ; preds = %325
  %336 = fsub reassoc nsz arcp contract float %314, %333, !spirv.Decorations !856
  %337 = fmul float %336, 0x3FF7154760000000
  %338 = call float @llvm.trunc.f32(float %337)
  %339 = call float @llvm.fma.f32(float %338, float 0xBFE62E4000000000, float %336)
  %340 = call float @llvm.fma.f32(float %338, float 0xBEB7F7D1C0000000, float %339)
  %341 = fmul float %340, 0x3FF7154760000000
  %342 = call float @llvm.exp2.f32(float %338)
  %343 = call float @llvm.exp2.f32(float %341)
  %344 = fmul float %342, %343
  %345 = fcmp olt float %336, -1.050000e+02
  %346 = select i1 %345, float 0.000000e+00, float %344
  %347 = fcmp ogt float %336, 1.050000e+02
  %348 = select i1 %347, float 0x7FF0000000000000, float %346
  br label %349

349:                                              ; preds = %335, %325
  %350 = phi float [ %348, %335 ], [ 0.000000e+00, %325 ]
  %351 = fcmp reassoc nsz arcp contract oeq float %328, 0xFFF0000000000000, !spirv.Decorations !856
  %352 = fcmp reassoc nsz arcp contract oeq float %333, 0xFFF0000000000000, !spirv.Decorations !856
  %353 = or i1 %351, %352
  br i1 %353, label %368, label %354

354:                                              ; preds = %349
  %355 = fsub reassoc nsz arcp contract float %328, %333, !spirv.Decorations !856
  %356 = fmul float %355, 0x3FF7154760000000
  %357 = call float @llvm.trunc.f32(float %356)
  %358 = call float @llvm.fma.f32(float %357, float 0xBFE62E4000000000, float %355)
  %359 = call float @llvm.fma.f32(float %357, float 0xBEB7F7D1C0000000, float %358)
  %360 = fmul float %359, 0x3FF7154760000000
  %361 = call float @llvm.exp2.f32(float %357)
  %362 = call float @llvm.exp2.f32(float %360)
  %363 = fmul float %361, %362
  %364 = fcmp olt float %355, -1.050000e+02
  %365 = select i1 %364, float 0.000000e+00, float %363
  %366 = fcmp ogt float %355, 1.050000e+02
  %367 = select i1 %366, float 0x7FF0000000000000, float %365
  br label %368

368:                                              ; preds = %354, %349
  %369 = phi float [ %367, %354 ], [ 0.000000e+00, %349 ]
  %370 = fmul reassoc nsz arcp contract float %313, %350, !spirv.Decorations !856
  %371 = fmul reassoc nsz arcp contract float %369, %332, !spirv.Decorations !856
  %372 = fadd reassoc nsz arcp contract float %370, %371, !spirv.Decorations !856
  %373 = shl nuw nsw i32 %312, 8, !spirv.Decorations !853
  %374 = or i32 %373, 16
  %375 = add nuw nsw i32 %306, %374, !spirv.Decorations !853
  br label %376

376:                                              ; preds = %387, %368
  %377 = phi i32 [ 0, %368 ], [ %416, %387 ]
  %378 = icmp ult i32 %377, 4
  br i1 %378, label %381, label %379

379:                                              ; preds = %376
  %380 = add nuw nsw i32 %312, 1, !spirv.Decorations !853
  br label %311

381:                                              ; preds = %376
  %382 = shl nuw nsw i32 %377, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %19)
  %383 = add nuw nsw i32 %382, %375, !spirv.Decorations !853
  br label %384

384:                                              ; preds = %417, %381
  %385 = phi i32 [ 0, %381 ], [ %424, %417 ]
  %386 = icmp ult i32 %385, 4
  br i1 %386, label %417, label %387

387:                                              ; preds = %384
  %388 = zext i32 %377 to i64
  %389 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %388
  %390 = load <4 x float>, ptr %389, align 16, !noalias !905
  %391 = extractelement <4 x float> %390, i32 0
  %392 = extractelement <4 x float> %390, i32 1
  %393 = extractelement <4 x float> %390, i32 2
  %394 = extractelement <4 x float> %390, i32 3
  %395 = fmul reassoc nsz arcp contract float %391, %350, !spirv.Decorations !856
  %396 = fmul reassoc nsz arcp contract float %392, %350, !spirv.Decorations !856
  %397 = fmul reassoc nsz arcp contract float %393, %350, !spirv.Decorations !856
  %398 = fmul reassoc nsz arcp contract float %394, %350, !spirv.Decorations !856
  %399 = load <4 x float>, ptr %19, align 16, !noalias !914
  %400 = extractelement <4 x float> %399, i32 0
  %401 = extractelement <4 x float> %399, i32 1
  %402 = extractelement <4 x float> %399, i32 2
  %403 = extractelement <4 x float> %399, i32 3
  %404 = fmul reassoc nsz arcp contract float %369, %400, !spirv.Decorations !856
  %405 = fmul reassoc nsz arcp contract float %369, %401, !spirv.Decorations !856
  %406 = fmul reassoc nsz arcp contract float %369, %402, !spirv.Decorations !856
  %407 = fmul reassoc nsz arcp contract float %369, %403, !spirv.Decorations !856
  %408 = fadd reassoc nsz arcp contract float %395, %404, !spirv.Decorations !856
  %409 = fadd reassoc nsz arcp contract float %396, %405, !spirv.Decorations !856
  %410 = fadd reassoc nsz arcp contract float %397, %406, !spirv.Decorations !856
  %411 = fadd reassoc nsz arcp contract float %398, %407, !spirv.Decorations !856
  %412 = insertelement <4 x float> undef, float %408, i32 0
  %413 = insertelement <4 x float> %412, float %409, i32 1
  %414 = insertelement <4 x float> %413, float %410, i32 2
  %415 = insertelement <4 x float> %414, float %411, i32 3
  store <4 x float> %415, ptr %389, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %19)
  %416 = add nuw nsw i32 %377, 1, !spirv.Decorations !853
  br label %376, !llvm.loop !923

417:                                              ; preds = %384
  %418 = or i32 %383, %385
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE-ExtSLM, i64 %419
  %421 = load float, ptr addrspace(3) %420, align 4
  %422 = zext i32 %385 to i64
  %423 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %19, i64 0, i32 0, i64 %422
  store float %421, ptr %423, align 4
  %424 = add nuw nsw i32 %385, 1, !spirv.Decorations !853
  br label %384, !llvm.loop !924

425:                                              ; preds = %436, %316
  %426 = phi i32 [ 0, %316 ], [ %437, %436 ]
  %427 = icmp ult i32 %426, 4
  br i1 %427, label %428, label %.loopexit

428:                                              ; preds = %425
  %429 = shl nuw nsw i32 %426, 6, !spirv.Decorations !853
  %430 = add nuw nsw i32 %429, %324, !spirv.Decorations !853
  %431 = zext i32 %426 to i64
  %432 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %431
  br label %433

433:                                              ; preds = %438, %428
  %434 = phi i32 [ 0, %428 ], [ %447, %438 ]
  %435 = icmp ult i32 %434, 4
  br i1 %435, label %438, label %436

436:                                              ; preds = %433
  %437 = add nuw nsw i32 %426, 1, !spirv.Decorations !853
  br label %425, !llvm.loop !925

438:                                              ; preds = %433
  %439 = zext i32 %434 to i64
  %440 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %432, i64 0, i32 0, i64 %439
  %441 = load float, ptr %440, align 4
  %442 = fdiv reassoc nsz arcp contract float %441, %317
  %443 = fptrunc float %442 to half
  %444 = or i32 %430, %434
  %445 = zext i32 %444 to i64
  %446 = getelementptr inbounds half, ptr addrspace(1) %323, i64 %445
  store half %443, ptr addrspace(1) %446, align 2
  %447 = add nuw nsw i32 %434, 1, !spirv.Decorations !853
  br label %433, !llvm.loop !926

.loopexit:                                        ; preds = %425
  br label %448

448:                                              ; preds = %.loopexit, %282
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p2.i64(ptr noalias nocapture writeonly, ptr addrspace(2) noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !873
  %18 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %19 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %20 = bitcast <8 x i32> %r0 to <32 x i8>
  %21 = extractelement <32 x i8> %20, i32 0
  %22 = extractelement <32 x i8> %20, i32 1
  %23 = extractelement <32 x i8> %20, i32 2
  %24 = extractelement <32 x i8> %20, i32 3
  %25 = extractelement <32 x i8> %20, i32 4
  %26 = extractelement <32 x i8> %20, i32 5
  %27 = extractelement <32 x i8> %20, i32 6
  %28 = extractelement <32 x i8> %20, i32 7
  %29 = extractelement <32 x i8> %20, i32 8
  %30 = extractelement <32 x i8> %20, i32 9
  %31 = extractelement <32 x i8> %20, i32 10
  %32 = extractelement <32 x i8> %20, i32 11
  %33 = extractelement <32 x i8> %20, i32 12
  %34 = extractelement <32 x i8> %20, i32 13
  %35 = extractelement <32 x i8> %20, i32 14
  %36 = extractelement <32 x i8> %20, i32 15
  %37 = extractelement <32 x i8> %20, i32 16
  %38 = extractelement <32 x i8> %20, i32 17
  %39 = extractelement <32 x i8> %20, i32 18
  %40 = extractelement <32 x i8> %20, i32 19
  %41 = extractelement <32 x i8> %20, i32 20
  %42 = extractelement <32 x i8> %20, i32 21
  %43 = extractelement <32 x i8> %20, i32 22
  %44 = extractelement <32 x i8> %20, i32 23
  %45 = extractelement <32 x i8> %20, i32 24
  %46 = extractelement <32 x i8> %20, i32 25
  %47 = extractelement <32 x i8> %20, i32 26
  %48 = extractelement <32 x i8> %20, i32 27
  %49 = extractelement <32 x i8> %20, i32 28
  %50 = extractelement <32 x i8> %20, i32 29
  %51 = extractelement <32 x i8> %20, i32 30
  %52 = extractelement <32 x i8> %20, i32 31
  %localThreadId10 = zext i8 %29 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %53 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %53)
  %54 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %54)
  %55 = udiv i32 %9, 12
  %56 = mul nsw i32 %55, -12, !spirv.Decorations !871
  %57 = add nsw i32 %56, %9, !spirv.Decorations !871
  %58 = sdiv i32 %57, 6
  %59 = mul nuw nsw i32 %55, 6, !spirv.Decorations !853
  %60 = mul nsw i32 %58, -6, !spirv.Decorations !871
  %61 = add nsw i32 %60, %57, !spirv.Decorations !871
  %62 = add nsw i32 %59, %61, !spirv.Decorations !871
  %63 = mul nsw i32 %58, %0, !spirv.Decorations !871
  %64 = load i32, ptr addrspace(1) %1, align 4
  %65 = sext i32 %64 to i64
  %66 = sext i32 %0 to i64
  %67 = add nsw i64 %65, 63, !spirv.Decorations !871
  %68 = sdiv i64 %67, 64
  %69 = call i64 @llvm.smin.i64(i64 %66, i64 %68)
  %70 = call i64 @llvm.smax.i64(i64 %69, i64 1)
  %71 = trunc i64 %70 to i32
  %72 = add nsw i32 %71, 15, !spirv.Decorations !871
  %73 = sdiv i32 %72, 16
  %74 = mul nsw i32 %73, %localThreadId10, !spirv.Decorations !871
  %75 = add nsw i32 %74, %73, !spirv.Decorations !871
  %76 = call i32 @llvm.smin.i32(i32 %75, i32 %71)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %77

77:                                               ; preds = %82, %7
  %78 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %79 = icmp ult i32 %78, 4
  br i1 %79, label %82, label %80

80:                                               ; preds = %77
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %17)
  %81 = icmp slt i32 %74, %76
  br i1 %81, label %86, label %120

82:                                               ; preds = %77
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %78, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.191, i64 16, i1 false)
  br label %77, !llvm.loop !927

86:                                               ; preds = %80
  %87 = add nsw i32 %63, %74, !spirv.Decorations !871
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 6, !spirv.Decorations !871
  %90 = sext i32 %62 to i64
  %91 = add nsw i64 %89, %90, !spirv.Decorations !871
  %92 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %91
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %97 = shl nsw i64 %91, 8, !spirv.Decorations !871
  %98 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %97
  br label %99

99:                                               ; preds = %118, %86
  %100 = phi i32 [ 0, %86 ], [ %119, %118 ]
  %101 = icmp ult i32 %100, 4
  br i1 %101, label %102, label %.loopexit2

102:                                              ; preds = %99
  %103 = shl nuw nsw i32 %100, 6, !spirv.Decorations !853
  %104 = add nuw nsw i32 %103, %96, !spirv.Decorations !853
  %105 = zext i32 %100 to i64
  %106 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %105
  %107 = zext i32 %104 to i64
  %108 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %98, i64 %107
  br label %109

109:                                              ; preds = %112, %102
  %110 = phi i32 [ 0, %102 ], [ %117, %112 ]
  %111 = icmp ult i32 %110, 4
  br i1 %111, label %112, label %118

112:                                              ; preds = %109
  %113 = zext i32 %110 to i64
  %114 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %108, i64 %113
  %115 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %106, i64 0, i32 0, i64 %113
  %116 = load half, ptr addrspace(1) %114, align 2
  store half %116, ptr %115, align 2
  %117 = add nuw nsw i32 %110, 1, !spirv.Decorations !853
  br label %109

118:                                              ; preds = %109
  %119 = add nuw nsw i32 %100, 1, !spirv.Decorations !853
  br label %99, !llvm.loop !928

.loopexit2:                                       ; preds = %99
  br label %120

120:                                              ; preds = %.loopexit2, %80
  %121 = phi float [ 0.000000e+00, %80 ], [ %95, %.loopexit2 ]
  %122 = phi float [ 0xFFF0000000000000, %80 ], [ %93, %.loopexit2 ]
  %123 = add i32 %63, 1
  %124 = sext i32 %62 to i64
  %125 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %126

126:                                              ; preds = %238, %120
  %127 = phi i32 [ %74, %120 ], [ %140, %238 ]
  %128 = phi float [ %121, %120 ], [ %193, %238 ]
  %129 = phi float [ %122, %120 ], [ %194, %238 ]
  %130 = phi float [ 0.000000e+00, %120 ], [ %234, %238 ]
  %131 = phi float [ 0xFFF0000000000000, %120 ], [ %195, %238 ]
  %132 = icmp slt i32 %127, %76
  br i1 %132, label %135, label %133

133:                                              ; preds = %126
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %17)
  %134 = icmp eq i16 %simdLaneId16, 0
  br i1 %134, label %270, label %274

135:                                              ; preds = %126
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %18)
  br label %136

136:                                              ; preds = %142, %135
  %137 = phi i32 [ 0, %135 ], [ %159, %142 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %142, label %139

139:                                              ; preds = %136
  %140 = add nsw i32 %127, 1, !spirv.Decorations !871
  %141 = icmp slt i32 %140, %76
  br i1 %141, label %160, label %192

142:                                              ; preds = %136
  %143 = zext i32 %137 to i64
  %144 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %143
  %145 = load <4 x half>, ptr %144, align 8, !noalias !929
  %146 = extractelement <4 x half> %145, i32 0
  %147 = extractelement <4 x half> %145, i32 1
  %148 = extractelement <4 x half> %145, i32 2
  %149 = extractelement <4 x half> %145, i32 3
  %150 = fpext half %146 to float
  %151 = fpext half %147 to float
  %152 = fpext half %148 to float
  %153 = fpext half %149 to float
  %154 = insertelement <4 x float> undef, float %150, i32 0
  %155 = insertelement <4 x float> %154, float %151, i32 1
  %156 = insertelement <4 x float> %155, float %152, i32 2
  %157 = insertelement <4 x float> %156, float %153, i32 3
  %158 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %143
  store <4 x float> %157, ptr %158, align 16
  %159 = add nuw nsw i32 %137, 1, !spirv.Decorations !853
  br label %136, !llvm.loop !932

160:                                              ; preds = %139
  %161 = add i32 %127, %123
  %162 = sext i32 %161 to i64
  %163 = shl nsw i64 %162, 6, !spirv.Decorations !871
  %164 = add nsw i64 %163, %124, !spirv.Decorations !871
  %165 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %164
  %166 = load float, ptr addrspace(1) %165, align 4
  %167 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %164
  %168 = load float, ptr addrspace(1) %167, align 4
  %169 = shl nsw i64 %164, 8, !spirv.Decorations !871
  %170 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %169
  br label %171

171:                                              ; preds = %190, %160
  %172 = phi i32 [ 0, %160 ], [ %191, %190 ]
  %173 = icmp ult i32 %172, 4
  br i1 %173, label %174, label %.loopexit1

174:                                              ; preds = %171
  %175 = shl nuw nsw i32 %172, 6, !spirv.Decorations !853
  %176 = add nuw nsw i32 %175, %125, !spirv.Decorations !853
  %177 = zext i32 %172 to i64
  %178 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %177
  %179 = zext i32 %176 to i64
  %180 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %170, i64 %179
  br label %181

181:                                              ; preds = %184, %174
  %182 = phi i32 [ 0, %174 ], [ %189, %184 ]
  %183 = icmp ult i32 %182, 4
  br i1 %183, label %184, label %190

184:                                              ; preds = %181
  %185 = zext i32 %182 to i64
  %186 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %180, i64 %185
  %187 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %178, i64 0, i32 0, i64 %185
  %188 = load half, ptr addrspace(1) %186, align 2
  store half %188, ptr %187, align 2
  %189 = add nuw nsw i32 %182, 1, !spirv.Decorations !853
  br label %181

190:                                              ; preds = %181
  %191 = add nuw nsw i32 %172, 1, !spirv.Decorations !853
  br label %171, !llvm.loop !933

.loopexit1:                                       ; preds = %171
  br label %192

192:                                              ; preds = %.loopexit1, %139
  %193 = phi float [ %128, %139 ], [ %168, %.loopexit1 ]
  %194 = phi float [ %129, %139 ], [ %166, %.loopexit1 ]
  %195 = call float @llvm.maxnum.f32(float %131, float %129)
  %196 = fcmp reassoc nsz arcp contract oeq float %131, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %196, label %211, label %197

197:                                              ; preds = %192
  %198 = fsub reassoc nsz arcp contract float %131, %195, !spirv.Decorations !856
  %199 = fmul float %198, 0x3FF7154760000000
  %200 = call float @llvm.trunc.f32(float %199)
  %201 = call float @llvm.fma.f32(float %200, float 0xBFE62E4000000000, float %198)
  %202 = call float @llvm.fma.f32(float %200, float 0xBEB7F7D1C0000000, float %201)
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = call float @llvm.exp2.f32(float %200)
  %205 = call float @llvm.exp2.f32(float %203)
  %206 = fmul float %204, %205
  %207 = fcmp olt float %198, -1.050000e+02
  %208 = select i1 %207, float 0.000000e+00, float %206
  %209 = fcmp ogt float %198, 1.050000e+02
  %210 = select i1 %209, float 0x7FF0000000000000, float %208
  br label %211

211:                                              ; preds = %197, %192
  %212 = phi float [ %210, %197 ], [ 0.000000e+00, %192 ]
  %213 = fcmp reassoc nsz arcp contract oeq float %129, 0xFFF0000000000000, !spirv.Decorations !856
  %214 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !856
  %215 = or i1 %213, %214
  br i1 %215, label %230, label %216

216:                                              ; preds = %211
  %217 = fsub reassoc nsz arcp contract float %129, %195, !spirv.Decorations !856
  %218 = fmul float %217, 0x3FF7154760000000
  %219 = call float @llvm.trunc.f32(float %218)
  %220 = call float @llvm.fma.f32(float %219, float 0xBFE62E4000000000, float %217)
  %221 = call float @llvm.fma.f32(float %219, float 0xBEB7F7D1C0000000, float %220)
  %222 = fmul float %221, 0x3FF7154760000000
  %223 = call float @llvm.exp2.f32(float %219)
  %224 = call float @llvm.exp2.f32(float %222)
  %225 = fmul float %223, %224
  %226 = fcmp olt float %217, -1.050000e+02
  %227 = select i1 %226, float 0.000000e+00, float %225
  %228 = fcmp ogt float %217, 1.050000e+02
  %229 = select i1 %228, float 0x7FF0000000000000, float %227
  br label %230

230:                                              ; preds = %216, %211
  %231 = phi float [ %229, %216 ], [ 0.000000e+00, %211 ]
  %232 = fmul reassoc nsz arcp contract float %231, %128, !spirv.Decorations !856
  %233 = fmul reassoc nsz arcp contract float %130, %212, !spirv.Decorations !856
  %234 = fadd reassoc nsz arcp contract float %233, %232, !spirv.Decorations !856
  br label %235

235:                                              ; preds = %239, %230
  %236 = phi i32 [ 0, %230 ], [ %269, %239 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %239, label %238

238:                                              ; preds = %235
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %18)
  br label %126

239:                                              ; preds = %235
  %240 = zext i32 %236 to i64
  %241 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %240
  %242 = load <4 x float>, ptr %241, align 16, !noalias !934
  %243 = extractelement <4 x float> %242, i32 0
  %244 = extractelement <4 x float> %242, i32 1
  %245 = extractelement <4 x float> %242, i32 2
  %246 = extractelement <4 x float> %242, i32 3
  %247 = fmul reassoc nsz arcp contract float %243, %212, !spirv.Decorations !856
  %248 = fmul reassoc nsz arcp contract float %244, %212, !spirv.Decorations !856
  %249 = fmul reassoc nsz arcp contract float %245, %212, !spirv.Decorations !856
  %250 = fmul reassoc nsz arcp contract float %246, %212, !spirv.Decorations !856
  %251 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %240
  %252 = load <4 x float>, ptr %251, align 16, !noalias !943
  %253 = extractelement <4 x float> %252, i32 0
  %254 = extractelement <4 x float> %252, i32 1
  %255 = extractelement <4 x float> %252, i32 2
  %256 = extractelement <4 x float> %252, i32 3
  %257 = fmul reassoc nsz arcp contract float %232, %253, !spirv.Decorations !856
  %258 = fmul reassoc nsz arcp contract float %232, %254, !spirv.Decorations !856
  %259 = fmul reassoc nsz arcp contract float %232, %255, !spirv.Decorations !856
  %260 = fmul reassoc nsz arcp contract float %232, %256, !spirv.Decorations !856
  %261 = fadd reassoc nsz arcp contract float %247, %257, !spirv.Decorations !856
  %262 = fadd reassoc nsz arcp contract float %248, %258, !spirv.Decorations !856
  %263 = fadd reassoc nsz arcp contract float %249, %259, !spirv.Decorations !856
  %264 = fadd reassoc nsz arcp contract float %250, %260, !spirv.Decorations !856
  %265 = insertelement <4 x float> undef, float %261, i32 0
  %266 = insertelement <4 x float> %265, float %262, i32 1
  %267 = insertelement <4 x float> %266, float %263, i32 2
  %268 = insertelement <4 x float> %267, float %264, i32 3
  store <4 x float> %268, ptr %241, align 16
  %269 = add nuw nsw i32 %236, 1, !spirv.Decorations !853
  br label %235, !llvm.loop !952

270:                                              ; preds = %133
  %271 = zext i8 %29 to i64
  %272 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE-ExtSLM, i64 %271
  store float %131, ptr addrspace(3) %272, align 4
  %273 = getelementptr float, ptr addrspace(3) %272, i64 16
  store float %130, ptr addrspace(3) %273, align 4
  br label %274

274:                                              ; preds = %270, %133
  %275 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %276 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %277 = or i32 %276, 32
  %278 = add nuw nsw i32 %275, %277, !spirv.Decorations !853
  br label %279

279:                                              ; preds = %292, %274
  %280 = phi i32 [ 0, %274 ], [ %293, %292 ]
  %281 = icmp ult i32 %280, 4
  br i1 %281, label %284, label %282

282:                                              ; preds = %279
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %283 = icmp eq i8 %29, 0
  br i1 %283, label %.preheader, label %448

.preheader:                                       ; preds = %282
  br label %302

284:                                              ; preds = %279
  %285 = shl nuw nsw i32 %280, 6, !spirv.Decorations !853
  %286 = zext i32 %280 to i64
  %287 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %286
  %288 = add nuw nsw i32 %285, %278, !spirv.Decorations !853
  br label %289

289:                                              ; preds = %294, %284
  %290 = phi i32 [ 0, %284 ], [ %301, %294 ]
  %291 = icmp ult i32 %290, 4
  br i1 %291, label %294, label %292

292:                                              ; preds = %289
  %293 = add nuw nsw i32 %280, 1, !spirv.Decorations !853
  br label %279, !llvm.loop !953

294:                                              ; preds = %289
  %295 = zext i32 %290 to i64
  %296 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %287, i64 0, i32 0, i64 %295
  %297 = load float, ptr %296, align 4
  %298 = or i32 %288, %290
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE-ExtSLM, i64 %299
  store float %297, ptr addrspace(3) %300, align 4
  %301 = add nuw nsw i32 %290, 1, !spirv.Decorations !853
  br label %289, !llvm.loop !954

302:                                              ; preds = %307, %.preheader
  %303 = phi i32 [ %310, %307 ], [ 0, %.preheader ]
  %304 = icmp ult i32 %303, 4
  br i1 %304, label %307, label %305

305:                                              ; preds = %302
  %306 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %311

307:                                              ; preds = %302
  %308 = zext i32 %303 to i64
  %309 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %308
  %310 = add nuw nsw i32 %303, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %309, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.192, i64 16, i1 false)
  br label %302, !llvm.loop !955

311:                                              ; preds = %379, %305
  %312 = phi i32 [ %380, %379 ], [ 0, %305 ]
  %313 = phi float [ %372, %379 ], [ 0.000000e+00, %305 ]
  %314 = phi float [ %333, %379 ], [ 0xFFF0000000000000, %305 ]
  %315 = icmp ult i32 %312, 16
  br i1 %315, label %325, label %316

316:                                              ; preds = %311
  %317 = call float @llvm.maxnum.f32(float %313, float 0x3BC79CA100000000)
  %318 = mul nuw i32 %55, 12, !spirv.Decorations !904
  %319 = zext i32 %318 to i64
  %320 = sext i32 %57 to i64
  %321 = add nsw i64 %319, %320, !spirv.Decorations !871
  %322 = shl nsw i64 %321, 8, !spirv.Decorations !871
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %322
  %324 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %425

325:                                              ; preds = %311
  %326 = zext i32 %312 to i64
  %327 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE-ExtSLM, i64 %326
  %328 = load float, ptr addrspace(3) %327, align 4
  %329 = zext i32 %312 to i64
  %330 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE-ExtSLM, i64 0, i64 64
  %331 = getelementptr inbounds float, ptr addrspace(3) %330, i64 %329
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = call float @llvm.maxnum.f32(float %314, float %328)
  %334 = fcmp reassoc nsz arcp contract oeq float %314, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %334, label %349, label %335

335:                                              ; preds = %325
  %336 = fsub reassoc nsz arcp contract float %314, %333, !spirv.Decorations !856
  %337 = fmul float %336, 0x3FF7154760000000
  %338 = call float @llvm.trunc.f32(float %337)
  %339 = call float @llvm.fma.f32(float %338, float 0xBFE62E4000000000, float %336)
  %340 = call float @llvm.fma.f32(float %338, float 0xBEB7F7D1C0000000, float %339)
  %341 = fmul float %340, 0x3FF7154760000000
  %342 = call float @llvm.exp2.f32(float %338)
  %343 = call float @llvm.exp2.f32(float %341)
  %344 = fmul float %342, %343
  %345 = fcmp olt float %336, -1.050000e+02
  %346 = select i1 %345, float 0.000000e+00, float %344
  %347 = fcmp ogt float %336, 1.050000e+02
  %348 = select i1 %347, float 0x7FF0000000000000, float %346
  br label %349

349:                                              ; preds = %335, %325
  %350 = phi float [ %348, %335 ], [ 0.000000e+00, %325 ]
  %351 = fcmp reassoc nsz arcp contract oeq float %328, 0xFFF0000000000000, !spirv.Decorations !856
  %352 = fcmp reassoc nsz arcp contract oeq float %333, 0xFFF0000000000000, !spirv.Decorations !856
  %353 = or i1 %351, %352
  br i1 %353, label %368, label %354

354:                                              ; preds = %349
  %355 = fsub reassoc nsz arcp contract float %328, %333, !spirv.Decorations !856
  %356 = fmul float %355, 0x3FF7154760000000
  %357 = call float @llvm.trunc.f32(float %356)
  %358 = call float @llvm.fma.f32(float %357, float 0xBFE62E4000000000, float %355)
  %359 = call float @llvm.fma.f32(float %357, float 0xBEB7F7D1C0000000, float %358)
  %360 = fmul float %359, 0x3FF7154760000000
  %361 = call float @llvm.exp2.f32(float %357)
  %362 = call float @llvm.exp2.f32(float %360)
  %363 = fmul float %361, %362
  %364 = fcmp olt float %355, -1.050000e+02
  %365 = select i1 %364, float 0.000000e+00, float %363
  %366 = fcmp ogt float %355, 1.050000e+02
  %367 = select i1 %366, float 0x7FF0000000000000, float %365
  br label %368

368:                                              ; preds = %354, %349
  %369 = phi float [ %367, %354 ], [ 0.000000e+00, %349 ]
  %370 = fmul reassoc nsz arcp contract float %313, %350, !spirv.Decorations !856
  %371 = fmul reassoc nsz arcp contract float %369, %332, !spirv.Decorations !856
  %372 = fadd reassoc nsz arcp contract float %370, %371, !spirv.Decorations !856
  %373 = shl nuw nsw i32 %312, 8, !spirv.Decorations !853
  %374 = or i32 %373, 32
  %375 = add nuw nsw i32 %306, %374, !spirv.Decorations !853
  br label %376

376:                                              ; preds = %387, %368
  %377 = phi i32 [ 0, %368 ], [ %416, %387 ]
  %378 = icmp ult i32 %377, 4
  br i1 %378, label %381, label %379

379:                                              ; preds = %376
  %380 = add nuw nsw i32 %312, 1, !spirv.Decorations !853
  br label %311

381:                                              ; preds = %376
  %382 = shl nuw nsw i32 %377, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %19)
  %383 = add nuw nsw i32 %382, %375, !spirv.Decorations !853
  br label %384

384:                                              ; preds = %417, %381
  %385 = phi i32 [ 0, %381 ], [ %424, %417 ]
  %386 = icmp ult i32 %385, 4
  br i1 %386, label %417, label %387

387:                                              ; preds = %384
  %388 = zext i32 %377 to i64
  %389 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %388
  %390 = load <4 x float>, ptr %389, align 16, !noalias !956
  %391 = extractelement <4 x float> %390, i32 0
  %392 = extractelement <4 x float> %390, i32 1
  %393 = extractelement <4 x float> %390, i32 2
  %394 = extractelement <4 x float> %390, i32 3
  %395 = fmul reassoc nsz arcp contract float %391, %350, !spirv.Decorations !856
  %396 = fmul reassoc nsz arcp contract float %392, %350, !spirv.Decorations !856
  %397 = fmul reassoc nsz arcp contract float %393, %350, !spirv.Decorations !856
  %398 = fmul reassoc nsz arcp contract float %394, %350, !spirv.Decorations !856
  %399 = load <4 x float>, ptr %19, align 16, !noalias !965
  %400 = extractelement <4 x float> %399, i32 0
  %401 = extractelement <4 x float> %399, i32 1
  %402 = extractelement <4 x float> %399, i32 2
  %403 = extractelement <4 x float> %399, i32 3
  %404 = fmul reassoc nsz arcp contract float %369, %400, !spirv.Decorations !856
  %405 = fmul reassoc nsz arcp contract float %369, %401, !spirv.Decorations !856
  %406 = fmul reassoc nsz arcp contract float %369, %402, !spirv.Decorations !856
  %407 = fmul reassoc nsz arcp contract float %369, %403, !spirv.Decorations !856
  %408 = fadd reassoc nsz arcp contract float %395, %404, !spirv.Decorations !856
  %409 = fadd reassoc nsz arcp contract float %396, %405, !spirv.Decorations !856
  %410 = fadd reassoc nsz arcp contract float %397, %406, !spirv.Decorations !856
  %411 = fadd reassoc nsz arcp contract float %398, %407, !spirv.Decorations !856
  %412 = insertelement <4 x float> undef, float %408, i32 0
  %413 = insertelement <4 x float> %412, float %409, i32 1
  %414 = insertelement <4 x float> %413, float %410, i32 2
  %415 = insertelement <4 x float> %414, float %411, i32 3
  store <4 x float> %415, ptr %389, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %19)
  %416 = add nuw nsw i32 %377, 1, !spirv.Decorations !853
  br label %376, !llvm.loop !974

417:                                              ; preds = %384
  %418 = or i32 %383, %385
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE-ExtSLM, i64 %419
  %421 = load float, ptr addrspace(3) %420, align 4
  %422 = zext i32 %385 to i64
  %423 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %19, i64 0, i32 0, i64 %422
  store float %421, ptr %423, align 4
  %424 = add nuw nsw i32 %385, 1, !spirv.Decorations !853
  br label %384, !llvm.loop !975

425:                                              ; preds = %436, %316
  %426 = phi i32 [ 0, %316 ], [ %437, %436 ]
  %427 = icmp ult i32 %426, 4
  br i1 %427, label %428, label %.loopexit

428:                                              ; preds = %425
  %429 = shl nuw nsw i32 %426, 6, !spirv.Decorations !853
  %430 = add nuw nsw i32 %429, %324, !spirv.Decorations !853
  %431 = zext i32 %426 to i64
  %432 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %431
  br label %433

433:                                              ; preds = %438, %428
  %434 = phi i32 [ 0, %428 ], [ %447, %438 ]
  %435 = icmp ult i32 %434, 4
  br i1 %435, label %438, label %436

436:                                              ; preds = %433
  %437 = add nuw nsw i32 %426, 1, !spirv.Decorations !853
  br label %425, !llvm.loop !976

438:                                              ; preds = %433
  %439 = zext i32 %434 to i64
  %440 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %432, i64 0, i32 0, i64 %439
  %441 = load float, ptr %440, align 4
  %442 = fdiv reassoc nsz arcp contract float %441, %317
  %443 = fptrunc float %442 to half
  %444 = or i32 %430, %434
  %445 = zext i32 %444 to i64
  %446 = getelementptr inbounds half, ptr addrspace(1) %323, i64 %445
  store half %443, ptr addrspace(1) %446, align 2
  %447 = add nuw nsw i32 %434, 1, !spirv.Decorations !853
  br label %433, !llvm.loop !977

.loopexit:                                        ; preds = %425
  br label %448

448:                                              ; preds = %.loopexit, %282
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !873
  %18 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %19 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %20 = bitcast <8 x i32> %r0 to <32 x i8>
  %21 = extractelement <32 x i8> %20, i32 0
  %22 = extractelement <32 x i8> %20, i32 1
  %23 = extractelement <32 x i8> %20, i32 2
  %24 = extractelement <32 x i8> %20, i32 3
  %25 = extractelement <32 x i8> %20, i32 4
  %26 = extractelement <32 x i8> %20, i32 5
  %27 = extractelement <32 x i8> %20, i32 6
  %28 = extractelement <32 x i8> %20, i32 7
  %29 = extractelement <32 x i8> %20, i32 8
  %30 = extractelement <32 x i8> %20, i32 9
  %31 = extractelement <32 x i8> %20, i32 10
  %32 = extractelement <32 x i8> %20, i32 11
  %33 = extractelement <32 x i8> %20, i32 12
  %34 = extractelement <32 x i8> %20, i32 13
  %35 = extractelement <32 x i8> %20, i32 14
  %36 = extractelement <32 x i8> %20, i32 15
  %37 = extractelement <32 x i8> %20, i32 16
  %38 = extractelement <32 x i8> %20, i32 17
  %39 = extractelement <32 x i8> %20, i32 18
  %40 = extractelement <32 x i8> %20, i32 19
  %41 = extractelement <32 x i8> %20, i32 20
  %42 = extractelement <32 x i8> %20, i32 21
  %43 = extractelement <32 x i8> %20, i32 22
  %44 = extractelement <32 x i8> %20, i32 23
  %45 = extractelement <32 x i8> %20, i32 24
  %46 = extractelement <32 x i8> %20, i32 25
  %47 = extractelement <32 x i8> %20, i32 26
  %48 = extractelement <32 x i8> %20, i32 27
  %49 = extractelement <32 x i8> %20, i32 28
  %50 = extractelement <32 x i8> %20, i32 29
  %51 = extractelement <32 x i8> %20, i32 30
  %52 = extractelement <32 x i8> %20, i32 31
  %localThreadId10 = zext i8 %29 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %53 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %53)
  %54 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %54)
  %55 = udiv i32 %9, 12
  %56 = mul nsw i32 %55, -12, !spirv.Decorations !871
  %57 = add nsw i32 %56, %9, !spirv.Decorations !871
  %58 = sdiv i32 %57, 6
  %59 = mul nuw nsw i32 %55, 6, !spirv.Decorations !853
  %60 = mul nsw i32 %58, -6, !spirv.Decorations !871
  %61 = add nsw i32 %60, %57, !spirv.Decorations !871
  %62 = add nsw i32 %59, %61, !spirv.Decorations !871
  %63 = mul nsw i32 %58, %0, !spirv.Decorations !871
  %64 = load i32, ptr addrspace(1) %1, align 4
  %65 = sext i32 %64 to i64
  %66 = sext i32 %0 to i64
  %67 = add nsw i64 %65, 63, !spirv.Decorations !871
  %68 = sdiv i64 %67, 64
  %69 = call i64 @llvm.smin.i64(i64 %66, i64 %68)
  %70 = call i64 @llvm.smax.i64(i64 %69, i64 1)
  %71 = trunc i64 %70 to i32
  %72 = add nsw i32 %71, 31, !spirv.Decorations !871
  %73 = sdiv i32 %72, 32
  %74 = mul nsw i32 %73, %localThreadId10, !spirv.Decorations !871
  %75 = add nsw i32 %74, %73, !spirv.Decorations !871
  %76 = call i32 @llvm.smin.i32(i32 %75, i32 %71)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %77

77:                                               ; preds = %82, %7
  %78 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %79 = icmp ult i32 %78, 4
  br i1 %79, label %82, label %80

80:                                               ; preds = %77
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %17)
  %81 = icmp slt i32 %74, %76
  br i1 %81, label %86, label %120

82:                                               ; preds = %77
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %78, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.193, i64 16, i1 false)
  br label %77, !llvm.loop !978

86:                                               ; preds = %80
  %87 = add nsw i32 %63, %74, !spirv.Decorations !871
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 6, !spirv.Decorations !871
  %90 = sext i32 %62 to i64
  %91 = add nsw i64 %89, %90, !spirv.Decorations !871
  %92 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %91
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %97 = shl nsw i64 %91, 8, !spirv.Decorations !871
  %98 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %97
  br label %99

99:                                               ; preds = %118, %86
  %100 = phi i32 [ 0, %86 ], [ %119, %118 ]
  %101 = icmp ult i32 %100, 4
  br i1 %101, label %102, label %.loopexit2

102:                                              ; preds = %99
  %103 = shl nuw nsw i32 %100, 6, !spirv.Decorations !853
  %104 = add nuw nsw i32 %103, %96, !spirv.Decorations !853
  %105 = zext i32 %100 to i64
  %106 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %105
  %107 = zext i32 %104 to i64
  %108 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %98, i64 %107
  br label %109

109:                                              ; preds = %112, %102
  %110 = phi i32 [ 0, %102 ], [ %117, %112 ]
  %111 = icmp ult i32 %110, 4
  br i1 %111, label %112, label %118

112:                                              ; preds = %109
  %113 = zext i32 %110 to i64
  %114 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %108, i64 %113
  %115 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %106, i64 0, i32 0, i64 %113
  %116 = load half, ptr addrspace(1) %114, align 2
  store half %116, ptr %115, align 2
  %117 = add nuw nsw i32 %110, 1, !spirv.Decorations !853
  br label %109

118:                                              ; preds = %109
  %119 = add nuw nsw i32 %100, 1, !spirv.Decorations !853
  br label %99, !llvm.loop !979

.loopexit2:                                       ; preds = %99
  br label %120

120:                                              ; preds = %.loopexit2, %80
  %121 = phi float [ 0.000000e+00, %80 ], [ %95, %.loopexit2 ]
  %122 = phi float [ 0xFFF0000000000000, %80 ], [ %93, %.loopexit2 ]
  %123 = add i32 %63, 1
  %124 = sext i32 %62 to i64
  %125 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %126

126:                                              ; preds = %238, %120
  %127 = phi i32 [ %74, %120 ], [ %140, %238 ]
  %128 = phi float [ %121, %120 ], [ %193, %238 ]
  %129 = phi float [ %122, %120 ], [ %194, %238 ]
  %130 = phi float [ 0.000000e+00, %120 ], [ %234, %238 ]
  %131 = phi float [ 0xFFF0000000000000, %120 ], [ %195, %238 ]
  %132 = icmp slt i32 %127, %76
  br i1 %132, label %135, label %133

133:                                              ; preds = %126
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %17)
  %134 = icmp eq i16 %simdLaneId16, 0
  br i1 %134, label %270, label %274

135:                                              ; preds = %126
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %18)
  br label %136

136:                                              ; preds = %142, %135
  %137 = phi i32 [ 0, %135 ], [ %159, %142 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %142, label %139

139:                                              ; preds = %136
  %140 = add nsw i32 %127, 1, !spirv.Decorations !871
  %141 = icmp slt i32 %140, %76
  br i1 %141, label %160, label %192

142:                                              ; preds = %136
  %143 = zext i32 %137 to i64
  %144 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %143
  %145 = load <4 x half>, ptr %144, align 8, !noalias !980
  %146 = extractelement <4 x half> %145, i32 0
  %147 = extractelement <4 x half> %145, i32 1
  %148 = extractelement <4 x half> %145, i32 2
  %149 = extractelement <4 x half> %145, i32 3
  %150 = fpext half %146 to float
  %151 = fpext half %147 to float
  %152 = fpext half %148 to float
  %153 = fpext half %149 to float
  %154 = insertelement <4 x float> undef, float %150, i32 0
  %155 = insertelement <4 x float> %154, float %151, i32 1
  %156 = insertelement <4 x float> %155, float %152, i32 2
  %157 = insertelement <4 x float> %156, float %153, i32 3
  %158 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %143
  store <4 x float> %157, ptr %158, align 16
  %159 = add nuw nsw i32 %137, 1, !spirv.Decorations !853
  br label %136, !llvm.loop !983

160:                                              ; preds = %139
  %161 = add i32 %127, %123
  %162 = sext i32 %161 to i64
  %163 = shl nsw i64 %162, 6, !spirv.Decorations !871
  %164 = add nsw i64 %163, %124, !spirv.Decorations !871
  %165 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %164
  %166 = load float, ptr addrspace(1) %165, align 4
  %167 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %164
  %168 = load float, ptr addrspace(1) %167, align 4
  %169 = shl nsw i64 %164, 8, !spirv.Decorations !871
  %170 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %169
  br label %171

171:                                              ; preds = %190, %160
  %172 = phi i32 [ 0, %160 ], [ %191, %190 ]
  %173 = icmp ult i32 %172, 4
  br i1 %173, label %174, label %.loopexit1

174:                                              ; preds = %171
  %175 = shl nuw nsw i32 %172, 6, !spirv.Decorations !853
  %176 = add nuw nsw i32 %175, %125, !spirv.Decorations !853
  %177 = zext i32 %172 to i64
  %178 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %177
  %179 = zext i32 %176 to i64
  %180 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %170, i64 %179
  br label %181

181:                                              ; preds = %184, %174
  %182 = phi i32 [ 0, %174 ], [ %189, %184 ]
  %183 = icmp ult i32 %182, 4
  br i1 %183, label %184, label %190

184:                                              ; preds = %181
  %185 = zext i32 %182 to i64
  %186 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %180, i64 %185
  %187 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %178, i64 0, i32 0, i64 %185
  %188 = load half, ptr addrspace(1) %186, align 2
  store half %188, ptr %187, align 2
  %189 = add nuw nsw i32 %182, 1, !spirv.Decorations !853
  br label %181

190:                                              ; preds = %181
  %191 = add nuw nsw i32 %172, 1, !spirv.Decorations !853
  br label %171, !llvm.loop !984

.loopexit1:                                       ; preds = %171
  br label %192

192:                                              ; preds = %.loopexit1, %139
  %193 = phi float [ %128, %139 ], [ %168, %.loopexit1 ]
  %194 = phi float [ %129, %139 ], [ %166, %.loopexit1 ]
  %195 = call float @llvm.maxnum.f32(float %131, float %129)
  %196 = fcmp reassoc nsz arcp contract oeq float %131, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %196, label %211, label %197

197:                                              ; preds = %192
  %198 = fsub reassoc nsz arcp contract float %131, %195, !spirv.Decorations !856
  %199 = fmul float %198, 0x3FF7154760000000
  %200 = call float @llvm.trunc.f32(float %199)
  %201 = call float @llvm.fma.f32(float %200, float 0xBFE62E4000000000, float %198)
  %202 = call float @llvm.fma.f32(float %200, float 0xBEB7F7D1C0000000, float %201)
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = call float @llvm.exp2.f32(float %200)
  %205 = call float @llvm.exp2.f32(float %203)
  %206 = fmul float %204, %205
  %207 = fcmp olt float %198, -1.050000e+02
  %208 = select i1 %207, float 0.000000e+00, float %206
  %209 = fcmp ogt float %198, 1.050000e+02
  %210 = select i1 %209, float 0x7FF0000000000000, float %208
  br label %211

211:                                              ; preds = %197, %192
  %212 = phi float [ %210, %197 ], [ 0.000000e+00, %192 ]
  %213 = fcmp reassoc nsz arcp contract oeq float %129, 0xFFF0000000000000, !spirv.Decorations !856
  %214 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !856
  %215 = or i1 %213, %214
  br i1 %215, label %230, label %216

216:                                              ; preds = %211
  %217 = fsub reassoc nsz arcp contract float %129, %195, !spirv.Decorations !856
  %218 = fmul float %217, 0x3FF7154760000000
  %219 = call float @llvm.trunc.f32(float %218)
  %220 = call float @llvm.fma.f32(float %219, float 0xBFE62E4000000000, float %217)
  %221 = call float @llvm.fma.f32(float %219, float 0xBEB7F7D1C0000000, float %220)
  %222 = fmul float %221, 0x3FF7154760000000
  %223 = call float @llvm.exp2.f32(float %219)
  %224 = call float @llvm.exp2.f32(float %222)
  %225 = fmul float %223, %224
  %226 = fcmp olt float %217, -1.050000e+02
  %227 = select i1 %226, float 0.000000e+00, float %225
  %228 = fcmp ogt float %217, 1.050000e+02
  %229 = select i1 %228, float 0x7FF0000000000000, float %227
  br label %230

230:                                              ; preds = %216, %211
  %231 = phi float [ %229, %216 ], [ 0.000000e+00, %211 ]
  %232 = fmul reassoc nsz arcp contract float %231, %128, !spirv.Decorations !856
  %233 = fmul reassoc nsz arcp contract float %130, %212, !spirv.Decorations !856
  %234 = fadd reassoc nsz arcp contract float %233, %232, !spirv.Decorations !856
  br label %235

235:                                              ; preds = %239, %230
  %236 = phi i32 [ 0, %230 ], [ %269, %239 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %239, label %238

238:                                              ; preds = %235
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %18)
  br label %126

239:                                              ; preds = %235
  %240 = zext i32 %236 to i64
  %241 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %240
  %242 = load <4 x float>, ptr %241, align 16, !noalias !985
  %243 = extractelement <4 x float> %242, i32 0
  %244 = extractelement <4 x float> %242, i32 1
  %245 = extractelement <4 x float> %242, i32 2
  %246 = extractelement <4 x float> %242, i32 3
  %247 = fmul reassoc nsz arcp contract float %243, %212, !spirv.Decorations !856
  %248 = fmul reassoc nsz arcp contract float %244, %212, !spirv.Decorations !856
  %249 = fmul reassoc nsz arcp contract float %245, %212, !spirv.Decorations !856
  %250 = fmul reassoc nsz arcp contract float %246, %212, !spirv.Decorations !856
  %251 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %240
  %252 = load <4 x float>, ptr %251, align 16, !noalias !994
  %253 = extractelement <4 x float> %252, i32 0
  %254 = extractelement <4 x float> %252, i32 1
  %255 = extractelement <4 x float> %252, i32 2
  %256 = extractelement <4 x float> %252, i32 3
  %257 = fmul reassoc nsz arcp contract float %232, %253, !spirv.Decorations !856
  %258 = fmul reassoc nsz arcp contract float %232, %254, !spirv.Decorations !856
  %259 = fmul reassoc nsz arcp contract float %232, %255, !spirv.Decorations !856
  %260 = fmul reassoc nsz arcp contract float %232, %256, !spirv.Decorations !856
  %261 = fadd reassoc nsz arcp contract float %247, %257, !spirv.Decorations !856
  %262 = fadd reassoc nsz arcp contract float %248, %258, !spirv.Decorations !856
  %263 = fadd reassoc nsz arcp contract float %249, %259, !spirv.Decorations !856
  %264 = fadd reassoc nsz arcp contract float %250, %260, !spirv.Decorations !856
  %265 = insertelement <4 x float> undef, float %261, i32 0
  %266 = insertelement <4 x float> %265, float %262, i32 1
  %267 = insertelement <4 x float> %266, float %263, i32 2
  %268 = insertelement <4 x float> %267, float %264, i32 3
  store <4 x float> %268, ptr %241, align 16
  %269 = add nuw nsw i32 %236, 1, !spirv.Decorations !853
  br label %235, !llvm.loop !1003

270:                                              ; preds = %133
  %271 = zext i8 %29 to i64
  %272 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE-ExtSLM, i64 %271
  store float %131, ptr addrspace(3) %272, align 4
  %273 = getelementptr float, ptr addrspace(3) %272, i64 32
  store float %130, ptr addrspace(3) %273, align 4
  br label %274

274:                                              ; preds = %270, %133
  %275 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %276 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %277 = or i32 %276, 64
  %278 = add nuw nsw i32 %275, %277, !spirv.Decorations !853
  br label %279

279:                                              ; preds = %292, %274
  %280 = phi i32 [ 0, %274 ], [ %293, %292 ]
  %281 = icmp ult i32 %280, 4
  br i1 %281, label %284, label %282

282:                                              ; preds = %279
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %283 = icmp eq i8 %29, 0
  br i1 %283, label %.preheader, label %448

.preheader:                                       ; preds = %282
  br label %302

284:                                              ; preds = %279
  %285 = shl nuw nsw i32 %280, 6, !spirv.Decorations !853
  %286 = zext i32 %280 to i64
  %287 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %286
  %288 = add nuw nsw i32 %285, %278, !spirv.Decorations !853
  br label %289

289:                                              ; preds = %294, %284
  %290 = phi i32 [ 0, %284 ], [ %301, %294 ]
  %291 = icmp ult i32 %290, 4
  br i1 %291, label %294, label %292

292:                                              ; preds = %289
  %293 = add nuw nsw i32 %280, 1, !spirv.Decorations !853
  br label %279, !llvm.loop !1004

294:                                              ; preds = %289
  %295 = zext i32 %290 to i64
  %296 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %287, i64 0, i32 0, i64 %295
  %297 = load float, ptr %296, align 4
  %298 = or i32 %288, %290
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE-ExtSLM, i64 %299
  store float %297, ptr addrspace(3) %300, align 4
  %301 = add nuw nsw i32 %290, 1, !spirv.Decorations !853
  br label %289, !llvm.loop !1005

302:                                              ; preds = %307, %.preheader
  %303 = phi i32 [ %310, %307 ], [ 0, %.preheader ]
  %304 = icmp ult i32 %303, 4
  br i1 %304, label %307, label %305

305:                                              ; preds = %302
  %306 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %311

307:                                              ; preds = %302
  %308 = zext i32 %303 to i64
  %309 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %308
  %310 = add nuw nsw i32 %303, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %309, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.194, i64 16, i1 false)
  br label %302, !llvm.loop !1006

311:                                              ; preds = %379, %305
  %312 = phi i32 [ %380, %379 ], [ 0, %305 ]
  %313 = phi float [ %372, %379 ], [ 0.000000e+00, %305 ]
  %314 = phi float [ %333, %379 ], [ 0xFFF0000000000000, %305 ]
  %315 = icmp ult i32 %312, 32
  br i1 %315, label %325, label %316

316:                                              ; preds = %311
  %317 = call float @llvm.maxnum.f32(float %313, float 0x3BC79CA100000000)
  %318 = mul nuw i32 %55, 12, !spirv.Decorations !904
  %319 = zext i32 %318 to i64
  %320 = sext i32 %57 to i64
  %321 = add nsw i64 %319, %320, !spirv.Decorations !871
  %322 = shl nsw i64 %321, 8, !spirv.Decorations !871
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %322
  %324 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %425

325:                                              ; preds = %311
  %326 = zext i32 %312 to i64
  %327 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE-ExtSLM, i64 %326
  %328 = load float, ptr addrspace(3) %327, align 4
  %329 = zext i32 %312 to i64
  %330 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE-ExtSLM, i64 0, i64 128
  %331 = getelementptr inbounds float, ptr addrspace(3) %330, i64 %329
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = call float @llvm.maxnum.f32(float %314, float %328)
  %334 = fcmp reassoc nsz arcp contract oeq float %314, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %334, label %349, label %335

335:                                              ; preds = %325
  %336 = fsub reassoc nsz arcp contract float %314, %333, !spirv.Decorations !856
  %337 = fmul float %336, 0x3FF7154760000000
  %338 = call float @llvm.trunc.f32(float %337)
  %339 = call float @llvm.fma.f32(float %338, float 0xBFE62E4000000000, float %336)
  %340 = call float @llvm.fma.f32(float %338, float 0xBEB7F7D1C0000000, float %339)
  %341 = fmul float %340, 0x3FF7154760000000
  %342 = call float @llvm.exp2.f32(float %338)
  %343 = call float @llvm.exp2.f32(float %341)
  %344 = fmul float %342, %343
  %345 = fcmp olt float %336, -1.050000e+02
  %346 = select i1 %345, float 0.000000e+00, float %344
  %347 = fcmp ogt float %336, 1.050000e+02
  %348 = select i1 %347, float 0x7FF0000000000000, float %346
  br label %349

349:                                              ; preds = %335, %325
  %350 = phi float [ %348, %335 ], [ 0.000000e+00, %325 ]
  %351 = fcmp reassoc nsz arcp contract oeq float %328, 0xFFF0000000000000, !spirv.Decorations !856
  %352 = fcmp reassoc nsz arcp contract oeq float %333, 0xFFF0000000000000, !spirv.Decorations !856
  %353 = or i1 %351, %352
  br i1 %353, label %368, label %354

354:                                              ; preds = %349
  %355 = fsub reassoc nsz arcp contract float %328, %333, !spirv.Decorations !856
  %356 = fmul float %355, 0x3FF7154760000000
  %357 = call float @llvm.trunc.f32(float %356)
  %358 = call float @llvm.fma.f32(float %357, float 0xBFE62E4000000000, float %355)
  %359 = call float @llvm.fma.f32(float %357, float 0xBEB7F7D1C0000000, float %358)
  %360 = fmul float %359, 0x3FF7154760000000
  %361 = call float @llvm.exp2.f32(float %357)
  %362 = call float @llvm.exp2.f32(float %360)
  %363 = fmul float %361, %362
  %364 = fcmp olt float %355, -1.050000e+02
  %365 = select i1 %364, float 0.000000e+00, float %363
  %366 = fcmp ogt float %355, 1.050000e+02
  %367 = select i1 %366, float 0x7FF0000000000000, float %365
  br label %368

368:                                              ; preds = %354, %349
  %369 = phi float [ %367, %354 ], [ 0.000000e+00, %349 ]
  %370 = fmul reassoc nsz arcp contract float %313, %350, !spirv.Decorations !856
  %371 = fmul reassoc nsz arcp contract float %369, %332, !spirv.Decorations !856
  %372 = fadd reassoc nsz arcp contract float %370, %371, !spirv.Decorations !856
  %373 = shl nuw nsw i32 %312, 8, !spirv.Decorations !853
  %374 = or i32 %373, 64
  %375 = add nuw nsw i32 %306, %374, !spirv.Decorations !853
  br label %376

376:                                              ; preds = %387, %368
  %377 = phi i32 [ 0, %368 ], [ %416, %387 ]
  %378 = icmp ult i32 %377, 4
  br i1 %378, label %381, label %379

379:                                              ; preds = %376
  %380 = add nuw nsw i32 %312, 1, !spirv.Decorations !853
  br label %311

381:                                              ; preds = %376
  %382 = shl nuw nsw i32 %377, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %19)
  %383 = add nuw nsw i32 %382, %375, !spirv.Decorations !853
  br label %384

384:                                              ; preds = %417, %381
  %385 = phi i32 [ 0, %381 ], [ %424, %417 ]
  %386 = icmp ult i32 %385, 4
  br i1 %386, label %417, label %387

387:                                              ; preds = %384
  %388 = zext i32 %377 to i64
  %389 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %388
  %390 = load <4 x float>, ptr %389, align 16, !noalias !1007
  %391 = extractelement <4 x float> %390, i32 0
  %392 = extractelement <4 x float> %390, i32 1
  %393 = extractelement <4 x float> %390, i32 2
  %394 = extractelement <4 x float> %390, i32 3
  %395 = fmul reassoc nsz arcp contract float %391, %350, !spirv.Decorations !856
  %396 = fmul reassoc nsz arcp contract float %392, %350, !spirv.Decorations !856
  %397 = fmul reassoc nsz arcp contract float %393, %350, !spirv.Decorations !856
  %398 = fmul reassoc nsz arcp contract float %394, %350, !spirv.Decorations !856
  %399 = load <4 x float>, ptr %19, align 16, !noalias !1016
  %400 = extractelement <4 x float> %399, i32 0
  %401 = extractelement <4 x float> %399, i32 1
  %402 = extractelement <4 x float> %399, i32 2
  %403 = extractelement <4 x float> %399, i32 3
  %404 = fmul reassoc nsz arcp contract float %369, %400, !spirv.Decorations !856
  %405 = fmul reassoc nsz arcp contract float %369, %401, !spirv.Decorations !856
  %406 = fmul reassoc nsz arcp contract float %369, %402, !spirv.Decorations !856
  %407 = fmul reassoc nsz arcp contract float %369, %403, !spirv.Decorations !856
  %408 = fadd reassoc nsz arcp contract float %395, %404, !spirv.Decorations !856
  %409 = fadd reassoc nsz arcp contract float %396, %405, !spirv.Decorations !856
  %410 = fadd reassoc nsz arcp contract float %397, %406, !spirv.Decorations !856
  %411 = fadd reassoc nsz arcp contract float %398, %407, !spirv.Decorations !856
  %412 = insertelement <4 x float> undef, float %408, i32 0
  %413 = insertelement <4 x float> %412, float %409, i32 1
  %414 = insertelement <4 x float> %413, float %410, i32 2
  %415 = insertelement <4 x float> %414, float %411, i32 3
  store <4 x float> %415, ptr %389, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %19)
  %416 = add nuw nsw i32 %377, 1, !spirv.Decorations !853
  br label %376, !llvm.loop !1025

417:                                              ; preds = %384
  %418 = or i32 %383, %385
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE-ExtSLM, i64 %419
  %421 = load float, ptr addrspace(3) %420, align 4
  %422 = zext i32 %385 to i64
  %423 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %19, i64 0, i32 0, i64 %422
  store float %421, ptr %423, align 4
  %424 = add nuw nsw i32 %385, 1, !spirv.Decorations !853
  br label %384, !llvm.loop !1026

425:                                              ; preds = %436, %316
  %426 = phi i32 [ 0, %316 ], [ %437, %436 ]
  %427 = icmp ult i32 %426, 4
  br i1 %427, label %428, label %.loopexit

428:                                              ; preds = %425
  %429 = shl nuw nsw i32 %426, 6, !spirv.Decorations !853
  %430 = add nuw nsw i32 %429, %324, !spirv.Decorations !853
  %431 = zext i32 %426 to i64
  %432 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %431
  br label %433

433:                                              ; preds = %438, %428
  %434 = phi i32 [ 0, %428 ], [ %447, %438 ]
  %435 = icmp ult i32 %434, 4
  br i1 %435, label %438, label %436

436:                                              ; preds = %433
  %437 = add nuw nsw i32 %426, 1, !spirv.Decorations !853
  br label %425, !llvm.loop !1027

438:                                              ; preds = %433
  %439 = zext i32 %434 to i64
  %440 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %432, i64 0, i32 0, i64 %439
  %441 = load float, ptr %440, align 4
  %442 = fdiv reassoc nsz arcp contract float %441, %317
  %443 = fptrunc float %442 to half
  %444 = or i32 %430, %434
  %445 = zext i32 %444 to i64
  %446 = getelementptr inbounds half, ptr addrspace(1) %323, i64 %445
  store half %443, ptr addrspace(1) %446, align 2
  %447 = add nuw nsw i32 %434, 1, !spirv.Decorations !853
  br label %433, !llvm.loop !1028

.loopexit:                                        ; preds = %425
  br label %448

448:                                              ; preds = %.loopexit, %282
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 12
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 7, !spirv.Decorations !871
  %72 = sdiv i32 %71, 8
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = getelementptr float, ptr addrspace(1) %2, i64 %80
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.195, i64 16, i1 false)
  br label %76, !llvm.loop !1029

86:                                               ; preds = %94, %79
  %87 = phi i32 [ %101, %94 ], [ %73, %79 ]
  %88 = phi float [ %100, %94 ], [ 0xFFF0000000000000, %79 ]
  %89 = icmp slt i32 %87, %75
  br i1 %89, label %94, label %90

90:                                               ; preds = %86
  %91 = sext i32 %61 to i64
  %92 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !856
  %93 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %102

94:                                               ; preds = %86
  %95 = add nsw i32 %62, %87, !spirv.Decorations !871
  %96 = sext i32 %95 to i64
  %97 = shl nsw i64 %96, 6, !spirv.Decorations !871
  %98 = getelementptr float, ptr addrspace(1) %81, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = call float @llvm.maxnum.f32(float %88, float %99)
  %101 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

102:                                              ; preds = %142, %90
  %103 = phi i32 [ %143, %142 ], [ %73, %90 ]
  %104 = phi float [ %136, %142 ], [ 0.000000e+00, %90 ]
  %105 = icmp slt i32 %103, %75
  br i1 %105, label %108, label %106

106:                                              ; preds = %102
  %107 = icmp eq i16 %simdLaneId16, 0
  br i1 %107, label %184, label %188

108:                                              ; preds = %102
  %109 = add nsw i32 %62, %103, !spirv.Decorations !871
  %110 = sext i32 %109 to i64
  %111 = shl nsw i64 %110, 6, !spirv.Decorations !871
  %112 = add nsw i64 %111, %91, !spirv.Decorations !871
  %113 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %112
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fcmp reassoc nsz arcp contract oeq float %114, 0xFFF0000000000000, !spirv.Decorations !856
  %118 = or i1 %117, %92
  br i1 %118, label %133, label %119

119:                                              ; preds = %108
  %120 = fsub reassoc nsz arcp contract float %114, %88, !spirv.Decorations !856
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = call float @llvm.trunc.f32(float %121)
  %123 = call float @llvm.fma.f32(float %122, float 0xBFE62E4000000000, float %120)
  %124 = call float @llvm.fma.f32(float %122, float 0xBEB7F7D1C0000000, float %123)
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.exp2.f32(float %122)
  %127 = call float @llvm.exp2.f32(float %125)
  %128 = fmul float %126, %127
  %129 = fcmp olt float %120, -1.050000e+02
  %130 = select i1 %129, float 0.000000e+00, float %128
  %131 = fcmp ogt float %120, 1.050000e+02
  %132 = select i1 %131, float 0x7FF0000000000000, float %130
  br label %133

133:                                              ; preds = %119, %108
  %134 = phi float [ %132, %119 ], [ 0.000000e+00, %108 ]
  %135 = fmul reassoc nsz arcp contract float %134, %116, !spirv.Decorations !856
  %136 = fadd reassoc nsz arcp contract float %104, %135, !spirv.Decorations !856
  %137 = shl nsw i64 %112, 8, !spirv.Decorations !871
  %138 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %137
  br label %139

139:                                              ; preds = %158, %133
  %140 = phi i32 [ 0, %133 ], [ %183, %158 ]
  %141 = icmp ult i32 %140, 4
  br i1 %141, label %144, label %142

142:                                              ; preds = %139
  %143 = add nsw i32 %103, 1, !spirv.Decorations !871
  br label %102

144:                                              ; preds = %139
  %145 = shl nuw nsw i32 %140, 6, !spirv.Decorations !853
  %146 = add nuw nsw i32 %145, %93, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, ptr addrspace(1) %138, i64 %147
  br label %149

149:                                              ; preds = %152, %144
  %150 = phi i32 [ 0, %144 ], [ %157, %152 ]
  %151 = icmp ult i32 %150, 4
  br i1 %151, label %152, label %158

152:                                              ; preds = %149
  %153 = zext i32 %150 to i64
  %154 = getelementptr inbounds float, ptr addrspace(1) %148, i64 %153
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %153
  store float %155, ptr %156, align 4
  %157 = add nuw nsw i32 %150, 1, !spirv.Decorations !853
  br label %149

158:                                              ; preds = %149
  %159 = zext i32 %140 to i64
  %160 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %159
  %161 = load <4 x float>, ptr %160, align 16, !noalias !1030
  %162 = extractelement <4 x float> %161, i32 0
  %163 = extractelement <4 x float> %161, i32 1
  %164 = extractelement <4 x float> %161, i32 2
  %165 = extractelement <4 x float> %161, i32 3
  %166 = load <4 x float>, ptr %17, align 16, !noalias !1039
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %135, %167, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %135, %168, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %135, %169, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %135, %170, !spirv.Decorations !856
  %175 = fadd reassoc nsz arcp contract float %162, %171, !spirv.Decorations !856
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !856
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !856
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !856
  %179 = insertelement <4 x float> undef, float %175, i32 0
  %180 = insertelement <4 x float> %179, float %176, i32 1
  %181 = insertelement <4 x float> %180, float %177, i32 2
  %182 = insertelement <4 x float> %181, float %178, i32 3
  store <4 x float> %182, ptr %160, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %183 = add nuw nsw i32 %140, 1, !spirv.Decorations !853
  br label %139, !llvm.loop !1048

184:                                              ; preds = %106
  %185 = zext i8 %28 to i64
  %186 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM, i64 %185
  store float %88, ptr addrspace(3) %186, align 4
  %187 = getelementptr float, ptr addrspace(3) %186, i64 8
  store float %104, ptr addrspace(3) %187, align 4
  br label %188

188:                                              ; preds = %184, %106
  %189 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %190 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %191 = or i32 %190, 16
  %192 = add nuw nsw i32 %189, %191, !spirv.Decorations !853
  br label %193

193:                                              ; preds = %206, %188
  %194 = phi i32 [ 0, %188 ], [ %207, %206 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %197 = icmp eq i8 %28, 0
  br i1 %197, label %.preheader1, label %348

.preheader1:                                      ; preds = %196
  br label %216

198:                                              ; preds = %193
  %199 = shl nuw nsw i32 %194, 6, !spirv.Decorations !853
  %200 = zext i32 %194 to i64
  %201 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %200
  %202 = add nuw nsw i32 %199, %192, !spirv.Decorations !853
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %215, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %194, 1, !spirv.Decorations !853
  br label %193, !llvm.loop !1049

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %201, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = or i32 %202, %204
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM, i64 %213
  store float %211, ptr addrspace(3) %214, align 4
  %215 = add nuw nsw i32 %204, 1, !spirv.Decorations !853
  br label %203, !llvm.loop !1050

216:                                              ; preds = %219, %.preheader1
  %217 = phi i32 [ %222, %219 ], [ 0, %.preheader1 ]
  %218 = icmp ult i32 %217, 4
  br i1 %218, label %219, label %.preheader

.preheader:                                       ; preds = %216
  br label %223

219:                                              ; preds = %216
  %220 = zext i32 %217 to i64
  %221 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %220
  %222 = add nuw nsw i32 %217, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %221, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.196, i64 16, i1 false)
  br label %216, !llvm.loop !1051

223:                                              ; preds = %230, %.preheader
  %224 = phi i32 [ %235, %230 ], [ 0, %.preheader ]
  %225 = phi float [ %234, %230 ], [ 0xFFF0000000000000, %.preheader ]
  %226 = icmp ult i32 %224, 8
  br i1 %226, label %230, label %227

227:                                              ; preds = %223
  %228 = fcmp reassoc nsz arcp contract oeq float %225, 0xFFF0000000000000, !spirv.Decorations !856
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %236

230:                                              ; preds = %223
  %231 = zext i32 %224 to i64
  %232 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM, i64 %231
  %233 = load float, ptr addrspace(3) %232, align 4
  %234 = call float @llvm.maxnum.f32(float %225, float %233)
  %235 = add nuw nsw i32 %224, 1, !spirv.Decorations !853
  br label %223

236:                                              ; preds = %283, %227
  %237 = phi i32 [ %284, %283 ], [ 0, %227 ]
  %238 = phi float [ %276, %283 ], [ 0.000000e+00, %227 ]
  %239 = icmp ult i32 %237, 8
  br i1 %239, label %249, label %240

240:                                              ; preds = %236
  %241 = call float @llvm.maxnum.f32(float %238, float 0x3BC79CA100000000)
  %242 = mul nuw i32 %54, 12, !spirv.Decorations !904
  %243 = zext i32 %242 to i64
  %244 = sext i32 %56 to i64
  %245 = add nsw i64 %243, %244, !spirv.Decorations !871
  %246 = shl nsw i64 %245, 8, !spirv.Decorations !871
  %247 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %246
  %248 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %325

249:                                              ; preds = %236
  %250 = zext i32 %237 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM, i64 %250
  %252 = load float, ptr addrspace(3) %251, align 4
  %253 = zext i32 %237 to i64
  %254 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM, i64 0, i64 32
  %255 = getelementptr inbounds float, ptr addrspace(3) %254, i64 %253
  %256 = load float, ptr addrspace(3) %255, align 4
  %257 = fcmp reassoc nsz arcp contract oeq float %252, 0xFFF0000000000000, !spirv.Decorations !856
  %258 = or i1 %257, %228
  br i1 %258, label %273, label %259

259:                                              ; preds = %249
  %260 = fsub reassoc nsz arcp contract float %252, %225, !spirv.Decorations !856
  %261 = fmul float %260, 0x3FF7154760000000
  %262 = call float @llvm.trunc.f32(float %261)
  %263 = call float @llvm.fma.f32(float %262, float 0xBFE62E4000000000, float %260)
  %264 = call float @llvm.fma.f32(float %262, float 0xBEB7F7D1C0000000, float %263)
  %265 = fmul float %264, 0x3FF7154760000000
  %266 = call float @llvm.exp2.f32(float %262)
  %267 = call float @llvm.exp2.f32(float %265)
  %268 = fmul float %266, %267
  %269 = fcmp olt float %260, -1.050000e+02
  %270 = select i1 %269, float 0.000000e+00, float %268
  %271 = fcmp ogt float %260, 1.050000e+02
  %272 = select i1 %271, float 0x7FF0000000000000, float %270
  br label %273

273:                                              ; preds = %259, %249
  %274 = phi float [ %272, %259 ], [ 0.000000e+00, %249 ]
  %275 = fmul reassoc nsz arcp contract float %274, %256, !spirv.Decorations !856
  %276 = fadd reassoc nsz arcp contract float %238, %275, !spirv.Decorations !856
  %277 = shl nuw nsw i32 %237, 8, !spirv.Decorations !853
  %278 = or i32 %277, 16
  %279 = add nuw nsw i32 %229, %278, !spirv.Decorations !853
  br label %280

280:                                              ; preds = %291, %273
  %281 = phi i32 [ 0, %273 ], [ %316, %291 ]
  %282 = icmp ult i32 %281, 4
  br i1 %282, label %285, label %283

283:                                              ; preds = %280
  %284 = add nuw nsw i32 %237, 1, !spirv.Decorations !853
  br label %236

285:                                              ; preds = %280
  %286 = shl nuw nsw i32 %281, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %287 = add nuw nsw i32 %286, %279, !spirv.Decorations !853
  br label %288

288:                                              ; preds = %317, %285
  %289 = phi i32 [ 0, %285 ], [ %324, %317 ]
  %290 = icmp ult i32 %289, 4
  br i1 %290, label %317, label %291

291:                                              ; preds = %288
  %292 = zext i32 %281 to i64
  %293 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %292
  %294 = load <4 x float>, ptr %293, align 16, !noalias !1052
  %295 = extractelement <4 x float> %294, i32 0
  %296 = extractelement <4 x float> %294, i32 1
  %297 = extractelement <4 x float> %294, i32 2
  %298 = extractelement <4 x float> %294, i32 3
  %299 = load <4 x float>, ptr %18, align 16, !noalias !1061
  %300 = extractelement <4 x float> %299, i32 0
  %301 = extractelement <4 x float> %299, i32 1
  %302 = extractelement <4 x float> %299, i32 2
  %303 = extractelement <4 x float> %299, i32 3
  %304 = fmul reassoc nsz arcp contract float %274, %300, !spirv.Decorations !856
  %305 = fmul reassoc nsz arcp contract float %274, %301, !spirv.Decorations !856
  %306 = fmul reassoc nsz arcp contract float %274, %302, !spirv.Decorations !856
  %307 = fmul reassoc nsz arcp contract float %274, %303, !spirv.Decorations !856
  %308 = fadd reassoc nsz arcp contract float %295, %304, !spirv.Decorations !856
  %309 = fadd reassoc nsz arcp contract float %296, %305, !spirv.Decorations !856
  %310 = fadd reassoc nsz arcp contract float %297, %306, !spirv.Decorations !856
  %311 = fadd reassoc nsz arcp contract float %298, %307, !spirv.Decorations !856
  %312 = insertelement <4 x float> undef, float %308, i32 0
  %313 = insertelement <4 x float> %312, float %309, i32 1
  %314 = insertelement <4 x float> %313, float %310, i32 2
  %315 = insertelement <4 x float> %314, float %311, i32 3
  store <4 x float> %315, ptr %293, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %316 = add nuw nsw i32 %281, 1, !spirv.Decorations !853
  br label %280, !llvm.loop !1070

317:                                              ; preds = %288
  %318 = or i32 %287, %289
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM, i64 %319
  %321 = load float, ptr addrspace(3) %320, align 4
  %322 = zext i32 %289 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %322
  store float %321, ptr %323, align 4
  %324 = add nuw nsw i32 %289, 1, !spirv.Decorations !853
  br label %288, !llvm.loop !1071

325:                                              ; preds = %336, %240
  %326 = phi i32 [ 0, %240 ], [ %337, %336 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %328, label %.loopexit

328:                                              ; preds = %325
  %329 = shl nuw nsw i32 %326, 6, !spirv.Decorations !853
  %330 = add nuw nsw i32 %329, %248, !spirv.Decorations !853
  %331 = zext i32 %326 to i64
  %332 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %331
  br label %333

333:                                              ; preds = %338, %328
  %334 = phi i32 [ 0, %328 ], [ %347, %338 ]
  %335 = icmp ult i32 %334, 4
  br i1 %335, label %338, label %336

336:                                              ; preds = %333
  %337 = add nuw nsw i32 %326, 1, !spirv.Decorations !853
  br label %325, !llvm.loop !1072

338:                                              ; preds = %333
  %339 = zext i32 %334 to i64
  %340 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %332, i64 0, i32 0, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = fdiv reassoc nsz arcp contract float %341, %241
  %343 = fptrunc float %342 to half
  %344 = or i32 %330, %334
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds half, ptr addrspace(1) %247, i64 %345
  store half %343, ptr addrspace(1) %346, align 2
  %347 = add nuw nsw i32 %334, 1, !spirv.Decorations !853
  br label %333, !llvm.loop !1073

.loopexit:                                        ; preds = %325
  br label %348

348:                                              ; preds = %.loopexit, %196
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 12
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 15, !spirv.Decorations !871
  %72 = sdiv i32 %71, 16
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = getelementptr float, ptr addrspace(1) %2, i64 %80
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.197, i64 16, i1 false)
  br label %76, !llvm.loop !1074

86:                                               ; preds = %94, %79
  %87 = phi i32 [ %101, %94 ], [ %73, %79 ]
  %88 = phi float [ %100, %94 ], [ 0xFFF0000000000000, %79 ]
  %89 = icmp slt i32 %87, %75
  br i1 %89, label %94, label %90

90:                                               ; preds = %86
  %91 = sext i32 %61 to i64
  %92 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !856
  %93 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %102

94:                                               ; preds = %86
  %95 = add nsw i32 %62, %87, !spirv.Decorations !871
  %96 = sext i32 %95 to i64
  %97 = shl nsw i64 %96, 6, !spirv.Decorations !871
  %98 = getelementptr float, ptr addrspace(1) %81, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = call float @llvm.maxnum.f32(float %88, float %99)
  %101 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

102:                                              ; preds = %142, %90
  %103 = phi i32 [ %143, %142 ], [ %73, %90 ]
  %104 = phi float [ %136, %142 ], [ 0.000000e+00, %90 ]
  %105 = icmp slt i32 %103, %75
  br i1 %105, label %108, label %106

106:                                              ; preds = %102
  %107 = icmp eq i16 %simdLaneId16, 0
  br i1 %107, label %184, label %188

108:                                              ; preds = %102
  %109 = add nsw i32 %62, %103, !spirv.Decorations !871
  %110 = sext i32 %109 to i64
  %111 = shl nsw i64 %110, 6, !spirv.Decorations !871
  %112 = add nsw i64 %111, %91, !spirv.Decorations !871
  %113 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %112
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fcmp reassoc nsz arcp contract oeq float %114, 0xFFF0000000000000, !spirv.Decorations !856
  %118 = or i1 %117, %92
  br i1 %118, label %133, label %119

119:                                              ; preds = %108
  %120 = fsub reassoc nsz arcp contract float %114, %88, !spirv.Decorations !856
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = call float @llvm.trunc.f32(float %121)
  %123 = call float @llvm.fma.f32(float %122, float 0xBFE62E4000000000, float %120)
  %124 = call float @llvm.fma.f32(float %122, float 0xBEB7F7D1C0000000, float %123)
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.exp2.f32(float %122)
  %127 = call float @llvm.exp2.f32(float %125)
  %128 = fmul float %126, %127
  %129 = fcmp olt float %120, -1.050000e+02
  %130 = select i1 %129, float 0.000000e+00, float %128
  %131 = fcmp ogt float %120, 1.050000e+02
  %132 = select i1 %131, float 0x7FF0000000000000, float %130
  br label %133

133:                                              ; preds = %119, %108
  %134 = phi float [ %132, %119 ], [ 0.000000e+00, %108 ]
  %135 = fmul reassoc nsz arcp contract float %134, %116, !spirv.Decorations !856
  %136 = fadd reassoc nsz arcp contract float %104, %135, !spirv.Decorations !856
  %137 = shl nsw i64 %112, 8, !spirv.Decorations !871
  %138 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %137
  br label %139

139:                                              ; preds = %158, %133
  %140 = phi i32 [ 0, %133 ], [ %183, %158 ]
  %141 = icmp ult i32 %140, 4
  br i1 %141, label %144, label %142

142:                                              ; preds = %139
  %143 = add nsw i32 %103, 1, !spirv.Decorations !871
  br label %102

144:                                              ; preds = %139
  %145 = shl nuw nsw i32 %140, 6, !spirv.Decorations !853
  %146 = add nuw nsw i32 %145, %93, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, ptr addrspace(1) %138, i64 %147
  br label %149

149:                                              ; preds = %152, %144
  %150 = phi i32 [ 0, %144 ], [ %157, %152 ]
  %151 = icmp ult i32 %150, 4
  br i1 %151, label %152, label %158

152:                                              ; preds = %149
  %153 = zext i32 %150 to i64
  %154 = getelementptr inbounds float, ptr addrspace(1) %148, i64 %153
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %153
  store float %155, ptr %156, align 4
  %157 = add nuw nsw i32 %150, 1, !spirv.Decorations !853
  br label %149

158:                                              ; preds = %149
  %159 = zext i32 %140 to i64
  %160 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %159
  %161 = load <4 x float>, ptr %160, align 16, !noalias !1075
  %162 = extractelement <4 x float> %161, i32 0
  %163 = extractelement <4 x float> %161, i32 1
  %164 = extractelement <4 x float> %161, i32 2
  %165 = extractelement <4 x float> %161, i32 3
  %166 = load <4 x float>, ptr %17, align 16, !noalias !1084
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %135, %167, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %135, %168, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %135, %169, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %135, %170, !spirv.Decorations !856
  %175 = fadd reassoc nsz arcp contract float %162, %171, !spirv.Decorations !856
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !856
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !856
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !856
  %179 = insertelement <4 x float> undef, float %175, i32 0
  %180 = insertelement <4 x float> %179, float %176, i32 1
  %181 = insertelement <4 x float> %180, float %177, i32 2
  %182 = insertelement <4 x float> %181, float %178, i32 3
  store <4 x float> %182, ptr %160, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %183 = add nuw nsw i32 %140, 1, !spirv.Decorations !853
  br label %139, !llvm.loop !1093

184:                                              ; preds = %106
  %185 = zext i8 %28 to i64
  %186 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM, i64 %185
  store float %88, ptr addrspace(3) %186, align 4
  %187 = getelementptr float, ptr addrspace(3) %186, i64 16
  store float %104, ptr addrspace(3) %187, align 4
  br label %188

188:                                              ; preds = %184, %106
  %189 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %190 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %191 = or i32 %190, 32
  %192 = add nuw nsw i32 %189, %191, !spirv.Decorations !853
  br label %193

193:                                              ; preds = %206, %188
  %194 = phi i32 [ 0, %188 ], [ %207, %206 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %197 = icmp eq i8 %28, 0
  br i1 %197, label %.preheader1, label %348

.preheader1:                                      ; preds = %196
  br label %216

198:                                              ; preds = %193
  %199 = shl nuw nsw i32 %194, 6, !spirv.Decorations !853
  %200 = zext i32 %194 to i64
  %201 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %200
  %202 = add nuw nsw i32 %199, %192, !spirv.Decorations !853
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %215, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %194, 1, !spirv.Decorations !853
  br label %193, !llvm.loop !1094

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %201, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = or i32 %202, %204
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM, i64 %213
  store float %211, ptr addrspace(3) %214, align 4
  %215 = add nuw nsw i32 %204, 1, !spirv.Decorations !853
  br label %203, !llvm.loop !1095

216:                                              ; preds = %219, %.preheader1
  %217 = phi i32 [ %222, %219 ], [ 0, %.preheader1 ]
  %218 = icmp ult i32 %217, 4
  br i1 %218, label %219, label %.preheader

.preheader:                                       ; preds = %216
  br label %223

219:                                              ; preds = %216
  %220 = zext i32 %217 to i64
  %221 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %220
  %222 = add nuw nsw i32 %217, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %221, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.198, i64 16, i1 false)
  br label %216, !llvm.loop !1096

223:                                              ; preds = %230, %.preheader
  %224 = phi i32 [ %235, %230 ], [ 0, %.preheader ]
  %225 = phi float [ %234, %230 ], [ 0xFFF0000000000000, %.preheader ]
  %226 = icmp ult i32 %224, 16
  br i1 %226, label %230, label %227

227:                                              ; preds = %223
  %228 = fcmp reassoc nsz arcp contract oeq float %225, 0xFFF0000000000000, !spirv.Decorations !856
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %236

230:                                              ; preds = %223
  %231 = zext i32 %224 to i64
  %232 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM, i64 %231
  %233 = load float, ptr addrspace(3) %232, align 4
  %234 = call float @llvm.maxnum.f32(float %225, float %233)
  %235 = add nuw nsw i32 %224, 1, !spirv.Decorations !853
  br label %223

236:                                              ; preds = %283, %227
  %237 = phi i32 [ %284, %283 ], [ 0, %227 ]
  %238 = phi float [ %276, %283 ], [ 0.000000e+00, %227 ]
  %239 = icmp ult i32 %237, 16
  br i1 %239, label %249, label %240

240:                                              ; preds = %236
  %241 = call float @llvm.maxnum.f32(float %238, float 0x3BC79CA100000000)
  %242 = mul nuw i32 %54, 12, !spirv.Decorations !904
  %243 = zext i32 %242 to i64
  %244 = sext i32 %56 to i64
  %245 = add nsw i64 %243, %244, !spirv.Decorations !871
  %246 = shl nsw i64 %245, 8, !spirv.Decorations !871
  %247 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %246
  %248 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %325

249:                                              ; preds = %236
  %250 = zext i32 %237 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM, i64 %250
  %252 = load float, ptr addrspace(3) %251, align 4
  %253 = zext i32 %237 to i64
  %254 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM, i64 0, i64 64
  %255 = getelementptr inbounds float, ptr addrspace(3) %254, i64 %253
  %256 = load float, ptr addrspace(3) %255, align 4
  %257 = fcmp reassoc nsz arcp contract oeq float %252, 0xFFF0000000000000, !spirv.Decorations !856
  %258 = or i1 %257, %228
  br i1 %258, label %273, label %259

259:                                              ; preds = %249
  %260 = fsub reassoc nsz arcp contract float %252, %225, !spirv.Decorations !856
  %261 = fmul float %260, 0x3FF7154760000000
  %262 = call float @llvm.trunc.f32(float %261)
  %263 = call float @llvm.fma.f32(float %262, float 0xBFE62E4000000000, float %260)
  %264 = call float @llvm.fma.f32(float %262, float 0xBEB7F7D1C0000000, float %263)
  %265 = fmul float %264, 0x3FF7154760000000
  %266 = call float @llvm.exp2.f32(float %262)
  %267 = call float @llvm.exp2.f32(float %265)
  %268 = fmul float %266, %267
  %269 = fcmp olt float %260, -1.050000e+02
  %270 = select i1 %269, float 0.000000e+00, float %268
  %271 = fcmp ogt float %260, 1.050000e+02
  %272 = select i1 %271, float 0x7FF0000000000000, float %270
  br label %273

273:                                              ; preds = %259, %249
  %274 = phi float [ %272, %259 ], [ 0.000000e+00, %249 ]
  %275 = fmul reassoc nsz arcp contract float %274, %256, !spirv.Decorations !856
  %276 = fadd reassoc nsz arcp contract float %238, %275, !spirv.Decorations !856
  %277 = shl nuw nsw i32 %237, 8, !spirv.Decorations !853
  %278 = or i32 %277, 32
  %279 = add nuw nsw i32 %229, %278, !spirv.Decorations !853
  br label %280

280:                                              ; preds = %291, %273
  %281 = phi i32 [ 0, %273 ], [ %316, %291 ]
  %282 = icmp ult i32 %281, 4
  br i1 %282, label %285, label %283

283:                                              ; preds = %280
  %284 = add nuw nsw i32 %237, 1, !spirv.Decorations !853
  br label %236

285:                                              ; preds = %280
  %286 = shl nuw nsw i32 %281, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %287 = add nuw nsw i32 %286, %279, !spirv.Decorations !853
  br label %288

288:                                              ; preds = %317, %285
  %289 = phi i32 [ 0, %285 ], [ %324, %317 ]
  %290 = icmp ult i32 %289, 4
  br i1 %290, label %317, label %291

291:                                              ; preds = %288
  %292 = zext i32 %281 to i64
  %293 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %292
  %294 = load <4 x float>, ptr %293, align 16, !noalias !1097
  %295 = extractelement <4 x float> %294, i32 0
  %296 = extractelement <4 x float> %294, i32 1
  %297 = extractelement <4 x float> %294, i32 2
  %298 = extractelement <4 x float> %294, i32 3
  %299 = load <4 x float>, ptr %18, align 16, !noalias !1106
  %300 = extractelement <4 x float> %299, i32 0
  %301 = extractelement <4 x float> %299, i32 1
  %302 = extractelement <4 x float> %299, i32 2
  %303 = extractelement <4 x float> %299, i32 3
  %304 = fmul reassoc nsz arcp contract float %274, %300, !spirv.Decorations !856
  %305 = fmul reassoc nsz arcp contract float %274, %301, !spirv.Decorations !856
  %306 = fmul reassoc nsz arcp contract float %274, %302, !spirv.Decorations !856
  %307 = fmul reassoc nsz arcp contract float %274, %303, !spirv.Decorations !856
  %308 = fadd reassoc nsz arcp contract float %295, %304, !spirv.Decorations !856
  %309 = fadd reassoc nsz arcp contract float %296, %305, !spirv.Decorations !856
  %310 = fadd reassoc nsz arcp contract float %297, %306, !spirv.Decorations !856
  %311 = fadd reassoc nsz arcp contract float %298, %307, !spirv.Decorations !856
  %312 = insertelement <4 x float> undef, float %308, i32 0
  %313 = insertelement <4 x float> %312, float %309, i32 1
  %314 = insertelement <4 x float> %313, float %310, i32 2
  %315 = insertelement <4 x float> %314, float %311, i32 3
  store <4 x float> %315, ptr %293, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %316 = add nuw nsw i32 %281, 1, !spirv.Decorations !853
  br label %280, !llvm.loop !1115

317:                                              ; preds = %288
  %318 = or i32 %287, %289
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM, i64 %319
  %321 = load float, ptr addrspace(3) %320, align 4
  %322 = zext i32 %289 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %322
  store float %321, ptr %323, align 4
  %324 = add nuw nsw i32 %289, 1, !spirv.Decorations !853
  br label %288, !llvm.loop !1116

325:                                              ; preds = %336, %240
  %326 = phi i32 [ 0, %240 ], [ %337, %336 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %328, label %.loopexit

328:                                              ; preds = %325
  %329 = shl nuw nsw i32 %326, 6, !spirv.Decorations !853
  %330 = add nuw nsw i32 %329, %248, !spirv.Decorations !853
  %331 = zext i32 %326 to i64
  %332 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %331
  br label %333

333:                                              ; preds = %338, %328
  %334 = phi i32 [ 0, %328 ], [ %347, %338 ]
  %335 = icmp ult i32 %334, 4
  br i1 %335, label %338, label %336

336:                                              ; preds = %333
  %337 = add nuw nsw i32 %326, 1, !spirv.Decorations !853
  br label %325, !llvm.loop !1117

338:                                              ; preds = %333
  %339 = zext i32 %334 to i64
  %340 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %332, i64 0, i32 0, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = fdiv reassoc nsz arcp contract float %341, %241
  %343 = fptrunc float %342 to half
  %344 = or i32 %330, %334
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds half, ptr addrspace(1) %247, i64 %345
  store half %343, ptr addrspace(1) %346, align 2
  %347 = add nuw nsw i32 %334, 1, !spirv.Decorations !853
  br label %333, !llvm.loop !1118

.loopexit:                                        ; preds = %325
  br label %348

348:                                              ; preds = %.loopexit, %196
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 12
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 31, !spirv.Decorations !871
  %72 = sdiv i32 %71, 32
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = getelementptr float, ptr addrspace(1) %2, i64 %80
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.199, i64 16, i1 false)
  br label %76, !llvm.loop !1119

86:                                               ; preds = %94, %79
  %87 = phi i32 [ %101, %94 ], [ %73, %79 ]
  %88 = phi float [ %100, %94 ], [ 0xFFF0000000000000, %79 ]
  %89 = icmp slt i32 %87, %75
  br i1 %89, label %94, label %90

90:                                               ; preds = %86
  %91 = sext i32 %61 to i64
  %92 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !856
  %93 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %102

94:                                               ; preds = %86
  %95 = add nsw i32 %62, %87, !spirv.Decorations !871
  %96 = sext i32 %95 to i64
  %97 = shl nsw i64 %96, 6, !spirv.Decorations !871
  %98 = getelementptr float, ptr addrspace(1) %81, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = call float @llvm.maxnum.f32(float %88, float %99)
  %101 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

102:                                              ; preds = %142, %90
  %103 = phi i32 [ %143, %142 ], [ %73, %90 ]
  %104 = phi float [ %136, %142 ], [ 0.000000e+00, %90 ]
  %105 = icmp slt i32 %103, %75
  br i1 %105, label %108, label %106

106:                                              ; preds = %102
  %107 = icmp eq i16 %simdLaneId16, 0
  br i1 %107, label %184, label %188

108:                                              ; preds = %102
  %109 = add nsw i32 %62, %103, !spirv.Decorations !871
  %110 = sext i32 %109 to i64
  %111 = shl nsw i64 %110, 6, !spirv.Decorations !871
  %112 = add nsw i64 %111, %91, !spirv.Decorations !871
  %113 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %112
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fcmp reassoc nsz arcp contract oeq float %114, 0xFFF0000000000000, !spirv.Decorations !856
  %118 = or i1 %117, %92
  br i1 %118, label %133, label %119

119:                                              ; preds = %108
  %120 = fsub reassoc nsz arcp contract float %114, %88, !spirv.Decorations !856
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = call float @llvm.trunc.f32(float %121)
  %123 = call float @llvm.fma.f32(float %122, float 0xBFE62E4000000000, float %120)
  %124 = call float @llvm.fma.f32(float %122, float 0xBEB7F7D1C0000000, float %123)
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.exp2.f32(float %122)
  %127 = call float @llvm.exp2.f32(float %125)
  %128 = fmul float %126, %127
  %129 = fcmp olt float %120, -1.050000e+02
  %130 = select i1 %129, float 0.000000e+00, float %128
  %131 = fcmp ogt float %120, 1.050000e+02
  %132 = select i1 %131, float 0x7FF0000000000000, float %130
  br label %133

133:                                              ; preds = %119, %108
  %134 = phi float [ %132, %119 ], [ 0.000000e+00, %108 ]
  %135 = fmul reassoc nsz arcp contract float %134, %116, !spirv.Decorations !856
  %136 = fadd reassoc nsz arcp contract float %104, %135, !spirv.Decorations !856
  %137 = shl nsw i64 %112, 8, !spirv.Decorations !871
  %138 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %137
  br label %139

139:                                              ; preds = %158, %133
  %140 = phi i32 [ 0, %133 ], [ %183, %158 ]
  %141 = icmp ult i32 %140, 4
  br i1 %141, label %144, label %142

142:                                              ; preds = %139
  %143 = add nsw i32 %103, 1, !spirv.Decorations !871
  br label %102

144:                                              ; preds = %139
  %145 = shl nuw nsw i32 %140, 6, !spirv.Decorations !853
  %146 = add nuw nsw i32 %145, %93, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, ptr addrspace(1) %138, i64 %147
  br label %149

149:                                              ; preds = %152, %144
  %150 = phi i32 [ 0, %144 ], [ %157, %152 ]
  %151 = icmp ult i32 %150, 4
  br i1 %151, label %152, label %158

152:                                              ; preds = %149
  %153 = zext i32 %150 to i64
  %154 = getelementptr inbounds float, ptr addrspace(1) %148, i64 %153
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %153
  store float %155, ptr %156, align 4
  %157 = add nuw nsw i32 %150, 1, !spirv.Decorations !853
  br label %149

158:                                              ; preds = %149
  %159 = zext i32 %140 to i64
  %160 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %159
  %161 = load <4 x float>, ptr %160, align 16, !noalias !1120
  %162 = extractelement <4 x float> %161, i32 0
  %163 = extractelement <4 x float> %161, i32 1
  %164 = extractelement <4 x float> %161, i32 2
  %165 = extractelement <4 x float> %161, i32 3
  %166 = load <4 x float>, ptr %17, align 16, !noalias !1129
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %135, %167, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %135, %168, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %135, %169, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %135, %170, !spirv.Decorations !856
  %175 = fadd reassoc nsz arcp contract float %162, %171, !spirv.Decorations !856
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !856
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !856
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !856
  %179 = insertelement <4 x float> undef, float %175, i32 0
  %180 = insertelement <4 x float> %179, float %176, i32 1
  %181 = insertelement <4 x float> %180, float %177, i32 2
  %182 = insertelement <4 x float> %181, float %178, i32 3
  store <4 x float> %182, ptr %160, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %183 = add nuw nsw i32 %140, 1, !spirv.Decorations !853
  br label %139, !llvm.loop !1138

184:                                              ; preds = %106
  %185 = zext i8 %28 to i64
  %186 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM, i64 %185
  store float %88, ptr addrspace(3) %186, align 4
  %187 = getelementptr float, ptr addrspace(3) %186, i64 32
  store float %104, ptr addrspace(3) %187, align 4
  br label %188

188:                                              ; preds = %184, %106
  %189 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %190 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %191 = or i32 %190, 64
  %192 = add nuw nsw i32 %189, %191, !spirv.Decorations !853
  br label %193

193:                                              ; preds = %206, %188
  %194 = phi i32 [ 0, %188 ], [ %207, %206 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %197 = icmp eq i8 %28, 0
  br i1 %197, label %.preheader1, label %348

.preheader1:                                      ; preds = %196
  br label %216

198:                                              ; preds = %193
  %199 = shl nuw nsw i32 %194, 6, !spirv.Decorations !853
  %200 = zext i32 %194 to i64
  %201 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %200
  %202 = add nuw nsw i32 %199, %192, !spirv.Decorations !853
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %215, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %194, 1, !spirv.Decorations !853
  br label %193, !llvm.loop !1139

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %201, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = or i32 %202, %204
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM, i64 %213
  store float %211, ptr addrspace(3) %214, align 4
  %215 = add nuw nsw i32 %204, 1, !spirv.Decorations !853
  br label %203, !llvm.loop !1140

216:                                              ; preds = %219, %.preheader1
  %217 = phi i32 [ %222, %219 ], [ 0, %.preheader1 ]
  %218 = icmp ult i32 %217, 4
  br i1 %218, label %219, label %.preheader

.preheader:                                       ; preds = %216
  br label %223

219:                                              ; preds = %216
  %220 = zext i32 %217 to i64
  %221 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %220
  %222 = add nuw nsw i32 %217, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %221, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.200, i64 16, i1 false)
  br label %216, !llvm.loop !1141

223:                                              ; preds = %230, %.preheader
  %224 = phi i32 [ %235, %230 ], [ 0, %.preheader ]
  %225 = phi float [ %234, %230 ], [ 0xFFF0000000000000, %.preheader ]
  %226 = icmp ult i32 %224, 32
  br i1 %226, label %230, label %227

227:                                              ; preds = %223
  %228 = fcmp reassoc nsz arcp contract oeq float %225, 0xFFF0000000000000, !spirv.Decorations !856
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %236

230:                                              ; preds = %223
  %231 = zext i32 %224 to i64
  %232 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM, i64 %231
  %233 = load float, ptr addrspace(3) %232, align 4
  %234 = call float @llvm.maxnum.f32(float %225, float %233)
  %235 = add nuw nsw i32 %224, 1, !spirv.Decorations !853
  br label %223

236:                                              ; preds = %283, %227
  %237 = phi i32 [ %284, %283 ], [ 0, %227 ]
  %238 = phi float [ %276, %283 ], [ 0.000000e+00, %227 ]
  %239 = icmp ult i32 %237, 32
  br i1 %239, label %249, label %240

240:                                              ; preds = %236
  %241 = call float @llvm.maxnum.f32(float %238, float 0x3BC79CA100000000)
  %242 = mul nuw i32 %54, 12, !spirv.Decorations !904
  %243 = zext i32 %242 to i64
  %244 = sext i32 %56 to i64
  %245 = add nsw i64 %243, %244, !spirv.Decorations !871
  %246 = shl nsw i64 %245, 8, !spirv.Decorations !871
  %247 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %246
  %248 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %325

249:                                              ; preds = %236
  %250 = zext i32 %237 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM, i64 %250
  %252 = load float, ptr addrspace(3) %251, align 4
  %253 = zext i32 %237 to i64
  %254 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM, i64 0, i64 128
  %255 = getelementptr inbounds float, ptr addrspace(3) %254, i64 %253
  %256 = load float, ptr addrspace(3) %255, align 4
  %257 = fcmp reassoc nsz arcp contract oeq float %252, 0xFFF0000000000000, !spirv.Decorations !856
  %258 = or i1 %257, %228
  br i1 %258, label %273, label %259

259:                                              ; preds = %249
  %260 = fsub reassoc nsz arcp contract float %252, %225, !spirv.Decorations !856
  %261 = fmul float %260, 0x3FF7154760000000
  %262 = call float @llvm.trunc.f32(float %261)
  %263 = call float @llvm.fma.f32(float %262, float 0xBFE62E4000000000, float %260)
  %264 = call float @llvm.fma.f32(float %262, float 0xBEB7F7D1C0000000, float %263)
  %265 = fmul float %264, 0x3FF7154760000000
  %266 = call float @llvm.exp2.f32(float %262)
  %267 = call float @llvm.exp2.f32(float %265)
  %268 = fmul float %266, %267
  %269 = fcmp olt float %260, -1.050000e+02
  %270 = select i1 %269, float 0.000000e+00, float %268
  %271 = fcmp ogt float %260, 1.050000e+02
  %272 = select i1 %271, float 0x7FF0000000000000, float %270
  br label %273

273:                                              ; preds = %259, %249
  %274 = phi float [ %272, %259 ], [ 0.000000e+00, %249 ]
  %275 = fmul reassoc nsz arcp contract float %274, %256, !spirv.Decorations !856
  %276 = fadd reassoc nsz arcp contract float %238, %275, !spirv.Decorations !856
  %277 = shl nuw nsw i32 %237, 8, !spirv.Decorations !853
  %278 = or i32 %277, 64
  %279 = add nuw nsw i32 %229, %278, !spirv.Decorations !853
  br label %280

280:                                              ; preds = %291, %273
  %281 = phi i32 [ 0, %273 ], [ %316, %291 ]
  %282 = icmp ult i32 %281, 4
  br i1 %282, label %285, label %283

283:                                              ; preds = %280
  %284 = add nuw nsw i32 %237, 1, !spirv.Decorations !853
  br label %236

285:                                              ; preds = %280
  %286 = shl nuw nsw i32 %281, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %287 = add nuw nsw i32 %286, %279, !spirv.Decorations !853
  br label %288

288:                                              ; preds = %317, %285
  %289 = phi i32 [ 0, %285 ], [ %324, %317 ]
  %290 = icmp ult i32 %289, 4
  br i1 %290, label %317, label %291

291:                                              ; preds = %288
  %292 = zext i32 %281 to i64
  %293 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %292
  %294 = load <4 x float>, ptr %293, align 16, !noalias !1142
  %295 = extractelement <4 x float> %294, i32 0
  %296 = extractelement <4 x float> %294, i32 1
  %297 = extractelement <4 x float> %294, i32 2
  %298 = extractelement <4 x float> %294, i32 3
  %299 = load <4 x float>, ptr %18, align 16, !noalias !1151
  %300 = extractelement <4 x float> %299, i32 0
  %301 = extractelement <4 x float> %299, i32 1
  %302 = extractelement <4 x float> %299, i32 2
  %303 = extractelement <4 x float> %299, i32 3
  %304 = fmul reassoc nsz arcp contract float %274, %300, !spirv.Decorations !856
  %305 = fmul reassoc nsz arcp contract float %274, %301, !spirv.Decorations !856
  %306 = fmul reassoc nsz arcp contract float %274, %302, !spirv.Decorations !856
  %307 = fmul reassoc nsz arcp contract float %274, %303, !spirv.Decorations !856
  %308 = fadd reassoc nsz arcp contract float %295, %304, !spirv.Decorations !856
  %309 = fadd reassoc nsz arcp contract float %296, %305, !spirv.Decorations !856
  %310 = fadd reassoc nsz arcp contract float %297, %306, !spirv.Decorations !856
  %311 = fadd reassoc nsz arcp contract float %298, %307, !spirv.Decorations !856
  %312 = insertelement <4 x float> undef, float %308, i32 0
  %313 = insertelement <4 x float> %312, float %309, i32 1
  %314 = insertelement <4 x float> %313, float %310, i32 2
  %315 = insertelement <4 x float> %314, float %311, i32 3
  store <4 x float> %315, ptr %293, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %316 = add nuw nsw i32 %281, 1, !spirv.Decorations !853
  br label %280, !llvm.loop !1160

317:                                              ; preds = %288
  %318 = or i32 %287, %289
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM, i64 %319
  %321 = load float, ptr addrspace(3) %320, align 4
  %322 = zext i32 %289 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %322
  store float %321, ptr %323, align 4
  %324 = add nuw nsw i32 %289, 1, !spirv.Decorations !853
  br label %288, !llvm.loop !1161

325:                                              ; preds = %336, %240
  %326 = phi i32 [ 0, %240 ], [ %337, %336 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %328, label %.loopexit

328:                                              ; preds = %325
  %329 = shl nuw nsw i32 %326, 6, !spirv.Decorations !853
  %330 = add nuw nsw i32 %329, %248, !spirv.Decorations !853
  %331 = zext i32 %326 to i64
  %332 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %331
  br label %333

333:                                              ; preds = %338, %328
  %334 = phi i32 [ 0, %328 ], [ %347, %338 ]
  %335 = icmp ult i32 %334, 4
  br i1 %335, label %338, label %336

336:                                              ; preds = %333
  %337 = add nuw nsw i32 %326, 1, !spirv.Decorations !853
  br label %325, !llvm.loop !1162

338:                                              ; preds = %333
  %339 = zext i32 %334 to i64
  %340 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %332, i64 0, i32 0, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = fdiv reassoc nsz arcp contract float %341, %241
  %343 = fptrunc float %342 to half
  %344 = or i32 %330, %334
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds half, ptr addrspace(1) %247, i64 %345
  store half %343, ptr addrspace(1) %346, align 2
  %347 = add nuw nsw i32 %334, 1, !spirv.Decorations !853
  br label %333, !llvm.loop !1163

.loopexit:                                        ; preds = %325
  br label %348

348:                                              ; preds = %.loopexit, %196
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 12
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 7, !spirv.Decorations !871
  %72 = sdiv i32 %71, 8
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.201, i64 16, i1 false)
  br label %76, !llvm.loop !1164

86:                                               ; preds = %147, %79
  %87 = phi i32 [ %148, %147 ], [ %73, %79 ]
  %88 = phi float [ %141, %147 ], [ 0.000000e+00, %79 ]
  %89 = phi float [ %102, %147 ], [ 0xFFF0000000000000, %79 ]
  %90 = icmp slt i32 %87, %75
  br i1 %90, label %93, label %91

91:                                               ; preds = %86
  %92 = icmp eq i16 %simdLaneId16, 0
  br i1 %92, label %193, label %197

93:                                               ; preds = %86
  %94 = add nsw i32 %62, %87, !spirv.Decorations !871
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !871
  %97 = add nsw i64 %96, %80, !spirv.Decorations !871
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !856
  %106 = fmul float %105, 0x3FF7154760000000
  %107 = call float @llvm.trunc.f32(float %106)
  %108 = call float @llvm.fma.f32(float %107, float 0xBFE62E4000000000, float %105)
  %109 = call float @llvm.fma.f32(float %107, float 0xBEB7F7D1C0000000, float %108)
  %110 = fmul float %109, 0x3FF7154760000000
  %111 = call float @llvm.exp2.f32(float %107)
  %112 = call float @llvm.exp2.f32(float %110)
  %113 = fmul float %111, %112
  %114 = fcmp olt float %105, -1.050000e+02
  %115 = select i1 %114, float 0.000000e+00, float %113
  %116 = fcmp ogt float %105, 1.050000e+02
  %117 = select i1 %116, float 0x7FF0000000000000, float %115
  br label %118

118:                                              ; preds = %104, %93
  %119 = phi float [ %117, %104 ], [ 0.000000e+00, %93 ]
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !856
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !856
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !856
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.trunc.f32(float %125)
  %127 = call float @llvm.fma.f32(float %126, float 0xBFE62E4000000000, float %124)
  %128 = call float @llvm.fma.f32(float %126, float 0xBEB7F7D1C0000000, float %127)
  %129 = fmul float %128, 0x3FF7154760000000
  %130 = call float @llvm.exp2.f32(float %126)
  %131 = call float @llvm.exp2.f32(float %129)
  %132 = fmul float %130, %131
  %133 = fcmp olt float %124, -1.050000e+02
  %134 = select i1 %133, float 0.000000e+00, float %132
  %135 = fcmp ogt float %124, 1.050000e+02
  %136 = select i1 %135, float 0x7FF0000000000000, float %134
  br label %137

137:                                              ; preds = %123, %118
  %138 = phi float [ %136, %123 ], [ 0.000000e+00, %118 ]
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !856
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !856
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !856
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !871
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !853
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, ptr addrspace(1) %143, i64 %152
  br label %154

154:                                              ; preds = %157, %149
  %155 = phi i32 [ 0, %149 ], [ %162, %157 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %157, label %163

157:                                              ; preds = %154
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds float, ptr addrspace(1) %153, i64 %158
  %160 = load float, ptr addrspace(1) %159, align 4
  %161 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %158
  store float %160, ptr %161, align 4
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !853
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !1165
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !856
  %175 = load <4 x float>, ptr %17, align 16, !noalias !1174
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !856
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !856
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !856
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !856
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !856
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !856
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !856
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !856
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !853
  br label %144, !llvm.loop !1183

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 8
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %200 = or i32 %199, 16
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !853
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %371

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !853
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !853
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !853
  br label %202, !llvm.loop !1184

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !853
  br label %212, !llvm.loop !1185

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.202, i64 16, i1 false)
  br label %225, !llvm.loop !1186

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 8
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 12, !spirv.Decorations !904
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !871
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !871
  %246 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE-ExtSLM, i64 0, i64 32
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !856
  %260 = fmul float %259, 0x3FF7154760000000
  %261 = call float @llvm.trunc.f32(float %260)
  %262 = call float @llvm.fma.f32(float %261, float 0xBFE62E4000000000, float %259)
  %263 = call float @llvm.fma.f32(float %261, float 0xBEB7F7D1C0000000, float %262)
  %264 = fmul float %263, 0x3FF7154760000000
  %265 = call float @llvm.exp2.f32(float %261)
  %266 = call float @llvm.exp2.f32(float %264)
  %267 = fmul float %265, %266
  %268 = fcmp olt float %259, -1.050000e+02
  %269 = select i1 %268, float 0.000000e+00, float %267
  %270 = fcmp ogt float %259, 1.050000e+02
  %271 = select i1 %270, float 0x7FF0000000000000, float %269
  br label %272

272:                                              ; preds = %258, %248
  %273 = phi float [ %271, %258 ], [ 0.000000e+00, %248 ]
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !856
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !856
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !856
  %279 = fmul float %278, 0x3FF7154760000000
  %280 = call float @llvm.trunc.f32(float %279)
  %281 = call float @llvm.fma.f32(float %280, float 0xBFE62E4000000000, float %278)
  %282 = call float @llvm.fma.f32(float %280, float 0xBEB7F7D1C0000000, float %281)
  %283 = fmul float %282, 0x3FF7154760000000
  %284 = call float @llvm.exp2.f32(float %280)
  %285 = call float @llvm.exp2.f32(float %283)
  %286 = fmul float %284, %285
  %287 = fcmp olt float %278, -1.050000e+02
  %288 = select i1 %287, float 0.000000e+00, float %286
  %289 = fcmp ogt float %278, 1.050000e+02
  %290 = select i1 %289, float 0x7FF0000000000000, float %288
  br label %291

291:                                              ; preds = %277, %272
  %292 = phi float [ %290, %277 ], [ 0.000000e+00, %272 ]
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !856
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !856
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !856
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !853
  %297 = or i32 %296, 16
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !853
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !853
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !853
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !1187
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !856
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !856
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !856
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !856
  %322 = load <4 x float>, ptr %18, align 16, !noalias !1196
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !856
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !856
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !856
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !856
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !856
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !856
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !856
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !856
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !853
  br label %299, !llvm.loop !1205

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !853
  br label %307, !llvm.loop !1206

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !853
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !853
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %370, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !853
  br label %348, !llvm.loop !1207

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = fptrunc float %365 to half
  %367 = or i32 %353, %357
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds half, ptr addrspace(1) %246, i64 %368
  store half %366, ptr addrspace(1) %369, align 2
  %370 = add nuw nsw i32 %357, 1, !spirv.Decorations !853
  br label %356, !llvm.loop !1208

.loopexit:                                        ; preds = %348
  br label %371

371:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 12
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 15, !spirv.Decorations !871
  %72 = sdiv i32 %71, 16
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.203, i64 16, i1 false)
  br label %76, !llvm.loop !1209

86:                                               ; preds = %147, %79
  %87 = phi i32 [ %148, %147 ], [ %73, %79 ]
  %88 = phi float [ %141, %147 ], [ 0.000000e+00, %79 ]
  %89 = phi float [ %102, %147 ], [ 0xFFF0000000000000, %79 ]
  %90 = icmp slt i32 %87, %75
  br i1 %90, label %93, label %91

91:                                               ; preds = %86
  %92 = icmp eq i16 %simdLaneId16, 0
  br i1 %92, label %193, label %197

93:                                               ; preds = %86
  %94 = add nsw i32 %62, %87, !spirv.Decorations !871
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !871
  %97 = add nsw i64 %96, %80, !spirv.Decorations !871
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !856
  %106 = fmul float %105, 0x3FF7154760000000
  %107 = call float @llvm.trunc.f32(float %106)
  %108 = call float @llvm.fma.f32(float %107, float 0xBFE62E4000000000, float %105)
  %109 = call float @llvm.fma.f32(float %107, float 0xBEB7F7D1C0000000, float %108)
  %110 = fmul float %109, 0x3FF7154760000000
  %111 = call float @llvm.exp2.f32(float %107)
  %112 = call float @llvm.exp2.f32(float %110)
  %113 = fmul float %111, %112
  %114 = fcmp olt float %105, -1.050000e+02
  %115 = select i1 %114, float 0.000000e+00, float %113
  %116 = fcmp ogt float %105, 1.050000e+02
  %117 = select i1 %116, float 0x7FF0000000000000, float %115
  br label %118

118:                                              ; preds = %104, %93
  %119 = phi float [ %117, %104 ], [ 0.000000e+00, %93 ]
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !856
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !856
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !856
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.trunc.f32(float %125)
  %127 = call float @llvm.fma.f32(float %126, float 0xBFE62E4000000000, float %124)
  %128 = call float @llvm.fma.f32(float %126, float 0xBEB7F7D1C0000000, float %127)
  %129 = fmul float %128, 0x3FF7154760000000
  %130 = call float @llvm.exp2.f32(float %126)
  %131 = call float @llvm.exp2.f32(float %129)
  %132 = fmul float %130, %131
  %133 = fcmp olt float %124, -1.050000e+02
  %134 = select i1 %133, float 0.000000e+00, float %132
  %135 = fcmp ogt float %124, 1.050000e+02
  %136 = select i1 %135, float 0x7FF0000000000000, float %134
  br label %137

137:                                              ; preds = %123, %118
  %138 = phi float [ %136, %123 ], [ 0.000000e+00, %118 ]
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !856
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !856
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !856
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !871
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !853
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, ptr addrspace(1) %143, i64 %152
  br label %154

154:                                              ; preds = %157, %149
  %155 = phi i32 [ 0, %149 ], [ %162, %157 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %157, label %163

157:                                              ; preds = %154
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds float, ptr addrspace(1) %153, i64 %158
  %160 = load float, ptr addrspace(1) %159, align 4
  %161 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %158
  store float %160, ptr %161, align 4
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !853
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !1210
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !856
  %175 = load <4 x float>, ptr %17, align 16, !noalias !1219
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !856
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !856
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !856
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !856
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !856
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !856
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !856
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !856
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !853
  br label %144, !llvm.loop !1228

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 16
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %200 = or i32 %199, 32
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !853
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %371

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !853
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !853
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !853
  br label %202, !llvm.loop !1229

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !853
  br label %212, !llvm.loop !1230

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.204, i64 16, i1 false)
  br label %225, !llvm.loop !1231

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 16
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 12, !spirv.Decorations !904
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !871
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !871
  %246 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE-ExtSLM, i64 0, i64 64
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !856
  %260 = fmul float %259, 0x3FF7154760000000
  %261 = call float @llvm.trunc.f32(float %260)
  %262 = call float @llvm.fma.f32(float %261, float 0xBFE62E4000000000, float %259)
  %263 = call float @llvm.fma.f32(float %261, float 0xBEB7F7D1C0000000, float %262)
  %264 = fmul float %263, 0x3FF7154760000000
  %265 = call float @llvm.exp2.f32(float %261)
  %266 = call float @llvm.exp2.f32(float %264)
  %267 = fmul float %265, %266
  %268 = fcmp olt float %259, -1.050000e+02
  %269 = select i1 %268, float 0.000000e+00, float %267
  %270 = fcmp ogt float %259, 1.050000e+02
  %271 = select i1 %270, float 0x7FF0000000000000, float %269
  br label %272

272:                                              ; preds = %258, %248
  %273 = phi float [ %271, %258 ], [ 0.000000e+00, %248 ]
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !856
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !856
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !856
  %279 = fmul float %278, 0x3FF7154760000000
  %280 = call float @llvm.trunc.f32(float %279)
  %281 = call float @llvm.fma.f32(float %280, float 0xBFE62E4000000000, float %278)
  %282 = call float @llvm.fma.f32(float %280, float 0xBEB7F7D1C0000000, float %281)
  %283 = fmul float %282, 0x3FF7154760000000
  %284 = call float @llvm.exp2.f32(float %280)
  %285 = call float @llvm.exp2.f32(float %283)
  %286 = fmul float %284, %285
  %287 = fcmp olt float %278, -1.050000e+02
  %288 = select i1 %287, float 0.000000e+00, float %286
  %289 = fcmp ogt float %278, 1.050000e+02
  %290 = select i1 %289, float 0x7FF0000000000000, float %288
  br label %291

291:                                              ; preds = %277, %272
  %292 = phi float [ %290, %277 ], [ 0.000000e+00, %272 ]
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !856
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !856
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !856
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !853
  %297 = or i32 %296, 32
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !853
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !853
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !853
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !1232
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !856
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !856
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !856
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !856
  %322 = load <4 x float>, ptr %18, align 16, !noalias !1241
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !856
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !856
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !856
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !856
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !856
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !856
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !856
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !856
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !853
  br label %299, !llvm.loop !1250

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !853
  br label %307, !llvm.loop !1251

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !853
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !853
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %370, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !853
  br label %348, !llvm.loop !1252

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = fptrunc float %365 to half
  %367 = or i32 %353, %357
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds half, ptr addrspace(1) %246, i64 %368
  store half %366, ptr addrspace(1) %369, align 2
  %370 = add nuw nsw i32 %357, 1, !spirv.Decorations !853
  br label %356, !llvm.loop !1253

.loopexit:                                        ; preds = %348
  br label %371

371:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 12
  %55 = mul nsw i32 %54, -12, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 31, !spirv.Decorations !871
  %72 = sdiv i32 %71, 32
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.205, i64 16, i1 false)
  br label %76, !llvm.loop !1254

86:                                               ; preds = %147, %79
  %87 = phi i32 [ %148, %147 ], [ %73, %79 ]
  %88 = phi float [ %141, %147 ], [ 0.000000e+00, %79 ]
  %89 = phi float [ %102, %147 ], [ 0xFFF0000000000000, %79 ]
  %90 = icmp slt i32 %87, %75
  br i1 %90, label %93, label %91

91:                                               ; preds = %86
  %92 = icmp eq i16 %simdLaneId16, 0
  br i1 %92, label %193, label %197

93:                                               ; preds = %86
  %94 = add nsw i32 %62, %87, !spirv.Decorations !871
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !871
  %97 = add nsw i64 %96, %80, !spirv.Decorations !871
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !856
  %106 = fmul float %105, 0x3FF7154760000000
  %107 = call float @llvm.trunc.f32(float %106)
  %108 = call float @llvm.fma.f32(float %107, float 0xBFE62E4000000000, float %105)
  %109 = call float @llvm.fma.f32(float %107, float 0xBEB7F7D1C0000000, float %108)
  %110 = fmul float %109, 0x3FF7154760000000
  %111 = call float @llvm.exp2.f32(float %107)
  %112 = call float @llvm.exp2.f32(float %110)
  %113 = fmul float %111, %112
  %114 = fcmp olt float %105, -1.050000e+02
  %115 = select i1 %114, float 0.000000e+00, float %113
  %116 = fcmp ogt float %105, 1.050000e+02
  %117 = select i1 %116, float 0x7FF0000000000000, float %115
  br label %118

118:                                              ; preds = %104, %93
  %119 = phi float [ %117, %104 ], [ 0.000000e+00, %93 ]
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !856
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !856
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !856
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.trunc.f32(float %125)
  %127 = call float @llvm.fma.f32(float %126, float 0xBFE62E4000000000, float %124)
  %128 = call float @llvm.fma.f32(float %126, float 0xBEB7F7D1C0000000, float %127)
  %129 = fmul float %128, 0x3FF7154760000000
  %130 = call float @llvm.exp2.f32(float %126)
  %131 = call float @llvm.exp2.f32(float %129)
  %132 = fmul float %130, %131
  %133 = fcmp olt float %124, -1.050000e+02
  %134 = select i1 %133, float 0.000000e+00, float %132
  %135 = fcmp ogt float %124, 1.050000e+02
  %136 = select i1 %135, float 0x7FF0000000000000, float %134
  br label %137

137:                                              ; preds = %123, %118
  %138 = phi float [ %136, %123 ], [ 0.000000e+00, %118 ]
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !856
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !856
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !856
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !871
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !853
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, ptr addrspace(1) %143, i64 %152
  br label %154

154:                                              ; preds = %157, %149
  %155 = phi i32 [ 0, %149 ], [ %162, %157 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %157, label %163

157:                                              ; preds = %154
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds float, ptr addrspace(1) %153, i64 %158
  %160 = load float, ptr addrspace(1) %159, align 4
  %161 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %158
  store float %160, ptr %161, align 4
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !853
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !1255
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !856
  %175 = load <4 x float>, ptr %17, align 16, !noalias !1264
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !856
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !856
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !856
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !856
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !856
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !856
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !856
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !856
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !853
  br label %144, !llvm.loop !1273

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 32
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %200 = or i32 %199, 64
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !853
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %371

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !853
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !853
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !853
  br label %202, !llvm.loop !1274

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !853
  br label %212, !llvm.loop !1275

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.206, i64 16, i1 false)
  br label %225, !llvm.loop !1276

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 32
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 12, !spirv.Decorations !904
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !871
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !871
  %246 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE-ExtSLM, i64 0, i64 128
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !856
  %260 = fmul float %259, 0x3FF7154760000000
  %261 = call float @llvm.trunc.f32(float %260)
  %262 = call float @llvm.fma.f32(float %261, float 0xBFE62E4000000000, float %259)
  %263 = call float @llvm.fma.f32(float %261, float 0xBEB7F7D1C0000000, float %262)
  %264 = fmul float %263, 0x3FF7154760000000
  %265 = call float @llvm.exp2.f32(float %261)
  %266 = call float @llvm.exp2.f32(float %264)
  %267 = fmul float %265, %266
  %268 = fcmp olt float %259, -1.050000e+02
  %269 = select i1 %268, float 0.000000e+00, float %267
  %270 = fcmp ogt float %259, 1.050000e+02
  %271 = select i1 %270, float 0x7FF0000000000000, float %269
  br label %272

272:                                              ; preds = %258, %248
  %273 = phi float [ %271, %258 ], [ 0.000000e+00, %248 ]
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !856
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !856
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !856
  %279 = fmul float %278, 0x3FF7154760000000
  %280 = call float @llvm.trunc.f32(float %279)
  %281 = call float @llvm.fma.f32(float %280, float 0xBFE62E4000000000, float %278)
  %282 = call float @llvm.fma.f32(float %280, float 0xBEB7F7D1C0000000, float %281)
  %283 = fmul float %282, 0x3FF7154760000000
  %284 = call float @llvm.exp2.f32(float %280)
  %285 = call float @llvm.exp2.f32(float %283)
  %286 = fmul float %284, %285
  %287 = fcmp olt float %278, -1.050000e+02
  %288 = select i1 %287, float 0.000000e+00, float %286
  %289 = fcmp ogt float %278, 1.050000e+02
  %290 = select i1 %289, float 0x7FF0000000000000, float %288
  br label %291

291:                                              ; preds = %277, %272
  %292 = phi float [ %290, %277 ], [ 0.000000e+00, %272 ]
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !856
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !856
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !856
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !853
  %297 = or i32 %296, 64
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !853
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !853
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !853
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !1277
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !856
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !856
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !856
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !856
  %322 = load <4 x float>, ptr %18, align 16, !noalias !1286
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !856
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !856
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !856
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !856
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !856
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !856
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !856
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !856
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !853
  br label %299, !llvm.loop !1295

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !853
  br label %307, !llvm.loop !1296

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !853
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !853
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %370, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !853
  br label %348, !llvm.loop !1297

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = fptrunc float %365 to half
  %367 = or i32 %353, %357
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds half, ptr addrspace(1) %246, i64 %368
  store half %366, ptr addrspace(1) %369, align 2
  %370 = add nuw nsw i32 %357, 1, !spirv.Decorations !853
  br label %356, !llvm.loop !1298

.loopexit:                                        ; preds = %348
  br label %371

371:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_133Xe2KvTorchAbiS2MergeOutHalfKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %18)
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = shl nsw i32 %9, 3, !spirv.Decorations !871
  %54 = add nuw nsw i32 %53, %localThreadId10, !spirv.Decorations !853
  %55 = lshr i32 %54, 6
  %56 = and i32 %54, 63
  %57 = mul nsw i32 %55, %0, !spirv.Decorations !871
  %58 = load i32, ptr addrspace(1) %1, align 4
  %59 = sext i32 %58 to i64
  %60 = sext i32 %0 to i64
  %61 = add nsw i64 %59, 63, !spirv.Decorations !871
  %62 = sdiv i64 %61, 64
  %63 = call i64 @llvm.smin.i64(i64 %60, i64 %62)
  %64 = call i64 @llvm.smax.i64(i64 %63, i64 1)
  %65 = trunc i64 %64 to i32
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %66

66:                                               ; preds = %72, %7
  %67 = phi i32 [ 0, %7 ], [ %75, %72 ]
  %68 = icmp ult i32 %67, 4
  br i1 %68, label %72, label %69

69:                                               ; preds = %66
  %70 = zext i32 %56 to i64
  %71 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %76

72:                                               ; preds = %66
  %73 = zext i32 %67 to i64
  %74 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %73
  %75 = add nuw nsw i32 %67, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %74, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.207, i64 16, i1 false)
  br label %66, !llvm.loop !1299

76:                                               ; preds = %139, %69
  %77 = phi i32 [ %140, %139 ], [ 0, %69 ]
  %78 = phi float [ %133, %139 ], [ 0.000000e+00, %69 ]
  %79 = phi float [ %94, %139 ], [ 0xFFF0000000000000, %69 ]
  %80 = icmp slt i32 %77, %65
  br i1 %80, label %85, label %81

81:                                               ; preds = %76
  %82 = call float @llvm.maxnum.f32(float %78, float 0x3BC79CA100000000)
  %83 = udiv i32 %56, 6
  %84 = icmp slt i32 %83, %5
  br i1 %84, label %185, label %218

85:                                               ; preds = %76
  %86 = add nsw i32 %57, %77, !spirv.Decorations !871
  %87 = sext i32 %86 to i64
  %88 = shl nsw i64 %87, 6, !spirv.Decorations !871
  %89 = or i64 %88, %70
  %90 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %89
  %91 = load float, ptr addrspace(1) %90, align 4
  %92 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %89
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = call float @llvm.maxnum.f32(float %79, float %91)
  %95 = fcmp reassoc nsz arcp contract oeq float %79, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %95, label %110, label %96

96:                                               ; preds = %85
  %97 = fsub reassoc nsz arcp contract float %79, %94, !spirv.Decorations !856
  %98 = fmul float %97, 0x3FF7154760000000
  %99 = call float @llvm.trunc.f32(float %98)
  %100 = call float @llvm.fma.f32(float %99, float 0xBFE62E4000000000, float %97)
  %101 = call float @llvm.fma.f32(float %99, float 0xBEB7F7D1C0000000, float %100)
  %102 = fmul float %101, 0x3FF7154760000000
  %103 = call float @llvm.exp2.f32(float %99)
  %104 = call float @llvm.exp2.f32(float %102)
  %105 = fmul float %103, %104
  %106 = fcmp olt float %97, -1.050000e+02
  %107 = select i1 %106, float 0.000000e+00, float %105
  %108 = fcmp ogt float %97, 1.050000e+02
  %109 = select i1 %108, float 0x7FF0000000000000, float %107
  br label %110

110:                                              ; preds = %96, %85
  %111 = phi float [ %109, %96 ], [ 0.000000e+00, %85 ]
  %112 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !856
  %113 = fcmp reassoc nsz arcp contract oeq float %94, 0xFFF0000000000000, !spirv.Decorations !856
  %114 = or i1 %112, %113
  br i1 %114, label %129, label %115

115:                                              ; preds = %110
  %116 = fsub reassoc nsz arcp contract float %91, %94, !spirv.Decorations !856
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = call float @llvm.trunc.f32(float %117)
  %119 = call float @llvm.fma.f32(float %118, float 0xBFE62E4000000000, float %116)
  %120 = call float @llvm.fma.f32(float %118, float 0xBEB7F7D1C0000000, float %119)
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = call float @llvm.exp2.f32(float %118)
  %123 = call float @llvm.exp2.f32(float %121)
  %124 = fmul float %122, %123
  %125 = fcmp olt float %116, -1.050000e+02
  %126 = select i1 %125, float 0.000000e+00, float %124
  %127 = fcmp ogt float %116, 1.050000e+02
  %128 = select i1 %127, float 0x7FF0000000000000, float %126
  br label %129

129:                                              ; preds = %115, %110
  %130 = phi float [ %128, %115 ], [ 0.000000e+00, %110 ]
  %131 = fmul reassoc nsz arcp contract float %130, %93, !spirv.Decorations !856
  %132 = fmul reassoc nsz arcp contract float %78, %111, !spirv.Decorations !856
  %133 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !856
  %134 = shl nsw i64 %89, 8, !spirv.Decorations !871
  %135 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %134
  br label %136

136:                                              ; preds = %155, %129
  %137 = phi i32 [ 0, %129 ], [ %184, %155 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %141, label %139

139:                                              ; preds = %136
  %140 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  br label %76

141:                                              ; preds = %136
  %142 = shl nuw nsw i32 %137, 6, !spirv.Decorations !853
  %143 = add nuw nsw i32 %142, %71, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds float, ptr addrspace(1) %135, i64 %144
  br label %146

146:                                              ; preds = %149, %141
  %147 = phi i32 [ 0, %141 ], [ %154, %149 ]
  %148 = icmp ult i32 %147, 4
  br i1 %148, label %149, label %155

149:                                              ; preds = %146
  %150 = zext i32 %147 to i64
  %151 = getelementptr inbounds float, ptr addrspace(1) %145, i64 %150
  %152 = load float, ptr addrspace(1) %151, align 4
  %153 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %150
  store float %152, ptr %153, align 4
  %154 = add nuw nsw i32 %147, 1, !spirv.Decorations !853
  br label %146

155:                                              ; preds = %146
  %156 = zext i32 %137 to i64
  %157 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %156
  %158 = load <4 x float>, ptr %157, align 16, !noalias !1300
  %159 = extractelement <4 x float> %158, i32 0
  %160 = extractelement <4 x float> %158, i32 1
  %161 = extractelement <4 x float> %158, i32 2
  %162 = extractelement <4 x float> %158, i32 3
  %163 = fmul reassoc nsz arcp contract float %159, %111, !spirv.Decorations !856
  %164 = fmul reassoc nsz arcp contract float %160, %111, !spirv.Decorations !856
  %165 = fmul reassoc nsz arcp contract float %161, %111, !spirv.Decorations !856
  %166 = fmul reassoc nsz arcp contract float %162, %111, !spirv.Decorations !856
  %167 = load <4 x float>, ptr %17, align 16, !noalias !1309
  %168 = extractelement <4 x float> %167, i32 0
  %169 = extractelement <4 x float> %167, i32 1
  %170 = extractelement <4 x float> %167, i32 2
  %171 = extractelement <4 x float> %167, i32 3
  %172 = fmul reassoc nsz arcp contract float %131, %168, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %131, %169, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %131, %170, !spirv.Decorations !856
  %175 = fmul reassoc nsz arcp contract float %131, %171, !spirv.Decorations !856
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !856
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !856
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !856
  %179 = fadd reassoc nsz arcp contract float %166, %175, !spirv.Decorations !856
  %180 = insertelement <4 x float> undef, float %176, i32 0
  %181 = insertelement <4 x float> %180, float %177, i32 1
  %182 = insertelement <4 x float> %181, float %178, i32 2
  %183 = insertelement <4 x float> %182, float %179, i32 3
  store <4 x float> %183, ptr %157, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %184 = add nuw nsw i32 %137, 1, !spirv.Decorations !853
  br label %136, !llvm.loop !1318

185:                                              ; preds = %81
  %.neg = mul nsw i32 %83, -6
  %186 = add nsw i32 %.neg, %56
  %187 = mul nuw nsw i32 %55, 6, !spirv.Decorations !853
  %188 = add nuw nsw i32 %187, %186, !spirv.Decorations !853
  %189 = mul nuw nsw i32 %83, 12, !spirv.Decorations !853
  %190 = add nuw nsw i32 %189, %188, !spirv.Decorations !853
  %191 = zext i32 %190 to i64
  %192 = shl nuw nsw i64 %191, 8, !spirv.Decorations !853
  %193 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %192
  %194 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %195

195:                                              ; preds = %206, %185
  %196 = phi i32 [ 0, %185 ], [ %207, %206 ]
  %197 = icmp ult i32 %196, 4
  br i1 %197, label %198, label %.loopexit

198:                                              ; preds = %195
  %199 = shl nuw nsw i32 %196, 6, !spirv.Decorations !853
  %200 = add nuw nsw i32 %199, %194, !spirv.Decorations !853
  %201 = zext i32 %196 to i64
  %202 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %201
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %217, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %196, 1, !spirv.Decorations !853
  br label %195, !llvm.loop !1319

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %202, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fdiv reassoc nsz arcp contract float %211, %82
  %213 = fptrunc float %212 to half
  %214 = or i32 %200, %204
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds half, ptr addrspace(1) %193, i64 %215
  store half %213, ptr addrspace(1) %216, align 2
  %217 = add nuw nsw i32 %204, 1, !spirv.Decorations !853
  br label %203, !llvm.loop !1320

.loopexit:                                        ; preds = %195
  br label %218

218:                                              ; preds = %.loopexit, %81
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !873
  %18 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %19 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %20 = bitcast <8 x i32> %r0 to <32 x i8>
  %21 = extractelement <32 x i8> %20, i32 0
  %22 = extractelement <32 x i8> %20, i32 1
  %23 = extractelement <32 x i8> %20, i32 2
  %24 = extractelement <32 x i8> %20, i32 3
  %25 = extractelement <32 x i8> %20, i32 4
  %26 = extractelement <32 x i8> %20, i32 5
  %27 = extractelement <32 x i8> %20, i32 6
  %28 = extractelement <32 x i8> %20, i32 7
  %29 = extractelement <32 x i8> %20, i32 8
  %30 = extractelement <32 x i8> %20, i32 9
  %31 = extractelement <32 x i8> %20, i32 10
  %32 = extractelement <32 x i8> %20, i32 11
  %33 = extractelement <32 x i8> %20, i32 12
  %34 = extractelement <32 x i8> %20, i32 13
  %35 = extractelement <32 x i8> %20, i32 14
  %36 = extractelement <32 x i8> %20, i32 15
  %37 = extractelement <32 x i8> %20, i32 16
  %38 = extractelement <32 x i8> %20, i32 17
  %39 = extractelement <32 x i8> %20, i32 18
  %40 = extractelement <32 x i8> %20, i32 19
  %41 = extractelement <32 x i8> %20, i32 20
  %42 = extractelement <32 x i8> %20, i32 21
  %43 = extractelement <32 x i8> %20, i32 22
  %44 = extractelement <32 x i8> %20, i32 23
  %45 = extractelement <32 x i8> %20, i32 24
  %46 = extractelement <32 x i8> %20, i32 25
  %47 = extractelement <32 x i8> %20, i32 26
  %48 = extractelement <32 x i8> %20, i32 27
  %49 = extractelement <32 x i8> %20, i32 28
  %50 = extractelement <32 x i8> %20, i32 29
  %51 = extractelement <32 x i8> %20, i32 30
  %52 = extractelement <32 x i8> %20, i32 31
  %localThreadId10 = zext i8 %29 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %53 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %53)
  %54 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %54)
  %55 = udiv i32 %9, 24
  %56 = mul nsw i32 %55, -24, !spirv.Decorations !871
  %57 = add nsw i32 %56, %9, !spirv.Decorations !871
  %58 = sdiv i32 %57, 6
  %59 = mul nuw nsw i32 %55, 6, !spirv.Decorations !853
  %60 = mul nsw i32 %58, -6, !spirv.Decorations !871
  %61 = add nsw i32 %60, %57, !spirv.Decorations !871
  %62 = add nsw i32 %59, %61, !spirv.Decorations !871
  %63 = mul nsw i32 %58, %0, !spirv.Decorations !871
  %64 = load i32, ptr addrspace(1) %1, align 4
  %65 = sext i32 %64 to i64
  %66 = sext i32 %0 to i64
  %67 = add nsw i64 %65, 63, !spirv.Decorations !871
  %68 = sdiv i64 %67, 64
  %69 = call i64 @llvm.smin.i64(i64 %66, i64 %68)
  %70 = call i64 @llvm.smax.i64(i64 %69, i64 1)
  %71 = trunc i64 %70 to i32
  %72 = add nsw i32 %71, 7, !spirv.Decorations !871
  %73 = sdiv i32 %72, 8
  %74 = mul nsw i32 %73, %localThreadId10, !spirv.Decorations !871
  %75 = add nsw i32 %74, %73, !spirv.Decorations !871
  %76 = call i32 @llvm.smin.i32(i32 %75, i32 %71)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %77

77:                                               ; preds = %82, %7
  %78 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %79 = icmp ult i32 %78, 4
  br i1 %79, label %82, label %80

80:                                               ; preds = %77
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %17)
  %81 = icmp slt i32 %74, %76
  br i1 %81, label %86, label %120

82:                                               ; preds = %77
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %78, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.208, i64 16, i1 false)
  br label %77, !llvm.loop !1321

86:                                               ; preds = %80
  %87 = add nsw i32 %63, %74, !spirv.Decorations !871
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 6, !spirv.Decorations !871
  %90 = sext i32 %62 to i64
  %91 = add nsw i64 %89, %90, !spirv.Decorations !871
  %92 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %91
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %97 = shl nsw i64 %91, 8, !spirv.Decorations !871
  %98 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %97
  br label %99

99:                                               ; preds = %118, %86
  %100 = phi i32 [ 0, %86 ], [ %119, %118 ]
  %101 = icmp ult i32 %100, 4
  br i1 %101, label %102, label %.loopexit2

102:                                              ; preds = %99
  %103 = shl nuw nsw i32 %100, 6, !spirv.Decorations !853
  %104 = add nuw nsw i32 %103, %96, !spirv.Decorations !853
  %105 = zext i32 %100 to i64
  %106 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %105
  %107 = zext i32 %104 to i64
  %108 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %98, i64 %107
  br label %109

109:                                              ; preds = %112, %102
  %110 = phi i32 [ 0, %102 ], [ %117, %112 ]
  %111 = icmp ult i32 %110, 4
  br i1 %111, label %112, label %118

112:                                              ; preds = %109
  %113 = zext i32 %110 to i64
  %114 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %108, i64 %113
  %115 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %106, i64 0, i32 0, i64 %113
  %116 = load half, ptr addrspace(1) %114, align 2
  store half %116, ptr %115, align 2
  %117 = add nuw nsw i32 %110, 1, !spirv.Decorations !853
  br label %109

118:                                              ; preds = %109
  %119 = add nuw nsw i32 %100, 1, !spirv.Decorations !853
  br label %99, !llvm.loop !1322

.loopexit2:                                       ; preds = %99
  br label %120

120:                                              ; preds = %.loopexit2, %80
  %121 = phi float [ 0.000000e+00, %80 ], [ %95, %.loopexit2 ]
  %122 = phi float [ 0xFFF0000000000000, %80 ], [ %93, %.loopexit2 ]
  %123 = add i32 %63, 1
  %124 = sext i32 %62 to i64
  %125 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %126

126:                                              ; preds = %238, %120
  %127 = phi i32 [ %74, %120 ], [ %140, %238 ]
  %128 = phi float [ %121, %120 ], [ %193, %238 ]
  %129 = phi float [ %122, %120 ], [ %194, %238 ]
  %130 = phi float [ 0.000000e+00, %120 ], [ %234, %238 ]
  %131 = phi float [ 0xFFF0000000000000, %120 ], [ %195, %238 ]
  %132 = icmp slt i32 %127, %76
  br i1 %132, label %135, label %133

133:                                              ; preds = %126
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %17)
  %134 = icmp eq i16 %simdLaneId16, 0
  br i1 %134, label %270, label %274

135:                                              ; preds = %126
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %18)
  br label %136

136:                                              ; preds = %142, %135
  %137 = phi i32 [ 0, %135 ], [ %159, %142 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %142, label %139

139:                                              ; preds = %136
  %140 = add nsw i32 %127, 1, !spirv.Decorations !871
  %141 = icmp slt i32 %140, %76
  br i1 %141, label %160, label %192

142:                                              ; preds = %136
  %143 = zext i32 %137 to i64
  %144 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %143
  %145 = load <4 x half>, ptr %144, align 8, !noalias !1323
  %146 = extractelement <4 x half> %145, i32 0
  %147 = extractelement <4 x half> %145, i32 1
  %148 = extractelement <4 x half> %145, i32 2
  %149 = extractelement <4 x half> %145, i32 3
  %150 = fpext half %146 to float
  %151 = fpext half %147 to float
  %152 = fpext half %148 to float
  %153 = fpext half %149 to float
  %154 = insertelement <4 x float> undef, float %150, i32 0
  %155 = insertelement <4 x float> %154, float %151, i32 1
  %156 = insertelement <4 x float> %155, float %152, i32 2
  %157 = insertelement <4 x float> %156, float %153, i32 3
  %158 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %143
  store <4 x float> %157, ptr %158, align 16
  %159 = add nuw nsw i32 %137, 1, !spirv.Decorations !853
  br label %136, !llvm.loop !1326

160:                                              ; preds = %139
  %161 = add i32 %127, %123
  %162 = sext i32 %161 to i64
  %163 = shl nsw i64 %162, 6, !spirv.Decorations !871
  %164 = add nsw i64 %163, %124, !spirv.Decorations !871
  %165 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %164
  %166 = load float, ptr addrspace(1) %165, align 4
  %167 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %164
  %168 = load float, ptr addrspace(1) %167, align 4
  %169 = shl nsw i64 %164, 8, !spirv.Decorations !871
  %170 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %169
  br label %171

171:                                              ; preds = %190, %160
  %172 = phi i32 [ 0, %160 ], [ %191, %190 ]
  %173 = icmp ult i32 %172, 4
  br i1 %173, label %174, label %.loopexit1

174:                                              ; preds = %171
  %175 = shl nuw nsw i32 %172, 6, !spirv.Decorations !853
  %176 = add nuw nsw i32 %175, %125, !spirv.Decorations !853
  %177 = zext i32 %172 to i64
  %178 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %177
  %179 = zext i32 %176 to i64
  %180 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %170, i64 %179
  br label %181

181:                                              ; preds = %184, %174
  %182 = phi i32 [ 0, %174 ], [ %189, %184 ]
  %183 = icmp ult i32 %182, 4
  br i1 %183, label %184, label %190

184:                                              ; preds = %181
  %185 = zext i32 %182 to i64
  %186 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %180, i64 %185
  %187 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %178, i64 0, i32 0, i64 %185
  %188 = load half, ptr addrspace(1) %186, align 2
  store half %188, ptr %187, align 2
  %189 = add nuw nsw i32 %182, 1, !spirv.Decorations !853
  br label %181

190:                                              ; preds = %181
  %191 = add nuw nsw i32 %172, 1, !spirv.Decorations !853
  br label %171, !llvm.loop !1327

.loopexit1:                                       ; preds = %171
  br label %192

192:                                              ; preds = %.loopexit1, %139
  %193 = phi float [ %128, %139 ], [ %168, %.loopexit1 ]
  %194 = phi float [ %129, %139 ], [ %166, %.loopexit1 ]
  %195 = call float @llvm.maxnum.f32(float %131, float %129)
  %196 = fcmp reassoc nsz arcp contract oeq float %131, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %196, label %211, label %197

197:                                              ; preds = %192
  %198 = fsub reassoc nsz arcp contract float %131, %195, !spirv.Decorations !856
  %199 = fmul float %198, 0x3FF7154760000000
  %200 = call float @llvm.trunc.f32(float %199)
  %201 = call float @llvm.fma.f32(float %200, float 0xBFE62E4000000000, float %198)
  %202 = call float @llvm.fma.f32(float %200, float 0xBEB7F7D1C0000000, float %201)
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = call float @llvm.exp2.f32(float %200)
  %205 = call float @llvm.exp2.f32(float %203)
  %206 = fmul float %204, %205
  %207 = fcmp olt float %198, -1.050000e+02
  %208 = select i1 %207, float 0.000000e+00, float %206
  %209 = fcmp ogt float %198, 1.050000e+02
  %210 = select i1 %209, float 0x7FF0000000000000, float %208
  br label %211

211:                                              ; preds = %197, %192
  %212 = phi float [ %210, %197 ], [ 0.000000e+00, %192 ]
  %213 = fcmp reassoc nsz arcp contract oeq float %129, 0xFFF0000000000000, !spirv.Decorations !856
  %214 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !856
  %215 = or i1 %213, %214
  br i1 %215, label %230, label %216

216:                                              ; preds = %211
  %217 = fsub reassoc nsz arcp contract float %129, %195, !spirv.Decorations !856
  %218 = fmul float %217, 0x3FF7154760000000
  %219 = call float @llvm.trunc.f32(float %218)
  %220 = call float @llvm.fma.f32(float %219, float 0xBFE62E4000000000, float %217)
  %221 = call float @llvm.fma.f32(float %219, float 0xBEB7F7D1C0000000, float %220)
  %222 = fmul float %221, 0x3FF7154760000000
  %223 = call float @llvm.exp2.f32(float %219)
  %224 = call float @llvm.exp2.f32(float %222)
  %225 = fmul float %223, %224
  %226 = fcmp olt float %217, -1.050000e+02
  %227 = select i1 %226, float 0.000000e+00, float %225
  %228 = fcmp ogt float %217, 1.050000e+02
  %229 = select i1 %228, float 0x7FF0000000000000, float %227
  br label %230

230:                                              ; preds = %216, %211
  %231 = phi float [ %229, %216 ], [ 0.000000e+00, %211 ]
  %232 = fmul reassoc nsz arcp contract float %231, %128, !spirv.Decorations !856
  %233 = fmul reassoc nsz arcp contract float %130, %212, !spirv.Decorations !856
  %234 = fadd reassoc nsz arcp contract float %233, %232, !spirv.Decorations !856
  br label %235

235:                                              ; preds = %239, %230
  %236 = phi i32 [ 0, %230 ], [ %269, %239 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %239, label %238

238:                                              ; preds = %235
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %18)
  br label %126

239:                                              ; preds = %235
  %240 = zext i32 %236 to i64
  %241 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %240
  %242 = load <4 x float>, ptr %241, align 16, !noalias !1328
  %243 = extractelement <4 x float> %242, i32 0
  %244 = extractelement <4 x float> %242, i32 1
  %245 = extractelement <4 x float> %242, i32 2
  %246 = extractelement <4 x float> %242, i32 3
  %247 = fmul reassoc nsz arcp contract float %243, %212, !spirv.Decorations !856
  %248 = fmul reassoc nsz arcp contract float %244, %212, !spirv.Decorations !856
  %249 = fmul reassoc nsz arcp contract float %245, %212, !spirv.Decorations !856
  %250 = fmul reassoc nsz arcp contract float %246, %212, !spirv.Decorations !856
  %251 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %240
  %252 = load <4 x float>, ptr %251, align 16, !noalias !1337
  %253 = extractelement <4 x float> %252, i32 0
  %254 = extractelement <4 x float> %252, i32 1
  %255 = extractelement <4 x float> %252, i32 2
  %256 = extractelement <4 x float> %252, i32 3
  %257 = fmul reassoc nsz arcp contract float %232, %253, !spirv.Decorations !856
  %258 = fmul reassoc nsz arcp contract float %232, %254, !spirv.Decorations !856
  %259 = fmul reassoc nsz arcp contract float %232, %255, !spirv.Decorations !856
  %260 = fmul reassoc nsz arcp contract float %232, %256, !spirv.Decorations !856
  %261 = fadd reassoc nsz arcp contract float %247, %257, !spirv.Decorations !856
  %262 = fadd reassoc nsz arcp contract float %248, %258, !spirv.Decorations !856
  %263 = fadd reassoc nsz arcp contract float %249, %259, !spirv.Decorations !856
  %264 = fadd reassoc nsz arcp contract float %250, %260, !spirv.Decorations !856
  %265 = insertelement <4 x float> undef, float %261, i32 0
  %266 = insertelement <4 x float> %265, float %262, i32 1
  %267 = insertelement <4 x float> %266, float %263, i32 2
  %268 = insertelement <4 x float> %267, float %264, i32 3
  store <4 x float> %268, ptr %241, align 16
  %269 = add nuw nsw i32 %236, 1, !spirv.Decorations !853
  br label %235, !llvm.loop !1346

270:                                              ; preds = %133
  %271 = zext i8 %29 to i64
  %272 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE-ExtSLM, i64 %271
  store float %131, ptr addrspace(3) %272, align 4
  %273 = getelementptr float, ptr addrspace(3) %272, i64 8
  store float %130, ptr addrspace(3) %273, align 4
  br label %274

274:                                              ; preds = %270, %133
  %275 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %276 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %277 = or i32 %276, 16
  %278 = add nuw nsw i32 %275, %277, !spirv.Decorations !853
  br label %279

279:                                              ; preds = %292, %274
  %280 = phi i32 [ 0, %274 ], [ %293, %292 ]
  %281 = icmp ult i32 %280, 4
  br i1 %281, label %284, label %282

282:                                              ; preds = %279
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %283 = icmp eq i8 %29, 0
  br i1 %283, label %.preheader, label %448

.preheader:                                       ; preds = %282
  br label %302

284:                                              ; preds = %279
  %285 = shl nuw nsw i32 %280, 6, !spirv.Decorations !853
  %286 = zext i32 %280 to i64
  %287 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %286
  %288 = add nuw nsw i32 %285, %278, !spirv.Decorations !853
  br label %289

289:                                              ; preds = %294, %284
  %290 = phi i32 [ 0, %284 ], [ %301, %294 ]
  %291 = icmp ult i32 %290, 4
  br i1 %291, label %294, label %292

292:                                              ; preds = %289
  %293 = add nuw nsw i32 %280, 1, !spirv.Decorations !853
  br label %279, !llvm.loop !1347

294:                                              ; preds = %289
  %295 = zext i32 %290 to i64
  %296 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %287, i64 0, i32 0, i64 %295
  %297 = load float, ptr %296, align 4
  %298 = or i32 %288, %290
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE-ExtSLM, i64 %299
  store float %297, ptr addrspace(3) %300, align 4
  %301 = add nuw nsw i32 %290, 1, !spirv.Decorations !853
  br label %289, !llvm.loop !1348

302:                                              ; preds = %307, %.preheader
  %303 = phi i32 [ %310, %307 ], [ 0, %.preheader ]
  %304 = icmp ult i32 %303, 4
  br i1 %304, label %307, label %305

305:                                              ; preds = %302
  %306 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %311

307:                                              ; preds = %302
  %308 = zext i32 %303 to i64
  %309 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %308
  %310 = add nuw nsw i32 %303, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %309, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.209, i64 16, i1 false)
  br label %302, !llvm.loop !1349

311:                                              ; preds = %379, %305
  %312 = phi i32 [ %380, %379 ], [ 0, %305 ]
  %313 = phi float [ %372, %379 ], [ 0.000000e+00, %305 ]
  %314 = phi float [ %333, %379 ], [ 0xFFF0000000000000, %305 ]
  %315 = icmp ult i32 %312, 8
  br i1 %315, label %325, label %316

316:                                              ; preds = %311
  %317 = call float @llvm.maxnum.f32(float %313, float 0x3BC79CA100000000)
  %318 = mul nuw i32 %55, 24, !spirv.Decorations !904
  %319 = zext i32 %318 to i64
  %320 = sext i32 %57 to i64
  %321 = add nsw i64 %319, %320, !spirv.Decorations !871
  %322 = shl nsw i64 %321, 8, !spirv.Decorations !871
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %322
  %324 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %425

325:                                              ; preds = %311
  %326 = zext i32 %312 to i64
  %327 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE-ExtSLM, i64 %326
  %328 = load float, ptr addrspace(3) %327, align 4
  %329 = zext i32 %312 to i64
  %330 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE-ExtSLM, i64 0, i64 32
  %331 = getelementptr inbounds float, ptr addrspace(3) %330, i64 %329
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = call float @llvm.maxnum.f32(float %314, float %328)
  %334 = fcmp reassoc nsz arcp contract oeq float %314, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %334, label %349, label %335

335:                                              ; preds = %325
  %336 = fsub reassoc nsz arcp contract float %314, %333, !spirv.Decorations !856
  %337 = fmul float %336, 0x3FF7154760000000
  %338 = call float @llvm.trunc.f32(float %337)
  %339 = call float @llvm.fma.f32(float %338, float 0xBFE62E4000000000, float %336)
  %340 = call float @llvm.fma.f32(float %338, float 0xBEB7F7D1C0000000, float %339)
  %341 = fmul float %340, 0x3FF7154760000000
  %342 = call float @llvm.exp2.f32(float %338)
  %343 = call float @llvm.exp2.f32(float %341)
  %344 = fmul float %342, %343
  %345 = fcmp olt float %336, -1.050000e+02
  %346 = select i1 %345, float 0.000000e+00, float %344
  %347 = fcmp ogt float %336, 1.050000e+02
  %348 = select i1 %347, float 0x7FF0000000000000, float %346
  br label %349

349:                                              ; preds = %335, %325
  %350 = phi float [ %348, %335 ], [ 0.000000e+00, %325 ]
  %351 = fcmp reassoc nsz arcp contract oeq float %328, 0xFFF0000000000000, !spirv.Decorations !856
  %352 = fcmp reassoc nsz arcp contract oeq float %333, 0xFFF0000000000000, !spirv.Decorations !856
  %353 = or i1 %351, %352
  br i1 %353, label %368, label %354

354:                                              ; preds = %349
  %355 = fsub reassoc nsz arcp contract float %328, %333, !spirv.Decorations !856
  %356 = fmul float %355, 0x3FF7154760000000
  %357 = call float @llvm.trunc.f32(float %356)
  %358 = call float @llvm.fma.f32(float %357, float 0xBFE62E4000000000, float %355)
  %359 = call float @llvm.fma.f32(float %357, float 0xBEB7F7D1C0000000, float %358)
  %360 = fmul float %359, 0x3FF7154760000000
  %361 = call float @llvm.exp2.f32(float %357)
  %362 = call float @llvm.exp2.f32(float %360)
  %363 = fmul float %361, %362
  %364 = fcmp olt float %355, -1.050000e+02
  %365 = select i1 %364, float 0.000000e+00, float %363
  %366 = fcmp ogt float %355, 1.050000e+02
  %367 = select i1 %366, float 0x7FF0000000000000, float %365
  br label %368

368:                                              ; preds = %354, %349
  %369 = phi float [ %367, %354 ], [ 0.000000e+00, %349 ]
  %370 = fmul reassoc nsz arcp contract float %313, %350, !spirv.Decorations !856
  %371 = fmul reassoc nsz arcp contract float %369, %332, !spirv.Decorations !856
  %372 = fadd reassoc nsz arcp contract float %370, %371, !spirv.Decorations !856
  %373 = shl nuw nsw i32 %312, 8, !spirv.Decorations !853
  %374 = or i32 %373, 16
  %375 = add nuw nsw i32 %306, %374, !spirv.Decorations !853
  br label %376

376:                                              ; preds = %387, %368
  %377 = phi i32 [ 0, %368 ], [ %416, %387 ]
  %378 = icmp ult i32 %377, 4
  br i1 %378, label %381, label %379

379:                                              ; preds = %376
  %380 = add nuw nsw i32 %312, 1, !spirv.Decorations !853
  br label %311

381:                                              ; preds = %376
  %382 = shl nuw nsw i32 %377, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %19)
  %383 = add nuw nsw i32 %382, %375, !spirv.Decorations !853
  br label %384

384:                                              ; preds = %417, %381
  %385 = phi i32 [ 0, %381 ], [ %424, %417 ]
  %386 = icmp ult i32 %385, 4
  br i1 %386, label %417, label %387

387:                                              ; preds = %384
  %388 = zext i32 %377 to i64
  %389 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %388
  %390 = load <4 x float>, ptr %389, align 16, !noalias !1350
  %391 = extractelement <4 x float> %390, i32 0
  %392 = extractelement <4 x float> %390, i32 1
  %393 = extractelement <4 x float> %390, i32 2
  %394 = extractelement <4 x float> %390, i32 3
  %395 = fmul reassoc nsz arcp contract float %391, %350, !spirv.Decorations !856
  %396 = fmul reassoc nsz arcp contract float %392, %350, !spirv.Decorations !856
  %397 = fmul reassoc nsz arcp contract float %393, %350, !spirv.Decorations !856
  %398 = fmul reassoc nsz arcp contract float %394, %350, !spirv.Decorations !856
  %399 = load <4 x float>, ptr %19, align 16, !noalias !1359
  %400 = extractelement <4 x float> %399, i32 0
  %401 = extractelement <4 x float> %399, i32 1
  %402 = extractelement <4 x float> %399, i32 2
  %403 = extractelement <4 x float> %399, i32 3
  %404 = fmul reassoc nsz arcp contract float %369, %400, !spirv.Decorations !856
  %405 = fmul reassoc nsz arcp contract float %369, %401, !spirv.Decorations !856
  %406 = fmul reassoc nsz arcp contract float %369, %402, !spirv.Decorations !856
  %407 = fmul reassoc nsz arcp contract float %369, %403, !spirv.Decorations !856
  %408 = fadd reassoc nsz arcp contract float %395, %404, !spirv.Decorations !856
  %409 = fadd reassoc nsz arcp contract float %396, %405, !spirv.Decorations !856
  %410 = fadd reassoc nsz arcp contract float %397, %406, !spirv.Decorations !856
  %411 = fadd reassoc nsz arcp contract float %398, %407, !spirv.Decorations !856
  %412 = insertelement <4 x float> undef, float %408, i32 0
  %413 = insertelement <4 x float> %412, float %409, i32 1
  %414 = insertelement <4 x float> %413, float %410, i32 2
  %415 = insertelement <4 x float> %414, float %411, i32 3
  store <4 x float> %415, ptr %389, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %19)
  %416 = add nuw nsw i32 %377, 1, !spirv.Decorations !853
  br label %376, !llvm.loop !1368

417:                                              ; preds = %384
  %418 = or i32 %383, %385
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE-ExtSLM, i64 %419
  %421 = load float, ptr addrspace(3) %420, align 4
  %422 = zext i32 %385 to i64
  %423 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %19, i64 0, i32 0, i64 %422
  store float %421, ptr %423, align 4
  %424 = add nuw nsw i32 %385, 1, !spirv.Decorations !853
  br label %384, !llvm.loop !1369

425:                                              ; preds = %436, %316
  %426 = phi i32 [ 0, %316 ], [ %437, %436 ]
  %427 = icmp ult i32 %426, 4
  br i1 %427, label %428, label %.loopexit

428:                                              ; preds = %425
  %429 = shl nuw nsw i32 %426, 6, !spirv.Decorations !853
  %430 = add nuw nsw i32 %429, %324, !spirv.Decorations !853
  %431 = zext i32 %426 to i64
  %432 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %431
  br label %433

433:                                              ; preds = %438, %428
  %434 = phi i32 [ 0, %428 ], [ %447, %438 ]
  %435 = icmp ult i32 %434, 4
  br i1 %435, label %438, label %436

436:                                              ; preds = %433
  %437 = add nuw nsw i32 %426, 1, !spirv.Decorations !853
  br label %425, !llvm.loop !1370

438:                                              ; preds = %433
  %439 = zext i32 %434 to i64
  %440 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %432, i64 0, i32 0, i64 %439
  %441 = load float, ptr %440, align 4
  %442 = fdiv reassoc nsz arcp contract float %441, %317
  %443 = fptrunc float %442 to half
  %444 = or i32 %430, %434
  %445 = zext i32 %444 to i64
  %446 = getelementptr inbounds half, ptr addrspace(1) %323, i64 %445
  store half %443, ptr addrspace(1) %446, align 2
  %447 = add nuw nsw i32 %434, 1, !spirv.Decorations !853
  br label %433, !llvm.loop !1371

.loopexit:                                        ; preds = %425
  br label %448

448:                                              ; preds = %.loopexit, %282
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !873
  %18 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %19 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %20 = bitcast <8 x i32> %r0 to <32 x i8>
  %21 = extractelement <32 x i8> %20, i32 0
  %22 = extractelement <32 x i8> %20, i32 1
  %23 = extractelement <32 x i8> %20, i32 2
  %24 = extractelement <32 x i8> %20, i32 3
  %25 = extractelement <32 x i8> %20, i32 4
  %26 = extractelement <32 x i8> %20, i32 5
  %27 = extractelement <32 x i8> %20, i32 6
  %28 = extractelement <32 x i8> %20, i32 7
  %29 = extractelement <32 x i8> %20, i32 8
  %30 = extractelement <32 x i8> %20, i32 9
  %31 = extractelement <32 x i8> %20, i32 10
  %32 = extractelement <32 x i8> %20, i32 11
  %33 = extractelement <32 x i8> %20, i32 12
  %34 = extractelement <32 x i8> %20, i32 13
  %35 = extractelement <32 x i8> %20, i32 14
  %36 = extractelement <32 x i8> %20, i32 15
  %37 = extractelement <32 x i8> %20, i32 16
  %38 = extractelement <32 x i8> %20, i32 17
  %39 = extractelement <32 x i8> %20, i32 18
  %40 = extractelement <32 x i8> %20, i32 19
  %41 = extractelement <32 x i8> %20, i32 20
  %42 = extractelement <32 x i8> %20, i32 21
  %43 = extractelement <32 x i8> %20, i32 22
  %44 = extractelement <32 x i8> %20, i32 23
  %45 = extractelement <32 x i8> %20, i32 24
  %46 = extractelement <32 x i8> %20, i32 25
  %47 = extractelement <32 x i8> %20, i32 26
  %48 = extractelement <32 x i8> %20, i32 27
  %49 = extractelement <32 x i8> %20, i32 28
  %50 = extractelement <32 x i8> %20, i32 29
  %51 = extractelement <32 x i8> %20, i32 30
  %52 = extractelement <32 x i8> %20, i32 31
  %localThreadId10 = zext i8 %29 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %53 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %53)
  %54 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %54)
  %55 = udiv i32 %9, 24
  %56 = mul nsw i32 %55, -24, !spirv.Decorations !871
  %57 = add nsw i32 %56, %9, !spirv.Decorations !871
  %58 = sdiv i32 %57, 6
  %59 = mul nuw nsw i32 %55, 6, !spirv.Decorations !853
  %60 = mul nsw i32 %58, -6, !spirv.Decorations !871
  %61 = add nsw i32 %60, %57, !spirv.Decorations !871
  %62 = add nsw i32 %59, %61, !spirv.Decorations !871
  %63 = mul nsw i32 %58, %0, !spirv.Decorations !871
  %64 = load i32, ptr addrspace(1) %1, align 4
  %65 = sext i32 %64 to i64
  %66 = sext i32 %0 to i64
  %67 = add nsw i64 %65, 63, !spirv.Decorations !871
  %68 = sdiv i64 %67, 64
  %69 = call i64 @llvm.smin.i64(i64 %66, i64 %68)
  %70 = call i64 @llvm.smax.i64(i64 %69, i64 1)
  %71 = trunc i64 %70 to i32
  %72 = add nsw i32 %71, 15, !spirv.Decorations !871
  %73 = sdiv i32 %72, 16
  %74 = mul nsw i32 %73, %localThreadId10, !spirv.Decorations !871
  %75 = add nsw i32 %74, %73, !spirv.Decorations !871
  %76 = call i32 @llvm.smin.i32(i32 %75, i32 %71)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %77

77:                                               ; preds = %82, %7
  %78 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %79 = icmp ult i32 %78, 4
  br i1 %79, label %82, label %80

80:                                               ; preds = %77
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %17)
  %81 = icmp slt i32 %74, %76
  br i1 %81, label %86, label %120

82:                                               ; preds = %77
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %78, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.210, i64 16, i1 false)
  br label %77, !llvm.loop !1372

86:                                               ; preds = %80
  %87 = add nsw i32 %63, %74, !spirv.Decorations !871
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 6, !spirv.Decorations !871
  %90 = sext i32 %62 to i64
  %91 = add nsw i64 %89, %90, !spirv.Decorations !871
  %92 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %91
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %97 = shl nsw i64 %91, 8, !spirv.Decorations !871
  %98 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %97
  br label %99

99:                                               ; preds = %118, %86
  %100 = phi i32 [ 0, %86 ], [ %119, %118 ]
  %101 = icmp ult i32 %100, 4
  br i1 %101, label %102, label %.loopexit2

102:                                              ; preds = %99
  %103 = shl nuw nsw i32 %100, 6, !spirv.Decorations !853
  %104 = add nuw nsw i32 %103, %96, !spirv.Decorations !853
  %105 = zext i32 %100 to i64
  %106 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %105
  %107 = zext i32 %104 to i64
  %108 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %98, i64 %107
  br label %109

109:                                              ; preds = %112, %102
  %110 = phi i32 [ 0, %102 ], [ %117, %112 ]
  %111 = icmp ult i32 %110, 4
  br i1 %111, label %112, label %118

112:                                              ; preds = %109
  %113 = zext i32 %110 to i64
  %114 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %108, i64 %113
  %115 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %106, i64 0, i32 0, i64 %113
  %116 = load half, ptr addrspace(1) %114, align 2
  store half %116, ptr %115, align 2
  %117 = add nuw nsw i32 %110, 1, !spirv.Decorations !853
  br label %109

118:                                              ; preds = %109
  %119 = add nuw nsw i32 %100, 1, !spirv.Decorations !853
  br label %99, !llvm.loop !1373

.loopexit2:                                       ; preds = %99
  br label %120

120:                                              ; preds = %.loopexit2, %80
  %121 = phi float [ 0.000000e+00, %80 ], [ %95, %.loopexit2 ]
  %122 = phi float [ 0xFFF0000000000000, %80 ], [ %93, %.loopexit2 ]
  %123 = add i32 %63, 1
  %124 = sext i32 %62 to i64
  %125 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %126

126:                                              ; preds = %238, %120
  %127 = phi i32 [ %74, %120 ], [ %140, %238 ]
  %128 = phi float [ %121, %120 ], [ %193, %238 ]
  %129 = phi float [ %122, %120 ], [ %194, %238 ]
  %130 = phi float [ 0.000000e+00, %120 ], [ %234, %238 ]
  %131 = phi float [ 0xFFF0000000000000, %120 ], [ %195, %238 ]
  %132 = icmp slt i32 %127, %76
  br i1 %132, label %135, label %133

133:                                              ; preds = %126
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %17)
  %134 = icmp eq i16 %simdLaneId16, 0
  br i1 %134, label %270, label %274

135:                                              ; preds = %126
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %18)
  br label %136

136:                                              ; preds = %142, %135
  %137 = phi i32 [ 0, %135 ], [ %159, %142 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %142, label %139

139:                                              ; preds = %136
  %140 = add nsw i32 %127, 1, !spirv.Decorations !871
  %141 = icmp slt i32 %140, %76
  br i1 %141, label %160, label %192

142:                                              ; preds = %136
  %143 = zext i32 %137 to i64
  %144 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %143
  %145 = load <4 x half>, ptr %144, align 8, !noalias !1374
  %146 = extractelement <4 x half> %145, i32 0
  %147 = extractelement <4 x half> %145, i32 1
  %148 = extractelement <4 x half> %145, i32 2
  %149 = extractelement <4 x half> %145, i32 3
  %150 = fpext half %146 to float
  %151 = fpext half %147 to float
  %152 = fpext half %148 to float
  %153 = fpext half %149 to float
  %154 = insertelement <4 x float> undef, float %150, i32 0
  %155 = insertelement <4 x float> %154, float %151, i32 1
  %156 = insertelement <4 x float> %155, float %152, i32 2
  %157 = insertelement <4 x float> %156, float %153, i32 3
  %158 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %143
  store <4 x float> %157, ptr %158, align 16
  %159 = add nuw nsw i32 %137, 1, !spirv.Decorations !853
  br label %136, !llvm.loop !1377

160:                                              ; preds = %139
  %161 = add i32 %127, %123
  %162 = sext i32 %161 to i64
  %163 = shl nsw i64 %162, 6, !spirv.Decorations !871
  %164 = add nsw i64 %163, %124, !spirv.Decorations !871
  %165 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %164
  %166 = load float, ptr addrspace(1) %165, align 4
  %167 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %164
  %168 = load float, ptr addrspace(1) %167, align 4
  %169 = shl nsw i64 %164, 8, !spirv.Decorations !871
  %170 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %169
  br label %171

171:                                              ; preds = %190, %160
  %172 = phi i32 [ 0, %160 ], [ %191, %190 ]
  %173 = icmp ult i32 %172, 4
  br i1 %173, label %174, label %.loopexit1

174:                                              ; preds = %171
  %175 = shl nuw nsw i32 %172, 6, !spirv.Decorations !853
  %176 = add nuw nsw i32 %175, %125, !spirv.Decorations !853
  %177 = zext i32 %172 to i64
  %178 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %177
  %179 = zext i32 %176 to i64
  %180 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %170, i64 %179
  br label %181

181:                                              ; preds = %184, %174
  %182 = phi i32 [ 0, %174 ], [ %189, %184 ]
  %183 = icmp ult i32 %182, 4
  br i1 %183, label %184, label %190

184:                                              ; preds = %181
  %185 = zext i32 %182 to i64
  %186 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %180, i64 %185
  %187 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %178, i64 0, i32 0, i64 %185
  %188 = load half, ptr addrspace(1) %186, align 2
  store half %188, ptr %187, align 2
  %189 = add nuw nsw i32 %182, 1, !spirv.Decorations !853
  br label %181

190:                                              ; preds = %181
  %191 = add nuw nsw i32 %172, 1, !spirv.Decorations !853
  br label %171, !llvm.loop !1378

.loopexit1:                                       ; preds = %171
  br label %192

192:                                              ; preds = %.loopexit1, %139
  %193 = phi float [ %128, %139 ], [ %168, %.loopexit1 ]
  %194 = phi float [ %129, %139 ], [ %166, %.loopexit1 ]
  %195 = call float @llvm.maxnum.f32(float %131, float %129)
  %196 = fcmp reassoc nsz arcp contract oeq float %131, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %196, label %211, label %197

197:                                              ; preds = %192
  %198 = fsub reassoc nsz arcp contract float %131, %195, !spirv.Decorations !856
  %199 = fmul float %198, 0x3FF7154760000000
  %200 = call float @llvm.trunc.f32(float %199)
  %201 = call float @llvm.fma.f32(float %200, float 0xBFE62E4000000000, float %198)
  %202 = call float @llvm.fma.f32(float %200, float 0xBEB7F7D1C0000000, float %201)
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = call float @llvm.exp2.f32(float %200)
  %205 = call float @llvm.exp2.f32(float %203)
  %206 = fmul float %204, %205
  %207 = fcmp olt float %198, -1.050000e+02
  %208 = select i1 %207, float 0.000000e+00, float %206
  %209 = fcmp ogt float %198, 1.050000e+02
  %210 = select i1 %209, float 0x7FF0000000000000, float %208
  br label %211

211:                                              ; preds = %197, %192
  %212 = phi float [ %210, %197 ], [ 0.000000e+00, %192 ]
  %213 = fcmp reassoc nsz arcp contract oeq float %129, 0xFFF0000000000000, !spirv.Decorations !856
  %214 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !856
  %215 = or i1 %213, %214
  br i1 %215, label %230, label %216

216:                                              ; preds = %211
  %217 = fsub reassoc nsz arcp contract float %129, %195, !spirv.Decorations !856
  %218 = fmul float %217, 0x3FF7154760000000
  %219 = call float @llvm.trunc.f32(float %218)
  %220 = call float @llvm.fma.f32(float %219, float 0xBFE62E4000000000, float %217)
  %221 = call float @llvm.fma.f32(float %219, float 0xBEB7F7D1C0000000, float %220)
  %222 = fmul float %221, 0x3FF7154760000000
  %223 = call float @llvm.exp2.f32(float %219)
  %224 = call float @llvm.exp2.f32(float %222)
  %225 = fmul float %223, %224
  %226 = fcmp olt float %217, -1.050000e+02
  %227 = select i1 %226, float 0.000000e+00, float %225
  %228 = fcmp ogt float %217, 1.050000e+02
  %229 = select i1 %228, float 0x7FF0000000000000, float %227
  br label %230

230:                                              ; preds = %216, %211
  %231 = phi float [ %229, %216 ], [ 0.000000e+00, %211 ]
  %232 = fmul reassoc nsz arcp contract float %231, %128, !spirv.Decorations !856
  %233 = fmul reassoc nsz arcp contract float %130, %212, !spirv.Decorations !856
  %234 = fadd reassoc nsz arcp contract float %233, %232, !spirv.Decorations !856
  br label %235

235:                                              ; preds = %239, %230
  %236 = phi i32 [ 0, %230 ], [ %269, %239 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %239, label %238

238:                                              ; preds = %235
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %18)
  br label %126

239:                                              ; preds = %235
  %240 = zext i32 %236 to i64
  %241 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %240
  %242 = load <4 x float>, ptr %241, align 16, !noalias !1379
  %243 = extractelement <4 x float> %242, i32 0
  %244 = extractelement <4 x float> %242, i32 1
  %245 = extractelement <4 x float> %242, i32 2
  %246 = extractelement <4 x float> %242, i32 3
  %247 = fmul reassoc nsz arcp contract float %243, %212, !spirv.Decorations !856
  %248 = fmul reassoc nsz arcp contract float %244, %212, !spirv.Decorations !856
  %249 = fmul reassoc nsz arcp contract float %245, %212, !spirv.Decorations !856
  %250 = fmul reassoc nsz arcp contract float %246, %212, !spirv.Decorations !856
  %251 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %240
  %252 = load <4 x float>, ptr %251, align 16, !noalias !1388
  %253 = extractelement <4 x float> %252, i32 0
  %254 = extractelement <4 x float> %252, i32 1
  %255 = extractelement <4 x float> %252, i32 2
  %256 = extractelement <4 x float> %252, i32 3
  %257 = fmul reassoc nsz arcp contract float %232, %253, !spirv.Decorations !856
  %258 = fmul reassoc nsz arcp contract float %232, %254, !spirv.Decorations !856
  %259 = fmul reassoc nsz arcp contract float %232, %255, !spirv.Decorations !856
  %260 = fmul reassoc nsz arcp contract float %232, %256, !spirv.Decorations !856
  %261 = fadd reassoc nsz arcp contract float %247, %257, !spirv.Decorations !856
  %262 = fadd reassoc nsz arcp contract float %248, %258, !spirv.Decorations !856
  %263 = fadd reassoc nsz arcp contract float %249, %259, !spirv.Decorations !856
  %264 = fadd reassoc nsz arcp contract float %250, %260, !spirv.Decorations !856
  %265 = insertelement <4 x float> undef, float %261, i32 0
  %266 = insertelement <4 x float> %265, float %262, i32 1
  %267 = insertelement <4 x float> %266, float %263, i32 2
  %268 = insertelement <4 x float> %267, float %264, i32 3
  store <4 x float> %268, ptr %241, align 16
  %269 = add nuw nsw i32 %236, 1, !spirv.Decorations !853
  br label %235, !llvm.loop !1397

270:                                              ; preds = %133
  %271 = zext i8 %29 to i64
  %272 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE-ExtSLM, i64 %271
  store float %131, ptr addrspace(3) %272, align 4
  %273 = getelementptr float, ptr addrspace(3) %272, i64 16
  store float %130, ptr addrspace(3) %273, align 4
  br label %274

274:                                              ; preds = %270, %133
  %275 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %276 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %277 = or i32 %276, 32
  %278 = add nuw nsw i32 %275, %277, !spirv.Decorations !853
  br label %279

279:                                              ; preds = %292, %274
  %280 = phi i32 [ 0, %274 ], [ %293, %292 ]
  %281 = icmp ult i32 %280, 4
  br i1 %281, label %284, label %282

282:                                              ; preds = %279
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %283 = icmp eq i8 %29, 0
  br i1 %283, label %.preheader, label %448

.preheader:                                       ; preds = %282
  br label %302

284:                                              ; preds = %279
  %285 = shl nuw nsw i32 %280, 6, !spirv.Decorations !853
  %286 = zext i32 %280 to i64
  %287 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %286
  %288 = add nuw nsw i32 %285, %278, !spirv.Decorations !853
  br label %289

289:                                              ; preds = %294, %284
  %290 = phi i32 [ 0, %284 ], [ %301, %294 ]
  %291 = icmp ult i32 %290, 4
  br i1 %291, label %294, label %292

292:                                              ; preds = %289
  %293 = add nuw nsw i32 %280, 1, !spirv.Decorations !853
  br label %279, !llvm.loop !1398

294:                                              ; preds = %289
  %295 = zext i32 %290 to i64
  %296 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %287, i64 0, i32 0, i64 %295
  %297 = load float, ptr %296, align 4
  %298 = or i32 %288, %290
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE-ExtSLM, i64 %299
  store float %297, ptr addrspace(3) %300, align 4
  %301 = add nuw nsw i32 %290, 1, !spirv.Decorations !853
  br label %289, !llvm.loop !1399

302:                                              ; preds = %307, %.preheader
  %303 = phi i32 [ %310, %307 ], [ 0, %.preheader ]
  %304 = icmp ult i32 %303, 4
  br i1 %304, label %307, label %305

305:                                              ; preds = %302
  %306 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %311

307:                                              ; preds = %302
  %308 = zext i32 %303 to i64
  %309 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %308
  %310 = add nuw nsw i32 %303, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %309, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.211, i64 16, i1 false)
  br label %302, !llvm.loop !1400

311:                                              ; preds = %379, %305
  %312 = phi i32 [ %380, %379 ], [ 0, %305 ]
  %313 = phi float [ %372, %379 ], [ 0.000000e+00, %305 ]
  %314 = phi float [ %333, %379 ], [ 0xFFF0000000000000, %305 ]
  %315 = icmp ult i32 %312, 16
  br i1 %315, label %325, label %316

316:                                              ; preds = %311
  %317 = call float @llvm.maxnum.f32(float %313, float 0x3BC79CA100000000)
  %318 = mul nuw i32 %55, 24, !spirv.Decorations !904
  %319 = zext i32 %318 to i64
  %320 = sext i32 %57 to i64
  %321 = add nsw i64 %319, %320, !spirv.Decorations !871
  %322 = shl nsw i64 %321, 8, !spirv.Decorations !871
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %322
  %324 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %425

325:                                              ; preds = %311
  %326 = zext i32 %312 to i64
  %327 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE-ExtSLM, i64 %326
  %328 = load float, ptr addrspace(3) %327, align 4
  %329 = zext i32 %312 to i64
  %330 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE-ExtSLM, i64 0, i64 64
  %331 = getelementptr inbounds float, ptr addrspace(3) %330, i64 %329
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = call float @llvm.maxnum.f32(float %314, float %328)
  %334 = fcmp reassoc nsz arcp contract oeq float %314, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %334, label %349, label %335

335:                                              ; preds = %325
  %336 = fsub reassoc nsz arcp contract float %314, %333, !spirv.Decorations !856
  %337 = fmul float %336, 0x3FF7154760000000
  %338 = call float @llvm.trunc.f32(float %337)
  %339 = call float @llvm.fma.f32(float %338, float 0xBFE62E4000000000, float %336)
  %340 = call float @llvm.fma.f32(float %338, float 0xBEB7F7D1C0000000, float %339)
  %341 = fmul float %340, 0x3FF7154760000000
  %342 = call float @llvm.exp2.f32(float %338)
  %343 = call float @llvm.exp2.f32(float %341)
  %344 = fmul float %342, %343
  %345 = fcmp olt float %336, -1.050000e+02
  %346 = select i1 %345, float 0.000000e+00, float %344
  %347 = fcmp ogt float %336, 1.050000e+02
  %348 = select i1 %347, float 0x7FF0000000000000, float %346
  br label %349

349:                                              ; preds = %335, %325
  %350 = phi float [ %348, %335 ], [ 0.000000e+00, %325 ]
  %351 = fcmp reassoc nsz arcp contract oeq float %328, 0xFFF0000000000000, !spirv.Decorations !856
  %352 = fcmp reassoc nsz arcp contract oeq float %333, 0xFFF0000000000000, !spirv.Decorations !856
  %353 = or i1 %351, %352
  br i1 %353, label %368, label %354

354:                                              ; preds = %349
  %355 = fsub reassoc nsz arcp contract float %328, %333, !spirv.Decorations !856
  %356 = fmul float %355, 0x3FF7154760000000
  %357 = call float @llvm.trunc.f32(float %356)
  %358 = call float @llvm.fma.f32(float %357, float 0xBFE62E4000000000, float %355)
  %359 = call float @llvm.fma.f32(float %357, float 0xBEB7F7D1C0000000, float %358)
  %360 = fmul float %359, 0x3FF7154760000000
  %361 = call float @llvm.exp2.f32(float %357)
  %362 = call float @llvm.exp2.f32(float %360)
  %363 = fmul float %361, %362
  %364 = fcmp olt float %355, -1.050000e+02
  %365 = select i1 %364, float 0.000000e+00, float %363
  %366 = fcmp ogt float %355, 1.050000e+02
  %367 = select i1 %366, float 0x7FF0000000000000, float %365
  br label %368

368:                                              ; preds = %354, %349
  %369 = phi float [ %367, %354 ], [ 0.000000e+00, %349 ]
  %370 = fmul reassoc nsz arcp contract float %313, %350, !spirv.Decorations !856
  %371 = fmul reassoc nsz arcp contract float %369, %332, !spirv.Decorations !856
  %372 = fadd reassoc nsz arcp contract float %370, %371, !spirv.Decorations !856
  %373 = shl nuw nsw i32 %312, 8, !spirv.Decorations !853
  %374 = or i32 %373, 32
  %375 = add nuw nsw i32 %306, %374, !spirv.Decorations !853
  br label %376

376:                                              ; preds = %387, %368
  %377 = phi i32 [ 0, %368 ], [ %416, %387 ]
  %378 = icmp ult i32 %377, 4
  br i1 %378, label %381, label %379

379:                                              ; preds = %376
  %380 = add nuw nsw i32 %312, 1, !spirv.Decorations !853
  br label %311

381:                                              ; preds = %376
  %382 = shl nuw nsw i32 %377, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %19)
  %383 = add nuw nsw i32 %382, %375, !spirv.Decorations !853
  br label %384

384:                                              ; preds = %417, %381
  %385 = phi i32 [ 0, %381 ], [ %424, %417 ]
  %386 = icmp ult i32 %385, 4
  br i1 %386, label %417, label %387

387:                                              ; preds = %384
  %388 = zext i32 %377 to i64
  %389 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %388
  %390 = load <4 x float>, ptr %389, align 16, !noalias !1401
  %391 = extractelement <4 x float> %390, i32 0
  %392 = extractelement <4 x float> %390, i32 1
  %393 = extractelement <4 x float> %390, i32 2
  %394 = extractelement <4 x float> %390, i32 3
  %395 = fmul reassoc nsz arcp contract float %391, %350, !spirv.Decorations !856
  %396 = fmul reassoc nsz arcp contract float %392, %350, !spirv.Decorations !856
  %397 = fmul reassoc nsz arcp contract float %393, %350, !spirv.Decorations !856
  %398 = fmul reassoc nsz arcp contract float %394, %350, !spirv.Decorations !856
  %399 = load <4 x float>, ptr %19, align 16, !noalias !1410
  %400 = extractelement <4 x float> %399, i32 0
  %401 = extractelement <4 x float> %399, i32 1
  %402 = extractelement <4 x float> %399, i32 2
  %403 = extractelement <4 x float> %399, i32 3
  %404 = fmul reassoc nsz arcp contract float %369, %400, !spirv.Decorations !856
  %405 = fmul reassoc nsz arcp contract float %369, %401, !spirv.Decorations !856
  %406 = fmul reassoc nsz arcp contract float %369, %402, !spirv.Decorations !856
  %407 = fmul reassoc nsz arcp contract float %369, %403, !spirv.Decorations !856
  %408 = fadd reassoc nsz arcp contract float %395, %404, !spirv.Decorations !856
  %409 = fadd reassoc nsz arcp contract float %396, %405, !spirv.Decorations !856
  %410 = fadd reassoc nsz arcp contract float %397, %406, !spirv.Decorations !856
  %411 = fadd reassoc nsz arcp contract float %398, %407, !spirv.Decorations !856
  %412 = insertelement <4 x float> undef, float %408, i32 0
  %413 = insertelement <4 x float> %412, float %409, i32 1
  %414 = insertelement <4 x float> %413, float %410, i32 2
  %415 = insertelement <4 x float> %414, float %411, i32 3
  store <4 x float> %415, ptr %389, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %19)
  %416 = add nuw nsw i32 %377, 1, !spirv.Decorations !853
  br label %376, !llvm.loop !1419

417:                                              ; preds = %384
  %418 = or i32 %383, %385
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE-ExtSLM, i64 %419
  %421 = load float, ptr addrspace(3) %420, align 4
  %422 = zext i32 %385 to i64
  %423 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %19, i64 0, i32 0, i64 %422
  store float %421, ptr %423, align 4
  %424 = add nuw nsw i32 %385, 1, !spirv.Decorations !853
  br label %384, !llvm.loop !1420

425:                                              ; preds = %436, %316
  %426 = phi i32 [ 0, %316 ], [ %437, %436 ]
  %427 = icmp ult i32 %426, 4
  br i1 %427, label %428, label %.loopexit

428:                                              ; preds = %425
  %429 = shl nuw nsw i32 %426, 6, !spirv.Decorations !853
  %430 = add nuw nsw i32 %429, %324, !spirv.Decorations !853
  %431 = zext i32 %426 to i64
  %432 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %431
  br label %433

433:                                              ; preds = %438, %428
  %434 = phi i32 [ 0, %428 ], [ %447, %438 ]
  %435 = icmp ult i32 %434, 4
  br i1 %435, label %438, label %436

436:                                              ; preds = %433
  %437 = add nuw nsw i32 %426, 1, !spirv.Decorations !853
  br label %425, !llvm.loop !1421

438:                                              ; preds = %433
  %439 = zext i32 %434 to i64
  %440 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %432, i64 0, i32 0, i64 %439
  %441 = load float, ptr %440, align 4
  %442 = fdiv reassoc nsz arcp contract float %441, %317
  %443 = fptrunc float %442 to half
  %444 = or i32 %430, %434
  %445 = zext i32 %444 to i64
  %446 = getelementptr inbounds half, ptr addrspace(1) %323, i64 %445
  store half %443, ptr addrspace(1) %446, align 2
  %447 = add nuw nsw i32 %434, 1, !spirv.Decorations !853
  br label %433, !llvm.loop !1422

.loopexit:                                        ; preds = %425
  br label %448

448:                                              ; preds = %.loopexit, %282
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !873
  %18 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %19 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %20 = bitcast <8 x i32> %r0 to <32 x i8>
  %21 = extractelement <32 x i8> %20, i32 0
  %22 = extractelement <32 x i8> %20, i32 1
  %23 = extractelement <32 x i8> %20, i32 2
  %24 = extractelement <32 x i8> %20, i32 3
  %25 = extractelement <32 x i8> %20, i32 4
  %26 = extractelement <32 x i8> %20, i32 5
  %27 = extractelement <32 x i8> %20, i32 6
  %28 = extractelement <32 x i8> %20, i32 7
  %29 = extractelement <32 x i8> %20, i32 8
  %30 = extractelement <32 x i8> %20, i32 9
  %31 = extractelement <32 x i8> %20, i32 10
  %32 = extractelement <32 x i8> %20, i32 11
  %33 = extractelement <32 x i8> %20, i32 12
  %34 = extractelement <32 x i8> %20, i32 13
  %35 = extractelement <32 x i8> %20, i32 14
  %36 = extractelement <32 x i8> %20, i32 15
  %37 = extractelement <32 x i8> %20, i32 16
  %38 = extractelement <32 x i8> %20, i32 17
  %39 = extractelement <32 x i8> %20, i32 18
  %40 = extractelement <32 x i8> %20, i32 19
  %41 = extractelement <32 x i8> %20, i32 20
  %42 = extractelement <32 x i8> %20, i32 21
  %43 = extractelement <32 x i8> %20, i32 22
  %44 = extractelement <32 x i8> %20, i32 23
  %45 = extractelement <32 x i8> %20, i32 24
  %46 = extractelement <32 x i8> %20, i32 25
  %47 = extractelement <32 x i8> %20, i32 26
  %48 = extractelement <32 x i8> %20, i32 27
  %49 = extractelement <32 x i8> %20, i32 28
  %50 = extractelement <32 x i8> %20, i32 29
  %51 = extractelement <32 x i8> %20, i32 30
  %52 = extractelement <32 x i8> %20, i32 31
  %localThreadId10 = zext i8 %29 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %53 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %53)
  %54 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %54)
  %55 = udiv i32 %9, 24
  %56 = mul nsw i32 %55, -24, !spirv.Decorations !871
  %57 = add nsw i32 %56, %9, !spirv.Decorations !871
  %58 = sdiv i32 %57, 6
  %59 = mul nuw nsw i32 %55, 6, !spirv.Decorations !853
  %60 = mul nsw i32 %58, -6, !spirv.Decorations !871
  %61 = add nsw i32 %60, %57, !spirv.Decorations !871
  %62 = add nsw i32 %59, %61, !spirv.Decorations !871
  %63 = mul nsw i32 %58, %0, !spirv.Decorations !871
  %64 = load i32, ptr addrspace(1) %1, align 4
  %65 = sext i32 %64 to i64
  %66 = sext i32 %0 to i64
  %67 = add nsw i64 %65, 63, !spirv.Decorations !871
  %68 = sdiv i64 %67, 64
  %69 = call i64 @llvm.smin.i64(i64 %66, i64 %68)
  %70 = call i64 @llvm.smax.i64(i64 %69, i64 1)
  %71 = trunc i64 %70 to i32
  %72 = add nsw i32 %71, 31, !spirv.Decorations !871
  %73 = sdiv i32 %72, 32
  %74 = mul nsw i32 %73, %localThreadId10, !spirv.Decorations !871
  %75 = add nsw i32 %74, %73, !spirv.Decorations !871
  %76 = call i32 @llvm.smin.i32(i32 %75, i32 %71)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %77

77:                                               ; preds = %82, %7
  %78 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %79 = icmp ult i32 %78, 4
  br i1 %79, label %82, label %80

80:                                               ; preds = %77
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %17)
  %81 = icmp slt i32 %74, %76
  br i1 %81, label %86, label %120

82:                                               ; preds = %77
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %78, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.212, i64 16, i1 false)
  br label %77, !llvm.loop !1423

86:                                               ; preds = %80
  %87 = add nsw i32 %63, %74, !spirv.Decorations !871
  %88 = sext i32 %87 to i64
  %89 = shl nsw i64 %88, 6, !spirv.Decorations !871
  %90 = sext i32 %62 to i64
  %91 = add nsw i64 %89, %90, !spirv.Decorations !871
  %92 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %91
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %91
  %95 = load float, ptr addrspace(1) %94, align 4
  %96 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %97 = shl nsw i64 %91, 8, !spirv.Decorations !871
  %98 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %97
  br label %99

99:                                               ; preds = %118, %86
  %100 = phi i32 [ 0, %86 ], [ %119, %118 ]
  %101 = icmp ult i32 %100, 4
  br i1 %101, label %102, label %.loopexit2

102:                                              ; preds = %99
  %103 = shl nuw nsw i32 %100, 6, !spirv.Decorations !853
  %104 = add nuw nsw i32 %103, %96, !spirv.Decorations !853
  %105 = zext i32 %100 to i64
  %106 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %105
  %107 = zext i32 %104 to i64
  %108 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %98, i64 %107
  br label %109

109:                                              ; preds = %112, %102
  %110 = phi i32 [ 0, %102 ], [ %117, %112 ]
  %111 = icmp ult i32 %110, 4
  br i1 %111, label %112, label %118

112:                                              ; preds = %109
  %113 = zext i32 %110 to i64
  %114 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %108, i64 %113
  %115 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %106, i64 0, i32 0, i64 %113
  %116 = load half, ptr addrspace(1) %114, align 2
  store half %116, ptr %115, align 2
  %117 = add nuw nsw i32 %110, 1, !spirv.Decorations !853
  br label %109

118:                                              ; preds = %109
  %119 = add nuw nsw i32 %100, 1, !spirv.Decorations !853
  br label %99, !llvm.loop !1424

.loopexit2:                                       ; preds = %99
  br label %120

120:                                              ; preds = %.loopexit2, %80
  %121 = phi float [ 0.000000e+00, %80 ], [ %95, %.loopexit2 ]
  %122 = phi float [ 0xFFF0000000000000, %80 ], [ %93, %.loopexit2 ]
  %123 = add i32 %63, 1
  %124 = sext i32 %62 to i64
  %125 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %126

126:                                              ; preds = %238, %120
  %127 = phi i32 [ %74, %120 ], [ %140, %238 ]
  %128 = phi float [ %121, %120 ], [ %193, %238 ]
  %129 = phi float [ %122, %120 ], [ %194, %238 ]
  %130 = phi float [ 0.000000e+00, %120 ], [ %234, %238 ]
  %131 = phi float [ 0xFFF0000000000000, %120 ], [ %195, %238 ]
  %132 = icmp slt i32 %127, %76
  br i1 %132, label %135, label %133

133:                                              ; preds = %126
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %17)
  %134 = icmp eq i16 %simdLaneId16, 0
  br i1 %134, label %270, label %274

135:                                              ; preds = %126
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %18)
  br label %136

136:                                              ; preds = %142, %135
  %137 = phi i32 [ 0, %135 ], [ %159, %142 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %142, label %139

139:                                              ; preds = %136
  %140 = add nsw i32 %127, 1, !spirv.Decorations !871
  %141 = icmp slt i32 %140, %76
  br i1 %141, label %160, label %192

142:                                              ; preds = %136
  %143 = zext i32 %137 to i64
  %144 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %143
  %145 = load <4 x half>, ptr %144, align 8, !noalias !1425
  %146 = extractelement <4 x half> %145, i32 0
  %147 = extractelement <4 x half> %145, i32 1
  %148 = extractelement <4 x half> %145, i32 2
  %149 = extractelement <4 x half> %145, i32 3
  %150 = fpext half %146 to float
  %151 = fpext half %147 to float
  %152 = fpext half %148 to float
  %153 = fpext half %149 to float
  %154 = insertelement <4 x float> undef, float %150, i32 0
  %155 = insertelement <4 x float> %154, float %151, i32 1
  %156 = insertelement <4 x float> %155, float %152, i32 2
  %157 = insertelement <4 x float> %156, float %153, i32 3
  %158 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %143
  store <4 x float> %157, ptr %158, align 16
  %159 = add nuw nsw i32 %137, 1, !spirv.Decorations !853
  br label %136, !llvm.loop !1428

160:                                              ; preds = %139
  %161 = add i32 %127, %123
  %162 = sext i32 %161 to i64
  %163 = shl nsw i64 %162, 6, !spirv.Decorations !871
  %164 = add nsw i64 %163, %124, !spirv.Decorations !871
  %165 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %164
  %166 = load float, ptr addrspace(1) %165, align 4
  %167 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %164
  %168 = load float, ptr addrspace(1) %167, align 4
  %169 = shl nsw i64 %164, 8, !spirv.Decorations !871
  %170 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %169
  br label %171

171:                                              ; preds = %190, %160
  %172 = phi i32 [ 0, %160 ], [ %191, %190 ]
  %173 = icmp ult i32 %172, 4
  br i1 %173, label %174, label %.loopexit1

174:                                              ; preds = %171
  %175 = shl nuw nsw i32 %172, 6, !spirv.Decorations !853
  %176 = add nuw nsw i32 %175, %125, !spirv.Decorations !853
  %177 = zext i32 %172 to i64
  %178 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %17, i64 0, i64 %177
  %179 = zext i32 %176 to i64
  %180 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %170, i64 %179
  br label %181

181:                                              ; preds = %184, %174
  %182 = phi i32 [ 0, %174 ], [ %189, %184 ]
  %183 = icmp ult i32 %182, 4
  br i1 %183, label %184, label %190

184:                                              ; preds = %181
  %185 = zext i32 %182 to i64
  %186 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %180, i64 %185
  %187 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %178, i64 0, i32 0, i64 %185
  %188 = load half, ptr addrspace(1) %186, align 2
  store half %188, ptr %187, align 2
  %189 = add nuw nsw i32 %182, 1, !spirv.Decorations !853
  br label %181

190:                                              ; preds = %181
  %191 = add nuw nsw i32 %172, 1, !spirv.Decorations !853
  br label %171, !llvm.loop !1429

.loopexit1:                                       ; preds = %171
  br label %192

192:                                              ; preds = %.loopexit1, %139
  %193 = phi float [ %128, %139 ], [ %168, %.loopexit1 ]
  %194 = phi float [ %129, %139 ], [ %166, %.loopexit1 ]
  %195 = call float @llvm.maxnum.f32(float %131, float %129)
  %196 = fcmp reassoc nsz arcp contract oeq float %131, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %196, label %211, label %197

197:                                              ; preds = %192
  %198 = fsub reassoc nsz arcp contract float %131, %195, !spirv.Decorations !856
  %199 = fmul float %198, 0x3FF7154760000000
  %200 = call float @llvm.trunc.f32(float %199)
  %201 = call float @llvm.fma.f32(float %200, float 0xBFE62E4000000000, float %198)
  %202 = call float @llvm.fma.f32(float %200, float 0xBEB7F7D1C0000000, float %201)
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = call float @llvm.exp2.f32(float %200)
  %205 = call float @llvm.exp2.f32(float %203)
  %206 = fmul float %204, %205
  %207 = fcmp olt float %198, -1.050000e+02
  %208 = select i1 %207, float 0.000000e+00, float %206
  %209 = fcmp ogt float %198, 1.050000e+02
  %210 = select i1 %209, float 0x7FF0000000000000, float %208
  br label %211

211:                                              ; preds = %197, %192
  %212 = phi float [ %210, %197 ], [ 0.000000e+00, %192 ]
  %213 = fcmp reassoc nsz arcp contract oeq float %129, 0xFFF0000000000000, !spirv.Decorations !856
  %214 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !856
  %215 = or i1 %213, %214
  br i1 %215, label %230, label %216

216:                                              ; preds = %211
  %217 = fsub reassoc nsz arcp contract float %129, %195, !spirv.Decorations !856
  %218 = fmul float %217, 0x3FF7154760000000
  %219 = call float @llvm.trunc.f32(float %218)
  %220 = call float @llvm.fma.f32(float %219, float 0xBFE62E4000000000, float %217)
  %221 = call float @llvm.fma.f32(float %219, float 0xBEB7F7D1C0000000, float %220)
  %222 = fmul float %221, 0x3FF7154760000000
  %223 = call float @llvm.exp2.f32(float %219)
  %224 = call float @llvm.exp2.f32(float %222)
  %225 = fmul float %223, %224
  %226 = fcmp olt float %217, -1.050000e+02
  %227 = select i1 %226, float 0.000000e+00, float %225
  %228 = fcmp ogt float %217, 1.050000e+02
  %229 = select i1 %228, float 0x7FF0000000000000, float %227
  br label %230

230:                                              ; preds = %216, %211
  %231 = phi float [ %229, %216 ], [ 0.000000e+00, %211 ]
  %232 = fmul reassoc nsz arcp contract float %231, %128, !spirv.Decorations !856
  %233 = fmul reassoc nsz arcp contract float %130, %212, !spirv.Decorations !856
  %234 = fadd reassoc nsz arcp contract float %233, %232, !spirv.Decorations !856
  br label %235

235:                                              ; preds = %239, %230
  %236 = phi i32 [ 0, %230 ], [ %269, %239 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %239, label %238

238:                                              ; preds = %235
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %18)
  br label %126

239:                                              ; preds = %235
  %240 = zext i32 %236 to i64
  %241 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %240
  %242 = load <4 x float>, ptr %241, align 16, !noalias !1430
  %243 = extractelement <4 x float> %242, i32 0
  %244 = extractelement <4 x float> %242, i32 1
  %245 = extractelement <4 x float> %242, i32 2
  %246 = extractelement <4 x float> %242, i32 3
  %247 = fmul reassoc nsz arcp contract float %243, %212, !spirv.Decorations !856
  %248 = fmul reassoc nsz arcp contract float %244, %212, !spirv.Decorations !856
  %249 = fmul reassoc nsz arcp contract float %245, %212, !spirv.Decorations !856
  %250 = fmul reassoc nsz arcp contract float %246, %212, !spirv.Decorations !856
  %251 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %18, i64 0, i64 %240
  %252 = load <4 x float>, ptr %251, align 16, !noalias !1439
  %253 = extractelement <4 x float> %252, i32 0
  %254 = extractelement <4 x float> %252, i32 1
  %255 = extractelement <4 x float> %252, i32 2
  %256 = extractelement <4 x float> %252, i32 3
  %257 = fmul reassoc nsz arcp contract float %232, %253, !spirv.Decorations !856
  %258 = fmul reassoc nsz arcp contract float %232, %254, !spirv.Decorations !856
  %259 = fmul reassoc nsz arcp contract float %232, %255, !spirv.Decorations !856
  %260 = fmul reassoc nsz arcp contract float %232, %256, !spirv.Decorations !856
  %261 = fadd reassoc nsz arcp contract float %247, %257, !spirv.Decorations !856
  %262 = fadd reassoc nsz arcp contract float %248, %258, !spirv.Decorations !856
  %263 = fadd reassoc nsz arcp contract float %249, %259, !spirv.Decorations !856
  %264 = fadd reassoc nsz arcp contract float %250, %260, !spirv.Decorations !856
  %265 = insertelement <4 x float> undef, float %261, i32 0
  %266 = insertelement <4 x float> %265, float %262, i32 1
  %267 = insertelement <4 x float> %266, float %263, i32 2
  %268 = insertelement <4 x float> %267, float %264, i32 3
  store <4 x float> %268, ptr %241, align 16
  %269 = add nuw nsw i32 %236, 1, !spirv.Decorations !853
  br label %235, !llvm.loop !1448

270:                                              ; preds = %133
  %271 = zext i8 %29 to i64
  %272 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE-ExtSLM, i64 %271
  store float %131, ptr addrspace(3) %272, align 4
  %273 = getelementptr float, ptr addrspace(3) %272, i64 32
  store float %130, ptr addrspace(3) %273, align 4
  br label %274

274:                                              ; preds = %270, %133
  %275 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %276 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %277 = or i32 %276, 64
  %278 = add nuw nsw i32 %275, %277, !spirv.Decorations !853
  br label %279

279:                                              ; preds = %292, %274
  %280 = phi i32 [ 0, %274 ], [ %293, %292 ]
  %281 = icmp ult i32 %280, 4
  br i1 %281, label %284, label %282

282:                                              ; preds = %279
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %283 = icmp eq i8 %29, 0
  br i1 %283, label %.preheader, label %448

.preheader:                                       ; preds = %282
  br label %302

284:                                              ; preds = %279
  %285 = shl nuw nsw i32 %280, 6, !spirv.Decorations !853
  %286 = zext i32 %280 to i64
  %287 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %286
  %288 = add nuw nsw i32 %285, %278, !spirv.Decorations !853
  br label %289

289:                                              ; preds = %294, %284
  %290 = phi i32 [ 0, %284 ], [ %301, %294 ]
  %291 = icmp ult i32 %290, 4
  br i1 %291, label %294, label %292

292:                                              ; preds = %289
  %293 = add nuw nsw i32 %280, 1, !spirv.Decorations !853
  br label %279, !llvm.loop !1449

294:                                              ; preds = %289
  %295 = zext i32 %290 to i64
  %296 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %287, i64 0, i32 0, i64 %295
  %297 = load float, ptr %296, align 4
  %298 = or i32 %288, %290
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE-ExtSLM, i64 %299
  store float %297, ptr addrspace(3) %300, align 4
  %301 = add nuw nsw i32 %290, 1, !spirv.Decorations !853
  br label %289, !llvm.loop !1450

302:                                              ; preds = %307, %.preheader
  %303 = phi i32 [ %310, %307 ], [ 0, %.preheader ]
  %304 = icmp ult i32 %303, 4
  br i1 %304, label %307, label %305

305:                                              ; preds = %302
  %306 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %311

307:                                              ; preds = %302
  %308 = zext i32 %303 to i64
  %309 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %308
  %310 = add nuw nsw i32 %303, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %309, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.213, i64 16, i1 false)
  br label %302, !llvm.loop !1451

311:                                              ; preds = %379, %305
  %312 = phi i32 [ %380, %379 ], [ 0, %305 ]
  %313 = phi float [ %372, %379 ], [ 0.000000e+00, %305 ]
  %314 = phi float [ %333, %379 ], [ 0xFFF0000000000000, %305 ]
  %315 = icmp ult i32 %312, 32
  br i1 %315, label %325, label %316

316:                                              ; preds = %311
  %317 = call float @llvm.maxnum.f32(float %313, float 0x3BC79CA100000000)
  %318 = mul nuw i32 %55, 24, !spirv.Decorations !904
  %319 = zext i32 %318 to i64
  %320 = sext i32 %57 to i64
  %321 = add nsw i64 %319, %320, !spirv.Decorations !871
  %322 = shl nsw i64 %321, 8, !spirv.Decorations !871
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %322
  %324 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %425

325:                                              ; preds = %311
  %326 = zext i32 %312 to i64
  %327 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE-ExtSLM, i64 %326
  %328 = load float, ptr addrspace(3) %327, align 4
  %329 = zext i32 %312 to i64
  %330 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE-ExtSLM, i64 0, i64 128
  %331 = getelementptr inbounds float, ptr addrspace(3) %330, i64 %329
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = call float @llvm.maxnum.f32(float %314, float %328)
  %334 = fcmp reassoc nsz arcp contract oeq float %314, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %334, label %349, label %335

335:                                              ; preds = %325
  %336 = fsub reassoc nsz arcp contract float %314, %333, !spirv.Decorations !856
  %337 = fmul float %336, 0x3FF7154760000000
  %338 = call float @llvm.trunc.f32(float %337)
  %339 = call float @llvm.fma.f32(float %338, float 0xBFE62E4000000000, float %336)
  %340 = call float @llvm.fma.f32(float %338, float 0xBEB7F7D1C0000000, float %339)
  %341 = fmul float %340, 0x3FF7154760000000
  %342 = call float @llvm.exp2.f32(float %338)
  %343 = call float @llvm.exp2.f32(float %341)
  %344 = fmul float %342, %343
  %345 = fcmp olt float %336, -1.050000e+02
  %346 = select i1 %345, float 0.000000e+00, float %344
  %347 = fcmp ogt float %336, 1.050000e+02
  %348 = select i1 %347, float 0x7FF0000000000000, float %346
  br label %349

349:                                              ; preds = %335, %325
  %350 = phi float [ %348, %335 ], [ 0.000000e+00, %325 ]
  %351 = fcmp reassoc nsz arcp contract oeq float %328, 0xFFF0000000000000, !spirv.Decorations !856
  %352 = fcmp reassoc nsz arcp contract oeq float %333, 0xFFF0000000000000, !spirv.Decorations !856
  %353 = or i1 %351, %352
  br i1 %353, label %368, label %354

354:                                              ; preds = %349
  %355 = fsub reassoc nsz arcp contract float %328, %333, !spirv.Decorations !856
  %356 = fmul float %355, 0x3FF7154760000000
  %357 = call float @llvm.trunc.f32(float %356)
  %358 = call float @llvm.fma.f32(float %357, float 0xBFE62E4000000000, float %355)
  %359 = call float @llvm.fma.f32(float %357, float 0xBEB7F7D1C0000000, float %358)
  %360 = fmul float %359, 0x3FF7154760000000
  %361 = call float @llvm.exp2.f32(float %357)
  %362 = call float @llvm.exp2.f32(float %360)
  %363 = fmul float %361, %362
  %364 = fcmp olt float %355, -1.050000e+02
  %365 = select i1 %364, float 0.000000e+00, float %363
  %366 = fcmp ogt float %355, 1.050000e+02
  %367 = select i1 %366, float 0x7FF0000000000000, float %365
  br label %368

368:                                              ; preds = %354, %349
  %369 = phi float [ %367, %354 ], [ 0.000000e+00, %349 ]
  %370 = fmul reassoc nsz arcp contract float %313, %350, !spirv.Decorations !856
  %371 = fmul reassoc nsz arcp contract float %369, %332, !spirv.Decorations !856
  %372 = fadd reassoc nsz arcp contract float %370, %371, !spirv.Decorations !856
  %373 = shl nuw nsw i32 %312, 8, !spirv.Decorations !853
  %374 = or i32 %373, 64
  %375 = add nuw nsw i32 %306, %374, !spirv.Decorations !853
  br label %376

376:                                              ; preds = %387, %368
  %377 = phi i32 [ 0, %368 ], [ %416, %387 ]
  %378 = icmp ult i32 %377, 4
  br i1 %378, label %381, label %379

379:                                              ; preds = %376
  %380 = add nuw nsw i32 %312, 1, !spirv.Decorations !853
  br label %311

381:                                              ; preds = %376
  %382 = shl nuw nsw i32 %377, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %19)
  %383 = add nuw nsw i32 %382, %375, !spirv.Decorations !853
  br label %384

384:                                              ; preds = %417, %381
  %385 = phi i32 [ 0, %381 ], [ %424, %417 ]
  %386 = icmp ult i32 %385, 4
  br i1 %386, label %417, label %387

387:                                              ; preds = %384
  %388 = zext i32 %377 to i64
  %389 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %388
  %390 = load <4 x float>, ptr %389, align 16, !noalias !1452
  %391 = extractelement <4 x float> %390, i32 0
  %392 = extractelement <4 x float> %390, i32 1
  %393 = extractelement <4 x float> %390, i32 2
  %394 = extractelement <4 x float> %390, i32 3
  %395 = fmul reassoc nsz arcp contract float %391, %350, !spirv.Decorations !856
  %396 = fmul reassoc nsz arcp contract float %392, %350, !spirv.Decorations !856
  %397 = fmul reassoc nsz arcp contract float %393, %350, !spirv.Decorations !856
  %398 = fmul reassoc nsz arcp contract float %394, %350, !spirv.Decorations !856
  %399 = load <4 x float>, ptr %19, align 16, !noalias !1461
  %400 = extractelement <4 x float> %399, i32 0
  %401 = extractelement <4 x float> %399, i32 1
  %402 = extractelement <4 x float> %399, i32 2
  %403 = extractelement <4 x float> %399, i32 3
  %404 = fmul reassoc nsz arcp contract float %369, %400, !spirv.Decorations !856
  %405 = fmul reassoc nsz arcp contract float %369, %401, !spirv.Decorations !856
  %406 = fmul reassoc nsz arcp contract float %369, %402, !spirv.Decorations !856
  %407 = fmul reassoc nsz arcp contract float %369, %403, !spirv.Decorations !856
  %408 = fadd reassoc nsz arcp contract float %395, %404, !spirv.Decorations !856
  %409 = fadd reassoc nsz arcp contract float %396, %405, !spirv.Decorations !856
  %410 = fadd reassoc nsz arcp contract float %397, %406, !spirv.Decorations !856
  %411 = fadd reassoc nsz arcp contract float %398, %407, !spirv.Decorations !856
  %412 = insertelement <4 x float> undef, float %408, i32 0
  %413 = insertelement <4 x float> %412, float %409, i32 1
  %414 = insertelement <4 x float> %413, float %410, i32 2
  %415 = insertelement <4 x float> %414, float %411, i32 3
  store <4 x float> %415, ptr %389, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %19)
  %416 = add nuw nsw i32 %377, 1, !spirv.Decorations !853
  br label %376, !llvm.loop !1470

417:                                              ; preds = %384
  %418 = or i32 %383, %385
  %419 = zext i32 %418 to i64
  %420 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE-ExtSLM, i64 %419
  %421 = load float, ptr addrspace(3) %420, align 4
  %422 = zext i32 %385 to i64
  %423 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %19, i64 0, i32 0, i64 %422
  store float %421, ptr %423, align 4
  %424 = add nuw nsw i32 %385, 1, !spirv.Decorations !853
  br label %384, !llvm.loop !1471

425:                                              ; preds = %436, %316
  %426 = phi i32 [ 0, %316 ], [ %437, %436 ]
  %427 = icmp ult i32 %426, 4
  br i1 %427, label %428, label %.loopexit

428:                                              ; preds = %425
  %429 = shl nuw nsw i32 %426, 6, !spirv.Decorations !853
  %430 = add nuw nsw i32 %429, %324, !spirv.Decorations !853
  %431 = zext i32 %426 to i64
  %432 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %431
  br label %433

433:                                              ; preds = %438, %428
  %434 = phi i32 [ 0, %428 ], [ %447, %438 ]
  %435 = icmp ult i32 %434, 4
  br i1 %435, label %438, label %436

436:                                              ; preds = %433
  %437 = add nuw nsw i32 %426, 1, !spirv.Decorations !853
  br label %425, !llvm.loop !1472

438:                                              ; preds = %433
  %439 = zext i32 %434 to i64
  %440 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %432, i64 0, i32 0, i64 %439
  %441 = load float, ptr %440, align 4
  %442 = fdiv reassoc nsz arcp contract float %441, %317
  %443 = fptrunc float %442 to half
  %444 = or i32 %430, %434
  %445 = zext i32 %444 to i64
  %446 = getelementptr inbounds half, ptr addrspace(1) %323, i64 %445
  store half %443, ptr addrspace(1) %446, align 2
  %447 = add nuw nsw i32 %434, 1, !spirv.Decorations !853
  br label %433, !llvm.loop !1473

.loopexit:                                        ; preds = %425
  br label %448

448:                                              ; preds = %.loopexit, %282
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 24
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 7, !spirv.Decorations !871
  %72 = sdiv i32 %71, 8
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = getelementptr float, ptr addrspace(1) %2, i64 %80
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.214, i64 16, i1 false)
  br label %76, !llvm.loop !1474

86:                                               ; preds = %94, %79
  %87 = phi i32 [ %101, %94 ], [ %73, %79 ]
  %88 = phi float [ %100, %94 ], [ 0xFFF0000000000000, %79 ]
  %89 = icmp slt i32 %87, %75
  br i1 %89, label %94, label %90

90:                                               ; preds = %86
  %91 = sext i32 %61 to i64
  %92 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !856
  %93 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %102

94:                                               ; preds = %86
  %95 = add nsw i32 %62, %87, !spirv.Decorations !871
  %96 = sext i32 %95 to i64
  %97 = shl nsw i64 %96, 6, !spirv.Decorations !871
  %98 = getelementptr float, ptr addrspace(1) %81, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = call float @llvm.maxnum.f32(float %88, float %99)
  %101 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

102:                                              ; preds = %142, %90
  %103 = phi i32 [ %143, %142 ], [ %73, %90 ]
  %104 = phi float [ %136, %142 ], [ 0.000000e+00, %90 ]
  %105 = icmp slt i32 %103, %75
  br i1 %105, label %108, label %106

106:                                              ; preds = %102
  %107 = icmp eq i16 %simdLaneId16, 0
  br i1 %107, label %184, label %188

108:                                              ; preds = %102
  %109 = add nsw i32 %62, %103, !spirv.Decorations !871
  %110 = sext i32 %109 to i64
  %111 = shl nsw i64 %110, 6, !spirv.Decorations !871
  %112 = add nsw i64 %111, %91, !spirv.Decorations !871
  %113 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %112
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fcmp reassoc nsz arcp contract oeq float %114, 0xFFF0000000000000, !spirv.Decorations !856
  %118 = or i1 %117, %92
  br i1 %118, label %133, label %119

119:                                              ; preds = %108
  %120 = fsub reassoc nsz arcp contract float %114, %88, !spirv.Decorations !856
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = call float @llvm.trunc.f32(float %121)
  %123 = call float @llvm.fma.f32(float %122, float 0xBFE62E4000000000, float %120)
  %124 = call float @llvm.fma.f32(float %122, float 0xBEB7F7D1C0000000, float %123)
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.exp2.f32(float %122)
  %127 = call float @llvm.exp2.f32(float %125)
  %128 = fmul float %126, %127
  %129 = fcmp olt float %120, -1.050000e+02
  %130 = select i1 %129, float 0.000000e+00, float %128
  %131 = fcmp ogt float %120, 1.050000e+02
  %132 = select i1 %131, float 0x7FF0000000000000, float %130
  br label %133

133:                                              ; preds = %119, %108
  %134 = phi float [ %132, %119 ], [ 0.000000e+00, %108 ]
  %135 = fmul reassoc nsz arcp contract float %134, %116, !spirv.Decorations !856
  %136 = fadd reassoc nsz arcp contract float %104, %135, !spirv.Decorations !856
  %137 = shl nsw i64 %112, 8, !spirv.Decorations !871
  %138 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %137
  br label %139

139:                                              ; preds = %158, %133
  %140 = phi i32 [ 0, %133 ], [ %183, %158 ]
  %141 = icmp ult i32 %140, 4
  br i1 %141, label %144, label %142

142:                                              ; preds = %139
  %143 = add nsw i32 %103, 1, !spirv.Decorations !871
  br label %102

144:                                              ; preds = %139
  %145 = shl nuw nsw i32 %140, 6, !spirv.Decorations !853
  %146 = add nuw nsw i32 %145, %93, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, ptr addrspace(1) %138, i64 %147
  br label %149

149:                                              ; preds = %152, %144
  %150 = phi i32 [ 0, %144 ], [ %157, %152 ]
  %151 = icmp ult i32 %150, 4
  br i1 %151, label %152, label %158

152:                                              ; preds = %149
  %153 = zext i32 %150 to i64
  %154 = getelementptr inbounds float, ptr addrspace(1) %148, i64 %153
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %153
  store float %155, ptr %156, align 4
  %157 = add nuw nsw i32 %150, 1, !spirv.Decorations !853
  br label %149

158:                                              ; preds = %149
  %159 = zext i32 %140 to i64
  %160 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %159
  %161 = load <4 x float>, ptr %160, align 16, !noalias !1475
  %162 = extractelement <4 x float> %161, i32 0
  %163 = extractelement <4 x float> %161, i32 1
  %164 = extractelement <4 x float> %161, i32 2
  %165 = extractelement <4 x float> %161, i32 3
  %166 = load <4 x float>, ptr %17, align 16, !noalias !1484
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %135, %167, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %135, %168, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %135, %169, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %135, %170, !spirv.Decorations !856
  %175 = fadd reassoc nsz arcp contract float %162, %171, !spirv.Decorations !856
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !856
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !856
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !856
  %179 = insertelement <4 x float> undef, float %175, i32 0
  %180 = insertelement <4 x float> %179, float %176, i32 1
  %181 = insertelement <4 x float> %180, float %177, i32 2
  %182 = insertelement <4 x float> %181, float %178, i32 3
  store <4 x float> %182, ptr %160, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %183 = add nuw nsw i32 %140, 1, !spirv.Decorations !853
  br label %139, !llvm.loop !1493

184:                                              ; preds = %106
  %185 = zext i8 %28 to i64
  %186 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM, i64 %185
  store float %88, ptr addrspace(3) %186, align 4
  %187 = getelementptr float, ptr addrspace(3) %186, i64 8
  store float %104, ptr addrspace(3) %187, align 4
  br label %188

188:                                              ; preds = %184, %106
  %189 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %190 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %191 = or i32 %190, 16
  %192 = add nuw nsw i32 %189, %191, !spirv.Decorations !853
  br label %193

193:                                              ; preds = %206, %188
  %194 = phi i32 [ 0, %188 ], [ %207, %206 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %197 = icmp eq i8 %28, 0
  br i1 %197, label %.preheader1, label %348

.preheader1:                                      ; preds = %196
  br label %216

198:                                              ; preds = %193
  %199 = shl nuw nsw i32 %194, 6, !spirv.Decorations !853
  %200 = zext i32 %194 to i64
  %201 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %200
  %202 = add nuw nsw i32 %199, %192, !spirv.Decorations !853
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %215, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %194, 1, !spirv.Decorations !853
  br label %193, !llvm.loop !1494

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %201, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = or i32 %202, %204
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM, i64 %213
  store float %211, ptr addrspace(3) %214, align 4
  %215 = add nuw nsw i32 %204, 1, !spirv.Decorations !853
  br label %203, !llvm.loop !1495

216:                                              ; preds = %219, %.preheader1
  %217 = phi i32 [ %222, %219 ], [ 0, %.preheader1 ]
  %218 = icmp ult i32 %217, 4
  br i1 %218, label %219, label %.preheader

.preheader:                                       ; preds = %216
  br label %223

219:                                              ; preds = %216
  %220 = zext i32 %217 to i64
  %221 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %220
  %222 = add nuw nsw i32 %217, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %221, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.215, i64 16, i1 false)
  br label %216, !llvm.loop !1496

223:                                              ; preds = %230, %.preheader
  %224 = phi i32 [ %235, %230 ], [ 0, %.preheader ]
  %225 = phi float [ %234, %230 ], [ 0xFFF0000000000000, %.preheader ]
  %226 = icmp ult i32 %224, 8
  br i1 %226, label %230, label %227

227:                                              ; preds = %223
  %228 = fcmp reassoc nsz arcp contract oeq float %225, 0xFFF0000000000000, !spirv.Decorations !856
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %236

230:                                              ; preds = %223
  %231 = zext i32 %224 to i64
  %232 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM, i64 %231
  %233 = load float, ptr addrspace(3) %232, align 4
  %234 = call float @llvm.maxnum.f32(float %225, float %233)
  %235 = add nuw nsw i32 %224, 1, !spirv.Decorations !853
  br label %223

236:                                              ; preds = %283, %227
  %237 = phi i32 [ %284, %283 ], [ 0, %227 ]
  %238 = phi float [ %276, %283 ], [ 0.000000e+00, %227 ]
  %239 = icmp ult i32 %237, 8
  br i1 %239, label %249, label %240

240:                                              ; preds = %236
  %241 = call float @llvm.maxnum.f32(float %238, float 0x3BC79CA100000000)
  %242 = mul nuw i32 %54, 24, !spirv.Decorations !904
  %243 = zext i32 %242 to i64
  %244 = sext i32 %56 to i64
  %245 = add nsw i64 %243, %244, !spirv.Decorations !871
  %246 = shl nsw i64 %245, 8, !spirv.Decorations !871
  %247 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %246
  %248 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %325

249:                                              ; preds = %236
  %250 = zext i32 %237 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM, i64 %250
  %252 = load float, ptr addrspace(3) %251, align 4
  %253 = zext i32 %237 to i64
  %254 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM, i64 0, i64 32
  %255 = getelementptr inbounds float, ptr addrspace(3) %254, i64 %253
  %256 = load float, ptr addrspace(3) %255, align 4
  %257 = fcmp reassoc nsz arcp contract oeq float %252, 0xFFF0000000000000, !spirv.Decorations !856
  %258 = or i1 %257, %228
  br i1 %258, label %273, label %259

259:                                              ; preds = %249
  %260 = fsub reassoc nsz arcp contract float %252, %225, !spirv.Decorations !856
  %261 = fmul float %260, 0x3FF7154760000000
  %262 = call float @llvm.trunc.f32(float %261)
  %263 = call float @llvm.fma.f32(float %262, float 0xBFE62E4000000000, float %260)
  %264 = call float @llvm.fma.f32(float %262, float 0xBEB7F7D1C0000000, float %263)
  %265 = fmul float %264, 0x3FF7154760000000
  %266 = call float @llvm.exp2.f32(float %262)
  %267 = call float @llvm.exp2.f32(float %265)
  %268 = fmul float %266, %267
  %269 = fcmp olt float %260, -1.050000e+02
  %270 = select i1 %269, float 0.000000e+00, float %268
  %271 = fcmp ogt float %260, 1.050000e+02
  %272 = select i1 %271, float 0x7FF0000000000000, float %270
  br label %273

273:                                              ; preds = %259, %249
  %274 = phi float [ %272, %259 ], [ 0.000000e+00, %249 ]
  %275 = fmul reassoc nsz arcp contract float %274, %256, !spirv.Decorations !856
  %276 = fadd reassoc nsz arcp contract float %238, %275, !spirv.Decorations !856
  %277 = shl nuw nsw i32 %237, 8, !spirv.Decorations !853
  %278 = or i32 %277, 16
  %279 = add nuw nsw i32 %229, %278, !spirv.Decorations !853
  br label %280

280:                                              ; preds = %291, %273
  %281 = phi i32 [ 0, %273 ], [ %316, %291 ]
  %282 = icmp ult i32 %281, 4
  br i1 %282, label %285, label %283

283:                                              ; preds = %280
  %284 = add nuw nsw i32 %237, 1, !spirv.Decorations !853
  br label %236

285:                                              ; preds = %280
  %286 = shl nuw nsw i32 %281, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %287 = add nuw nsw i32 %286, %279, !spirv.Decorations !853
  br label %288

288:                                              ; preds = %317, %285
  %289 = phi i32 [ 0, %285 ], [ %324, %317 ]
  %290 = icmp ult i32 %289, 4
  br i1 %290, label %317, label %291

291:                                              ; preds = %288
  %292 = zext i32 %281 to i64
  %293 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %292
  %294 = load <4 x float>, ptr %293, align 16, !noalias !1497
  %295 = extractelement <4 x float> %294, i32 0
  %296 = extractelement <4 x float> %294, i32 1
  %297 = extractelement <4 x float> %294, i32 2
  %298 = extractelement <4 x float> %294, i32 3
  %299 = load <4 x float>, ptr %18, align 16, !noalias !1506
  %300 = extractelement <4 x float> %299, i32 0
  %301 = extractelement <4 x float> %299, i32 1
  %302 = extractelement <4 x float> %299, i32 2
  %303 = extractelement <4 x float> %299, i32 3
  %304 = fmul reassoc nsz arcp contract float %274, %300, !spirv.Decorations !856
  %305 = fmul reassoc nsz arcp contract float %274, %301, !spirv.Decorations !856
  %306 = fmul reassoc nsz arcp contract float %274, %302, !spirv.Decorations !856
  %307 = fmul reassoc nsz arcp contract float %274, %303, !spirv.Decorations !856
  %308 = fadd reassoc nsz arcp contract float %295, %304, !spirv.Decorations !856
  %309 = fadd reassoc nsz arcp contract float %296, %305, !spirv.Decorations !856
  %310 = fadd reassoc nsz arcp contract float %297, %306, !spirv.Decorations !856
  %311 = fadd reassoc nsz arcp contract float %298, %307, !spirv.Decorations !856
  %312 = insertelement <4 x float> undef, float %308, i32 0
  %313 = insertelement <4 x float> %312, float %309, i32 1
  %314 = insertelement <4 x float> %313, float %310, i32 2
  %315 = insertelement <4 x float> %314, float %311, i32 3
  store <4 x float> %315, ptr %293, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %316 = add nuw nsw i32 %281, 1, !spirv.Decorations !853
  br label %280, !llvm.loop !1515

317:                                              ; preds = %288
  %318 = or i32 %287, %289
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM, i64 %319
  %321 = load float, ptr addrspace(3) %320, align 4
  %322 = zext i32 %289 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %322
  store float %321, ptr %323, align 4
  %324 = add nuw nsw i32 %289, 1, !spirv.Decorations !853
  br label %288, !llvm.loop !1516

325:                                              ; preds = %336, %240
  %326 = phi i32 [ 0, %240 ], [ %337, %336 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %328, label %.loopexit

328:                                              ; preds = %325
  %329 = shl nuw nsw i32 %326, 6, !spirv.Decorations !853
  %330 = add nuw nsw i32 %329, %248, !spirv.Decorations !853
  %331 = zext i32 %326 to i64
  %332 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %331
  br label %333

333:                                              ; preds = %338, %328
  %334 = phi i32 [ 0, %328 ], [ %347, %338 ]
  %335 = icmp ult i32 %334, 4
  br i1 %335, label %338, label %336

336:                                              ; preds = %333
  %337 = add nuw nsw i32 %326, 1, !spirv.Decorations !853
  br label %325, !llvm.loop !1517

338:                                              ; preds = %333
  %339 = zext i32 %334 to i64
  %340 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %332, i64 0, i32 0, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = fdiv reassoc nsz arcp contract float %341, %241
  %343 = fptrunc float %342 to half
  %344 = or i32 %330, %334
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds half, ptr addrspace(1) %247, i64 %345
  store half %343, ptr addrspace(1) %346, align 2
  %347 = add nuw nsw i32 %334, 1, !spirv.Decorations !853
  br label %333, !llvm.loop !1518

.loopexit:                                        ; preds = %325
  br label %348

348:                                              ; preds = %.loopexit, %196
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 24
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 15, !spirv.Decorations !871
  %72 = sdiv i32 %71, 16
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = getelementptr float, ptr addrspace(1) %2, i64 %80
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.216, i64 16, i1 false)
  br label %76, !llvm.loop !1519

86:                                               ; preds = %94, %79
  %87 = phi i32 [ %101, %94 ], [ %73, %79 ]
  %88 = phi float [ %100, %94 ], [ 0xFFF0000000000000, %79 ]
  %89 = icmp slt i32 %87, %75
  br i1 %89, label %94, label %90

90:                                               ; preds = %86
  %91 = sext i32 %61 to i64
  %92 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !856
  %93 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %102

94:                                               ; preds = %86
  %95 = add nsw i32 %62, %87, !spirv.Decorations !871
  %96 = sext i32 %95 to i64
  %97 = shl nsw i64 %96, 6, !spirv.Decorations !871
  %98 = getelementptr float, ptr addrspace(1) %81, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = call float @llvm.maxnum.f32(float %88, float %99)
  %101 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

102:                                              ; preds = %142, %90
  %103 = phi i32 [ %143, %142 ], [ %73, %90 ]
  %104 = phi float [ %136, %142 ], [ 0.000000e+00, %90 ]
  %105 = icmp slt i32 %103, %75
  br i1 %105, label %108, label %106

106:                                              ; preds = %102
  %107 = icmp eq i16 %simdLaneId16, 0
  br i1 %107, label %184, label %188

108:                                              ; preds = %102
  %109 = add nsw i32 %62, %103, !spirv.Decorations !871
  %110 = sext i32 %109 to i64
  %111 = shl nsw i64 %110, 6, !spirv.Decorations !871
  %112 = add nsw i64 %111, %91, !spirv.Decorations !871
  %113 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %112
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fcmp reassoc nsz arcp contract oeq float %114, 0xFFF0000000000000, !spirv.Decorations !856
  %118 = or i1 %117, %92
  br i1 %118, label %133, label %119

119:                                              ; preds = %108
  %120 = fsub reassoc nsz arcp contract float %114, %88, !spirv.Decorations !856
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = call float @llvm.trunc.f32(float %121)
  %123 = call float @llvm.fma.f32(float %122, float 0xBFE62E4000000000, float %120)
  %124 = call float @llvm.fma.f32(float %122, float 0xBEB7F7D1C0000000, float %123)
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.exp2.f32(float %122)
  %127 = call float @llvm.exp2.f32(float %125)
  %128 = fmul float %126, %127
  %129 = fcmp olt float %120, -1.050000e+02
  %130 = select i1 %129, float 0.000000e+00, float %128
  %131 = fcmp ogt float %120, 1.050000e+02
  %132 = select i1 %131, float 0x7FF0000000000000, float %130
  br label %133

133:                                              ; preds = %119, %108
  %134 = phi float [ %132, %119 ], [ 0.000000e+00, %108 ]
  %135 = fmul reassoc nsz arcp contract float %134, %116, !spirv.Decorations !856
  %136 = fadd reassoc nsz arcp contract float %104, %135, !spirv.Decorations !856
  %137 = shl nsw i64 %112, 8, !spirv.Decorations !871
  %138 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %137
  br label %139

139:                                              ; preds = %158, %133
  %140 = phi i32 [ 0, %133 ], [ %183, %158 ]
  %141 = icmp ult i32 %140, 4
  br i1 %141, label %144, label %142

142:                                              ; preds = %139
  %143 = add nsw i32 %103, 1, !spirv.Decorations !871
  br label %102

144:                                              ; preds = %139
  %145 = shl nuw nsw i32 %140, 6, !spirv.Decorations !853
  %146 = add nuw nsw i32 %145, %93, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, ptr addrspace(1) %138, i64 %147
  br label %149

149:                                              ; preds = %152, %144
  %150 = phi i32 [ 0, %144 ], [ %157, %152 ]
  %151 = icmp ult i32 %150, 4
  br i1 %151, label %152, label %158

152:                                              ; preds = %149
  %153 = zext i32 %150 to i64
  %154 = getelementptr inbounds float, ptr addrspace(1) %148, i64 %153
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %153
  store float %155, ptr %156, align 4
  %157 = add nuw nsw i32 %150, 1, !spirv.Decorations !853
  br label %149

158:                                              ; preds = %149
  %159 = zext i32 %140 to i64
  %160 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %159
  %161 = load <4 x float>, ptr %160, align 16, !noalias !1520
  %162 = extractelement <4 x float> %161, i32 0
  %163 = extractelement <4 x float> %161, i32 1
  %164 = extractelement <4 x float> %161, i32 2
  %165 = extractelement <4 x float> %161, i32 3
  %166 = load <4 x float>, ptr %17, align 16, !noalias !1529
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %135, %167, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %135, %168, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %135, %169, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %135, %170, !spirv.Decorations !856
  %175 = fadd reassoc nsz arcp contract float %162, %171, !spirv.Decorations !856
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !856
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !856
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !856
  %179 = insertelement <4 x float> undef, float %175, i32 0
  %180 = insertelement <4 x float> %179, float %176, i32 1
  %181 = insertelement <4 x float> %180, float %177, i32 2
  %182 = insertelement <4 x float> %181, float %178, i32 3
  store <4 x float> %182, ptr %160, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %183 = add nuw nsw i32 %140, 1, !spirv.Decorations !853
  br label %139, !llvm.loop !1538

184:                                              ; preds = %106
  %185 = zext i8 %28 to i64
  %186 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM, i64 %185
  store float %88, ptr addrspace(3) %186, align 4
  %187 = getelementptr float, ptr addrspace(3) %186, i64 16
  store float %104, ptr addrspace(3) %187, align 4
  br label %188

188:                                              ; preds = %184, %106
  %189 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %190 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %191 = or i32 %190, 32
  %192 = add nuw nsw i32 %189, %191, !spirv.Decorations !853
  br label %193

193:                                              ; preds = %206, %188
  %194 = phi i32 [ 0, %188 ], [ %207, %206 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %197 = icmp eq i8 %28, 0
  br i1 %197, label %.preheader1, label %348

.preheader1:                                      ; preds = %196
  br label %216

198:                                              ; preds = %193
  %199 = shl nuw nsw i32 %194, 6, !spirv.Decorations !853
  %200 = zext i32 %194 to i64
  %201 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %200
  %202 = add nuw nsw i32 %199, %192, !spirv.Decorations !853
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %215, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %194, 1, !spirv.Decorations !853
  br label %193, !llvm.loop !1539

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %201, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = or i32 %202, %204
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM, i64 %213
  store float %211, ptr addrspace(3) %214, align 4
  %215 = add nuw nsw i32 %204, 1, !spirv.Decorations !853
  br label %203, !llvm.loop !1540

216:                                              ; preds = %219, %.preheader1
  %217 = phi i32 [ %222, %219 ], [ 0, %.preheader1 ]
  %218 = icmp ult i32 %217, 4
  br i1 %218, label %219, label %.preheader

.preheader:                                       ; preds = %216
  br label %223

219:                                              ; preds = %216
  %220 = zext i32 %217 to i64
  %221 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %220
  %222 = add nuw nsw i32 %217, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %221, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.217, i64 16, i1 false)
  br label %216, !llvm.loop !1541

223:                                              ; preds = %230, %.preheader
  %224 = phi i32 [ %235, %230 ], [ 0, %.preheader ]
  %225 = phi float [ %234, %230 ], [ 0xFFF0000000000000, %.preheader ]
  %226 = icmp ult i32 %224, 16
  br i1 %226, label %230, label %227

227:                                              ; preds = %223
  %228 = fcmp reassoc nsz arcp contract oeq float %225, 0xFFF0000000000000, !spirv.Decorations !856
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %236

230:                                              ; preds = %223
  %231 = zext i32 %224 to i64
  %232 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM, i64 %231
  %233 = load float, ptr addrspace(3) %232, align 4
  %234 = call float @llvm.maxnum.f32(float %225, float %233)
  %235 = add nuw nsw i32 %224, 1, !spirv.Decorations !853
  br label %223

236:                                              ; preds = %283, %227
  %237 = phi i32 [ %284, %283 ], [ 0, %227 ]
  %238 = phi float [ %276, %283 ], [ 0.000000e+00, %227 ]
  %239 = icmp ult i32 %237, 16
  br i1 %239, label %249, label %240

240:                                              ; preds = %236
  %241 = call float @llvm.maxnum.f32(float %238, float 0x3BC79CA100000000)
  %242 = mul nuw i32 %54, 24, !spirv.Decorations !904
  %243 = zext i32 %242 to i64
  %244 = sext i32 %56 to i64
  %245 = add nsw i64 %243, %244, !spirv.Decorations !871
  %246 = shl nsw i64 %245, 8, !spirv.Decorations !871
  %247 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %246
  %248 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %325

249:                                              ; preds = %236
  %250 = zext i32 %237 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM, i64 %250
  %252 = load float, ptr addrspace(3) %251, align 4
  %253 = zext i32 %237 to i64
  %254 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM, i64 0, i64 64
  %255 = getelementptr inbounds float, ptr addrspace(3) %254, i64 %253
  %256 = load float, ptr addrspace(3) %255, align 4
  %257 = fcmp reassoc nsz arcp contract oeq float %252, 0xFFF0000000000000, !spirv.Decorations !856
  %258 = or i1 %257, %228
  br i1 %258, label %273, label %259

259:                                              ; preds = %249
  %260 = fsub reassoc nsz arcp contract float %252, %225, !spirv.Decorations !856
  %261 = fmul float %260, 0x3FF7154760000000
  %262 = call float @llvm.trunc.f32(float %261)
  %263 = call float @llvm.fma.f32(float %262, float 0xBFE62E4000000000, float %260)
  %264 = call float @llvm.fma.f32(float %262, float 0xBEB7F7D1C0000000, float %263)
  %265 = fmul float %264, 0x3FF7154760000000
  %266 = call float @llvm.exp2.f32(float %262)
  %267 = call float @llvm.exp2.f32(float %265)
  %268 = fmul float %266, %267
  %269 = fcmp olt float %260, -1.050000e+02
  %270 = select i1 %269, float 0.000000e+00, float %268
  %271 = fcmp ogt float %260, 1.050000e+02
  %272 = select i1 %271, float 0x7FF0000000000000, float %270
  br label %273

273:                                              ; preds = %259, %249
  %274 = phi float [ %272, %259 ], [ 0.000000e+00, %249 ]
  %275 = fmul reassoc nsz arcp contract float %274, %256, !spirv.Decorations !856
  %276 = fadd reassoc nsz arcp contract float %238, %275, !spirv.Decorations !856
  %277 = shl nuw nsw i32 %237, 8, !spirv.Decorations !853
  %278 = or i32 %277, 32
  %279 = add nuw nsw i32 %229, %278, !spirv.Decorations !853
  br label %280

280:                                              ; preds = %291, %273
  %281 = phi i32 [ 0, %273 ], [ %316, %291 ]
  %282 = icmp ult i32 %281, 4
  br i1 %282, label %285, label %283

283:                                              ; preds = %280
  %284 = add nuw nsw i32 %237, 1, !spirv.Decorations !853
  br label %236

285:                                              ; preds = %280
  %286 = shl nuw nsw i32 %281, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %287 = add nuw nsw i32 %286, %279, !spirv.Decorations !853
  br label %288

288:                                              ; preds = %317, %285
  %289 = phi i32 [ 0, %285 ], [ %324, %317 ]
  %290 = icmp ult i32 %289, 4
  br i1 %290, label %317, label %291

291:                                              ; preds = %288
  %292 = zext i32 %281 to i64
  %293 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %292
  %294 = load <4 x float>, ptr %293, align 16, !noalias !1542
  %295 = extractelement <4 x float> %294, i32 0
  %296 = extractelement <4 x float> %294, i32 1
  %297 = extractelement <4 x float> %294, i32 2
  %298 = extractelement <4 x float> %294, i32 3
  %299 = load <4 x float>, ptr %18, align 16, !noalias !1551
  %300 = extractelement <4 x float> %299, i32 0
  %301 = extractelement <4 x float> %299, i32 1
  %302 = extractelement <4 x float> %299, i32 2
  %303 = extractelement <4 x float> %299, i32 3
  %304 = fmul reassoc nsz arcp contract float %274, %300, !spirv.Decorations !856
  %305 = fmul reassoc nsz arcp contract float %274, %301, !spirv.Decorations !856
  %306 = fmul reassoc nsz arcp contract float %274, %302, !spirv.Decorations !856
  %307 = fmul reassoc nsz arcp contract float %274, %303, !spirv.Decorations !856
  %308 = fadd reassoc nsz arcp contract float %295, %304, !spirv.Decorations !856
  %309 = fadd reassoc nsz arcp contract float %296, %305, !spirv.Decorations !856
  %310 = fadd reassoc nsz arcp contract float %297, %306, !spirv.Decorations !856
  %311 = fadd reassoc nsz arcp contract float %298, %307, !spirv.Decorations !856
  %312 = insertelement <4 x float> undef, float %308, i32 0
  %313 = insertelement <4 x float> %312, float %309, i32 1
  %314 = insertelement <4 x float> %313, float %310, i32 2
  %315 = insertelement <4 x float> %314, float %311, i32 3
  store <4 x float> %315, ptr %293, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %316 = add nuw nsw i32 %281, 1, !spirv.Decorations !853
  br label %280, !llvm.loop !1560

317:                                              ; preds = %288
  %318 = or i32 %287, %289
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM, i64 %319
  %321 = load float, ptr addrspace(3) %320, align 4
  %322 = zext i32 %289 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %322
  store float %321, ptr %323, align 4
  %324 = add nuw nsw i32 %289, 1, !spirv.Decorations !853
  br label %288, !llvm.loop !1561

325:                                              ; preds = %336, %240
  %326 = phi i32 [ 0, %240 ], [ %337, %336 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %328, label %.loopexit

328:                                              ; preds = %325
  %329 = shl nuw nsw i32 %326, 6, !spirv.Decorations !853
  %330 = add nuw nsw i32 %329, %248, !spirv.Decorations !853
  %331 = zext i32 %326 to i64
  %332 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %331
  br label %333

333:                                              ; preds = %338, %328
  %334 = phi i32 [ 0, %328 ], [ %347, %338 ]
  %335 = icmp ult i32 %334, 4
  br i1 %335, label %338, label %336

336:                                              ; preds = %333
  %337 = add nuw nsw i32 %326, 1, !spirv.Decorations !853
  br label %325, !llvm.loop !1562

338:                                              ; preds = %333
  %339 = zext i32 %334 to i64
  %340 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %332, i64 0, i32 0, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = fdiv reassoc nsz arcp contract float %341, %241
  %343 = fptrunc float %342 to half
  %344 = or i32 %330, %334
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds half, ptr addrspace(1) %247, i64 %345
  store half %343, ptr addrspace(1) %346, align 2
  %347 = add nuw nsw i32 %334, 1, !spirv.Decorations !853
  br label %333, !llvm.loop !1563

.loopexit:                                        ; preds = %325
  br label %348

348:                                              ; preds = %.loopexit, %196
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 24
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 31, !spirv.Decorations !871
  %72 = sdiv i32 %71, 32
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = getelementptr float, ptr addrspace(1) %2, i64 %80
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.218, i64 16, i1 false)
  br label %76, !llvm.loop !1564

86:                                               ; preds = %94, %79
  %87 = phi i32 [ %101, %94 ], [ %73, %79 ]
  %88 = phi float [ %100, %94 ], [ 0xFFF0000000000000, %79 ]
  %89 = icmp slt i32 %87, %75
  br i1 %89, label %94, label %90

90:                                               ; preds = %86
  %91 = sext i32 %61 to i64
  %92 = fcmp reassoc nsz arcp contract oeq float %88, 0xFFF0000000000000, !spirv.Decorations !856
  %93 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %102

94:                                               ; preds = %86
  %95 = add nsw i32 %62, %87, !spirv.Decorations !871
  %96 = sext i32 %95 to i64
  %97 = shl nsw i64 %96, 6, !spirv.Decorations !871
  %98 = getelementptr float, ptr addrspace(1) %81, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = call float @llvm.maxnum.f32(float %88, float %99)
  %101 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

102:                                              ; preds = %142, %90
  %103 = phi i32 [ %143, %142 ], [ %73, %90 ]
  %104 = phi float [ %136, %142 ], [ 0.000000e+00, %90 ]
  %105 = icmp slt i32 %103, %75
  br i1 %105, label %108, label %106

106:                                              ; preds = %102
  %107 = icmp eq i16 %simdLaneId16, 0
  br i1 %107, label %184, label %188

108:                                              ; preds = %102
  %109 = add nsw i32 %62, %103, !spirv.Decorations !871
  %110 = sext i32 %109 to i64
  %111 = shl nsw i64 %110, 6, !spirv.Decorations !871
  %112 = add nsw i64 %111, %91, !spirv.Decorations !871
  %113 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %112
  %114 = load float, ptr addrspace(1) %113, align 4
  %115 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %112
  %116 = load float, ptr addrspace(1) %115, align 4
  %117 = fcmp reassoc nsz arcp contract oeq float %114, 0xFFF0000000000000, !spirv.Decorations !856
  %118 = or i1 %117, %92
  br i1 %118, label %133, label %119

119:                                              ; preds = %108
  %120 = fsub reassoc nsz arcp contract float %114, %88, !spirv.Decorations !856
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = call float @llvm.trunc.f32(float %121)
  %123 = call float @llvm.fma.f32(float %122, float 0xBFE62E4000000000, float %120)
  %124 = call float @llvm.fma.f32(float %122, float 0xBEB7F7D1C0000000, float %123)
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.exp2.f32(float %122)
  %127 = call float @llvm.exp2.f32(float %125)
  %128 = fmul float %126, %127
  %129 = fcmp olt float %120, -1.050000e+02
  %130 = select i1 %129, float 0.000000e+00, float %128
  %131 = fcmp ogt float %120, 1.050000e+02
  %132 = select i1 %131, float 0x7FF0000000000000, float %130
  br label %133

133:                                              ; preds = %119, %108
  %134 = phi float [ %132, %119 ], [ 0.000000e+00, %108 ]
  %135 = fmul reassoc nsz arcp contract float %134, %116, !spirv.Decorations !856
  %136 = fadd reassoc nsz arcp contract float %104, %135, !spirv.Decorations !856
  %137 = shl nsw i64 %112, 8, !spirv.Decorations !871
  %138 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %137
  br label %139

139:                                              ; preds = %158, %133
  %140 = phi i32 [ 0, %133 ], [ %183, %158 ]
  %141 = icmp ult i32 %140, 4
  br i1 %141, label %144, label %142

142:                                              ; preds = %139
  %143 = add nsw i32 %103, 1, !spirv.Decorations !871
  br label %102

144:                                              ; preds = %139
  %145 = shl nuw nsw i32 %140, 6, !spirv.Decorations !853
  %146 = add nuw nsw i32 %145, %93, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds float, ptr addrspace(1) %138, i64 %147
  br label %149

149:                                              ; preds = %152, %144
  %150 = phi i32 [ 0, %144 ], [ %157, %152 ]
  %151 = icmp ult i32 %150, 4
  br i1 %151, label %152, label %158

152:                                              ; preds = %149
  %153 = zext i32 %150 to i64
  %154 = getelementptr inbounds float, ptr addrspace(1) %148, i64 %153
  %155 = load float, ptr addrspace(1) %154, align 4
  %156 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %153
  store float %155, ptr %156, align 4
  %157 = add nuw nsw i32 %150, 1, !spirv.Decorations !853
  br label %149

158:                                              ; preds = %149
  %159 = zext i32 %140 to i64
  %160 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %159
  %161 = load <4 x float>, ptr %160, align 16, !noalias !1565
  %162 = extractelement <4 x float> %161, i32 0
  %163 = extractelement <4 x float> %161, i32 1
  %164 = extractelement <4 x float> %161, i32 2
  %165 = extractelement <4 x float> %161, i32 3
  %166 = load <4 x float>, ptr %17, align 16, !noalias !1574
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %135, %167, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %135, %168, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %135, %169, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %135, %170, !spirv.Decorations !856
  %175 = fadd reassoc nsz arcp contract float %162, %171, !spirv.Decorations !856
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !856
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !856
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !856
  %179 = insertelement <4 x float> undef, float %175, i32 0
  %180 = insertelement <4 x float> %179, float %176, i32 1
  %181 = insertelement <4 x float> %180, float %177, i32 2
  %182 = insertelement <4 x float> %181, float %178, i32 3
  store <4 x float> %182, ptr %160, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %183 = add nuw nsw i32 %140, 1, !spirv.Decorations !853
  br label %139, !llvm.loop !1583

184:                                              ; preds = %106
  %185 = zext i8 %28 to i64
  %186 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM, i64 %185
  store float %88, ptr addrspace(3) %186, align 4
  %187 = getelementptr float, ptr addrspace(3) %186, i64 32
  store float %104, ptr addrspace(3) %187, align 4
  br label %188

188:                                              ; preds = %184, %106
  %189 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %190 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %191 = or i32 %190, 64
  %192 = add nuw nsw i32 %189, %191, !spirv.Decorations !853
  br label %193

193:                                              ; preds = %206, %188
  %194 = phi i32 [ 0, %188 ], [ %207, %206 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %197 = icmp eq i8 %28, 0
  br i1 %197, label %.preheader1, label %348

.preheader1:                                      ; preds = %196
  br label %216

198:                                              ; preds = %193
  %199 = shl nuw nsw i32 %194, 6, !spirv.Decorations !853
  %200 = zext i32 %194 to i64
  %201 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %200
  %202 = add nuw nsw i32 %199, %192, !spirv.Decorations !853
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %215, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %194, 1, !spirv.Decorations !853
  br label %193, !llvm.loop !1584

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %201, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = or i32 %202, %204
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM, i64 %213
  store float %211, ptr addrspace(3) %214, align 4
  %215 = add nuw nsw i32 %204, 1, !spirv.Decorations !853
  br label %203, !llvm.loop !1585

216:                                              ; preds = %219, %.preheader1
  %217 = phi i32 [ %222, %219 ], [ 0, %.preheader1 ]
  %218 = icmp ult i32 %217, 4
  br i1 %218, label %219, label %.preheader

.preheader:                                       ; preds = %216
  br label %223

219:                                              ; preds = %216
  %220 = zext i32 %217 to i64
  %221 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %220
  %222 = add nuw nsw i32 %217, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %221, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.219, i64 16, i1 false)
  br label %216, !llvm.loop !1586

223:                                              ; preds = %230, %.preheader
  %224 = phi i32 [ %235, %230 ], [ 0, %.preheader ]
  %225 = phi float [ %234, %230 ], [ 0xFFF0000000000000, %.preheader ]
  %226 = icmp ult i32 %224, 32
  br i1 %226, label %230, label %227

227:                                              ; preds = %223
  %228 = fcmp reassoc nsz arcp contract oeq float %225, 0xFFF0000000000000, !spirv.Decorations !856
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %236

230:                                              ; preds = %223
  %231 = zext i32 %224 to i64
  %232 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM, i64 %231
  %233 = load float, ptr addrspace(3) %232, align 4
  %234 = call float @llvm.maxnum.f32(float %225, float %233)
  %235 = add nuw nsw i32 %224, 1, !spirv.Decorations !853
  br label %223

236:                                              ; preds = %283, %227
  %237 = phi i32 [ %284, %283 ], [ 0, %227 ]
  %238 = phi float [ %276, %283 ], [ 0.000000e+00, %227 ]
  %239 = icmp ult i32 %237, 32
  br i1 %239, label %249, label %240

240:                                              ; preds = %236
  %241 = call float @llvm.maxnum.f32(float %238, float 0x3BC79CA100000000)
  %242 = mul nuw i32 %54, 24, !spirv.Decorations !904
  %243 = zext i32 %242 to i64
  %244 = sext i32 %56 to i64
  %245 = add nsw i64 %243, %244, !spirv.Decorations !871
  %246 = shl nsw i64 %245, 8, !spirv.Decorations !871
  %247 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %246
  %248 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %325

249:                                              ; preds = %236
  %250 = zext i32 %237 to i64
  %251 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM, i64 %250
  %252 = load float, ptr addrspace(3) %251, align 4
  %253 = zext i32 %237 to i64
  %254 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM, i64 0, i64 128
  %255 = getelementptr inbounds float, ptr addrspace(3) %254, i64 %253
  %256 = load float, ptr addrspace(3) %255, align 4
  %257 = fcmp reassoc nsz arcp contract oeq float %252, 0xFFF0000000000000, !spirv.Decorations !856
  %258 = or i1 %257, %228
  br i1 %258, label %273, label %259

259:                                              ; preds = %249
  %260 = fsub reassoc nsz arcp contract float %252, %225, !spirv.Decorations !856
  %261 = fmul float %260, 0x3FF7154760000000
  %262 = call float @llvm.trunc.f32(float %261)
  %263 = call float @llvm.fma.f32(float %262, float 0xBFE62E4000000000, float %260)
  %264 = call float @llvm.fma.f32(float %262, float 0xBEB7F7D1C0000000, float %263)
  %265 = fmul float %264, 0x3FF7154760000000
  %266 = call float @llvm.exp2.f32(float %262)
  %267 = call float @llvm.exp2.f32(float %265)
  %268 = fmul float %266, %267
  %269 = fcmp olt float %260, -1.050000e+02
  %270 = select i1 %269, float 0.000000e+00, float %268
  %271 = fcmp ogt float %260, 1.050000e+02
  %272 = select i1 %271, float 0x7FF0000000000000, float %270
  br label %273

273:                                              ; preds = %259, %249
  %274 = phi float [ %272, %259 ], [ 0.000000e+00, %249 ]
  %275 = fmul reassoc nsz arcp contract float %274, %256, !spirv.Decorations !856
  %276 = fadd reassoc nsz arcp contract float %238, %275, !spirv.Decorations !856
  %277 = shl nuw nsw i32 %237, 8, !spirv.Decorations !853
  %278 = or i32 %277, 64
  %279 = add nuw nsw i32 %229, %278, !spirv.Decorations !853
  br label %280

280:                                              ; preds = %291, %273
  %281 = phi i32 [ 0, %273 ], [ %316, %291 ]
  %282 = icmp ult i32 %281, 4
  br i1 %282, label %285, label %283

283:                                              ; preds = %280
  %284 = add nuw nsw i32 %237, 1, !spirv.Decorations !853
  br label %236

285:                                              ; preds = %280
  %286 = shl nuw nsw i32 %281, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %287 = add nuw nsw i32 %286, %279, !spirv.Decorations !853
  br label %288

288:                                              ; preds = %317, %285
  %289 = phi i32 [ 0, %285 ], [ %324, %317 ]
  %290 = icmp ult i32 %289, 4
  br i1 %290, label %317, label %291

291:                                              ; preds = %288
  %292 = zext i32 %281 to i64
  %293 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %292
  %294 = load <4 x float>, ptr %293, align 16, !noalias !1587
  %295 = extractelement <4 x float> %294, i32 0
  %296 = extractelement <4 x float> %294, i32 1
  %297 = extractelement <4 x float> %294, i32 2
  %298 = extractelement <4 x float> %294, i32 3
  %299 = load <4 x float>, ptr %18, align 16, !noalias !1596
  %300 = extractelement <4 x float> %299, i32 0
  %301 = extractelement <4 x float> %299, i32 1
  %302 = extractelement <4 x float> %299, i32 2
  %303 = extractelement <4 x float> %299, i32 3
  %304 = fmul reassoc nsz arcp contract float %274, %300, !spirv.Decorations !856
  %305 = fmul reassoc nsz arcp contract float %274, %301, !spirv.Decorations !856
  %306 = fmul reassoc nsz arcp contract float %274, %302, !spirv.Decorations !856
  %307 = fmul reassoc nsz arcp contract float %274, %303, !spirv.Decorations !856
  %308 = fadd reassoc nsz arcp contract float %295, %304, !spirv.Decorations !856
  %309 = fadd reassoc nsz arcp contract float %296, %305, !spirv.Decorations !856
  %310 = fadd reassoc nsz arcp contract float %297, %306, !spirv.Decorations !856
  %311 = fadd reassoc nsz arcp contract float %298, %307, !spirv.Decorations !856
  %312 = insertelement <4 x float> undef, float %308, i32 0
  %313 = insertelement <4 x float> %312, float %309, i32 1
  %314 = insertelement <4 x float> %313, float %310, i32 2
  %315 = insertelement <4 x float> %314, float %311, i32 3
  store <4 x float> %315, ptr %293, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %316 = add nuw nsw i32 %281, 1, !spirv.Decorations !853
  br label %280, !llvm.loop !1605

317:                                              ; preds = %288
  %318 = or i32 %287, %289
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM, i64 %319
  %321 = load float, ptr addrspace(3) %320, align 4
  %322 = zext i32 %289 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %322
  store float %321, ptr %323, align 4
  %324 = add nuw nsw i32 %289, 1, !spirv.Decorations !853
  br label %288, !llvm.loop !1606

325:                                              ; preds = %336, %240
  %326 = phi i32 [ 0, %240 ], [ %337, %336 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %328, label %.loopexit

328:                                              ; preds = %325
  %329 = shl nuw nsw i32 %326, 6, !spirv.Decorations !853
  %330 = add nuw nsw i32 %329, %248, !spirv.Decorations !853
  %331 = zext i32 %326 to i64
  %332 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %331
  br label %333

333:                                              ; preds = %338, %328
  %334 = phi i32 [ 0, %328 ], [ %347, %338 ]
  %335 = icmp ult i32 %334, 4
  br i1 %335, label %338, label %336

336:                                              ; preds = %333
  %337 = add nuw nsw i32 %326, 1, !spirv.Decorations !853
  br label %325, !llvm.loop !1607

338:                                              ; preds = %333
  %339 = zext i32 %334 to i64
  %340 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %332, i64 0, i32 0, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = fdiv reassoc nsz arcp contract float %341, %241
  %343 = fptrunc float %342 to half
  %344 = or i32 %330, %334
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds half, ptr addrspace(1) %247, i64 %345
  store half %343, ptr addrspace(1) %346, align 2
  %347 = add nuw nsw i32 %334, 1, !spirv.Decorations !853
  br label %333, !llvm.loop !1608

.loopexit:                                        ; preds = %325
  br label %348

348:                                              ; preds = %.loopexit, %196
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 24
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 7, !spirv.Decorations !871
  %72 = sdiv i32 %71, 8
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.220, i64 16, i1 false)
  br label %76, !llvm.loop !1609

86:                                               ; preds = %147, %79
  %87 = phi i32 [ %148, %147 ], [ %73, %79 ]
  %88 = phi float [ %141, %147 ], [ 0.000000e+00, %79 ]
  %89 = phi float [ %102, %147 ], [ 0xFFF0000000000000, %79 ]
  %90 = icmp slt i32 %87, %75
  br i1 %90, label %93, label %91

91:                                               ; preds = %86
  %92 = icmp eq i16 %simdLaneId16, 0
  br i1 %92, label %193, label %197

93:                                               ; preds = %86
  %94 = add nsw i32 %62, %87, !spirv.Decorations !871
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !871
  %97 = add nsw i64 %96, %80, !spirv.Decorations !871
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !856
  %106 = fmul float %105, 0x3FF7154760000000
  %107 = call float @llvm.trunc.f32(float %106)
  %108 = call float @llvm.fma.f32(float %107, float 0xBFE62E4000000000, float %105)
  %109 = call float @llvm.fma.f32(float %107, float 0xBEB7F7D1C0000000, float %108)
  %110 = fmul float %109, 0x3FF7154760000000
  %111 = call float @llvm.exp2.f32(float %107)
  %112 = call float @llvm.exp2.f32(float %110)
  %113 = fmul float %111, %112
  %114 = fcmp olt float %105, -1.050000e+02
  %115 = select i1 %114, float 0.000000e+00, float %113
  %116 = fcmp ogt float %105, 1.050000e+02
  %117 = select i1 %116, float 0x7FF0000000000000, float %115
  br label %118

118:                                              ; preds = %104, %93
  %119 = phi float [ %117, %104 ], [ 0.000000e+00, %93 ]
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !856
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !856
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !856
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.trunc.f32(float %125)
  %127 = call float @llvm.fma.f32(float %126, float 0xBFE62E4000000000, float %124)
  %128 = call float @llvm.fma.f32(float %126, float 0xBEB7F7D1C0000000, float %127)
  %129 = fmul float %128, 0x3FF7154760000000
  %130 = call float @llvm.exp2.f32(float %126)
  %131 = call float @llvm.exp2.f32(float %129)
  %132 = fmul float %130, %131
  %133 = fcmp olt float %124, -1.050000e+02
  %134 = select i1 %133, float 0.000000e+00, float %132
  %135 = fcmp ogt float %124, 1.050000e+02
  %136 = select i1 %135, float 0x7FF0000000000000, float %134
  br label %137

137:                                              ; preds = %123, %118
  %138 = phi float [ %136, %123 ], [ 0.000000e+00, %118 ]
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !856
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !856
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !856
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !871
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !853
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, ptr addrspace(1) %143, i64 %152
  br label %154

154:                                              ; preds = %157, %149
  %155 = phi i32 [ 0, %149 ], [ %162, %157 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %157, label %163

157:                                              ; preds = %154
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds float, ptr addrspace(1) %153, i64 %158
  %160 = load float, ptr addrspace(1) %159, align 4
  %161 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %158
  store float %160, ptr %161, align 4
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !853
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !1610
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !856
  %175 = load <4 x float>, ptr %17, align 16, !noalias !1619
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !856
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !856
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !856
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !856
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !856
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !856
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !856
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !856
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !853
  br label %144, !llvm.loop !1628

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 8
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %200 = or i32 %199, 16
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !853
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %371

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !853
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !853
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !853
  br label %202, !llvm.loop !1629

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !853
  br label %212, !llvm.loop !1630

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.221, i64 16, i1 false)
  br label %225, !llvm.loop !1631

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 8
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 24, !spirv.Decorations !904
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !871
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !871
  %246 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE-ExtSLM, i64 0, i64 32
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !856
  %260 = fmul float %259, 0x3FF7154760000000
  %261 = call float @llvm.trunc.f32(float %260)
  %262 = call float @llvm.fma.f32(float %261, float 0xBFE62E4000000000, float %259)
  %263 = call float @llvm.fma.f32(float %261, float 0xBEB7F7D1C0000000, float %262)
  %264 = fmul float %263, 0x3FF7154760000000
  %265 = call float @llvm.exp2.f32(float %261)
  %266 = call float @llvm.exp2.f32(float %264)
  %267 = fmul float %265, %266
  %268 = fcmp olt float %259, -1.050000e+02
  %269 = select i1 %268, float 0.000000e+00, float %267
  %270 = fcmp ogt float %259, 1.050000e+02
  %271 = select i1 %270, float 0x7FF0000000000000, float %269
  br label %272

272:                                              ; preds = %258, %248
  %273 = phi float [ %271, %258 ], [ 0.000000e+00, %248 ]
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !856
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !856
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !856
  %279 = fmul float %278, 0x3FF7154760000000
  %280 = call float @llvm.trunc.f32(float %279)
  %281 = call float @llvm.fma.f32(float %280, float 0xBFE62E4000000000, float %278)
  %282 = call float @llvm.fma.f32(float %280, float 0xBEB7F7D1C0000000, float %281)
  %283 = fmul float %282, 0x3FF7154760000000
  %284 = call float @llvm.exp2.f32(float %280)
  %285 = call float @llvm.exp2.f32(float %283)
  %286 = fmul float %284, %285
  %287 = fcmp olt float %278, -1.050000e+02
  %288 = select i1 %287, float 0.000000e+00, float %286
  %289 = fcmp ogt float %278, 1.050000e+02
  %290 = select i1 %289, float 0x7FF0000000000000, float %288
  br label %291

291:                                              ; preds = %277, %272
  %292 = phi float [ %290, %277 ], [ 0.000000e+00, %272 ]
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !856
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !856
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !856
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !853
  %297 = or i32 %296, 16
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !853
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !853
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !853
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !1632
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !856
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !856
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !856
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !856
  %322 = load <4 x float>, ptr %18, align 16, !noalias !1641
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !856
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !856
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !856
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !856
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !856
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !856
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !856
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !856
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !853
  br label %299, !llvm.loop !1650

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !853
  br label %307, !llvm.loop !1651

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !853
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !853
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %370, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !853
  br label %348, !llvm.loop !1652

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = fptrunc float %365 to half
  %367 = or i32 %353, %357
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds half, ptr addrspace(1) %246, i64 %368
  store half %366, ptr addrspace(1) %369, align 2
  %370 = add nuw nsw i32 %357, 1, !spirv.Decorations !853
  br label %356, !llvm.loop !1653

.loopexit:                                        ; preds = %348
  br label %371

371:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 24
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 15, !spirv.Decorations !871
  %72 = sdiv i32 %71, 16
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.222, i64 16, i1 false)
  br label %76, !llvm.loop !1654

86:                                               ; preds = %147, %79
  %87 = phi i32 [ %148, %147 ], [ %73, %79 ]
  %88 = phi float [ %141, %147 ], [ 0.000000e+00, %79 ]
  %89 = phi float [ %102, %147 ], [ 0xFFF0000000000000, %79 ]
  %90 = icmp slt i32 %87, %75
  br i1 %90, label %93, label %91

91:                                               ; preds = %86
  %92 = icmp eq i16 %simdLaneId16, 0
  br i1 %92, label %193, label %197

93:                                               ; preds = %86
  %94 = add nsw i32 %62, %87, !spirv.Decorations !871
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !871
  %97 = add nsw i64 %96, %80, !spirv.Decorations !871
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !856
  %106 = fmul float %105, 0x3FF7154760000000
  %107 = call float @llvm.trunc.f32(float %106)
  %108 = call float @llvm.fma.f32(float %107, float 0xBFE62E4000000000, float %105)
  %109 = call float @llvm.fma.f32(float %107, float 0xBEB7F7D1C0000000, float %108)
  %110 = fmul float %109, 0x3FF7154760000000
  %111 = call float @llvm.exp2.f32(float %107)
  %112 = call float @llvm.exp2.f32(float %110)
  %113 = fmul float %111, %112
  %114 = fcmp olt float %105, -1.050000e+02
  %115 = select i1 %114, float 0.000000e+00, float %113
  %116 = fcmp ogt float %105, 1.050000e+02
  %117 = select i1 %116, float 0x7FF0000000000000, float %115
  br label %118

118:                                              ; preds = %104, %93
  %119 = phi float [ %117, %104 ], [ 0.000000e+00, %93 ]
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !856
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !856
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !856
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.trunc.f32(float %125)
  %127 = call float @llvm.fma.f32(float %126, float 0xBFE62E4000000000, float %124)
  %128 = call float @llvm.fma.f32(float %126, float 0xBEB7F7D1C0000000, float %127)
  %129 = fmul float %128, 0x3FF7154760000000
  %130 = call float @llvm.exp2.f32(float %126)
  %131 = call float @llvm.exp2.f32(float %129)
  %132 = fmul float %130, %131
  %133 = fcmp olt float %124, -1.050000e+02
  %134 = select i1 %133, float 0.000000e+00, float %132
  %135 = fcmp ogt float %124, 1.050000e+02
  %136 = select i1 %135, float 0x7FF0000000000000, float %134
  br label %137

137:                                              ; preds = %123, %118
  %138 = phi float [ %136, %123 ], [ 0.000000e+00, %118 ]
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !856
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !856
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !856
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !871
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !853
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, ptr addrspace(1) %143, i64 %152
  br label %154

154:                                              ; preds = %157, %149
  %155 = phi i32 [ 0, %149 ], [ %162, %157 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %157, label %163

157:                                              ; preds = %154
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds float, ptr addrspace(1) %153, i64 %158
  %160 = load float, ptr addrspace(1) %159, align 4
  %161 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %158
  store float %160, ptr %161, align 4
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !853
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !1655
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !856
  %175 = load <4 x float>, ptr %17, align 16, !noalias !1664
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !856
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !856
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !856
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !856
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !856
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !856
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !856
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !856
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !853
  br label %144, !llvm.loop !1673

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 16
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %200 = or i32 %199, 32
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !853
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %371

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !853
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !853
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !853
  br label %202, !llvm.loop !1674

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !853
  br label %212, !llvm.loop !1675

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.223, i64 16, i1 false)
  br label %225, !llvm.loop !1676

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 16
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 24, !spirv.Decorations !904
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !871
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !871
  %246 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE-ExtSLM, i64 0, i64 64
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !856
  %260 = fmul float %259, 0x3FF7154760000000
  %261 = call float @llvm.trunc.f32(float %260)
  %262 = call float @llvm.fma.f32(float %261, float 0xBFE62E4000000000, float %259)
  %263 = call float @llvm.fma.f32(float %261, float 0xBEB7F7D1C0000000, float %262)
  %264 = fmul float %263, 0x3FF7154760000000
  %265 = call float @llvm.exp2.f32(float %261)
  %266 = call float @llvm.exp2.f32(float %264)
  %267 = fmul float %265, %266
  %268 = fcmp olt float %259, -1.050000e+02
  %269 = select i1 %268, float 0.000000e+00, float %267
  %270 = fcmp ogt float %259, 1.050000e+02
  %271 = select i1 %270, float 0x7FF0000000000000, float %269
  br label %272

272:                                              ; preds = %258, %248
  %273 = phi float [ %271, %258 ], [ 0.000000e+00, %248 ]
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !856
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !856
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !856
  %279 = fmul float %278, 0x3FF7154760000000
  %280 = call float @llvm.trunc.f32(float %279)
  %281 = call float @llvm.fma.f32(float %280, float 0xBFE62E4000000000, float %278)
  %282 = call float @llvm.fma.f32(float %280, float 0xBEB7F7D1C0000000, float %281)
  %283 = fmul float %282, 0x3FF7154760000000
  %284 = call float @llvm.exp2.f32(float %280)
  %285 = call float @llvm.exp2.f32(float %283)
  %286 = fmul float %284, %285
  %287 = fcmp olt float %278, -1.050000e+02
  %288 = select i1 %287, float 0.000000e+00, float %286
  %289 = fcmp ogt float %278, 1.050000e+02
  %290 = select i1 %289, float 0x7FF0000000000000, float %288
  br label %291

291:                                              ; preds = %277, %272
  %292 = phi float [ %290, %277 ], [ 0.000000e+00, %272 ]
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !856
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !856
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !856
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !853
  %297 = or i32 %296, 32
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !853
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !853
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !853
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !1677
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !856
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !856
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !856
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !856
  %322 = load <4 x float>, ptr %18, align 16, !noalias !1686
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !856
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !856
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !856
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !856
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !856
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !856
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !856
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !856
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !853
  br label %299, !llvm.loop !1695

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !853
  br label %307, !llvm.loop !1696

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !853
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !853
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %370, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !853
  br label %348, !llvm.loop !1697

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = fptrunc float %365 to half
  %367 = or i32 %353, %357
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds half, ptr addrspace(1) %246, i64 %368
  store half %366, ptr addrspace(1) %369, align 2
  %370 = add nuw nsw i32 %357, 1, !spirv.Decorations !853
  br label %356, !llvm.loop !1698

.loopexit:                                        ; preds = %348
  br label %371

371:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %53)
  %54 = udiv i32 %9, 24
  %55 = mul nsw i32 %54, -24, !spirv.Decorations !871
  %56 = add nsw i32 %55, %9, !spirv.Decorations !871
  %57 = sdiv i32 %56, 6
  %58 = mul nuw nsw i32 %54, 6, !spirv.Decorations !853
  %59 = mul nsw i32 %57, -6, !spirv.Decorations !871
  %60 = add nsw i32 %59, %56, !spirv.Decorations !871
  %61 = add nsw i32 %58, %60, !spirv.Decorations !871
  %62 = mul nsw i32 %57, %0, !spirv.Decorations !871
  %63 = load i32, ptr addrspace(1) %1, align 4
  %64 = sext i32 %63 to i64
  %65 = sext i32 %0 to i64
  %66 = add nsw i64 %64, 63, !spirv.Decorations !871
  %67 = sdiv i64 %66, 64
  %68 = call i64 @llvm.smin.i64(i64 %65, i64 %67)
  %69 = call i64 @llvm.smax.i64(i64 %68, i64 1)
  %70 = trunc i64 %69 to i32
  %71 = add nsw i32 %70, 31, !spirv.Decorations !871
  %72 = sdiv i32 %71, 32
  %73 = mul nsw i32 %72, %localThreadId10, !spirv.Decorations !871
  %74 = add nsw i32 %73, %72, !spirv.Decorations !871
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 %70)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %76

76:                                               ; preds = %82, %7
  %77 = phi i32 [ 0, %7 ], [ %85, %82 ]
  %78 = icmp ult i32 %77, 4
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = sext i32 %61 to i64
  %81 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %86

82:                                               ; preds = %76
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %83
  %85 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %84, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.224, i64 16, i1 false)
  br label %76, !llvm.loop !1699

86:                                               ; preds = %147, %79
  %87 = phi i32 [ %148, %147 ], [ %73, %79 ]
  %88 = phi float [ %141, %147 ], [ 0.000000e+00, %79 ]
  %89 = phi float [ %102, %147 ], [ 0xFFF0000000000000, %79 ]
  %90 = icmp slt i32 %87, %75
  br i1 %90, label %93, label %91

91:                                               ; preds = %86
  %92 = icmp eq i16 %simdLaneId16, 0
  br i1 %92, label %193, label %197

93:                                               ; preds = %86
  %94 = add nsw i32 %62, %87, !spirv.Decorations !871
  %95 = sext i32 %94 to i64
  %96 = shl nsw i64 %95, 6, !spirv.Decorations !871
  %97 = add nsw i64 %96, %80, !spirv.Decorations !871
  %98 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4
  %100 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %97
  %101 = load float, ptr addrspace(1) %100, align 4
  %102 = call float @llvm.maxnum.f32(float %89, float %99)
  %103 = fcmp reassoc nsz arcp contract oeq float %89, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %103, label %118, label %104

104:                                              ; preds = %93
  %105 = fsub reassoc nsz arcp contract float %89, %102, !spirv.Decorations !856
  %106 = fmul float %105, 0x3FF7154760000000
  %107 = call float @llvm.trunc.f32(float %106)
  %108 = call float @llvm.fma.f32(float %107, float 0xBFE62E4000000000, float %105)
  %109 = call float @llvm.fma.f32(float %107, float 0xBEB7F7D1C0000000, float %108)
  %110 = fmul float %109, 0x3FF7154760000000
  %111 = call float @llvm.exp2.f32(float %107)
  %112 = call float @llvm.exp2.f32(float %110)
  %113 = fmul float %111, %112
  %114 = fcmp olt float %105, -1.050000e+02
  %115 = select i1 %114, float 0.000000e+00, float %113
  %116 = fcmp ogt float %105, 1.050000e+02
  %117 = select i1 %116, float 0x7FF0000000000000, float %115
  br label %118

118:                                              ; preds = %104, %93
  %119 = phi float [ %117, %104 ], [ 0.000000e+00, %93 ]
  %120 = fcmp reassoc nsz arcp contract oeq float %99, 0xFFF0000000000000, !spirv.Decorations !856
  %121 = fcmp reassoc nsz arcp contract oeq float %102, 0xFFF0000000000000, !spirv.Decorations !856
  %122 = or i1 %120, %121
  br i1 %122, label %137, label %123

123:                                              ; preds = %118
  %124 = fsub reassoc nsz arcp contract float %99, %102, !spirv.Decorations !856
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = call float @llvm.trunc.f32(float %125)
  %127 = call float @llvm.fma.f32(float %126, float 0xBFE62E4000000000, float %124)
  %128 = call float @llvm.fma.f32(float %126, float 0xBEB7F7D1C0000000, float %127)
  %129 = fmul float %128, 0x3FF7154760000000
  %130 = call float @llvm.exp2.f32(float %126)
  %131 = call float @llvm.exp2.f32(float %129)
  %132 = fmul float %130, %131
  %133 = fcmp olt float %124, -1.050000e+02
  %134 = select i1 %133, float 0.000000e+00, float %132
  %135 = fcmp ogt float %124, 1.050000e+02
  %136 = select i1 %135, float 0x7FF0000000000000, float %134
  br label %137

137:                                              ; preds = %123, %118
  %138 = phi float [ %136, %123 ], [ 0.000000e+00, %118 ]
  %139 = fmul reassoc nsz arcp contract float %138, %101, !spirv.Decorations !856
  %140 = fmul reassoc nsz arcp contract float %88, %119, !spirv.Decorations !856
  %141 = fadd reassoc nsz arcp contract float %140, %139, !spirv.Decorations !856
  %142 = shl nsw i64 %97, 8, !spirv.Decorations !871
  %143 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %142
  br label %144

144:                                              ; preds = %163, %137
  %145 = phi i32 [ 0, %137 ], [ %192, %163 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  %148 = add nsw i32 %87, 1, !spirv.Decorations !871
  br label %86

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !853
  %151 = add nuw nsw i32 %150, %81, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, ptr addrspace(1) %143, i64 %152
  br label %154

154:                                              ; preds = %157, %149
  %155 = phi i32 [ 0, %149 ], [ %162, %157 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %157, label %163

157:                                              ; preds = %154
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds float, ptr addrspace(1) %153, i64 %158
  %160 = load float, ptr addrspace(1) %159, align 4
  %161 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %158
  store float %160, ptr %161, align 4
  %162 = add nuw nsw i32 %155, 1, !spirv.Decorations !853
  br label %154

163:                                              ; preds = %154
  %164 = zext i32 %145 to i64
  %165 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %164
  %166 = load <4 x float>, ptr %165, align 16, !noalias !1700
  %167 = extractelement <4 x float> %166, i32 0
  %168 = extractelement <4 x float> %166, i32 1
  %169 = extractelement <4 x float> %166, i32 2
  %170 = extractelement <4 x float> %166, i32 3
  %171 = fmul reassoc nsz arcp contract float %167, %119, !spirv.Decorations !856
  %172 = fmul reassoc nsz arcp contract float %168, %119, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %169, %119, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %170, %119, !spirv.Decorations !856
  %175 = load <4 x float>, ptr %17, align 16, !noalias !1709
  %176 = extractelement <4 x float> %175, i32 0
  %177 = extractelement <4 x float> %175, i32 1
  %178 = extractelement <4 x float> %175, i32 2
  %179 = extractelement <4 x float> %175, i32 3
  %180 = fmul reassoc nsz arcp contract float %139, %176, !spirv.Decorations !856
  %181 = fmul reassoc nsz arcp contract float %139, %177, !spirv.Decorations !856
  %182 = fmul reassoc nsz arcp contract float %139, %178, !spirv.Decorations !856
  %183 = fmul reassoc nsz arcp contract float %139, %179, !spirv.Decorations !856
  %184 = fadd reassoc nsz arcp contract float %171, %180, !spirv.Decorations !856
  %185 = fadd reassoc nsz arcp contract float %172, %181, !spirv.Decorations !856
  %186 = fadd reassoc nsz arcp contract float %173, %182, !spirv.Decorations !856
  %187 = fadd reassoc nsz arcp contract float %174, %183, !spirv.Decorations !856
  %188 = insertelement <4 x float> undef, float %184, i32 0
  %189 = insertelement <4 x float> %188, float %185, i32 1
  %190 = insertelement <4 x float> %189, float %186, i32 2
  %191 = insertelement <4 x float> %190, float %187, i32 3
  store <4 x float> %191, ptr %165, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %192 = add nuw nsw i32 %145, 1, !spirv.Decorations !853
  br label %144, !llvm.loop !1718

193:                                              ; preds = %91
  %194 = zext i8 %28 to i64
  %195 = getelementptr float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE-ExtSLM, i64 %194
  store float %89, ptr addrspace(3) %195, align 4
  %196 = getelementptr float, ptr addrspace(3) %195, i64 32
  store float %88, ptr addrspace(3) %196, align 4
  br label %197

197:                                              ; preds = %193, %91
  %198 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  %199 = shl nuw nsw i32 %localThreadId10, 8, !spirv.Decorations !871
  %200 = or i32 %199, 64
  %201 = add nuw nsw i32 %198, %200, !spirv.Decorations !853
  br label %202

202:                                              ; preds = %215, %197
  %203 = phi i32 [ 0, %197 ], [ %216, %215 ]
  %204 = icmp ult i32 %203, 4
  br i1 %204, label %207, label %205

205:                                              ; preds = %202
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %206 = icmp eq i8 %28, 0
  br i1 %206, label %.preheader, label %371

.preheader:                                       ; preds = %205
  br label %225

207:                                              ; preds = %202
  %208 = shl nuw nsw i32 %203, 6, !spirv.Decorations !853
  %209 = zext i32 %203 to i64
  %210 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %209
  %211 = add nuw nsw i32 %208, %201, !spirv.Decorations !853
  br label %212

212:                                              ; preds = %217, %207
  %213 = phi i32 [ 0, %207 ], [ %224, %217 ]
  %214 = icmp ult i32 %213, 4
  br i1 %214, label %217, label %215

215:                                              ; preds = %212
  %216 = add nuw nsw i32 %203, 1, !spirv.Decorations !853
  br label %202, !llvm.loop !1719

217:                                              ; preds = %212
  %218 = zext i32 %213 to i64
  %219 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %210, i64 0, i32 0, i64 %218
  %220 = load float, ptr %219, align 4
  %221 = or i32 %211, %213
  %222 = zext i32 %221 to i64
  %223 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE-ExtSLM, i64 %222
  store float %220, ptr addrspace(3) %223, align 4
  %224 = add nuw nsw i32 %213, 1, !spirv.Decorations !853
  br label %212, !llvm.loop !1720

225:                                              ; preds = %230, %.preheader
  %226 = phi i32 [ %233, %230 ], [ 0, %.preheader ]
  %227 = icmp ult i32 %226, 4
  br i1 %227, label %230, label %228

228:                                              ; preds = %225
  %229 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %234

230:                                              ; preds = %225
  %231 = zext i32 %226 to i64
  %232 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %231
  %233 = add nuw nsw i32 %226, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %232, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.225, i64 16, i1 false)
  br label %225, !llvm.loop !1721

234:                                              ; preds = %302, %228
  %235 = phi i32 [ %303, %302 ], [ 0, %228 ]
  %236 = phi float [ %295, %302 ], [ 0.000000e+00, %228 ]
  %237 = phi float [ %256, %302 ], [ 0xFFF0000000000000, %228 ]
  %238 = icmp ult i32 %235, 32
  br i1 %238, label %248, label %239

239:                                              ; preds = %234
  %240 = call float @llvm.maxnum.f32(float %236, float 0x3BC79CA100000000)
  %241 = mul nuw i32 %54, 24, !spirv.Decorations !904
  %242 = zext i32 %241 to i64
  %243 = sext i32 %56 to i64
  %244 = add nsw i64 %242, %243, !spirv.Decorations !871
  %245 = shl nsw i64 %244, 8, !spirv.Decorations !871
  %246 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %245
  %247 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %348

248:                                              ; preds = %234
  %249 = zext i32 %235 to i64
  %250 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE-ExtSLM, i64 %249
  %251 = load float, ptr addrspace(3) %250, align 4
  %252 = zext i32 %235 to i64
  %253 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE-ExtSLM, i64 0, i64 128
  %254 = getelementptr inbounds float, ptr addrspace(3) %253, i64 %252
  %255 = load float, ptr addrspace(3) %254, align 4
  %256 = call float @llvm.maxnum.f32(float %237, float %251)
  %257 = fcmp reassoc nsz arcp contract oeq float %237, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %257, label %272, label %258

258:                                              ; preds = %248
  %259 = fsub reassoc nsz arcp contract float %237, %256, !spirv.Decorations !856
  %260 = fmul float %259, 0x3FF7154760000000
  %261 = call float @llvm.trunc.f32(float %260)
  %262 = call float @llvm.fma.f32(float %261, float 0xBFE62E4000000000, float %259)
  %263 = call float @llvm.fma.f32(float %261, float 0xBEB7F7D1C0000000, float %262)
  %264 = fmul float %263, 0x3FF7154760000000
  %265 = call float @llvm.exp2.f32(float %261)
  %266 = call float @llvm.exp2.f32(float %264)
  %267 = fmul float %265, %266
  %268 = fcmp olt float %259, -1.050000e+02
  %269 = select i1 %268, float 0.000000e+00, float %267
  %270 = fcmp ogt float %259, 1.050000e+02
  %271 = select i1 %270, float 0x7FF0000000000000, float %269
  br label %272

272:                                              ; preds = %258, %248
  %273 = phi float [ %271, %258 ], [ 0.000000e+00, %248 ]
  %274 = fcmp reassoc nsz arcp contract oeq float %251, 0xFFF0000000000000, !spirv.Decorations !856
  %275 = fcmp reassoc nsz arcp contract oeq float %256, 0xFFF0000000000000, !spirv.Decorations !856
  %276 = or i1 %274, %275
  br i1 %276, label %291, label %277

277:                                              ; preds = %272
  %278 = fsub reassoc nsz arcp contract float %251, %256, !spirv.Decorations !856
  %279 = fmul float %278, 0x3FF7154760000000
  %280 = call float @llvm.trunc.f32(float %279)
  %281 = call float @llvm.fma.f32(float %280, float 0xBFE62E4000000000, float %278)
  %282 = call float @llvm.fma.f32(float %280, float 0xBEB7F7D1C0000000, float %281)
  %283 = fmul float %282, 0x3FF7154760000000
  %284 = call float @llvm.exp2.f32(float %280)
  %285 = call float @llvm.exp2.f32(float %283)
  %286 = fmul float %284, %285
  %287 = fcmp olt float %278, -1.050000e+02
  %288 = select i1 %287, float 0.000000e+00, float %286
  %289 = fcmp ogt float %278, 1.050000e+02
  %290 = select i1 %289, float 0x7FF0000000000000, float %288
  br label %291

291:                                              ; preds = %277, %272
  %292 = phi float [ %290, %277 ], [ 0.000000e+00, %272 ]
  %293 = fmul reassoc nsz arcp contract float %236, %273, !spirv.Decorations !856
  %294 = fmul reassoc nsz arcp contract float %292, %255, !spirv.Decorations !856
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !856
  %296 = shl nuw nsw i32 %235, 8, !spirv.Decorations !853
  %297 = or i32 %296, 64
  %298 = add nuw nsw i32 %229, %297, !spirv.Decorations !853
  br label %299

299:                                              ; preds = %310, %291
  %300 = phi i32 [ 0, %291 ], [ %339, %310 ]
  %301 = icmp ult i32 %300, 4
  br i1 %301, label %304, label %302

302:                                              ; preds = %299
  %303 = add nuw nsw i32 %235, 1, !spirv.Decorations !853
  br label %234

304:                                              ; preds = %299
  %305 = shl nuw nsw i32 %300, 6, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %18)
  %306 = add nuw nsw i32 %305, %298, !spirv.Decorations !853
  br label %307

307:                                              ; preds = %340, %304
  %308 = phi i32 [ 0, %304 ], [ %347, %340 ]
  %309 = icmp ult i32 %308, 4
  br i1 %309, label %340, label %310

310:                                              ; preds = %307
  %311 = zext i32 %300 to i64
  %312 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %311
  %313 = load <4 x float>, ptr %312, align 16, !noalias !1722
  %314 = extractelement <4 x float> %313, i32 0
  %315 = extractelement <4 x float> %313, i32 1
  %316 = extractelement <4 x float> %313, i32 2
  %317 = extractelement <4 x float> %313, i32 3
  %318 = fmul reassoc nsz arcp contract float %314, %273, !spirv.Decorations !856
  %319 = fmul reassoc nsz arcp contract float %315, %273, !spirv.Decorations !856
  %320 = fmul reassoc nsz arcp contract float %316, %273, !spirv.Decorations !856
  %321 = fmul reassoc nsz arcp contract float %317, %273, !spirv.Decorations !856
  %322 = load <4 x float>, ptr %18, align 16, !noalias !1731
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %327 = fmul reassoc nsz arcp contract float %292, %323, !spirv.Decorations !856
  %328 = fmul reassoc nsz arcp contract float %292, %324, !spirv.Decorations !856
  %329 = fmul reassoc nsz arcp contract float %292, %325, !spirv.Decorations !856
  %330 = fmul reassoc nsz arcp contract float %292, %326, !spirv.Decorations !856
  %331 = fadd reassoc nsz arcp contract float %318, %327, !spirv.Decorations !856
  %332 = fadd reassoc nsz arcp contract float %319, %328, !spirv.Decorations !856
  %333 = fadd reassoc nsz arcp contract float %320, %329, !spirv.Decorations !856
  %334 = fadd reassoc nsz arcp contract float %321, %330, !spirv.Decorations !856
  %335 = insertelement <4 x float> undef, float %331, i32 0
  %336 = insertelement <4 x float> %335, float %332, i32 1
  %337 = insertelement <4 x float> %336, float %333, i32 2
  %338 = insertelement <4 x float> %337, float %334, i32 3
  store <4 x float> %338, ptr %312, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %18)
  %339 = add nuw nsw i32 %300, 1, !spirv.Decorations !853
  br label %299, !llvm.loop !1740

340:                                              ; preds = %307
  %341 = or i32 %306, %308
  %342 = zext i32 %341 to i64
  %343 = getelementptr inbounds float, ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE-ExtSLM, i64 %342
  %344 = load float, ptr addrspace(3) %343, align 4
  %345 = zext i32 %308 to i64
  %346 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %18, i64 0, i32 0, i64 %345
  store float %344, ptr %346, align 4
  %347 = add nuw nsw i32 %308, 1, !spirv.Decorations !853
  br label %307, !llvm.loop !1741

348:                                              ; preds = %359, %239
  %349 = phi i32 [ 0, %239 ], [ %360, %359 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %351, label %.loopexit

351:                                              ; preds = %348
  %352 = shl nuw nsw i32 %349, 6, !spirv.Decorations !853
  %353 = add nuw nsw i32 %352, %247, !spirv.Decorations !853
  %354 = zext i32 %349 to i64
  %355 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %354
  br label %356

356:                                              ; preds = %361, %351
  %357 = phi i32 [ 0, %351 ], [ %370, %361 ]
  %358 = icmp ult i32 %357, 4
  br i1 %358, label %361, label %359

359:                                              ; preds = %356
  %360 = add nuw nsw i32 %349, 1, !spirv.Decorations !853
  br label %348, !llvm.loop !1742

361:                                              ; preds = %356
  %362 = zext i32 %357 to i64
  %363 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %355, i64 0, i32 0, i64 %362
  %364 = load float, ptr %363, align 4
  %365 = fdiv reassoc nsz arcp contract float %364, %240
  %366 = fptrunc float %365 to half
  %367 = or i32 %353, %357
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds half, ptr addrspace(1) %246, i64 %368
  store half %366, ptr addrspace(1) %369, align 2
  %370 = add nuw nsw i32 %357, 1, !spirv.Decorations !853
  br label %356, !llvm.loop !1743

.loopexit:                                        ; preds = %348
  br label %371

371:                                              ; preds = %.loopexit, %205
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_133Xe2KvTorchAbiS2MergeOutHalfKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 2 %6, <8 x i32> %r0, <3 x i32> %globalOffset, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bindlessOffset, i32 %bindlessOffset5, i32 %bindlessOffset6, i32 %bindlessOffset7, i32 %bindlessOffset8, i32 %bindlessOffset9) #0 {
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !872
  %17 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !872
  %18 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %18)
  %19 = bitcast <8 x i32> %r0 to <32 x i8>
  %20 = extractelement <32 x i8> %19, i32 0
  %21 = extractelement <32 x i8> %19, i32 1
  %22 = extractelement <32 x i8> %19, i32 2
  %23 = extractelement <32 x i8> %19, i32 3
  %24 = extractelement <32 x i8> %19, i32 4
  %25 = extractelement <32 x i8> %19, i32 5
  %26 = extractelement <32 x i8> %19, i32 6
  %27 = extractelement <32 x i8> %19, i32 7
  %28 = extractelement <32 x i8> %19, i32 8
  %29 = extractelement <32 x i8> %19, i32 9
  %30 = extractelement <32 x i8> %19, i32 10
  %31 = extractelement <32 x i8> %19, i32 11
  %32 = extractelement <32 x i8> %19, i32 12
  %33 = extractelement <32 x i8> %19, i32 13
  %34 = extractelement <32 x i8> %19, i32 14
  %35 = extractelement <32 x i8> %19, i32 15
  %36 = extractelement <32 x i8> %19, i32 16
  %37 = extractelement <32 x i8> %19, i32 17
  %38 = extractelement <32 x i8> %19, i32 18
  %39 = extractelement <32 x i8> %19, i32 19
  %40 = extractelement <32 x i8> %19, i32 20
  %41 = extractelement <32 x i8> %19, i32 21
  %42 = extractelement <32 x i8> %19, i32 22
  %43 = extractelement <32 x i8> %19, i32 23
  %44 = extractelement <32 x i8> %19, i32 24
  %45 = extractelement <32 x i8> %19, i32 25
  %46 = extractelement <32 x i8> %19, i32 26
  %47 = extractelement <32 x i8> %19, i32 27
  %48 = extractelement <32 x i8> %19, i32 28
  %49 = extractelement <32 x i8> %19, i32 29
  %50 = extractelement <32 x i8> %19, i32 30
  %51 = extractelement <32 x i8> %19, i32 31
  %localThreadId10 = zext i8 %28 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %52 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %52)
  %53 = shl nsw i32 %9, 3, !spirv.Decorations !871
  %54 = add nuw nsw i32 %53, %localThreadId10, !spirv.Decorations !853
  %55 = lshr i32 %54, 6
  %56 = and i32 %54, 63
  %57 = mul nsw i32 %55, %0, !spirv.Decorations !871
  %58 = load i32, ptr addrspace(1) %1, align 4
  %59 = sext i32 %58 to i64
  %60 = sext i32 %0 to i64
  %61 = add nsw i64 %59, 63, !spirv.Decorations !871
  %62 = sdiv i64 %61, 64
  %63 = call i64 @llvm.smin.i64(i64 %60, i64 %62)
  %64 = call i64 @llvm.smax.i64(i64 %63, i64 1)
  %65 = trunc i64 %64 to i32
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %16)
  br label %66

66:                                               ; preds = %72, %7
  %67 = phi i32 [ 0, %7 ], [ %75, %72 ]
  %68 = icmp ult i32 %67, 4
  br i1 %68, label %72, label %69

69:                                               ; preds = %66
  %70 = zext i32 %56 to i64
  %71 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %76

72:                                               ; preds = %66
  %73 = zext i32 %67 to i64
  %74 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %73
  %75 = add nuw nsw i32 %67, 1, !spirv.Decorations !853
  call void @llvm.memcpy.p0.p2.i64(ptr noundef nonnull align 16 dereferenceable(16) %74, ptr addrspace(2) noundef align 16 dereferenceable(16) @gVar.226, i64 16, i1 false)
  br label %66, !llvm.loop !1744

76:                                               ; preds = %139, %69
  %77 = phi i32 [ %140, %139 ], [ 0, %69 ]
  %78 = phi float [ %133, %139 ], [ 0.000000e+00, %69 ]
  %79 = phi float [ %94, %139 ], [ 0xFFF0000000000000, %69 ]
  %80 = icmp slt i32 %77, %65
  br i1 %80, label %85, label %81

81:                                               ; preds = %76
  %82 = call float @llvm.maxnum.f32(float %78, float 0x3BC79CA100000000)
  %83 = udiv i32 %56, 6
  %84 = icmp slt i32 %83, %5
  br i1 %84, label %185, label %218

85:                                               ; preds = %76
  %86 = add nsw i32 %57, %77, !spirv.Decorations !871
  %87 = sext i32 %86 to i64
  %88 = shl nsw i64 %87, 6, !spirv.Decorations !871
  %89 = or i64 %88, %70
  %90 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %89
  %91 = load float, ptr addrspace(1) %90, align 4
  %92 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %89
  %93 = load float, ptr addrspace(1) %92, align 4
  %94 = call float @llvm.maxnum.f32(float %79, float %91)
  %95 = fcmp reassoc nsz arcp contract oeq float %79, 0xFFF0000000000000, !spirv.Decorations !856
  br i1 %95, label %110, label %96

96:                                               ; preds = %85
  %97 = fsub reassoc nsz arcp contract float %79, %94, !spirv.Decorations !856
  %98 = fmul float %97, 0x3FF7154760000000
  %99 = call float @llvm.trunc.f32(float %98)
  %100 = call float @llvm.fma.f32(float %99, float 0xBFE62E4000000000, float %97)
  %101 = call float @llvm.fma.f32(float %99, float 0xBEB7F7D1C0000000, float %100)
  %102 = fmul float %101, 0x3FF7154760000000
  %103 = call float @llvm.exp2.f32(float %99)
  %104 = call float @llvm.exp2.f32(float %102)
  %105 = fmul float %103, %104
  %106 = fcmp olt float %97, -1.050000e+02
  %107 = select i1 %106, float 0.000000e+00, float %105
  %108 = fcmp ogt float %97, 1.050000e+02
  %109 = select i1 %108, float 0x7FF0000000000000, float %107
  br label %110

110:                                              ; preds = %96, %85
  %111 = phi float [ %109, %96 ], [ 0.000000e+00, %85 ]
  %112 = fcmp reassoc nsz arcp contract oeq float %91, 0xFFF0000000000000, !spirv.Decorations !856
  %113 = fcmp reassoc nsz arcp contract oeq float %94, 0xFFF0000000000000, !spirv.Decorations !856
  %114 = or i1 %112, %113
  br i1 %114, label %129, label %115

115:                                              ; preds = %110
  %116 = fsub reassoc nsz arcp contract float %91, %94, !spirv.Decorations !856
  %117 = fmul float %116, 0x3FF7154760000000
  %118 = call float @llvm.trunc.f32(float %117)
  %119 = call float @llvm.fma.f32(float %118, float 0xBFE62E4000000000, float %116)
  %120 = call float @llvm.fma.f32(float %118, float 0xBEB7F7D1C0000000, float %119)
  %121 = fmul float %120, 0x3FF7154760000000
  %122 = call float @llvm.exp2.f32(float %118)
  %123 = call float @llvm.exp2.f32(float %121)
  %124 = fmul float %122, %123
  %125 = fcmp olt float %116, -1.050000e+02
  %126 = select i1 %125, float 0.000000e+00, float %124
  %127 = fcmp ogt float %116, 1.050000e+02
  %128 = select i1 %127, float 0x7FF0000000000000, float %126
  br label %129

129:                                              ; preds = %115, %110
  %130 = phi float [ %128, %115 ], [ 0.000000e+00, %110 ]
  %131 = fmul reassoc nsz arcp contract float %130, %93, !spirv.Decorations !856
  %132 = fmul reassoc nsz arcp contract float %78, %111, !spirv.Decorations !856
  %133 = fadd reassoc nsz arcp contract float %132, %131, !spirv.Decorations !856
  %134 = shl nsw i64 %89, 8, !spirv.Decorations !871
  %135 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %134
  br label %136

136:                                              ; preds = %155, %129
  %137 = phi i32 [ 0, %129 ], [ %184, %155 ]
  %138 = icmp ult i32 %137, 4
  br i1 %138, label %141, label %139

139:                                              ; preds = %136
  %140 = add nuw nsw i32 %77, 1, !spirv.Decorations !853
  br label %76

141:                                              ; preds = %136
  %142 = shl nuw nsw i32 %137, 6, !spirv.Decorations !853
  %143 = add nuw nsw i32 %142, %71, !spirv.Decorations !853
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %17)
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds float, ptr addrspace(1) %135, i64 %144
  br label %146

146:                                              ; preds = %149, %141
  %147 = phi i32 [ 0, %141 ], [ %154, %149 ]
  %148 = icmp ult i32 %147, 4
  br i1 %148, label %149, label %155

149:                                              ; preds = %146
  %150 = zext i32 %147 to i64
  %151 = getelementptr inbounds float, ptr addrspace(1) %145, i64 %150
  %152 = load float, ptr addrspace(1) %151, align 4
  %153 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %17, i64 0, i32 0, i64 %150
  store float %152, ptr %153, align 4
  %154 = add nuw nsw i32 %147, 1, !spirv.Decorations !853
  br label %146

155:                                              ; preds = %146
  %156 = zext i32 %137 to i64
  %157 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %156
  %158 = load <4 x float>, ptr %157, align 16, !noalias !1745
  %159 = extractelement <4 x float> %158, i32 0
  %160 = extractelement <4 x float> %158, i32 1
  %161 = extractelement <4 x float> %158, i32 2
  %162 = extractelement <4 x float> %158, i32 3
  %163 = fmul reassoc nsz arcp contract float %159, %111, !spirv.Decorations !856
  %164 = fmul reassoc nsz arcp contract float %160, %111, !spirv.Decorations !856
  %165 = fmul reassoc nsz arcp contract float %161, %111, !spirv.Decorations !856
  %166 = fmul reassoc nsz arcp contract float %162, %111, !spirv.Decorations !856
  %167 = load <4 x float>, ptr %17, align 16, !noalias !1754
  %168 = extractelement <4 x float> %167, i32 0
  %169 = extractelement <4 x float> %167, i32 1
  %170 = extractelement <4 x float> %167, i32 2
  %171 = extractelement <4 x float> %167, i32 3
  %172 = fmul reassoc nsz arcp contract float %131, %168, !spirv.Decorations !856
  %173 = fmul reassoc nsz arcp contract float %131, %169, !spirv.Decorations !856
  %174 = fmul reassoc nsz arcp contract float %131, %170, !spirv.Decorations !856
  %175 = fmul reassoc nsz arcp contract float %131, %171, !spirv.Decorations !856
  %176 = fadd reassoc nsz arcp contract float %163, %172, !spirv.Decorations !856
  %177 = fadd reassoc nsz arcp contract float %164, %173, !spirv.Decorations !856
  %178 = fadd reassoc nsz arcp contract float %165, %174, !spirv.Decorations !856
  %179 = fadd reassoc nsz arcp contract float %166, %175, !spirv.Decorations !856
  %180 = insertelement <4 x float> undef, float %176, i32 0
  %181 = insertelement <4 x float> %180, float %177, i32 1
  %182 = insertelement <4 x float> %181, float %178, i32 2
  %183 = insertelement <4 x float> %182, float %179, i32 3
  store <4 x float> %183, ptr %157, align 16
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %17)
  %184 = add nuw nsw i32 %137, 1, !spirv.Decorations !853
  br label %136, !llvm.loop !1763

185:                                              ; preds = %81
  %.neg = mul nsw i32 %83, -6
  %186 = add nsw i32 %.neg, %56
  %187 = mul nuw nsw i32 %55, 6, !spirv.Decorations !853
  %188 = add nuw nsw i32 %187, %186, !spirv.Decorations !853
  %189 = mul nuw nsw i32 %83, 24, !spirv.Decorations !853
  %190 = add nuw nsw i32 %189, %188, !spirv.Decorations !853
  %191 = zext i32 %190 to i64
  %192 = shl nuw nsw i64 %191, 8, !spirv.Decorations !853
  %193 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %192
  %194 = shl nuw nsw i32 %simdLaneId, 2, !spirv.Decorations !871
  br label %195

195:                                              ; preds = %206, %185
  %196 = phi i32 [ 0, %185 ], [ %207, %206 ]
  %197 = icmp ult i32 %196, 4
  br i1 %197, label %198, label %.loopexit

198:                                              ; preds = %195
  %199 = shl nuw nsw i32 %196, 6, !spirv.Decorations !853
  %200 = add nuw nsw i32 %199, %194, !spirv.Decorations !853
  %201 = zext i32 %196 to i64
  %202 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %16, i64 0, i64 %201
  br label %203

203:                                              ; preds = %208, %198
  %204 = phi i32 [ 0, %198 ], [ %217, %208 ]
  %205 = icmp ult i32 %204, 4
  br i1 %205, label %208, label %206

206:                                              ; preds = %203
  %207 = add nuw nsw i32 %196, 1, !spirv.Decorations !853
  br label %195, !llvm.loop !1764

208:                                              ; preds = %203
  %209 = zext i32 %204 to i64
  %210 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %202, i64 0, i32 0, i64 %209
  %211 = load float, ptr %210, align 4
  %212 = fdiv reassoc nsz arcp contract float %211, %82
  %213 = fptrunc float %212 to half
  %214 = or i32 %200, %204
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds half, ptr addrspace(1) %193, i64 %215
  store half %213, ptr addrspace(1) %216, align 2
  %217 = add nuw nsw i32 %204, 1, !spirv.Decorations !853
  br label %203, !llvm.loop !1765

.loopexit:                                        ; preds = %195
  br label %218

218:                                              ; preds = %.loopexit, %81
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 2 %3, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4, i32 %bindlessOffset5) #0 {
  %5 = extractelement <8 x i32> %r0, i32 0
  %6 = extractelement <8 x i32> %r0, i32 1
  %7 = extractelement <8 x i32> %r0, i32 2
  %8 = extractelement <8 x i32> %r0, i32 3
  %9 = extractelement <8 x i32> %r0, i32 4
  %10 = extractelement <8 x i32> %r0, i32 5
  %11 = extractelement <8 x i32> %r0, i32 6
  %12 = extractelement <8 x i32> %r0, i32 7
  %13 = zext i16 %localIdX to i32
  %14 = zext i32 %6 to i64
  %15 = icmp sgt i32 %6, -1
  call void @llvm.assume(i1 %15)
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %16 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %16)
  %17 = lshr i32 %13, 1
  %18 = and i32 %13, 1
  %19 = shl nuw nsw i64 %14, 6, !spirv.Decorations !853
  %20 = shl nuw nsw i64 %14, 14, !spirv.Decorations !853
  %21 = mul nsw i32 %0, 6, !spirv.Decorations !871
  %22 = icmp slt i32 %17, %21
  br i1 %22, label %46, label %23

23:                                               ; preds = %4
  %24 = icmp eq i32 %18, 0
  br i1 %24, label %27, label %25

25:                                               ; preds = %23
  %26 = zext i32 %17 to i64
  br label %31

27:                                               ; preds = %23
  %28 = zext i32 %17 to i64
  %29 = getelementptr float, ptr addrspace(1) %1, i64 %19
  %30 = getelementptr float, ptr addrspace(1) %29, i64 %28
  store float 0.000000e+00, ptr addrspace(1) %30, align 4
  br label %31

31:                                               ; preds = %27, %25
  %32 = phi i64 [ %26, %25 ], [ %28, %27 ]
  %33 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %20
  %34 = shl nuw nsw i64 %32, 8, !spirv.Decorations !853
  %35 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 %34
  %36 = shl nuw nsw i32 %18, 7, !spirv.Decorations !853
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 %37
  br label %39

39:                                               ; preds = %42, %31
  %40 = phi i32 [ 0, %31 ], [ %45, %42 ]
  %41 = icmp ult i32 %40, 128
  br i1 %41, label %42, label %.loopexit1

42:                                               ; preds = %39
  %43 = zext i32 %40 to i64
  %44 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 %43
  store i8 0, ptr addrspace(1) %44, align 1
  %45 = add nuw nsw i32 %40, 1, !spirv.Decorations !853
  br label %39, !llvm.loop !1766

46:                                               ; preds = %4
  %47 = udiv i32 %13, 12
  %48 = mul nsw i32 %47, -6, !spirv.Decorations !871
  %49 = add nsw i32 %48, %17, !spirv.Decorations !871
  %50 = mul nuw nsw i32 %6, 6, !spirv.Decorations !853
  %51 = add nsw i32 %50, %49, !spirv.Decorations !871
  %52 = mul nuw nsw i32 %47, 12, !spirv.Decorations !853
  %53 = zext i32 %52 to i64
  %54 = sext i32 %51 to i64
  %55 = add nsw i64 %53, %54, !spirv.Decorations !871
  %56 = shl nsw i64 %55, 8, !spirv.Decorations !871
  %57 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %3, i64 %56
  %58 = shl nuw nsw i32 %18, 7, !spirv.Decorations !853
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %57, i64 %59
  br label %61

61:                                               ; preds = %70, %46
  %62 = phi i32 [ 0, %46 ], [ %79, %70 ]
  %63 = phi float [ 0.000000e+00, %46 ], [ %78, %70 ]
  %64 = icmp ult i32 %62, 128
  br i1 %64, label %70, label %65

65:                                               ; preds = %61
  %66 = xor i16 %simdLaneId16, 1
  %67 = zext i16 %66 to i32
  %simdShuffle = call float @llvm.genx.GenISA.WaveShuffleIndex.f32(float %63, i32 %67, i32 0)
  %68 = call float @llvm.maxnum.f32(float %63, float %simdShuffle)
  %69 = fcmp reassoc nsz arcp contract oeq float %68, 0.000000e+00, !spirv.Decorations !856
  br i1 %69, label %82, label %80

70:                                               ; preds = %61
  %71 = zext i32 %62 to i64
  %72 = getelementptr inbounds half, ptr addrspace(1) %60, i64 %71
  %73 = load half, ptr addrspace(1) %72, align 2
  %74 = fpext half %73 to float
  %75 = bitcast float %74 to i32
  %76 = and i32 %75, 2147483647
  %77 = bitcast i32 %76 to float
  %78 = call float @llvm.maxnum.f32(float %63, float %77)
  %79 = add nuw nsw i32 %62, 1, !spirv.Decorations !853
  br label %61, !llvm.loop !1767

80:                                               ; preds = %65
  %81 = fmul reassoc nsz arcp contract float %68, 0x3F80204080000000
  br label %82

82:                                               ; preds = %80, %65
  %83 = phi float [ %81, %80 ], [ 0.000000e+00, %65 ]
  %84 = icmp eq i32 %18, 0
  br i1 %84, label %85, label %89

85:                                               ; preds = %82
  %86 = zext i32 %17 to i64
  %87 = getelementptr float, ptr addrspace(1) %1, i64 %19
  %88 = getelementptr float, ptr addrspace(1) %87, i64 %86
  store float %83, ptr addrspace(1) %88, align 4
  br label %89

89:                                               ; preds = %85, %82
  %90 = fcmp reassoc nsz arcp contract oeq float %83, 0.000000e+00, !spirv.Decorations !856
  br i1 %90, label %93, label %91

91:                                               ; preds = %89
  %92 = fdiv reassoc nsz arcp contract float 1.000000e+00, %83, !spirv.Decorations !856
  br label %93

93:                                               ; preds = %91, %89
  %94 = phi float [ %92, %91 ], [ 0.000000e+00, %89 ]
  %95 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %20
  %96 = shl nuw nsw i32 %17, 8
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 %97
  %99 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 %59
  br label %100

100:                                              ; preds = %103, %93
  %101 = phi i32 [ 0, %93 ], [ %114, %103 ]
  %102 = icmp ult i32 %101, 128
  br i1 %102, label %103, label %.loopexit

103:                                              ; preds = %100
  %104 = zext i32 %101 to i64
  %105 = getelementptr inbounds half, ptr addrspace(1) %60, i64 %104
  %106 = load half, ptr addrspace(1) %105, align 2
  %107 = fpext half %106 to float
  %108 = fmul reassoc nsz arcp contract float %94, %107, !spirv.Decorations !856
  %109 = call float @llvm.genx.GenISA.ROUNDNE(float %108)
  %110 = call float @llvm.maxnum.f32(float %109, float -1.270000e+02)
  %111 = call float @llvm.minnum.f32(float %110, float 1.270000e+02)
  %112 = fptosi float %111 to i8
  %113 = getelementptr inbounds i8, ptr addrspace(1) %99, i64 %104
  store i8 %112, ptr addrspace(1) %113, align 1
  %114 = add nuw nsw i32 %101, 1, !spirv.Decorations !853
  br label %100, !llvm.loop !1768

.loopexit:                                        ; preds = %100
  br label %115

.loopexit1:                                       ; preds = %39
  br label %115

115:                                              ; preds = %.loopexit1, %.loopexit
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 2 %3, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(2) %constBase, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4, i32 %bindlessOffset5) #0 {
  %5 = extractelement <8 x i32> %r0, i32 0
  %6 = extractelement <8 x i32> %r0, i32 1
  %7 = extractelement <8 x i32> %r0, i32 2
  %8 = extractelement <8 x i32> %r0, i32 3
  %9 = extractelement <8 x i32> %r0, i32 4
  %10 = extractelement <8 x i32> %r0, i32 5
  %11 = extractelement <8 x i32> %r0, i32 6
  %12 = extractelement <8 x i32> %r0, i32 7
  %13 = zext i16 %localIdX to i32
  %14 = zext i32 %6 to i64
  %15 = icmp sgt i32 %6, -1
  call void @llvm.assume(i1 %15)
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %16 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %16)
  %17 = lshr i32 %13, 1
  %18 = and i32 %13, 1
  %19 = shl nuw nsw i64 %14, 6, !spirv.Decorations !853
  %20 = shl nuw nsw i64 %14, 14, !spirv.Decorations !853
  %21 = mul nsw i32 %0, 6, !spirv.Decorations !871
  %22 = icmp slt i32 %17, %21
  br i1 %22, label %46, label %23

23:                                               ; preds = %4
  %24 = icmp eq i32 %18, 0
  br i1 %24, label %27, label %25

25:                                               ; preds = %23
  %26 = zext i32 %17 to i64
  br label %31

27:                                               ; preds = %23
  %28 = zext i32 %17 to i64
  %29 = getelementptr float, ptr addrspace(1) %1, i64 %19
  %30 = getelementptr float, ptr addrspace(1) %29, i64 %28
  store float 0.000000e+00, ptr addrspace(1) %30, align 4
  br label %31

31:                                               ; preds = %27, %25
  %32 = phi i64 [ %26, %25 ], [ %28, %27 ]
  %33 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %20
  %34 = shl nuw nsw i64 %32, 8, !spirv.Decorations !853
  %35 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 %34
  %36 = shl nuw nsw i32 %18, 7, !spirv.Decorations !853
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 %37
  br label %39

39:                                               ; preds = %42, %31
  %40 = phi i32 [ 0, %31 ], [ %45, %42 ]
  %41 = icmp ult i32 %40, 128
  br i1 %41, label %42, label %.loopexit1

42:                                               ; preds = %39
  %43 = zext i32 %40 to i64
  %44 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 %43
  store i8 0, ptr addrspace(1) %44, align 1
  %45 = add nuw nsw i32 %40, 1, !spirv.Decorations !853
  br label %39, !llvm.loop !1769

46:                                               ; preds = %4
  %47 = udiv i32 %13, 12
  %48 = mul nsw i32 %47, -6, !spirv.Decorations !871
  %49 = add nsw i32 %48, %17, !spirv.Decorations !871
  %50 = mul nuw nsw i32 %6, 6, !spirv.Decorations !853
  %51 = add nsw i32 %50, %49, !spirv.Decorations !871
  %narrow = mul nuw nsw i32 %47, 24
  %52 = zext i32 %narrow to i64
  %53 = sext i32 %51 to i64
  %54 = add nsw i64 %52, %53, !spirv.Decorations !871
  %55 = shl nsw i64 %54, 8, !spirv.Decorations !871
  %56 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %3, i64 %55
  %57 = shl nuw nsw i32 %18, 7, !spirv.Decorations !853
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %56, i64 %58
  br label %60

60:                                               ; preds = %69, %46
  %61 = phi i32 [ 0, %46 ], [ %78, %69 ]
  %62 = phi float [ 0.000000e+00, %46 ], [ %77, %69 ]
  %63 = icmp ult i32 %61, 128
  br i1 %63, label %69, label %64

64:                                               ; preds = %60
  %65 = xor i16 %simdLaneId16, 1
  %66 = zext i16 %65 to i32
  %simdShuffle = call float @llvm.genx.GenISA.WaveShuffleIndex.f32(float %62, i32 %66, i32 0)
  %67 = call float @llvm.maxnum.f32(float %62, float %simdShuffle)
  %68 = fcmp reassoc nsz arcp contract oeq float %67, 0.000000e+00, !spirv.Decorations !856
  br i1 %68, label %81, label %79

69:                                               ; preds = %60
  %70 = zext i32 %61 to i64
  %71 = getelementptr inbounds half, ptr addrspace(1) %59, i64 %70
  %72 = load half, ptr addrspace(1) %71, align 2
  %73 = fpext half %72 to float
  %74 = bitcast float %73 to i32
  %75 = and i32 %74, 2147483647
  %76 = bitcast i32 %75 to float
  %77 = call float @llvm.maxnum.f32(float %62, float %76)
  %78 = add nuw nsw i32 %61, 1, !spirv.Decorations !853
  br label %60, !llvm.loop !1770

79:                                               ; preds = %64
  %80 = fmul reassoc nsz arcp contract float %67, 0x3F80204080000000
  br label %81

81:                                               ; preds = %79, %64
  %82 = phi float [ %80, %79 ], [ 0.000000e+00, %64 ]
  %83 = icmp eq i32 %18, 0
  br i1 %83, label %84, label %88

84:                                               ; preds = %81
  %85 = zext i32 %17 to i64
  %86 = getelementptr float, ptr addrspace(1) %1, i64 %19
  %87 = getelementptr float, ptr addrspace(1) %86, i64 %85
  store float %82, ptr addrspace(1) %87, align 4
  br label %88

88:                                               ; preds = %84, %81
  %89 = fcmp reassoc nsz arcp contract oeq float %82, 0.000000e+00, !spirv.Decorations !856
  br i1 %89, label %92, label %90

90:                                               ; preds = %88
  %91 = fdiv reassoc nsz arcp contract float 1.000000e+00, %82, !spirv.Decorations !856
  br label %92

92:                                               ; preds = %90, %88
  %93 = phi float [ %91, %90 ], [ 0.000000e+00, %88 ]
  %94 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %20
  %95 = shl nuw nsw i32 %17, 8
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 %96
  %98 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 %58
  br label %99

99:                                               ; preds = %102, %92
  %100 = phi i32 [ 0, %92 ], [ %113, %102 ]
  %101 = icmp ult i32 %100, 128
  br i1 %101, label %102, label %.loopexit

102:                                              ; preds = %99
  %103 = zext i32 %100 to i64
  %104 = getelementptr inbounds half, ptr addrspace(1) %59, i64 %103
  %105 = load half, ptr addrspace(1) %104, align 2
  %106 = fpext half %105 to float
  %107 = fmul reassoc nsz arcp contract float %93, %106, !spirv.Decorations !856
  %108 = call float @llvm.genx.GenISA.ROUNDNE(float %107)
  %109 = call float @llvm.maxnum.f32(float %108, float -1.270000e+02)
  %110 = call float @llvm.minnum.f32(float %109, float 1.270000e+02)
  %111 = fptosi float %110 to i8
  %112 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 %103
  store i8 %111, ptr addrspace(1) %112, align 1
  %113 = add nuw nsw i32 %100, 1, !spirv.Decorations !853
  br label %99, !llvm.loop !1771

.loopexit:                                        ; preds = %99
  br label %114

.loopexit1:                                       ; preds = %39
  br label %114

114:                                              ; preds = %.loopexit1, %.loopexit
  ret void
}

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_fmax(float noundef, float noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_fmin(float noundef, float noundef) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_frnd_ni(float noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_frnd_ne(float noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_native_exp2f(float noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_frnd_zi(float noundef) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #5

; Function Attrs: convergent nounwind
declare spir_func void @__builtin_IB_memfence(i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i32 noundef) local_unnamed_addr #6

; Function Attrs: convergent nounwind
declare spir_func void @__builtin_IB_thread_group_barrier() local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_group_id(i32 noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_id_x() local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func float @__builtin_IB_simd_shuffle_f(float noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: convergent nounwind
declare spir_func i32 @__builtin_IB_get_simd_size() local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_sub_group_reduce_FMin_f32(float noundef) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func ptr addrspace(3) @__builtin_IB_AllocLocalMemPool(i1 noundef zeroext, i32 noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_sub_group_reduce_FMax_f32(float noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_size(i32 noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_thread_id() local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func i32 @__builtin_IB_get_simd_id() local_unnamed_addr #6

declare i32 @printf(ptr addrspace(2), ...)

; Function Desc: 
; Output: 
; Function Attrs: nounwind willreturn memory(none)
declare i16 @llvm.genx.GenISA.simdLaneId() #7

; Function Desc: 
; Output: 
; Arg 0: 
; Arg 1: 
; Arg 2: 
; Function Attrs: convergent nounwind willreturn memory(none)
declare float @llvm.genx.GenISA.WaveShuffleIndex.f32(float, i32, i32) #8

; Function Desc: 
; Output: 
; Arg 0: 
; Arg 1: 
; Arg 2: 
; Arg 3: 
; Function Attrs: convergent nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.genx.GenISA.WaveAll.f32(float, i8, i1, i32) #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #5

; Function Desc: 
; Output: 
; Arg 0: 
; Function Attrs: nounwind willreturn memory(none)
declare float @llvm.genx.GenISA.ROUNDNE(float) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minnum.f32(float, float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.floor.f32(float) #5

; Function Desc: 
; Output: 
; Arg 0: 
; Arg 1: 
; Arg 2: 
; Arg 3: 
; Arg 4: 
; Arg 5: 
; Arg 6: 
; Arg 7: 
; Arg 8: 
; Function Attrs: convergent nounwind memory(readwrite)
declare void @llvm.genx.GenISA.memoryfence(i1, i1, i1, i1, i1, i1, i1, i1, i32) #10

; Function Desc: 
; Output: 
; Function Attrs: convergent nounwind memory(readwrite)
declare void @llvm.genx.GenISA.threadgroupbarrier() #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.trunc.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.exp2.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #5

define spir_kernel void @Intel_Symbol_Table_Void_Program() {
entry:
  ret void
}

attributes #0 = { convergent nounwind "less-precise-fpmad"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { convergent mustprogress nofree nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { convergent nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { convergent nounwind willreturn memory(none) }
attributes #9 = { convergent nounwind memory(inaccessiblemem: readwrite) }
attributes #10 = { convergent nounwind memory(readwrite) }

!spirv.MemoryModel = !{!3}
!spirv.Source = !{!4}
!spirv.Generator = !{!5}
!igc.functions = !{!6, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38}
!IGCMetadata = !{!39}
!opencl.ocl.version = !{!850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850}
!opencl.spir.version = !{!850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850, !850}
!llvm.ident = !{!851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851, !851}
!llvm.module.flags = !{!852}

!0 = !{!1, !2}
!1 = !{i32 22}
!2 = !{i32 44, i32 16}
!3 = !{i32 2, i32 2}
!4 = !{i32 4, i32 100000}
!5 = !{i16 6, i16 14}
!6 = !{ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiKstoreKernelE, !7}
!7 = !{!8}
!8 = !{!"function_type", i32 0}
!9 = !{ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiVstoreKernelE, !7}
!10 = !{ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi2EEE, !7}
!11 = !{ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi4EEE, !7}
!12 = !{ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi2EEE, !7}
!13 = !{ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi4EEE, !7}
!14 = !{ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi2EEE, !7}
!15 = !{ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi4EEE, !7}
!16 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE, !7}
!17 = !{ptr @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE, !7}
!18 = !{ptr @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE, !7}
!19 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE, !7}
!20 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE, !7}
!21 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE, !7}
!22 = !{ptr @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE, !7}
!23 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE, !7}
!24 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE, !7}
!25 = !{ptr @_ZTSN12_GLOBAL__N_133Xe2KvTorchAbiS2MergeOutHalfKernelILi2EEE, !7}
!26 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE, !7}
!27 = !{ptr @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE, !7}
!28 = !{ptr @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE, !7}
!29 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE, !7}
!30 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE, !7}
!31 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE, !7}
!32 = !{ptr @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE, !7}
!33 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE, !7}
!34 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE, !7}
!35 = !{ptr @_ZTSN12_GLOBAL__N_133Xe2KvTorchAbiS2MergeOutHalfKernelILi4EEE, !7}
!36 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi2EEE, !7}
!37 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi4EEE, !7}
!38 = !{ptr @Intel_Symbol_Table_Void_Program, !7}
!39 = !{!"ModuleMD", !40, !41, !152, !607, !638, !655, !676, !686, !688, !689, !704, !705, !706, !707, !708, !712, !713, !721, !722, !723, !724, !725, !726, !727, !728, !805, !807, !811, !812, !813, !814, !815, !816, !817, !818, !819, !820, !821, !822, !823, !824, !825, !261, !826, !827, !828, !830, !832, !835, !836, !837, !839, !840, !841, !846, !847, !848, !849}
!40 = !{!"isPrecise", i1 false}
!41 = !{!"compOpt", !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151}
!42 = !{!"DenormsAreZero", i1 false}
!43 = !{!"BFTFDenormsAreZero", i1 false}
!44 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!45 = !{!"OptDisable", i1 false}
!46 = !{!"MadEnable", i1 true}
!47 = !{!"NoSignedZeros", i1 false}
!48 = !{!"NoNaNs", i1 false}
!49 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!50 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!51 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!52 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!53 = !{!"FloatRoundingMode", i32 0}
!54 = !{!"FloatCvtIntRoundingMode", i32 3}
!55 = !{!"LoadCacheDefault", i32 4}
!56 = !{!"StoreCacheDefault", i32 2}
!57 = !{!"VISAPreSchedRPThreshold", i32 0}
!58 = !{!"VISAPreSchedCtrl", i32 0}
!59 = !{!"SetLoopUnrollThreshold", i32 0}
!60 = !{!"UnsafeMathOptimizations", i1 false}
!61 = !{!"disableCustomUnsafeOpts", i1 false}
!62 = !{!"disableReducePow", i1 false}
!63 = !{!"disableSqrtOpt", i1 false}
!64 = !{!"FiniteMathOnly", i1 false}
!65 = !{!"FastRelaxedMath", i1 false}
!66 = !{!"DashGSpecified", i1 false}
!67 = !{!"FastCompilation", i1 false}
!68 = !{!"UseScratchSpacePrivateMemory", i1 true}
!69 = !{!"RelaxedBuiltins", i1 false}
!70 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!71 = !{!"GreaterThan2GBBufferRequired", i1 true}
!72 = !{!"GreaterThan4GBBufferRequired", i1 true}
!73 = !{!"DisableA64WA", i1 false}
!74 = !{!"ForceEnableA64WA", i1 false}
!75 = !{!"PushConstantsEnable", i1 true}
!76 = !{!"HasPositivePointerOffset", i1 false}
!77 = !{!"HasBufferOffsetArg", i1 true}
!78 = !{!"BufferOffsetArgOptional", i1 true}
!79 = !{!"replaceGlobalOffsetsByZero", i1 false}
!80 = !{!"forcePixelShaderSIMDMode", i32 0}
!81 = !{!"forceTotalGRFNum", i32 0}
!82 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!83 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!84 = !{!"UniformWGS", i1 false}
!85 = !{!"disableVertexComponentPacking", i1 false}
!86 = !{!"disablePartialVertexComponentPacking", i1 false}
!87 = !{!"PreferBindlessImages", i1 true}
!88 = !{!"UseBindlessMode", i1 true}
!89 = !{!"UseLegacyBindlessMode", i1 false}
!90 = !{!"disableMathRefactoring", i1 false}
!91 = !{!"atomicBranch", i1 false}
!92 = !{!"spillCompression", i1 false}
!93 = !{!"AllowLICM", i1 true}
!94 = !{!"DisableEarlyOut", i1 false}
!95 = !{!"ForceInt32DivRemEmu", i1 false}
!96 = !{!"ForceInt32DivRemEmuSP", i1 false}
!97 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!98 = !{!"DisableFastestSingleCSSIMD", i1 false}
!99 = !{!"DisableFastestLinearScan", i1 false}
!100 = !{!"UseStatelessforPrivateMemory", i1 false}
!101 = !{!"EnableTakeGlobalAddress", i1 false}
!102 = !{!"IsLibraryCompilation", i1 false}
!103 = !{!"LibraryCompileSIMDSize", i32 0}
!104 = !{!"FastVISACompile", i1 false}
!105 = !{!"MatchSinCosPi", i1 false}
!106 = !{!"ExcludeIRFromZEBinary", i1 false}
!107 = !{!"EmitZeBinVISASections", i1 false}
!108 = !{!"FP64GenEmulationEnabled", i1 false}
!109 = !{!"FP64GenConvEmulationEnabled", i1 false}
!110 = !{!"allowDisableRematforCS", i1 false}
!111 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!112 = !{!"DisableCPSOmaskWA", i1 false}
!113 = !{!"DisableFastestGopt", i1 false}
!114 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!115 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!116 = !{!"DisableConstantCoalescing", i1 false}
!117 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!118 = !{!"WaEnableALTModeVisaWA", i1 false}
!119 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!120 = !{!"EnableLdStCombineforLoad", i1 false}
!121 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!122 = !{!"ForceUniformBuffer", i1 false}
!123 = !{!"ForceUniformSurfaceSampler", i1 false}
!124 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!125 = !{!"NewSpillCostFunction", i1 false}
!126 = !{!"EnableVRT", i1 true}
!127 = !{!"ForceLargeGRFNum4RQ", i1 false}
!128 = !{!"DisableEUFusion", i1 false}
!129 = !{!"DisableFDivToFMulInvOpt", i1 false}
!130 = !{!"initializePhiSampleSourceWA", i1 false}
!131 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!132 = !{!"DisableLoosenSimd32Occu", i1 false}
!133 = !{!"FastestS1Options", i32 0}
!134 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!135 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!136 = !{!"LscSamplerRouting", i32 0}
!137 = !{!"UseBarrierControlFlowOptimization", i1 false}
!138 = !{!"EnableDynamicRQManagement", i1 false}
!139 = !{!"WaDisablePayloadCoalescing", i1 false}
!140 = !{!"Quad8InputThreshold", i32 0}
!141 = !{!"UseResourceLoopUnrollNested", i1 false}
!142 = !{!"DisableLoopUnroll", i1 false}
!143 = !{!"ForcePushConstantMode", i32 0}
!144 = !{!"UseInstructionHoistingOptimization", i1 false}
!145 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!146 = !{!"ForceVRTGRFCeiling", i32 0}
!147 = !{!"DisableSamplerBackingByLSC", i32 0}
!148 = !{!"UseLinearScanRA", i1 false}
!149 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!150 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!151 = !{!"VISASpillAllowed", i32 0}
!152 = !{!"FuncMD", !153, !154, !299, !300, !329, !330, !335, !336, !337, !338, !398, !399, !400, !401, !442, !443, !444, !445, !478, !479, !483, !484, !488, !489, !495, !496, !500, !501, !505, !506, !510, !511, !515, !516, !520, !521, !528, !529, !533, !534, !538, !539, !543, !544, !548, !549, !553, !554, !558, !559, !563, !564, !568, !569, !573, !574, !575, !576, !592, !593, !594, !595}
!153 = !{!"FuncMDMap[0]", ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiKstoreKernelE}
!154 = !{!"FuncMDValue[0]", !155, !156, !160, !163, !164, !165, !166, !167, !199, !200, !201, !224, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !277, !281, !285, !289, !293, !297, !298}
!155 = !{!"localOffsets"}
!156 = !{!"workGroupWalkOrder", !157, !158, !159}
!157 = !{!"dim0", i32 0}
!158 = !{!"dim1", i32 1}
!159 = !{!"dim2", i32 2}
!160 = !{!"threadGroupSize", !157, !161, !162}
!161 = !{!"dim1", i32 0}
!162 = !{!"dim2", i32 0}
!163 = !{!"threadGroupSizeHint", !157, !161, !162}
!164 = !{!"vecTypeHint", !""}
!165 = !{!"funcArgs"}
!166 = !{!"argInfoList"}
!167 = !{!"implicitArgInfoList", !168, !174, !176, !178, !180, !182, !184, !186, !189, !191, !193, !195, !196, !197}
!168 = !{!"implicitArgInfoListVec[0]", !169, !170, !171, !172, !173}
!169 = !{!"argId", i32 0}
!170 = !{!"explicitArgNum", i32 -1}
!171 = !{!"structArgOffset", i32 -1}
!172 = !{!"imgAccessFloatCoords", i32 -1}
!173 = !{!"imgAccessIntCoords", i32 -1}
!174 = !{!"implicitArgInfoListVec[1]", !175, !170, !171, !172, !173}
!175 = !{!"argId", i32 2}
!176 = !{!"implicitArgInfoListVec[2]", !177, !170, !171, !172, !173}
!177 = !{!"argId", i32 8}
!178 = !{!"implicitArgInfoListVec[3]", !179, !170, !171, !172, !173}
!179 = !{!"argId", i32 9}
!180 = !{!"implicitArgInfoListVec[4]", !181, !170, !171, !172, !173}
!181 = !{!"argId", i32 10}
!182 = !{!"implicitArgInfoListVec[5]", !183, !170, !171, !172, !173}
!183 = !{!"argId", i32 11}
!184 = !{!"implicitArgInfoListVec[6]", !185, !170, !171, !172, !173}
!185 = !{!"argId", i32 13}
!186 = !{!"implicitArgInfoListVec[7]", !187, !188, !171, !172, !173}
!187 = !{!"argId", i32 15}
!188 = !{!"explicitArgNum", i32 0}
!189 = !{!"implicitArgInfoListVec[8]", !187, !190, !171, !172, !173}
!190 = !{!"explicitArgNum", i32 1}
!191 = !{!"implicitArgInfoListVec[9]", !187, !192, !171, !172, !173}
!192 = !{!"explicitArgNum", i32 2}
!193 = !{!"implicitArgInfoListVec[10]", !194, !188, !171, !172, !173}
!194 = !{!"argId", i32 54}
!195 = !{!"implicitArgInfoListVec[11]", !194, !190, !171, !172, !173}
!196 = !{!"implicitArgInfoListVec[12]", !194, !192, !171, !172, !173}
!197 = !{!"implicitArgInfoListVec[13]", !194, !198, !171, !172, !173}
!198 = !{!"explicitArgNum", i32 8}
!199 = !{!"functionType", !"KernelFunction"}
!200 = !{!"requiredSubGroupSize", i32 16}
!201 = !{!"rtInfo", !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !219, !220, !221, !222, !223}
!202 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!203 = !{!"isContinuation", i1 false}
!204 = !{!"hasTraceRayPayload", i1 false}
!205 = !{!"hasHitAttributes", i1 false}
!206 = !{!"hasCallableData", i1 false}
!207 = !{!"ShaderStackSize", i32 0}
!208 = !{!"ShaderHash", i64 0}
!209 = !{!"ShaderName", !""}
!210 = !{!"ParentName", !""}
!211 = !{!"SlotNum", ptr null}
!212 = !{!"NOSSize", i32 0}
!213 = !{!"globalRootSignatureSize", i32 0}
!214 = !{!"Entries"}
!215 = !{!"SpillUnions"}
!216 = !{!"CustomHitAttrSizeInBytes", i32 0}
!217 = !{!"Types", !218}
!218 = !{!"FullFrameTys"}
!219 = !{!"Aliases"}
!220 = !{!"numSyncRTStacks", i32 0}
!221 = !{!"NumCoherenceHintBits", i32 0}
!222 = !{!"useSyncHWStack", i1 false}
!223 = !{!"OriginatingShaderName", !""}
!224 = !{!"resAllocMD", !225, !226, !227, !228, !249}
!225 = !{!"uavsNumType", i32 0}
!226 = !{!"srvsNumType", i32 0}
!227 = !{!"samplersNumType", i32 0}
!228 = !{!"argAllocMDList", !229, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248}
!229 = !{!"argAllocMDListVec[0]", !230, !231, !232}
!230 = !{!"type", i32 0}
!231 = !{!"extensionType", i32 -1}
!232 = !{!"indexType", i32 -1}
!233 = !{!"argAllocMDListVec[1]", !230, !231, !232}
!234 = !{!"argAllocMDListVec[2]", !230, !231, !232}
!235 = !{!"argAllocMDListVec[3]", !230, !231, !232}
!236 = !{!"argAllocMDListVec[4]", !230, !231, !232}
!237 = !{!"argAllocMDListVec[5]", !230, !231, !232}
!238 = !{!"argAllocMDListVec[6]", !230, !231, !232}
!239 = !{!"argAllocMDListVec[7]", !230, !231, !232}
!240 = !{!"argAllocMDListVec[8]", !230, !231, !232}
!241 = !{!"argAllocMDListVec[9]", !230, !231, !232}
!242 = !{!"argAllocMDListVec[10]", !230, !231, !232}
!243 = !{!"argAllocMDListVec[11]", !230, !231, !232}
!244 = !{!"argAllocMDListVec[12]", !230, !231, !232}
!245 = !{!"argAllocMDListVec[13]", !230, !231, !232}
!246 = !{!"argAllocMDListVec[14]", !230, !231, !232}
!247 = !{!"argAllocMDListVec[15]", !230, !231, !232}
!248 = !{!"argAllocMDListVec[16]", !230, !231, !232}
!249 = !{!"inlineSamplersMD"}
!250 = !{!"maxByteOffsets"}
!251 = !{!"IsInitializer", i1 false}
!252 = !{!"IsFinalizer", i1 false}
!253 = !{!"CompiledSubGroupsNumber", i32 0}
!254 = !{!"maxRegPressure", i32 0}
!255 = !{!"maxRegPressureSimd16", i32 0}
!256 = !{!"maxRegPressureSimd32", i32 0}
!257 = !{!"hasInlineVmeSamplers", i1 false}
!258 = !{!"localSize", i32 0}
!259 = !{!"localIDPresent", i1 false}
!260 = !{!"groupIDPresent", i1 false}
!261 = !{!"privateMemoryPerWI", i32 0}
!262 = !{!"prevFPOffset", i32 0}
!263 = !{!"globalIDPresent", i1 false}
!264 = !{!"hasSyncRTCalls", i1 false}
!265 = !{!"hasPrintfCalls", i1 false}
!266 = !{!"requireAssertBuffer", i1 false}
!267 = !{!"requireSyncBuffer", i1 false}
!268 = !{!"hasIndirectCalls", i1 false}
!269 = !{!"hasNonKernelArgLoad", i1 false}
!270 = !{!"hasNonKernelArgStore", i1 false}
!271 = !{!"hasNonKernelArgAtomic", i1 false}
!272 = !{!"UserAnnotations"}
!273 = !{!"m_OpenCLArgAddressSpaces", !274, !275, !276}
!274 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 1}
!275 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 1}
!276 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 1}
!277 = !{!"m_OpenCLArgAccessQualifiers", !278, !279, !280}
!278 = !{!"m_OpenCLArgAccessQualifiersVec[0]", !"none"}
!279 = !{!"m_OpenCLArgAccessQualifiersVec[1]", !"none"}
!280 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!281 = !{!"m_OpenCLArgTypes", !282, !283, !284}
!282 = !{!"m_OpenCLArgTypesVec[0]", !"class.sycl::_V1::detail::half_impl::half*"}
!283 = !{!"m_OpenCLArgTypesVec[1]", !"float*"}
!284 = !{!"m_OpenCLArgTypesVec[2]", !"char*"}
!285 = !{!"m_OpenCLArgBaseTypes", !286, !287, !288}
!286 = !{!"m_OpenCLArgBaseTypesVec[0]", !"class.sycl::_V1::detail::half_impl::half*"}
!287 = !{!"m_OpenCLArgBaseTypesVec[1]", !"float*"}
!288 = !{!"m_OpenCLArgBaseTypesVec[2]", !"char*"}
!289 = !{!"m_OpenCLArgTypeQualifiers", !290, !291, !292}
!290 = !{!"m_OpenCLArgTypeQualifiersVec[0]", !""}
!291 = !{!"m_OpenCLArgTypeQualifiersVec[1]", !""}
!292 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!293 = !{!"m_OpenCLArgNames", !294, !295, !296}
!294 = !{!"m_OpenCLArgNamesVec[0]", !""}
!295 = !{!"m_OpenCLArgNamesVec[1]", !""}
!296 = !{!"m_OpenCLArgNamesVec[2]", !""}
!297 = !{!"m_OpenCLArgScalarAsPointers"}
!298 = !{!"m_OptsToDisablePerFunc"}
!299 = !{!"FuncMDMap[1]", ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiVstoreKernelE}
!300 = !{!"FuncMDValue[1]", !155, !156, !160, !163, !164, !165, !166, !301, !199, !200, !201, !310, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !315, !317, !319, !322, !325, !327, !297, !298}
!301 = !{!"implicitArgInfoList", !168, !174, !176, !178, !180, !182, !184, !186, !189, !191, !302, !304, !305, !306, !307, !308}
!302 = !{!"implicitArgInfoListVec[10]", !187, !303, !171, !172, !173}
!303 = !{!"explicitArgNum", i32 3}
!304 = !{!"implicitArgInfoListVec[11]", !194, !188, !171, !172, !173}
!305 = !{!"implicitArgInfoListVec[12]", !194, !190, !171, !172, !173}
!306 = !{!"implicitArgInfoListVec[13]", !194, !192, !171, !172, !173}
!307 = !{!"implicitArgInfoListVec[14]", !194, !303, !171, !172, !173}
!308 = !{!"implicitArgInfoListVec[15]", !194, !309, !171, !172, !173}
!309 = !{!"explicitArgNum", i32 9}
!310 = !{!"resAllocMD", !225, !226, !227, !311, !249}
!311 = !{!"argAllocMDList", !229, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !312, !313, !314}
!312 = !{!"argAllocMDListVec[17]", !230, !231, !232}
!313 = !{!"argAllocMDListVec[18]", !230, !231, !232}
!314 = !{!"argAllocMDListVec[19]", !230, !231, !232}
!315 = !{!"m_OpenCLArgAddressSpaces", !274, !275, !276, !316}
!316 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 1}
!317 = !{!"m_OpenCLArgAccessQualifiers", !278, !279, !280, !318}
!318 = !{!"m_OpenCLArgAccessQualifiersVec[3]", !"none"}
!319 = !{!"m_OpenCLArgTypes", !282, !283, !320, !321}
!320 = !{!"m_OpenCLArgTypesVec[2]", !"float*"}
!321 = !{!"m_OpenCLArgTypesVec[3]", !"char*"}
!322 = !{!"m_OpenCLArgBaseTypes", !286, !287, !323, !324}
!323 = !{!"m_OpenCLArgBaseTypesVec[2]", !"float*"}
!324 = !{!"m_OpenCLArgBaseTypesVec[3]", !"char*"}
!325 = !{!"m_OpenCLArgTypeQualifiers", !290, !291, !292, !326}
!326 = !{!"m_OpenCLArgTypeQualifiersVec[3]", !""}
!327 = !{!"m_OpenCLArgNames", !294, !295, !296, !328}
!328 = !{!"m_OpenCLArgNamesVec[3]", !""}
!329 = !{!"FuncMDMap[2]", ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi2EEE}
!330 = !{!"FuncMDValue[2]", !155, !156, !160, !163, !164, !165, !166, !167, !199, !200, !201, !224, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !277, !331, !333, !289, !293, !297, !298}
!331 = !{!"m_OpenCLArgTypes", !282, !332, !284}
!332 = !{!"m_OpenCLArgTypesVec[1]", !"char*"}
!333 = !{!"m_OpenCLArgBaseTypes", !286, !334, !288}
!334 = !{!"m_OpenCLArgBaseTypesVec[1]", !"char*"}
!335 = !{!"FuncMDMap[3]", ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi4EEE}
!336 = !{!"FuncMDValue[3]", !155, !156, !160, !163, !164, !165, !166, !167, !199, !200, !201, !224, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !277, !331, !333, !289, !293, !297, !298}
!337 = !{!"FuncMDMap[4]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi2EEE}
!338 = !{!"FuncMDValue[4]", !339, !156, !160, !163, !164, !165, !166, !343, !199, !200, !201, !358, !250, !251, !252, !253, !254, !255, !256, !257, !364, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !365, !370, !374, !382, !390, !394, !297, !298}
!339 = !{!"localOffsets", !340}
!340 = !{!"localOffsetsVec[0]", !341, !342}
!341 = !{!"m_Offset", i32 0}
!342 = !{!"m_Var", ptr addrspace(3) @GenSLM.LocalMemPoolOnGetMemPoolPtr}
!343 = !{!"implicitArgInfoList", !168, !174, !344, !346, !347, !348, !349, !350, !351, !191, !302, !352, !354, !306, !307, !355, !356}
!344 = !{!"implicitArgInfoListVec[2]", !345, !170, !171, !172, !173}
!345 = !{!"argId", i32 6}
!346 = !{!"implicitArgInfoListVec[3]", !177, !170, !171, !172, !173}
!347 = !{!"implicitArgInfoListVec[4]", !179, !170, !171, !172, !173}
!348 = !{!"implicitArgInfoListVec[5]", !181, !170, !171, !172, !173}
!349 = !{!"implicitArgInfoListVec[6]", !183, !170, !171, !172, !173}
!350 = !{!"implicitArgInfoListVec[7]", !185, !170, !171, !172, !173}
!351 = !{!"implicitArgInfoListVec[8]", !187, !188, !171, !172, !173}
!352 = !{!"implicitArgInfoListVec[11]", !187, !353, !171, !172, !173}
!353 = !{!"explicitArgNum", i32 5}
!354 = !{!"implicitArgInfoListVec[12]", !194, !188, !171, !172, !173}
!355 = !{!"implicitArgInfoListVec[15]", !194, !353, !171, !172, !173}
!356 = !{!"implicitArgInfoListVec[16]", !194, !357, !171, !172, !173}
!357 = !{!"explicitArgNum", i32 13}
!358 = !{!"resAllocMD", !225, !226, !227, !359, !249}
!359 = !{!"argAllocMDList", !229, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !312, !313, !314, !360, !361, !362, !363}
!360 = !{!"argAllocMDListVec[20]", !230, !231, !232}
!361 = !{!"argAllocMDListVec[21]", !230, !231, !232}
!362 = !{!"argAllocMDListVec[22]", !230, !231, !232}
!363 = !{!"argAllocMDListVec[23]", !230, !231, !232}
!364 = !{!"localSize", i32 4096}
!365 = !{!"m_OpenCLArgAddressSpaces", !274, !366, !276, !316, !367, !368, !369}
!366 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 0}
!367 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 0}
!368 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 1}
!369 = !{!"m_OpenCLArgAddressSpacesVec[6]", i32 0}
!370 = !{!"m_OpenCLArgAccessQualifiers", !278, !279, !280, !318, !371, !372, !373}
!371 = !{!"m_OpenCLArgAccessQualifiersVec[4]", !"none"}
!372 = !{!"m_OpenCLArgAccessQualifiersVec[5]", !"none"}
!373 = !{!"m_OpenCLArgAccessQualifiersVec[6]", !"none"}
!374 = !{!"m_OpenCLArgTypes", !375, !376, !377, !378, !379, !380, !381}
!375 = !{!"m_OpenCLArgTypesVec[0]", !"long*"}
!376 = !{!"m_OpenCLArgTypesVec[1]", !"long"}
!377 = !{!"m_OpenCLArgTypesVec[2]", !"class.sycl::_V1::detail::half_impl::half*"}
!378 = !{!"m_OpenCLArgTypesVec[3]", !"float*"}
!379 = !{!"m_OpenCLArgTypesVec[4]", !"long"}
!380 = !{!"m_OpenCLArgTypesVec[5]", !"char*"}
!381 = !{!"m_OpenCLArgTypesVec[6]", !"long"}
!382 = !{!"m_OpenCLArgBaseTypes", !383, !384, !385, !386, !387, !388, !389}
!383 = !{!"m_OpenCLArgBaseTypesVec[0]", !"long*"}
!384 = !{!"m_OpenCLArgBaseTypesVec[1]", !"long"}
!385 = !{!"m_OpenCLArgBaseTypesVec[2]", !"class.sycl::_V1::detail::half_impl::half*"}
!386 = !{!"m_OpenCLArgBaseTypesVec[3]", !"float*"}
!387 = !{!"m_OpenCLArgBaseTypesVec[4]", !"long"}
!388 = !{!"m_OpenCLArgBaseTypesVec[5]", !"char*"}
!389 = !{!"m_OpenCLArgBaseTypesVec[6]", !"long"}
!390 = !{!"m_OpenCLArgTypeQualifiers", !290, !291, !292, !326, !391, !392, !393}
!391 = !{!"m_OpenCLArgTypeQualifiersVec[4]", !""}
!392 = !{!"m_OpenCLArgTypeQualifiersVec[5]", !""}
!393 = !{!"m_OpenCLArgTypeQualifiersVec[6]", !""}
!394 = !{!"m_OpenCLArgNames", !294, !295, !296, !328, !395, !396, !397}
!395 = !{!"m_OpenCLArgNamesVec[4]", !""}
!396 = !{!"m_OpenCLArgNamesVec[5]", !""}
!397 = !{!"m_OpenCLArgNamesVec[6]", !""}
!398 = !{!"FuncMDMap[5]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi4EEE}
!399 = !{!"FuncMDValue[5]", !339, !156, !160, !163, !164, !165, !166, !343, !199, !200, !201, !358, !250, !251, !252, !253, !254, !255, !256, !257, !364, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !365, !370, !374, !382, !390, !394, !297, !298}
!400 = !{!"FuncMDMap[6]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi2EEE}
!401 = !{!"FuncMDValue[6]", !339, !156, !160, !163, !164, !165, !166, !402, !199, !200, !201, !414, !250, !251, !252, !253, !254, !255, !256, !257, !364, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !419, !424, !426, !432, !438, !440, !297, !298}
!402 = !{!"implicitArgInfoList", !168, !174, !344, !346, !347, !348, !349, !350, !351, !191, !403, !352, !405, !407, !408, !409, !410, !411, !412}
!403 = !{!"implicitArgInfoListVec[10]", !187, !404, !171, !172, !173}
!404 = !{!"explicitArgNum", i32 4}
!405 = !{!"implicitArgInfoListVec[12]", !187, !406, !171, !172, !173}
!406 = !{!"explicitArgNum", i32 6}
!407 = !{!"implicitArgInfoListVec[13]", !194, !188, !171, !172, !173}
!408 = !{!"implicitArgInfoListVec[14]", !194, !192, !171, !172, !173}
!409 = !{!"implicitArgInfoListVec[15]", !194, !404, !171, !172, !173}
!410 = !{!"implicitArgInfoListVec[16]", !194, !353, !171, !172, !173}
!411 = !{!"implicitArgInfoListVec[17]", !194, !406, !171, !172, !173}
!412 = !{!"implicitArgInfoListVec[18]", !194, !413, !171, !172, !173}
!413 = !{!"explicitArgNum", i32 14}
!414 = !{!"resAllocMD", !225, !226, !227, !415, !249}
!415 = !{!"argAllocMDList", !229, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !312, !313, !314, !360, !361, !362, !363, !416, !417, !418}
!416 = !{!"argAllocMDListVec[24]", !230, !231, !232}
!417 = !{!"argAllocMDListVec[25]", !230, !231, !232}
!418 = !{!"argAllocMDListVec[26]", !230, !231, !232}
!419 = !{!"m_OpenCLArgAddressSpaces", !274, !366, !276, !420, !421, !368, !422, !423}
!420 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 0}
!421 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 1}
!422 = !{!"m_OpenCLArgAddressSpacesVec[6]", i32 1}
!423 = !{!"m_OpenCLArgAddressSpacesVec[7]", i32 0}
!424 = !{!"m_OpenCLArgAccessQualifiers", !278, !279, !280, !318, !371, !372, !373, !425}
!425 = !{!"m_OpenCLArgAccessQualifiersVec[7]", !"none"}
!426 = !{!"m_OpenCLArgTypes", !375, !376, !377, !427, !428, !429, !430, !431}
!427 = !{!"m_OpenCLArgTypesVec[3]", !"long"}
!428 = !{!"m_OpenCLArgTypesVec[4]", !"float*"}
!429 = !{!"m_OpenCLArgTypesVec[5]", !"float*"}
!430 = !{!"m_OpenCLArgTypesVec[6]", !"char*"}
!431 = !{!"m_OpenCLArgTypesVec[7]", !"long"}
!432 = !{!"m_OpenCLArgBaseTypes", !383, !384, !385, !433, !434, !435, !436, !437}
!433 = !{!"m_OpenCLArgBaseTypesVec[3]", !"long"}
!434 = !{!"m_OpenCLArgBaseTypesVec[4]", !"float*"}
!435 = !{!"m_OpenCLArgBaseTypesVec[5]", !"float*"}
!436 = !{!"m_OpenCLArgBaseTypesVec[6]", !"char*"}
!437 = !{!"m_OpenCLArgBaseTypesVec[7]", !"long"}
!438 = !{!"m_OpenCLArgTypeQualifiers", !290, !291, !292, !326, !391, !392, !393, !439}
!439 = !{!"m_OpenCLArgTypeQualifiersVec[7]", !""}
!440 = !{!"m_OpenCLArgNames", !294, !295, !296, !328, !395, !396, !397, !441}
!441 = !{!"m_OpenCLArgNamesVec[7]", !""}
!442 = !{!"FuncMDMap[7]", ptr @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi4EEE}
!443 = !{!"FuncMDValue[7]", !339, !156, !160, !163, !164, !165, !166, !402, !199, !200, !201, !414, !250, !251, !252, !253, !254, !255, !256, !257, !364, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !419, !424, !426, !432, !438, !440, !297, !298}
!444 = !{!"FuncMDMap[8]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE}
!445 = !{!"FuncMDValue[8]", !446, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !468, !473, !390, !394, !297, !298}
!446 = !{!"localOffsets", !447}
!447 = !{!"localOffsetsVec[0]", !341, !448}
!448 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE-ExtSLM}
!449 = !{!"implicitArgInfoList", !168, !174, !450, !451, !452, !453, !454, !455, !456, !457, !458, !459, !460, !461, !462}
!450 = !{!"implicitArgInfoListVec[2]", !183, !170, !171, !172, !173}
!451 = !{!"implicitArgInfoListVec[3]", !185, !170, !171, !172, !173}
!452 = !{!"implicitArgInfoListVec[4]", !187, !190, !171, !172, !173}
!453 = !{!"implicitArgInfoListVec[5]", !187, !192, !171, !172, !173}
!454 = !{!"implicitArgInfoListVec[6]", !187, !303, !171, !172, !173}
!455 = !{!"implicitArgInfoListVec[7]", !187, !404, !171, !172, !173}
!456 = !{!"implicitArgInfoListVec[8]", !187, !406, !171, !172, !173}
!457 = !{!"implicitArgInfoListVec[9]", !194, !190, !171, !172, !173}
!458 = !{!"implicitArgInfoListVec[10]", !194, !192, !171, !172, !173}
!459 = !{!"implicitArgInfoListVec[11]", !194, !303, !171, !172, !173}
!460 = !{!"implicitArgInfoListVec[12]", !194, !404, !171, !172, !173}
!461 = !{!"implicitArgInfoListVec[13]", !194, !406, !171, !172, !173}
!462 = !{!"implicitArgInfoListVec[14]", !194, !309, !171, !172, !173}
!463 = !{!"resAllocMD", !225, !226, !227, !464, !249}
!464 = !{!"argAllocMDList", !229, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !312, !313, !314, !360, !361}
!465 = !{!"m_OpenCLArgAddressSpaces", !466, !275, !276, !316, !421, !467, !422}
!466 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 0}
!467 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 3}
!468 = !{!"m_OpenCLArgTypes", !469, !470, !320, !378, !471, !429, !472}
!469 = !{!"m_OpenCLArgTypesVec[0]", !"int"}
!470 = !{!"m_OpenCLArgTypesVec[1]", !"int*"}
!471 = !{!"m_OpenCLArgTypesVec[4]", !"class.sycl::_V1::detail::half_impl::half*"}
!472 = !{!"m_OpenCLArgTypesVec[6]", !"class.sycl::_V1::detail::half_impl::half*"}
!473 = !{!"m_OpenCLArgBaseTypes", !474, !475, !323, !386, !476, !435, !477}
!474 = !{!"m_OpenCLArgBaseTypesVec[0]", !"int"}
!475 = !{!"m_OpenCLArgBaseTypesVec[1]", !"int*"}
!476 = !{!"m_OpenCLArgBaseTypesVec[4]", !"class.sycl::_V1::detail::half_impl::half*"}
!477 = !{!"m_OpenCLArgBaseTypesVec[6]", !"class.sycl::_V1::detail::half_impl::half*"}
!478 = !{!"FuncMDMap[9]", ptr @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE}
!479 = !{!"FuncMDValue[9]", !480, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !468, !473, !390, !394, !297, !298}
!480 = !{!"localOffsets", !481}
!481 = !{!"localOffsetsVec[0]", !341, !482}
!482 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE-ExtSLM}
!483 = !{!"FuncMDMap[10]", ptr @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE}
!484 = !{!"FuncMDValue[10]", !485, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !468, !473, !390, !394, !297, !298}
!485 = !{!"localOffsets", !486}
!486 = !{!"localOffsetsVec[0]", !341, !487}
!487 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE-ExtSLM}
!488 = !{!"FuncMDMap[11]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE}
!489 = !{!"FuncMDValue[11]", !490, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!490 = !{!"localOffsets", !491}
!491 = !{!"localOffsetsVec[0]", !341, !492}
!492 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE-ExtSLM}
!493 = !{!"m_OpenCLArgTypes", !469, !470, !320, !378, !428, !429, !472}
!494 = !{!"m_OpenCLArgBaseTypes", !474, !475, !323, !386, !434, !435, !477}
!495 = !{!"FuncMDMap[12]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE}
!496 = !{!"FuncMDValue[12]", !497, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!497 = !{!"localOffsets", !498}
!498 = !{!"localOffsetsVec[0]", !341, !499}
!499 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE-ExtSLM}
!500 = !{!"FuncMDMap[13]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE}
!501 = !{!"FuncMDValue[13]", !502, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!502 = !{!"localOffsets", !503}
!503 = !{!"localOffsetsVec[0]", !341, !504}
!504 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE-ExtSLM}
!505 = !{!"FuncMDMap[14]", ptr @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE}
!506 = !{!"FuncMDValue[14]", !507, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!507 = !{!"localOffsets", !508}
!508 = !{!"localOffsetsVec[0]", !341, !509}
!509 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE-ExtSLM}
!510 = !{!"FuncMDMap[15]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE}
!511 = !{!"FuncMDValue[15]", !512, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!512 = !{!"localOffsets", !513}
!513 = !{!"localOffsetsVec[0]", !341, !514}
!514 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE-ExtSLM}
!515 = !{!"FuncMDMap[16]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE}
!516 = !{!"FuncMDValue[16]", !517, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!517 = !{!"localOffsets", !518}
!518 = !{!"localOffsetsVec[0]", !341, !519}
!519 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE-ExtSLM}
!520 = !{!"FuncMDMap[17]", ptr @_ZTSN12_GLOBAL__N_133Xe2KvTorchAbiS2MergeOutHalfKernelILi2EEE}
!521 = !{!"FuncMDValue[17]", !155, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !522, !370, !524, !526, !390, !394, !297, !298}
!522 = !{!"m_OpenCLArgAddressSpaces", !466, !275, !276, !316, !421, !523, !422}
!523 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 0}
!524 = !{!"m_OpenCLArgTypes", !469, !470, !320, !378, !428, !525, !472}
!525 = !{!"m_OpenCLArgTypesVec[5]", !"int"}
!526 = !{!"m_OpenCLArgBaseTypes", !474, !475, !323, !386, !434, !527, !477}
!527 = !{!"m_OpenCLArgBaseTypesVec[5]", !"int"}
!528 = !{!"FuncMDMap[18]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE}
!529 = !{!"FuncMDValue[18]", !530, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !468, !473, !390, !394, !297, !298}
!530 = !{!"localOffsets", !531}
!531 = !{!"localOffsetsVec[0]", !341, !532}
!532 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE-ExtSLM}
!533 = !{!"FuncMDMap[19]", ptr @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE}
!534 = !{!"FuncMDValue[19]", !535, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !468, !473, !390, !394, !297, !298}
!535 = !{!"localOffsets", !536}
!536 = !{!"localOffsetsVec[0]", !341, !537}
!537 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE-ExtSLM}
!538 = !{!"FuncMDMap[20]", ptr @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE}
!539 = !{!"FuncMDValue[20]", !540, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !468, !473, !390, !394, !297, !298}
!540 = !{!"localOffsets", !541}
!541 = !{!"localOffsetsVec[0]", !341, !542}
!542 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE-ExtSLM}
!543 = !{!"FuncMDMap[21]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE}
!544 = !{!"FuncMDValue[21]", !545, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!545 = !{!"localOffsets", !546}
!546 = !{!"localOffsetsVec[0]", !341, !547}
!547 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE-ExtSLM}
!548 = !{!"FuncMDMap[22]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE}
!549 = !{!"FuncMDValue[22]", !550, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!550 = !{!"localOffsets", !551}
!551 = !{!"localOffsetsVec[0]", !341, !552}
!552 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE-ExtSLM}
!553 = !{!"FuncMDMap[23]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE}
!554 = !{!"FuncMDValue[23]", !555, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!555 = !{!"localOffsets", !556}
!556 = !{!"localOffsetsVec[0]", !341, !557}
!557 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE-ExtSLM}
!558 = !{!"FuncMDMap[24]", ptr @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE}
!559 = !{!"FuncMDValue[24]", !560, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!560 = !{!"localOffsets", !561}
!561 = !{!"localOffsetsVec[0]", !341, !562}
!562 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE-ExtSLM}
!563 = !{!"FuncMDMap[25]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE}
!564 = !{!"FuncMDValue[25]", !565, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!565 = !{!"localOffsets", !566}
!566 = !{!"localOffsetsVec[0]", !341, !567}
!567 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE-ExtSLM}
!568 = !{!"FuncMDMap[26]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE}
!569 = !{!"FuncMDValue[26]", !570, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !465, !370, !493, !494, !390, !394, !297, !298}
!570 = !{!"localOffsets", !571}
!571 = !{!"localOffsetsVec[0]", !341, !572}
!572 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE-ExtSLM}
!573 = !{!"FuncMDMap[27]", ptr @_ZTSN12_GLOBAL__N_133Xe2KvTorchAbiS2MergeOutHalfKernelILi4EEE}
!574 = !{!"FuncMDValue[27]", !155, !156, !160, !163, !164, !165, !166, !449, !199, !200, !201, !463, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !522, !370, !524, !526, !390, !394, !297, !298}
!575 = !{!"FuncMDMap[28]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi2EEE}
!576 = !{!"FuncMDValue[28]", !155, !156, !160, !163, !164, !165, !166, !577, !199, !200, !201, !585, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !587, !317, !588, !590, !325, !327, !297, !298}
!577 = !{!"implicitArgInfoList", !168, !174, !176, !178, !180, !182, !184, !578, !579, !580, !581, !582, !583, !584}
!578 = !{!"implicitArgInfoListVec[7]", !187, !190, !171, !172, !173}
!579 = !{!"implicitArgInfoListVec[8]", !187, !192, !171, !172, !173}
!580 = !{!"implicitArgInfoListVec[9]", !187, !303, !171, !172, !173}
!581 = !{!"implicitArgInfoListVec[10]", !194, !190, !171, !172, !173}
!582 = !{!"implicitArgInfoListVec[11]", !194, !192, !171, !172, !173}
!583 = !{!"implicitArgInfoListVec[12]", !194, !303, !171, !172, !173}
!584 = !{!"implicitArgInfoListVec[13]", !194, !309, !171, !172, !173}
!585 = !{!"resAllocMD", !225, !226, !227, !586, !249}
!586 = !{!"argAllocMDList", !229, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !312}
!587 = !{!"m_OpenCLArgAddressSpaces", !466, !275, !276, !316}
!588 = !{!"m_OpenCLArgTypes", !469, !283, !284, !589}
!589 = !{!"m_OpenCLArgTypesVec[3]", !"class.sycl::_V1::detail::half_impl::half*"}
!590 = !{!"m_OpenCLArgBaseTypes", !474, !287, !288, !591}
!591 = !{!"m_OpenCLArgBaseTypesVec[3]", !"class.sycl::_V1::detail::half_impl::half*"}
!592 = !{!"FuncMDMap[29]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi4EEE}
!593 = !{!"FuncMDValue[29]", !155, !156, !160, !163, !164, !165, !166, !577, !199, !200, !201, !585, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !587, !317, !588, !590, !325, !327, !297, !298}
!594 = !{!"FuncMDMap[30]", ptr @Intel_Symbol_Table_Void_Program}
!595 = !{!"FuncMDValue[30]", !155, !596, !160, !163, !164, !165, !166, !597, !199, !598, !201, !599, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !601, !602, !603, !604, !605, !606, !297, !298}
!596 = !{!"workGroupWalkOrder", !157, !161, !162}
!597 = !{!"implicitArgInfoList"}
!598 = !{!"requiredSubGroupSize", i32 0}
!599 = !{!"resAllocMD", !225, !226, !227, !600, !249}
!600 = !{!"argAllocMDList"}
!601 = !{!"m_OpenCLArgAddressSpaces"}
!602 = !{!"m_OpenCLArgAccessQualifiers"}
!603 = !{!"m_OpenCLArgTypes"}
!604 = !{!"m_OpenCLArgBaseTypes"}
!605 = !{!"m_OpenCLArgTypeQualifiers"}
!606 = !{!"m_OpenCLArgNames"}
!607 = !{!"pushInfo", !608, !609, !610, !614, !615, !616, !617, !618, !619, !620, !621, !634, !635, !636, !637}
!608 = !{!"pushableAddresses"}
!609 = !{!"bindlessPushInfo"}
!610 = !{!"dynamicBufferInfo", !611, !612, !613}
!611 = !{!"firstIndex", i32 0}
!612 = !{!"numOffsets", i32 0}
!613 = !{!"forceDisabled", i1 false}
!614 = !{!"MaxNumberOfPushedBuffers", i32 0}
!615 = !{!"inlineConstantBufferSlot", i32 -1}
!616 = !{!"inlineConstantBufferOffset", i32 -1}
!617 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!618 = !{!"constants"}
!619 = !{!"inputs"}
!620 = !{!"constantReg"}
!621 = !{!"simplePushInfoArr", !622, !631, !632, !633}
!622 = !{!"simplePushInfoArrVec[0]", !623, !624, !625, !626, !627, !628, !629, !630}
!623 = !{!"cbIdx", i32 0}
!624 = !{!"pushableAddressGrfOffset", i32 -1}
!625 = !{!"pushableOffsetGrfOffset", i32 -1}
!626 = !{!"offset", i32 0}
!627 = !{!"size", i32 0}
!628 = !{!"isStateless", i1 false}
!629 = !{!"isBindless", i1 false}
!630 = !{!"simplePushLoads"}
!631 = !{!"simplePushInfoArrVec[1]", !623, !624, !625, !626, !627, !628, !629, !630}
!632 = !{!"simplePushInfoArrVec[2]", !623, !624, !625, !626, !627, !628, !629, !630}
!633 = !{!"simplePushInfoArrVec[3]", !623, !624, !625, !626, !627, !628, !629, !630}
!634 = !{!"simplePushBufferUsed", i32 0}
!635 = !{!"pushAnalysisWIInfos"}
!636 = !{!"inlineRTGlobalPtrOffset", i32 0}
!637 = !{!"rtSyncSurfPtrOffset", i32 0}
!638 = !{!"psInfo", !639, !640, !641, !642, !643, !644, !645, !646, !647, !648, !649, !650, !651, !652, !653, !654}
!639 = !{!"BlendStateDisabledMask", i8 0}
!640 = !{!"SkipSrc0Alpha", i1 false}
!641 = !{!"DualSourceBlendingDisabled", i1 false}
!642 = !{!"ForceEnableSimd32", i1 false}
!643 = !{!"DisableSimd32WithDiscard", i1 false}
!644 = !{!"outputDepth", i1 false}
!645 = !{!"outputStencil", i1 false}
!646 = !{!"outputMask", i1 false}
!647 = !{!"blendToFillEnabled", i1 false}
!648 = !{!"forceEarlyZ", i1 false}
!649 = !{!"hasVersionedLoop", i1 false}
!650 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!651 = !{!"blendOptimizationMode"}
!652 = !{!"colorOutputMask"}
!653 = !{!"isBlendEnabled"}
!654 = !{!"WaDisableVRS", i1 false}
!655 = !{!"csInfo", !656, !657, !658, !659, !81, !57, !58, !660, !59, !661, !662, !663, !664, !665, !666, !667, !668, !669, !670, !671, !92, !672, !673, !674, !675}
!656 = !{!"maxWorkGroupSize", i32 0}
!657 = !{!"waveSize", i32 0}
!658 = !{!"ComputeShaderSecondCompile"}
!659 = !{!"forcedSIMDSize", i8 0}
!660 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!661 = !{!"forceSpillCompression", i1 false}
!662 = !{!"allowLowerSimd", i1 false}
!663 = !{!"disableSimd32Slicing", i1 false}
!664 = !{!"disableSplitOnSpill", i1 false}
!665 = !{!"enableNewSpillCostFunction", i1 false}
!666 = !{!"forceVISAPreSched", i1 false}
!667 = !{!"disableLocalIdOrderOptimizations", i1 false}
!668 = !{!"disableDispatchAlongY", i1 false}
!669 = !{!"neededThreadIdLayout", ptr null}
!670 = !{!"forceTileYWalk", i1 false}
!671 = !{!"atomicBranch", i32 0}
!672 = !{!"disableEarlyOut", i1 false}
!673 = !{!"walkOrderEnabled", i1 false}
!674 = !{!"walkOrderOverride", i32 0}
!675 = !{!"ResForHfPacking"}
!676 = !{!"msInfo", !677, !678, !679, !680, !681, !682, !683, !684, !685}
!677 = !{!"PrimitiveTopology", i32 3}
!678 = !{!"MaxNumOfPrimitives", i32 0}
!679 = !{!"MaxNumOfVertices", i32 0}
!680 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!681 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!682 = !{!"WorkGroupSize", i32 0}
!683 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!684 = !{!"IndexFormat", i32 6}
!685 = !{!"SubgroupSize", i32 0}
!686 = !{!"taskInfo", !687, !682, !683, !685}
!687 = !{!"MaxNumOfOutputs", i32 0}
!688 = !{!"NBarrierCnt", i32 0}
!689 = !{!"rtInfo", !690, !691, !692, !693, !694, !695, !696, !697, !698, !699, !700, !701, !702, !703, !220}
!690 = !{!"RayQueryAllocSizeInBytes", i32 0}
!691 = !{!"NumContinuations", i32 0}
!692 = !{!"RTAsyncStackAddrspace", i32 -1}
!693 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!694 = !{!"SWHotZoneAddrspace", i32 -1}
!695 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!696 = !{!"SWStackAddrspace", i32 -1}
!697 = !{!"SWStackSurfaceStateOffset", ptr null}
!698 = !{!"RTSyncStackAddrspace", i32 -1}
!699 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!700 = !{!"doSyncDispatchRays", i1 false}
!701 = !{!"MemStyle", !"Xe"}
!702 = !{!"GlobalDataStyle", !"Xe"}
!703 = !{!"uberTileDimensions", ptr null}
!704 = !{!"hasSliceLayoutDependency", i1 false}
!705 = !{!"CurUniqueIndirectIdx", i32 0}
!706 = !{!"inlineDynTextures"}
!707 = !{!"inlineResInfoData"}
!708 = !{!"immConstant", !709, !710, !711}
!709 = !{!"data"}
!710 = !{!"sizes"}
!711 = !{!"zeroIdxs"}
!712 = !{!"stringConstants"}
!713 = !{!"inlineBuffers", !714, !718, !720}
!714 = !{!"inlineBuffersVec[0]", !715, !716, !717}
!715 = !{!"alignment", i32 0}
!716 = !{!"allocSize", i64 608}
!717 = !{!"Buffer"}
!718 = !{!"inlineBuffersVec[1]", !715, !719, !717}
!719 = !{!"allocSize", i64 0}
!720 = !{!"inlineBuffersVec[2]", !715, !719, !717}
!721 = !{!"GlobalBufferAddressRelocInfo"}
!722 = !{!"ConstantBufferAddressRelocInfo"}
!723 = !{!"forceLscCacheList"}
!724 = !{!"SrvMap"}
!725 = !{!"RasterizerOrderedByteAddressBuffer"}
!726 = !{!"RasterizerOrderedViews"}
!727 = !{!"MinNOSPushConstantSize", i32 0}
!728 = !{!"inlineProgramScopeOffsets", !729, !730, !731, !732, !733, !734, !735, !736, !737, !738, !739, !740, !741, !742, !743, !744, !745, !746, !747, !748, !749, !750, !751, !752, !753, !754, !755, !756, !757, !758, !759, !760, !761, !762, !763, !764, !765, !766, !767, !768, !769, !770, !771, !772, !773, !774, !775, !776, !777, !778, !779, !780, !781, !782, !783, !784, !785, !786, !787, !788, !789, !790, !791, !792, !793, !794, !795, !796, !797, !798, !799, !800, !801, !802, !803, !804}
!729 = !{!"inlineProgramScopeOffsetsMap[0]", ptr addrspace(2) @gVar}
!730 = !{!"inlineProgramScopeOffsetsValue[0]", i64 0}
!731 = !{!"inlineProgramScopeOffsetsMap[1]", ptr addrspace(2) @gVar.190}
!732 = !{!"inlineProgramScopeOffsetsValue[1]", i64 16}
!733 = !{!"inlineProgramScopeOffsetsMap[2]", ptr addrspace(2) @gVar.191}
!734 = !{!"inlineProgramScopeOffsetsValue[2]", i64 32}
!735 = !{!"inlineProgramScopeOffsetsMap[3]", ptr addrspace(2) @gVar.192}
!736 = !{!"inlineProgramScopeOffsetsValue[3]", i64 48}
!737 = !{!"inlineProgramScopeOffsetsMap[4]", ptr addrspace(2) @gVar.193}
!738 = !{!"inlineProgramScopeOffsetsValue[4]", i64 64}
!739 = !{!"inlineProgramScopeOffsetsMap[5]", ptr addrspace(2) @gVar.194}
!740 = !{!"inlineProgramScopeOffsetsValue[5]", i64 80}
!741 = !{!"inlineProgramScopeOffsetsMap[6]", ptr addrspace(2) @gVar.195}
!742 = !{!"inlineProgramScopeOffsetsValue[6]", i64 96}
!743 = !{!"inlineProgramScopeOffsetsMap[7]", ptr addrspace(2) @gVar.196}
!744 = !{!"inlineProgramScopeOffsetsValue[7]", i64 112}
!745 = !{!"inlineProgramScopeOffsetsMap[8]", ptr addrspace(2) @gVar.197}
!746 = !{!"inlineProgramScopeOffsetsValue[8]", i64 128}
!747 = !{!"inlineProgramScopeOffsetsMap[9]", ptr addrspace(2) @gVar.198}
!748 = !{!"inlineProgramScopeOffsetsValue[9]", i64 144}
!749 = !{!"inlineProgramScopeOffsetsMap[10]", ptr addrspace(2) @gVar.199}
!750 = !{!"inlineProgramScopeOffsetsValue[10]", i64 160}
!751 = !{!"inlineProgramScopeOffsetsMap[11]", ptr addrspace(2) @gVar.200}
!752 = !{!"inlineProgramScopeOffsetsValue[11]", i64 176}
!753 = !{!"inlineProgramScopeOffsetsMap[12]", ptr addrspace(2) @gVar.201}
!754 = !{!"inlineProgramScopeOffsetsValue[12]", i64 192}
!755 = !{!"inlineProgramScopeOffsetsMap[13]", ptr addrspace(2) @gVar.202}
!756 = !{!"inlineProgramScopeOffsetsValue[13]", i64 208}
!757 = !{!"inlineProgramScopeOffsetsMap[14]", ptr addrspace(2) @gVar.203}
!758 = !{!"inlineProgramScopeOffsetsValue[14]", i64 224}
!759 = !{!"inlineProgramScopeOffsetsMap[15]", ptr addrspace(2) @gVar.204}
!760 = !{!"inlineProgramScopeOffsetsValue[15]", i64 240}
!761 = !{!"inlineProgramScopeOffsetsMap[16]", ptr addrspace(2) @gVar.205}
!762 = !{!"inlineProgramScopeOffsetsValue[16]", i64 256}
!763 = !{!"inlineProgramScopeOffsetsMap[17]", ptr addrspace(2) @gVar.206}
!764 = !{!"inlineProgramScopeOffsetsValue[17]", i64 272}
!765 = !{!"inlineProgramScopeOffsetsMap[18]", ptr addrspace(2) @gVar.207}
!766 = !{!"inlineProgramScopeOffsetsValue[18]", i64 288}
!767 = !{!"inlineProgramScopeOffsetsMap[19]", ptr addrspace(2) @gVar.208}
!768 = !{!"inlineProgramScopeOffsetsValue[19]", i64 304}
!769 = !{!"inlineProgramScopeOffsetsMap[20]", ptr addrspace(2) @gVar.209}
!770 = !{!"inlineProgramScopeOffsetsValue[20]", i64 320}
!771 = !{!"inlineProgramScopeOffsetsMap[21]", ptr addrspace(2) @gVar.210}
!772 = !{!"inlineProgramScopeOffsetsValue[21]", i64 336}
!773 = !{!"inlineProgramScopeOffsetsMap[22]", ptr addrspace(2) @gVar.211}
!774 = !{!"inlineProgramScopeOffsetsValue[22]", i64 352}
!775 = !{!"inlineProgramScopeOffsetsMap[23]", ptr addrspace(2) @gVar.212}
!776 = !{!"inlineProgramScopeOffsetsValue[23]", i64 368}
!777 = !{!"inlineProgramScopeOffsetsMap[24]", ptr addrspace(2) @gVar.213}
!778 = !{!"inlineProgramScopeOffsetsValue[24]", i64 384}
!779 = !{!"inlineProgramScopeOffsetsMap[25]", ptr addrspace(2) @gVar.214}
!780 = !{!"inlineProgramScopeOffsetsValue[25]", i64 400}
!781 = !{!"inlineProgramScopeOffsetsMap[26]", ptr addrspace(2) @gVar.215}
!782 = !{!"inlineProgramScopeOffsetsValue[26]", i64 416}
!783 = !{!"inlineProgramScopeOffsetsMap[27]", ptr addrspace(2) @gVar.216}
!784 = !{!"inlineProgramScopeOffsetsValue[27]", i64 432}
!785 = !{!"inlineProgramScopeOffsetsMap[28]", ptr addrspace(2) @gVar.217}
!786 = !{!"inlineProgramScopeOffsetsValue[28]", i64 448}
!787 = !{!"inlineProgramScopeOffsetsMap[29]", ptr addrspace(2) @gVar.218}
!788 = !{!"inlineProgramScopeOffsetsValue[29]", i64 464}
!789 = !{!"inlineProgramScopeOffsetsMap[30]", ptr addrspace(2) @gVar.219}
!790 = !{!"inlineProgramScopeOffsetsValue[30]", i64 480}
!791 = !{!"inlineProgramScopeOffsetsMap[31]", ptr addrspace(2) @gVar.220}
!792 = !{!"inlineProgramScopeOffsetsValue[31]", i64 496}
!793 = !{!"inlineProgramScopeOffsetsMap[32]", ptr addrspace(2) @gVar.221}
!794 = !{!"inlineProgramScopeOffsetsValue[32]", i64 512}
!795 = !{!"inlineProgramScopeOffsetsMap[33]", ptr addrspace(2) @gVar.222}
!796 = !{!"inlineProgramScopeOffsetsValue[33]", i64 528}
!797 = !{!"inlineProgramScopeOffsetsMap[34]", ptr addrspace(2) @gVar.223}
!798 = !{!"inlineProgramScopeOffsetsValue[34]", i64 544}
!799 = !{!"inlineProgramScopeOffsetsMap[35]", ptr addrspace(2) @gVar.224}
!800 = !{!"inlineProgramScopeOffsetsValue[35]", i64 560}
!801 = !{!"inlineProgramScopeOffsetsMap[36]", ptr addrspace(2) @gVar.225}
!802 = !{!"inlineProgramScopeOffsetsValue[36]", i64 576}
!803 = !{!"inlineProgramScopeOffsetsMap[37]", ptr addrspace(2) @gVar.226}
!804 = !{!"inlineProgramScopeOffsetsValue[37]", i64 592}
!805 = !{!"shaderData", !806}
!806 = !{!"numReplicas", i32 0}
!807 = !{!"URBInfo", !808, !809, !810}
!808 = !{!"has64BVertexHeaderInput", i1 false}
!809 = !{!"has64BVertexHeaderOutput", i1 false}
!810 = !{!"hasVertexHeader", i1 true}
!811 = !{!"UseBindlessImage", i1 true}
!812 = !{!"HasBindlessImageRead", i1 false}
!813 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!814 = !{!"enableRangeReduce", i1 false}
!815 = !{!"allowMatchMadOptimizationforVS", i1 false}
!816 = !{!"disableMatchMadOptimizationForCS", i1 false}
!817 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!818 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!819 = !{!"statefulResourcesNotAliased", i1 false}
!820 = !{!"disableMixMode", i1 false}
!821 = !{!"genericAccessesResolved", i1 false}
!822 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!823 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!824 = !{!"disableSeparateScratchWA", i1 false}
!825 = !{!"enableRemoveUnusedTGMFence", i1 false}
!826 = !{!"PrivateMemoryPerFG"}
!827 = !{!"m_OptsToDisable"}
!828 = !{!"capabilities", !829}
!829 = !{!"globalVariableDecorationsINTEL", i1 false}
!830 = !{!"extensions", !831}
!831 = !{!"spvINTELBindlessImages", i1 false}
!832 = !{!"m_ShaderResourceViewMcsMask", !833, !834}
!833 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!834 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!835 = !{!"computedDepthMode", i32 0}
!836 = !{!"isHDCFastClearShader", i1 false}
!837 = !{!"argRegisterReservations", !838}
!838 = !{!"argRegisterReservationsVec[0]", i32 0}
!839 = !{!"SIMD16_SpillThreshold", i8 0}
!840 = !{!"SIMD32_SpillThreshold", i8 0}
!841 = !{!"m_CacheControlOption", !842, !843, !844, !845}
!842 = !{!"LscLoadCacheControlOverride", i8 0}
!843 = !{!"LscStoreCacheControlOverride", i8 0}
!844 = !{!"TgmLoadCacheControlOverride", i8 0}
!845 = !{!"TgmStoreCacheControlOverride", i8 0}
!846 = !{!"ModuleUsesBindless", i1 false}
!847 = !{!"predicationMap"}
!848 = !{!"lifeTimeStartMap"}
!849 = !{!"HitGroups"}
!850 = !{i32 2, i32 0}
!851 = !{!"clang version 17.0.6"}
!852 = !{i32 1, !"wchar_size", i32 4}
!853 = !{!854, !855}
!854 = !{i32 4469}
!855 = !{i32 4470}
!856 = !{!857}
!857 = !{i32 40, i32 196620}
!858 = distinct !{!858, !859}
!859 = !{!"llvm.loop.unroll.enable"}
!860 = distinct !{!860, !859}
!861 = distinct !{!861, !859}
!862 = distinct !{!862, !859}
!863 = distinct !{!863, !859}
!864 = distinct !{!864, !859}
!865 = distinct !{!865, !859}
!866 = distinct !{!866, !859}
!867 = !{!868, !868, i64 0}
!868 = !{!"float", !869, i64 0}
!869 = !{!"omnipotent char", !870, i64 0}
!870 = !{!"Simple C/C++ TBAA"}
!871 = !{!854}
!872 = !{!2}
!873 = !{!874}
!874 = !{i32 44, i32 8}
!875 = distinct !{!875, !859}
!876 = distinct !{!876, !859}
!877 = !{!878}
!878 = distinct !{!878, !879}
!879 = distinct !{!879}
!880 = distinct !{!880, !859}
!881 = distinct !{!881, !859}
!882 = !{!883, !885, !887, !889}
!883 = distinct !{!883, !884}
!884 = distinct !{!884}
!885 = distinct !{!885, !886}
!886 = distinct !{!886}
!887 = distinct !{!887, !888}
!888 = distinct !{!888}
!889 = distinct !{!889, !890}
!890 = distinct !{!890}
!891 = !{!892, !894, !896, !898}
!892 = distinct !{!892, !893}
!893 = distinct !{!893}
!894 = distinct !{!894, !895}
!895 = distinct !{!895}
!896 = distinct !{!896, !897}
!897 = distinct !{!897}
!898 = distinct !{!898, !899}
!899 = distinct !{!899}
!900 = distinct !{!900, !859}
!901 = distinct !{!901, !859}
!902 = distinct !{!902, !859}
!903 = distinct !{!903, !859}
!904 = !{!855}
!905 = !{!906, !908, !910, !912}
!906 = distinct !{!906, !907}
!907 = distinct !{!907}
!908 = distinct !{!908, !909}
!909 = distinct !{!909}
!910 = distinct !{!910, !911}
!911 = distinct !{!911}
!912 = distinct !{!912, !913}
!913 = distinct !{!913}
!914 = !{!915, !917, !919, !921}
!915 = distinct !{!915, !916}
!916 = distinct !{!916}
!917 = distinct !{!917, !918}
!918 = distinct !{!918}
!919 = distinct !{!919, !920}
!920 = distinct !{!920}
!921 = distinct !{!921, !922}
!922 = distinct !{!922}
!923 = distinct !{!923, !859}
!924 = distinct !{!924, !859}
!925 = distinct !{!925, !859}
!926 = distinct !{!926, !859}
!927 = distinct !{!927, !859}
!928 = distinct !{!928, !859}
!929 = !{!930}
!930 = distinct !{!930, !931}
!931 = distinct !{!931}
!932 = distinct !{!932, !859}
!933 = distinct !{!933, !859}
!934 = !{!935, !937, !939, !941}
!935 = distinct !{!935, !936}
!936 = distinct !{!936}
!937 = distinct !{!937, !938}
!938 = distinct !{!938}
!939 = distinct !{!939, !940}
!940 = distinct !{!940}
!941 = distinct !{!941, !942}
!942 = distinct !{!942}
!943 = !{!944, !946, !948, !950}
!944 = distinct !{!944, !945}
!945 = distinct !{!945}
!946 = distinct !{!946, !947}
!947 = distinct !{!947}
!948 = distinct !{!948, !949}
!949 = distinct !{!949}
!950 = distinct !{!950, !951}
!951 = distinct !{!951}
!952 = distinct !{!952, !859}
!953 = distinct !{!953, !859}
!954 = distinct !{!954, !859}
!955 = distinct !{!955, !859}
!956 = !{!957, !959, !961, !963}
!957 = distinct !{!957, !958}
!958 = distinct !{!958}
!959 = distinct !{!959, !960}
!960 = distinct !{!960}
!961 = distinct !{!961, !962}
!962 = distinct !{!962}
!963 = distinct !{!963, !964}
!964 = distinct !{!964}
!965 = !{!966, !968, !970, !972}
!966 = distinct !{!966, !967}
!967 = distinct !{!967}
!968 = distinct !{!968, !969}
!969 = distinct !{!969}
!970 = distinct !{!970, !971}
!971 = distinct !{!971}
!972 = distinct !{!972, !973}
!973 = distinct !{!973}
!974 = distinct !{!974, !859}
!975 = distinct !{!975, !859}
!976 = distinct !{!976, !859}
!977 = distinct !{!977, !859}
!978 = distinct !{!978, !859}
!979 = distinct !{!979, !859}
!980 = !{!981}
!981 = distinct !{!981, !982}
!982 = distinct !{!982}
!983 = distinct !{!983, !859}
!984 = distinct !{!984, !859}
!985 = !{!986, !988, !990, !992}
!986 = distinct !{!986, !987}
!987 = distinct !{!987}
!988 = distinct !{!988, !989}
!989 = distinct !{!989}
!990 = distinct !{!990, !991}
!991 = distinct !{!991}
!992 = distinct !{!992, !993}
!993 = distinct !{!993}
!994 = !{!995, !997, !999, !1001}
!995 = distinct !{!995, !996}
!996 = distinct !{!996}
!997 = distinct !{!997, !998}
!998 = distinct !{!998}
!999 = distinct !{!999, !1000}
!1000 = distinct !{!1000}
!1001 = distinct !{!1001, !1002}
!1002 = distinct !{!1002}
!1003 = distinct !{!1003, !859}
!1004 = distinct !{!1004, !859}
!1005 = distinct !{!1005, !859}
!1006 = distinct !{!1006, !859}
!1007 = !{!1008, !1010, !1012, !1014}
!1008 = distinct !{!1008, !1009}
!1009 = distinct !{!1009}
!1010 = distinct !{!1010, !1011}
!1011 = distinct !{!1011}
!1012 = distinct !{!1012, !1013}
!1013 = distinct !{!1013}
!1014 = distinct !{!1014, !1015}
!1015 = distinct !{!1015}
!1016 = !{!1017, !1019, !1021, !1023}
!1017 = distinct !{!1017, !1018}
!1018 = distinct !{!1018}
!1019 = distinct !{!1019, !1020}
!1020 = distinct !{!1020}
!1021 = distinct !{!1021, !1022}
!1022 = distinct !{!1022}
!1023 = distinct !{!1023, !1024}
!1024 = distinct !{!1024}
!1025 = distinct !{!1025, !859}
!1026 = distinct !{!1026, !859}
!1027 = distinct !{!1027, !859}
!1028 = distinct !{!1028, !859}
!1029 = distinct !{!1029, !859}
!1030 = !{!1031, !1033, !1035, !1037}
!1031 = distinct !{!1031, !1032}
!1032 = distinct !{!1032}
!1033 = distinct !{!1033, !1034}
!1034 = distinct !{!1034}
!1035 = distinct !{!1035, !1036}
!1036 = distinct !{!1036}
!1037 = distinct !{!1037, !1038}
!1038 = distinct !{!1038}
!1039 = !{!1040, !1042, !1044, !1046}
!1040 = distinct !{!1040, !1041}
!1041 = distinct !{!1041}
!1042 = distinct !{!1042, !1043}
!1043 = distinct !{!1043}
!1044 = distinct !{!1044, !1045}
!1045 = distinct !{!1045}
!1046 = distinct !{!1046, !1047}
!1047 = distinct !{!1047}
!1048 = distinct !{!1048, !859}
!1049 = distinct !{!1049, !859}
!1050 = distinct !{!1050, !859}
!1051 = distinct !{!1051, !859}
!1052 = !{!1053, !1055, !1057, !1059}
!1053 = distinct !{!1053, !1054}
!1054 = distinct !{!1054}
!1055 = distinct !{!1055, !1056}
!1056 = distinct !{!1056}
!1057 = distinct !{!1057, !1058}
!1058 = distinct !{!1058}
!1059 = distinct !{!1059, !1060}
!1060 = distinct !{!1060}
!1061 = !{!1062, !1064, !1066, !1068}
!1062 = distinct !{!1062, !1063}
!1063 = distinct !{!1063}
!1064 = distinct !{!1064, !1065}
!1065 = distinct !{!1065}
!1066 = distinct !{!1066, !1067}
!1067 = distinct !{!1067}
!1068 = distinct !{!1068, !1069}
!1069 = distinct !{!1069}
!1070 = distinct !{!1070, !859}
!1071 = distinct !{!1071, !859}
!1072 = distinct !{!1072, !859}
!1073 = distinct !{!1073, !859}
!1074 = distinct !{!1074, !859}
!1075 = !{!1076, !1078, !1080, !1082}
!1076 = distinct !{!1076, !1077}
!1077 = distinct !{!1077}
!1078 = distinct !{!1078, !1079}
!1079 = distinct !{!1079}
!1080 = distinct !{!1080, !1081}
!1081 = distinct !{!1081}
!1082 = distinct !{!1082, !1083}
!1083 = distinct !{!1083}
!1084 = !{!1085, !1087, !1089, !1091}
!1085 = distinct !{!1085, !1086}
!1086 = distinct !{!1086}
!1087 = distinct !{!1087, !1088}
!1088 = distinct !{!1088}
!1089 = distinct !{!1089, !1090}
!1090 = distinct !{!1090}
!1091 = distinct !{!1091, !1092}
!1092 = distinct !{!1092}
!1093 = distinct !{!1093, !859}
!1094 = distinct !{!1094, !859}
!1095 = distinct !{!1095, !859}
!1096 = distinct !{!1096, !859}
!1097 = !{!1098, !1100, !1102, !1104}
!1098 = distinct !{!1098, !1099}
!1099 = distinct !{!1099}
!1100 = distinct !{!1100, !1101}
!1101 = distinct !{!1101}
!1102 = distinct !{!1102, !1103}
!1103 = distinct !{!1103}
!1104 = distinct !{!1104, !1105}
!1105 = distinct !{!1105}
!1106 = !{!1107, !1109, !1111, !1113}
!1107 = distinct !{!1107, !1108}
!1108 = distinct !{!1108}
!1109 = distinct !{!1109, !1110}
!1110 = distinct !{!1110}
!1111 = distinct !{!1111, !1112}
!1112 = distinct !{!1112}
!1113 = distinct !{!1113, !1114}
!1114 = distinct !{!1114}
!1115 = distinct !{!1115, !859}
!1116 = distinct !{!1116, !859}
!1117 = distinct !{!1117, !859}
!1118 = distinct !{!1118, !859}
!1119 = distinct !{!1119, !859}
!1120 = !{!1121, !1123, !1125, !1127}
!1121 = distinct !{!1121, !1122}
!1122 = distinct !{!1122}
!1123 = distinct !{!1123, !1124}
!1124 = distinct !{!1124}
!1125 = distinct !{!1125, !1126}
!1126 = distinct !{!1126}
!1127 = distinct !{!1127, !1128}
!1128 = distinct !{!1128}
!1129 = !{!1130, !1132, !1134, !1136}
!1130 = distinct !{!1130, !1131}
!1131 = distinct !{!1131}
!1132 = distinct !{!1132, !1133}
!1133 = distinct !{!1133}
!1134 = distinct !{!1134, !1135}
!1135 = distinct !{!1135}
!1136 = distinct !{!1136, !1137}
!1137 = distinct !{!1137}
!1138 = distinct !{!1138, !859}
!1139 = distinct !{!1139, !859}
!1140 = distinct !{!1140, !859}
!1141 = distinct !{!1141, !859}
!1142 = !{!1143, !1145, !1147, !1149}
!1143 = distinct !{!1143, !1144}
!1144 = distinct !{!1144}
!1145 = distinct !{!1145, !1146}
!1146 = distinct !{!1146}
!1147 = distinct !{!1147, !1148}
!1148 = distinct !{!1148}
!1149 = distinct !{!1149, !1150}
!1150 = distinct !{!1150}
!1151 = !{!1152, !1154, !1156, !1158}
!1152 = distinct !{!1152, !1153}
!1153 = distinct !{!1153}
!1154 = distinct !{!1154, !1155}
!1155 = distinct !{!1155}
!1156 = distinct !{!1156, !1157}
!1157 = distinct !{!1157}
!1158 = distinct !{!1158, !1159}
!1159 = distinct !{!1159}
!1160 = distinct !{!1160, !859}
!1161 = distinct !{!1161, !859}
!1162 = distinct !{!1162, !859}
!1163 = distinct !{!1163, !859}
!1164 = distinct !{!1164, !859}
!1165 = !{!1166, !1168, !1170, !1172}
!1166 = distinct !{!1166, !1167}
!1167 = distinct !{!1167}
!1168 = distinct !{!1168, !1169}
!1169 = distinct !{!1169}
!1170 = distinct !{!1170, !1171}
!1171 = distinct !{!1171}
!1172 = distinct !{!1172, !1173}
!1173 = distinct !{!1173}
!1174 = !{!1175, !1177, !1179, !1181}
!1175 = distinct !{!1175, !1176}
!1176 = distinct !{!1176}
!1177 = distinct !{!1177, !1178}
!1178 = distinct !{!1178}
!1179 = distinct !{!1179, !1180}
!1180 = distinct !{!1180}
!1181 = distinct !{!1181, !1182}
!1182 = distinct !{!1182}
!1183 = distinct !{!1183, !859}
!1184 = distinct !{!1184, !859}
!1185 = distinct !{!1185, !859}
!1186 = distinct !{!1186, !859}
!1187 = !{!1188, !1190, !1192, !1194}
!1188 = distinct !{!1188, !1189}
!1189 = distinct !{!1189}
!1190 = distinct !{!1190, !1191}
!1191 = distinct !{!1191}
!1192 = distinct !{!1192, !1193}
!1193 = distinct !{!1193}
!1194 = distinct !{!1194, !1195}
!1195 = distinct !{!1195}
!1196 = !{!1197, !1199, !1201, !1203}
!1197 = distinct !{!1197, !1198}
!1198 = distinct !{!1198}
!1199 = distinct !{!1199, !1200}
!1200 = distinct !{!1200}
!1201 = distinct !{!1201, !1202}
!1202 = distinct !{!1202}
!1203 = distinct !{!1203, !1204}
!1204 = distinct !{!1204}
!1205 = distinct !{!1205, !859}
!1206 = distinct !{!1206, !859}
!1207 = distinct !{!1207, !859}
!1208 = distinct !{!1208, !859}
!1209 = distinct !{!1209, !859}
!1210 = !{!1211, !1213, !1215, !1217}
!1211 = distinct !{!1211, !1212}
!1212 = distinct !{!1212}
!1213 = distinct !{!1213, !1214}
!1214 = distinct !{!1214}
!1215 = distinct !{!1215, !1216}
!1216 = distinct !{!1216}
!1217 = distinct !{!1217, !1218}
!1218 = distinct !{!1218}
!1219 = !{!1220, !1222, !1224, !1226}
!1220 = distinct !{!1220, !1221}
!1221 = distinct !{!1221}
!1222 = distinct !{!1222, !1223}
!1223 = distinct !{!1223}
!1224 = distinct !{!1224, !1225}
!1225 = distinct !{!1225}
!1226 = distinct !{!1226, !1227}
!1227 = distinct !{!1227}
!1228 = distinct !{!1228, !859}
!1229 = distinct !{!1229, !859}
!1230 = distinct !{!1230, !859}
!1231 = distinct !{!1231, !859}
!1232 = !{!1233, !1235, !1237, !1239}
!1233 = distinct !{!1233, !1234}
!1234 = distinct !{!1234}
!1235 = distinct !{!1235, !1236}
!1236 = distinct !{!1236}
!1237 = distinct !{!1237, !1238}
!1238 = distinct !{!1238}
!1239 = distinct !{!1239, !1240}
!1240 = distinct !{!1240}
!1241 = !{!1242, !1244, !1246, !1248}
!1242 = distinct !{!1242, !1243}
!1243 = distinct !{!1243}
!1244 = distinct !{!1244, !1245}
!1245 = distinct !{!1245}
!1246 = distinct !{!1246, !1247}
!1247 = distinct !{!1247}
!1248 = distinct !{!1248, !1249}
!1249 = distinct !{!1249}
!1250 = distinct !{!1250, !859}
!1251 = distinct !{!1251, !859}
!1252 = distinct !{!1252, !859}
!1253 = distinct !{!1253, !859}
!1254 = distinct !{!1254, !859}
!1255 = !{!1256, !1258, !1260, !1262}
!1256 = distinct !{!1256, !1257}
!1257 = distinct !{!1257}
!1258 = distinct !{!1258, !1259}
!1259 = distinct !{!1259}
!1260 = distinct !{!1260, !1261}
!1261 = distinct !{!1261}
!1262 = distinct !{!1262, !1263}
!1263 = distinct !{!1263}
!1264 = !{!1265, !1267, !1269, !1271}
!1265 = distinct !{!1265, !1266}
!1266 = distinct !{!1266}
!1267 = distinct !{!1267, !1268}
!1268 = distinct !{!1268}
!1269 = distinct !{!1269, !1270}
!1270 = distinct !{!1270}
!1271 = distinct !{!1271, !1272}
!1272 = distinct !{!1272}
!1273 = distinct !{!1273, !859}
!1274 = distinct !{!1274, !859}
!1275 = distinct !{!1275, !859}
!1276 = distinct !{!1276, !859}
!1277 = !{!1278, !1280, !1282, !1284}
!1278 = distinct !{!1278, !1279}
!1279 = distinct !{!1279}
!1280 = distinct !{!1280, !1281}
!1281 = distinct !{!1281}
!1282 = distinct !{!1282, !1283}
!1283 = distinct !{!1283}
!1284 = distinct !{!1284, !1285}
!1285 = distinct !{!1285}
!1286 = !{!1287, !1289, !1291, !1293}
!1287 = distinct !{!1287, !1288}
!1288 = distinct !{!1288}
!1289 = distinct !{!1289, !1290}
!1290 = distinct !{!1290}
!1291 = distinct !{!1291, !1292}
!1292 = distinct !{!1292}
!1293 = distinct !{!1293, !1294}
!1294 = distinct !{!1294}
!1295 = distinct !{!1295, !859}
!1296 = distinct !{!1296, !859}
!1297 = distinct !{!1297, !859}
!1298 = distinct !{!1298, !859}
!1299 = distinct !{!1299, !859}
!1300 = !{!1301, !1303, !1305, !1307}
!1301 = distinct !{!1301, !1302}
!1302 = distinct !{!1302}
!1303 = distinct !{!1303, !1304}
!1304 = distinct !{!1304}
!1305 = distinct !{!1305, !1306}
!1306 = distinct !{!1306}
!1307 = distinct !{!1307, !1308}
!1308 = distinct !{!1308}
!1309 = !{!1310, !1312, !1314, !1316}
!1310 = distinct !{!1310, !1311}
!1311 = distinct !{!1311}
!1312 = distinct !{!1312, !1313}
!1313 = distinct !{!1313}
!1314 = distinct !{!1314, !1315}
!1315 = distinct !{!1315}
!1316 = distinct !{!1316, !1317}
!1317 = distinct !{!1317}
!1318 = distinct !{!1318, !859}
!1319 = distinct !{!1319, !859}
!1320 = distinct !{!1320, !859}
!1321 = distinct !{!1321, !859}
!1322 = distinct !{!1322, !859}
!1323 = !{!1324}
!1324 = distinct !{!1324, !1325}
!1325 = distinct !{!1325}
!1326 = distinct !{!1326, !859}
!1327 = distinct !{!1327, !859}
!1328 = !{!1329, !1331, !1333, !1335}
!1329 = distinct !{!1329, !1330}
!1330 = distinct !{!1330}
!1331 = distinct !{!1331, !1332}
!1332 = distinct !{!1332}
!1333 = distinct !{!1333, !1334}
!1334 = distinct !{!1334}
!1335 = distinct !{!1335, !1336}
!1336 = distinct !{!1336}
!1337 = !{!1338, !1340, !1342, !1344}
!1338 = distinct !{!1338, !1339}
!1339 = distinct !{!1339}
!1340 = distinct !{!1340, !1341}
!1341 = distinct !{!1341}
!1342 = distinct !{!1342, !1343}
!1343 = distinct !{!1343}
!1344 = distinct !{!1344, !1345}
!1345 = distinct !{!1345}
!1346 = distinct !{!1346, !859}
!1347 = distinct !{!1347, !859}
!1348 = distinct !{!1348, !859}
!1349 = distinct !{!1349, !859}
!1350 = !{!1351, !1353, !1355, !1357}
!1351 = distinct !{!1351, !1352}
!1352 = distinct !{!1352}
!1353 = distinct !{!1353, !1354}
!1354 = distinct !{!1354}
!1355 = distinct !{!1355, !1356}
!1356 = distinct !{!1356}
!1357 = distinct !{!1357, !1358}
!1358 = distinct !{!1358}
!1359 = !{!1360, !1362, !1364, !1366}
!1360 = distinct !{!1360, !1361}
!1361 = distinct !{!1361}
!1362 = distinct !{!1362, !1363}
!1363 = distinct !{!1363}
!1364 = distinct !{!1364, !1365}
!1365 = distinct !{!1365}
!1366 = distinct !{!1366, !1367}
!1367 = distinct !{!1367}
!1368 = distinct !{!1368, !859}
!1369 = distinct !{!1369, !859}
!1370 = distinct !{!1370, !859}
!1371 = distinct !{!1371, !859}
!1372 = distinct !{!1372, !859}
!1373 = distinct !{!1373, !859}
!1374 = !{!1375}
!1375 = distinct !{!1375, !1376}
!1376 = distinct !{!1376}
!1377 = distinct !{!1377, !859}
!1378 = distinct !{!1378, !859}
!1379 = !{!1380, !1382, !1384, !1386}
!1380 = distinct !{!1380, !1381}
!1381 = distinct !{!1381}
!1382 = distinct !{!1382, !1383}
!1383 = distinct !{!1383}
!1384 = distinct !{!1384, !1385}
!1385 = distinct !{!1385}
!1386 = distinct !{!1386, !1387}
!1387 = distinct !{!1387}
!1388 = !{!1389, !1391, !1393, !1395}
!1389 = distinct !{!1389, !1390}
!1390 = distinct !{!1390}
!1391 = distinct !{!1391, !1392}
!1392 = distinct !{!1392}
!1393 = distinct !{!1393, !1394}
!1394 = distinct !{!1394}
!1395 = distinct !{!1395, !1396}
!1396 = distinct !{!1396}
!1397 = distinct !{!1397, !859}
!1398 = distinct !{!1398, !859}
!1399 = distinct !{!1399, !859}
!1400 = distinct !{!1400, !859}
!1401 = !{!1402, !1404, !1406, !1408}
!1402 = distinct !{!1402, !1403}
!1403 = distinct !{!1403}
!1404 = distinct !{!1404, !1405}
!1405 = distinct !{!1405}
!1406 = distinct !{!1406, !1407}
!1407 = distinct !{!1407}
!1408 = distinct !{!1408, !1409}
!1409 = distinct !{!1409}
!1410 = !{!1411, !1413, !1415, !1417}
!1411 = distinct !{!1411, !1412}
!1412 = distinct !{!1412}
!1413 = distinct !{!1413, !1414}
!1414 = distinct !{!1414}
!1415 = distinct !{!1415, !1416}
!1416 = distinct !{!1416}
!1417 = distinct !{!1417, !1418}
!1418 = distinct !{!1418}
!1419 = distinct !{!1419, !859}
!1420 = distinct !{!1420, !859}
!1421 = distinct !{!1421, !859}
!1422 = distinct !{!1422, !859}
!1423 = distinct !{!1423, !859}
!1424 = distinct !{!1424, !859}
!1425 = !{!1426}
!1426 = distinct !{!1426, !1427}
!1427 = distinct !{!1427}
!1428 = distinct !{!1428, !859}
!1429 = distinct !{!1429, !859}
!1430 = !{!1431, !1433, !1435, !1437}
!1431 = distinct !{!1431, !1432}
!1432 = distinct !{!1432}
!1433 = distinct !{!1433, !1434}
!1434 = distinct !{!1434}
!1435 = distinct !{!1435, !1436}
!1436 = distinct !{!1436}
!1437 = distinct !{!1437, !1438}
!1438 = distinct !{!1438}
!1439 = !{!1440, !1442, !1444, !1446}
!1440 = distinct !{!1440, !1441}
!1441 = distinct !{!1441}
!1442 = distinct !{!1442, !1443}
!1443 = distinct !{!1443}
!1444 = distinct !{!1444, !1445}
!1445 = distinct !{!1445}
!1446 = distinct !{!1446, !1447}
!1447 = distinct !{!1447}
!1448 = distinct !{!1448, !859}
!1449 = distinct !{!1449, !859}
!1450 = distinct !{!1450, !859}
!1451 = distinct !{!1451, !859}
!1452 = !{!1453, !1455, !1457, !1459}
!1453 = distinct !{!1453, !1454}
!1454 = distinct !{!1454}
!1455 = distinct !{!1455, !1456}
!1456 = distinct !{!1456}
!1457 = distinct !{!1457, !1458}
!1458 = distinct !{!1458}
!1459 = distinct !{!1459, !1460}
!1460 = distinct !{!1460}
!1461 = !{!1462, !1464, !1466, !1468}
!1462 = distinct !{!1462, !1463}
!1463 = distinct !{!1463}
!1464 = distinct !{!1464, !1465}
!1465 = distinct !{!1465}
!1466 = distinct !{!1466, !1467}
!1467 = distinct !{!1467}
!1468 = distinct !{!1468, !1469}
!1469 = distinct !{!1469}
!1470 = distinct !{!1470, !859}
!1471 = distinct !{!1471, !859}
!1472 = distinct !{!1472, !859}
!1473 = distinct !{!1473, !859}
!1474 = distinct !{!1474, !859}
!1475 = !{!1476, !1478, !1480, !1482}
!1476 = distinct !{!1476, !1477}
!1477 = distinct !{!1477}
!1478 = distinct !{!1478, !1479}
!1479 = distinct !{!1479}
!1480 = distinct !{!1480, !1481}
!1481 = distinct !{!1481}
!1482 = distinct !{!1482, !1483}
!1483 = distinct !{!1483}
!1484 = !{!1485, !1487, !1489, !1491}
!1485 = distinct !{!1485, !1486}
!1486 = distinct !{!1486}
!1487 = distinct !{!1487, !1488}
!1488 = distinct !{!1488}
!1489 = distinct !{!1489, !1490}
!1490 = distinct !{!1490}
!1491 = distinct !{!1491, !1492}
!1492 = distinct !{!1492}
!1493 = distinct !{!1493, !859}
!1494 = distinct !{!1494, !859}
!1495 = distinct !{!1495, !859}
!1496 = distinct !{!1496, !859}
!1497 = !{!1498, !1500, !1502, !1504}
!1498 = distinct !{!1498, !1499}
!1499 = distinct !{!1499}
!1500 = distinct !{!1500, !1501}
!1501 = distinct !{!1501}
!1502 = distinct !{!1502, !1503}
!1503 = distinct !{!1503}
!1504 = distinct !{!1504, !1505}
!1505 = distinct !{!1505}
!1506 = !{!1507, !1509, !1511, !1513}
!1507 = distinct !{!1507, !1508}
!1508 = distinct !{!1508}
!1509 = distinct !{!1509, !1510}
!1510 = distinct !{!1510}
!1511 = distinct !{!1511, !1512}
!1512 = distinct !{!1512}
!1513 = distinct !{!1513, !1514}
!1514 = distinct !{!1514}
!1515 = distinct !{!1515, !859}
!1516 = distinct !{!1516, !859}
!1517 = distinct !{!1517, !859}
!1518 = distinct !{!1518, !859}
!1519 = distinct !{!1519, !859}
!1520 = !{!1521, !1523, !1525, !1527}
!1521 = distinct !{!1521, !1522}
!1522 = distinct !{!1522}
!1523 = distinct !{!1523, !1524}
!1524 = distinct !{!1524}
!1525 = distinct !{!1525, !1526}
!1526 = distinct !{!1526}
!1527 = distinct !{!1527, !1528}
!1528 = distinct !{!1528}
!1529 = !{!1530, !1532, !1534, !1536}
!1530 = distinct !{!1530, !1531}
!1531 = distinct !{!1531}
!1532 = distinct !{!1532, !1533}
!1533 = distinct !{!1533}
!1534 = distinct !{!1534, !1535}
!1535 = distinct !{!1535}
!1536 = distinct !{!1536, !1537}
!1537 = distinct !{!1537}
!1538 = distinct !{!1538, !859}
!1539 = distinct !{!1539, !859}
!1540 = distinct !{!1540, !859}
!1541 = distinct !{!1541, !859}
!1542 = !{!1543, !1545, !1547, !1549}
!1543 = distinct !{!1543, !1544}
!1544 = distinct !{!1544}
!1545 = distinct !{!1545, !1546}
!1546 = distinct !{!1546}
!1547 = distinct !{!1547, !1548}
!1548 = distinct !{!1548}
!1549 = distinct !{!1549, !1550}
!1550 = distinct !{!1550}
!1551 = !{!1552, !1554, !1556, !1558}
!1552 = distinct !{!1552, !1553}
!1553 = distinct !{!1553}
!1554 = distinct !{!1554, !1555}
!1555 = distinct !{!1555}
!1556 = distinct !{!1556, !1557}
!1557 = distinct !{!1557}
!1558 = distinct !{!1558, !1559}
!1559 = distinct !{!1559}
!1560 = distinct !{!1560, !859}
!1561 = distinct !{!1561, !859}
!1562 = distinct !{!1562, !859}
!1563 = distinct !{!1563, !859}
!1564 = distinct !{!1564, !859}
!1565 = !{!1566, !1568, !1570, !1572}
!1566 = distinct !{!1566, !1567}
!1567 = distinct !{!1567}
!1568 = distinct !{!1568, !1569}
!1569 = distinct !{!1569}
!1570 = distinct !{!1570, !1571}
!1571 = distinct !{!1571}
!1572 = distinct !{!1572, !1573}
!1573 = distinct !{!1573}
!1574 = !{!1575, !1577, !1579, !1581}
!1575 = distinct !{!1575, !1576}
!1576 = distinct !{!1576}
!1577 = distinct !{!1577, !1578}
!1578 = distinct !{!1578}
!1579 = distinct !{!1579, !1580}
!1580 = distinct !{!1580}
!1581 = distinct !{!1581, !1582}
!1582 = distinct !{!1582}
!1583 = distinct !{!1583, !859}
!1584 = distinct !{!1584, !859}
!1585 = distinct !{!1585, !859}
!1586 = distinct !{!1586, !859}
!1587 = !{!1588, !1590, !1592, !1594}
!1588 = distinct !{!1588, !1589}
!1589 = distinct !{!1589}
!1590 = distinct !{!1590, !1591}
!1591 = distinct !{!1591}
!1592 = distinct !{!1592, !1593}
!1593 = distinct !{!1593}
!1594 = distinct !{!1594, !1595}
!1595 = distinct !{!1595}
!1596 = !{!1597, !1599, !1601, !1603}
!1597 = distinct !{!1597, !1598}
!1598 = distinct !{!1598}
!1599 = distinct !{!1599, !1600}
!1600 = distinct !{!1600}
!1601 = distinct !{!1601, !1602}
!1602 = distinct !{!1602}
!1603 = distinct !{!1603, !1604}
!1604 = distinct !{!1604}
!1605 = distinct !{!1605, !859}
!1606 = distinct !{!1606, !859}
!1607 = distinct !{!1607, !859}
!1608 = distinct !{!1608, !859}
!1609 = distinct !{!1609, !859}
!1610 = !{!1611, !1613, !1615, !1617}
!1611 = distinct !{!1611, !1612}
!1612 = distinct !{!1612}
!1613 = distinct !{!1613, !1614}
!1614 = distinct !{!1614}
!1615 = distinct !{!1615, !1616}
!1616 = distinct !{!1616}
!1617 = distinct !{!1617, !1618}
!1618 = distinct !{!1618}
!1619 = !{!1620, !1622, !1624, !1626}
!1620 = distinct !{!1620, !1621}
!1621 = distinct !{!1621}
!1622 = distinct !{!1622, !1623}
!1623 = distinct !{!1623}
!1624 = distinct !{!1624, !1625}
!1625 = distinct !{!1625}
!1626 = distinct !{!1626, !1627}
!1627 = distinct !{!1627}
!1628 = distinct !{!1628, !859}
!1629 = distinct !{!1629, !859}
!1630 = distinct !{!1630, !859}
!1631 = distinct !{!1631, !859}
!1632 = !{!1633, !1635, !1637, !1639}
!1633 = distinct !{!1633, !1634}
!1634 = distinct !{!1634}
!1635 = distinct !{!1635, !1636}
!1636 = distinct !{!1636}
!1637 = distinct !{!1637, !1638}
!1638 = distinct !{!1638}
!1639 = distinct !{!1639, !1640}
!1640 = distinct !{!1640}
!1641 = !{!1642, !1644, !1646, !1648}
!1642 = distinct !{!1642, !1643}
!1643 = distinct !{!1643}
!1644 = distinct !{!1644, !1645}
!1645 = distinct !{!1645}
!1646 = distinct !{!1646, !1647}
!1647 = distinct !{!1647}
!1648 = distinct !{!1648, !1649}
!1649 = distinct !{!1649}
!1650 = distinct !{!1650, !859}
!1651 = distinct !{!1651, !859}
!1652 = distinct !{!1652, !859}
!1653 = distinct !{!1653, !859}
!1654 = distinct !{!1654, !859}
!1655 = !{!1656, !1658, !1660, !1662}
!1656 = distinct !{!1656, !1657}
!1657 = distinct !{!1657}
!1658 = distinct !{!1658, !1659}
!1659 = distinct !{!1659}
!1660 = distinct !{!1660, !1661}
!1661 = distinct !{!1661}
!1662 = distinct !{!1662, !1663}
!1663 = distinct !{!1663}
!1664 = !{!1665, !1667, !1669, !1671}
!1665 = distinct !{!1665, !1666}
!1666 = distinct !{!1666}
!1667 = distinct !{!1667, !1668}
!1668 = distinct !{!1668}
!1669 = distinct !{!1669, !1670}
!1670 = distinct !{!1670}
!1671 = distinct !{!1671, !1672}
!1672 = distinct !{!1672}
!1673 = distinct !{!1673, !859}
!1674 = distinct !{!1674, !859}
!1675 = distinct !{!1675, !859}
!1676 = distinct !{!1676, !859}
!1677 = !{!1678, !1680, !1682, !1684}
!1678 = distinct !{!1678, !1679}
!1679 = distinct !{!1679}
!1680 = distinct !{!1680, !1681}
!1681 = distinct !{!1681}
!1682 = distinct !{!1682, !1683}
!1683 = distinct !{!1683}
!1684 = distinct !{!1684, !1685}
!1685 = distinct !{!1685}
!1686 = !{!1687, !1689, !1691, !1693}
!1687 = distinct !{!1687, !1688}
!1688 = distinct !{!1688}
!1689 = distinct !{!1689, !1690}
!1690 = distinct !{!1690}
!1691 = distinct !{!1691, !1692}
!1692 = distinct !{!1692}
!1693 = distinct !{!1693, !1694}
!1694 = distinct !{!1694}
!1695 = distinct !{!1695, !859}
!1696 = distinct !{!1696, !859}
!1697 = distinct !{!1697, !859}
!1698 = distinct !{!1698, !859}
!1699 = distinct !{!1699, !859}
!1700 = !{!1701, !1703, !1705, !1707}
!1701 = distinct !{!1701, !1702}
!1702 = distinct !{!1702}
!1703 = distinct !{!1703, !1704}
!1704 = distinct !{!1704}
!1705 = distinct !{!1705, !1706}
!1706 = distinct !{!1706}
!1707 = distinct !{!1707, !1708}
!1708 = distinct !{!1708}
!1709 = !{!1710, !1712, !1714, !1716}
!1710 = distinct !{!1710, !1711}
!1711 = distinct !{!1711}
!1712 = distinct !{!1712, !1713}
!1713 = distinct !{!1713}
!1714 = distinct !{!1714, !1715}
!1715 = distinct !{!1715}
!1716 = distinct !{!1716, !1717}
!1717 = distinct !{!1717}
!1718 = distinct !{!1718, !859}
!1719 = distinct !{!1719, !859}
!1720 = distinct !{!1720, !859}
!1721 = distinct !{!1721, !859}
!1722 = !{!1723, !1725, !1727, !1729}
!1723 = distinct !{!1723, !1724}
!1724 = distinct !{!1724}
!1725 = distinct !{!1725, !1726}
!1726 = distinct !{!1726}
!1727 = distinct !{!1727, !1728}
!1728 = distinct !{!1728}
!1729 = distinct !{!1729, !1730}
!1730 = distinct !{!1730}
!1731 = !{!1732, !1734, !1736, !1738}
!1732 = distinct !{!1732, !1733}
!1733 = distinct !{!1733}
!1734 = distinct !{!1734, !1735}
!1735 = distinct !{!1735}
!1736 = distinct !{!1736, !1737}
!1737 = distinct !{!1737}
!1738 = distinct !{!1738, !1739}
!1739 = distinct !{!1739}
!1740 = distinct !{!1740, !859}
!1741 = distinct !{!1741, !859}
!1742 = distinct !{!1742, !859}
!1743 = distinct !{!1743, !859}
!1744 = distinct !{!1744, !859}
!1745 = !{!1746, !1748, !1750, !1752}
!1746 = distinct !{!1746, !1747}
!1747 = distinct !{!1747}
!1748 = distinct !{!1748, !1749}
!1749 = distinct !{!1749}
!1750 = distinct !{!1750, !1751}
!1751 = distinct !{!1751}
!1752 = distinct !{!1752, !1753}
!1753 = distinct !{!1753}
!1754 = !{!1755, !1757, !1759, !1761}
!1755 = distinct !{!1755, !1756}
!1756 = distinct !{!1756}
!1757 = distinct !{!1757, !1758}
!1758 = distinct !{!1758}
!1759 = distinct !{!1759, !1760}
!1760 = distinct !{!1760}
!1761 = distinct !{!1761, !1762}
!1762 = distinct !{!1762}
!1763 = distinct !{!1763, !859}
!1764 = distinct !{!1764, !859}
!1765 = distinct !{!1765, !859}
!1766 = distinct !{!1766, !859}
!1767 = distinct !{!1767, !859}
!1768 = distinct !{!1768, !859}
!1769 = distinct !{!1769, !859}
!1770 = distinct !{!1770, !859}
!1771 = distinct !{!1771, !859}
