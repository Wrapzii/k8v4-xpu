; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_1_beforeUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::detail::half_impl::half" = type { half }

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

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #0

; Function Attrs: convergent nounwind
declare spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float, i32) #1

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_fmaxff(float, float) #2

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_fabsf(float) #2

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_rintf(float) #2

; Function Attrs: nounwind
declare spir_func float @_Z18__spirv_ocl_fclampfff(float, float, float) #3

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_fminff(float, float) #2

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z17__spirv_ocl_floorf(float) #2

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi2EEE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2) #3 !kernel_arg_addr_space !293 !kernel_arg_access_qual !294 !kernel_arg_type !295 !kernel_arg_type_qual !296 !kernel_arg_base_type !295 !kernel_arg_name !296 !spirv.ParameterDecorations !297 !intel_reqd_sub_group_size !304 {
  %4 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %5 = icmp ult i64 %4, 2147483648
  call void @llvm.assume(i1 %5)
  %6 = trunc i64 %4 to i32
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %8 = icmp ult i64 %7, 2147483648
  call void @llvm.assume(i1 %8)
  %9 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %10 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %10)
  %11 = lshr i64 %4, 1
  %12 = and i32 %6, 1
  %13 = shl nuw nsw i64 %7, 8, !spirv.Decorations !305
  %14 = shl nuw nsw i64 %7, 14, !spirv.Decorations !305
  %15 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %14
  %16 = shl nuw nsw i64 %11, 8, !spirv.Decorations !305
  %17 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %15, i64 %16
  %18 = shl nuw nsw i32 %12, 7, !spirv.Decorations !305
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %17, i64 %19
  br label %21

21:                                               ; preds = %30, %3
  %22 = phi i32 [ 0, %3 ], [ %38, %30 ]
  %23 = phi float [ 0.000000e+00, %3 ], [ %37, %30 ]
  %24 = icmp ult i32 %22, 128
  br i1 %24, label %30, label %25

25:                                               ; preds = %21
  %26 = xor i32 %9, 1
  %27 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %23, i32 %26) #1
  %28 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %23, float %27) #3, !spirv.Decorations !308
  %29 = fcmp reassoc nsz arcp contract oeq float %28, 0.000000e+00, !spirv.Decorations !308
  br i1 %29, label %41, label %39

30:                                               ; preds = %21
  %31 = zext i32 %22 to i64
  %32 = bitcast ptr addrspace(1) %20 to ptr addrspace(1)
  %33 = getelementptr inbounds half, ptr addrspace(1) %32, i64 %31
  %34 = load half, ptr addrspace(1) %33, align 2
  %35 = fpext half %34 to float
  %36 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %35) #3, !spirv.Decorations !308
  %37 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %23, float %36) #3, !spirv.Decorations !308
  %38 = add nuw nsw i32 %22, 1, !spirv.Decorations !305
  br label %21, !llvm.loop !310

39:                                               ; preds = %25
  %40 = fdiv reassoc nsz arcp contract float %28, 1.270000e+02, !spirv.Decorations !308
  br label %41

41:                                               ; preds = %39, %25
  %42 = phi float [ %40, %39 ], [ 0.000000e+00, %25 ]
  %43 = icmp eq i32 %12, 0
  br i1 %43, label %44, label %48

44:                                               ; preds = %41
  %45 = getelementptr i8, ptr addrspace(1) %1, i64 %13
  %46 = bitcast ptr addrspace(1) %45 to ptr addrspace(1)
  %47 = getelementptr float, ptr addrspace(1) %46, i64 %11
  store float %42, ptr addrspace(1) %47, align 4
  br label %48

48:                                               ; preds = %44, %41
  %49 = fcmp reassoc nsz arcp contract oeq float %42, 0.000000e+00, !spirv.Decorations !308
  br i1 %49, label %52, label %50

50:                                               ; preds = %48
  %51 = fdiv reassoc nsz arcp contract float 1.000000e+00, %42, !spirv.Decorations !308
  br label %52

52:                                               ; preds = %50, %48
  %53 = phi float [ %51, %50 ], [ 0.000000e+00, %48 ]
  %54 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %14
  %55 = getelementptr inbounds i8, ptr addrspace(1) %54, i64 %16
  %56 = getelementptr inbounds i8, ptr addrspace(1) %55, i64 %19
  br label %57

57:                                               ; preds = %60, %52
  %58 = phi i32 [ 0, %52 ], [ %71, %60 ]
  %59 = icmp ult i32 %58, 128
  br i1 %59, label %60, label %72

60:                                               ; preds = %57
  %61 = zext i32 %58 to i64
  %62 = bitcast ptr addrspace(1) %20 to ptr addrspace(1)
  %63 = getelementptr inbounds half, ptr addrspace(1) %62, i64 %61
  %64 = load half, ptr addrspace(1) %63, align 2
  %65 = fpext half %64 to float
  %66 = fmul reassoc nsz arcp contract float %53, %65, !spirv.Decorations !308
  %67 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %66) #3, !spirv.Decorations !308
  %68 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %67, float -1.270000e+02, float 1.270000e+02) #3, !spirv.Decorations !308
  %69 = fptosi float %68 to i8
  %70 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 %61
  store i8 %69, ptr addrspace(1) %70, align 1
  %71 = add nuw nsw i32 %58, 1, !spirv.Decorations !305
  br label %57, !llvm.loop !312

