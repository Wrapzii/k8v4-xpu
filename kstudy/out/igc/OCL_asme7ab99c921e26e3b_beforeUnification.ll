; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_beforeUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
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

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiKstoreKernelE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2) #0 !kernel_arg_addr_space !293 !kernel_arg_access_qual !294 !kernel_arg_type !295 !kernel_arg_type_qual !296 !kernel_arg_base_type !295 !kernel_arg_name !296 !spirv.ParameterDecorations !297 !intel_reqd_sub_group_size !304 {
  %4 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %5 = icmp ult i64 %4, 2147483648
  call void @llvm.assume(i1 %5)
  %6 = trunc i64 %4 to i32
  %7 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %8 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %8)
  %9 = lshr i64 %4, 1
  %10 = and i32 %6, 1
  %11 = shl nuw nsw i64 %9, 8, !spirv.Decorations !305
  %12 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %11
  %13 = shl nuw nsw i32 %10, 7, !spirv.Decorations !305
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %12, i64 %14
  br label %16

16:                                               ; preds = %25, %3
  %17 = phi i32 [ 0, %3 ], [ %33, %25 ]
  %18 = phi float [ 0.000000e+00, %3 ], [ %32, %25 ]
  %19 = icmp ult i32 %17, 128
  br i1 %19, label %25, label %20

20:                                               ; preds = %16
  %21 = xor i32 %7, 1
  %22 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %18, i32 %21) #2
  %23 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %18, float %22) #0, !spirv.Decorations !308
  %24 = fcmp reassoc nsz arcp contract oeq float %23, 0.000000e+00, !spirv.Decorations !308
  br i1 %24, label %36, label %34

25:                                               ; preds = %16
  %26 = zext i32 %17 to i64
  %27 = bitcast ptr addrspace(1) %15 to ptr addrspace(1)
  %28 = getelementptr inbounds half, ptr addrspace(1) %27, i64 %26
  %29 = load half, ptr addrspace(1) %28, align 2
  %30 = fpext half %29 to float
  %31 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %30) #0, !spirv.Decorations !308
  %32 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %18, float %31) #0, !spirv.Decorations !308
  %33 = add nuw nsw i32 %17, 1, !spirv.Decorations !305
  br label %16, !llvm.loop !310

34:                                               ; preds = %20
  %35 = fdiv reassoc nsz arcp contract float %23, 1.270000e+02, !spirv.Decorations !308
  br label %36

36:                                               ; preds = %34, %20
  %37 = phi float [ %35, %34 ], [ 0.000000e+00, %20 ]
  %38 = icmp eq i32 %10, 0
  br i1 %38, label %39, label %41

39:                                               ; preds = %36
  %40 = getelementptr inbounds float, ptr addrspace(1) %1, i64 %9
  store float %37, ptr addrspace(1) %40, align 4
  br label %41

41:                                               ; preds = %39, %36
  %42 = fcmp reassoc nsz arcp contract oeq float %37, 0.000000e+00, !spirv.Decorations !308
  br i1 %42, label %45, label %43

43:                                               ; preds = %41
  %44 = fdiv reassoc nsz arcp contract float 1.000000e+00, %37, !spirv.Decorations !308
  br label %45

45:                                               ; preds = %43, %41
  %46 = phi float [ %44, %43 ], [ 0.000000e+00, %41 ]
  %47 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %11
  %48 = getelementptr inbounds i8, ptr addrspace(1) %47, i64 %14
  br label %49

49:                                               ; preds = %52, %45
  %50 = phi i32 [ 0, %45 ], [ %63, %52 ]
  %51 = icmp ult i32 %50, 128
  br i1 %51, label %52, label %64

52:                                               ; preds = %49
  %53 = zext i32 %50 to i64
  %54 = bitcast ptr addrspace(1) %15 to ptr addrspace(1)
  %55 = getelementptr inbounds half, ptr addrspace(1) %54, i64 %53
  %56 = load half, ptr addrspace(1) %55, align 2
  %57 = fpext half %56 to float
  %58 = fmul reassoc nsz arcp contract float %46, %57, !spirv.Decorations !308
  %59 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %58) #0, !spirv.Decorations !308
  %60 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %59, float -1.270000e+02, float 1.270000e+02) #0, !spirv.Decorations !308
  %61 = fptosi float %60 to i8
  %62 = getelementptr inbounds i8, ptr addrspace(1) %48, i64 %53
  store i8 %61, ptr addrspace(1) %62, align 1
  %63 = add nuw nsw i32 %50, 1, !spirv.Decorations !305
  br label %49, !llvm.loop !312

64:                                               ; preds = %49
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: convergent nounwind
declare spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float, i32) #2

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_fmaxff(float, float) #3

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_fabsf(float) #3

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_rintf(float) #3

; Function Attrs: nounwind
declare spir_func float @_Z18__spirv_ocl_fclampfff(float, float, float) #0

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiVstoreKernelE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 1 %3) #0 !kernel_arg_addr_space !313 !kernel_arg_access_qual !314 !kernel_arg_type !315 !kernel_arg_type_qual !316 !kernel_arg_base_type !315 !kernel_arg_name !316 !spirv.ParameterDecorations !317 !intel_reqd_sub_group_size !304 {
  %5 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %6 = icmp ult i64 %5, 2147483648
  call void @llvm.assume(i1 %6)
  %7 = trunc i64 %5 to i32
  %8 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %9 = icmp sgt i32 %8, -1
  call void @llvm.assume(i1 %9)
  %10 = lshr i64 %5, 1
  %11 = and i32 %7, 1
  %12 = shl nuw nsw i64 %10, 8, !spirv.Decorations !305
  %13 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %12
  %14 = shl nuw nsw i32 %11, 7, !spirv.Decorations !305
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %13, i64 %15
  br label %17

17:                                               ; preds = %38, %4
  %18 = phi i32 [ 0, %4 ], [ %46, %38 ]
  %19 = phi float [ 0xFFF0000000000000, %4 ], [ %45, %38 ]
  %20 = phi float [ 0x7FF0000000000000, %4 ], [ %44, %38 ]
  %21 = icmp ult i32 %18, 128
  br i1 %21, label %38, label %22

22:                                               ; preds = %17
  %23 = xor i32 %8, 1
  %24 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %20, i32 %23) #2
  %25 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %19, i32 %23) #2
  %26 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float %20, float %24) #0, !spirv.Decorations !308
  %27 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %19, float %25) #0, !spirv.Decorations !308
  %28 = fsub reassoc nsz arcp contract float %27, %26, !spirv.Decorations !308
  %29 = fdiv reassoc nsz arcp contract float %28, 1.500000e+01, !spirv.Decorations !308
  %30 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %29, float 0x3E45798EE0000000) #0, !spirv.Decorations !308
  %31 = fneg reassoc nsz arcp contract float %26, !spirv.Decorations !308
  %32 = fdiv reassoc nsz arcp contract float %31, %30, !spirv.Decorations !308
  %33 = fadd reassoc nsz arcp contract float %32, 5.000000e-01, !spirv.Decorations !308
  %34 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %33) #0, !spirv.Decorations !308
  %35 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %34) #0, !spirv.Decorations !308
  %36 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %35) #0, !spirv.Decorations !308
  %37 = icmp eq i32 %11, 0
  br i1 %37, label %47, label %50

38:                                               ; preds = %17
  %39 = zext i32 %18 to i64
  %40 = bitcast ptr addrspace(1) %16 to ptr addrspace(1)
  %41 = getelementptr inbounds half, ptr addrspace(1) %40, i64 %39
  %42 = load half, ptr addrspace(1) %41, align 2
  %43 = fpext half %42 to float
  %44 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float %20, float %43) #0, !spirv.Decorations !308
  %45 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %19, float %43) #0, !spirv.Decorations !308
  %46 = add nuw nsw i32 %18, 1, !spirv.Decorations !305
  br label %17, !llvm.loop !318

47:                                               ; preds = %22
  %48 = getelementptr inbounds float, ptr addrspace(1) %1, i64 %10
  store float %30, ptr addrspace(1) %48, align 4
  %49 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %10
  store float %36, ptr addrspace(1) %49, align 4
  br label %50

50:                                               ; preds = %47, %22
  %51 = shl nuw nsw i64 %10, 7, !spirv.Decorations !305
  %52 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %51
  %53 = shl nuw nsw i32 %11, 6, !spirv.Decorations !305
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i8, ptr addrspace(1) %52, i64 %54
  br label %56

56:                                               ; preds = %59, %50
  %57 = phi i32 [ 0, %50 ], [ %88, %59 ]
  %58 = icmp ult i32 %57, 64
  br i1 %58, label %59, label %89

59:                                               ; preds = %56
  %60 = shl nuw nsw i32 %57, 1, !spirv.Decorations !305
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %16, i64 %61
  %63 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %62, i64 0, i32 0
  %64 = load half, ptr addrspace(1) %63, align 2
  %65 = fpext half %64 to float
  %66 = bitcast ptr addrspace(1) %62 to ptr addrspace(1)
  %67 = getelementptr half, ptr addrspace(1) %66, i64 1
  %68 = load half, ptr addrspace(1) %67, align 2
  %69 = fpext half %68 to float
  %70 = fdiv reassoc nsz arcp contract float %65, %30, !spirv.Decorations !308
  %71 = fadd reassoc nsz arcp contract float %70, %36, !spirv.Decorations !308
  %72 = fadd reassoc nsz arcp contract float %71, 5.000000e-01, !spirv.Decorations !308
  %73 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %72) #0, !spirv.Decorations !308
  %74 = fdiv reassoc nsz arcp contract float %69, %30, !spirv.Decorations !308
  %75 = fadd reassoc nsz arcp contract float %74, %36, !spirv.Decorations !308
  %76 = fadd reassoc nsz arcp contract float %75, 5.000000e-01, !spirv.Decorations !308
  %77 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %76) #0, !spirv.Decorations !308
  %78 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %73) #0, !spirv.Decorations !308
  %79 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %78) #0, !spirv.Decorations !308
  %80 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %77) #0, !spirv.Decorations !308
  %81 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %80) #0, !spirv.Decorations !308
  %82 = fptoui float %79 to i8
  %83 = fptoui float %81 to i8
  %84 = shl i8 %83, 4
  %85 = or i8 %84, %82
  %86 = zext i32 %57 to i64
  %87 = getelementptr inbounds i8, ptr addrspace(1) %55, i64 %86
  store i8 %85, ptr addrspace(1) %87, align 1
  %88 = add nuw nsw i32 %57, 1, !spirv.Decorations !305
  br label %56, !llvm.loop !319

89:                                               ; preds = %56
  ret void
}

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z16__spirv_ocl_fminff(float, float) #3

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z17__spirv_ocl_floorf(float) #3

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi2EEE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2) #0 !kernel_arg_addr_space !293 !kernel_arg_access_qual !294 !kernel_arg_type !320 !kernel_arg_type_qual !296 !kernel_arg_base_type !320 !kernel_arg_name !296 !spirv.ParameterDecorations !297 !intel_reqd_sub_group_size !304 {
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
  %27 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %23, i32 %26) #2
  %28 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %23, float %27) #0, !spirv.Decorations !308
  %29 = fcmp reassoc nsz arcp contract oeq float %28, 0.000000e+00, !spirv.Decorations !308
  br i1 %29, label %41, label %39

30:                                               ; preds = %21
  %31 = zext i32 %22 to i64
  %32 = bitcast ptr addrspace(1) %20 to ptr addrspace(1)
  %33 = getelementptr inbounds half, ptr addrspace(1) %32, i64 %31
  %34 = load half, ptr addrspace(1) %33, align 2
  %35 = fpext half %34 to float
  %36 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %35) #0, !spirv.Decorations !308
  %37 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %23, float %36) #0, !spirv.Decorations !308
  %38 = add nuw nsw i32 %22, 1, !spirv.Decorations !305
  br label %21, !llvm.loop !321

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
  %67 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %66) #0, !spirv.Decorations !308
  %68 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %67, float -1.270000e+02, float 1.270000e+02) #0, !spirv.Decorations !308
  %69 = fptosi float %68 to i8
  %70 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 %61
  store i8 %69, ptr addrspace(1) %70, align 1
  %71 = add nuw nsw i32 %58, 1, !spirv.Decorations !305
  br label %57, !llvm.loop !322

72:                                               ; preds = %57
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi4EEE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2) #0 !kernel_arg_addr_space !293 !kernel_arg_access_qual !294 !kernel_arg_type !320 !kernel_arg_type_qual !296 !kernel_arg_base_type !320 !kernel_arg_name !296 !spirv.ParameterDecorations !297 !intel_reqd_sub_group_size !304 {
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
  %27 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %23, i32 %26) #2
  %28 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %23, float %27) #0, !spirv.Decorations !308
  %29 = fcmp reassoc nsz arcp contract oeq float %28, 0.000000e+00, !spirv.Decorations !308
  br i1 %29, label %41, label %39

30:                                               ; preds = %21
  %31 = zext i32 %22 to i64
  %32 = bitcast ptr addrspace(1) %20 to ptr addrspace(1)
  %33 = getelementptr inbounds half, ptr addrspace(1) %32, i64 %31
  %34 = load half, ptr addrspace(1) %33, align 2
  %35 = fpext half %34 to float
  %36 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %35) #0, !spirv.Decorations !308
  %37 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %23, float %36) #0, !spirv.Decorations !308
  %38 = add nuw nsw i32 %22, 1, !spirv.Decorations !305
  br label %21, !llvm.loop !323

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
  %67 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %66) #0, !spirv.Decorations !308
  %68 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %67, float -1.270000e+02, float 1.270000e+02) #0, !spirv.Decorations !308
  %69 = fptosi float %68 to i8
  %70 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 %61
  store i8 %69, ptr addrspace(1) %70, align 1
  %71 = add nuw nsw i32 %58, 1, !spirv.Decorations !305
  br label %57, !llvm.loop !324

72:                                               ; preds = %57
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi2EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, ptr addrspace(1) align 4 %3, i64 %4, ptr addrspace(1) align 1 %5, i64 %6) #0 !kernel_arg_addr_space !325 !kernel_arg_access_qual !326 !kernel_arg_type !327 !kernel_arg_type_qual !328 !kernel_arg_base_type !327 !kernel_arg_name !328 !spirv.ParameterDecorations !329 !intel_reqd_sub_group_size !304 {
  %8 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %9 = icmp ult i64 %8, 2147483648
  call void @llvm.assume(i1 %9)
  %10 = trunc i64 %8 to i32
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %12 = icmp ult i64 %11, 2147483648
  call void @llvm.assume(i1 %12)
  %13 = lshr i64 %11, 1
  %14 = and i64 %11, 1
  %15 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %13
  %16 = load i64, ptr addrspace(1) %15, align 8
  %17 = icmp sgt i64 %16, -1
  %18 = lshr i64 %16, 6
  %19 = trunc i64 %18 to i32
  %20 = select i1 %17, i32 %19, i32 -1
  %21 = trunc i64 %16 to i32
  %22 = and i32 %21, 63
  %23 = select i1 %17, i32 %22, i32 -1
  %24 = icmp sgt i32 %20, -1
  br i1 %24, label %25, label %29

25:                                               ; preds = %7
  %26 = zext i32 %20 to i64
  %27 = icmp sgt i64 %1, %26
  %28 = and i1 %27, %17
  br label %29

29:                                               ; preds = %25, %7
  %30 = phi i1 [ false, %7 ], [ %28, %25 ]
  %31 = shl nuw nsw i64 %13, 9, !spirv.Decorations !305
  %32 = shl nuw nsw i64 %14, 8, !spirv.Decorations !305
  %33 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %2, i64 %31
  %34 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %33, i64 %32
  br label %35

35:                                               ; preds = %42, %29
  %36 = phi i32 [ %10, %29 ], [ %50, %42 ]
  %37 = phi float [ 0.000000e+00, %29 ], [ %49, %42 ]
  %38 = icmp ult i32 %36, 256
  br i1 %38, label %42, label %39

39:                                               ; preds = %35
  %40 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 2, i32 0, float %37) #2
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %41 = fcmp reassoc nsz arcp contract oeq float %40, 0.000000e+00, !spirv.Decorations !308
  br i1 %41, label %53, label %51

42:                                               ; preds = %35
  %43 = zext i32 %36 to i64
  %44 = bitcast ptr addrspace(1) %34 to ptr addrspace(1)
  %45 = getelementptr inbounds half, ptr addrspace(1) %44, i64 %43
  %46 = load half, ptr addrspace(1) %45, align 2
  %47 = fpext half %46 to float
  %48 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %47) #0, !spirv.Decorations !308
  %49 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %37, float %48) #0, !spirv.Decorations !308
  %50 = add nuw nsw i32 %36, 32, !spirv.Decorations !305
  br label %35

51:                                               ; preds = %39
  %52 = fdiv reassoc nsz arcp contract float %40, 1.270000e+02, !spirv.Decorations !308
  br label %53

53:                                               ; preds = %51, %39
  %54 = phi float [ %52, %51 ], [ 0.000000e+00, %39 ]
  %55 = icmp eq i64 %8, 0
  %56 = and i1 %55, %30
  br i1 %56, label %57, label %65

57:                                               ; preds = %53
  %58 = sext i32 %20 to i64
  %59 = mul i64 %4, %58
  %60 = sext i32 %23 to i64
  %61 = shl nsw i64 %60, 1, !spirv.Decorations !332
  %62 = getelementptr float, ptr addrspace(1) %3, i64 %59
  %63 = getelementptr float, ptr addrspace(1) %62, i64 %61
  %64 = getelementptr float, ptr addrspace(1) %63, i64 %14
  store float %54, ptr addrspace(1) %64, align 4
  br label %65

65:                                               ; preds = %57, %53
  br i1 %30, label %66, label %94

66:                                               ; preds = %65
  %67 = fcmp reassoc nsz arcp contract oeq float %54, 0.000000e+00, !spirv.Decorations !308
  br i1 %67, label %70, label %68

68:                                               ; preds = %66
  %69 = fdiv reassoc nsz arcp contract float 1.000000e+00, %54, !spirv.Decorations !308
  br label %70

70:                                               ; preds = %68, %66
  %71 = phi float [ %69, %68 ], [ 0.000000e+00, %66 ]
  %72 = sext i32 %20 to i64
  %73 = mul i64 %6, %72
  %74 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %73
  %75 = sext i32 %23 to i64
  %76 = shl nsw i64 %75, 9, !spirv.Decorations !332
  %77 = getelementptr i8, ptr addrspace(1) %74, i64 %76
  %78 = getelementptr i8, ptr addrspace(1) %77, i64 %32
  br label %79

79:                                               ; preds = %82, %70
  %80 = phi i32 [ %10, %70 ], [ %93, %82 ]
  %81 = icmp ult i32 %80, 256
  br i1 %81, label %82, label %.loopexit

82:                                               ; preds = %79
  %83 = zext i32 %80 to i64
  %84 = bitcast ptr addrspace(1) %34 to ptr addrspace(1)
  %85 = getelementptr inbounds half, ptr addrspace(1) %84, i64 %83
  %86 = load half, ptr addrspace(1) %85, align 2
  %87 = fpext half %86 to float
  %88 = fmul reassoc nsz arcp contract float %71, %87, !spirv.Decorations !308
  %89 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %88) #0, !spirv.Decorations !308
  %90 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %89, float -1.270000e+02, float 1.270000e+02) #0, !spirv.Decorations !308
  %91 = fptosi float %90 to i8
  %92 = getelementptr inbounds i8, ptr addrspace(1) %78, i64 %83
  store i8 %91, ptr addrspace(1) %92, align 1
  %93 = add nuw nsw i32 %80, 32, !spirv.Decorations !305
  br label %79

.loopexit:                                        ; preds = %79
  br label %94

94:                                               ; preds = %.loopexit, %65
  ret void
}

; Function Attrs: convergent nounwind
declare spir_func float @_Z17__spirv_GroupFMaxiif(i32, i32, float) #2

; Function Attrs: convergent nounwind
declare spir_func void @_Z22__spirv_ControlBarrieriii(i32, i32, i32) #2

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiKstorePagedKernelILi4EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, ptr addrspace(1) align 4 %3, i64 %4, ptr addrspace(1) align 1 %5, i64 %6) #0 !kernel_arg_addr_space !325 !kernel_arg_access_qual !326 !kernel_arg_type !327 !kernel_arg_type_qual !328 !kernel_arg_base_type !327 !kernel_arg_name !328 !spirv.ParameterDecorations !329 !intel_reqd_sub_group_size !304 {
  %8 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %9 = icmp ult i64 %8, 2147483648
  call void @llvm.assume(i1 %9)
  %10 = trunc i64 %8 to i32
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %12 = icmp ult i64 %11, 2147483648
  call void @llvm.assume(i1 %12)
  %13 = lshr i64 %11, 2
  %14 = and i64 %11, 3
  %15 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %13
  %16 = load i64, ptr addrspace(1) %15, align 8
  %17 = icmp sgt i64 %16, -1
  %18 = lshr i64 %16, 6
  %19 = trunc i64 %18 to i32
  %20 = select i1 %17, i32 %19, i32 -1
  %21 = trunc i64 %16 to i32
  %22 = and i32 %21, 63
  %23 = select i1 %17, i32 %22, i32 -1
  %24 = icmp sgt i32 %20, -1
  br i1 %24, label %25, label %29

25:                                               ; preds = %7
  %26 = zext i32 %20 to i64
  %27 = icmp sgt i64 %1, %26
  %28 = and i1 %27, %17
  br label %29

29:                                               ; preds = %25, %7
  %30 = phi i1 [ false, %7 ], [ %28, %25 ]
  %31 = shl nuw nsw i64 %13, 10, !spirv.Decorations !305
  %32 = shl nuw nsw i64 %14, 8, !spirv.Decorations !305
  %33 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %2, i64 %31
  %34 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %33, i64 %32
  br label %35

35:                                               ; preds = %42, %29
  %36 = phi i32 [ %10, %29 ], [ %50, %42 ]
  %37 = phi float [ 0.000000e+00, %29 ], [ %49, %42 ]
  %38 = icmp ult i32 %36, 256
  br i1 %38, label %42, label %39

39:                                               ; preds = %35
  %40 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 2, i32 0, float %37) #2
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %41 = fcmp reassoc nsz arcp contract oeq float %40, 0.000000e+00, !spirv.Decorations !308
  br i1 %41, label %53, label %51

42:                                               ; preds = %35
  %43 = zext i32 %36 to i64
  %44 = bitcast ptr addrspace(1) %34 to ptr addrspace(1)
  %45 = getelementptr inbounds half, ptr addrspace(1) %44, i64 %43
  %46 = load half, ptr addrspace(1) %45, align 2
  %47 = fpext half %46 to float
  %48 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %47) #0, !spirv.Decorations !308
  %49 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %37, float %48) #0, !spirv.Decorations !308
  %50 = add nuw nsw i32 %36, 32, !spirv.Decorations !305
  br label %35

51:                                               ; preds = %39
  %52 = fdiv reassoc nsz arcp contract float %40, 1.270000e+02, !spirv.Decorations !308
  br label %53

53:                                               ; preds = %51, %39
  %54 = phi float [ %52, %51 ], [ 0.000000e+00, %39 ]
  %55 = icmp eq i64 %8, 0
  %56 = and i1 %55, %30
  br i1 %56, label %57, label %65

57:                                               ; preds = %53
  %58 = sext i32 %20 to i64
  %59 = mul i64 %4, %58
  %60 = sext i32 %23 to i64
  %61 = shl nsw i64 %60, 2, !spirv.Decorations !332
  %62 = getelementptr float, ptr addrspace(1) %3, i64 %59
  %63 = getelementptr float, ptr addrspace(1) %62, i64 %61
  %64 = getelementptr float, ptr addrspace(1) %63, i64 %14
  store float %54, ptr addrspace(1) %64, align 4
  br label %65

65:                                               ; preds = %57, %53
  br i1 %30, label %66, label %94

66:                                               ; preds = %65
  %67 = fcmp reassoc nsz arcp contract oeq float %54, 0.000000e+00, !spirv.Decorations !308
  br i1 %67, label %70, label %68

68:                                               ; preds = %66
  %69 = fdiv reassoc nsz arcp contract float 1.000000e+00, %54, !spirv.Decorations !308
  br label %70

70:                                               ; preds = %68, %66
  %71 = phi float [ %69, %68 ], [ 0.000000e+00, %66 ]
  %72 = sext i32 %20 to i64
  %73 = mul i64 %6, %72
  %74 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %73
  %75 = sext i32 %23 to i64
  %76 = shl nsw i64 %75, 10, !spirv.Decorations !332
  %77 = getelementptr i8, ptr addrspace(1) %74, i64 %76
  %78 = getelementptr i8, ptr addrspace(1) %77, i64 %32
  br label %79

79:                                               ; preds = %82, %70
  %80 = phi i32 [ %10, %70 ], [ %93, %82 ]
  %81 = icmp ult i32 %80, 256
  br i1 %81, label %82, label %.loopexit

82:                                               ; preds = %79
  %83 = zext i32 %80 to i64
  %84 = bitcast ptr addrspace(1) %34 to ptr addrspace(1)
  %85 = getelementptr inbounds half, ptr addrspace(1) %84, i64 %83
  %86 = load half, ptr addrspace(1) %85, align 2
  %87 = fpext half %86 to float
  %88 = fmul reassoc nsz arcp contract float %71, %87, !spirv.Decorations !308
  %89 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %88) #0, !spirv.Decorations !308
  %90 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %89, float -1.270000e+02, float 1.270000e+02) #0, !spirv.Decorations !308
  %91 = fptosi float %90 to i8
  %92 = getelementptr inbounds i8, ptr addrspace(1) %78, i64 %83
  store i8 %91, ptr addrspace(1) %92, align 1
  %93 = add nuw nsw i32 %80, 32, !spirv.Decorations !305
  br label %79

.loopexit:                                        ; preds = %79
  br label %94

94:                                               ; preds = %.loopexit, %65
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi2EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, i64 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 1 %6, i64 %7) #0 !kernel_arg_addr_space !333 !kernel_arg_access_qual !334 !kernel_arg_type !335 !kernel_arg_type_qual !336 !kernel_arg_base_type !335 !kernel_arg_name !336 !spirv.ParameterDecorations !337 !intel_reqd_sub_group_size !304 {
  %9 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %10 = icmp ult i64 %9, 2147483648
  call void @llvm.assume(i1 %10)
  %11 = trunc i64 %9 to i32
  %12 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %13 = icmp ult i64 %12, 2147483648
  call void @llvm.assume(i1 %13)
  %14 = lshr i64 %12, 1
  %15 = and i64 %12, 1
  %16 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %14
  %17 = load i64, ptr addrspace(1) %16, align 8
  %18 = icmp sgt i64 %17, -1
  %19 = lshr i64 %17, 6
  %20 = trunc i64 %19 to i32
  %21 = select i1 %18, i32 %20, i32 -1
  %22 = icmp sgt i32 %21, -1
  br i1 %22, label %23, label %27

23:                                               ; preds = %8
  %24 = zext i32 %21 to i64
  %25 = icmp sgt i64 %1, %24
  %26 = and i1 %25, %18
  br label %27

27:                                               ; preds = %23, %8
  %28 = phi i1 [ false, %8 ], [ %26, %23 ]
  %29 = shl nuw nsw i64 %14, 9, !spirv.Decorations !305
  %30 = shl nuw nsw i64 %15, 8, !spirv.Decorations !305
  %31 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %2, i64 %29
  %32 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %31, i64 %30
  br label %33

33:                                               ; preds = %57, %27
  %34 = phi i32 [ %11, %27 ], [ %65, %57 ]
  %35 = phi float [ 0xFFF0000000000000, %27 ], [ %64, %57 ]
  %36 = phi float [ 0x7FF0000000000000, %27 ], [ %63, %57 ]
  %37 = icmp ult i32 %34, 256
  br i1 %37, label %57, label %38

38:                                               ; preds = %33
  %39 = call spir_func float @_Z17__spirv_GroupFMiniif(i32 2, i32 0, float %36) #2
  %40 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 2, i32 0, float %35) #2
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %41 = fsub reassoc nsz arcp contract float %40, %39, !spirv.Decorations !308
  %42 = fdiv reassoc nsz arcp contract float %41, 1.500000e+01, !spirv.Decorations !308
  %43 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %42, float 0x3E45798EE0000000) #0, !spirv.Decorations !308
  %44 = fneg reassoc nsz arcp contract float %39, !spirv.Decorations !308
  %45 = fdiv reassoc nsz arcp contract float %44, %43, !spirv.Decorations !308
  %46 = fadd reassoc nsz arcp contract float %45, 5.000000e-01, !spirv.Decorations !308
  %47 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %46) #0, !spirv.Decorations !308
  %48 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %47) #0, !spirv.Decorations !308
  %49 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %48) #0, !spirv.Decorations !308
  %50 = sext i32 %21 to i64
  %51 = shl i64 %17, 1
  %52 = and i64 %51, 126
  %53 = select i1 %18, i64 %52, i64 -2
  %54 = or i64 %53, %15
  %55 = icmp eq i64 %9, 0
  %56 = and i1 %55, %28
  br i1 %56, label %66, label %71

57:                                               ; preds = %33
  %58 = zext i32 %34 to i64
  %59 = bitcast ptr addrspace(1) %32 to ptr addrspace(1)
  %60 = getelementptr inbounds half, ptr addrspace(1) %59, i64 %58
  %61 = load half, ptr addrspace(1) %60, align 2
  %62 = fpext half %61 to float
  %63 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float %36, float %62) #0, !spirv.Decorations !308
  %64 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %35, float %62) #0, !spirv.Decorations !308
  %65 = add nuw nsw i32 %34, 32, !spirv.Decorations !305
  br label %33

66:                                               ; preds = %38
  %67 = mul i64 %3, %50
  %68 = add i64 %67, %54
  %69 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %68
  store float %43, ptr addrspace(1) %69, align 4
  %70 = getelementptr inbounds float, ptr addrspace(1) %5, i64 %68
  store float %49, ptr addrspace(1) %70, align 4
  br label %71

71:                                               ; preds = %66, %38
  br i1 %28, label %72, label %110

72:                                               ; preds = %71
  %73 = mul i64 %7, %50
  %74 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %73
  %75 = shl nsw i64 %54, 7, !spirv.Decorations !332
  %76 = getelementptr inbounds i8, ptr addrspace(1) %74, i64 %75
  br label %77

77:                                               ; preds = %80, %72
  %78 = phi i32 [ %11, %72 ], [ %109, %80 ]
  %79 = icmp ult i32 %78, 128
  br i1 %79, label %80, label %.loopexit

80:                                               ; preds = %77
  %81 = shl nuw nsw i32 %78, 1, !spirv.Decorations !305
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %32, i64 %82
  %84 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %83, i64 0, i32 0
  %85 = load half, ptr addrspace(1) %84, align 2
  %86 = fpext half %85 to float
  %87 = bitcast ptr addrspace(1) %83 to ptr addrspace(1)
  %88 = getelementptr half, ptr addrspace(1) %87, i64 1
  %89 = load half, ptr addrspace(1) %88, align 2
  %90 = fpext half %89 to float
  %91 = fdiv reassoc nsz arcp contract float %86, %43, !spirv.Decorations !308
  %92 = fadd reassoc nsz arcp contract float %91, %49, !spirv.Decorations !308
  %93 = fadd reassoc nsz arcp contract float %92, 5.000000e-01, !spirv.Decorations !308
  %94 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %93) #0, !spirv.Decorations !308
  %95 = fdiv reassoc nsz arcp contract float %90, %43, !spirv.Decorations !308
  %96 = fadd reassoc nsz arcp contract float %95, %49, !spirv.Decorations !308
  %97 = fadd reassoc nsz arcp contract float %96, 5.000000e-01, !spirv.Decorations !308
  %98 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %97) #0, !spirv.Decorations !308
  %99 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %94) #0, !spirv.Decorations !308
  %100 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %99) #0, !spirv.Decorations !308
  %101 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %98) #0, !spirv.Decorations !308
  %102 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %101) #0, !spirv.Decorations !308
  %103 = fptoui float %100 to i8
  %104 = fptoui float %102 to i8
  %105 = shl i8 %104, 4
  %106 = or i8 %105, %103
  %107 = zext i32 %78 to i64
  %108 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 %107
  store i8 %106, ptr addrspace(1) %108, align 1
  %109 = add nuw nsw i32 %78, 32, !spirv.Decorations !305
  br label %77

.loopexit:                                        ; preds = %77
  br label %110

110:                                              ; preds = %.loopexit, %71
  ret void
}

; Function Attrs: convergent nounwind
declare spir_func float @_Z17__spirv_GroupFMiniif(i32, i32, float) #2

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_130Xe2KvTorchAbiVstorePagedKernelILi4EEE(ptr addrspace(1) align 8 %0, i64 %1, ptr addrspace(1) align 2 %2, i64 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 1 %6, i64 %7) #0 !kernel_arg_addr_space !333 !kernel_arg_access_qual !334 !kernel_arg_type !335 !kernel_arg_type_qual !336 !kernel_arg_base_type !335 !kernel_arg_name !336 !spirv.ParameterDecorations !337 !intel_reqd_sub_group_size !304 {
  %9 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #6
  %10 = icmp ult i64 %9, 2147483648
  call void @llvm.assume(i1 %10)
  %11 = trunc i64 %9 to i32
  %12 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %13 = icmp ult i64 %12, 2147483648
  call void @llvm.assume(i1 %13)
  %14 = lshr i64 %12, 2
  %15 = and i64 %12, 3
  %16 = getelementptr inbounds i64, ptr addrspace(1) %0, i64 %14
  %17 = load i64, ptr addrspace(1) %16, align 8
  %18 = icmp sgt i64 %17, -1
  %19 = lshr i64 %17, 6
  %20 = trunc i64 %19 to i32
  %21 = select i1 %18, i32 %20, i32 -1
  %22 = icmp sgt i32 %21, -1
  br i1 %22, label %23, label %27

23:                                               ; preds = %8
  %24 = zext i32 %21 to i64
  %25 = icmp sgt i64 %1, %24
  %26 = and i1 %25, %18
  br label %27

27:                                               ; preds = %23, %8
  %28 = phi i1 [ false, %8 ], [ %26, %23 ]
  %29 = shl nuw nsw i64 %14, 10, !spirv.Decorations !305
  %30 = shl nuw nsw i64 %15, 8, !spirv.Decorations !305
  %31 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %2, i64 %29
  %32 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %31, i64 %30
  br label %33

33:                                               ; preds = %57, %27
  %34 = phi i32 [ %11, %27 ], [ %65, %57 ]
  %35 = phi float [ 0xFFF0000000000000, %27 ], [ %64, %57 ]
  %36 = phi float [ 0x7FF0000000000000, %27 ], [ %63, %57 ]
  %37 = icmp ult i32 %34, 256
  br i1 %37, label %57, label %38

38:                                               ; preds = %33
  %39 = call spir_func float @_Z17__spirv_GroupFMiniif(i32 2, i32 0, float %36) #2
  %40 = call spir_func float @_Z17__spirv_GroupFMaxiif(i32 2, i32 0, float %35) #2
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %41 = fsub reassoc nsz arcp contract float %40, %39, !spirv.Decorations !308
  %42 = fdiv reassoc nsz arcp contract float %41, 1.500000e+01, !spirv.Decorations !308
  %43 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %42, float 0x3E45798EE0000000) #0, !spirv.Decorations !308
  %44 = fneg reassoc nsz arcp contract float %39, !spirv.Decorations !308
  %45 = fdiv reassoc nsz arcp contract float %44, %43, !spirv.Decorations !308
  %46 = fadd reassoc nsz arcp contract float %45, 5.000000e-01, !spirv.Decorations !308
  %47 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %46) #0, !spirv.Decorations !308
  %48 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %47) #0, !spirv.Decorations !308
  %49 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %48) #0, !spirv.Decorations !308
  %50 = sext i32 %21 to i64
  %51 = shl i64 %17, 2
  %52 = and i64 %51, 252
  %53 = select i1 %18, i64 %52, i64 -4
  %54 = or i64 %53, %15
  %55 = icmp eq i64 %9, 0
  %56 = and i1 %55, %28
  br i1 %56, label %66, label %71

57:                                               ; preds = %33
  %58 = zext i32 %34 to i64
  %59 = bitcast ptr addrspace(1) %32 to ptr addrspace(1)
  %60 = getelementptr inbounds half, ptr addrspace(1) %59, i64 %58
  %61 = load half, ptr addrspace(1) %60, align 2
  %62 = fpext half %61 to float
  %63 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float %36, float %62) #0, !spirv.Decorations !308
  %64 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %35, float %62) #0, !spirv.Decorations !308
  %65 = add nuw nsw i32 %34, 32, !spirv.Decorations !305
  br label %33

66:                                               ; preds = %38
  %67 = mul i64 %3, %50
  %68 = add i64 %67, %54
  %69 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %68
  store float %43, ptr addrspace(1) %69, align 4
  %70 = getelementptr inbounds float, ptr addrspace(1) %5, i64 %68
  store float %49, ptr addrspace(1) %70, align 4
  br label %71

71:                                               ; preds = %66, %38
  br i1 %28, label %72, label %110

72:                                               ; preds = %71
  %73 = mul i64 %7, %50
  %74 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %73
  %75 = shl nsw i64 %54, 7, !spirv.Decorations !332
  %76 = getelementptr inbounds i8, ptr addrspace(1) %74, i64 %75
  br label %77

77:                                               ; preds = %80, %72
  %78 = phi i32 [ %11, %72 ], [ %109, %80 ]
  %79 = icmp ult i32 %78, 128
  br i1 %79, label %80, label %.loopexit

80:                                               ; preds = %77
  %81 = shl nuw nsw i32 %78, 1, !spirv.Decorations !305
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %32, i64 %82
  %84 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %83, i64 0, i32 0
  %85 = load half, ptr addrspace(1) %84, align 2
  %86 = fpext half %85 to float
  %87 = bitcast ptr addrspace(1) %83 to ptr addrspace(1)
  %88 = getelementptr half, ptr addrspace(1) %87, i64 1
  %89 = load half, ptr addrspace(1) %88, align 2
  %90 = fpext half %89 to float
  %91 = fdiv reassoc nsz arcp contract float %86, %43, !spirv.Decorations !308
  %92 = fadd reassoc nsz arcp contract float %91, %49, !spirv.Decorations !308
  %93 = fadd reassoc nsz arcp contract float %92, 5.000000e-01, !spirv.Decorations !308
  %94 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %93) #0, !spirv.Decorations !308
  %95 = fdiv reassoc nsz arcp contract float %90, %43, !spirv.Decorations !308
  %96 = fadd reassoc nsz arcp contract float %95, %49, !spirv.Decorations !308
  %97 = fadd reassoc nsz arcp contract float %96, 5.000000e-01, !spirv.Decorations !308
  %98 = call reassoc nsz arcp contract spir_func float @_Z17__spirv_ocl_floorf(float %97) #0, !spirv.Decorations !308
  %99 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %94) #0, !spirv.Decorations !308
  %100 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %99) #0, !spirv.Decorations !308
  %101 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fminff(float 1.500000e+01, float %98) #0, !spirv.Decorations !308
  %102 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float 0.000000e+00, float %101) #0, !spirv.Decorations !308
  %103 = fptoui float %100 to i8
  %104 = fptoui float %102 to i8
  %105 = shl i8 %104, 4
  %106 = or i8 %105, %103
  %107 = zext i32 %78 to i64
  %108 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 %107
  store i8 %106, ptr addrspace(1) %108, align 1
  %109 = add nuw nsw i32 %78, 32, !spirv.Decorations !305
  br label %77

.loopexit:                                        ; preds = %77
  br label %110

110:                                              ; preds = %.loopexit, %71
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !339 !kernel_arg_type_qual !328 !kernel_arg_base_type !339 !kernel_arg_name !328 !spirv.ParameterDecorations !340 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !330
  %10 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %11 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %12 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %13 = icmp sgt i32 %12, -1
  call void @llvm.assume(i1 %13)
  %14 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %15 = icmp sgt i32 %14, -1
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %17 = icmp ult i64 %16, 2147483648
  call void @llvm.assume(i1 %17)
  %18 = trunc i64 %16 to i32
  %19 = udiv i32 %18, 12
  %20 = mul nsw i32 %19, -12, !spirv.Decorations !332
  %21 = add nsw i32 %20, %18, !spirv.Decorations !332
  %22 = sdiv i32 %21, 6
  %23 = mul nuw nsw i32 %19, 6, !spirv.Decorations !305
  %24 = mul nsw i32 %22, -6, !spirv.Decorations !332
  %25 = add nsw i32 %24, %21, !spirv.Decorations !332
  %26 = add nsw i32 %23, %25, !spirv.Decorations !332
  %27 = mul nsw i32 %22, %0, !spirv.Decorations !332
  %28 = load i32, ptr addrspace(1) %1, align 4
  %29 = sext i32 %28 to i64
  %30 = sext i32 %0 to i64
  %31 = add nsw i64 %29, 63, !spirv.Decorations !332
  %32 = sdiv i64 %31, 64
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %30, i64 %32) #0
  %34 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %33) #0
  %35 = trunc i64 %34 to i32
  %36 = add nsw i32 %35, 7, !spirv.Decorations !332
  %37 = sdiv i32 %36, 8
  %38 = mul nsw i32 %37, %12, !spirv.Decorations !332
  %39 = add nsw i32 %38, %37, !spirv.Decorations !332
  %40 = icmp slt i32 %39, %35
  %41 = select i1 %40, i32 %39, i32 %35
  %42 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %42)
  br label %43

43:                                               ; preds = %49, %7
  %44 = phi i32 [ 0, %7 ], [ %52, %49 ]
  %45 = icmp ult i32 %44, 4
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %47)
  %48 = icmp slt i32 %38, %41
  br i1 %48, label %55, label %96

49:                                               ; preds = %43
  %50 = zext i32 %44 to i64
  %51 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %50
  %52 = add nuw nsw i32 %44, 1, !spirv.Decorations !305
  %53 = bitcast ptr %51 to ptr
  %54 = bitcast ptr addrspace(2) @gVar to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %53, ptr addrspace(2) align 16 %54, i64 16, i1 false)
  br label %43, !llvm.loop !342

55:                                               ; preds = %46
  %56 = add nsw i32 %27, %38, !spirv.Decorations !332
  %57 = sext i32 %56 to i64
  %58 = shl nsw i64 %57, 6, !spirv.Decorations !332
  %59 = sext i32 %26 to i64
  %60 = add nsw i64 %58, %59, !spirv.Decorations !332
  %61 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4
  %63 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %60
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %66 = shl nsw i64 %60, 8, !spirv.Decorations !332
  %67 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %66
  br label %68

68:                                               ; preds = %94, %55
  %69 = phi i32 [ 0, %55 ], [ %95, %94 ]
  %70 = icmp ult i32 %69, 4
  br i1 %70, label %71, label %.loopexit2

71:                                               ; preds = %68
  %72 = shl nuw nsw i32 %69, 6, !spirv.Decorations !305
  %73 = add nuw nsw i32 %72, %65, !spirv.Decorations !305
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %74
  %76 = zext i32 %73 to i64
  %77 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %67, i64 %76
  %78 = addrspacecast ptr addrspace(1) %77 to ptr addrspace(4)
  %79 = bitcast ptr addrspace(4) %78 to ptr addrspace(4)
  %80 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %79, i32 5) #0
  br label %81

81:                                               ; preds = %84, %71
  %82 = phi i32 [ 0, %71 ], [ %93, %84 ]
  %83 = icmp ult i32 %82, 4
  br i1 %83, label %84, label %94

84:                                               ; preds = %81
  %85 = zext i32 %82 to i64
  %86 = bitcast ptr addrspace(1) %80 to ptr addrspace(1)
  %87 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %86, i64 %85
  %88 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %87, i64 0, i32 0
  %89 = bitcast ptr %75 to ptr
  %90 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %89, i64 0, i32 0, i64 %85
  %91 = load half, ptr addrspace(1) %88, align 2
  %92 = bitcast ptr %90 to ptr
  store half %91, ptr %92, align 2
  %93 = add nuw nsw i32 %82, 1, !spirv.Decorations !305
  br label %81

94:                                               ; preds = %81
  %95 = add nuw nsw i32 %69, 1, !spirv.Decorations !305
  br label %68, !llvm.loop !343

.loopexit2:                                       ; preds = %68
  br label %96

96:                                               ; preds = %.loopexit2, %46
  %97 = phi float [ 0.000000e+00, %46 ], [ %64, %.loopexit2 ]
  %98 = phi float [ 0xFFF0000000000000, %46 ], [ %62, %.loopexit2 ]
  %99 = add i32 %27, 1
  %100 = sext i32 %26 to i64
  %101 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %102

102:                                              ; preds = %196, %96
  %103 = phi i32 [ %38, %96 ], [ %118, %196 ]
  %104 = phi float [ %97, %96 ], [ %169, %196 ]
  %105 = phi float [ %98, %96 ], [ %170, %196 ]
  %106 = phi float [ 0.000000e+00, %96 ], [ %188, %196 ]
  %107 = phi float [ 0xFFF0000000000000, %96 ], [ %171, %196 ]
  %108 = icmp slt i32 %103, %41
  br i1 %108, label %112, label %109

109:                                              ; preds = %102
  %110 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %110)
  %111 = icmp eq i32 %14, 0
  br i1 %111, label %211, label %215

112:                                              ; preds = %102
  %113 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %113)
  br label %114

114:                                              ; preds = %120, %112
  %115 = phi i32 [ 0, %112 ], [ %128, %120 ]
  %116 = icmp ult i32 %115, 4
  br i1 %116, label %120, label %117

117:                                              ; preds = %114
  %118 = add nsw i32 %103, 1, !spirv.Decorations !332
  %119 = icmp slt i32 %118, %41
  br i1 %119, label %129, label %168

120:                                              ; preds = %114
  %121 = zext i32 %115 to i64
  %122 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %121
  %123 = bitcast ptr %122 to ptr
  %124 = load <4 x half>, ptr %123, align 8, !noalias !344
  %125 = call spir_func <4 x float> @_Z28__spirv_FConvert_Rfloat4_rteDv4_Dh(<4 x half> %124) #0, !spirv.Decorations !347
  %126 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %121
  %127 = bitcast ptr %126 to ptr
  store <4 x float> %125, ptr %127, align 16
  %128 = add nuw nsw i32 %115, 1, !spirv.Decorations !305
  br label %114, !llvm.loop !349

129:                                              ; preds = %117
  %130 = add i32 %103, %99
  %131 = sext i32 %130 to i64
  %132 = shl nsw i64 %131, 6, !spirv.Decorations !332
  %133 = add nsw i64 %132, %100, !spirv.Decorations !332
  %134 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %133
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = shl nsw i64 %133, 8, !spirv.Decorations !332
  %139 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %138
  br label %140

140:                                              ; preds = %166, %129
  %141 = phi i32 [ 0, %129 ], [ %167, %166 ]
  %142 = icmp ult i32 %141, 4
  br i1 %142, label %143, label %.loopexit1

143:                                              ; preds = %140
  %144 = shl nuw nsw i32 %141, 6, !spirv.Decorations !305
  %145 = add nuw nsw i32 %144, %101, !spirv.Decorations !305
  %146 = zext i32 %141 to i64
  %147 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %146
  %148 = zext i32 %145 to i64
  %149 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %139, i64 %148
  %150 = addrspacecast ptr addrspace(1) %149 to ptr addrspace(4)
  %151 = bitcast ptr addrspace(4) %150 to ptr addrspace(4)
  %152 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %151, i32 5) #0
  br label %153

153:                                              ; preds = %156, %143
  %154 = phi i32 [ 0, %143 ], [ %165, %156 ]
  %155 = icmp ult i32 %154, 4
  br i1 %155, label %156, label %166

156:                                              ; preds = %153
  %157 = zext i32 %154 to i64
  %158 = bitcast ptr addrspace(1) %152 to ptr addrspace(1)
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %158, i64 %157
  %160 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %159, i64 0, i32 0
  %161 = bitcast ptr %147 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %161, i64 0, i32 0, i64 %157
  %163 = load half, ptr addrspace(1) %160, align 2
  %164 = bitcast ptr %162 to ptr
  store half %163, ptr %164, align 2
  %165 = add nuw nsw i32 %154, 1, !spirv.Decorations !305
  br label %153

166:                                              ; preds = %153
  %167 = add nuw nsw i32 %141, 1, !spirv.Decorations !305
  br label %140, !llvm.loop !350

.loopexit1:                                       ; preds = %140
  br label %168

168:                                              ; preds = %.loopexit1, %117
  %169 = phi float [ %104, %117 ], [ %137, %.loopexit1 ]
  %170 = phi float [ %105, %117 ], [ %135, %.loopexit1 ]
  %171 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %107, float %105) #0, !spirv.Decorations !308
  %172 = fcmp reassoc nsz arcp contract oeq float %107, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %172, label %176, label %173

173:                                              ; preds = %168
  %174 = fsub reassoc nsz arcp contract float %107, %171, !spirv.Decorations !308
  %175 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %174) #0, !spirv.Decorations !308
  br label %176

176:                                              ; preds = %173, %168
  %177 = phi float [ %175, %173 ], [ 0.000000e+00, %168 ]
  %178 = fcmp reassoc nsz arcp contract oeq float %105, 0xFFF0000000000000, !spirv.Decorations !308
  %179 = fcmp reassoc nsz arcp contract oeq float %171, 0xFFF0000000000000, !spirv.Decorations !308
  %180 = or i1 %178, %179
  br i1 %180, label %184, label %181

181:                                              ; preds = %176
  %182 = fsub reassoc nsz arcp contract float %105, %171, !spirv.Decorations !308
  %183 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %182) #0, !spirv.Decorations !308
  br label %184

184:                                              ; preds = %181, %176
  %185 = phi float [ %183, %181 ], [ 0.000000e+00, %176 ]
  %186 = fmul reassoc nsz arcp contract float %185, %104, !spirv.Decorations !308
  %187 = fmul reassoc nsz arcp contract float %106, %177, !spirv.Decorations !308
  %188 = fadd reassoc nsz arcp contract float %187, %186, !spirv.Decorations !308
  %189 = insertelement <4 x float> undef, float %177, i32 0
  %190 = shufflevector <4 x float> %189, <4 x float> undef, <4 x i32> zeroinitializer
  %191 = insertelement <4 x float> undef, float %186, i32 0
  %192 = shufflevector <4 x float> %191, <4 x float> undef, <4 x i32> zeroinitializer
  br label %193

193:                                              ; preds = %198, %184
  %194 = phi i32 [ 0, %184 ], [ %210, %198 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  %197 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %197)
  br label %102

198:                                              ; preds = %193
  %199 = zext i32 %194 to i64
  %200 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %199
  %201 = bitcast ptr %200 to ptr
  %202 = load <4 x float>, ptr %201, align 16, !noalias !351
  %203 = fmul reassoc nsz arcp contract <4 x float> %202, %190, !spirv.Decorations !308
  %204 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %199
  %205 = bitcast ptr %204 to ptr
  %206 = load <4 x float>, ptr %205, align 16, !noalias !360
  %207 = fmul reassoc nsz arcp contract <4 x float> %192, %206, !spirv.Decorations !308
  %208 = fadd reassoc nsz arcp contract <4 x float> %203, %207, !spirv.Decorations !308
  %209 = bitcast ptr %200 to ptr
  store <4 x float> %208, ptr %209, align 16
  %210 = add nuw nsw i32 %194, 1, !spirv.Decorations !305
  br label %193, !llvm.loop !369

211:                                              ; preds = %109
  %212 = zext i32 %12 to i64
  %213 = getelementptr float, ptr addrspace(3) %5, i64 %212
  store float %107, ptr addrspace(3) %213, align 4
  %214 = getelementptr float, ptr addrspace(3) %213, i64 8
  store float %106, ptr addrspace(3) %214, align 4
  br label %215

215:                                              ; preds = %211, %109
  %216 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %217 = shl nsw i32 %12, 8, !spirv.Decorations !332
  %218 = or i32 %217, 16
  %219 = add nuw nsw i32 %216, %218, !spirv.Decorations !305
  br label %220

220:                                              ; preds = %233, %215
  %221 = phi i32 [ 0, %215 ], [ %234, %233 ]
  %222 = icmp ult i32 %221, 4
  br i1 %222, label %225, label %223

223:                                              ; preds = %220
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %224 = icmp eq i32 %12, 0
  br i1 %224, label %.preheader, label %362

.preheader:                                       ; preds = %223
  br label %244

225:                                              ; preds = %220
  %226 = shl nuw nsw i32 %221, 6, !spirv.Decorations !305
  %227 = sext i32 %221 to i64
  %228 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %227
  %229 = add nuw nsw i32 %226, %219, !spirv.Decorations !305
  br label %230

230:                                              ; preds = %235, %225
  %231 = phi i32 [ 0, %225 ], [ %243, %235 ]
  %232 = icmp ult i32 %231, 4
  br i1 %232, label %235, label %233

233:                                              ; preds = %230
  %234 = add nuw nsw i32 %221, 1, !spirv.Decorations !305
  br label %220, !llvm.loop !370

235:                                              ; preds = %230
  %236 = zext i32 %231 to i64
  %237 = bitcast ptr %228 to ptr
  %238 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %237, i64 0, i32 0, i64 %236
  %239 = load float, ptr %238, align 4
  %240 = or i32 %229, %231
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %241
  store float %239, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %231, 1, !spirv.Decorations !305
  br label %230, !llvm.loop !371

244:                                              ; preds = %250, %.preheader
  %245 = phi i32 [ %253, %250 ], [ 0, %.preheader ]
  %246 = icmp ult i32 %245, 4
  br i1 %246, label %250, label %247

247:                                              ; preds = %244
  %248 = getelementptr inbounds float, ptr addrspace(3) %5, i64 8
  %249 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %256

250:                                              ; preds = %244
  %251 = zext i32 %245 to i64
  %252 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %251
  %253 = add nuw nsw i32 %245, 1, !spirv.Decorations !305
  %254 = bitcast ptr %252 to ptr
  %255 = bitcast ptr addrspace(2) @gVar.190 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %254, ptr addrspace(2) align 16 %255, i64 16, i1 false)
  br label %244, !llvm.loop !372

256:                                              ; preds = %306, %247
  %257 = phi i32 [ %307, %306 ], [ 0, %247 ]
  %258 = phi float [ %295, %306 ], [ 0.000000e+00, %247 ]
  %259 = phi float [ %278, %306 ], [ 0xFFF0000000000000, %247 ]
  %260 = icmp ult i32 %257, 8
  br i1 %260, label %271, label %261

261:                                              ; preds = %256
  %262 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %258, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %263 = fdiv reassoc nsz arcp contract float 1.000000e+00, %262, !spirv.Decorations !308
  %264 = mul nuw i32 %19, 12, !spirv.Decorations !373
  %265 = zext i32 %264 to i64
  %266 = sext i32 %21 to i64
  %267 = add nsw i64 %265, %266, !spirv.Decorations !332
  %268 = shl nsw i64 %267, 8, !spirv.Decorations !332
  %269 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %268
  %270 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %337

271:                                              ; preds = %256
  %272 = zext i32 %257 to i64
  %273 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %272
  %274 = load float, ptr addrspace(3) %273, align 4
  %275 = zext i32 %257 to i64
  %276 = getelementptr inbounds float, ptr addrspace(3) %248, i64 %275
  %277 = load float, ptr addrspace(3) %276, align 4
  %278 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %259, float %274) #0, !spirv.Decorations !308
  %279 = fcmp reassoc nsz arcp contract oeq float %259, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %279, label %283, label %280

280:                                              ; preds = %271
  %281 = fsub reassoc nsz arcp contract float %259, %278, !spirv.Decorations !308
  %282 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %281) #0, !spirv.Decorations !308
  br label %283

283:                                              ; preds = %280, %271
  %284 = phi float [ %282, %280 ], [ 0.000000e+00, %271 ]
  %285 = fcmp reassoc nsz arcp contract oeq float %274, 0xFFF0000000000000, !spirv.Decorations !308
  %286 = fcmp reassoc nsz arcp contract oeq float %278, 0xFFF0000000000000, !spirv.Decorations !308
  %287 = or i1 %285, %286
  br i1 %287, label %291, label %288

288:                                              ; preds = %283
  %289 = fsub reassoc nsz arcp contract float %274, %278, !spirv.Decorations !308
  %290 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %289) #0, !spirv.Decorations !308
  br label %291

291:                                              ; preds = %288, %283
  %292 = phi float [ %290, %288 ], [ 0.000000e+00, %283 ]
  %293 = fmul reassoc nsz arcp contract float %258, %284, !spirv.Decorations !308
  %294 = fmul reassoc nsz arcp contract float %292, %277, !spirv.Decorations !308
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !308
  %296 = shl nuw nsw i32 %257, 8, !spirv.Decorations !305
  %297 = or i32 %296, 16
  %298 = add nuw nsw i32 %249, %297, !spirv.Decorations !305
  %299 = insertelement <4 x float> undef, float %284, i32 0
  %300 = shufflevector <4 x float> %299, <4 x float> undef, <4 x i32> zeroinitializer
  %301 = insertelement <4 x float> undef, float %292, i32 0
  %302 = shufflevector <4 x float> %301, <4 x float> undef, <4 x i32> zeroinitializer
  br label %303

303:                                              ; preds = %315, %291
  %304 = phi i32 [ 0, %291 ], [ %327, %315 ]
  %305 = icmp ult i32 %304, 4
  br i1 %305, label %308, label %306

306:                                              ; preds = %303
  %307 = add nuw nsw i32 %257, 1, !spirv.Decorations !305
  br label %256

308:                                              ; preds = %303
  %309 = shl nuw nsw i32 %304, 6, !spirv.Decorations !305
  %310 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %310)
  %311 = add nuw nsw i32 %309, %298, !spirv.Decorations !305
  br label %312

312:                                              ; preds = %328, %308
  %313 = phi i32 [ 0, %308 ], [ %336, %328 ]
  %314 = icmp ult i32 %313, 4
  br i1 %314, label %328, label %315

315:                                              ; preds = %312
  %316 = sext i32 %304 to i64
  %317 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %316
  %318 = bitcast ptr %317 to ptr
  %319 = load <4 x float>, ptr %318, align 16, !noalias !374
  %320 = fmul reassoc nsz arcp contract <4 x float> %319, %300, !spirv.Decorations !308
  %321 = bitcast ptr %11 to ptr
  %322 = load <4 x float>, ptr %321, align 16, !noalias !383
  %323 = fmul reassoc nsz arcp contract <4 x float> %302, %322, !spirv.Decorations !308
  %324 = fadd reassoc nsz arcp contract <4 x float> %320, %323, !spirv.Decorations !308
  %325 = bitcast ptr %317 to ptr
  store <4 x float> %324, ptr %325, align 16
  %326 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %326)
  %327 = add nuw nsw i32 %304, 1, !spirv.Decorations !305
  br label %303, !llvm.loop !392

328:                                              ; preds = %312
  %329 = or i32 %311, %313
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %330
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = zext i32 %313 to i64
  %334 = bitcast ptr %11 to ptr
  %335 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %334, i64 0, i32 0, i64 %333
  store float %332, ptr %335, align 4
  %336 = add nuw nsw i32 %313, 1, !spirv.Decorations !305
  br label %312, !llvm.loop !393

337:                                              ; preds = %348, %261
  %338 = phi i32 [ 0, %261 ], [ %349, %348 ]
  %339 = icmp ult i32 %338, 4
  br i1 %339, label %340, label %.loopexit

340:                                              ; preds = %337
  %341 = shl nuw nsw i32 %338, 6, !spirv.Decorations !305
  %342 = add nuw nsw i32 %341, %270, !spirv.Decorations !305
  %343 = sext i32 %338 to i64
  %344 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %343
  br label %345

345:                                              ; preds = %350, %340
  %346 = phi i32 [ 0, %340 ], [ %361, %350 ]
  %347 = icmp ult i32 %346, 4
  br i1 %347, label %350, label %348

348:                                              ; preds = %345
  %349 = add nuw nsw i32 %338, 1, !spirv.Decorations !305
  br label %337, !llvm.loop !394

350:                                              ; preds = %345
  %351 = zext i32 %346 to i64
  %352 = bitcast ptr %344 to ptr
  %353 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %352, i64 0, i32 0, i64 %351
  %354 = load float, ptr %353, align 4
  %355 = fmul reassoc nsz arcp contract float %354, %263, !spirv.Decorations !308
  %356 = fptrunc float %355 to half
  %357 = or i32 %342, %346
  %358 = sext i32 %357 to i64
  %359 = bitcast ptr addrspace(1) %269 to ptr addrspace(1)
  %360 = getelementptr inbounds half, ptr addrspace(1) %359, i64 %358
  store half %356, ptr addrspace(1) %360, align 2
  %361 = add nuw nsw i32 %346, 1, !spirv.Decorations !305
  br label %345, !llvm.loop !395

.loopexit:                                        ; preds = %337
  br label %362

362:                                              ; preds = %.loopexit, %223
  %363 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %363)
  ret void
}

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_minll(i64, i64) #0

; Function Attrs: nounwind
declare spir_func i64 @_Z17__spirv_ocl_s_maxll(i64, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p2.i64(ptr noalias nocapture writeonly, ptr addrspace(2) noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4), i32) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nounwind
declare spir_func <4 x float> @_Z28__spirv_FConvert_Rfloat4_rteDv4_Dh(<4 x half>) #0

; Function Attrs: nounwind
declare spir_func float @_Z23__spirv_ocl_fmax_commonff(float, float) #0

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z15__spirv_ocl_expf(float) #3

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !339 !kernel_arg_type_qual !328 !kernel_arg_base_type !339 !kernel_arg_name !328 !spirv.ParameterDecorations !340 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !330
  %10 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %11 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %12 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %13 = icmp sgt i32 %12, -1
  call void @llvm.assume(i1 %13)
  %14 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %15 = icmp sgt i32 %14, -1
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %17 = icmp ult i64 %16, 2147483648
  call void @llvm.assume(i1 %17)
  %18 = trunc i64 %16 to i32
  %19 = udiv i32 %18, 12
  %20 = mul nsw i32 %19, -12, !spirv.Decorations !332
  %21 = add nsw i32 %20, %18, !spirv.Decorations !332
  %22 = sdiv i32 %21, 6
  %23 = mul nuw nsw i32 %19, 6, !spirv.Decorations !305
  %24 = mul nsw i32 %22, -6, !spirv.Decorations !332
  %25 = add nsw i32 %24, %21, !spirv.Decorations !332
  %26 = add nsw i32 %23, %25, !spirv.Decorations !332
  %27 = mul nsw i32 %22, %0, !spirv.Decorations !332
  %28 = load i32, ptr addrspace(1) %1, align 4
  %29 = sext i32 %28 to i64
  %30 = sext i32 %0 to i64
  %31 = add nsw i64 %29, 63, !spirv.Decorations !332
  %32 = sdiv i64 %31, 64
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %30, i64 %32) #0
  %34 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %33) #0
  %35 = trunc i64 %34 to i32
  %36 = add nsw i32 %35, 15, !spirv.Decorations !332
  %37 = sdiv i32 %36, 16
  %38 = mul nsw i32 %37, %12, !spirv.Decorations !332
  %39 = add nsw i32 %38, %37, !spirv.Decorations !332
  %40 = icmp slt i32 %39, %35
  %41 = select i1 %40, i32 %39, i32 %35
  %42 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %42)
  br label %43

43:                                               ; preds = %49, %7
  %44 = phi i32 [ 0, %7 ], [ %52, %49 ]
  %45 = icmp ult i32 %44, 4
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %47)
  %48 = icmp slt i32 %38, %41
  br i1 %48, label %55, label %96

49:                                               ; preds = %43
  %50 = zext i32 %44 to i64
  %51 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %50
  %52 = add nuw nsw i32 %44, 1, !spirv.Decorations !305
  %53 = bitcast ptr %51 to ptr
  %54 = bitcast ptr addrspace(2) @gVar.191 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %53, ptr addrspace(2) align 16 %54, i64 16, i1 false)
  br label %43, !llvm.loop !396

55:                                               ; preds = %46
  %56 = add nsw i32 %27, %38, !spirv.Decorations !332
  %57 = sext i32 %56 to i64
  %58 = shl nsw i64 %57, 6, !spirv.Decorations !332
  %59 = sext i32 %26 to i64
  %60 = add nsw i64 %58, %59, !spirv.Decorations !332
  %61 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4
  %63 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %60
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %66 = shl nsw i64 %60, 8, !spirv.Decorations !332
  %67 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %66
  br label %68

68:                                               ; preds = %94, %55
  %69 = phi i32 [ 0, %55 ], [ %95, %94 ]
  %70 = icmp ult i32 %69, 4
  br i1 %70, label %71, label %.loopexit2

71:                                               ; preds = %68
  %72 = shl nuw nsw i32 %69, 6, !spirv.Decorations !305
  %73 = add nuw nsw i32 %72, %65, !spirv.Decorations !305
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %74
  %76 = zext i32 %73 to i64
  %77 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %67, i64 %76
  %78 = addrspacecast ptr addrspace(1) %77 to ptr addrspace(4)
  %79 = bitcast ptr addrspace(4) %78 to ptr addrspace(4)
  %80 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %79, i32 5) #0
  br label %81

81:                                               ; preds = %84, %71
  %82 = phi i32 [ 0, %71 ], [ %93, %84 ]
  %83 = icmp ult i32 %82, 4
  br i1 %83, label %84, label %94

84:                                               ; preds = %81
  %85 = zext i32 %82 to i64
  %86 = bitcast ptr addrspace(1) %80 to ptr addrspace(1)
  %87 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %86, i64 %85
  %88 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %87, i64 0, i32 0
  %89 = bitcast ptr %75 to ptr
  %90 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %89, i64 0, i32 0, i64 %85
  %91 = load half, ptr addrspace(1) %88, align 2
  %92 = bitcast ptr %90 to ptr
  store half %91, ptr %92, align 2
  %93 = add nuw nsw i32 %82, 1, !spirv.Decorations !305
  br label %81

94:                                               ; preds = %81
  %95 = add nuw nsw i32 %69, 1, !spirv.Decorations !305
  br label %68, !llvm.loop !397

.loopexit2:                                       ; preds = %68
  br label %96

96:                                               ; preds = %.loopexit2, %46
  %97 = phi float [ 0.000000e+00, %46 ], [ %64, %.loopexit2 ]
  %98 = phi float [ 0xFFF0000000000000, %46 ], [ %62, %.loopexit2 ]
  %99 = add i32 %27, 1
  %100 = sext i32 %26 to i64
  %101 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %102

102:                                              ; preds = %196, %96
  %103 = phi i32 [ %38, %96 ], [ %118, %196 ]
  %104 = phi float [ %97, %96 ], [ %169, %196 ]
  %105 = phi float [ %98, %96 ], [ %170, %196 ]
  %106 = phi float [ 0.000000e+00, %96 ], [ %188, %196 ]
  %107 = phi float [ 0xFFF0000000000000, %96 ], [ %171, %196 ]
  %108 = icmp slt i32 %103, %41
  br i1 %108, label %112, label %109

109:                                              ; preds = %102
  %110 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %110)
  %111 = icmp eq i32 %14, 0
  br i1 %111, label %211, label %215

112:                                              ; preds = %102
  %113 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %113)
  br label %114

114:                                              ; preds = %120, %112
  %115 = phi i32 [ 0, %112 ], [ %128, %120 ]
  %116 = icmp ult i32 %115, 4
  br i1 %116, label %120, label %117

117:                                              ; preds = %114
  %118 = add nsw i32 %103, 1, !spirv.Decorations !332
  %119 = icmp slt i32 %118, %41
  br i1 %119, label %129, label %168

120:                                              ; preds = %114
  %121 = zext i32 %115 to i64
  %122 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %121
  %123 = bitcast ptr %122 to ptr
  %124 = load <4 x half>, ptr %123, align 8, !noalias !398
  %125 = call spir_func <4 x float> @_Z28__spirv_FConvert_Rfloat4_rteDv4_Dh(<4 x half> %124) #0, !spirv.Decorations !347
  %126 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %121
  %127 = bitcast ptr %126 to ptr
  store <4 x float> %125, ptr %127, align 16
  %128 = add nuw nsw i32 %115, 1, !spirv.Decorations !305
  br label %114, !llvm.loop !401

129:                                              ; preds = %117
  %130 = add i32 %103, %99
  %131 = sext i32 %130 to i64
  %132 = shl nsw i64 %131, 6, !spirv.Decorations !332
  %133 = add nsw i64 %132, %100, !spirv.Decorations !332
  %134 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %133
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = shl nsw i64 %133, 8, !spirv.Decorations !332
  %139 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %138
  br label %140

140:                                              ; preds = %166, %129
  %141 = phi i32 [ 0, %129 ], [ %167, %166 ]
  %142 = icmp ult i32 %141, 4
  br i1 %142, label %143, label %.loopexit1

143:                                              ; preds = %140
  %144 = shl nuw nsw i32 %141, 6, !spirv.Decorations !305
  %145 = add nuw nsw i32 %144, %101, !spirv.Decorations !305
  %146 = zext i32 %141 to i64
  %147 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %146
  %148 = zext i32 %145 to i64
  %149 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %139, i64 %148
  %150 = addrspacecast ptr addrspace(1) %149 to ptr addrspace(4)
  %151 = bitcast ptr addrspace(4) %150 to ptr addrspace(4)
  %152 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %151, i32 5) #0
  br label %153

153:                                              ; preds = %156, %143
  %154 = phi i32 [ 0, %143 ], [ %165, %156 ]
  %155 = icmp ult i32 %154, 4
  br i1 %155, label %156, label %166

156:                                              ; preds = %153
  %157 = zext i32 %154 to i64
  %158 = bitcast ptr addrspace(1) %152 to ptr addrspace(1)
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %158, i64 %157
  %160 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %159, i64 0, i32 0
  %161 = bitcast ptr %147 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %161, i64 0, i32 0, i64 %157
  %163 = load half, ptr addrspace(1) %160, align 2
  %164 = bitcast ptr %162 to ptr
  store half %163, ptr %164, align 2
  %165 = add nuw nsw i32 %154, 1, !spirv.Decorations !305
  br label %153

166:                                              ; preds = %153
  %167 = add nuw nsw i32 %141, 1, !spirv.Decorations !305
  br label %140, !llvm.loop !402

.loopexit1:                                       ; preds = %140
  br label %168

168:                                              ; preds = %.loopexit1, %117
  %169 = phi float [ %104, %117 ], [ %137, %.loopexit1 ]
  %170 = phi float [ %105, %117 ], [ %135, %.loopexit1 ]
  %171 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %107, float %105) #0, !spirv.Decorations !308
  %172 = fcmp reassoc nsz arcp contract oeq float %107, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %172, label %176, label %173

173:                                              ; preds = %168
  %174 = fsub reassoc nsz arcp contract float %107, %171, !spirv.Decorations !308
  %175 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %174) #0, !spirv.Decorations !308
  br label %176

176:                                              ; preds = %173, %168
  %177 = phi float [ %175, %173 ], [ 0.000000e+00, %168 ]
  %178 = fcmp reassoc nsz arcp contract oeq float %105, 0xFFF0000000000000, !spirv.Decorations !308
  %179 = fcmp reassoc nsz arcp contract oeq float %171, 0xFFF0000000000000, !spirv.Decorations !308
  %180 = or i1 %178, %179
  br i1 %180, label %184, label %181

181:                                              ; preds = %176
  %182 = fsub reassoc nsz arcp contract float %105, %171, !spirv.Decorations !308
  %183 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %182) #0, !spirv.Decorations !308
  br label %184

184:                                              ; preds = %181, %176
  %185 = phi float [ %183, %181 ], [ 0.000000e+00, %176 ]
  %186 = fmul reassoc nsz arcp contract float %185, %104, !spirv.Decorations !308
  %187 = fmul reassoc nsz arcp contract float %106, %177, !spirv.Decorations !308
  %188 = fadd reassoc nsz arcp contract float %187, %186, !spirv.Decorations !308
  %189 = insertelement <4 x float> undef, float %177, i32 0
  %190 = shufflevector <4 x float> %189, <4 x float> undef, <4 x i32> zeroinitializer
  %191 = insertelement <4 x float> undef, float %186, i32 0
  %192 = shufflevector <4 x float> %191, <4 x float> undef, <4 x i32> zeroinitializer
  br label %193

193:                                              ; preds = %198, %184
  %194 = phi i32 [ 0, %184 ], [ %210, %198 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  %197 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %197)
  br label %102

198:                                              ; preds = %193
  %199 = zext i32 %194 to i64
  %200 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %199
  %201 = bitcast ptr %200 to ptr
  %202 = load <4 x float>, ptr %201, align 16, !noalias !403
  %203 = fmul reassoc nsz arcp contract <4 x float> %202, %190, !spirv.Decorations !308
  %204 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %199
  %205 = bitcast ptr %204 to ptr
  %206 = load <4 x float>, ptr %205, align 16, !noalias !412
  %207 = fmul reassoc nsz arcp contract <4 x float> %192, %206, !spirv.Decorations !308
  %208 = fadd reassoc nsz arcp contract <4 x float> %203, %207, !spirv.Decorations !308
  %209 = bitcast ptr %200 to ptr
  store <4 x float> %208, ptr %209, align 16
  %210 = add nuw nsw i32 %194, 1, !spirv.Decorations !305
  br label %193, !llvm.loop !421

211:                                              ; preds = %109
  %212 = zext i32 %12 to i64
  %213 = getelementptr float, ptr addrspace(3) %5, i64 %212
  store float %107, ptr addrspace(3) %213, align 4
  %214 = getelementptr float, ptr addrspace(3) %213, i64 16
  store float %106, ptr addrspace(3) %214, align 4
  br label %215

215:                                              ; preds = %211, %109
  %216 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %217 = shl nsw i32 %12, 8, !spirv.Decorations !332
  %218 = or i32 %217, 32
  %219 = add nuw nsw i32 %216, %218, !spirv.Decorations !305
  br label %220

220:                                              ; preds = %233, %215
  %221 = phi i32 [ 0, %215 ], [ %234, %233 ]
  %222 = icmp ult i32 %221, 4
  br i1 %222, label %225, label %223

223:                                              ; preds = %220
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %224 = icmp eq i32 %12, 0
  br i1 %224, label %.preheader, label %362

.preheader:                                       ; preds = %223
  br label %244

225:                                              ; preds = %220
  %226 = shl nuw nsw i32 %221, 6, !spirv.Decorations !305
  %227 = sext i32 %221 to i64
  %228 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %227
  %229 = add nuw nsw i32 %226, %219, !spirv.Decorations !305
  br label %230

230:                                              ; preds = %235, %225
  %231 = phi i32 [ 0, %225 ], [ %243, %235 ]
  %232 = icmp ult i32 %231, 4
  br i1 %232, label %235, label %233

233:                                              ; preds = %230
  %234 = add nuw nsw i32 %221, 1, !spirv.Decorations !305
  br label %220, !llvm.loop !422

235:                                              ; preds = %230
  %236 = zext i32 %231 to i64
  %237 = bitcast ptr %228 to ptr
  %238 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %237, i64 0, i32 0, i64 %236
  %239 = load float, ptr %238, align 4
  %240 = or i32 %229, %231
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %241
  store float %239, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %231, 1, !spirv.Decorations !305
  br label %230, !llvm.loop !423

244:                                              ; preds = %250, %.preheader
  %245 = phi i32 [ %253, %250 ], [ 0, %.preheader ]
  %246 = icmp ult i32 %245, 4
  br i1 %246, label %250, label %247

247:                                              ; preds = %244
  %248 = getelementptr inbounds float, ptr addrspace(3) %5, i64 16
  %249 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %256

250:                                              ; preds = %244
  %251 = zext i32 %245 to i64
  %252 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %251
  %253 = add nuw nsw i32 %245, 1, !spirv.Decorations !305
  %254 = bitcast ptr %252 to ptr
  %255 = bitcast ptr addrspace(2) @gVar.192 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %254, ptr addrspace(2) align 16 %255, i64 16, i1 false)
  br label %244, !llvm.loop !424

256:                                              ; preds = %306, %247
  %257 = phi i32 [ %307, %306 ], [ 0, %247 ]
  %258 = phi float [ %295, %306 ], [ 0.000000e+00, %247 ]
  %259 = phi float [ %278, %306 ], [ 0xFFF0000000000000, %247 ]
  %260 = icmp ult i32 %257, 16
  br i1 %260, label %271, label %261

261:                                              ; preds = %256
  %262 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %258, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %263 = fdiv reassoc nsz arcp contract float 1.000000e+00, %262, !spirv.Decorations !308
  %264 = mul nuw i32 %19, 12, !spirv.Decorations !373
  %265 = zext i32 %264 to i64
  %266 = sext i32 %21 to i64
  %267 = add nsw i64 %265, %266, !spirv.Decorations !332
  %268 = shl nsw i64 %267, 8, !spirv.Decorations !332
  %269 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %268
  %270 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %337

271:                                              ; preds = %256
  %272 = zext i32 %257 to i64
  %273 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %272
  %274 = load float, ptr addrspace(3) %273, align 4
  %275 = zext i32 %257 to i64
  %276 = getelementptr inbounds float, ptr addrspace(3) %248, i64 %275
  %277 = load float, ptr addrspace(3) %276, align 4
  %278 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %259, float %274) #0, !spirv.Decorations !308
  %279 = fcmp reassoc nsz arcp contract oeq float %259, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %279, label %283, label %280

280:                                              ; preds = %271
  %281 = fsub reassoc nsz arcp contract float %259, %278, !spirv.Decorations !308
  %282 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %281) #0, !spirv.Decorations !308
  br label %283

283:                                              ; preds = %280, %271
  %284 = phi float [ %282, %280 ], [ 0.000000e+00, %271 ]
  %285 = fcmp reassoc nsz arcp contract oeq float %274, 0xFFF0000000000000, !spirv.Decorations !308
  %286 = fcmp reassoc nsz arcp contract oeq float %278, 0xFFF0000000000000, !spirv.Decorations !308
  %287 = or i1 %285, %286
  br i1 %287, label %291, label %288

288:                                              ; preds = %283
  %289 = fsub reassoc nsz arcp contract float %274, %278, !spirv.Decorations !308
  %290 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %289) #0, !spirv.Decorations !308
  br label %291

291:                                              ; preds = %288, %283
  %292 = phi float [ %290, %288 ], [ 0.000000e+00, %283 ]
  %293 = fmul reassoc nsz arcp contract float %258, %284, !spirv.Decorations !308
  %294 = fmul reassoc nsz arcp contract float %292, %277, !spirv.Decorations !308
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !308
  %296 = shl nuw nsw i32 %257, 8, !spirv.Decorations !305
  %297 = or i32 %296, 32
  %298 = add nuw nsw i32 %249, %297, !spirv.Decorations !305
  %299 = insertelement <4 x float> undef, float %284, i32 0
  %300 = shufflevector <4 x float> %299, <4 x float> undef, <4 x i32> zeroinitializer
  %301 = insertelement <4 x float> undef, float %292, i32 0
  %302 = shufflevector <4 x float> %301, <4 x float> undef, <4 x i32> zeroinitializer
  br label %303

303:                                              ; preds = %315, %291
  %304 = phi i32 [ 0, %291 ], [ %327, %315 ]
  %305 = icmp ult i32 %304, 4
  br i1 %305, label %308, label %306

306:                                              ; preds = %303
  %307 = add nuw nsw i32 %257, 1, !spirv.Decorations !305
  br label %256

308:                                              ; preds = %303
  %309 = shl nuw nsw i32 %304, 6, !spirv.Decorations !305
  %310 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %310)
  %311 = add nuw nsw i32 %309, %298, !spirv.Decorations !305
  br label %312

312:                                              ; preds = %328, %308
  %313 = phi i32 [ 0, %308 ], [ %336, %328 ]
  %314 = icmp ult i32 %313, 4
  br i1 %314, label %328, label %315

315:                                              ; preds = %312
  %316 = sext i32 %304 to i64
  %317 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %316
  %318 = bitcast ptr %317 to ptr
  %319 = load <4 x float>, ptr %318, align 16, !noalias !425
  %320 = fmul reassoc nsz arcp contract <4 x float> %319, %300, !spirv.Decorations !308
  %321 = bitcast ptr %11 to ptr
  %322 = load <4 x float>, ptr %321, align 16, !noalias !434
  %323 = fmul reassoc nsz arcp contract <4 x float> %302, %322, !spirv.Decorations !308
  %324 = fadd reassoc nsz arcp contract <4 x float> %320, %323, !spirv.Decorations !308
  %325 = bitcast ptr %317 to ptr
  store <4 x float> %324, ptr %325, align 16
  %326 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %326)
  %327 = add nuw nsw i32 %304, 1, !spirv.Decorations !305
  br label %303, !llvm.loop !443

328:                                              ; preds = %312
  %329 = or i32 %311, %313
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %330
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = zext i32 %313 to i64
  %334 = bitcast ptr %11 to ptr
  %335 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %334, i64 0, i32 0, i64 %333
  store float %332, ptr %335, align 4
  %336 = add nuw nsw i32 %313, 1, !spirv.Decorations !305
  br label %312, !llvm.loop !444

337:                                              ; preds = %348, %261
  %338 = phi i32 [ 0, %261 ], [ %349, %348 ]
  %339 = icmp ult i32 %338, 4
  br i1 %339, label %340, label %.loopexit

340:                                              ; preds = %337
  %341 = shl nuw nsw i32 %338, 6, !spirv.Decorations !305
  %342 = add nuw nsw i32 %341, %270, !spirv.Decorations !305
  %343 = sext i32 %338 to i64
  %344 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %343
  br label %345

345:                                              ; preds = %350, %340
  %346 = phi i32 [ 0, %340 ], [ %361, %350 ]
  %347 = icmp ult i32 %346, 4
  br i1 %347, label %350, label %348

348:                                              ; preds = %345
  %349 = add nuw nsw i32 %338, 1, !spirv.Decorations !305
  br label %337, !llvm.loop !445

350:                                              ; preds = %345
  %351 = zext i32 %346 to i64
  %352 = bitcast ptr %344 to ptr
  %353 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %352, i64 0, i32 0, i64 %351
  %354 = load float, ptr %353, align 4
  %355 = fmul reassoc nsz arcp contract float %354, %263, !spirv.Decorations !308
  %356 = fptrunc float %355 to half
  %357 = or i32 %342, %346
  %358 = sext i32 %357 to i64
  %359 = bitcast ptr addrspace(1) %269 to ptr addrspace(1)
  %360 = getelementptr inbounds half, ptr addrspace(1) %359, i64 %358
  store half %356, ptr addrspace(1) %360, align 2
  %361 = add nuw nsw i32 %346, 1, !spirv.Decorations !305
  br label %345, !llvm.loop !446

.loopexit:                                        ; preds = %337
  br label %362

362:                                              ; preds = %.loopexit, %223
  %363 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %363)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !339 !kernel_arg_type_qual !328 !kernel_arg_base_type !339 !kernel_arg_name !328 !spirv.ParameterDecorations !340 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !330
  %10 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %11 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %12 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %13 = icmp sgt i32 %12, -1
  call void @llvm.assume(i1 %13)
  %14 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %15 = icmp sgt i32 %14, -1
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %17 = icmp ult i64 %16, 2147483648
  call void @llvm.assume(i1 %17)
  %18 = trunc i64 %16 to i32
  %19 = udiv i32 %18, 12
  %20 = mul nsw i32 %19, -12, !spirv.Decorations !332
  %21 = add nsw i32 %20, %18, !spirv.Decorations !332
  %22 = sdiv i32 %21, 6
  %23 = mul nuw nsw i32 %19, 6, !spirv.Decorations !305
  %24 = mul nsw i32 %22, -6, !spirv.Decorations !332
  %25 = add nsw i32 %24, %21, !spirv.Decorations !332
  %26 = add nsw i32 %23, %25, !spirv.Decorations !332
  %27 = mul nsw i32 %22, %0, !spirv.Decorations !332
  %28 = load i32, ptr addrspace(1) %1, align 4
  %29 = sext i32 %28 to i64
  %30 = sext i32 %0 to i64
  %31 = add nsw i64 %29, 63, !spirv.Decorations !332
  %32 = sdiv i64 %31, 64
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %30, i64 %32) #0
  %34 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %33) #0
  %35 = trunc i64 %34 to i32
  %36 = add nsw i32 %35, 31, !spirv.Decorations !332
  %37 = sdiv i32 %36, 32
  %38 = mul nsw i32 %37, %12, !spirv.Decorations !332
  %39 = add nsw i32 %38, %37, !spirv.Decorations !332
  %40 = icmp slt i32 %39, %35
  %41 = select i1 %40, i32 %39, i32 %35
  %42 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %42)
  br label %43

43:                                               ; preds = %49, %7
  %44 = phi i32 [ 0, %7 ], [ %52, %49 ]
  %45 = icmp ult i32 %44, 4
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %47)
  %48 = icmp slt i32 %38, %41
  br i1 %48, label %55, label %96

49:                                               ; preds = %43
  %50 = zext i32 %44 to i64
  %51 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %50
  %52 = add nuw nsw i32 %44, 1, !spirv.Decorations !305
  %53 = bitcast ptr %51 to ptr
  %54 = bitcast ptr addrspace(2) @gVar.193 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %53, ptr addrspace(2) align 16 %54, i64 16, i1 false)
  br label %43, !llvm.loop !447

55:                                               ; preds = %46
  %56 = add nsw i32 %27, %38, !spirv.Decorations !332
  %57 = sext i32 %56 to i64
  %58 = shl nsw i64 %57, 6, !spirv.Decorations !332
  %59 = sext i32 %26 to i64
  %60 = add nsw i64 %58, %59, !spirv.Decorations !332
  %61 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4
  %63 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %60
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %66 = shl nsw i64 %60, 8, !spirv.Decorations !332
  %67 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %66
  br label %68

68:                                               ; preds = %94, %55
  %69 = phi i32 [ 0, %55 ], [ %95, %94 ]
  %70 = icmp ult i32 %69, 4
  br i1 %70, label %71, label %.loopexit2

71:                                               ; preds = %68
  %72 = shl nuw nsw i32 %69, 6, !spirv.Decorations !305
  %73 = add nuw nsw i32 %72, %65, !spirv.Decorations !305
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %74
  %76 = zext i32 %73 to i64
  %77 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %67, i64 %76
  %78 = addrspacecast ptr addrspace(1) %77 to ptr addrspace(4)
  %79 = bitcast ptr addrspace(4) %78 to ptr addrspace(4)
  %80 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %79, i32 5) #0
  br label %81

81:                                               ; preds = %84, %71
  %82 = phi i32 [ 0, %71 ], [ %93, %84 ]
  %83 = icmp ult i32 %82, 4
  br i1 %83, label %84, label %94

84:                                               ; preds = %81
  %85 = zext i32 %82 to i64
  %86 = bitcast ptr addrspace(1) %80 to ptr addrspace(1)
  %87 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %86, i64 %85
  %88 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %87, i64 0, i32 0
  %89 = bitcast ptr %75 to ptr
  %90 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %89, i64 0, i32 0, i64 %85
  %91 = load half, ptr addrspace(1) %88, align 2
  %92 = bitcast ptr %90 to ptr
  store half %91, ptr %92, align 2
  %93 = add nuw nsw i32 %82, 1, !spirv.Decorations !305
  br label %81

94:                                               ; preds = %81
  %95 = add nuw nsw i32 %69, 1, !spirv.Decorations !305
  br label %68, !llvm.loop !448

.loopexit2:                                       ; preds = %68
  br label %96

96:                                               ; preds = %.loopexit2, %46
  %97 = phi float [ 0.000000e+00, %46 ], [ %64, %.loopexit2 ]
  %98 = phi float [ 0xFFF0000000000000, %46 ], [ %62, %.loopexit2 ]
  %99 = add i32 %27, 1
  %100 = sext i32 %26 to i64
  %101 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %102

102:                                              ; preds = %196, %96
  %103 = phi i32 [ %38, %96 ], [ %118, %196 ]
  %104 = phi float [ %97, %96 ], [ %169, %196 ]
  %105 = phi float [ %98, %96 ], [ %170, %196 ]
  %106 = phi float [ 0.000000e+00, %96 ], [ %188, %196 ]
  %107 = phi float [ 0xFFF0000000000000, %96 ], [ %171, %196 ]
  %108 = icmp slt i32 %103, %41
  br i1 %108, label %112, label %109

109:                                              ; preds = %102
  %110 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %110)
  %111 = icmp eq i32 %14, 0
  br i1 %111, label %211, label %215

112:                                              ; preds = %102
  %113 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %113)
  br label %114

114:                                              ; preds = %120, %112
  %115 = phi i32 [ 0, %112 ], [ %128, %120 ]
  %116 = icmp ult i32 %115, 4
  br i1 %116, label %120, label %117

117:                                              ; preds = %114
  %118 = add nsw i32 %103, 1, !spirv.Decorations !332
  %119 = icmp slt i32 %118, %41
  br i1 %119, label %129, label %168

120:                                              ; preds = %114
  %121 = zext i32 %115 to i64
  %122 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %121
  %123 = bitcast ptr %122 to ptr
  %124 = load <4 x half>, ptr %123, align 8, !noalias !449
  %125 = call spir_func <4 x float> @_Z28__spirv_FConvert_Rfloat4_rteDv4_Dh(<4 x half> %124) #0, !spirv.Decorations !347
  %126 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %121
  %127 = bitcast ptr %126 to ptr
  store <4 x float> %125, ptr %127, align 16
  %128 = add nuw nsw i32 %115, 1, !spirv.Decorations !305
  br label %114, !llvm.loop !452

129:                                              ; preds = %117
  %130 = add i32 %103, %99
  %131 = sext i32 %130 to i64
  %132 = shl nsw i64 %131, 6, !spirv.Decorations !332
  %133 = add nsw i64 %132, %100, !spirv.Decorations !332
  %134 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %133
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = shl nsw i64 %133, 8, !spirv.Decorations !332
  %139 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %138
  br label %140

140:                                              ; preds = %166, %129
  %141 = phi i32 [ 0, %129 ], [ %167, %166 ]
  %142 = icmp ult i32 %141, 4
  br i1 %142, label %143, label %.loopexit1

143:                                              ; preds = %140
  %144 = shl nuw nsw i32 %141, 6, !spirv.Decorations !305
  %145 = add nuw nsw i32 %144, %101, !spirv.Decorations !305
  %146 = zext i32 %141 to i64
  %147 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %146
  %148 = zext i32 %145 to i64
  %149 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %139, i64 %148
  %150 = addrspacecast ptr addrspace(1) %149 to ptr addrspace(4)
  %151 = bitcast ptr addrspace(4) %150 to ptr addrspace(4)
  %152 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %151, i32 5) #0
  br label %153

153:                                              ; preds = %156, %143
  %154 = phi i32 [ 0, %143 ], [ %165, %156 ]
  %155 = icmp ult i32 %154, 4
  br i1 %155, label %156, label %166

156:                                              ; preds = %153
  %157 = zext i32 %154 to i64
  %158 = bitcast ptr addrspace(1) %152 to ptr addrspace(1)
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %158, i64 %157
  %160 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %159, i64 0, i32 0
  %161 = bitcast ptr %147 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %161, i64 0, i32 0, i64 %157
  %163 = load half, ptr addrspace(1) %160, align 2
  %164 = bitcast ptr %162 to ptr
  store half %163, ptr %164, align 2
  %165 = add nuw nsw i32 %154, 1, !spirv.Decorations !305
  br label %153

166:                                              ; preds = %153
  %167 = add nuw nsw i32 %141, 1, !spirv.Decorations !305
  br label %140, !llvm.loop !453

.loopexit1:                                       ; preds = %140
  br label %168

168:                                              ; preds = %.loopexit1, %117
  %169 = phi float [ %104, %117 ], [ %137, %.loopexit1 ]
  %170 = phi float [ %105, %117 ], [ %135, %.loopexit1 ]
  %171 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %107, float %105) #0, !spirv.Decorations !308
  %172 = fcmp reassoc nsz arcp contract oeq float %107, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %172, label %176, label %173

173:                                              ; preds = %168
  %174 = fsub reassoc nsz arcp contract float %107, %171, !spirv.Decorations !308
  %175 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %174) #0, !spirv.Decorations !308
  br label %176

176:                                              ; preds = %173, %168
  %177 = phi float [ %175, %173 ], [ 0.000000e+00, %168 ]
  %178 = fcmp reassoc nsz arcp contract oeq float %105, 0xFFF0000000000000, !spirv.Decorations !308
  %179 = fcmp reassoc nsz arcp contract oeq float %171, 0xFFF0000000000000, !spirv.Decorations !308
  %180 = or i1 %178, %179
  br i1 %180, label %184, label %181

181:                                              ; preds = %176
  %182 = fsub reassoc nsz arcp contract float %105, %171, !spirv.Decorations !308
  %183 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %182) #0, !spirv.Decorations !308
  br label %184

184:                                              ; preds = %181, %176
  %185 = phi float [ %183, %181 ], [ 0.000000e+00, %176 ]
  %186 = fmul reassoc nsz arcp contract float %185, %104, !spirv.Decorations !308
  %187 = fmul reassoc nsz arcp contract float %106, %177, !spirv.Decorations !308
  %188 = fadd reassoc nsz arcp contract float %187, %186, !spirv.Decorations !308
  %189 = insertelement <4 x float> undef, float %177, i32 0
  %190 = shufflevector <4 x float> %189, <4 x float> undef, <4 x i32> zeroinitializer
  %191 = insertelement <4 x float> undef, float %186, i32 0
  %192 = shufflevector <4 x float> %191, <4 x float> undef, <4 x i32> zeroinitializer
  br label %193

193:                                              ; preds = %198, %184
  %194 = phi i32 [ 0, %184 ], [ %210, %198 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  %197 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %197)
  br label %102

198:                                              ; preds = %193
  %199 = zext i32 %194 to i64
  %200 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %199
  %201 = bitcast ptr %200 to ptr
  %202 = load <4 x float>, ptr %201, align 16, !noalias !454
  %203 = fmul reassoc nsz arcp contract <4 x float> %202, %190, !spirv.Decorations !308
  %204 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %199
  %205 = bitcast ptr %204 to ptr
  %206 = load <4 x float>, ptr %205, align 16, !noalias !463
  %207 = fmul reassoc nsz arcp contract <4 x float> %192, %206, !spirv.Decorations !308
  %208 = fadd reassoc nsz arcp contract <4 x float> %203, %207, !spirv.Decorations !308
  %209 = bitcast ptr %200 to ptr
  store <4 x float> %208, ptr %209, align 16
  %210 = add nuw nsw i32 %194, 1, !spirv.Decorations !305
  br label %193, !llvm.loop !472

211:                                              ; preds = %109
  %212 = zext i32 %12 to i64
  %213 = getelementptr float, ptr addrspace(3) %5, i64 %212
  store float %107, ptr addrspace(3) %213, align 4
  %214 = getelementptr float, ptr addrspace(3) %213, i64 32
  store float %106, ptr addrspace(3) %214, align 4
  br label %215

215:                                              ; preds = %211, %109
  %216 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %217 = shl nsw i32 %12, 8, !spirv.Decorations !332
  %218 = or i32 %217, 64
  %219 = add nuw nsw i32 %216, %218, !spirv.Decorations !305
  br label %220

220:                                              ; preds = %233, %215
  %221 = phi i32 [ 0, %215 ], [ %234, %233 ]
  %222 = icmp ult i32 %221, 4
  br i1 %222, label %225, label %223

223:                                              ; preds = %220
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %224 = icmp eq i32 %12, 0
  br i1 %224, label %.preheader, label %362

.preheader:                                       ; preds = %223
  br label %244

225:                                              ; preds = %220
  %226 = shl nuw nsw i32 %221, 6, !spirv.Decorations !305
  %227 = sext i32 %221 to i64
  %228 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %227
  %229 = add nuw nsw i32 %226, %219, !spirv.Decorations !305
  br label %230

230:                                              ; preds = %235, %225
  %231 = phi i32 [ 0, %225 ], [ %243, %235 ]
  %232 = icmp ult i32 %231, 4
  br i1 %232, label %235, label %233

233:                                              ; preds = %230
  %234 = add nuw nsw i32 %221, 1, !spirv.Decorations !305
  br label %220, !llvm.loop !473

235:                                              ; preds = %230
  %236 = zext i32 %231 to i64
  %237 = bitcast ptr %228 to ptr
  %238 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %237, i64 0, i32 0, i64 %236
  %239 = load float, ptr %238, align 4
  %240 = or i32 %229, %231
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %241
  store float %239, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %231, 1, !spirv.Decorations !305
  br label %230, !llvm.loop !474

244:                                              ; preds = %250, %.preheader
  %245 = phi i32 [ %253, %250 ], [ 0, %.preheader ]
  %246 = icmp ult i32 %245, 4
  br i1 %246, label %250, label %247

247:                                              ; preds = %244
  %248 = getelementptr inbounds float, ptr addrspace(3) %5, i64 32
  %249 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %256

250:                                              ; preds = %244
  %251 = zext i32 %245 to i64
  %252 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %251
  %253 = add nuw nsw i32 %245, 1, !spirv.Decorations !305
  %254 = bitcast ptr %252 to ptr
  %255 = bitcast ptr addrspace(2) @gVar.194 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %254, ptr addrspace(2) align 16 %255, i64 16, i1 false)
  br label %244, !llvm.loop !475

256:                                              ; preds = %306, %247
  %257 = phi i32 [ %307, %306 ], [ 0, %247 ]
  %258 = phi float [ %295, %306 ], [ 0.000000e+00, %247 ]
  %259 = phi float [ %278, %306 ], [ 0xFFF0000000000000, %247 ]
  %260 = icmp ult i32 %257, 32
  br i1 %260, label %271, label %261

261:                                              ; preds = %256
  %262 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %258, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %263 = fdiv reassoc nsz arcp contract float 1.000000e+00, %262, !spirv.Decorations !308
  %264 = mul nuw i32 %19, 12, !spirv.Decorations !373
  %265 = zext i32 %264 to i64
  %266 = sext i32 %21 to i64
  %267 = add nsw i64 %265, %266, !spirv.Decorations !332
  %268 = shl nsw i64 %267, 8, !spirv.Decorations !332
  %269 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %268
  %270 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %337

271:                                              ; preds = %256
  %272 = zext i32 %257 to i64
  %273 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %272
  %274 = load float, ptr addrspace(3) %273, align 4
  %275 = zext i32 %257 to i64
  %276 = getelementptr inbounds float, ptr addrspace(3) %248, i64 %275
  %277 = load float, ptr addrspace(3) %276, align 4
  %278 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %259, float %274) #0, !spirv.Decorations !308
  %279 = fcmp reassoc nsz arcp contract oeq float %259, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %279, label %283, label %280

280:                                              ; preds = %271
  %281 = fsub reassoc nsz arcp contract float %259, %278, !spirv.Decorations !308
  %282 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %281) #0, !spirv.Decorations !308
  br label %283

283:                                              ; preds = %280, %271
  %284 = phi float [ %282, %280 ], [ 0.000000e+00, %271 ]
  %285 = fcmp reassoc nsz arcp contract oeq float %274, 0xFFF0000000000000, !spirv.Decorations !308
  %286 = fcmp reassoc nsz arcp contract oeq float %278, 0xFFF0000000000000, !spirv.Decorations !308
  %287 = or i1 %285, %286
  br i1 %287, label %291, label %288

288:                                              ; preds = %283
  %289 = fsub reassoc nsz arcp contract float %274, %278, !spirv.Decorations !308
  %290 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %289) #0, !spirv.Decorations !308
  br label %291

291:                                              ; preds = %288, %283
  %292 = phi float [ %290, %288 ], [ 0.000000e+00, %283 ]
  %293 = fmul reassoc nsz arcp contract float %258, %284, !spirv.Decorations !308
  %294 = fmul reassoc nsz arcp contract float %292, %277, !spirv.Decorations !308
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !308
  %296 = shl nuw nsw i32 %257, 8, !spirv.Decorations !305
  %297 = or i32 %296, 64
  %298 = add nuw nsw i32 %249, %297, !spirv.Decorations !305
  %299 = insertelement <4 x float> undef, float %284, i32 0
  %300 = shufflevector <4 x float> %299, <4 x float> undef, <4 x i32> zeroinitializer
  %301 = insertelement <4 x float> undef, float %292, i32 0
  %302 = shufflevector <4 x float> %301, <4 x float> undef, <4 x i32> zeroinitializer
  br label %303

303:                                              ; preds = %315, %291
  %304 = phi i32 [ 0, %291 ], [ %327, %315 ]
  %305 = icmp ult i32 %304, 4
  br i1 %305, label %308, label %306

306:                                              ; preds = %303
  %307 = add nuw nsw i32 %257, 1, !spirv.Decorations !305
  br label %256

308:                                              ; preds = %303
  %309 = shl nuw nsw i32 %304, 6, !spirv.Decorations !305
  %310 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %310)
  %311 = add nuw nsw i32 %309, %298, !spirv.Decorations !305
  br label %312

312:                                              ; preds = %328, %308
  %313 = phi i32 [ 0, %308 ], [ %336, %328 ]
  %314 = icmp ult i32 %313, 4
  br i1 %314, label %328, label %315

315:                                              ; preds = %312
  %316 = sext i32 %304 to i64
  %317 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %316
  %318 = bitcast ptr %317 to ptr
  %319 = load <4 x float>, ptr %318, align 16, !noalias !476
  %320 = fmul reassoc nsz arcp contract <4 x float> %319, %300, !spirv.Decorations !308
  %321 = bitcast ptr %11 to ptr
  %322 = load <4 x float>, ptr %321, align 16, !noalias !485
  %323 = fmul reassoc nsz arcp contract <4 x float> %302, %322, !spirv.Decorations !308
  %324 = fadd reassoc nsz arcp contract <4 x float> %320, %323, !spirv.Decorations !308
  %325 = bitcast ptr %317 to ptr
  store <4 x float> %324, ptr %325, align 16
  %326 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %326)
  %327 = add nuw nsw i32 %304, 1, !spirv.Decorations !305
  br label %303, !llvm.loop !494

328:                                              ; preds = %312
  %329 = or i32 %311, %313
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %330
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = zext i32 %313 to i64
  %334 = bitcast ptr %11 to ptr
  %335 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %334, i64 0, i32 0, i64 %333
  store float %332, ptr %335, align 4
  %336 = add nuw nsw i32 %313, 1, !spirv.Decorations !305
  br label %312, !llvm.loop !495

337:                                              ; preds = %348, %261
  %338 = phi i32 [ 0, %261 ], [ %349, %348 ]
  %339 = icmp ult i32 %338, 4
  br i1 %339, label %340, label %.loopexit

340:                                              ; preds = %337
  %341 = shl nuw nsw i32 %338, 6, !spirv.Decorations !305
  %342 = add nuw nsw i32 %341, %270, !spirv.Decorations !305
  %343 = sext i32 %338 to i64
  %344 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %343
  br label %345

345:                                              ; preds = %350, %340
  %346 = phi i32 [ 0, %340 ], [ %361, %350 ]
  %347 = icmp ult i32 %346, 4
  br i1 %347, label %350, label %348

348:                                              ; preds = %345
  %349 = add nuw nsw i32 %338, 1, !spirv.Decorations !305
  br label %337, !llvm.loop !496

350:                                              ; preds = %345
  %351 = zext i32 %346 to i64
  %352 = bitcast ptr %344 to ptr
  %353 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %352, i64 0, i32 0, i64 %351
  %354 = load float, ptr %353, align 4
  %355 = fmul reassoc nsz arcp contract float %354, %263, !spirv.Decorations !308
  %356 = fptrunc float %355 to half
  %357 = or i32 %342, %346
  %358 = sext i32 %357 to i64
  %359 = bitcast ptr addrspace(1) %269 to ptr addrspace(1)
  %360 = getelementptr inbounds half, ptr addrspace(1) %359, i64 %358
  store half %356, ptr addrspace(1) %360, align 2
  %361 = add nuw nsw i32 %346, 1, !spirv.Decorations !305
  br label %345, !llvm.loop !497

.loopexit:                                        ; preds = %337
  br label %362

362:                                              ; preds = %.loopexit, %223
  %363 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %363)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi8EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 7, !spirv.Decorations !332
  %36 = sdiv i32 %35, 8
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = getelementptr float, ptr addrspace(1) %2, i64 %46
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.195 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !500

54:                                               ; preds = %62, %45
  %55 = phi i32 [ %69, %62 ], [ %37, %45 ]
  %56 = phi float [ %68, %62 ], [ 0xFFF0000000000000, %45 ]
  %57 = icmp slt i32 %55, %40
  br i1 %57, label %62, label %58

58:                                               ; preds = %54
  %59 = sext i32 %25 to i64
  %60 = fcmp reassoc nsz arcp contract oeq float %56, 0xFFF0000000000000, !spirv.Decorations !308
  %61 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %70

62:                                               ; preds = %54
  %63 = add nsw i32 %26, %55, !spirv.Decorations !332
  %64 = sext i32 %63 to i64
  %65 = shl nsw i64 %64, 6, !spirv.Decorations !332
  %66 = getelementptr float, ptr addrspace(1) %47, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %56, float %67) #0, !spirv.Decorations !308
  %69 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

70:                                               ; preds = %101, %58
  %71 = phi i32 [ %102, %101 ], [ %37, %58 ]
  %72 = phi float [ %93, %101 ], [ 0.000000e+00, %58 ]
  %73 = icmp slt i32 %71, %40
  br i1 %73, label %76, label %74

74:                                               ; preds = %70
  %75 = icmp eq i32 %13, 0
  br i1 %75, label %135, label %139

76:                                               ; preds = %70
  %77 = add nsw i32 %26, %71, !spirv.Decorations !332
  %78 = sext i32 %77 to i64
  %79 = shl nsw i64 %78, 6, !spirv.Decorations !332
  %80 = add nsw i64 %79, %59, !spirv.Decorations !332
  %81 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %80
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = fcmp reassoc nsz arcp contract oeq float %82, 0xFFF0000000000000, !spirv.Decorations !308
  %86 = or i1 %85, %60
  br i1 %86, label %90, label %87

87:                                               ; preds = %76
  %88 = fsub reassoc nsz arcp contract float %82, %56, !spirv.Decorations !308
  %89 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %88) #0, !spirv.Decorations !308
  br label %90

90:                                               ; preds = %87, %76
  %91 = phi float [ %89, %87 ], [ 0.000000e+00, %76 ]
  %92 = fmul reassoc nsz arcp contract float %91, %84, !spirv.Decorations !308
  %93 = fadd reassoc nsz arcp contract float %72, %92, !spirv.Decorations !308
  %94 = shl nsw i64 %80, 8, !spirv.Decorations !332
  %95 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %94
  %96 = insertelement <4 x float> undef, float %92, i32 0
  %97 = shufflevector <4 x float> %96, <4 x float> undef, <4 x i32> zeroinitializer
  br label %98

98:                                               ; preds = %123, %90
  %99 = phi i32 [ 0, %90 ], [ %134, %123 ]
  %100 = icmp ult i32 %99, 4
  br i1 %100, label %103, label %101

101:                                              ; preds = %98
  %102 = add nsw i32 %71, 1, !spirv.Decorations !332
  br label %70

103:                                              ; preds = %98
  %104 = shl nuw nsw i32 %99, 6, !spirv.Decorations !305
  %105 = add nuw nsw i32 %104, %61, !spirv.Decorations !305
  %106 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %106)
  %107 = zext i32 %105 to i64
  %108 = getelementptr inbounds float, ptr addrspace(1) %95, i64 %107
  %109 = addrspacecast ptr addrspace(1) %108 to ptr addrspace(4)
  %110 = bitcast ptr addrspace(4) %109 to ptr addrspace(4)
  %111 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %110, i32 5) #0
  br label %112

112:                                              ; preds = %115, %103
  %113 = phi i32 [ 0, %103 ], [ %122, %115 ]
  %114 = icmp ult i32 %113, 4
  br i1 %114, label %115, label %123

115:                                              ; preds = %112
  %116 = zext i32 %113 to i64
  %117 = bitcast ptr addrspace(1) %111 to ptr addrspace(1)
  %118 = getelementptr inbounds float, ptr addrspace(1) %117, i64 %116
  %119 = load float, ptr addrspace(1) %118, align 4
  %120 = bitcast ptr %9 to ptr
  %121 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %120, i64 0, i32 0, i64 %116
  store float %119, ptr %121, align 4
  %122 = add nuw nsw i32 %113, 1, !spirv.Decorations !305
  br label %112

123:                                              ; preds = %112
  %124 = sext i32 %99 to i64
  %125 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %124
  %126 = bitcast ptr %125 to ptr
  %127 = load <4 x float>, ptr %126, align 16, !noalias !501
  %128 = bitcast ptr %9 to ptr
  %129 = load <4 x float>, ptr %128, align 16, !noalias !510
  %130 = fmul reassoc nsz arcp contract <4 x float> %97, %129, !spirv.Decorations !308
  %131 = fadd reassoc nsz arcp contract <4 x float> %127, %130, !spirv.Decorations !308
  %132 = bitcast ptr %125 to ptr
  store <4 x float> %131, ptr %132, align 16
  %133 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %133)
  %134 = add nuw nsw i32 %99, 1, !spirv.Decorations !305
  br label %98, !llvm.loop !519

135:                                              ; preds = %74
  %136 = zext i32 %11 to i64
  %137 = getelementptr float, ptr addrspace(3) %5, i64 %136
  store float %56, ptr addrspace(3) %137, align 4
  %138 = getelementptr float, ptr addrspace(3) %137, i64 8
  store float %72, ptr addrspace(3) %138, align 4
  br label %139

139:                                              ; preds = %135, %74
  %140 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %141 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %142 = or i32 %141, 16
  %143 = add nuw nsw i32 %140, %142, !spirv.Decorations !305
  br label %144

144:                                              ; preds = %157, %139
  %145 = phi i32 [ 0, %139 ], [ %158, %157 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %148 = icmp eq i32 %11, 0
  br i1 %148, label %.preheader1, label %284

.preheader1:                                      ; preds = %147
  br label %168

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !305
  %151 = sext i32 %145 to i64
  %152 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %151
  %153 = add nuw nsw i32 %150, %143, !spirv.Decorations !305
  br label %154

154:                                              ; preds = %159, %149
  %155 = phi i32 [ 0, %149 ], [ %167, %159 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %159, label %157

157:                                              ; preds = %154
  %158 = add nuw nsw i32 %145, 1, !spirv.Decorations !305
  br label %144, !llvm.loop !520

159:                                              ; preds = %154
  %160 = zext i32 %155 to i64
  %161 = bitcast ptr %152 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %161, i64 0, i32 0, i64 %160
  %163 = load float, ptr %162, align 4
  %164 = or i32 %153, %155
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %165
  store float %163, ptr addrspace(3) %166, align 4
  %167 = add nuw nsw i32 %155, 1, !spirv.Decorations !305
  br label %154, !llvm.loop !521

168:                                              ; preds = %171, %.preheader1
  %169 = phi i32 [ %174, %171 ], [ 0, %.preheader1 ]
  %170 = icmp ult i32 %169, 4
  br i1 %170, label %171, label %.preheader

.preheader:                                       ; preds = %168
  br label %177

171:                                              ; preds = %168
  %172 = zext i32 %169 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %169, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.196 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %168, !llvm.loop !522

177:                                              ; preds = %185, %.preheader
  %178 = phi i32 [ %190, %185 ], [ 0, %.preheader ]
  %179 = phi float [ %189, %185 ], [ 0xFFF0000000000000, %.preheader ]
  %180 = icmp ult i32 %178, 8
  br i1 %180, label %185, label %181

181:                                              ; preds = %177
  %182 = getelementptr inbounds float, ptr addrspace(3) %5, i64 8
  %183 = fcmp reassoc nsz arcp contract oeq float %179, 0xFFF0000000000000, !spirv.Decorations !308
  %184 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %191

185:                                              ; preds = %177
  %186 = zext i32 %178 to i64
  %187 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %186
  %188 = load float, ptr addrspace(3) %187, align 4
  %189 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %179, float %188) #0, !spirv.Decorations !308
  %190 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

191:                                              ; preds = %229, %181
  %192 = phi i32 [ %230, %229 ], [ 0, %181 ]
  %193 = phi float [ %220, %229 ], [ 0.000000e+00, %181 ]
  %194 = icmp ult i32 %192, 8
  br i1 %194, label %205, label %195

195:                                              ; preds = %191
  %196 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %193, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %197 = fdiv reassoc nsz arcp contract float 1.000000e+00, %196, !spirv.Decorations !308
  %198 = mul nuw i32 %18, 12, !spirv.Decorations !373
  %199 = zext i32 %198 to i64
  %200 = sext i32 %20 to i64
  %201 = add nsw i64 %199, %200, !spirv.Decorations !332
  %202 = shl nsw i64 %201, 8, !spirv.Decorations !332
  %203 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %202
  %204 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %259

205:                                              ; preds = %191
  %206 = zext i32 %192 to i64
  %207 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %206
  %208 = load float, ptr addrspace(3) %207, align 4
  %209 = zext i32 %192 to i64
  %210 = getelementptr inbounds float, ptr addrspace(3) %182, i64 %209
  %211 = load float, ptr addrspace(3) %210, align 4
  %212 = fcmp reassoc nsz arcp contract oeq float %208, 0xFFF0000000000000, !spirv.Decorations !308
  %213 = or i1 %212, %183
  br i1 %213, label %217, label %214

214:                                              ; preds = %205
  %215 = fsub reassoc nsz arcp contract float %208, %179, !spirv.Decorations !308
  %216 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %215) #0, !spirv.Decorations !308
  br label %217

217:                                              ; preds = %214, %205
  %218 = phi float [ %216, %214 ], [ 0.000000e+00, %205 ]
  %219 = fmul reassoc nsz arcp contract float %218, %211, !spirv.Decorations !308
  %220 = fadd reassoc nsz arcp contract float %193, %219, !spirv.Decorations !308
  %221 = shl nuw nsw i32 %192, 8, !spirv.Decorations !305
  %222 = or i32 %221, 16
  %223 = add nuw nsw i32 %184, %222, !spirv.Decorations !305
  %224 = insertelement <4 x float> undef, float %218, i32 0
  %225 = shufflevector <4 x float> %224, <4 x float> undef, <4 x i32> zeroinitializer
  br label %226

226:                                              ; preds = %238, %217
  %227 = phi i32 [ 0, %217 ], [ %249, %238 ]
  %228 = icmp ult i32 %227, 4
  br i1 %228, label %231, label %229

229:                                              ; preds = %226
  %230 = add nuw nsw i32 %192, 1, !spirv.Decorations !305
  br label %191

231:                                              ; preds = %226
  %232 = shl nuw nsw i32 %227, 6, !spirv.Decorations !305
  %233 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %233)
  %234 = add nuw nsw i32 %232, %223, !spirv.Decorations !305
  br label %235

235:                                              ; preds = %250, %231
  %236 = phi i32 [ 0, %231 ], [ %258, %250 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %250, label %238

238:                                              ; preds = %235
  %239 = sext i32 %227 to i64
  %240 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %239
  %241 = bitcast ptr %240 to ptr
  %242 = load <4 x float>, ptr %241, align 16, !noalias !523
  %243 = bitcast ptr %10 to ptr
  %244 = load <4 x float>, ptr %243, align 16, !noalias !532
  %245 = fmul reassoc nsz arcp contract <4 x float> %225, %244, !spirv.Decorations !308
  %246 = fadd reassoc nsz arcp contract <4 x float> %242, %245, !spirv.Decorations !308
  %247 = bitcast ptr %240 to ptr
  store <4 x float> %246, ptr %247, align 16
  %248 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %248)
  %249 = add nuw nsw i32 %227, 1, !spirv.Decorations !305
  br label %226, !llvm.loop !541

250:                                              ; preds = %235
  %251 = or i32 %234, %236
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %252
  %254 = load float, ptr addrspace(3) %253, align 4
  %255 = zext i32 %236 to i64
  %256 = bitcast ptr %10 to ptr
  %257 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %256, i64 0, i32 0, i64 %255
  store float %254, ptr %257, align 4
  %258 = add nuw nsw i32 %236, 1, !spirv.Decorations !305
  br label %235, !llvm.loop !542

259:                                              ; preds = %270, %195
  %260 = phi i32 [ 0, %195 ], [ %271, %270 ]
  %261 = icmp ult i32 %260, 4
  br i1 %261, label %262, label %.loopexit

262:                                              ; preds = %259
  %263 = shl nuw nsw i32 %260, 6, !spirv.Decorations !305
  %264 = add nuw nsw i32 %263, %204, !spirv.Decorations !305
  %265 = sext i32 %260 to i64
  %266 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %265
  br label %267

267:                                              ; preds = %272, %262
  %268 = phi i32 [ 0, %262 ], [ %283, %272 ]
  %269 = icmp ult i32 %268, 4
  br i1 %269, label %272, label %270

270:                                              ; preds = %267
  %271 = add nuw nsw i32 %260, 1, !spirv.Decorations !305
  br label %259, !llvm.loop !543

272:                                              ; preds = %267
  %273 = zext i32 %268 to i64
  %274 = bitcast ptr %266 to ptr
  %275 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %274, i64 0, i32 0, i64 %273
  %276 = load float, ptr %275, align 4
  %277 = fmul reassoc nsz arcp contract float %276, %197, !spirv.Decorations !308
  %278 = fptrunc float %277 to half
  %279 = or i32 %264, %268
  %280 = sext i32 %279 to i64
  %281 = bitcast ptr addrspace(1) %203 to ptr addrspace(1)
  %282 = getelementptr inbounds half, ptr addrspace(1) %281, i64 %280
  store half %278, ptr addrspace(1) %282, align 2
  %283 = add nuw nsw i32 %268, 1, !spirv.Decorations !305
  br label %267, !llvm.loop !544

.loopexit:                                        ; preds = %259
  br label %284

284:                                              ; preds = %.loopexit, %147
  %285 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %285)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi16EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 15, !spirv.Decorations !332
  %36 = sdiv i32 %35, 16
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = getelementptr float, ptr addrspace(1) %2, i64 %46
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.197 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !545

54:                                               ; preds = %62, %45
  %55 = phi i32 [ %69, %62 ], [ %37, %45 ]
  %56 = phi float [ %68, %62 ], [ 0xFFF0000000000000, %45 ]
  %57 = icmp slt i32 %55, %40
  br i1 %57, label %62, label %58

58:                                               ; preds = %54
  %59 = sext i32 %25 to i64
  %60 = fcmp reassoc nsz arcp contract oeq float %56, 0xFFF0000000000000, !spirv.Decorations !308
  %61 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %70

62:                                               ; preds = %54
  %63 = add nsw i32 %26, %55, !spirv.Decorations !332
  %64 = sext i32 %63 to i64
  %65 = shl nsw i64 %64, 6, !spirv.Decorations !332
  %66 = getelementptr float, ptr addrspace(1) %47, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %56, float %67) #0, !spirv.Decorations !308
  %69 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

70:                                               ; preds = %101, %58
  %71 = phi i32 [ %102, %101 ], [ %37, %58 ]
  %72 = phi float [ %93, %101 ], [ 0.000000e+00, %58 ]
  %73 = icmp slt i32 %71, %40
  br i1 %73, label %76, label %74

74:                                               ; preds = %70
  %75 = icmp eq i32 %13, 0
  br i1 %75, label %135, label %139

76:                                               ; preds = %70
  %77 = add nsw i32 %26, %71, !spirv.Decorations !332
  %78 = sext i32 %77 to i64
  %79 = shl nsw i64 %78, 6, !spirv.Decorations !332
  %80 = add nsw i64 %79, %59, !spirv.Decorations !332
  %81 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %80
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = fcmp reassoc nsz arcp contract oeq float %82, 0xFFF0000000000000, !spirv.Decorations !308
  %86 = or i1 %85, %60
  br i1 %86, label %90, label %87

87:                                               ; preds = %76
  %88 = fsub reassoc nsz arcp contract float %82, %56, !spirv.Decorations !308
  %89 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %88) #0, !spirv.Decorations !308
  br label %90

90:                                               ; preds = %87, %76
  %91 = phi float [ %89, %87 ], [ 0.000000e+00, %76 ]
  %92 = fmul reassoc nsz arcp contract float %91, %84, !spirv.Decorations !308
  %93 = fadd reassoc nsz arcp contract float %72, %92, !spirv.Decorations !308
  %94 = shl nsw i64 %80, 8, !spirv.Decorations !332
  %95 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %94
  %96 = insertelement <4 x float> undef, float %92, i32 0
  %97 = shufflevector <4 x float> %96, <4 x float> undef, <4 x i32> zeroinitializer
  br label %98

98:                                               ; preds = %123, %90
  %99 = phi i32 [ 0, %90 ], [ %134, %123 ]
  %100 = icmp ult i32 %99, 4
  br i1 %100, label %103, label %101

101:                                              ; preds = %98
  %102 = add nsw i32 %71, 1, !spirv.Decorations !332
  br label %70

103:                                              ; preds = %98
  %104 = shl nuw nsw i32 %99, 6, !spirv.Decorations !305
  %105 = add nuw nsw i32 %104, %61, !spirv.Decorations !305
  %106 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %106)
  %107 = zext i32 %105 to i64
  %108 = getelementptr inbounds float, ptr addrspace(1) %95, i64 %107
  %109 = addrspacecast ptr addrspace(1) %108 to ptr addrspace(4)
  %110 = bitcast ptr addrspace(4) %109 to ptr addrspace(4)
  %111 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %110, i32 5) #0
  br label %112

112:                                              ; preds = %115, %103
  %113 = phi i32 [ 0, %103 ], [ %122, %115 ]
  %114 = icmp ult i32 %113, 4
  br i1 %114, label %115, label %123

115:                                              ; preds = %112
  %116 = zext i32 %113 to i64
  %117 = bitcast ptr addrspace(1) %111 to ptr addrspace(1)
  %118 = getelementptr inbounds float, ptr addrspace(1) %117, i64 %116
  %119 = load float, ptr addrspace(1) %118, align 4
  %120 = bitcast ptr %9 to ptr
  %121 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %120, i64 0, i32 0, i64 %116
  store float %119, ptr %121, align 4
  %122 = add nuw nsw i32 %113, 1, !spirv.Decorations !305
  br label %112

123:                                              ; preds = %112
  %124 = sext i32 %99 to i64
  %125 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %124
  %126 = bitcast ptr %125 to ptr
  %127 = load <4 x float>, ptr %126, align 16, !noalias !546
  %128 = bitcast ptr %9 to ptr
  %129 = load <4 x float>, ptr %128, align 16, !noalias !555
  %130 = fmul reassoc nsz arcp contract <4 x float> %97, %129, !spirv.Decorations !308
  %131 = fadd reassoc nsz arcp contract <4 x float> %127, %130, !spirv.Decorations !308
  %132 = bitcast ptr %125 to ptr
  store <4 x float> %131, ptr %132, align 16
  %133 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %133)
  %134 = add nuw nsw i32 %99, 1, !spirv.Decorations !305
  br label %98, !llvm.loop !564

135:                                              ; preds = %74
  %136 = zext i32 %11 to i64
  %137 = getelementptr float, ptr addrspace(3) %5, i64 %136
  store float %56, ptr addrspace(3) %137, align 4
  %138 = getelementptr float, ptr addrspace(3) %137, i64 16
  store float %72, ptr addrspace(3) %138, align 4
  br label %139

139:                                              ; preds = %135, %74
  %140 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %141 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %142 = or i32 %141, 32
  %143 = add nuw nsw i32 %140, %142, !spirv.Decorations !305
  br label %144

144:                                              ; preds = %157, %139
  %145 = phi i32 [ 0, %139 ], [ %158, %157 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %148 = icmp eq i32 %11, 0
  br i1 %148, label %.preheader1, label %284

.preheader1:                                      ; preds = %147
  br label %168

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !305
  %151 = sext i32 %145 to i64
  %152 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %151
  %153 = add nuw nsw i32 %150, %143, !spirv.Decorations !305
  br label %154

154:                                              ; preds = %159, %149
  %155 = phi i32 [ 0, %149 ], [ %167, %159 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %159, label %157

157:                                              ; preds = %154
  %158 = add nuw nsw i32 %145, 1, !spirv.Decorations !305
  br label %144, !llvm.loop !565

159:                                              ; preds = %154
  %160 = zext i32 %155 to i64
  %161 = bitcast ptr %152 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %161, i64 0, i32 0, i64 %160
  %163 = load float, ptr %162, align 4
  %164 = or i32 %153, %155
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %165
  store float %163, ptr addrspace(3) %166, align 4
  %167 = add nuw nsw i32 %155, 1, !spirv.Decorations !305
  br label %154, !llvm.loop !566

168:                                              ; preds = %171, %.preheader1
  %169 = phi i32 [ %174, %171 ], [ 0, %.preheader1 ]
  %170 = icmp ult i32 %169, 4
  br i1 %170, label %171, label %.preheader

.preheader:                                       ; preds = %168
  br label %177

171:                                              ; preds = %168
  %172 = zext i32 %169 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %169, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.198 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %168, !llvm.loop !567

177:                                              ; preds = %185, %.preheader
  %178 = phi i32 [ %190, %185 ], [ 0, %.preheader ]
  %179 = phi float [ %189, %185 ], [ 0xFFF0000000000000, %.preheader ]
  %180 = icmp ult i32 %178, 16
  br i1 %180, label %185, label %181

181:                                              ; preds = %177
  %182 = getelementptr inbounds float, ptr addrspace(3) %5, i64 16
  %183 = fcmp reassoc nsz arcp contract oeq float %179, 0xFFF0000000000000, !spirv.Decorations !308
  %184 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %191

185:                                              ; preds = %177
  %186 = zext i32 %178 to i64
  %187 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %186
  %188 = load float, ptr addrspace(3) %187, align 4
  %189 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %179, float %188) #0, !spirv.Decorations !308
  %190 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

191:                                              ; preds = %229, %181
  %192 = phi i32 [ %230, %229 ], [ 0, %181 ]
  %193 = phi float [ %220, %229 ], [ 0.000000e+00, %181 ]
  %194 = icmp ult i32 %192, 16
  br i1 %194, label %205, label %195

195:                                              ; preds = %191
  %196 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %193, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %197 = fdiv reassoc nsz arcp contract float 1.000000e+00, %196, !spirv.Decorations !308
  %198 = mul nuw i32 %18, 12, !spirv.Decorations !373
  %199 = zext i32 %198 to i64
  %200 = sext i32 %20 to i64
  %201 = add nsw i64 %199, %200, !spirv.Decorations !332
  %202 = shl nsw i64 %201, 8, !spirv.Decorations !332
  %203 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %202
  %204 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %259

205:                                              ; preds = %191
  %206 = zext i32 %192 to i64
  %207 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %206
  %208 = load float, ptr addrspace(3) %207, align 4
  %209 = zext i32 %192 to i64
  %210 = getelementptr inbounds float, ptr addrspace(3) %182, i64 %209
  %211 = load float, ptr addrspace(3) %210, align 4
  %212 = fcmp reassoc nsz arcp contract oeq float %208, 0xFFF0000000000000, !spirv.Decorations !308
  %213 = or i1 %212, %183
  br i1 %213, label %217, label %214

214:                                              ; preds = %205
  %215 = fsub reassoc nsz arcp contract float %208, %179, !spirv.Decorations !308
  %216 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %215) #0, !spirv.Decorations !308
  br label %217

217:                                              ; preds = %214, %205
  %218 = phi float [ %216, %214 ], [ 0.000000e+00, %205 ]
  %219 = fmul reassoc nsz arcp contract float %218, %211, !spirv.Decorations !308
  %220 = fadd reassoc nsz arcp contract float %193, %219, !spirv.Decorations !308
  %221 = shl nuw nsw i32 %192, 8, !spirv.Decorations !305
  %222 = or i32 %221, 32
  %223 = add nuw nsw i32 %184, %222, !spirv.Decorations !305
  %224 = insertelement <4 x float> undef, float %218, i32 0
  %225 = shufflevector <4 x float> %224, <4 x float> undef, <4 x i32> zeroinitializer
  br label %226

226:                                              ; preds = %238, %217
  %227 = phi i32 [ 0, %217 ], [ %249, %238 ]
  %228 = icmp ult i32 %227, 4
  br i1 %228, label %231, label %229

229:                                              ; preds = %226
  %230 = add nuw nsw i32 %192, 1, !spirv.Decorations !305
  br label %191

231:                                              ; preds = %226
  %232 = shl nuw nsw i32 %227, 6, !spirv.Decorations !305
  %233 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %233)
  %234 = add nuw nsw i32 %232, %223, !spirv.Decorations !305
  br label %235

235:                                              ; preds = %250, %231
  %236 = phi i32 [ 0, %231 ], [ %258, %250 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %250, label %238

238:                                              ; preds = %235
  %239 = sext i32 %227 to i64
  %240 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %239
  %241 = bitcast ptr %240 to ptr
  %242 = load <4 x float>, ptr %241, align 16, !noalias !568
  %243 = bitcast ptr %10 to ptr
  %244 = load <4 x float>, ptr %243, align 16, !noalias !577
  %245 = fmul reassoc nsz arcp contract <4 x float> %225, %244, !spirv.Decorations !308
  %246 = fadd reassoc nsz arcp contract <4 x float> %242, %245, !spirv.Decorations !308
  %247 = bitcast ptr %240 to ptr
  store <4 x float> %246, ptr %247, align 16
  %248 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %248)
  %249 = add nuw nsw i32 %227, 1, !spirv.Decorations !305
  br label %226, !llvm.loop !586

250:                                              ; preds = %235
  %251 = or i32 %234, %236
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %252
  %254 = load float, ptr addrspace(3) %253, align 4
  %255 = zext i32 %236 to i64
  %256 = bitcast ptr %10 to ptr
  %257 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %256, i64 0, i32 0, i64 %255
  store float %254, ptr %257, align 4
  %258 = add nuw nsw i32 %236, 1, !spirv.Decorations !305
  br label %235, !llvm.loop !587

259:                                              ; preds = %270, %195
  %260 = phi i32 [ 0, %195 ], [ %271, %270 ]
  %261 = icmp ult i32 %260, 4
  br i1 %261, label %262, label %.loopexit

262:                                              ; preds = %259
  %263 = shl nuw nsw i32 %260, 6, !spirv.Decorations !305
  %264 = add nuw nsw i32 %263, %204, !spirv.Decorations !305
  %265 = sext i32 %260 to i64
  %266 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %265
  br label %267

267:                                              ; preds = %272, %262
  %268 = phi i32 [ 0, %262 ], [ %283, %272 ]
  %269 = icmp ult i32 %268, 4
  br i1 %269, label %272, label %270

270:                                              ; preds = %267
  %271 = add nuw nsw i32 %260, 1, !spirv.Decorations !305
  br label %259, !llvm.loop !588

272:                                              ; preds = %267
  %273 = zext i32 %268 to i64
  %274 = bitcast ptr %266 to ptr
  %275 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %274, i64 0, i32 0, i64 %273
  %276 = load float, ptr %275, align 4
  %277 = fmul reassoc nsz arcp contract float %276, %197, !spirv.Decorations !308
  %278 = fptrunc float %277 to half
  %279 = or i32 %264, %268
  %280 = sext i32 %279 to i64
  %281 = bitcast ptr addrspace(1) %203 to ptr addrspace(1)
  %282 = getelementptr inbounds half, ptr addrspace(1) %281, i64 %280
  store half %278, ptr addrspace(1) %282, align 2
  %283 = add nuw nsw i32 %268, 1, !spirv.Decorations !305
  br label %267, !llvm.loop !589

.loopexit:                                        ; preds = %259
  br label %284

284:                                              ; preds = %.loopexit, %147
  %285 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %285)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi2ELi32EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 31, !spirv.Decorations !332
  %36 = sdiv i32 %35, 32
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = getelementptr float, ptr addrspace(1) %2, i64 %46
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.199 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !590

54:                                               ; preds = %62, %45
  %55 = phi i32 [ %69, %62 ], [ %37, %45 ]
  %56 = phi float [ %68, %62 ], [ 0xFFF0000000000000, %45 ]
  %57 = icmp slt i32 %55, %40
  br i1 %57, label %62, label %58

58:                                               ; preds = %54
  %59 = sext i32 %25 to i64
  %60 = fcmp reassoc nsz arcp contract oeq float %56, 0xFFF0000000000000, !spirv.Decorations !308
  %61 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %70

62:                                               ; preds = %54
  %63 = add nsw i32 %26, %55, !spirv.Decorations !332
  %64 = sext i32 %63 to i64
  %65 = shl nsw i64 %64, 6, !spirv.Decorations !332
  %66 = getelementptr float, ptr addrspace(1) %47, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %56, float %67) #0, !spirv.Decorations !308
  %69 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

70:                                               ; preds = %101, %58
  %71 = phi i32 [ %102, %101 ], [ %37, %58 ]
  %72 = phi float [ %93, %101 ], [ 0.000000e+00, %58 ]
  %73 = icmp slt i32 %71, %40
  br i1 %73, label %76, label %74

74:                                               ; preds = %70
  %75 = icmp eq i32 %13, 0
  br i1 %75, label %135, label %139

76:                                               ; preds = %70
  %77 = add nsw i32 %26, %71, !spirv.Decorations !332
  %78 = sext i32 %77 to i64
  %79 = shl nsw i64 %78, 6, !spirv.Decorations !332
  %80 = add nsw i64 %79, %59, !spirv.Decorations !332
  %81 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %80
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = fcmp reassoc nsz arcp contract oeq float %82, 0xFFF0000000000000, !spirv.Decorations !308
  %86 = or i1 %85, %60
  br i1 %86, label %90, label %87

87:                                               ; preds = %76
  %88 = fsub reassoc nsz arcp contract float %82, %56, !spirv.Decorations !308
  %89 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %88) #0, !spirv.Decorations !308
  br label %90

90:                                               ; preds = %87, %76
  %91 = phi float [ %89, %87 ], [ 0.000000e+00, %76 ]
  %92 = fmul reassoc nsz arcp contract float %91, %84, !spirv.Decorations !308
  %93 = fadd reassoc nsz arcp contract float %72, %92, !spirv.Decorations !308
  %94 = shl nsw i64 %80, 8, !spirv.Decorations !332
  %95 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %94
  %96 = insertelement <4 x float> undef, float %92, i32 0
  %97 = shufflevector <4 x float> %96, <4 x float> undef, <4 x i32> zeroinitializer
  br label %98

98:                                               ; preds = %123, %90
  %99 = phi i32 [ 0, %90 ], [ %134, %123 ]
  %100 = icmp ult i32 %99, 4
  br i1 %100, label %103, label %101

101:                                              ; preds = %98
  %102 = add nsw i32 %71, 1, !spirv.Decorations !332
  br label %70

103:                                              ; preds = %98
  %104 = shl nuw nsw i32 %99, 6, !spirv.Decorations !305
  %105 = add nuw nsw i32 %104, %61, !spirv.Decorations !305
  %106 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %106)
  %107 = zext i32 %105 to i64
  %108 = getelementptr inbounds float, ptr addrspace(1) %95, i64 %107
  %109 = addrspacecast ptr addrspace(1) %108 to ptr addrspace(4)
  %110 = bitcast ptr addrspace(4) %109 to ptr addrspace(4)
  %111 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %110, i32 5) #0
  br label %112

112:                                              ; preds = %115, %103
  %113 = phi i32 [ 0, %103 ], [ %122, %115 ]
  %114 = icmp ult i32 %113, 4
  br i1 %114, label %115, label %123

115:                                              ; preds = %112
  %116 = zext i32 %113 to i64
  %117 = bitcast ptr addrspace(1) %111 to ptr addrspace(1)
  %118 = getelementptr inbounds float, ptr addrspace(1) %117, i64 %116
  %119 = load float, ptr addrspace(1) %118, align 4
  %120 = bitcast ptr %9 to ptr
  %121 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %120, i64 0, i32 0, i64 %116
  store float %119, ptr %121, align 4
  %122 = add nuw nsw i32 %113, 1, !spirv.Decorations !305
  br label %112

123:                                              ; preds = %112
  %124 = sext i32 %99 to i64
  %125 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %124
  %126 = bitcast ptr %125 to ptr
  %127 = load <4 x float>, ptr %126, align 16, !noalias !591
  %128 = bitcast ptr %9 to ptr
  %129 = load <4 x float>, ptr %128, align 16, !noalias !600
  %130 = fmul reassoc nsz arcp contract <4 x float> %97, %129, !spirv.Decorations !308
  %131 = fadd reassoc nsz arcp contract <4 x float> %127, %130, !spirv.Decorations !308
  %132 = bitcast ptr %125 to ptr
  store <4 x float> %131, ptr %132, align 16
  %133 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %133)
  %134 = add nuw nsw i32 %99, 1, !spirv.Decorations !305
  br label %98, !llvm.loop !609

135:                                              ; preds = %74
  %136 = zext i32 %11 to i64
  %137 = getelementptr float, ptr addrspace(3) %5, i64 %136
  store float %56, ptr addrspace(3) %137, align 4
  %138 = getelementptr float, ptr addrspace(3) %137, i64 32
  store float %72, ptr addrspace(3) %138, align 4
  br label %139

139:                                              ; preds = %135, %74
  %140 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %141 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %142 = or i32 %141, 64
  %143 = add nuw nsw i32 %140, %142, !spirv.Decorations !305
  br label %144

144:                                              ; preds = %157, %139
  %145 = phi i32 [ 0, %139 ], [ %158, %157 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %148 = icmp eq i32 %11, 0
  br i1 %148, label %.preheader1, label %284

.preheader1:                                      ; preds = %147
  br label %168

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !305
  %151 = sext i32 %145 to i64
  %152 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %151
  %153 = add nuw nsw i32 %150, %143, !spirv.Decorations !305
  br label %154

154:                                              ; preds = %159, %149
  %155 = phi i32 [ 0, %149 ], [ %167, %159 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %159, label %157

157:                                              ; preds = %154
  %158 = add nuw nsw i32 %145, 1, !spirv.Decorations !305
  br label %144, !llvm.loop !610

159:                                              ; preds = %154
  %160 = zext i32 %155 to i64
  %161 = bitcast ptr %152 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %161, i64 0, i32 0, i64 %160
  %163 = load float, ptr %162, align 4
  %164 = or i32 %153, %155
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %165
  store float %163, ptr addrspace(3) %166, align 4
  %167 = add nuw nsw i32 %155, 1, !spirv.Decorations !305
  br label %154, !llvm.loop !611

168:                                              ; preds = %171, %.preheader1
  %169 = phi i32 [ %174, %171 ], [ 0, %.preheader1 ]
  %170 = icmp ult i32 %169, 4
  br i1 %170, label %171, label %.preheader

.preheader:                                       ; preds = %168
  br label %177

171:                                              ; preds = %168
  %172 = zext i32 %169 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %169, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.200 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %168, !llvm.loop !612

177:                                              ; preds = %185, %.preheader
  %178 = phi i32 [ %190, %185 ], [ 0, %.preheader ]
  %179 = phi float [ %189, %185 ], [ 0xFFF0000000000000, %.preheader ]
  %180 = icmp ult i32 %178, 32
  br i1 %180, label %185, label %181

181:                                              ; preds = %177
  %182 = getelementptr inbounds float, ptr addrspace(3) %5, i64 32
  %183 = fcmp reassoc nsz arcp contract oeq float %179, 0xFFF0000000000000, !spirv.Decorations !308
  %184 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %191

185:                                              ; preds = %177
  %186 = zext i32 %178 to i64
  %187 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %186
  %188 = load float, ptr addrspace(3) %187, align 4
  %189 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %179, float %188) #0, !spirv.Decorations !308
  %190 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

191:                                              ; preds = %229, %181
  %192 = phi i32 [ %230, %229 ], [ 0, %181 ]
  %193 = phi float [ %220, %229 ], [ 0.000000e+00, %181 ]
  %194 = icmp ult i32 %192, 32
  br i1 %194, label %205, label %195

195:                                              ; preds = %191
  %196 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %193, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %197 = fdiv reassoc nsz arcp contract float 1.000000e+00, %196, !spirv.Decorations !308
  %198 = mul nuw i32 %18, 12, !spirv.Decorations !373
  %199 = zext i32 %198 to i64
  %200 = sext i32 %20 to i64
  %201 = add nsw i64 %199, %200, !spirv.Decorations !332
  %202 = shl nsw i64 %201, 8, !spirv.Decorations !332
  %203 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %202
  %204 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %259

205:                                              ; preds = %191
  %206 = zext i32 %192 to i64
  %207 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %206
  %208 = load float, ptr addrspace(3) %207, align 4
  %209 = zext i32 %192 to i64
  %210 = getelementptr inbounds float, ptr addrspace(3) %182, i64 %209
  %211 = load float, ptr addrspace(3) %210, align 4
  %212 = fcmp reassoc nsz arcp contract oeq float %208, 0xFFF0000000000000, !spirv.Decorations !308
  %213 = or i1 %212, %183
  br i1 %213, label %217, label %214

214:                                              ; preds = %205
  %215 = fsub reassoc nsz arcp contract float %208, %179, !spirv.Decorations !308
  %216 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %215) #0, !spirv.Decorations !308
  br label %217

217:                                              ; preds = %214, %205
  %218 = phi float [ %216, %214 ], [ 0.000000e+00, %205 ]
  %219 = fmul reassoc nsz arcp contract float %218, %211, !spirv.Decorations !308
  %220 = fadd reassoc nsz arcp contract float %193, %219, !spirv.Decorations !308
  %221 = shl nuw nsw i32 %192, 8, !spirv.Decorations !305
  %222 = or i32 %221, 64
  %223 = add nuw nsw i32 %184, %222, !spirv.Decorations !305
  %224 = insertelement <4 x float> undef, float %218, i32 0
  %225 = shufflevector <4 x float> %224, <4 x float> undef, <4 x i32> zeroinitializer
  br label %226

226:                                              ; preds = %238, %217
  %227 = phi i32 [ 0, %217 ], [ %249, %238 ]
  %228 = icmp ult i32 %227, 4
  br i1 %228, label %231, label %229

229:                                              ; preds = %226
  %230 = add nuw nsw i32 %192, 1, !spirv.Decorations !305
  br label %191

231:                                              ; preds = %226
  %232 = shl nuw nsw i32 %227, 6, !spirv.Decorations !305
  %233 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %233)
  %234 = add nuw nsw i32 %232, %223, !spirv.Decorations !305
  br label %235

235:                                              ; preds = %250, %231
  %236 = phi i32 [ 0, %231 ], [ %258, %250 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %250, label %238

238:                                              ; preds = %235
  %239 = sext i32 %227 to i64
  %240 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %239
  %241 = bitcast ptr %240 to ptr
  %242 = load <4 x float>, ptr %241, align 16, !noalias !613
  %243 = bitcast ptr %10 to ptr
  %244 = load <4 x float>, ptr %243, align 16, !noalias !622
  %245 = fmul reassoc nsz arcp contract <4 x float> %225, %244, !spirv.Decorations !308
  %246 = fadd reassoc nsz arcp contract <4 x float> %242, %245, !spirv.Decorations !308
  %247 = bitcast ptr %240 to ptr
  store <4 x float> %246, ptr %247, align 16
  %248 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %248)
  %249 = add nuw nsw i32 %227, 1, !spirv.Decorations !305
  br label %226, !llvm.loop !631

250:                                              ; preds = %235
  %251 = or i32 %234, %236
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %252
  %254 = load float, ptr addrspace(3) %253, align 4
  %255 = zext i32 %236 to i64
  %256 = bitcast ptr %10 to ptr
  %257 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %256, i64 0, i32 0, i64 %255
  store float %254, ptr %257, align 4
  %258 = add nuw nsw i32 %236, 1, !spirv.Decorations !305
  br label %235, !llvm.loop !632

259:                                              ; preds = %270, %195
  %260 = phi i32 [ 0, %195 ], [ %271, %270 ]
  %261 = icmp ult i32 %260, 4
  br i1 %261, label %262, label %.loopexit

262:                                              ; preds = %259
  %263 = shl nuw nsw i32 %260, 6, !spirv.Decorations !305
  %264 = add nuw nsw i32 %263, %204, !spirv.Decorations !305
  %265 = sext i32 %260 to i64
  %266 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %265
  br label %267

267:                                              ; preds = %272, %262
  %268 = phi i32 [ 0, %262 ], [ %283, %272 ]
  %269 = icmp ult i32 %268, 4
  br i1 %269, label %272, label %270

270:                                              ; preds = %267
  %271 = add nuw nsw i32 %260, 1, !spirv.Decorations !305
  br label %259, !llvm.loop !633

272:                                              ; preds = %267
  %273 = zext i32 %268 to i64
  %274 = bitcast ptr %266 to ptr
  %275 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %274, i64 0, i32 0, i64 %273
  %276 = load float, ptr %275, align 4
  %277 = fmul reassoc nsz arcp contract float %276, %197, !spirv.Decorations !308
  %278 = fptrunc float %277 to half
  %279 = or i32 %264, %268
  %280 = sext i32 %279 to i64
  %281 = bitcast ptr addrspace(1) %203 to ptr addrspace(1)
  %282 = getelementptr inbounds half, ptr addrspace(1) %281, i64 %280
  store half %278, ptr addrspace(1) %282, align 2
  %283 = add nuw nsw i32 %268, 1, !spirv.Decorations !305
  br label %267, !llvm.loop !634

.loopexit:                                        ; preds = %259
  br label %284

284:                                              ; preds = %.loopexit, %147
  %285 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %285)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 7, !spirv.Decorations !332
  %36 = sdiv i32 %35, 8
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.201 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !635

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !332
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !332
  %65 = add nsw i64 %64, %46, !spirv.Decorations !332
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !308
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !308
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !308
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !308
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !308
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !308
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !308
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !308
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !308
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !308
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !332
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !305
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !305
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !305
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !636
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !308
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !645
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !308
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !308
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !305
  br label %94, !llvm.loop !654

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 8
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %139 = or i32 %138, 16
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !305
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %283

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !305
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !305
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !305
  br label %141, !llvm.loop !655

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !305
  br label %151, !llvm.loop !656

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 8
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.202 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !657

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 8
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !308
  %185 = mul nuw i32 %18, 12, !spirv.Decorations !373
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !332
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !332
  %190 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !308
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !308
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !308
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !308
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !308
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !308
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !308
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !308
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !308
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !308
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !305
  %218 = or i32 %217, 16
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !305
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !305
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !305
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !658
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !308
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !667
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !308
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !308
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !305
  br label %224, !llvm.loop !676

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !305
  br label %233, !llvm.loop !677

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !305
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !305
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %282, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !305
  br label %258, !llvm.loop !678

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !308
  %277 = fptrunc float %276 to half
  %278 = or i32 %263, %267
  %279 = sext i32 %278 to i64
  %280 = bitcast ptr addrspace(1) %190 to ptr addrspace(1)
  %281 = getelementptr inbounds half, ptr addrspace(1) %280, i64 %279
  store half %277, ptr addrspace(1) %281, align 2
  %282 = add nuw nsw i32 %267, 1, !spirv.Decorations !305
  br label %266, !llvm.loop !679

.loopexit:                                        ; preds = %258
  br label %283

283:                                              ; preds = %.loopexit, %144
  %284 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %284)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 15, !spirv.Decorations !332
  %36 = sdiv i32 %35, 16
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.203 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !680

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !332
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !332
  %65 = add nsw i64 %64, %46, !spirv.Decorations !332
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !308
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !308
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !308
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !308
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !308
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !308
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !308
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !308
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !308
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !308
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !332
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !305
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !305
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !305
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !681
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !308
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !690
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !308
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !308
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !305
  br label %94, !llvm.loop !699

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 16
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %139 = or i32 %138, 32
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !305
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %283

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !305
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !305
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !305
  br label %141, !llvm.loop !700

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !305
  br label %151, !llvm.loop !701

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 16
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.204 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !702

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 16
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !308
  %185 = mul nuw i32 %18, 12, !spirv.Decorations !373
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !332
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !332
  %190 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !308
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !308
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !308
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !308
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !308
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !308
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !308
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !308
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !308
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !308
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !305
  %218 = or i32 %217, 32
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !305
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !305
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !305
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !703
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !308
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !712
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !308
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !308
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !305
  br label %224, !llvm.loop !721

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !305
  br label %233, !llvm.loop !722

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !305
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !305
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %282, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !305
  br label %258, !llvm.loop !723

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !308
  %277 = fptrunc float %276 to half
  %278 = or i32 %263, %267
  %279 = sext i32 %278 to i64
  %280 = bitcast ptr addrspace(1) %190 to ptr addrspace(1)
  %281 = getelementptr inbounds half, ptr addrspace(1) %280, i64 %279
  store half %277, ptr addrspace(1) %281, align 2
  %282 = add nuw nsw i32 %267, 1, !spirv.Decorations !305
  br label %266, !llvm.loop !724

.loopexit:                                        ; preds = %258
  br label %283

283:                                              ; preds = %.loopexit, %144
  %284 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %284)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 12
  %19 = mul nsw i32 %18, -12, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 31, !spirv.Decorations !332
  %36 = sdiv i32 %35, 32
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.205 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !725

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !332
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !332
  %65 = add nsw i64 %64, %46, !spirv.Decorations !332
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !308
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !308
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !308
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !308
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !308
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !308
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !308
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !308
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !308
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !308
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !332
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !305
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !305
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !305
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !726
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !308
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !735
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !308
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !308
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !305
  br label %94, !llvm.loop !744

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 32
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %139 = or i32 %138, 64
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !305
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %283

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !305
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !305
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !305
  br label %141, !llvm.loop !745

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !305
  br label %151, !llvm.loop !746

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 32
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.206 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !747

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 32
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !308
  %185 = mul nuw i32 %18, 12, !spirv.Decorations !373
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !332
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !332
  %190 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !308
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !308
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !308
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !308
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !308
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !308
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !308
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !308
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !308
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !308
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !305
  %218 = or i32 %217, 64
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !305
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !305
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !305
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !748
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !308
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !757
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !308
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !308
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !305
  br label %224, !llvm.loop !766

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !305
  br label %233, !llvm.loop !767

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !305
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !305
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %282, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !305
  br label %258, !llvm.loop !768

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !308
  %277 = fptrunc float %276 to half
  %278 = or i32 %263, %267
  %279 = sext i32 %278 to i64
  %280 = bitcast ptr addrspace(1) %190 to ptr addrspace(1)
  %281 = getelementptr inbounds half, ptr addrspace(1) %280, i64 %279
  store half %277, ptr addrspace(1) %281, align 2
  %282 = add nuw nsw i32 %267, 1, !spirv.Decorations !305
  br label %266, !llvm.loop !769

.loopexit:                                        ; preds = %258
  br label %283

283:                                              ; preds = %.loopexit, %144
  %284 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %284)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_133Xe2KvTorchAbiS2MergeOutHalfKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !770 !kernel_arg_access_qual !326 !kernel_arg_type !771 !kernel_arg_type_qual !328 !kernel_arg_base_type !771 !kernel_arg_name !328 !spirv.ParameterDecorations !772 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %11 = icmp ult i64 %10, 2147483648
  call void @llvm.assume(i1 %11)
  %12 = trunc i64 %10 to i32
  %13 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %16 = icmp sgt i32 %15, -1
  call void @llvm.assume(i1 %16)
  %17 = shl nsw i32 %12, 3, !spirv.Decorations !332
  %18 = add nuw nsw i32 %17, %13, !spirv.Decorations !305
  %19 = lshr i32 %18, 6
  %20 = and i32 %18, 63
  %21 = mul nsw i32 %19, %0, !spirv.Decorations !332
  %22 = load i32, ptr addrspace(1) %1, align 4
  %23 = sext i32 %22 to i64
  %24 = sext i32 %0 to i64
  %25 = add nsw i64 %23, 63, !spirv.Decorations !332
  %26 = sdiv i64 %25, 64
  %27 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %24, i64 %26) #0
  %28 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %27) #0
  %29 = trunc i64 %28 to i32
  %30 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %30)
  br label %31

31:                                               ; preds = %37, %7
  %32 = phi i32 [ 0, %7 ], [ %40, %37 ]
  %33 = icmp ult i32 %32, 4
  br i1 %33, label %37, label %34

34:                                               ; preds = %31
  %35 = zext i32 %20 to i64
  %36 = shl nsw i32 %15, 2, !spirv.Decorations !332
  br label %43

37:                                               ; preds = %31
  %38 = zext i32 %32 to i64
  %39 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %38
  %40 = add nuw nsw i32 %32, 1, !spirv.Decorations !305
  %41 = bitcast ptr %39 to ptr
  %42 = bitcast ptr addrspace(2) @gVar.207 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %41, ptr addrspace(2) align 16 %42, i64 16, i1 false)
  br label %31, !llvm.loop !773

43:                                               ; preds = %89, %34
  %44 = phi i32 [ %90, %89 ], [ 0, %34 ]
  %45 = phi float [ %79, %89 ], [ 0.000000e+00, %34 ]
  %46 = phi float [ %62, %89 ], [ 0xFFF0000000000000, %34 ]
  %47 = icmp slt i32 %44, %29
  br i1 %47, label %53, label %48

48:                                               ; preds = %43
  %49 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %45, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %50 = fdiv reassoc nsz arcp contract float 1.000000e+00, %49, !spirv.Decorations !308
  %51 = udiv i32 %20, 6
  %52 = icmp slt i32 %51, %5
  br i1 %52, label %124, label %160

53:                                               ; preds = %43
  %54 = add nsw i32 %21, %44, !spirv.Decorations !332
  %55 = sext i32 %54 to i64
  %56 = shl nsw i64 %55, 6, !spirv.Decorations !332
  %57 = or i64 %56, %35
  %58 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %57
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %46, float %59) #0, !spirv.Decorations !308
  %63 = fcmp reassoc nsz arcp contract oeq float %46, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %63, label %67, label %64

64:                                               ; preds = %53
  %65 = fsub reassoc nsz arcp contract float %46, %62, !spirv.Decorations !308
  %66 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %65) #0, !spirv.Decorations !308
  br label %67

67:                                               ; preds = %64, %53
  %68 = phi float [ %66, %64 ], [ 0.000000e+00, %53 ]
  %69 = fcmp reassoc nsz arcp contract oeq float %59, 0xFFF0000000000000, !spirv.Decorations !308
  %70 = fcmp reassoc nsz arcp contract oeq float %62, 0xFFF0000000000000, !spirv.Decorations !308
  %71 = or i1 %69, %70
  br i1 %71, label %75, label %72

72:                                               ; preds = %67
  %73 = fsub reassoc nsz arcp contract float %59, %62, !spirv.Decorations !308
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !308
  br label %75

75:                                               ; preds = %72, %67
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %67 ]
  %77 = fmul reassoc nsz arcp contract float %76, %61, !spirv.Decorations !308
  %78 = fmul reassoc nsz arcp contract float %45, %68, !spirv.Decorations !308
  %79 = fadd reassoc nsz arcp contract float %78, %77, !spirv.Decorations !308
  %80 = shl nsw i64 %57, 8, !spirv.Decorations !332
  %81 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %80
  %82 = insertelement <4 x float> undef, float %68, i32 0
  %83 = shufflevector <4 x float> %82, <4 x float> undef, <4 x i32> zeroinitializer
  %84 = insertelement <4 x float> undef, float %77, i32 0
  %85 = shufflevector <4 x float> %84, <4 x float> undef, <4 x i32> zeroinitializer
  br label %86

86:                                               ; preds = %111, %75
  %87 = phi i32 [ 0, %75 ], [ %123, %111 ]
  %88 = icmp ult i32 %87, 4
  br i1 %88, label %91, label %89

89:                                               ; preds = %86
  %90 = add nuw nsw i32 %44, 1, !spirv.Decorations !305
  br label %43

91:                                               ; preds = %86
  %92 = shl nuw nsw i32 %87, 6, !spirv.Decorations !305
  %93 = add nuw nsw i32 %92, %36, !spirv.Decorations !305
  %94 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %94)
  %95 = zext i32 %93 to i64
  %96 = getelementptr inbounds float, ptr addrspace(1) %81, i64 %95
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  %98 = bitcast ptr addrspace(4) %97 to ptr addrspace(4)
  %99 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %98, i32 5) #0
  br label %100

100:                                              ; preds = %103, %91
  %101 = phi i32 [ 0, %91 ], [ %110, %103 ]
  %102 = icmp ult i32 %101, 4
  br i1 %102, label %103, label %111

103:                                              ; preds = %100
  %104 = zext i32 %101 to i64
  %105 = bitcast ptr addrspace(1) %99 to ptr addrspace(1)
  %106 = getelementptr inbounds float, ptr addrspace(1) %105, i64 %104
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = bitcast ptr %9 to ptr
  %109 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %108, i64 0, i32 0, i64 %104
  store float %107, ptr %109, align 4
  %110 = add nuw nsw i32 %101, 1, !spirv.Decorations !305
  br label %100

111:                                              ; preds = %100
  %112 = sext i32 %87 to i64
  %113 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %112
  %114 = bitcast ptr %113 to ptr
  %115 = load <4 x float>, ptr %114, align 16, !noalias !774
  %116 = fmul reassoc nsz arcp contract <4 x float> %115, %83, !spirv.Decorations !308
  %117 = bitcast ptr %9 to ptr
  %118 = load <4 x float>, ptr %117, align 16, !noalias !783
  %119 = fmul reassoc nsz arcp contract <4 x float> %85, %118, !spirv.Decorations !308
  %120 = fadd reassoc nsz arcp contract <4 x float> %116, %119, !spirv.Decorations !308
  %121 = bitcast ptr %113 to ptr
  store <4 x float> %120, ptr %121, align 16
  %122 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %122)
  %123 = add nuw nsw i32 %87, 1, !spirv.Decorations !305
  br label %86, !llvm.loop !792

124:                                              ; preds = %48
  %125 = mul i32 %51, 6
  %126 = sub i32 %20, %125
  %127 = mul nuw nsw i32 %19, 6, !spirv.Decorations !305
  %128 = add nuw nsw i32 %127, %126, !spirv.Decorations !305
  %129 = mul nuw nsw i32 %51, 12, !spirv.Decorations !305
  %130 = add nuw nsw i32 %129, %128, !spirv.Decorations !305
  %131 = zext i32 %130 to i64
  %132 = shl nuw nsw i64 %131, 8, !spirv.Decorations !305
  %133 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %132
  %134 = shl nsw i32 %15, 2, !spirv.Decorations !332
  br label %135

135:                                              ; preds = %146, %124
  %136 = phi i32 [ 0, %124 ], [ %147, %146 ]
  %137 = icmp ult i32 %136, 4
  br i1 %137, label %138, label %.loopexit

138:                                              ; preds = %135
  %139 = shl nuw nsw i32 %136, 6, !spirv.Decorations !305
  %140 = add nuw nsw i32 %139, %134, !spirv.Decorations !305
  %141 = sext i32 %136 to i64
  %142 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %141
  br label %143

143:                                              ; preds = %148, %138
  %144 = phi i32 [ 0, %138 ], [ %159, %148 ]
  %145 = icmp ult i32 %144, 4
  br i1 %145, label %148, label %146

146:                                              ; preds = %143
  %147 = add nuw nsw i32 %136, 1, !spirv.Decorations !305
  br label %135, !llvm.loop !793

148:                                              ; preds = %143
  %149 = zext i32 %144 to i64
  %150 = bitcast ptr %142 to ptr
  %151 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %150, i64 0, i32 0, i64 %149
  %152 = load float, ptr %151, align 4
  %153 = fmul reassoc nsz arcp contract float %152, %50, !spirv.Decorations !308
  %154 = fptrunc float %153 to half
  %155 = or i32 %140, %144
  %156 = sext i32 %155 to i64
  %157 = bitcast ptr addrspace(1) %133 to ptr addrspace(1)
  %158 = getelementptr inbounds half, ptr addrspace(1) %157, i64 %156
  store half %154, ptr addrspace(1) %158, align 2
  %159 = add nuw nsw i32 %144, 1, !spirv.Decorations !305
  br label %143, !llvm.loop !794

.loopexit:                                        ; preds = %135
  br label %160

160:                                              ; preds = %.loopexit, %48
  %161 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %161)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS2ParallelHalf8P16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !339 !kernel_arg_type_qual !328 !kernel_arg_base_type !339 !kernel_arg_name !328 !spirv.ParameterDecorations !340 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !330
  %10 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %11 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %12 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %13 = icmp sgt i32 %12, -1
  call void @llvm.assume(i1 %13)
  %14 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %15 = icmp sgt i32 %14, -1
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %17 = icmp ult i64 %16, 2147483648
  call void @llvm.assume(i1 %17)
  %18 = trunc i64 %16 to i32
  %19 = udiv i32 %18, 24
  %20 = mul nsw i32 %19, -24, !spirv.Decorations !332
  %21 = add nsw i32 %20, %18, !spirv.Decorations !332
  %22 = sdiv i32 %21, 6
  %23 = mul nuw nsw i32 %19, 6, !spirv.Decorations !305
  %24 = mul nsw i32 %22, -6, !spirv.Decorations !332
  %25 = add nsw i32 %24, %21, !spirv.Decorations !332
  %26 = add nsw i32 %23, %25, !spirv.Decorations !332
  %27 = mul nsw i32 %22, %0, !spirv.Decorations !332
  %28 = load i32, ptr addrspace(1) %1, align 4
  %29 = sext i32 %28 to i64
  %30 = sext i32 %0 to i64
  %31 = add nsw i64 %29, 63, !spirv.Decorations !332
  %32 = sdiv i64 %31, 64
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %30, i64 %32) #0
  %34 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %33) #0
  %35 = trunc i64 %34 to i32
  %36 = add nsw i32 %35, 7, !spirv.Decorations !332
  %37 = sdiv i32 %36, 8
  %38 = mul nsw i32 %37, %12, !spirv.Decorations !332
  %39 = add nsw i32 %38, %37, !spirv.Decorations !332
  %40 = icmp slt i32 %39, %35
  %41 = select i1 %40, i32 %39, i32 %35
  %42 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %42)
  br label %43

43:                                               ; preds = %49, %7
  %44 = phi i32 [ 0, %7 ], [ %52, %49 ]
  %45 = icmp ult i32 %44, 4
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %47)
  %48 = icmp slt i32 %38, %41
  br i1 %48, label %55, label %96

49:                                               ; preds = %43
  %50 = zext i32 %44 to i64
  %51 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %50
  %52 = add nuw nsw i32 %44, 1, !spirv.Decorations !305
  %53 = bitcast ptr %51 to ptr
  %54 = bitcast ptr addrspace(2) @gVar.208 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %53, ptr addrspace(2) align 16 %54, i64 16, i1 false)
  br label %43, !llvm.loop !795

55:                                               ; preds = %46
  %56 = add nsw i32 %27, %38, !spirv.Decorations !332
  %57 = sext i32 %56 to i64
  %58 = shl nsw i64 %57, 6, !spirv.Decorations !332
  %59 = sext i32 %26 to i64
  %60 = add nsw i64 %58, %59, !spirv.Decorations !332
  %61 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4
  %63 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %60
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %66 = shl nsw i64 %60, 8, !spirv.Decorations !332
  %67 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %66
  br label %68

68:                                               ; preds = %94, %55
  %69 = phi i32 [ 0, %55 ], [ %95, %94 ]
  %70 = icmp ult i32 %69, 4
  br i1 %70, label %71, label %.loopexit2

71:                                               ; preds = %68
  %72 = shl nuw nsw i32 %69, 6, !spirv.Decorations !305
  %73 = add nuw nsw i32 %72, %65, !spirv.Decorations !305
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %74
  %76 = zext i32 %73 to i64
  %77 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %67, i64 %76
  %78 = addrspacecast ptr addrspace(1) %77 to ptr addrspace(4)
  %79 = bitcast ptr addrspace(4) %78 to ptr addrspace(4)
  %80 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %79, i32 5) #0
  br label %81

81:                                               ; preds = %84, %71
  %82 = phi i32 [ 0, %71 ], [ %93, %84 ]
  %83 = icmp ult i32 %82, 4
  br i1 %83, label %84, label %94

84:                                               ; preds = %81
  %85 = zext i32 %82 to i64
  %86 = bitcast ptr addrspace(1) %80 to ptr addrspace(1)
  %87 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %86, i64 %85
  %88 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %87, i64 0, i32 0
  %89 = bitcast ptr %75 to ptr
  %90 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %89, i64 0, i32 0, i64 %85
  %91 = load half, ptr addrspace(1) %88, align 2
  %92 = bitcast ptr %90 to ptr
  store half %91, ptr %92, align 2
  %93 = add nuw nsw i32 %82, 1, !spirv.Decorations !305
  br label %81

94:                                               ; preds = %81
  %95 = add nuw nsw i32 %69, 1, !spirv.Decorations !305
  br label %68, !llvm.loop !796

.loopexit2:                                       ; preds = %68
  br label %96

96:                                               ; preds = %.loopexit2, %46
  %97 = phi float [ 0.000000e+00, %46 ], [ %64, %.loopexit2 ]
  %98 = phi float [ 0xFFF0000000000000, %46 ], [ %62, %.loopexit2 ]
  %99 = add i32 %27, 1
  %100 = sext i32 %26 to i64
  %101 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %102

102:                                              ; preds = %196, %96
  %103 = phi i32 [ %38, %96 ], [ %118, %196 ]
  %104 = phi float [ %97, %96 ], [ %169, %196 ]
  %105 = phi float [ %98, %96 ], [ %170, %196 ]
  %106 = phi float [ 0.000000e+00, %96 ], [ %188, %196 ]
  %107 = phi float [ 0xFFF0000000000000, %96 ], [ %171, %196 ]
  %108 = icmp slt i32 %103, %41
  br i1 %108, label %112, label %109

109:                                              ; preds = %102
  %110 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %110)
  %111 = icmp eq i32 %14, 0
  br i1 %111, label %211, label %215

112:                                              ; preds = %102
  %113 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %113)
  br label %114

114:                                              ; preds = %120, %112
  %115 = phi i32 [ 0, %112 ], [ %128, %120 ]
  %116 = icmp ult i32 %115, 4
  br i1 %116, label %120, label %117

117:                                              ; preds = %114
  %118 = add nsw i32 %103, 1, !spirv.Decorations !332
  %119 = icmp slt i32 %118, %41
  br i1 %119, label %129, label %168

120:                                              ; preds = %114
  %121 = zext i32 %115 to i64
  %122 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %121
  %123 = bitcast ptr %122 to ptr
  %124 = load <4 x half>, ptr %123, align 8, !noalias !797
  %125 = call spir_func <4 x float> @_Z28__spirv_FConvert_Rfloat4_rteDv4_Dh(<4 x half> %124) #0, !spirv.Decorations !347
  %126 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %121
  %127 = bitcast ptr %126 to ptr
  store <4 x float> %125, ptr %127, align 16
  %128 = add nuw nsw i32 %115, 1, !spirv.Decorations !305
  br label %114, !llvm.loop !800

129:                                              ; preds = %117
  %130 = add i32 %103, %99
  %131 = sext i32 %130 to i64
  %132 = shl nsw i64 %131, 6, !spirv.Decorations !332
  %133 = add nsw i64 %132, %100, !spirv.Decorations !332
  %134 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %133
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = shl nsw i64 %133, 8, !spirv.Decorations !332
  %139 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %138
  br label %140

140:                                              ; preds = %166, %129
  %141 = phi i32 [ 0, %129 ], [ %167, %166 ]
  %142 = icmp ult i32 %141, 4
  br i1 %142, label %143, label %.loopexit1

143:                                              ; preds = %140
  %144 = shl nuw nsw i32 %141, 6, !spirv.Decorations !305
  %145 = add nuw nsw i32 %144, %101, !spirv.Decorations !305
  %146 = zext i32 %141 to i64
  %147 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %146
  %148 = zext i32 %145 to i64
  %149 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %139, i64 %148
  %150 = addrspacecast ptr addrspace(1) %149 to ptr addrspace(4)
  %151 = bitcast ptr addrspace(4) %150 to ptr addrspace(4)
  %152 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %151, i32 5) #0
  br label %153

153:                                              ; preds = %156, %143
  %154 = phi i32 [ 0, %143 ], [ %165, %156 ]
  %155 = icmp ult i32 %154, 4
  br i1 %155, label %156, label %166

156:                                              ; preds = %153
  %157 = zext i32 %154 to i64
  %158 = bitcast ptr addrspace(1) %152 to ptr addrspace(1)
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %158, i64 %157
  %160 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %159, i64 0, i32 0
  %161 = bitcast ptr %147 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %161, i64 0, i32 0, i64 %157
  %163 = load half, ptr addrspace(1) %160, align 2
  %164 = bitcast ptr %162 to ptr
  store half %163, ptr %164, align 2
  %165 = add nuw nsw i32 %154, 1, !spirv.Decorations !305
  br label %153

166:                                              ; preds = %153
  %167 = add nuw nsw i32 %141, 1, !spirv.Decorations !305
  br label %140, !llvm.loop !801

.loopexit1:                                       ; preds = %140
  br label %168

168:                                              ; preds = %.loopexit1, %117
  %169 = phi float [ %104, %117 ], [ %137, %.loopexit1 ]
  %170 = phi float [ %105, %117 ], [ %135, %.loopexit1 ]
  %171 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %107, float %105) #0, !spirv.Decorations !308
  %172 = fcmp reassoc nsz arcp contract oeq float %107, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %172, label %176, label %173

173:                                              ; preds = %168
  %174 = fsub reassoc nsz arcp contract float %107, %171, !spirv.Decorations !308
  %175 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %174) #0, !spirv.Decorations !308
  br label %176

176:                                              ; preds = %173, %168
  %177 = phi float [ %175, %173 ], [ 0.000000e+00, %168 ]
  %178 = fcmp reassoc nsz arcp contract oeq float %105, 0xFFF0000000000000, !spirv.Decorations !308
  %179 = fcmp reassoc nsz arcp contract oeq float %171, 0xFFF0000000000000, !spirv.Decorations !308
  %180 = or i1 %178, %179
  br i1 %180, label %184, label %181

181:                                              ; preds = %176
  %182 = fsub reassoc nsz arcp contract float %105, %171, !spirv.Decorations !308
  %183 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %182) #0, !spirv.Decorations !308
  br label %184

184:                                              ; preds = %181, %176
  %185 = phi float [ %183, %181 ], [ 0.000000e+00, %176 ]
  %186 = fmul reassoc nsz arcp contract float %185, %104, !spirv.Decorations !308
  %187 = fmul reassoc nsz arcp contract float %106, %177, !spirv.Decorations !308
  %188 = fadd reassoc nsz arcp contract float %187, %186, !spirv.Decorations !308
  %189 = insertelement <4 x float> undef, float %177, i32 0
  %190 = shufflevector <4 x float> %189, <4 x float> undef, <4 x i32> zeroinitializer
  %191 = insertelement <4 x float> undef, float %186, i32 0
  %192 = shufflevector <4 x float> %191, <4 x float> undef, <4 x i32> zeroinitializer
  br label %193

193:                                              ; preds = %198, %184
  %194 = phi i32 [ 0, %184 ], [ %210, %198 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  %197 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %197)
  br label %102

198:                                              ; preds = %193
  %199 = zext i32 %194 to i64
  %200 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %199
  %201 = bitcast ptr %200 to ptr
  %202 = load <4 x float>, ptr %201, align 16, !noalias !802
  %203 = fmul reassoc nsz arcp contract <4 x float> %202, %190, !spirv.Decorations !308
  %204 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %199
  %205 = bitcast ptr %204 to ptr
  %206 = load <4 x float>, ptr %205, align 16, !noalias !811
  %207 = fmul reassoc nsz arcp contract <4 x float> %192, %206, !spirv.Decorations !308
  %208 = fadd reassoc nsz arcp contract <4 x float> %203, %207, !spirv.Decorations !308
  %209 = bitcast ptr %200 to ptr
  store <4 x float> %208, ptr %209, align 16
  %210 = add nuw nsw i32 %194, 1, !spirv.Decorations !305
  br label %193, !llvm.loop !820

211:                                              ; preds = %109
  %212 = zext i32 %12 to i64
  %213 = getelementptr float, ptr addrspace(3) %5, i64 %212
  store float %107, ptr addrspace(3) %213, align 4
  %214 = getelementptr float, ptr addrspace(3) %213, i64 8
  store float %106, ptr addrspace(3) %214, align 4
  br label %215

215:                                              ; preds = %211, %109
  %216 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %217 = shl nsw i32 %12, 8, !spirv.Decorations !332
  %218 = or i32 %217, 16
  %219 = add nuw nsw i32 %216, %218, !spirv.Decorations !305
  br label %220

220:                                              ; preds = %233, %215
  %221 = phi i32 [ 0, %215 ], [ %234, %233 ]
  %222 = icmp ult i32 %221, 4
  br i1 %222, label %225, label %223

223:                                              ; preds = %220
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %224 = icmp eq i32 %12, 0
  br i1 %224, label %.preheader, label %362

.preheader:                                       ; preds = %223
  br label %244

225:                                              ; preds = %220
  %226 = shl nuw nsw i32 %221, 6, !spirv.Decorations !305
  %227 = sext i32 %221 to i64
  %228 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %227
  %229 = add nuw nsw i32 %226, %219, !spirv.Decorations !305
  br label %230

230:                                              ; preds = %235, %225
  %231 = phi i32 [ 0, %225 ], [ %243, %235 ]
  %232 = icmp ult i32 %231, 4
  br i1 %232, label %235, label %233

233:                                              ; preds = %230
  %234 = add nuw nsw i32 %221, 1, !spirv.Decorations !305
  br label %220, !llvm.loop !821

235:                                              ; preds = %230
  %236 = zext i32 %231 to i64
  %237 = bitcast ptr %228 to ptr
  %238 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %237, i64 0, i32 0, i64 %236
  %239 = load float, ptr %238, align 4
  %240 = or i32 %229, %231
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %241
  store float %239, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %231, 1, !spirv.Decorations !305
  br label %230, !llvm.loop !822

244:                                              ; preds = %250, %.preheader
  %245 = phi i32 [ %253, %250 ], [ 0, %.preheader ]
  %246 = icmp ult i32 %245, 4
  br i1 %246, label %250, label %247

247:                                              ; preds = %244
  %248 = getelementptr inbounds float, ptr addrspace(3) %5, i64 8
  %249 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %256

250:                                              ; preds = %244
  %251 = zext i32 %245 to i64
  %252 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %251
  %253 = add nuw nsw i32 %245, 1, !spirv.Decorations !305
  %254 = bitcast ptr %252 to ptr
  %255 = bitcast ptr addrspace(2) @gVar.209 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %254, ptr addrspace(2) align 16 %255, i64 16, i1 false)
  br label %244, !llvm.loop !823

256:                                              ; preds = %306, %247
  %257 = phi i32 [ %307, %306 ], [ 0, %247 ]
  %258 = phi float [ %295, %306 ], [ 0.000000e+00, %247 ]
  %259 = phi float [ %278, %306 ], [ 0xFFF0000000000000, %247 ]
  %260 = icmp ult i32 %257, 8
  br i1 %260, label %271, label %261

261:                                              ; preds = %256
  %262 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %258, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %263 = fdiv reassoc nsz arcp contract float 1.000000e+00, %262, !spirv.Decorations !308
  %264 = mul nuw i32 %19, 24, !spirv.Decorations !373
  %265 = zext i32 %264 to i64
  %266 = sext i32 %21 to i64
  %267 = add nsw i64 %265, %266, !spirv.Decorations !332
  %268 = shl nsw i64 %267, 8, !spirv.Decorations !332
  %269 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %268
  %270 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %337

271:                                              ; preds = %256
  %272 = zext i32 %257 to i64
  %273 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %272
  %274 = load float, ptr addrspace(3) %273, align 4
  %275 = zext i32 %257 to i64
  %276 = getelementptr inbounds float, ptr addrspace(3) %248, i64 %275
  %277 = load float, ptr addrspace(3) %276, align 4
  %278 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %259, float %274) #0, !spirv.Decorations !308
  %279 = fcmp reassoc nsz arcp contract oeq float %259, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %279, label %283, label %280

280:                                              ; preds = %271
  %281 = fsub reassoc nsz arcp contract float %259, %278, !spirv.Decorations !308
  %282 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %281) #0, !spirv.Decorations !308
  br label %283

283:                                              ; preds = %280, %271
  %284 = phi float [ %282, %280 ], [ 0.000000e+00, %271 ]
  %285 = fcmp reassoc nsz arcp contract oeq float %274, 0xFFF0000000000000, !spirv.Decorations !308
  %286 = fcmp reassoc nsz arcp contract oeq float %278, 0xFFF0000000000000, !spirv.Decorations !308
  %287 = or i1 %285, %286
  br i1 %287, label %291, label %288

288:                                              ; preds = %283
  %289 = fsub reassoc nsz arcp contract float %274, %278, !spirv.Decorations !308
  %290 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %289) #0, !spirv.Decorations !308
  br label %291

291:                                              ; preds = %288, %283
  %292 = phi float [ %290, %288 ], [ 0.000000e+00, %283 ]
  %293 = fmul reassoc nsz arcp contract float %258, %284, !spirv.Decorations !308
  %294 = fmul reassoc nsz arcp contract float %292, %277, !spirv.Decorations !308
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !308
  %296 = shl nuw nsw i32 %257, 8, !spirv.Decorations !305
  %297 = or i32 %296, 16
  %298 = add nuw nsw i32 %249, %297, !spirv.Decorations !305
  %299 = insertelement <4 x float> undef, float %284, i32 0
  %300 = shufflevector <4 x float> %299, <4 x float> undef, <4 x i32> zeroinitializer
  %301 = insertelement <4 x float> undef, float %292, i32 0
  %302 = shufflevector <4 x float> %301, <4 x float> undef, <4 x i32> zeroinitializer
  br label %303

303:                                              ; preds = %315, %291
  %304 = phi i32 [ 0, %291 ], [ %327, %315 ]
  %305 = icmp ult i32 %304, 4
  br i1 %305, label %308, label %306

306:                                              ; preds = %303
  %307 = add nuw nsw i32 %257, 1, !spirv.Decorations !305
  br label %256

308:                                              ; preds = %303
  %309 = shl nuw nsw i32 %304, 6, !spirv.Decorations !305
  %310 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %310)
  %311 = add nuw nsw i32 %309, %298, !spirv.Decorations !305
  br label %312

312:                                              ; preds = %328, %308
  %313 = phi i32 [ 0, %308 ], [ %336, %328 ]
  %314 = icmp ult i32 %313, 4
  br i1 %314, label %328, label %315

315:                                              ; preds = %312
  %316 = sext i32 %304 to i64
  %317 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %316
  %318 = bitcast ptr %317 to ptr
  %319 = load <4 x float>, ptr %318, align 16, !noalias !824
  %320 = fmul reassoc nsz arcp contract <4 x float> %319, %300, !spirv.Decorations !308
  %321 = bitcast ptr %11 to ptr
  %322 = load <4 x float>, ptr %321, align 16, !noalias !833
  %323 = fmul reassoc nsz arcp contract <4 x float> %302, %322, !spirv.Decorations !308
  %324 = fadd reassoc nsz arcp contract <4 x float> %320, %323, !spirv.Decorations !308
  %325 = bitcast ptr %317 to ptr
  store <4 x float> %324, ptr %325, align 16
  %326 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %326)
  %327 = add nuw nsw i32 %304, 1, !spirv.Decorations !305
  br label %303, !llvm.loop !842

328:                                              ; preds = %312
  %329 = or i32 %311, %313
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %330
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = zext i32 %313 to i64
  %334 = bitcast ptr %11 to ptr
  %335 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %334, i64 0, i32 0, i64 %333
  store float %332, ptr %335, align 4
  %336 = add nuw nsw i32 %313, 1, !spirv.Decorations !305
  br label %312, !llvm.loop !843

337:                                              ; preds = %348, %261
  %338 = phi i32 [ 0, %261 ], [ %349, %348 ]
  %339 = icmp ult i32 %338, 4
  br i1 %339, label %340, label %.loopexit

340:                                              ; preds = %337
  %341 = shl nuw nsw i32 %338, 6, !spirv.Decorations !305
  %342 = add nuw nsw i32 %341, %270, !spirv.Decorations !305
  %343 = sext i32 %338 to i64
  %344 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %343
  br label %345

345:                                              ; preds = %350, %340
  %346 = phi i32 [ 0, %340 ], [ %361, %350 ]
  %347 = icmp ult i32 %346, 4
  br i1 %347, label %350, label %348

348:                                              ; preds = %345
  %349 = add nuw nsw i32 %338, 1, !spirv.Decorations !305
  br label %337, !llvm.loop !844

350:                                              ; preds = %345
  %351 = zext i32 %346 to i64
  %352 = bitcast ptr %344 to ptr
  %353 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %352, i64 0, i32 0, i64 %351
  %354 = load float, ptr %353, align 4
  %355 = fmul reassoc nsz arcp contract float %354, %263, !spirv.Decorations !308
  %356 = fptrunc float %355 to half
  %357 = or i32 %342, %346
  %358 = sext i32 %357 to i64
  %359 = bitcast ptr addrspace(1) %269 to ptr addrspace(1)
  %360 = getelementptr inbounds half, ptr addrspace(1) %359, i64 %358
  store half %356, ptr addrspace(1) %360, align 2
  %361 = add nuw nsw i32 %346, 1, !spirv.Decorations !305
  br label %345, !llvm.loop !845

.loopexit:                                        ; preds = %337
  br label %362

362:                                              ; preds = %.loopexit, %223
  %363 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %363)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf16P16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !339 !kernel_arg_type_qual !328 !kernel_arg_base_type !339 !kernel_arg_name !328 !spirv.ParameterDecorations !340 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !330
  %10 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %11 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %12 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %13 = icmp sgt i32 %12, -1
  call void @llvm.assume(i1 %13)
  %14 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %15 = icmp sgt i32 %14, -1
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %17 = icmp ult i64 %16, 2147483648
  call void @llvm.assume(i1 %17)
  %18 = trunc i64 %16 to i32
  %19 = udiv i32 %18, 24
  %20 = mul nsw i32 %19, -24, !spirv.Decorations !332
  %21 = add nsw i32 %20, %18, !spirv.Decorations !332
  %22 = sdiv i32 %21, 6
  %23 = mul nuw nsw i32 %19, 6, !spirv.Decorations !305
  %24 = mul nsw i32 %22, -6, !spirv.Decorations !332
  %25 = add nsw i32 %24, %21, !spirv.Decorations !332
  %26 = add nsw i32 %23, %25, !spirv.Decorations !332
  %27 = mul nsw i32 %22, %0, !spirv.Decorations !332
  %28 = load i32, ptr addrspace(1) %1, align 4
  %29 = sext i32 %28 to i64
  %30 = sext i32 %0 to i64
  %31 = add nsw i64 %29, 63, !spirv.Decorations !332
  %32 = sdiv i64 %31, 64
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %30, i64 %32) #0
  %34 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %33) #0
  %35 = trunc i64 %34 to i32
  %36 = add nsw i32 %35, 15, !spirv.Decorations !332
  %37 = sdiv i32 %36, 16
  %38 = mul nsw i32 %37, %12, !spirv.Decorations !332
  %39 = add nsw i32 %38, %37, !spirv.Decorations !332
  %40 = icmp slt i32 %39, %35
  %41 = select i1 %40, i32 %39, i32 %35
  %42 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %42)
  br label %43

43:                                               ; preds = %49, %7
  %44 = phi i32 [ 0, %7 ], [ %52, %49 ]
  %45 = icmp ult i32 %44, 4
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %47)
  %48 = icmp slt i32 %38, %41
  br i1 %48, label %55, label %96

49:                                               ; preds = %43
  %50 = zext i32 %44 to i64
  %51 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %50
  %52 = add nuw nsw i32 %44, 1, !spirv.Decorations !305
  %53 = bitcast ptr %51 to ptr
  %54 = bitcast ptr addrspace(2) @gVar.210 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %53, ptr addrspace(2) align 16 %54, i64 16, i1 false)
  br label %43, !llvm.loop !846

55:                                               ; preds = %46
  %56 = add nsw i32 %27, %38, !spirv.Decorations !332
  %57 = sext i32 %56 to i64
  %58 = shl nsw i64 %57, 6, !spirv.Decorations !332
  %59 = sext i32 %26 to i64
  %60 = add nsw i64 %58, %59, !spirv.Decorations !332
  %61 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4
  %63 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %60
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %66 = shl nsw i64 %60, 8, !spirv.Decorations !332
  %67 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %66
  br label %68

68:                                               ; preds = %94, %55
  %69 = phi i32 [ 0, %55 ], [ %95, %94 ]
  %70 = icmp ult i32 %69, 4
  br i1 %70, label %71, label %.loopexit2

71:                                               ; preds = %68
  %72 = shl nuw nsw i32 %69, 6, !spirv.Decorations !305
  %73 = add nuw nsw i32 %72, %65, !spirv.Decorations !305
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %74
  %76 = zext i32 %73 to i64
  %77 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %67, i64 %76
  %78 = addrspacecast ptr addrspace(1) %77 to ptr addrspace(4)
  %79 = bitcast ptr addrspace(4) %78 to ptr addrspace(4)
  %80 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %79, i32 5) #0
  br label %81

81:                                               ; preds = %84, %71
  %82 = phi i32 [ 0, %71 ], [ %93, %84 ]
  %83 = icmp ult i32 %82, 4
  br i1 %83, label %84, label %94

84:                                               ; preds = %81
  %85 = zext i32 %82 to i64
  %86 = bitcast ptr addrspace(1) %80 to ptr addrspace(1)
  %87 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %86, i64 %85
  %88 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %87, i64 0, i32 0
  %89 = bitcast ptr %75 to ptr
  %90 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %89, i64 0, i32 0, i64 %85
  %91 = load half, ptr addrspace(1) %88, align 2
  %92 = bitcast ptr %90 to ptr
  store half %91, ptr %92, align 2
  %93 = add nuw nsw i32 %82, 1, !spirv.Decorations !305
  br label %81

94:                                               ; preds = %81
  %95 = add nuw nsw i32 %69, 1, !spirv.Decorations !305
  br label %68, !llvm.loop !847

.loopexit2:                                       ; preds = %68
  br label %96

96:                                               ; preds = %.loopexit2, %46
  %97 = phi float [ 0.000000e+00, %46 ], [ %64, %.loopexit2 ]
  %98 = phi float [ 0xFFF0000000000000, %46 ], [ %62, %.loopexit2 ]
  %99 = add i32 %27, 1
  %100 = sext i32 %26 to i64
  %101 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %102

102:                                              ; preds = %196, %96
  %103 = phi i32 [ %38, %96 ], [ %118, %196 ]
  %104 = phi float [ %97, %96 ], [ %169, %196 ]
  %105 = phi float [ %98, %96 ], [ %170, %196 ]
  %106 = phi float [ 0.000000e+00, %96 ], [ %188, %196 ]
  %107 = phi float [ 0xFFF0000000000000, %96 ], [ %171, %196 ]
  %108 = icmp slt i32 %103, %41
  br i1 %108, label %112, label %109

109:                                              ; preds = %102
  %110 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %110)
  %111 = icmp eq i32 %14, 0
  br i1 %111, label %211, label %215

112:                                              ; preds = %102
  %113 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %113)
  br label %114

114:                                              ; preds = %120, %112
  %115 = phi i32 [ 0, %112 ], [ %128, %120 ]
  %116 = icmp ult i32 %115, 4
  br i1 %116, label %120, label %117

117:                                              ; preds = %114
  %118 = add nsw i32 %103, 1, !spirv.Decorations !332
  %119 = icmp slt i32 %118, %41
  br i1 %119, label %129, label %168

120:                                              ; preds = %114
  %121 = zext i32 %115 to i64
  %122 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %121
  %123 = bitcast ptr %122 to ptr
  %124 = load <4 x half>, ptr %123, align 8, !noalias !848
  %125 = call spir_func <4 x float> @_Z28__spirv_FConvert_Rfloat4_rteDv4_Dh(<4 x half> %124) #0, !spirv.Decorations !347
  %126 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %121
  %127 = bitcast ptr %126 to ptr
  store <4 x float> %125, ptr %127, align 16
  %128 = add nuw nsw i32 %115, 1, !spirv.Decorations !305
  br label %114, !llvm.loop !851

129:                                              ; preds = %117
  %130 = add i32 %103, %99
  %131 = sext i32 %130 to i64
  %132 = shl nsw i64 %131, 6, !spirv.Decorations !332
  %133 = add nsw i64 %132, %100, !spirv.Decorations !332
  %134 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %133
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = shl nsw i64 %133, 8, !spirv.Decorations !332
  %139 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %138
  br label %140

140:                                              ; preds = %166, %129
  %141 = phi i32 [ 0, %129 ], [ %167, %166 ]
  %142 = icmp ult i32 %141, 4
  br i1 %142, label %143, label %.loopexit1

143:                                              ; preds = %140
  %144 = shl nuw nsw i32 %141, 6, !spirv.Decorations !305
  %145 = add nuw nsw i32 %144, %101, !spirv.Decorations !305
  %146 = zext i32 %141 to i64
  %147 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %146
  %148 = zext i32 %145 to i64
  %149 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %139, i64 %148
  %150 = addrspacecast ptr addrspace(1) %149 to ptr addrspace(4)
  %151 = bitcast ptr addrspace(4) %150 to ptr addrspace(4)
  %152 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %151, i32 5) #0
  br label %153

153:                                              ; preds = %156, %143
  %154 = phi i32 [ 0, %143 ], [ %165, %156 ]
  %155 = icmp ult i32 %154, 4
  br i1 %155, label %156, label %166

156:                                              ; preds = %153
  %157 = zext i32 %154 to i64
  %158 = bitcast ptr addrspace(1) %152 to ptr addrspace(1)
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %158, i64 %157
  %160 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %159, i64 0, i32 0
  %161 = bitcast ptr %147 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %161, i64 0, i32 0, i64 %157
  %163 = load half, ptr addrspace(1) %160, align 2
  %164 = bitcast ptr %162 to ptr
  store half %163, ptr %164, align 2
  %165 = add nuw nsw i32 %154, 1, !spirv.Decorations !305
  br label %153

166:                                              ; preds = %153
  %167 = add nuw nsw i32 %141, 1, !spirv.Decorations !305
  br label %140, !llvm.loop !852

.loopexit1:                                       ; preds = %140
  br label %168

168:                                              ; preds = %.loopexit1, %117
  %169 = phi float [ %104, %117 ], [ %137, %.loopexit1 ]
  %170 = phi float [ %105, %117 ], [ %135, %.loopexit1 ]
  %171 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %107, float %105) #0, !spirv.Decorations !308
  %172 = fcmp reassoc nsz arcp contract oeq float %107, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %172, label %176, label %173

173:                                              ; preds = %168
  %174 = fsub reassoc nsz arcp contract float %107, %171, !spirv.Decorations !308
  %175 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %174) #0, !spirv.Decorations !308
  br label %176

176:                                              ; preds = %173, %168
  %177 = phi float [ %175, %173 ], [ 0.000000e+00, %168 ]
  %178 = fcmp reassoc nsz arcp contract oeq float %105, 0xFFF0000000000000, !spirv.Decorations !308
  %179 = fcmp reassoc nsz arcp contract oeq float %171, 0xFFF0000000000000, !spirv.Decorations !308
  %180 = or i1 %178, %179
  br i1 %180, label %184, label %181

181:                                              ; preds = %176
  %182 = fsub reassoc nsz arcp contract float %105, %171, !spirv.Decorations !308
  %183 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %182) #0, !spirv.Decorations !308
  br label %184

184:                                              ; preds = %181, %176
  %185 = phi float [ %183, %181 ], [ 0.000000e+00, %176 ]
  %186 = fmul reassoc nsz arcp contract float %185, %104, !spirv.Decorations !308
  %187 = fmul reassoc nsz arcp contract float %106, %177, !spirv.Decorations !308
  %188 = fadd reassoc nsz arcp contract float %187, %186, !spirv.Decorations !308
  %189 = insertelement <4 x float> undef, float %177, i32 0
  %190 = shufflevector <4 x float> %189, <4 x float> undef, <4 x i32> zeroinitializer
  %191 = insertelement <4 x float> undef, float %186, i32 0
  %192 = shufflevector <4 x float> %191, <4 x float> undef, <4 x i32> zeroinitializer
  br label %193

193:                                              ; preds = %198, %184
  %194 = phi i32 [ 0, %184 ], [ %210, %198 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  %197 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %197)
  br label %102

198:                                              ; preds = %193
  %199 = zext i32 %194 to i64
  %200 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %199
  %201 = bitcast ptr %200 to ptr
  %202 = load <4 x float>, ptr %201, align 16, !noalias !853
  %203 = fmul reassoc nsz arcp contract <4 x float> %202, %190, !spirv.Decorations !308
  %204 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %199
  %205 = bitcast ptr %204 to ptr
  %206 = load <4 x float>, ptr %205, align 16, !noalias !862
  %207 = fmul reassoc nsz arcp contract <4 x float> %192, %206, !spirv.Decorations !308
  %208 = fadd reassoc nsz arcp contract <4 x float> %203, %207, !spirv.Decorations !308
  %209 = bitcast ptr %200 to ptr
  store <4 x float> %208, ptr %209, align 16
  %210 = add nuw nsw i32 %194, 1, !spirv.Decorations !305
  br label %193, !llvm.loop !871

211:                                              ; preds = %109
  %212 = zext i32 %12 to i64
  %213 = getelementptr float, ptr addrspace(3) %5, i64 %212
  store float %107, ptr addrspace(3) %213, align 4
  %214 = getelementptr float, ptr addrspace(3) %213, i64 16
  store float %106, ptr addrspace(3) %214, align 4
  br label %215

215:                                              ; preds = %211, %109
  %216 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %217 = shl nsw i32 %12, 8, !spirv.Decorations !332
  %218 = or i32 %217, 32
  %219 = add nuw nsw i32 %216, %218, !spirv.Decorations !305
  br label %220

220:                                              ; preds = %233, %215
  %221 = phi i32 [ 0, %215 ], [ %234, %233 ]
  %222 = icmp ult i32 %221, 4
  br i1 %222, label %225, label %223

223:                                              ; preds = %220
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %224 = icmp eq i32 %12, 0
  br i1 %224, label %.preheader, label %362

.preheader:                                       ; preds = %223
  br label %244

225:                                              ; preds = %220
  %226 = shl nuw nsw i32 %221, 6, !spirv.Decorations !305
  %227 = sext i32 %221 to i64
  %228 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %227
  %229 = add nuw nsw i32 %226, %219, !spirv.Decorations !305
  br label %230

230:                                              ; preds = %235, %225
  %231 = phi i32 [ 0, %225 ], [ %243, %235 ]
  %232 = icmp ult i32 %231, 4
  br i1 %232, label %235, label %233

233:                                              ; preds = %230
  %234 = add nuw nsw i32 %221, 1, !spirv.Decorations !305
  br label %220, !llvm.loop !872

235:                                              ; preds = %230
  %236 = zext i32 %231 to i64
  %237 = bitcast ptr %228 to ptr
  %238 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %237, i64 0, i32 0, i64 %236
  %239 = load float, ptr %238, align 4
  %240 = or i32 %229, %231
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %241
  store float %239, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %231, 1, !spirv.Decorations !305
  br label %230, !llvm.loop !873

244:                                              ; preds = %250, %.preheader
  %245 = phi i32 [ %253, %250 ], [ 0, %.preheader ]
  %246 = icmp ult i32 %245, 4
  br i1 %246, label %250, label %247

247:                                              ; preds = %244
  %248 = getelementptr inbounds float, ptr addrspace(3) %5, i64 16
  %249 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %256

250:                                              ; preds = %244
  %251 = zext i32 %245 to i64
  %252 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %251
  %253 = add nuw nsw i32 %245, 1, !spirv.Decorations !305
  %254 = bitcast ptr %252 to ptr
  %255 = bitcast ptr addrspace(2) @gVar.211 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %254, ptr addrspace(2) align 16 %255, i64 16, i1 false)
  br label %244, !llvm.loop !874

256:                                              ; preds = %306, %247
  %257 = phi i32 [ %307, %306 ], [ 0, %247 ]
  %258 = phi float [ %295, %306 ], [ 0.000000e+00, %247 ]
  %259 = phi float [ %278, %306 ], [ 0xFFF0000000000000, %247 ]
  %260 = icmp ult i32 %257, 16
  br i1 %260, label %271, label %261

261:                                              ; preds = %256
  %262 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %258, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %263 = fdiv reassoc nsz arcp contract float 1.000000e+00, %262, !spirv.Decorations !308
  %264 = mul nuw i32 %19, 24, !spirv.Decorations !373
  %265 = zext i32 %264 to i64
  %266 = sext i32 %21 to i64
  %267 = add nsw i64 %265, %266, !spirv.Decorations !332
  %268 = shl nsw i64 %267, 8, !spirv.Decorations !332
  %269 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %268
  %270 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %337

271:                                              ; preds = %256
  %272 = zext i32 %257 to i64
  %273 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %272
  %274 = load float, ptr addrspace(3) %273, align 4
  %275 = zext i32 %257 to i64
  %276 = getelementptr inbounds float, ptr addrspace(3) %248, i64 %275
  %277 = load float, ptr addrspace(3) %276, align 4
  %278 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %259, float %274) #0, !spirv.Decorations !308
  %279 = fcmp reassoc nsz arcp contract oeq float %259, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %279, label %283, label %280

280:                                              ; preds = %271
  %281 = fsub reassoc nsz arcp contract float %259, %278, !spirv.Decorations !308
  %282 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %281) #0, !spirv.Decorations !308
  br label %283

283:                                              ; preds = %280, %271
  %284 = phi float [ %282, %280 ], [ 0.000000e+00, %271 ]
  %285 = fcmp reassoc nsz arcp contract oeq float %274, 0xFFF0000000000000, !spirv.Decorations !308
  %286 = fcmp reassoc nsz arcp contract oeq float %278, 0xFFF0000000000000, !spirv.Decorations !308
  %287 = or i1 %285, %286
  br i1 %287, label %291, label %288

288:                                              ; preds = %283
  %289 = fsub reassoc nsz arcp contract float %274, %278, !spirv.Decorations !308
  %290 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %289) #0, !spirv.Decorations !308
  br label %291

291:                                              ; preds = %288, %283
  %292 = phi float [ %290, %288 ], [ 0.000000e+00, %283 ]
  %293 = fmul reassoc nsz arcp contract float %258, %284, !spirv.Decorations !308
  %294 = fmul reassoc nsz arcp contract float %292, %277, !spirv.Decorations !308
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !308
  %296 = shl nuw nsw i32 %257, 8, !spirv.Decorations !305
  %297 = or i32 %296, 32
  %298 = add nuw nsw i32 %249, %297, !spirv.Decorations !305
  %299 = insertelement <4 x float> undef, float %284, i32 0
  %300 = shufflevector <4 x float> %299, <4 x float> undef, <4 x i32> zeroinitializer
  %301 = insertelement <4 x float> undef, float %292, i32 0
  %302 = shufflevector <4 x float> %301, <4 x float> undef, <4 x i32> zeroinitializer
  br label %303

303:                                              ; preds = %315, %291
  %304 = phi i32 [ 0, %291 ], [ %327, %315 ]
  %305 = icmp ult i32 %304, 4
  br i1 %305, label %308, label %306

306:                                              ; preds = %303
  %307 = add nuw nsw i32 %257, 1, !spirv.Decorations !305
  br label %256

308:                                              ; preds = %303
  %309 = shl nuw nsw i32 %304, 6, !spirv.Decorations !305
  %310 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %310)
  %311 = add nuw nsw i32 %309, %298, !spirv.Decorations !305
  br label %312

312:                                              ; preds = %328, %308
  %313 = phi i32 [ 0, %308 ], [ %336, %328 ]
  %314 = icmp ult i32 %313, 4
  br i1 %314, label %328, label %315

315:                                              ; preds = %312
  %316 = sext i32 %304 to i64
  %317 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %316
  %318 = bitcast ptr %317 to ptr
  %319 = load <4 x float>, ptr %318, align 16, !noalias !875
  %320 = fmul reassoc nsz arcp contract <4 x float> %319, %300, !spirv.Decorations !308
  %321 = bitcast ptr %11 to ptr
  %322 = load <4 x float>, ptr %321, align 16, !noalias !884
  %323 = fmul reassoc nsz arcp contract <4 x float> %302, %322, !spirv.Decorations !308
  %324 = fadd reassoc nsz arcp contract <4 x float> %320, %323, !spirv.Decorations !308
  %325 = bitcast ptr %317 to ptr
  store <4 x float> %324, ptr %325, align 16
  %326 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %326)
  %327 = add nuw nsw i32 %304, 1, !spirv.Decorations !305
  br label %303, !llvm.loop !893

328:                                              ; preds = %312
  %329 = or i32 %311, %313
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %330
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = zext i32 %313 to i64
  %334 = bitcast ptr %11 to ptr
  %335 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %334, i64 0, i32 0, i64 %333
  store float %332, ptr %335, align 4
  %336 = add nuw nsw i32 %313, 1, !spirv.Decorations !305
  br label %312, !llvm.loop !894

337:                                              ; preds = %348, %261
  %338 = phi i32 [ 0, %261 ], [ %349, %348 ]
  %339 = icmp ult i32 %338, 4
  br i1 %339, label %340, label %.loopexit

340:                                              ; preds = %337
  %341 = shl nuw nsw i32 %338, 6, !spirv.Decorations !305
  %342 = add nuw nsw i32 %341, %270, !spirv.Decorations !305
  %343 = sext i32 %338 to i64
  %344 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %343
  br label %345

345:                                              ; preds = %350, %340
  %346 = phi i32 [ 0, %340 ], [ %361, %350 ]
  %347 = icmp ult i32 %346, 4
  br i1 %347, label %350, label %348

348:                                              ; preds = %345
  %349 = add nuw nsw i32 %338, 1, !spirv.Decorations !305
  br label %337, !llvm.loop !895

350:                                              ; preds = %345
  %351 = zext i32 %346 to i64
  %352 = bitcast ptr %344 to ptr
  %353 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %352, i64 0, i32 0, i64 %351
  %354 = load float, ptr %353, align 4
  %355 = fmul reassoc nsz arcp contract float %354, %263, !spirv.Decorations !308
  %356 = fptrunc float %355 to half
  %357 = or i32 %342, %346
  %358 = sext i32 %357 to i64
  %359 = bitcast ptr addrspace(1) %269 to ptr addrspace(1)
  %360 = getelementptr inbounds half, ptr addrspace(1) %359, i64 %358
  store half %356, ptr addrspace(1) %360, align 2
  %361 = add nuw nsw i32 %346, 1, !spirv.Decorations !305
  br label %345, !llvm.loop !896

.loopexit:                                        ; preds = %337
  br label %362

362:                                              ; preds = %.loopexit, %223
  %363 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %363)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_132Xe2KvTorchAbiS2ParallelHalf32P16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 2 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !339 !kernel_arg_type_qual !328 !kernel_arg_base_type !339 !kernel_arg_name !328 !spirv.ParameterDecorations !340 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca [4 x %"class.sycl::_V1::vec.46"], align 8, !spirv.Decorations !330
  %10 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %11 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %12 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %13 = icmp sgt i32 %12, -1
  call void @llvm.assume(i1 %13)
  %14 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %15 = icmp sgt i32 %14, -1
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %17 = icmp ult i64 %16, 2147483648
  call void @llvm.assume(i1 %17)
  %18 = trunc i64 %16 to i32
  %19 = udiv i32 %18, 24
  %20 = mul nsw i32 %19, -24, !spirv.Decorations !332
  %21 = add nsw i32 %20, %18, !spirv.Decorations !332
  %22 = sdiv i32 %21, 6
  %23 = mul nuw nsw i32 %19, 6, !spirv.Decorations !305
  %24 = mul nsw i32 %22, -6, !spirv.Decorations !332
  %25 = add nsw i32 %24, %21, !spirv.Decorations !332
  %26 = add nsw i32 %23, %25, !spirv.Decorations !332
  %27 = mul nsw i32 %22, %0, !spirv.Decorations !332
  %28 = load i32, ptr addrspace(1) %1, align 4
  %29 = sext i32 %28 to i64
  %30 = sext i32 %0 to i64
  %31 = add nsw i64 %29, 63, !spirv.Decorations !332
  %32 = sdiv i64 %31, 64
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %30, i64 %32) #0
  %34 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %33) #0
  %35 = trunc i64 %34 to i32
  %36 = add nsw i32 %35, 31, !spirv.Decorations !332
  %37 = sdiv i32 %36, 32
  %38 = mul nsw i32 %37, %12, !spirv.Decorations !332
  %39 = add nsw i32 %38, %37, !spirv.Decorations !332
  %40 = icmp slt i32 %39, %35
  %41 = select i1 %40, i32 %39, i32 %35
  %42 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %42)
  br label %43

43:                                               ; preds = %49, %7
  %44 = phi i32 [ 0, %7 ], [ %52, %49 ]
  %45 = icmp ult i32 %44, 4
  br i1 %45, label %49, label %46

46:                                               ; preds = %43
  %47 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 32, ptr %47)
  %48 = icmp slt i32 %38, %41
  br i1 %48, label %55, label %96

49:                                               ; preds = %43
  %50 = zext i32 %44 to i64
  %51 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %50
  %52 = add nuw nsw i32 %44, 1, !spirv.Decorations !305
  %53 = bitcast ptr %51 to ptr
  %54 = bitcast ptr addrspace(2) @gVar.212 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %53, ptr addrspace(2) align 16 %54, i64 16, i1 false)
  br label %43, !llvm.loop !897

55:                                               ; preds = %46
  %56 = add nsw i32 %27, %38, !spirv.Decorations !332
  %57 = sext i32 %56 to i64
  %58 = shl nsw i64 %57, 6, !spirv.Decorations !332
  %59 = sext i32 %26 to i64
  %60 = add nsw i64 %58, %59, !spirv.Decorations !332
  %61 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4
  %63 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %60
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %66 = shl nsw i64 %60, 8, !spirv.Decorations !332
  %67 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %66
  br label %68

68:                                               ; preds = %94, %55
  %69 = phi i32 [ 0, %55 ], [ %95, %94 ]
  %70 = icmp ult i32 %69, 4
  br i1 %70, label %71, label %.loopexit2

71:                                               ; preds = %68
  %72 = shl nuw nsw i32 %69, 6, !spirv.Decorations !305
  %73 = add nuw nsw i32 %72, %65, !spirv.Decorations !305
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %74
  %76 = zext i32 %73 to i64
  %77 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %67, i64 %76
  %78 = addrspacecast ptr addrspace(1) %77 to ptr addrspace(4)
  %79 = bitcast ptr addrspace(4) %78 to ptr addrspace(4)
  %80 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %79, i32 5) #0
  br label %81

81:                                               ; preds = %84, %71
  %82 = phi i32 [ 0, %71 ], [ %93, %84 ]
  %83 = icmp ult i32 %82, 4
  br i1 %83, label %84, label %94

84:                                               ; preds = %81
  %85 = zext i32 %82 to i64
  %86 = bitcast ptr addrspace(1) %80 to ptr addrspace(1)
  %87 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %86, i64 %85
  %88 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %87, i64 0, i32 0
  %89 = bitcast ptr %75 to ptr
  %90 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %89, i64 0, i32 0, i64 %85
  %91 = load half, ptr addrspace(1) %88, align 2
  %92 = bitcast ptr %90 to ptr
  store half %91, ptr %92, align 2
  %93 = add nuw nsw i32 %82, 1, !spirv.Decorations !305
  br label %81

94:                                               ; preds = %81
  %95 = add nuw nsw i32 %69, 1, !spirv.Decorations !305
  br label %68, !llvm.loop !898

.loopexit2:                                       ; preds = %68
  br label %96

96:                                               ; preds = %.loopexit2, %46
  %97 = phi float [ 0.000000e+00, %46 ], [ %64, %.loopexit2 ]
  %98 = phi float [ 0xFFF0000000000000, %46 ], [ %62, %.loopexit2 ]
  %99 = add i32 %27, 1
  %100 = sext i32 %26 to i64
  %101 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %102

102:                                              ; preds = %196, %96
  %103 = phi i32 [ %38, %96 ], [ %118, %196 ]
  %104 = phi float [ %97, %96 ], [ %169, %196 ]
  %105 = phi float [ %98, %96 ], [ %170, %196 ]
  %106 = phi float [ 0.000000e+00, %96 ], [ %188, %196 ]
  %107 = phi float [ 0xFFF0000000000000, %96 ], [ %171, %196 ]
  %108 = icmp slt i32 %103, %41
  br i1 %108, label %112, label %109

109:                                              ; preds = %102
  %110 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 32, ptr %110)
  %111 = icmp eq i32 %14, 0
  br i1 %111, label %211, label %215

112:                                              ; preds = %102
  %113 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %113)
  br label %114

114:                                              ; preds = %120, %112
  %115 = phi i32 [ 0, %112 ], [ %128, %120 ]
  %116 = icmp ult i32 %115, 4
  br i1 %116, label %120, label %117

117:                                              ; preds = %114
  %118 = add nsw i32 %103, 1, !spirv.Decorations !332
  %119 = icmp slt i32 %118, %41
  br i1 %119, label %129, label %168

120:                                              ; preds = %114
  %121 = zext i32 %115 to i64
  %122 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %121
  %123 = bitcast ptr %122 to ptr
  %124 = load <4 x half>, ptr %123, align 8, !noalias !899
  %125 = call spir_func <4 x float> @_Z28__spirv_FConvert_Rfloat4_rteDv4_Dh(<4 x half> %124) #0, !spirv.Decorations !347
  %126 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %121
  %127 = bitcast ptr %126 to ptr
  store <4 x float> %125, ptr %127, align 16
  %128 = add nuw nsw i32 %115, 1, !spirv.Decorations !305
  br label %114, !llvm.loop !902

129:                                              ; preds = %117
  %130 = add i32 %103, %99
  %131 = sext i32 %130 to i64
  %132 = shl nsw i64 %131, 6, !spirv.Decorations !332
  %133 = add nsw i64 %132, %100, !spirv.Decorations !332
  %134 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %133
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = shl nsw i64 %133, 8, !spirv.Decorations !332
  %139 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %4, i64 %138
  br label %140

140:                                              ; preds = %166, %129
  %141 = phi i32 [ 0, %129 ], [ %167, %166 ]
  %142 = icmp ult i32 %141, 4
  br i1 %142, label %143, label %.loopexit1

143:                                              ; preds = %140
  %144 = shl nuw nsw i32 %141, 6, !spirv.Decorations !305
  %145 = add nuw nsw i32 %144, %101, !spirv.Decorations !305
  %146 = zext i32 %141 to i64
  %147 = getelementptr inbounds [4 x %"class.sycl::_V1::vec.46"], ptr %9, i64 0, i64 %146
  %148 = zext i32 %145 to i64
  %149 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %139, i64 %148
  %150 = addrspacecast ptr addrspace(1) %149 to ptr addrspace(4)
  %151 = bitcast ptr addrspace(4) %150 to ptr addrspace(4)
  %152 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %151, i32 5) #0
  br label %153

153:                                              ; preds = %156, %143
  %154 = phi i32 [ 0, %143 ], [ %165, %156 ]
  %155 = icmp ult i32 %154, 4
  br i1 %155, label %156, label %166

156:                                              ; preds = %153
  %157 = zext i32 %154 to i64
  %158 = bitcast ptr addrspace(1) %152 to ptr addrspace(1)
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %158, i64 %157
  %160 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %159, i64 0, i32 0
  %161 = bitcast ptr %147 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base.83", ptr %161, i64 0, i32 0, i64 %157
  %163 = load half, ptr addrspace(1) %160, align 2
  %164 = bitcast ptr %162 to ptr
  store half %163, ptr %164, align 2
  %165 = add nuw nsw i32 %154, 1, !spirv.Decorations !305
  br label %153

166:                                              ; preds = %153
  %167 = add nuw nsw i32 %141, 1, !spirv.Decorations !305
  br label %140, !llvm.loop !903

.loopexit1:                                       ; preds = %140
  br label %168

168:                                              ; preds = %.loopexit1, %117
  %169 = phi float [ %104, %117 ], [ %137, %.loopexit1 ]
  %170 = phi float [ %105, %117 ], [ %135, %.loopexit1 ]
  %171 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %107, float %105) #0, !spirv.Decorations !308
  %172 = fcmp reassoc nsz arcp contract oeq float %107, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %172, label %176, label %173

173:                                              ; preds = %168
  %174 = fsub reassoc nsz arcp contract float %107, %171, !spirv.Decorations !308
  %175 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %174) #0, !spirv.Decorations !308
  br label %176

176:                                              ; preds = %173, %168
  %177 = phi float [ %175, %173 ], [ 0.000000e+00, %168 ]
  %178 = fcmp reassoc nsz arcp contract oeq float %105, 0xFFF0000000000000, !spirv.Decorations !308
  %179 = fcmp reassoc nsz arcp contract oeq float %171, 0xFFF0000000000000, !spirv.Decorations !308
  %180 = or i1 %178, %179
  br i1 %180, label %184, label %181

181:                                              ; preds = %176
  %182 = fsub reassoc nsz arcp contract float %105, %171, !spirv.Decorations !308
  %183 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %182) #0, !spirv.Decorations !308
  br label %184

184:                                              ; preds = %181, %176
  %185 = phi float [ %183, %181 ], [ 0.000000e+00, %176 ]
  %186 = fmul reassoc nsz arcp contract float %185, %104, !spirv.Decorations !308
  %187 = fmul reassoc nsz arcp contract float %106, %177, !spirv.Decorations !308
  %188 = fadd reassoc nsz arcp contract float %187, %186, !spirv.Decorations !308
  %189 = insertelement <4 x float> undef, float %177, i32 0
  %190 = shufflevector <4 x float> %189, <4 x float> undef, <4 x i32> zeroinitializer
  %191 = insertelement <4 x float> undef, float %186, i32 0
  %192 = shufflevector <4 x float> %191, <4 x float> undef, <4 x i32> zeroinitializer
  br label %193

193:                                              ; preds = %198, %184
  %194 = phi i32 [ 0, %184 ], [ %210, %198 ]
  %195 = icmp ult i32 %194, 4
  br i1 %195, label %198, label %196

196:                                              ; preds = %193
  %197 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %197)
  br label %102

198:                                              ; preds = %193
  %199 = zext i32 %194 to i64
  %200 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %199
  %201 = bitcast ptr %200 to ptr
  %202 = load <4 x float>, ptr %201, align 16, !noalias !904
  %203 = fmul reassoc nsz arcp contract <4 x float> %202, %190, !spirv.Decorations !308
  %204 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %10, i64 0, i64 %199
  %205 = bitcast ptr %204 to ptr
  %206 = load <4 x float>, ptr %205, align 16, !noalias !913
  %207 = fmul reassoc nsz arcp contract <4 x float> %192, %206, !spirv.Decorations !308
  %208 = fadd reassoc nsz arcp contract <4 x float> %203, %207, !spirv.Decorations !308
  %209 = bitcast ptr %200 to ptr
  store <4 x float> %208, ptr %209, align 16
  %210 = add nuw nsw i32 %194, 1, !spirv.Decorations !305
  br label %193, !llvm.loop !922

211:                                              ; preds = %109
  %212 = zext i32 %12 to i64
  %213 = getelementptr float, ptr addrspace(3) %5, i64 %212
  store float %107, ptr addrspace(3) %213, align 4
  %214 = getelementptr float, ptr addrspace(3) %213, i64 32
  store float %106, ptr addrspace(3) %214, align 4
  br label %215

215:                                              ; preds = %211, %109
  %216 = shl nsw i32 %14, 2, !spirv.Decorations !332
  %217 = shl nsw i32 %12, 8, !spirv.Decorations !332
  %218 = or i32 %217, 64
  %219 = add nuw nsw i32 %216, %218, !spirv.Decorations !305
  br label %220

220:                                              ; preds = %233, %215
  %221 = phi i32 [ 0, %215 ], [ %234, %233 ]
  %222 = icmp ult i32 %221, 4
  br i1 %222, label %225, label %223

223:                                              ; preds = %220
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %224 = icmp eq i32 %12, 0
  br i1 %224, label %.preheader, label %362

.preheader:                                       ; preds = %223
  br label %244

225:                                              ; preds = %220
  %226 = shl nuw nsw i32 %221, 6, !spirv.Decorations !305
  %227 = sext i32 %221 to i64
  %228 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %227
  %229 = add nuw nsw i32 %226, %219, !spirv.Decorations !305
  br label %230

230:                                              ; preds = %235, %225
  %231 = phi i32 [ 0, %225 ], [ %243, %235 ]
  %232 = icmp ult i32 %231, 4
  br i1 %232, label %235, label %233

233:                                              ; preds = %230
  %234 = add nuw nsw i32 %221, 1, !spirv.Decorations !305
  br label %220, !llvm.loop !923

235:                                              ; preds = %230
  %236 = zext i32 %231 to i64
  %237 = bitcast ptr %228 to ptr
  %238 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %237, i64 0, i32 0, i64 %236
  %239 = load float, ptr %238, align 4
  %240 = or i32 %229, %231
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %241
  store float %239, ptr addrspace(3) %242, align 4
  %243 = add nuw nsw i32 %231, 1, !spirv.Decorations !305
  br label %230, !llvm.loop !924

244:                                              ; preds = %250, %.preheader
  %245 = phi i32 [ %253, %250 ], [ 0, %.preheader ]
  %246 = icmp ult i32 %245, 4
  br i1 %246, label %250, label %247

247:                                              ; preds = %244
  %248 = getelementptr inbounds float, ptr addrspace(3) %5, i64 32
  %249 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %256

250:                                              ; preds = %244
  %251 = zext i32 %245 to i64
  %252 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %251
  %253 = add nuw nsw i32 %245, 1, !spirv.Decorations !305
  %254 = bitcast ptr %252 to ptr
  %255 = bitcast ptr addrspace(2) @gVar.213 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %254, ptr addrspace(2) align 16 %255, i64 16, i1 false)
  br label %244, !llvm.loop !925

256:                                              ; preds = %306, %247
  %257 = phi i32 [ %307, %306 ], [ 0, %247 ]
  %258 = phi float [ %295, %306 ], [ 0.000000e+00, %247 ]
  %259 = phi float [ %278, %306 ], [ 0xFFF0000000000000, %247 ]
  %260 = icmp ult i32 %257, 32
  br i1 %260, label %271, label %261

261:                                              ; preds = %256
  %262 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %258, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %263 = fdiv reassoc nsz arcp contract float 1.000000e+00, %262, !spirv.Decorations !308
  %264 = mul nuw i32 %19, 24, !spirv.Decorations !373
  %265 = zext i32 %264 to i64
  %266 = sext i32 %21 to i64
  %267 = add nsw i64 %265, %266, !spirv.Decorations !332
  %268 = shl nsw i64 %267, 8, !spirv.Decorations !332
  %269 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %268
  %270 = shl nsw i32 %14, 2, !spirv.Decorations !332
  br label %337

271:                                              ; preds = %256
  %272 = zext i32 %257 to i64
  %273 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %272
  %274 = load float, ptr addrspace(3) %273, align 4
  %275 = zext i32 %257 to i64
  %276 = getelementptr inbounds float, ptr addrspace(3) %248, i64 %275
  %277 = load float, ptr addrspace(3) %276, align 4
  %278 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %259, float %274) #0, !spirv.Decorations !308
  %279 = fcmp reassoc nsz arcp contract oeq float %259, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %279, label %283, label %280

280:                                              ; preds = %271
  %281 = fsub reassoc nsz arcp contract float %259, %278, !spirv.Decorations !308
  %282 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %281) #0, !spirv.Decorations !308
  br label %283

283:                                              ; preds = %280, %271
  %284 = phi float [ %282, %280 ], [ 0.000000e+00, %271 ]
  %285 = fcmp reassoc nsz arcp contract oeq float %274, 0xFFF0000000000000, !spirv.Decorations !308
  %286 = fcmp reassoc nsz arcp contract oeq float %278, 0xFFF0000000000000, !spirv.Decorations !308
  %287 = or i1 %285, %286
  br i1 %287, label %291, label %288

288:                                              ; preds = %283
  %289 = fsub reassoc nsz arcp contract float %274, %278, !spirv.Decorations !308
  %290 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %289) #0, !spirv.Decorations !308
  br label %291

291:                                              ; preds = %288, %283
  %292 = phi float [ %290, %288 ], [ 0.000000e+00, %283 ]
  %293 = fmul reassoc nsz arcp contract float %258, %284, !spirv.Decorations !308
  %294 = fmul reassoc nsz arcp contract float %292, %277, !spirv.Decorations !308
  %295 = fadd reassoc nsz arcp contract float %293, %294, !spirv.Decorations !308
  %296 = shl nuw nsw i32 %257, 8, !spirv.Decorations !305
  %297 = or i32 %296, 64
  %298 = add nuw nsw i32 %249, %297, !spirv.Decorations !305
  %299 = insertelement <4 x float> undef, float %284, i32 0
  %300 = shufflevector <4 x float> %299, <4 x float> undef, <4 x i32> zeroinitializer
  %301 = insertelement <4 x float> undef, float %292, i32 0
  %302 = shufflevector <4 x float> %301, <4 x float> undef, <4 x i32> zeroinitializer
  br label %303

303:                                              ; preds = %315, %291
  %304 = phi i32 [ 0, %291 ], [ %327, %315 ]
  %305 = icmp ult i32 %304, 4
  br i1 %305, label %308, label %306

306:                                              ; preds = %303
  %307 = add nuw nsw i32 %257, 1, !spirv.Decorations !305
  br label %256

308:                                              ; preds = %303
  %309 = shl nuw nsw i32 %304, 6, !spirv.Decorations !305
  %310 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %310)
  %311 = add nuw nsw i32 %309, %298, !spirv.Decorations !305
  br label %312

312:                                              ; preds = %328, %308
  %313 = phi i32 [ 0, %308 ], [ %336, %328 ]
  %314 = icmp ult i32 %313, 4
  br i1 %314, label %328, label %315

315:                                              ; preds = %312
  %316 = sext i32 %304 to i64
  %317 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %316
  %318 = bitcast ptr %317 to ptr
  %319 = load <4 x float>, ptr %318, align 16, !noalias !926
  %320 = fmul reassoc nsz arcp contract <4 x float> %319, %300, !spirv.Decorations !308
  %321 = bitcast ptr %11 to ptr
  %322 = load <4 x float>, ptr %321, align 16, !noalias !935
  %323 = fmul reassoc nsz arcp contract <4 x float> %302, %322, !spirv.Decorations !308
  %324 = fadd reassoc nsz arcp contract <4 x float> %320, %323, !spirv.Decorations !308
  %325 = bitcast ptr %317 to ptr
  store <4 x float> %324, ptr %325, align 16
  %326 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %326)
  %327 = add nuw nsw i32 %304, 1, !spirv.Decorations !305
  br label %303, !llvm.loop !944

328:                                              ; preds = %312
  %329 = or i32 %311, %313
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %330
  %332 = load float, ptr addrspace(3) %331, align 4
  %333 = zext i32 %313 to i64
  %334 = bitcast ptr %11 to ptr
  %335 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %334, i64 0, i32 0, i64 %333
  store float %332, ptr %335, align 4
  %336 = add nuw nsw i32 %313, 1, !spirv.Decorations !305
  br label %312, !llvm.loop !945

337:                                              ; preds = %348, %261
  %338 = phi i32 [ 0, %261 ], [ %349, %348 ]
  %339 = icmp ult i32 %338, 4
  br i1 %339, label %340, label %.loopexit

340:                                              ; preds = %337
  %341 = shl nuw nsw i32 %338, 6, !spirv.Decorations !305
  %342 = add nuw nsw i32 %341, %270, !spirv.Decorations !305
  %343 = sext i32 %338 to i64
  %344 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %343
  br label %345

345:                                              ; preds = %350, %340
  %346 = phi i32 [ 0, %340 ], [ %361, %350 ]
  %347 = icmp ult i32 %346, 4
  br i1 %347, label %350, label %348

348:                                              ; preds = %345
  %349 = add nuw nsw i32 %338, 1, !spirv.Decorations !305
  br label %337, !llvm.loop !946

350:                                              ; preds = %345
  %351 = zext i32 %346 to i64
  %352 = bitcast ptr %344 to ptr
  %353 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %352, i64 0, i32 0, i64 %351
  %354 = load float, ptr %353, align 4
  %355 = fmul reassoc nsz arcp contract float %354, %263, !spirv.Decorations !308
  %356 = fptrunc float %355 to half
  %357 = or i32 %342, %346
  %358 = sext i32 %357 to i64
  %359 = bitcast ptr addrspace(1) %269 to ptr addrspace(1)
  %360 = getelementptr inbounds half, ptr addrspace(1) %359, i64 %358
  store half %356, ptr addrspace(1) %360, align 2
  %361 = add nuw nsw i32 %346, 1, !spirv.Decorations !305
  br label %345, !llvm.loop !947

.loopexit:                                        ; preds = %337
  br label %362

362:                                              ; preds = %.loopexit, %223
  %363 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %363)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi8EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 7, !spirv.Decorations !332
  %36 = sdiv i32 %35, 8
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = getelementptr float, ptr addrspace(1) %2, i64 %46
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.214 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !948

54:                                               ; preds = %62, %45
  %55 = phi i32 [ %69, %62 ], [ %37, %45 ]
  %56 = phi float [ %68, %62 ], [ 0xFFF0000000000000, %45 ]
  %57 = icmp slt i32 %55, %40
  br i1 %57, label %62, label %58

58:                                               ; preds = %54
  %59 = sext i32 %25 to i64
  %60 = fcmp reassoc nsz arcp contract oeq float %56, 0xFFF0000000000000, !spirv.Decorations !308
  %61 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %70

62:                                               ; preds = %54
  %63 = add nsw i32 %26, %55, !spirv.Decorations !332
  %64 = sext i32 %63 to i64
  %65 = shl nsw i64 %64, 6, !spirv.Decorations !332
  %66 = getelementptr float, ptr addrspace(1) %47, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %56, float %67) #0, !spirv.Decorations !308
  %69 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

70:                                               ; preds = %101, %58
  %71 = phi i32 [ %102, %101 ], [ %37, %58 ]
  %72 = phi float [ %93, %101 ], [ 0.000000e+00, %58 ]
  %73 = icmp slt i32 %71, %40
  br i1 %73, label %76, label %74

74:                                               ; preds = %70
  %75 = icmp eq i32 %13, 0
  br i1 %75, label %135, label %139

76:                                               ; preds = %70
  %77 = add nsw i32 %26, %71, !spirv.Decorations !332
  %78 = sext i32 %77 to i64
  %79 = shl nsw i64 %78, 6, !spirv.Decorations !332
  %80 = add nsw i64 %79, %59, !spirv.Decorations !332
  %81 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %80
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = fcmp reassoc nsz arcp contract oeq float %82, 0xFFF0000000000000, !spirv.Decorations !308
  %86 = or i1 %85, %60
  br i1 %86, label %90, label %87

87:                                               ; preds = %76
  %88 = fsub reassoc nsz arcp contract float %82, %56, !spirv.Decorations !308
  %89 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %88) #0, !spirv.Decorations !308
  br label %90

90:                                               ; preds = %87, %76
  %91 = phi float [ %89, %87 ], [ 0.000000e+00, %76 ]
  %92 = fmul reassoc nsz arcp contract float %91, %84, !spirv.Decorations !308
  %93 = fadd reassoc nsz arcp contract float %72, %92, !spirv.Decorations !308
  %94 = shl nsw i64 %80, 8, !spirv.Decorations !332
  %95 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %94
  %96 = insertelement <4 x float> undef, float %92, i32 0
  %97 = shufflevector <4 x float> %96, <4 x float> undef, <4 x i32> zeroinitializer
  br label %98

98:                                               ; preds = %123, %90
  %99 = phi i32 [ 0, %90 ], [ %134, %123 ]
  %100 = icmp ult i32 %99, 4
  br i1 %100, label %103, label %101

101:                                              ; preds = %98
  %102 = add nsw i32 %71, 1, !spirv.Decorations !332
  br label %70

103:                                              ; preds = %98
  %104 = shl nuw nsw i32 %99, 6, !spirv.Decorations !305
  %105 = add nuw nsw i32 %104, %61, !spirv.Decorations !305
  %106 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %106)
  %107 = zext i32 %105 to i64
  %108 = getelementptr inbounds float, ptr addrspace(1) %95, i64 %107
  %109 = addrspacecast ptr addrspace(1) %108 to ptr addrspace(4)
  %110 = bitcast ptr addrspace(4) %109 to ptr addrspace(4)
  %111 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %110, i32 5) #0
  br label %112

112:                                              ; preds = %115, %103
  %113 = phi i32 [ 0, %103 ], [ %122, %115 ]
  %114 = icmp ult i32 %113, 4
  br i1 %114, label %115, label %123

115:                                              ; preds = %112
  %116 = zext i32 %113 to i64
  %117 = bitcast ptr addrspace(1) %111 to ptr addrspace(1)
  %118 = getelementptr inbounds float, ptr addrspace(1) %117, i64 %116
  %119 = load float, ptr addrspace(1) %118, align 4
  %120 = bitcast ptr %9 to ptr
  %121 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %120, i64 0, i32 0, i64 %116
  store float %119, ptr %121, align 4
  %122 = add nuw nsw i32 %113, 1, !spirv.Decorations !305
  br label %112

123:                                              ; preds = %112
  %124 = sext i32 %99 to i64
  %125 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %124
  %126 = bitcast ptr %125 to ptr
  %127 = load <4 x float>, ptr %126, align 16, !noalias !949
  %128 = bitcast ptr %9 to ptr
  %129 = load <4 x float>, ptr %128, align 16, !noalias !958
  %130 = fmul reassoc nsz arcp contract <4 x float> %97, %129, !spirv.Decorations !308
  %131 = fadd reassoc nsz arcp contract <4 x float> %127, %130, !spirv.Decorations !308
  %132 = bitcast ptr %125 to ptr
  store <4 x float> %131, ptr %132, align 16
  %133 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %133)
  %134 = add nuw nsw i32 %99, 1, !spirv.Decorations !305
  br label %98, !llvm.loop !967

135:                                              ; preds = %74
  %136 = zext i32 %11 to i64
  %137 = getelementptr float, ptr addrspace(3) %5, i64 %136
  store float %56, ptr addrspace(3) %137, align 4
  %138 = getelementptr float, ptr addrspace(3) %137, i64 8
  store float %72, ptr addrspace(3) %138, align 4
  br label %139

139:                                              ; preds = %135, %74
  %140 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %141 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %142 = or i32 %141, 16
  %143 = add nuw nsw i32 %140, %142, !spirv.Decorations !305
  br label %144

144:                                              ; preds = %157, %139
  %145 = phi i32 [ 0, %139 ], [ %158, %157 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %148 = icmp eq i32 %11, 0
  br i1 %148, label %.preheader1, label %284

.preheader1:                                      ; preds = %147
  br label %168

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !305
  %151 = sext i32 %145 to i64
  %152 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %151
  %153 = add nuw nsw i32 %150, %143, !spirv.Decorations !305
  br label %154

154:                                              ; preds = %159, %149
  %155 = phi i32 [ 0, %149 ], [ %167, %159 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %159, label %157

157:                                              ; preds = %154
  %158 = add nuw nsw i32 %145, 1, !spirv.Decorations !305
  br label %144, !llvm.loop !968

159:                                              ; preds = %154
  %160 = zext i32 %155 to i64
  %161 = bitcast ptr %152 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %161, i64 0, i32 0, i64 %160
  %163 = load float, ptr %162, align 4
  %164 = or i32 %153, %155
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %165
  store float %163, ptr addrspace(3) %166, align 4
  %167 = add nuw nsw i32 %155, 1, !spirv.Decorations !305
  br label %154, !llvm.loop !969

168:                                              ; preds = %171, %.preheader1
  %169 = phi i32 [ %174, %171 ], [ 0, %.preheader1 ]
  %170 = icmp ult i32 %169, 4
  br i1 %170, label %171, label %.preheader

.preheader:                                       ; preds = %168
  br label %177

171:                                              ; preds = %168
  %172 = zext i32 %169 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %169, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.215 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %168, !llvm.loop !970

177:                                              ; preds = %185, %.preheader
  %178 = phi i32 [ %190, %185 ], [ 0, %.preheader ]
  %179 = phi float [ %189, %185 ], [ 0xFFF0000000000000, %.preheader ]
  %180 = icmp ult i32 %178, 8
  br i1 %180, label %185, label %181

181:                                              ; preds = %177
  %182 = getelementptr inbounds float, ptr addrspace(3) %5, i64 8
  %183 = fcmp reassoc nsz arcp contract oeq float %179, 0xFFF0000000000000, !spirv.Decorations !308
  %184 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %191

185:                                              ; preds = %177
  %186 = zext i32 %178 to i64
  %187 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %186
  %188 = load float, ptr addrspace(3) %187, align 4
  %189 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %179, float %188) #0, !spirv.Decorations !308
  %190 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

191:                                              ; preds = %229, %181
  %192 = phi i32 [ %230, %229 ], [ 0, %181 ]
  %193 = phi float [ %220, %229 ], [ 0.000000e+00, %181 ]
  %194 = icmp ult i32 %192, 8
  br i1 %194, label %205, label %195

195:                                              ; preds = %191
  %196 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %193, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %197 = fdiv reassoc nsz arcp contract float 1.000000e+00, %196, !spirv.Decorations !308
  %198 = mul nuw i32 %18, 24, !spirv.Decorations !373
  %199 = zext i32 %198 to i64
  %200 = sext i32 %20 to i64
  %201 = add nsw i64 %199, %200, !spirv.Decorations !332
  %202 = shl nsw i64 %201, 8, !spirv.Decorations !332
  %203 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %202
  %204 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %259

205:                                              ; preds = %191
  %206 = zext i32 %192 to i64
  %207 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %206
  %208 = load float, ptr addrspace(3) %207, align 4
  %209 = zext i32 %192 to i64
  %210 = getelementptr inbounds float, ptr addrspace(3) %182, i64 %209
  %211 = load float, ptr addrspace(3) %210, align 4
  %212 = fcmp reassoc nsz arcp contract oeq float %208, 0xFFF0000000000000, !spirv.Decorations !308
  %213 = or i1 %212, %183
  br i1 %213, label %217, label %214

214:                                              ; preds = %205
  %215 = fsub reassoc nsz arcp contract float %208, %179, !spirv.Decorations !308
  %216 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %215) #0, !spirv.Decorations !308
  br label %217

217:                                              ; preds = %214, %205
  %218 = phi float [ %216, %214 ], [ 0.000000e+00, %205 ]
  %219 = fmul reassoc nsz arcp contract float %218, %211, !spirv.Decorations !308
  %220 = fadd reassoc nsz arcp contract float %193, %219, !spirv.Decorations !308
  %221 = shl nuw nsw i32 %192, 8, !spirv.Decorations !305
  %222 = or i32 %221, 16
  %223 = add nuw nsw i32 %184, %222, !spirv.Decorations !305
  %224 = insertelement <4 x float> undef, float %218, i32 0
  %225 = shufflevector <4 x float> %224, <4 x float> undef, <4 x i32> zeroinitializer
  br label %226

226:                                              ; preds = %238, %217
  %227 = phi i32 [ 0, %217 ], [ %249, %238 ]
  %228 = icmp ult i32 %227, 4
  br i1 %228, label %231, label %229

229:                                              ; preds = %226
  %230 = add nuw nsw i32 %192, 1, !spirv.Decorations !305
  br label %191

231:                                              ; preds = %226
  %232 = shl nuw nsw i32 %227, 6, !spirv.Decorations !305
  %233 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %233)
  %234 = add nuw nsw i32 %232, %223, !spirv.Decorations !305
  br label %235

235:                                              ; preds = %250, %231
  %236 = phi i32 [ 0, %231 ], [ %258, %250 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %250, label %238

238:                                              ; preds = %235
  %239 = sext i32 %227 to i64
  %240 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %239
  %241 = bitcast ptr %240 to ptr
  %242 = load <4 x float>, ptr %241, align 16, !noalias !971
  %243 = bitcast ptr %10 to ptr
  %244 = load <4 x float>, ptr %243, align 16, !noalias !980
  %245 = fmul reassoc nsz arcp contract <4 x float> %225, %244, !spirv.Decorations !308
  %246 = fadd reassoc nsz arcp contract <4 x float> %242, %245, !spirv.Decorations !308
  %247 = bitcast ptr %240 to ptr
  store <4 x float> %246, ptr %247, align 16
  %248 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %248)
  %249 = add nuw nsw i32 %227, 1, !spirv.Decorations !305
  br label %226, !llvm.loop !989

250:                                              ; preds = %235
  %251 = or i32 %234, %236
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %252
  %254 = load float, ptr addrspace(3) %253, align 4
  %255 = zext i32 %236 to i64
  %256 = bitcast ptr %10 to ptr
  %257 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %256, i64 0, i32 0, i64 %255
  store float %254, ptr %257, align 4
  %258 = add nuw nsw i32 %236, 1, !spirv.Decorations !305
  br label %235, !llvm.loop !990

259:                                              ; preds = %270, %195
  %260 = phi i32 [ 0, %195 ], [ %271, %270 ]
  %261 = icmp ult i32 %260, 4
  br i1 %261, label %262, label %.loopexit

262:                                              ; preds = %259
  %263 = shl nuw nsw i32 %260, 6, !spirv.Decorations !305
  %264 = add nuw nsw i32 %263, %204, !spirv.Decorations !305
  %265 = sext i32 %260 to i64
  %266 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %265
  br label %267

267:                                              ; preds = %272, %262
  %268 = phi i32 [ 0, %262 ], [ %283, %272 ]
  %269 = icmp ult i32 %268, 4
  br i1 %269, label %272, label %270

270:                                              ; preds = %267
  %271 = add nuw nsw i32 %260, 1, !spirv.Decorations !305
  br label %259, !llvm.loop !991

272:                                              ; preds = %267
  %273 = zext i32 %268 to i64
  %274 = bitcast ptr %266 to ptr
  %275 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %274, i64 0, i32 0, i64 %273
  %276 = load float, ptr %275, align 4
  %277 = fmul reassoc nsz arcp contract float %276, %197, !spirv.Decorations !308
  %278 = fptrunc float %277 to half
  %279 = or i32 %264, %268
  %280 = sext i32 %279 to i64
  %281 = bitcast ptr addrspace(1) %203 to ptr addrspace(1)
  %282 = getelementptr inbounds half, ptr addrspace(1) %281, i64 %280
  store half %278, ptr addrspace(1) %282, align 2
  %283 = add nuw nsw i32 %268, 1, !spirv.Decorations !305
  br label %267, !llvm.loop !992

.loopexit:                                        ; preds = %259
  br label %284

284:                                              ; preds = %.loopexit, %147
  %285 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %285)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi16EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 15, !spirv.Decorations !332
  %36 = sdiv i32 %35, 16
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = getelementptr float, ptr addrspace(1) %2, i64 %46
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.216 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !993

54:                                               ; preds = %62, %45
  %55 = phi i32 [ %69, %62 ], [ %37, %45 ]
  %56 = phi float [ %68, %62 ], [ 0xFFF0000000000000, %45 ]
  %57 = icmp slt i32 %55, %40
  br i1 %57, label %62, label %58

58:                                               ; preds = %54
  %59 = sext i32 %25 to i64
  %60 = fcmp reassoc nsz arcp contract oeq float %56, 0xFFF0000000000000, !spirv.Decorations !308
  %61 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %70

62:                                               ; preds = %54
  %63 = add nsw i32 %26, %55, !spirv.Decorations !332
  %64 = sext i32 %63 to i64
  %65 = shl nsw i64 %64, 6, !spirv.Decorations !332
  %66 = getelementptr float, ptr addrspace(1) %47, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %56, float %67) #0, !spirv.Decorations !308
  %69 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

70:                                               ; preds = %101, %58
  %71 = phi i32 [ %102, %101 ], [ %37, %58 ]
  %72 = phi float [ %93, %101 ], [ 0.000000e+00, %58 ]
  %73 = icmp slt i32 %71, %40
  br i1 %73, label %76, label %74

74:                                               ; preds = %70
  %75 = icmp eq i32 %13, 0
  br i1 %75, label %135, label %139

76:                                               ; preds = %70
  %77 = add nsw i32 %26, %71, !spirv.Decorations !332
  %78 = sext i32 %77 to i64
  %79 = shl nsw i64 %78, 6, !spirv.Decorations !332
  %80 = add nsw i64 %79, %59, !spirv.Decorations !332
  %81 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %80
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = fcmp reassoc nsz arcp contract oeq float %82, 0xFFF0000000000000, !spirv.Decorations !308
  %86 = or i1 %85, %60
  br i1 %86, label %90, label %87

87:                                               ; preds = %76
  %88 = fsub reassoc nsz arcp contract float %82, %56, !spirv.Decorations !308
  %89 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %88) #0, !spirv.Decorations !308
  br label %90

90:                                               ; preds = %87, %76
  %91 = phi float [ %89, %87 ], [ 0.000000e+00, %76 ]
  %92 = fmul reassoc nsz arcp contract float %91, %84, !spirv.Decorations !308
  %93 = fadd reassoc nsz arcp contract float %72, %92, !spirv.Decorations !308
  %94 = shl nsw i64 %80, 8, !spirv.Decorations !332
  %95 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %94
  %96 = insertelement <4 x float> undef, float %92, i32 0
  %97 = shufflevector <4 x float> %96, <4 x float> undef, <4 x i32> zeroinitializer
  br label %98

98:                                               ; preds = %123, %90
  %99 = phi i32 [ 0, %90 ], [ %134, %123 ]
  %100 = icmp ult i32 %99, 4
  br i1 %100, label %103, label %101

101:                                              ; preds = %98
  %102 = add nsw i32 %71, 1, !spirv.Decorations !332
  br label %70

103:                                              ; preds = %98
  %104 = shl nuw nsw i32 %99, 6, !spirv.Decorations !305
  %105 = add nuw nsw i32 %104, %61, !spirv.Decorations !305
  %106 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %106)
  %107 = zext i32 %105 to i64
  %108 = getelementptr inbounds float, ptr addrspace(1) %95, i64 %107
  %109 = addrspacecast ptr addrspace(1) %108 to ptr addrspace(4)
  %110 = bitcast ptr addrspace(4) %109 to ptr addrspace(4)
  %111 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %110, i32 5) #0
  br label %112

112:                                              ; preds = %115, %103
  %113 = phi i32 [ 0, %103 ], [ %122, %115 ]
  %114 = icmp ult i32 %113, 4
  br i1 %114, label %115, label %123

115:                                              ; preds = %112
  %116 = zext i32 %113 to i64
  %117 = bitcast ptr addrspace(1) %111 to ptr addrspace(1)
  %118 = getelementptr inbounds float, ptr addrspace(1) %117, i64 %116
  %119 = load float, ptr addrspace(1) %118, align 4
  %120 = bitcast ptr %9 to ptr
  %121 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %120, i64 0, i32 0, i64 %116
  store float %119, ptr %121, align 4
  %122 = add nuw nsw i32 %113, 1, !spirv.Decorations !305
  br label %112

123:                                              ; preds = %112
  %124 = sext i32 %99 to i64
  %125 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %124
  %126 = bitcast ptr %125 to ptr
  %127 = load <4 x float>, ptr %126, align 16, !noalias !994
  %128 = bitcast ptr %9 to ptr
  %129 = load <4 x float>, ptr %128, align 16, !noalias !1003
  %130 = fmul reassoc nsz arcp contract <4 x float> %97, %129, !spirv.Decorations !308
  %131 = fadd reassoc nsz arcp contract <4 x float> %127, %130, !spirv.Decorations !308
  %132 = bitcast ptr %125 to ptr
  store <4 x float> %131, ptr %132, align 16
  %133 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %133)
  %134 = add nuw nsw i32 %99, 1, !spirv.Decorations !305
  br label %98, !llvm.loop !1012

135:                                              ; preds = %74
  %136 = zext i32 %11 to i64
  %137 = getelementptr float, ptr addrspace(3) %5, i64 %136
  store float %56, ptr addrspace(3) %137, align 4
  %138 = getelementptr float, ptr addrspace(3) %137, i64 16
  store float %72, ptr addrspace(3) %138, align 4
  br label %139

139:                                              ; preds = %135, %74
  %140 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %141 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %142 = or i32 %141, 32
  %143 = add nuw nsw i32 %140, %142, !spirv.Decorations !305
  br label %144

144:                                              ; preds = %157, %139
  %145 = phi i32 [ 0, %139 ], [ %158, %157 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %148 = icmp eq i32 %11, 0
  br i1 %148, label %.preheader1, label %284

.preheader1:                                      ; preds = %147
  br label %168

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !305
  %151 = sext i32 %145 to i64
  %152 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %151
  %153 = add nuw nsw i32 %150, %143, !spirv.Decorations !305
  br label %154

154:                                              ; preds = %159, %149
  %155 = phi i32 [ 0, %149 ], [ %167, %159 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %159, label %157

157:                                              ; preds = %154
  %158 = add nuw nsw i32 %145, 1, !spirv.Decorations !305
  br label %144, !llvm.loop !1013

159:                                              ; preds = %154
  %160 = zext i32 %155 to i64
  %161 = bitcast ptr %152 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %161, i64 0, i32 0, i64 %160
  %163 = load float, ptr %162, align 4
  %164 = or i32 %153, %155
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %165
  store float %163, ptr addrspace(3) %166, align 4
  %167 = add nuw nsw i32 %155, 1, !spirv.Decorations !305
  br label %154, !llvm.loop !1014

168:                                              ; preds = %171, %.preheader1
  %169 = phi i32 [ %174, %171 ], [ 0, %.preheader1 ]
  %170 = icmp ult i32 %169, 4
  br i1 %170, label %171, label %.preheader

.preheader:                                       ; preds = %168
  br label %177

171:                                              ; preds = %168
  %172 = zext i32 %169 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %169, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.217 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %168, !llvm.loop !1015

177:                                              ; preds = %185, %.preheader
  %178 = phi i32 [ %190, %185 ], [ 0, %.preheader ]
  %179 = phi float [ %189, %185 ], [ 0xFFF0000000000000, %.preheader ]
  %180 = icmp ult i32 %178, 16
  br i1 %180, label %185, label %181

181:                                              ; preds = %177
  %182 = getelementptr inbounds float, ptr addrspace(3) %5, i64 16
  %183 = fcmp reassoc nsz arcp contract oeq float %179, 0xFFF0000000000000, !spirv.Decorations !308
  %184 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %191

185:                                              ; preds = %177
  %186 = zext i32 %178 to i64
  %187 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %186
  %188 = load float, ptr addrspace(3) %187, align 4
  %189 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %179, float %188) #0, !spirv.Decorations !308
  %190 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

191:                                              ; preds = %229, %181
  %192 = phi i32 [ %230, %229 ], [ 0, %181 ]
  %193 = phi float [ %220, %229 ], [ 0.000000e+00, %181 ]
  %194 = icmp ult i32 %192, 16
  br i1 %194, label %205, label %195

195:                                              ; preds = %191
  %196 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %193, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %197 = fdiv reassoc nsz arcp contract float 1.000000e+00, %196, !spirv.Decorations !308
  %198 = mul nuw i32 %18, 24, !spirv.Decorations !373
  %199 = zext i32 %198 to i64
  %200 = sext i32 %20 to i64
  %201 = add nsw i64 %199, %200, !spirv.Decorations !332
  %202 = shl nsw i64 %201, 8, !spirv.Decorations !332
  %203 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %202
  %204 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %259

205:                                              ; preds = %191
  %206 = zext i32 %192 to i64
  %207 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %206
  %208 = load float, ptr addrspace(3) %207, align 4
  %209 = zext i32 %192 to i64
  %210 = getelementptr inbounds float, ptr addrspace(3) %182, i64 %209
  %211 = load float, ptr addrspace(3) %210, align 4
  %212 = fcmp reassoc nsz arcp contract oeq float %208, 0xFFF0000000000000, !spirv.Decorations !308
  %213 = or i1 %212, %183
  br i1 %213, label %217, label %214

214:                                              ; preds = %205
  %215 = fsub reassoc nsz arcp contract float %208, %179, !spirv.Decorations !308
  %216 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %215) #0, !spirv.Decorations !308
  br label %217

217:                                              ; preds = %214, %205
  %218 = phi float [ %216, %214 ], [ 0.000000e+00, %205 ]
  %219 = fmul reassoc nsz arcp contract float %218, %211, !spirv.Decorations !308
  %220 = fadd reassoc nsz arcp contract float %193, %219, !spirv.Decorations !308
  %221 = shl nuw nsw i32 %192, 8, !spirv.Decorations !305
  %222 = or i32 %221, 32
  %223 = add nuw nsw i32 %184, %222, !spirv.Decorations !305
  %224 = insertelement <4 x float> undef, float %218, i32 0
  %225 = shufflevector <4 x float> %224, <4 x float> undef, <4 x i32> zeroinitializer
  br label %226

226:                                              ; preds = %238, %217
  %227 = phi i32 [ 0, %217 ], [ %249, %238 ]
  %228 = icmp ult i32 %227, 4
  br i1 %228, label %231, label %229

229:                                              ; preds = %226
  %230 = add nuw nsw i32 %192, 1, !spirv.Decorations !305
  br label %191

231:                                              ; preds = %226
  %232 = shl nuw nsw i32 %227, 6, !spirv.Decorations !305
  %233 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %233)
  %234 = add nuw nsw i32 %232, %223, !spirv.Decorations !305
  br label %235

235:                                              ; preds = %250, %231
  %236 = phi i32 [ 0, %231 ], [ %258, %250 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %250, label %238

238:                                              ; preds = %235
  %239 = sext i32 %227 to i64
  %240 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %239
  %241 = bitcast ptr %240 to ptr
  %242 = load <4 x float>, ptr %241, align 16, !noalias !1016
  %243 = bitcast ptr %10 to ptr
  %244 = load <4 x float>, ptr %243, align 16, !noalias !1025
  %245 = fmul reassoc nsz arcp contract <4 x float> %225, %244, !spirv.Decorations !308
  %246 = fadd reassoc nsz arcp contract <4 x float> %242, %245, !spirv.Decorations !308
  %247 = bitcast ptr %240 to ptr
  store <4 x float> %246, ptr %247, align 16
  %248 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %248)
  %249 = add nuw nsw i32 %227, 1, !spirv.Decorations !305
  br label %226, !llvm.loop !1034

250:                                              ; preds = %235
  %251 = or i32 %234, %236
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %252
  %254 = load float, ptr addrspace(3) %253, align 4
  %255 = zext i32 %236 to i64
  %256 = bitcast ptr %10 to ptr
  %257 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %256, i64 0, i32 0, i64 %255
  store float %254, ptr %257, align 4
  %258 = add nuw nsw i32 %236, 1, !spirv.Decorations !305
  br label %235, !llvm.loop !1035

259:                                              ; preds = %270, %195
  %260 = phi i32 [ 0, %195 ], [ %271, %270 ]
  %261 = icmp ult i32 %260, 4
  br i1 %261, label %262, label %.loopexit

262:                                              ; preds = %259
  %263 = shl nuw nsw i32 %260, 6, !spirv.Decorations !305
  %264 = add nuw nsw i32 %263, %204, !spirv.Decorations !305
  %265 = sext i32 %260 to i64
  %266 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %265
  br label %267

267:                                              ; preds = %272, %262
  %268 = phi i32 [ 0, %262 ], [ %283, %272 ]
  %269 = icmp ult i32 %268, 4
  br i1 %269, label %272, label %270

270:                                              ; preds = %267
  %271 = add nuw nsw i32 %260, 1, !spirv.Decorations !305
  br label %259, !llvm.loop !1036

272:                                              ; preds = %267
  %273 = zext i32 %268 to i64
  %274 = bitcast ptr %266 to ptr
  %275 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %274, i64 0, i32 0, i64 %273
  %276 = load float, ptr %275, align 4
  %277 = fmul reassoc nsz arcp contract float %276, %197, !spirv.Decorations !308
  %278 = fptrunc float %277 to half
  %279 = or i32 %264, %268
  %280 = sext i32 %279 to i64
  %281 = bitcast ptr addrspace(1) %203 to ptr addrspace(1)
  %282 = getelementptr inbounds half, ptr addrspace(1) %281, i64 %280
  store half %278, ptr addrspace(1) %282, align 2
  %283 = add nuw nsw i32 %268, 1, !spirv.Decorations !305
  br label %267, !llvm.loop !1037

.loopexit:                                        ; preds = %259
  br label %284

284:                                              ; preds = %.loopexit, %147
  %285 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %285)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS2TwoPassHalfILi4ELi32EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 31, !spirv.Decorations !332
  %36 = sdiv i32 %35, 32
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = getelementptr float, ptr addrspace(1) %2, i64 %46
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.218 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !1038

54:                                               ; preds = %62, %45
  %55 = phi i32 [ %69, %62 ], [ %37, %45 ]
  %56 = phi float [ %68, %62 ], [ 0xFFF0000000000000, %45 ]
  %57 = icmp slt i32 %55, %40
  br i1 %57, label %62, label %58

58:                                               ; preds = %54
  %59 = sext i32 %25 to i64
  %60 = fcmp reassoc nsz arcp contract oeq float %56, 0xFFF0000000000000, !spirv.Decorations !308
  %61 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %70

62:                                               ; preds = %54
  %63 = add nsw i32 %26, %55, !spirv.Decorations !332
  %64 = sext i32 %63 to i64
  %65 = shl nsw i64 %64, 6, !spirv.Decorations !332
  %66 = getelementptr float, ptr addrspace(1) %47, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %56, float %67) #0, !spirv.Decorations !308
  %69 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

70:                                               ; preds = %101, %58
  %71 = phi i32 [ %102, %101 ], [ %37, %58 ]
  %72 = phi float [ %93, %101 ], [ 0.000000e+00, %58 ]
  %73 = icmp slt i32 %71, %40
  br i1 %73, label %76, label %74

74:                                               ; preds = %70
  %75 = icmp eq i32 %13, 0
  br i1 %75, label %135, label %139

76:                                               ; preds = %70
  %77 = add nsw i32 %26, %71, !spirv.Decorations !332
  %78 = sext i32 %77 to i64
  %79 = shl nsw i64 %78, 6, !spirv.Decorations !332
  %80 = add nsw i64 %79, %59, !spirv.Decorations !332
  %81 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %80
  %82 = load float, ptr addrspace(1) %81, align 4
  %83 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %80
  %84 = load float, ptr addrspace(1) %83, align 4
  %85 = fcmp reassoc nsz arcp contract oeq float %82, 0xFFF0000000000000, !spirv.Decorations !308
  %86 = or i1 %85, %60
  br i1 %86, label %90, label %87

87:                                               ; preds = %76
  %88 = fsub reassoc nsz arcp contract float %82, %56, !spirv.Decorations !308
  %89 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %88) #0, !spirv.Decorations !308
  br label %90

90:                                               ; preds = %87, %76
  %91 = phi float [ %89, %87 ], [ 0.000000e+00, %76 ]
  %92 = fmul reassoc nsz arcp contract float %91, %84, !spirv.Decorations !308
  %93 = fadd reassoc nsz arcp contract float %72, %92, !spirv.Decorations !308
  %94 = shl nsw i64 %80, 8, !spirv.Decorations !332
  %95 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %94
  %96 = insertelement <4 x float> undef, float %92, i32 0
  %97 = shufflevector <4 x float> %96, <4 x float> undef, <4 x i32> zeroinitializer
  br label %98

98:                                               ; preds = %123, %90
  %99 = phi i32 [ 0, %90 ], [ %134, %123 ]
  %100 = icmp ult i32 %99, 4
  br i1 %100, label %103, label %101

101:                                              ; preds = %98
  %102 = add nsw i32 %71, 1, !spirv.Decorations !332
  br label %70

103:                                              ; preds = %98
  %104 = shl nuw nsw i32 %99, 6, !spirv.Decorations !305
  %105 = add nuw nsw i32 %104, %61, !spirv.Decorations !305
  %106 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %106)
  %107 = zext i32 %105 to i64
  %108 = getelementptr inbounds float, ptr addrspace(1) %95, i64 %107
  %109 = addrspacecast ptr addrspace(1) %108 to ptr addrspace(4)
  %110 = bitcast ptr addrspace(4) %109 to ptr addrspace(4)
  %111 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %110, i32 5) #0
  br label %112

112:                                              ; preds = %115, %103
  %113 = phi i32 [ 0, %103 ], [ %122, %115 ]
  %114 = icmp ult i32 %113, 4
  br i1 %114, label %115, label %123

115:                                              ; preds = %112
  %116 = zext i32 %113 to i64
  %117 = bitcast ptr addrspace(1) %111 to ptr addrspace(1)
  %118 = getelementptr inbounds float, ptr addrspace(1) %117, i64 %116
  %119 = load float, ptr addrspace(1) %118, align 4
  %120 = bitcast ptr %9 to ptr
  %121 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %120, i64 0, i32 0, i64 %116
  store float %119, ptr %121, align 4
  %122 = add nuw nsw i32 %113, 1, !spirv.Decorations !305
  br label %112

123:                                              ; preds = %112
  %124 = sext i32 %99 to i64
  %125 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %124
  %126 = bitcast ptr %125 to ptr
  %127 = load <4 x float>, ptr %126, align 16, !noalias !1039
  %128 = bitcast ptr %9 to ptr
  %129 = load <4 x float>, ptr %128, align 16, !noalias !1048
  %130 = fmul reassoc nsz arcp contract <4 x float> %97, %129, !spirv.Decorations !308
  %131 = fadd reassoc nsz arcp contract <4 x float> %127, %130, !spirv.Decorations !308
  %132 = bitcast ptr %125 to ptr
  store <4 x float> %131, ptr %132, align 16
  %133 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %133)
  %134 = add nuw nsw i32 %99, 1, !spirv.Decorations !305
  br label %98, !llvm.loop !1057

135:                                              ; preds = %74
  %136 = zext i32 %11 to i64
  %137 = getelementptr float, ptr addrspace(3) %5, i64 %136
  store float %56, ptr addrspace(3) %137, align 4
  %138 = getelementptr float, ptr addrspace(3) %137, i64 32
  store float %72, ptr addrspace(3) %138, align 4
  br label %139

139:                                              ; preds = %135, %74
  %140 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %141 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %142 = or i32 %141, 64
  %143 = add nuw nsw i32 %140, %142, !spirv.Decorations !305
  br label %144

144:                                              ; preds = %157, %139
  %145 = phi i32 [ 0, %139 ], [ %158, %157 ]
  %146 = icmp ult i32 %145, 4
  br i1 %146, label %149, label %147

147:                                              ; preds = %144
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %148 = icmp eq i32 %11, 0
  br i1 %148, label %.preheader1, label %284

.preheader1:                                      ; preds = %147
  br label %168

149:                                              ; preds = %144
  %150 = shl nuw nsw i32 %145, 6, !spirv.Decorations !305
  %151 = sext i32 %145 to i64
  %152 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %151
  %153 = add nuw nsw i32 %150, %143, !spirv.Decorations !305
  br label %154

154:                                              ; preds = %159, %149
  %155 = phi i32 [ 0, %149 ], [ %167, %159 ]
  %156 = icmp ult i32 %155, 4
  br i1 %156, label %159, label %157

157:                                              ; preds = %154
  %158 = add nuw nsw i32 %145, 1, !spirv.Decorations !305
  br label %144, !llvm.loop !1058

159:                                              ; preds = %154
  %160 = zext i32 %155 to i64
  %161 = bitcast ptr %152 to ptr
  %162 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %161, i64 0, i32 0, i64 %160
  %163 = load float, ptr %162, align 4
  %164 = or i32 %153, %155
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %165
  store float %163, ptr addrspace(3) %166, align 4
  %167 = add nuw nsw i32 %155, 1, !spirv.Decorations !305
  br label %154, !llvm.loop !1059

168:                                              ; preds = %171, %.preheader1
  %169 = phi i32 [ %174, %171 ], [ 0, %.preheader1 ]
  %170 = icmp ult i32 %169, 4
  br i1 %170, label %171, label %.preheader

.preheader:                                       ; preds = %168
  br label %177

171:                                              ; preds = %168
  %172 = zext i32 %169 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %169, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.219 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %168, !llvm.loop !1060

177:                                              ; preds = %185, %.preheader
  %178 = phi i32 [ %190, %185 ], [ 0, %.preheader ]
  %179 = phi float [ %189, %185 ], [ 0xFFF0000000000000, %.preheader ]
  %180 = icmp ult i32 %178, 32
  br i1 %180, label %185, label %181

181:                                              ; preds = %177
  %182 = getelementptr inbounds float, ptr addrspace(3) %5, i64 32
  %183 = fcmp reassoc nsz arcp contract oeq float %179, 0xFFF0000000000000, !spirv.Decorations !308
  %184 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %191

185:                                              ; preds = %177
  %186 = zext i32 %178 to i64
  %187 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %186
  %188 = load float, ptr addrspace(3) %187, align 4
  %189 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %179, float %188) #0, !spirv.Decorations !308
  %190 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

191:                                              ; preds = %229, %181
  %192 = phi i32 [ %230, %229 ], [ 0, %181 ]
  %193 = phi float [ %220, %229 ], [ 0.000000e+00, %181 ]
  %194 = icmp ult i32 %192, 32
  br i1 %194, label %205, label %195

195:                                              ; preds = %191
  %196 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %193, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %197 = fdiv reassoc nsz arcp contract float 1.000000e+00, %196, !spirv.Decorations !308
  %198 = mul nuw i32 %18, 24, !spirv.Decorations !373
  %199 = zext i32 %198 to i64
  %200 = sext i32 %20 to i64
  %201 = add nsw i64 %199, %200, !spirv.Decorations !332
  %202 = shl nsw i64 %201, 8, !spirv.Decorations !332
  %203 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %202
  %204 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %259

205:                                              ; preds = %191
  %206 = zext i32 %192 to i64
  %207 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %206
  %208 = load float, ptr addrspace(3) %207, align 4
  %209 = zext i32 %192 to i64
  %210 = getelementptr inbounds float, ptr addrspace(3) %182, i64 %209
  %211 = load float, ptr addrspace(3) %210, align 4
  %212 = fcmp reassoc nsz arcp contract oeq float %208, 0xFFF0000000000000, !spirv.Decorations !308
  %213 = or i1 %212, %183
  br i1 %213, label %217, label %214

214:                                              ; preds = %205
  %215 = fsub reassoc nsz arcp contract float %208, %179, !spirv.Decorations !308
  %216 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %215) #0, !spirv.Decorations !308
  br label %217

217:                                              ; preds = %214, %205
  %218 = phi float [ %216, %214 ], [ 0.000000e+00, %205 ]
  %219 = fmul reassoc nsz arcp contract float %218, %211, !spirv.Decorations !308
  %220 = fadd reassoc nsz arcp contract float %193, %219, !spirv.Decorations !308
  %221 = shl nuw nsw i32 %192, 8, !spirv.Decorations !305
  %222 = or i32 %221, 64
  %223 = add nuw nsw i32 %184, %222, !spirv.Decorations !305
  %224 = insertelement <4 x float> undef, float %218, i32 0
  %225 = shufflevector <4 x float> %224, <4 x float> undef, <4 x i32> zeroinitializer
  br label %226

226:                                              ; preds = %238, %217
  %227 = phi i32 [ 0, %217 ], [ %249, %238 ]
  %228 = icmp ult i32 %227, 4
  br i1 %228, label %231, label %229

229:                                              ; preds = %226
  %230 = add nuw nsw i32 %192, 1, !spirv.Decorations !305
  br label %191

231:                                              ; preds = %226
  %232 = shl nuw nsw i32 %227, 6, !spirv.Decorations !305
  %233 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %233)
  %234 = add nuw nsw i32 %232, %223, !spirv.Decorations !305
  br label %235

235:                                              ; preds = %250, %231
  %236 = phi i32 [ 0, %231 ], [ %258, %250 ]
  %237 = icmp ult i32 %236, 4
  br i1 %237, label %250, label %238

238:                                              ; preds = %235
  %239 = sext i32 %227 to i64
  %240 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %239
  %241 = bitcast ptr %240 to ptr
  %242 = load <4 x float>, ptr %241, align 16, !noalias !1061
  %243 = bitcast ptr %10 to ptr
  %244 = load <4 x float>, ptr %243, align 16, !noalias !1070
  %245 = fmul reassoc nsz arcp contract <4 x float> %225, %244, !spirv.Decorations !308
  %246 = fadd reassoc nsz arcp contract <4 x float> %242, %245, !spirv.Decorations !308
  %247 = bitcast ptr %240 to ptr
  store <4 x float> %246, ptr %247, align 16
  %248 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %248)
  %249 = add nuw nsw i32 %227, 1, !spirv.Decorations !305
  br label %226, !llvm.loop !1079

250:                                              ; preds = %235
  %251 = or i32 %234, %236
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %252
  %254 = load float, ptr addrspace(3) %253, align 4
  %255 = zext i32 %236 to i64
  %256 = bitcast ptr %10 to ptr
  %257 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %256, i64 0, i32 0, i64 %255
  store float %254, ptr %257, align 4
  %258 = add nuw nsw i32 %236, 1, !spirv.Decorations !305
  br label %235, !llvm.loop !1080

259:                                              ; preds = %270, %195
  %260 = phi i32 [ 0, %195 ], [ %271, %270 ]
  %261 = icmp ult i32 %260, 4
  br i1 %261, label %262, label %.loopexit

262:                                              ; preds = %259
  %263 = shl nuw nsw i32 %260, 6, !spirv.Decorations !305
  %264 = add nuw nsw i32 %263, %204, !spirv.Decorations !305
  %265 = sext i32 %260 to i64
  %266 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %265
  br label %267

267:                                              ; preds = %272, %262
  %268 = phi i32 [ 0, %262 ], [ %283, %272 ]
  %269 = icmp ult i32 %268, 4
  br i1 %269, label %272, label %270

270:                                              ; preds = %267
  %271 = add nuw nsw i32 %260, 1, !spirv.Decorations !305
  br label %259, !llvm.loop !1081

272:                                              ; preds = %267
  %273 = zext i32 %268 to i64
  %274 = bitcast ptr %266 to ptr
  %275 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %274, i64 0, i32 0, i64 %273
  %276 = load float, ptr %275, align 4
  %277 = fmul reassoc nsz arcp contract float %276, %197, !spirv.Decorations !308
  %278 = fptrunc float %277 to half
  %279 = or i32 %264, %268
  %280 = sext i32 %279 to i64
  %281 = bitcast ptr addrspace(1) %203 to ptr addrspace(1)
  %282 = getelementptr inbounds half, ptr addrspace(1) %281, i64 %280
  store half %278, ptr addrspace(1) %282, align 2
  %283 = add nuw nsw i32 %268, 1, !spirv.Decorations !305
  br label %267, !llvm.loop !1082

.loopexit:                                        ; preds = %259
  br label %284

284:                                              ; preds = %.loopexit, %147
  %285 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %285)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_128Xe2KvTorchAbiS2ParallelHalf8ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 7, !spirv.Decorations !332
  %36 = sdiv i32 %35, 8
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.220 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !1083

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !332
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !332
  %65 = add nsw i64 %64, %46, !spirv.Decorations !332
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !308
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !308
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !308
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !308
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !308
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !308
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !308
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !308
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !308
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !308
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !332
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !305
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !305
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !305
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !1084
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !308
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !1093
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !308
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !308
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !305
  br label %94, !llvm.loop !1102

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 8
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %139 = or i32 %138, 16
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !305
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %283

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !305
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !305
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !305
  br label %141, !llvm.loop !1103

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !305
  br label %151, !llvm.loop !1104

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 8
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.221 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !1105

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 8
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !308
  %185 = mul nuw i32 %18, 24, !spirv.Decorations !373
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !332
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !332
  %190 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !308
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !308
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !308
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !308
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !308
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !308
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !308
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !308
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !308
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !308
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !305
  %218 = or i32 %217, 16
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !305
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !305
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !305
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !1106
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !308
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !1115
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !308
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !308
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !305
  br label %224, !llvm.loop !1124

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !305
  br label %233, !llvm.loop !1125

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !305
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !305
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %282, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !305
  br label %258, !llvm.loop !1126

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !308
  %277 = fptrunc float %276 to half
  %278 = or i32 %263, %267
  %279 = sext i32 %278 to i64
  %280 = bitcast ptr addrspace(1) %190 to ptr addrspace(1)
  %281 = getelementptr inbounds half, ptr addrspace(1) %280, i64 %279
  store half %277, ptr addrspace(1) %281, align 2
  %282 = add nuw nsw i32 %267, 1, !spirv.Decorations !305
  br label %266, !llvm.loop !1127

.loopexit:                                        ; preds = %258
  br label %283

283:                                              ; preds = %.loopexit, %144
  %284 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %284)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf16ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 15, !spirv.Decorations !332
  %36 = sdiv i32 %35, 16
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.222 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !1128

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !332
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !332
  %65 = add nsw i64 %64, %46, !spirv.Decorations !332
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !308
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !308
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !308
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !308
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !308
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !308
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !308
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !308
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !308
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !308
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !332
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !305
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !305
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !305
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !1129
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !308
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !1138
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !308
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !308
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !305
  br label %94, !llvm.loop !1147

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 16
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %139 = or i32 %138, 32
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !305
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %283

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !305
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !305
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !305
  br label %141, !llvm.loop !1148

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !305
  br label %151, !llvm.loop !1149

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 16
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.223 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !1150

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 16
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !308
  %185 = mul nuw i32 %18, 24, !spirv.Decorations !373
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !332
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !332
  %190 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !308
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !308
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !308
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !308
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !308
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !308
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !308
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !308
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !308
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !308
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !305
  %218 = or i32 %217, 32
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !305
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !305
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !305
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !1151
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !308
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !1160
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !308
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !308
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !305
  br label %224, !llvm.loop !1169

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !305
  br label %233, !llvm.loop !1170

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !305
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !305
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %282, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !305
  br label %258, !llvm.loop !1171

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !308
  %277 = fptrunc float %276 to half
  %278 = or i32 %263, %267
  %279 = sext i32 %278 to i64
  %280 = bitcast ptr addrspace(1) %190 to ptr addrspace(1)
  %281 = getelementptr inbounds half, ptr addrspace(1) %280, i64 %279
  store half %277, ptr addrspace(1) %281, align 2
  %282 = add nuw nsw i32 %267, 1, !spirv.Decorations !305
  br label %266, !llvm.loop !1172

.loopexit:                                        ; preds = %258
  br label %283

283:                                              ; preds = %.loopexit, %144
  %284 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %284)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiS2ParallelHalf32ILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !338 !kernel_arg_access_qual !326 !kernel_arg_type !498 !kernel_arg_type_qual !328 !kernel_arg_base_type !498 !kernel_arg_name !328 !spirv.ParameterDecorations !499 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %11 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %12 = icmp sgt i32 %11, -1
  call void @llvm.assume(i1 %12)
  %13 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %16 = icmp ult i64 %15, 2147483648
  call void @llvm.assume(i1 %16)
  %17 = trunc i64 %15 to i32
  %18 = udiv i32 %17, 24
  %19 = mul nsw i32 %18, -24, !spirv.Decorations !332
  %20 = add nsw i32 %19, %17, !spirv.Decorations !332
  %21 = sdiv i32 %20, 6
  %22 = mul nuw nsw i32 %18, 6, !spirv.Decorations !305
  %23 = mul nsw i32 %21, -6, !spirv.Decorations !332
  %24 = add nsw i32 %23, %20, !spirv.Decorations !332
  %25 = add nsw i32 %22, %24, !spirv.Decorations !332
  %26 = mul nsw i32 %21, %0, !spirv.Decorations !332
  %27 = load i32, ptr addrspace(1) %1, align 4
  %28 = sext i32 %27 to i64
  %29 = sext i32 %0 to i64
  %30 = add nsw i64 %28, 63, !spirv.Decorations !332
  %31 = sdiv i64 %30, 64
  %32 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %29, i64 %31) #0
  %33 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %32) #0
  %34 = trunc i64 %33 to i32
  %35 = add nsw i32 %34, 31, !spirv.Decorations !332
  %36 = sdiv i32 %35, 32
  %37 = mul nsw i32 %36, %11, !spirv.Decorations !332
  %38 = add nsw i32 %37, %36, !spirv.Decorations !332
  %39 = icmp slt i32 %38, %34
  %40 = select i1 %39, i32 %38, i32 %34
  %41 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %41)
  br label %42

42:                                               ; preds = %48, %7
  %43 = phi i32 [ 0, %7 ], [ %51, %48 ]
  %44 = icmp ult i32 %43, 4
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = sext i32 %25 to i64
  %47 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %54

48:                                               ; preds = %42
  %49 = zext i32 %43 to i64
  %50 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %49
  %51 = add nuw nsw i32 %43, 1, !spirv.Decorations !305
  %52 = bitcast ptr %50 to ptr
  %53 = bitcast ptr addrspace(2) @gVar.224 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %52, ptr addrspace(2) align 16 %53, i64 16, i1 false)
  br label %42, !llvm.loop !1173

54:                                               ; preds = %97, %45
  %55 = phi i32 [ %98, %97 ], [ %37, %45 ]
  %56 = phi float [ %87, %97 ], [ 0.000000e+00, %45 ]
  %57 = phi float [ %70, %97 ], [ 0xFFF0000000000000, %45 ]
  %58 = icmp slt i32 %55, %40
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = icmp eq i32 %13, 0
  br i1 %60, label %132, label %136

61:                                               ; preds = %54
  %62 = add nsw i32 %26, %55, !spirv.Decorations !332
  %63 = sext i32 %62 to i64
  %64 = shl nsw i64 %63, 6, !spirv.Decorations !332
  %65 = add nsw i64 %64, %46, !spirv.Decorations !332
  %66 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %65
  %67 = load float, ptr addrspace(1) %66, align 4
  %68 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %65
  %69 = load float, ptr addrspace(1) %68, align 4
  %70 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %57, float %67) #0, !spirv.Decorations !308
  %71 = fcmp reassoc nsz arcp contract oeq float %57, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %71, label %75, label %72

72:                                               ; preds = %61
  %73 = fsub reassoc nsz arcp contract float %57, %70, !spirv.Decorations !308
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !308
  br label %75

75:                                               ; preds = %72, %61
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %61 ]
  %77 = fcmp reassoc nsz arcp contract oeq float %67, 0xFFF0000000000000, !spirv.Decorations !308
  %78 = fcmp reassoc nsz arcp contract oeq float %70, 0xFFF0000000000000, !spirv.Decorations !308
  %79 = or i1 %77, %78
  br i1 %79, label %83, label %80

80:                                               ; preds = %75
  %81 = fsub reassoc nsz arcp contract float %67, %70, !spirv.Decorations !308
  %82 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %81) #0, !spirv.Decorations !308
  br label %83

83:                                               ; preds = %80, %75
  %84 = phi float [ %82, %80 ], [ 0.000000e+00, %75 ]
  %85 = fmul reassoc nsz arcp contract float %84, %69, !spirv.Decorations !308
  %86 = fmul reassoc nsz arcp contract float %56, %76, !spirv.Decorations !308
  %87 = fadd reassoc nsz arcp contract float %86, %85, !spirv.Decorations !308
  %88 = shl nsw i64 %65, 8, !spirv.Decorations !332
  %89 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %88
  %90 = insertelement <4 x float> undef, float %76, i32 0
  %91 = shufflevector <4 x float> %90, <4 x float> undef, <4 x i32> zeroinitializer
  %92 = insertelement <4 x float> undef, float %85, i32 0
  %93 = shufflevector <4 x float> %92, <4 x float> undef, <4 x i32> zeroinitializer
  br label %94

94:                                               ; preds = %119, %83
  %95 = phi i32 [ 0, %83 ], [ %131, %119 ]
  %96 = icmp ult i32 %95, 4
  br i1 %96, label %99, label %97

97:                                               ; preds = %94
  %98 = add nsw i32 %55, 1, !spirv.Decorations !332
  br label %54

99:                                               ; preds = %94
  %100 = shl nuw nsw i32 %95, 6, !spirv.Decorations !305
  %101 = add nuw nsw i32 %100, %47, !spirv.Decorations !305
  %102 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %102)
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %89, i64 %103
  %105 = addrspacecast ptr addrspace(1) %104 to ptr addrspace(4)
  %106 = bitcast ptr addrspace(4) %105 to ptr addrspace(4)
  %107 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %106, i32 5) #0
  br label %108

108:                                              ; preds = %111, %99
  %109 = phi i32 [ 0, %99 ], [ %118, %111 ]
  %110 = icmp ult i32 %109, 4
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = zext i32 %109 to i64
  %113 = bitcast ptr addrspace(1) %107 to ptr addrspace(1)
  %114 = getelementptr inbounds float, ptr addrspace(1) %113, i64 %112
  %115 = load float, ptr addrspace(1) %114, align 4
  %116 = bitcast ptr %9 to ptr
  %117 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %116, i64 0, i32 0, i64 %112
  store float %115, ptr %117, align 4
  %118 = add nuw nsw i32 %109, 1, !spirv.Decorations !305
  br label %108

119:                                              ; preds = %108
  %120 = sext i32 %95 to i64
  %121 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %120
  %122 = bitcast ptr %121 to ptr
  %123 = load <4 x float>, ptr %122, align 16, !noalias !1174
  %124 = fmul reassoc nsz arcp contract <4 x float> %123, %91, !spirv.Decorations !308
  %125 = bitcast ptr %9 to ptr
  %126 = load <4 x float>, ptr %125, align 16, !noalias !1183
  %127 = fmul reassoc nsz arcp contract <4 x float> %93, %126, !spirv.Decorations !308
  %128 = fadd reassoc nsz arcp contract <4 x float> %124, %127, !spirv.Decorations !308
  %129 = bitcast ptr %121 to ptr
  store <4 x float> %128, ptr %129, align 16
  %130 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %130)
  %131 = add nuw nsw i32 %95, 1, !spirv.Decorations !305
  br label %94, !llvm.loop !1192

132:                                              ; preds = %59
  %133 = zext i32 %11 to i64
  %134 = getelementptr float, ptr addrspace(3) %5, i64 %133
  store float %57, ptr addrspace(3) %134, align 4
  %135 = getelementptr float, ptr addrspace(3) %134, i64 32
  store float %56, ptr addrspace(3) %135, align 4
  br label %136

136:                                              ; preds = %132, %59
  %137 = shl nsw i32 %13, 2, !spirv.Decorations !332
  %138 = shl nsw i32 %11, 8, !spirv.Decorations !332
  %139 = or i32 %138, 64
  %140 = add nuw nsw i32 %137, %139, !spirv.Decorations !305
  br label %141

141:                                              ; preds = %154, %136
  %142 = phi i32 [ 0, %136 ], [ %155, %154 ]
  %143 = icmp ult i32 %142, 4
  br i1 %143, label %146, label %144

144:                                              ; preds = %141
  call spir_func void @_Z22__spirv_ControlBarrieriii(i32 2, i32 2, i32 272) #2
  %145 = icmp eq i32 %11, 0
  br i1 %145, label %.preheader, label %283

.preheader:                                       ; preds = %144
  br label %165

146:                                              ; preds = %141
  %147 = shl nuw nsw i32 %142, 6, !spirv.Decorations !305
  %148 = sext i32 %142 to i64
  %149 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %148
  %150 = add nuw nsw i32 %147, %140, !spirv.Decorations !305
  br label %151

151:                                              ; preds = %156, %146
  %152 = phi i32 [ 0, %146 ], [ %164, %156 ]
  %153 = icmp ult i32 %152, 4
  br i1 %153, label %156, label %154

154:                                              ; preds = %151
  %155 = add nuw nsw i32 %142, 1, !spirv.Decorations !305
  br label %141, !llvm.loop !1193

156:                                              ; preds = %151
  %157 = zext i32 %152 to i64
  %158 = bitcast ptr %149 to ptr
  %159 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %158, i64 0, i32 0, i64 %157
  %160 = load float, ptr %159, align 4
  %161 = or i32 %150, %152
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %162
  store float %160, ptr addrspace(3) %163, align 4
  %164 = add nuw nsw i32 %152, 1, !spirv.Decorations !305
  br label %151, !llvm.loop !1194

165:                                              ; preds = %171, %.preheader
  %166 = phi i32 [ %174, %171 ], [ 0, %.preheader ]
  %167 = icmp ult i32 %166, 4
  br i1 %167, label %171, label %168

168:                                              ; preds = %165
  %169 = getelementptr inbounds float, ptr addrspace(3) %5, i64 32
  %170 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %177

171:                                              ; preds = %165
  %172 = zext i32 %166 to i64
  %173 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %172
  %174 = add nuw nsw i32 %166, 1, !spirv.Decorations !305
  %175 = bitcast ptr %173 to ptr
  %176 = bitcast ptr addrspace(2) @gVar.225 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %175, ptr addrspace(2) align 16 %176, i64 16, i1 false)
  br label %165, !llvm.loop !1195

177:                                              ; preds = %227, %168
  %178 = phi i32 [ %228, %227 ], [ 0, %168 ]
  %179 = phi float [ %216, %227 ], [ 0.000000e+00, %168 ]
  %180 = phi float [ %199, %227 ], [ 0xFFF0000000000000, %168 ]
  %181 = icmp ult i32 %178, 32
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %179, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %184 = fdiv reassoc nsz arcp contract float 1.000000e+00, %183, !spirv.Decorations !308
  %185 = mul nuw i32 %18, 24, !spirv.Decorations !373
  %186 = zext i32 %185 to i64
  %187 = sext i32 %20 to i64
  %188 = add nsw i64 %186, %187, !spirv.Decorations !332
  %189 = shl nsw i64 %188, 8, !spirv.Decorations !332
  %190 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %189
  %191 = shl nsw i32 %13, 2, !spirv.Decorations !332
  br label %258

192:                                              ; preds = %177
  %193 = zext i32 %178 to i64
  %194 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %193
  %195 = load float, ptr addrspace(3) %194, align 4
  %196 = zext i32 %178 to i64
  %197 = getelementptr inbounds float, ptr addrspace(3) %169, i64 %196
  %198 = load float, ptr addrspace(3) %197, align 4
  %199 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %180, float %195) #0, !spirv.Decorations !308
  %200 = fcmp reassoc nsz arcp contract oeq float %180, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %200, label %204, label %201

201:                                              ; preds = %192
  %202 = fsub reassoc nsz arcp contract float %180, %199, !spirv.Decorations !308
  %203 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %202) #0, !spirv.Decorations !308
  br label %204

204:                                              ; preds = %201, %192
  %205 = phi float [ %203, %201 ], [ 0.000000e+00, %192 ]
  %206 = fcmp reassoc nsz arcp contract oeq float %195, 0xFFF0000000000000, !spirv.Decorations !308
  %207 = fcmp reassoc nsz arcp contract oeq float %199, 0xFFF0000000000000, !spirv.Decorations !308
  %208 = or i1 %206, %207
  br i1 %208, label %212, label %209

209:                                              ; preds = %204
  %210 = fsub reassoc nsz arcp contract float %195, %199, !spirv.Decorations !308
  %211 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %210) #0, !spirv.Decorations !308
  br label %212

212:                                              ; preds = %209, %204
  %213 = phi float [ %211, %209 ], [ 0.000000e+00, %204 ]
  %214 = fmul reassoc nsz arcp contract float %179, %205, !spirv.Decorations !308
  %215 = fmul reassoc nsz arcp contract float %213, %198, !spirv.Decorations !308
  %216 = fadd reassoc nsz arcp contract float %214, %215, !spirv.Decorations !308
  %217 = shl nuw nsw i32 %178, 8, !spirv.Decorations !305
  %218 = or i32 %217, 64
  %219 = add nuw nsw i32 %170, %218, !spirv.Decorations !305
  %220 = insertelement <4 x float> undef, float %205, i32 0
  %221 = shufflevector <4 x float> %220, <4 x float> undef, <4 x i32> zeroinitializer
  %222 = insertelement <4 x float> undef, float %213, i32 0
  %223 = shufflevector <4 x float> %222, <4 x float> undef, <4 x i32> zeroinitializer
  br label %224

224:                                              ; preds = %236, %212
  %225 = phi i32 [ 0, %212 ], [ %248, %236 ]
  %226 = icmp ult i32 %225, 4
  br i1 %226, label %229, label %227

227:                                              ; preds = %224
  %228 = add nuw nsw i32 %178, 1, !spirv.Decorations !305
  br label %177

229:                                              ; preds = %224
  %230 = shl nuw nsw i32 %225, 6, !spirv.Decorations !305
  %231 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %231)
  %232 = add nuw nsw i32 %230, %219, !spirv.Decorations !305
  br label %233

233:                                              ; preds = %249, %229
  %234 = phi i32 [ 0, %229 ], [ %257, %249 ]
  %235 = icmp ult i32 %234, 4
  br i1 %235, label %249, label %236

236:                                              ; preds = %233
  %237 = sext i32 %225 to i64
  %238 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %237
  %239 = bitcast ptr %238 to ptr
  %240 = load <4 x float>, ptr %239, align 16, !noalias !1196
  %241 = fmul reassoc nsz arcp contract <4 x float> %240, %221, !spirv.Decorations !308
  %242 = bitcast ptr %10 to ptr
  %243 = load <4 x float>, ptr %242, align 16, !noalias !1205
  %244 = fmul reassoc nsz arcp contract <4 x float> %223, %243, !spirv.Decorations !308
  %245 = fadd reassoc nsz arcp contract <4 x float> %241, %244, !spirv.Decorations !308
  %246 = bitcast ptr %238 to ptr
  store <4 x float> %245, ptr %246, align 16
  %247 = bitcast ptr %10 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %247)
  %248 = add nuw nsw i32 %225, 1, !spirv.Decorations !305
  br label %224, !llvm.loop !1214

249:                                              ; preds = %233
  %250 = or i32 %232, %234
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, ptr addrspace(3) %5, i64 %251
  %253 = load float, ptr addrspace(3) %252, align 4
  %254 = zext i32 %234 to i64
  %255 = bitcast ptr %10 to ptr
  %256 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %255, i64 0, i32 0, i64 %254
  store float %253, ptr %256, align 4
  %257 = add nuw nsw i32 %234, 1, !spirv.Decorations !305
  br label %233, !llvm.loop !1215

258:                                              ; preds = %269, %182
  %259 = phi i32 [ 0, %182 ], [ %270, %269 ]
  %260 = icmp ult i32 %259, 4
  br i1 %260, label %261, label %.loopexit

261:                                              ; preds = %258
  %262 = shl nuw nsw i32 %259, 6, !spirv.Decorations !305
  %263 = add nuw nsw i32 %262, %191, !spirv.Decorations !305
  %264 = sext i32 %259 to i64
  %265 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %264
  br label %266

266:                                              ; preds = %271, %261
  %267 = phi i32 [ 0, %261 ], [ %282, %271 ]
  %268 = icmp ult i32 %267, 4
  br i1 %268, label %271, label %269

269:                                              ; preds = %266
  %270 = add nuw nsw i32 %259, 1, !spirv.Decorations !305
  br label %258, !llvm.loop !1216

271:                                              ; preds = %266
  %272 = zext i32 %267 to i64
  %273 = bitcast ptr %265 to ptr
  %274 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %273, i64 0, i32 0, i64 %272
  %275 = load float, ptr %274, align 4
  %276 = fmul reassoc nsz arcp contract float %275, %184, !spirv.Decorations !308
  %277 = fptrunc float %276 to half
  %278 = or i32 %263, %267
  %279 = sext i32 %278 to i64
  %280 = bitcast ptr addrspace(1) %190 to ptr addrspace(1)
  %281 = getelementptr inbounds half, ptr addrspace(1) %280, i64 %279
  store half %277, ptr addrspace(1) %281, align 2
  %282 = add nuw nsw i32 %267, 1, !spirv.Decorations !305
  br label %266, !llvm.loop !1217

.loopexit:                                        ; preds = %258
  br label %283

283:                                              ; preds = %.loopexit, %144
  %284 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %284)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_133Xe2KvTorchAbiS2MergeOutHalfKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, ptr addrspace(1) align 4 %4, i32 %5, ptr addrspace(1) align 2 %6) #0 !kernel_arg_addr_space !770 !kernel_arg_access_qual !326 !kernel_arg_type !771 !kernel_arg_type_qual !328 !kernel_arg_base_type !771 !kernel_arg_name !328 !spirv.ParameterDecorations !772 !intel_reqd_sub_group_size !304 {
  %8 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !341
  %9 = alloca %"class.sycl::_V1::vec", align 16, !spirv.Decorations !341
  %10 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #6
  %11 = icmp ult i64 %10, 2147483648
  call void @llvm.assume(i1 %11)
  %12 = trunc i64 %10 to i32
  %13 = call spir_func i32 @_Z25__spirv_BuiltInSubgroupIdv() #6
  %14 = icmp sgt i32 %13, -1
  call void @llvm.assume(i1 %14)
  %15 = call spir_func i32 @_Z40__spirv_BuiltInSubgroupLocalInvocationIdv() #6
  %16 = icmp sgt i32 %15, -1
  call void @llvm.assume(i1 %16)
  %17 = shl nsw i32 %12, 3, !spirv.Decorations !332
  %18 = add nuw nsw i32 %17, %13, !spirv.Decorations !305
  %19 = lshr i32 %18, 6
  %20 = and i32 %18, 63
  %21 = mul nsw i32 %19, %0, !spirv.Decorations !332
  %22 = load i32, ptr addrspace(1) %1, align 4
  %23 = sext i32 %22 to i64
  %24 = sext i32 %0 to i64
  %25 = add nsw i64 %23, 63, !spirv.Decorations !332
  %26 = sdiv i64 %25, 64
  %27 = call spir_func i64 @_Z17__spirv_ocl_s_minll(i64 %24, i64 %26) #0
  %28 = call spir_func i64 @_Z17__spirv_ocl_s_maxll(i64 1, i64 %27) #0
  %29 = trunc i64 %28 to i32
  %30 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.start.p0(i64 64, ptr %30)
  br label %31

31:                                               ; preds = %37, %7
  %32 = phi i32 [ 0, %7 ], [ %40, %37 ]
  %33 = icmp ult i32 %32, 4
  br i1 %33, label %37, label %34

34:                                               ; preds = %31
  %35 = zext i32 %20 to i64
  %36 = shl nsw i32 %15, 2, !spirv.Decorations !332
  br label %43

37:                                               ; preds = %31
  %38 = zext i32 %32 to i64
  %39 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %38
  %40 = add nuw nsw i32 %32, 1, !spirv.Decorations !305
  %41 = bitcast ptr %39 to ptr
  %42 = bitcast ptr addrspace(2) @gVar.226 to ptr addrspace(2)
  call void @llvm.memcpy.p0.p2.i64(ptr align 16 %41, ptr addrspace(2) align 16 %42, i64 16, i1 false)
  br label %31, !llvm.loop !1218

43:                                               ; preds = %89, %34
  %44 = phi i32 [ %90, %89 ], [ 0, %34 ]
  %45 = phi float [ %79, %89 ], [ 0.000000e+00, %34 ]
  %46 = phi float [ %62, %89 ], [ 0xFFF0000000000000, %34 ]
  %47 = icmp slt i32 %44, %29
  br i1 %47, label %53, label %48

48:                                               ; preds = %43
  %49 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %45, float 0x3BC79CA100000000) #0, !spirv.Decorations !308
  %50 = fdiv reassoc nsz arcp contract float 1.000000e+00, %49, !spirv.Decorations !308
  %51 = udiv i32 %20, 6
  %52 = icmp slt i32 %51, %5
  br i1 %52, label %124, label %160

53:                                               ; preds = %43
  %54 = add nsw i32 %21, %44, !spirv.Decorations !332
  %55 = sext i32 %54 to i64
  %56 = shl nsw i64 %55, 6, !spirv.Decorations !332
  %57 = or i64 %56, %35
  %58 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %57
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = call reassoc nsz arcp contract spir_func float @_Z23__spirv_ocl_fmax_commonff(float %46, float %59) #0, !spirv.Decorations !308
  %63 = fcmp reassoc nsz arcp contract oeq float %46, 0xFFF0000000000000, !spirv.Decorations !308
  br i1 %63, label %67, label %64

64:                                               ; preds = %53
  %65 = fsub reassoc nsz arcp contract float %46, %62, !spirv.Decorations !308
  %66 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %65) #0, !spirv.Decorations !308
  br label %67

67:                                               ; preds = %64, %53
  %68 = phi float [ %66, %64 ], [ 0.000000e+00, %53 ]
  %69 = fcmp reassoc nsz arcp contract oeq float %59, 0xFFF0000000000000, !spirv.Decorations !308
  %70 = fcmp reassoc nsz arcp contract oeq float %62, 0xFFF0000000000000, !spirv.Decorations !308
  %71 = or i1 %69, %70
  br i1 %71, label %75, label %72

72:                                               ; preds = %67
  %73 = fsub reassoc nsz arcp contract float %59, %62, !spirv.Decorations !308
  %74 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_expf(float %73) #0, !spirv.Decorations !308
  br label %75

75:                                               ; preds = %72, %67
  %76 = phi float [ %74, %72 ], [ 0.000000e+00, %67 ]
  %77 = fmul reassoc nsz arcp contract float %76, %61, !spirv.Decorations !308
  %78 = fmul reassoc nsz arcp contract float %45, %68, !spirv.Decorations !308
  %79 = fadd reassoc nsz arcp contract float %78, %77, !spirv.Decorations !308
  %80 = shl nsw i64 %57, 8, !spirv.Decorations !332
  %81 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %80
  %82 = insertelement <4 x float> undef, float %68, i32 0
  %83 = shufflevector <4 x float> %82, <4 x float> undef, <4 x i32> zeroinitializer
  %84 = insertelement <4 x float> undef, float %77, i32 0
  %85 = shufflevector <4 x float> %84, <4 x float> undef, <4 x i32> zeroinitializer
  br label %86

86:                                               ; preds = %111, %75
  %87 = phi i32 [ 0, %75 ], [ %123, %111 ]
  %88 = icmp ult i32 %87, 4
  br i1 %88, label %91, label %89

89:                                               ; preds = %86
  %90 = add nuw nsw i32 %44, 1, !spirv.Decorations !305
  br label %43

91:                                               ; preds = %86
  %92 = shl nuw nsw i32 %87, 6, !spirv.Decorations !305
  %93 = add nuw nsw i32 %92, %36, !spirv.Decorations !305
  %94 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.start.p0(i64 16, ptr %94)
  %95 = zext i32 %93 to i64
  %96 = getelementptr inbounds float, ptr addrspace(1) %81, i64 %95
  %97 = addrspacecast ptr addrspace(1) %96 to ptr addrspace(4)
  %98 = bitcast ptr addrspace(4) %97 to ptr addrspace(4)
  %99 = call spir_func ptr addrspace(1) @_Z41__spirv_GenericCastToPtrExplicit_ToGlobalPU3AS4ci(ptr addrspace(4) %98, i32 5) #0
  br label %100

100:                                              ; preds = %103, %91
  %101 = phi i32 [ 0, %91 ], [ %110, %103 ]
  %102 = icmp ult i32 %101, 4
  br i1 %102, label %103, label %111

103:                                              ; preds = %100
  %104 = zext i32 %101 to i64
  %105 = bitcast ptr addrspace(1) %99 to ptr addrspace(1)
  %106 = getelementptr inbounds float, ptr addrspace(1) %105, i64 %104
  %107 = load float, ptr addrspace(1) %106, align 4
  %108 = bitcast ptr %9 to ptr
  %109 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %108, i64 0, i32 0, i64 %104
  store float %107, ptr %109, align 4
  %110 = add nuw nsw i32 %101, 1, !spirv.Decorations !305
  br label %100

111:                                              ; preds = %100
  %112 = sext i32 %87 to i64
  %113 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %112
  %114 = bitcast ptr %113 to ptr
  %115 = load <4 x float>, ptr %114, align 16, !noalias !1219
  %116 = fmul reassoc nsz arcp contract <4 x float> %115, %83, !spirv.Decorations !308
  %117 = bitcast ptr %9 to ptr
  %118 = load <4 x float>, ptr %117, align 16, !noalias !1228
  %119 = fmul reassoc nsz arcp contract <4 x float> %85, %118, !spirv.Decorations !308
  %120 = fadd reassoc nsz arcp contract <4 x float> %116, %119, !spirv.Decorations !308
  %121 = bitcast ptr %113 to ptr
  store <4 x float> %120, ptr %121, align 16
  %122 = bitcast ptr %9 to ptr
  call void @llvm.lifetime.end.p0(i64 16, ptr %122)
  %123 = add nuw nsw i32 %87, 1, !spirv.Decorations !305
  br label %86, !llvm.loop !1237

124:                                              ; preds = %48
  %125 = mul i32 %51, 6
  %126 = sub i32 %20, %125
  %127 = mul nuw nsw i32 %19, 6, !spirv.Decorations !305
  %128 = add nuw nsw i32 %127, %126, !spirv.Decorations !305
  %129 = mul nuw nsw i32 %51, 24, !spirv.Decorations !305
  %130 = add nuw nsw i32 %129, %128, !spirv.Decorations !305
  %131 = zext i32 %130 to i64
  %132 = shl nuw nsw i64 %131, 8, !spirv.Decorations !305
  %133 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %6, i64 %132
  %134 = shl nsw i32 %15, 2, !spirv.Decorations !332
  br label %135

135:                                              ; preds = %146, %124
  %136 = phi i32 [ 0, %124 ], [ %147, %146 ]
  %137 = icmp ult i32 %136, 4
  br i1 %137, label %138, label %.loopexit

138:                                              ; preds = %135
  %139 = shl nuw nsw i32 %136, 6, !spirv.Decorations !305
  %140 = add nuw nsw i32 %139, %134, !spirv.Decorations !305
  %141 = sext i32 %136 to i64
  %142 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %8, i64 0, i64 %141
  br label %143

143:                                              ; preds = %148, %138
  %144 = phi i32 [ 0, %138 ], [ %159, %148 ]
  %145 = icmp ult i32 %144, 4
  br i1 %145, label %148, label %146

146:                                              ; preds = %143
  %147 = add nuw nsw i32 %136, 1, !spirv.Decorations !305
  br label %135, !llvm.loop !1238

148:                                              ; preds = %143
  %149 = zext i32 %144 to i64
  %150 = bitcast ptr %142 to ptr
  %151 = getelementptr inbounds %"class.sycl::_V1::detail::vec_base", ptr %150, i64 0, i32 0, i64 %149
  %152 = load float, ptr %151, align 4
  %153 = fmul reassoc nsz arcp contract float %152, %50, !spirv.Decorations !308
  %154 = fptrunc float %153 to half
  %155 = or i32 %140, %144
  %156 = sext i32 %155 to i64
  %157 = bitcast ptr addrspace(1) %133 to ptr addrspace(1)
  %158 = getelementptr inbounds half, ptr addrspace(1) %157, i64 %156
  store half %154, ptr addrspace(1) %158, align 2
  %159 = add nuw nsw i32 %144, 1, !spirv.Decorations !305
  br label %143, !llvm.loop !1239

.loopexit:                                        ; preds = %135
  br label %160

160:                                              ; preds = %.loopexit, %48
  %161 = bitcast ptr %8 to ptr
  call void @llvm.lifetime.end.p0(i64 64, ptr %161)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 2 %3) #0 !kernel_arg_addr_space !1240 !kernel_arg_access_qual !314 !kernel_arg_type !1241 !kernel_arg_type_qual !316 !kernel_arg_base_type !1241 !kernel_arg_name !316 !spirv.ParameterDecorations !1242 !intel_reqd_sub_group_size !304 {
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
  %16 = mul nsw i32 %0, 6, !spirv.Decorations !332
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
  br label %34, !llvm.loop !1243

41:                                               ; preds = %4
  %42 = trunc i64 %8 to i32
  %43 = udiv i32 %7, 12
  %44 = mul nsw i32 %43, -6, !spirv.Decorations !332
  %45 = add nsw i32 %44, %12, !spirv.Decorations !332
  %46 = mul nuw nsw i32 %42, 6, !spirv.Decorations !305
  %47 = add nsw i32 %46, %45, !spirv.Decorations !332
  %48 = mul nuw nsw i32 %43, 12, !spirv.Decorations !305
  %49 = zext i32 %48 to i64
  %50 = sext i32 %47 to i64
  %51 = add nsw i64 %49, %50, !spirv.Decorations !332
  %52 = shl nsw i64 %51, 8, !spirv.Decorations !332
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
  %63 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %59, i32 %62) #2
  %64 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %59, float %63) #0, !spirv.Decorations !308
  %65 = fcmp reassoc nsz arcp contract oeq float %64, 0.000000e+00, !spirv.Decorations !308
  br i1 %65, label %77, label %75

66:                                               ; preds = %57
  %67 = zext i32 %58 to i64
  %68 = bitcast ptr addrspace(1) %56 to ptr addrspace(1)
  %69 = getelementptr inbounds half, ptr addrspace(1) %68, i64 %67
  %70 = load half, ptr addrspace(1) %69, align 2
  %71 = fpext half %70 to float
  %72 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %71) #0, !spirv.Decorations !308
  %73 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %59, float %72) #0, !spirv.Decorations !308
  %74 = add nuw nsw i32 %58, 1, !spirv.Decorations !305
  br label %57, !llvm.loop !1244

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
  %105 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %104) #0, !spirv.Decorations !308
  %106 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %105, float -1.270000e+02, float 1.270000e+02) #0, !spirv.Decorations !308
  %107 = fptosi float %106 to i8
  %108 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 %99
  store i8 %107, ptr addrspace(1) %108, align 1
  %109 = add nuw nsw i32 %96, 1, !spirv.Decorations !305
  br label %95, !llvm.loop !1245

.loopexit:                                        ; preds = %95
  br label %110

.loopexit1:                                       ; preds = %34
  br label %110

110:                                              ; preds = %.loopexit1, %.loopexit
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 2 %3) #0 !kernel_arg_addr_space !1240 !kernel_arg_access_qual !314 !kernel_arg_type !1241 !kernel_arg_type_qual !316 !kernel_arg_base_type !1241 !kernel_arg_name !316 !spirv.ParameterDecorations !1242 !intel_reqd_sub_group_size !304 {
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
  %16 = mul nsw i32 %0, 6, !spirv.Decorations !332
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
  br label %34, !llvm.loop !1246

41:                                               ; preds = %4
  %42 = trunc i64 %8 to i32
  %43 = udiv i32 %7, 12
  %44 = mul nsw i32 %43, -6, !spirv.Decorations !332
  %45 = add nsw i32 %44, %12, !spirv.Decorations !332
  %46 = mul nuw nsw i32 %42, 6, !spirv.Decorations !305
  %47 = add nsw i32 %46, %45, !spirv.Decorations !332
  %48 = zext i32 %43 to i64
  %49 = mul nuw nsw i64 %48, 24, !spirv.Decorations !305
  %50 = sext i32 %47 to i64
  %51 = add nsw i64 %49, %50, !spirv.Decorations !332
  %52 = shl nsw i64 %51, 8, !spirv.Decorations !332
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
  %63 = call spir_func float @_Z28__spirv_SubgroupShuffleINTELfj(float %59, i32 %62) #2
  %64 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %59, float %63) #0, !spirv.Decorations !308
  %65 = fcmp reassoc nsz arcp contract oeq float %64, 0.000000e+00, !spirv.Decorations !308
  br i1 %65, label %77, label %75

66:                                               ; preds = %57
  %67 = zext i32 %58 to i64
  %68 = bitcast ptr addrspace(1) %56 to ptr addrspace(1)
  %69 = getelementptr inbounds half, ptr addrspace(1) %68, i64 %67
  %70 = load half, ptr addrspace(1) %69, align 2
  %71 = fpext half %70 to float
  %72 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fabsf(float %71) #0, !spirv.Decorations !308
  %73 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_fmaxff(float %59, float %72) #0, !spirv.Decorations !308
  %74 = add nuw nsw i32 %58, 1, !spirv.Decorations !305
  br label %57, !llvm.loop !1247

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
  %105 = call reassoc nsz arcp contract spir_func float @_Z16__spirv_ocl_rintf(float %104) #0, !spirv.Decorations !308
  %106 = call reassoc nsz arcp contract spir_func float @_Z18__spirv_ocl_fclampfff(float %105, float -1.270000e+02, float 1.270000e+02) #0, !spirv.Decorations !308
  %107 = fptosi float %106 to i8
  %108 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 %99
  store i8 %107, ptr addrspace(1) %108, align 1
  %109 = add nuw nsw i32 %96, 1, !spirv.Decorations !305
  br label %95, !llvm.loop !1248

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

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind memory(none) }
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
!295 = !{!"class.sycl::_V1::detail::half_impl::half*", !"float*", !"char*"}
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
!313 = !{i32 1, i32 1, i32 1, i32 1}
!314 = !{!"none", !"none", !"none", !"none"}
!315 = !{!"class.sycl::_V1::detail::half_impl::half*", !"float*", !"float*", !"char*"}
!316 = !{!"", !"", !"", !""}
!317 = !{!298, !300, !300, !302}
!318 = distinct !{!318, !311}
!319 = distinct !{!319, !311}
!320 = !{!"class.sycl::_V1::detail::half_impl::half*", !"char*", !"char*"}
!321 = distinct !{!321, !311}
!322 = distinct !{!322, !311}
!323 = distinct !{!323, !311}
!324 = distinct !{!324, !311}
!325 = !{i32 1, i32 0, i32 1, i32 1, i32 0, i32 1, i32 0}
!326 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!327 = !{!"long*", !"long", !"class.sycl::_V1::detail::half_impl::half*", !"float*", !"long", !"char*", !"long"}
!328 = !{!"", !"", !"", !"", !"", !"", !""}
!329 = !{!330, !8, !298, !300, !8, !302, !8}
!330 = !{!331}
!331 = !{i32 44, i32 8}
!332 = !{!306}
!333 = !{i32 1, i32 0, i32 1, i32 0, i32 1, i32 1, i32 1, i32 0}
!334 = !{!"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!335 = !{!"long*", !"long", !"class.sycl::_V1::detail::half_impl::half*", !"long", !"float*", !"float*", !"char*", !"long"}
!336 = !{!"", !"", !"", !"", !"", !"", !"", !""}
!337 = !{!330, !8, !298, !8, !300, !300, !302, !8}
!338 = !{i32 0, i32 1, i32 1, i32 1, i32 1, i32 3, i32 1}
!339 = !{!"int", !"int*", !"float*", !"float*", !"class.sycl::_V1::detail::half_impl::half*", !"float*", !"class.sycl::_V1::detail::half_impl::half*"}
!340 = !{!8, !300, !300, !300, !298, !300, !298}
!341 = !{!2}
!342 = distinct !{!342, !311}
!343 = distinct !{!343, !311}
!344 = !{!345}
!345 = distinct !{!345, !346}
!346 = distinct !{!346}
!347 = !{!348}
!348 = !{i32 39, i32 0}
!349 = distinct !{!349, !311}
!350 = distinct !{!350, !311}
!351 = !{!352, !354, !356, !358}
!352 = distinct !{!352, !353}
!353 = distinct !{!353}
!354 = distinct !{!354, !355}
!355 = distinct !{!355}
!356 = distinct !{!356, !357}
!357 = distinct !{!357}
!358 = distinct !{!358, !359}
!359 = distinct !{!359}
!360 = !{!361, !363, !365, !367}
!361 = distinct !{!361, !362}
!362 = distinct !{!362}
!363 = distinct !{!363, !364}
!364 = distinct !{!364}
!365 = distinct !{!365, !366}
!366 = distinct !{!366}
!367 = distinct !{!367, !368}
!368 = distinct !{!368}
!369 = distinct !{!369, !311}
!370 = distinct !{!370, !311}
!371 = distinct !{!371, !311}
!372 = distinct !{!372, !311}
!373 = !{!307}
!374 = !{!375, !377, !379, !381}
!375 = distinct !{!375, !376}
!376 = distinct !{!376}
!377 = distinct !{!377, !378}
!378 = distinct !{!378}
!379 = distinct !{!379, !380}
!380 = distinct !{!380}
!381 = distinct !{!381, !382}
!382 = distinct !{!382}
!383 = !{!384, !386, !388, !390}
!384 = distinct !{!384, !385}
!385 = distinct !{!385}
!386 = distinct !{!386, !387}
!387 = distinct !{!387}
!388 = distinct !{!388, !389}
!389 = distinct !{!389}
!390 = distinct !{!390, !391}
!391 = distinct !{!391}
!392 = distinct !{!392, !311}
!393 = distinct !{!393, !311}
!394 = distinct !{!394, !311}
!395 = distinct !{!395, !311}
!396 = distinct !{!396, !311}
!397 = distinct !{!397, !311}
!398 = !{!399}
!399 = distinct !{!399, !400}
!400 = distinct !{!400}
!401 = distinct !{!401, !311}
!402 = distinct !{!402, !311}
!403 = !{!404, !406, !408, !410}
!404 = distinct !{!404, !405}
!405 = distinct !{!405}
!406 = distinct !{!406, !407}
!407 = distinct !{!407}
!408 = distinct !{!408, !409}
!409 = distinct !{!409}
!410 = distinct !{!410, !411}
!411 = distinct !{!411}
!412 = !{!413, !415, !417, !419}
!413 = distinct !{!413, !414}
!414 = distinct !{!414}
!415 = distinct !{!415, !416}
!416 = distinct !{!416}
!417 = distinct !{!417, !418}
!418 = distinct !{!418}
!419 = distinct !{!419, !420}
!420 = distinct !{!420}
!421 = distinct !{!421, !311}
!422 = distinct !{!422, !311}
!423 = distinct !{!423, !311}
!424 = distinct !{!424, !311}
!425 = !{!426, !428, !430, !432}
!426 = distinct !{!426, !427}
!427 = distinct !{!427}
!428 = distinct !{!428, !429}
!429 = distinct !{!429}
!430 = distinct !{!430, !431}
!431 = distinct !{!431}
!432 = distinct !{!432, !433}
!433 = distinct !{!433}
!434 = !{!435, !437, !439, !441}
!435 = distinct !{!435, !436}
!436 = distinct !{!436}
!437 = distinct !{!437, !438}
!438 = distinct !{!438}
!439 = distinct !{!439, !440}
!440 = distinct !{!440}
!441 = distinct !{!441, !442}
!442 = distinct !{!442}
!443 = distinct !{!443, !311}
!444 = distinct !{!444, !311}
!445 = distinct !{!445, !311}
!446 = distinct !{!446, !311}
!447 = distinct !{!447, !311}
!448 = distinct !{!448, !311}
!449 = !{!450}
!450 = distinct !{!450, !451}
!451 = distinct !{!451}
!452 = distinct !{!452, !311}
!453 = distinct !{!453, !311}
!454 = !{!455, !457, !459, !461}
!455 = distinct !{!455, !456}
!456 = distinct !{!456}
!457 = distinct !{!457, !458}
!458 = distinct !{!458}
!459 = distinct !{!459, !460}
!460 = distinct !{!460}
!461 = distinct !{!461, !462}
!462 = distinct !{!462}
!463 = !{!464, !466, !468, !470}
!464 = distinct !{!464, !465}
!465 = distinct !{!465}
!466 = distinct !{!466, !467}
!467 = distinct !{!467}
!468 = distinct !{!468, !469}
!469 = distinct !{!469}
!470 = distinct !{!470, !471}
!471 = distinct !{!471}
!472 = distinct !{!472, !311}
!473 = distinct !{!473, !311}
!474 = distinct !{!474, !311}
!475 = distinct !{!475, !311}
!476 = !{!477, !479, !481, !483}
!477 = distinct !{!477, !478}
!478 = distinct !{!478}
!479 = distinct !{!479, !480}
!480 = distinct !{!480}
!481 = distinct !{!481, !482}
!482 = distinct !{!482}
!483 = distinct !{!483, !484}
!484 = distinct !{!484}
!485 = !{!486, !488, !490, !492}
!486 = distinct !{!486, !487}
!487 = distinct !{!487}
!488 = distinct !{!488, !489}
!489 = distinct !{!489}
!490 = distinct !{!490, !491}
!491 = distinct !{!491}
!492 = distinct !{!492, !493}
!493 = distinct !{!493}
!494 = distinct !{!494, !311}
!495 = distinct !{!495, !311}
!496 = distinct !{!496, !311}
!497 = distinct !{!497, !311}
!498 = !{!"int", !"int*", !"float*", !"float*", !"float*", !"float*", !"class.sycl::_V1::detail::half_impl::half*"}
!499 = !{!8, !300, !300, !300, !300, !300, !298}
!500 = distinct !{!500, !311}
!501 = !{!502, !504, !506, !508}
!502 = distinct !{!502, !503}
!503 = distinct !{!503}
!504 = distinct !{!504, !505}
!505 = distinct !{!505}
!506 = distinct !{!506, !507}
!507 = distinct !{!507}
!508 = distinct !{!508, !509}
!509 = distinct !{!509}
!510 = !{!511, !513, !515, !517}
!511 = distinct !{!511, !512}
!512 = distinct !{!512}
!513 = distinct !{!513, !514}
!514 = distinct !{!514}
!515 = distinct !{!515, !516}
!516 = distinct !{!516}
!517 = distinct !{!517, !518}
!518 = distinct !{!518}
!519 = distinct !{!519, !311}
!520 = distinct !{!520, !311}
!521 = distinct !{!521, !311}
!522 = distinct !{!522, !311}
!523 = !{!524, !526, !528, !530}
!524 = distinct !{!524, !525}
!525 = distinct !{!525}
!526 = distinct !{!526, !527}
!527 = distinct !{!527}
!528 = distinct !{!528, !529}
!529 = distinct !{!529}
!530 = distinct !{!530, !531}
!531 = distinct !{!531}
!532 = !{!533, !535, !537, !539}
!533 = distinct !{!533, !534}
!534 = distinct !{!534}
!535 = distinct !{!535, !536}
!536 = distinct !{!536}
!537 = distinct !{!537, !538}
!538 = distinct !{!538}
!539 = distinct !{!539, !540}
!540 = distinct !{!540}
!541 = distinct !{!541, !311}
!542 = distinct !{!542, !311}
!543 = distinct !{!543, !311}
!544 = distinct !{!544, !311}
!545 = distinct !{!545, !311}
!546 = !{!547, !549, !551, !553}
!547 = distinct !{!547, !548}
!548 = distinct !{!548}
!549 = distinct !{!549, !550}
!550 = distinct !{!550}
!551 = distinct !{!551, !552}
!552 = distinct !{!552}
!553 = distinct !{!553, !554}
!554 = distinct !{!554}
!555 = !{!556, !558, !560, !562}
!556 = distinct !{!556, !557}
!557 = distinct !{!557}
!558 = distinct !{!558, !559}
!559 = distinct !{!559}
!560 = distinct !{!560, !561}
!561 = distinct !{!561}
!562 = distinct !{!562, !563}
!563 = distinct !{!563}
!564 = distinct !{!564, !311}
!565 = distinct !{!565, !311}
!566 = distinct !{!566, !311}
!567 = distinct !{!567, !311}
!568 = !{!569, !571, !573, !575}
!569 = distinct !{!569, !570}
!570 = distinct !{!570}
!571 = distinct !{!571, !572}
!572 = distinct !{!572}
!573 = distinct !{!573, !574}
!574 = distinct !{!574}
!575 = distinct !{!575, !576}
!576 = distinct !{!576}
!577 = !{!578, !580, !582, !584}
!578 = distinct !{!578, !579}
!579 = distinct !{!579}
!580 = distinct !{!580, !581}
!581 = distinct !{!581}
!582 = distinct !{!582, !583}
!583 = distinct !{!583}
!584 = distinct !{!584, !585}
!585 = distinct !{!585}
!586 = distinct !{!586, !311}
!587 = distinct !{!587, !311}
!588 = distinct !{!588, !311}
!589 = distinct !{!589, !311}
!590 = distinct !{!590, !311}
!591 = !{!592, !594, !596, !598}
!592 = distinct !{!592, !593}
!593 = distinct !{!593}
!594 = distinct !{!594, !595}
!595 = distinct !{!595}
!596 = distinct !{!596, !597}
!597 = distinct !{!597}
!598 = distinct !{!598, !599}
!599 = distinct !{!599}
!600 = !{!601, !603, !605, !607}
!601 = distinct !{!601, !602}
!602 = distinct !{!602}
!603 = distinct !{!603, !604}
!604 = distinct !{!604}
!605 = distinct !{!605, !606}
!606 = distinct !{!606}
!607 = distinct !{!607, !608}
!608 = distinct !{!608}
!609 = distinct !{!609, !311}
!610 = distinct !{!610, !311}
!611 = distinct !{!611, !311}
!612 = distinct !{!612, !311}
!613 = !{!614, !616, !618, !620}
!614 = distinct !{!614, !615}
!615 = distinct !{!615}
!616 = distinct !{!616, !617}
!617 = distinct !{!617}
!618 = distinct !{!618, !619}
!619 = distinct !{!619}
!620 = distinct !{!620, !621}
!621 = distinct !{!621}
!622 = !{!623, !625, !627, !629}
!623 = distinct !{!623, !624}
!624 = distinct !{!624}
!625 = distinct !{!625, !626}
!626 = distinct !{!626}
!627 = distinct !{!627, !628}
!628 = distinct !{!628}
!629 = distinct !{!629, !630}
!630 = distinct !{!630}
!631 = distinct !{!631, !311}
!632 = distinct !{!632, !311}
!633 = distinct !{!633, !311}
!634 = distinct !{!634, !311}
!635 = distinct !{!635, !311}
!636 = !{!637, !639, !641, !643}
!637 = distinct !{!637, !638}
!638 = distinct !{!638}
!639 = distinct !{!639, !640}
!640 = distinct !{!640}
!641 = distinct !{!641, !642}
!642 = distinct !{!642}
!643 = distinct !{!643, !644}
!644 = distinct !{!644}
!645 = !{!646, !648, !650, !652}
!646 = distinct !{!646, !647}
!647 = distinct !{!647}
!648 = distinct !{!648, !649}
!649 = distinct !{!649}
!650 = distinct !{!650, !651}
!651 = distinct !{!651}
!652 = distinct !{!652, !653}
!653 = distinct !{!653}
!654 = distinct !{!654, !311}
!655 = distinct !{!655, !311}
!656 = distinct !{!656, !311}
!657 = distinct !{!657, !311}
!658 = !{!659, !661, !663, !665}
!659 = distinct !{!659, !660}
!660 = distinct !{!660}
!661 = distinct !{!661, !662}
!662 = distinct !{!662}
!663 = distinct !{!663, !664}
!664 = distinct !{!664}
!665 = distinct !{!665, !666}
!666 = distinct !{!666}
!667 = !{!668, !670, !672, !674}
!668 = distinct !{!668, !669}
!669 = distinct !{!669}
!670 = distinct !{!670, !671}
!671 = distinct !{!671}
!672 = distinct !{!672, !673}
!673 = distinct !{!673}
!674 = distinct !{!674, !675}
!675 = distinct !{!675}
!676 = distinct !{!676, !311}
!677 = distinct !{!677, !311}
!678 = distinct !{!678, !311}
!679 = distinct !{!679, !311}
!680 = distinct !{!680, !311}
!681 = !{!682, !684, !686, !688}
!682 = distinct !{!682, !683}
!683 = distinct !{!683}
!684 = distinct !{!684, !685}
!685 = distinct !{!685}
!686 = distinct !{!686, !687}
!687 = distinct !{!687}
!688 = distinct !{!688, !689}
!689 = distinct !{!689}
!690 = !{!691, !693, !695, !697}
!691 = distinct !{!691, !692}
!692 = distinct !{!692}
!693 = distinct !{!693, !694}
!694 = distinct !{!694}
!695 = distinct !{!695, !696}
!696 = distinct !{!696}
!697 = distinct !{!697, !698}
!698 = distinct !{!698}
!699 = distinct !{!699, !311}
!700 = distinct !{!700, !311}
!701 = distinct !{!701, !311}
!702 = distinct !{!702, !311}
!703 = !{!704, !706, !708, !710}
!704 = distinct !{!704, !705}
!705 = distinct !{!705}
!706 = distinct !{!706, !707}
!707 = distinct !{!707}
!708 = distinct !{!708, !709}
!709 = distinct !{!709}
!710 = distinct !{!710, !711}
!711 = distinct !{!711}
!712 = !{!713, !715, !717, !719}
!713 = distinct !{!713, !714}
!714 = distinct !{!714}
!715 = distinct !{!715, !716}
!716 = distinct !{!716}
!717 = distinct !{!717, !718}
!718 = distinct !{!718}
!719 = distinct !{!719, !720}
!720 = distinct !{!720}
!721 = distinct !{!721, !311}
!722 = distinct !{!722, !311}
!723 = distinct !{!723, !311}
!724 = distinct !{!724, !311}
!725 = distinct !{!725, !311}
!726 = !{!727, !729, !731, !733}
!727 = distinct !{!727, !728}
!728 = distinct !{!728}
!729 = distinct !{!729, !730}
!730 = distinct !{!730}
!731 = distinct !{!731, !732}
!732 = distinct !{!732}
!733 = distinct !{!733, !734}
!734 = distinct !{!734}
!735 = !{!736, !738, !740, !742}
!736 = distinct !{!736, !737}
!737 = distinct !{!737}
!738 = distinct !{!738, !739}
!739 = distinct !{!739}
!740 = distinct !{!740, !741}
!741 = distinct !{!741}
!742 = distinct !{!742, !743}
!743 = distinct !{!743}
!744 = distinct !{!744, !311}
!745 = distinct !{!745, !311}
!746 = distinct !{!746, !311}
!747 = distinct !{!747, !311}
!748 = !{!749, !751, !753, !755}
!749 = distinct !{!749, !750}
!750 = distinct !{!750}
!751 = distinct !{!751, !752}
!752 = distinct !{!752}
!753 = distinct !{!753, !754}
!754 = distinct !{!754}
!755 = distinct !{!755, !756}
!756 = distinct !{!756}
!757 = !{!758, !760, !762, !764}
!758 = distinct !{!758, !759}
!759 = distinct !{!759}
!760 = distinct !{!760, !761}
!761 = distinct !{!761}
!762 = distinct !{!762, !763}
!763 = distinct !{!763}
!764 = distinct !{!764, !765}
!765 = distinct !{!765}
!766 = distinct !{!766, !311}
!767 = distinct !{!767, !311}
!768 = distinct !{!768, !311}
!769 = distinct !{!769, !311}
!770 = !{i32 0, i32 1, i32 1, i32 1, i32 1, i32 0, i32 1}
!771 = !{!"int", !"int*", !"float*", !"float*", !"float*", !"int", !"class.sycl::_V1::detail::half_impl::half*"}
!772 = !{!8, !300, !300, !300, !300, !8, !298}
!773 = distinct !{!773, !311}
!774 = !{!775, !777, !779, !781}
!775 = distinct !{!775, !776}
!776 = distinct !{!776}
!777 = distinct !{!777, !778}
!778 = distinct !{!778}
!779 = distinct !{!779, !780}
!780 = distinct !{!780}
!781 = distinct !{!781, !782}
!782 = distinct !{!782}
!783 = !{!784, !786, !788, !790}
!784 = distinct !{!784, !785}
!785 = distinct !{!785}
!786 = distinct !{!786, !787}
!787 = distinct !{!787}
!788 = distinct !{!788, !789}
!789 = distinct !{!789}
!790 = distinct !{!790, !791}
!791 = distinct !{!791}
!792 = distinct !{!792, !311}
!793 = distinct !{!793, !311}
!794 = distinct !{!794, !311}
!795 = distinct !{!795, !311}
!796 = distinct !{!796, !311}
!797 = !{!798}
!798 = distinct !{!798, !799}
!799 = distinct !{!799}
!800 = distinct !{!800, !311}
!801 = distinct !{!801, !311}
!802 = !{!803, !805, !807, !809}
!803 = distinct !{!803, !804}
!804 = distinct !{!804}
!805 = distinct !{!805, !806}
!806 = distinct !{!806}
!807 = distinct !{!807, !808}
!808 = distinct !{!808}
!809 = distinct !{!809, !810}
!810 = distinct !{!810}
!811 = !{!812, !814, !816, !818}
!812 = distinct !{!812, !813}
!813 = distinct !{!813}
!814 = distinct !{!814, !815}
!815 = distinct !{!815}
!816 = distinct !{!816, !817}
!817 = distinct !{!817}
!818 = distinct !{!818, !819}
!819 = distinct !{!819}
!820 = distinct !{!820, !311}
!821 = distinct !{!821, !311}
!822 = distinct !{!822, !311}
!823 = distinct !{!823, !311}
!824 = !{!825, !827, !829, !831}
!825 = distinct !{!825, !826}
!826 = distinct !{!826}
!827 = distinct !{!827, !828}
!828 = distinct !{!828}
!829 = distinct !{!829, !830}
!830 = distinct !{!830}
!831 = distinct !{!831, !832}
!832 = distinct !{!832}
!833 = !{!834, !836, !838, !840}
!834 = distinct !{!834, !835}
!835 = distinct !{!835}
!836 = distinct !{!836, !837}
!837 = distinct !{!837}
!838 = distinct !{!838, !839}
!839 = distinct !{!839}
!840 = distinct !{!840, !841}
!841 = distinct !{!841}
!842 = distinct !{!842, !311}
!843 = distinct !{!843, !311}
!844 = distinct !{!844, !311}
!845 = distinct !{!845, !311}
!846 = distinct !{!846, !311}
!847 = distinct !{!847, !311}
!848 = !{!849}
!849 = distinct !{!849, !850}
!850 = distinct !{!850}
!851 = distinct !{!851, !311}
!852 = distinct !{!852, !311}
!853 = !{!854, !856, !858, !860}
!854 = distinct !{!854, !855}
!855 = distinct !{!855}
!856 = distinct !{!856, !857}
!857 = distinct !{!857}
!858 = distinct !{!858, !859}
!859 = distinct !{!859}
!860 = distinct !{!860, !861}
!861 = distinct !{!861}
!862 = !{!863, !865, !867, !869}
!863 = distinct !{!863, !864}
!864 = distinct !{!864}
!865 = distinct !{!865, !866}
!866 = distinct !{!866}
!867 = distinct !{!867, !868}
!868 = distinct !{!868}
!869 = distinct !{!869, !870}
!870 = distinct !{!870}
!871 = distinct !{!871, !311}
!872 = distinct !{!872, !311}
!873 = distinct !{!873, !311}
!874 = distinct !{!874, !311}
!875 = !{!876, !878, !880, !882}
!876 = distinct !{!876, !877}
!877 = distinct !{!877}
!878 = distinct !{!878, !879}
!879 = distinct !{!879}
!880 = distinct !{!880, !881}
!881 = distinct !{!881}
!882 = distinct !{!882, !883}
!883 = distinct !{!883}
!884 = !{!885, !887, !889, !891}
!885 = distinct !{!885, !886}
!886 = distinct !{!886}
!887 = distinct !{!887, !888}
!888 = distinct !{!888}
!889 = distinct !{!889, !890}
!890 = distinct !{!890}
!891 = distinct !{!891, !892}
!892 = distinct !{!892}
!893 = distinct !{!893, !311}
!894 = distinct !{!894, !311}
!895 = distinct !{!895, !311}
!896 = distinct !{!896, !311}
!897 = distinct !{!897, !311}
!898 = distinct !{!898, !311}
!899 = !{!900}
!900 = distinct !{!900, !901}
!901 = distinct !{!901}
!902 = distinct !{!902, !311}
!903 = distinct !{!903, !311}
!904 = !{!905, !907, !909, !911}
!905 = distinct !{!905, !906}
!906 = distinct !{!906}
!907 = distinct !{!907, !908}
!908 = distinct !{!908}
!909 = distinct !{!909, !910}
!910 = distinct !{!910}
!911 = distinct !{!911, !912}
!912 = distinct !{!912}
!913 = !{!914, !916, !918, !920}
!914 = distinct !{!914, !915}
!915 = distinct !{!915}
!916 = distinct !{!916, !917}
!917 = distinct !{!917}
!918 = distinct !{!918, !919}
!919 = distinct !{!919}
!920 = distinct !{!920, !921}
!921 = distinct !{!921}
!922 = distinct !{!922, !311}
!923 = distinct !{!923, !311}
!924 = distinct !{!924, !311}
!925 = distinct !{!925, !311}
!926 = !{!927, !929, !931, !933}
!927 = distinct !{!927, !928}
!928 = distinct !{!928}
!929 = distinct !{!929, !930}
!930 = distinct !{!930}
!931 = distinct !{!931, !932}
!932 = distinct !{!932}
!933 = distinct !{!933, !934}
!934 = distinct !{!934}
!935 = !{!936, !938, !940, !942}
!936 = distinct !{!936, !937}
!937 = distinct !{!937}
!938 = distinct !{!938, !939}
!939 = distinct !{!939}
!940 = distinct !{!940, !941}
!941 = distinct !{!941}
!942 = distinct !{!942, !943}
!943 = distinct !{!943}
!944 = distinct !{!944, !311}
!945 = distinct !{!945, !311}
!946 = distinct !{!946, !311}
!947 = distinct !{!947, !311}
!948 = distinct !{!948, !311}
!949 = !{!950, !952, !954, !956}
!950 = distinct !{!950, !951}
!951 = distinct !{!951}
!952 = distinct !{!952, !953}
!953 = distinct !{!953}
!954 = distinct !{!954, !955}
!955 = distinct !{!955}
!956 = distinct !{!956, !957}
!957 = distinct !{!957}
!958 = !{!959, !961, !963, !965}
!959 = distinct !{!959, !960}
!960 = distinct !{!960}
!961 = distinct !{!961, !962}
!962 = distinct !{!962}
!963 = distinct !{!963, !964}
!964 = distinct !{!964}
!965 = distinct !{!965, !966}
!966 = distinct !{!966}
!967 = distinct !{!967, !311}
!968 = distinct !{!968, !311}
!969 = distinct !{!969, !311}
!970 = distinct !{!970, !311}
!971 = !{!972, !974, !976, !978}
!972 = distinct !{!972, !973}
!973 = distinct !{!973}
!974 = distinct !{!974, !975}
!975 = distinct !{!975}
!976 = distinct !{!976, !977}
!977 = distinct !{!977}
!978 = distinct !{!978, !979}
!979 = distinct !{!979}
!980 = !{!981, !983, !985, !987}
!981 = distinct !{!981, !982}
!982 = distinct !{!982}
!983 = distinct !{!983, !984}
!984 = distinct !{!984}
!985 = distinct !{!985, !986}
!986 = distinct !{!986}
!987 = distinct !{!987, !988}
!988 = distinct !{!988}
!989 = distinct !{!989, !311}
!990 = distinct !{!990, !311}
!991 = distinct !{!991, !311}
!992 = distinct !{!992, !311}
!993 = distinct !{!993, !311}
!994 = !{!995, !997, !999, !1001}
!995 = distinct !{!995, !996}
!996 = distinct !{!996}
!997 = distinct !{!997, !998}
!998 = distinct !{!998}
!999 = distinct !{!999, !1000}
!1000 = distinct !{!1000}
!1001 = distinct !{!1001, !1002}
!1002 = distinct !{!1002}
!1003 = !{!1004, !1006, !1008, !1010}
!1004 = distinct !{!1004, !1005}
!1005 = distinct !{!1005}
!1006 = distinct !{!1006, !1007}
!1007 = distinct !{!1007}
!1008 = distinct !{!1008, !1009}
!1009 = distinct !{!1009}
!1010 = distinct !{!1010, !1011}
!1011 = distinct !{!1011}
!1012 = distinct !{!1012, !311}
!1013 = distinct !{!1013, !311}
!1014 = distinct !{!1014, !311}
!1015 = distinct !{!1015, !311}
!1016 = !{!1017, !1019, !1021, !1023}
!1017 = distinct !{!1017, !1018}
!1018 = distinct !{!1018}
!1019 = distinct !{!1019, !1020}
!1020 = distinct !{!1020}
!1021 = distinct !{!1021, !1022}
!1022 = distinct !{!1022}
!1023 = distinct !{!1023, !1024}
!1024 = distinct !{!1024}
!1025 = !{!1026, !1028, !1030, !1032}
!1026 = distinct !{!1026, !1027}
!1027 = distinct !{!1027}
!1028 = distinct !{!1028, !1029}
!1029 = distinct !{!1029}
!1030 = distinct !{!1030, !1031}
!1031 = distinct !{!1031}
!1032 = distinct !{!1032, !1033}
!1033 = distinct !{!1033}
!1034 = distinct !{!1034, !311}
!1035 = distinct !{!1035, !311}
!1036 = distinct !{!1036, !311}
!1037 = distinct !{!1037, !311}
!1038 = distinct !{!1038, !311}
!1039 = !{!1040, !1042, !1044, !1046}
!1040 = distinct !{!1040, !1041}
!1041 = distinct !{!1041}
!1042 = distinct !{!1042, !1043}
!1043 = distinct !{!1043}
!1044 = distinct !{!1044, !1045}
!1045 = distinct !{!1045}
!1046 = distinct !{!1046, !1047}
!1047 = distinct !{!1047}
!1048 = !{!1049, !1051, !1053, !1055}
!1049 = distinct !{!1049, !1050}
!1050 = distinct !{!1050}
!1051 = distinct !{!1051, !1052}
!1052 = distinct !{!1052}
!1053 = distinct !{!1053, !1054}
!1054 = distinct !{!1054}
!1055 = distinct !{!1055, !1056}
!1056 = distinct !{!1056}
!1057 = distinct !{!1057, !311}
!1058 = distinct !{!1058, !311}
!1059 = distinct !{!1059, !311}
!1060 = distinct !{!1060, !311}
!1061 = !{!1062, !1064, !1066, !1068}
!1062 = distinct !{!1062, !1063}
!1063 = distinct !{!1063}
!1064 = distinct !{!1064, !1065}
!1065 = distinct !{!1065}
!1066 = distinct !{!1066, !1067}
!1067 = distinct !{!1067}
!1068 = distinct !{!1068, !1069}
!1069 = distinct !{!1069}
!1070 = !{!1071, !1073, !1075, !1077}
!1071 = distinct !{!1071, !1072}
!1072 = distinct !{!1072}
!1073 = distinct !{!1073, !1074}
!1074 = distinct !{!1074}
!1075 = distinct !{!1075, !1076}
!1076 = distinct !{!1076}
!1077 = distinct !{!1077, !1078}
!1078 = distinct !{!1078}
!1079 = distinct !{!1079, !311}
!1080 = distinct !{!1080, !311}
!1081 = distinct !{!1081, !311}
!1082 = distinct !{!1082, !311}
!1083 = distinct !{!1083, !311}
!1084 = !{!1085, !1087, !1089, !1091}
!1085 = distinct !{!1085, !1086}
!1086 = distinct !{!1086}
!1087 = distinct !{!1087, !1088}
!1088 = distinct !{!1088}
!1089 = distinct !{!1089, !1090}
!1090 = distinct !{!1090}
!1091 = distinct !{!1091, !1092}
!1092 = distinct !{!1092}
!1093 = !{!1094, !1096, !1098, !1100}
!1094 = distinct !{!1094, !1095}
!1095 = distinct !{!1095}
!1096 = distinct !{!1096, !1097}
!1097 = distinct !{!1097}
!1098 = distinct !{!1098, !1099}
!1099 = distinct !{!1099}
!1100 = distinct !{!1100, !1101}
!1101 = distinct !{!1101}
!1102 = distinct !{!1102, !311}
!1103 = distinct !{!1103, !311}
!1104 = distinct !{!1104, !311}
!1105 = distinct !{!1105, !311}
!1106 = !{!1107, !1109, !1111, !1113}
!1107 = distinct !{!1107, !1108}
!1108 = distinct !{!1108}
!1109 = distinct !{!1109, !1110}
!1110 = distinct !{!1110}
!1111 = distinct !{!1111, !1112}
!1112 = distinct !{!1112}
!1113 = distinct !{!1113, !1114}
!1114 = distinct !{!1114}
!1115 = !{!1116, !1118, !1120, !1122}
!1116 = distinct !{!1116, !1117}
!1117 = distinct !{!1117}
!1118 = distinct !{!1118, !1119}
!1119 = distinct !{!1119}
!1120 = distinct !{!1120, !1121}
!1121 = distinct !{!1121}
!1122 = distinct !{!1122, !1123}
!1123 = distinct !{!1123}
!1124 = distinct !{!1124, !311}
!1125 = distinct !{!1125, !311}
!1126 = distinct !{!1126, !311}
!1127 = distinct !{!1127, !311}
!1128 = distinct !{!1128, !311}
!1129 = !{!1130, !1132, !1134, !1136}
!1130 = distinct !{!1130, !1131}
!1131 = distinct !{!1131}
!1132 = distinct !{!1132, !1133}
!1133 = distinct !{!1133}
!1134 = distinct !{!1134, !1135}
!1135 = distinct !{!1135}
!1136 = distinct !{!1136, !1137}
!1137 = distinct !{!1137}
!1138 = !{!1139, !1141, !1143, !1145}
!1139 = distinct !{!1139, !1140}
!1140 = distinct !{!1140}
!1141 = distinct !{!1141, !1142}
!1142 = distinct !{!1142}
!1143 = distinct !{!1143, !1144}
!1144 = distinct !{!1144}
!1145 = distinct !{!1145, !1146}
!1146 = distinct !{!1146}
!1147 = distinct !{!1147, !311}
!1148 = distinct !{!1148, !311}
!1149 = distinct !{!1149, !311}
!1150 = distinct !{!1150, !311}
!1151 = !{!1152, !1154, !1156, !1158}
!1152 = distinct !{!1152, !1153}
!1153 = distinct !{!1153}
!1154 = distinct !{!1154, !1155}
!1155 = distinct !{!1155}
!1156 = distinct !{!1156, !1157}
!1157 = distinct !{!1157}
!1158 = distinct !{!1158, !1159}
!1159 = distinct !{!1159}
!1160 = !{!1161, !1163, !1165, !1167}
!1161 = distinct !{!1161, !1162}
!1162 = distinct !{!1162}
!1163 = distinct !{!1163, !1164}
!1164 = distinct !{!1164}
!1165 = distinct !{!1165, !1166}
!1166 = distinct !{!1166}
!1167 = distinct !{!1167, !1168}
!1168 = distinct !{!1168}
!1169 = distinct !{!1169, !311}
!1170 = distinct !{!1170, !311}
!1171 = distinct !{!1171, !311}
!1172 = distinct !{!1172, !311}
!1173 = distinct !{!1173, !311}
!1174 = !{!1175, !1177, !1179, !1181}
!1175 = distinct !{!1175, !1176}
!1176 = distinct !{!1176}
!1177 = distinct !{!1177, !1178}
!1178 = distinct !{!1178}
!1179 = distinct !{!1179, !1180}
!1180 = distinct !{!1180}
!1181 = distinct !{!1181, !1182}
!1182 = distinct !{!1182}
!1183 = !{!1184, !1186, !1188, !1190}
!1184 = distinct !{!1184, !1185}
!1185 = distinct !{!1185}
!1186 = distinct !{!1186, !1187}
!1187 = distinct !{!1187}
!1188 = distinct !{!1188, !1189}
!1189 = distinct !{!1189}
!1190 = distinct !{!1190, !1191}
!1191 = distinct !{!1191}
!1192 = distinct !{!1192, !311}
!1193 = distinct !{!1193, !311}
!1194 = distinct !{!1194, !311}
!1195 = distinct !{!1195, !311}
!1196 = !{!1197, !1199, !1201, !1203}
!1197 = distinct !{!1197, !1198}
!1198 = distinct !{!1198}
!1199 = distinct !{!1199, !1200}
!1200 = distinct !{!1200}
!1201 = distinct !{!1201, !1202}
!1202 = distinct !{!1202}
!1203 = distinct !{!1203, !1204}
!1204 = distinct !{!1204}
!1205 = !{!1206, !1208, !1210, !1212}
!1206 = distinct !{!1206, !1207}
!1207 = distinct !{!1207}
!1208 = distinct !{!1208, !1209}
!1209 = distinct !{!1209}
!1210 = distinct !{!1210, !1211}
!1211 = distinct !{!1211}
!1212 = distinct !{!1212, !1213}
!1213 = distinct !{!1213}
!1214 = distinct !{!1214, !311}
!1215 = distinct !{!1215, !311}
!1216 = distinct !{!1216, !311}
!1217 = distinct !{!1217, !311}
!1218 = distinct !{!1218, !311}
!1219 = !{!1220, !1222, !1224, !1226}
!1220 = distinct !{!1220, !1221}
!1221 = distinct !{!1221}
!1222 = distinct !{!1222, !1223}
!1223 = distinct !{!1223}
!1224 = distinct !{!1224, !1225}
!1225 = distinct !{!1225}
!1226 = distinct !{!1226, !1227}
!1227 = distinct !{!1227}
!1228 = !{!1229, !1231, !1233, !1235}
!1229 = distinct !{!1229, !1230}
!1230 = distinct !{!1230}
!1231 = distinct !{!1231, !1232}
!1232 = distinct !{!1232}
!1233 = distinct !{!1233, !1234}
!1234 = distinct !{!1234}
!1235 = distinct !{!1235, !1236}
!1236 = distinct !{!1236}
!1237 = distinct !{!1237, !311}
!1238 = distinct !{!1238, !311}
!1239 = distinct !{!1239, !311}
!1240 = !{i32 0, i32 1, i32 1, i32 1}
!1241 = !{!"int", !"float*", !"char*", !"class.sycl::_V1::detail::half_impl::half*"}
!1242 = !{!8, !300, !302, !298}
!1243 = distinct !{!1243, !311}
!1244 = distinct !{!1244, !311}
!1245 = distinct !{!1245, !311}
!1246 = distinct !{!1246, !311}
!1247 = distinct !{!1247, !311}
!1248 = distinct !{!1248, !311}
