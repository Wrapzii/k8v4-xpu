; ------------------------------------------------
; OCL_asme7ab99c921e26e3b_1_afterUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::detail::half_impl::half" = type { half }

@0 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@1 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@2 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@3 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #0

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi2EEE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4) #1 {
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
  %18 = shl nuw nsw i64 %12, 8, !spirv.Decorations !466
  %19 = shl nuw nsw i64 %12, 14, !spirv.Decorations !466
  %20 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %19
  %21 = shl nuw nsw i64 %16, 8, !spirv.Decorations !466
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
  %34 = fcmp reassoc nsz arcp contract oeq float %33, 0.000000e+00, !spirv.Decorations !469
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
  %44 = add nuw nsw i32 %27, 1, !spirv.Decorations !466
  br label %26, !llvm.loop !471

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
  %54 = fcmp reassoc nsz arcp contract oeq float %48, 0.000000e+00, !spirv.Decorations !469
  br i1 %54, label %57, label %55

55:                                               ; preds = %53
  %56 = fdiv reassoc nsz arcp contract float 1.000000e+00, %48, !spirv.Decorations !469
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
  %70 = fmul reassoc nsz arcp contract float %58, %69, !spirv.Decorations !469
  %71 = call float @llvm.genx.GenISA.ROUNDNE(float %70)
  %72 = call float @llvm.maxnum.f32(float %71, float -1.270000e+02)
  %73 = call float @llvm.minnum.f32(float %72, float 1.270000e+02)
  %74 = fptosi float %73 to i8
  %75 = getelementptr inbounds i8, ptr addrspace(1) %61, i64 %66
  store i8 %74, ptr addrspace(1) %75, align 1
  %76 = add nuw nsw i32 %63, 1, !spirv.Decorations !466
  br label %62, !llvm.loop !473

77:                                               ; preds = %62
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi4EEE(ptr addrspace(1) align 2 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4) #1 {
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
  %18 = shl nuw nsw i64 %12, 8, !spirv.Decorations !466
  %19 = shl nuw nsw i64 %12, 14, !spirv.Decorations !466
  %20 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %0, i64 %19
  %21 = shl nuw nsw i64 %16, 8, !spirv.Decorations !466
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
  %34 = fcmp reassoc nsz arcp contract oeq float %33, 0.000000e+00, !spirv.Decorations !469
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
  %44 = add nuw nsw i32 %27, 1, !spirv.Decorations !466
  br label %26, !llvm.loop !474

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
  %54 = fcmp reassoc nsz arcp contract oeq float %48, 0.000000e+00, !spirv.Decorations !469
  br i1 %54, label %57, label %55

55:                                               ; preds = %53
  %56 = fdiv reassoc nsz arcp contract float 1.000000e+00, %48, !spirv.Decorations !469
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
  %70 = fmul reassoc nsz arcp contract float %58, %69, !spirv.Decorations !469
  %71 = call float @llvm.genx.GenISA.ROUNDNE(float %70)
  %72 = call float @llvm.maxnum.f32(float %71, float -1.270000e+02)
  %73 = call float @llvm.minnum.f32(float %72, float 1.270000e+02)
  %74 = fptosi float %73 to i8
  %75 = getelementptr inbounds i8, ptr addrspace(1) %61, i64 %66
  store i8 %74, ptr addrspace(1) %75, align 1
  %76 = add nuw nsw i32 %63, 1, !spirv.Decorations !466
  br label %62, !llvm.loop !475

77:                                               ; preds = %62
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi2EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 2 %3, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4) #1 {
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
  %19 = shl nuw nsw i64 %14, 6, !spirv.Decorations !466
  %20 = shl nuw nsw i64 %14, 14, !spirv.Decorations !466
  %21 = mul nsw i32 %0, 6, !spirv.Decorations !476
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
  %34 = shl nuw nsw i64 %32, 8, !spirv.Decorations !466
  %35 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 %34
  %36 = shl nuw nsw i32 %18, 7, !spirv.Decorations !466
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
  %45 = add nuw nsw i32 %40, 1, !spirv.Decorations !466
  br label %39, !llvm.loop !477

46:                                               ; preds = %4
  %47 = udiv i32 %13, 12
  %48 = mul nsw i32 %47, -6, !spirv.Decorations !476
  %49 = add nsw i32 %48, %17, !spirv.Decorations !476
  %50 = mul nuw nsw i32 %6, 6, !spirv.Decorations !466
  %51 = add nsw i32 %50, %49, !spirv.Decorations !476
  %52 = mul nuw nsw i32 %47, 12, !spirv.Decorations !466
  %53 = zext i32 %52 to i64
  %54 = sext i32 %51 to i64
  %55 = add nsw i64 %53, %54, !spirv.Decorations !476
  %56 = shl nsw i64 %55, 8, !spirv.Decorations !476
  %57 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %3, i64 %56
  %58 = shl nuw nsw i32 %18, 7, !spirv.Decorations !466
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
  %69 = fcmp reassoc nsz arcp contract oeq float %68, 0.000000e+00, !spirv.Decorations !469
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
  %79 = add nuw nsw i32 %62, 1, !spirv.Decorations !466
  br label %61, !llvm.loop !478

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
  %90 = fcmp reassoc nsz arcp contract oeq float %83, 0.000000e+00, !spirv.Decorations !469
  br i1 %90, label %93, label %91