72:                                               ; preds = %57
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi4EEE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2) #3 !kernel_arg_addr_space !293 !kernel_arg_access_qual !294 !kernel_arg_type !295 !kernel_arg_type_qual !296 !kernel_arg_base_type !295 !kernel_arg_name !296 !spirv.ParameterDecorations !297 !intel_reqd_sub_group_size !304 {
  %4 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %5 = icmp ult i64 %4, 2147483648
  call void @llvm.assume(i1 %5)
  %6 = trunc i64 %4 to i32
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %8 = icmp ult i64 %7, 2147483648
  call void @llvm.assume(i1 %8)
  %9 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %10 = icmp sgt i32 %9, -1
  call void @llvm.assume(i1 %10)
  %11 = lshr i64 %4, 1
  %12 = and i32 %6, 1
  %13 = shl nuw nsw i64 %7, 8, !spirv.Decorations !305
  %14 = shl nuw nsw i64 %7, 14, !spirv.Decorations !305
  %15 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %14
  %16 = shl nuw nsw i64 %11, 8, !spirv.Decorations !305
  %17 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %15, i64 %16
  %18 = shl nuw nsw i32 %12, 7, !spirv.Decorations !305
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %17, i64 %19
  br label %21

21:                                               ; preds = %30, %3
  %22 = phi i32 [ 0, %3 ], [ %38, %30 ]
  %23 = phi float [ 0.000000e+00, %3 ], [ %37, %30 ]
  %24 = icmp ult i32 %22, 128
  br i1 %24, label %30, label %25

25:                                               ; preds = %21
  %26 = xor i32 %9, 1
  %27 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %23, i32 %26) #1
  %28 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %23, float %27) #3, !spirv.Decorations !308
  %29 = fcmp reassoc nsz arcp contract oeq float %28, 0.000000e+00, !spirv.Decorations !308
  br i1 %29, label %41, label %39

30:                                               ; preds = %21
  %31 = zext i32 %22 to i64
  %32 = bitcast ptr addrspace(1) %20 to ptr addrspace(1)
  %33 = getelementptr inbounds half, ptr addrspace(1) %32, i64 %31
  %34 = load half, ptr addrspace(1) %33, align 2
  %35 = fpext half %34 to float
  %36 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %35) #3, !spirv.Decorations !308
  %37 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %23, float %36) #3, !spirv.Decorations !308
  %38 = add nuw nsw i32 %22, 1, !spirv.Decorations !305
  br label %21, !llvm.loop !313

39:                                               ; preds = %25
  %40 = fdiv reassoc nsz arcp contract float %28, 1.270000e+02, !spirv.Decorations !308
  br label %41

41:                                               ; preds = %39, %25
  %42 = phi float [ %40, %39 ], [ 0.000000e+00, %25 ]
  %43 = icmp eq i32 %12, 0
  br i1 %43, label %44, label %48

44:                                               ; preds = %41
  %45 = getelementptr i8, ptr addrspace(1) %1, i64 %13
  %46 = bitcast ptr addrspace(1) %45 to ptr addrspace(1)
  %47 = getelementptr float, ptr addrspace(1) %46, i64 %11
  store float %42, ptr addrspace(1) %47, align 4
  br label %48

48:                                               ; preds = %44, %41
  %49 = fcmp reassoc nsz arcp contract oeq float %42, 0.000000e+00, !spirv.Decorations !308
  br i1 %49, label %52, label %50

50:                                               ; preds = %48
  %51 = fdiv reassoc nsz arcp contract float 1.000000e+00, %42, !spirv.Decorations !308
  br label %52

52:                                               ; preds = %50, %48
  %53 = phi float [ %51, %50 ], [ 0.000000e+00, %48 ]
  %54 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %14
  %55 = getelementptr inbounds i8, ptr addrspace(1) %54, i64 %16
  %56 = getelementptr inbounds i8, ptr addrspace(1) %55, i64 %19
  br label %57

57:                                               ; preds = %60, %52
  %58 = phi i32 [ 0, %52 ], [ %71, %60 ]
  %59 = icmp ult i32 %58, 128
  br i1 %59, label %60, label %72

60:                                               ; preds = %57
  %61 = zext i32 %58 to i64
  %62 = bitcast ptr addrspace(1) %20 to ptr addrspace(1)
  %63 = getelementptr inbounds half, ptr addrspace(1) %62, i64 %61
  %64 = load half, ptr addrspace(1) %63, align 2
  %65 = fpext half %64 to float
  %66 = fmul reassoc nsz arcp contract float %53, %65, !spirv.Decorations !308
  %67 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %66) #3, !spirv.Decorations !308
  %68 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %67, float -1.270000e+02, float 1.270000e+02) #3, !spirv.Decorations !308
  %69 = fptosi float %68 to i8
  %70 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 %61
  store i8 %69, ptr addrspace(1) %70, align 1
  %71 = add nuw nsw i32 %58, 1, !spirv.Decorations !305
  br label %57, !llvm.loop !314

72:                                               ; preds = %57
  ret void
}

; Function Attrs: convergent nounwind
declare spir_func float @_Z17__spirv_GroupFMaxiif(i32, i32, float) #1

; Function Attrs: convergent nounwind
declare spir_func void @_Z22__spirv_ControlBarrieriii(i32, i32, i32) #1

; Function Attrs: convergent nounwind
declare spir_func float @_Z17__spirv_GroupFMiniif(i32, i32, float) #1

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_minll(i64, i64) #3

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_maxll(i64, i64) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p2.i64(ptr noalias nocapture writeonly, ptr addrspace(2) noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4), i32) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nounwind
declare spir_func <4 x float> @_Z28__spirv_FConvert_Rfloat4_rteDv4_Dh(<4 x half>) #3