91:                                               ; preds = %89
  %92 = fdiv reassoc nsz arcp contract float 1.000000e+00, %83, !spirv.Decorations !469
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
  %108 = fmul reassoc nsz arcp contract float %94, %107, !spirv.Decorations !469
  %109 = call float @llvm.genx.GenISA.ROUNDNE(float %108)
  %110 = call float @llvm.maxnum.f32(float %109, float -1.270000e+02)
  %111 = call float @llvm.minnum.f32(float %110, float 1.270000e+02)
  %112 = fptosi float %111 to i8
  %113 = getelementptr inbounds i8, ptr addrspace(1) %99, i64 %104
  store i8 %112, ptr addrspace(1) %113, align 1
  %114 = add nuw nsw i32 %101, 1, !spirv.Decorations !466
  br label %100, !llvm.loop !479

.loopexit:                                        ; preds = %100
  br label %115

.loopexit1:                                       ; preds = %39
  br label %115

115:                                              ; preds = %.loopexit1, %.loopexit
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi4EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 2 %3, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bindlessOffset, i32 %bindlessOffset3, i32 %bindlessOffset4) #1 {
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
  %19 = shl nuw nsw i64 %14, 6, !spirv.Decorations !466
  %20 = shl nuw nsw i64 %14, 14, !spirv.Decorations !466
  %21 = mul nsw i32 %0, 6, !spirv.Decorations !476
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
  %34 = shl nuw nsw i64 %32, 8, !spirv.Decorations !466
  %35 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 %34
  %36 = shl nuw nsw i32 %18, 7, !spirv.Decorations !466
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
  %45 = add nuw nsw i32 %40, 1, !spirv.Decorations !466
  br label %39, !llvm.loop !480

46:                                               ; preds = %4
  %47 = udiv i32 %13, 12
  %48 = mul nsw i32 %47, -6, !spirv.Decorations !476
  %49 = add nsw i32 %48, %17, !spirv.Decorations !476
  %50 = mul nuw nsw i32 %6, 6, !spirv.Decorations !466
  %51 = add nsw i32 %50, %49, !spirv.Decorations !476
  %narrow = mul nuw nsw i32 %47, 24
  %52 = zext i32 %narrow to i64
  %53 = sext i32 %51 to i64
  %54 = add nsw i64 %52, %53, !spirv.Decorations !476
  %55 = shl nsw i64 %54, 8, !spirv.Decorations !476
  %56 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(1) %3, i64 %55
  %57 = shl nuw nsw i32 %18, 7, !spirv.Decorations !466
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
  %68 = fcmp reassoc nsz arcp contract oeq float %67, 0.000000e+00, !spirv.Decorations !469
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
  %78 = add nuw nsw i32 %61, 1, !spirv.Decorations !466
  br label %60, !llvm.loop !481

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
  %89 = fcmp reassoc nsz arcp contract oeq float %82, 0.000000e+00, !spirv.Decorations !469
  br i1 %89, label %92, label %90

90:                                               ; preds = %88
  %91 = fdiv reassoc nsz arcp contract float 1.000000e+00, %82, !spirv.Decorations !469
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
  %107 = fmul reassoc nsz arcp contract float %93, %106, !spirv.Decorations !469
  %108 = call float @llvm.genx.GenISA.ROUNDNE(float %107)
  %109 = call float @llvm.maxnum.f32(float %108, float -1.270000e+02)
  %110 = call float @llvm.minnum.f32(float %109, float 1.270000e+02)
  %111 = fptosi float %110 to i8
  %112 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 %103
  store i8 %111, ptr addrspace(1) %112, align 1
  %113 = add nuw nsw i32 %100, 1, !spirv.Decorations !466
  br label %99, !llvm.loop !482

.loopexit:                                        ; preds = %99
  br label %114

.loopexit1:                                       ; preds = %39
  br label %114