; Function Attrs: nounwind
declare spir_func float @_Z23__spirv_ocl_fmax_commonff(float, float) #3

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z15__spirv_ocl_expf(float) #2

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 2 %3) #3 !kernel_arg_addr_space !315 !kernel_arg_access_qual !316 !kernel_arg_type !317 !kernel_arg_type_qual !318 !kernel_arg_base_type !317 !kernel_arg_name !318 !spirv.ParameterDecorations !319 !intel_reqd_sub_group_size !304 {
  %5 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %6 = icmp ult i64 %5, 2147483648
  call void @llvm.assume(i1 %6)
  %7 = trunc i64 %5 to i32
  %8 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %9 = icmp ult i64 %8, 2147483648
  call void @llvm.assume(i1 %9)
  %10 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %11 = icmp sgt i32 %10, -1
  call void @llvm.assume(i1 %11)
  %12 = lshr i32 %7, 1
  %13 = and i32 %7, 1
  %14 = shl nuw nsw i64 %8, 6, !spirv.Decorations !305
  %15 = shl nuw nsw i64 %8, 14, !spirv.Decorations !305
  %16 = mul nsw i32 %0, 6, !spirv.Decorations !320
  %17 = icmp slt i32 %12, %16
  br i1 %17, label %41, label %18

18:                                               ; preds = %4
  %19 = icmp eq i32 %13, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %18
  %21 = zext i32 %12 to i64
  br label %26

22:                                               ; preds = %18
  %23 = zext i32 %12 to i64
  %24 = getelementptr float, ptr addrspace(1) %1, i64 %14
  %25 = getelementptr float, ptr addrspace(1) %24, i64 %23
  store float 0.000000e+00, ptr addrspace(1) %25, align 4
  br label %26

26:                                               ; preds = %22, %20
  %27 = phi i64 [ %21, %20 ], [ %23, %22 ]
  %28 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %15
  %29 = shl nuw nsw i64 %27, 8, !spirv.Decorations !305
  %30 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %29
  %31 = shl nuw nsw i32 %13, 7, !spirv.Decorations !305
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %32
  br label %34

34:                                               ; preds = %37, %26
  %35 = phi i32 [ 0, %26 ], [ %40, %37 ]
  %36 = icmp ult i32 %35, 128
  br i1 %36, label %37, label %.loopexit1

37:                                               ; preds = %34
  %38 = zext i32 %35 to i64
  %39 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 %38
  store i8 0, ptr addrspace(1) %39, align 1
  %40 = add nuw nsw i32 %35, 1, !spirv.Decorations !305
  br label %34, !llvm.loop !321

41:                                               ; preds = %4
  %42 = trunc i64 %8 to i32
  %43 = udiv i32 %7, 12
  %44 = mul nsw i32 %43, -6, !spirv.Decorations !320
  %45 = add nsw i32 %44, %12, !spirv.Decorations !320
  %46 = mul nuw nsw i32 %42, 6, !spirv.Decorations !305
  %47 = add nsw i32 %46, %45, !spirv.Decorations !320
  %48 = mul nuw nsw i32 %43, 12, !spirv.Decorations !305
  %49 = zext i32 %48 to i64
  %50 = sext i32 %47 to i64
  %51 = add nsw i64 %49, %50, !spirv.Decorations !320
  %52 = shl nsw i64 %51, 8, !spirv.Decorations !320
  %53 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %3, i64 %52
  %54 = shl nuw nsw i32 %13, 7, !spirv.Decorations !305
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %53, i64 %55
  br label %57

57:                                               ; preds = %66, %41
  %58 = phi i32 [ 0, %41 ], [ %74, %66 ]
  %59 = phi float [ 0.000000e+00, %41 ], [ %73, %66 ]
  %60 = icmp ult i32 %58, 128
  br i1 %60, label %66, label %61

61:                                               ; preds = %57
  %62 = xor i32 %10, 1
  %63 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %59, i32 %62) #1
  %64 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %59, float %63) #3, !spirv.Decorations !308
  %65 = fcmp reassoc nsz arcp contract oeq float %64, 0.000000e+00, !spirv.Decorations !308
  br i1 %65, label %77, label %75

66:                                               ; preds = %57
  %67 = zext i32 %58 to i64
  %68 = bitcast ptr addrspace(1) %56 to ptr addrspace(1)
  %69 = getelementptr inbounds half, ptr addrspace(1) %68, i64 %67
  %70 = load half, ptr addrspace(1) %69, align 2
  %71 = fpext half %70 to float
  %72 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %71) #3, !spirv.Decorations !308
  %73 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %59, float %72) #3, !spirv.Decorations !308
  %74 = add nuw nsw i32 %58, 1, !spirv.Decorations !305
  br label %57, !llvm.loop !322

75:                                               ; preds = %61
  %76 = fdiv reassoc nsz arcp contract float %64, 1.270000e+02, !spirv.Decorations !308
  br label %77

77:                                               ; preds = %75, %61
  %78 = phi float [ %76, %75 ], [ 0.000000e+00, %61 ]
  %79 = icmp eq i32 %13, 0
  br i1 %79, label %80, label %84

80:                                               ; preds = %77
  %81 = zext i32 %12 to i64
  %82 = getelementptr float, ptr addrspace(1) %1, i64 %14
  %83 = getelementptr float, ptr addrspace(1) %82, i64 %81
  store float %78, ptr addrspace(1) %83, align 4
  br label %84

84:                                               ; preds = %80, %77
  %85 = fcmp reassoc nsz arcp contract oeq float %78, 0.000000e+00, !spirv.Decorations !308
  br i1 %85, label %88, label %86