114:                                              ; preds = %.loopexit1, %.loopexit
  ret void
}

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_fmax(float noundef, float noundef) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_fmin(float noundef, float noundef) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_frnd_ne(float noundef) local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare spir_func float @__builtin_IB_simd_shuffle_f(float noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_group_id(i32 noundef) local_unnamed_addr #2

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_id_x() local_unnamed_addr #2

; Function Attrs: convergent nounwind
declare spir_func i32 @__builtin_IB_get_simd_id() local_unnamed_addr #3

declare i32 @printf(ptr addrspace(2), ...)

; Function Desc: 
; Output: 
; Function Attrs: nounwind willreturn memory(none)
declare i16 @llvm.genx.GenISA.simdLaneId() #4

; Function Desc: 
; Output: 
; Arg 0: 
; Arg 1: 
; Arg 2: 
; Function Attrs: convergent nounwind willreturn memory(none)
declare float @llvm.genx.GenISA.WaveShuffleIndex.f32(float, i32, i32) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #6

; Function Desc: 
; Output: 
; Arg 0: 
; Function Attrs: nounwind willreturn memory(none)
declare float @llvm.genx.GenISA.ROUNDNE(float) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minnum.f32(float, float) #6

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #1 = { convergent nounwind "less-precise-fpmad"="true" }
attributes #2 = { convergent mustprogress nofree nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { convergent nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { nounwind willreturn memory(none) }
attributes #5 = { convergent nounwind willreturn memory(none) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!spirv.MemoryModel = !{!0}
!spirv.Source = !{!1}
!spirv.Generator = !{!2}
!igc.functions = !{!3, !6, !7, !8}
!IGCMetadata = !{!9}
!opencl.ocl.version = !{!463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463}
!opencl.spir.version = !{!463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463, !463}
!llvm.ident = !{!464, !464, !464, !464, !464, !464, !464, !464, !464, !464, !464, !464, !464, !464, !464, !464}
!llvm.module.flags = !{!465}

!0 = !{i32 2, i32 2}
!1 = !{i32 4, i32 100000}
!2 = !{i16 6, i16 14}
!3 = !{ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi2EEE, !4}
!4 = !{!5}
!5 = !{!"function_type", i32 0}
!6 = !{ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi4EEE, !4}
!7 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi2EEE, !4}
!8 = !{ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi4EEE, !4}
!9 = !{!"ModuleMD", !10, !11, !122, !297, !328, !345, !366, !376, !378, !379, !394, !395, !396, !397, !398, !402, !403, !410, !411, !412, !413, !414, !415, !416, !417, !418, !420, !424, !425, !426, !427, !428, !429, !430, !431, !432, !433, !434, !435, !436, !437, !438, !225, !439, !440, !441, !443, !445, !448, !449, !450, !452, !453, !454, !459, !460, !461, !462}
!10 = !{!"isPrecise", i1 false}
!11 = !{!"compOpt", !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121}
!12 = !{!"DenormsAreZero", i1 false}
!13 = !{!"BFTFDenormsAreZero", i1 false}
!14 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!15 = !{!"OptDisable", i1 false}
!16 = !{!"MadEnable", i1 true}
!17 = !{!"NoSignedZeros", i1 false}
!18 = !{!"NoNaNs", i1 false}
!19 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!20 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!21 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!22 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!23 = !{!"FloatRoundingMode", i32 0}
!24 = !{!"FloatCvtIntRoundingMode", i32 3}
!25 = !{!"LoadCacheDefault", i32 4}
!26 = !{!"StoreCacheDefault", i32 2}
!27 = !{!"VISAPreSchedRPThreshold", i32 0}
!28 = !{!"VISAPreSchedCtrl", i32 0}
!29 = !{!"SetLoopUnrollThreshold", i32 0}
!30 = !{!"UnsafeMathOptimizations", i1 false}
!31 = !{!"disableCustomUnsafeOpts", i1 false}
!32 = !{!"disableReducePow", i1 false}
!33 = !{!"disableSqrtOpt", i1 false}
!34 = !{!"FiniteMathOnly", i1 false}
!35 = !{!"FastRelaxedMath", i1 false}
!36 = !{!"DashGSpecified", i1 false}
!37 = !{!"FastCompilation", i1 false}
!38 = !{!"UseScratchSpacePrivateMemory", i1 true}
!39 = !{!"RelaxedBuiltins", i1 false}
!40 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!41 = !{!"GreaterThan2GBBufferRequired", i1 true}
!42 = !{!"GreaterThan4GBBufferRequired", i1 true}
!43 = !{!"DisableA64WA", i1 false}
!44 = !{!"ForceEnableA64WA", i1 false}
!45 = !{!"PushConstantsEnable", i1 true}
!46 = !{!"HasPositivePointerOffset", i1 false}
!47 = !{!"HasBufferOffsetArg", i1 true}
!48 = !{!"BufferOffsetArgOptional", i1 true}
!49 = !{!"replaceGlobalOffsetsByZero", i1 false}
!50 = !{!"forcePixelShaderSIMDMode", i32 0}
!51 = !{!"forceTotalGRFNum", i32 0}
!52 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!53 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!54 = !{!"UniformWGS", i1 false}
!55 = !{!"disableVertexComponentPacking", i1 false}
!56 = !{!"disablePartialVertexComponentPacking", i1 false}
!57 = !{!"PreferBindlessImages", i1 true}
!58 = !{!"UseBindlessMode", i1 true}
!59 = !{!"UseLegacyBindlessMode", i1 false}
!60 = !{!"disableMathRefactoring", i1 false}
!61 = !{!"atomicBranch", i1 false}
!62 = !{!"spillCompression", i1 false}
!63 = !{!"AllowLICM", i1 true}
!64 = !{!"DisableEarlyOut", i1 false}
!65 = !{!"ForceInt32DivRemEmu", i1 false}
!66 = !{!"ForceInt32DivRemEmuSP", i1 false}
!67 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!68 = !{!"DisableFastestSingleCSSIMD", i1 false}
!69 = !{!"DisableFastestLinearScan", i1 false}
!70 = !{!"UseStatelessforPrivateMemory", i1 false}
!71 = !{!"EnableTakeGlobalAddress", i1 false}
!72 = !{!"IsLibraryCompilation", i1 false}
!73 = !{!"LibraryCompileSIMDSize", i32 0}
!74 = !{!"FastVISACompile", i1 false}
!75 = !{!"MatchSinCosPi", i1 false}
!76 = !{!"ExcludeIRFromZEBinary", i1 false}
!77 = !{!"EmitZeBinVISASections", i1 false}
!78 = !{!"FP64GenEmulationEnabled", i1 false}
!79 = !{!"FP64GenConvEmulationEnabled", i1 false}
!80 = !{!"allowDisableRematforCS", i1 false}
!81 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!82 = !{!"DisableCPSOmaskWA", i1 false}
!83 = !{!"DisableFastestGopt", i1 false}
!84 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!85 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!86 = !{!"DisableConstantCoalescing", i1 false}
!87 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!88 = !{!"WaEnableALTModeVisaWA", i1 false}
!89 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!90 = !{!"EnableLdStCombineforLoad", i1 false}
!91 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!92 = !{!"ForceUniformBuffer", i1 false}
!93 = !{!"ForceUniformSurfaceSampler", i1 false}
!94 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!95 = !{!"NewSpillCostFunction", i1 false}
!96 = !{!"EnableVRT", i1 true}
!97 = !{!"ForceLargeGRFNum4RQ", i1 false}
!98 = !{!"DisableEUFusion", i1 false}
!99 = !{!"DisableFDivToFMulInvOpt", i1 false}
!100 = !{!"initializePhiSampleSourceWA", i1 false}
!101 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!102 = !{!"DisableLoosenSimd32Occu", i1 false}
!103 = !{!"FastestS1Options", i32 0}
!104 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!105 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!106 = !{!"LscSamplerRouting", i32 0}
!107 = !{!"UseBarrierControlFlowOptimization", i1 false}
!108 = !{!"EnableDynamicRQManagement", i1 false}
!109 = !{!"WaDisablePayloadCoalescing", i1 false}
!110 = !{!"Quad8InputThreshold", i32 0}
!111 = !{!"UseResourceLoopUnrollNested", i1 false}
!112 = !{!"DisableLoopUnroll", i1 false}
!113 = !{!"ForcePushConstantMode", i32 0}
!114 = !{!"UseInstructionHoistingOptimization", i1 false}
!115 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!116 = !{!"ForceVRTGRFCeiling", i32 0}
!117 = !{!"DisableSamplerBackingByLSC", i32 0}
!118 = !{!"UseLinearScanRA", i1 false}
!119 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!120 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!121 = !{!"VISASpillAllowed", i32 0}
!122 = !{!"FuncMD", !123, !124, !263, !264, !265, !266, !295, !296}
!123 = !{!"FuncMDMap[0]", ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi2EEE}
!124 = !{!"FuncMDValue[0]", !125, !126, !130, !133, !134, !135, !136, !137, !165, !166, !167, !190, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !241, !245, !249, !253, !257, !261, !262}
!125 = !{!"localOffsets"}
!126 = !{!"workGroupWalkOrder", !127, !128, !129}
!127 = !{!"dim0", i32 0}
!128 = !{!"dim1", i32 1}
!129 = !{!"dim2", i32 2}
!130 = !{!"threadGroupSize", !127, !131, !132}
!131 = !{!"dim1", i32 0}
!132 = !{!"dim2", i32 0}
!133 = !{!"threadGroupSizeHint", !127, !131, !132}
!134 = !{!"vecTypeHint", !""}
!135 = !{!"funcArgs"}
!136 = !{!"argInfoList"}
!137 = !{!"implicitArgInfoList", !138, !144, !146, !148, !150, !152, !154, !157, !159, !161, !163, !164}
!138 = !{!"implicitArgInfoListVec[0]", !139, !140, !141, !142, !143}
!139 = !{!"argId", i32 0}
!140 = !{!"explicitArgNum", i32 -1}
!141 = !{!"structArgOffset", i32 -1}
!142 = !{!"imgAccessFloatCoords", i32 -1}
!143 = !{!"imgAccessIntCoords", i32 -1}
!144 = !{!"implicitArgInfoListVec[1]", !145, !140, !141, !142, !143}
!145 = !{!"argId", i32 2}
!146 = !{!"implicitArgInfoListVec[2]", !147, !140, !141, !142, !143}
!147 = !{!"argId", i32 8}
!148 = !{!"implicitArgInfoListVec[3]", !149, !140, !141, !142, !143}
!149 = !{!"argId", i32 9}
!150 = !{!"implicitArgInfoListVec[4]", !151, !140, !141, !142, !143}
!151 = !{!"argId", i32 10}
!152 = !{!"implicitArgInfoListVec[5]", !153, !140, !141, !142, !143}
!153 = !{!"argId", i32 13}
!154 = !{!"implicitArgInfoListVec[6]", !155, !156, !141, !142, !143}
!155 = !{!"argId", i32 15}
!156 = !{!"explicitArgNum", i32 0}
!157 = !{!"implicitArgInfoListVec[7]", !155, !158, !141, !142, !143}
!158 = !{!"explicitArgNum", i32 1}
!159 = !{!"implicitArgInfoListVec[8]", !155, !160, !141, !142, !143}
!160 = !{!"explicitArgNum", i32 2}
!161 = !{!"implicitArgInfoListVec[9]", !162, !156, !141, !142, !143}
!162 = !{!"argId", i32 54}
!163 = !{!"implicitArgInfoListVec[10]", !162, !158, !141, !142, !143}
!164 = !{!"implicitArgInfoListVec[11]", !162, !160, !141, !142, !143}
!165 = !{!"functionType", !"KernelFunction"}
!166 = !{!"requiredSubGroupSize", i32 16}
!167 = !{!"rtInfo", !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !185, !186, !187, !188, !189}
!168 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!169 = !{!"isContinuation", i1 false}
!170 = !{!"hasTraceRayPayload", i1 false}
!171 = !{!"hasHitAttributes", i1 false}
!172 = !{!"hasCallableData", i1 false}
!173 = !{!"ShaderStackSize", i32 0}
!174 = !{!"ShaderHash", i64 0}
!175 = !{!"ShaderName", !""}
!176 = !{!"ParentName", !""}
!177 = !{!"SlotNum", ptr null}
!178 = !{!"NOSSize", i32 0}
!179 = !{!"globalRootSignatureSize", i32 0}
!180 = !{!"Entries"}
!181 = !{!"SpillUnions"}
!182 = !{!"CustomHitAttrSizeInBytes", i32 0}
!183 = !{!"Types", !184}
!184 = !{!"FullFrameTys"}
!185 = !{!"Aliases"}
!186 = !{!"numSyncRTStacks", i32 0}
!187 = !{!"NumCoherenceHintBits", i32 0}
!188 = !{!"useSyncHWStack", i1 false}
!189 = !{!"OriginatingShaderName", !""}
!190 = !{!"resAllocMD", !191, !192, !193, !194, !213}
!191 = !{!"uavsNumType", i32 0}
!192 = !{!"srvsNumType", i32 0}
!193 = !{!"samplersNumType", i32 0}
!194 = !{!"argAllocMDList", !195, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212}
!195 = !{!"argAllocMDListVec[0]", !196, !197, !198}
!196 = !{!"type", i32 0}
!197 = !{!"extensionType", i32 -1}
!198 = !{!"indexType", i32 -1}
!199 = !{!"argAllocMDListVec[1]", !196, !197, !198}
!200 = !{!"argAllocMDListVec[2]", !196, !197, !198}
!201 = !{!"argAllocMDListVec[3]", !196, !197, !198}
!202 = !{!"argAllocMDListVec[4]", !196, !197, !198}
!203 = !{!"argAllocMDListVec[5]", !196, !197, !198}
!204 = !{!"argAllocMDListVec[6]", !196, !197, !198}
!205 = !{!"argAllocMDListVec[7]", !196, !197, !198}
!206 = !{!"argAllocMDListVec[8]", !196, !197, !198}
!207 = !{!"argAllocMDListVec[9]", !196, !197, !198}
!208 = !{!"argAllocMDListVec[10]", !196, !197, !198}
!209 = !{!"argAllocMDListVec[11]", !196, !197, !198}
!210 = !{!"argAllocMDListVec[12]", !196, !197, !198}
!211 = !{!"argAllocMDListVec[13]", !196, !197, !198}
!212 = !{!"argAllocMDListVec[14]", !196, !197, !198}
!213 = !{!"inlineSamplersMD"}
!214 = !{!"maxByteOffsets"}
!215 = !{!"IsInitializer", i1 false}
!216 = !{!"IsFinalizer", i1 false}
!217 = !{!"CompiledSubGroupsNumber", i32 0}
!218 = !{!"maxRegPressure", i32 0}
!219 = !{!"maxRegPressureSimd16", i32 0}
!220 = !{!"maxRegPressureSimd32", i32 0}
!221 = !{!"hasInlineVmeSamplers", i1 false}
!222 = !{!"localSize", i32 0}
!223 = !{!"localIDPresent", i1 false}
!224 = !{!"groupIDPresent", i1 false}
!225 = !{!"privateMemoryPerWI", i32 0}
!226 = !{!"prevFPOffset", i32 0}
!227 = !{!"globalIDPresent", i1 false}
!228 = !{!"hasSyncRTCalls", i1 false}
!229 = !{!"hasPrintfCalls", i1 false}
!230 = !{!"requireAssertBuffer", i1 false}
!231 = !{!"requireSyncBuffer", i1 false}
!232 = !{!"hasIndirectCalls", i1 false}
!233 = !{!"hasNonKernelArgLoad", i1 false}
!234 = !{!"hasNonKernelArgStore", i1 false}
!235 = !{!"hasNonKernelArgAtomic", i1 false}
!236 = !{!"UserAnnotations"}
!237 = !{!"m_OpenCLArgAddressSpaces", !238, !239, !240}
!238 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 1}
!239 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 1}
!240 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 1}
!241 = !{!"m_OpenCLArgAccessQualifiers", !242, !243, !244}
!242 = !{!"m_OpenCLArgAccessQualifiersVec[0]", !"none"}
!243 = !{!"m_OpenCLArgAccessQualifiersVec[1]", !"none"}
!244 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!245 = !{!"m_OpenCLArgTypes", !246, !247, !248}
!246 = !{!"m_OpenCLArgTypesVec[0]", !"class.sycl::_V1::detail::half_impl::half*"}
!247 = !{!"m_OpenCLArgTypesVec[1]", !"char*"}
!248 = !{!"m_OpenCLArgTypesVec[2]", !"char*"}
!249 = !{!"m_OpenCLArgBaseTypes", !250, !251, !252}
!250 = !{!"m_OpenCLArgBaseTypesVec[0]", !"class.sycl::_V1::detail::half_impl::half*"}
!251 = !{!"m_OpenCLArgBaseTypesVec[1]", !"char*"}
!252 = !{!"m_OpenCLArgBaseTypesVec[2]", !"char*"}
!253 = !{!"m_OpenCLArgTypeQualifiers", !254, !255, !256}
!254 = !{!"m_OpenCLArgTypeQualifiersVec[0]", !""}
!255 = !{!"m_OpenCLArgTypeQualifiersVec[1]", !""}
!256 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!257 = !{!"m_OpenCLArgNames", !258, !259, !260}
!258 = !{!"m_OpenCLArgNamesVec[0]", !""}
!259 = !{!"m_OpenCLArgNamesVec[1]", !""}
!260 = !{!"m_OpenCLArgNamesVec[2]", !""}
!261 = !{!"m_OpenCLArgScalarAsPointers"}
!262 = !{!"m_OptsToDisablePerFunc"}
!263 = !{!"FuncMDMap[1]", ptr @_ZTSN12_GLOBAL__N_125Xe2KvTorchAbiQquantKernelILi4EEE}
!264 = !{!"FuncMDValue[1]", !125, !126, !130, !133, !134, !135, !136, !137, !165, !166, !167, !190, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !241, !245, !249, !253, !257, !261, !262}
!265 = !{!"FuncMDMap[2]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi2EEE}
!266 = !{!"FuncMDValue[2]", !125, !126, !130, !133, !134, !135, !136, !267, !165, !166, !167, !275, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !278, !281, !283, !287, !291, !293, !261, !262}
!267 = !{!"implicitArgInfoList", !138, !144, !146, !148, !150, !152, !268, !269, !270, !272, !273, !274}
!268 = !{!"implicitArgInfoListVec[6]", !155, !158, !141, !142, !143}
!269 = !{!"implicitArgInfoListVec[7]", !155, !160, !141, !142, !143}
!270 = !{!"implicitArgInfoListVec[8]", !155, !271, !141, !142, !143}
!271 = !{!"explicitArgNum", i32 3}
!272 = !{!"implicitArgInfoListVec[9]", !162, !158, !141, !142, !143}
!273 = !{!"implicitArgInfoListVec[10]", !162, !160, !141, !142, !143}
!274 = !{!"implicitArgInfoListVec[11]", !162, !271, !141, !142, !143}
!275 = !{!"resAllocMD", !191, !192, !193, !276, !213}
!276 = !{!"argAllocMDList", !195, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !277}
!277 = !{!"argAllocMDListVec[15]", !196, !197, !198}
!278 = !{!"m_OpenCLArgAddressSpaces", !279, !239, !240, !280}
!279 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 0}
!280 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 1}
!281 = !{!"m_OpenCLArgAccessQualifiers", !242, !243, !244, !282}
!282 = !{!"m_OpenCLArgAccessQualifiersVec[3]", !"none"}
!283 = !{!"m_OpenCLArgTypes", !284, !285, !248, !286}
!284 = !{!"m_OpenCLArgTypesVec[0]", !"int"}
!285 = !{!"m_OpenCLArgTypesVec[1]", !"float*"}
!286 = !{!"m_OpenCLArgTypesVec[3]", !"class.sycl::_V1::detail::half_impl::half*"}
!287 = !{!"m_OpenCLArgBaseTypes", !288, !289, !252, !290}
!288 = !{!"m_OpenCLArgBaseTypesVec[0]", !"int"}
!289 = !{!"m_OpenCLArgBaseTypesVec[1]", !"float*"}
!290 = !{!"m_OpenCLArgBaseTypesVec[3]", !"class.sycl::_V1::detail::half_impl::half*"}
!291 = !{!"m_OpenCLArgTypeQualifiers", !254, !255, !256, !292}
!292 = !{!"m_OpenCLArgTypeQualifiersVec[3]", !""}
!293 = !{!"m_OpenCLArgNames", !258, !259, !260, !294}
!294 = !{!"m_OpenCLArgNamesVec[3]", !""}
!295 = !{!"FuncMDMap[3]", ptr @_ZTSN12_GLOBAL__N_129Xe2KvTorchAbiPackQquantKernelILi4EEE}
!296 = !{!"FuncMDValue[3]", !125, !126, !130, !133, !134, !135, !136, !267, !165, !166, !167, !275, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !278, !281, !283, !287, !291, !293, !261, !262}
!297 = !{!"pushInfo", !298, !299, !300, !304, !305, !306, !307, !308, !309, !310, !311, !324, !325, !326, !327}
!298 = !{!"pushableAddresses"}
!299 = !{!"bindlessPushInfo"}
!300 = !{!"dynamicBufferInfo", !301, !302, !303}
!301 = !{!"firstIndex", i32 0}
!302 = !{!"numOffsets", i32 0}
!303 = !{!"forceDisabled", i1 false}
!304 = !{!"MaxNumberOfPushedBuffers", i32 0}
!305 = !{!"inlineConstantBufferSlot", i32 -1}
!306 = !{!"inlineConstantBufferOffset", i32 -1}
!307 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!308 = !{!"constants"}
!309 = !{!"inputs"}
!310 = !{!"constantReg"}
!311 = !{!"simplePushInfoArr", !312, !321, !322, !323}
!312 = !{!"simplePushInfoArrVec[0]", !313, !314, !315, !316, !317, !318, !319, !320}
!313 = !{!"cbIdx", i32 0}
!314 = !{!"pushableAddressGrfOffset", i32 -1}
!315 = !{!"pushableOffsetGrfOffset", i32 -1}
!316 = !{!"offset", i32 0}
!317 = !{!"size", i32 0}
!318 = !{!"isStateless", i1 false}
!319 = !{!"isBindless", i1 false}
!320 = !{!"simplePushLoads"}
!321 = !{!"simplePushInfoArrVec[1]", !313, !314, !315, !316, !317, !318, !319, !320}
!322 = !{!"simplePushInfoArrVec[2]", !313, !314, !315, !316, !317, !318, !319, !320}
!323 = !{!"simplePushInfoArrVec[3]", !313, !314, !315, !316, !317, !318, !319, !320}
!324 = !{!"simplePushBufferUsed", i32 0}
!325 = !{!"pushAnalysisWIInfos"}
!326 = !{!"inlineRTGlobalPtrOffset", i32 0}
!327 = !{!"rtSyncSurfPtrOffset", i32 0}
!328 = !{!"psInfo", !329, !330, !331, !332, !333, !334, !335, !336, !337, !338, !339, !340, !341, !342, !343, !344}
!329 = !{!"BlendStateDisabledMask", i8 0}
!330 = !{!"SkipSrc0Alpha", i1 false}
!331 = !{!"DualSourceBlendingDisabled", i1 false}
!332 = !{!"ForceEnableSimd32", i1 false}
!333 = !{!"DisableSimd32WithDiscard", i1 false}
!334 = !{!"outputDepth", i1 false}
!335 = !{!"outputStencil", i1 false}
!336 = !{!"outputMask", i1 false}
!337 = !{!"blendToFillEnabled", i1 false}
!338 = !{!"forceEarlyZ", i1 false}
!339 = !{!"hasVersionedLoop", i1 false}
!340 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!341 = !{!"blendOptimizationMode"}
!342 = !{!"colorOutputMask"}
!343 = !{!"isBlendEnabled"}
!344 = !{!"WaDisableVRS", i1 false}
!345 = !{!"csInfo", !346, !347, !348, !349, !51, !27, !28, !350, !29, !351, !352, !353, !354, !355, !356, !357, !358, !359, !360, !361, !62, !362, !363, !364, !365}
!346 = !{!"maxWorkGroupSize", i32 0}
!347 = !{!"waveSize", i32 0}
!348 = !{!"ComputeShaderSecondCompile"}
!349 = !{!"forcedSIMDSize", i8 0}
!350 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!351 = !{!"forceSpillCompression", i1 false}
!352 = !{!"allowLowerSimd", i1 false}
!353 = !{!"disableSimd32Slicing", i1 false}
!354 = !{!"disableSplitOnSpill", i1 false}
!355 = !{!"enableNewSpillCostFunction", i1 false}
!356 = !{!"forceVISAPreSched", i1 false}
!357 = !{!"disableLocalIdOrderOptimizations", i1 false}
!358 = !{!"disableDispatchAlongY", i1 false}
!359 = !{!"neededThreadIdLayout", ptr null}
!360 = !{!"forceTileYWalk", i1 false}
!361 = !{!"atomicBranch", i32 0}
!362 = !{!"disableEarlyOut", i1 false}
!363 = !{!"walkOrderEnabled", i1 false}
!364 = !{!"walkOrderOverride", i32 0}
!365 = !{!"ResForHfPacking"}
!366 = !{!"msInfo", !367, !368, !369, !370, !371, !372, !373, !374, !375}
!367 = !{!"PrimitiveTopology", i32 3}
!368 = !{!"MaxNumOfPrimitives", i32 0}
!369 = !{!"MaxNumOfVertices", i32 0}
!370 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!371 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!372 = !{!"WorkGroupSize", i32 0}
!373 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!374 = !{!"IndexFormat", i32 6}
!375 = !{!"SubgroupSize", i32 0}
!376 = !{!"taskInfo", !377, !372, !373, !375}
!377 = !{!"MaxNumOfOutputs", i32 0}
!378 = !{!"NBarrierCnt", i32 0}
!379 = !{!"rtInfo", !380, !381, !382, !383, !384, !385, !386, !387, !388, !389, !390, !391, !392, !393, !186}
!380 = !{!"RayQueryAllocSizeInBytes", i32 0}
!381 = !{!"NumContinuations", i32 0}
!382 = !{!"RTAsyncStackAddrspace", i32 -1}
!383 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!384 = !{!"SWHotZoneAddrspace", i32 -1}
!385 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!386 = !{!"SWStackAddrspace", i32 -1}
!387 = !{!"SWStackSurfaceStateOffset", ptr null}
!388 = !{!"RTSyncStackAddrspace", i32 -1}
!389 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!390 = !{!"doSyncDispatchRays", i1 false}
!391 = !{!"MemStyle", !"Xe"}
!392 = !{!"GlobalDataStyle", !"Xe"}
!393 = !{!"uberTileDimensions", ptr null}
!394 = !{!"hasSliceLayoutDependency", i1 false}
!395 = !{!"CurUniqueIndirectIdx", i32 0}
!396 = !{!"inlineDynTextures"}
!397 = !{!"inlineResInfoData"}
!398 = !{!"immConstant", !399, !400, !401}
!399 = !{!"data"}
!400 = !{!"sizes"}
!401 = !{!"zeroIdxs"}
!402 = !{!"stringConstants"}
!403 = !{!"inlineBuffers", !404, !408, !409}
!404 = !{!"inlineBuffersVec[0]", !405, !406, !407}
!405 = !{!"alignment", i32 0}
!406 = !{!"allocSize", i64 0}
!407 = !{!"Buffer"}
!408 = !{!"inlineBuffersVec[1]", !405, !406, !407}
!409 = !{!"inlineBuffersVec[2]", !405, !406, !407}
!410 = !{!"GlobalBufferAddressRelocInfo"}
!411 = !{!"ConstantBufferAddressRelocInfo"}
!412 = !{!"forceLscCacheList"}
!413 = !{!"SrvMap"}
!414 = !{!"RasterizerOrderedByteAddressBuffer"}
!415 = !{!"RasterizerOrderedViews"}
!416 = !{!"MinNOSPushConstantSize", i32 0}
!417 = !{!"inlineProgramScopeOffsets"}
!418 = !{!"shaderData", !419}
!419 = !{!"numReplicas", i32 0}
!420 = !{!"URBInfo", !421, !422, !423}
!421 = !{!"has64BVertexHeaderInput", i1 false}
!422 = !{!"has64BVertexHeaderOutput", i1 false}
!423 = !{!"hasVertexHeader", i1 true}
!424 = !{!"UseBindlessImage", i1 true}
!425 = !{!"HasBindlessImageRead", i1 false}
!426 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!427 = !{!"enableRangeReduce", i1 false}
!428 = !{!"allowMatchMadOptimizationforVS", i1 false}
!429 = !{!"disableMatchMadOptimizationForCS", i1 false}
!430 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!431 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!432 = !{!"statefulResourcesNotAliased", i1 false}
!433 = !{!"disableMixMode", i1 false}
!434 = !{!"genericAccessesResolved", i1 false}
!435 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!436 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!437 = !{!"disableSeparateScratchWA", i1 false}
!438 = !{!"enableRemoveUnusedTGMFence", i1 false}
!439 = !{!"PrivateMemoryPerFG"}
!440 = !{!"m_OptsToDisable"}
!441 = !{!"capabilities", !442}
!442 = !{!"globalVariableDecorationsINTEL", i1 false}
!443 = !{!"extensions", !444}
!444 = !{!"spvINTELBindlessImages", i1 false}
!445 = !{!"m_ShaderResourceViewMcsMask", !446, !447}
!446 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!447 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!448 = !{!"computedDepthMode", i32 0}
!449 = !{!"isHDCFastClearShader", i1 false}
!450 = !{!"argRegisterReservations", !451}
!451 = !{!"argRegisterReservationsVec[0]", i32 0}
!452 = !{!"SIMD16_SpillThreshold", i8 0}
!453 = !{!"SIMD32_SpillThreshold", i8 0}
!454 = !{!"m_CacheControlOption", !455, !456, !457, !458}
!455 = !{!"LscLoadCacheControlOverride", i8 0}
!456 = !{!"LscStoreCacheControlOverride", i8 0}
!457 = !{!"TgmLoadCacheControlOverride", i8 0}
!458 = !{!"TgmStoreCacheControlOverride", i8 0}
!459 = !{!"ModuleUsesBindless", i1 false}
!460 = !{!"predicationMap"}
!461 = !{!"lifeTimeStartMap"}
!462 = !{!"HitGroups"}
!463 = !{i32 2, i32 0}
!464 = !{!"clang version 17.0.6"}
!465 = !{i32 1, !"wchar_size", i32 4}
!466 = !{!467, !468}
!467 = !{i32 4469}
!468 = !{i32 4470}
!469 = !{!470}
!470 = !{i32 40, i32 196620}
!471 = distinct !{!471, !472}
!472 = !{!"llvm.loop.unroll.enable"}
!473 = distinct !{!473, !472}
!474 = distinct !{!474, !472}
!475 = distinct !{!475, !472}
!476 = !{!467}
!477 = distinct !{!477, !472}
!478 = distinct !{!478, !472}
!479 = distinct !{!479, !472}
!480 = distinct !{!480, !472}
!481 = distinct !{!481, !472}
!482 = distinct !{!482, !472}