86:                                               ; preds = %84
  %87 = fdiv reassoc nsz arcp contract float 1.000000e+00, %78, !spirv.Decorations !308
  br label %88

88:                                               ; preds = %86, %84
  %89 = phi float [ %87, %86 ], [ 0.000000e+00, %84 ]
  %90 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %15
  %91 = zext i32 %12 to i64
  %92 = shl nuw nsw i64 %91, 8, !spirv.Decorations !305
  %93 = getelementptr inbounds i8, ptr addrspace(1) %90, i64 %92
  %94 = getelementptr inbounds i8, ptr addrspace(1) %93, i64 %55
  br label %95

95:                                               ; preds = %98, %88
  %96 = phi i32 [ 0, %88 ], [ %109, %98 ]
  %97 = icmp ult i32 %96, 128
  br i1 %97, label %98, label %.loopexit

98:                                               ; preds = %95
  %99 = zext i32 %96 to i64
  %100 = bitcast ptr addrspace(1) %56 to ptr addrspace(1)
  %101 = getelementptr inbounds half, ptr addrspace(1) %100, i64 %99
  %102 = load half, ptr addrspace(1) %101, align 2
  %103 = fpext half %102 to float
  %104 = fmul reassoc nsz arcp contract float %89, %103, !spirv.Decorations !308
  %105 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %104) #3, !spirv.Decorations !308
  %106 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %105, float -1.270000e+02, float 1.270000e+02) #3, !spirv.Decorations !308
  %107 = fptosi float %106 to i8
  %108 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 %99
  store i8 %107, ptr addrspace(1) %108, align 1
  %109 = add nuw nsw i32 %96, 1, !spirv.Decorations !305
  br label %95, !llvm.loop !323

.loopexit:                                        ; preds = %95
  br label %110

.loopexit1:                                       ; preds = %34
  br label %110

110:                                              ; preds = %.loopexit1, %.loopexit
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 2 %3) #3 !kernel_arg_addr_space !315 !kernel_arg_access_qual !316 !kernel_arg_type !317 !kernel_arg_type_qual !318 !kernel_arg_base_type !317 !kernel_arg_name !318 !spirv.ParameterDecorations !319 !intel_reqd_sub_group_size !304 {
  %5 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %6 = icmp ult i64 %5, 2147483648
  call void @llvm.assume(i1 %6)
  %7 = trunc i64 %5 to i32
  %8 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %9 = icmp ult i64 %8, 2147483648
  call void @llvm.assume(i1 %9)
  %10 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %11 = icmp sgt i32 %10, -1
  call void @llvm.assume(i1 %11)
  %12 = lshr i32 %7, 1
  %13 = and i32 %7, 1
  %14 = shl nuw nsw i64 %8, 6, !spirv.Decorations !305
  %15 = shl nuw nsw i64 %8, 14, !spirv.Decorations !305
  %16 = mul nsw i32 %0, 6, !spirv.Decorations !320
  %17 = icmp slt i32 %12, %16
  br i1 %17, label %41, label %18

18:                                               ; preds = %4
  %19 = icmp eq i32 %13, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %18
  %21 = zext i32 %12 to i64
  br label %26

22:                                               ; preds = %18
  %23 = zext i32 %12 to i64
  %24 = getelementptr float, ptr addrspace(1) %1, i64 %14
  %25 = getelementptr float, ptr addrspace(1) %24, i64 %23
  store float 0.000000e+00, ptr addrspace(1) %25, align 4
  br label %26

26:                                               ; preds = %22, %20
  %27 = phi i64 [ %21, %20 ], [ %23, %22 ]
  %28 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %15
  %29 = shl nuw nsw i64 %27, 8, !spirv.Decorations !305
  %30 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %29
  %31 = shl nuw nsw i32 %13, 7, !spirv.Decorations !305
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %32
  br label %34

34:                                               ; preds = %37, %26
  %35 = phi i32 [ 0, %26 ], [ %40, %37 ]
  %36 = icmp ult i32 %35, 128
  br i1 %36, label %37, label %.loopexit1

37:                                               ; preds = %34
  %38 = zext i32 %35 to i64
  %39 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 %38
  store i8 0, ptr addrspace(1) %39, align 1
  %40 = add nuw nsw i32 %35, 1, !spirv.Decorations !305
  br label %34, !llvm.loop !324

41:                                               ; preds = %4
  %42 = trunc i64 %8 to i32
  %43 = udiv i32 %7, 12
  %44 = mul nsw i32 %43, -6, !spirv.Decorations !320
  %45 = add nsw i32 %44, %12, !spirv.Decorations !320
  %46 = mul nuw nsw i32 %42, 6, !spirv.Decorations !305
  %47 = add nsw i32 %46, %45, !spirv.Decorations !320
  %48 = zext i32 %43 to i64
  %49 = mul nuw nsw i64 %48, 24, !spirv.Decorations !305
  %50 = sext i32 %47 to i64
  %51 = add nsw i64 %49, %50, !spirv.Decorations !320
  %52 = shl nsw i64 %51, 8, !spirv.Decorations !320
  %53 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %3, i64 %52
  %54 = shl nuw nsw i32 %13, 7, !spirv.Decorations !305
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %53, i64 %55
  br label %57

57:                                               ; preds = %66, %41
  %58 = phi i32 [ 0, %41 ], [ %74, %66 ]
  %59 = phi float [ 0.000000e+00, %41 ], [ %73, %66 ]
  %60 = icmp ult i32 %58, 128
  br i1 %60, label %66, label %61

61:                                               ; preds = %57
  %62 = xor i32 %10, 1
  %63 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %59, i32 %62) #1
  %64 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %59, float %63) #3, !spirv.Decorations !308
  %65 = fcmp reassoc nsz arcp contract oeq float %64, 0.000000e+00, !spirv.Decorations !308
  br i1 %65, label %77, label %75

66:                                               ; preds = %57
  %67 = zext i32 %58 to i64
  %68 = bitcast ptr addrspace(1) %56 to ptr addrspace(1)
  %69 = getelementptr inbounds half, ptr addrspace(1) %68, i64 %67
  %70 = load half, ptr addrspace(1) %69, align 2
  %71 = fpext half %70 to float
  %72 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %71) #3, !spirv.Decorations !308
  %73 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %59, float %72) #3, !spirv.Decorations !308
  %74 = add nuw nsw i32 %58, 1, !spirv.Decorations !305
  br label %57, !llvm.loop !325

75:                                               ; preds = %61
  %76 = fdiv reassoc nsz arcp contract float %64, 1.270000e+02, !spirv.Decorations !308
  br label %77

77:                                               ; preds = %75, %61
  %78 = phi float [ %76, %75 ], [ 0.000000e+00, %61 ]
  %79 = icmp eq i32 %13, 0
  br i1 %79, label %80, label %84

80:                                               ; preds = %77
  %81 = zext i32 %12 to i64
  %82 = getelementptr float, ptr addrspace(1) %1, i64 %14
  %83 = getelementptr float, ptr addrspace(1) %82, i64 %81
  store float %78, ptr addrspace(1) %83, align 4
  br label %84

84:                                               ; preds = %80, %77
  %85 = fcmp reassoc nsz arcp contract oeq float %78, 0.000000e+00, !spirv.Decorations !308
  br i1 %85, label %88, label %86

86:                                               ; preds = %84
  %87 = fdiv reassoc nsz arcp contract float 1.000000e+00, %78, !spirv.Decorations !308
  br label %88

88:                                               ; preds = %86, %84
  %89 = phi float [ %87, %86 ], [ 0.000000e+00, %84 ]
  %90 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %15
  %91 = zext i32 %12 to i64
  %92 = shl nuw nsw i64 %91, 8, !spirv.Decorations !305
  %93 = getelementptr inbounds i8, ptr addrspace(1) %90, i64 %92
  %94 = getelementptr inbounds i8, ptr addrspace(1) %93, i64 %55
  br label %95

95:                                               ; preds = %98, %88
  %96 = phi i32 [ 0, %88 ], [ %109, %98 ]
  %97 = icmp ult i32 %96, 128
  br i1 %97, label %98, label %.loopexit

98:                                               ; preds = %95
  %99 = zext i32 %96 to i64
  %100 = bitcast ptr addrspace(1) %56 to ptr addrspace(1)
  %101 = getelementptr inbounds half, ptr addrspace(1) %100, i64 %99
  %102 = load half, ptr addrspace(1) %101, align 2
  %103 = fpext half %102 to float
  %104 = fmul reassoc nsz arcp contract float %89, %103, !spirv.Decorations !308
  %105 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %104) #3, !spirv.Decorations !308
  %106 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %105, float -1.270000e+02, float 1.270000e+02) #3, !spirv.Decorations !308
  %107 = fptosi float %106 to i8
  %108 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 %99
  store i8 %107, ptr addrspace(1) %108, align 1
  %109 = add nuw nsw i32 %96, 1, !spirv.Decorations !305
  br label %95, !llvm.loop !326

.loopexit:                                        ; preds = %95
  br label %110

.loopexit1:                                       ; preds = %34
  br label %110

110:                                              ; preds = %.loopexit1, %.loopexit
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32) #6

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32) #6

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent nounwind }
attributes #2 = { nounwind memory(none) }
attributes #3 = { nounwind }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind willreturn memory(none) }

!spirv.MemoryModel = !{!3}
!opencl.enable.FP_CONTRACT = !{}
!spirv.Source = !{!4}
!opencl.spir.version = !{!5}
!opencl.ocl.version = !{!6}
!opencl.used.extensions = !{!7}
!opencl.used.optional.core.features = !{!8}
!spirv.Generator = !{!9}
!opencl.compiler.options = !{!8}
!igc.spirv.extensions = !{!10}
!igc.functions = !{}
!IGCMetadata = !{!11}

!0 = !{!1, !2}
!1 = !{i32 22}
!2 = !{i32 44, i32 16}
!3 = !{i32 2, i32 2}
!4 = !{i32 4, i32 100000}
!5 = !{i32 1, i32 2}
!6 = !{i32 1, i32 0}
!7 = !{!"cl_khr_subgroups"}
!8 = !{}
!9 = !{i16 6, i16 14}
!10 = !{!"SPV_INTEL_fp_fast_math_mode", !"SPV_INTEL_memory_access_aliasing", !"SPV_INTEL_subgroups", !"SPV_KHR_expect_assume"}
!11 = !{!"ModuleMD", !12, !13, !124, !125, !156, !173, !194, !204, !206, !207, !223, !224, !225, !226, !227, !231, !232, !239, !240, !241, !242, !243, !244, !245, !246, !247, !249, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !273, !275, !278, !279, !280, !282, !283, !284, !289, !290, !291, !292}
!12 = !{!"isPrecise", i1 false}
!13 = !{!"compOpt", !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123}
!14 = !{!"DenormsAreZero", i1 false}
!15 = !{!"BFTFDenormsAreZero", i1 false}
!16 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!17 = !{!"OptDisable", i1 false}
!18 = !{!"MadEnable", i1 false}
!19 = !{!"NoSignedZeros", i1 false}
!20 = !{!"NoNaNs", i1 false}
!21 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!22 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!23 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!24 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!25 = !{!"FloatRoundingMode", i32 0}
!26 = !{!"FloatCvtIntRoundingMode", i32 3}
!27 = !{!"LoadCacheDefault", i32 -1}
!28 = !{!"StoreCacheDefault", i32 -1}
!29 = !{!"VISAPreSchedRPThreshold", i32 0}
!30 = !{!"VISAPreSchedCtrl", i32 0}
!31 = !{!"SetLoopUnrollThreshold", i32 0}
!32 = !{!"UnsafeMathOptimizations", i1 false}
!33 = !{!"disableCustomUnsafeOpts", i1 false}
!34 = !{!"disableReducePow", i1 false}
!35 = !{!"disableSqrtOpt", i1 false}
!36 = !{!"FiniteMathOnly", i1 false}
!37 = !{!"FastRelaxedMath", i1 false}
!38 = !{!"DashGSpecified", i1 false}
!39 = !{!"FastCompilation", i1 false}
!40 = !{!"UseScratchSpacePrivateMemory", i1 true}
!41 = !{!"RelaxedBuiltins", i1 false}
!42 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!43 = !{!"GreaterThan2GBBufferRequired", i1 true}
!44 = !{!"GreaterThan4GBBufferRequired", i1 true}
!45 = !{!"DisableA64WA", i1 false}
!46 = !{!"ForceEnableA64WA", i1 false}
!47 = !{!"PushConstantsEnable", i1 true}
!48 = !{!"HasPositivePointerOffset", i1 false}
!49 = !{!"HasBufferOffsetArg", i1 false}
!50 = !{!"BufferOffsetArgOptional", i1 true}
!51 = !{!"replaceGlobalOffsetsByZero", i1 false}
!52 = !{!"forcePixelShaderSIMDMode", i32 0}
!53 = !{!"forceTotalGRFNum", i32 0}
!54 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!55 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!56 = !{!"UniformWGS", i1 false}
!57 = !{!"disableVertexComponentPacking", i1 false}
!58 = !{!"disablePartialVertexComponentPacking", i1 false}
!59 = !{!"PreferBindlessImages", i1 false}
!60 = !{!"UseBindlessMode", i1 false}
!61 = !{!"UseLegacyBindlessMode", i1 true}
!62 = !{!"disableMathRefactoring", i1 false}
!63 = !{!"atomicBranch", i1 false}
!64 = !{!"spillCompression", i1 false}
!65 = !{!"AllowLICM", i1 true}
!66 = !{!"DisableEarlyOut", i1 false}
!67 = !{!"ForceInt32DivRemEmu", i1 false}
!68 = !{!"ForceInt32DivRemEmuSP", i1 false}
!69 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!70 = !{!"DisableFastestSingleCSSIMD", i1 false}
!71 = !{!"DisableFastestLinearScan", i1 false}
!72 = !{!"UseStatelessforPrivateMemory", i1 false}
!73 = !{!"EnableTakeGlobalAddress", i1 false}
!74 = !{!"IsLibraryCompilation", i1 false}
!75 = !{!"LibraryCompileSIMDSize", i32 0}
!76 = !{!"FastVISACompile", i1 false}
!77 = !{!"MatchSinCosPi", i1 false}
!78 = !{!"ExcludeIRFromZEBinary", i1 false}
!79 = !{!"EmitZeBinVISASections", i1 false}
!80 = !{!"FP64GenEmulationEnabled", i1 false}
!81 = !{!"FP64GenConvEmulationEnabled", i1 false}
!82 = !{!"allowDisableRematforCS", i1 false}
!83 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!84 = !{!"DisableCPSOmaskWA", i1 false}
!85 = !{!"DisableFastestGopt", i1 false}
!86 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!87 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!88 = !{!"DisableConstantCoalescing", i1 false}
!89 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!90 = !{!"WaEnableALTModeVisaWA", i1 false}
!91 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!92 = !{!"EnableLdStCombineforLoad", i1 false}
!93 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!94 = !{!"ForceUniformBuffer", i1 false}
!95 = !{!"ForceUniformSurfaceSampler", i1 false}
!96 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!97 = !{!"NewSpillCostFunction", i1 false}
!98 = !{!"EnableVRT", i1 true}
!99 = !{!"ForceLargeGRFNum4RQ", i1 false}
!100 = !{!"DisableEUFusion", i1 false}
!101 = !{!"DisableFDivToFMulInvOpt", i1 false}
!102 = !{!"initializePhiSampleSourceWA", i1 false}
!103 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!104 = !{!"DisableLoosenSimd32Occu", i1 false}
!105 = !{!"FastestS1Options", i32 0}
!106 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!107 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!108 = !{!"LscSamplerRouting", i32 0}
!109 = !{!"UseBarrierControlFlowOptimization", i1 false}
!110 = !{!"EnableDynamicRQManagement", i1 false}
!111 = !{!"WaDisablePayloadCoalescing", i1 false}
!112 = !{!"Quad8InputThreshold", i32 0}
!113 = !{!"UseResourceLoopUnrollNested", i1 false}
!114 = !{!"DisableLoopUnroll", i1 false}
!115 = !{!"ForcePushConstantMode", i32 0}
!116 = !{!"UseInstructionHoistingOptimization", i1 false}
!117 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!118 = !{!"ForceVRTGRFCeiling", i32 0}
!119 = !{!"DisableSamplerBackingByLSC", i32 0}
!120 = !{!"UseLinearScanRA", i1 false}
!121 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!122 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!123 = !{!"VISASpillAllowed", i32 0}
!124 = !{!"FuncMD"}
!125 = !{!"pushInfo", !126, !127, !128, !132, !133, !134, !135, !136, !137, !138, !139, !152, !153, !154, !155}
!126 = !{!"pushableAddresses"}
!127 = !{!"bindlessPushInfo"}
!128 = !{!"dynamicBufferInfo", !129, !130, !131}
!129 = !{!"firstIndex", i32 0}
!130 = !{!"numOffsets", i32 0}
!131 = !{!"forceDisabled", i1 false}
!132 = !{!"MaxNumberOfPushedBuffers", i32 0}
!133 = !{!"inlineConstantBufferSlot", i32 -1}
!134 = !{!"inlineConstantBufferOffset", i32 -1}
!135 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!136 = !{!"constants"}
!137 = !{!"inputs"}
!138 = !{!"constantReg"}
!139 = !{!"simplePushInfoArr", !140, !149, !150, !151}
!140 = !{!"simplePushInfoArrVec[0]", !141, !142, !143, !144, !145, !146, !147, !148}
!141 = !{!"cbIdx", i32 0}
!142 = !{!"pushableAddressGrfOffset", i32 -1}
!143 = !{!"pushableOffsetGrfOffset", i32 -1}
!144 = !{!"offset", i32 0}
!145 = !{!"size", i32 0}
!146 = !{!"isStateless", i1 false}
!147 = !{!"isBindless", i1 false}
!148 = !{!"simplePushLoads"}
!149 = !{!"simplePushInfoArrVec[1]", !141, !142, !143, !144, !145, !146, !147, !148}
!150 = !{!"simplePushInfoArrVec[2]", !141, !142, !143, !144, !145, !146, !147, !148}
!151 = !{!"simplePushInfoArrVec[3]", !141, !142, !143, !144, !145, !146, !147, !148}
!152 = !{!"simplePushBufferUsed", i32 0}
!153 = !{!"pushAnalysisWIInfos"}
!154 = !{!"inlineRTGlobalPtrOffset", i32 0}
!155 = !{!"rtSyncSurfPtrOffset", i32 0}
!156 = !{!"psInfo", !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172}
!157 = !{!"BlendStateDisabledMask", i8 0}
!158 = !{!"SkipSrc0Alpha", i1 false}
!159 = !{!"DualSourceBlendingDisabled", i1 false}
!160 = !{!"ForceEnableSimd32", i1 false}
!161 = !{!"DisableSimd32WithDiscard", i1 false}
!162 = !{!"outputDepth", i1 false}
!163 = !{!"outputStencil", i1 false}
!164 = !{!"outputMask", i1 false}
!165 = !{!"blendToFillEnabled", i1 false}
!166 = !{!"forceEarlyZ", i1 false}
!167 = !{!"hasVersionedLoop", i1 false}
!168 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!169 = !{!"blendOptimizationMode"}
!170 = !{!"colorOutputMask"}
!171 = !{!"isBlendEnabled"}
!172 = !{!"WaDisableVRS", i1 false}
!173 = !{!"csInfo", !174, !175, !176, !177, !53, !29, !30, !178, !31, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !64, !190, !191, !192, !193}
!174 = !{!"maxWorkGroupSize", i32 0}
!175 = !{!"waveSize", i32 0}
!176 = !{!"ComputeShaderSecondCompile"}
!177 = !{!"forcedSIMDSize", i8 0}
!178 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!179 = !{!"forceSpillCompression", i1 false}
!180 = !{!"allowLowerSimd", i1 false}
!181 = !{!"disableSimd32Slicing", i1 false}
!182 = !{!"disableSplitOnSpill", i1 false}
!183 = !{!"enableNewSpillCostFunction", i1 false}
!184 = !{!"forceVISAPreSched", i1 false}
!185 = !{!"disableLocalIdOrderOptimizations", i1 false}
!186 = !{!"disableDispatchAlongY", i1 false}
!187 = !{!"neededThreadIdLayout", ptr null}
!188 = !{!"forceTileYWalk", i1 false}
!189 = !{!"atomicBranch", i32 0}
!190 = !{!"disableEarlyOut", i1 false}
!191 = !{!"walkOrderEnabled", i1 false}
!192 = !{!"walkOrderOverride", i32 0}
!193 = !{!"ResForHfPacking"}
!194 = !{!"msInfo", !195, !196, !197, !198, !199, !200, !201, !202, !203}
!195 = !{!"PrimitiveTopology", i32 3}
!196 = !{!"MaxNumOfPrimitives", i32 0}
!197 = !{!"MaxNumOfVertices", i32 0}
!198 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!199 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!200 = !{!"WorkGroupSize", i32 0}
!201 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!202 = !{!"IndexFormat", i32 6}
!203 = !{!"SubgroupSize", i32 0}
!204 = !{!"taskInfo", !205, !200, !201, !203}
!205 = !{!"MaxNumOfOutputs", i32 0}
!206 = !{!"NBarrierCnt", i32 0}
!207 = !{!"rtInfo", !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222}
!208 = !{!"RayQueryAllocSizeInBytes", i32 0}
!209 = !{!"NumContinuations", i32 0}
!210 = !{!"RTAsyncStackAddrspace", i32 -1}
!211 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!212 = !{!"SWHotZoneAddrspace", i32 -1}
!213 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!214 = !{!"SWStackAddrspace", i32 -1}
!215 = !{!"SWStackSurfaceStateOffset", ptr null}
!216 = !{!"RTSyncStackAddrspace", i32 -1}
!217 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!218 = !{!"doSyncDispatchRays", i1 false}
!219 = !{!"MemStyle", !"Xe"}
!220 = !{!"GlobalDataStyle", !"Xe"}
!221 = !{!"uberTileDimensions", ptr null}
!222 = !{!"numSyncRTStacks", i32 0}
!223 = !{!"hasSliceLayoutDependency", i1 false}
!224 = !{!"CurUniqueIndirectIdx", i32 0}
!225 = !{!"inlineDynTextures"}
!226 = !{!"inlineResInfoData"}
!227 = !{!"immConstant", !228, !229, !230}
!228 = !{!"data"}
!229 = !{!"sizes"}
!230 = !{!"zeroIdxs"}
!231 = !{!"stringConstants"}
!232 = !{!"inlineBuffers", !233, !237, !238}
!233 = !{!"inlineBuffersVec[0]", !234, !235, !236}
!234 = !{!"alignment", i32 0}
!235 = !{!"allocSize", i64 0}
!236 = !{!"Buffer"}
!237 = !{!"inlineBuffersVec[1]", !234, !235, !236}
!238 = !{!"inlineBuffersVec[2]", !234, !235, !236}
!239 = !{!"GlobalBufferAddressRelocInfo"}
!240 = !{!"ConstantBufferAddressRelocInfo"}
!241 = !{!"forceLscCacheList"}
!242 = !{!"SrvMap"}
!243 = !{!"RasterizerOrderedByteAddressBuffer"}
!244 = !{!"RasterizerOrderedViews"}
!245 = !{!"MinNOSPushConstantSize", i32 0}
!246 = !{!"inlineProgramScopeOffsets"}
!247 = !{!"shaderData", !248}
!248 = !{!"numReplicas", i32 0}
!249 = !{!"URBInfo", !250, !251, !252}
!250 = !{!"has64BVertexHeaderInput", i1 false}
!251 = !{!"has64BVertexHeaderOutput", i1 false}
!252 = !{!"hasVertexHeader", i1 true}
!253 = !{!"UseBindlessImage", i1 false}
!254 = !{!"HasBindlessImageRead", i1 false}
!255 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!256 = !{!"enableRangeReduce", i1 false}
!257 = !{!"allowMatchMadOptimizationforVS", i1 false}
!258 = !{!"disableMatchMadOptimizationForCS", i1 false}
!259 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!260 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!261 = !{!"statefulResourcesNotAliased", i1 false}
!262 = !{!"disableMixMode", i1 false}
!263 = !{!"genericAccessesResolved", i1 false}
!264 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!265 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!266 = !{!"disableSeparateScratchWA", i1 false}
!267 = !{!"enableRemoveUnusedTGMFence", i1 false}
!268 = !{!"privateMemoryPerWI", i32 0}
!269 = !{!"PrivateMemoryPerFG"}
!270 = !{!"m_OptsToDisable"}
!271 = !{!"capabilities", !272}
!272 = !{!"globalVariableDecorationsINTEL", i1 false}
!273 = !{!"extensions", !274}
!274 = !{!"spvINTELBindlessImages", i1 false}
!275 = !{!"m_ShaderResourceViewMcsMask", !276, !277}
!276 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!277 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!278 = !{!"computedDepthMode", i32 0}
!279 = !{!"isHDCFastClearShader", i1 false}
!280 = !{!"argRegisterReservations", !281}
!281 = !{!"argRegisterReservationsVec[0]", i32 0}
!282 = !{!"SIMD16_SpillThreshold", i8 0}
!283 = !{!"SIMD32_SpillThreshold", i8 0}
!284 = !{!"m_CacheControlOption", !285, !286, !287, !288}
!285 = !{!"LscLoadCacheControlOverride", i8 0}
!286 = !{!"LscStoreCacheControlOverride", i8 0}
!287 = !{!"TgmLoadCacheControlOverride", i8 0}
!288 = !{!"TgmStoreCacheControlOverride", i8 0}
!289 = !{!"ModuleUsesBindless", i1 false}
!290 = !{!"predicationMap"}
!291 = !{!"lifeTimeStartMap"}
!292 = !{!"HitGroups"}
!293 = !{i32 1, i32 1, i32 1}
!294 = !{!"none", !"none", !"none"}
!295 = !{!"class.sycl::_V1::detail::half_impl::half*", !"char*", !"char*"}
!296 = !{!"", !"", !""}
!297 = !{!298, !300, !302}
!298 = !{!299}
!299 = !{i32 44, i32 2}
!300 = !{!301}
!301 = !{i32 44, i32 4}
!302 = !{!303}
!303 = !{i32 44, i32 1}
!304 = !{i32 16}
!305 = !{!306, !307}
!306 = !{i32 4469}
!307 = !{i32 4470}
!308 = !{!309}
!309 = !{i32 40, i32 196620}
!310 = distinct !{!310, !311}
!311 = !{!"llvm.loop.unroll.enable"}
!312 = distinct !{!312, !311}
!313 = distinct !{!313, !311}
!314 = distinct !{!314, !311}
!315 = !{i32 0, i32 1, i32 1, i32 1}
!316 = !{!"none", !"none", !"none", !"none"}
!317 = !{!"int", !"float*", !"char*", !"class.sycl::_V1::detail::half_impl::half*"}
!318 = !{!"", !"", !"", !""}
!319 = !{!8, !300, !302, !298}
!320 = !{!306}
!321 = distinct !{!321, !311}
!322 = distinct !{!322, !311}
!323 = distinct !{!323, !311}
!324 = distinct !{!324, !311}
!325 = distinct !{!325, !311}
!326 = distinct !{!326, !311}
