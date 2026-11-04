; ------------------------------------------------
; OCL_asm991aa51539c7109c_afterUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::detail::half_impl::half" = type { half }

@0 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@1 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@2 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@3 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@4 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@5 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@6 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@7 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM = external addrspace(3) global [0 x i8]
@_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM = external addrspace(3) global [0 x i8]
@llvm.used = appending global [8 x ptr] [ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM to ptr), ptr addrspacecast (ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM to ptr)], section "llvm.metadata"

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE(i32 %0, ptr addrspace(3) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 1 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 4 %6, ptr addrspace(1) align 1 %7, ptr addrspace(1) align 4 %8, ptr addrspace(1) align 4 %9, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bindlessOffset, i32 %bindlessOffset8, i32 %bindlessOffset9, i32 %bindlessOffset10, i32 %bindlessOffset11, i32 %bindlessOffset12, i32 %bindlessOffset13, i32 %bindlessOffset14) #0 {
  %11 = extractelement <3 x i32> %localSize, i32 0
  %12 = extractelement <3 x i32> %localSize, i32 1
  %13 = extractelement <3 x i32> %localSize, i32 2
  %14 = extractelement <8 x i32> %r0, i32 0
  %15 = extractelement <8 x i32> %r0, i32 1
  %16 = extractelement <8 x i32> %r0, i32 2
  %17 = extractelement <8 x i32> %r0, i32 3
  %18 = extractelement <8 x i32> %r0, i32 4
  %19 = extractelement <8 x i32> %r0, i32 5
  %20 = extractelement <8 x i32> %r0, i32 6
  %21 = extractelement <8 x i32> %r0, i32 7
  %22 = alloca [8 x float], align 4, !spirv.Decorations !739
  %23 = alloca [4 x float], align 4, !spirv.Decorations !739
  %24 = alloca [4 x float], align 4, !spirv.Decorations !739
  %25 = alloca [4 x float], align 4, !spirv.Decorations !739
  %26 = zext i16 %localIdX to i32
  %27 = zext i32 %15 to i64
  %28 = icmp sgt i32 %15, -1
  call void @llvm.assume(i1 %28)
  %29 = bitcast <8 x i32> %r0 to <32 x i8>
  %30 = extractelement <32 x i8> %29, i32 0
  %31 = extractelement <32 x i8> %29, i32 1
  %32 = extractelement <32 x i8> %29, i32 2
  %33 = extractelement <32 x i8> %29, i32 3
  %34 = extractelement <32 x i8> %29, i32 4
  %35 = extractelement <32 x i8> %29, i32 5
  %36 = extractelement <32 x i8> %29, i32 6
  %37 = extractelement <32 x i8> %29, i32 7
  %38 = extractelement <32 x i8> %29, i32 8
  %39 = extractelement <32 x i8> %29, i32 9
  %40 = extractelement <32 x i8> %29, i32 10
  %41 = extractelement <32 x i8> %29, i32 11
  %42 = extractelement <32 x i8> %29, i32 12
  %43 = extractelement <32 x i8> %29, i32 13
  %44 = extractelement <32 x i8> %29, i32 14
  %45 = extractelement <32 x i8> %29, i32 15
  %46 = extractelement <32 x i8> %29, i32 16
  %47 = extractelement <32 x i8> %29, i32 17
  %48 = extractelement <32 x i8> %29, i32 18
  %49 = extractelement <32 x i8> %29, i32 19
  %50 = extractelement <32 x i8> %29, i32 20
  %51 = extractelement <32 x i8> %29, i32 21
  %52 = extractelement <32 x i8> %29, i32 22
  %53 = extractelement <32 x i8> %29, i32 23
  %54 = extractelement <32 x i8> %29, i32 24
  %55 = extractelement <32 x i8> %29, i32 25
  %56 = extractelement <32 x i8> %29, i32 26
  %57 = extractelement <32 x i8> %29, i32 27
  %58 = extractelement <32 x i8> %29, i32 28
  %59 = extractelement <32 x i8> %29, i32 29
  %60 = extractelement <32 x i8> %29, i32 30
  %61 = extractelement <32 x i8> %29, i32 31
  %localThreadId16 = zext i8 %38 to i32
  %62 = shl nuw nsw i32 %localThreadId16, 3, !spirv.Decorations !741
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %63 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %63)
  %64 = sdiv i32 %15, %0
  %freeze = freeze i32 %64
  %65 = sext i32 %freeze to i64
  %66 = shl nsw i64 %65, 6, !spirv.Decorations !741
  %67 = shl nsw i64 %65, 14, !spirv.Decorations !741
  %68 = shl nuw nsw i64 %27, 6, !spirv.Decorations !743
  %69 = shl nuw nsw i64 %27, 14, !spirv.Decorations !743
  %70 = shl nuw nsw i64 %27, 13, !spirv.Decorations !743
  %71 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %67
  %72 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %69
  %73 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %69
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %22)
  %74 = zext i32 %62 to i64
  %75 = getelementptr float, ptr addrspace(1) %5, i64 %66
  %76 = getelementptr float, ptr addrspace(1) %75, i64 %74
  br label %77

77:                                               ; preds = %84, %10
  %78 = phi i32 [ 0, %10 ], [ %89, %84 ]
  %79 = icmp ult i32 %78, 8
  br i1 %79, label %84, label %80

80:                                               ; preds = %77
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %23)
  %81 = zext i16 %simdLaneId16 to i64
  %82 = getelementptr float, ptr addrspace(1) %6, i64 %68
  %83 = getelementptr float, ptr addrspace(1) %82, i64 %81
  br label %90

84:                                               ; preds = %77
  %85 = zext i32 %78 to i64
  %86 = getelementptr inbounds float, ptr addrspace(1) %76, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = getelementptr inbounds [8 x float], ptr %22, i64 0, i64 %85
  store float %87, ptr %88, align 4
  %89 = add nuw nsw i32 %78, 1, !spirv.Decorations !743
  br label %77, !llvm.loop !745

90:                                               ; preds = %100, %80
  %91 = phi i32 [ 0, %80 ], [ %107, %100 ]
  %92 = icmp ult i32 %91, 4
  br i1 %92, label %100, label %93

93:                                               ; preds = %90
  %94 = shl nuw nsw i32 %localThreadId16, 11, !spirv.Decorations !741
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i8, ptr addrspace(1) %71, i64 %95
  %97 = getelementptr inbounds i8, ptr addrspace(1) %72, i64 4096
  %98 = getelementptr inbounds i8, ptr addrspace(1) %72, i64 8192
  %99 = getelementptr inbounds i8, ptr addrspace(1) %72, i64 12288
  br label %108

100:                                              ; preds = %90
  %101 = shl nuw nsw i32 %91, 4, !spirv.Decorations !743
  %102 = zext i32 %101 to i64
  %103 = getelementptr float, ptr addrspace(1) %83, i64 %102
  %104 = load float, ptr addrspace(1) %103, align 4
  %105 = zext i32 %91 to i64
  %106 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %105
  store float %104, ptr %106, align 4
  %107 = add nuw nsw i32 %91, 1, !spirv.Decorations !743
  br label %90, !llvm.loop !747

108:                                              ; preds = %250, %93
  %109 = phi <8 x i32> [ zeroinitializer, %93 ], [ %290, %250 ]
  %110 = phi <8 x i32> [ zeroinitializer, %93 ], [ %282, %250 ]
  %111 = phi <8 x i32> [ zeroinitializer, %93 ], [ %274, %250 ]
  %112 = phi <8 x i32> [ zeroinitializer, %93 ], [ %266, %250 ]
  %113 = phi i32 [ 0, %93 ], [ %291, %250 ]
  %114 = extractelement <8 x i32> %109, i32 0
  %115 = extractelement <8 x i32> %109, i32 1
  %116 = extractelement <8 x i32> %109, i32 2
  %117 = extractelement <8 x i32> %109, i32 3
  %118 = extractelement <8 x i32> %109, i32 4
  %119 = extractelement <8 x i32> %109, i32 5
  %120 = extractelement <8 x i32> %109, i32 6
  %121 = extractelement <8 x i32> %109, i32 7
  %122 = extractelement <8 x i32> %110, i32 0
  %123 = extractelement <8 x i32> %110, i32 1
  %124 = extractelement <8 x i32> %110, i32 2
  %125 = extractelement <8 x i32> %110, i32 3
  %126 = extractelement <8 x i32> %110, i32 4
  %127 = extractelement <8 x i32> %110, i32 5
  %128 = extractelement <8 x i32> %110, i32 6
  %129 = extractelement <8 x i32> %110, i32 7
  %130 = extractelement <8 x i32> %111, i32 0
  %131 = extractelement <8 x i32> %111, i32 1
  %132 = extractelement <8 x i32> %111, i32 2
  %133 = extractelement <8 x i32> %111, i32 3
  %134 = extractelement <8 x i32> %111, i32 4
  %135 = extractelement <8 x i32> %111, i32 5
  %136 = extractelement <8 x i32> %111, i32 6
  %137 = extractelement <8 x i32> %111, i32 7
  %138 = extractelement <8 x i32> %112, i32 0
  %139 = extractelement <8 x i32> %112, i32 1
  %140 = extractelement <8 x i32> %112, i32 2
  %141 = extractelement <8 x i32> %112, i32 3
  %142 = extractelement <8 x i32> %112, i32 4
  %143 = extractelement <8 x i32> %112, i32 5
  %144 = extractelement <8 x i32> %112, i32 6
  %145 = extractelement <8 x i32> %112, i32 7
  %146 = icmp ult i32 %113, 256
  br i1 %146, label %250, label %147

147:                                              ; preds = %108
  %148 = shl nuw nsw i32 %localThreadId16, 9, !spirv.Decorations !741
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM, i64 %149
  %151 = mul i32 %12, %11
  %152 = mul i32 %151, %13
  %153 = and i32 %152, 15
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %167, label %155

155:                                              ; preds = %147
  %localIdZ20 = zext i16 %localIdZ to i32
  %156 = mul i32 %12, %localIdZ20
  %localIdY22 = zext i16 %localIdY to i32
  %157 = add i32 %156, %localIdY22
  %158 = mul i32 %157, %11
  %localIdX24 = zext i16 %localIdX to i32
  %159 = add i32 %158, %localIdX24
  %160 = lshr i32 %159, 4
  %161 = mul i32 %12, %11
  %162 = mul i32 %161, %13
  %163 = add i32 %162, 15
  %164 = lshr i32 %163, 4
  %165 = add nsw i32 %164, -1
  %166 = icmp ult i32 %160, %165
  br i1 %166, label %167, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

167:                                              ; preds = %155, %147
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %155, %167
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %150, i32 %138)
  %168 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 64
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %168, i32 %139)
  %169 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 128
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %169, i32 %140)
  %170 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %170, i32 %141)
  %171 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 256
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %171, i32 %142)
  %172 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 320
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %172, i32 %143)
  %173 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 384
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %173, i32 %144)
  %174 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 448
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %174, i32 %145)
  %175 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 16
  %176 = mul i32 %12, %11
  %177 = mul i32 %176, %13
  %178 = and i32 %177, 15
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %192, label %180

180:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  %localIdZ31 = zext i16 %localIdZ to i32
  %181 = mul i32 %12, %localIdZ31
  %localIdY33 = zext i16 %localIdY to i32
  %182 = add i32 %181, %localIdY33
  %183 = mul i32 %182, %11
  %localIdX35 = zext i16 %localIdX to i32
  %184 = add i32 %183, %localIdX35
  %185 = lshr i32 %184, 4
  %186 = mul i32 %12, %11
  %187 = mul i32 %186, %13
  %188 = add i32 %187, 15
  %189 = lshr i32 %188, 4
  %190 = add nsw i32 %189, -1
  %191 = icmp ult i32 %185, %190
  br i1 %191, label %192, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35

192:                                              ; preds = %180, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35: ; preds = %180, %192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %175, i32 %130)
  %193 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 80
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %193, i32 %131)
  %194 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 144
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %194, i32 %132)
  %195 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 208
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %195, i32 %133)
  %196 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 272
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %196, i32 %134)
  %197 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 336
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %197, i32 %135)
  %198 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 400
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %198, i32 %136)
  %199 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 464
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %199, i32 %137)
  %200 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 32
  %201 = mul i32 %12, %11
  %202 = mul i32 %201, %13
  %203 = and i32 %202, 15
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %217, label %205

205:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35
  %localIdZ42 = zext i16 %localIdZ to i32
  %206 = mul i32 %12, %localIdZ42
  %localIdY44 = zext i16 %localIdY to i32
  %207 = add i32 %206, %localIdY44
  %208 = mul i32 %207, %11
  %localIdX46 = zext i16 %localIdX to i32
  %209 = add i32 %208, %localIdX46
  %210 = lshr i32 %209, 4
  %211 = mul i32 %12, %11
  %212 = mul i32 %211, %13
  %213 = add i32 %212, 15
  %214 = lshr i32 %213, 4
  %215 = add nsw i32 %214, -1
  %216 = icmp ult i32 %210, %215
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37

217:                                              ; preds = %205, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37: ; preds = %205, %217
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %200, i32 %122)
  %218 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 96
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %218, i32 %123)
  %219 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 160
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %219, i32 %124)
  %220 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 224
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %220, i32 %125)
  %221 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 288
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %221, i32 %126)
  %222 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 352
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %222, i32 %127)
  %223 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 416
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %223, i32 %128)
  %224 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 480
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %224, i32 %129)
  %225 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 48
  %226 = mul i32 %12, %11
  %227 = mul i32 %226, %13
  %228 = and i32 %227, 15
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %242, label %230

230:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37
  %localIdZ53 = zext i16 %localIdZ to i32
  %231 = mul i32 %12, %localIdZ53
  %localIdY55 = zext i16 %localIdY to i32
  %232 = add i32 %231, %localIdY55
  %233 = mul i32 %232, %11
  %localIdX57 = zext i16 %localIdX to i32
  %234 = add i32 %233, %localIdX57
  %235 = lshr i32 %234, 4
  %236 = mul i32 %12, %11
  %237 = mul i32 %236, %13
  %238 = add i32 %237, 15
  %239 = lshr i32 %238, 4
  %240 = add nsw i32 %239, -1
  %241 = icmp ult i32 %235, %240
  br i1 %241, label %242, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39

242:                                              ; preds = %230, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39: ; preds = %230, %242
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %225, i32 %114)
  %243 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 112
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %243, i32 %115)
  %244 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 176
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %244, i32 %116)
  %245 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 240
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %245, i32 %117)
  %246 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 304
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %246, i32 %118)
  %247 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 368
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %247, i32 %119)
  %248 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 432
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %248, i32 %120)
  %249 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 496
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %249, i32 %121)
  call void @llvm.genx.GenISA.wavebarrier()
  br label %292

250:                                              ; preds = %108
  %251 = zext i32 %113 to i64
  %252 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 %251
  %.ascast.i40 = addrspacecast ptr addrspace(1) %252 to ptr addrspace(4)
  %253 = ptrtoint ptr addrspace(4) %.ascast.i40 to i64
  %254 = and i64 %253, -64
  %255 = trunc i64 %253 to i32
  %256 = lshr i32 %255, 1
  %257 = and i32 %256, 31
  %258 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %254, i32 255, i32 7, i32 255, i32 %257, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %259 = getelementptr inbounds i8, ptr addrspace(1) %72, i64 %251
  %.ascast.i41 = addrspacecast ptr addrspace(1) %259 to ptr addrspace(4)
  %260 = ptrtoint ptr addrspace(4) %.ascast.i41 to i64
  %261 = and i64 %260, -64
  %262 = trunc i64 %260 to i32
  %263 = lshr i32 %262, 2
  %264 = and i32 %263, 15
  %265 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %261, i32 255, i32 15, i32 255, i32 %264, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %266 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %112, <8 x i16> %258, <8 x i32> %265, i32 4, i32 4, i32 8, i32 8, i1 false)
  %267 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 %251
  %.ascast.i42 = addrspacecast ptr addrspace(1) %267 to ptr addrspace(4)
  %268 = ptrtoint ptr addrspace(4) %.ascast.i42 to i64
  %269 = and i64 %268, -64
  %270 = trunc i64 %268 to i32
  %271 = lshr i32 %270, 2
  %272 = and i32 %271, 15
  %273 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %269, i32 255, i32 15, i32 255, i32 %272, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %274 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %111, <8 x i16> %258, <8 x i32> %273, i32 4, i32 4, i32 8, i32 8, i1 false)
  %275 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 %251
  %.ascast.i43 = addrspacecast ptr addrspace(1) %275 to ptr addrspace(4)
  %276 = ptrtoint ptr addrspace(4) %.ascast.i43 to i64
  %277 = and i64 %276, -64
  %278 = trunc i64 %276 to i32
  %279 = lshr i32 %278, 2
  %280 = and i32 %279, 15
  %281 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %277, i32 255, i32 15, i32 255, i32 %280, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %282 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %110, <8 x i16> %258, <8 x i32> %281, i32 4, i32 4, i32 8, i32 8, i1 false)
  %283 = getelementptr inbounds i8, ptr addrspace(1) %99, i64 %251
  %.ascast.i44 = addrspacecast ptr addrspace(1) %283 to ptr addrspace(4)
  %284 = ptrtoint ptr addrspace(4) %.ascast.i44 to i64
  %285 = and i64 %284, -64
  %286 = trunc i64 %284 to i32
  %287 = lshr i32 %286, 2
  %288 = and i32 %287, 15
  %289 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %285, i32 255, i32 15, i32 255, i32 %288, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %290 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %109, <8 x i16> %258, <8 x i32> %289, i32 4, i32 4, i32 8, i32 8, i1 false)
  %291 = add nuw nsw i32 %113, 32, !spirv.Decorations !743
  br label %108

292:                                              ; preds = %382, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39
  %293 = phi i32 [ 0, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39 ], [ %383, %382 ]
  %294 = icmp ult i32 %293, 8
  br i1 %294, label %318, label %295

295:                                              ; preds = %292
  call void @llvm.genx.GenISA.wavebarrier()
  %296 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %70
  %297 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %68
  %298 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %68
  %299 = lshr i32 %26, 1
  %300 = and i32 %26, 1
  %301 = zext i32 %299 to i64
  %302 = getelementptr inbounds float, ptr addrspace(1) %297, i64 %301
  %303 = getelementptr inbounds float, ptr addrspace(1) %298, i64 %301
  %304 = shl nuw nsw i32 %300, 5, !spirv.Decorations !743
  %305 = shl nuw nsw i64 %301, 7, !spirv.Decorations !743
  %306 = getelementptr inbounds i8, ptr addrspace(1) %296, i64 %305
  %307 = shl nuw nsw i32 %299, 7, !spirv.Decorations !741
  %308 = zext i32 %307 to i64
  %309 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM, i64 %308
  %310 = shl nuw nsw i32 %300, 6, !spirv.Decorations !743
  %311 = zext i32 %310 to i64
  %312 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %309, i64 %311
  %313 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM, i64 0, i64 16384
  %314 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %313, i64 %149
  %315 = shl nuw nsw i32 %localThreadId16, 11, !spirv.Decorations !741
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %73, i64 %316
  br label %397

318:                                              ; preds = %292
  %319 = or i32 %62, %293
  %320 = zext i32 %293 to i64
  %321 = getelementptr inbounds [8 x float], ptr %22, i64 0, i64 %320
  %322 = load float, ptr %321, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %24)
  %323 = shl nsw i32 %319, 6, !spirv.Decorations !741
  br label %324

324:                                              ; preds = %330, %318
  %325 = phi float [ 0xFFF0000000000000, %318 ], [ %345, %330 ]
  %326 = phi i32 [ 0, %318 ], [ %346, %330 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %330, label %328

328:                                              ; preds = %324
  %329 = call float @llvm.genx.GenISA.WaveAll.f32(float %325, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %25)
  br label %347

330:                                              ; preds = %324
  %331 = shl nuw nsw i32 %326, 4, !spirv.Decorations !743
  %332 = or i32 %323, %331
  %333 = add nuw nsw i32 %332, %simdLaneId, !spirv.Decorations !743
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM, i64 %334
  %336 = load i32, ptr addrspace(3) %335, align 4
  %337 = sitofp i32 %336 to float
  %338 = fmul reassoc nsz arcp contract float %322, %337, !spirv.Decorations !748
  %339 = zext i32 %326 to i64
  %340 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = fmul reassoc nsz arcp contract float %338, %341, !spirv.Decorations !748
  %343 = fmul reassoc nsz arcp contract float %342, 6.250000e-02, !spirv.Decorations !748
  %344 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %339
  store float %343, ptr %344, align 4
  %345 = call float @llvm.maxnum.f32(float %325, float %343)
  %346 = add nuw nsw i32 %326, 1, !spirv.Decorations !743
  br label %324

347:                                              ; preds = %354, %328
  %348 = phi float [ 0.000000e+00, %328 ], [ %372, %354 ]
  %349 = phi i32 [ 0, %328 ], [ %373, %354 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %354, label %351

351:                                              ; preds = %347
  %352 = call float @llvm.genx.GenISA.WaveAll.f32(float %348, i8 9, i1 true, i32 0)
  %353 = fcmp reassoc nsz arcp contract oeq float %352, 0.000000e+00, !spirv.Decorations !748
  br i1 %353, label %376, label %374

354:                                              ; preds = %347
  %355 = zext i32 %349 to i64
  %356 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %355
  %357 = load float, ptr %356, align 4
  %358 = fsub reassoc nsz arcp contract float %357, %329, !spirv.Decorations !748
  %359 = fmul float %358, 0x3FF7154760000000
  %360 = call float @llvm.trunc.f32(float %359)
  %361 = call float @llvm.fma.f32(float %360, float 0xBFE62E4000000000, float %358)
  %362 = call float @llvm.fma.f32(float %360, float 0xBEB7F7D1C0000000, float %361)
  %363 = fmul float %362, 0x3FF7154760000000
  %364 = call float @llvm.exp2.f32(float %360)
  %365 = call float @llvm.exp2.f32(float %363)
  %366 = fmul float %364, %365
  %367 = fcmp olt float %358, -1.050000e+02
  %368 = select i1 %367, float 0.000000e+00, float %366
  %369 = fcmp ogt float %358, 1.050000e+02
  %370 = select i1 %369, float 0x7FF0000000000000, float %368
  %371 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %355
  store float %370, ptr %371, align 4
  %372 = fadd reassoc nsz arcp contract float %348, %370, !spirv.Decorations !748
  %373 = add nuw nsw i32 %349, 1, !spirv.Decorations !743
  br label %347

374:                                              ; preds = %351
  %375 = fdiv reassoc nsz arcp contract float 1.000000e+00, %352, !spirv.Decorations !748
  br label %376

376:                                              ; preds = %374, %351
  %377 = phi float [ %375, %374 ], [ 0.000000e+00, %351 ]
  %378 = shl nsw i32 %319, 6, !spirv.Decorations !741
  br label %379

379:                                              ; preds = %384, %376
  %380 = phi i32 [ 0, %376 ], [ %396, %384 ]
  %381 = icmp ult i32 %380, 4
  br i1 %381, label %384, label %382

382:                                              ; preds = %379
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %25)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %24)
  %383 = add nuw nsw i32 %293, 1, !spirv.Decorations !743
  br label %292

384:                                              ; preds = %379
  %385 = zext i32 %380 to i64
  %386 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %385
  %387 = load float, ptr %386, align 4
  %388 = fmul reassoc nsz arcp contract float %387, %377, !spirv.Decorations !748
  %389 = fptrunc float %388 to half
  %390 = shl nuw nsw i32 %380, 4, !spirv.Decorations !743
  %391 = or i32 %378, %390
  %392 = add nuw nsw i32 %391, %simdLaneId, !spirv.Decorations !743
  %393 = zext i32 %392 to i64
  %394 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM, i64 0, i64 16384
  %395 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %394, i64 %393
  store half %389, ptr addrspace(3) %395, align 2
  %396 = add nuw nsw i32 %380, 1, !spirv.Decorations !743
  br label %379

397:                                              ; preds = %941, %295
  %.0195121 = phi i16 [ undef, %295 ], [ %.1196161, %941 ]
  %.0195122 = phi i16 [ undef, %295 ], [ %.1196162, %941 ]
  %.0195123 = phi i16 [ undef, %295 ], [ %.1196163, %941 ]
  %.0195124 = phi i16 [ undef, %295 ], [ %.1196164, %941 ]
  %.0195125 = phi i16 [ undef, %295 ], [ %.1196165, %941 ]
  %.0195126 = phi i16 [ undef, %295 ], [ %.1196166, %941 ]
  %.0195127 = phi i16 [ undef, %295 ], [ %.1196167, %941 ]
  %.0195128 = phi i16 [ undef, %295 ], [ %.1196168, %941 ]
  %.0192129 = phi i32 [ undef, %295 ], [ %.1193169, %941 ]
  %.0192130 = phi i32 [ undef, %295 ], [ %.1193170, %941 ]
  %.0192131 = phi i32 [ undef, %295 ], [ %.1193171, %941 ]
  %.0192132 = phi i32 [ undef, %295 ], [ %.1193172, %941 ]
  %.0192133 = phi i32 [ undef, %295 ], [ %.1193173, %941 ]
  %.0192134 = phi i32 [ undef, %295 ], [ %.1193174, %941 ]
  %.0192135 = phi i32 [ undef, %295 ], [ %.1193175, %941 ]
  %.0192136 = phi i32 [ undef, %295 ], [ %.1193176, %941 ]
  %.0189137 = phi i32 [ undef, %295 ], [ %.1190177, %941 ]
  %.0189138 = phi i32 [ undef, %295 ], [ %.1190178, %941 ]
  %.0189139 = phi i32 [ undef, %295 ], [ %.1190179, %941 ]
  %.0189140 = phi i32 [ undef, %295 ], [ %.1190180, %941 ]
  %.0189141 = phi i32 [ undef, %295 ], [ %.1190181, %941 ]
  %.0189142 = phi i32 [ undef, %295 ], [ %.1190182, %941 ]
  %.0189143 = phi i32 [ undef, %295 ], [ %.1190183, %941 ]
  %.0189144 = phi i32 [ undef, %295 ], [ %.1190184, %941 ]
  %.0186145 = phi i32 [ undef, %295 ], [ %.1187185, %941 ]
  %.0186146 = phi i32 [ undef, %295 ], [ %.1187186, %941 ]
  %.0186147 = phi i32 [ undef, %295 ], [ %.1187187, %941 ]
  %.0186148 = phi i32 [ undef, %295 ], [ %.1187188, %941 ]
  %.0186149 = phi i32 [ undef, %295 ], [ %.1187189, %941 ]
  %.0186150 = phi i32 [ undef, %295 ], [ %.1187190, %941 ]
  %.0186151 = phi i32 [ undef, %295 ], [ %.1187191, %941 ]
  %.0186152 = phi i32 [ undef, %295 ], [ %.1187192, %941 ]
  %.0153 = phi i32 [ undef, %295 ], [ %.1194, %941 ]
  %.0154 = phi i32 [ undef, %295 ], [ %.1195, %941 ]
  %.0155 = phi i32 [ undef, %295 ], [ %.1197, %941 ]
  %.0156 = phi i32 [ undef, %295 ], [ %.1198, %941 ]
  %.0157 = phi i32 [ undef, %295 ], [ %.1199, %941 ]
  %.0158 = phi i32 [ undef, %295 ], [ %.1200, %941 ]
  %.0159 = phi i32 [ undef, %295 ], [ %.1201, %941 ]
  %.0160 = phi i32 [ undef, %295 ], [ %.1202, %941 ]
  %398 = phi i32 [ 0, %295 ], [ %448, %941 ]
  %399 = icmp ult i32 %398, 256
  br i1 %399, label %400, label %942

400:                                              ; preds = %397
  %401 = load float, ptr addrspace(1) %302, align 4
  %402 = load float, ptr addrspace(1) %303, align 4
  %403 = lshr exact i32 %398, 1
  %404 = or i32 %403, %304
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds i8, ptr addrspace(1) %306, i64 %405
  br label %407

407:                                              ; preds = %417, %400
  %408 = phi i32 [ 0, %400 ], [ %418, %417 ]
  %409 = icmp ult i32 %408, 32
  br i1 %409, label %410, label %441

410:                                              ; preds = %407
  %411 = zext i32 %408 to i64
  %412 = getelementptr inbounds i8, ptr addrspace(1) %406, i64 %411
  %413 = load i64, ptr addrspace(1) %412, align 1
  br label %414

414:                                              ; preds = %419, %410
  %415 = phi i32 [ 0, %410 ], [ %440, %419 ]
  %416 = icmp ult i32 %415, 8
  br i1 %416, label %419, label %417

417:                                              ; preds = %414
  %418 = add nuw nsw i32 %408, 8, !spirv.Decorations !743
  br label %407, !llvm.loop !750

419:                                              ; preds = %414
  %420 = shl nuw nsw i32 %415, 3, !spirv.Decorations !743
  %421 = zext i32 %420 to i64
  %422 = lshr i64 %413, %421
  %423 = trunc i64 %422 to i32
  %424 = and i32 %423, 15
  %425 = uitofp i32 %424 to float
  %426 = fsub reassoc nsz arcp contract float %425, %402, !spirv.Decorations !748
  %427 = fmul reassoc nsz arcp contract float %426, %401, !spirv.Decorations !748
  %428 = fptrunc float %427 to half
  %429 = or i32 %408, %415
  %430 = shl nuw nsw i32 %429, 1, !spirv.Decorations !743
  %431 = zext i32 %430 to i64
  %432 = getelementptr half, ptr addrspace(3) %312, i64 %431
  store half %428, ptr addrspace(3) %432, align 4
  %433 = lshr i32 %423, 4
  %434 = and i32 %433, 15
  %435 = uitofp i32 %434 to float
  %436 = fsub reassoc nsz arcp contract float %435, %402, !spirv.Decorations !748
  %437 = fmul reassoc nsz arcp contract float %436, %401, !spirv.Decorations !748
  %438 = fptrunc float %437 to half
  %439 = getelementptr half, ptr addrspace(3) %432, i64 1
  store half %438, ptr addrspace(3) %439, align 2
  %440 = add nuw nsw i32 %415, 1, !spirv.Decorations !743
  br label %414, !llvm.loop !751

441:                                              ; preds = %407
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %442 = zext i32 %398 to i64
  %443 = getelementptr inbounds float, ptr addrspace(1) %317, i64 %442
  br label %444

444:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51, %441
  %.1196161 = phi i16 [ %.0195121, %441 ], [ %.2197203, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196162 = phi i16 [ %.0195122, %441 ], [ %.2197204, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196163 = phi i16 [ %.0195123, %441 ], [ %.2197205, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196164 = phi i16 [ %.0195124, %441 ], [ %.2197206, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196165 = phi i16 [ %.0195125, %441 ], [ %.2197207, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196166 = phi i16 [ %.0195126, %441 ], [ %.2197208, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196167 = phi i16 [ %.0195127, %441 ], [ %.2197209, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196168 = phi i16 [ %.0195128, %441 ], [ %.2197210, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193169 = phi i32 [ %.0192129, %441 ], [ %.2194211, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193170 = phi i32 [ %.0192130, %441 ], [ %.2194212, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193171 = phi i32 [ %.0192131, %441 ], [ %.2194213, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193172 = phi i32 [ %.0192132, %441 ], [ %.2194214, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193173 = phi i32 [ %.0192133, %441 ], [ %.2194215, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193174 = phi i32 [ %.0192134, %441 ], [ %.2194216, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193175 = phi i32 [ %.0192135, %441 ], [ %.2194217, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193176 = phi i32 [ %.0192136, %441 ], [ %.2194218, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190177 = phi i32 [ %.0189137, %441 ], [ %.2191219, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190178 = phi i32 [ %.0189138, %441 ], [ %.2191220, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190179 = phi i32 [ %.0189139, %441 ], [ %.2191221, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190180 = phi i32 [ %.0189140, %441 ], [ %.2191222, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190181 = phi i32 [ %.0189141, %441 ], [ %.2191223, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190182 = phi i32 [ %.0189142, %441 ], [ %.2191224, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190183 = phi i32 [ %.0189143, %441 ], [ %.2191225, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190184 = phi i32 [ %.0189144, %441 ], [ %.2191226, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187185 = phi i32 [ %.0186145, %441 ], [ %.2188227, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187186 = phi i32 [ %.0186146, %441 ], [ %.2188228, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187187 = phi i32 [ %.0186147, %441 ], [ %.2188229, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187188 = phi i32 [ %.0186148, %441 ], [ %.2188230, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187189 = phi i32 [ %.0186149, %441 ], [ %.2188231, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187190 = phi i32 [ %.0186150, %441 ], [ %.2188232, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187191 = phi i32 [ %.0186151, %441 ], [ %.2188233, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187192 = phi i32 [ %.0186152, %441 ], [ %.2188234, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1194 = phi i32 [ %.0153, %441 ], [ %.2235, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195 = phi i32 [ %.0154, %441 ], [ %.2236, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1197 = phi i32 [ %.0155, %441 ], [ %.2237, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1198 = phi i32 [ %.0156, %441 ], [ %.2238, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199 = phi i32 [ %.0157, %441 ], [ %.2239, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1200 = phi i32 [ %.0158, %441 ], [ %.2240, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1201 = phi i32 [ %.0159, %441 ], [ %.2241, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1202 = phi i32 [ %.0160, %441 ], [ %.2242, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %445 = phi i32 [ 0, %441 ], [ %650, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %446 = icmp ult i32 %445, 128
  br i1 %446, label %450, label %447

447:                                              ; preds = %444
  %448 = add nuw nsw i32 %398, 128, !spirv.Decorations !743
  %449 = icmp eq i32 %398, 0
  br i1 %449, label %940, label %941

450:                                              ; preds = %444
  %451 = zext i32 %445 to i64
  %452 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM, i64 %451
  br label %453

453:                                              ; preds = %651, %450
  %.2197203 = phi i16 [ %.1196161, %450 ], [ %654, %651 ]
  %.2197204 = phi i16 [ %.1196162, %450 ], [ %656, %651 ]
  %.2197205 = phi i16 [ %.1196163, %450 ], [ %658, %651 ]
  %.2197206 = phi i16 [ %.1196164, %450 ], [ %660, %651 ]
  %.2197207 = phi i16 [ %.1196165, %450 ], [ %662, %651 ]
  %.2197208 = phi i16 [ %.1196166, %450 ], [ %664, %651 ]
  %.2197209 = phi i16 [ %.1196167, %450 ], [ %666, %651 ]
  %.2197210 = phi i16 [ %.1196168, %450 ], [ %668, %651 ]
  %.2194211 = phi i32 [ %.1193169, %450 ], [ %880, %651 ]
  %.2194212 = phi i32 [ %.1193170, %450 ], [ %887, %651 ]
  %.2194213 = phi i32 [ %.1193171, %450 ], [ %894, %651 ]
  %.2194214 = phi i32 [ %.1193172, %450 ], [ %901, %651 ]
  %.2194215 = phi i32 [ %.1193173, %450 ], [ %908, %651 ]
  %.2194216 = phi i32 [ %.1193174, %450 ], [ %915, %651 ]
  %.2194217 = phi i32 [ %.1193175, %450 ], [ %922, %651 ]
  %.2194218 = phi i32 [ %.1193176, %450 ], [ %929, %651 ]
  %.2191219 = phi i32 [ %.1190177, %450 ], [ %815, %651 ]
  %.2191220 = phi i32 [ %.1190178, %450 ], [ %822, %651 ]
  %.2191221 = phi i32 [ %.1190179, %450 ], [ %829, %651 ]
  %.2191222 = phi i32 [ %.1190180, %450 ], [ %836, %651 ]
  %.2191223 = phi i32 [ %.1190181, %450 ], [ %843, %651 ]
  %.2191224 = phi i32 [ %.1190182, %450 ], [ %850, %651 ]
  %.2191225 = phi i32 [ %.1190183, %450 ], [ %857, %651 ]
  %.2191226 = phi i32 [ %.1190184, %450 ], [ %864, %651 ]
  %.2188227 = phi i32 [ %.1187185, %450 ], [ %750, %651 ]
  %.2188228 = phi i32 [ %.1187186, %450 ], [ %757, %651 ]
  %.2188229 = phi i32 [ %.1187187, %450 ], [ %764, %651 ]
  %.2188230 = phi i32 [ %.1187188, %450 ], [ %771, %651 ]
  %.2188231 = phi i32 [ %.1187189, %450 ], [ %778, %651 ]
  %.2188232 = phi i32 [ %.1187190, %450 ], [ %785, %651 ]
  %.2188233 = phi i32 [ %.1187191, %450 ], [ %792, %651 ]
  %.2188234 = phi i32 [ %.1187192, %450 ], [ %799, %651 ]
  %.2235 = phi i32 [ %.1194, %450 ], [ %685, %651 ]
  %.2236 = phi i32 [ %.1195, %450 ], [ %692, %651 ]
  %.2237 = phi i32 [ %.1197, %450 ], [ %699, %651 ]
  %.2238 = phi i32 [ %.1198, %450 ], [ %706, %651 ]
  %.2239 = phi i32 [ %.1199, %450 ], [ %713, %651 ]
  %.2240 = phi i32 [ %.1200, %450 ], [ %720, %651 ]
  %.2241 = phi i32 [ %.1201, %450 ], [ %727, %651 ]
  %.2242 = phi i32 [ %.1202, %450 ], [ %734, %651 ]
  %454 = phi <8 x float> [ zeroinitializer, %450 ], [ %938, %651 ]
  %455 = phi <8 x float> [ zeroinitializer, %450 ], [ %873, %651 ]
  %456 = phi <8 x float> [ zeroinitializer, %450 ], [ %808, %651 ]
  %457 = phi <8 x float> [ zeroinitializer, %450 ], [ %743, %651 ]
  %458 = phi i32 [ 0, %450 ], [ %939, %651 ]
  %459 = extractelement <8 x float> %454, i32 0
  %460 = extractelement <8 x float> %454, i32 1
  %461 = extractelement <8 x float> %454, i32 2
  %462 = extractelement <8 x float> %454, i32 3
  %463 = extractelement <8 x float> %454, i32 4
  %464 = extractelement <8 x float> %454, i32 5
  %465 = extractelement <8 x float> %454, i32 6
  %466 = extractelement <8 x float> %454, i32 7
  %467 = extractelement <8 x float> %455, i32 0
  %468 = extractelement <8 x float> %455, i32 1
  %469 = extractelement <8 x float> %455, i32 2
  %470 = extractelement <8 x float> %455, i32 3
  %471 = extractelement <8 x float> %455, i32 4
  %472 = extractelement <8 x float> %455, i32 5
  %473 = extractelement <8 x float> %455, i32 6
  %474 = extractelement <8 x float> %455, i32 7
  %475 = extractelement <8 x float> %456, i32 0
  %476 = extractelement <8 x float> %456, i32 1
  %477 = extractelement <8 x float> %456, i32 2
  %478 = extractelement <8 x float> %456, i32 3
  %479 = extractelement <8 x float> %456, i32 4
  %480 = extractelement <8 x float> %456, i32 5
  %481 = extractelement <8 x float> %456, i32 6
  %482 = extractelement <8 x float> %456, i32 7
  %483 = extractelement <8 x float> %457, i32 0
  %484 = extractelement <8 x float> %457, i32 1
  %485 = extractelement <8 x float> %457, i32 2
  %486 = extractelement <8 x float> %457, i32 3
  %487 = extractelement <8 x float> %457, i32 4
  %488 = extractelement <8 x float> %457, i32 5
  %489 = extractelement <8 x float> %457, i32 6
  %490 = extractelement <8 x float> %457, i32 7
  %491 = icmp ult i32 %458, 64
  br i1 %491, label %651, label %492

492:                                              ; preds = %453
  %493 = zext i32 %445 to i64
  %494 = getelementptr inbounds float, ptr addrspace(1) %443, i64 %493
  %495 = bitcast float %483 to i32
  %496 = bitcast float %484 to i32
  %497 = bitcast float %485 to i32
  %498 = bitcast float %486 to i32
  %499 = bitcast float %487 to i32
  %500 = bitcast float %488 to i32
  %501 = bitcast float %489 to i32
  %502 = bitcast float %490 to i32
  %503 = insertelement <8 x i32> undef, i32 %495, i32 0
  %504 = insertelement <8 x i32> %503, i32 %496, i32 1
  %505 = insertelement <8 x i32> %504, i32 %497, i32 2
  %506 = insertelement <8 x i32> %505, i32 %498, i32 3
  %507 = insertelement <8 x i32> %506, i32 %499, i32 4
  %508 = insertelement <8 x i32> %507, i32 %500, i32 5
  %509 = insertelement <8 x i32> %508, i32 %501, i32 6
  %510 = insertelement <8 x i32> %509, i32 %502, i32 7
  %.ascast.i45 = addrspacecast ptr addrspace(1) %494 to ptr addrspace(4)
  %511 = mul i32 %12, %11
  %512 = mul i32 %511, %13
  %513 = and i32 %512, 15
  %514 = icmp eq i32 %513, 0
  br i1 %514, label %527, label %515

515:                                              ; preds = %492
  %localIdZ64 = zext i16 %localIdZ to i32
  %516 = mul i32 %12, %localIdZ64
  %localIdY66 = zext i16 %localIdY to i32
  %517 = add i32 %516, %localIdY66
  %518 = mul i32 %517, %11
  %localIdX68 = zext i16 %localIdX to i32
  %519 = add i32 %518, %localIdX68
  %520 = lshr i32 %519, 4
  %521 = mul i32 %12, %11
  %522 = mul i32 %521, %13
  %523 = add i32 %522, 15
  %524 = lshr i32 %523, 4
  %525 = add nsw i32 %524, -1
  %526 = icmp ult i32 %520, %525
  br i1 %526, label %527, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

527:                                              ; preds = %515, %492
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %515, %527
  %528 = ptrtoint ptr addrspace(4) %.ascast.i45 to i64
  %529 = and i64 %528, -64
  %530 = trunc i64 %528 to i32
  %531 = lshr i32 %530, 2
  %532 = and i32 %531, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %529, i32 1023, i32 7, i32 1023, i32 %532, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %510)
  %533 = getelementptr inbounds float, ptr addrspace(1) %494, i64 16
  %534 = bitcast float %475 to i32
  %535 = bitcast float %476 to i32
  %536 = bitcast float %477 to i32
  %537 = bitcast float %478 to i32
  %538 = bitcast float %479 to i32
  %539 = bitcast float %480 to i32
  %540 = bitcast float %481 to i32
  %541 = bitcast float %482 to i32
  %542 = insertelement <8 x i32> undef, i32 %534, i32 0
  %543 = insertelement <8 x i32> %542, i32 %535, i32 1
  %544 = insertelement <8 x i32> %543, i32 %536, i32 2
  %545 = insertelement <8 x i32> %544, i32 %537, i32 3
  %546 = insertelement <8 x i32> %545, i32 %538, i32 4
  %547 = insertelement <8 x i32> %546, i32 %539, i32 5
  %548 = insertelement <8 x i32> %547, i32 %540, i32 6
  %549 = insertelement <8 x i32> %548, i32 %541, i32 7
  %.ascast.i46 = addrspacecast ptr addrspace(1) %533 to ptr addrspace(4)
  %550 = mul i32 %12, %11
  %551 = mul i32 %550, %13
  %552 = and i32 %551, 15
  %553 = icmp eq i32 %552, 0
  br i1 %553, label %566, label %554

554:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  %localIdZ75 = zext i16 %localIdZ to i32
  %555 = mul i32 %12, %localIdZ75
  %localIdY77 = zext i16 %localIdY to i32
  %556 = add i32 %555, %localIdY77
  %557 = mul i32 %556, %11
  %localIdX79 = zext i16 %localIdX to i32
  %558 = add i32 %557, %localIdX79
  %559 = lshr i32 %558, 4
  %560 = mul i32 %12, %11
  %561 = mul i32 %560, %13
  %562 = add i32 %561, 15
  %563 = lshr i32 %562, 4
  %564 = add nsw i32 %563, -1
  %565 = icmp ult i32 %559, %564
  br i1 %565, label %566, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47

566:                                              ; preds = %554, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47: ; preds = %554, %566
  %567 = ptrtoint ptr addrspace(4) %.ascast.i46 to i64
  %568 = and i64 %567, -64
  %569 = trunc i64 %567 to i32
  %570 = lshr i32 %569, 2
  %571 = and i32 %570, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %568, i32 1023, i32 7, i32 1023, i32 %571, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %549)
  %572 = getelementptr inbounds float, ptr addrspace(1) %494, i64 32
  %573 = bitcast float %467 to i32
  %574 = bitcast float %468 to i32
  %575 = bitcast float %469 to i32
  %576 = bitcast float %470 to i32
  %577 = bitcast float %471 to i32
  %578 = bitcast float %472 to i32
  %579 = bitcast float %473 to i32
  %580 = bitcast float %474 to i32
  %581 = insertelement <8 x i32> undef, i32 %573, i32 0
  %582 = insertelement <8 x i32> %581, i32 %574, i32 1
  %583 = insertelement <8 x i32> %582, i32 %575, i32 2
  %584 = insertelement <8 x i32> %583, i32 %576, i32 3
  %585 = insertelement <8 x i32> %584, i32 %577, i32 4
  %586 = insertelement <8 x i32> %585, i32 %578, i32 5
  %587 = insertelement <8 x i32> %586, i32 %579, i32 6
  %588 = insertelement <8 x i32> %587, i32 %580, i32 7
  %.ascast.i48 = addrspacecast ptr addrspace(1) %572 to ptr addrspace(4)
  %589 = mul i32 %12, %11
  %590 = mul i32 %589, %13
  %591 = and i32 %590, 15
  %592 = icmp eq i32 %591, 0
  br i1 %592, label %605, label %593

593:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47
  %localIdZ86 = zext i16 %localIdZ to i32
  %594 = mul i32 %12, %localIdZ86
  %localIdY88 = zext i16 %localIdY to i32
  %595 = add i32 %594, %localIdY88
  %596 = mul i32 %595, %11
  %localIdX90 = zext i16 %localIdX to i32
  %597 = add i32 %596, %localIdX90
  %598 = lshr i32 %597, 4
  %599 = mul i32 %12, %11
  %600 = mul i32 %599, %13
  %601 = add i32 %600, 15
  %602 = lshr i32 %601, 4
  %603 = add nsw i32 %602, -1
  %604 = icmp ult i32 %598, %603
  br i1 %604, label %605, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49

605:                                              ; preds = %593, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49: ; preds = %593, %605
  %606 = ptrtoint ptr addrspace(4) %.ascast.i48 to i64
  %607 = and i64 %606, -64
  %608 = trunc i64 %606 to i32
  %609 = lshr i32 %608, 2
  %610 = and i32 %609, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %607, i32 1023, i32 7, i32 1023, i32 %610, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %588)
  %611 = getelementptr inbounds float, ptr addrspace(1) %494, i64 48
  %612 = bitcast float %459 to i32
  %613 = bitcast float %460 to i32
  %614 = bitcast float %461 to i32
  %615 = bitcast float %462 to i32
  %616 = bitcast float %463 to i32
  %617 = bitcast float %464 to i32
  %618 = bitcast float %465 to i32
  %619 = bitcast float %466 to i32
  %620 = insertelement <8 x i32> undef, i32 %612, i32 0
  %621 = insertelement <8 x i32> %620, i32 %613, i32 1
  %622 = insertelement <8 x i32> %621, i32 %614, i32 2
  %623 = insertelement <8 x i32> %622, i32 %615, i32 3
  %624 = insertelement <8 x i32> %623, i32 %616, i32 4
  %625 = insertelement <8 x i32> %624, i32 %617, i32 5
  %626 = insertelement <8 x i32> %625, i32 %618, i32 6
  %627 = insertelement <8 x i32> %626, i32 %619, i32 7
  %.ascast.i50 = addrspacecast ptr addrspace(1) %611 to ptr addrspace(4)
  %628 = mul i32 %12, %11
  %629 = mul i32 %628, %13
  %630 = and i32 %629, 15
  %631 = icmp eq i32 %630, 0
  br i1 %631, label %644, label %632

632:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49
  %localIdZ97 = zext i16 %localIdZ to i32
  %633 = mul i32 %12, %localIdZ97
  %localIdY99 = zext i16 %localIdY to i32
  %634 = add i32 %633, %localIdY99
  %635 = mul i32 %634, %11
  %localIdX101 = zext i16 %localIdX to i32
  %636 = add i32 %635, %localIdX101
  %637 = lshr i32 %636, 4
  %638 = mul i32 %12, %11
  %639 = mul i32 %638, %13
  %640 = add i32 %639, 15
  %641 = lshr i32 %640, 4
  %642 = add nsw i32 %641, -1
  %643 = icmp ult i32 %637, %642
  br i1 %643, label %644, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51

644:                                              ; preds = %632, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51: ; preds = %632, %644
  %645 = ptrtoint ptr addrspace(4) %.ascast.i50 to i64
  %646 = and i64 %645, -64
  %647 = trunc i64 %645 to i32
  %648 = lshr i32 %647, 2
  %649 = and i32 %648, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %646, i32 1023, i32 7, i32 1023, i32 %649, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %627)
  %650 = add nuw nsw i32 %445, 64, !spirv.Decorations !743
  br label %444

651:                                              ; preds = %453
  %652 = zext i32 %458 to i64
  %653 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %314, i64 %652
  %654 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %653)
  %655 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 64
  %656 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %655)
  %657 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 128
  %658 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %657)
  %659 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 192
  %660 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %659)
  %661 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 256
  %662 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %661)
  %663 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 320
  %664 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %663)
  %665 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 384
  %666 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %665)
  %667 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 448
  %668 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %667)
  %669 = insertelement <8 x i16> undef, i16 %654, i32 0
  %670 = insertelement <8 x i16> %669, i16 %656, i32 1
  %671 = insertelement <8 x i16> %670, i16 %658, i32 2
  %672 = insertelement <8 x i16> %671, i16 %660, i32 3
  %673 = insertelement <8 x i16> %672, i16 %662, i32 4
  %674 = insertelement <8 x i16> %673, i16 %664, i32 5
  %675 = insertelement <8 x i16> %674, i16 %666, i32 6
  %676 = insertelement <8 x i16> %675, i16 %668, i32 7
  %677 = shl nuw nsw i32 %458, 7, !spirv.Decorations !743
  %678 = zext i32 %677 to i64
  %679 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %452, i64 %678
  %680 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %679)
  %681 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 64
  %682 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %681)
  %683 = insertelement <2 x i16> undef, i16 %680, i32 0
  %684 = insertelement <2 x i16> %683, i16 %682, i32 1
  %685 = bitcast <2 x i16> %684 to i32
  %686 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 128
  %687 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %686)
  %688 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 192
  %689 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %688)
  %690 = insertelement <2 x i16> undef, i16 %687, i32 0
  %691 = insertelement <2 x i16> %690, i16 %689, i32 1
  %692 = bitcast <2 x i16> %691 to i32
  %693 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 256
  %694 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %693)
  %695 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 320
  %696 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %695)
  %697 = insertelement <2 x i16> undef, i16 %694, i32 0
  %698 = insertelement <2 x i16> %697, i16 %696, i32 1
  %699 = bitcast <2 x i16> %698 to i32
  %700 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 384
  %701 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %700)
  %702 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 448
  %703 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %702)
  %704 = insertelement <2 x i16> undef, i16 %701, i32 0
  %705 = insertelement <2 x i16> %704, i16 %703, i32 1
  %706 = bitcast <2 x i16> %705 to i32
  %707 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 512
  %708 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %707)
  %709 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 576
  %710 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %709)
  %711 = insertelement <2 x i16> undef, i16 %708, i32 0
  %712 = insertelement <2 x i16> %711, i16 %710, i32 1
  %713 = bitcast <2 x i16> %712 to i32
  %714 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 640
  %715 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %714)
  %716 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 704
  %717 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %716)
  %718 = insertelement <2 x i16> undef, i16 %715, i32 0
  %719 = insertelement <2 x i16> %718, i16 %717, i32 1
  %720 = bitcast <2 x i16> %719 to i32
  %721 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 768
  %722 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %721)
  %723 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 832
  %724 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %723)
  %725 = insertelement <2 x i16> undef, i16 %722, i32 0
  %726 = insertelement <2 x i16> %725, i16 %724, i32 1
  %727 = bitcast <2 x i16> %726 to i32
  %728 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 896
  %729 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %728)
  %730 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 960
  %731 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %730)
  %732 = insertelement <2 x i16> undef, i16 %729, i32 0
  %733 = insertelement <2 x i16> %732, i16 %731, i32 1
  %734 = bitcast <2 x i16> %733 to i32
  %735 = insertelement <8 x i32> undef, i32 %685, i32 0
  %736 = insertelement <8 x i32> %735, i32 %692, i32 1
  %737 = insertelement <8 x i32> %736, i32 %699, i32 2
  %738 = insertelement <8 x i32> %737, i32 %706, i32 3
  %739 = insertelement <8 x i32> %738, i32 %713, i32 4
  %740 = insertelement <8 x i32> %739, i32 %720, i32 5
  %741 = insertelement <8 x i32> %740, i32 %727, i32 6
  %742 = insertelement <8 x i32> %741, i32 %734, i32 7
  %743 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %457, <8 x i16> %676, <8 x i32> %742, i32 12, i32 12, i32 8, i32 8, i1 false)
  %744 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 16
  %745 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %744)
  %746 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 144
  %747 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %746)
  %748 = insertelement <2 x i16> undef, i16 %745, i32 0
  %749 = insertelement <2 x i16> %748, i16 %747, i32 1
  %750 = bitcast <2 x i16> %749 to i32
  %751 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 272
  %752 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %751)
  %753 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 400
  %754 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %753)
  %755 = insertelement <2 x i16> undef, i16 %752, i32 0
  %756 = insertelement <2 x i16> %755, i16 %754, i32 1
  %757 = bitcast <2 x i16> %756 to i32
  %758 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 528
  %759 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %758)
  %760 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 656
  %761 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %760)
  %762 = insertelement <2 x i16> undef, i16 %759, i32 0
  %763 = insertelement <2 x i16> %762, i16 %761, i32 1
  %764 = bitcast <2 x i16> %763 to i32
  %765 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 784
  %766 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %765)
  %767 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 912
  %768 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %767)
  %769 = insertelement <2 x i16> undef, i16 %766, i32 0
  %770 = insertelement <2 x i16> %769, i16 %768, i32 1
  %771 = bitcast <2 x i16> %770 to i32
  %772 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1040
  %773 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %772)
  %774 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1168
  %775 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %774)
  %776 = insertelement <2 x i16> undef, i16 %773, i32 0
  %777 = insertelement <2 x i16> %776, i16 %775, i32 1
  %778 = bitcast <2 x i16> %777 to i32
  %779 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1296
  %780 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %779)
  %781 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1424
  %782 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %781)
  %783 = insertelement <2 x i16> undef, i16 %780, i32 0
  %784 = insertelement <2 x i16> %783, i16 %782, i32 1
  %785 = bitcast <2 x i16> %784 to i32
  %786 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1552
  %787 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %786)
  %788 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1680
  %789 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %788)
  %790 = insertelement <2 x i16> undef, i16 %787, i32 0
  %791 = insertelement <2 x i16> %790, i16 %789, i32 1
  %792 = bitcast <2 x i16> %791 to i32
  %793 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1808
  %794 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %793)
  %795 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1936
  %796 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %795)
  %797 = insertelement <2 x i16> undef, i16 %794, i32 0
  %798 = insertelement <2 x i16> %797, i16 %796, i32 1
  %799 = bitcast <2 x i16> %798 to i32
  %800 = insertelement <8 x i32> undef, i32 %750, i32 0
  %801 = insertelement <8 x i32> %800, i32 %757, i32 1
  %802 = insertelement <8 x i32> %801, i32 %764, i32 2
  %803 = insertelement <8 x i32> %802, i32 %771, i32 3
  %804 = insertelement <8 x i32> %803, i32 %778, i32 4
  %805 = insertelement <8 x i32> %804, i32 %785, i32 5
  %806 = insertelement <8 x i32> %805, i32 %792, i32 6
  %807 = insertelement <8 x i32> %806, i32 %799, i32 7
  %808 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %456, <8 x i16> %676, <8 x i32> %807, i32 12, i32 12, i32 8, i32 8, i1 false)
  %809 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 32
  %810 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %809)
  %811 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 160
  %812 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %811)
  %813 = insertelement <2 x i16> undef, i16 %810, i32 0
  %814 = insertelement <2 x i16> %813, i16 %812, i32 1
  %815 = bitcast <2 x i16> %814 to i32
  %816 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 288
  %817 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %816)
  %818 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 416
  %819 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %818)
  %820 = insertelement <2 x i16> undef, i16 %817, i32 0
  %821 = insertelement <2 x i16> %820, i16 %819, i32 1
  %822 = bitcast <2 x i16> %821 to i32
  %823 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 544
  %824 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %823)
  %825 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 672
  %826 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %825)
  %827 = insertelement <2 x i16> undef, i16 %824, i32 0
  %828 = insertelement <2 x i16> %827, i16 %826, i32 1
  %829 = bitcast <2 x i16> %828 to i32
  %830 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 800
  %831 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %830)
  %832 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 928
  %833 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %832)
  %834 = insertelement <2 x i16> undef, i16 %831, i32 0
  %835 = insertelement <2 x i16> %834, i16 %833, i32 1
  %836 = bitcast <2 x i16> %835 to i32
  %837 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1056
  %838 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %837)
  %839 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1184
  %840 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %839)
  %841 = insertelement <2 x i16> undef, i16 %838, i32 0
  %842 = insertelement <2 x i16> %841, i16 %840, i32 1
  %843 = bitcast <2 x i16> %842 to i32
  %844 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1312
  %845 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %844)
  %846 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1440
  %847 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %846)
  %848 = insertelement <2 x i16> undef, i16 %845, i32 0
  %849 = insertelement <2 x i16> %848, i16 %847, i32 1
  %850 = bitcast <2 x i16> %849 to i32
  %851 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1568
  %852 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %851)
  %853 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1696
  %854 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %853)
  %855 = insertelement <2 x i16> undef, i16 %852, i32 0
  %856 = insertelement <2 x i16> %855, i16 %854, i32 1
  %857 = bitcast <2 x i16> %856 to i32
  %858 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1824
  %859 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %858)
  %860 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1952
  %861 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %860)
  %862 = insertelement <2 x i16> undef, i16 %859, i32 0
  %863 = insertelement <2 x i16> %862, i16 %861, i32 1
  %864 = bitcast <2 x i16> %863 to i32
  %865 = insertelement <8 x i32> undef, i32 %815, i32 0
  %866 = insertelement <8 x i32> %865, i32 %822, i32 1
  %867 = insertelement <8 x i32> %866, i32 %829, i32 2
  %868 = insertelement <8 x i32> %867, i32 %836, i32 3
  %869 = insertelement <8 x i32> %868, i32 %843, i32 4
  %870 = insertelement <8 x i32> %869, i32 %850, i32 5
  %871 = insertelement <8 x i32> %870, i32 %857, i32 6
  %872 = insertelement <8 x i32> %871, i32 %864, i32 7
  %873 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %455, <8 x i16> %676, <8 x i32> %872, i32 12, i32 12, i32 8, i32 8, i1 false)
  %874 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 48
  %875 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %874)
  %876 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 176
  %877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %876)
  %878 = insertelement <2 x i16> undef, i16 %875, i32 0
  %879 = insertelement <2 x i16> %878, i16 %877, i32 1
  %880 = bitcast <2 x i16> %879 to i32
  %881 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 304
  %882 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %881)
  %883 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 432
  %884 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %883)
  %885 = insertelement <2 x i16> undef, i16 %882, i32 0
  %886 = insertelement <2 x i16> %885, i16 %884, i32 1
  %887 = bitcast <2 x i16> %886 to i32
  %888 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 560
  %889 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %888)
  %890 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 688
  %891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %890)
  %892 = insertelement <2 x i16> undef, i16 %889, i32 0
  %893 = insertelement <2 x i16> %892, i16 %891, i32 1
  %894 = bitcast <2 x i16> %893 to i32
  %895 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 816
  %896 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %895)
  %897 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 944
  %898 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %897)
  %899 = insertelement <2 x i16> undef, i16 %896, i32 0
  %900 = insertelement <2 x i16> %899, i16 %898, i32 1
  %901 = bitcast <2 x i16> %900 to i32
  %902 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1072
  %903 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %902)
  %904 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1200
  %905 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %904)
  %906 = insertelement <2 x i16> undef, i16 %903, i32 0
  %907 = insertelement <2 x i16> %906, i16 %905, i32 1
  %908 = bitcast <2 x i16> %907 to i32
  %909 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1328
  %910 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %909)
  %911 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1456
  %912 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %911)
  %913 = insertelement <2 x i16> undef, i16 %910, i32 0
  %914 = insertelement <2 x i16> %913, i16 %912, i32 1
  %915 = bitcast <2 x i16> %914 to i32
  %916 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1584
  %917 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %916)
  %918 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1712
  %919 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %918)
  %920 = insertelement <2 x i16> undef, i16 %917, i32 0
  %921 = insertelement <2 x i16> %920, i16 %919, i32 1
  %922 = bitcast <2 x i16> %921 to i32
  %923 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1840
  %924 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %923)
  %925 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1968
  %926 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %925)
  %927 = insertelement <2 x i16> undef, i16 %924, i32 0
  %928 = insertelement <2 x i16> %927, i16 %926, i32 1
  %929 = bitcast <2 x i16> %928 to i32
  %930 = insertelement <8 x i32> undef, i32 %880, i32 0
  %931 = insertelement <8 x i32> %930, i32 %887, i32 1
  %932 = insertelement <8 x i32> %931, i32 %894, i32 2
  %933 = insertelement <8 x i32> %932, i32 %901, i32 3
  %934 = insertelement <8 x i32> %933, i32 %908, i32 4
  %935 = insertelement <8 x i32> %934, i32 %915, i32 5
  %936 = insertelement <8 x i32> %935, i32 %922, i32 6
  %937 = insertelement <8 x i32> %936, i32 %929, i32 7
  %938 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %454, <8 x i16> %676, <8 x i32> %937, i32 12, i32 12, i32 8, i32 8, i1 false)
  %939 = add nuw nsw i32 %458, 16, !spirv.Decorations !743
  br label %453

940:                                              ; preds = %447
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %941

941:                                              ; preds = %940, %447
  br label %397

942:                                              ; preds = %397
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %23)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %22)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE(i32 %0, ptr addrspace(3) align 4 %1, ptr addrspace(1) align 1 %2, ptr addrspace(1) align 1 %3, ptr addrspace(1) align 4 %4, ptr addrspace(1) align 4 %5, ptr addrspace(1) align 4 %6, ptr addrspace(1) align 1 %7, ptr addrspace(1) align 4 %8, ptr addrspace(1) align 4 %9, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bindlessOffset, i32 %bindlessOffset8, i32 %bindlessOffset9, i32 %bindlessOffset10, i32 %bindlessOffset11, i32 %bindlessOffset12, i32 %bindlessOffset13, i32 %bindlessOffset14) #0 {
  %11 = extractelement <3 x i32> %localSize, i32 0
  %12 = extractelement <3 x i32> %localSize, i32 1
  %13 = extractelement <3 x i32> %localSize, i32 2
  %14 = extractelement <8 x i32> %r0, i32 0
  %15 = extractelement <8 x i32> %r0, i32 1
  %16 = extractelement <8 x i32> %r0, i32 2
  %17 = extractelement <8 x i32> %r0, i32 3
  %18 = extractelement <8 x i32> %r0, i32 4
  %19 = extractelement <8 x i32> %r0, i32 5
  %20 = extractelement <8 x i32> %r0, i32 6
  %21 = extractelement <8 x i32> %r0, i32 7
  %22 = alloca [8 x float], align 4, !spirv.Decorations !739
  %23 = alloca [4 x float], align 4, !spirv.Decorations !739
  %24 = alloca [4 x float], align 4, !spirv.Decorations !739
  %25 = alloca [4 x float], align 4, !spirv.Decorations !739
  %26 = zext i16 %localIdX to i32
  %27 = zext i32 %15 to i64
  %28 = icmp sgt i32 %15, -1
  call void @llvm.assume(i1 %28)
  %29 = bitcast <8 x i32> %r0 to <32 x i8>
  %30 = extractelement <32 x i8> %29, i32 0
  %31 = extractelement <32 x i8> %29, i32 1
  %32 = extractelement <32 x i8> %29, i32 2
  %33 = extractelement <32 x i8> %29, i32 3
  %34 = extractelement <32 x i8> %29, i32 4
  %35 = extractelement <32 x i8> %29, i32 5
  %36 = extractelement <32 x i8> %29, i32 6
  %37 = extractelement <32 x i8> %29, i32 7
  %38 = extractelement <32 x i8> %29, i32 8
  %39 = extractelement <32 x i8> %29, i32 9
  %40 = extractelement <32 x i8> %29, i32 10
  %41 = extractelement <32 x i8> %29, i32 11
  %42 = extractelement <32 x i8> %29, i32 12
  %43 = extractelement <32 x i8> %29, i32 13
  %44 = extractelement <32 x i8> %29, i32 14
  %45 = extractelement <32 x i8> %29, i32 15
  %46 = extractelement <32 x i8> %29, i32 16
  %47 = extractelement <32 x i8> %29, i32 17
  %48 = extractelement <32 x i8> %29, i32 18
  %49 = extractelement <32 x i8> %29, i32 19
  %50 = extractelement <32 x i8> %29, i32 20
  %51 = extractelement <32 x i8> %29, i32 21
  %52 = extractelement <32 x i8> %29, i32 22
  %53 = extractelement <32 x i8> %29, i32 23
  %54 = extractelement <32 x i8> %29, i32 24
  %55 = extractelement <32 x i8> %29, i32 25
  %56 = extractelement <32 x i8> %29, i32 26
  %57 = extractelement <32 x i8> %29, i32 27
  %58 = extractelement <32 x i8> %29, i32 28
  %59 = extractelement <32 x i8> %29, i32 29
  %60 = extractelement <32 x i8> %29, i32 30
  %61 = extractelement <32 x i8> %29, i32 31
  %localThreadId16 = zext i8 %38 to i32
  %62 = shl nuw nsw i32 %localThreadId16, 3, !spirv.Decorations !741
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %63 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %63)
  %64 = sdiv i32 %15, %0
  %freeze = freeze i32 %64
  %65 = sext i32 %freeze to i64
  %66 = shl nsw i64 %65, 6, !spirv.Decorations !741
  %67 = shl nsw i64 %65, 14, !spirv.Decorations !741
  %68 = shl nuw nsw i64 %27, 6, !spirv.Decorations !743
  %69 = shl nuw nsw i64 %27, 14, !spirv.Decorations !743
  %70 = shl nuw nsw i64 %27, 13, !spirv.Decorations !743
  %71 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %67
  %72 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %69
  %73 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %69
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %22)
  %74 = zext i32 %62 to i64
  %75 = getelementptr float, ptr addrspace(1) %5, i64 %66
  %76 = getelementptr float, ptr addrspace(1) %75, i64 %74
  br label %77

77:                                               ; preds = %84, %10
  %78 = phi i32 [ 0, %10 ], [ %89, %84 ]
  %79 = icmp ult i32 %78, 8
  br i1 %79, label %84, label %80

80:                                               ; preds = %77
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %23)
  %81 = zext i16 %simdLaneId16 to i64
  %82 = getelementptr float, ptr addrspace(1) %6, i64 %68
  %83 = getelementptr float, ptr addrspace(1) %82, i64 %81
  br label %90

84:                                               ; preds = %77
  %85 = zext i32 %78 to i64
  %86 = getelementptr inbounds float, ptr addrspace(1) %76, i64 %85
  %87 = load float, ptr addrspace(1) %86, align 4
  %88 = getelementptr inbounds [8 x float], ptr %22, i64 0, i64 %85
  store float %87, ptr %88, align 4
  %89 = add nuw nsw i32 %78, 1, !spirv.Decorations !743
  br label %77, !llvm.loop !752

90:                                               ; preds = %100, %80
  %91 = phi i32 [ 0, %80 ], [ %107, %100 ]
  %92 = icmp ult i32 %91, 4
  br i1 %92, label %100, label %93

93:                                               ; preds = %90
  %94 = shl nuw nsw i32 %localThreadId16, 11, !spirv.Decorations !741
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i8, ptr addrspace(1) %71, i64 %95
  %97 = getelementptr inbounds i8, ptr addrspace(1) %72, i64 4096
  %98 = getelementptr inbounds i8, ptr addrspace(1) %72, i64 8192
  %99 = getelementptr inbounds i8, ptr addrspace(1) %72, i64 12288
  br label %108

100:                                              ; preds = %90
  %101 = shl nuw nsw i32 %91, 4, !spirv.Decorations !743
  %102 = zext i32 %101 to i64
  %103 = getelementptr float, ptr addrspace(1) %83, i64 %102
  %104 = load float, ptr addrspace(1) %103, align 4
  %105 = zext i32 %91 to i64
  %106 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %105
  store float %104, ptr %106, align 4
  %107 = add nuw nsw i32 %91, 1, !spirv.Decorations !743
  br label %90, !llvm.loop !753

108:                                              ; preds = %250, %93
  %109 = phi <8 x i32> [ zeroinitializer, %93 ], [ %290, %250 ]
  %110 = phi <8 x i32> [ zeroinitializer, %93 ], [ %282, %250 ]
  %111 = phi <8 x i32> [ zeroinitializer, %93 ], [ %274, %250 ]
  %112 = phi <8 x i32> [ zeroinitializer, %93 ], [ %266, %250 ]
  %113 = phi i32 [ 0, %93 ], [ %291, %250 ]
  %114 = extractelement <8 x i32> %109, i32 0
  %115 = extractelement <8 x i32> %109, i32 1
  %116 = extractelement <8 x i32> %109, i32 2
  %117 = extractelement <8 x i32> %109, i32 3
  %118 = extractelement <8 x i32> %109, i32 4
  %119 = extractelement <8 x i32> %109, i32 5
  %120 = extractelement <8 x i32> %109, i32 6
  %121 = extractelement <8 x i32> %109, i32 7
  %122 = extractelement <8 x i32> %110, i32 0
  %123 = extractelement <8 x i32> %110, i32 1
  %124 = extractelement <8 x i32> %110, i32 2
  %125 = extractelement <8 x i32> %110, i32 3
  %126 = extractelement <8 x i32> %110, i32 4
  %127 = extractelement <8 x i32> %110, i32 5
  %128 = extractelement <8 x i32> %110, i32 6
  %129 = extractelement <8 x i32> %110, i32 7
  %130 = extractelement <8 x i32> %111, i32 0
  %131 = extractelement <8 x i32> %111, i32 1
  %132 = extractelement <8 x i32> %111, i32 2
  %133 = extractelement <8 x i32> %111, i32 3
  %134 = extractelement <8 x i32> %111, i32 4
  %135 = extractelement <8 x i32> %111, i32 5
  %136 = extractelement <8 x i32> %111, i32 6
  %137 = extractelement <8 x i32> %111, i32 7
  %138 = extractelement <8 x i32> %112, i32 0
  %139 = extractelement <8 x i32> %112, i32 1
  %140 = extractelement <8 x i32> %112, i32 2
  %141 = extractelement <8 x i32> %112, i32 3
  %142 = extractelement <8 x i32> %112, i32 4
  %143 = extractelement <8 x i32> %112, i32 5
  %144 = extractelement <8 x i32> %112, i32 6
  %145 = extractelement <8 x i32> %112, i32 7
  %146 = icmp ult i32 %113, 256
  br i1 %146, label %250, label %147

147:                                              ; preds = %108
  %148 = shl nuw nsw i32 %localThreadId16, 9, !spirv.Decorations !741
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM, i64 %149
  %151 = mul i32 %12, %11
  %152 = mul i32 %151, %13
  %153 = and i32 %152, 15
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %167, label %155

155:                                              ; preds = %147
  %localIdZ20 = zext i16 %localIdZ to i32
  %156 = mul i32 %12, %localIdZ20
  %localIdY22 = zext i16 %localIdY to i32
  %157 = add i32 %156, %localIdY22
  %158 = mul i32 %157, %11
  %localIdX24 = zext i16 %localIdX to i32
  %159 = add i32 %158, %localIdX24
  %160 = lshr i32 %159, 4
  %161 = mul i32 %12, %11
  %162 = mul i32 %161, %13
  %163 = add i32 %162, 15
  %164 = lshr i32 %163, 4
  %165 = add nsw i32 %164, -1
  %166 = icmp ult i32 %160, %165
  br i1 %166, label %167, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

167:                                              ; preds = %155, %147
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %155, %167
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %150, i32 %138)
  %168 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 64
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %168, i32 %139)
  %169 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 128
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %169, i32 %140)
  %170 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %170, i32 %141)
  %171 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 256
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %171, i32 %142)
  %172 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 320
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %172, i32 %143)
  %173 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 384
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %173, i32 %144)
  %174 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 448
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %174, i32 %145)
  %175 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 16
  %176 = mul i32 %12, %11
  %177 = mul i32 %176, %13
  %178 = and i32 %177, 15
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %192, label %180

180:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  %localIdZ31 = zext i16 %localIdZ to i32
  %181 = mul i32 %12, %localIdZ31
  %localIdY33 = zext i16 %localIdY to i32
  %182 = add i32 %181, %localIdY33
  %183 = mul i32 %182, %11
  %localIdX35 = zext i16 %localIdX to i32
  %184 = add i32 %183, %localIdX35
  %185 = lshr i32 %184, 4
  %186 = mul i32 %12, %11
  %187 = mul i32 %186, %13
  %188 = add i32 %187, 15
  %189 = lshr i32 %188, 4
  %190 = add nsw i32 %189, -1
  %191 = icmp ult i32 %185, %190
  br i1 %191, label %192, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35

192:                                              ; preds = %180, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35: ; preds = %180, %192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %175, i32 %130)
  %193 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 80
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %193, i32 %131)
  %194 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 144
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %194, i32 %132)
  %195 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 208
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %195, i32 %133)
  %196 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 272
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %196, i32 %134)
  %197 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 336
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %197, i32 %135)
  %198 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 400
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %198, i32 %136)
  %199 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 464
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %199, i32 %137)
  %200 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 32
  %201 = mul i32 %12, %11
  %202 = mul i32 %201, %13
  %203 = and i32 %202, 15
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %217, label %205

205:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35
  %localIdZ42 = zext i16 %localIdZ to i32
  %206 = mul i32 %12, %localIdZ42
  %localIdY44 = zext i16 %localIdY to i32
  %207 = add i32 %206, %localIdY44
  %208 = mul i32 %207, %11
  %localIdX46 = zext i16 %localIdX to i32
  %209 = add i32 %208, %localIdX46
  %210 = lshr i32 %209, 4
  %211 = mul i32 %12, %11
  %212 = mul i32 %211, %13
  %213 = add i32 %212, 15
  %214 = lshr i32 %213, 4
  %215 = add nsw i32 %214, -1
  %216 = icmp ult i32 %210, %215
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37

217:                                              ; preds = %205, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37: ; preds = %205, %217
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %200, i32 %122)
  %218 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 96
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %218, i32 %123)
  %219 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 160
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %219, i32 %124)
  %220 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 224
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %220, i32 %125)
  %221 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 288
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %221, i32 %126)
  %222 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 352
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %222, i32 %127)
  %223 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 416
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %223, i32 %128)
  %224 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 480
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %224, i32 %129)
  %225 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 48
  %226 = mul i32 %12, %11
  %227 = mul i32 %226, %13
  %228 = and i32 %227, 15
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %242, label %230

230:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37
  %localIdZ53 = zext i16 %localIdZ to i32
  %231 = mul i32 %12, %localIdZ53
  %localIdY55 = zext i16 %localIdY to i32
  %232 = add i32 %231, %localIdY55
  %233 = mul i32 %232, %11
  %localIdX57 = zext i16 %localIdX to i32
  %234 = add i32 %233, %localIdX57
  %235 = lshr i32 %234, 4
  %236 = mul i32 %12, %11
  %237 = mul i32 %236, %13
  %238 = add i32 %237, 15
  %239 = lshr i32 %238, 4
  %240 = add nsw i32 %239, -1
  %241 = icmp ult i32 %235, %240
  br i1 %241, label %242, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39

242:                                              ; preds = %230, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39: ; preds = %230, %242
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %225, i32 %114)
  %243 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 112
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %243, i32 %115)
  %244 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 176
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %244, i32 %116)
  %245 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 240
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %245, i32 %117)
  %246 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 304
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %246, i32 %118)
  %247 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 368
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %247, i32 %119)
  %248 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 432
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %248, i32 %120)
  %249 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 496
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %249, i32 %121)
  call void @llvm.genx.GenISA.wavebarrier()
  br label %292

250:                                              ; preds = %108
  %251 = zext i32 %113 to i64
  %252 = getelementptr inbounds i8, ptr addrspace(1) %96, i64 %251
  %.ascast.i40 = addrspacecast ptr addrspace(1) %252 to ptr addrspace(4)
  %253 = ptrtoint ptr addrspace(4) %.ascast.i40 to i64
  %254 = and i64 %253, -64
  %255 = trunc i64 %253 to i32
  %256 = lshr i32 %255, 1
  %257 = and i32 %256, 31
  %258 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %254, i32 255, i32 7, i32 255, i32 %257, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %259 = getelementptr inbounds i8, ptr addrspace(1) %72, i64 %251
  %.ascast.i41 = addrspacecast ptr addrspace(1) %259 to ptr addrspace(4)
  %260 = ptrtoint ptr addrspace(4) %.ascast.i41 to i64
  %261 = and i64 %260, -64
  %262 = trunc i64 %260 to i32
  %263 = lshr i32 %262, 2
  %264 = and i32 %263, 15
  %265 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %261, i32 255, i32 15, i32 255, i32 %264, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %266 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %112, <8 x i16> %258, <8 x i32> %265, i32 4, i32 4, i32 8, i32 8, i1 false)
  %267 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 %251
  %.ascast.i42 = addrspacecast ptr addrspace(1) %267 to ptr addrspace(4)
  %268 = ptrtoint ptr addrspace(4) %.ascast.i42 to i64
  %269 = and i64 %268, -64
  %270 = trunc i64 %268 to i32
  %271 = lshr i32 %270, 2
  %272 = and i32 %271, 15
  %273 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %269, i32 255, i32 15, i32 255, i32 %272, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %274 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %111, <8 x i16> %258, <8 x i32> %273, i32 4, i32 4, i32 8, i32 8, i1 false)
  %275 = getelementptr inbounds i8, ptr addrspace(1) %98, i64 %251
  %.ascast.i43 = addrspacecast ptr addrspace(1) %275 to ptr addrspace(4)
  %276 = ptrtoint ptr addrspace(4) %.ascast.i43 to i64
  %277 = and i64 %276, -64
  %278 = trunc i64 %276 to i32
  %279 = lshr i32 %278, 2
  %280 = and i32 %279, 15
  %281 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %277, i32 255, i32 15, i32 255, i32 %280, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %282 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %110, <8 x i16> %258, <8 x i32> %281, i32 4, i32 4, i32 8, i32 8, i1 false)
  %283 = getelementptr inbounds i8, ptr addrspace(1) %99, i64 %251
  %.ascast.i44 = addrspacecast ptr addrspace(1) %283 to ptr addrspace(4)
  %284 = ptrtoint ptr addrspace(4) %.ascast.i44 to i64
  %285 = and i64 %284, -64
  %286 = trunc i64 %284 to i32
  %287 = lshr i32 %286, 2
  %288 = and i32 %287, 15
  %289 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %285, i32 255, i32 15, i32 255, i32 %288, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %290 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %109, <8 x i16> %258, <8 x i32> %289, i32 4, i32 4, i32 8, i32 8, i1 false)
  %291 = add nuw nsw i32 %113, 32, !spirv.Decorations !743
  br label %108

292:                                              ; preds = %382, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39
  %293 = phi i32 [ 0, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39 ], [ %383, %382 ]
  %294 = icmp ult i32 %293, 8
  br i1 %294, label %318, label %295

295:                                              ; preds = %292
  call void @llvm.genx.GenISA.wavebarrier()
  %296 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %70
  %297 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %68
  %298 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %68
  %299 = lshr i32 %26, 1
  %300 = and i32 %26, 1
  %301 = zext i32 %299 to i64
  %302 = getelementptr inbounds float, ptr addrspace(1) %297, i64 %301
  %303 = getelementptr inbounds float, ptr addrspace(1) %298, i64 %301
  %304 = shl nuw nsw i32 %300, 5, !spirv.Decorations !743
  %305 = shl nuw nsw i64 %301, 7, !spirv.Decorations !743
  %306 = getelementptr inbounds i8, ptr addrspace(1) %296, i64 %305
  %307 = shl nuw nsw i32 %299, 7, !spirv.Decorations !741
  %308 = zext i32 %307 to i64
  %309 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM, i64 %308
  %310 = shl nuw nsw i32 %300, 6, !spirv.Decorations !743
  %311 = zext i32 %310 to i64
  %312 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %309, i64 %311
  %313 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM, i64 0, i64 16384
  %314 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %313, i64 %149
  %315 = shl nuw nsw i32 %localThreadId16, 11, !spirv.Decorations !741
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %73, i64 %316
  br label %397

318:                                              ; preds = %292
  %319 = or i32 %62, %293
  %320 = zext i32 %293 to i64
  %321 = getelementptr inbounds [8 x float], ptr %22, i64 0, i64 %320
  %322 = load float, ptr %321, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %24)
  %323 = shl nsw i32 %319, 6, !spirv.Decorations !741
  br label %324

324:                                              ; preds = %330, %318
  %325 = phi float [ 0xFFF0000000000000, %318 ], [ %345, %330 ]
  %326 = phi i32 [ 0, %318 ], [ %346, %330 ]
  %327 = icmp ult i32 %326, 4
  br i1 %327, label %330, label %328

328:                                              ; preds = %324
  %329 = call float @llvm.genx.GenISA.WaveAll.f32(float %325, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %25)
  br label %347

330:                                              ; preds = %324
  %331 = shl nuw nsw i32 %326, 4, !spirv.Decorations !743
  %332 = or i32 %323, %331
  %333 = add nuw nsw i32 %332, %simdLaneId, !spirv.Decorations !743
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM, i64 %334
  %336 = load i32, ptr addrspace(3) %335, align 4
  %337 = sitofp i32 %336 to float
  %338 = fmul reassoc nsz arcp contract float %322, %337, !spirv.Decorations !748
  %339 = zext i32 %326 to i64
  %340 = getelementptr inbounds [4 x float], ptr %23, i64 0, i64 %339
  %341 = load float, ptr %340, align 4
  %342 = fmul reassoc nsz arcp contract float %338, %341, !spirv.Decorations !748
  %343 = fmul reassoc nsz arcp contract float %342, 6.250000e-02, !spirv.Decorations !748
  %344 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %339
  store float %343, ptr %344, align 4
  %345 = call float @llvm.maxnum.f32(float %325, float %343)
  %346 = add nuw nsw i32 %326, 1, !spirv.Decorations !743
  br label %324

347:                                              ; preds = %354, %328
  %348 = phi float [ 0.000000e+00, %328 ], [ %372, %354 ]
  %349 = phi i32 [ 0, %328 ], [ %373, %354 ]
  %350 = icmp ult i32 %349, 4
  br i1 %350, label %354, label %351

351:                                              ; preds = %347
  %352 = call float @llvm.genx.GenISA.WaveAll.f32(float %348, i8 9, i1 true, i32 0)
  %353 = fcmp reassoc nsz arcp contract oeq float %352, 0.000000e+00, !spirv.Decorations !748
  br i1 %353, label %376, label %374

354:                                              ; preds = %347
  %355 = zext i32 %349 to i64
  %356 = getelementptr inbounds [4 x float], ptr %24, i64 0, i64 %355
  %357 = load float, ptr %356, align 4
  %358 = fsub reassoc nsz arcp contract float %357, %329, !spirv.Decorations !748
  %359 = fmul float %358, 0x3FF7154760000000
  %360 = call float @llvm.trunc.f32(float %359)
  %361 = call float @llvm.fma.f32(float %360, float 0xBFE62E4000000000, float %358)
  %362 = call float @llvm.fma.f32(float %360, float 0xBEB7F7D1C0000000, float %361)
  %363 = fmul float %362, 0x3FF7154760000000
  %364 = call float @llvm.exp2.f32(float %360)
  %365 = call float @llvm.exp2.f32(float %363)
  %366 = fmul float %364, %365
  %367 = fcmp olt float %358, -1.050000e+02
  %368 = select i1 %367, float 0.000000e+00, float %366
  %369 = fcmp ogt float %358, 1.050000e+02
  %370 = select i1 %369, float 0x7FF0000000000000, float %368
  %371 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %355
  store float %370, ptr %371, align 4
  %372 = fadd reassoc nsz arcp contract float %348, %370, !spirv.Decorations !748
  %373 = add nuw nsw i32 %349, 1, !spirv.Decorations !743
  br label %347

374:                                              ; preds = %351
  %375 = fdiv reassoc nsz arcp contract float 1.000000e+00, %352, !spirv.Decorations !748
  br label %376

376:                                              ; preds = %374, %351
  %377 = phi float [ %375, %374 ], [ 0.000000e+00, %351 ]
  %378 = shl nsw i32 %319, 6, !spirv.Decorations !741
  br label %379

379:                                              ; preds = %384, %376
  %380 = phi i32 [ 0, %376 ], [ %396, %384 ]
  %381 = icmp ult i32 %380, 4
  br i1 %381, label %384, label %382

382:                                              ; preds = %379
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %25)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %24)
  %383 = add nuw nsw i32 %293, 1, !spirv.Decorations !743
  br label %292

384:                                              ; preds = %379
  %385 = zext i32 %380 to i64
  %386 = getelementptr inbounds [4 x float], ptr %25, i64 0, i64 %385
  %387 = load float, ptr %386, align 4
  %388 = fmul reassoc nsz arcp contract float %387, %377, !spirv.Decorations !748
  %389 = fptrunc float %388 to half
  %390 = shl nuw nsw i32 %380, 4, !spirv.Decorations !743
  %391 = or i32 %378, %390
  %392 = add nuw nsw i32 %391, %simdLaneId, !spirv.Decorations !743
  %393 = zext i32 %392 to i64
  %394 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM, i64 0, i64 16384
  %395 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %394, i64 %393
  store half %389, ptr addrspace(3) %395, align 2
  %396 = add nuw nsw i32 %380, 1, !spirv.Decorations !743
  br label %379

397:                                              ; preds = %941, %295
  %.0195121 = phi i16 [ undef, %295 ], [ %.1196161, %941 ]
  %.0195122 = phi i16 [ undef, %295 ], [ %.1196162, %941 ]
  %.0195123 = phi i16 [ undef, %295 ], [ %.1196163, %941 ]
  %.0195124 = phi i16 [ undef, %295 ], [ %.1196164, %941 ]
  %.0195125 = phi i16 [ undef, %295 ], [ %.1196165, %941 ]
  %.0195126 = phi i16 [ undef, %295 ], [ %.1196166, %941 ]
  %.0195127 = phi i16 [ undef, %295 ], [ %.1196167, %941 ]
  %.0195128 = phi i16 [ undef, %295 ], [ %.1196168, %941 ]
  %.0192129 = phi i32 [ undef, %295 ], [ %.1193169, %941 ]
  %.0192130 = phi i32 [ undef, %295 ], [ %.1193170, %941 ]
  %.0192131 = phi i32 [ undef, %295 ], [ %.1193171, %941 ]
  %.0192132 = phi i32 [ undef, %295 ], [ %.1193172, %941 ]
  %.0192133 = phi i32 [ undef, %295 ], [ %.1193173, %941 ]
  %.0192134 = phi i32 [ undef, %295 ], [ %.1193174, %941 ]
  %.0192135 = phi i32 [ undef, %295 ], [ %.1193175, %941 ]
  %.0192136 = phi i32 [ undef, %295 ], [ %.1193176, %941 ]
  %.0189137 = phi i32 [ undef, %295 ], [ %.1190177, %941 ]
  %.0189138 = phi i32 [ undef, %295 ], [ %.1190178, %941 ]
  %.0189139 = phi i32 [ undef, %295 ], [ %.1190179, %941 ]
  %.0189140 = phi i32 [ undef, %295 ], [ %.1190180, %941 ]
  %.0189141 = phi i32 [ undef, %295 ], [ %.1190181, %941 ]
  %.0189142 = phi i32 [ undef, %295 ], [ %.1190182, %941 ]
  %.0189143 = phi i32 [ undef, %295 ], [ %.1190183, %941 ]
  %.0189144 = phi i32 [ undef, %295 ], [ %.1190184, %941 ]
  %.0186145 = phi i32 [ undef, %295 ], [ %.1187185, %941 ]
  %.0186146 = phi i32 [ undef, %295 ], [ %.1187186, %941 ]
  %.0186147 = phi i32 [ undef, %295 ], [ %.1187187, %941 ]
  %.0186148 = phi i32 [ undef, %295 ], [ %.1187188, %941 ]
  %.0186149 = phi i32 [ undef, %295 ], [ %.1187189, %941 ]
  %.0186150 = phi i32 [ undef, %295 ], [ %.1187190, %941 ]
  %.0186151 = phi i32 [ undef, %295 ], [ %.1187191, %941 ]
  %.0186152 = phi i32 [ undef, %295 ], [ %.1187192, %941 ]
  %.0153 = phi i32 [ undef, %295 ], [ %.1194, %941 ]
  %.0154 = phi i32 [ undef, %295 ], [ %.1195, %941 ]
  %.0155 = phi i32 [ undef, %295 ], [ %.1197, %941 ]
  %.0156 = phi i32 [ undef, %295 ], [ %.1198, %941 ]
  %.0157 = phi i32 [ undef, %295 ], [ %.1199, %941 ]
  %.0158 = phi i32 [ undef, %295 ], [ %.1200, %941 ]
  %.0159 = phi i32 [ undef, %295 ], [ %.1201, %941 ]
  %.0160 = phi i32 [ undef, %295 ], [ %.1202, %941 ]
  %398 = phi i32 [ 0, %295 ], [ %448, %941 ]
  %399 = icmp ult i32 %398, 256
  br i1 %399, label %400, label %942

400:                                              ; preds = %397
  %401 = load float, ptr addrspace(1) %302, align 4
  %402 = load float, ptr addrspace(1) %303, align 4
  %403 = lshr exact i32 %398, 1
  %404 = or i32 %403, %304
  %405 = zext i32 %404 to i64
  %406 = getelementptr inbounds i8, ptr addrspace(1) %306, i64 %405
  br label %407

407:                                              ; preds = %417, %400
  %408 = phi i32 [ 0, %400 ], [ %418, %417 ]
  %409 = icmp ult i32 %408, 32
  br i1 %409, label %410, label %441

410:                                              ; preds = %407
  %411 = zext i32 %408 to i64
  %412 = getelementptr inbounds i8, ptr addrspace(1) %406, i64 %411
  %413 = load i64, ptr addrspace(1) %412, align 1
  br label %414

414:                                              ; preds = %419, %410
  %415 = phi i32 [ 0, %410 ], [ %440, %419 ]
  %416 = icmp ult i32 %415, 8
  br i1 %416, label %419, label %417

417:                                              ; preds = %414
  %418 = add nuw nsw i32 %408, 8, !spirv.Decorations !743
  br label %407, !llvm.loop !754

419:                                              ; preds = %414
  %420 = shl nuw nsw i32 %415, 3, !spirv.Decorations !743
  %421 = zext i32 %420 to i64
  %422 = lshr i64 %413, %421
  %423 = trunc i64 %422 to i32
  %424 = and i32 %423, 15
  %425 = uitofp i32 %424 to float
  %426 = fsub reassoc nsz arcp contract float %425, %402, !spirv.Decorations !748
  %427 = fmul reassoc nsz arcp contract float %426, %401, !spirv.Decorations !748
  %428 = fptrunc float %427 to half
  %429 = or i32 %408, %415
  %430 = shl nuw nsw i32 %429, 1, !spirv.Decorations !743
  %431 = zext i32 %430 to i64
  %432 = getelementptr half, ptr addrspace(3) %312, i64 %431
  store half %428, ptr addrspace(3) %432, align 4
  %433 = lshr i32 %423, 4
  %434 = and i32 %433, 15
  %435 = uitofp i32 %434 to float
  %436 = fsub reassoc nsz arcp contract float %435, %402, !spirv.Decorations !748
  %437 = fmul reassoc nsz arcp contract float %436, %401, !spirv.Decorations !748
  %438 = fptrunc float %437 to half
  %439 = getelementptr half, ptr addrspace(3) %432, i64 1
  store half %438, ptr addrspace(3) %439, align 2
  %440 = add nuw nsw i32 %415, 1, !spirv.Decorations !743
  br label %414, !llvm.loop !755

441:                                              ; preds = %407
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %442 = zext i32 %398 to i64
  %443 = getelementptr inbounds float, ptr addrspace(1) %317, i64 %442
  br label %444

444:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51, %441
  %.1196161 = phi i16 [ %.0195121, %441 ], [ %.2197203, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196162 = phi i16 [ %.0195122, %441 ], [ %.2197204, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196163 = phi i16 [ %.0195123, %441 ], [ %.2197205, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196164 = phi i16 [ %.0195124, %441 ], [ %.2197206, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196165 = phi i16 [ %.0195125, %441 ], [ %.2197207, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196166 = phi i16 [ %.0195126, %441 ], [ %.2197208, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196167 = phi i16 [ %.0195127, %441 ], [ %.2197209, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1196168 = phi i16 [ %.0195128, %441 ], [ %.2197210, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193169 = phi i32 [ %.0192129, %441 ], [ %.2194211, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193170 = phi i32 [ %.0192130, %441 ], [ %.2194212, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193171 = phi i32 [ %.0192131, %441 ], [ %.2194213, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193172 = phi i32 [ %.0192132, %441 ], [ %.2194214, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193173 = phi i32 [ %.0192133, %441 ], [ %.2194215, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193174 = phi i32 [ %.0192134, %441 ], [ %.2194216, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193175 = phi i32 [ %.0192135, %441 ], [ %.2194217, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1193176 = phi i32 [ %.0192136, %441 ], [ %.2194218, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190177 = phi i32 [ %.0189137, %441 ], [ %.2191219, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190178 = phi i32 [ %.0189138, %441 ], [ %.2191220, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190179 = phi i32 [ %.0189139, %441 ], [ %.2191221, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190180 = phi i32 [ %.0189140, %441 ], [ %.2191222, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190181 = phi i32 [ %.0189141, %441 ], [ %.2191223, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190182 = phi i32 [ %.0189142, %441 ], [ %.2191224, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190183 = phi i32 [ %.0189143, %441 ], [ %.2191225, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1190184 = phi i32 [ %.0189144, %441 ], [ %.2191226, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187185 = phi i32 [ %.0186145, %441 ], [ %.2188227, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187186 = phi i32 [ %.0186146, %441 ], [ %.2188228, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187187 = phi i32 [ %.0186147, %441 ], [ %.2188229, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187188 = phi i32 [ %.0186148, %441 ], [ %.2188230, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187189 = phi i32 [ %.0186149, %441 ], [ %.2188231, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187190 = phi i32 [ %.0186150, %441 ], [ %.2188232, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187191 = phi i32 [ %.0186151, %441 ], [ %.2188233, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187192 = phi i32 [ %.0186152, %441 ], [ %.2188234, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1194 = phi i32 [ %.0153, %441 ], [ %.2235, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195 = phi i32 [ %.0154, %441 ], [ %.2236, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1197 = phi i32 [ %.0155, %441 ], [ %.2237, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1198 = phi i32 [ %.0156, %441 ], [ %.2238, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199 = phi i32 [ %.0157, %441 ], [ %.2239, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1200 = phi i32 [ %.0158, %441 ], [ %.2240, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1201 = phi i32 [ %.0159, %441 ], [ %.2241, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1202 = phi i32 [ %.0160, %441 ], [ %.2242, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %445 = phi i32 [ 0, %441 ], [ %650, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %446 = icmp ult i32 %445, 128
  br i1 %446, label %450, label %447

447:                                              ; preds = %444
  %448 = add nuw nsw i32 %398, 128, !spirv.Decorations !743
  %449 = icmp eq i32 %398, 0
  br i1 %449, label %940, label %941

450:                                              ; preds = %444
  %451 = zext i32 %445 to i64
  %452 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM, i64 %451
  br label %453

453:                                              ; preds = %651, %450
  %.2197203 = phi i16 [ %.1196161, %450 ], [ %654, %651 ]
  %.2197204 = phi i16 [ %.1196162, %450 ], [ %656, %651 ]
  %.2197205 = phi i16 [ %.1196163, %450 ], [ %658, %651 ]
  %.2197206 = phi i16 [ %.1196164, %450 ], [ %660, %651 ]
  %.2197207 = phi i16 [ %.1196165, %450 ], [ %662, %651 ]
  %.2197208 = phi i16 [ %.1196166, %450 ], [ %664, %651 ]
  %.2197209 = phi i16 [ %.1196167, %450 ], [ %666, %651 ]
  %.2197210 = phi i16 [ %.1196168, %450 ], [ %668, %651 ]
  %.2194211 = phi i32 [ %.1193169, %450 ], [ %880, %651 ]
  %.2194212 = phi i32 [ %.1193170, %450 ], [ %887, %651 ]
  %.2194213 = phi i32 [ %.1193171, %450 ], [ %894, %651 ]
  %.2194214 = phi i32 [ %.1193172, %450 ], [ %901, %651 ]
  %.2194215 = phi i32 [ %.1193173, %450 ], [ %908, %651 ]
  %.2194216 = phi i32 [ %.1193174, %450 ], [ %915, %651 ]
  %.2194217 = phi i32 [ %.1193175, %450 ], [ %922, %651 ]
  %.2194218 = phi i32 [ %.1193176, %450 ], [ %929, %651 ]
  %.2191219 = phi i32 [ %.1190177, %450 ], [ %815, %651 ]
  %.2191220 = phi i32 [ %.1190178, %450 ], [ %822, %651 ]
  %.2191221 = phi i32 [ %.1190179, %450 ], [ %829, %651 ]
  %.2191222 = phi i32 [ %.1190180, %450 ], [ %836, %651 ]
  %.2191223 = phi i32 [ %.1190181, %450 ], [ %843, %651 ]
  %.2191224 = phi i32 [ %.1190182, %450 ], [ %850, %651 ]
  %.2191225 = phi i32 [ %.1190183, %450 ], [ %857, %651 ]
  %.2191226 = phi i32 [ %.1190184, %450 ], [ %864, %651 ]
  %.2188227 = phi i32 [ %.1187185, %450 ], [ %750, %651 ]
  %.2188228 = phi i32 [ %.1187186, %450 ], [ %757, %651 ]
  %.2188229 = phi i32 [ %.1187187, %450 ], [ %764, %651 ]
  %.2188230 = phi i32 [ %.1187188, %450 ], [ %771, %651 ]
  %.2188231 = phi i32 [ %.1187189, %450 ], [ %778, %651 ]
  %.2188232 = phi i32 [ %.1187190, %450 ], [ %785, %651 ]
  %.2188233 = phi i32 [ %.1187191, %450 ], [ %792, %651 ]
  %.2188234 = phi i32 [ %.1187192, %450 ], [ %799, %651 ]
  %.2235 = phi i32 [ %.1194, %450 ], [ %685, %651 ]
  %.2236 = phi i32 [ %.1195, %450 ], [ %692, %651 ]
  %.2237 = phi i32 [ %.1197, %450 ], [ %699, %651 ]
  %.2238 = phi i32 [ %.1198, %450 ], [ %706, %651 ]
  %.2239 = phi i32 [ %.1199, %450 ], [ %713, %651 ]
  %.2240 = phi i32 [ %.1200, %450 ], [ %720, %651 ]
  %.2241 = phi i32 [ %.1201, %450 ], [ %727, %651 ]
  %.2242 = phi i32 [ %.1202, %450 ], [ %734, %651 ]
  %454 = phi <8 x float> [ zeroinitializer, %450 ], [ %938, %651 ]
  %455 = phi <8 x float> [ zeroinitializer, %450 ], [ %873, %651 ]
  %456 = phi <8 x float> [ zeroinitializer, %450 ], [ %808, %651 ]
  %457 = phi <8 x float> [ zeroinitializer, %450 ], [ %743, %651 ]
  %458 = phi i32 [ 0, %450 ], [ %939, %651 ]
  %459 = extractelement <8 x float> %454, i32 0
  %460 = extractelement <8 x float> %454, i32 1
  %461 = extractelement <8 x float> %454, i32 2
  %462 = extractelement <8 x float> %454, i32 3
  %463 = extractelement <8 x float> %454, i32 4
  %464 = extractelement <8 x float> %454, i32 5
  %465 = extractelement <8 x float> %454, i32 6
  %466 = extractelement <8 x float> %454, i32 7
  %467 = extractelement <8 x float> %455, i32 0
  %468 = extractelement <8 x float> %455, i32 1
  %469 = extractelement <8 x float> %455, i32 2
  %470 = extractelement <8 x float> %455, i32 3
  %471 = extractelement <8 x float> %455, i32 4
  %472 = extractelement <8 x float> %455, i32 5
  %473 = extractelement <8 x float> %455, i32 6
  %474 = extractelement <8 x float> %455, i32 7
  %475 = extractelement <8 x float> %456, i32 0
  %476 = extractelement <8 x float> %456, i32 1
  %477 = extractelement <8 x float> %456, i32 2
  %478 = extractelement <8 x float> %456, i32 3
  %479 = extractelement <8 x float> %456, i32 4
  %480 = extractelement <8 x float> %456, i32 5
  %481 = extractelement <8 x float> %456, i32 6
  %482 = extractelement <8 x float> %456, i32 7
  %483 = extractelement <8 x float> %457, i32 0
  %484 = extractelement <8 x float> %457, i32 1
  %485 = extractelement <8 x float> %457, i32 2
  %486 = extractelement <8 x float> %457, i32 3
  %487 = extractelement <8 x float> %457, i32 4
  %488 = extractelement <8 x float> %457, i32 5
  %489 = extractelement <8 x float> %457, i32 6
  %490 = extractelement <8 x float> %457, i32 7
  %491 = icmp ult i32 %458, 64
  br i1 %491, label %651, label %492

492:                                              ; preds = %453
  %493 = zext i32 %445 to i64
  %494 = getelementptr inbounds float, ptr addrspace(1) %443, i64 %493
  %495 = bitcast float %483 to i32
  %496 = bitcast float %484 to i32
  %497 = bitcast float %485 to i32
  %498 = bitcast float %486 to i32
  %499 = bitcast float %487 to i32
  %500 = bitcast float %488 to i32
  %501 = bitcast float %489 to i32
  %502 = bitcast float %490 to i32
  %503 = insertelement <8 x i32> undef, i32 %495, i32 0
  %504 = insertelement <8 x i32> %503, i32 %496, i32 1
  %505 = insertelement <8 x i32> %504, i32 %497, i32 2
  %506 = insertelement <8 x i32> %505, i32 %498, i32 3
  %507 = insertelement <8 x i32> %506, i32 %499, i32 4
  %508 = insertelement <8 x i32> %507, i32 %500, i32 5
  %509 = insertelement <8 x i32> %508, i32 %501, i32 6
  %510 = insertelement <8 x i32> %509, i32 %502, i32 7
  %.ascast.i45 = addrspacecast ptr addrspace(1) %494 to ptr addrspace(4)
  %511 = mul i32 %12, %11
  %512 = mul i32 %511, %13
  %513 = and i32 %512, 15
  %514 = icmp eq i32 %513, 0
  br i1 %514, label %527, label %515

515:                                              ; preds = %492
  %localIdZ64 = zext i16 %localIdZ to i32
  %516 = mul i32 %12, %localIdZ64
  %localIdY66 = zext i16 %localIdY to i32
  %517 = add i32 %516, %localIdY66
  %518 = mul i32 %517, %11
  %localIdX68 = zext i16 %localIdX to i32
  %519 = add i32 %518, %localIdX68
  %520 = lshr i32 %519, 4
  %521 = mul i32 %12, %11
  %522 = mul i32 %521, %13
  %523 = add i32 %522, 15
  %524 = lshr i32 %523, 4
  %525 = add nsw i32 %524, -1
  %526 = icmp ult i32 %520, %525
  br i1 %526, label %527, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

527:                                              ; preds = %515, %492
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %515, %527
  %528 = ptrtoint ptr addrspace(4) %.ascast.i45 to i64
  %529 = and i64 %528, -64
  %530 = trunc i64 %528 to i32
  %531 = lshr i32 %530, 2
  %532 = and i32 %531, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %529, i32 1023, i32 7, i32 1023, i32 %532, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %510)
  %533 = getelementptr inbounds float, ptr addrspace(1) %494, i64 16
  %534 = bitcast float %475 to i32
  %535 = bitcast float %476 to i32
  %536 = bitcast float %477 to i32
  %537 = bitcast float %478 to i32
  %538 = bitcast float %479 to i32
  %539 = bitcast float %480 to i32
  %540 = bitcast float %481 to i32
  %541 = bitcast float %482 to i32
  %542 = insertelement <8 x i32> undef, i32 %534, i32 0
  %543 = insertelement <8 x i32> %542, i32 %535, i32 1
  %544 = insertelement <8 x i32> %543, i32 %536, i32 2
  %545 = insertelement <8 x i32> %544, i32 %537, i32 3
  %546 = insertelement <8 x i32> %545, i32 %538, i32 4
  %547 = insertelement <8 x i32> %546, i32 %539, i32 5
  %548 = insertelement <8 x i32> %547, i32 %540, i32 6
  %549 = insertelement <8 x i32> %548, i32 %541, i32 7
  %.ascast.i46 = addrspacecast ptr addrspace(1) %533 to ptr addrspace(4)
  %550 = mul i32 %12, %11
  %551 = mul i32 %550, %13
  %552 = and i32 %551, 15
  %553 = icmp eq i32 %552, 0
  br i1 %553, label %566, label %554

554:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  %localIdZ75 = zext i16 %localIdZ to i32
  %555 = mul i32 %12, %localIdZ75
  %localIdY77 = zext i16 %localIdY to i32
  %556 = add i32 %555, %localIdY77
  %557 = mul i32 %556, %11
  %localIdX79 = zext i16 %localIdX to i32
  %558 = add i32 %557, %localIdX79
  %559 = lshr i32 %558, 4
  %560 = mul i32 %12, %11
  %561 = mul i32 %560, %13
  %562 = add i32 %561, 15
  %563 = lshr i32 %562, 4
  %564 = add nsw i32 %563, -1
  %565 = icmp ult i32 %559, %564
  br i1 %565, label %566, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47

566:                                              ; preds = %554, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47: ; preds = %554, %566
  %567 = ptrtoint ptr addrspace(4) %.ascast.i46 to i64
  %568 = and i64 %567, -64
  %569 = trunc i64 %567 to i32
  %570 = lshr i32 %569, 2
  %571 = and i32 %570, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %568, i32 1023, i32 7, i32 1023, i32 %571, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %549)
  %572 = getelementptr inbounds float, ptr addrspace(1) %494, i64 32
  %573 = bitcast float %467 to i32
  %574 = bitcast float %468 to i32
  %575 = bitcast float %469 to i32
  %576 = bitcast float %470 to i32
  %577 = bitcast float %471 to i32
  %578 = bitcast float %472 to i32
  %579 = bitcast float %473 to i32
  %580 = bitcast float %474 to i32
  %581 = insertelement <8 x i32> undef, i32 %573, i32 0
  %582 = insertelement <8 x i32> %581, i32 %574, i32 1
  %583 = insertelement <8 x i32> %582, i32 %575, i32 2
  %584 = insertelement <8 x i32> %583, i32 %576, i32 3
  %585 = insertelement <8 x i32> %584, i32 %577, i32 4
  %586 = insertelement <8 x i32> %585, i32 %578, i32 5
  %587 = insertelement <8 x i32> %586, i32 %579, i32 6
  %588 = insertelement <8 x i32> %587, i32 %580, i32 7
  %.ascast.i48 = addrspacecast ptr addrspace(1) %572 to ptr addrspace(4)
  %589 = mul i32 %12, %11
  %590 = mul i32 %589, %13
  %591 = and i32 %590, 15
  %592 = icmp eq i32 %591, 0
  br i1 %592, label %605, label %593

593:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47
  %localIdZ86 = zext i16 %localIdZ to i32
  %594 = mul i32 %12, %localIdZ86
  %localIdY88 = zext i16 %localIdY to i32
  %595 = add i32 %594, %localIdY88
  %596 = mul i32 %595, %11
  %localIdX90 = zext i16 %localIdX to i32
  %597 = add i32 %596, %localIdX90
  %598 = lshr i32 %597, 4
  %599 = mul i32 %12, %11
  %600 = mul i32 %599, %13
  %601 = add i32 %600, 15
  %602 = lshr i32 %601, 4
  %603 = add nsw i32 %602, -1
  %604 = icmp ult i32 %598, %603
  br i1 %604, label %605, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49

605:                                              ; preds = %593, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49: ; preds = %593, %605
  %606 = ptrtoint ptr addrspace(4) %.ascast.i48 to i64
  %607 = and i64 %606, -64
  %608 = trunc i64 %606 to i32
  %609 = lshr i32 %608, 2
  %610 = and i32 %609, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %607, i32 1023, i32 7, i32 1023, i32 %610, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %588)
  %611 = getelementptr inbounds float, ptr addrspace(1) %494, i64 48
  %612 = bitcast float %459 to i32
  %613 = bitcast float %460 to i32
  %614 = bitcast float %461 to i32
  %615 = bitcast float %462 to i32
  %616 = bitcast float %463 to i32
  %617 = bitcast float %464 to i32
  %618 = bitcast float %465 to i32
  %619 = bitcast float %466 to i32
  %620 = insertelement <8 x i32> undef, i32 %612, i32 0
  %621 = insertelement <8 x i32> %620, i32 %613, i32 1
  %622 = insertelement <8 x i32> %621, i32 %614, i32 2
  %623 = insertelement <8 x i32> %622, i32 %615, i32 3
  %624 = insertelement <8 x i32> %623, i32 %616, i32 4
  %625 = insertelement <8 x i32> %624, i32 %617, i32 5
  %626 = insertelement <8 x i32> %625, i32 %618, i32 6
  %627 = insertelement <8 x i32> %626, i32 %619, i32 7
  %.ascast.i50 = addrspacecast ptr addrspace(1) %611 to ptr addrspace(4)
  %628 = mul i32 %12, %11
  %629 = mul i32 %628, %13
  %630 = and i32 %629, 15
  %631 = icmp eq i32 %630, 0
  br i1 %631, label %644, label %632

632:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49
  %localIdZ97 = zext i16 %localIdZ to i32
  %633 = mul i32 %12, %localIdZ97
  %localIdY99 = zext i16 %localIdY to i32
  %634 = add i32 %633, %localIdY99
  %635 = mul i32 %634, %11
  %localIdX101 = zext i16 %localIdX to i32
  %636 = add i32 %635, %localIdX101
  %637 = lshr i32 %636, 4
  %638 = mul i32 %12, %11
  %639 = mul i32 %638, %13
  %640 = add i32 %639, 15
  %641 = lshr i32 %640, 4
  %642 = add nsw i32 %641, -1
  %643 = icmp ult i32 %637, %642
  br i1 %643, label %644, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51

644:                                              ; preds = %632, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51: ; preds = %632, %644
  %645 = ptrtoint ptr addrspace(4) %.ascast.i50 to i64
  %646 = and i64 %645, -64
  %647 = trunc i64 %645 to i32
  %648 = lshr i32 %647, 2
  %649 = and i32 %648, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %646, i32 1023, i32 7, i32 1023, i32 %649, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %627)
  %650 = add nuw nsw i32 %445, 64, !spirv.Decorations !743
  br label %444

651:                                              ; preds = %453
  %652 = zext i32 %458 to i64
  %653 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %314, i64 %652
  %654 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %653)
  %655 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 64
  %656 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %655)
  %657 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 128
  %658 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %657)
  %659 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 192
  %660 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %659)
  %661 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 256
  %662 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %661)
  %663 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 320
  %664 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %663)
  %665 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 384
  %666 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %665)
  %667 = getelementptr inbounds i16, ptr addrspace(3) %653, i64 448
  %668 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %667)
  %669 = insertelement <8 x i16> undef, i16 %654, i32 0
  %670 = insertelement <8 x i16> %669, i16 %656, i32 1
  %671 = insertelement <8 x i16> %670, i16 %658, i32 2
  %672 = insertelement <8 x i16> %671, i16 %660, i32 3
  %673 = insertelement <8 x i16> %672, i16 %662, i32 4
  %674 = insertelement <8 x i16> %673, i16 %664, i32 5
  %675 = insertelement <8 x i16> %674, i16 %666, i32 6
  %676 = insertelement <8 x i16> %675, i16 %668, i32 7
  %677 = shl nuw nsw i32 %458, 7, !spirv.Decorations !743
  %678 = zext i32 %677 to i64
  %679 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %452, i64 %678
  %680 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %679)
  %681 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 64
  %682 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %681)
  %683 = insertelement <2 x i16> undef, i16 %680, i32 0
  %684 = insertelement <2 x i16> %683, i16 %682, i32 1
  %685 = bitcast <2 x i16> %684 to i32
  %686 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 128
  %687 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %686)
  %688 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 192
  %689 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %688)
  %690 = insertelement <2 x i16> undef, i16 %687, i32 0
  %691 = insertelement <2 x i16> %690, i16 %689, i32 1
  %692 = bitcast <2 x i16> %691 to i32
  %693 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 256
  %694 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %693)
  %695 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 320
  %696 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %695)
  %697 = insertelement <2 x i16> undef, i16 %694, i32 0
  %698 = insertelement <2 x i16> %697, i16 %696, i32 1
  %699 = bitcast <2 x i16> %698 to i32
  %700 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 384
  %701 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %700)
  %702 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 448
  %703 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %702)
  %704 = insertelement <2 x i16> undef, i16 %701, i32 0
  %705 = insertelement <2 x i16> %704, i16 %703, i32 1
  %706 = bitcast <2 x i16> %705 to i32
  %707 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 512
  %708 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %707)
  %709 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 576
  %710 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %709)
  %711 = insertelement <2 x i16> undef, i16 %708, i32 0
  %712 = insertelement <2 x i16> %711, i16 %710, i32 1
  %713 = bitcast <2 x i16> %712 to i32
  %714 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 640
  %715 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %714)
  %716 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 704
  %717 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %716)
  %718 = insertelement <2 x i16> undef, i16 %715, i32 0
  %719 = insertelement <2 x i16> %718, i16 %717, i32 1
  %720 = bitcast <2 x i16> %719 to i32
  %721 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 768
  %722 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %721)
  %723 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 832
  %724 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %723)
  %725 = insertelement <2 x i16> undef, i16 %722, i32 0
  %726 = insertelement <2 x i16> %725, i16 %724, i32 1
  %727 = bitcast <2 x i16> %726 to i32
  %728 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 896
  %729 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %728)
  %730 = getelementptr inbounds i32, ptr addrspace(3) %679, i64 960
  %731 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %730)
  %732 = insertelement <2 x i16> undef, i16 %729, i32 0
  %733 = insertelement <2 x i16> %732, i16 %731, i32 1
  %734 = bitcast <2 x i16> %733 to i32
  %735 = insertelement <8 x i32> undef, i32 %685, i32 0
  %736 = insertelement <8 x i32> %735, i32 %692, i32 1
  %737 = insertelement <8 x i32> %736, i32 %699, i32 2
  %738 = insertelement <8 x i32> %737, i32 %706, i32 3
  %739 = insertelement <8 x i32> %738, i32 %713, i32 4
  %740 = insertelement <8 x i32> %739, i32 %720, i32 5
  %741 = insertelement <8 x i32> %740, i32 %727, i32 6
  %742 = insertelement <8 x i32> %741, i32 %734, i32 7
  %743 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %457, <8 x i16> %676, <8 x i32> %742, i32 12, i32 12, i32 8, i32 8, i1 false)
  %744 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 16
  %745 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %744)
  %746 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 144
  %747 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %746)
  %748 = insertelement <2 x i16> undef, i16 %745, i32 0
  %749 = insertelement <2 x i16> %748, i16 %747, i32 1
  %750 = bitcast <2 x i16> %749 to i32
  %751 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 272
  %752 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %751)
  %753 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 400
  %754 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %753)
  %755 = insertelement <2 x i16> undef, i16 %752, i32 0
  %756 = insertelement <2 x i16> %755, i16 %754, i32 1
  %757 = bitcast <2 x i16> %756 to i32
  %758 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 528
  %759 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %758)
  %760 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 656
  %761 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %760)
  %762 = insertelement <2 x i16> undef, i16 %759, i32 0
  %763 = insertelement <2 x i16> %762, i16 %761, i32 1
  %764 = bitcast <2 x i16> %763 to i32
  %765 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 784
  %766 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %765)
  %767 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 912
  %768 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %767)
  %769 = insertelement <2 x i16> undef, i16 %766, i32 0
  %770 = insertelement <2 x i16> %769, i16 %768, i32 1
  %771 = bitcast <2 x i16> %770 to i32
  %772 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1040
  %773 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %772)
  %774 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1168
  %775 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %774)
  %776 = insertelement <2 x i16> undef, i16 %773, i32 0
  %777 = insertelement <2 x i16> %776, i16 %775, i32 1
  %778 = bitcast <2 x i16> %777 to i32
  %779 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1296
  %780 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %779)
  %781 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1424
  %782 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %781)
  %783 = insertelement <2 x i16> undef, i16 %780, i32 0
  %784 = insertelement <2 x i16> %783, i16 %782, i32 1
  %785 = bitcast <2 x i16> %784 to i32
  %786 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1552
  %787 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %786)
  %788 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1680
  %789 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %788)
  %790 = insertelement <2 x i16> undef, i16 %787, i32 0
  %791 = insertelement <2 x i16> %790, i16 %789, i32 1
  %792 = bitcast <2 x i16> %791 to i32
  %793 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1808
  %794 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %793)
  %795 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1936
  %796 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %795)
  %797 = insertelement <2 x i16> undef, i16 %794, i32 0
  %798 = insertelement <2 x i16> %797, i16 %796, i32 1
  %799 = bitcast <2 x i16> %798 to i32
  %800 = insertelement <8 x i32> undef, i32 %750, i32 0
  %801 = insertelement <8 x i32> %800, i32 %757, i32 1
  %802 = insertelement <8 x i32> %801, i32 %764, i32 2
  %803 = insertelement <8 x i32> %802, i32 %771, i32 3
  %804 = insertelement <8 x i32> %803, i32 %778, i32 4
  %805 = insertelement <8 x i32> %804, i32 %785, i32 5
  %806 = insertelement <8 x i32> %805, i32 %792, i32 6
  %807 = insertelement <8 x i32> %806, i32 %799, i32 7
  %808 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %456, <8 x i16> %676, <8 x i32> %807, i32 12, i32 12, i32 8, i32 8, i1 false)
  %809 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 32
  %810 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %809)
  %811 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 160
  %812 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %811)
  %813 = insertelement <2 x i16> undef, i16 %810, i32 0
  %814 = insertelement <2 x i16> %813, i16 %812, i32 1
  %815 = bitcast <2 x i16> %814 to i32
  %816 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 288
  %817 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %816)
  %818 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 416
  %819 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %818)
  %820 = insertelement <2 x i16> undef, i16 %817, i32 0
  %821 = insertelement <2 x i16> %820, i16 %819, i32 1
  %822 = bitcast <2 x i16> %821 to i32
  %823 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 544
  %824 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %823)
  %825 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 672
  %826 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %825)
  %827 = insertelement <2 x i16> undef, i16 %824, i32 0
  %828 = insertelement <2 x i16> %827, i16 %826, i32 1
  %829 = bitcast <2 x i16> %828 to i32
  %830 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 800
  %831 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %830)
  %832 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 928
  %833 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %832)
  %834 = insertelement <2 x i16> undef, i16 %831, i32 0
  %835 = insertelement <2 x i16> %834, i16 %833, i32 1
  %836 = bitcast <2 x i16> %835 to i32
  %837 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1056
  %838 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %837)
  %839 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1184
  %840 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %839)
  %841 = insertelement <2 x i16> undef, i16 %838, i32 0
  %842 = insertelement <2 x i16> %841, i16 %840, i32 1
  %843 = bitcast <2 x i16> %842 to i32
  %844 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1312
  %845 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %844)
  %846 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1440
  %847 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %846)
  %848 = insertelement <2 x i16> undef, i16 %845, i32 0
  %849 = insertelement <2 x i16> %848, i16 %847, i32 1
  %850 = bitcast <2 x i16> %849 to i32
  %851 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1568
  %852 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %851)
  %853 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1696
  %854 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %853)
  %855 = insertelement <2 x i16> undef, i16 %852, i32 0
  %856 = insertelement <2 x i16> %855, i16 %854, i32 1
  %857 = bitcast <2 x i16> %856 to i32
  %858 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1824
  %859 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %858)
  %860 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1952
  %861 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %860)
  %862 = insertelement <2 x i16> undef, i16 %859, i32 0
  %863 = insertelement <2 x i16> %862, i16 %861, i32 1
  %864 = bitcast <2 x i16> %863 to i32
  %865 = insertelement <8 x i32> undef, i32 %815, i32 0
  %866 = insertelement <8 x i32> %865, i32 %822, i32 1
  %867 = insertelement <8 x i32> %866, i32 %829, i32 2
  %868 = insertelement <8 x i32> %867, i32 %836, i32 3
  %869 = insertelement <8 x i32> %868, i32 %843, i32 4
  %870 = insertelement <8 x i32> %869, i32 %850, i32 5
  %871 = insertelement <8 x i32> %870, i32 %857, i32 6
  %872 = insertelement <8 x i32> %871, i32 %864, i32 7
  %873 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %455, <8 x i16> %676, <8 x i32> %872, i32 12, i32 12, i32 8, i32 8, i1 false)
  %874 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 48
  %875 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %874)
  %876 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 176
  %877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %876)
  %878 = insertelement <2 x i16> undef, i16 %875, i32 0
  %879 = insertelement <2 x i16> %878, i16 %877, i32 1
  %880 = bitcast <2 x i16> %879 to i32
  %881 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 304
  %882 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %881)
  %883 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 432
  %884 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %883)
  %885 = insertelement <2 x i16> undef, i16 %882, i32 0
  %886 = insertelement <2 x i16> %885, i16 %884, i32 1
  %887 = bitcast <2 x i16> %886 to i32
  %888 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 560
  %889 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %888)
  %890 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 688
  %891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %890)
  %892 = insertelement <2 x i16> undef, i16 %889, i32 0
  %893 = insertelement <2 x i16> %892, i16 %891, i32 1
  %894 = bitcast <2 x i16> %893 to i32
  %895 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 816
  %896 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %895)
  %897 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 944
  %898 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %897)
  %899 = insertelement <2 x i16> undef, i16 %896, i32 0
  %900 = insertelement <2 x i16> %899, i16 %898, i32 1
  %901 = bitcast <2 x i16> %900 to i32
  %902 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1072
  %903 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %902)
  %904 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1200
  %905 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %904)
  %906 = insertelement <2 x i16> undef, i16 %903, i32 0
  %907 = insertelement <2 x i16> %906, i16 %905, i32 1
  %908 = bitcast <2 x i16> %907 to i32
  %909 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1328
  %910 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %909)
  %911 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1456
  %912 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %911)
  %913 = insertelement <2 x i16> undef, i16 %910, i32 0
  %914 = insertelement <2 x i16> %913, i16 %912, i32 1
  %915 = bitcast <2 x i16> %914 to i32
  %916 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1584
  %917 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %916)
  %918 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1712
  %919 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %918)
  %920 = insertelement <2 x i16> undef, i16 %917, i32 0
  %921 = insertelement <2 x i16> %920, i16 %919, i32 1
  %922 = bitcast <2 x i16> %921 to i32
  %923 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1840
  %924 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %923)
  %925 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %679, i64 1968
  %926 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %925)
  %927 = insertelement <2 x i16> undef, i16 %924, i32 0
  %928 = insertelement <2 x i16> %927, i16 %926, i32 1
  %929 = bitcast <2 x i16> %928 to i32
  %930 = insertelement <8 x i32> undef, i32 %880, i32 0
  %931 = insertelement <8 x i32> %930, i32 %887, i32 1
  %932 = insertelement <8 x i32> %931, i32 %894, i32 2
  %933 = insertelement <8 x i32> %932, i32 %901, i32 3
  %934 = insertelement <8 x i32> %933, i32 %908, i32 4
  %935 = insertelement <8 x i32> %934, i32 %915, i32 5
  %936 = insertelement <8 x i32> %935, i32 %922, i32 6
  %937 = insertelement <8 x i32> %936, i32 %929, i32 7
  %938 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %454, <8 x i16> %676, <8 x i32> %937, i32 12, i32 12, i32 8, i32 8, i1 false)
  %939 = add nuw nsw i32 %458, 16, !spirv.Decorations !743
  br label %453

940:                                              ; preds = %447
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %941

941:                                              ; preds = %940, %447
  br label %397

942:                                              ; preds = %397
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %23)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %22)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, i32 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, i64 %6, i64 %7, i64 %8, ptr addrspace(1) align 1 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 4 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, i32 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
  %21 = extractelement <3 x i32> %localSize, i32 0
  %22 = extractelement <3 x i32> %localSize, i32 1
  %23 = extractelement <3 x i32> %localSize, i32 2
  %24 = extractelement <8 x i32> %r0, i32 0
  %25 = extractelement <8 x i32> %r0, i32 1
  %26 = extractelement <8 x i32> %r0, i32 2
  %27 = extractelement <8 x i32> %r0, i32 3
  %28 = extractelement <8 x i32> %r0, i32 4
  %29 = extractelement <8 x i32> %r0, i32 5
  %30 = extractelement <8 x i32> %r0, i32 6
  %31 = extractelement <8 x i32> %r0, i32 7
  %32 = alloca [4 x float], align 4, !spirv.Decorations !739
  %33 = alloca [4 x float], align 4, !spirv.Decorations !739
  %34 = alloca [4 x float], align 4, !spirv.Decorations !739
  %35 = zext i16 %localIdX to i32
  %36 = zext i32 %25 to i64
  %37 = icmp sgt i32 %25, -1
  call void @llvm.assume(i1 %37)
  %38 = bitcast <8 x i32> %r0 to <32 x i8>
  %39 = extractelement <32 x i8> %38, i32 0
  %40 = extractelement <32 x i8> %38, i32 1
  %41 = extractelement <32 x i8> %38, i32 2
  %42 = extractelement <32 x i8> %38, i32 3
  %43 = extractelement <32 x i8> %38, i32 4
  %44 = extractelement <32 x i8> %38, i32 5
  %45 = extractelement <32 x i8> %38, i32 6
  %46 = extractelement <32 x i8> %38, i32 7
  %47 = extractelement <32 x i8> %38, i32 8
  %48 = extractelement <32 x i8> %38, i32 9
  %49 = extractelement <32 x i8> %38, i32 10
  %50 = extractelement <32 x i8> %38, i32 11
  %51 = extractelement <32 x i8> %38, i32 12
  %52 = extractelement <32 x i8> %38, i32 13
  %53 = extractelement <32 x i8> %38, i32 14
  %54 = extractelement <32 x i8> %38, i32 15
  %55 = extractelement <32 x i8> %38, i32 16
  %56 = extractelement <32 x i8> %38, i32 17
  %57 = extractelement <32 x i8> %38, i32 18
  %58 = extractelement <32 x i8> %38, i32 19
  %59 = extractelement <32 x i8> %38, i32 20
  %60 = extractelement <32 x i8> %38, i32 21
  %61 = extractelement <32 x i8> %38, i32 22
  %62 = extractelement <32 x i8> %38, i32 23
  %63 = extractelement <32 x i8> %38, i32 24
  %64 = extractelement <32 x i8> %38, i32 25
  %65 = extractelement <32 x i8> %38, i32 26
  %66 = extractelement <32 x i8> %38, i32 27
  %67 = extractelement <32 x i8> %38, i32 28
  %68 = extractelement <32 x i8> %38, i32 29
  %69 = extractelement <32 x i8> %38, i32 30
  %70 = extractelement <32 x i8> %38, i32 31
  %localThreadId26 = zext i8 %47 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %71 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %71)
  %72 = sdiv i32 %25, %0
  %freeze = freeze i32 %72
  %73 = mul nsw i32 %freeze, %0, !spirv.Decorations !741
  %74 = sub nsw i32 %25, %73, !spirv.Decorations !741
  %75 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %76 = icmp eq ptr addrspace(1) %1, %75
  %77 = select i1 %76, ptr addrspace(1) %2, ptr addrspace(1) %1
  %78 = load i32, ptr addrspace(1) %77, align 4
  %79 = sext i32 %78 to i64
  %80 = sext i32 %74 to i64
  %81 = shl nsw i64 %80, 6, !spirv.Decorations !741
  %82 = sub nsw i64 %79, %81, !spirv.Decorations !741
  %83 = call i64 @llvm.smin.i64(i64 %82, i64 64)
  %84 = call i64 @llvm.smax.i64(i64 %83, i64 0)
  %85 = trunc i64 %84 to i32
  %86 = icmp slt i32 %85, 1
  br i1 %86, label %548, label %87

87:                                               ; preds = %20
  %88 = icmp slt i32 %3, 2
  br i1 %88, label %89, label %92

89:                                               ; preds = %87
  %90 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %80
  %91 = load i32, ptr addrspace(1) %90, align 4
  br label %101

92:                                               ; preds = %87
  %93 = sdiv i32 %74, %3
  %freeze53 = freeze i32 %93
  %94 = sext i32 %freeze53 to i64
  %95 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %94
  %96 = load i32, ptr addrspace(1) %95, align 4
  %97 = mul nsw i32 %96, %3, !spirv.Decorations !741
  %98 = mul i32 %freeze53, %3
  %99 = sub i32 %74, %98
  %100 = add nsw i32 %97, %99, !spirv.Decorations !741
  br label %101

101:                                              ; preds = %92, %89
  %102 = phi i32 [ %91, %89 ], [ %100, %92 ]
  %103 = sext i32 %freeze to i64
  %104 = shl nsw i64 %103, 6, !spirv.Decorations !741
  %105 = shl nsw i64 %103, 14, !spirv.Decorations !741
  %106 = shl nuw nsw i64 %36, 6, !spirv.Decorations !743
  %107 = shl nuw nsw i64 %36, 14, !spirv.Decorations !743
  %108 = sext i32 %102 to i64
  %109 = mul i64 %108, %6
  %110 = shl nsw i64 %103, 8, !spirv.Decorations !741
  %111 = mul i64 %108, %7
  %112 = shl nsw i64 %103, 7, !spirv.Decorations !741
  %113 = mul i64 %108, %8
  %114 = add i64 %113, %103
  %115 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %105
  %116 = getelementptr i8, ptr addrspace(1) %10, i64 %109
  %117 = getelementptr i8, ptr addrspace(1) %116, i64 %110
  %118 = getelementptr inbounds float, ptr addrspace(1) %11, i64 %107
  %119 = icmp ult i8 %47, 4
  br i1 %119, label %120, label %182

120:                                              ; preds = %101
  %121 = shl nuw nsw i32 %localThreadId26, 13, !spirv.Decorations !743
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i8, ptr addrspace(1) %117, i64 %122
  br label %124

124:                                              ; preds = %164, %120
  %125 = phi <8 x i32> [ zeroinitializer, %120 ], [ %180, %164 ]
  %126 = phi i32 [ 0, %120 ], [ %181, %164 ]
  %127 = extractelement <8 x i32> %125, i32 0
  %128 = extractelement <8 x i32> %125, i32 1
  %129 = extractelement <8 x i32> %125, i32 2
  %130 = extractelement <8 x i32> %125, i32 3
  %131 = extractelement <8 x i32> %125, i32 4
  %132 = extractelement <8 x i32> %125, i32 5
  %133 = extractelement <8 x i32> %125, i32 6
  %134 = extractelement <8 x i32> %125, i32 7
  %135 = icmp ult i32 %126, 256
  br i1 %135, label %164, label %136

136:                                              ; preds = %124
  %137 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !743
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM, i64 %138
  %140 = mul i32 %22, %21
  %141 = mul i32 %140, %23
  %142 = and i32 %141, 15
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %156, label %144

144:                                              ; preds = %136
  %localIdZ30 = zext i16 %localIdZ to i32
  %145 = mul i32 %22, %localIdZ30
  %localIdY32 = zext i16 %localIdY to i32
  %146 = add i32 %145, %localIdY32
  %147 = mul i32 %146, %21
  %localIdX34 = zext i16 %localIdX to i32
  %148 = add i32 %147, %localIdX34
  %149 = lshr i32 %148, 4
  %150 = mul i32 %22, %21
  %151 = mul i32 %150, %23
  %152 = add i32 %151, 15
  %153 = lshr i32 %152, 4
  %154 = add nsw i32 %153, -1
  %155 = icmp ult i32 %149, %154
  br i1 %155, label %156, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

156:                                              ; preds = %144, %136
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %144, %156
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %139, i32 %127)
  %157 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 64
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %157, i32 %128)
  %158 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 128
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %158, i32 %129)
  %159 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %159, i32 %130)
  %160 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 256
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %160, i32 %131)
  %161 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 320
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %161, i32 %132)
  %162 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 384
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %162, i32 %133)
  %163 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 448
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %163, i32 %134)
  br label %182

164:                                              ; preds = %124
  %165 = zext i32 %126 to i64
  %166 = getelementptr inbounds i8, ptr addrspace(1) %115, i64 %165
  %.ascast.i10 = addrspacecast ptr addrspace(1) %166 to ptr addrspace(4)
  %167 = ptrtoint ptr addrspace(4) %.ascast.i10 to i64
  %168 = and i64 %167, -64
  %169 = trunc i64 %167 to i32
  %170 = lshr i32 %169, 1
  %171 = and i32 %170, 31
  %172 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %168, i32 255, i32 7, i32 255, i32 %171, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %173 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 %165
  %.ascast.i11 = addrspacecast ptr addrspace(1) %173 to ptr addrspace(4)
  %174 = ptrtoint ptr addrspace(4) %.ascast.i11 to i64
  %175 = and i64 %174, -64
  %176 = trunc i64 %174 to i32
  %177 = lshr i32 %176, 2
  %178 = and i32 %177, 15
  %179 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %175, i32 511, i32 15, i32 511, i32 %178, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %180 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %125, <8 x i16> %172, <8 x i32> %179, i32 4, i32 4, i32 8, i32 8, i1 false)
  %181 = add nuw nsw i32 %126, 32, !spirv.Decorations !743
  br label %124

182:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit, %101
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %183 = zext i8 %47 to i64
  %184 = getelementptr float, ptr addrspace(1) %12, i64 %104
  %185 = getelementptr float, ptr addrspace(1) %184, i64 %183
  %186 = load float, ptr addrspace(1) %185, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %32)
  %187 = shl nuw nsw i32 %simdLaneId, 1, !spirv.Decorations !756
  %188 = getelementptr float, ptr addrspace(1) %13, i64 %114
  br label %189

189:                                              ; preds = %196, %182
  %190 = phi i32 [ 0, %182 ], [ %204, %196 ]
  %191 = icmp ult i32 %190, 4
  br i1 %191, label %196, label %192

192:                                              ; preds = %189
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %33)
  %193 = udiv i32 %localThreadId26, 6
  %194 = mul nsw i32 %14, 6, !spirv.Decorations !741
  %195 = icmp sgt i32 %194, %localThreadId26
  br i1 %195, label %205, label %218

196:                                              ; preds = %189
  %197 = shl nuw nsw i32 %190, 5, !spirv.Decorations !743
  %198 = add nuw i32 %197, %187
  %199 = zext i32 %198 to i64
  %200 = getelementptr float, ptr addrspace(1) %188, i64 %199
  %201 = load float, ptr addrspace(1) %200, align 4
  %202 = zext i32 %190 to i64
  %203 = getelementptr inbounds [4 x float], ptr %32, i64 0, i64 %202
  store float %201, ptr %203, align 4
  %204 = add nuw nsw i32 %190, 1, !spirv.Decorations !743
  br label %189, !llvm.loop !757

205:                                              ; preds = %192
  br i1 %76, label %212, label %206

206:                                              ; preds = %205
  %207 = zext i32 %193 to i64
  %208 = getelementptr i32, ptr addrspace(1) %1, i64 %207
  %209 = getelementptr i32, ptr addrspace(1) %208, i64 1
  %210 = load i32, ptr addrspace(1) %209, align 4
  %211 = sext i32 %210 to i64
  br label %218

212:                                              ; preds = %205
  %213 = sext i32 %14 to i64
  %214 = sub nsw i64 %79, %213, !spirv.Decorations !741
  %215 = zext i32 %193 to i64
  %216 = add nsw i64 %214, %215, !spirv.Decorations !741
  %217 = add nsw i64 %216, 1, !spirv.Decorations !741
  br label %218

218:                                              ; preds = %212, %206, %192
  %219 = phi i64 [ %211, %206 ], [ %217, %212 ], [ 0, %192 ]
  %220 = shl nuw nsw i32 %localThreadId26, 6, !spirv.Decorations !741
  %221 = sub nsw i64 %219, %81, !spirv.Decorations !741
  br label %222

222:                                              ; preds = %229, %218
  %223 = phi i32 [ 0, %218 ], [ %252, %229 ]
  %224 = phi float [ 0xFFF0000000000000, %218 ], [ %251, %229 ]
  %225 = icmp ult i32 %223, 4
  br i1 %225, label %229, label %226

226:                                              ; preds = %222
  %227 = call float @llvm.genx.GenISA.WaveAll.f32(float %224, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %34)
  %228 = fcmp reassoc nsz arcp contract oeq float %227, 0xFFF0000000000000, !spirv.Decorations !748
  br i1 %228, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %226
  br label %260

.preheader3:                                      ; preds = %226
  br label %253

229:                                              ; preds = %222
  %230 = shl nuw nsw i32 %223, 4, !spirv.Decorations !743
  %231 = add nuw nsw i32 %230, %simdLaneId, !spirv.Decorations !743
  %232 = or i32 %220, %230
  %233 = add nuw nsw i32 %232, %simdLaneId, !spirv.Decorations !743
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM, i64 %234
  %236 = load i32, ptr addrspace(3) %235, align 4
  %237 = sitofp i32 %236 to float
  %238 = fmul reassoc nsz arcp contract float %186, %237, !spirv.Decorations !748
  %239 = zext i32 %223 to i64
  %240 = getelementptr inbounds [4 x float], ptr %32, i64 0, i64 %239
  %241 = load float, ptr %240, align 4
  %242 = fmul reassoc nsz arcp contract float %238, %241, !spirv.Decorations !748
  %243 = fmul reassoc nsz arcp contract float %242, 6.250000e-02, !spirv.Decorations !748
  %244 = zext i32 %231 to i64
  %245 = icmp slt i32 %231, %85
  %246 = icmp sgt i64 %221, %244
  %247 = and i1 %245, %195
  %248 = select i1 %247, i1 %246, i1 false
  %249 = select i1 %248, float %243, float 0xFFF0000000000000
  %250 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %239
  store float %249, ptr %250, align 4
  %251 = call float @llvm.maxnum.f32(float %224, float %249)
  %252 = add nuw nsw i32 %223, 1, !spirv.Decorations !743
  br label %222

253:                                              ; preds = %256, %.preheader3
  %254 = phi i32 [ %259, %256 ], [ 0, %.preheader3 ]
  %255 = icmp ult i32 %254, 4
  br i1 %255, label %256, label %.loopexit4

256:                                              ; preds = %253
  %257 = zext i32 %254 to i64
  %258 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %257
  store float 0.000000e+00, ptr %258, align 4
  %259 = add nuw nsw i32 %254, 1, !spirv.Decorations !743
  br label %253

260:                                              ; preds = %264, %.preheader5
  %261 = phi float [ %282, %264 ], [ 0.000000e+00, %.preheader5 ]
  %262 = phi i32 [ %283, %264 ], [ 0, %.preheader5 ]
  %263 = icmp ult i32 %262, 4
  br i1 %263, label %264, label %284

264:                                              ; preds = %260
  %265 = zext i32 %262 to i64
  %266 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %265
  %267 = load float, ptr %266, align 4
  %268 = fsub reassoc nsz arcp contract float %267, %227, !spirv.Decorations !748
  %269 = fmul float %268, 0x3FF7154760000000
  %270 = call float @llvm.trunc.f32(float %269)
  %271 = call float @llvm.fma.f32(float %270, float 0xBFE62E4000000000, float %268)
  %272 = call float @llvm.fma.f32(float %270, float 0xBEB7F7D1C0000000, float %271)
  %273 = fmul float %272, 0x3FF7154760000000
  %274 = call float @llvm.exp2.f32(float %270)
  %275 = call float @llvm.exp2.f32(float %273)
  %276 = fmul float %274, %275
  %277 = fcmp olt float %268, -1.050000e+02
  %278 = select i1 %277, float 0.000000e+00, float %276
  %279 = fcmp ogt float %268, 1.050000e+02
  %280 = select i1 %279, float 0x7FF0000000000000, float %278
  %281 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %265
  store float %280, ptr %281, align 4
  %282 = fadd reassoc nsz arcp contract float %261, %280, !spirv.Decorations !748
  %283 = add nuw nsw i32 %262, 1, !spirv.Decorations !743
  br label %260

284:                                              ; preds = %260
  %285 = call float @llvm.genx.GenISA.WaveAll.f32(float %261, i8 9, i1 true, i32 0)
  %286 = fcmp reassoc nsz arcp contract oeq float %285, 0.000000e+00, !spirv.Decorations !748
  br i1 %286, label %289, label %287

287:                                              ; preds = %284
  %288 = fdiv reassoc nsz arcp contract float 1.000000e+00, %285, !spirv.Decorations !748
  br label %289

.loopexit4:                                       ; preds = %253
  br label %289

289:                                              ; preds = %.loopexit4, %287, %284
  %290 = phi float [ %285, %287 ], [ %285, %284 ], [ 0.000000e+00, %.loopexit4 ]
  %291 = phi float [ %288, %287 ], [ 0.000000e+00, %284 ], [ 0.000000e+00, %.loopexit4 ]
  %292 = shl nuw nsw i32 %localThreadId26, 6, !spirv.Decorations !741
  br label %293

293:                                              ; preds = %298, %289
  %294 = phi i32 [ 0, %289 ], [ %310, %298 ]
  %295 = icmp ult i32 %294, 4
  br i1 %295, label %298, label %296

296:                                              ; preds = %293
  %297 = icmp eq i16 %simdLaneId16, 0
  br i1 %297, label %311, label %315

298:                                              ; preds = %293
  %299 = zext i32 %294 to i64
  %300 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %299
  %301 = load float, ptr %300, align 4
  %302 = fmul reassoc nsz arcp contract float %301, %291, !spirv.Decorations !748
  %303 = fptrunc float %302 to half
  %304 = shl nuw nsw i32 %294, 4, !spirv.Decorations !743
  %305 = or i32 %292, %304
  %306 = add nuw nsw i32 %305, %simdLaneId, !spirv.Decorations !743
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM, i64 0, i64 16384
  %309 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %308, i64 %307
  store half %303, ptr addrspace(3) %309, align 2
  %310 = add nuw nsw i32 %294, 1, !spirv.Decorations !743
  br label %293

311:                                              ; preds = %296
  %312 = add nuw nsw i64 %106, %183, !spirv.Decorations !743
  %313 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %312
  store float %227, ptr addrspace(1) %313, align 4
  %314 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %312
  store float %290, ptr addrspace(1) %314, align 4
  br label %315

315:                                              ; preds = %311, %296
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %34)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %32)
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %316 = lshr i32 %35, 1
  %317 = and i32 %35, 1
  %318 = shl nuw nsw i32 %316, 7, !spirv.Decorations !741
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM, i64 %319
  %321 = shl nuw nsw i32 %317, 6, !spirv.Decorations !743
  %322 = zext i32 %321 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %320, i64 %322
  %324 = icmp slt i32 %316, %85
  %325 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %114
  %326 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %114
  %327 = getelementptr i8, ptr addrspace(1) %17, i64 %111
  %328 = getelementptr i8, ptr addrspace(1) %327, i64 %112
  %329 = and i16 %localIdX, -2
  %330 = zext i16 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(1) %326, i64 %330
  %332 = getelementptr inbounds float, ptr addrspace(1) %325, i64 %330
  %333 = shl nuw nsw i32 %317, 5, !spirv.Decorations !743
  %334 = shl nuw nsw i32 %316, 8
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds i8, ptr addrspace(1) %328, i64 %335
  %337 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !741
  %338 = zext i32 %337 to i64
  %339 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM, i64 %338
  %340 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !741
  %341 = zext i32 %340 to i64
  %342 = getelementptr inbounds float, ptr addrspace(1) %118, i64 %341
  br label %343

343:                                              ; preds = %547, %315
  %344 = phi i32 [ 0, %315 ], [ %449, %547 ]
  %345 = icmp ult i32 %344, 256
  br i1 %345, label %346, label %.loopexit2

346:                                              ; preds = %343
  br i1 %324, label %354, label %.preheader

.preheader:                                       ; preds = %346
  br label %347

347:                                              ; preds = %350, %.preheader
  %348 = phi i32 [ %353, %350 ], [ 0, %.preheader ]
  %349 = icmp ult i32 %348, 64
  br i1 %349, label %350, label %.loopexit1

350:                                              ; preds = %347
  %351 = zext i32 %348 to i64
  %352 = getelementptr inbounds half, ptr addrspace(3) %323, i64 %351
  store half 0xH0000, ptr addrspace(3) %352, align 2
  %353 = add nuw nsw i32 %348, 1, !spirv.Decorations !743
  br label %347, !llvm.loop !758

354:                                              ; preds = %346
  %355 = load float, ptr addrspace(1) %331, align 4
  %356 = load float, ptr addrspace(1) %332, align 4
  %357 = lshr exact i32 %344, 1
  %358 = or i32 %357, %333
  %359 = zext i32 %358 to i64
  %360 = getelementptr inbounds i8, ptr addrspace(1) %336, i64 %359
  br label %361

361:                                              ; preds = %371, %354
  %362 = phi i32 [ 0, %354 ], [ %372, %371 ]
  %363 = icmp ult i32 %362, 32
  br i1 %363, label %364, label %.loopexit

364:                                              ; preds = %361
  %365 = zext i32 %362 to i64
  %366 = getelementptr inbounds i8, ptr addrspace(1) %360, i64 %365
  %367 = load i64, ptr addrspace(1) %366, align 1
  br label %368

368:                                              ; preds = %373, %364
  %369 = phi i32 [ 0, %364 ], [ %394, %373 ]
  %370 = icmp ult i32 %369, 8
  br i1 %370, label %373, label %371

371:                                              ; preds = %368
  %372 = add nuw nsw i32 %362, 8, !spirv.Decorations !743
  br label %361, !llvm.loop !759

373:                                              ; preds = %368
  %374 = shl nuw nsw i32 %369, 3, !spirv.Decorations !743
  %375 = zext i32 %374 to i64
  %376 = lshr i64 %367, %375
  %377 = trunc i64 %376 to i32
  %378 = and i32 %377, 15
  %379 = uitofp i32 %378 to float
  %380 = fsub reassoc nsz arcp contract float %379, %356, !spirv.Decorations !748
  %381 = fmul reassoc nsz arcp contract float %380, %355, !spirv.Decorations !748
  %382 = fptrunc float %381 to half
  %383 = or i32 %362, %369
  %384 = shl nuw nsw i32 %383, 1, !spirv.Decorations !743
  %385 = zext i32 %384 to i64
  %386 = getelementptr half, ptr addrspace(3) %323, i64 %385
  store half %382, ptr addrspace(3) %386, align 4
  %387 = lshr i32 %377, 4
  %388 = and i32 %387, 15
  %389 = uitofp i32 %388 to float
  %390 = fsub reassoc nsz arcp contract float %389, %356, !spirv.Decorations !748
  %391 = fmul reassoc nsz arcp contract float %390, %355, !spirv.Decorations !748
  %392 = fptrunc float %391 to half
  %393 = getelementptr half, ptr addrspace(3) %386, i64 1
  store half %392, ptr addrspace(3) %393, align 2
  %394 = add nuw nsw i32 %369, 1, !spirv.Decorations !743
  br label %368, !llvm.loop !760

.loopexit:                                        ; preds = %361
  br label %395

.loopexit1:                                       ; preds = %347
  br label %395

395:                                              ; preds = %.loopexit1, %.loopexit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %396

396:                                              ; preds = %451, %395
  %397 = phi <8 x float> [ zeroinitializer, %395 ], [ %544, %451 ]
  %398 = phi i32 [ 0, %395 ], [ %545, %451 ]
  %399 = extractelement <8 x float> %397, i32 0
  %400 = extractelement <8 x float> %397, i32 1
  %401 = extractelement <8 x float> %397, i32 2
  %402 = extractelement <8 x float> %397, i32 3
  %403 = extractelement <8 x float> %397, i32 4
  %404 = extractelement <8 x float> %397, i32 5
  %405 = extractelement <8 x float> %397, i32 6
  %406 = extractelement <8 x float> %397, i32 7
  %407 = icmp ult i32 %398, 64
  br i1 %407, label %451, label %408

408:                                              ; preds = %396
  %409 = zext i32 %344 to i64
  %410 = getelementptr inbounds float, ptr addrspace(1) %342, i64 %409
  %411 = bitcast float %399 to i32
  %412 = bitcast float %400 to i32
  %413 = bitcast float %401 to i32
  %414 = bitcast float %402 to i32
  %415 = bitcast float %403 to i32
  %416 = bitcast float %404 to i32
  %417 = bitcast float %405 to i32
  %418 = bitcast float %406 to i32
  %419 = insertelement <8 x i32> undef, i32 %411, i32 0
  %420 = insertelement <8 x i32> %419, i32 %412, i32 1
  %421 = insertelement <8 x i32> %420, i32 %413, i32 2
  %422 = insertelement <8 x i32> %421, i32 %414, i32 3
  %423 = insertelement <8 x i32> %422, i32 %415, i32 4
  %424 = insertelement <8 x i32> %423, i32 %416, i32 5
  %425 = insertelement <8 x i32> %424, i32 %417, i32 6
  %426 = insertelement <8 x i32> %425, i32 %418, i32 7
  %.ascast.i12 = addrspacecast ptr addrspace(1) %410 to ptr addrspace(4)
  %427 = mul i32 %22, %21
  %428 = mul i32 %427, %23
  %429 = and i32 %428, 15
  %430 = icmp eq i32 %429, 0
  br i1 %430, label %443, label %431

431:                                              ; preds = %408
  %localIdZ41 = zext i16 %localIdZ to i32
  %432 = mul i32 %22, %localIdZ41
  %localIdY43 = zext i16 %localIdY to i32
  %433 = add i32 %432, %localIdY43
  %434 = mul i32 %433, %21
  %localIdX45 = zext i16 %localIdX to i32
  %435 = add i32 %434, %localIdX45
  %436 = lshr i32 %435, 4
  %437 = mul i32 %22, %21
  %438 = mul i32 %437, %23
  %439 = add i32 %438, 15
  %440 = lshr i32 %439, 4
  %441 = add nsw i32 %440, -1
  %442 = icmp ult i32 %436, %441
  br i1 %442, label %443, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

443:                                              ; preds = %431, %408
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %431, %443
  %444 = ptrtoint ptr addrspace(4) %.ascast.i12 to i64
  %445 = and i64 %444, -64
  %446 = trunc i64 %444 to i32
  %447 = lshr i32 %446, 2
  %448 = and i32 %447, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %445, i32 1023, i32 7, i32 1023, i32 %448, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %426)
  %449 = add nuw nsw i32 %344, 128, !spirv.Decorations !743
  %450 = icmp eq i32 %344, 0
  br i1 %450, label %546, label %547

451:                                              ; preds = %396
  %452 = zext i32 %398 to i64
  %453 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM, i64 0, i64 16384
  %454 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %453, i64 %452
  %455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %454)
  %456 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 64
  %457 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %456)
  %458 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 128
  %459 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %458)
  %460 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 192
  %461 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %460)
  %462 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 256
  %463 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %462)
  %464 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 320
  %465 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %464)
  %466 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 384
  %467 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %466)
  %468 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 448
  %469 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %468)
  %470 = insertelement <8 x i16> undef, i16 %455, i32 0
  %471 = insertelement <8 x i16> %470, i16 %457, i32 1
  %472 = insertelement <8 x i16> %471, i16 %459, i32 2
  %473 = insertelement <8 x i16> %472, i16 %461, i32 3
  %474 = insertelement <8 x i16> %473, i16 %463, i32 4
  %475 = insertelement <8 x i16> %474, i16 %465, i32 5
  %476 = insertelement <8 x i16> %475, i16 %467, i32 6
  %477 = insertelement <8 x i16> %476, i16 %469, i32 7
  %478 = shl nuw nsw i32 %398, 7, !spirv.Decorations !743
  %479 = zext i32 %478 to i64
  %480 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %339, i64 %479
  %481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %480)
  %482 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 64
  %483 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %482)
  %484 = insertelement <2 x i16> undef, i16 %481, i32 0
  %485 = insertelement <2 x i16> %484, i16 %483, i32 1
  %486 = bitcast <2 x i16> %485 to i32
  %487 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 128
  %488 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %487)
  %489 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 192
  %490 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %489)
  %491 = insertelement <2 x i16> undef, i16 %488, i32 0
  %492 = insertelement <2 x i16> %491, i16 %490, i32 1
  %493 = bitcast <2 x i16> %492 to i32
  %494 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 256
  %495 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %494)
  %496 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 320
  %497 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %496)
  %498 = insertelement <2 x i16> undef, i16 %495, i32 0
  %499 = insertelement <2 x i16> %498, i16 %497, i32 1
  %500 = bitcast <2 x i16> %499 to i32
  %501 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 384
  %502 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %501)
  %503 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 448
  %504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %503)
  %505 = insertelement <2 x i16> undef, i16 %502, i32 0
  %506 = insertelement <2 x i16> %505, i16 %504, i32 1
  %507 = bitcast <2 x i16> %506 to i32
  %508 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 512
  %509 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %508)
  %510 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 576
  %511 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %510)
  %512 = insertelement <2 x i16> undef, i16 %509, i32 0
  %513 = insertelement <2 x i16> %512, i16 %511, i32 1
  %514 = bitcast <2 x i16> %513 to i32
  %515 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 640
  %516 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %515)
  %517 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 704
  %518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %517)
  %519 = insertelement <2 x i16> undef, i16 %516, i32 0
  %520 = insertelement <2 x i16> %519, i16 %518, i32 1
  %521 = bitcast <2 x i16> %520 to i32
  %522 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 768
  %523 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %522)
  %524 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 832
  %525 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %524)
  %526 = insertelement <2 x i16> undef, i16 %523, i32 0
  %527 = insertelement <2 x i16> %526, i16 %525, i32 1
  %528 = bitcast <2 x i16> %527 to i32
  %529 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 896
  %530 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %529)
  %531 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 960
  %532 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %531)
  %533 = insertelement <2 x i16> undef, i16 %530, i32 0
  %534 = insertelement <2 x i16> %533, i16 %532, i32 1
  %535 = bitcast <2 x i16> %534 to i32
  %536 = insertelement <8 x i32> undef, i32 %486, i32 0
  %537 = insertelement <8 x i32> %536, i32 %493, i32 1
  %538 = insertelement <8 x i32> %537, i32 %500, i32 2
  %539 = insertelement <8 x i32> %538, i32 %507, i32 3
  %540 = insertelement <8 x i32> %539, i32 %514, i32 4
  %541 = insertelement <8 x i32> %540, i32 %521, i32 5
  %542 = insertelement <8 x i32> %541, i32 %528, i32 6
  %543 = insertelement <8 x i32> %542, i32 %535, i32 7
  %544 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %397, <8 x i16> %477, <8 x i32> %543, i32 12, i32 12, i32 8, i32 8, i1 false)
  %545 = add nuw nsw i32 %398, 16, !spirv.Decorations !743
  br label %396

546:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %547

547:                                              ; preds = %546, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  br label %343

.loopexit2:                                       ; preds = %343
  br label %548

548:                                              ; preds = %.loopexit2, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
  %21 = extractelement <3 x i32> %localSize, i32 0
  %22 = extractelement <3 x i32> %localSize, i32 1
  %23 = extractelement <3 x i32> %localSize, i32 2
  %24 = extractelement <8 x i32> %r0, i32 0
  %25 = extractelement <8 x i32> %r0, i32 1
  %26 = extractelement <8 x i32> %r0, i32 2
  %27 = extractelement <8 x i32> %r0, i32 3
  %28 = extractelement <8 x i32> %r0, i32 4
  %29 = extractelement <8 x i32> %r0, i32 5
  %30 = extractelement <8 x i32> %r0, i32 6
  %31 = extractelement <8 x i32> %r0, i32 7
  %32 = alloca [8 x float], align 4, !spirv.Decorations !739
  %33 = alloca [4 x float], align 4, !spirv.Decorations !739
  %34 = alloca [8 x [2 x float]], align 4, !spirv.Decorations !739
  %35 = alloca [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], align 2, !spirv.Decorations !761
  %36 = alloca [4 x float], align 4, !spirv.Decorations !739
  %37 = alloca [4 x float], align 4, !spirv.Decorations !739
  %38 = zext i16 %localIdX to i32
  %39 = zext i32 %25 to i64
  %40 = icmp sgt i32 %25, -1
  call void @llvm.assume(i1 %40)
  %41 = bitcast <8 x i32> %r0 to <32 x i8>
  %42 = extractelement <32 x i8> %41, i32 0
  %43 = extractelement <32 x i8> %41, i32 1
  %44 = extractelement <32 x i8> %41, i32 2
  %45 = extractelement <32 x i8> %41, i32 3
  %46 = extractelement <32 x i8> %41, i32 4
  %47 = extractelement <32 x i8> %41, i32 5
  %48 = extractelement <32 x i8> %41, i32 6
  %49 = extractelement <32 x i8> %41, i32 7
  %50 = extractelement <32 x i8> %41, i32 8
  %51 = extractelement <32 x i8> %41, i32 9
  %52 = extractelement <32 x i8> %41, i32 10
  %53 = extractelement <32 x i8> %41, i32 11
  %54 = extractelement <32 x i8> %41, i32 12
  %55 = extractelement <32 x i8> %41, i32 13
  %56 = extractelement <32 x i8> %41, i32 14
  %57 = extractelement <32 x i8> %41, i32 15
  %58 = extractelement <32 x i8> %41, i32 16
  %59 = extractelement <32 x i8> %41, i32 17
  %60 = extractelement <32 x i8> %41, i32 18
  %61 = extractelement <32 x i8> %41, i32 19
  %62 = extractelement <32 x i8> %41, i32 20
  %63 = extractelement <32 x i8> %41, i32 21
  %64 = extractelement <32 x i8> %41, i32 22
  %65 = extractelement <32 x i8> %41, i32 23
  %66 = extractelement <32 x i8> %41, i32 24
  %67 = extractelement <32 x i8> %41, i32 25
  %68 = extractelement <32 x i8> %41, i32 26
  %69 = extractelement <32 x i8> %41, i32 27
  %70 = extractelement <32 x i8> %41, i32 28
  %71 = extractelement <32 x i8> %41, i32 29
  %72 = extractelement <32 x i8> %41, i32 30
  %73 = extractelement <32 x i8> %41, i32 31
  %localThreadId26 = zext i8 %50 to i32
  %74 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !741
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %75 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %75)
  %76 = mul nsw i32 %0, 6, !spirv.Decorations !741
  %77 = icmp slt i32 %74, %76
  %78 = sdiv i32 %25, %1
  %freeze = freeze i32 %78
  %79 = mul nsw i32 %freeze, %1, !spirv.Decorations !741
  %80 = sub nsw i32 %25, %79, !spirv.Decorations !741
  %81 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %82 = icmp eq ptr addrspace(1) %2, %81
  %83 = select i1 %82, ptr addrspace(1) %3, ptr addrspace(1) %2
  %84 = load i32, ptr addrspace(1) %83, align 4
  %85 = sext i32 %84 to i64
  %86 = sext i32 %80 to i64
  %87 = shl nsw i64 %86, 6, !spirv.Decorations !741
  %88 = sub nsw i64 %85, %87, !spirv.Decorations !741
  %89 = call i64 @llvm.smin.i64(i64 %88, i64 64)
  %90 = call i64 @llvm.smax.i64(i64 %89, i64 0)
  %91 = trunc i64 %90 to i32
  %92 = icmp slt i32 %91, 1
  br i1 %92, label %1885, label %93

93:                                               ; preds = %20
  %94 = icmp slt i32 %4, 2
  br i1 %94, label %95, label %98

95:                                               ; preds = %93
  %96 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %86
  %97 = load i32, ptr addrspace(1) %96, align 4
  br label %107

98:                                               ; preds = %93
  %99 = sdiv i32 %80, %4
  %freeze105 = freeze i32 %99
  %100 = sext i32 %freeze105 to i64
  %101 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %100
  %102 = load i32, ptr addrspace(1) %101, align 4
  %103 = mul nsw i32 %102, %4, !spirv.Decorations !741
  %104 = mul i32 %freeze105, %4
  %105 = sub i32 %80, %104
  %106 = add nsw i32 %103, %105, !spirv.Decorations !741
  br label %107

107:                                              ; preds = %98, %95
  %108 = phi i32 [ %97, %95 ], [ %106, %98 ]
  %109 = sext i32 %freeze to i64
  %110 = shl nsw i64 %109, 6, !spirv.Decorations !741
  %111 = shl nsw i64 %109, 14, !spirv.Decorations !741
  %112 = shl nuw nsw i64 %39, 6, !spirv.Decorations !743
  %113 = shl nuw nsw i64 %39, 14, !spirv.Decorations !743
  %114 = sext i32 %108 to i64
  %115 = mul i64 %114, %7
  %116 = shl nsw i64 %109, 8, !spirv.Decorations !741
  %117 = mul i64 %114, %8
  %118 = shl nsw i64 %109, 7, !spirv.Decorations !741
  %119 = mul i64 %114, %9
  %120 = add i64 %119, %109
  %121 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %111
  %122 = getelementptr i8, ptr addrspace(1) %11, i64 %115
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 %116
  %124 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %113
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %32)
  %125 = zext i32 %74 to i64
  %126 = getelementptr float, ptr addrspace(1) %13, i64 %110
  %127 = getelementptr float, ptr addrspace(1) %126, i64 %125
  br label %128

128:                                              ; preds = %134, %107
  %129 = phi i32 [ 0, %107 ], [ %139, %134 ]
  %130 = icmp ult i32 %129, 8
  br i1 %130, label %134, label %131

131:                                              ; preds = %128
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %33)
  %132 = shl nuw nsw i32 %simdLaneId, 1, !spirv.Decorations !756
  %133 = getelementptr float, ptr addrspace(1) %14, i64 %120
  br label %140

134:                                              ; preds = %128
  %135 = zext i32 %129 to i64
  %136 = getelementptr inbounds float, ptr addrspace(1) %127, i64 %135
  %137 = load float, ptr addrspace(1) %136, align 4
  %138 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %135
  store float %137, ptr %138, align 4
  %139 = add nuw nsw i32 %129, 1, !spirv.Decorations !743
  br label %128, !llvm.loop !763

140:                                              ; preds = %152, %131
  %141 = phi i32 [ 0, %131 ], [ %160, %152 ]
  %142 = icmp ult i32 %141, 4
  br i1 %142, label %152, label %143

143:                                              ; preds = %140
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %34)
  %144 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !741
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 %145
  %147 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 8192
  %148 = shl nuw nsw i32 %localThreadId26, 8, !spirv.Decorations !741
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 %149
  %151 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 16
  br label %161

152:                                              ; preds = %140
  %153 = shl nuw nsw i32 %141, 5, !spirv.Decorations !743
  %154 = add nuw i32 %153, %132
  %155 = zext i32 %154 to i64
  %156 = getelementptr float, ptr addrspace(1) %133, i64 %155
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = zext i32 %141 to i64
  %159 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %158
  store float %157, ptr %159, align 4
  %160 = add nuw nsw i32 %141, 1, !spirv.Decorations !743
  br label %140, !llvm.loop !764

161:                                              ; preds = %308, %143
  %162 = phi i32 [ 0, %143 ], [ %309, %308 ]
  %163 = icmp ult i32 %162, 2
  br i1 %163, label %172, label %164

164:                                              ; preds = %161
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %35)
  br i1 %77, label %165, label %310

165:                                              ; preds = %164
  %166 = getelementptr i32, ptr addrspace(1) %2, i64 1
  %167 = sext i32 %0 to i64
  %168 = sub nsw i64 %85, %167, !spirv.Decorations !741
  %169 = add nsw i64 %168, 1, !spirv.Decorations !741
  %170 = or i32 %simdLaneId, -32
  %171 = icmp eq i16 %simdLaneId16, 0
  br label %319

172:                                              ; preds = %161
  br i1 %77, label %173, label %275

173:                                              ; preds = %172
  %174 = shl nuw nsw i32 %162, 14, !spirv.Decorations !743
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 %175
  %177 = zext i32 %174 to i64
  %178 = getelementptr inbounds i8, ptr addrspace(1) %147, i64 %177
  br label %179

179:                                              ; preds = %249, %173
  %180 = phi <8 x i32> [ zeroinitializer, %173 ], [ %273, %249 ]
  %181 = phi <8 x i32> [ zeroinitializer, %173 ], [ %265, %249 ]
  %182 = phi i32 [ 0, %173 ], [ %274, %249 ]
  %183 = extractelement <8 x i32> %180, i32 0
  %184 = extractelement <8 x i32> %180, i32 1
  %185 = extractelement <8 x i32> %180, i32 2
  %186 = extractelement <8 x i32> %180, i32 3
  %187 = extractelement <8 x i32> %180, i32 4
  %188 = extractelement <8 x i32> %180, i32 5
  %189 = extractelement <8 x i32> %180, i32 6
  %190 = extractelement <8 x i32> %180, i32 7
  %191 = extractelement <8 x i32> %181, i32 0
  %192 = extractelement <8 x i32> %181, i32 1
  %193 = extractelement <8 x i32> %181, i32 2
  %194 = extractelement <8 x i32> %181, i32 3
  %195 = extractelement <8 x i32> %181, i32 4
  %196 = extractelement <8 x i32> %181, i32 5
  %197 = extractelement <8 x i32> %181, i32 6
  %198 = extractelement <8 x i32> %181, i32 7
  %199 = icmp ult i32 %182, 256
  br i1 %199, label %249, label %200

200:                                              ; preds = %179
  %201 = mul i32 %22, %21
  %202 = mul i32 %201, %23
  %203 = and i32 %202, 15
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %217, label %205

205:                                              ; preds = %200
  %localIdZ30 = zext i16 %localIdZ to i32
  %206 = mul i32 %22, %localIdZ30
  %localIdY32 = zext i16 %localIdY to i32
  %207 = add i32 %206, %localIdY32
  %208 = mul i32 %207, %21
  %localIdX34 = zext i16 %localIdX to i32
  %209 = add i32 %208, %localIdX34
  %210 = lshr i32 %209, 4
  %211 = mul i32 %22, %21
  %212 = mul i32 %211, %23
  %213 = add i32 %212, 15
  %214 = lshr i32 %213, 4
  %215 = add nsw i32 %214, -1
  %216 = icmp ult i32 %210, %215
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

217:                                              ; preds = %205, %200
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %205, %217
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %150, i32 %191)
  %218 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 32
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %218, i32 %192)
  %219 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 64
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %219, i32 %193)
  %220 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 96
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %220, i32 %194)
  %221 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 128
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %221, i32 %195)
  %222 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 160
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %222, i32 %196)
  %223 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %223, i32 %197)
  %224 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 224
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %224, i32 %198)
  %225 = mul i32 %22, %21
  %226 = mul i32 %225, %23
  %227 = and i32 %226, 15
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %241, label %229

229:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  %localIdZ41 = zext i16 %localIdZ to i32
  %230 = mul i32 %22, %localIdZ41
  %localIdY43 = zext i16 %localIdY to i32
  %231 = add i32 %230, %localIdY43
  %232 = mul i32 %231, %21
  %localIdX45 = zext i16 %localIdX to i32
  %233 = add i32 %232, %localIdX45
  %234 = lshr i32 %233, 4
  %235 = mul i32 %22, %21
  %236 = mul i32 %235, %23
  %237 = add i32 %236, 15
  %238 = lshr i32 %237, 4
  %239 = add nsw i32 %238, -1
  %240 = icmp ult i32 %234, %239
  br i1 %240, label %241, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit54

241:                                              ; preds = %229, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit54

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit54: ; preds = %229, %241
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %151, i32 %183)
  %242 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 48
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %242, i32 %184)
  %243 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 80
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %243, i32 %185)
  %244 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 112
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %244, i32 %186)
  %245 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 144
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %245, i32 %187)
  %246 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 176
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %246, i32 %188)
  %247 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 208
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %247, i32 %189)
  %248 = getelementptr inbounds i32, ptr addrspace(3) %150, i64 240
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %248, i32 %190)
  br label %275

249:                                              ; preds = %179
  %250 = zext i32 %182 to i64
  %251 = getelementptr inbounds i8, ptr addrspace(1) %146, i64 %250
  %.ascast.i55 = addrspacecast ptr addrspace(1) %251 to ptr addrspace(4)
  %252 = ptrtoint ptr addrspace(4) %.ascast.i55 to i64
  %253 = and i64 %252, -64
  %254 = trunc i64 %252 to i32
  %255 = lshr i32 %254, 1
  %256 = and i32 %255, 31
  %257 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %253, i32 255, i32 7, i32 255, i32 %256, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %258 = getelementptr inbounds i8, ptr addrspace(1) %176, i64 %250
  %.ascast.i56 = addrspacecast ptr addrspace(1) %258 to ptr addrspace(4)
  %259 = ptrtoint ptr addrspace(4) %.ascast.i56 to i64
  %260 = and i64 %259, -64
  %261 = trunc i64 %259 to i32
  %262 = lshr i32 %261, 2
  %263 = and i32 %262, 15
  %264 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %260, i32 511, i32 15, i32 511, i32 %263, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %265 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %181, <8 x i16> %257, <8 x i32> %264, i32 4, i32 4, i32 8, i32 8, i1 false)
  %266 = getelementptr inbounds i8, ptr addrspace(1) %178, i64 %250
  %.ascast.i57 = addrspacecast ptr addrspace(1) %266 to ptr addrspace(4)
  %267 = ptrtoint ptr addrspace(4) %.ascast.i57 to i64
  %268 = and i64 %267, -64
  %269 = trunc i64 %267 to i32
  %270 = lshr i32 %269, 2
  %271 = and i32 %270, 15
  %272 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %268, i32 511, i32 15, i32 511, i32 %271, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %273 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %180, <8 x i16> %257, <8 x i32> %272, i32 4, i32 4, i32 8, i32 8, i1 false)
  %274 = add nuw nsw i32 %182, 32, !spirv.Decorations !743
  br label %179

275:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit54, %172
  call void @llvm.genx.GenISA.wavebarrier()
  %276 = icmp eq i32 %162, 0
  %277 = select i1 %276, i1 %77, i1 false
  br i1 %277, label %.preheader8, label %308

.preheader8:                                      ; preds = %275
  br label %278

278:                                              ; preds = %290, %.preheader8
  %279 = phi i32 [ %291, %290 ], [ 0, %.preheader8 ]
  %280 = icmp ult i32 %279, 8
  br i1 %280, label %281, label %.loopexit9

281:                                              ; preds = %278
  %282 = or i32 %74, %279
  %283 = shl nsw i32 %282, 5, !spirv.Decorations !741
  %284 = zext i32 %279 to i64
  %285 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %284
  %286 = load float, ptr %285, align 4
  br label %287

287:                                              ; preds = %292, %281
  %288 = phi i32 [ %307, %292 ], [ 0, %281 ]
  %289 = icmp ult i32 %288, 2
  br i1 %289, label %292, label %290

290:                                              ; preds = %287
  %291 = add nuw nsw i32 %279, 1, !spirv.Decorations !743
  br label %278, !llvm.loop !765

292:                                              ; preds = %287
  %293 = shl nuw nsw i32 %288, 4, !spirv.Decorations !743
  %294 = or i32 %283, %293
  %295 = add nuw nsw i32 %294, %simdLaneId, !spirv.Decorations !743
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 %296
  %298 = load i32, ptr addrspace(3) %297, align 4
  %299 = sitofp i32 %298 to float
  %300 = fmul reassoc nsz arcp contract float %286, %299, !spirv.Decorations !748
  %301 = zext i32 %288 to i64
  %302 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %301
  %303 = load float, ptr %302, align 4
  %304 = fmul reassoc nsz arcp contract float %300, %303, !spirv.Decorations !748
  %305 = fmul reassoc nsz arcp contract float %304, 6.250000e-02, !spirv.Decorations !748
  %306 = getelementptr inbounds [8 x [2 x float]], ptr %34, i64 0, i64 %284, i64 %301
  store float %305, ptr %306, align 4
  %307 = add nuw nsw i32 %288, 1, !spirv.Decorations !743
  br label %287, !llvm.loop !766

.loopexit9:                                       ; preds = %278
  br label %308

308:                                              ; preds = %.loopexit9, %275
  call void @llvm.genx.GenISA.wavebarrier()
  %309 = add nuw nsw i32 %162, 1, !spirv.Decorations !743
  br label %161

310:                                              ; preds = %164
  %311 = icmp ult i16 %simdLaneId16, 8
  br i1 %311, label %312, label %440

312:                                              ; preds = %310
  %313 = zext i32 %74 to i64
  %314 = add nuw nsw i64 %112, %313, !spirv.Decorations !743
  %315 = zext i16 %simdLaneId16 to i64
  %316 = or i64 %314, %315
  %317 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %316
  store float 0xFFF0000000000000, ptr addrspace(1) %317, align 4
  %318 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %316
  store float 0.000000e+00, ptr addrspace(1) %318, align 4
  br label %440

319:                                              ; preds = %438, %165
  %320 = phi i32 [ %439, %438 ], [ 0, %165 ]
  %321 = icmp ult i32 %320, 8
  br i1 %321, label %322, label %.loopexit7

322:                                              ; preds = %319
  %323 = or i32 %74, %320
  %324 = zext i32 %320 to i64
  %325 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %324
  %326 = load float, ptr %325, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %36)
  %327 = udiv i32 %323, 6
  %328 = icmp slt i32 %323, %76
  br i1 %328, label %329, label %338

329:                                              ; preds = %322
  br i1 %82, label %335, label %330

330:                                              ; preds = %329
  %331 = zext i32 %327 to i64
  %332 = getelementptr i32, ptr addrspace(1) %166, i64 %331
  %333 = load i32, ptr addrspace(1) %332, align 4
  %334 = sext i32 %333 to i64
  br label %338

335:                                              ; preds = %329
  %336 = zext i32 %327 to i64
  %337 = add nsw i64 %169, %336, !spirv.Decorations !741
  br label %338

338:                                              ; preds = %335, %330, %322
  %339 = phi i64 [ %334, %330 ], [ %337, %335 ], [ 0, %322 ]
  %340 = shl nsw i32 %323, 5, !spirv.Decorations !741
  %341 = add nsw i32 %340, %170
  %342 = sub nsw i64 %339, %87, !spirv.Decorations !741
  br label %343

343:                                              ; preds = %370, %338
  %344 = phi float [ 0xFFF0000000000000, %338 ], [ %380, %370 ]
  %345 = phi i32 [ 0, %338 ], [ %381, %370 ]
  %346 = icmp ult i32 %345, 4
  br i1 %346, label %350, label %347

347:                                              ; preds = %343
  %348 = call float @llvm.genx.GenISA.WaveAll.f32(float %344, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %37)
  %349 = fcmp reassoc nsz arcp contract oeq float %348, 0xFFF0000000000000, !spirv.Decorations !748
  br i1 %349, label %.preheader4, label %.preheader6

.preheader6:                                      ; preds = %347
  br label %389

.preheader4:                                      ; preds = %347
  br label %382

350:                                              ; preds = %343
  %351 = shl nuw nsw i32 %345, 4, !spirv.Decorations !743
  %352 = add nuw nsw i32 %351, %simdLaneId, !spirv.Decorations !743
  %353 = icmp ult i32 %345, 2
  br i1 %353, label %354, label %358

354:                                              ; preds = %350
  %355 = zext i32 %345 to i64
  %356 = getelementptr inbounds [8 x [2 x float]], ptr %34, i64 0, i64 %324, i64 %355
  %357 = load float, ptr %356, align 4
  br label %370

358:                                              ; preds = %350
  %359 = add i32 %351, %341
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 %360
  %362 = load i32, ptr addrspace(3) %361, align 4
  %363 = sitofp i32 %362 to float
  %364 = fmul reassoc nsz arcp contract float %326, %363, !spirv.Decorations !748
  %365 = zext i32 %345 to i64
  %366 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %365
  %367 = load float, ptr %366, align 4
  %368 = fmul reassoc nsz arcp contract float %364, %367, !spirv.Decorations !748
  %369 = fmul reassoc nsz arcp contract float %368, 6.250000e-02, !spirv.Decorations !748
  br label %370

370:                                              ; preds = %358, %354
  %371 = phi i64 [ %365, %358 ], [ %355, %354 ]
  %372 = phi float [ %369, %358 ], [ %357, %354 ]
  %373 = zext i32 %352 to i64
  %374 = icmp slt i32 %352, %91
  %375 = icmp sgt i64 %342, %373
  %376 = and i1 %374, %328
  %377 = select i1 %376, i1 %375, i1 false
  %378 = select i1 %377, float %372, float 0xFFF0000000000000
  %379 = getelementptr inbounds [4 x float], ptr %36, i64 0, i64 %371
  store float %378, ptr %379, align 4
  %380 = call float @llvm.maxnum.f32(float %344, float %378)
  %381 = add nuw nsw i32 %345, 1, !spirv.Decorations !743
  br label %343

382:                                              ; preds = %385, %.preheader4
  %383 = phi i32 [ %388, %385 ], [ 0, %.preheader4 ]
  %384 = icmp ult i32 %383, 4
  br i1 %384, label %385, label %.loopexit5

385:                                              ; preds = %382
  %386 = zext i32 %383 to i64
  %387 = getelementptr inbounds [4 x float], ptr %37, i64 0, i64 %386
  store float 0.000000e+00, ptr %387, align 4
  %388 = add nuw nsw i32 %383, 1, !spirv.Decorations !743
  br label %382

389:                                              ; preds = %393, %.preheader6
  %390 = phi float [ %411, %393 ], [ 0.000000e+00, %.preheader6 ]
  %391 = phi i32 [ %412, %393 ], [ 0, %.preheader6 ]
  %392 = icmp ult i32 %391, 4
  br i1 %392, label %393, label %413

393:                                              ; preds = %389
  %394 = zext i32 %391 to i64
  %395 = getelementptr inbounds [4 x float], ptr %36, i64 0, i64 %394
  %396 = load float, ptr %395, align 4
  %397 = fsub reassoc nsz arcp contract float %396, %348, !spirv.Decorations !748
  %398 = fmul float %397, 0x3FF7154760000000
  %399 = call float @llvm.trunc.f32(float %398)
  %400 = call float @llvm.fma.f32(float %399, float 0xBFE62E4000000000, float %397)
  %401 = call float @llvm.fma.f32(float %399, float 0xBEB7F7D1C0000000, float %400)
  %402 = fmul float %401, 0x3FF7154760000000
  %403 = call float @llvm.exp2.f32(float %399)
  %404 = call float @llvm.exp2.f32(float %402)
  %405 = fmul float %403, %404
  %406 = fcmp olt float %397, -1.050000e+02
  %407 = select i1 %406, float 0.000000e+00, float %405
  %408 = fcmp ogt float %397, 1.050000e+02
  %409 = select i1 %408, float 0x7FF0000000000000, float %407
  %410 = getelementptr inbounds [4 x float], ptr %37, i64 0, i64 %394
  store float %409, ptr %410, align 4
  %411 = fadd reassoc nsz arcp contract float %390, %409, !spirv.Decorations !748
  %412 = add nuw nsw i32 %391, 1, !spirv.Decorations !743
  br label %389

413:                                              ; preds = %389
  %414 = call float @llvm.genx.GenISA.WaveAll.f32(float %390, i8 9, i1 true, i32 0)
  %415 = fcmp reassoc nsz arcp contract oeq float %414, 0.000000e+00, !spirv.Decorations !748
  br i1 %415, label %418, label %416

416:                                              ; preds = %413
  %417 = fdiv reassoc nsz arcp contract float 1.000000e+00, %414, !spirv.Decorations !748
  br label %418

.loopexit5:                                       ; preds = %382
  br label %418

418:                                              ; preds = %.loopexit5, %416, %413
  %419 = phi float [ %414, %416 ], [ %414, %413 ], [ 0.000000e+00, %.loopexit5 ]
  %420 = phi float [ %417, %416 ], [ 0.000000e+00, %413 ], [ 0.000000e+00, %.loopexit5 ]
  br label %421

421:                                              ; preds = %425, %418
  %422 = phi i32 [ 0, %418 ], [ %432, %425 ]
  %423 = icmp ult i32 %422, 4
  br i1 %423, label %425, label %424

424:                                              ; preds = %421
  br i1 %171, label %433, label %438

425:                                              ; preds = %421
  %426 = zext i32 %422 to i64
  %427 = getelementptr inbounds [4 x float], ptr %37, i64 0, i64 %426
  %428 = load float, ptr %427, align 4
  %429 = fmul reassoc nsz arcp contract float %428, %420, !spirv.Decorations !748
  %430 = fptrunc float %429 to half
  %431 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %35, i64 0, i64 %324, i64 %426
  store half %430, ptr %431, align 2
  %432 = add nuw nsw i32 %422, 1, !spirv.Decorations !743
  br label %421

433:                                              ; preds = %424
  %434 = zext i32 %323 to i64
  %435 = add nuw nsw i64 %112, %434, !spirv.Decorations !743
  %436 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %435
  store float %348, ptr addrspace(1) %436, align 4
  %437 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %435
  store float %419, ptr addrspace(1) %437, align 4
  br label %438

438:                                              ; preds = %433, %424
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %37)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %36)
  %439 = add nuw nsw i32 %320, 1, !spirv.Decorations !743
  br label %319, !llvm.loop !767

.loopexit7:                                       ; preds = %319
  br label %440

440:                                              ; preds = %.loopexit7, %312, %310
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %.preheader2, label %463

.preheader2:                                      ; preds = %440
  br label %441

441:                                              ; preds = %451, %.preheader2
  %442 = phi i32 [ %452, %451 ], [ 0, %.preheader2 ]
  %443 = icmp ult i32 %442, 8
  br i1 %443, label %444, label %.loopexit3

444:                                              ; preds = %441
  %445 = zext i32 %442 to i64
  %446 = or i32 %74, %442
  %447 = shl nsw i32 %446, 6, !spirv.Decorations !741
  br label %448

448:                                              ; preds = %453, %444
  %449 = phi i32 [ %462, %453 ], [ 0, %444 ]
  %450 = icmp ult i32 %449, 4
  br i1 %450, label %453, label %451

451:                                              ; preds = %448
  %452 = add nuw nsw i32 %442, 1, !spirv.Decorations !743
  br label %441, !llvm.loop !768

453:                                              ; preds = %448
  %454 = zext i32 %449 to i64
  %455 = shl nuw nsw i32 %449, 4, !spirv.Decorations !743
  %456 = or i32 %447, %455
  %457 = add nuw nsw i32 %456, %simdLaneId, !spirv.Decorations !743
  %458 = zext i32 %457 to i64
  %459 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 %458
  %460 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %35, i64 0, i64 %445, i64 %454
  %461 = load half, ptr %460, align 2
  store half %461, ptr addrspace(3) %459, align 2
  %462 = add nuw nsw i32 %449, 1, !spirv.Decorations !743
  br label %448, !llvm.loop !769

.loopexit3:                                       ; preds = %441
  br label %463

463:                                              ; preds = %.loopexit3, %440
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %464, label %563

464:                                              ; preds = %463
  %465 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !741
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 %466
  %468 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %467)
  %469 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 64
  %470 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %469)
  %471 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 128
  %472 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %471)
  %473 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 192
  %474 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %473)
  %475 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 256
  %476 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %475)
  %477 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 320
  %478 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %477)
  %479 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 384
  %480 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %479)
  %481 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 448
  %482 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %481)
  %483 = insertelement <8 x i16> undef, i16 %468, i32 0
  %484 = insertelement <8 x i16> %483, i16 %470, i32 1
  %485 = insertelement <8 x i16> %484, i16 %472, i32 2
  %486 = insertelement <8 x i16> %485, i16 %474, i32 3
  %487 = insertelement <8 x i16> %486, i16 %476, i32 4
  %488 = insertelement <8 x i16> %487, i16 %478, i32 5
  %489 = insertelement <8 x i16> %488, i16 %480, i32 6
  %490 = insertelement <8 x i16> %489, i16 %482, i32 7
  %491 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 16
  %492 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %491)
  %493 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 80
  %494 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %493)
  %495 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 144
  %496 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %495)
  %497 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 208
  %498 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %497)
  %499 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 272
  %500 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %499)
  %501 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 336
  %502 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %501)
  %503 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 400
  %504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %503)
  %505 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 464
  %506 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %505)
  %507 = insertelement <8 x i16> undef, i16 %492, i32 0
  %508 = insertelement <8 x i16> %507, i16 %494, i32 1
  %509 = insertelement <8 x i16> %508, i16 %496, i32 2
  %510 = insertelement <8 x i16> %509, i16 %498, i32 3
  %511 = insertelement <8 x i16> %510, i16 %500, i32 4
  %512 = insertelement <8 x i16> %511, i16 %502, i32 5
  %513 = insertelement <8 x i16> %512, i16 %504, i32 6
  %514 = insertelement <8 x i16> %513, i16 %506, i32 7
  %515 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 32
  %516 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %515)
  %517 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 96
  %518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %517)
  %519 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 160
  %520 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %519)
  %521 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 224
  %522 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %521)
  %523 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 288
  %524 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %523)
  %525 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 352
  %526 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %525)
  %527 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 416
  %528 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %527)
  %529 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 480
  %530 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %529)
  %531 = insertelement <8 x i16> undef, i16 %516, i32 0
  %532 = insertelement <8 x i16> %531, i16 %518, i32 1
  %533 = insertelement <8 x i16> %532, i16 %520, i32 2
  %534 = insertelement <8 x i16> %533, i16 %522, i32 3
  %535 = insertelement <8 x i16> %534, i16 %524, i32 4
  %536 = insertelement <8 x i16> %535, i16 %526, i32 5
  %537 = insertelement <8 x i16> %536, i16 %528, i32 6
  %538 = insertelement <8 x i16> %537, i16 %530, i32 7
  %539 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 48
  %540 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %539)
  %541 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 112
  %542 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %541)
  %543 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 176
  %544 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %543)
  %545 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 240
  %546 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %545)
  %547 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 304
  %548 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %547)
  %549 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 368
  %550 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %549)
  %551 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 432
  %552 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %551)
  %553 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 496
  %554 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %553)
  %555 = insertelement <8 x i16> undef, i16 %540, i32 0
  %556 = insertelement <8 x i16> %555, i16 %542, i32 1
  %557 = insertelement <8 x i16> %556, i16 %544, i32 2
  %558 = insertelement <8 x i16> %557, i16 %546, i32 3
  %559 = insertelement <8 x i16> %558, i16 %548, i32 4
  %560 = insertelement <8 x i16> %559, i16 %550, i32 5
  %561 = insertelement <8 x i16> %560, i16 %552, i32 6
  %562 = insertelement <8 x i16> %561, i16 %554, i32 7
  br label %563

563:                                              ; preds = %464, %463
  %564 = phi <8 x i16> [ %562, %464 ], [ undef, %463 ]
  %565 = phi <8 x i16> [ %538, %464 ], [ undef, %463 ]
  %566 = phi <8 x i16> [ %514, %464 ], [ undef, %463 ]
  %567 = phi <8 x i16> [ %490, %464 ], [ undef, %463 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %568 = lshr i32 %38, 1
  %569 = icmp slt i32 %568, %91
  br i1 %569, label %570, label %579

570:                                              ; preds = %563
  %571 = and i16 %localIdX, -2
  %572 = zext i16 %571 to i64
  %573 = getelementptr float, ptr addrspace(1) %17, i64 %120
  %574 = getelementptr float, ptr addrspace(1) %573, i64 %572
  %575 = load float, ptr addrspace(1) %574, align 4
  %576 = getelementptr float, ptr addrspace(1) %18, i64 %120
  %577 = getelementptr float, ptr addrspace(1) %576, i64 %572
  %578 = load float, ptr addrspace(1) %577, align 4
  br label %579

579:                                              ; preds = %570, %563
  %580 = phi float [ %575, %570 ], [ 0.000000e+00, %563 ]
  %581 = phi float [ %578, %570 ], [ 0.000000e+00, %563 ]
  %582 = and i32 %38, 1
  %583 = shl nuw nsw i32 %568, 6, !spirv.Decorations !741
  %584 = zext i32 %583 to i64
  %585 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 %584
  %586 = shl nuw nsw i32 %582, 5, !spirv.Decorations !743
  %587 = zext i32 %586 to i64
  %588 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %585, i64 %587
  %589 = getelementptr i8, ptr addrspace(1) %19, i64 %117
  %590 = getelementptr i8, ptr addrspace(1) %589, i64 %118
  %591 = shl nuw nsw i32 %568, 8
  %592 = zext i32 %591 to i64
  %593 = getelementptr inbounds i8, ptr addrspace(1) %590, i64 %592
  %594 = shl nuw nsw i32 %582, 4, !spirv.Decorations !743
  %595 = zext i32 %594 to i64
  %596 = getelementptr inbounds i8, ptr addrspace(1) %593, i64 %595
  %597 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !741
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, ptr addrspace(1) %124, i64 %598
  br label %600

600:                                              ; preds = %1884, %579
  %601 = phi i32 [ 0, %579 ], [ %1881, %1884 ]
  %602 = icmp ult i32 %601, 256
  br i1 %602, label %604, label %603

603:                                              ; preds = %600
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %35)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %34)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %32)
  br label %1885

604:                                              ; preds = %600
  br i1 %569, label %612, label %.preheader

.preheader:                                       ; preds = %604
  br label %605

605:                                              ; preds = %608, %.preheader
  %606 = phi i32 [ %611, %608 ], [ 0, %.preheader ]
  %607 = icmp ult i32 %606, 32
  br i1 %607, label %608, label %.loopexit1

608:                                              ; preds = %605
  %609 = zext i32 %606 to i64
  %610 = getelementptr inbounds half, ptr addrspace(3) %588, i64 %609
  store half 0xH0000, ptr addrspace(3) %610, align 2
  %611 = add nuw nsw i32 %606, 1, !spirv.Decorations !743
  br label %605, !llvm.loop !770

612:                                              ; preds = %604
  %613 = lshr exact i32 %601, 1
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds i8, ptr addrspace(1) %596, i64 %614
  br label %616

616:                                              ; preds = %626, %612
  %617 = phi i32 [ 0, %612 ], [ %627, %626 ]
  %618 = icmp ult i32 %617, 16
  br i1 %618, label %619, label %.loopexit

619:                                              ; preds = %616
  %620 = zext i32 %617 to i64
  %621 = getelementptr inbounds i8, ptr addrspace(1) %615, i64 %620
  %622 = load i64, ptr addrspace(1) %621, align 1
  br label %623

623:                                              ; preds = %628, %619
  %624 = phi i32 [ 0, %619 ], [ %649, %628 ]
  %625 = icmp ult i32 %624, 8
  br i1 %625, label %628, label %626

626:                                              ; preds = %623
  %627 = add nuw nsw i32 %617, 8, !spirv.Decorations !743
  br label %616, !llvm.loop !771

628:                                              ; preds = %623
  %629 = shl nuw nsw i32 %624, 3, !spirv.Decorations !743
  %630 = zext i32 %629 to i64
  %631 = lshr i64 %622, %630
  %632 = trunc i64 %631 to i32
  %633 = and i32 %632, 15
  %634 = uitofp i32 %633 to float
  %635 = fsub reassoc nsz arcp contract float %634, %581, !spirv.Decorations !748
  %636 = fmul reassoc nsz arcp contract float %635, %580, !spirv.Decorations !748
  %637 = fptrunc float %636 to half
  %638 = or i32 %617, %624
  %639 = shl nuw nsw i32 %638, 1, !spirv.Decorations !743
  %640 = zext i32 %639 to i64
  %641 = getelementptr half, ptr addrspace(3) %588, i64 %640
  store half %637, ptr addrspace(3) %641, align 4
  %642 = lshr i32 %632, 4
  %643 = and i32 %642, 15
  %644 = uitofp i32 %643 to float
  %645 = fsub reassoc nsz arcp contract float %644, %581, !spirv.Decorations !748
  %646 = fmul reassoc nsz arcp contract float %645, %580, !spirv.Decorations !748
  %647 = fptrunc float %646 to half
  %648 = getelementptr half, ptr addrspace(3) %641, i64 1
  store half %647, ptr addrspace(3) %648, align 2
  %649 = add nuw nsw i32 %624, 1, !spirv.Decorations !743
  br label %623, !llvm.loop !772

.loopexit:                                        ; preds = %616
  br label %650

.loopexit1:                                       ; preds = %605
  br label %650

650:                                              ; preds = %.loopexit1, %.loopexit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %651, label %1880

651:                                              ; preds = %650
  %652 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM)
  %653 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 128
  %654 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %653)
  %655 = insertelement <2 x i16> undef, i16 %652, i32 0
  %656 = insertelement <2 x i16> %655, i16 %654, i32 1
  %657 = bitcast <2 x i16> %656 to i32
  %658 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 256
  %659 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %658)
  %660 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 384
  %661 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %660)
  %662 = insertelement <2 x i16> undef, i16 %659, i32 0
  %663 = insertelement <2 x i16> %662, i16 %661, i32 1
  %664 = bitcast <2 x i16> %663 to i32
  %665 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 512
  %666 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %665)
  %667 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 640
  %668 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %667)
  %669 = insertelement <2 x i16> undef, i16 %666, i32 0
  %670 = insertelement <2 x i16> %669, i16 %668, i32 1
  %671 = bitcast <2 x i16> %670 to i32
  %672 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 768
  %673 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %672)
  %674 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 896
  %675 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %674)
  %676 = insertelement <2 x i16> undef, i16 %673, i32 0
  %677 = insertelement <2 x i16> %676, i16 %675, i32 1
  %678 = bitcast <2 x i16> %677 to i32
  %679 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1024
  %680 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %679)
  %681 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1152
  %682 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %681)
  %683 = insertelement <2 x i16> undef, i16 %680, i32 0
  %684 = insertelement <2 x i16> %683, i16 %682, i32 1
  %685 = bitcast <2 x i16> %684 to i32
  %686 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1280
  %687 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %686)
  %688 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1408
  %689 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %688)
  %690 = insertelement <2 x i16> undef, i16 %687, i32 0
  %691 = insertelement <2 x i16> %690, i16 %689, i32 1
  %692 = bitcast <2 x i16> %691 to i32
  %693 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1536
  %694 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %693)
  %695 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1664
  %696 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %695)
  %697 = insertelement <2 x i16> undef, i16 %694, i32 0
  %698 = insertelement <2 x i16> %697, i16 %696, i32 1
  %699 = bitcast <2 x i16> %698 to i32
  %700 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1792
  %701 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %700)
  %702 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1920
  %703 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %702)
  %704 = insertelement <2 x i16> undef, i16 %701, i32 0
  %705 = insertelement <2 x i16> %704, i16 %703, i32 1
  %706 = bitcast <2 x i16> %705 to i32
  %707 = insertelement <8 x i32> undef, i32 %657, i32 0
  %708 = insertelement <8 x i32> %707, i32 %664, i32 1
  %709 = insertelement <8 x i32> %708, i32 %671, i32 2
  %710 = insertelement <8 x i32> %709, i32 %678, i32 3
  %711 = insertelement <8 x i32> %710, i32 %685, i32 4
  %712 = insertelement <8 x i32> %711, i32 %692, i32 5
  %713 = insertelement <8 x i32> %712, i32 %699, i32 6
  %714 = insertelement <8 x i32> %713, i32 %706, i32 7
  %715 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %567, <8 x i32> %714, i32 12, i32 12, i32 8, i32 8, i1 false)
  %716 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 32
  %717 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %716)
  %718 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 160
  %719 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %718)
  %720 = insertelement <2 x i16> undef, i16 %717, i32 0
  %721 = insertelement <2 x i16> %720, i16 %719, i32 1
  %722 = bitcast <2 x i16> %721 to i32
  %723 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 288
  %724 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %723)
  %725 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 416
  %726 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %725)
  %727 = insertelement <2 x i16> undef, i16 %724, i32 0
  %728 = insertelement <2 x i16> %727, i16 %726, i32 1
  %729 = bitcast <2 x i16> %728 to i32
  %730 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 544
  %731 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %730)
  %732 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 672
  %733 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %732)
  %734 = insertelement <2 x i16> undef, i16 %731, i32 0
  %735 = insertelement <2 x i16> %734, i16 %733, i32 1
  %736 = bitcast <2 x i16> %735 to i32
  %737 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 800
  %738 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %737)
  %739 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 928
  %740 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %739)
  %741 = insertelement <2 x i16> undef, i16 %738, i32 0
  %742 = insertelement <2 x i16> %741, i16 %740, i32 1
  %743 = bitcast <2 x i16> %742 to i32
  %744 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1056
  %745 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %744)
  %746 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1184
  %747 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %746)
  %748 = insertelement <2 x i16> undef, i16 %745, i32 0
  %749 = insertelement <2 x i16> %748, i16 %747, i32 1
  %750 = bitcast <2 x i16> %749 to i32
  %751 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1312
  %752 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %751)
  %753 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1440
  %754 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %753)
  %755 = insertelement <2 x i16> undef, i16 %752, i32 0
  %756 = insertelement <2 x i16> %755, i16 %754, i32 1
  %757 = bitcast <2 x i16> %756 to i32
  %758 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1568
  %759 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %758)
  %760 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1696
  %761 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %760)
  %762 = insertelement <2 x i16> undef, i16 %759, i32 0
  %763 = insertelement <2 x i16> %762, i16 %761, i32 1
  %764 = bitcast <2 x i16> %763 to i32
  %765 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1824
  %766 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %765)
  %767 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1952
  %768 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %767)
  %769 = insertelement <2 x i16> undef, i16 %766, i32 0
  %770 = insertelement <2 x i16> %769, i16 %768, i32 1
  %771 = bitcast <2 x i16> %770 to i32
  %772 = insertelement <8 x i32> undef, i32 %722, i32 0
  %773 = insertelement <8 x i32> %772, i32 %729, i32 1
  %774 = insertelement <8 x i32> %773, i32 %736, i32 2
  %775 = insertelement <8 x i32> %774, i32 %743, i32 3
  %776 = insertelement <8 x i32> %775, i32 %750, i32 4
  %777 = insertelement <8 x i32> %776, i32 %757, i32 5
  %778 = insertelement <8 x i32> %777, i32 %764, i32 6
  %779 = insertelement <8 x i32> %778, i32 %771, i32 7
  %780 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %567, <8 x i32> %779, i32 12, i32 12, i32 8, i32 8, i1 false)
  %781 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 64
  %782 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %781)
  %783 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 192
  %784 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %783)
  %785 = insertelement <2 x i16> undef, i16 %782, i32 0
  %786 = insertelement <2 x i16> %785, i16 %784, i32 1
  %787 = bitcast <2 x i16> %786 to i32
  %788 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 320
  %789 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %788)
  %790 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 448
  %791 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %790)
  %792 = insertelement <2 x i16> undef, i16 %789, i32 0
  %793 = insertelement <2 x i16> %792, i16 %791, i32 1
  %794 = bitcast <2 x i16> %793 to i32
  %795 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 576
  %796 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %795)
  %797 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 704
  %798 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %797)
  %799 = insertelement <2 x i16> undef, i16 %796, i32 0
  %800 = insertelement <2 x i16> %799, i16 %798, i32 1
  %801 = bitcast <2 x i16> %800 to i32
  %802 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 832
  %803 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %802)
  %804 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 960
  %805 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %804)
  %806 = insertelement <2 x i16> undef, i16 %803, i32 0
  %807 = insertelement <2 x i16> %806, i16 %805, i32 1
  %808 = bitcast <2 x i16> %807 to i32
  %809 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1088
  %810 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %809)
  %811 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1216
  %812 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %811)
  %813 = insertelement <2 x i16> undef, i16 %810, i32 0
  %814 = insertelement <2 x i16> %813, i16 %812, i32 1
  %815 = bitcast <2 x i16> %814 to i32
  %816 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1344
  %817 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %816)
  %818 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1472
  %819 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %818)
  %820 = insertelement <2 x i16> undef, i16 %817, i32 0
  %821 = insertelement <2 x i16> %820, i16 %819, i32 1
  %822 = bitcast <2 x i16> %821 to i32
  %823 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1600
  %824 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %823)
  %825 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1728
  %826 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %825)
  %827 = insertelement <2 x i16> undef, i16 %824, i32 0
  %828 = insertelement <2 x i16> %827, i16 %826, i32 1
  %829 = bitcast <2 x i16> %828 to i32
  %830 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1856
  %831 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %830)
  %832 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1984
  %833 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %832)
  %834 = insertelement <2 x i16> undef, i16 %831, i32 0
  %835 = insertelement <2 x i16> %834, i16 %833, i32 1
  %836 = bitcast <2 x i16> %835 to i32
  %837 = insertelement <8 x i32> undef, i32 %787, i32 0
  %838 = insertelement <8 x i32> %837, i32 %794, i32 1
  %839 = insertelement <8 x i32> %838, i32 %801, i32 2
  %840 = insertelement <8 x i32> %839, i32 %808, i32 3
  %841 = insertelement <8 x i32> %840, i32 %815, i32 4
  %842 = insertelement <8 x i32> %841, i32 %822, i32 5
  %843 = insertelement <8 x i32> %842, i32 %829, i32 6
  %844 = insertelement <8 x i32> %843, i32 %836, i32 7
  %845 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %567, <8 x i32> %844, i32 12, i32 12, i32 8, i32 8, i1 false)
  %846 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 96
  %847 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %846)
  %848 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 224
  %849 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %848)
  %850 = insertelement <2 x i16> undef, i16 %847, i32 0
  %851 = insertelement <2 x i16> %850, i16 %849, i32 1
  %852 = bitcast <2 x i16> %851 to i32
  %853 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 352
  %854 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %853)
  %855 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 480
  %856 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %855)
  %857 = insertelement <2 x i16> undef, i16 %854, i32 0
  %858 = insertelement <2 x i16> %857, i16 %856, i32 1
  %859 = bitcast <2 x i16> %858 to i32
  %860 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 608
  %861 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %860)
  %862 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 736
  %863 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %862)
  %864 = insertelement <2 x i16> undef, i16 %861, i32 0
  %865 = insertelement <2 x i16> %864, i16 %863, i32 1
  %866 = bitcast <2 x i16> %865 to i32
  %867 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 864
  %868 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %867)
  %869 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 992
  %870 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %869)
  %871 = insertelement <2 x i16> undef, i16 %868, i32 0
  %872 = insertelement <2 x i16> %871, i16 %870, i32 1
  %873 = bitcast <2 x i16> %872 to i32
  %874 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1120
  %875 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %874)
  %876 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1248
  %877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %876)
  %878 = insertelement <2 x i16> undef, i16 %875, i32 0
  %879 = insertelement <2 x i16> %878, i16 %877, i32 1
  %880 = bitcast <2 x i16> %879 to i32
  %881 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1376
  %882 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %881)
  %883 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1504
  %884 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %883)
  %885 = insertelement <2 x i16> undef, i16 %882, i32 0
  %886 = insertelement <2 x i16> %885, i16 %884, i32 1
  %887 = bitcast <2 x i16> %886 to i32
  %888 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1632
  %889 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %888)
  %890 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1760
  %891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %890)
  %892 = insertelement <2 x i16> undef, i16 %889, i32 0
  %893 = insertelement <2 x i16> %892, i16 %891, i32 1
  %894 = bitcast <2 x i16> %893 to i32
  %895 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 1888
  %896 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %895)
  %897 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2016
  %898 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %897)
  %899 = insertelement <2 x i16> undef, i16 %896, i32 0
  %900 = insertelement <2 x i16> %899, i16 %898, i32 1
  %901 = bitcast <2 x i16> %900 to i32
  %902 = insertelement <8 x i32> undef, i32 %852, i32 0
  %903 = insertelement <8 x i32> %902, i32 %859, i32 1
  %904 = insertelement <8 x i32> %903, i32 %866, i32 2
  %905 = insertelement <8 x i32> %904, i32 %873, i32 3
  %906 = insertelement <8 x i32> %905, i32 %880, i32 4
  %907 = insertelement <8 x i32> %906, i32 %887, i32 5
  %908 = insertelement <8 x i32> %907, i32 %894, i32 6
  %909 = insertelement <8 x i32> %908, i32 %901, i32 7
  %910 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %567, <8 x i32> %909, i32 12, i32 12, i32 8, i32 8, i1 false)
  %911 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2048
  %912 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %911)
  %913 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2176
  %914 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %913)
  %915 = insertelement <2 x i16> undef, i16 %912, i32 0
  %916 = insertelement <2 x i16> %915, i16 %914, i32 1
  %917 = bitcast <2 x i16> %916 to i32
  %918 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2304
  %919 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %918)
  %920 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2432
  %921 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %920)
  %922 = insertelement <2 x i16> undef, i16 %919, i32 0
  %923 = insertelement <2 x i16> %922, i16 %921, i32 1
  %924 = bitcast <2 x i16> %923 to i32
  %925 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2560
  %926 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %925)
  %927 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2688
  %928 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %927)
  %929 = insertelement <2 x i16> undef, i16 %926, i32 0
  %930 = insertelement <2 x i16> %929, i16 %928, i32 1
  %931 = bitcast <2 x i16> %930 to i32
  %932 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2816
  %933 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %932)
  %934 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2944
  %935 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %934)
  %936 = insertelement <2 x i16> undef, i16 %933, i32 0
  %937 = insertelement <2 x i16> %936, i16 %935, i32 1
  %938 = bitcast <2 x i16> %937 to i32
  %939 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3072
  %940 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %939)
  %941 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3200
  %942 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %941)
  %943 = insertelement <2 x i16> undef, i16 %940, i32 0
  %944 = insertelement <2 x i16> %943, i16 %942, i32 1
  %945 = bitcast <2 x i16> %944 to i32
  %946 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3328
  %947 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %946)
  %948 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3456
  %949 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %948)
  %950 = insertelement <2 x i16> undef, i16 %947, i32 0
  %951 = insertelement <2 x i16> %950, i16 %949, i32 1
  %952 = bitcast <2 x i16> %951 to i32
  %953 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3584
  %954 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %953)
  %955 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3712
  %956 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %955)
  %957 = insertelement <2 x i16> undef, i16 %954, i32 0
  %958 = insertelement <2 x i16> %957, i16 %956, i32 1
  %959 = bitcast <2 x i16> %958 to i32
  %960 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3840
  %961 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %960)
  %962 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3968
  %963 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %962)
  %964 = insertelement <2 x i16> undef, i16 %961, i32 0
  %965 = insertelement <2 x i16> %964, i16 %963, i32 1
  %966 = bitcast <2 x i16> %965 to i32
  %967 = insertelement <8 x i32> undef, i32 %917, i32 0
  %968 = insertelement <8 x i32> %967, i32 %924, i32 1
  %969 = insertelement <8 x i32> %968, i32 %931, i32 2
  %970 = insertelement <8 x i32> %969, i32 %938, i32 3
  %971 = insertelement <8 x i32> %970, i32 %945, i32 4
  %972 = insertelement <8 x i32> %971, i32 %952, i32 5
  %973 = insertelement <8 x i32> %972, i32 %959, i32 6
  %974 = insertelement <8 x i32> %973, i32 %966, i32 7
  %975 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %715, <8 x i16> %566, <8 x i32> %974, i32 12, i32 12, i32 8, i32 8, i1 false)
  %976 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2080
  %977 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %976)
  %978 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2208
  %979 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %978)
  %980 = insertelement <2 x i16> undef, i16 %977, i32 0
  %981 = insertelement <2 x i16> %980, i16 %979, i32 1
  %982 = bitcast <2 x i16> %981 to i32
  %983 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2336
  %984 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %983)
  %985 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2464
  %986 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %985)
  %987 = insertelement <2 x i16> undef, i16 %984, i32 0
  %988 = insertelement <2 x i16> %987, i16 %986, i32 1
  %989 = bitcast <2 x i16> %988 to i32
  %990 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2592
  %991 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %990)
  %992 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2720
  %993 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %992)
  %994 = insertelement <2 x i16> undef, i16 %991, i32 0
  %995 = insertelement <2 x i16> %994, i16 %993, i32 1
  %996 = bitcast <2 x i16> %995 to i32
  %997 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2848
  %998 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %997)
  %999 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2976
  %1000 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %999)
  %1001 = insertelement <2 x i16> undef, i16 %998, i32 0
  %1002 = insertelement <2 x i16> %1001, i16 %1000, i32 1
  %1003 = bitcast <2 x i16> %1002 to i32
  %1004 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3104
  %1005 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1004)
  %1006 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3232
  %1007 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1006)
  %1008 = insertelement <2 x i16> undef, i16 %1005, i32 0
  %1009 = insertelement <2 x i16> %1008, i16 %1007, i32 1
  %1010 = bitcast <2 x i16> %1009 to i32
  %1011 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3360
  %1012 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1011)
  %1013 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3488
  %1014 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1013)
  %1015 = insertelement <2 x i16> undef, i16 %1012, i32 0
  %1016 = insertelement <2 x i16> %1015, i16 %1014, i32 1
  %1017 = bitcast <2 x i16> %1016 to i32
  %1018 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3616
  %1019 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1018)
  %1020 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3744
  %1021 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1020)
  %1022 = insertelement <2 x i16> undef, i16 %1019, i32 0
  %1023 = insertelement <2 x i16> %1022, i16 %1021, i32 1
  %1024 = bitcast <2 x i16> %1023 to i32
  %1025 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3872
  %1026 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1025)
  %1027 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4000
  %1028 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1027)
  %1029 = insertelement <2 x i16> undef, i16 %1026, i32 0
  %1030 = insertelement <2 x i16> %1029, i16 %1028, i32 1
  %1031 = bitcast <2 x i16> %1030 to i32
  %1032 = insertelement <8 x i32> undef, i32 %982, i32 0
  %1033 = insertelement <8 x i32> %1032, i32 %989, i32 1
  %1034 = insertelement <8 x i32> %1033, i32 %996, i32 2
  %1035 = insertelement <8 x i32> %1034, i32 %1003, i32 3
  %1036 = insertelement <8 x i32> %1035, i32 %1010, i32 4
  %1037 = insertelement <8 x i32> %1036, i32 %1017, i32 5
  %1038 = insertelement <8 x i32> %1037, i32 %1024, i32 6
  %1039 = insertelement <8 x i32> %1038, i32 %1031, i32 7
  %1040 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %780, <8 x i16> %566, <8 x i32> %1039, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1041 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2112
  %1042 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1041)
  %1043 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2240
  %1044 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1043)
  %1045 = insertelement <2 x i16> undef, i16 %1042, i32 0
  %1046 = insertelement <2 x i16> %1045, i16 %1044, i32 1
  %1047 = bitcast <2 x i16> %1046 to i32
  %1048 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2368
  %1049 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1048)
  %1050 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2496
  %1051 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1050)
  %1052 = insertelement <2 x i16> undef, i16 %1049, i32 0
  %1053 = insertelement <2 x i16> %1052, i16 %1051, i32 1
  %1054 = bitcast <2 x i16> %1053 to i32
  %1055 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2624
  %1056 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1055)
  %1057 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2752
  %1058 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1057)
  %1059 = insertelement <2 x i16> undef, i16 %1056, i32 0
  %1060 = insertelement <2 x i16> %1059, i16 %1058, i32 1
  %1061 = bitcast <2 x i16> %1060 to i32
  %1062 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2880
  %1063 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1062)
  %1064 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3008
  %1065 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1064)
  %1066 = insertelement <2 x i16> undef, i16 %1063, i32 0
  %1067 = insertelement <2 x i16> %1066, i16 %1065, i32 1
  %1068 = bitcast <2 x i16> %1067 to i32
  %1069 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3136
  %1070 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1069)
  %1071 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3264
  %1072 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1071)
  %1073 = insertelement <2 x i16> undef, i16 %1070, i32 0
  %1074 = insertelement <2 x i16> %1073, i16 %1072, i32 1
  %1075 = bitcast <2 x i16> %1074 to i32
  %1076 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3392
  %1077 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1076)
  %1078 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3520
  %1079 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1078)
  %1080 = insertelement <2 x i16> undef, i16 %1077, i32 0
  %1081 = insertelement <2 x i16> %1080, i16 %1079, i32 1
  %1082 = bitcast <2 x i16> %1081 to i32
  %1083 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3648
  %1084 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1083)
  %1085 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3776
  %1086 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1085)
  %1087 = insertelement <2 x i16> undef, i16 %1084, i32 0
  %1088 = insertelement <2 x i16> %1087, i16 %1086, i32 1
  %1089 = bitcast <2 x i16> %1088 to i32
  %1090 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3904
  %1091 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1090)
  %1092 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4032
  %1093 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1092)
  %1094 = insertelement <2 x i16> undef, i16 %1091, i32 0
  %1095 = insertelement <2 x i16> %1094, i16 %1093, i32 1
  %1096 = bitcast <2 x i16> %1095 to i32
  %1097 = insertelement <8 x i32> undef, i32 %1047, i32 0
  %1098 = insertelement <8 x i32> %1097, i32 %1054, i32 1
  %1099 = insertelement <8 x i32> %1098, i32 %1061, i32 2
  %1100 = insertelement <8 x i32> %1099, i32 %1068, i32 3
  %1101 = insertelement <8 x i32> %1100, i32 %1075, i32 4
  %1102 = insertelement <8 x i32> %1101, i32 %1082, i32 5
  %1103 = insertelement <8 x i32> %1102, i32 %1089, i32 6
  %1104 = insertelement <8 x i32> %1103, i32 %1096, i32 7
  %1105 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %845, <8 x i16> %566, <8 x i32> %1104, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1106 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2144
  %1107 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1106)
  %1108 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2272
  %1109 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1108)
  %1110 = insertelement <2 x i16> undef, i16 %1107, i32 0
  %1111 = insertelement <2 x i16> %1110, i16 %1109, i32 1
  %1112 = bitcast <2 x i16> %1111 to i32
  %1113 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2400
  %1114 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1113)
  %1115 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2528
  %1116 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1115)
  %1117 = insertelement <2 x i16> undef, i16 %1114, i32 0
  %1118 = insertelement <2 x i16> %1117, i16 %1116, i32 1
  %1119 = bitcast <2 x i16> %1118 to i32
  %1120 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2656
  %1121 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1120)
  %1122 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2784
  %1123 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1122)
  %1124 = insertelement <2 x i16> undef, i16 %1121, i32 0
  %1125 = insertelement <2 x i16> %1124, i16 %1123, i32 1
  %1126 = bitcast <2 x i16> %1125 to i32
  %1127 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 2912
  %1128 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1127)
  %1129 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3040
  %1130 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1129)
  %1131 = insertelement <2 x i16> undef, i16 %1128, i32 0
  %1132 = insertelement <2 x i16> %1131, i16 %1130, i32 1
  %1133 = bitcast <2 x i16> %1132 to i32
  %1134 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3168
  %1135 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1134)
  %1136 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3296
  %1137 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1136)
  %1138 = insertelement <2 x i16> undef, i16 %1135, i32 0
  %1139 = insertelement <2 x i16> %1138, i16 %1137, i32 1
  %1140 = bitcast <2 x i16> %1139 to i32
  %1141 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3424
  %1142 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1141)
  %1143 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3552
  %1144 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1143)
  %1145 = insertelement <2 x i16> undef, i16 %1142, i32 0
  %1146 = insertelement <2 x i16> %1145, i16 %1144, i32 1
  %1147 = bitcast <2 x i16> %1146 to i32
  %1148 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3680
  %1149 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1148)
  %1150 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3808
  %1151 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1150)
  %1152 = insertelement <2 x i16> undef, i16 %1149, i32 0
  %1153 = insertelement <2 x i16> %1152, i16 %1151, i32 1
  %1154 = bitcast <2 x i16> %1153 to i32
  %1155 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 3936
  %1156 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1155)
  %1157 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4064
  %1158 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1157)
  %1159 = insertelement <2 x i16> undef, i16 %1156, i32 0
  %1160 = insertelement <2 x i16> %1159, i16 %1158, i32 1
  %1161 = bitcast <2 x i16> %1160 to i32
  %1162 = insertelement <8 x i32> undef, i32 %1112, i32 0
  %1163 = insertelement <8 x i32> %1162, i32 %1119, i32 1
  %1164 = insertelement <8 x i32> %1163, i32 %1126, i32 2
  %1165 = insertelement <8 x i32> %1164, i32 %1133, i32 3
  %1166 = insertelement <8 x i32> %1165, i32 %1140, i32 4
  %1167 = insertelement <8 x i32> %1166, i32 %1147, i32 5
  %1168 = insertelement <8 x i32> %1167, i32 %1154, i32 6
  %1169 = insertelement <8 x i32> %1168, i32 %1161, i32 7
  %1170 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %910, <8 x i16> %566, <8 x i32> %1169, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1171 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4096
  %1172 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1171)
  %1173 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4224
  %1174 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1173)
  %1175 = insertelement <2 x i16> undef, i16 %1172, i32 0
  %1176 = insertelement <2 x i16> %1175, i16 %1174, i32 1
  %1177 = bitcast <2 x i16> %1176 to i32
  %1178 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4352
  %1179 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1178)
  %1180 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4480
  %1181 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1180)
  %1182 = insertelement <2 x i16> undef, i16 %1179, i32 0
  %1183 = insertelement <2 x i16> %1182, i16 %1181, i32 1
  %1184 = bitcast <2 x i16> %1183 to i32
  %1185 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4608
  %1186 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1185)
  %1187 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4736
  %1188 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1187)
  %1189 = insertelement <2 x i16> undef, i16 %1186, i32 0
  %1190 = insertelement <2 x i16> %1189, i16 %1188, i32 1
  %1191 = bitcast <2 x i16> %1190 to i32
  %1192 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4864
  %1193 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1192)
  %1194 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4992
  %1195 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1194)
  %1196 = insertelement <2 x i16> undef, i16 %1193, i32 0
  %1197 = insertelement <2 x i16> %1196, i16 %1195, i32 1
  %1198 = bitcast <2 x i16> %1197 to i32
  %1199 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5120
  %1200 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1199)
  %1201 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5248
  %1202 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1201)
  %1203 = insertelement <2 x i16> undef, i16 %1200, i32 0
  %1204 = insertelement <2 x i16> %1203, i16 %1202, i32 1
  %1205 = bitcast <2 x i16> %1204 to i32
  %1206 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5376
  %1207 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1206)
  %1208 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5504
  %1209 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1208)
  %1210 = insertelement <2 x i16> undef, i16 %1207, i32 0
  %1211 = insertelement <2 x i16> %1210, i16 %1209, i32 1
  %1212 = bitcast <2 x i16> %1211 to i32
  %1213 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5632
  %1214 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1213)
  %1215 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5760
  %1216 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1215)
  %1217 = insertelement <2 x i16> undef, i16 %1214, i32 0
  %1218 = insertelement <2 x i16> %1217, i16 %1216, i32 1
  %1219 = bitcast <2 x i16> %1218 to i32
  %1220 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5888
  %1221 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1220)
  %1222 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6016
  %1223 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1222)
  %1224 = insertelement <2 x i16> undef, i16 %1221, i32 0
  %1225 = insertelement <2 x i16> %1224, i16 %1223, i32 1
  %1226 = bitcast <2 x i16> %1225 to i32
  %1227 = insertelement <8 x i32> undef, i32 %1177, i32 0
  %1228 = insertelement <8 x i32> %1227, i32 %1184, i32 1
  %1229 = insertelement <8 x i32> %1228, i32 %1191, i32 2
  %1230 = insertelement <8 x i32> %1229, i32 %1198, i32 3
  %1231 = insertelement <8 x i32> %1230, i32 %1205, i32 4
  %1232 = insertelement <8 x i32> %1231, i32 %1212, i32 5
  %1233 = insertelement <8 x i32> %1232, i32 %1219, i32 6
  %1234 = insertelement <8 x i32> %1233, i32 %1226, i32 7
  %1235 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %975, <8 x i16> %565, <8 x i32> %1234, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1236 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4128
  %1237 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1236)
  %1238 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4256
  %1239 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1238)
  %1240 = insertelement <2 x i16> undef, i16 %1237, i32 0
  %1241 = insertelement <2 x i16> %1240, i16 %1239, i32 1
  %1242 = bitcast <2 x i16> %1241 to i32
  %1243 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4384
  %1244 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1243)
  %1245 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4512
  %1246 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1245)
  %1247 = insertelement <2 x i16> undef, i16 %1244, i32 0
  %1248 = insertelement <2 x i16> %1247, i16 %1246, i32 1
  %1249 = bitcast <2 x i16> %1248 to i32
  %1250 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4640
  %1251 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1250)
  %1252 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4768
  %1253 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1252)
  %1254 = insertelement <2 x i16> undef, i16 %1251, i32 0
  %1255 = insertelement <2 x i16> %1254, i16 %1253, i32 1
  %1256 = bitcast <2 x i16> %1255 to i32
  %1257 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4896
  %1258 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1257)
  %1259 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5024
  %1260 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1259)
  %1261 = insertelement <2 x i16> undef, i16 %1258, i32 0
  %1262 = insertelement <2 x i16> %1261, i16 %1260, i32 1
  %1263 = bitcast <2 x i16> %1262 to i32
  %1264 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5152
  %1265 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1264)
  %1266 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5280
  %1267 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1266)
  %1268 = insertelement <2 x i16> undef, i16 %1265, i32 0
  %1269 = insertelement <2 x i16> %1268, i16 %1267, i32 1
  %1270 = bitcast <2 x i16> %1269 to i32
  %1271 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5408
  %1272 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1271)
  %1273 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5536
  %1274 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1273)
  %1275 = insertelement <2 x i16> undef, i16 %1272, i32 0
  %1276 = insertelement <2 x i16> %1275, i16 %1274, i32 1
  %1277 = bitcast <2 x i16> %1276 to i32
  %1278 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5664
  %1279 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1278)
  %1280 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5792
  %1281 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1280)
  %1282 = insertelement <2 x i16> undef, i16 %1279, i32 0
  %1283 = insertelement <2 x i16> %1282, i16 %1281, i32 1
  %1284 = bitcast <2 x i16> %1283 to i32
  %1285 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5920
  %1286 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1285)
  %1287 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6048
  %1288 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1287)
  %1289 = insertelement <2 x i16> undef, i16 %1286, i32 0
  %1290 = insertelement <2 x i16> %1289, i16 %1288, i32 1
  %1291 = bitcast <2 x i16> %1290 to i32
  %1292 = insertelement <8 x i32> undef, i32 %1242, i32 0
  %1293 = insertelement <8 x i32> %1292, i32 %1249, i32 1
  %1294 = insertelement <8 x i32> %1293, i32 %1256, i32 2
  %1295 = insertelement <8 x i32> %1294, i32 %1263, i32 3
  %1296 = insertelement <8 x i32> %1295, i32 %1270, i32 4
  %1297 = insertelement <8 x i32> %1296, i32 %1277, i32 5
  %1298 = insertelement <8 x i32> %1297, i32 %1284, i32 6
  %1299 = insertelement <8 x i32> %1298, i32 %1291, i32 7
  %1300 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1040, <8 x i16> %565, <8 x i32> %1299, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1301 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4160
  %1302 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1301)
  %1303 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4288
  %1304 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1303)
  %1305 = insertelement <2 x i16> undef, i16 %1302, i32 0
  %1306 = insertelement <2 x i16> %1305, i16 %1304, i32 1
  %1307 = bitcast <2 x i16> %1306 to i32
  %1308 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4416
  %1309 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1308)
  %1310 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4544
  %1311 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1310)
  %1312 = insertelement <2 x i16> undef, i16 %1309, i32 0
  %1313 = insertelement <2 x i16> %1312, i16 %1311, i32 1
  %1314 = bitcast <2 x i16> %1313 to i32
  %1315 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4672
  %1316 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1315)
  %1317 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4800
  %1318 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1317)
  %1319 = insertelement <2 x i16> undef, i16 %1316, i32 0
  %1320 = insertelement <2 x i16> %1319, i16 %1318, i32 1
  %1321 = bitcast <2 x i16> %1320 to i32
  %1322 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4928
  %1323 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1322)
  %1324 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5056
  %1325 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1324)
  %1326 = insertelement <2 x i16> undef, i16 %1323, i32 0
  %1327 = insertelement <2 x i16> %1326, i16 %1325, i32 1
  %1328 = bitcast <2 x i16> %1327 to i32
  %1329 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5184
  %1330 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1329)
  %1331 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5312
  %1332 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1331)
  %1333 = insertelement <2 x i16> undef, i16 %1330, i32 0
  %1334 = insertelement <2 x i16> %1333, i16 %1332, i32 1
  %1335 = bitcast <2 x i16> %1334 to i32
  %1336 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5440
  %1337 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1336)
  %1338 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5568
  %1339 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1338)
  %1340 = insertelement <2 x i16> undef, i16 %1337, i32 0
  %1341 = insertelement <2 x i16> %1340, i16 %1339, i32 1
  %1342 = bitcast <2 x i16> %1341 to i32
  %1343 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5696
  %1344 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1343)
  %1345 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5824
  %1346 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1345)
  %1347 = insertelement <2 x i16> undef, i16 %1344, i32 0
  %1348 = insertelement <2 x i16> %1347, i16 %1346, i32 1
  %1349 = bitcast <2 x i16> %1348 to i32
  %1350 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5952
  %1351 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1350)
  %1352 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6080
  %1353 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1352)
  %1354 = insertelement <2 x i16> undef, i16 %1351, i32 0
  %1355 = insertelement <2 x i16> %1354, i16 %1353, i32 1
  %1356 = bitcast <2 x i16> %1355 to i32
  %1357 = insertelement <8 x i32> undef, i32 %1307, i32 0
  %1358 = insertelement <8 x i32> %1357, i32 %1314, i32 1
  %1359 = insertelement <8 x i32> %1358, i32 %1321, i32 2
  %1360 = insertelement <8 x i32> %1359, i32 %1328, i32 3
  %1361 = insertelement <8 x i32> %1360, i32 %1335, i32 4
  %1362 = insertelement <8 x i32> %1361, i32 %1342, i32 5
  %1363 = insertelement <8 x i32> %1362, i32 %1349, i32 6
  %1364 = insertelement <8 x i32> %1363, i32 %1356, i32 7
  %1365 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1105, <8 x i16> %565, <8 x i32> %1364, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1366 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4192
  %1367 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1366)
  %1368 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4320
  %1369 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1368)
  %1370 = insertelement <2 x i16> undef, i16 %1367, i32 0
  %1371 = insertelement <2 x i16> %1370, i16 %1369, i32 1
  %1372 = bitcast <2 x i16> %1371 to i32
  %1373 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4448
  %1374 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1373)
  %1375 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4576
  %1376 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1375)
  %1377 = insertelement <2 x i16> undef, i16 %1374, i32 0
  %1378 = insertelement <2 x i16> %1377, i16 %1376, i32 1
  %1379 = bitcast <2 x i16> %1378 to i32
  %1380 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4704
  %1381 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1380)
  %1382 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4832
  %1383 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1382)
  %1384 = insertelement <2 x i16> undef, i16 %1381, i32 0
  %1385 = insertelement <2 x i16> %1384, i16 %1383, i32 1
  %1386 = bitcast <2 x i16> %1385 to i32
  %1387 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 4960
  %1388 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1387)
  %1389 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5088
  %1390 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1389)
  %1391 = insertelement <2 x i16> undef, i16 %1388, i32 0
  %1392 = insertelement <2 x i16> %1391, i16 %1390, i32 1
  %1393 = bitcast <2 x i16> %1392 to i32
  %1394 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5216
  %1395 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1394)
  %1396 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5344
  %1397 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1396)
  %1398 = insertelement <2 x i16> undef, i16 %1395, i32 0
  %1399 = insertelement <2 x i16> %1398, i16 %1397, i32 1
  %1400 = bitcast <2 x i16> %1399 to i32
  %1401 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5472
  %1402 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1401)
  %1403 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5600
  %1404 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1403)
  %1405 = insertelement <2 x i16> undef, i16 %1402, i32 0
  %1406 = insertelement <2 x i16> %1405, i16 %1404, i32 1
  %1407 = bitcast <2 x i16> %1406 to i32
  %1408 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5728
  %1409 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1408)
  %1410 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5856
  %1411 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1410)
  %1412 = insertelement <2 x i16> undef, i16 %1409, i32 0
  %1413 = insertelement <2 x i16> %1412, i16 %1411, i32 1
  %1414 = bitcast <2 x i16> %1413 to i32
  %1415 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 5984
  %1416 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1415)
  %1417 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6112
  %1418 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1417)
  %1419 = insertelement <2 x i16> undef, i16 %1416, i32 0
  %1420 = insertelement <2 x i16> %1419, i16 %1418, i32 1
  %1421 = bitcast <2 x i16> %1420 to i32
  %1422 = insertelement <8 x i32> undef, i32 %1372, i32 0
  %1423 = insertelement <8 x i32> %1422, i32 %1379, i32 1
  %1424 = insertelement <8 x i32> %1423, i32 %1386, i32 2
  %1425 = insertelement <8 x i32> %1424, i32 %1393, i32 3
  %1426 = insertelement <8 x i32> %1425, i32 %1400, i32 4
  %1427 = insertelement <8 x i32> %1426, i32 %1407, i32 5
  %1428 = insertelement <8 x i32> %1427, i32 %1414, i32 6
  %1429 = insertelement <8 x i32> %1428, i32 %1421, i32 7
  %1430 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1170, <8 x i16> %565, <8 x i32> %1429, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1431 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6144
  %1432 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1431)
  %1433 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6272
  %1434 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1433)
  %1435 = insertelement <2 x i16> undef, i16 %1432, i32 0
  %1436 = insertelement <2 x i16> %1435, i16 %1434, i32 1
  %1437 = bitcast <2 x i16> %1436 to i32
  %1438 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6400
  %1439 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1438)
  %1440 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6528
  %1441 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1440)
  %1442 = insertelement <2 x i16> undef, i16 %1439, i32 0
  %1443 = insertelement <2 x i16> %1442, i16 %1441, i32 1
  %1444 = bitcast <2 x i16> %1443 to i32
  %1445 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6656
  %1446 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1445)
  %1447 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6784
  %1448 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1447)
  %1449 = insertelement <2 x i16> undef, i16 %1446, i32 0
  %1450 = insertelement <2 x i16> %1449, i16 %1448, i32 1
  %1451 = bitcast <2 x i16> %1450 to i32
  %1452 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6912
  %1453 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1452)
  %1454 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7040
  %1455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1454)
  %1456 = insertelement <2 x i16> undef, i16 %1453, i32 0
  %1457 = insertelement <2 x i16> %1456, i16 %1455, i32 1
  %1458 = bitcast <2 x i16> %1457 to i32
  %1459 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7168
  %1460 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1459)
  %1461 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7296
  %1462 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1461)
  %1463 = insertelement <2 x i16> undef, i16 %1460, i32 0
  %1464 = insertelement <2 x i16> %1463, i16 %1462, i32 1
  %1465 = bitcast <2 x i16> %1464 to i32
  %1466 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7424
  %1467 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1466)
  %1468 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7552
  %1469 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1468)
  %1470 = insertelement <2 x i16> undef, i16 %1467, i32 0
  %1471 = insertelement <2 x i16> %1470, i16 %1469, i32 1
  %1472 = bitcast <2 x i16> %1471 to i32
  %1473 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7680
  %1474 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1473)
  %1475 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7808
  %1476 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1475)
  %1477 = insertelement <2 x i16> undef, i16 %1474, i32 0
  %1478 = insertelement <2 x i16> %1477, i16 %1476, i32 1
  %1479 = bitcast <2 x i16> %1478 to i32
  %1480 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7936
  %1481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1480)
  %1482 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 8064
  %1483 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1482)
  %1484 = insertelement <2 x i16> undef, i16 %1481, i32 0
  %1485 = insertelement <2 x i16> %1484, i16 %1483, i32 1
  %1486 = bitcast <2 x i16> %1485 to i32
  %1487 = insertelement <8 x i32> undef, i32 %1437, i32 0
  %1488 = insertelement <8 x i32> %1487, i32 %1444, i32 1
  %1489 = insertelement <8 x i32> %1488, i32 %1451, i32 2
  %1490 = insertelement <8 x i32> %1489, i32 %1458, i32 3
  %1491 = insertelement <8 x i32> %1490, i32 %1465, i32 4
  %1492 = insertelement <8 x i32> %1491, i32 %1472, i32 5
  %1493 = insertelement <8 x i32> %1492, i32 %1479, i32 6
  %1494 = insertelement <8 x i32> %1493, i32 %1486, i32 7
  %1495 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1235, <8 x i16> %564, <8 x i32> %1494, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1496 = extractelement <8 x float> %1495, i32 0
  %1497 = extractelement <8 x float> %1495, i32 1
  %1498 = extractelement <8 x float> %1495, i32 2
  %1499 = extractelement <8 x float> %1495, i32 3
  %1500 = extractelement <8 x float> %1495, i32 4
  %1501 = extractelement <8 x float> %1495, i32 5
  %1502 = extractelement <8 x float> %1495, i32 6
  %1503 = extractelement <8 x float> %1495, i32 7
  %1504 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6176
  %1505 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1504)
  %1506 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6304
  %1507 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1506)
  %1508 = insertelement <2 x i16> undef, i16 %1505, i32 0
  %1509 = insertelement <2 x i16> %1508, i16 %1507, i32 1
  %1510 = bitcast <2 x i16> %1509 to i32
  %1511 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6432
  %1512 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1511)
  %1513 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6560
  %1514 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1513)
  %1515 = insertelement <2 x i16> undef, i16 %1512, i32 0
  %1516 = insertelement <2 x i16> %1515, i16 %1514, i32 1
  %1517 = bitcast <2 x i16> %1516 to i32
  %1518 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6688
  %1519 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1518)
  %1520 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6816
  %1521 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1520)
  %1522 = insertelement <2 x i16> undef, i16 %1519, i32 0
  %1523 = insertelement <2 x i16> %1522, i16 %1521, i32 1
  %1524 = bitcast <2 x i16> %1523 to i32
  %1525 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6944
  %1526 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1525)
  %1527 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7072
  %1528 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1527)
  %1529 = insertelement <2 x i16> undef, i16 %1526, i32 0
  %1530 = insertelement <2 x i16> %1529, i16 %1528, i32 1
  %1531 = bitcast <2 x i16> %1530 to i32
  %1532 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7200
  %1533 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1532)
  %1534 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7328
  %1535 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1534)
  %1536 = insertelement <2 x i16> undef, i16 %1533, i32 0
  %1537 = insertelement <2 x i16> %1536, i16 %1535, i32 1
  %1538 = bitcast <2 x i16> %1537 to i32
  %1539 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7456
  %1540 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1539)
  %1541 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7584
  %1542 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1541)
  %1543 = insertelement <2 x i16> undef, i16 %1540, i32 0
  %1544 = insertelement <2 x i16> %1543, i16 %1542, i32 1
  %1545 = bitcast <2 x i16> %1544 to i32
  %1546 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7712
  %1547 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1546)
  %1548 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7840
  %1549 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1548)
  %1550 = insertelement <2 x i16> undef, i16 %1547, i32 0
  %1551 = insertelement <2 x i16> %1550, i16 %1549, i32 1
  %1552 = bitcast <2 x i16> %1551 to i32
  %1553 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7968
  %1554 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1553)
  %1555 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 8096
  %1556 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1555)
  %1557 = insertelement <2 x i16> undef, i16 %1554, i32 0
  %1558 = insertelement <2 x i16> %1557, i16 %1556, i32 1
  %1559 = bitcast <2 x i16> %1558 to i32
  %1560 = insertelement <8 x i32> undef, i32 %1510, i32 0
  %1561 = insertelement <8 x i32> %1560, i32 %1517, i32 1
  %1562 = insertelement <8 x i32> %1561, i32 %1524, i32 2
  %1563 = insertelement <8 x i32> %1562, i32 %1531, i32 3
  %1564 = insertelement <8 x i32> %1563, i32 %1538, i32 4
  %1565 = insertelement <8 x i32> %1564, i32 %1545, i32 5
  %1566 = insertelement <8 x i32> %1565, i32 %1552, i32 6
  %1567 = insertelement <8 x i32> %1566, i32 %1559, i32 7
  %1568 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1300, <8 x i16> %564, <8 x i32> %1567, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1569 = extractelement <8 x float> %1568, i32 0
  %1570 = extractelement <8 x float> %1568, i32 1
  %1571 = extractelement <8 x float> %1568, i32 2
  %1572 = extractelement <8 x float> %1568, i32 3
  %1573 = extractelement <8 x float> %1568, i32 4
  %1574 = extractelement <8 x float> %1568, i32 5
  %1575 = extractelement <8 x float> %1568, i32 6
  %1576 = extractelement <8 x float> %1568, i32 7
  %1577 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6208
  %1578 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1577)
  %1579 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6336
  %1580 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1579)
  %1581 = insertelement <2 x i16> undef, i16 %1578, i32 0
  %1582 = insertelement <2 x i16> %1581, i16 %1580, i32 1
  %1583 = bitcast <2 x i16> %1582 to i32
  %1584 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6464
  %1585 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1584)
  %1586 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6592
  %1587 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1586)
  %1588 = insertelement <2 x i16> undef, i16 %1585, i32 0
  %1589 = insertelement <2 x i16> %1588, i16 %1587, i32 1
  %1590 = bitcast <2 x i16> %1589 to i32
  %1591 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6720
  %1592 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1591)
  %1593 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6848
  %1594 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1593)
  %1595 = insertelement <2 x i16> undef, i16 %1592, i32 0
  %1596 = insertelement <2 x i16> %1595, i16 %1594, i32 1
  %1597 = bitcast <2 x i16> %1596 to i32
  %1598 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6976
  %1599 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1598)
  %1600 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7104
  %1601 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1600)
  %1602 = insertelement <2 x i16> undef, i16 %1599, i32 0
  %1603 = insertelement <2 x i16> %1602, i16 %1601, i32 1
  %1604 = bitcast <2 x i16> %1603 to i32
  %1605 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7232
  %1606 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1605)
  %1607 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7360
  %1608 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1607)
  %1609 = insertelement <2 x i16> undef, i16 %1606, i32 0
  %1610 = insertelement <2 x i16> %1609, i16 %1608, i32 1
  %1611 = bitcast <2 x i16> %1610 to i32
  %1612 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7488
  %1613 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1612)
  %1614 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7616
  %1615 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1614)
  %1616 = insertelement <2 x i16> undef, i16 %1613, i32 0
  %1617 = insertelement <2 x i16> %1616, i16 %1615, i32 1
  %1618 = bitcast <2 x i16> %1617 to i32
  %1619 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7744
  %1620 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1619)
  %1621 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7872
  %1622 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1621)
  %1623 = insertelement <2 x i16> undef, i16 %1620, i32 0
  %1624 = insertelement <2 x i16> %1623, i16 %1622, i32 1
  %1625 = bitcast <2 x i16> %1624 to i32
  %1626 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 8000
  %1627 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1626)
  %1628 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 8128
  %1629 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1628)
  %1630 = insertelement <2 x i16> undef, i16 %1627, i32 0
  %1631 = insertelement <2 x i16> %1630, i16 %1629, i32 1
  %1632 = bitcast <2 x i16> %1631 to i32
  %1633 = insertelement <8 x i32> undef, i32 %1583, i32 0
  %1634 = insertelement <8 x i32> %1633, i32 %1590, i32 1
  %1635 = insertelement <8 x i32> %1634, i32 %1597, i32 2
  %1636 = insertelement <8 x i32> %1635, i32 %1604, i32 3
  %1637 = insertelement <8 x i32> %1636, i32 %1611, i32 4
  %1638 = insertelement <8 x i32> %1637, i32 %1618, i32 5
  %1639 = insertelement <8 x i32> %1638, i32 %1625, i32 6
  %1640 = insertelement <8 x i32> %1639, i32 %1632, i32 7
  %1641 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1365, <8 x i16> %564, <8 x i32> %1640, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1642 = extractelement <8 x float> %1641, i32 0
  %1643 = extractelement <8 x float> %1641, i32 1
  %1644 = extractelement <8 x float> %1641, i32 2
  %1645 = extractelement <8 x float> %1641, i32 3
  %1646 = extractelement <8 x float> %1641, i32 4
  %1647 = extractelement <8 x float> %1641, i32 5
  %1648 = extractelement <8 x float> %1641, i32 6
  %1649 = extractelement <8 x float> %1641, i32 7
  %1650 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6240
  %1651 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1650)
  %1652 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6368
  %1653 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1652)
  %1654 = insertelement <2 x i16> undef, i16 %1651, i32 0
  %1655 = insertelement <2 x i16> %1654, i16 %1653, i32 1
  %1656 = bitcast <2 x i16> %1655 to i32
  %1657 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6496
  %1658 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1657)
  %1659 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6624
  %1660 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1659)
  %1661 = insertelement <2 x i16> undef, i16 %1658, i32 0
  %1662 = insertelement <2 x i16> %1661, i16 %1660, i32 1
  %1663 = bitcast <2 x i16> %1662 to i32
  %1664 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6752
  %1665 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1664)
  %1666 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 6880
  %1667 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1666)
  %1668 = insertelement <2 x i16> undef, i16 %1665, i32 0
  %1669 = insertelement <2 x i16> %1668, i16 %1667, i32 1
  %1670 = bitcast <2 x i16> %1669 to i32
  %1671 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7008
  %1672 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1671)
  %1673 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7136
  %1674 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1673)
  %1675 = insertelement <2 x i16> undef, i16 %1672, i32 0
  %1676 = insertelement <2 x i16> %1675, i16 %1674, i32 1
  %1677 = bitcast <2 x i16> %1676 to i32
  %1678 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7264
  %1679 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1678)
  %1680 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7392
  %1681 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1680)
  %1682 = insertelement <2 x i16> undef, i16 %1679, i32 0
  %1683 = insertelement <2 x i16> %1682, i16 %1681, i32 1
  %1684 = bitcast <2 x i16> %1683 to i32
  %1685 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7520
  %1686 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1685)
  %1687 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7648
  %1688 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1687)
  %1689 = insertelement <2 x i16> undef, i16 %1686, i32 0
  %1690 = insertelement <2 x i16> %1689, i16 %1688, i32 1
  %1691 = bitcast <2 x i16> %1690 to i32
  %1692 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7776
  %1693 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1692)
  %1694 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 7904
  %1695 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1694)
  %1696 = insertelement <2 x i16> undef, i16 %1693, i32 0
  %1697 = insertelement <2 x i16> %1696, i16 %1695, i32 1
  %1698 = bitcast <2 x i16> %1697 to i32
  %1699 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 8032
  %1700 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1699)
  %1701 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM, i64 0, i64 8160
  %1702 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1701)
  %1703 = insertelement <2 x i16> undef, i16 %1700, i32 0
  %1704 = insertelement <2 x i16> %1703, i16 %1702, i32 1
  %1705 = bitcast <2 x i16> %1704 to i32
  %1706 = insertelement <8 x i32> undef, i32 %1656, i32 0
  %1707 = insertelement <8 x i32> %1706, i32 %1663, i32 1
  %1708 = insertelement <8 x i32> %1707, i32 %1670, i32 2
  %1709 = insertelement <8 x i32> %1708, i32 %1677, i32 3
  %1710 = insertelement <8 x i32> %1709, i32 %1684, i32 4
  %1711 = insertelement <8 x i32> %1710, i32 %1691, i32 5
  %1712 = insertelement <8 x i32> %1711, i32 %1698, i32 6
  %1713 = insertelement <8 x i32> %1712, i32 %1705, i32 7
  %1714 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1430, <8 x i16> %564, <8 x i32> %1713, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1715 = extractelement <8 x float> %1714, i32 0
  %1716 = extractelement <8 x float> %1714, i32 1
  %1717 = extractelement <8 x float> %1714, i32 2
  %1718 = extractelement <8 x float> %1714, i32 3
  %1719 = extractelement <8 x float> %1714, i32 4
  %1720 = extractelement <8 x float> %1714, i32 5
  %1721 = extractelement <8 x float> %1714, i32 6
  %1722 = extractelement <8 x float> %1714, i32 7
  %1723 = zext i32 %601 to i64
  %1724 = getelementptr inbounds float, ptr addrspace(1) %599, i64 %1723
  %1725 = bitcast float %1496 to i32
  %1726 = bitcast float %1497 to i32
  %1727 = bitcast float %1498 to i32
  %1728 = bitcast float %1499 to i32
  %1729 = bitcast float %1500 to i32
  %1730 = bitcast float %1501 to i32
  %1731 = bitcast float %1502 to i32
  %1732 = bitcast float %1503 to i32
  %1733 = insertelement <8 x i32> undef, i32 %1725, i32 0
  %1734 = insertelement <8 x i32> %1733, i32 %1726, i32 1
  %1735 = insertelement <8 x i32> %1734, i32 %1727, i32 2
  %1736 = insertelement <8 x i32> %1735, i32 %1728, i32 3
  %1737 = insertelement <8 x i32> %1736, i32 %1729, i32 4
  %1738 = insertelement <8 x i32> %1737, i32 %1730, i32 5
  %1739 = insertelement <8 x i32> %1738, i32 %1731, i32 6
  %1740 = insertelement <8 x i32> %1739, i32 %1732, i32 7
  %.ascast.i78 = addrspacecast ptr addrspace(1) %1724 to ptr addrspace(4)
  %1741 = mul i32 %22, %21
  %1742 = mul i32 %1741, %23
  %1743 = and i32 %1742, 15
  %1744 = icmp eq i32 %1743, 0
  br i1 %1744, label %1757, label %1745

1745:                                             ; preds = %651
  %localIdZ52 = zext i16 %localIdZ to i32
  %1746 = mul i32 %22, %localIdZ52
  %localIdY54 = zext i16 %localIdY to i32
  %1747 = add i32 %1746, %localIdY54
  %1748 = mul i32 %1747, %21
  %localIdX56 = zext i16 %localIdX to i32
  %1749 = add i32 %1748, %localIdX56
  %1750 = lshr i32 %1749, 4
  %1751 = mul i32 %22, %21
  %1752 = mul i32 %1751, %23
  %1753 = add i32 %1752, 15
  %1754 = lshr i32 %1753, 4
  %1755 = add nsw i32 %1754, -1
  %1756 = icmp ult i32 %1750, %1755
  br i1 %1756, label %1757, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

1757:                                             ; preds = %1745, %651
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %1745, %1757
  %1758 = ptrtoint ptr addrspace(4) %.ascast.i78 to i64
  %1759 = and i64 %1758, -64
  %1760 = trunc i64 %1758 to i32
  %1761 = lshr i32 %1760, 2
  %1762 = and i32 %1761, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %1759, i32 1023, i32 7, i32 1023, i32 %1762, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %1740)
  %1763 = getelementptr inbounds float, ptr addrspace(1) %1724, i64 16
  %1764 = bitcast float %1569 to i32
  %1765 = bitcast float %1570 to i32
  %1766 = bitcast float %1571 to i32
  %1767 = bitcast float %1572 to i32
  %1768 = bitcast float %1573 to i32
  %1769 = bitcast float %1574 to i32
  %1770 = bitcast float %1575 to i32
  %1771 = bitcast float %1576 to i32
  %1772 = insertelement <8 x i32> undef, i32 %1764, i32 0
  %1773 = insertelement <8 x i32> %1772, i32 %1765, i32 1
  %1774 = insertelement <8 x i32> %1773, i32 %1766, i32 2
  %1775 = insertelement <8 x i32> %1774, i32 %1767, i32 3
  %1776 = insertelement <8 x i32> %1775, i32 %1768, i32 4
  %1777 = insertelement <8 x i32> %1776, i32 %1769, i32 5
  %1778 = insertelement <8 x i32> %1777, i32 %1770, i32 6
  %1779 = insertelement <8 x i32> %1778, i32 %1771, i32 7
  %.ascast.i79 = addrspacecast ptr addrspace(1) %1763 to ptr addrspace(4)
  %1780 = mul i32 %22, %21
  %1781 = mul i32 %1780, %23
  %1782 = and i32 %1781, 15
  %1783 = icmp eq i32 %1782, 0
  br i1 %1783, label %1796, label %1784

1784:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  %localIdZ63 = zext i16 %localIdZ to i32
  %1785 = mul i32 %22, %localIdZ63
  %localIdY65 = zext i16 %localIdY to i32
  %1786 = add i32 %1785, %localIdY65
  %1787 = mul i32 %1786, %21
  %localIdX67 = zext i16 %localIdX to i32
  %1788 = add i32 %1787, %localIdX67
  %1789 = lshr i32 %1788, 4
  %1790 = mul i32 %22, %21
  %1791 = mul i32 %1790, %23
  %1792 = add i32 %1791, 15
  %1793 = lshr i32 %1792, 4
  %1794 = add nsw i32 %1793, -1
  %1795 = icmp ult i32 %1789, %1794
  br i1 %1795, label %1796, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80

1796:                                             ; preds = %1784, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80: ; preds = %1784, %1796
  %1797 = ptrtoint ptr addrspace(4) %.ascast.i79 to i64
  %1798 = and i64 %1797, -64
  %1799 = trunc i64 %1797 to i32
  %1800 = lshr i32 %1799, 2
  %1801 = and i32 %1800, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %1798, i32 1023, i32 7, i32 1023, i32 %1801, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %1779)
  %1802 = getelementptr inbounds float, ptr addrspace(1) %1724, i64 32
  %1803 = bitcast float %1642 to i32
  %1804 = bitcast float %1643 to i32
  %1805 = bitcast float %1644 to i32
  %1806 = bitcast float %1645 to i32
  %1807 = bitcast float %1646 to i32
  %1808 = bitcast float %1647 to i32
  %1809 = bitcast float %1648 to i32
  %1810 = bitcast float %1649 to i32
  %1811 = insertelement <8 x i32> undef, i32 %1803, i32 0
  %1812 = insertelement <8 x i32> %1811, i32 %1804, i32 1
  %1813 = insertelement <8 x i32> %1812, i32 %1805, i32 2
  %1814 = insertelement <8 x i32> %1813, i32 %1806, i32 3
  %1815 = insertelement <8 x i32> %1814, i32 %1807, i32 4
  %1816 = insertelement <8 x i32> %1815, i32 %1808, i32 5
  %1817 = insertelement <8 x i32> %1816, i32 %1809, i32 6
  %1818 = insertelement <8 x i32> %1817, i32 %1810, i32 7
  %.ascast.i81 = addrspacecast ptr addrspace(1) %1802 to ptr addrspace(4)
  %1819 = mul i32 %22, %21
  %1820 = mul i32 %1819, %23
  %1821 = and i32 %1820, 15
  %1822 = icmp eq i32 %1821, 0
  br i1 %1822, label %1835, label %1823

1823:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80
  %localIdZ74 = zext i16 %localIdZ to i32
  %1824 = mul i32 %22, %localIdZ74
  %localIdY76 = zext i16 %localIdY to i32
  %1825 = add i32 %1824, %localIdY76
  %1826 = mul i32 %1825, %21
  %localIdX78 = zext i16 %localIdX to i32
  %1827 = add i32 %1826, %localIdX78
  %1828 = lshr i32 %1827, 4
  %1829 = mul i32 %22, %21
  %1830 = mul i32 %1829, %23
  %1831 = add i32 %1830, 15
  %1832 = lshr i32 %1831, 4
  %1833 = add nsw i32 %1832, -1
  %1834 = icmp ult i32 %1828, %1833
  br i1 %1834, label %1835, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82

1835:                                             ; preds = %1823, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82: ; preds = %1823, %1835
  %1836 = ptrtoint ptr addrspace(4) %.ascast.i81 to i64
  %1837 = and i64 %1836, -64
  %1838 = trunc i64 %1836 to i32
  %1839 = lshr i32 %1838, 2
  %1840 = and i32 %1839, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %1837, i32 1023, i32 7, i32 1023, i32 %1840, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %1818)
  %1841 = getelementptr inbounds float, ptr addrspace(1) %1724, i64 48
  %1842 = bitcast float %1715 to i32
  %1843 = bitcast float %1716 to i32
  %1844 = bitcast float %1717 to i32
  %1845 = bitcast float %1718 to i32
  %1846 = bitcast float %1719 to i32
  %1847 = bitcast float %1720 to i32
  %1848 = bitcast float %1721 to i32
  %1849 = bitcast float %1722 to i32
  %1850 = insertelement <8 x i32> undef, i32 %1842, i32 0
  %1851 = insertelement <8 x i32> %1850, i32 %1843, i32 1
  %1852 = insertelement <8 x i32> %1851, i32 %1844, i32 2
  %1853 = insertelement <8 x i32> %1852, i32 %1845, i32 3
  %1854 = insertelement <8 x i32> %1853, i32 %1846, i32 4
  %1855 = insertelement <8 x i32> %1854, i32 %1847, i32 5
  %1856 = insertelement <8 x i32> %1855, i32 %1848, i32 6
  %1857 = insertelement <8 x i32> %1856, i32 %1849, i32 7
  %.ascast.i83 = addrspacecast ptr addrspace(1) %1841 to ptr addrspace(4)
  %1858 = mul i32 %22, %21
  %1859 = mul i32 %1858, %23
  %1860 = and i32 %1859, 15
  %1861 = icmp eq i32 %1860, 0
  br i1 %1861, label %1874, label %1862

1862:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82
  %localIdZ85 = zext i16 %localIdZ to i32
  %1863 = mul i32 %22, %localIdZ85
  %localIdY87 = zext i16 %localIdY to i32
  %1864 = add i32 %1863, %localIdY87
  %1865 = mul i32 %1864, %21
  %localIdX89 = zext i16 %localIdX to i32
  %1866 = add i32 %1865, %localIdX89
  %1867 = lshr i32 %1866, 4
  %1868 = mul i32 %22, %21
  %1869 = mul i32 %1868, %23
  %1870 = add i32 %1869, 15
  %1871 = lshr i32 %1870, 4
  %1872 = add nsw i32 %1871, -1
  %1873 = icmp ult i32 %1867, %1872
  br i1 %1873, label %1874, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit84

1874:                                             ; preds = %1862, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit84

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit84: ; preds = %1862, %1874
  %1875 = ptrtoint ptr addrspace(4) %.ascast.i83 to i64
  %1876 = and i64 %1875, -64
  %1877 = trunc i64 %1875 to i32
  %1878 = lshr i32 %1877, 2
  %1879 = and i32 %1878, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %1876, i32 1023, i32 7, i32 1023, i32 %1879, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %1857)
  br label %1880

1880:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit84, %650
  %1881 = add nuw nsw i32 %601, 64, !spirv.Decorations !743
  %1882 = icmp ult i32 %601, 192
  br i1 %1882, label %1883, label %1884

1883:                                             ; preds = %1880
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %1884

1884:                                             ; preds = %1883, %1880
  br label %600, !llvm.loop !773

1885:                                             ; preds = %603, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
  %21 = extractelement <3 x i32> %localSize, i32 0
  %22 = extractelement <3 x i32> %localSize, i32 1
  %23 = extractelement <3 x i32> %localSize, i32 2
  %24 = extractelement <8 x i32> %r0, i32 0
  %25 = extractelement <8 x i32> %r0, i32 1
  %26 = extractelement <8 x i32> %r0, i32 2
  %27 = extractelement <8 x i32> %r0, i32 3
  %28 = extractelement <8 x i32> %r0, i32 4
  %29 = extractelement <8 x i32> %r0, i32 5
  %30 = extractelement <8 x i32> %r0, i32 6
  %31 = extractelement <8 x i32> %r0, i32 7
  %32 = alloca [8 x float], align 4, !spirv.Decorations !739
  %33 = alloca [4 x float], align 4, !spirv.Decorations !739
  %34 = alloca [4 x float], align 4, !spirv.Decorations !739
  %35 = alloca [4 x float], align 4, !spirv.Decorations !739
  %36 = zext i16 %localIdX to i32
  %37 = zext i32 %25 to i64
  %38 = icmp sgt i32 %25, -1
  call void @llvm.assume(i1 %38)
  %39 = bitcast <8 x i32> %r0 to <32 x i8>
  %40 = extractelement <32 x i8> %39, i32 0
  %41 = extractelement <32 x i8> %39, i32 1
  %42 = extractelement <32 x i8> %39, i32 2
  %43 = extractelement <32 x i8> %39, i32 3
  %44 = extractelement <32 x i8> %39, i32 4
  %45 = extractelement <32 x i8> %39, i32 5
  %46 = extractelement <32 x i8> %39, i32 6
  %47 = extractelement <32 x i8> %39, i32 7
  %48 = extractelement <32 x i8> %39, i32 8
  %49 = extractelement <32 x i8> %39, i32 9
  %50 = extractelement <32 x i8> %39, i32 10
  %51 = extractelement <32 x i8> %39, i32 11
  %52 = extractelement <32 x i8> %39, i32 12
  %53 = extractelement <32 x i8> %39, i32 13
  %54 = extractelement <32 x i8> %39, i32 14
  %55 = extractelement <32 x i8> %39, i32 15
  %56 = extractelement <32 x i8> %39, i32 16
  %57 = extractelement <32 x i8> %39, i32 17
  %58 = extractelement <32 x i8> %39, i32 18
  %59 = extractelement <32 x i8> %39, i32 19
  %60 = extractelement <32 x i8> %39, i32 20
  %61 = extractelement <32 x i8> %39, i32 21
  %62 = extractelement <32 x i8> %39, i32 22
  %63 = extractelement <32 x i8> %39, i32 23
  %64 = extractelement <32 x i8> %39, i32 24
  %65 = extractelement <32 x i8> %39, i32 25
  %66 = extractelement <32 x i8> %39, i32 26
  %67 = extractelement <32 x i8> %39, i32 27
  %68 = extractelement <32 x i8> %39, i32 28
  %69 = extractelement <32 x i8> %39, i32 29
  %70 = extractelement <32 x i8> %39, i32 30
  %71 = extractelement <32 x i8> %39, i32 31
  %localThreadId26 = zext i8 %48 to i32
  %72 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !741
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %73 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %73)
  %74 = mul nsw i32 %0, 6, !spirv.Decorations !741
  %75 = icmp slt i32 %72, %74
  %76 = sdiv i32 %25, %1
  %freeze = freeze i32 %76
  %77 = mul nsw i32 %freeze, %1, !spirv.Decorations !741
  %78 = sub nsw i32 %25, %77, !spirv.Decorations !741
  %79 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %80 = icmp eq ptr addrspace(1) %2, %79
  %81 = select i1 %80, ptr addrspace(1) %3, ptr addrspace(1) %2
  %82 = load i32, ptr addrspace(1) %81, align 4
  %83 = sext i32 %82 to i64
  %84 = sext i32 %78 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !741
  %86 = sub nsw i64 %83, %85, !spirv.Decorations !741
  %87 = call i64 @llvm.smin.i64(i64 %86, i64 64)
  %88 = call i64 @llvm.smax.i64(i64 %87, i64 0)
  %89 = trunc i64 %88 to i32
  %90 = icmp slt i32 %89, 1
  br i1 %90, label %1060, label %91

91:                                               ; preds = %20
  %92 = icmp slt i32 %4, 2
  br i1 %92, label %93, label %96

93:                                               ; preds = %91
  %94 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %84
  %95 = load i32, ptr addrspace(1) %94, align 4
  br label %105

96:                                               ; preds = %91
  %97 = sdiv i32 %78, %4
  %freeze131 = freeze i32 %97
  %98 = sext i32 %freeze131 to i64
  %99 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %98
  %100 = load i32, ptr addrspace(1) %99, align 4
  %101 = mul nsw i32 %100, %4, !spirv.Decorations !741
  %102 = mul i32 %freeze131, %4
  %103 = sub i32 %78, %102
  %104 = add nsw i32 %101, %103, !spirv.Decorations !741
  br label %105

105:                                              ; preds = %96, %93
  %106 = phi i32 [ %95, %93 ], [ %104, %96 ]
  %107 = sext i32 %freeze to i64
  %108 = shl nsw i64 %107, 6, !spirv.Decorations !741
  %109 = shl nsw i64 %107, 14, !spirv.Decorations !741
  %110 = shl nuw nsw i64 %37, 6, !spirv.Decorations !743
  %111 = shl nuw nsw i64 %37, 14, !spirv.Decorations !743
  %112 = sext i32 %106 to i64
  %113 = mul i64 %112, %7
  %114 = shl nsw i64 %107, 8, !spirv.Decorations !741
  %115 = mul i64 %112, %8
  %116 = shl nsw i64 %107, 7, !spirv.Decorations !741
  %117 = mul i64 %112, %9
  %118 = add i64 %117, %107
  %119 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %109
  %120 = getelementptr i8, ptr addrspace(1) %11, i64 %113
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 %114
  %122 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %111
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %32)
  %123 = zext i32 %72 to i64
  %124 = getelementptr float, ptr addrspace(1) %13, i64 %108
  %125 = getelementptr float, ptr addrspace(1) %124, i64 %123
  br label %126

126:                                              ; preds = %132, %105
  %127 = phi i32 [ 0, %105 ], [ %137, %132 ]
  %128 = icmp ult i32 %127, 8
  br i1 %128, label %132, label %129

129:                                              ; preds = %126
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %33)
  %130 = shl nuw nsw i32 %simdLaneId, 1, !spirv.Decorations !756
  %131 = getelementptr float, ptr addrspace(1) %14, i64 %118
  br label %138

132:                                              ; preds = %126
  %133 = zext i32 %127 to i64
  %134 = getelementptr inbounds float, ptr addrspace(1) %125, i64 %133
  %135 = load float, ptr addrspace(1) %134, align 4
  %136 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %133
  store float %135, ptr %136, align 4
  %137 = add nuw nsw i32 %127, 1, !spirv.Decorations !743
  br label %126, !llvm.loop !775

138:                                              ; preds = %142, %129
  %139 = phi i32 [ 0, %129 ], [ %150, %142 ]
  %140 = icmp ult i32 %139, 4
  br i1 %140, label %142, label %141

141:                                              ; preds = %138
  br i1 %75, label %151, label %342

142:                                              ; preds = %138
  %143 = shl nuw nsw i32 %139, 5, !spirv.Decorations !743
  %144 = add nuw i32 %143, %130
  %145 = zext i32 %144 to i64
  %146 = getelementptr float, ptr addrspace(1) %131, i64 %145
  %147 = load float, ptr addrspace(1) %146, align 4
  %148 = zext i32 %139 to i64
  %149 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %148
  store float %147, ptr %149, align 4
  %150 = add nuw nsw i32 %139, 1, !spirv.Decorations !743
  br label %138, !llvm.loop !776

151:                                              ; preds = %141
  %152 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !741
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds i8, ptr addrspace(1) %119, i64 %153
  %155 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 8192
  %156 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 16384
  %157 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 24576
  br label %158

158:                                              ; preds = %300, %151
  %159 = phi <8 x i32> [ zeroinitializer, %151 ], [ %340, %300 ]
  %160 = phi <8 x i32> [ zeroinitializer, %151 ], [ %332, %300 ]
  %161 = phi <8 x i32> [ zeroinitializer, %151 ], [ %324, %300 ]
  %162 = phi <8 x i32> [ zeroinitializer, %151 ], [ %316, %300 ]
  %163 = phi i32 [ 0, %151 ], [ %341, %300 ]
  %164 = extractelement <8 x i32> %159, i32 0
  %165 = extractelement <8 x i32> %159, i32 1
  %166 = extractelement <8 x i32> %159, i32 2
  %167 = extractelement <8 x i32> %159, i32 3
  %168 = extractelement <8 x i32> %159, i32 4
  %169 = extractelement <8 x i32> %159, i32 5
  %170 = extractelement <8 x i32> %159, i32 6
  %171 = extractelement <8 x i32> %159, i32 7
  %172 = extractelement <8 x i32> %160, i32 0
  %173 = extractelement <8 x i32> %160, i32 1
  %174 = extractelement <8 x i32> %160, i32 2
  %175 = extractelement <8 x i32> %160, i32 3
  %176 = extractelement <8 x i32> %160, i32 4
  %177 = extractelement <8 x i32> %160, i32 5
  %178 = extractelement <8 x i32> %160, i32 6
  %179 = extractelement <8 x i32> %160, i32 7
  %180 = extractelement <8 x i32> %161, i32 0
  %181 = extractelement <8 x i32> %161, i32 1
  %182 = extractelement <8 x i32> %161, i32 2
  %183 = extractelement <8 x i32> %161, i32 3
  %184 = extractelement <8 x i32> %161, i32 4
  %185 = extractelement <8 x i32> %161, i32 5
  %186 = extractelement <8 x i32> %161, i32 6
  %187 = extractelement <8 x i32> %161, i32 7
  %188 = extractelement <8 x i32> %162, i32 0
  %189 = extractelement <8 x i32> %162, i32 1
  %190 = extractelement <8 x i32> %162, i32 2
  %191 = extractelement <8 x i32> %162, i32 3
  %192 = extractelement <8 x i32> %162, i32 4
  %193 = extractelement <8 x i32> %162, i32 5
  %194 = extractelement <8 x i32> %162, i32 6
  %195 = extractelement <8 x i32> %162, i32 7
  %196 = icmp ult i32 %163, 256
  br i1 %196, label %300, label %197

197:                                              ; preds = %158
  %198 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !741
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM, i64 %199
  %201 = mul i32 %22, %21
  %202 = mul i32 %201, %23
  %203 = and i32 %202, 15
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %217, label %205

205:                                              ; preds = %197
  %localIdZ30 = zext i16 %localIdZ to i32
  %206 = mul i32 %22, %localIdZ30
  %localIdY32 = zext i16 %localIdY to i32
  %207 = add i32 %206, %localIdY32
  %208 = mul i32 %207, %21
  %localIdX34 = zext i16 %localIdX to i32
  %209 = add i32 %208, %localIdX34
  %210 = lshr i32 %209, 4
  %211 = mul i32 %22, %21
  %212 = mul i32 %211, %23
  %213 = add i32 %212, 15
  %214 = lshr i32 %213, 4
  %215 = add nsw i32 %214, -1
  %216 = icmp ult i32 %210, %215
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

217:                                              ; preds = %205, %197
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %205, %217
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %200, i32 %188)
  %218 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 64
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %218, i32 %189)
  %219 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 128
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %219, i32 %190)
  %220 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %220, i32 %191)
  %221 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 256
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %221, i32 %192)
  %222 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 320
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %222, i32 %193)
  %223 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 384
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %223, i32 %194)
  %224 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 448
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %224, i32 %195)
  %225 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 16
  %226 = mul i32 %22, %21
  %227 = mul i32 %226, %23
  %228 = and i32 %227, 15
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %242, label %230

230:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  %localIdZ41 = zext i16 %localIdZ to i32
  %231 = mul i32 %22, %localIdZ41
  %localIdY43 = zext i16 %localIdY to i32
  %232 = add i32 %231, %localIdY43
  %233 = mul i32 %232, %21
  %localIdX45 = zext i16 %localIdX to i32
  %234 = add i32 %233, %localIdX45
  %235 = lshr i32 %234, 4
  %236 = mul i32 %22, %21
  %237 = mul i32 %236, %23
  %238 = add i32 %237, 15
  %239 = lshr i32 %238, 4
  %240 = add nsw i32 %239, -1
  %241 = icmp ult i32 %235, %240
  br i1 %241, label %242, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35

242:                                              ; preds = %230, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35: ; preds = %230, %242
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %225, i32 %180)
  %243 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 80
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %243, i32 %181)
  %244 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 144
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %244, i32 %182)
  %245 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 208
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %245, i32 %183)
  %246 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 272
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %246, i32 %184)
  %247 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 336
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %247, i32 %185)
  %248 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 400
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %248, i32 %186)
  %249 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 464
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %249, i32 %187)
  %250 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 32
  %251 = mul i32 %22, %21
  %252 = mul i32 %251, %23
  %253 = and i32 %252, 15
  %254 = icmp eq i32 %253, 0
  br i1 %254, label %267, label %255

255:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35
  %localIdZ52 = zext i16 %localIdZ to i32
  %256 = mul i32 %22, %localIdZ52
  %localIdY54 = zext i16 %localIdY to i32
  %257 = add i32 %256, %localIdY54
  %258 = mul i32 %257, %21
  %localIdX56 = zext i16 %localIdX to i32
  %259 = add i32 %258, %localIdX56
  %260 = lshr i32 %259, 4
  %261 = mul i32 %22, %21
  %262 = mul i32 %261, %23
  %263 = add i32 %262, 15
  %264 = lshr i32 %263, 4
  %265 = add nsw i32 %264, -1
  %266 = icmp ult i32 %260, %265
  br i1 %266, label %267, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37

267:                                              ; preds = %255, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37: ; preds = %255, %267
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %250, i32 %172)
  %268 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 96
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %268, i32 %173)
  %269 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 160
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %269, i32 %174)
  %270 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 224
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %270, i32 %175)
  %271 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 288
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %271, i32 %176)
  %272 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 352
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %272, i32 %177)
  %273 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 416
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %273, i32 %178)
  %274 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 480
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %274, i32 %179)
  %275 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 48
  %276 = mul i32 %22, %21
  %277 = mul i32 %276, %23
  %278 = and i32 %277, 15
  %279 = icmp eq i32 %278, 0
  br i1 %279, label %292, label %280

280:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37
  %localIdZ63 = zext i16 %localIdZ to i32
  %281 = mul i32 %22, %localIdZ63
  %localIdY65 = zext i16 %localIdY to i32
  %282 = add i32 %281, %localIdY65
  %283 = mul i32 %282, %21
  %localIdX67 = zext i16 %localIdX to i32
  %284 = add i32 %283, %localIdX67
  %285 = lshr i32 %284, 4
  %286 = mul i32 %22, %21
  %287 = mul i32 %286, %23
  %288 = add i32 %287, 15
  %289 = lshr i32 %288, 4
  %290 = add nsw i32 %289, -1
  %291 = icmp ult i32 %285, %290
  br i1 %291, label %292, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39

292:                                              ; preds = %280, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39: ; preds = %280, %292
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %275, i32 %164)
  %293 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 112
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %293, i32 %165)
  %294 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 176
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %294, i32 %166)
  %295 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 240
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %295, i32 %167)
  %296 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 304
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %296, i32 %168)
  %297 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 368
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %297, i32 %169)
  %298 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 432
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %298, i32 %170)
  %299 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 496
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %299, i32 %171)
  br label %342

300:                                              ; preds = %158
  %301 = zext i32 %163 to i64
  %302 = getelementptr inbounds i8, ptr addrspace(1) %154, i64 %301
  %.ascast.i40 = addrspacecast ptr addrspace(1) %302 to ptr addrspace(4)
  %303 = ptrtoint ptr addrspace(4) %.ascast.i40 to i64
  %304 = and i64 %303, -64
  %305 = trunc i64 %303 to i32
  %306 = lshr i32 %305, 1
  %307 = and i32 %306, 31
  %308 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %304, i32 255, i32 7, i32 255, i32 %307, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %309 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 %301
  %.ascast.i41 = addrspacecast ptr addrspace(1) %309 to ptr addrspace(4)
  %310 = ptrtoint ptr addrspace(4) %.ascast.i41 to i64
  %311 = and i64 %310, -64
  %312 = trunc i64 %310 to i32
  %313 = lshr i32 %312, 2
  %314 = and i32 %313, 15
  %315 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %311, i32 511, i32 15, i32 511, i32 %314, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %316 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %162, <8 x i16> %308, <8 x i32> %315, i32 4, i32 4, i32 8, i32 8, i1 false)
  %317 = getelementptr inbounds i8, ptr addrspace(1) %155, i64 %301
  %.ascast.i42 = addrspacecast ptr addrspace(1) %317 to ptr addrspace(4)
  %318 = ptrtoint ptr addrspace(4) %.ascast.i42 to i64
  %319 = and i64 %318, -64
  %320 = trunc i64 %318 to i32
  %321 = lshr i32 %320, 2
  %322 = and i32 %321, 15
  %323 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %319, i32 511, i32 15, i32 511, i32 %322, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %324 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %161, <8 x i16> %308, <8 x i32> %323, i32 4, i32 4, i32 8, i32 8, i1 false)
  %325 = getelementptr inbounds i8, ptr addrspace(1) %156, i64 %301
  %.ascast.i43 = addrspacecast ptr addrspace(1) %325 to ptr addrspace(4)
  %326 = ptrtoint ptr addrspace(4) %.ascast.i43 to i64
  %327 = and i64 %326, -64
  %328 = trunc i64 %326 to i32
  %329 = lshr i32 %328, 2
  %330 = and i32 %329, 15
  %331 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %327, i32 511, i32 15, i32 511, i32 %330, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %332 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %160, <8 x i16> %308, <8 x i32> %331, i32 4, i32 4, i32 8, i32 8, i1 false)
  %333 = getelementptr inbounds i8, ptr addrspace(1) %157, i64 %301
  %.ascast.i44 = addrspacecast ptr addrspace(1) %333 to ptr addrspace(4)
  %334 = ptrtoint ptr addrspace(4) %.ascast.i44 to i64
  %335 = and i64 %334, -64
  %336 = trunc i64 %334 to i32
  %337 = lshr i32 %336, 2
  %338 = and i32 %337, 15
  %339 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %335, i32 511, i32 15, i32 511, i32 %338, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %340 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %159, <8 x i16> %308, <8 x i32> %339, i32 4, i32 4, i32 8, i32 8, i1 false)
  %341 = add nuw nsw i32 %163, 32, !spirv.Decorations !743
  br label %158

342:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39, %141
  call void @llvm.genx.GenISA.wavebarrier()
  br i1 %75, label %343, label %349

343:                                              ; preds = %342
  %344 = getelementptr i32, ptr addrspace(1) %2, i64 1
  %345 = sext i32 %0 to i64
  %346 = sub nsw i64 %83, %345, !spirv.Decorations !741
  %347 = add nsw i64 %346, 1, !spirv.Decorations !741
  %348 = icmp eq i16 %simdLaneId16, 0
  br label %358

349:                                              ; preds = %342
  %350 = icmp ult i16 %simdLaneId16, 8
  br i1 %350, label %351, label %476

351:                                              ; preds = %349
  %352 = zext i32 %72 to i64
  %353 = add nuw nsw i64 %110, %352, !spirv.Decorations !743
  %354 = zext i16 %simdLaneId16 to i64
  %355 = or i64 %353, %354
  %356 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %355
  store float 0xFFF0000000000000, ptr addrspace(1) %356, align 4
  %357 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %355
  store float 0.000000e+00, ptr addrspace(1) %357, align 4
  br label %476

358:                                              ; preds = %474, %343
  %359 = phi i32 [ %475, %474 ], [ 0, %343 ]
  %360 = icmp ult i32 %359, 8
  br i1 %360, label %361, label %.loopexit6

361:                                              ; preds = %358
  %362 = or i32 %72, %359
  %363 = zext i32 %359 to i64
  %364 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %363
  %365 = load float, ptr %364, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %34)
  %366 = udiv i32 %362, 6
  %367 = icmp slt i32 %362, %74
  br i1 %367, label %368, label %377

368:                                              ; preds = %361
  br i1 %80, label %374, label %369

369:                                              ; preds = %368
  %370 = zext i32 %366 to i64
  %371 = getelementptr i32, ptr addrspace(1) %344, i64 %370
  %372 = load i32, ptr addrspace(1) %371, align 4
  %373 = sext i32 %372 to i64
  br label %377

374:                                              ; preds = %368
  %375 = zext i32 %366 to i64
  %376 = add nsw i64 %347, %375, !spirv.Decorations !741
  br label %377

377:                                              ; preds = %374, %369, %361
  %378 = phi i64 [ %373, %369 ], [ %376, %374 ], [ 0, %361 ]
  %379 = shl nsw i32 %362, 6, !spirv.Decorations !741
  %380 = sub nsw i64 %378, %85, !spirv.Decorations !741
  br label %381

381:                                              ; preds = %388, %377
  %382 = phi float [ 0xFFF0000000000000, %377 ], [ %410, %388 ]
  %383 = phi i32 [ 0, %377 ], [ %411, %388 ]
  %384 = icmp ult i32 %383, 4
  br i1 %384, label %388, label %385

385:                                              ; preds = %381
  %386 = call float @llvm.genx.GenISA.WaveAll.f32(float %382, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %35)
  %387 = fcmp reassoc nsz arcp contract oeq float %386, 0xFFF0000000000000, !spirv.Decorations !748
  br i1 %387, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %385
  br label %419

.preheader3:                                      ; preds = %385
  br label %412

388:                                              ; preds = %381
  %389 = shl nuw nsw i32 %383, 4, !spirv.Decorations !743
  %390 = add nuw nsw i32 %389, %simdLaneId, !spirv.Decorations !743
  %391 = or i32 %379, %389
  %392 = add nuw nsw i32 %391, %simdLaneId, !spirv.Decorations !743
  %393 = zext i32 %392 to i64
  %394 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM, i64 %393
  %395 = load i32, ptr addrspace(3) %394, align 4
  %396 = sitofp i32 %395 to float
  %397 = fmul reassoc nsz arcp contract float %365, %396, !spirv.Decorations !748
  %398 = zext i32 %383 to i64
  %399 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %398
  %400 = load float, ptr %399, align 4
  %401 = fmul reassoc nsz arcp contract float %397, %400, !spirv.Decorations !748
  %402 = fmul reassoc nsz arcp contract float %401, 6.250000e-02, !spirv.Decorations !748
  %403 = zext i32 %390 to i64
  %404 = icmp slt i32 %390, %89
  %405 = icmp sgt i64 %380, %403
  %406 = and i1 %404, %367
  %407 = select i1 %406, i1 %405, i1 false
  %408 = select i1 %407, float %402, float 0xFFF0000000000000
  %409 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %398
  store float %408, ptr %409, align 4
  %410 = call float @llvm.maxnum.f32(float %382, float %408)
  %411 = add nuw nsw i32 %383, 1, !spirv.Decorations !743
  br label %381

412:                                              ; preds = %415, %.preheader3
  %413 = phi i32 [ %418, %415 ], [ 0, %.preheader3 ]
  %414 = icmp ult i32 %413, 4
  br i1 %414, label %415, label %.loopexit4

415:                                              ; preds = %412
  %416 = zext i32 %413 to i64
  %417 = getelementptr inbounds [4 x float], ptr %35, i64 0, i64 %416
  store float 0.000000e+00, ptr %417, align 4
  %418 = add nuw nsw i32 %413, 1, !spirv.Decorations !743
  br label %412

419:                                              ; preds = %423, %.preheader5
  %420 = phi float [ %441, %423 ], [ 0.000000e+00, %.preheader5 ]
  %421 = phi i32 [ %442, %423 ], [ 0, %.preheader5 ]
  %422 = icmp ult i32 %421, 4
  br i1 %422, label %423, label %443

423:                                              ; preds = %419
  %424 = zext i32 %421 to i64
  %425 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %424
  %426 = load float, ptr %425, align 4
  %427 = fsub reassoc nsz arcp contract float %426, %386, !spirv.Decorations !748
  %428 = fmul float %427, 0x3FF7154760000000
  %429 = call float @llvm.trunc.f32(float %428)
  %430 = call float @llvm.fma.f32(float %429, float 0xBFE62E4000000000, float %427)
  %431 = call float @llvm.fma.f32(float %429, float 0xBEB7F7D1C0000000, float %430)
  %432 = fmul float %431, 0x3FF7154760000000
  %433 = call float @llvm.exp2.f32(float %429)
  %434 = call float @llvm.exp2.f32(float %432)
  %435 = fmul float %433, %434
  %436 = fcmp olt float %427, -1.050000e+02
  %437 = select i1 %436, float 0.000000e+00, float %435
  %438 = fcmp ogt float %427, 1.050000e+02
  %439 = select i1 %438, float 0x7FF0000000000000, float %437
  %440 = getelementptr inbounds [4 x float], ptr %35, i64 0, i64 %424
  store float %439, ptr %440, align 4
  %441 = fadd reassoc nsz arcp contract float %420, %439, !spirv.Decorations !748
  %442 = add nuw nsw i32 %421, 1, !spirv.Decorations !743
  br label %419

443:                                              ; preds = %419
  %444 = call float @llvm.genx.GenISA.WaveAll.f32(float %420, i8 9, i1 true, i32 0)
  %445 = fcmp reassoc nsz arcp contract oeq float %444, 0.000000e+00, !spirv.Decorations !748
  br i1 %445, label %448, label %446

446:                                              ; preds = %443
  %447 = fdiv reassoc nsz arcp contract float 1.000000e+00, %444, !spirv.Decorations !748
  br label %448

.loopexit4:                                       ; preds = %412
  br label %448

448:                                              ; preds = %.loopexit4, %446, %443
  %449 = phi float [ %444, %446 ], [ %444, %443 ], [ 0.000000e+00, %.loopexit4 ]
  %450 = phi float [ %447, %446 ], [ 0.000000e+00, %443 ], [ 0.000000e+00, %.loopexit4 ]
  %451 = shl nsw i32 %362, 6, !spirv.Decorations !741
  br label %452

452:                                              ; preds = %456, %448
  %453 = phi i32 [ 0, %448 ], [ %468, %456 ]
  %454 = icmp ult i32 %453, 4
  br i1 %454, label %456, label %455

455:                                              ; preds = %452
  br i1 %348, label %469, label %474

456:                                              ; preds = %452
  %457 = zext i32 %453 to i64
  %458 = getelementptr inbounds [4 x float], ptr %35, i64 0, i64 %457
  %459 = load float, ptr %458, align 4
  %460 = fmul reassoc nsz arcp contract float %459, %450, !spirv.Decorations !748
  %461 = fptrunc float %460 to half
  %462 = shl nuw nsw i32 %453, 4, !spirv.Decorations !743
  %463 = or i32 %451, %462
  %464 = add nuw nsw i32 %463, %simdLaneId, !spirv.Decorations !743
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM, i64 0, i64 16384
  %467 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %466, i64 %465
  store half %461, ptr addrspace(3) %467, align 2
  %468 = add nuw nsw i32 %453, 1, !spirv.Decorations !743
  br label %452

469:                                              ; preds = %455
  %470 = zext i32 %362 to i64
  %471 = add nuw nsw i64 %110, %470, !spirv.Decorations !743
  %472 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %471
  store float %386, ptr addrspace(1) %472, align 4
  %473 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %471
  store float %449, ptr addrspace(1) %473, align 4
  br label %474

474:                                              ; preds = %469, %455
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %35)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %34)
  %475 = add nuw nsw i32 %359, 1, !spirv.Decorations !743
  br label %358

.loopexit6:                                       ; preds = %358
  br label %476

476:                                              ; preds = %.loopexit6, %351, %349
  call void @llvm.genx.GenISA.wavebarrier()
  %477 = lshr i32 %36, 1
  %478 = and i32 %36, 1
  %479 = shl nuw nsw i32 %477, 7, !spirv.Decorations !741
  %480 = zext i32 %479 to i64
  %481 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM, i64 %480
  %482 = shl nuw nsw i32 %478, 6, !spirv.Decorations !743
  %483 = zext i32 %482 to i64
  %484 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %481, i64 %483
  %485 = icmp slt i32 %477, %89
  %486 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %118
  %487 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %118
  %488 = getelementptr i8, ptr addrspace(1) %17, i64 %115
  %489 = getelementptr i8, ptr addrspace(1) %488, i64 %116
  %490 = and i16 %localIdX, -2
  %491 = zext i16 %490 to i64
  %492 = getelementptr inbounds float, ptr addrspace(1) %487, i64 %491
  %493 = getelementptr inbounds float, ptr addrspace(1) %486, i64 %491
  %494 = shl nuw nsw i32 %478, 5, !spirv.Decorations !743
  %495 = shl nuw nsw i32 %477, 8
  %496 = zext i32 %495 to i64
  %497 = getelementptr inbounds i8, ptr addrspace(1) %489, i64 %496
  %498 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !741
  %499 = zext i32 %498 to i64
  %500 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM, i64 0, i64 16384
  %501 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %500, i64 %499
  %502 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !741
  %503 = zext i32 %502 to i64
  %504 = getelementptr inbounds float, ptr addrspace(1) %122, i64 %503
  br label %505

505:                                              ; preds = %1059, %476
  %.0198132 = phi i16 [ undef, %476 ], [ %.3201316, %1059 ]
  %.0198133 = phi i16 [ undef, %476 ], [ %.3201317, %1059 ]
  %.0198134 = phi i16 [ undef, %476 ], [ %.3201318, %1059 ]
  %.0198135 = phi i16 [ undef, %476 ], [ %.3201319, %1059 ]
  %.0198136 = phi i16 [ undef, %476 ], [ %.3201320, %1059 ]
  %.0198137 = phi i16 [ undef, %476 ], [ %.3201321, %1059 ]
  %.0198138 = phi i16 [ undef, %476 ], [ %.3201322, %1059 ]
  %.0198139 = phi i16 [ undef, %476 ], [ %.3201323, %1059 ]
  %.0194140 = phi i32 [ undef, %476 ], [ %.3197324, %1059 ]
  %.0194141 = phi i32 [ undef, %476 ], [ %.3197325, %1059 ]
  %.0194142 = phi i32 [ undef, %476 ], [ %.3197326, %1059 ]
  %.0194143 = phi i32 [ undef, %476 ], [ %.3197327, %1059 ]
  %.0194144 = phi i32 [ undef, %476 ], [ %.3197328, %1059 ]
  %.0194145 = phi i32 [ undef, %476 ], [ %.3197329, %1059 ]
  %.0194146 = phi i32 [ undef, %476 ], [ %.3197330, %1059 ]
  %.0194147 = phi i32 [ undef, %476 ], [ %.3197331, %1059 ]
  %.0190148 = phi i32 [ undef, %476 ], [ %.3193332, %1059 ]
  %.0190149 = phi i32 [ undef, %476 ], [ %.3193333, %1059 ]
  %.0190150 = phi i32 [ undef, %476 ], [ %.3193334, %1059 ]
  %.0190151 = phi i32 [ undef, %476 ], [ %.3193335, %1059 ]
  %.0190152 = phi i32 [ undef, %476 ], [ %.3193336, %1059 ]
  %.0190153 = phi i32 [ undef, %476 ], [ %.3193337, %1059 ]
  %.0190154 = phi i32 [ undef, %476 ], [ %.3193338, %1059 ]
  %.0190155 = phi i32 [ undef, %476 ], [ %.3193339, %1059 ]
  %.0186156 = phi i32 [ undef, %476 ], [ %.3189340, %1059 ]
  %.0186157 = phi i32 [ undef, %476 ], [ %.3189341, %1059 ]
  %.0186158 = phi i32 [ undef, %476 ], [ %.3189342, %1059 ]
  %.0186159 = phi i32 [ undef, %476 ], [ %.3189343, %1059 ]
  %.0186160 = phi i32 [ undef, %476 ], [ %.3189344, %1059 ]
  %.0186161 = phi i32 [ undef, %476 ], [ %.3189345, %1059 ]
  %.0186162 = phi i32 [ undef, %476 ], [ %.3189346, %1059 ]
  %.0186163 = phi i32 [ undef, %476 ], [ %.3189347, %1059 ]
  %.0164 = phi i32 [ undef, %476 ], [ %.3348, %1059 ]
  %.0165 = phi i32 [ undef, %476 ], [ %.3349, %1059 ]
  %.0166 = phi i32 [ undef, %476 ], [ %.3350, %1059 ]
  %.0167 = phi i32 [ undef, %476 ], [ %.3351, %1059 ]
  %.0168 = phi i32 [ undef, %476 ], [ %.3352, %1059 ]
  %.0169 = phi i32 [ undef, %476 ], [ %.3353, %1059 ]
  %.0170 = phi i32 [ undef, %476 ], [ %.3354, %1059 ]
  %.0171 = phi i32 [ undef, %476 ], [ %.3355, %1059 ]
  %.sroa.0.0172 = phi i32 [ undef, %476 ], [ %.sroa.0.2356, %1059 ]
  %.sroa.0.0173 = phi i32 [ undef, %476 ], [ %.sroa.0.2357, %1059 ]
  %.sroa.0.0174 = phi i32 [ undef, %476 ], [ %.sroa.0.2358, %1059 ]
  %.sroa.0.0175 = phi i32 [ undef, %476 ], [ %.sroa.0.2359, %1059 ]
  %.sroa.0.0176 = phi i32 [ undef, %476 ], [ %.sroa.0.2360, %1059 ]
  %.sroa.0.0177 = phi i32 [ undef, %476 ], [ %.sroa.0.2361, %1059 ]
  %.sroa.0.0178 = phi i32 [ undef, %476 ], [ %.sroa.0.2362, %1059 ]
  %.sroa.0.0179 = phi i32 [ undef, %476 ], [ %.sroa.0.2363, %1059 ]
  %.sroa.0180.0180 = phi i32 [ undef, %476 ], [ %.sroa.0180.2364, %1059 ]
  %.sroa.0180.0181 = phi i32 [ undef, %476 ], [ %.sroa.0180.2365, %1059 ]
  %.sroa.0180.0182 = phi i32 [ undef, %476 ], [ %.sroa.0180.2366, %1059 ]
  %.sroa.0180.0183 = phi i32 [ undef, %476 ], [ %.sroa.0180.2367, %1059 ]
  %.sroa.0180.0184 = phi i32 [ undef, %476 ], [ %.sroa.0180.2368, %1059 ]
  %.sroa.0180.0185 = phi i32 [ undef, %476 ], [ %.sroa.0180.2369, %1059 ]
  %.sroa.0180.0186 = phi i32 [ undef, %476 ], [ %.sroa.0180.2370, %1059 ]
  %.sroa.0180.0187 = phi i32 [ undef, %476 ], [ %.sroa.0180.2371, %1059 ]
  %.sroa.0182.0188 = phi i32 [ undef, %476 ], [ %.sroa.0182.2372, %1059 ]
  %.sroa.0182.0189 = phi i32 [ undef, %476 ], [ %.sroa.0182.2373, %1059 ]
  %.sroa.0182.0190 = phi i32 [ undef, %476 ], [ %.sroa.0182.2374, %1059 ]
  %.sroa.0182.0191 = phi i32 [ undef, %476 ], [ %.sroa.0182.2375, %1059 ]
  %.sroa.0182.0192 = phi i32 [ undef, %476 ], [ %.sroa.0182.2376, %1059 ]
  %.sroa.0182.0193 = phi i32 [ undef, %476 ], [ %.sroa.0182.2377, %1059 ]
  %.sroa.0182.0194 = phi i32 [ undef, %476 ], [ %.sroa.0182.2378, %1059 ]
  %.sroa.0182.0195 = phi i32 [ undef, %476 ], [ %.sroa.0182.2379, %1059 ]
  %.sroa.0184.0196 = phi i32 [ undef, %476 ], [ %.sroa.0184.2380, %1059 ]
  %.sroa.0184.0197 = phi i32 [ undef, %476 ], [ %.sroa.0184.2381, %1059 ]
  %.sroa.0184.0198 = phi i32 [ undef, %476 ], [ %.sroa.0184.2382, %1059 ]
  %.sroa.0184.0199 = phi i32 [ undef, %476 ], [ %.sroa.0184.2383, %1059 ]
  %.sroa.0184.0200 = phi i32 [ undef, %476 ], [ %.sroa.0184.2384, %1059 ]
  %.sroa.0184.0201 = phi i32 [ undef, %476 ], [ %.sroa.0184.2385, %1059 ]
  %.sroa.0184.0202 = phi i32 [ undef, %476 ], [ %.sroa.0184.2386, %1059 ]
  %.sroa.0184.0203 = phi i32 [ undef, %476 ], [ %.sroa.0184.2387, %1059 ]
  %506 = phi i32 [ 0, %476 ], [ %1056, %1059 ]
  %507 = icmp ult i32 %506, 256
  br i1 %507, label %509, label %508

508:                                              ; preds = %505
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %32)
  br label %1060

509:                                              ; preds = %505
  br i1 %485, label %517, label %.preheader

.preheader:                                       ; preds = %509
  br label %510

510:                                              ; preds = %513, %.preheader
  %511 = phi i32 [ %516, %513 ], [ 0, %.preheader ]
  %512 = icmp ult i32 %511, 64
  br i1 %512, label %513, label %.loopexit2

513:                                              ; preds = %510
  %514 = zext i32 %511 to i64
  %515 = getelementptr inbounds half, ptr addrspace(3) %484, i64 %514
  store half 0xH0000, ptr addrspace(3) %515, align 2
  %516 = add nuw nsw i32 %511, 1, !spirv.Decorations !743
  br label %510, !llvm.loop !777

517:                                              ; preds = %509
  %518 = load float, ptr addrspace(1) %492, align 4
  %519 = load float, ptr addrspace(1) %493, align 4
  %520 = lshr exact i32 %506, 1
  %521 = or i32 %520, %494
  %522 = zext i32 %521 to i64
  %523 = getelementptr inbounds i8, ptr addrspace(1) %497, i64 %522
  br label %524

524:                                              ; preds = %534, %517
  %525 = phi i32 [ 0, %517 ], [ %535, %534 ]
  %526 = icmp ult i32 %525, 32
  br i1 %526, label %527, label %.loopexit1

527:                                              ; preds = %524
  %528 = zext i32 %525 to i64
  %529 = getelementptr inbounds i8, ptr addrspace(1) %523, i64 %528
  %530 = load i64, ptr addrspace(1) %529, align 1
  br label %531

531:                                              ; preds = %536, %527
  %532 = phi i32 [ 0, %527 ], [ %557, %536 ]
  %533 = icmp ult i32 %532, 8
  br i1 %533, label %536, label %534

534:                                              ; preds = %531
  %535 = add nuw nsw i32 %525, 8, !spirv.Decorations !743
  br label %524, !llvm.loop !778

536:                                              ; preds = %531
  %537 = shl nuw nsw i32 %532, 3, !spirv.Decorations !743
  %538 = zext i32 %537 to i64
  %539 = lshr i64 %530, %538
  %540 = trunc i64 %539 to i32
  %541 = and i32 %540, 15
  %542 = uitofp i32 %541 to float
  %543 = fsub reassoc nsz arcp contract float %542, %519, !spirv.Decorations !748
  %544 = fmul reassoc nsz arcp contract float %543, %518, !spirv.Decorations !748
  %545 = fptrunc float %544 to half
  %546 = or i32 %525, %532
  %547 = shl nuw nsw i32 %546, 1, !spirv.Decorations !743
  %548 = zext i32 %547 to i64
  %549 = getelementptr half, ptr addrspace(3) %484, i64 %548
  store half %545, ptr addrspace(3) %549, align 4
  %550 = lshr i32 %540, 4
  %551 = and i32 %550, 15
  %552 = uitofp i32 %551 to float
  %553 = fsub reassoc nsz arcp contract float %552, %519, !spirv.Decorations !748
  %554 = fmul reassoc nsz arcp contract float %553, %518, !spirv.Decorations !748
  %555 = fptrunc float %554 to half
  %556 = getelementptr half, ptr addrspace(3) %549, i64 1
  store half %555, ptr addrspace(3) %556, align 2
  %557 = add nuw nsw i32 %532, 1, !spirv.Decorations !743
  br label %531, !llvm.loop !779

.loopexit1:                                       ; preds = %524
  br label %558

.loopexit2:                                       ; preds = %510
  br label %558

558:                                              ; preds = %.loopexit2, %.loopexit1
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %75, label %559, label %1055

559:                                              ; preds = %558
  %560 = zext i32 %506 to i64
  %561 = getelementptr inbounds float, ptr addrspace(1) %504, i64 %560
  br label %562

562:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51, %559
  %.1199204 = phi i16 [ %.0198132, %559 ], [ %.2200276, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199205 = phi i16 [ %.0198133, %559 ], [ %.2200277, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199206 = phi i16 [ %.0198134, %559 ], [ %.2200278, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199207 = phi i16 [ %.0198135, %559 ], [ %.2200279, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199208 = phi i16 [ %.0198136, %559 ], [ %.2200280, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199209 = phi i16 [ %.0198137, %559 ], [ %.2200281, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199210 = phi i16 [ %.0198138, %559 ], [ %.2200282, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199211 = phi i16 [ %.0198139, %559 ], [ %.2200283, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195212 = phi i32 [ %.0194140, %559 ], [ %.2196284, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195213 = phi i32 [ %.0194141, %559 ], [ %.2196285, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195214 = phi i32 [ %.0194142, %559 ], [ %.2196286, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195215 = phi i32 [ %.0194143, %559 ], [ %.2196287, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195216 = phi i32 [ %.0194144, %559 ], [ %.2196288, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195217 = phi i32 [ %.0194145, %559 ], [ %.2196289, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195218 = phi i32 [ %.0194146, %559 ], [ %.2196290, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195219 = phi i32 [ %.0194147, %559 ], [ %.2196291, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191220 = phi i32 [ %.0190148, %559 ], [ %.2192292, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191221 = phi i32 [ %.0190149, %559 ], [ %.2192293, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191222 = phi i32 [ %.0190150, %559 ], [ %.2192294, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191223 = phi i32 [ %.0190151, %559 ], [ %.2192295, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191224 = phi i32 [ %.0190152, %559 ], [ %.2192296, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191225 = phi i32 [ %.0190153, %559 ], [ %.2192297, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191226 = phi i32 [ %.0190154, %559 ], [ %.2192298, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191227 = phi i32 [ %.0190155, %559 ], [ %.2192299, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187228 = phi i32 [ %.0186156, %559 ], [ %.2188300, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187229 = phi i32 [ %.0186157, %559 ], [ %.2188301, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187230 = phi i32 [ %.0186158, %559 ], [ %.2188302, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187231 = phi i32 [ %.0186159, %559 ], [ %.2188303, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187232 = phi i32 [ %.0186160, %559 ], [ %.2188304, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187233 = phi i32 [ %.0186161, %559 ], [ %.2188305, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187234 = phi i32 [ %.0186162, %559 ], [ %.2188306, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187235 = phi i32 [ %.0186163, %559 ], [ %.2188307, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1236 = phi i32 [ %.0164, %559 ], [ %.2308, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1237 = phi i32 [ %.0165, %559 ], [ %.2309, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1238 = phi i32 [ %.0166, %559 ], [ %.2310, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1239 = phi i32 [ %.0167, %559 ], [ %.2311, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1240 = phi i32 [ %.0168, %559 ], [ %.2312, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1241 = phi i32 [ %.0169, %559 ], [ %.2313, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1242 = phi i32 [ %.0170, %559 ], [ %.2314, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1243 = phi i32 [ %.0171, %559 ], [ %.2315, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1244 = phi i32 [ %.sroa.0.0172, %559 ], [ %610, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1245 = phi i32 [ %.sroa.0.0173, %559 ], [ %611, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1246 = phi i32 [ %.sroa.0.0174, %559 ], [ %612, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1247 = phi i32 [ %.sroa.0.0175, %559 ], [ %613, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1248 = phi i32 [ %.sroa.0.0176, %559 ], [ %614, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1249 = phi i32 [ %.sroa.0.0177, %559 ], [ %615, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1250 = phi i32 [ %.sroa.0.0178, %559 ], [ %616, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1251 = phi i32 [ %.sroa.0.0179, %559 ], [ %617, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1252 = phi i32 [ %.sroa.0180.0180, %559 ], [ %649, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1253 = phi i32 [ %.sroa.0180.0181, %559 ], [ %650, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1254 = phi i32 [ %.sroa.0180.0182, %559 ], [ %651, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1255 = phi i32 [ %.sroa.0180.0183, %559 ], [ %652, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1256 = phi i32 [ %.sroa.0180.0184, %559 ], [ %653, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1257 = phi i32 [ %.sroa.0180.0185, %559 ], [ %654, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1258 = phi i32 [ %.sroa.0180.0186, %559 ], [ %655, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1259 = phi i32 [ %.sroa.0180.0187, %559 ], [ %656, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1260 = phi i32 [ %.sroa.0182.0188, %559 ], [ %688, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1261 = phi i32 [ %.sroa.0182.0189, %559 ], [ %689, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1262 = phi i32 [ %.sroa.0182.0190, %559 ], [ %690, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1263 = phi i32 [ %.sroa.0182.0191, %559 ], [ %691, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1264 = phi i32 [ %.sroa.0182.0192, %559 ], [ %692, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1265 = phi i32 [ %.sroa.0182.0193, %559 ], [ %693, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1266 = phi i32 [ %.sroa.0182.0194, %559 ], [ %694, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1267 = phi i32 [ %.sroa.0182.0195, %559 ], [ %695, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1268 = phi i32 [ %.sroa.0184.0196, %559 ], [ %727, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1269 = phi i32 [ %.sroa.0184.0197, %559 ], [ %728, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1270 = phi i32 [ %.sroa.0184.0198, %559 ], [ %729, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1271 = phi i32 [ %.sroa.0184.0199, %559 ], [ %730, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1272 = phi i32 [ %.sroa.0184.0200, %559 ], [ %731, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1273 = phi i32 [ %.sroa.0184.0201, %559 ], [ %732, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1274 = phi i32 [ %.sroa.0184.0202, %559 ], [ %733, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1275 = phi i32 [ %.sroa.0184.0203, %559 ], [ %734, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %563 = phi i32 [ 0, %559 ], [ %765, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %564 = icmp ult i32 %563, 128
  br i1 %564, label %565, label %.loopexit

565:                                              ; preds = %562
  %566 = zext i32 %563 to i64
  %567 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM, i64 %566
  br label %568

568:                                              ; preds = %766, %565
  %.2200276 = phi i16 [ %.1199204, %565 ], [ %769, %766 ]
  %.2200277 = phi i16 [ %.1199205, %565 ], [ %771, %766 ]
  %.2200278 = phi i16 [ %.1199206, %565 ], [ %773, %766 ]
  %.2200279 = phi i16 [ %.1199207, %565 ], [ %775, %766 ]
  %.2200280 = phi i16 [ %.1199208, %565 ], [ %777, %766 ]
  %.2200281 = phi i16 [ %.1199209, %565 ], [ %779, %766 ]
  %.2200282 = phi i16 [ %.1199210, %565 ], [ %781, %766 ]
  %.2200283 = phi i16 [ %.1199211, %565 ], [ %783, %766 ]
  %.2196284 = phi i32 [ %.1195212, %565 ], [ %995, %766 ]
  %.2196285 = phi i32 [ %.1195213, %565 ], [ %1002, %766 ]
  %.2196286 = phi i32 [ %.1195214, %565 ], [ %1009, %766 ]
  %.2196287 = phi i32 [ %.1195215, %565 ], [ %1016, %766 ]
  %.2196288 = phi i32 [ %.1195216, %565 ], [ %1023, %766 ]
  %.2196289 = phi i32 [ %.1195217, %565 ], [ %1030, %766 ]
  %.2196290 = phi i32 [ %.1195218, %565 ], [ %1037, %766 ]
  %.2196291 = phi i32 [ %.1195219, %565 ], [ %1044, %766 ]
  %.2192292 = phi i32 [ %.1191220, %565 ], [ %930, %766 ]
  %.2192293 = phi i32 [ %.1191221, %565 ], [ %937, %766 ]
  %.2192294 = phi i32 [ %.1191222, %565 ], [ %944, %766 ]
  %.2192295 = phi i32 [ %.1191223, %565 ], [ %951, %766 ]
  %.2192296 = phi i32 [ %.1191224, %565 ], [ %958, %766 ]
  %.2192297 = phi i32 [ %.1191225, %565 ], [ %965, %766 ]
  %.2192298 = phi i32 [ %.1191226, %565 ], [ %972, %766 ]
  %.2192299 = phi i32 [ %.1191227, %565 ], [ %979, %766 ]
  %.2188300 = phi i32 [ %.1187228, %565 ], [ %865, %766 ]
  %.2188301 = phi i32 [ %.1187229, %565 ], [ %872, %766 ]
  %.2188302 = phi i32 [ %.1187230, %565 ], [ %879, %766 ]
  %.2188303 = phi i32 [ %.1187231, %565 ], [ %886, %766 ]
  %.2188304 = phi i32 [ %.1187232, %565 ], [ %893, %766 ]
  %.2188305 = phi i32 [ %.1187233, %565 ], [ %900, %766 ]
  %.2188306 = phi i32 [ %.1187234, %565 ], [ %907, %766 ]
  %.2188307 = phi i32 [ %.1187235, %565 ], [ %914, %766 ]
  %.2308 = phi i32 [ %.1236, %565 ], [ %800, %766 ]
  %.2309 = phi i32 [ %.1237, %565 ], [ %807, %766 ]
  %.2310 = phi i32 [ %.1238, %565 ], [ %814, %766 ]
  %.2311 = phi i32 [ %.1239, %565 ], [ %821, %766 ]
  %.2312 = phi i32 [ %.1240, %565 ], [ %828, %766 ]
  %.2313 = phi i32 [ %.1241, %565 ], [ %835, %766 ]
  %.2314 = phi i32 [ %.1242, %565 ], [ %842, %766 ]
  %.2315 = phi i32 [ %.1243, %565 ], [ %849, %766 ]
  %569 = phi <8 x float> [ zeroinitializer, %565 ], [ %1053, %766 ]
  %570 = phi <8 x float> [ zeroinitializer, %565 ], [ %988, %766 ]
  %571 = phi <8 x float> [ zeroinitializer, %565 ], [ %923, %766 ]
  %572 = phi <8 x float> [ zeroinitializer, %565 ], [ %858, %766 ]
  %573 = phi i32 [ 0, %565 ], [ %1054, %766 ]
  %574 = extractelement <8 x float> %569, i32 0
  %575 = extractelement <8 x float> %569, i32 1
  %576 = extractelement <8 x float> %569, i32 2
  %577 = extractelement <8 x float> %569, i32 3
  %578 = extractelement <8 x float> %569, i32 4
  %579 = extractelement <8 x float> %569, i32 5
  %580 = extractelement <8 x float> %569, i32 6
  %581 = extractelement <8 x float> %569, i32 7
  %582 = extractelement <8 x float> %570, i32 0
  %583 = extractelement <8 x float> %570, i32 1
  %584 = extractelement <8 x float> %570, i32 2
  %585 = extractelement <8 x float> %570, i32 3
  %586 = extractelement <8 x float> %570, i32 4
  %587 = extractelement <8 x float> %570, i32 5
  %588 = extractelement <8 x float> %570, i32 6
  %589 = extractelement <8 x float> %570, i32 7
  %590 = extractelement <8 x float> %571, i32 0
  %591 = extractelement <8 x float> %571, i32 1
  %592 = extractelement <8 x float> %571, i32 2
  %593 = extractelement <8 x float> %571, i32 3
  %594 = extractelement <8 x float> %571, i32 4
  %595 = extractelement <8 x float> %571, i32 5
  %596 = extractelement <8 x float> %571, i32 6
  %597 = extractelement <8 x float> %571, i32 7
  %598 = extractelement <8 x float> %572, i32 0
  %599 = extractelement <8 x float> %572, i32 1
  %600 = extractelement <8 x float> %572, i32 2
  %601 = extractelement <8 x float> %572, i32 3
  %602 = extractelement <8 x float> %572, i32 4
  %603 = extractelement <8 x float> %572, i32 5
  %604 = extractelement <8 x float> %572, i32 6
  %605 = extractelement <8 x float> %572, i32 7
  %606 = icmp ult i32 %573, 64
  br i1 %606, label %766, label %607

607:                                              ; preds = %568
  %608 = zext i32 %563 to i64
  %609 = getelementptr inbounds float, ptr addrspace(1) %561, i64 %608
  %610 = bitcast float %598 to i32
  %611 = bitcast float %599 to i32
  %612 = bitcast float %600 to i32
  %613 = bitcast float %601 to i32
  %614 = bitcast float %602 to i32
  %615 = bitcast float %603 to i32
  %616 = bitcast float %604 to i32
  %617 = bitcast float %605 to i32
  %618 = insertelement <8 x i32> undef, i32 %610, i32 0
  %619 = insertelement <8 x i32> %618, i32 %611, i32 1
  %620 = insertelement <8 x i32> %619, i32 %612, i32 2
  %621 = insertelement <8 x i32> %620, i32 %613, i32 3
  %622 = insertelement <8 x i32> %621, i32 %614, i32 4
  %623 = insertelement <8 x i32> %622, i32 %615, i32 5
  %624 = insertelement <8 x i32> %623, i32 %616, i32 6
  %625 = insertelement <8 x i32> %624, i32 %617, i32 7
  %.ascast.i45 = addrspacecast ptr addrspace(1) %609 to ptr addrspace(4)
  %626 = mul i32 %22, %21
  %627 = mul i32 %626, %23
  %628 = and i32 %627, 15
  %629 = icmp eq i32 %628, 0
  br i1 %629, label %642, label %630

630:                                              ; preds = %607
  %localIdZ74 = zext i16 %localIdZ to i32
  %631 = mul i32 %22, %localIdZ74
  %localIdY76 = zext i16 %localIdY to i32
  %632 = add i32 %631, %localIdY76
  %633 = mul i32 %632, %21
  %localIdX78 = zext i16 %localIdX to i32
  %634 = add i32 %633, %localIdX78
  %635 = lshr i32 %634, 4
  %636 = mul i32 %22, %21
  %637 = mul i32 %636, %23
  %638 = add i32 %637, 15
  %639 = lshr i32 %638, 4
  %640 = add nsw i32 %639, -1
  %641 = icmp ult i32 %635, %640
  br i1 %641, label %642, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

642:                                              ; preds = %630, %607
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %630, %642
  %643 = ptrtoint ptr addrspace(4) %.ascast.i45 to i64
  %644 = and i64 %643, -64
  %645 = trunc i64 %643 to i32
  %646 = lshr i32 %645, 2
  %647 = and i32 %646, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %644, i32 1023, i32 7, i32 1023, i32 %647, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %625)
  %648 = getelementptr inbounds float, ptr addrspace(1) %609, i64 16
  %649 = bitcast float %590 to i32
  %650 = bitcast float %591 to i32
  %651 = bitcast float %592 to i32
  %652 = bitcast float %593 to i32
  %653 = bitcast float %594 to i32
  %654 = bitcast float %595 to i32
  %655 = bitcast float %596 to i32
  %656 = bitcast float %597 to i32
  %657 = insertelement <8 x i32> undef, i32 %649, i32 0
  %658 = insertelement <8 x i32> %657, i32 %650, i32 1
  %659 = insertelement <8 x i32> %658, i32 %651, i32 2
  %660 = insertelement <8 x i32> %659, i32 %652, i32 3
  %661 = insertelement <8 x i32> %660, i32 %653, i32 4
  %662 = insertelement <8 x i32> %661, i32 %654, i32 5
  %663 = insertelement <8 x i32> %662, i32 %655, i32 6
  %664 = insertelement <8 x i32> %663, i32 %656, i32 7
  %.ascast.i46 = addrspacecast ptr addrspace(1) %648 to ptr addrspace(4)
  %665 = mul i32 %22, %21
  %666 = mul i32 %665, %23
  %667 = and i32 %666, 15
  %668 = icmp eq i32 %667, 0
  br i1 %668, label %681, label %669

669:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  %localIdZ85 = zext i16 %localIdZ to i32
  %670 = mul i32 %22, %localIdZ85
  %localIdY87 = zext i16 %localIdY to i32
  %671 = add i32 %670, %localIdY87
  %672 = mul i32 %671, %21
  %localIdX89 = zext i16 %localIdX to i32
  %673 = add i32 %672, %localIdX89
  %674 = lshr i32 %673, 4
  %675 = mul i32 %22, %21
  %676 = mul i32 %675, %23
  %677 = add i32 %676, 15
  %678 = lshr i32 %677, 4
  %679 = add nsw i32 %678, -1
  %680 = icmp ult i32 %674, %679
  br i1 %680, label %681, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47

681:                                              ; preds = %669, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47: ; preds = %669, %681
  %682 = ptrtoint ptr addrspace(4) %.ascast.i46 to i64
  %683 = and i64 %682, -64
  %684 = trunc i64 %682 to i32
  %685 = lshr i32 %684, 2
  %686 = and i32 %685, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %683, i32 1023, i32 7, i32 1023, i32 %686, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %664)
  %687 = getelementptr inbounds float, ptr addrspace(1) %609, i64 32
  %688 = bitcast float %582 to i32
  %689 = bitcast float %583 to i32
  %690 = bitcast float %584 to i32
  %691 = bitcast float %585 to i32
  %692 = bitcast float %586 to i32
  %693 = bitcast float %587 to i32
  %694 = bitcast float %588 to i32
  %695 = bitcast float %589 to i32
  %696 = insertelement <8 x i32> undef, i32 %688, i32 0
  %697 = insertelement <8 x i32> %696, i32 %689, i32 1
  %698 = insertelement <8 x i32> %697, i32 %690, i32 2
  %699 = insertelement <8 x i32> %698, i32 %691, i32 3
  %700 = insertelement <8 x i32> %699, i32 %692, i32 4
  %701 = insertelement <8 x i32> %700, i32 %693, i32 5
  %702 = insertelement <8 x i32> %701, i32 %694, i32 6
  %703 = insertelement <8 x i32> %702, i32 %695, i32 7
  %.ascast.i48 = addrspacecast ptr addrspace(1) %687 to ptr addrspace(4)
  %704 = mul i32 %22, %21
  %705 = mul i32 %704, %23
  %706 = and i32 %705, 15
  %707 = icmp eq i32 %706, 0
  br i1 %707, label %720, label %708

708:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47
  %localIdZ96 = zext i16 %localIdZ to i32
  %709 = mul i32 %22, %localIdZ96
  %localIdY98 = zext i16 %localIdY to i32
  %710 = add i32 %709, %localIdY98
  %711 = mul i32 %710, %21
  %localIdX100 = zext i16 %localIdX to i32
  %712 = add i32 %711, %localIdX100
  %713 = lshr i32 %712, 4
  %714 = mul i32 %22, %21
  %715 = mul i32 %714, %23
  %716 = add i32 %715, 15
  %717 = lshr i32 %716, 4
  %718 = add nsw i32 %717, -1
  %719 = icmp ult i32 %713, %718
  br i1 %719, label %720, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49

720:                                              ; preds = %708, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49: ; preds = %708, %720
  %721 = ptrtoint ptr addrspace(4) %.ascast.i48 to i64
  %722 = and i64 %721, -64
  %723 = trunc i64 %721 to i32
  %724 = lshr i32 %723, 2
  %725 = and i32 %724, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %722, i32 1023, i32 7, i32 1023, i32 %725, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %703)
  %726 = getelementptr inbounds float, ptr addrspace(1) %609, i64 48
  %727 = bitcast float %574 to i32
  %728 = bitcast float %575 to i32
  %729 = bitcast float %576 to i32
  %730 = bitcast float %577 to i32
  %731 = bitcast float %578 to i32
  %732 = bitcast float %579 to i32
  %733 = bitcast float %580 to i32
  %734 = bitcast float %581 to i32
  %735 = insertelement <8 x i32> undef, i32 %727, i32 0
  %736 = insertelement <8 x i32> %735, i32 %728, i32 1
  %737 = insertelement <8 x i32> %736, i32 %729, i32 2
  %738 = insertelement <8 x i32> %737, i32 %730, i32 3
  %739 = insertelement <8 x i32> %738, i32 %731, i32 4
  %740 = insertelement <8 x i32> %739, i32 %732, i32 5
  %741 = insertelement <8 x i32> %740, i32 %733, i32 6
  %742 = insertelement <8 x i32> %741, i32 %734, i32 7
  %.ascast.i50 = addrspacecast ptr addrspace(1) %726 to ptr addrspace(4)
  %743 = mul i32 %22, %21
  %744 = mul i32 %743, %23
  %745 = and i32 %744, 15
  %746 = icmp eq i32 %745, 0
  br i1 %746, label %759, label %747

747:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49
  %localIdZ107 = zext i16 %localIdZ to i32
  %748 = mul i32 %22, %localIdZ107
  %localIdY109 = zext i16 %localIdY to i32
  %749 = add i32 %748, %localIdY109
  %750 = mul i32 %749, %21
  %localIdX111 = zext i16 %localIdX to i32
  %751 = add i32 %750, %localIdX111
  %752 = lshr i32 %751, 4
  %753 = mul i32 %22, %21
  %754 = mul i32 %753, %23
  %755 = add i32 %754, 15
  %756 = lshr i32 %755, 4
  %757 = add nsw i32 %756, -1
  %758 = icmp ult i32 %752, %757
  br i1 %758, label %759, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51

759:                                              ; preds = %747, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51: ; preds = %747, %759
  %760 = ptrtoint ptr addrspace(4) %.ascast.i50 to i64
  %761 = and i64 %760, -64
  %762 = trunc i64 %760 to i32
  %763 = lshr i32 %762, 2
  %764 = and i32 %763, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %761, i32 1023, i32 7, i32 1023, i32 %764, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %742)
  %765 = add nuw nsw i32 %563, 64, !spirv.Decorations !743
  br label %562

766:                                              ; preds = %568
  %767 = zext i32 %573 to i64
  %768 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %501, i64 %767
  %769 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %768)
  %770 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 64
  %771 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %770)
  %772 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 128
  %773 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %772)
  %774 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 192
  %775 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %774)
  %776 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 256
  %777 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %776)
  %778 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 320
  %779 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %778)
  %780 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 384
  %781 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %780)
  %782 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 448
  %783 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %782)
  %784 = insertelement <8 x i16> undef, i16 %769, i32 0
  %785 = insertelement <8 x i16> %784, i16 %771, i32 1
  %786 = insertelement <8 x i16> %785, i16 %773, i32 2
  %787 = insertelement <8 x i16> %786, i16 %775, i32 3
  %788 = insertelement <8 x i16> %787, i16 %777, i32 4
  %789 = insertelement <8 x i16> %788, i16 %779, i32 5
  %790 = insertelement <8 x i16> %789, i16 %781, i32 6
  %791 = insertelement <8 x i16> %790, i16 %783, i32 7
  %792 = shl nuw nsw i32 %573, 7, !spirv.Decorations !743
  %793 = zext i32 %792 to i64
  %794 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %567, i64 %793
  %795 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %794)
  %796 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 64
  %797 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %796)
  %798 = insertelement <2 x i16> undef, i16 %795, i32 0
  %799 = insertelement <2 x i16> %798, i16 %797, i32 1
  %800 = bitcast <2 x i16> %799 to i32
  %801 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 128
  %802 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %801)
  %803 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 192
  %804 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %803)
  %805 = insertelement <2 x i16> undef, i16 %802, i32 0
  %806 = insertelement <2 x i16> %805, i16 %804, i32 1
  %807 = bitcast <2 x i16> %806 to i32
  %808 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 256
  %809 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %808)
  %810 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 320
  %811 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %810)
  %812 = insertelement <2 x i16> undef, i16 %809, i32 0
  %813 = insertelement <2 x i16> %812, i16 %811, i32 1
  %814 = bitcast <2 x i16> %813 to i32
  %815 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 384
  %816 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %815)
  %817 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 448
  %818 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %817)
  %819 = insertelement <2 x i16> undef, i16 %816, i32 0
  %820 = insertelement <2 x i16> %819, i16 %818, i32 1
  %821 = bitcast <2 x i16> %820 to i32
  %822 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 512
  %823 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %822)
  %824 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 576
  %825 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %824)
  %826 = insertelement <2 x i16> undef, i16 %823, i32 0
  %827 = insertelement <2 x i16> %826, i16 %825, i32 1
  %828 = bitcast <2 x i16> %827 to i32
  %829 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 640
  %830 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %829)
  %831 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 704
  %832 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %831)
  %833 = insertelement <2 x i16> undef, i16 %830, i32 0
  %834 = insertelement <2 x i16> %833, i16 %832, i32 1
  %835 = bitcast <2 x i16> %834 to i32
  %836 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 768
  %837 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %836)
  %838 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 832
  %839 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %838)
  %840 = insertelement <2 x i16> undef, i16 %837, i32 0
  %841 = insertelement <2 x i16> %840, i16 %839, i32 1
  %842 = bitcast <2 x i16> %841 to i32
  %843 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 896
  %844 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %843)
  %845 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 960
  %846 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %845)
  %847 = insertelement <2 x i16> undef, i16 %844, i32 0
  %848 = insertelement <2 x i16> %847, i16 %846, i32 1
  %849 = bitcast <2 x i16> %848 to i32
  %850 = insertelement <8 x i32> undef, i32 %800, i32 0
  %851 = insertelement <8 x i32> %850, i32 %807, i32 1
  %852 = insertelement <8 x i32> %851, i32 %814, i32 2
  %853 = insertelement <8 x i32> %852, i32 %821, i32 3
  %854 = insertelement <8 x i32> %853, i32 %828, i32 4
  %855 = insertelement <8 x i32> %854, i32 %835, i32 5
  %856 = insertelement <8 x i32> %855, i32 %842, i32 6
  %857 = insertelement <8 x i32> %856, i32 %849, i32 7
  %858 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %572, <8 x i16> %791, <8 x i32> %857, i32 12, i32 12, i32 8, i32 8, i1 false)
  %859 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 16
  %860 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %859)
  %861 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 144
  %862 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %861)
  %863 = insertelement <2 x i16> undef, i16 %860, i32 0
  %864 = insertelement <2 x i16> %863, i16 %862, i32 1
  %865 = bitcast <2 x i16> %864 to i32
  %866 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 272
  %867 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %866)
  %868 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 400
  %869 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %868)
  %870 = insertelement <2 x i16> undef, i16 %867, i32 0
  %871 = insertelement <2 x i16> %870, i16 %869, i32 1
  %872 = bitcast <2 x i16> %871 to i32
  %873 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 528
  %874 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %873)
  %875 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 656
  %876 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %875)
  %877 = insertelement <2 x i16> undef, i16 %874, i32 0
  %878 = insertelement <2 x i16> %877, i16 %876, i32 1
  %879 = bitcast <2 x i16> %878 to i32
  %880 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 784
  %881 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %880)
  %882 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 912
  %883 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %882)
  %884 = insertelement <2 x i16> undef, i16 %881, i32 0
  %885 = insertelement <2 x i16> %884, i16 %883, i32 1
  %886 = bitcast <2 x i16> %885 to i32
  %887 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1040
  %888 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %887)
  %889 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1168
  %890 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %889)
  %891 = insertelement <2 x i16> undef, i16 %888, i32 0
  %892 = insertelement <2 x i16> %891, i16 %890, i32 1
  %893 = bitcast <2 x i16> %892 to i32
  %894 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1296
  %895 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %894)
  %896 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1424
  %897 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %896)
  %898 = insertelement <2 x i16> undef, i16 %895, i32 0
  %899 = insertelement <2 x i16> %898, i16 %897, i32 1
  %900 = bitcast <2 x i16> %899 to i32
  %901 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1552
  %902 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %901)
  %903 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1680
  %904 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %903)
  %905 = insertelement <2 x i16> undef, i16 %902, i32 0
  %906 = insertelement <2 x i16> %905, i16 %904, i32 1
  %907 = bitcast <2 x i16> %906 to i32
  %908 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1808
  %909 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %908)
  %910 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1936
  %911 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %910)
  %912 = insertelement <2 x i16> undef, i16 %909, i32 0
  %913 = insertelement <2 x i16> %912, i16 %911, i32 1
  %914 = bitcast <2 x i16> %913 to i32
  %915 = insertelement <8 x i32> undef, i32 %865, i32 0
  %916 = insertelement <8 x i32> %915, i32 %872, i32 1
  %917 = insertelement <8 x i32> %916, i32 %879, i32 2
  %918 = insertelement <8 x i32> %917, i32 %886, i32 3
  %919 = insertelement <8 x i32> %918, i32 %893, i32 4
  %920 = insertelement <8 x i32> %919, i32 %900, i32 5
  %921 = insertelement <8 x i32> %920, i32 %907, i32 6
  %922 = insertelement <8 x i32> %921, i32 %914, i32 7
  %923 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %571, <8 x i16> %791, <8 x i32> %922, i32 12, i32 12, i32 8, i32 8, i1 false)
  %924 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 32
  %925 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %924)
  %926 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 160
  %927 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %926)
  %928 = insertelement <2 x i16> undef, i16 %925, i32 0
  %929 = insertelement <2 x i16> %928, i16 %927, i32 1
  %930 = bitcast <2 x i16> %929 to i32
  %931 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 288
  %932 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %931)
  %933 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 416
  %934 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %933)
  %935 = insertelement <2 x i16> undef, i16 %932, i32 0
  %936 = insertelement <2 x i16> %935, i16 %934, i32 1
  %937 = bitcast <2 x i16> %936 to i32
  %938 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 544
  %939 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %938)
  %940 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 672
  %941 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %940)
  %942 = insertelement <2 x i16> undef, i16 %939, i32 0
  %943 = insertelement <2 x i16> %942, i16 %941, i32 1
  %944 = bitcast <2 x i16> %943 to i32
  %945 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 800
  %946 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %945)
  %947 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 928
  %948 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %947)
  %949 = insertelement <2 x i16> undef, i16 %946, i32 0
  %950 = insertelement <2 x i16> %949, i16 %948, i32 1
  %951 = bitcast <2 x i16> %950 to i32
  %952 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1056
  %953 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %952)
  %954 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1184
  %955 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %954)
  %956 = insertelement <2 x i16> undef, i16 %953, i32 0
  %957 = insertelement <2 x i16> %956, i16 %955, i32 1
  %958 = bitcast <2 x i16> %957 to i32
  %959 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1312
  %960 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %959)
  %961 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1440
  %962 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %961)
  %963 = insertelement <2 x i16> undef, i16 %960, i32 0
  %964 = insertelement <2 x i16> %963, i16 %962, i32 1
  %965 = bitcast <2 x i16> %964 to i32
  %966 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1568
  %967 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %966)
  %968 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1696
  %969 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %968)
  %970 = insertelement <2 x i16> undef, i16 %967, i32 0
  %971 = insertelement <2 x i16> %970, i16 %969, i32 1
  %972 = bitcast <2 x i16> %971 to i32
  %973 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1824
  %974 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %973)
  %975 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1952
  %976 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %975)
  %977 = insertelement <2 x i16> undef, i16 %974, i32 0
  %978 = insertelement <2 x i16> %977, i16 %976, i32 1
  %979 = bitcast <2 x i16> %978 to i32
  %980 = insertelement <8 x i32> undef, i32 %930, i32 0
  %981 = insertelement <8 x i32> %980, i32 %937, i32 1
  %982 = insertelement <8 x i32> %981, i32 %944, i32 2
  %983 = insertelement <8 x i32> %982, i32 %951, i32 3
  %984 = insertelement <8 x i32> %983, i32 %958, i32 4
  %985 = insertelement <8 x i32> %984, i32 %965, i32 5
  %986 = insertelement <8 x i32> %985, i32 %972, i32 6
  %987 = insertelement <8 x i32> %986, i32 %979, i32 7
  %988 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %570, <8 x i16> %791, <8 x i32> %987, i32 12, i32 12, i32 8, i32 8, i1 false)
  %989 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 48
  %990 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %989)
  %991 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 176
  %992 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %991)
  %993 = insertelement <2 x i16> undef, i16 %990, i32 0
  %994 = insertelement <2 x i16> %993, i16 %992, i32 1
  %995 = bitcast <2 x i16> %994 to i32
  %996 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 304
  %997 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %996)
  %998 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 432
  %999 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %998)
  %1000 = insertelement <2 x i16> undef, i16 %997, i32 0
  %1001 = insertelement <2 x i16> %1000, i16 %999, i32 1
  %1002 = bitcast <2 x i16> %1001 to i32
  %1003 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 560
  %1004 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1003)
  %1005 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 688
  %1006 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1005)
  %1007 = insertelement <2 x i16> undef, i16 %1004, i32 0
  %1008 = insertelement <2 x i16> %1007, i16 %1006, i32 1
  %1009 = bitcast <2 x i16> %1008 to i32
  %1010 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 816
  %1011 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1010)
  %1012 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 944
  %1013 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1012)
  %1014 = insertelement <2 x i16> undef, i16 %1011, i32 0
  %1015 = insertelement <2 x i16> %1014, i16 %1013, i32 1
  %1016 = bitcast <2 x i16> %1015 to i32
  %1017 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1072
  %1018 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1017)
  %1019 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1200
  %1020 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1019)
  %1021 = insertelement <2 x i16> undef, i16 %1018, i32 0
  %1022 = insertelement <2 x i16> %1021, i16 %1020, i32 1
  %1023 = bitcast <2 x i16> %1022 to i32
  %1024 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1328
  %1025 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1024)
  %1026 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1456
  %1027 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1026)
  %1028 = insertelement <2 x i16> undef, i16 %1025, i32 0
  %1029 = insertelement <2 x i16> %1028, i16 %1027, i32 1
  %1030 = bitcast <2 x i16> %1029 to i32
  %1031 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1584
  %1032 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1031)
  %1033 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1712
  %1034 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1033)
  %1035 = insertelement <2 x i16> undef, i16 %1032, i32 0
  %1036 = insertelement <2 x i16> %1035, i16 %1034, i32 1
  %1037 = bitcast <2 x i16> %1036 to i32
  %1038 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1840
  %1039 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1038)
  %1040 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1968
  %1041 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1040)
  %1042 = insertelement <2 x i16> undef, i16 %1039, i32 0
  %1043 = insertelement <2 x i16> %1042, i16 %1041, i32 1
  %1044 = bitcast <2 x i16> %1043 to i32
  %1045 = insertelement <8 x i32> undef, i32 %995, i32 0
  %1046 = insertelement <8 x i32> %1045, i32 %1002, i32 1
  %1047 = insertelement <8 x i32> %1046, i32 %1009, i32 2
  %1048 = insertelement <8 x i32> %1047, i32 %1016, i32 3
  %1049 = insertelement <8 x i32> %1048, i32 %1023, i32 4
  %1050 = insertelement <8 x i32> %1049, i32 %1030, i32 5
  %1051 = insertelement <8 x i32> %1050, i32 %1037, i32 6
  %1052 = insertelement <8 x i32> %1051, i32 %1044, i32 7
  %1053 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %569, <8 x i16> %791, <8 x i32> %1052, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1054 = add nuw nsw i32 %573, 16, !spirv.Decorations !743
  br label %568

.loopexit:                                        ; preds = %562
  br label %1055

1055:                                             ; preds = %.loopexit, %558
  %.3201316 = phi i16 [ %.1199204, %.loopexit ], [ %.0198132, %558 ]
  %.3201317 = phi i16 [ %.1199205, %.loopexit ], [ %.0198133, %558 ]
  %.3201318 = phi i16 [ %.1199206, %.loopexit ], [ %.0198134, %558 ]
  %.3201319 = phi i16 [ %.1199207, %.loopexit ], [ %.0198135, %558 ]
  %.3201320 = phi i16 [ %.1199208, %.loopexit ], [ %.0198136, %558 ]
  %.3201321 = phi i16 [ %.1199209, %.loopexit ], [ %.0198137, %558 ]
  %.3201322 = phi i16 [ %.1199210, %.loopexit ], [ %.0198138, %558 ]
  %.3201323 = phi i16 [ %.1199211, %.loopexit ], [ %.0198139, %558 ]
  %.3197324 = phi i32 [ %.1195212, %.loopexit ], [ %.0194140, %558 ]
  %.3197325 = phi i32 [ %.1195213, %.loopexit ], [ %.0194141, %558 ]
  %.3197326 = phi i32 [ %.1195214, %.loopexit ], [ %.0194142, %558 ]
  %.3197327 = phi i32 [ %.1195215, %.loopexit ], [ %.0194143, %558 ]
  %.3197328 = phi i32 [ %.1195216, %.loopexit ], [ %.0194144, %558 ]
  %.3197329 = phi i32 [ %.1195217, %.loopexit ], [ %.0194145, %558 ]
  %.3197330 = phi i32 [ %.1195218, %.loopexit ], [ %.0194146, %558 ]
  %.3197331 = phi i32 [ %.1195219, %.loopexit ], [ %.0194147, %558 ]
  %.3193332 = phi i32 [ %.1191220, %.loopexit ], [ %.0190148, %558 ]
  %.3193333 = phi i32 [ %.1191221, %.loopexit ], [ %.0190149, %558 ]
  %.3193334 = phi i32 [ %.1191222, %.loopexit ], [ %.0190150, %558 ]
  %.3193335 = phi i32 [ %.1191223, %.loopexit ], [ %.0190151, %558 ]
  %.3193336 = phi i32 [ %.1191224, %.loopexit ], [ %.0190152, %558 ]
  %.3193337 = phi i32 [ %.1191225, %.loopexit ], [ %.0190153, %558 ]
  %.3193338 = phi i32 [ %.1191226, %.loopexit ], [ %.0190154, %558 ]
  %.3193339 = phi i32 [ %.1191227, %.loopexit ], [ %.0190155, %558 ]
  %.3189340 = phi i32 [ %.1187228, %.loopexit ], [ %.0186156, %558 ]
  %.3189341 = phi i32 [ %.1187229, %.loopexit ], [ %.0186157, %558 ]
  %.3189342 = phi i32 [ %.1187230, %.loopexit ], [ %.0186158, %558 ]
  %.3189343 = phi i32 [ %.1187231, %.loopexit ], [ %.0186159, %558 ]
  %.3189344 = phi i32 [ %.1187232, %.loopexit ], [ %.0186160, %558 ]
  %.3189345 = phi i32 [ %.1187233, %.loopexit ], [ %.0186161, %558 ]
  %.3189346 = phi i32 [ %.1187234, %.loopexit ], [ %.0186162, %558 ]
  %.3189347 = phi i32 [ %.1187235, %.loopexit ], [ %.0186163, %558 ]
  %.3348 = phi i32 [ %.1236, %.loopexit ], [ %.0164, %558 ]
  %.3349 = phi i32 [ %.1237, %.loopexit ], [ %.0165, %558 ]
  %.3350 = phi i32 [ %.1238, %.loopexit ], [ %.0166, %558 ]
  %.3351 = phi i32 [ %.1239, %.loopexit ], [ %.0167, %558 ]
  %.3352 = phi i32 [ %.1240, %.loopexit ], [ %.0168, %558 ]
  %.3353 = phi i32 [ %.1241, %.loopexit ], [ %.0169, %558 ]
  %.3354 = phi i32 [ %.1242, %.loopexit ], [ %.0170, %558 ]
  %.3355 = phi i32 [ %.1243, %.loopexit ], [ %.0171, %558 ]
  %.sroa.0.2356 = phi i32 [ %.sroa.0.1244, %.loopexit ], [ %.sroa.0.0172, %558 ]
  %.sroa.0.2357 = phi i32 [ %.sroa.0.1245, %.loopexit ], [ %.sroa.0.0173, %558 ]
  %.sroa.0.2358 = phi i32 [ %.sroa.0.1246, %.loopexit ], [ %.sroa.0.0174, %558 ]
  %.sroa.0.2359 = phi i32 [ %.sroa.0.1247, %.loopexit ], [ %.sroa.0.0175, %558 ]
  %.sroa.0.2360 = phi i32 [ %.sroa.0.1248, %.loopexit ], [ %.sroa.0.0176, %558 ]
  %.sroa.0.2361 = phi i32 [ %.sroa.0.1249, %.loopexit ], [ %.sroa.0.0177, %558 ]
  %.sroa.0.2362 = phi i32 [ %.sroa.0.1250, %.loopexit ], [ %.sroa.0.0178, %558 ]
  %.sroa.0.2363 = phi i32 [ %.sroa.0.1251, %.loopexit ], [ %.sroa.0.0179, %558 ]
  %.sroa.0180.2364 = phi i32 [ %.sroa.0180.1252, %.loopexit ], [ %.sroa.0180.0180, %558 ]
  %.sroa.0180.2365 = phi i32 [ %.sroa.0180.1253, %.loopexit ], [ %.sroa.0180.0181, %558 ]
  %.sroa.0180.2366 = phi i32 [ %.sroa.0180.1254, %.loopexit ], [ %.sroa.0180.0182, %558 ]
  %.sroa.0180.2367 = phi i32 [ %.sroa.0180.1255, %.loopexit ], [ %.sroa.0180.0183, %558 ]
  %.sroa.0180.2368 = phi i32 [ %.sroa.0180.1256, %.loopexit ], [ %.sroa.0180.0184, %558 ]
  %.sroa.0180.2369 = phi i32 [ %.sroa.0180.1257, %.loopexit ], [ %.sroa.0180.0185, %558 ]
  %.sroa.0180.2370 = phi i32 [ %.sroa.0180.1258, %.loopexit ], [ %.sroa.0180.0186, %558 ]
  %.sroa.0180.2371 = phi i32 [ %.sroa.0180.1259, %.loopexit ], [ %.sroa.0180.0187, %558 ]
  %.sroa.0182.2372 = phi i32 [ %.sroa.0182.1260, %.loopexit ], [ %.sroa.0182.0188, %558 ]
  %.sroa.0182.2373 = phi i32 [ %.sroa.0182.1261, %.loopexit ], [ %.sroa.0182.0189, %558 ]
  %.sroa.0182.2374 = phi i32 [ %.sroa.0182.1262, %.loopexit ], [ %.sroa.0182.0190, %558 ]
  %.sroa.0182.2375 = phi i32 [ %.sroa.0182.1263, %.loopexit ], [ %.sroa.0182.0191, %558 ]
  %.sroa.0182.2376 = phi i32 [ %.sroa.0182.1264, %.loopexit ], [ %.sroa.0182.0192, %558 ]
  %.sroa.0182.2377 = phi i32 [ %.sroa.0182.1265, %.loopexit ], [ %.sroa.0182.0193, %558 ]
  %.sroa.0182.2378 = phi i32 [ %.sroa.0182.1266, %.loopexit ], [ %.sroa.0182.0194, %558 ]
  %.sroa.0182.2379 = phi i32 [ %.sroa.0182.1267, %.loopexit ], [ %.sroa.0182.0195, %558 ]
  %.sroa.0184.2380 = phi i32 [ %.sroa.0184.1268, %.loopexit ], [ %.sroa.0184.0196, %558 ]
  %.sroa.0184.2381 = phi i32 [ %.sroa.0184.1269, %.loopexit ], [ %.sroa.0184.0197, %558 ]
  %.sroa.0184.2382 = phi i32 [ %.sroa.0184.1270, %.loopexit ], [ %.sroa.0184.0198, %558 ]
  %.sroa.0184.2383 = phi i32 [ %.sroa.0184.1271, %.loopexit ], [ %.sroa.0184.0199, %558 ]
  %.sroa.0184.2384 = phi i32 [ %.sroa.0184.1272, %.loopexit ], [ %.sroa.0184.0200, %558 ]
  %.sroa.0184.2385 = phi i32 [ %.sroa.0184.1273, %.loopexit ], [ %.sroa.0184.0201, %558 ]
  %.sroa.0184.2386 = phi i32 [ %.sroa.0184.1274, %.loopexit ], [ %.sroa.0184.0202, %558 ]
  %.sroa.0184.2387 = phi i32 [ %.sroa.0184.1275, %.loopexit ], [ %.sroa.0184.0203, %558 ]
  %1056 = add nuw nsw i32 %506, 128, !spirv.Decorations !743
  %1057 = icmp eq i32 %506, 0
  br i1 %1057, label %1058, label %1059

1058:                                             ; preds = %1055
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %1059

1059:                                             ; preds = %1058, %1055
  br label %505

1060:                                             ; preds = %508, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE(i32 %0, ptr addrspace(1) align 4 %1, ptr addrspace(1) align 4 %2, i32 %3, ptr addrspace(1) align 4 %4, ptr addrspace(3) align 4 %5, i64 %6, i64 %7, i64 %8, ptr addrspace(1) align 1 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 4 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, i32 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
  %21 = extractelement <3 x i32> %localSize, i32 0
  %22 = extractelement <3 x i32> %localSize, i32 1
  %23 = extractelement <3 x i32> %localSize, i32 2
  %24 = extractelement <8 x i32> %r0, i32 0
  %25 = extractelement <8 x i32> %r0, i32 1
  %26 = extractelement <8 x i32> %r0, i32 2
  %27 = extractelement <8 x i32> %r0, i32 3
  %28 = extractelement <8 x i32> %r0, i32 4
  %29 = extractelement <8 x i32> %r0, i32 5
  %30 = extractelement <8 x i32> %r0, i32 6
  %31 = extractelement <8 x i32> %r0, i32 7
  %32 = alloca [4 x float], align 4, !spirv.Decorations !739
  %33 = alloca [4 x float], align 4, !spirv.Decorations !739
  %34 = alloca [4 x float], align 4, !spirv.Decorations !739
  %35 = zext i16 %localIdX to i32
  %36 = zext i32 %25 to i64
  %37 = icmp sgt i32 %25, -1
  call void @llvm.assume(i1 %37)
  %38 = bitcast <8 x i32> %r0 to <32 x i8>
  %39 = extractelement <32 x i8> %38, i32 0
  %40 = extractelement <32 x i8> %38, i32 1
  %41 = extractelement <32 x i8> %38, i32 2
  %42 = extractelement <32 x i8> %38, i32 3
  %43 = extractelement <32 x i8> %38, i32 4
  %44 = extractelement <32 x i8> %38, i32 5
  %45 = extractelement <32 x i8> %38, i32 6
  %46 = extractelement <32 x i8> %38, i32 7
  %47 = extractelement <32 x i8> %38, i32 8
  %48 = extractelement <32 x i8> %38, i32 9
  %49 = extractelement <32 x i8> %38, i32 10
  %50 = extractelement <32 x i8> %38, i32 11
  %51 = extractelement <32 x i8> %38, i32 12
  %52 = extractelement <32 x i8> %38, i32 13
  %53 = extractelement <32 x i8> %38, i32 14
  %54 = extractelement <32 x i8> %38, i32 15
  %55 = extractelement <32 x i8> %38, i32 16
  %56 = extractelement <32 x i8> %38, i32 17
  %57 = extractelement <32 x i8> %38, i32 18
  %58 = extractelement <32 x i8> %38, i32 19
  %59 = extractelement <32 x i8> %38, i32 20
  %60 = extractelement <32 x i8> %38, i32 21
  %61 = extractelement <32 x i8> %38, i32 22
  %62 = extractelement <32 x i8> %38, i32 23
  %63 = extractelement <32 x i8> %38, i32 24
  %64 = extractelement <32 x i8> %38, i32 25
  %65 = extractelement <32 x i8> %38, i32 26
  %66 = extractelement <32 x i8> %38, i32 27
  %67 = extractelement <32 x i8> %38, i32 28
  %68 = extractelement <32 x i8> %38, i32 29
  %69 = extractelement <32 x i8> %38, i32 30
  %70 = extractelement <32 x i8> %38, i32 31
  %localThreadId26 = zext i8 %47 to i32
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %71 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %71)
  %72 = sdiv i32 %25, %0
  %freeze = freeze i32 %72
  %73 = mul nsw i32 %freeze, %0, !spirv.Decorations !741
  %74 = sub nsw i32 %25, %73, !spirv.Decorations !741
  %75 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %76 = icmp eq ptr addrspace(1) %1, %75
  %77 = select i1 %76, ptr addrspace(1) %2, ptr addrspace(1) %1
  %78 = load i32, ptr addrspace(1) %77, align 4
  %79 = sext i32 %78 to i64
  %80 = sext i32 %74 to i64
  %81 = shl nsw i64 %80, 6, !spirv.Decorations !741
  %82 = sub nsw i64 %79, %81, !spirv.Decorations !741
  %83 = call i64 @llvm.smin.i64(i64 %82, i64 64)
  %84 = call i64 @llvm.smax.i64(i64 %83, i64 0)
  %85 = trunc i64 %84 to i32
  %86 = icmp slt i32 %85, 1
  br i1 %86, label %548, label %87

87:                                               ; preds = %20
  %88 = icmp slt i32 %3, 2
  br i1 %88, label %89, label %92

89:                                               ; preds = %87
  %90 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %80
  %91 = load i32, ptr addrspace(1) %90, align 4
  br label %101

92:                                               ; preds = %87
  %93 = sdiv i32 %74, %3
  %freeze53 = freeze i32 %93
  %94 = sext i32 %freeze53 to i64
  %95 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %94
  %96 = load i32, ptr addrspace(1) %95, align 4
  %97 = mul nsw i32 %96, %3, !spirv.Decorations !741
  %98 = mul i32 %freeze53, %3
  %99 = sub i32 %74, %98
  %100 = add nsw i32 %97, %99, !spirv.Decorations !741
  br label %101

101:                                              ; preds = %92, %89
  %102 = phi i32 [ %91, %89 ], [ %100, %92 ]
  %103 = sext i32 %freeze to i64
  %104 = shl nsw i64 %103, 6, !spirv.Decorations !741
  %105 = shl nsw i64 %103, 14, !spirv.Decorations !741
  %106 = shl nuw nsw i64 %36, 6, !spirv.Decorations !743
  %107 = shl nuw nsw i64 %36, 14, !spirv.Decorations !743
  %108 = sext i32 %102 to i64
  %109 = mul i64 %108, %6
  %110 = shl nsw i64 %103, 8, !spirv.Decorations !741
  %111 = mul i64 %108, %7
  %112 = shl nsw i64 %103, 7, !spirv.Decorations !741
  %113 = mul i64 %108, %8
  %114 = add i64 %113, %103
  %115 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %105
  %116 = getelementptr i8, ptr addrspace(1) %10, i64 %109
  %117 = getelementptr i8, ptr addrspace(1) %116, i64 %110
  %118 = getelementptr inbounds float, ptr addrspace(1) %11, i64 %107
  %119 = icmp ult i8 %47, 4
  br i1 %119, label %120, label %182

120:                                              ; preds = %101
  %121 = shl nuw nsw i32 %localThreadId26, 14, !spirv.Decorations !743
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i8, ptr addrspace(1) %117, i64 %122
  br label %124

124:                                              ; preds = %164, %120
  %125 = phi <8 x i32> [ zeroinitializer, %120 ], [ %180, %164 ]
  %126 = phi i32 [ 0, %120 ], [ %181, %164 ]
  %127 = extractelement <8 x i32> %125, i32 0
  %128 = extractelement <8 x i32> %125, i32 1
  %129 = extractelement <8 x i32> %125, i32 2
  %130 = extractelement <8 x i32> %125, i32 3
  %131 = extractelement <8 x i32> %125, i32 4
  %132 = extractelement <8 x i32> %125, i32 5
  %133 = extractelement <8 x i32> %125, i32 6
  %134 = extractelement <8 x i32> %125, i32 7
  %135 = icmp ult i32 %126, 256
  br i1 %135, label %164, label %136

136:                                              ; preds = %124
  %137 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !743
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM, i64 %138
  %140 = mul i32 %22, %21
  %141 = mul i32 %140, %23
  %142 = and i32 %141, 15
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %156, label %144

144:                                              ; preds = %136
  %localIdZ30 = zext i16 %localIdZ to i32
  %145 = mul i32 %22, %localIdZ30
  %localIdY32 = zext i16 %localIdY to i32
  %146 = add i32 %145, %localIdY32
  %147 = mul i32 %146, %21
  %localIdX34 = zext i16 %localIdX to i32
  %148 = add i32 %147, %localIdX34
  %149 = lshr i32 %148, 4
  %150 = mul i32 %22, %21
  %151 = mul i32 %150, %23
  %152 = add i32 %151, 15
  %153 = lshr i32 %152, 4
  %154 = add nsw i32 %153, -1
  %155 = icmp ult i32 %149, %154
  br i1 %155, label %156, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

156:                                              ; preds = %144, %136
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %144, %156
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %139, i32 %127)
  %157 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 64
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %157, i32 %128)
  %158 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 128
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %158, i32 %129)
  %159 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %159, i32 %130)
  %160 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 256
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %160, i32 %131)
  %161 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 320
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %161, i32 %132)
  %162 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 384
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %162, i32 %133)
  %163 = getelementptr inbounds i32, ptr addrspace(3) %139, i64 448
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %163, i32 %134)
  br label %182

164:                                              ; preds = %124
  %165 = zext i32 %126 to i64
  %166 = getelementptr inbounds i8, ptr addrspace(1) %115, i64 %165
  %.ascast.i10 = addrspacecast ptr addrspace(1) %166 to ptr addrspace(4)
  %167 = ptrtoint ptr addrspace(4) %.ascast.i10 to i64
  %168 = and i64 %167, -64
  %169 = trunc i64 %167 to i32
  %170 = lshr i32 %169, 1
  %171 = and i32 %170, 31
  %172 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %168, i32 255, i32 7, i32 255, i32 %171, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %173 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 %165
  %.ascast.i11 = addrspacecast ptr addrspace(1) %173 to ptr addrspace(4)
  %174 = ptrtoint ptr addrspace(4) %.ascast.i11 to i64
  %175 = and i64 %174, -64
  %176 = trunc i64 %174 to i32
  %177 = lshr i32 %176, 2
  %178 = and i32 %177, 15
  %179 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %175, i32 1023, i32 15, i32 1023, i32 %178, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %180 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %125, <8 x i16> %172, <8 x i32> %179, i32 4, i32 4, i32 8, i32 8, i1 false)
  %181 = add nuw nsw i32 %126, 32, !spirv.Decorations !743
  br label %124

182:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit, %101
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %183 = zext i8 %47 to i64
  %184 = getelementptr float, ptr addrspace(1) %12, i64 %104
  %185 = getelementptr float, ptr addrspace(1) %184, i64 %183
  %186 = load float, ptr addrspace(1) %185, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %32)
  %187 = getelementptr float, ptr addrspace(1) %13, i64 %114
  br label %188

188:                                              ; preds = %195, %182
  %189 = phi i32 [ 0, %182 ], [ %204, %195 ]
  %190 = icmp ult i32 %189, 4
  br i1 %190, label %195, label %191

191:                                              ; preds = %188
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %33)
  %192 = udiv i32 %localThreadId26, 6
  %193 = mul nsw i32 %14, 6, !spirv.Decorations !741
  %194 = icmp sgt i32 %193, %localThreadId26
  br i1 %194, label %205, label %218

195:                                              ; preds = %188
  %196 = shl nuw nsw i32 %189, 4, !spirv.Decorations !743
  %197 = add nuw nsw i32 %196, %simdLaneId, !spirv.Decorations !743
  %198 = zext i32 %197 to i64
  %199 = shl nuw nsw i64 %198, 2, !spirv.Decorations !743
  %200 = getelementptr float, ptr addrspace(1) %187, i64 %199
  %201 = load float, ptr addrspace(1) %200, align 4
  %202 = zext i32 %189 to i64
  %203 = getelementptr inbounds [4 x float], ptr %32, i64 0, i64 %202
  store float %201, ptr %203, align 4
  %204 = add nuw nsw i32 %189, 1, !spirv.Decorations !743
  br label %188, !llvm.loop !780

205:                                              ; preds = %191
  br i1 %76, label %212, label %206

206:                                              ; preds = %205
  %207 = zext i32 %192 to i64
  %208 = getelementptr i32, ptr addrspace(1) %1, i64 %207
  %209 = getelementptr i32, ptr addrspace(1) %208, i64 1
  %210 = load i32, ptr addrspace(1) %209, align 4
  %211 = sext i32 %210 to i64
  br label %218

212:                                              ; preds = %205
  %213 = sext i32 %14 to i64
  %214 = sub nsw i64 %79, %213, !spirv.Decorations !741
  %215 = zext i32 %192 to i64
  %216 = add nsw i64 %214, %215, !spirv.Decorations !741
  %217 = add nsw i64 %216, 1, !spirv.Decorations !741
  br label %218

218:                                              ; preds = %212, %206, %191
  %219 = phi i64 [ %211, %206 ], [ %217, %212 ], [ 0, %191 ]
  %220 = shl nuw nsw i32 %localThreadId26, 6, !spirv.Decorations !741
  %221 = sub nsw i64 %219, %81, !spirv.Decorations !741
  br label %222

222:                                              ; preds = %229, %218
  %223 = phi i32 [ 0, %218 ], [ %252, %229 ]
  %224 = phi float [ 0xFFF0000000000000, %218 ], [ %251, %229 ]
  %225 = icmp ult i32 %223, 4
  br i1 %225, label %229, label %226

226:                                              ; preds = %222
  %227 = call float @llvm.genx.GenISA.WaveAll.f32(float %224, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %34)
  %228 = fcmp reassoc nsz arcp contract oeq float %227, 0xFFF0000000000000, !spirv.Decorations !748
  br i1 %228, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %226
  br label %260

.preheader3:                                      ; preds = %226
  br label %253

229:                                              ; preds = %222
  %230 = shl nuw nsw i32 %223, 4, !spirv.Decorations !743
  %231 = add nuw nsw i32 %230, %simdLaneId, !spirv.Decorations !743
  %232 = or i32 %220, %230
  %233 = add nuw nsw i32 %232, %simdLaneId, !spirv.Decorations !743
  %234 = zext i32 %233 to i64
  %235 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM, i64 %234
  %236 = load i32, ptr addrspace(3) %235, align 4
  %237 = sitofp i32 %236 to float
  %238 = fmul reassoc nsz arcp contract float %186, %237, !spirv.Decorations !748
  %239 = zext i32 %223 to i64
  %240 = getelementptr inbounds [4 x float], ptr %32, i64 0, i64 %239
  %241 = load float, ptr %240, align 4
  %242 = fmul reassoc nsz arcp contract float %238, %241, !spirv.Decorations !748
  %243 = fmul reassoc nsz arcp contract float %242, 6.250000e-02, !spirv.Decorations !748
  %244 = zext i32 %231 to i64
  %245 = icmp slt i32 %231, %85
  %246 = icmp sgt i64 %221, %244
  %247 = and i1 %245, %194
  %248 = select i1 %247, i1 %246, i1 false
  %249 = select i1 %248, float %243, float 0xFFF0000000000000
  %250 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %239
  store float %249, ptr %250, align 4
  %251 = call float @llvm.maxnum.f32(float %224, float %249)
  %252 = add nuw nsw i32 %223, 1, !spirv.Decorations !743
  br label %222

253:                                              ; preds = %256, %.preheader3
  %254 = phi i32 [ %259, %256 ], [ 0, %.preheader3 ]
  %255 = icmp ult i32 %254, 4
  br i1 %255, label %256, label %.loopexit4

256:                                              ; preds = %253
  %257 = zext i32 %254 to i64
  %258 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %257
  store float 0.000000e+00, ptr %258, align 4
  %259 = add nuw nsw i32 %254, 1, !spirv.Decorations !743
  br label %253

260:                                              ; preds = %264, %.preheader5
  %261 = phi float [ %282, %264 ], [ 0.000000e+00, %.preheader5 ]
  %262 = phi i32 [ %283, %264 ], [ 0, %.preheader5 ]
  %263 = icmp ult i32 %262, 4
  br i1 %263, label %264, label %284

264:                                              ; preds = %260
  %265 = zext i32 %262 to i64
  %266 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %265
  %267 = load float, ptr %266, align 4
  %268 = fsub reassoc nsz arcp contract float %267, %227, !spirv.Decorations !748
  %269 = fmul float %268, 0x3FF7154760000000
  %270 = call float @llvm.trunc.f32(float %269)
  %271 = call float @llvm.fma.f32(float %270, float 0xBFE62E4000000000, float %268)
  %272 = call float @llvm.fma.f32(float %270, float 0xBEB7F7D1C0000000, float %271)
  %273 = fmul float %272, 0x3FF7154760000000
  %274 = call float @llvm.exp2.f32(float %270)
  %275 = call float @llvm.exp2.f32(float %273)
  %276 = fmul float %274, %275
  %277 = fcmp olt float %268, -1.050000e+02
  %278 = select i1 %277, float 0.000000e+00, float %276
  %279 = fcmp ogt float %268, 1.050000e+02
  %280 = select i1 %279, float 0x7FF0000000000000, float %278
  %281 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %265
  store float %280, ptr %281, align 4
  %282 = fadd reassoc nsz arcp contract float %261, %280, !spirv.Decorations !748
  %283 = add nuw nsw i32 %262, 1, !spirv.Decorations !743
  br label %260

284:                                              ; preds = %260
  %285 = call float @llvm.genx.GenISA.WaveAll.f32(float %261, i8 9, i1 true, i32 0)
  %286 = fcmp reassoc nsz arcp contract oeq float %285, 0.000000e+00, !spirv.Decorations !748
  br i1 %286, label %289, label %287

287:                                              ; preds = %284
  %288 = fdiv reassoc nsz arcp contract float 1.000000e+00, %285, !spirv.Decorations !748
  br label %289

.loopexit4:                                       ; preds = %253
  br label %289

289:                                              ; preds = %.loopexit4, %287, %284
  %290 = phi float [ %285, %287 ], [ %285, %284 ], [ 0.000000e+00, %.loopexit4 ]
  %291 = phi float [ %288, %287 ], [ 0.000000e+00, %284 ], [ 0.000000e+00, %.loopexit4 ]
  %292 = shl nuw nsw i32 %localThreadId26, 6, !spirv.Decorations !741
  br label %293

293:                                              ; preds = %298, %289
  %294 = phi i32 [ 0, %289 ], [ %310, %298 ]
  %295 = icmp ult i32 %294, 4
  br i1 %295, label %298, label %296

296:                                              ; preds = %293
  %297 = icmp eq i16 %simdLaneId16, 0
  br i1 %297, label %311, label %315

298:                                              ; preds = %293
  %299 = zext i32 %294 to i64
  %300 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %299
  %301 = load float, ptr %300, align 4
  %302 = fmul reassoc nsz arcp contract float %301, %291, !spirv.Decorations !748
  %303 = fptrunc float %302 to half
  %304 = shl nuw nsw i32 %294, 4, !spirv.Decorations !743
  %305 = or i32 %292, %304
  %306 = add nuw nsw i32 %305, %simdLaneId, !spirv.Decorations !743
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM, i64 0, i64 16384
  %309 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %308, i64 %307
  store half %303, ptr addrspace(3) %309, align 2
  %310 = add nuw nsw i32 %294, 1, !spirv.Decorations !743
  br label %293

311:                                              ; preds = %296
  %312 = add nuw nsw i64 %106, %183, !spirv.Decorations !743
  %313 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %312
  store float %227, ptr addrspace(1) %313, align 4
  %314 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %312
  store float %290, ptr addrspace(1) %314, align 4
  br label %315

315:                                              ; preds = %311, %296
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %34)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %32)
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %316 = lshr i32 %35, 1
  %317 = and i32 %35, 1
  %318 = shl nuw nsw i32 %316, 7, !spirv.Decorations !741
  %319 = zext i32 %318 to i64
  %320 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM, i64 %319
  %321 = shl nuw nsw i32 %317, 6, !spirv.Decorations !743
  %322 = zext i32 %321 to i64
  %323 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %320, i64 %322
  %324 = icmp slt i32 %316, %85
  %325 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %114
  %326 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %114
  %327 = getelementptr i8, ptr addrspace(1) %17, i64 %111
  %328 = getelementptr i8, ptr addrspace(1) %327, i64 %112
  %329 = shl nuw nsw i32 %316, 2, !spirv.Decorations !743
  %330 = zext i32 %329 to i64
  %331 = getelementptr inbounds float, ptr addrspace(1) %326, i64 %330
  %332 = getelementptr inbounds float, ptr addrspace(1) %325, i64 %330
  %333 = shl nuw nsw i32 %317, 5, !spirv.Decorations !743
  %334 = shl nuw nsw i32 %316, 9
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds i8, ptr addrspace(1) %328, i64 %335
  %337 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !741
  %338 = zext i32 %337 to i64
  %339 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM, i64 %338
  %340 = shl nuw nsw i32 %localThreadId26, 4, !spirv.Decorations !741
  %341 = zext i32 %340 to i64
  %342 = getelementptr inbounds float, ptr addrspace(1) %118, i64 %341
  br label %343

343:                                              ; preds = %547, %315
  %344 = phi i32 [ 0, %315 ], [ %449, %547 ]
  %345 = icmp ult i32 %344, 256
  br i1 %345, label %346, label %.loopexit2

346:                                              ; preds = %343
  br i1 %324, label %354, label %.preheader

.preheader:                                       ; preds = %346
  br label %347

347:                                              ; preds = %350, %.preheader
  %348 = phi i32 [ %353, %350 ], [ 0, %.preheader ]
  %349 = icmp ult i32 %348, 64
  br i1 %349, label %350, label %.loopexit1

350:                                              ; preds = %347
  %351 = zext i32 %348 to i64
  %352 = getelementptr inbounds half, ptr addrspace(3) %323, i64 %351
  store half 0xH0000, ptr addrspace(3) %352, align 2
  %353 = add nuw nsw i32 %348, 1, !spirv.Decorations !743
  br label %347, !llvm.loop !781

354:                                              ; preds = %346
  %355 = load float, ptr addrspace(1) %331, align 4
  %356 = load float, ptr addrspace(1) %332, align 4
  %357 = lshr exact i32 %344, 1
  %358 = or i32 %357, %333
  %359 = zext i32 %358 to i64
  %360 = getelementptr inbounds i8, ptr addrspace(1) %336, i64 %359
  br label %361

361:                                              ; preds = %371, %354
  %362 = phi i32 [ 0, %354 ], [ %372, %371 ]
  %363 = icmp ult i32 %362, 32
  br i1 %363, label %364, label %.loopexit

364:                                              ; preds = %361
  %365 = zext i32 %362 to i64
  %366 = getelementptr inbounds i8, ptr addrspace(1) %360, i64 %365
  %367 = load i64, ptr addrspace(1) %366, align 1
  br label %368

368:                                              ; preds = %373, %364
  %369 = phi i32 [ 0, %364 ], [ %394, %373 ]
  %370 = icmp ult i32 %369, 8
  br i1 %370, label %373, label %371

371:                                              ; preds = %368
  %372 = add nuw nsw i32 %362, 8, !spirv.Decorations !743
  br label %361, !llvm.loop !782

373:                                              ; preds = %368
  %374 = shl nuw nsw i32 %369, 3, !spirv.Decorations !743
  %375 = zext i32 %374 to i64
  %376 = lshr i64 %367, %375
  %377 = trunc i64 %376 to i32
  %378 = and i32 %377, 15
  %379 = uitofp i32 %378 to float
  %380 = fsub reassoc nsz arcp contract float %379, %356, !spirv.Decorations !748
  %381 = fmul reassoc nsz arcp contract float %380, %355, !spirv.Decorations !748
  %382 = fptrunc float %381 to half
  %383 = or i32 %362, %369
  %384 = shl nuw nsw i32 %383, 1, !spirv.Decorations !743
  %385 = zext i32 %384 to i64
  %386 = getelementptr half, ptr addrspace(3) %323, i64 %385
  store half %382, ptr addrspace(3) %386, align 4
  %387 = lshr i32 %377, 4
  %388 = and i32 %387, 15
  %389 = uitofp i32 %388 to float
  %390 = fsub reassoc nsz arcp contract float %389, %356, !spirv.Decorations !748
  %391 = fmul reassoc nsz arcp contract float %390, %355, !spirv.Decorations !748
  %392 = fptrunc float %391 to half
  %393 = getelementptr half, ptr addrspace(3) %386, i64 1
  store half %392, ptr addrspace(3) %393, align 2
  %394 = add nuw nsw i32 %369, 1, !spirv.Decorations !743
  br label %368, !llvm.loop !783

.loopexit:                                        ; preds = %361
  br label %395

.loopexit1:                                       ; preds = %347
  br label %395

395:                                              ; preds = %.loopexit1, %.loopexit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %396

396:                                              ; preds = %451, %395
  %397 = phi <8 x float> [ zeroinitializer, %395 ], [ %544, %451 ]
  %398 = phi i32 [ 0, %395 ], [ %545, %451 ]
  %399 = extractelement <8 x float> %397, i32 0
  %400 = extractelement <8 x float> %397, i32 1
  %401 = extractelement <8 x float> %397, i32 2
  %402 = extractelement <8 x float> %397, i32 3
  %403 = extractelement <8 x float> %397, i32 4
  %404 = extractelement <8 x float> %397, i32 5
  %405 = extractelement <8 x float> %397, i32 6
  %406 = extractelement <8 x float> %397, i32 7
  %407 = icmp ult i32 %398, 64
  br i1 %407, label %451, label %408

408:                                              ; preds = %396
  %409 = zext i32 %344 to i64
  %410 = getelementptr inbounds float, ptr addrspace(1) %342, i64 %409
  %411 = bitcast float %399 to i32
  %412 = bitcast float %400 to i32
  %413 = bitcast float %401 to i32
  %414 = bitcast float %402 to i32
  %415 = bitcast float %403 to i32
  %416 = bitcast float %404 to i32
  %417 = bitcast float %405 to i32
  %418 = bitcast float %406 to i32
  %419 = insertelement <8 x i32> undef, i32 %411, i32 0
  %420 = insertelement <8 x i32> %419, i32 %412, i32 1
  %421 = insertelement <8 x i32> %420, i32 %413, i32 2
  %422 = insertelement <8 x i32> %421, i32 %414, i32 3
  %423 = insertelement <8 x i32> %422, i32 %415, i32 4
  %424 = insertelement <8 x i32> %423, i32 %416, i32 5
  %425 = insertelement <8 x i32> %424, i32 %417, i32 6
  %426 = insertelement <8 x i32> %425, i32 %418, i32 7
  %.ascast.i12 = addrspacecast ptr addrspace(1) %410 to ptr addrspace(4)
  %427 = mul i32 %22, %21
  %428 = mul i32 %427, %23
  %429 = and i32 %428, 15
  %430 = icmp eq i32 %429, 0
  br i1 %430, label %443, label %431

431:                                              ; preds = %408
  %localIdZ41 = zext i16 %localIdZ to i32
  %432 = mul i32 %22, %localIdZ41
  %localIdY43 = zext i16 %localIdY to i32
  %433 = add i32 %432, %localIdY43
  %434 = mul i32 %433, %21
  %localIdX45 = zext i16 %localIdX to i32
  %435 = add i32 %434, %localIdX45
  %436 = lshr i32 %435, 4
  %437 = mul i32 %22, %21
  %438 = mul i32 %437, %23
  %439 = add i32 %438, 15
  %440 = lshr i32 %439, 4
  %441 = add nsw i32 %440, -1
  %442 = icmp ult i32 %436, %441
  br i1 %442, label %443, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

443:                                              ; preds = %431, %408
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %431, %443
  %444 = ptrtoint ptr addrspace(4) %.ascast.i12 to i64
  %445 = and i64 %444, -64
  %446 = trunc i64 %444 to i32
  %447 = lshr i32 %446, 2
  %448 = and i32 %447, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %445, i32 1023, i32 7, i32 1023, i32 %448, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %426)
  %449 = add nuw nsw i32 %344, 128, !spirv.Decorations !743
  %450 = icmp eq i32 %344, 0
  br i1 %450, label %546, label %547

451:                                              ; preds = %396
  %452 = zext i32 %398 to i64
  %453 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM, i64 0, i64 16384
  %454 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %453, i64 %452
  %455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %454)
  %456 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 64
  %457 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %456)
  %458 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 128
  %459 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %458)
  %460 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 192
  %461 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %460)
  %462 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 256
  %463 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %462)
  %464 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 320
  %465 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %464)
  %466 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 384
  %467 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %466)
  %468 = getelementptr inbounds i16, ptr addrspace(3) %454, i64 448
  %469 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %468)
  %470 = insertelement <8 x i16> undef, i16 %455, i32 0
  %471 = insertelement <8 x i16> %470, i16 %457, i32 1
  %472 = insertelement <8 x i16> %471, i16 %459, i32 2
  %473 = insertelement <8 x i16> %472, i16 %461, i32 3
  %474 = insertelement <8 x i16> %473, i16 %463, i32 4
  %475 = insertelement <8 x i16> %474, i16 %465, i32 5
  %476 = insertelement <8 x i16> %475, i16 %467, i32 6
  %477 = insertelement <8 x i16> %476, i16 %469, i32 7
  %478 = shl nuw nsw i32 %398, 7, !spirv.Decorations !743
  %479 = zext i32 %478 to i64
  %480 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %339, i64 %479
  %481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %480)
  %482 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 64
  %483 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %482)
  %484 = insertelement <2 x i16> undef, i16 %481, i32 0
  %485 = insertelement <2 x i16> %484, i16 %483, i32 1
  %486 = bitcast <2 x i16> %485 to i32
  %487 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 128
  %488 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %487)
  %489 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 192
  %490 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %489)
  %491 = insertelement <2 x i16> undef, i16 %488, i32 0
  %492 = insertelement <2 x i16> %491, i16 %490, i32 1
  %493 = bitcast <2 x i16> %492 to i32
  %494 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 256
  %495 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %494)
  %496 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 320
  %497 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %496)
  %498 = insertelement <2 x i16> undef, i16 %495, i32 0
  %499 = insertelement <2 x i16> %498, i16 %497, i32 1
  %500 = bitcast <2 x i16> %499 to i32
  %501 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 384
  %502 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %501)
  %503 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 448
  %504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %503)
  %505 = insertelement <2 x i16> undef, i16 %502, i32 0
  %506 = insertelement <2 x i16> %505, i16 %504, i32 1
  %507 = bitcast <2 x i16> %506 to i32
  %508 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 512
  %509 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %508)
  %510 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 576
  %511 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %510)
  %512 = insertelement <2 x i16> undef, i16 %509, i32 0
  %513 = insertelement <2 x i16> %512, i16 %511, i32 1
  %514 = bitcast <2 x i16> %513 to i32
  %515 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 640
  %516 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %515)
  %517 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 704
  %518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %517)
  %519 = insertelement <2 x i16> undef, i16 %516, i32 0
  %520 = insertelement <2 x i16> %519, i16 %518, i32 1
  %521 = bitcast <2 x i16> %520 to i32
  %522 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 768
  %523 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %522)
  %524 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 832
  %525 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %524)
  %526 = insertelement <2 x i16> undef, i16 %523, i32 0
  %527 = insertelement <2 x i16> %526, i16 %525, i32 1
  %528 = bitcast <2 x i16> %527 to i32
  %529 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 896
  %530 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %529)
  %531 = getelementptr inbounds i32, ptr addrspace(3) %480, i64 960
  %532 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %531)
  %533 = insertelement <2 x i16> undef, i16 %530, i32 0
  %534 = insertelement <2 x i16> %533, i16 %532, i32 1
  %535 = bitcast <2 x i16> %534 to i32
  %536 = insertelement <8 x i32> undef, i32 %486, i32 0
  %537 = insertelement <8 x i32> %536, i32 %493, i32 1
  %538 = insertelement <8 x i32> %537, i32 %500, i32 2
  %539 = insertelement <8 x i32> %538, i32 %507, i32 3
  %540 = insertelement <8 x i32> %539, i32 %514, i32 4
  %541 = insertelement <8 x i32> %540, i32 %521, i32 5
  %542 = insertelement <8 x i32> %541, i32 %528, i32 6
  %543 = insertelement <8 x i32> %542, i32 %535, i32 7
  %544 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %397, <8 x i16> %477, <8 x i32> %543, i32 12, i32 12, i32 8, i32 8, i1 false)
  %545 = add nuw nsw i32 %398, 16, !spirv.Decorations !743
  br label %396

546:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %547

547:                                              ; preds = %546, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  br label %343

.loopexit2:                                       ; preds = %343
  br label %548

548:                                              ; preds = %.loopexit2, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 4 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 1 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
  %21 = extractelement <3 x i32> %localSize, i32 0
  %22 = extractelement <3 x i32> %localSize, i32 1
  %23 = extractelement <3 x i32> %localSize, i32 2
  %24 = extractelement <8 x i32> %r0, i32 0
  %25 = extractelement <8 x i32> %r0, i32 1
  %26 = extractelement <8 x i32> %r0, i32 2
  %27 = extractelement <8 x i32> %r0, i32 3
  %28 = extractelement <8 x i32> %r0, i32 4
  %29 = extractelement <8 x i32> %r0, i32 5
  %30 = extractelement <8 x i32> %r0, i32 6
  %31 = extractelement <8 x i32> %r0, i32 7
  %32 = alloca [8 x float], align 4, !spirv.Decorations !739
  %33 = alloca [4 x float], align 4, !spirv.Decorations !739
  %34 = alloca [8 x [2 x float]], align 4, !spirv.Decorations !739
  %35 = alloca [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], align 2, !spirv.Decorations !761
  %36 = alloca [4 x float], align 4, !spirv.Decorations !739
  %37 = alloca [4 x float], align 4, !spirv.Decorations !739
  %38 = zext i16 %localIdX to i32
  %39 = zext i32 %25 to i64
  %40 = icmp sgt i32 %25, -1
  call void @llvm.assume(i1 %40)
  %41 = bitcast <8 x i32> %r0 to <32 x i8>
  %42 = extractelement <32 x i8> %41, i32 0
  %43 = extractelement <32 x i8> %41, i32 1
  %44 = extractelement <32 x i8> %41, i32 2
  %45 = extractelement <32 x i8> %41, i32 3
  %46 = extractelement <32 x i8> %41, i32 4
  %47 = extractelement <32 x i8> %41, i32 5
  %48 = extractelement <32 x i8> %41, i32 6
  %49 = extractelement <32 x i8> %41, i32 7
  %50 = extractelement <32 x i8> %41, i32 8
  %51 = extractelement <32 x i8> %41, i32 9
  %52 = extractelement <32 x i8> %41, i32 10
  %53 = extractelement <32 x i8> %41, i32 11
  %54 = extractelement <32 x i8> %41, i32 12
  %55 = extractelement <32 x i8> %41, i32 13
  %56 = extractelement <32 x i8> %41, i32 14
  %57 = extractelement <32 x i8> %41, i32 15
  %58 = extractelement <32 x i8> %41, i32 16
  %59 = extractelement <32 x i8> %41, i32 17
  %60 = extractelement <32 x i8> %41, i32 18
  %61 = extractelement <32 x i8> %41, i32 19
  %62 = extractelement <32 x i8> %41, i32 20
  %63 = extractelement <32 x i8> %41, i32 21
  %64 = extractelement <32 x i8> %41, i32 22
  %65 = extractelement <32 x i8> %41, i32 23
  %66 = extractelement <32 x i8> %41, i32 24
  %67 = extractelement <32 x i8> %41, i32 25
  %68 = extractelement <32 x i8> %41, i32 26
  %69 = extractelement <32 x i8> %41, i32 27
  %70 = extractelement <32 x i8> %41, i32 28
  %71 = extractelement <32 x i8> %41, i32 29
  %72 = extractelement <32 x i8> %41, i32 30
  %73 = extractelement <32 x i8> %41, i32 31
  %localThreadId26 = zext i8 %50 to i32
  %74 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !741
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %75 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %75)
  %76 = mul nsw i32 %0, 6, !spirv.Decorations !741
  %77 = icmp slt i32 %74, %76
  %78 = sdiv i32 %25, %1
  %freeze = freeze i32 %78
  %79 = mul nsw i32 %freeze, %1, !spirv.Decorations !741
  %80 = sub nsw i32 %25, %79, !spirv.Decorations !741
  %81 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %82 = icmp eq ptr addrspace(1) %2, %81
  %83 = select i1 %82, ptr addrspace(1) %3, ptr addrspace(1) %2
  %84 = load i32, ptr addrspace(1) %83, align 4
  %85 = sext i32 %84 to i64
  %86 = sext i32 %80 to i64
  %87 = shl nsw i64 %86, 6, !spirv.Decorations !741
  %88 = sub nsw i64 %85, %87, !spirv.Decorations !741
  %89 = call i64 @llvm.smin.i64(i64 %88, i64 64)
  %90 = call i64 @llvm.smax.i64(i64 %89, i64 0)
  %91 = trunc i64 %90 to i32
  %92 = icmp slt i32 %91, 1
  br i1 %92, label %1885, label %93

93:                                               ; preds = %20
  %94 = icmp slt i32 %4, 2
  br i1 %94, label %95, label %98

95:                                               ; preds = %93
  %96 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %86
  %97 = load i32, ptr addrspace(1) %96, align 4
  br label %107

98:                                               ; preds = %93
  %99 = sdiv i32 %80, %4
  %freeze105 = freeze i32 %99
  %100 = sext i32 %freeze105 to i64
  %101 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %100
  %102 = load i32, ptr addrspace(1) %101, align 4
  %103 = mul nsw i32 %102, %4, !spirv.Decorations !741
  %104 = mul i32 %freeze105, %4
  %105 = sub i32 %80, %104
  %106 = add nsw i32 %103, %105, !spirv.Decorations !741
  br label %107

107:                                              ; preds = %98, %95
  %108 = phi i32 [ %97, %95 ], [ %106, %98 ]
  %109 = sext i32 %freeze to i64
  %110 = shl nsw i64 %109, 6, !spirv.Decorations !741
  %111 = shl nsw i64 %109, 14, !spirv.Decorations !741
  %112 = shl nuw nsw i64 %39, 6, !spirv.Decorations !743
  %113 = shl nuw nsw i64 %39, 14, !spirv.Decorations !743
  %114 = sext i32 %108 to i64
  %115 = mul i64 %114, %7
  %116 = shl nsw i64 %109, 8, !spirv.Decorations !741
  %117 = mul i64 %114, %8
  %118 = shl nsw i64 %109, 7, !spirv.Decorations !741
  %119 = mul i64 %114, %9
  %120 = add i64 %119, %109
  %121 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %111
  %122 = getelementptr i8, ptr addrspace(1) %11, i64 %115
  %123 = getelementptr i8, ptr addrspace(1) %122, i64 %116
  %124 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %113
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %32)
  %125 = zext i32 %74 to i64
  %126 = getelementptr float, ptr addrspace(1) %13, i64 %110
  %127 = getelementptr float, ptr addrspace(1) %126, i64 %125
  br label %128

128:                                              ; preds = %133, %107
  %129 = phi i32 [ 0, %107 ], [ %138, %133 ]
  %130 = icmp ult i32 %129, 8
  br i1 %130, label %133, label %131

131:                                              ; preds = %128
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %33)
  %132 = getelementptr float, ptr addrspace(1) %14, i64 %120
  br label %139

133:                                              ; preds = %128
  %134 = zext i32 %129 to i64
  %135 = getelementptr inbounds float, ptr addrspace(1) %127, i64 %134
  %136 = load float, ptr addrspace(1) %135, align 4
  %137 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %134
  store float %136, ptr %137, align 4
  %138 = add nuw nsw i32 %129, 1, !spirv.Decorations !743
  br label %128, !llvm.loop !784

139:                                              ; preds = %151, %131
  %140 = phi i32 [ 0, %131 ], [ %160, %151 ]
  %141 = icmp ult i32 %140, 4
  br i1 %141, label %151, label %142

142:                                              ; preds = %139
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %34)
  %143 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !741
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 %144
  %146 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 16384
  %147 = shl nuw nsw i32 %localThreadId26, 8, !spirv.Decorations !741
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 %148
  %150 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 16
  br label %161

151:                                              ; preds = %139
  %152 = shl nuw nsw i32 %140, 4, !spirv.Decorations !743
  %153 = add nuw nsw i32 %152, %simdLaneId, !spirv.Decorations !743
  %154 = zext i32 %153 to i64
  %155 = shl nuw nsw i64 %154, 2, !spirv.Decorations !743
  %156 = getelementptr float, ptr addrspace(1) %132, i64 %155
  %157 = load float, ptr addrspace(1) %156, align 4
  %158 = zext i32 %140 to i64
  %159 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %158
  store float %157, ptr %159, align 4
  %160 = add nuw nsw i32 %140, 1, !spirv.Decorations !743
  br label %139, !llvm.loop !785

161:                                              ; preds = %308, %142
  %162 = phi i32 [ 0, %142 ], [ %309, %308 ]
  %163 = icmp ult i32 %162, 2
  br i1 %163, label %172, label %164

164:                                              ; preds = %161
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %35)
  br i1 %77, label %165, label %310

165:                                              ; preds = %164
  %166 = getelementptr i32, ptr addrspace(1) %2, i64 1
  %167 = sext i32 %0 to i64
  %168 = sub nsw i64 %85, %167, !spirv.Decorations !741
  %169 = add nsw i64 %168, 1, !spirv.Decorations !741
  %170 = or i32 %simdLaneId, -32
  %171 = icmp eq i16 %simdLaneId16, 0
  br label %319

172:                                              ; preds = %161
  br i1 %77, label %173, label %275

173:                                              ; preds = %172
  %174 = shl nuw nsw i32 %162, 15, !spirv.Decorations !743
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds i8, ptr addrspace(1) %123, i64 %175
  %177 = zext i32 %174 to i64
  %178 = getelementptr inbounds i8, ptr addrspace(1) %146, i64 %177
  br label %179

179:                                              ; preds = %249, %173
  %180 = phi <8 x i32> [ zeroinitializer, %173 ], [ %273, %249 ]
  %181 = phi <8 x i32> [ zeroinitializer, %173 ], [ %265, %249 ]
  %182 = phi i32 [ 0, %173 ], [ %274, %249 ]
  %183 = extractelement <8 x i32> %180, i32 0
  %184 = extractelement <8 x i32> %180, i32 1
  %185 = extractelement <8 x i32> %180, i32 2
  %186 = extractelement <8 x i32> %180, i32 3
  %187 = extractelement <8 x i32> %180, i32 4
  %188 = extractelement <8 x i32> %180, i32 5
  %189 = extractelement <8 x i32> %180, i32 6
  %190 = extractelement <8 x i32> %180, i32 7
  %191 = extractelement <8 x i32> %181, i32 0
  %192 = extractelement <8 x i32> %181, i32 1
  %193 = extractelement <8 x i32> %181, i32 2
  %194 = extractelement <8 x i32> %181, i32 3
  %195 = extractelement <8 x i32> %181, i32 4
  %196 = extractelement <8 x i32> %181, i32 5
  %197 = extractelement <8 x i32> %181, i32 6
  %198 = extractelement <8 x i32> %181, i32 7
  %199 = icmp ult i32 %182, 256
  br i1 %199, label %249, label %200

200:                                              ; preds = %179
  %201 = mul i32 %22, %21
  %202 = mul i32 %201, %23
  %203 = and i32 %202, 15
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %217, label %205

205:                                              ; preds = %200
  %localIdZ30 = zext i16 %localIdZ to i32
  %206 = mul i32 %22, %localIdZ30
  %localIdY32 = zext i16 %localIdY to i32
  %207 = add i32 %206, %localIdY32
  %208 = mul i32 %207, %21
  %localIdX34 = zext i16 %localIdX to i32
  %209 = add i32 %208, %localIdX34
  %210 = lshr i32 %209, 4
  %211 = mul i32 %22, %21
  %212 = mul i32 %211, %23
  %213 = add i32 %212, 15
  %214 = lshr i32 %213, 4
  %215 = add nsw i32 %214, -1
  %216 = icmp ult i32 %210, %215
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

217:                                              ; preds = %205, %200
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %205, %217
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %149, i32 %191)
  %218 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 32
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %218, i32 %192)
  %219 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 64
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %219, i32 %193)
  %220 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 96
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %220, i32 %194)
  %221 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 128
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %221, i32 %195)
  %222 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 160
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %222, i32 %196)
  %223 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %223, i32 %197)
  %224 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 224
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %224, i32 %198)
  %225 = mul i32 %22, %21
  %226 = mul i32 %225, %23
  %227 = and i32 %226, 15
  %228 = icmp eq i32 %227, 0
  br i1 %228, label %241, label %229

229:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  %localIdZ41 = zext i16 %localIdZ to i32
  %230 = mul i32 %22, %localIdZ41
  %localIdY43 = zext i16 %localIdY to i32
  %231 = add i32 %230, %localIdY43
  %232 = mul i32 %231, %21
  %localIdX45 = zext i16 %localIdX to i32
  %233 = add i32 %232, %localIdX45
  %234 = lshr i32 %233, 4
  %235 = mul i32 %22, %21
  %236 = mul i32 %235, %23
  %237 = add i32 %236, 15
  %238 = lshr i32 %237, 4
  %239 = add nsw i32 %238, -1
  %240 = icmp ult i32 %234, %239
  br i1 %240, label %241, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit54

241:                                              ; preds = %229, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit54

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit54: ; preds = %229, %241
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %150, i32 %183)
  %242 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 48
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %242, i32 %184)
  %243 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 80
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %243, i32 %185)
  %244 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 112
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %244, i32 %186)
  %245 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 144
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %245, i32 %187)
  %246 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 176
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %246, i32 %188)
  %247 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 208
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %247, i32 %189)
  %248 = getelementptr inbounds i32, ptr addrspace(3) %149, i64 240
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %248, i32 %190)
  br label %275

249:                                              ; preds = %179
  %250 = zext i32 %182 to i64
  %251 = getelementptr inbounds i8, ptr addrspace(1) %145, i64 %250
  %.ascast.i55 = addrspacecast ptr addrspace(1) %251 to ptr addrspace(4)
  %252 = ptrtoint ptr addrspace(4) %.ascast.i55 to i64
  %253 = and i64 %252, -64
  %254 = trunc i64 %252 to i32
  %255 = lshr i32 %254, 1
  %256 = and i32 %255, 31
  %257 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %253, i32 255, i32 7, i32 255, i32 %256, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %258 = getelementptr inbounds i8, ptr addrspace(1) %176, i64 %250
  %.ascast.i56 = addrspacecast ptr addrspace(1) %258 to ptr addrspace(4)
  %259 = ptrtoint ptr addrspace(4) %.ascast.i56 to i64
  %260 = and i64 %259, -64
  %261 = trunc i64 %259 to i32
  %262 = lshr i32 %261, 2
  %263 = and i32 %262, 15
  %264 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %260, i32 1023, i32 15, i32 1023, i32 %263, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %265 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %181, <8 x i16> %257, <8 x i32> %264, i32 4, i32 4, i32 8, i32 8, i1 false)
  %266 = getelementptr inbounds i8, ptr addrspace(1) %178, i64 %250
  %.ascast.i57 = addrspacecast ptr addrspace(1) %266 to ptr addrspace(4)
  %267 = ptrtoint ptr addrspace(4) %.ascast.i57 to i64
  %268 = and i64 %267, -64
  %269 = trunc i64 %267 to i32
  %270 = lshr i32 %269, 2
  %271 = and i32 %270, 15
  %272 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %268, i32 1023, i32 15, i32 1023, i32 %271, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %273 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %180, <8 x i16> %257, <8 x i32> %272, i32 4, i32 4, i32 8, i32 8, i1 false)
  %274 = add nuw nsw i32 %182, 32, !spirv.Decorations !743
  br label %179

275:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit54, %172
  call void @llvm.genx.GenISA.wavebarrier()
  %276 = icmp eq i32 %162, 0
  %277 = select i1 %276, i1 %77, i1 false
  br i1 %277, label %.preheader8, label %308

.preheader8:                                      ; preds = %275
  br label %278

278:                                              ; preds = %290, %.preheader8
  %279 = phi i32 [ %291, %290 ], [ 0, %.preheader8 ]
  %280 = icmp ult i32 %279, 8
  br i1 %280, label %281, label %.loopexit9

281:                                              ; preds = %278
  %282 = or i32 %74, %279
  %283 = shl nsw i32 %282, 5, !spirv.Decorations !741
  %284 = zext i32 %279 to i64
  %285 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %284
  %286 = load float, ptr %285, align 4
  br label %287

287:                                              ; preds = %292, %281
  %288 = phi i32 [ %307, %292 ], [ 0, %281 ]
  %289 = icmp ult i32 %288, 2
  br i1 %289, label %292, label %290

290:                                              ; preds = %287
  %291 = add nuw nsw i32 %279, 1, !spirv.Decorations !743
  br label %278, !llvm.loop !786

292:                                              ; preds = %287
  %293 = shl nuw nsw i32 %288, 4, !spirv.Decorations !743
  %294 = or i32 %283, %293
  %295 = add nuw nsw i32 %294, %simdLaneId, !spirv.Decorations !743
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 %296
  %298 = load i32, ptr addrspace(3) %297, align 4
  %299 = sitofp i32 %298 to float
  %300 = fmul reassoc nsz arcp contract float %286, %299, !spirv.Decorations !748
  %301 = zext i32 %288 to i64
  %302 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %301
  %303 = load float, ptr %302, align 4
  %304 = fmul reassoc nsz arcp contract float %300, %303, !spirv.Decorations !748
  %305 = fmul reassoc nsz arcp contract float %304, 6.250000e-02, !spirv.Decorations !748
  %306 = getelementptr inbounds [8 x [2 x float]], ptr %34, i64 0, i64 %284, i64 %301
  store float %305, ptr %306, align 4
  %307 = add nuw nsw i32 %288, 1, !spirv.Decorations !743
  br label %287, !llvm.loop !787

.loopexit9:                                       ; preds = %278
  br label %308

308:                                              ; preds = %.loopexit9, %275
  call void @llvm.genx.GenISA.wavebarrier()
  %309 = add nuw nsw i32 %162, 1, !spirv.Decorations !743
  br label %161

310:                                              ; preds = %164
  %311 = icmp ult i16 %simdLaneId16, 8
  br i1 %311, label %312, label %440

312:                                              ; preds = %310
  %313 = zext i32 %74 to i64
  %314 = add nuw nsw i64 %112, %313, !spirv.Decorations !743
  %315 = zext i16 %simdLaneId16 to i64
  %316 = or i64 %314, %315
  %317 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %316
  store float 0xFFF0000000000000, ptr addrspace(1) %317, align 4
  %318 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %316
  store float 0.000000e+00, ptr addrspace(1) %318, align 4
  br label %440

319:                                              ; preds = %438, %165
  %320 = phi i32 [ %439, %438 ], [ 0, %165 ]
  %321 = icmp ult i32 %320, 8
  br i1 %321, label %322, label %.loopexit7

322:                                              ; preds = %319
  %323 = or i32 %74, %320
  %324 = zext i32 %320 to i64
  %325 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %324
  %326 = load float, ptr %325, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %36)
  %327 = udiv i32 %323, 6
  %328 = icmp slt i32 %323, %76
  br i1 %328, label %329, label %338

329:                                              ; preds = %322
  br i1 %82, label %335, label %330

330:                                              ; preds = %329
  %331 = zext i32 %327 to i64
  %332 = getelementptr i32, ptr addrspace(1) %166, i64 %331
  %333 = load i32, ptr addrspace(1) %332, align 4
  %334 = sext i32 %333 to i64
  br label %338

335:                                              ; preds = %329
  %336 = zext i32 %327 to i64
  %337 = add nsw i64 %169, %336, !spirv.Decorations !741
  br label %338

338:                                              ; preds = %335, %330, %322
  %339 = phi i64 [ %334, %330 ], [ %337, %335 ], [ 0, %322 ]
  %340 = shl nsw i32 %323, 5, !spirv.Decorations !741
  %341 = add nsw i32 %340, %170
  %342 = sub nsw i64 %339, %87, !spirv.Decorations !741
  br label %343

343:                                              ; preds = %370, %338
  %344 = phi float [ 0xFFF0000000000000, %338 ], [ %380, %370 ]
  %345 = phi i32 [ 0, %338 ], [ %381, %370 ]
  %346 = icmp ult i32 %345, 4
  br i1 %346, label %350, label %347

347:                                              ; preds = %343
  %348 = call float @llvm.genx.GenISA.WaveAll.f32(float %344, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %37)
  %349 = fcmp reassoc nsz arcp contract oeq float %348, 0xFFF0000000000000, !spirv.Decorations !748
  br i1 %349, label %.preheader4, label %.preheader6

.preheader6:                                      ; preds = %347
  br label %389

.preheader4:                                      ; preds = %347
  br label %382

350:                                              ; preds = %343
  %351 = shl nuw nsw i32 %345, 4, !spirv.Decorations !743
  %352 = add nuw nsw i32 %351, %simdLaneId, !spirv.Decorations !743
  %353 = icmp ult i32 %345, 2
  br i1 %353, label %354, label %358

354:                                              ; preds = %350
  %355 = zext i32 %345 to i64
  %356 = getelementptr inbounds [8 x [2 x float]], ptr %34, i64 0, i64 %324, i64 %355
  %357 = load float, ptr %356, align 4
  br label %370

358:                                              ; preds = %350
  %359 = add i32 %351, %341
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 %360
  %362 = load i32, ptr addrspace(3) %361, align 4
  %363 = sitofp i32 %362 to float
  %364 = fmul reassoc nsz arcp contract float %326, %363, !spirv.Decorations !748
  %365 = zext i32 %345 to i64
  %366 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %365
  %367 = load float, ptr %366, align 4
  %368 = fmul reassoc nsz arcp contract float %364, %367, !spirv.Decorations !748
  %369 = fmul reassoc nsz arcp contract float %368, 6.250000e-02, !spirv.Decorations !748
  br label %370

370:                                              ; preds = %358, %354
  %371 = phi i64 [ %365, %358 ], [ %355, %354 ]
  %372 = phi float [ %369, %358 ], [ %357, %354 ]
  %373 = zext i32 %352 to i64
  %374 = icmp slt i32 %352, %91
  %375 = icmp sgt i64 %342, %373
  %376 = and i1 %374, %328
  %377 = select i1 %376, i1 %375, i1 false
  %378 = select i1 %377, float %372, float 0xFFF0000000000000
  %379 = getelementptr inbounds [4 x float], ptr %36, i64 0, i64 %371
  store float %378, ptr %379, align 4
  %380 = call float @llvm.maxnum.f32(float %344, float %378)
  %381 = add nuw nsw i32 %345, 1, !spirv.Decorations !743
  br label %343

382:                                              ; preds = %385, %.preheader4
  %383 = phi i32 [ %388, %385 ], [ 0, %.preheader4 ]
  %384 = icmp ult i32 %383, 4
  br i1 %384, label %385, label %.loopexit5

385:                                              ; preds = %382
  %386 = zext i32 %383 to i64
  %387 = getelementptr inbounds [4 x float], ptr %37, i64 0, i64 %386
  store float 0.000000e+00, ptr %387, align 4
  %388 = add nuw nsw i32 %383, 1, !spirv.Decorations !743
  br label %382

389:                                              ; preds = %393, %.preheader6
  %390 = phi float [ %411, %393 ], [ 0.000000e+00, %.preheader6 ]
  %391 = phi i32 [ %412, %393 ], [ 0, %.preheader6 ]
  %392 = icmp ult i32 %391, 4
  br i1 %392, label %393, label %413

393:                                              ; preds = %389
  %394 = zext i32 %391 to i64
  %395 = getelementptr inbounds [4 x float], ptr %36, i64 0, i64 %394
  %396 = load float, ptr %395, align 4
  %397 = fsub reassoc nsz arcp contract float %396, %348, !spirv.Decorations !748
  %398 = fmul float %397, 0x3FF7154760000000
  %399 = call float @llvm.trunc.f32(float %398)
  %400 = call float @llvm.fma.f32(float %399, float 0xBFE62E4000000000, float %397)
  %401 = call float @llvm.fma.f32(float %399, float 0xBEB7F7D1C0000000, float %400)
  %402 = fmul float %401, 0x3FF7154760000000
  %403 = call float @llvm.exp2.f32(float %399)
  %404 = call float @llvm.exp2.f32(float %402)
  %405 = fmul float %403, %404
  %406 = fcmp olt float %397, -1.050000e+02
  %407 = select i1 %406, float 0.000000e+00, float %405
  %408 = fcmp ogt float %397, 1.050000e+02
  %409 = select i1 %408, float 0x7FF0000000000000, float %407
  %410 = getelementptr inbounds [4 x float], ptr %37, i64 0, i64 %394
  store float %409, ptr %410, align 4
  %411 = fadd reassoc nsz arcp contract float %390, %409, !spirv.Decorations !748
  %412 = add nuw nsw i32 %391, 1, !spirv.Decorations !743
  br label %389

413:                                              ; preds = %389
  %414 = call float @llvm.genx.GenISA.WaveAll.f32(float %390, i8 9, i1 true, i32 0)
  %415 = fcmp reassoc nsz arcp contract oeq float %414, 0.000000e+00, !spirv.Decorations !748
  br i1 %415, label %418, label %416

416:                                              ; preds = %413
  %417 = fdiv reassoc nsz arcp contract float 1.000000e+00, %414, !spirv.Decorations !748
  br label %418

.loopexit5:                                       ; preds = %382
  br label %418

418:                                              ; preds = %.loopexit5, %416, %413
  %419 = phi float [ %414, %416 ], [ %414, %413 ], [ 0.000000e+00, %.loopexit5 ]
  %420 = phi float [ %417, %416 ], [ 0.000000e+00, %413 ], [ 0.000000e+00, %.loopexit5 ]
  br label %421

421:                                              ; preds = %425, %418
  %422 = phi i32 [ 0, %418 ], [ %432, %425 ]
  %423 = icmp ult i32 %422, 4
  br i1 %423, label %425, label %424

424:                                              ; preds = %421
  br i1 %171, label %433, label %438

425:                                              ; preds = %421
  %426 = zext i32 %422 to i64
  %427 = getelementptr inbounds [4 x float], ptr %37, i64 0, i64 %426
  %428 = load float, ptr %427, align 4
  %429 = fmul reassoc nsz arcp contract float %428, %420, !spirv.Decorations !748
  %430 = fptrunc float %429 to half
  %431 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %35, i64 0, i64 %324, i64 %426
  store half %430, ptr %431, align 2
  %432 = add nuw nsw i32 %422, 1, !spirv.Decorations !743
  br label %421

433:                                              ; preds = %424
  %434 = zext i32 %323 to i64
  %435 = add nuw nsw i64 %112, %434, !spirv.Decorations !743
  %436 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %435
  store float %348, ptr addrspace(1) %436, align 4
  %437 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %435
  store float %419, ptr addrspace(1) %437, align 4
  br label %438

438:                                              ; preds = %433, %424
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %37)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %36)
  %439 = add nuw nsw i32 %320, 1, !spirv.Decorations !743
  br label %319, !llvm.loop !788

.loopexit7:                                       ; preds = %319
  br label %440

440:                                              ; preds = %.loopexit7, %312, %310
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %.preheader2, label %463

.preheader2:                                      ; preds = %440
  br label %441

441:                                              ; preds = %451, %.preheader2
  %442 = phi i32 [ %452, %451 ], [ 0, %.preheader2 ]
  %443 = icmp ult i32 %442, 8
  br i1 %443, label %444, label %.loopexit3

444:                                              ; preds = %441
  %445 = zext i32 %442 to i64
  %446 = or i32 %74, %442
  %447 = shl nsw i32 %446, 6, !spirv.Decorations !741
  br label %448

448:                                              ; preds = %453, %444
  %449 = phi i32 [ %462, %453 ], [ 0, %444 ]
  %450 = icmp ult i32 %449, 4
  br i1 %450, label %453, label %451

451:                                              ; preds = %448
  %452 = add nuw nsw i32 %442, 1, !spirv.Decorations !743
  br label %441, !llvm.loop !789

453:                                              ; preds = %448
  %454 = zext i32 %449 to i64
  %455 = shl nuw nsw i32 %449, 4, !spirv.Decorations !743
  %456 = or i32 %447, %455
  %457 = add nuw nsw i32 %456, %simdLaneId, !spirv.Decorations !743
  %458 = zext i32 %457 to i64
  %459 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 %458
  %460 = getelementptr inbounds [8 x [4 x %"class.sycl::_V1::detail::half_impl::half"]], ptr %35, i64 0, i64 %445, i64 %454
  %461 = load half, ptr %460, align 2
  store half %461, ptr addrspace(3) %459, align 2
  %462 = add nuw nsw i32 %449, 1, !spirv.Decorations !743
  br label %448, !llvm.loop !790

.loopexit3:                                       ; preds = %441
  br label %463

463:                                              ; preds = %.loopexit3, %440
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %464, label %563

464:                                              ; preds = %463
  %465 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !741
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 %466
  %468 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %467)
  %469 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 64
  %470 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %469)
  %471 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 128
  %472 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %471)
  %473 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 192
  %474 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %473)
  %475 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 256
  %476 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %475)
  %477 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 320
  %478 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %477)
  %479 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 384
  %480 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %479)
  %481 = getelementptr inbounds i16, ptr addrspace(3) %467, i64 448
  %482 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %481)
  %483 = insertelement <8 x i16> undef, i16 %468, i32 0
  %484 = insertelement <8 x i16> %483, i16 %470, i32 1
  %485 = insertelement <8 x i16> %484, i16 %472, i32 2
  %486 = insertelement <8 x i16> %485, i16 %474, i32 3
  %487 = insertelement <8 x i16> %486, i16 %476, i32 4
  %488 = insertelement <8 x i16> %487, i16 %478, i32 5
  %489 = insertelement <8 x i16> %488, i16 %480, i32 6
  %490 = insertelement <8 x i16> %489, i16 %482, i32 7
  %491 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 16
  %492 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %491)
  %493 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 80
  %494 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %493)
  %495 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 144
  %496 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %495)
  %497 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 208
  %498 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %497)
  %499 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 272
  %500 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %499)
  %501 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 336
  %502 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %501)
  %503 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 400
  %504 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %503)
  %505 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 464
  %506 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %505)
  %507 = insertelement <8 x i16> undef, i16 %492, i32 0
  %508 = insertelement <8 x i16> %507, i16 %494, i32 1
  %509 = insertelement <8 x i16> %508, i16 %496, i32 2
  %510 = insertelement <8 x i16> %509, i16 %498, i32 3
  %511 = insertelement <8 x i16> %510, i16 %500, i32 4
  %512 = insertelement <8 x i16> %511, i16 %502, i32 5
  %513 = insertelement <8 x i16> %512, i16 %504, i32 6
  %514 = insertelement <8 x i16> %513, i16 %506, i32 7
  %515 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 32
  %516 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %515)
  %517 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 96
  %518 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %517)
  %519 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 160
  %520 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %519)
  %521 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 224
  %522 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %521)
  %523 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 288
  %524 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %523)
  %525 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 352
  %526 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %525)
  %527 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 416
  %528 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %527)
  %529 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 480
  %530 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %529)
  %531 = insertelement <8 x i16> undef, i16 %516, i32 0
  %532 = insertelement <8 x i16> %531, i16 %518, i32 1
  %533 = insertelement <8 x i16> %532, i16 %520, i32 2
  %534 = insertelement <8 x i16> %533, i16 %522, i32 3
  %535 = insertelement <8 x i16> %534, i16 %524, i32 4
  %536 = insertelement <8 x i16> %535, i16 %526, i32 5
  %537 = insertelement <8 x i16> %536, i16 %528, i32 6
  %538 = insertelement <8 x i16> %537, i16 %530, i32 7
  %539 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 48
  %540 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %539)
  %541 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 112
  %542 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %541)
  %543 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 176
  %544 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %543)
  %545 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 240
  %546 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %545)
  %547 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 304
  %548 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %547)
  %549 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 368
  %550 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %549)
  %551 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 432
  %552 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %551)
  %553 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %467, i64 496
  %554 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %553)
  %555 = insertelement <8 x i16> undef, i16 %540, i32 0
  %556 = insertelement <8 x i16> %555, i16 %542, i32 1
  %557 = insertelement <8 x i16> %556, i16 %544, i32 2
  %558 = insertelement <8 x i16> %557, i16 %546, i32 3
  %559 = insertelement <8 x i16> %558, i16 %548, i32 4
  %560 = insertelement <8 x i16> %559, i16 %550, i32 5
  %561 = insertelement <8 x i16> %560, i16 %552, i32 6
  %562 = insertelement <8 x i16> %561, i16 %554, i32 7
  br label %563

563:                                              ; preds = %464, %463
  %564 = phi <8 x i16> [ %562, %464 ], [ undef, %463 ]
  %565 = phi <8 x i16> [ %538, %464 ], [ undef, %463 ]
  %566 = phi <8 x i16> [ %514, %464 ], [ undef, %463 ]
  %567 = phi <8 x i16> [ %490, %464 ], [ undef, %463 ]
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  %568 = lshr i32 %38, 1
  %569 = icmp slt i32 %568, %91
  br i1 %569, label %570, label %579

570:                                              ; preds = %563
  %571 = shl nuw nsw i32 %568, 2, !spirv.Decorations !743
  %572 = zext i32 %571 to i64
  %573 = getelementptr float, ptr addrspace(1) %17, i64 %120
  %574 = getelementptr float, ptr addrspace(1) %573, i64 %572
  %575 = load float, ptr addrspace(1) %574, align 4
  %576 = getelementptr float, ptr addrspace(1) %18, i64 %120
  %577 = getelementptr float, ptr addrspace(1) %576, i64 %572
  %578 = load float, ptr addrspace(1) %577, align 4
  br label %579

579:                                              ; preds = %570, %563
  %580 = phi float [ %575, %570 ], [ 0.000000e+00, %563 ]
  %581 = phi float [ %578, %570 ], [ 0.000000e+00, %563 ]
  %582 = and i32 %38, 1
  %583 = shl nuw nsw i32 %568, 6, !spirv.Decorations !741
  %584 = zext i32 %583 to i64
  %585 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 %584
  %586 = shl nuw nsw i32 %582, 5, !spirv.Decorations !743
  %587 = zext i32 %586 to i64
  %588 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %585, i64 %587
  %589 = getelementptr i8, ptr addrspace(1) %19, i64 %117
  %590 = getelementptr i8, ptr addrspace(1) %589, i64 %118
  %591 = shl nuw nsw i32 %568, 9
  %592 = zext i32 %591 to i64
  %593 = getelementptr inbounds i8, ptr addrspace(1) %590, i64 %592
  %594 = shl nuw nsw i32 %582, 4, !spirv.Decorations !743
  %595 = zext i32 %594 to i64
  %596 = getelementptr inbounds i8, ptr addrspace(1) %593, i64 %595
  %597 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !741
  %598 = zext i32 %597 to i64
  %599 = getelementptr inbounds float, ptr addrspace(1) %124, i64 %598
  br label %600

600:                                              ; preds = %1884, %579
  %601 = phi i32 [ 0, %579 ], [ %1881, %1884 ]
  %602 = icmp ult i32 %601, 256
  br i1 %602, label %604, label %603

603:                                              ; preds = %600
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %35)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %34)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %32)
  br label %1885

604:                                              ; preds = %600
  br i1 %569, label %612, label %.preheader

.preheader:                                       ; preds = %604
  br label %605

605:                                              ; preds = %608, %.preheader
  %606 = phi i32 [ %611, %608 ], [ 0, %.preheader ]
  %607 = icmp ult i32 %606, 32
  br i1 %607, label %608, label %.loopexit1

608:                                              ; preds = %605
  %609 = zext i32 %606 to i64
  %610 = getelementptr inbounds half, ptr addrspace(3) %588, i64 %609
  store half 0xH0000, ptr addrspace(3) %610, align 2
  %611 = add nuw nsw i32 %606, 1, !spirv.Decorations !743
  br label %605, !llvm.loop !791

612:                                              ; preds = %604
  %613 = lshr exact i32 %601, 1
  %614 = zext i32 %613 to i64
  %615 = getelementptr inbounds i8, ptr addrspace(1) %596, i64 %614
  br label %616

616:                                              ; preds = %626, %612
  %617 = phi i32 [ 0, %612 ], [ %627, %626 ]
  %618 = icmp ult i32 %617, 16
  br i1 %618, label %619, label %.loopexit

619:                                              ; preds = %616
  %620 = zext i32 %617 to i64
  %621 = getelementptr inbounds i8, ptr addrspace(1) %615, i64 %620
  %622 = load i64, ptr addrspace(1) %621, align 1
  br label %623

623:                                              ; preds = %628, %619
  %624 = phi i32 [ 0, %619 ], [ %649, %628 ]
  %625 = icmp ult i32 %624, 8
  br i1 %625, label %628, label %626

626:                                              ; preds = %623
  %627 = add nuw nsw i32 %617, 8, !spirv.Decorations !743
  br label %616, !llvm.loop !792

628:                                              ; preds = %623
  %629 = shl nuw nsw i32 %624, 3, !spirv.Decorations !743
  %630 = zext i32 %629 to i64
  %631 = lshr i64 %622, %630
  %632 = trunc i64 %631 to i32
  %633 = and i32 %632, 15
  %634 = uitofp i32 %633 to float
  %635 = fsub reassoc nsz arcp contract float %634, %581, !spirv.Decorations !748
  %636 = fmul reassoc nsz arcp contract float %635, %580, !spirv.Decorations !748
  %637 = fptrunc float %636 to half
  %638 = or i32 %617, %624
  %639 = shl nuw nsw i32 %638, 1, !spirv.Decorations !743
  %640 = zext i32 %639 to i64
  %641 = getelementptr half, ptr addrspace(3) %588, i64 %640
  store half %637, ptr addrspace(3) %641, align 4
  %642 = lshr i32 %632, 4
  %643 = and i32 %642, 15
  %644 = uitofp i32 %643 to float
  %645 = fsub reassoc nsz arcp contract float %644, %581, !spirv.Decorations !748
  %646 = fmul reassoc nsz arcp contract float %645, %580, !spirv.Decorations !748
  %647 = fptrunc float %646 to half
  %648 = getelementptr half, ptr addrspace(3) %641, i64 1
  store half %647, ptr addrspace(3) %648, align 2
  %649 = add nuw nsw i32 %624, 1, !spirv.Decorations !743
  br label %623, !llvm.loop !793

.loopexit:                                        ; preds = %616
  br label %650

.loopexit1:                                       ; preds = %605
  br label %650

650:                                              ; preds = %.loopexit1, %.loopexit
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %77, label %651, label %1880

651:                                              ; preds = %650
  %652 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM)
  %653 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 128
  %654 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %653)
  %655 = insertelement <2 x i16> undef, i16 %652, i32 0
  %656 = insertelement <2 x i16> %655, i16 %654, i32 1
  %657 = bitcast <2 x i16> %656 to i32
  %658 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 256
  %659 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %658)
  %660 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 384
  %661 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %660)
  %662 = insertelement <2 x i16> undef, i16 %659, i32 0
  %663 = insertelement <2 x i16> %662, i16 %661, i32 1
  %664 = bitcast <2 x i16> %663 to i32
  %665 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 512
  %666 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %665)
  %667 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 640
  %668 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %667)
  %669 = insertelement <2 x i16> undef, i16 %666, i32 0
  %670 = insertelement <2 x i16> %669, i16 %668, i32 1
  %671 = bitcast <2 x i16> %670 to i32
  %672 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 768
  %673 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %672)
  %674 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 896
  %675 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %674)
  %676 = insertelement <2 x i16> undef, i16 %673, i32 0
  %677 = insertelement <2 x i16> %676, i16 %675, i32 1
  %678 = bitcast <2 x i16> %677 to i32
  %679 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1024
  %680 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %679)
  %681 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1152
  %682 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %681)
  %683 = insertelement <2 x i16> undef, i16 %680, i32 0
  %684 = insertelement <2 x i16> %683, i16 %682, i32 1
  %685 = bitcast <2 x i16> %684 to i32
  %686 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1280
  %687 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %686)
  %688 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1408
  %689 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %688)
  %690 = insertelement <2 x i16> undef, i16 %687, i32 0
  %691 = insertelement <2 x i16> %690, i16 %689, i32 1
  %692 = bitcast <2 x i16> %691 to i32
  %693 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1536
  %694 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %693)
  %695 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1664
  %696 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %695)
  %697 = insertelement <2 x i16> undef, i16 %694, i32 0
  %698 = insertelement <2 x i16> %697, i16 %696, i32 1
  %699 = bitcast <2 x i16> %698 to i32
  %700 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1792
  %701 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %700)
  %702 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1920
  %703 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %702)
  %704 = insertelement <2 x i16> undef, i16 %701, i32 0
  %705 = insertelement <2 x i16> %704, i16 %703, i32 1
  %706 = bitcast <2 x i16> %705 to i32
  %707 = insertelement <8 x i32> undef, i32 %657, i32 0
  %708 = insertelement <8 x i32> %707, i32 %664, i32 1
  %709 = insertelement <8 x i32> %708, i32 %671, i32 2
  %710 = insertelement <8 x i32> %709, i32 %678, i32 3
  %711 = insertelement <8 x i32> %710, i32 %685, i32 4
  %712 = insertelement <8 x i32> %711, i32 %692, i32 5
  %713 = insertelement <8 x i32> %712, i32 %699, i32 6
  %714 = insertelement <8 x i32> %713, i32 %706, i32 7
  %715 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %567, <8 x i32> %714, i32 12, i32 12, i32 8, i32 8, i1 false)
  %716 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 32
  %717 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %716)
  %718 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 160
  %719 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %718)
  %720 = insertelement <2 x i16> undef, i16 %717, i32 0
  %721 = insertelement <2 x i16> %720, i16 %719, i32 1
  %722 = bitcast <2 x i16> %721 to i32
  %723 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 288
  %724 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %723)
  %725 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 416
  %726 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %725)
  %727 = insertelement <2 x i16> undef, i16 %724, i32 0
  %728 = insertelement <2 x i16> %727, i16 %726, i32 1
  %729 = bitcast <2 x i16> %728 to i32
  %730 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 544
  %731 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %730)
  %732 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 672
  %733 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %732)
  %734 = insertelement <2 x i16> undef, i16 %731, i32 0
  %735 = insertelement <2 x i16> %734, i16 %733, i32 1
  %736 = bitcast <2 x i16> %735 to i32
  %737 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 800
  %738 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %737)
  %739 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 928
  %740 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %739)
  %741 = insertelement <2 x i16> undef, i16 %738, i32 0
  %742 = insertelement <2 x i16> %741, i16 %740, i32 1
  %743 = bitcast <2 x i16> %742 to i32
  %744 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1056
  %745 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %744)
  %746 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1184
  %747 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %746)
  %748 = insertelement <2 x i16> undef, i16 %745, i32 0
  %749 = insertelement <2 x i16> %748, i16 %747, i32 1
  %750 = bitcast <2 x i16> %749 to i32
  %751 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1312
  %752 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %751)
  %753 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1440
  %754 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %753)
  %755 = insertelement <2 x i16> undef, i16 %752, i32 0
  %756 = insertelement <2 x i16> %755, i16 %754, i32 1
  %757 = bitcast <2 x i16> %756 to i32
  %758 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1568
  %759 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %758)
  %760 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1696
  %761 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %760)
  %762 = insertelement <2 x i16> undef, i16 %759, i32 0
  %763 = insertelement <2 x i16> %762, i16 %761, i32 1
  %764 = bitcast <2 x i16> %763 to i32
  %765 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1824
  %766 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %765)
  %767 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1952
  %768 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %767)
  %769 = insertelement <2 x i16> undef, i16 %766, i32 0
  %770 = insertelement <2 x i16> %769, i16 %768, i32 1
  %771 = bitcast <2 x i16> %770 to i32
  %772 = insertelement <8 x i32> undef, i32 %722, i32 0
  %773 = insertelement <8 x i32> %772, i32 %729, i32 1
  %774 = insertelement <8 x i32> %773, i32 %736, i32 2
  %775 = insertelement <8 x i32> %774, i32 %743, i32 3
  %776 = insertelement <8 x i32> %775, i32 %750, i32 4
  %777 = insertelement <8 x i32> %776, i32 %757, i32 5
  %778 = insertelement <8 x i32> %777, i32 %764, i32 6
  %779 = insertelement <8 x i32> %778, i32 %771, i32 7
  %780 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %567, <8 x i32> %779, i32 12, i32 12, i32 8, i32 8, i1 false)
  %781 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 64
  %782 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %781)
  %783 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 192
  %784 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %783)
  %785 = insertelement <2 x i16> undef, i16 %782, i32 0
  %786 = insertelement <2 x i16> %785, i16 %784, i32 1
  %787 = bitcast <2 x i16> %786 to i32
  %788 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 320
  %789 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %788)
  %790 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 448
  %791 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %790)
  %792 = insertelement <2 x i16> undef, i16 %789, i32 0
  %793 = insertelement <2 x i16> %792, i16 %791, i32 1
  %794 = bitcast <2 x i16> %793 to i32
  %795 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 576
  %796 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %795)
  %797 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 704
  %798 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %797)
  %799 = insertelement <2 x i16> undef, i16 %796, i32 0
  %800 = insertelement <2 x i16> %799, i16 %798, i32 1
  %801 = bitcast <2 x i16> %800 to i32
  %802 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 832
  %803 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %802)
  %804 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 960
  %805 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %804)
  %806 = insertelement <2 x i16> undef, i16 %803, i32 0
  %807 = insertelement <2 x i16> %806, i16 %805, i32 1
  %808 = bitcast <2 x i16> %807 to i32
  %809 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1088
  %810 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %809)
  %811 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1216
  %812 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %811)
  %813 = insertelement <2 x i16> undef, i16 %810, i32 0
  %814 = insertelement <2 x i16> %813, i16 %812, i32 1
  %815 = bitcast <2 x i16> %814 to i32
  %816 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1344
  %817 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %816)
  %818 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1472
  %819 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %818)
  %820 = insertelement <2 x i16> undef, i16 %817, i32 0
  %821 = insertelement <2 x i16> %820, i16 %819, i32 1
  %822 = bitcast <2 x i16> %821 to i32
  %823 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1600
  %824 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %823)
  %825 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1728
  %826 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %825)
  %827 = insertelement <2 x i16> undef, i16 %824, i32 0
  %828 = insertelement <2 x i16> %827, i16 %826, i32 1
  %829 = bitcast <2 x i16> %828 to i32
  %830 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1856
  %831 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %830)
  %832 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1984
  %833 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %832)
  %834 = insertelement <2 x i16> undef, i16 %831, i32 0
  %835 = insertelement <2 x i16> %834, i16 %833, i32 1
  %836 = bitcast <2 x i16> %835 to i32
  %837 = insertelement <8 x i32> undef, i32 %787, i32 0
  %838 = insertelement <8 x i32> %837, i32 %794, i32 1
  %839 = insertelement <8 x i32> %838, i32 %801, i32 2
  %840 = insertelement <8 x i32> %839, i32 %808, i32 3
  %841 = insertelement <8 x i32> %840, i32 %815, i32 4
  %842 = insertelement <8 x i32> %841, i32 %822, i32 5
  %843 = insertelement <8 x i32> %842, i32 %829, i32 6
  %844 = insertelement <8 x i32> %843, i32 %836, i32 7
  %845 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %567, <8 x i32> %844, i32 12, i32 12, i32 8, i32 8, i1 false)
  %846 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 96
  %847 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %846)
  %848 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 224
  %849 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %848)
  %850 = insertelement <2 x i16> undef, i16 %847, i32 0
  %851 = insertelement <2 x i16> %850, i16 %849, i32 1
  %852 = bitcast <2 x i16> %851 to i32
  %853 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 352
  %854 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %853)
  %855 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 480
  %856 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %855)
  %857 = insertelement <2 x i16> undef, i16 %854, i32 0
  %858 = insertelement <2 x i16> %857, i16 %856, i32 1
  %859 = bitcast <2 x i16> %858 to i32
  %860 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 608
  %861 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %860)
  %862 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 736
  %863 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %862)
  %864 = insertelement <2 x i16> undef, i16 %861, i32 0
  %865 = insertelement <2 x i16> %864, i16 %863, i32 1
  %866 = bitcast <2 x i16> %865 to i32
  %867 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 864
  %868 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %867)
  %869 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 992
  %870 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %869)
  %871 = insertelement <2 x i16> undef, i16 %868, i32 0
  %872 = insertelement <2 x i16> %871, i16 %870, i32 1
  %873 = bitcast <2 x i16> %872 to i32
  %874 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1120
  %875 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %874)
  %876 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1248
  %877 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %876)
  %878 = insertelement <2 x i16> undef, i16 %875, i32 0
  %879 = insertelement <2 x i16> %878, i16 %877, i32 1
  %880 = bitcast <2 x i16> %879 to i32
  %881 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1376
  %882 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %881)
  %883 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1504
  %884 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %883)
  %885 = insertelement <2 x i16> undef, i16 %882, i32 0
  %886 = insertelement <2 x i16> %885, i16 %884, i32 1
  %887 = bitcast <2 x i16> %886 to i32
  %888 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1632
  %889 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %888)
  %890 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1760
  %891 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %890)
  %892 = insertelement <2 x i16> undef, i16 %889, i32 0
  %893 = insertelement <2 x i16> %892, i16 %891, i32 1
  %894 = bitcast <2 x i16> %893 to i32
  %895 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 1888
  %896 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %895)
  %897 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2016
  %898 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %897)
  %899 = insertelement <2 x i16> undef, i16 %896, i32 0
  %900 = insertelement <2 x i16> %899, i16 %898, i32 1
  %901 = bitcast <2 x i16> %900 to i32
  %902 = insertelement <8 x i32> undef, i32 %852, i32 0
  %903 = insertelement <8 x i32> %902, i32 %859, i32 1
  %904 = insertelement <8 x i32> %903, i32 %866, i32 2
  %905 = insertelement <8 x i32> %904, i32 %873, i32 3
  %906 = insertelement <8 x i32> %905, i32 %880, i32 4
  %907 = insertelement <8 x i32> %906, i32 %887, i32 5
  %908 = insertelement <8 x i32> %907, i32 %894, i32 6
  %909 = insertelement <8 x i32> %908, i32 %901, i32 7
  %910 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> zeroinitializer, <8 x i16> %567, <8 x i32> %909, i32 12, i32 12, i32 8, i32 8, i1 false)
  %911 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2048
  %912 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %911)
  %913 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2176
  %914 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %913)
  %915 = insertelement <2 x i16> undef, i16 %912, i32 0
  %916 = insertelement <2 x i16> %915, i16 %914, i32 1
  %917 = bitcast <2 x i16> %916 to i32
  %918 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2304
  %919 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %918)
  %920 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2432
  %921 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %920)
  %922 = insertelement <2 x i16> undef, i16 %919, i32 0
  %923 = insertelement <2 x i16> %922, i16 %921, i32 1
  %924 = bitcast <2 x i16> %923 to i32
  %925 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2560
  %926 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %925)
  %927 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2688
  %928 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %927)
  %929 = insertelement <2 x i16> undef, i16 %926, i32 0
  %930 = insertelement <2 x i16> %929, i16 %928, i32 1
  %931 = bitcast <2 x i16> %930 to i32
  %932 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2816
  %933 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %932)
  %934 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2944
  %935 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %934)
  %936 = insertelement <2 x i16> undef, i16 %933, i32 0
  %937 = insertelement <2 x i16> %936, i16 %935, i32 1
  %938 = bitcast <2 x i16> %937 to i32
  %939 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3072
  %940 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %939)
  %941 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3200
  %942 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %941)
  %943 = insertelement <2 x i16> undef, i16 %940, i32 0
  %944 = insertelement <2 x i16> %943, i16 %942, i32 1
  %945 = bitcast <2 x i16> %944 to i32
  %946 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3328
  %947 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %946)
  %948 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3456
  %949 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %948)
  %950 = insertelement <2 x i16> undef, i16 %947, i32 0
  %951 = insertelement <2 x i16> %950, i16 %949, i32 1
  %952 = bitcast <2 x i16> %951 to i32
  %953 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3584
  %954 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %953)
  %955 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3712
  %956 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %955)
  %957 = insertelement <2 x i16> undef, i16 %954, i32 0
  %958 = insertelement <2 x i16> %957, i16 %956, i32 1
  %959 = bitcast <2 x i16> %958 to i32
  %960 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3840
  %961 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %960)
  %962 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3968
  %963 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %962)
  %964 = insertelement <2 x i16> undef, i16 %961, i32 0
  %965 = insertelement <2 x i16> %964, i16 %963, i32 1
  %966 = bitcast <2 x i16> %965 to i32
  %967 = insertelement <8 x i32> undef, i32 %917, i32 0
  %968 = insertelement <8 x i32> %967, i32 %924, i32 1
  %969 = insertelement <8 x i32> %968, i32 %931, i32 2
  %970 = insertelement <8 x i32> %969, i32 %938, i32 3
  %971 = insertelement <8 x i32> %970, i32 %945, i32 4
  %972 = insertelement <8 x i32> %971, i32 %952, i32 5
  %973 = insertelement <8 x i32> %972, i32 %959, i32 6
  %974 = insertelement <8 x i32> %973, i32 %966, i32 7
  %975 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %715, <8 x i16> %566, <8 x i32> %974, i32 12, i32 12, i32 8, i32 8, i1 false)
  %976 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2080
  %977 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %976)
  %978 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2208
  %979 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %978)
  %980 = insertelement <2 x i16> undef, i16 %977, i32 0
  %981 = insertelement <2 x i16> %980, i16 %979, i32 1
  %982 = bitcast <2 x i16> %981 to i32
  %983 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2336
  %984 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %983)
  %985 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2464
  %986 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %985)
  %987 = insertelement <2 x i16> undef, i16 %984, i32 0
  %988 = insertelement <2 x i16> %987, i16 %986, i32 1
  %989 = bitcast <2 x i16> %988 to i32
  %990 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2592
  %991 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %990)
  %992 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2720
  %993 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %992)
  %994 = insertelement <2 x i16> undef, i16 %991, i32 0
  %995 = insertelement <2 x i16> %994, i16 %993, i32 1
  %996 = bitcast <2 x i16> %995 to i32
  %997 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2848
  %998 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %997)
  %999 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2976
  %1000 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %999)
  %1001 = insertelement <2 x i16> undef, i16 %998, i32 0
  %1002 = insertelement <2 x i16> %1001, i16 %1000, i32 1
  %1003 = bitcast <2 x i16> %1002 to i32
  %1004 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3104
  %1005 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1004)
  %1006 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3232
  %1007 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1006)
  %1008 = insertelement <2 x i16> undef, i16 %1005, i32 0
  %1009 = insertelement <2 x i16> %1008, i16 %1007, i32 1
  %1010 = bitcast <2 x i16> %1009 to i32
  %1011 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3360
  %1012 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1011)
  %1013 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3488
  %1014 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1013)
  %1015 = insertelement <2 x i16> undef, i16 %1012, i32 0
  %1016 = insertelement <2 x i16> %1015, i16 %1014, i32 1
  %1017 = bitcast <2 x i16> %1016 to i32
  %1018 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3616
  %1019 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1018)
  %1020 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3744
  %1021 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1020)
  %1022 = insertelement <2 x i16> undef, i16 %1019, i32 0
  %1023 = insertelement <2 x i16> %1022, i16 %1021, i32 1
  %1024 = bitcast <2 x i16> %1023 to i32
  %1025 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3872
  %1026 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1025)
  %1027 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4000
  %1028 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1027)
  %1029 = insertelement <2 x i16> undef, i16 %1026, i32 0
  %1030 = insertelement <2 x i16> %1029, i16 %1028, i32 1
  %1031 = bitcast <2 x i16> %1030 to i32
  %1032 = insertelement <8 x i32> undef, i32 %982, i32 0
  %1033 = insertelement <8 x i32> %1032, i32 %989, i32 1
  %1034 = insertelement <8 x i32> %1033, i32 %996, i32 2
  %1035 = insertelement <8 x i32> %1034, i32 %1003, i32 3
  %1036 = insertelement <8 x i32> %1035, i32 %1010, i32 4
  %1037 = insertelement <8 x i32> %1036, i32 %1017, i32 5
  %1038 = insertelement <8 x i32> %1037, i32 %1024, i32 6
  %1039 = insertelement <8 x i32> %1038, i32 %1031, i32 7
  %1040 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %780, <8 x i16> %566, <8 x i32> %1039, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1041 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2112
  %1042 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1041)
  %1043 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2240
  %1044 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1043)
  %1045 = insertelement <2 x i16> undef, i16 %1042, i32 0
  %1046 = insertelement <2 x i16> %1045, i16 %1044, i32 1
  %1047 = bitcast <2 x i16> %1046 to i32
  %1048 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2368
  %1049 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1048)
  %1050 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2496
  %1051 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1050)
  %1052 = insertelement <2 x i16> undef, i16 %1049, i32 0
  %1053 = insertelement <2 x i16> %1052, i16 %1051, i32 1
  %1054 = bitcast <2 x i16> %1053 to i32
  %1055 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2624
  %1056 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1055)
  %1057 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2752
  %1058 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1057)
  %1059 = insertelement <2 x i16> undef, i16 %1056, i32 0
  %1060 = insertelement <2 x i16> %1059, i16 %1058, i32 1
  %1061 = bitcast <2 x i16> %1060 to i32
  %1062 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2880
  %1063 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1062)
  %1064 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3008
  %1065 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1064)
  %1066 = insertelement <2 x i16> undef, i16 %1063, i32 0
  %1067 = insertelement <2 x i16> %1066, i16 %1065, i32 1
  %1068 = bitcast <2 x i16> %1067 to i32
  %1069 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3136
  %1070 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1069)
  %1071 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3264
  %1072 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1071)
  %1073 = insertelement <2 x i16> undef, i16 %1070, i32 0
  %1074 = insertelement <2 x i16> %1073, i16 %1072, i32 1
  %1075 = bitcast <2 x i16> %1074 to i32
  %1076 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3392
  %1077 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1076)
  %1078 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3520
  %1079 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1078)
  %1080 = insertelement <2 x i16> undef, i16 %1077, i32 0
  %1081 = insertelement <2 x i16> %1080, i16 %1079, i32 1
  %1082 = bitcast <2 x i16> %1081 to i32
  %1083 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3648
  %1084 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1083)
  %1085 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3776
  %1086 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1085)
  %1087 = insertelement <2 x i16> undef, i16 %1084, i32 0
  %1088 = insertelement <2 x i16> %1087, i16 %1086, i32 1
  %1089 = bitcast <2 x i16> %1088 to i32
  %1090 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3904
  %1091 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1090)
  %1092 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4032
  %1093 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1092)
  %1094 = insertelement <2 x i16> undef, i16 %1091, i32 0
  %1095 = insertelement <2 x i16> %1094, i16 %1093, i32 1
  %1096 = bitcast <2 x i16> %1095 to i32
  %1097 = insertelement <8 x i32> undef, i32 %1047, i32 0
  %1098 = insertelement <8 x i32> %1097, i32 %1054, i32 1
  %1099 = insertelement <8 x i32> %1098, i32 %1061, i32 2
  %1100 = insertelement <8 x i32> %1099, i32 %1068, i32 3
  %1101 = insertelement <8 x i32> %1100, i32 %1075, i32 4
  %1102 = insertelement <8 x i32> %1101, i32 %1082, i32 5
  %1103 = insertelement <8 x i32> %1102, i32 %1089, i32 6
  %1104 = insertelement <8 x i32> %1103, i32 %1096, i32 7
  %1105 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %845, <8 x i16> %566, <8 x i32> %1104, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1106 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2144
  %1107 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1106)
  %1108 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2272
  %1109 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1108)
  %1110 = insertelement <2 x i16> undef, i16 %1107, i32 0
  %1111 = insertelement <2 x i16> %1110, i16 %1109, i32 1
  %1112 = bitcast <2 x i16> %1111 to i32
  %1113 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2400
  %1114 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1113)
  %1115 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2528
  %1116 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1115)
  %1117 = insertelement <2 x i16> undef, i16 %1114, i32 0
  %1118 = insertelement <2 x i16> %1117, i16 %1116, i32 1
  %1119 = bitcast <2 x i16> %1118 to i32
  %1120 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2656
  %1121 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1120)
  %1122 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2784
  %1123 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1122)
  %1124 = insertelement <2 x i16> undef, i16 %1121, i32 0
  %1125 = insertelement <2 x i16> %1124, i16 %1123, i32 1
  %1126 = bitcast <2 x i16> %1125 to i32
  %1127 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 2912
  %1128 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1127)
  %1129 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3040
  %1130 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1129)
  %1131 = insertelement <2 x i16> undef, i16 %1128, i32 0
  %1132 = insertelement <2 x i16> %1131, i16 %1130, i32 1
  %1133 = bitcast <2 x i16> %1132 to i32
  %1134 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3168
  %1135 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1134)
  %1136 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3296
  %1137 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1136)
  %1138 = insertelement <2 x i16> undef, i16 %1135, i32 0
  %1139 = insertelement <2 x i16> %1138, i16 %1137, i32 1
  %1140 = bitcast <2 x i16> %1139 to i32
  %1141 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3424
  %1142 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1141)
  %1143 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3552
  %1144 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1143)
  %1145 = insertelement <2 x i16> undef, i16 %1142, i32 0
  %1146 = insertelement <2 x i16> %1145, i16 %1144, i32 1
  %1147 = bitcast <2 x i16> %1146 to i32
  %1148 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3680
  %1149 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1148)
  %1150 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3808
  %1151 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1150)
  %1152 = insertelement <2 x i16> undef, i16 %1149, i32 0
  %1153 = insertelement <2 x i16> %1152, i16 %1151, i32 1
  %1154 = bitcast <2 x i16> %1153 to i32
  %1155 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 3936
  %1156 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1155)
  %1157 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4064
  %1158 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1157)
  %1159 = insertelement <2 x i16> undef, i16 %1156, i32 0
  %1160 = insertelement <2 x i16> %1159, i16 %1158, i32 1
  %1161 = bitcast <2 x i16> %1160 to i32
  %1162 = insertelement <8 x i32> undef, i32 %1112, i32 0
  %1163 = insertelement <8 x i32> %1162, i32 %1119, i32 1
  %1164 = insertelement <8 x i32> %1163, i32 %1126, i32 2
  %1165 = insertelement <8 x i32> %1164, i32 %1133, i32 3
  %1166 = insertelement <8 x i32> %1165, i32 %1140, i32 4
  %1167 = insertelement <8 x i32> %1166, i32 %1147, i32 5
  %1168 = insertelement <8 x i32> %1167, i32 %1154, i32 6
  %1169 = insertelement <8 x i32> %1168, i32 %1161, i32 7
  %1170 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %910, <8 x i16> %566, <8 x i32> %1169, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1171 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4096
  %1172 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1171)
  %1173 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4224
  %1174 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1173)
  %1175 = insertelement <2 x i16> undef, i16 %1172, i32 0
  %1176 = insertelement <2 x i16> %1175, i16 %1174, i32 1
  %1177 = bitcast <2 x i16> %1176 to i32
  %1178 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4352
  %1179 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1178)
  %1180 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4480
  %1181 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1180)
  %1182 = insertelement <2 x i16> undef, i16 %1179, i32 0
  %1183 = insertelement <2 x i16> %1182, i16 %1181, i32 1
  %1184 = bitcast <2 x i16> %1183 to i32
  %1185 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4608
  %1186 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1185)
  %1187 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4736
  %1188 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1187)
  %1189 = insertelement <2 x i16> undef, i16 %1186, i32 0
  %1190 = insertelement <2 x i16> %1189, i16 %1188, i32 1
  %1191 = bitcast <2 x i16> %1190 to i32
  %1192 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4864
  %1193 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1192)
  %1194 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4992
  %1195 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1194)
  %1196 = insertelement <2 x i16> undef, i16 %1193, i32 0
  %1197 = insertelement <2 x i16> %1196, i16 %1195, i32 1
  %1198 = bitcast <2 x i16> %1197 to i32
  %1199 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5120
  %1200 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1199)
  %1201 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5248
  %1202 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1201)
  %1203 = insertelement <2 x i16> undef, i16 %1200, i32 0
  %1204 = insertelement <2 x i16> %1203, i16 %1202, i32 1
  %1205 = bitcast <2 x i16> %1204 to i32
  %1206 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5376
  %1207 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1206)
  %1208 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5504
  %1209 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1208)
  %1210 = insertelement <2 x i16> undef, i16 %1207, i32 0
  %1211 = insertelement <2 x i16> %1210, i16 %1209, i32 1
  %1212 = bitcast <2 x i16> %1211 to i32
  %1213 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5632
  %1214 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1213)
  %1215 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5760
  %1216 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1215)
  %1217 = insertelement <2 x i16> undef, i16 %1214, i32 0
  %1218 = insertelement <2 x i16> %1217, i16 %1216, i32 1
  %1219 = bitcast <2 x i16> %1218 to i32
  %1220 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5888
  %1221 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1220)
  %1222 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6016
  %1223 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1222)
  %1224 = insertelement <2 x i16> undef, i16 %1221, i32 0
  %1225 = insertelement <2 x i16> %1224, i16 %1223, i32 1
  %1226 = bitcast <2 x i16> %1225 to i32
  %1227 = insertelement <8 x i32> undef, i32 %1177, i32 0
  %1228 = insertelement <8 x i32> %1227, i32 %1184, i32 1
  %1229 = insertelement <8 x i32> %1228, i32 %1191, i32 2
  %1230 = insertelement <8 x i32> %1229, i32 %1198, i32 3
  %1231 = insertelement <8 x i32> %1230, i32 %1205, i32 4
  %1232 = insertelement <8 x i32> %1231, i32 %1212, i32 5
  %1233 = insertelement <8 x i32> %1232, i32 %1219, i32 6
  %1234 = insertelement <8 x i32> %1233, i32 %1226, i32 7
  %1235 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %975, <8 x i16> %565, <8 x i32> %1234, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1236 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4128
  %1237 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1236)
  %1238 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4256
  %1239 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1238)
  %1240 = insertelement <2 x i16> undef, i16 %1237, i32 0
  %1241 = insertelement <2 x i16> %1240, i16 %1239, i32 1
  %1242 = bitcast <2 x i16> %1241 to i32
  %1243 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4384
  %1244 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1243)
  %1245 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4512
  %1246 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1245)
  %1247 = insertelement <2 x i16> undef, i16 %1244, i32 0
  %1248 = insertelement <2 x i16> %1247, i16 %1246, i32 1
  %1249 = bitcast <2 x i16> %1248 to i32
  %1250 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4640
  %1251 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1250)
  %1252 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4768
  %1253 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1252)
  %1254 = insertelement <2 x i16> undef, i16 %1251, i32 0
  %1255 = insertelement <2 x i16> %1254, i16 %1253, i32 1
  %1256 = bitcast <2 x i16> %1255 to i32
  %1257 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4896
  %1258 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1257)
  %1259 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5024
  %1260 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1259)
  %1261 = insertelement <2 x i16> undef, i16 %1258, i32 0
  %1262 = insertelement <2 x i16> %1261, i16 %1260, i32 1
  %1263 = bitcast <2 x i16> %1262 to i32
  %1264 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5152
  %1265 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1264)
  %1266 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5280
  %1267 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1266)
  %1268 = insertelement <2 x i16> undef, i16 %1265, i32 0
  %1269 = insertelement <2 x i16> %1268, i16 %1267, i32 1
  %1270 = bitcast <2 x i16> %1269 to i32
  %1271 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5408
  %1272 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1271)
  %1273 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5536
  %1274 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1273)
  %1275 = insertelement <2 x i16> undef, i16 %1272, i32 0
  %1276 = insertelement <2 x i16> %1275, i16 %1274, i32 1
  %1277 = bitcast <2 x i16> %1276 to i32
  %1278 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5664
  %1279 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1278)
  %1280 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5792
  %1281 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1280)
  %1282 = insertelement <2 x i16> undef, i16 %1279, i32 0
  %1283 = insertelement <2 x i16> %1282, i16 %1281, i32 1
  %1284 = bitcast <2 x i16> %1283 to i32
  %1285 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5920
  %1286 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1285)
  %1287 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6048
  %1288 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1287)
  %1289 = insertelement <2 x i16> undef, i16 %1286, i32 0
  %1290 = insertelement <2 x i16> %1289, i16 %1288, i32 1
  %1291 = bitcast <2 x i16> %1290 to i32
  %1292 = insertelement <8 x i32> undef, i32 %1242, i32 0
  %1293 = insertelement <8 x i32> %1292, i32 %1249, i32 1
  %1294 = insertelement <8 x i32> %1293, i32 %1256, i32 2
  %1295 = insertelement <8 x i32> %1294, i32 %1263, i32 3
  %1296 = insertelement <8 x i32> %1295, i32 %1270, i32 4
  %1297 = insertelement <8 x i32> %1296, i32 %1277, i32 5
  %1298 = insertelement <8 x i32> %1297, i32 %1284, i32 6
  %1299 = insertelement <8 x i32> %1298, i32 %1291, i32 7
  %1300 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1040, <8 x i16> %565, <8 x i32> %1299, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1301 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4160
  %1302 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1301)
  %1303 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4288
  %1304 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1303)
  %1305 = insertelement <2 x i16> undef, i16 %1302, i32 0
  %1306 = insertelement <2 x i16> %1305, i16 %1304, i32 1
  %1307 = bitcast <2 x i16> %1306 to i32
  %1308 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4416
  %1309 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1308)
  %1310 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4544
  %1311 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1310)
  %1312 = insertelement <2 x i16> undef, i16 %1309, i32 0
  %1313 = insertelement <2 x i16> %1312, i16 %1311, i32 1
  %1314 = bitcast <2 x i16> %1313 to i32
  %1315 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4672
  %1316 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1315)
  %1317 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4800
  %1318 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1317)
  %1319 = insertelement <2 x i16> undef, i16 %1316, i32 0
  %1320 = insertelement <2 x i16> %1319, i16 %1318, i32 1
  %1321 = bitcast <2 x i16> %1320 to i32
  %1322 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4928
  %1323 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1322)
  %1324 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5056
  %1325 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1324)
  %1326 = insertelement <2 x i16> undef, i16 %1323, i32 0
  %1327 = insertelement <2 x i16> %1326, i16 %1325, i32 1
  %1328 = bitcast <2 x i16> %1327 to i32
  %1329 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5184
  %1330 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1329)
  %1331 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5312
  %1332 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1331)
  %1333 = insertelement <2 x i16> undef, i16 %1330, i32 0
  %1334 = insertelement <2 x i16> %1333, i16 %1332, i32 1
  %1335 = bitcast <2 x i16> %1334 to i32
  %1336 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5440
  %1337 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1336)
  %1338 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5568
  %1339 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1338)
  %1340 = insertelement <2 x i16> undef, i16 %1337, i32 0
  %1341 = insertelement <2 x i16> %1340, i16 %1339, i32 1
  %1342 = bitcast <2 x i16> %1341 to i32
  %1343 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5696
  %1344 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1343)
  %1345 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5824
  %1346 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1345)
  %1347 = insertelement <2 x i16> undef, i16 %1344, i32 0
  %1348 = insertelement <2 x i16> %1347, i16 %1346, i32 1
  %1349 = bitcast <2 x i16> %1348 to i32
  %1350 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5952
  %1351 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1350)
  %1352 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6080
  %1353 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1352)
  %1354 = insertelement <2 x i16> undef, i16 %1351, i32 0
  %1355 = insertelement <2 x i16> %1354, i16 %1353, i32 1
  %1356 = bitcast <2 x i16> %1355 to i32
  %1357 = insertelement <8 x i32> undef, i32 %1307, i32 0
  %1358 = insertelement <8 x i32> %1357, i32 %1314, i32 1
  %1359 = insertelement <8 x i32> %1358, i32 %1321, i32 2
  %1360 = insertelement <8 x i32> %1359, i32 %1328, i32 3
  %1361 = insertelement <8 x i32> %1360, i32 %1335, i32 4
  %1362 = insertelement <8 x i32> %1361, i32 %1342, i32 5
  %1363 = insertelement <8 x i32> %1362, i32 %1349, i32 6
  %1364 = insertelement <8 x i32> %1363, i32 %1356, i32 7
  %1365 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1105, <8 x i16> %565, <8 x i32> %1364, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1366 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4192
  %1367 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1366)
  %1368 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4320
  %1369 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1368)
  %1370 = insertelement <2 x i16> undef, i16 %1367, i32 0
  %1371 = insertelement <2 x i16> %1370, i16 %1369, i32 1
  %1372 = bitcast <2 x i16> %1371 to i32
  %1373 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4448
  %1374 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1373)
  %1375 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4576
  %1376 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1375)
  %1377 = insertelement <2 x i16> undef, i16 %1374, i32 0
  %1378 = insertelement <2 x i16> %1377, i16 %1376, i32 1
  %1379 = bitcast <2 x i16> %1378 to i32
  %1380 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4704
  %1381 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1380)
  %1382 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4832
  %1383 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1382)
  %1384 = insertelement <2 x i16> undef, i16 %1381, i32 0
  %1385 = insertelement <2 x i16> %1384, i16 %1383, i32 1
  %1386 = bitcast <2 x i16> %1385 to i32
  %1387 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 4960
  %1388 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1387)
  %1389 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5088
  %1390 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1389)
  %1391 = insertelement <2 x i16> undef, i16 %1388, i32 0
  %1392 = insertelement <2 x i16> %1391, i16 %1390, i32 1
  %1393 = bitcast <2 x i16> %1392 to i32
  %1394 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5216
  %1395 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1394)
  %1396 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5344
  %1397 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1396)
  %1398 = insertelement <2 x i16> undef, i16 %1395, i32 0
  %1399 = insertelement <2 x i16> %1398, i16 %1397, i32 1
  %1400 = bitcast <2 x i16> %1399 to i32
  %1401 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5472
  %1402 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1401)
  %1403 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5600
  %1404 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1403)
  %1405 = insertelement <2 x i16> undef, i16 %1402, i32 0
  %1406 = insertelement <2 x i16> %1405, i16 %1404, i32 1
  %1407 = bitcast <2 x i16> %1406 to i32
  %1408 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5728
  %1409 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1408)
  %1410 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5856
  %1411 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1410)
  %1412 = insertelement <2 x i16> undef, i16 %1409, i32 0
  %1413 = insertelement <2 x i16> %1412, i16 %1411, i32 1
  %1414 = bitcast <2 x i16> %1413 to i32
  %1415 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 5984
  %1416 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1415)
  %1417 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6112
  %1418 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1417)
  %1419 = insertelement <2 x i16> undef, i16 %1416, i32 0
  %1420 = insertelement <2 x i16> %1419, i16 %1418, i32 1
  %1421 = bitcast <2 x i16> %1420 to i32
  %1422 = insertelement <8 x i32> undef, i32 %1372, i32 0
  %1423 = insertelement <8 x i32> %1422, i32 %1379, i32 1
  %1424 = insertelement <8 x i32> %1423, i32 %1386, i32 2
  %1425 = insertelement <8 x i32> %1424, i32 %1393, i32 3
  %1426 = insertelement <8 x i32> %1425, i32 %1400, i32 4
  %1427 = insertelement <8 x i32> %1426, i32 %1407, i32 5
  %1428 = insertelement <8 x i32> %1427, i32 %1414, i32 6
  %1429 = insertelement <8 x i32> %1428, i32 %1421, i32 7
  %1430 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1170, <8 x i16> %565, <8 x i32> %1429, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1431 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6144
  %1432 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1431)
  %1433 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6272
  %1434 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1433)
  %1435 = insertelement <2 x i16> undef, i16 %1432, i32 0
  %1436 = insertelement <2 x i16> %1435, i16 %1434, i32 1
  %1437 = bitcast <2 x i16> %1436 to i32
  %1438 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6400
  %1439 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1438)
  %1440 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6528
  %1441 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1440)
  %1442 = insertelement <2 x i16> undef, i16 %1439, i32 0
  %1443 = insertelement <2 x i16> %1442, i16 %1441, i32 1
  %1444 = bitcast <2 x i16> %1443 to i32
  %1445 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6656
  %1446 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1445)
  %1447 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6784
  %1448 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1447)
  %1449 = insertelement <2 x i16> undef, i16 %1446, i32 0
  %1450 = insertelement <2 x i16> %1449, i16 %1448, i32 1
  %1451 = bitcast <2 x i16> %1450 to i32
  %1452 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6912
  %1453 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1452)
  %1454 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7040
  %1455 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1454)
  %1456 = insertelement <2 x i16> undef, i16 %1453, i32 0
  %1457 = insertelement <2 x i16> %1456, i16 %1455, i32 1
  %1458 = bitcast <2 x i16> %1457 to i32
  %1459 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7168
  %1460 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1459)
  %1461 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7296
  %1462 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1461)
  %1463 = insertelement <2 x i16> undef, i16 %1460, i32 0
  %1464 = insertelement <2 x i16> %1463, i16 %1462, i32 1
  %1465 = bitcast <2 x i16> %1464 to i32
  %1466 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7424
  %1467 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1466)
  %1468 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7552
  %1469 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1468)
  %1470 = insertelement <2 x i16> undef, i16 %1467, i32 0
  %1471 = insertelement <2 x i16> %1470, i16 %1469, i32 1
  %1472 = bitcast <2 x i16> %1471 to i32
  %1473 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7680
  %1474 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1473)
  %1475 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7808
  %1476 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1475)
  %1477 = insertelement <2 x i16> undef, i16 %1474, i32 0
  %1478 = insertelement <2 x i16> %1477, i16 %1476, i32 1
  %1479 = bitcast <2 x i16> %1478 to i32
  %1480 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7936
  %1481 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1480)
  %1482 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 8064
  %1483 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1482)
  %1484 = insertelement <2 x i16> undef, i16 %1481, i32 0
  %1485 = insertelement <2 x i16> %1484, i16 %1483, i32 1
  %1486 = bitcast <2 x i16> %1485 to i32
  %1487 = insertelement <8 x i32> undef, i32 %1437, i32 0
  %1488 = insertelement <8 x i32> %1487, i32 %1444, i32 1
  %1489 = insertelement <8 x i32> %1488, i32 %1451, i32 2
  %1490 = insertelement <8 x i32> %1489, i32 %1458, i32 3
  %1491 = insertelement <8 x i32> %1490, i32 %1465, i32 4
  %1492 = insertelement <8 x i32> %1491, i32 %1472, i32 5
  %1493 = insertelement <8 x i32> %1492, i32 %1479, i32 6
  %1494 = insertelement <8 x i32> %1493, i32 %1486, i32 7
  %1495 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1235, <8 x i16> %564, <8 x i32> %1494, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1496 = extractelement <8 x float> %1495, i32 0
  %1497 = extractelement <8 x float> %1495, i32 1
  %1498 = extractelement <8 x float> %1495, i32 2
  %1499 = extractelement <8 x float> %1495, i32 3
  %1500 = extractelement <8 x float> %1495, i32 4
  %1501 = extractelement <8 x float> %1495, i32 5
  %1502 = extractelement <8 x float> %1495, i32 6
  %1503 = extractelement <8 x float> %1495, i32 7
  %1504 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6176
  %1505 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1504)
  %1506 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6304
  %1507 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1506)
  %1508 = insertelement <2 x i16> undef, i16 %1505, i32 0
  %1509 = insertelement <2 x i16> %1508, i16 %1507, i32 1
  %1510 = bitcast <2 x i16> %1509 to i32
  %1511 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6432
  %1512 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1511)
  %1513 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6560
  %1514 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1513)
  %1515 = insertelement <2 x i16> undef, i16 %1512, i32 0
  %1516 = insertelement <2 x i16> %1515, i16 %1514, i32 1
  %1517 = bitcast <2 x i16> %1516 to i32
  %1518 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6688
  %1519 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1518)
  %1520 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6816
  %1521 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1520)
  %1522 = insertelement <2 x i16> undef, i16 %1519, i32 0
  %1523 = insertelement <2 x i16> %1522, i16 %1521, i32 1
  %1524 = bitcast <2 x i16> %1523 to i32
  %1525 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6944
  %1526 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1525)
  %1527 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7072
  %1528 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1527)
  %1529 = insertelement <2 x i16> undef, i16 %1526, i32 0
  %1530 = insertelement <2 x i16> %1529, i16 %1528, i32 1
  %1531 = bitcast <2 x i16> %1530 to i32
  %1532 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7200
  %1533 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1532)
  %1534 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7328
  %1535 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1534)
  %1536 = insertelement <2 x i16> undef, i16 %1533, i32 0
  %1537 = insertelement <2 x i16> %1536, i16 %1535, i32 1
  %1538 = bitcast <2 x i16> %1537 to i32
  %1539 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7456
  %1540 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1539)
  %1541 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7584
  %1542 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1541)
  %1543 = insertelement <2 x i16> undef, i16 %1540, i32 0
  %1544 = insertelement <2 x i16> %1543, i16 %1542, i32 1
  %1545 = bitcast <2 x i16> %1544 to i32
  %1546 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7712
  %1547 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1546)
  %1548 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7840
  %1549 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1548)
  %1550 = insertelement <2 x i16> undef, i16 %1547, i32 0
  %1551 = insertelement <2 x i16> %1550, i16 %1549, i32 1
  %1552 = bitcast <2 x i16> %1551 to i32
  %1553 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7968
  %1554 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1553)
  %1555 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 8096
  %1556 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1555)
  %1557 = insertelement <2 x i16> undef, i16 %1554, i32 0
  %1558 = insertelement <2 x i16> %1557, i16 %1556, i32 1
  %1559 = bitcast <2 x i16> %1558 to i32
  %1560 = insertelement <8 x i32> undef, i32 %1510, i32 0
  %1561 = insertelement <8 x i32> %1560, i32 %1517, i32 1
  %1562 = insertelement <8 x i32> %1561, i32 %1524, i32 2
  %1563 = insertelement <8 x i32> %1562, i32 %1531, i32 3
  %1564 = insertelement <8 x i32> %1563, i32 %1538, i32 4
  %1565 = insertelement <8 x i32> %1564, i32 %1545, i32 5
  %1566 = insertelement <8 x i32> %1565, i32 %1552, i32 6
  %1567 = insertelement <8 x i32> %1566, i32 %1559, i32 7
  %1568 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1300, <8 x i16> %564, <8 x i32> %1567, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1569 = extractelement <8 x float> %1568, i32 0
  %1570 = extractelement <8 x float> %1568, i32 1
  %1571 = extractelement <8 x float> %1568, i32 2
  %1572 = extractelement <8 x float> %1568, i32 3
  %1573 = extractelement <8 x float> %1568, i32 4
  %1574 = extractelement <8 x float> %1568, i32 5
  %1575 = extractelement <8 x float> %1568, i32 6
  %1576 = extractelement <8 x float> %1568, i32 7
  %1577 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6208
  %1578 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1577)
  %1579 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6336
  %1580 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1579)
  %1581 = insertelement <2 x i16> undef, i16 %1578, i32 0
  %1582 = insertelement <2 x i16> %1581, i16 %1580, i32 1
  %1583 = bitcast <2 x i16> %1582 to i32
  %1584 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6464
  %1585 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1584)
  %1586 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6592
  %1587 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1586)
  %1588 = insertelement <2 x i16> undef, i16 %1585, i32 0
  %1589 = insertelement <2 x i16> %1588, i16 %1587, i32 1
  %1590 = bitcast <2 x i16> %1589 to i32
  %1591 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6720
  %1592 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1591)
  %1593 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6848
  %1594 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1593)
  %1595 = insertelement <2 x i16> undef, i16 %1592, i32 0
  %1596 = insertelement <2 x i16> %1595, i16 %1594, i32 1
  %1597 = bitcast <2 x i16> %1596 to i32
  %1598 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6976
  %1599 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1598)
  %1600 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7104
  %1601 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1600)
  %1602 = insertelement <2 x i16> undef, i16 %1599, i32 0
  %1603 = insertelement <2 x i16> %1602, i16 %1601, i32 1
  %1604 = bitcast <2 x i16> %1603 to i32
  %1605 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7232
  %1606 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1605)
  %1607 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7360
  %1608 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1607)
  %1609 = insertelement <2 x i16> undef, i16 %1606, i32 0
  %1610 = insertelement <2 x i16> %1609, i16 %1608, i32 1
  %1611 = bitcast <2 x i16> %1610 to i32
  %1612 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7488
  %1613 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1612)
  %1614 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7616
  %1615 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1614)
  %1616 = insertelement <2 x i16> undef, i16 %1613, i32 0
  %1617 = insertelement <2 x i16> %1616, i16 %1615, i32 1
  %1618 = bitcast <2 x i16> %1617 to i32
  %1619 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7744
  %1620 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1619)
  %1621 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7872
  %1622 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1621)
  %1623 = insertelement <2 x i16> undef, i16 %1620, i32 0
  %1624 = insertelement <2 x i16> %1623, i16 %1622, i32 1
  %1625 = bitcast <2 x i16> %1624 to i32
  %1626 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 8000
  %1627 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1626)
  %1628 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 8128
  %1629 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1628)
  %1630 = insertelement <2 x i16> undef, i16 %1627, i32 0
  %1631 = insertelement <2 x i16> %1630, i16 %1629, i32 1
  %1632 = bitcast <2 x i16> %1631 to i32
  %1633 = insertelement <8 x i32> undef, i32 %1583, i32 0
  %1634 = insertelement <8 x i32> %1633, i32 %1590, i32 1
  %1635 = insertelement <8 x i32> %1634, i32 %1597, i32 2
  %1636 = insertelement <8 x i32> %1635, i32 %1604, i32 3
  %1637 = insertelement <8 x i32> %1636, i32 %1611, i32 4
  %1638 = insertelement <8 x i32> %1637, i32 %1618, i32 5
  %1639 = insertelement <8 x i32> %1638, i32 %1625, i32 6
  %1640 = insertelement <8 x i32> %1639, i32 %1632, i32 7
  %1641 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1365, <8 x i16> %564, <8 x i32> %1640, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1642 = extractelement <8 x float> %1641, i32 0
  %1643 = extractelement <8 x float> %1641, i32 1
  %1644 = extractelement <8 x float> %1641, i32 2
  %1645 = extractelement <8 x float> %1641, i32 3
  %1646 = extractelement <8 x float> %1641, i32 4
  %1647 = extractelement <8 x float> %1641, i32 5
  %1648 = extractelement <8 x float> %1641, i32 6
  %1649 = extractelement <8 x float> %1641, i32 7
  %1650 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6240
  %1651 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1650)
  %1652 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6368
  %1653 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1652)
  %1654 = insertelement <2 x i16> undef, i16 %1651, i32 0
  %1655 = insertelement <2 x i16> %1654, i16 %1653, i32 1
  %1656 = bitcast <2 x i16> %1655 to i32
  %1657 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6496
  %1658 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1657)
  %1659 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6624
  %1660 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1659)
  %1661 = insertelement <2 x i16> undef, i16 %1658, i32 0
  %1662 = insertelement <2 x i16> %1661, i16 %1660, i32 1
  %1663 = bitcast <2 x i16> %1662 to i32
  %1664 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6752
  %1665 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1664)
  %1666 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 6880
  %1667 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1666)
  %1668 = insertelement <2 x i16> undef, i16 %1665, i32 0
  %1669 = insertelement <2 x i16> %1668, i16 %1667, i32 1
  %1670 = bitcast <2 x i16> %1669 to i32
  %1671 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7008
  %1672 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1671)
  %1673 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7136
  %1674 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1673)
  %1675 = insertelement <2 x i16> undef, i16 %1672, i32 0
  %1676 = insertelement <2 x i16> %1675, i16 %1674, i32 1
  %1677 = bitcast <2 x i16> %1676 to i32
  %1678 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7264
  %1679 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1678)
  %1680 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7392
  %1681 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1680)
  %1682 = insertelement <2 x i16> undef, i16 %1679, i32 0
  %1683 = insertelement <2 x i16> %1682, i16 %1681, i32 1
  %1684 = bitcast <2 x i16> %1683 to i32
  %1685 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7520
  %1686 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1685)
  %1687 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7648
  %1688 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1687)
  %1689 = insertelement <2 x i16> undef, i16 %1686, i32 0
  %1690 = insertelement <2 x i16> %1689, i16 %1688, i32 1
  %1691 = bitcast <2 x i16> %1690 to i32
  %1692 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7776
  %1693 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1692)
  %1694 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 7904
  %1695 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1694)
  %1696 = insertelement <2 x i16> undef, i16 %1693, i32 0
  %1697 = insertelement <2 x i16> %1696, i16 %1695, i32 1
  %1698 = bitcast <2 x i16> %1697 to i32
  %1699 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 8032
  %1700 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1699)
  %1701 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM, i64 0, i64 8160
  %1702 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1701)
  %1703 = insertelement <2 x i16> undef, i16 %1700, i32 0
  %1704 = insertelement <2 x i16> %1703, i16 %1702, i32 1
  %1705 = bitcast <2 x i16> %1704 to i32
  %1706 = insertelement <8 x i32> undef, i32 %1656, i32 0
  %1707 = insertelement <8 x i32> %1706, i32 %1663, i32 1
  %1708 = insertelement <8 x i32> %1707, i32 %1670, i32 2
  %1709 = insertelement <8 x i32> %1708, i32 %1677, i32 3
  %1710 = insertelement <8 x i32> %1709, i32 %1684, i32 4
  %1711 = insertelement <8 x i32> %1710, i32 %1691, i32 5
  %1712 = insertelement <8 x i32> %1711, i32 %1698, i32 6
  %1713 = insertelement <8 x i32> %1712, i32 %1705, i32 7
  %1714 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %1430, <8 x i16> %564, <8 x i32> %1713, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1715 = extractelement <8 x float> %1714, i32 0
  %1716 = extractelement <8 x float> %1714, i32 1
  %1717 = extractelement <8 x float> %1714, i32 2
  %1718 = extractelement <8 x float> %1714, i32 3
  %1719 = extractelement <8 x float> %1714, i32 4
  %1720 = extractelement <8 x float> %1714, i32 5
  %1721 = extractelement <8 x float> %1714, i32 6
  %1722 = extractelement <8 x float> %1714, i32 7
  %1723 = zext i32 %601 to i64
  %1724 = getelementptr inbounds float, ptr addrspace(1) %599, i64 %1723
  %1725 = bitcast float %1496 to i32
  %1726 = bitcast float %1497 to i32
  %1727 = bitcast float %1498 to i32
  %1728 = bitcast float %1499 to i32
  %1729 = bitcast float %1500 to i32
  %1730 = bitcast float %1501 to i32
  %1731 = bitcast float %1502 to i32
  %1732 = bitcast float %1503 to i32
  %1733 = insertelement <8 x i32> undef, i32 %1725, i32 0
  %1734 = insertelement <8 x i32> %1733, i32 %1726, i32 1
  %1735 = insertelement <8 x i32> %1734, i32 %1727, i32 2
  %1736 = insertelement <8 x i32> %1735, i32 %1728, i32 3
  %1737 = insertelement <8 x i32> %1736, i32 %1729, i32 4
  %1738 = insertelement <8 x i32> %1737, i32 %1730, i32 5
  %1739 = insertelement <8 x i32> %1738, i32 %1731, i32 6
  %1740 = insertelement <8 x i32> %1739, i32 %1732, i32 7
  %.ascast.i78 = addrspacecast ptr addrspace(1) %1724 to ptr addrspace(4)
  %1741 = mul i32 %22, %21
  %1742 = mul i32 %1741, %23
  %1743 = and i32 %1742, 15
  %1744 = icmp eq i32 %1743, 0
  br i1 %1744, label %1757, label %1745

1745:                                             ; preds = %651
  %localIdZ52 = zext i16 %localIdZ to i32
  %1746 = mul i32 %22, %localIdZ52
  %localIdY54 = zext i16 %localIdY to i32
  %1747 = add i32 %1746, %localIdY54
  %1748 = mul i32 %1747, %21
  %localIdX56 = zext i16 %localIdX to i32
  %1749 = add i32 %1748, %localIdX56
  %1750 = lshr i32 %1749, 4
  %1751 = mul i32 %22, %21
  %1752 = mul i32 %1751, %23
  %1753 = add i32 %1752, 15
  %1754 = lshr i32 %1753, 4
  %1755 = add nsw i32 %1754, -1
  %1756 = icmp ult i32 %1750, %1755
  br i1 %1756, label %1757, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

1757:                                             ; preds = %1745, %651
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %1745, %1757
  %1758 = ptrtoint ptr addrspace(4) %.ascast.i78 to i64
  %1759 = and i64 %1758, -64
  %1760 = trunc i64 %1758 to i32
  %1761 = lshr i32 %1760, 2
  %1762 = and i32 %1761, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %1759, i32 1023, i32 7, i32 1023, i32 %1762, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %1740)
  %1763 = getelementptr inbounds float, ptr addrspace(1) %1724, i64 16
  %1764 = bitcast float %1569 to i32
  %1765 = bitcast float %1570 to i32
  %1766 = bitcast float %1571 to i32
  %1767 = bitcast float %1572 to i32
  %1768 = bitcast float %1573 to i32
  %1769 = bitcast float %1574 to i32
  %1770 = bitcast float %1575 to i32
  %1771 = bitcast float %1576 to i32
  %1772 = insertelement <8 x i32> undef, i32 %1764, i32 0
  %1773 = insertelement <8 x i32> %1772, i32 %1765, i32 1
  %1774 = insertelement <8 x i32> %1773, i32 %1766, i32 2
  %1775 = insertelement <8 x i32> %1774, i32 %1767, i32 3
  %1776 = insertelement <8 x i32> %1775, i32 %1768, i32 4
  %1777 = insertelement <8 x i32> %1776, i32 %1769, i32 5
  %1778 = insertelement <8 x i32> %1777, i32 %1770, i32 6
  %1779 = insertelement <8 x i32> %1778, i32 %1771, i32 7
  %.ascast.i79 = addrspacecast ptr addrspace(1) %1763 to ptr addrspace(4)
  %1780 = mul i32 %22, %21
  %1781 = mul i32 %1780, %23
  %1782 = and i32 %1781, 15
  %1783 = icmp eq i32 %1782, 0
  br i1 %1783, label %1796, label %1784

1784:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  %localIdZ63 = zext i16 %localIdZ to i32
  %1785 = mul i32 %22, %localIdZ63
  %localIdY65 = zext i16 %localIdY to i32
  %1786 = add i32 %1785, %localIdY65
  %1787 = mul i32 %1786, %21
  %localIdX67 = zext i16 %localIdX to i32
  %1788 = add i32 %1787, %localIdX67
  %1789 = lshr i32 %1788, 4
  %1790 = mul i32 %22, %21
  %1791 = mul i32 %1790, %23
  %1792 = add i32 %1791, 15
  %1793 = lshr i32 %1792, 4
  %1794 = add nsw i32 %1793, -1
  %1795 = icmp ult i32 %1789, %1794
  br i1 %1795, label %1796, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80

1796:                                             ; preds = %1784, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80: ; preds = %1784, %1796
  %1797 = ptrtoint ptr addrspace(4) %.ascast.i79 to i64
  %1798 = and i64 %1797, -64
  %1799 = trunc i64 %1797 to i32
  %1800 = lshr i32 %1799, 2
  %1801 = and i32 %1800, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %1798, i32 1023, i32 7, i32 1023, i32 %1801, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %1779)
  %1802 = getelementptr inbounds float, ptr addrspace(1) %1724, i64 32
  %1803 = bitcast float %1642 to i32
  %1804 = bitcast float %1643 to i32
  %1805 = bitcast float %1644 to i32
  %1806 = bitcast float %1645 to i32
  %1807 = bitcast float %1646 to i32
  %1808 = bitcast float %1647 to i32
  %1809 = bitcast float %1648 to i32
  %1810 = bitcast float %1649 to i32
  %1811 = insertelement <8 x i32> undef, i32 %1803, i32 0
  %1812 = insertelement <8 x i32> %1811, i32 %1804, i32 1
  %1813 = insertelement <8 x i32> %1812, i32 %1805, i32 2
  %1814 = insertelement <8 x i32> %1813, i32 %1806, i32 3
  %1815 = insertelement <8 x i32> %1814, i32 %1807, i32 4
  %1816 = insertelement <8 x i32> %1815, i32 %1808, i32 5
  %1817 = insertelement <8 x i32> %1816, i32 %1809, i32 6
  %1818 = insertelement <8 x i32> %1817, i32 %1810, i32 7
  %.ascast.i81 = addrspacecast ptr addrspace(1) %1802 to ptr addrspace(4)
  %1819 = mul i32 %22, %21
  %1820 = mul i32 %1819, %23
  %1821 = and i32 %1820, 15
  %1822 = icmp eq i32 %1821, 0
  br i1 %1822, label %1835, label %1823

1823:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80
  %localIdZ74 = zext i16 %localIdZ to i32
  %1824 = mul i32 %22, %localIdZ74
  %localIdY76 = zext i16 %localIdY to i32
  %1825 = add i32 %1824, %localIdY76
  %1826 = mul i32 %1825, %21
  %localIdX78 = zext i16 %localIdX to i32
  %1827 = add i32 %1826, %localIdX78
  %1828 = lshr i32 %1827, 4
  %1829 = mul i32 %22, %21
  %1830 = mul i32 %1829, %23
  %1831 = add i32 %1830, 15
  %1832 = lshr i32 %1831, 4
  %1833 = add nsw i32 %1832, -1
  %1834 = icmp ult i32 %1828, %1833
  br i1 %1834, label %1835, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82

1835:                                             ; preds = %1823, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit80
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82: ; preds = %1823, %1835
  %1836 = ptrtoint ptr addrspace(4) %.ascast.i81 to i64
  %1837 = and i64 %1836, -64
  %1838 = trunc i64 %1836 to i32
  %1839 = lshr i32 %1838, 2
  %1840 = and i32 %1839, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %1837, i32 1023, i32 7, i32 1023, i32 %1840, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %1818)
  %1841 = getelementptr inbounds float, ptr addrspace(1) %1724, i64 48
  %1842 = bitcast float %1715 to i32
  %1843 = bitcast float %1716 to i32
  %1844 = bitcast float %1717 to i32
  %1845 = bitcast float %1718 to i32
  %1846 = bitcast float %1719 to i32
  %1847 = bitcast float %1720 to i32
  %1848 = bitcast float %1721 to i32
  %1849 = bitcast float %1722 to i32
  %1850 = insertelement <8 x i32> undef, i32 %1842, i32 0
  %1851 = insertelement <8 x i32> %1850, i32 %1843, i32 1
  %1852 = insertelement <8 x i32> %1851, i32 %1844, i32 2
  %1853 = insertelement <8 x i32> %1852, i32 %1845, i32 3
  %1854 = insertelement <8 x i32> %1853, i32 %1846, i32 4
  %1855 = insertelement <8 x i32> %1854, i32 %1847, i32 5
  %1856 = insertelement <8 x i32> %1855, i32 %1848, i32 6
  %1857 = insertelement <8 x i32> %1856, i32 %1849, i32 7
  %.ascast.i83 = addrspacecast ptr addrspace(1) %1841 to ptr addrspace(4)
  %1858 = mul i32 %22, %21
  %1859 = mul i32 %1858, %23
  %1860 = and i32 %1859, 15
  %1861 = icmp eq i32 %1860, 0
  br i1 %1861, label %1874, label %1862

1862:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82
  %localIdZ85 = zext i16 %localIdZ to i32
  %1863 = mul i32 %22, %localIdZ85
  %localIdY87 = zext i16 %localIdY to i32
  %1864 = add i32 %1863, %localIdY87
  %1865 = mul i32 %1864, %21
  %localIdX89 = zext i16 %localIdX to i32
  %1866 = add i32 %1865, %localIdX89
  %1867 = lshr i32 %1866, 4
  %1868 = mul i32 %22, %21
  %1869 = mul i32 %1868, %23
  %1870 = add i32 %1869, 15
  %1871 = lshr i32 %1870, 4
  %1872 = add nsw i32 %1871, -1
  %1873 = icmp ult i32 %1867, %1872
  br i1 %1873, label %1874, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit84

1874:                                             ; preds = %1862, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit82
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit84

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit84: ; preds = %1862, %1874
  %1875 = ptrtoint ptr addrspace(4) %.ascast.i83 to i64
  %1876 = and i64 %1875, -64
  %1877 = trunc i64 %1875 to i32
  %1878 = lshr i32 %1877, 2
  %1879 = and i32 %1878, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %1876, i32 1023, i32 7, i32 1023, i32 %1879, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %1857)
  br label %1880

1880:                                             ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit84, %650
  %1881 = add nuw nsw i32 %601, 64, !spirv.Decorations !743
  %1882 = icmp ult i32 %601, 192
  br i1 %1882, label %1883, label %1884

1883:                                             ; preds = %1880
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %1884

1884:                                             ; preds = %1883, %1880
  br label %600, !llvm.loop !794

1885:                                             ; preds = %603, %20
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE(i32 %0, i32 %1, ptr addrspace(1) align 4 %2, ptr addrspace(1) align 4 %3, i32 %4, ptr addrspace(1) align 4 %5, ptr addrspace(3) align 4 %6, i64 %7, i64 %8, i64 %9, ptr addrspace(1) align 1 %10, ptr addrspace(1) align 1 %11, ptr addrspace(1) align 4 %12, ptr addrspace(1) align 4 %13, ptr addrspace(1) align 4 %14, ptr addrspace(1) align 4 %15, ptr addrspace(1) align 4 %16, ptr addrspace(1) align 1 %17, ptr addrspace(1) align 4 %18, ptr addrspace(1) align 4 %19, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %localSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, i32 %bufferOffset, i32 %bufferOffset1, i32 %bufferOffset2, i32 %bufferOffset3, i32 %bufferOffset4, i32 %bufferOffset5, i32 %bufferOffset6, i32 %bufferOffset7, i32 %bufferOffset8, i32 %bufferOffset9, i32 %bufferOffset10, i32 %bufferOffset11, i32 %bufferOffset12, i32 %bindlessOffset, i32 %bindlessOffset13, i32 %bindlessOffset14, i32 %bindlessOffset15, i32 %bindlessOffset16, i32 %bindlessOffset17, i32 %bindlessOffset18, i32 %bindlessOffset19, i32 %bindlessOffset20, i32 %bindlessOffset21, i32 %bindlessOffset22, i32 %bindlessOffset23, i32 %bindlessOffset24) #0 {
  %21 = extractelement <3 x i32> %localSize, i32 0
  %22 = extractelement <3 x i32> %localSize, i32 1
  %23 = extractelement <3 x i32> %localSize, i32 2
  %24 = extractelement <8 x i32> %r0, i32 0
  %25 = extractelement <8 x i32> %r0, i32 1
  %26 = extractelement <8 x i32> %r0, i32 2
  %27 = extractelement <8 x i32> %r0, i32 3
  %28 = extractelement <8 x i32> %r0, i32 4
  %29 = extractelement <8 x i32> %r0, i32 5
  %30 = extractelement <8 x i32> %r0, i32 6
  %31 = extractelement <8 x i32> %r0, i32 7
  %32 = alloca [8 x float], align 4, !spirv.Decorations !739
  %33 = alloca [4 x float], align 4, !spirv.Decorations !739
  %34 = alloca [4 x float], align 4, !spirv.Decorations !739
  %35 = alloca [4 x float], align 4, !spirv.Decorations !739
  %36 = zext i16 %localIdX to i32
  %37 = zext i32 %25 to i64
  %38 = icmp sgt i32 %25, -1
  call void @llvm.assume(i1 %38)
  %39 = bitcast <8 x i32> %r0 to <32 x i8>
  %40 = extractelement <32 x i8> %39, i32 0
  %41 = extractelement <32 x i8> %39, i32 1
  %42 = extractelement <32 x i8> %39, i32 2
  %43 = extractelement <32 x i8> %39, i32 3
  %44 = extractelement <32 x i8> %39, i32 4
  %45 = extractelement <32 x i8> %39, i32 5
  %46 = extractelement <32 x i8> %39, i32 6
  %47 = extractelement <32 x i8> %39, i32 7
  %48 = extractelement <32 x i8> %39, i32 8
  %49 = extractelement <32 x i8> %39, i32 9
  %50 = extractelement <32 x i8> %39, i32 10
  %51 = extractelement <32 x i8> %39, i32 11
  %52 = extractelement <32 x i8> %39, i32 12
  %53 = extractelement <32 x i8> %39, i32 13
  %54 = extractelement <32 x i8> %39, i32 14
  %55 = extractelement <32 x i8> %39, i32 15
  %56 = extractelement <32 x i8> %39, i32 16
  %57 = extractelement <32 x i8> %39, i32 17
  %58 = extractelement <32 x i8> %39, i32 18
  %59 = extractelement <32 x i8> %39, i32 19
  %60 = extractelement <32 x i8> %39, i32 20
  %61 = extractelement <32 x i8> %39, i32 21
  %62 = extractelement <32 x i8> %39, i32 22
  %63 = extractelement <32 x i8> %39, i32 23
  %64 = extractelement <32 x i8> %39, i32 24
  %65 = extractelement <32 x i8> %39, i32 25
  %66 = extractelement <32 x i8> %39, i32 26
  %67 = extractelement <32 x i8> %39, i32 27
  %68 = extractelement <32 x i8> %39, i32 28
  %69 = extractelement <32 x i8> %39, i32 29
  %70 = extractelement <32 x i8> %39, i32 30
  %71 = extractelement <32 x i8> %39, i32 31
  %localThreadId26 = zext i8 %48 to i32
  %72 = shl nuw nsw i32 %localThreadId26, 3, !spirv.Decorations !741
  %simdLaneId16 = call i16 @llvm.genx.GenISA.simdLaneId()
  %simdLaneId = zext i16 %simdLaneId16 to i32
  %73 = icmp ult i16 %simdLaneId16, 32
  call void @llvm.assume(i1 %73)
  %74 = mul nsw i32 %0, 6, !spirv.Decorations !741
  %75 = icmp slt i32 %72, %74
  %76 = sdiv i32 %25, %1
  %freeze = freeze i32 %76
  %77 = mul nsw i32 %freeze, %1, !spirv.Decorations !741
  %78 = sub nsw i32 %25, %77, !spirv.Decorations !741
  %79 = addrspacecast ptr addrspace(4) null to ptr addrspace(1)
  %80 = icmp eq ptr addrspace(1) %2, %79
  %81 = select i1 %80, ptr addrspace(1) %3, ptr addrspace(1) %2
  %82 = load i32, ptr addrspace(1) %81, align 4
  %83 = sext i32 %82 to i64
  %84 = sext i32 %78 to i64
  %85 = shl nsw i64 %84, 6, !spirv.Decorations !741
  %86 = sub nsw i64 %83, %85, !spirv.Decorations !741
  %87 = call i64 @llvm.smin.i64(i64 %86, i64 64)
  %88 = call i64 @llvm.smax.i64(i64 %87, i64 0)
  %89 = trunc i64 %88 to i32
  %90 = icmp slt i32 %89, 1
  br i1 %90, label %1060, label %91

91:                                               ; preds = %20
  %92 = icmp slt i32 %4, 2
  br i1 %92, label %93, label %96

93:                                               ; preds = %91
  %94 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %84
  %95 = load i32, ptr addrspace(1) %94, align 4
  br label %105

96:                                               ; preds = %91
  %97 = sdiv i32 %78, %4
  %freeze131 = freeze i32 %97
  %98 = sext i32 %freeze131 to i64
  %99 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %98
  %100 = load i32, ptr addrspace(1) %99, align 4
  %101 = mul nsw i32 %100, %4, !spirv.Decorations !741
  %102 = mul i32 %freeze131, %4
  %103 = sub i32 %78, %102
  %104 = add nsw i32 %101, %103, !spirv.Decorations !741
  br label %105

105:                                              ; preds = %96, %93
  %106 = phi i32 [ %95, %93 ], [ %104, %96 ]
  %107 = sext i32 %freeze to i64
  %108 = shl nsw i64 %107, 6, !spirv.Decorations !741
  %109 = shl nsw i64 %107, 14, !spirv.Decorations !741
  %110 = shl nuw nsw i64 %37, 6, !spirv.Decorations !743
  %111 = shl nuw nsw i64 %37, 14, !spirv.Decorations !743
  %112 = sext i32 %106 to i64
  %113 = mul i64 %112, %7
  %114 = shl nsw i64 %107, 8, !spirv.Decorations !741
  %115 = mul i64 %112, %8
  %116 = shl nsw i64 %107, 7, !spirv.Decorations !741
  %117 = mul i64 %112, %9
  %118 = add i64 %117, %107
  %119 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %109
  %120 = getelementptr i8, ptr addrspace(1) %11, i64 %113
  %121 = getelementptr i8, ptr addrspace(1) %120, i64 %114
  %122 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %111
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %32)
  %123 = zext i32 %72 to i64
  %124 = getelementptr float, ptr addrspace(1) %13, i64 %108
  %125 = getelementptr float, ptr addrspace(1) %124, i64 %123
  br label %126

126:                                              ; preds = %131, %105
  %127 = phi i32 [ 0, %105 ], [ %136, %131 ]
  %128 = icmp ult i32 %127, 8
  br i1 %128, label %131, label %129

129:                                              ; preds = %126
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %33)
  %130 = getelementptr float, ptr addrspace(1) %14, i64 %118
  br label %137

131:                                              ; preds = %126
  %132 = zext i32 %127 to i64
  %133 = getelementptr inbounds float, ptr addrspace(1) %125, i64 %132
  %134 = load float, ptr addrspace(1) %133, align 4
  %135 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %132
  store float %134, ptr %135, align 4
  %136 = add nuw nsw i32 %127, 1, !spirv.Decorations !743
  br label %126, !llvm.loop !795

137:                                              ; preds = %141, %129
  %138 = phi i32 [ 0, %129 ], [ %150, %141 ]
  %139 = icmp ult i32 %138, 4
  br i1 %139, label %141, label %140

140:                                              ; preds = %137
  br i1 %75, label %151, label %342

141:                                              ; preds = %137
  %142 = shl nuw nsw i32 %138, 4, !spirv.Decorations !743
  %143 = add nuw nsw i32 %142, %simdLaneId, !spirv.Decorations !743
  %144 = zext i32 %143 to i64
  %145 = shl nuw nsw i64 %144, 2, !spirv.Decorations !743
  %146 = getelementptr float, ptr addrspace(1) %130, i64 %145
  %147 = load float, ptr addrspace(1) %146, align 4
  %148 = zext i32 %138 to i64
  %149 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %148
  store float %147, ptr %149, align 4
  %150 = add nuw nsw i32 %138, 1, !spirv.Decorations !743
  br label %137, !llvm.loop !796

151:                                              ; preds = %140
  %152 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !741
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds i8, ptr addrspace(1) %119, i64 %153
  %155 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 16384
  %156 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 32768
  %157 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 49152
  br label %158

158:                                              ; preds = %300, %151
  %159 = phi <8 x i32> [ zeroinitializer, %151 ], [ %340, %300 ]
  %160 = phi <8 x i32> [ zeroinitializer, %151 ], [ %332, %300 ]
  %161 = phi <8 x i32> [ zeroinitializer, %151 ], [ %324, %300 ]
  %162 = phi <8 x i32> [ zeroinitializer, %151 ], [ %316, %300 ]
  %163 = phi i32 [ 0, %151 ], [ %341, %300 ]
  %164 = extractelement <8 x i32> %159, i32 0
  %165 = extractelement <8 x i32> %159, i32 1
  %166 = extractelement <8 x i32> %159, i32 2
  %167 = extractelement <8 x i32> %159, i32 3
  %168 = extractelement <8 x i32> %159, i32 4
  %169 = extractelement <8 x i32> %159, i32 5
  %170 = extractelement <8 x i32> %159, i32 6
  %171 = extractelement <8 x i32> %159, i32 7
  %172 = extractelement <8 x i32> %160, i32 0
  %173 = extractelement <8 x i32> %160, i32 1
  %174 = extractelement <8 x i32> %160, i32 2
  %175 = extractelement <8 x i32> %160, i32 3
  %176 = extractelement <8 x i32> %160, i32 4
  %177 = extractelement <8 x i32> %160, i32 5
  %178 = extractelement <8 x i32> %160, i32 6
  %179 = extractelement <8 x i32> %160, i32 7
  %180 = extractelement <8 x i32> %161, i32 0
  %181 = extractelement <8 x i32> %161, i32 1
  %182 = extractelement <8 x i32> %161, i32 2
  %183 = extractelement <8 x i32> %161, i32 3
  %184 = extractelement <8 x i32> %161, i32 4
  %185 = extractelement <8 x i32> %161, i32 5
  %186 = extractelement <8 x i32> %161, i32 6
  %187 = extractelement <8 x i32> %161, i32 7
  %188 = extractelement <8 x i32> %162, i32 0
  %189 = extractelement <8 x i32> %162, i32 1
  %190 = extractelement <8 x i32> %162, i32 2
  %191 = extractelement <8 x i32> %162, i32 3
  %192 = extractelement <8 x i32> %162, i32 4
  %193 = extractelement <8 x i32> %162, i32 5
  %194 = extractelement <8 x i32> %162, i32 6
  %195 = extractelement <8 x i32> %162, i32 7
  %196 = icmp ult i32 %163, 256
  br i1 %196, label %300, label %197

197:                                              ; preds = %158
  %198 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !741
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM, i64 %199
  %201 = mul i32 %22, %21
  %202 = mul i32 %201, %23
  %203 = and i32 %202, 15
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %217, label %205

205:                                              ; preds = %197
  %localIdZ30 = zext i16 %localIdZ to i32
  %206 = mul i32 %22, %localIdZ30
  %localIdY32 = zext i16 %localIdY to i32
  %207 = add i32 %206, %localIdY32
  %208 = mul i32 %207, %21
  %localIdX34 = zext i16 %localIdX to i32
  %209 = add i32 %208, %localIdX34
  %210 = lshr i32 %209, 4
  %211 = mul i32 %22, %21
  %212 = mul i32 %211, %23
  %213 = add i32 %212, 15
  %214 = lshr i32 %213, 4
  %215 = add nsw i32 %214, -1
  %216 = icmp ult i32 %210, %215
  br i1 %216, label %217, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

217:                                              ; preds = %205, %197
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit: ; preds = %205, %217
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %200, i32 %188)
  %218 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 64
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %218, i32 %189)
  %219 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 128
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %219, i32 %190)
  %220 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 192
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %220, i32 %191)
  %221 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 256
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %221, i32 %192)
  %222 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 320
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %222, i32 %193)
  %223 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 384
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %223, i32 %194)
  %224 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 448
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %224, i32 %195)
  %225 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 16
  %226 = mul i32 %22, %21
  %227 = mul i32 %226, %23
  %228 = and i32 %227, 15
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %242, label %230

230:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  %localIdZ41 = zext i16 %localIdZ to i32
  %231 = mul i32 %22, %localIdZ41
  %localIdY43 = zext i16 %localIdY to i32
  %232 = add i32 %231, %localIdY43
  %233 = mul i32 %232, %21
  %localIdX45 = zext i16 %localIdX to i32
  %234 = add i32 %233, %localIdX45
  %235 = lshr i32 %234, 4
  %236 = mul i32 %22, %21
  %237 = mul i32 %236, %23
  %238 = add i32 %237, 15
  %239 = lshr i32 %238, 4
  %240 = add nsw i32 %239, -1
  %241 = icmp ult i32 %235, %240
  br i1 %241, label %242, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35

242:                                              ; preds = %230, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35: ; preds = %230, %242
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %225, i32 %180)
  %243 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 80
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %243, i32 %181)
  %244 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 144
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %244, i32 %182)
  %245 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 208
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %245, i32 %183)
  %246 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 272
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %246, i32 %184)
  %247 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 336
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %247, i32 %185)
  %248 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 400
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %248, i32 %186)
  %249 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 464
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %249, i32 %187)
  %250 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 32
  %251 = mul i32 %22, %21
  %252 = mul i32 %251, %23
  %253 = and i32 %252, 15
  %254 = icmp eq i32 %253, 0
  br i1 %254, label %267, label %255

255:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35
  %localIdZ52 = zext i16 %localIdZ to i32
  %256 = mul i32 %22, %localIdZ52
  %localIdY54 = zext i16 %localIdY to i32
  %257 = add i32 %256, %localIdY54
  %258 = mul i32 %257, %21
  %localIdX56 = zext i16 %localIdX to i32
  %259 = add i32 %258, %localIdX56
  %260 = lshr i32 %259, 4
  %261 = mul i32 %22, %21
  %262 = mul i32 %261, %23
  %263 = add i32 %262, 15
  %264 = lshr i32 %263, 4
  %265 = add nsw i32 %264, -1
  %266 = icmp ult i32 %260, %265
  br i1 %266, label %267, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37

267:                                              ; preds = %255, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit35
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37: ; preds = %255, %267
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %250, i32 %172)
  %268 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 96
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %268, i32 %173)
  %269 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 160
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %269, i32 %174)
  %270 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 224
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %270, i32 %175)
  %271 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 288
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %271, i32 %176)
  %272 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 352
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %272, i32 %177)
  %273 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 416
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %273, i32 %178)
  %274 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 480
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %274, i32 %179)
  %275 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 48
  %276 = mul i32 %22, %21
  %277 = mul i32 %276, %23
  %278 = and i32 %277, 15
  %279 = icmp eq i32 %278, 0
  br i1 %279, label %292, label %280

280:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37
  %localIdZ63 = zext i16 %localIdZ to i32
  %281 = mul i32 %22, %localIdZ63
  %localIdY65 = zext i16 %localIdY to i32
  %282 = add i32 %281, %localIdY65
  %283 = mul i32 %282, %21
  %localIdX67 = zext i16 %localIdX to i32
  %284 = add i32 %283, %localIdX67
  %285 = lshr i32 %284, 4
  %286 = mul i32 %22, %21
  %287 = mul i32 %286, %23
  %288 = add i32 %287, 15
  %289 = lshr i32 %288, 4
  %290 = add nsw i32 %289, -1
  %291 = icmp ult i32 %285, %290
  br i1 %291, label %292, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39

292:                                              ; preds = %280, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit37
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39: ; preds = %280, %292
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %275, i32 %164)
  %293 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 112
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %293, i32 %165)
  %294 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 176
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %294, i32 %166)
  %295 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 240
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %295, i32 %167)
  %296 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 304
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %296, i32 %168)
  %297 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 368
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %297, i32 %169)
  %298 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 432
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %298, i32 %170)
  %299 = getelementptr inbounds i32, ptr addrspace(3) %200, i64 496
  call void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3) %299, i32 %171)
  br label %342

300:                                              ; preds = %158
  %301 = zext i32 %163 to i64
  %302 = getelementptr inbounds i8, ptr addrspace(1) %154, i64 %301
  %.ascast.i40 = addrspacecast ptr addrspace(1) %302 to ptr addrspace(4)
  %303 = ptrtoint ptr addrspace(4) %.ascast.i40 to i64
  %304 = and i64 %303, -64
  %305 = trunc i64 %303 to i32
  %306 = lshr i32 %305, 1
  %307 = and i32 %306, 31
  %308 = call <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64 %304, i32 255, i32 7, i32 255, i32 %307, i32 0, i32 16, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0)
  %309 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 %301
  %.ascast.i41 = addrspacecast ptr addrspace(1) %309 to ptr addrspace(4)
  %310 = ptrtoint ptr addrspace(4) %.ascast.i41 to i64
  %311 = and i64 %310, -64
  %312 = trunc i64 %310 to i32
  %313 = lshr i32 %312, 2
  %314 = and i32 %313, 15
  %315 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %311, i32 1023, i32 15, i32 1023, i32 %314, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %316 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %162, <8 x i16> %308, <8 x i32> %315, i32 4, i32 4, i32 8, i32 8, i1 false)
  %317 = getelementptr inbounds i8, ptr addrspace(1) %155, i64 %301
  %.ascast.i42 = addrspacecast ptr addrspace(1) %317 to ptr addrspace(4)
  %318 = ptrtoint ptr addrspace(4) %.ascast.i42 to i64
  %319 = and i64 %318, -64
  %320 = trunc i64 %318 to i32
  %321 = lshr i32 %320, 2
  %322 = and i32 %321, 15
  %323 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %319, i32 1023, i32 15, i32 1023, i32 %322, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %324 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %161, <8 x i16> %308, <8 x i32> %323, i32 4, i32 4, i32 8, i32 8, i1 false)
  %325 = getelementptr inbounds i8, ptr addrspace(1) %156, i64 %301
  %.ascast.i43 = addrspacecast ptr addrspace(1) %325 to ptr addrspace(4)
  %326 = ptrtoint ptr addrspace(4) %.ascast.i43 to i64
  %327 = and i64 %326, -64
  %328 = trunc i64 %326 to i32
  %329 = lshr i32 %328, 2
  %330 = and i32 %329, 15
  %331 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %327, i32 1023, i32 15, i32 1023, i32 %330, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %332 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %160, <8 x i16> %308, <8 x i32> %331, i32 4, i32 4, i32 8, i32 8, i1 false)
  %333 = getelementptr inbounds i8, ptr addrspace(1) %157, i64 %301
  %.ascast.i44 = addrspacecast ptr addrspace(1) %333 to ptr addrspace(4)
  %334 = ptrtoint ptr addrspace(4) %.ascast.i44 to i64
  %335 = and i64 %334, -64
  %336 = trunc i64 %334 to i32
  %337 = lshr i32 %336, 2
  %338 = and i32 %337, 15
  %339 = call <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64 %335, i32 1023, i32 15, i32 1023, i32 %338, i32 0, i32 32, i32 8, i32 16, i32 1, i1 true, i1 false, i32 0)
  %340 = call <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32> %159, <8 x i16> %308, <8 x i32> %339, i32 4, i32 4, i32 8, i32 8, i1 false)
  %341 = add nuw nsw i32 %163, 32, !spirv.Decorations !743
  br label %158

342:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_local_pi64_v8i8.695.exit39, %140
  call void @llvm.genx.GenISA.wavebarrier()
  br i1 %75, label %343, label %349

343:                                              ; preds = %342
  %344 = getelementptr i32, ptr addrspace(1) %2, i64 1
  %345 = sext i32 %0 to i64
  %346 = sub nsw i64 %83, %345, !spirv.Decorations !741
  %347 = add nsw i64 %346, 1, !spirv.Decorations !741
  %348 = icmp eq i16 %simdLaneId16, 0
  br label %358

349:                                              ; preds = %342
  %350 = icmp ult i16 %simdLaneId16, 8
  br i1 %350, label %351, label %476

351:                                              ; preds = %349
  %352 = zext i32 %72 to i64
  %353 = add nuw nsw i64 %110, %352, !spirv.Decorations !743
  %354 = zext i16 %simdLaneId16 to i64
  %355 = or i64 %353, %354
  %356 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %355
  store float 0xFFF0000000000000, ptr addrspace(1) %356, align 4
  %357 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %355
  store float 0.000000e+00, ptr addrspace(1) %357, align 4
  br label %476

358:                                              ; preds = %474, %343
  %359 = phi i32 [ %475, %474 ], [ 0, %343 ]
  %360 = icmp ult i32 %359, 8
  br i1 %360, label %361, label %.loopexit6

361:                                              ; preds = %358
  %362 = or i32 %72, %359
  %363 = zext i32 %359 to i64
  %364 = getelementptr inbounds [8 x float], ptr %32, i64 0, i64 %363
  %365 = load float, ptr %364, align 4
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %34)
  %366 = udiv i32 %362, 6
  %367 = icmp slt i32 %362, %74
  br i1 %367, label %368, label %377

368:                                              ; preds = %361
  br i1 %80, label %374, label %369

369:                                              ; preds = %368
  %370 = zext i32 %366 to i64
  %371 = getelementptr i32, ptr addrspace(1) %344, i64 %370
  %372 = load i32, ptr addrspace(1) %371, align 4
  %373 = sext i32 %372 to i64
  br label %377

374:                                              ; preds = %368
  %375 = zext i32 %366 to i64
  %376 = add nsw i64 %347, %375, !spirv.Decorations !741
  br label %377

377:                                              ; preds = %374, %369, %361
  %378 = phi i64 [ %373, %369 ], [ %376, %374 ], [ 0, %361 ]
  %379 = shl nsw i32 %362, 6, !spirv.Decorations !741
  %380 = sub nsw i64 %378, %85, !spirv.Decorations !741
  br label %381

381:                                              ; preds = %388, %377
  %382 = phi float [ 0xFFF0000000000000, %377 ], [ %410, %388 ]
  %383 = phi i32 [ 0, %377 ], [ %411, %388 ]
  %384 = icmp ult i32 %383, 4
  br i1 %384, label %388, label %385

385:                                              ; preds = %381
  %386 = call float @llvm.genx.GenISA.WaveAll.f32(float %382, i8 12, i1 true, i32 0)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %35)
  %387 = fcmp reassoc nsz arcp contract oeq float %386, 0xFFF0000000000000, !spirv.Decorations !748
  br i1 %387, label %.preheader3, label %.preheader5

.preheader5:                                      ; preds = %385
  br label %419

.preheader3:                                      ; preds = %385
  br label %412

388:                                              ; preds = %381
  %389 = shl nuw nsw i32 %383, 4, !spirv.Decorations !743
  %390 = add nuw nsw i32 %389, %simdLaneId, !spirv.Decorations !743
  %391 = or i32 %379, %389
  %392 = add nuw nsw i32 %391, %simdLaneId, !spirv.Decorations !743
  %393 = zext i32 %392 to i64
  %394 = getelementptr inbounds i32, ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM, i64 %393
  %395 = load i32, ptr addrspace(3) %394, align 4
  %396 = sitofp i32 %395 to float
  %397 = fmul reassoc nsz arcp contract float %365, %396, !spirv.Decorations !748
  %398 = zext i32 %383 to i64
  %399 = getelementptr inbounds [4 x float], ptr %33, i64 0, i64 %398
  %400 = load float, ptr %399, align 4
  %401 = fmul reassoc nsz arcp contract float %397, %400, !spirv.Decorations !748
  %402 = fmul reassoc nsz arcp contract float %401, 6.250000e-02, !spirv.Decorations !748
  %403 = zext i32 %390 to i64
  %404 = icmp slt i32 %390, %89
  %405 = icmp sgt i64 %380, %403
  %406 = and i1 %404, %367
  %407 = select i1 %406, i1 %405, i1 false
  %408 = select i1 %407, float %402, float 0xFFF0000000000000
  %409 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %398
  store float %408, ptr %409, align 4
  %410 = call float @llvm.maxnum.f32(float %382, float %408)
  %411 = add nuw nsw i32 %383, 1, !spirv.Decorations !743
  br label %381

412:                                              ; preds = %415, %.preheader3
  %413 = phi i32 [ %418, %415 ], [ 0, %.preheader3 ]
  %414 = icmp ult i32 %413, 4
  br i1 %414, label %415, label %.loopexit4

415:                                              ; preds = %412
  %416 = zext i32 %413 to i64
  %417 = getelementptr inbounds [4 x float], ptr %35, i64 0, i64 %416
  store float 0.000000e+00, ptr %417, align 4
  %418 = add nuw nsw i32 %413, 1, !spirv.Decorations !743
  br label %412

419:                                              ; preds = %423, %.preheader5
  %420 = phi float [ %441, %423 ], [ 0.000000e+00, %.preheader5 ]
  %421 = phi i32 [ %442, %423 ], [ 0, %.preheader5 ]
  %422 = icmp ult i32 %421, 4
  br i1 %422, label %423, label %443

423:                                              ; preds = %419
  %424 = zext i32 %421 to i64
  %425 = getelementptr inbounds [4 x float], ptr %34, i64 0, i64 %424
  %426 = load float, ptr %425, align 4
  %427 = fsub reassoc nsz arcp contract float %426, %386, !spirv.Decorations !748
  %428 = fmul float %427, 0x3FF7154760000000
  %429 = call float @llvm.trunc.f32(float %428)
  %430 = call float @llvm.fma.f32(float %429, float 0xBFE62E4000000000, float %427)
  %431 = call float @llvm.fma.f32(float %429, float 0xBEB7F7D1C0000000, float %430)
  %432 = fmul float %431, 0x3FF7154760000000
  %433 = call float @llvm.exp2.f32(float %429)
  %434 = call float @llvm.exp2.f32(float %432)
  %435 = fmul float %433, %434
  %436 = fcmp olt float %427, -1.050000e+02
  %437 = select i1 %436, float 0.000000e+00, float %435
  %438 = fcmp ogt float %427, 1.050000e+02
  %439 = select i1 %438, float 0x7FF0000000000000, float %437
  %440 = getelementptr inbounds [4 x float], ptr %35, i64 0, i64 %424
  store float %439, ptr %440, align 4
  %441 = fadd reassoc nsz arcp contract float %420, %439, !spirv.Decorations !748
  %442 = add nuw nsw i32 %421, 1, !spirv.Decorations !743
  br label %419

443:                                              ; preds = %419
  %444 = call float @llvm.genx.GenISA.WaveAll.f32(float %420, i8 9, i1 true, i32 0)
  %445 = fcmp reassoc nsz arcp contract oeq float %444, 0.000000e+00, !spirv.Decorations !748
  br i1 %445, label %448, label %446

446:                                              ; preds = %443
  %447 = fdiv reassoc nsz arcp contract float 1.000000e+00, %444, !spirv.Decorations !748
  br label %448

.loopexit4:                                       ; preds = %412
  br label %448

448:                                              ; preds = %.loopexit4, %446, %443
  %449 = phi float [ %444, %446 ], [ %444, %443 ], [ 0.000000e+00, %.loopexit4 ]
  %450 = phi float [ %447, %446 ], [ 0.000000e+00, %443 ], [ 0.000000e+00, %.loopexit4 ]
  %451 = shl nsw i32 %362, 6, !spirv.Decorations !741
  br label %452

452:                                              ; preds = %456, %448
  %453 = phi i32 [ 0, %448 ], [ %468, %456 ]
  %454 = icmp ult i32 %453, 4
  br i1 %454, label %456, label %455

455:                                              ; preds = %452
  br i1 %348, label %469, label %474

456:                                              ; preds = %452
  %457 = zext i32 %453 to i64
  %458 = getelementptr inbounds [4 x float], ptr %35, i64 0, i64 %457
  %459 = load float, ptr %458, align 4
  %460 = fmul reassoc nsz arcp contract float %459, %450, !spirv.Decorations !748
  %461 = fptrunc float %460 to half
  %462 = shl nuw nsw i32 %453, 4, !spirv.Decorations !743
  %463 = or i32 %451, %462
  %464 = add nuw nsw i32 %463, %simdLaneId, !spirv.Decorations !743
  %465 = zext i32 %464 to i64
  %466 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM, i64 0, i64 16384
  %467 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %466, i64 %465
  store half %461, ptr addrspace(3) %467, align 2
  %468 = add nuw nsw i32 %453, 1, !spirv.Decorations !743
  br label %452

469:                                              ; preds = %455
  %470 = zext i32 %362 to i64
  %471 = add nuw nsw i64 %110, %470, !spirv.Decorations !743
  %472 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %471
  store float %386, ptr addrspace(1) %472, align 4
  %473 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %471
  store float %449, ptr addrspace(1) %473, align 4
  br label %474

474:                                              ; preds = %469, %455
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %35)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %34)
  %475 = add nuw nsw i32 %359, 1, !spirv.Decorations !743
  br label %358

.loopexit6:                                       ; preds = %358
  br label %476

476:                                              ; preds = %.loopexit6, %351, %349
  call void @llvm.genx.GenISA.wavebarrier()
  %477 = lshr i32 %36, 1
  %478 = and i32 %36, 1
  %479 = shl nuw nsw i32 %477, 7, !spirv.Decorations !741
  %480 = zext i32 %479 to i64
  %481 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM, i64 %480
  %482 = shl nuw nsw i32 %478, 6, !spirv.Decorations !743
  %483 = zext i32 %482 to i64
  %484 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %481, i64 %483
  %485 = icmp slt i32 %477, %89
  %486 = getelementptr inbounds float, ptr addrspace(1) %19, i64 %118
  %487 = getelementptr inbounds float, ptr addrspace(1) %18, i64 %118
  %488 = getelementptr i8, ptr addrspace(1) %17, i64 %115
  %489 = getelementptr i8, ptr addrspace(1) %488, i64 %116
  %490 = shl nuw nsw i32 %477, 2, !spirv.Decorations !743
  %491 = zext i32 %490 to i64
  %492 = getelementptr inbounds float, ptr addrspace(1) %487, i64 %491
  %493 = getelementptr inbounds float, ptr addrspace(1) %486, i64 %491
  %494 = shl nuw nsw i32 %478, 5, !spirv.Decorations !743
  %495 = shl nuw nsw i32 %477, 9
  %496 = zext i32 %495 to i64
  %497 = getelementptr inbounds i8, ptr addrspace(1) %489, i64 %496
  %498 = shl nuw nsw i32 %localThreadId26, 9, !spirv.Decorations !741
  %499 = zext i32 %498 to i64
  %500 = getelementptr inbounds [0 x i8], ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM, i64 0, i64 16384
  %501 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %500, i64 %499
  %502 = shl nuw nsw i32 %localThreadId26, 11, !spirv.Decorations !741
  %503 = zext i32 %502 to i64
  %504 = getelementptr inbounds float, ptr addrspace(1) %122, i64 %503
  br label %505

505:                                              ; preds = %1059, %476
  %.0198132 = phi i16 [ undef, %476 ], [ %.3201316, %1059 ]
  %.0198133 = phi i16 [ undef, %476 ], [ %.3201317, %1059 ]
  %.0198134 = phi i16 [ undef, %476 ], [ %.3201318, %1059 ]
  %.0198135 = phi i16 [ undef, %476 ], [ %.3201319, %1059 ]
  %.0198136 = phi i16 [ undef, %476 ], [ %.3201320, %1059 ]
  %.0198137 = phi i16 [ undef, %476 ], [ %.3201321, %1059 ]
  %.0198138 = phi i16 [ undef, %476 ], [ %.3201322, %1059 ]
  %.0198139 = phi i16 [ undef, %476 ], [ %.3201323, %1059 ]
  %.0194140 = phi i32 [ undef, %476 ], [ %.3197324, %1059 ]
  %.0194141 = phi i32 [ undef, %476 ], [ %.3197325, %1059 ]
  %.0194142 = phi i32 [ undef, %476 ], [ %.3197326, %1059 ]
  %.0194143 = phi i32 [ undef, %476 ], [ %.3197327, %1059 ]
  %.0194144 = phi i32 [ undef, %476 ], [ %.3197328, %1059 ]
  %.0194145 = phi i32 [ undef, %476 ], [ %.3197329, %1059 ]
  %.0194146 = phi i32 [ undef, %476 ], [ %.3197330, %1059 ]
  %.0194147 = phi i32 [ undef, %476 ], [ %.3197331, %1059 ]
  %.0190148 = phi i32 [ undef, %476 ], [ %.3193332, %1059 ]
  %.0190149 = phi i32 [ undef, %476 ], [ %.3193333, %1059 ]
  %.0190150 = phi i32 [ undef, %476 ], [ %.3193334, %1059 ]
  %.0190151 = phi i32 [ undef, %476 ], [ %.3193335, %1059 ]
  %.0190152 = phi i32 [ undef, %476 ], [ %.3193336, %1059 ]
  %.0190153 = phi i32 [ undef, %476 ], [ %.3193337, %1059 ]
  %.0190154 = phi i32 [ undef, %476 ], [ %.3193338, %1059 ]
  %.0190155 = phi i32 [ undef, %476 ], [ %.3193339, %1059 ]
  %.0186156 = phi i32 [ undef, %476 ], [ %.3189340, %1059 ]
  %.0186157 = phi i32 [ undef, %476 ], [ %.3189341, %1059 ]
  %.0186158 = phi i32 [ undef, %476 ], [ %.3189342, %1059 ]
  %.0186159 = phi i32 [ undef, %476 ], [ %.3189343, %1059 ]
  %.0186160 = phi i32 [ undef, %476 ], [ %.3189344, %1059 ]
  %.0186161 = phi i32 [ undef, %476 ], [ %.3189345, %1059 ]
  %.0186162 = phi i32 [ undef, %476 ], [ %.3189346, %1059 ]
  %.0186163 = phi i32 [ undef, %476 ], [ %.3189347, %1059 ]
  %.0164 = phi i32 [ undef, %476 ], [ %.3348, %1059 ]
  %.0165 = phi i32 [ undef, %476 ], [ %.3349, %1059 ]
  %.0166 = phi i32 [ undef, %476 ], [ %.3350, %1059 ]
  %.0167 = phi i32 [ undef, %476 ], [ %.3351, %1059 ]
  %.0168 = phi i32 [ undef, %476 ], [ %.3352, %1059 ]
  %.0169 = phi i32 [ undef, %476 ], [ %.3353, %1059 ]
  %.0170 = phi i32 [ undef, %476 ], [ %.3354, %1059 ]
  %.0171 = phi i32 [ undef, %476 ], [ %.3355, %1059 ]
  %.sroa.0.0172 = phi i32 [ undef, %476 ], [ %.sroa.0.2356, %1059 ]
  %.sroa.0.0173 = phi i32 [ undef, %476 ], [ %.sroa.0.2357, %1059 ]
  %.sroa.0.0174 = phi i32 [ undef, %476 ], [ %.sroa.0.2358, %1059 ]
  %.sroa.0.0175 = phi i32 [ undef, %476 ], [ %.sroa.0.2359, %1059 ]
  %.sroa.0.0176 = phi i32 [ undef, %476 ], [ %.sroa.0.2360, %1059 ]
  %.sroa.0.0177 = phi i32 [ undef, %476 ], [ %.sroa.0.2361, %1059 ]
  %.sroa.0.0178 = phi i32 [ undef, %476 ], [ %.sroa.0.2362, %1059 ]
  %.sroa.0.0179 = phi i32 [ undef, %476 ], [ %.sroa.0.2363, %1059 ]
  %.sroa.0180.0180 = phi i32 [ undef, %476 ], [ %.sroa.0180.2364, %1059 ]
  %.sroa.0180.0181 = phi i32 [ undef, %476 ], [ %.sroa.0180.2365, %1059 ]
  %.sroa.0180.0182 = phi i32 [ undef, %476 ], [ %.sroa.0180.2366, %1059 ]
  %.sroa.0180.0183 = phi i32 [ undef, %476 ], [ %.sroa.0180.2367, %1059 ]
  %.sroa.0180.0184 = phi i32 [ undef, %476 ], [ %.sroa.0180.2368, %1059 ]
  %.sroa.0180.0185 = phi i32 [ undef, %476 ], [ %.sroa.0180.2369, %1059 ]
  %.sroa.0180.0186 = phi i32 [ undef, %476 ], [ %.sroa.0180.2370, %1059 ]
  %.sroa.0180.0187 = phi i32 [ undef, %476 ], [ %.sroa.0180.2371, %1059 ]
  %.sroa.0182.0188 = phi i32 [ undef, %476 ], [ %.sroa.0182.2372, %1059 ]
  %.sroa.0182.0189 = phi i32 [ undef, %476 ], [ %.sroa.0182.2373, %1059 ]
  %.sroa.0182.0190 = phi i32 [ undef, %476 ], [ %.sroa.0182.2374, %1059 ]
  %.sroa.0182.0191 = phi i32 [ undef, %476 ], [ %.sroa.0182.2375, %1059 ]
  %.sroa.0182.0192 = phi i32 [ undef, %476 ], [ %.sroa.0182.2376, %1059 ]
  %.sroa.0182.0193 = phi i32 [ undef, %476 ], [ %.sroa.0182.2377, %1059 ]
  %.sroa.0182.0194 = phi i32 [ undef, %476 ], [ %.sroa.0182.2378, %1059 ]
  %.sroa.0182.0195 = phi i32 [ undef, %476 ], [ %.sroa.0182.2379, %1059 ]
  %.sroa.0184.0196 = phi i32 [ undef, %476 ], [ %.sroa.0184.2380, %1059 ]
  %.sroa.0184.0197 = phi i32 [ undef, %476 ], [ %.sroa.0184.2381, %1059 ]
  %.sroa.0184.0198 = phi i32 [ undef, %476 ], [ %.sroa.0184.2382, %1059 ]
  %.sroa.0184.0199 = phi i32 [ undef, %476 ], [ %.sroa.0184.2383, %1059 ]
  %.sroa.0184.0200 = phi i32 [ undef, %476 ], [ %.sroa.0184.2384, %1059 ]
  %.sroa.0184.0201 = phi i32 [ undef, %476 ], [ %.sroa.0184.2385, %1059 ]
  %.sroa.0184.0202 = phi i32 [ undef, %476 ], [ %.sroa.0184.2386, %1059 ]
  %.sroa.0184.0203 = phi i32 [ undef, %476 ], [ %.sroa.0184.2387, %1059 ]
  %506 = phi i32 [ 0, %476 ], [ %1056, %1059 ]
  %507 = icmp ult i32 %506, 256
  br i1 %507, label %509, label %508

508:                                              ; preds = %505
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %33)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %32)
  br label %1060

509:                                              ; preds = %505
  br i1 %485, label %517, label %.preheader

.preheader:                                       ; preds = %509
  br label %510

510:                                              ; preds = %513, %.preheader
  %511 = phi i32 [ %516, %513 ], [ 0, %.preheader ]
  %512 = icmp ult i32 %511, 64
  br i1 %512, label %513, label %.loopexit2

513:                                              ; preds = %510
  %514 = zext i32 %511 to i64
  %515 = getelementptr inbounds half, ptr addrspace(3) %484, i64 %514
  store half 0xH0000, ptr addrspace(3) %515, align 2
  %516 = add nuw nsw i32 %511, 1, !spirv.Decorations !743
  br label %510, !llvm.loop !797

517:                                              ; preds = %509
  %518 = load float, ptr addrspace(1) %492, align 4
  %519 = load float, ptr addrspace(1) %493, align 4
  %520 = lshr exact i32 %506, 1
  %521 = or i32 %520, %494
  %522 = zext i32 %521 to i64
  %523 = getelementptr inbounds i8, ptr addrspace(1) %497, i64 %522
  br label %524

524:                                              ; preds = %534, %517
  %525 = phi i32 [ 0, %517 ], [ %535, %534 ]
  %526 = icmp ult i32 %525, 32
  br i1 %526, label %527, label %.loopexit1

527:                                              ; preds = %524
  %528 = zext i32 %525 to i64
  %529 = getelementptr inbounds i8, ptr addrspace(1) %523, i64 %528
  %530 = load i64, ptr addrspace(1) %529, align 1
  br label %531

531:                                              ; preds = %536, %527
  %532 = phi i32 [ 0, %527 ], [ %557, %536 ]
  %533 = icmp ult i32 %532, 8
  br i1 %533, label %536, label %534

534:                                              ; preds = %531
  %535 = add nuw nsw i32 %525, 8, !spirv.Decorations !743
  br label %524, !llvm.loop !798

536:                                              ; preds = %531
  %537 = shl nuw nsw i32 %532, 3, !spirv.Decorations !743
  %538 = zext i32 %537 to i64
  %539 = lshr i64 %530, %538
  %540 = trunc i64 %539 to i32
  %541 = and i32 %540, 15
  %542 = uitofp i32 %541 to float
  %543 = fsub reassoc nsz arcp contract float %542, %519, !spirv.Decorations !748
  %544 = fmul reassoc nsz arcp contract float %543, %518, !spirv.Decorations !748
  %545 = fptrunc float %544 to half
  %546 = or i32 %525, %532
  %547 = shl nuw nsw i32 %546, 1, !spirv.Decorations !743
  %548 = zext i32 %547 to i64
  %549 = getelementptr half, ptr addrspace(3) %484, i64 %548
  store half %545, ptr addrspace(3) %549, align 4
  %550 = lshr i32 %540, 4
  %551 = and i32 %550, 15
  %552 = uitofp i32 %551 to float
  %553 = fsub reassoc nsz arcp contract float %552, %519, !spirv.Decorations !748
  %554 = fmul reassoc nsz arcp contract float %553, %518, !spirv.Decorations !748
  %555 = fptrunc float %554 to half
  %556 = getelementptr half, ptr addrspace(3) %549, i64 1
  store half %555, ptr addrspace(3) %556, align 2
  %557 = add nuw nsw i32 %532, 1, !spirv.Decorations !743
  br label %531, !llvm.loop !799

.loopexit1:                                       ; preds = %524
  br label %558

.loopexit2:                                       ; preds = %510
  br label %558

558:                                              ; preds = %.loopexit2, %.loopexit1
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br i1 %75, label %559, label %1055

559:                                              ; preds = %558
  %560 = zext i32 %506 to i64
  %561 = getelementptr inbounds float, ptr addrspace(1) %504, i64 %560
  br label %562

562:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51, %559
  %.1199204 = phi i16 [ %.0198132, %559 ], [ %.2200276, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199205 = phi i16 [ %.0198133, %559 ], [ %.2200277, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199206 = phi i16 [ %.0198134, %559 ], [ %.2200278, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199207 = phi i16 [ %.0198135, %559 ], [ %.2200279, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199208 = phi i16 [ %.0198136, %559 ], [ %.2200280, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199209 = phi i16 [ %.0198137, %559 ], [ %.2200281, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199210 = phi i16 [ %.0198138, %559 ], [ %.2200282, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1199211 = phi i16 [ %.0198139, %559 ], [ %.2200283, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195212 = phi i32 [ %.0194140, %559 ], [ %.2196284, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195213 = phi i32 [ %.0194141, %559 ], [ %.2196285, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195214 = phi i32 [ %.0194142, %559 ], [ %.2196286, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195215 = phi i32 [ %.0194143, %559 ], [ %.2196287, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195216 = phi i32 [ %.0194144, %559 ], [ %.2196288, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195217 = phi i32 [ %.0194145, %559 ], [ %.2196289, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195218 = phi i32 [ %.0194146, %559 ], [ %.2196290, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1195219 = phi i32 [ %.0194147, %559 ], [ %.2196291, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191220 = phi i32 [ %.0190148, %559 ], [ %.2192292, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191221 = phi i32 [ %.0190149, %559 ], [ %.2192293, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191222 = phi i32 [ %.0190150, %559 ], [ %.2192294, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191223 = phi i32 [ %.0190151, %559 ], [ %.2192295, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191224 = phi i32 [ %.0190152, %559 ], [ %.2192296, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191225 = phi i32 [ %.0190153, %559 ], [ %.2192297, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191226 = phi i32 [ %.0190154, %559 ], [ %.2192298, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1191227 = phi i32 [ %.0190155, %559 ], [ %.2192299, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187228 = phi i32 [ %.0186156, %559 ], [ %.2188300, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187229 = phi i32 [ %.0186157, %559 ], [ %.2188301, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187230 = phi i32 [ %.0186158, %559 ], [ %.2188302, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187231 = phi i32 [ %.0186159, %559 ], [ %.2188303, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187232 = phi i32 [ %.0186160, %559 ], [ %.2188304, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187233 = phi i32 [ %.0186161, %559 ], [ %.2188305, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187234 = phi i32 [ %.0186162, %559 ], [ %.2188306, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1187235 = phi i32 [ %.0186163, %559 ], [ %.2188307, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1236 = phi i32 [ %.0164, %559 ], [ %.2308, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1237 = phi i32 [ %.0165, %559 ], [ %.2309, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1238 = phi i32 [ %.0166, %559 ], [ %.2310, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1239 = phi i32 [ %.0167, %559 ], [ %.2311, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1240 = phi i32 [ %.0168, %559 ], [ %.2312, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1241 = phi i32 [ %.0169, %559 ], [ %.2313, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1242 = phi i32 [ %.0170, %559 ], [ %.2314, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.1243 = phi i32 [ %.0171, %559 ], [ %.2315, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1244 = phi i32 [ %.sroa.0.0172, %559 ], [ %610, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1245 = phi i32 [ %.sroa.0.0173, %559 ], [ %611, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1246 = phi i32 [ %.sroa.0.0174, %559 ], [ %612, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1247 = phi i32 [ %.sroa.0.0175, %559 ], [ %613, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1248 = phi i32 [ %.sroa.0.0176, %559 ], [ %614, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1249 = phi i32 [ %.sroa.0.0177, %559 ], [ %615, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1250 = phi i32 [ %.sroa.0.0178, %559 ], [ %616, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0.1251 = phi i32 [ %.sroa.0.0179, %559 ], [ %617, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1252 = phi i32 [ %.sroa.0180.0180, %559 ], [ %649, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1253 = phi i32 [ %.sroa.0180.0181, %559 ], [ %650, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1254 = phi i32 [ %.sroa.0180.0182, %559 ], [ %651, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1255 = phi i32 [ %.sroa.0180.0183, %559 ], [ %652, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1256 = phi i32 [ %.sroa.0180.0184, %559 ], [ %653, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1257 = phi i32 [ %.sroa.0180.0185, %559 ], [ %654, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1258 = phi i32 [ %.sroa.0180.0186, %559 ], [ %655, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0180.1259 = phi i32 [ %.sroa.0180.0187, %559 ], [ %656, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1260 = phi i32 [ %.sroa.0182.0188, %559 ], [ %688, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1261 = phi i32 [ %.sroa.0182.0189, %559 ], [ %689, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1262 = phi i32 [ %.sroa.0182.0190, %559 ], [ %690, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1263 = phi i32 [ %.sroa.0182.0191, %559 ], [ %691, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1264 = phi i32 [ %.sroa.0182.0192, %559 ], [ %692, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1265 = phi i32 [ %.sroa.0182.0193, %559 ], [ %693, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1266 = phi i32 [ %.sroa.0182.0194, %559 ], [ %694, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0182.1267 = phi i32 [ %.sroa.0182.0195, %559 ], [ %695, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1268 = phi i32 [ %.sroa.0184.0196, %559 ], [ %727, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1269 = phi i32 [ %.sroa.0184.0197, %559 ], [ %728, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1270 = phi i32 [ %.sroa.0184.0198, %559 ], [ %729, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1271 = phi i32 [ %.sroa.0184.0199, %559 ], [ %730, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1272 = phi i32 [ %.sroa.0184.0200, %559 ], [ %731, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1273 = phi i32 [ %.sroa.0184.0201, %559 ], [ %732, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1274 = phi i32 [ %.sroa.0184.0202, %559 ], [ %733, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %.sroa.0184.1275 = phi i32 [ %.sroa.0184.0203, %559 ], [ %734, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %563 = phi i32 [ 0, %559 ], [ %765, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51 ]
  %564 = icmp ult i32 %563, 128
  br i1 %564, label %565, label %.loopexit

565:                                              ; preds = %562
  %566 = zext i32 %563 to i64
  %567 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM, i64 %566
  br label %568

568:                                              ; preds = %766, %565
  %.2200276 = phi i16 [ %.1199204, %565 ], [ %769, %766 ]
  %.2200277 = phi i16 [ %.1199205, %565 ], [ %771, %766 ]
  %.2200278 = phi i16 [ %.1199206, %565 ], [ %773, %766 ]
  %.2200279 = phi i16 [ %.1199207, %565 ], [ %775, %766 ]
  %.2200280 = phi i16 [ %.1199208, %565 ], [ %777, %766 ]
  %.2200281 = phi i16 [ %.1199209, %565 ], [ %779, %766 ]
  %.2200282 = phi i16 [ %.1199210, %565 ], [ %781, %766 ]
  %.2200283 = phi i16 [ %.1199211, %565 ], [ %783, %766 ]
  %.2196284 = phi i32 [ %.1195212, %565 ], [ %995, %766 ]
  %.2196285 = phi i32 [ %.1195213, %565 ], [ %1002, %766 ]
  %.2196286 = phi i32 [ %.1195214, %565 ], [ %1009, %766 ]
  %.2196287 = phi i32 [ %.1195215, %565 ], [ %1016, %766 ]
  %.2196288 = phi i32 [ %.1195216, %565 ], [ %1023, %766 ]
  %.2196289 = phi i32 [ %.1195217, %565 ], [ %1030, %766 ]
  %.2196290 = phi i32 [ %.1195218, %565 ], [ %1037, %766 ]
  %.2196291 = phi i32 [ %.1195219, %565 ], [ %1044, %766 ]
  %.2192292 = phi i32 [ %.1191220, %565 ], [ %930, %766 ]
  %.2192293 = phi i32 [ %.1191221, %565 ], [ %937, %766 ]
  %.2192294 = phi i32 [ %.1191222, %565 ], [ %944, %766 ]
  %.2192295 = phi i32 [ %.1191223, %565 ], [ %951, %766 ]
  %.2192296 = phi i32 [ %.1191224, %565 ], [ %958, %766 ]
  %.2192297 = phi i32 [ %.1191225, %565 ], [ %965, %766 ]
  %.2192298 = phi i32 [ %.1191226, %565 ], [ %972, %766 ]
  %.2192299 = phi i32 [ %.1191227, %565 ], [ %979, %766 ]
  %.2188300 = phi i32 [ %.1187228, %565 ], [ %865, %766 ]
  %.2188301 = phi i32 [ %.1187229, %565 ], [ %872, %766 ]
  %.2188302 = phi i32 [ %.1187230, %565 ], [ %879, %766 ]
  %.2188303 = phi i32 [ %.1187231, %565 ], [ %886, %766 ]
  %.2188304 = phi i32 [ %.1187232, %565 ], [ %893, %766 ]
  %.2188305 = phi i32 [ %.1187233, %565 ], [ %900, %766 ]
  %.2188306 = phi i32 [ %.1187234, %565 ], [ %907, %766 ]
  %.2188307 = phi i32 [ %.1187235, %565 ], [ %914, %766 ]
  %.2308 = phi i32 [ %.1236, %565 ], [ %800, %766 ]
  %.2309 = phi i32 [ %.1237, %565 ], [ %807, %766 ]
  %.2310 = phi i32 [ %.1238, %565 ], [ %814, %766 ]
  %.2311 = phi i32 [ %.1239, %565 ], [ %821, %766 ]
  %.2312 = phi i32 [ %.1240, %565 ], [ %828, %766 ]
  %.2313 = phi i32 [ %.1241, %565 ], [ %835, %766 ]
  %.2314 = phi i32 [ %.1242, %565 ], [ %842, %766 ]
  %.2315 = phi i32 [ %.1243, %565 ], [ %849, %766 ]
  %569 = phi <8 x float> [ zeroinitializer, %565 ], [ %1053, %766 ]
  %570 = phi <8 x float> [ zeroinitializer, %565 ], [ %988, %766 ]
  %571 = phi <8 x float> [ zeroinitializer, %565 ], [ %923, %766 ]
  %572 = phi <8 x float> [ zeroinitializer, %565 ], [ %858, %766 ]
  %573 = phi i32 [ 0, %565 ], [ %1054, %766 ]
  %574 = extractelement <8 x float> %569, i32 0
  %575 = extractelement <8 x float> %569, i32 1
  %576 = extractelement <8 x float> %569, i32 2
  %577 = extractelement <8 x float> %569, i32 3
  %578 = extractelement <8 x float> %569, i32 4
  %579 = extractelement <8 x float> %569, i32 5
  %580 = extractelement <8 x float> %569, i32 6
  %581 = extractelement <8 x float> %569, i32 7
  %582 = extractelement <8 x float> %570, i32 0
  %583 = extractelement <8 x float> %570, i32 1
  %584 = extractelement <8 x float> %570, i32 2
  %585 = extractelement <8 x float> %570, i32 3
  %586 = extractelement <8 x float> %570, i32 4
  %587 = extractelement <8 x float> %570, i32 5
  %588 = extractelement <8 x float> %570, i32 6
  %589 = extractelement <8 x float> %570, i32 7
  %590 = extractelement <8 x float> %571, i32 0
  %591 = extractelement <8 x float> %571, i32 1
  %592 = extractelement <8 x float> %571, i32 2
  %593 = extractelement <8 x float> %571, i32 3
  %594 = extractelement <8 x float> %571, i32 4
  %595 = extractelement <8 x float> %571, i32 5
  %596 = extractelement <8 x float> %571, i32 6
  %597 = extractelement <8 x float> %571, i32 7
  %598 = extractelement <8 x float> %572, i32 0
  %599 = extractelement <8 x float> %572, i32 1
  %600 = extractelement <8 x float> %572, i32 2
  %601 = extractelement <8 x float> %572, i32 3
  %602 = extractelement <8 x float> %572, i32 4
  %603 = extractelement <8 x float> %572, i32 5
  %604 = extractelement <8 x float> %572, i32 6
  %605 = extractelement <8 x float> %572, i32 7
  %606 = icmp ult i32 %573, 64
  br i1 %606, label %766, label %607

607:                                              ; preds = %568
  %608 = zext i32 %563 to i64
  %609 = getelementptr inbounds float, ptr addrspace(1) %561, i64 %608
  %610 = bitcast float %598 to i32
  %611 = bitcast float %599 to i32
  %612 = bitcast float %600 to i32
  %613 = bitcast float %601 to i32
  %614 = bitcast float %602 to i32
  %615 = bitcast float %603 to i32
  %616 = bitcast float %604 to i32
  %617 = bitcast float %605 to i32
  %618 = insertelement <8 x i32> undef, i32 %610, i32 0
  %619 = insertelement <8 x i32> %618, i32 %611, i32 1
  %620 = insertelement <8 x i32> %619, i32 %612, i32 2
  %621 = insertelement <8 x i32> %620, i32 %613, i32 3
  %622 = insertelement <8 x i32> %621, i32 %614, i32 4
  %623 = insertelement <8 x i32> %622, i32 %615, i32 5
  %624 = insertelement <8 x i32> %623, i32 %616, i32 6
  %625 = insertelement <8 x i32> %624, i32 %617, i32 7
  %.ascast.i45 = addrspacecast ptr addrspace(1) %609 to ptr addrspace(4)
  %626 = mul i32 %22, %21
  %627 = mul i32 %626, %23
  %628 = and i32 %627, 15
  %629 = icmp eq i32 %628, 0
  br i1 %629, label %642, label %630

630:                                              ; preds = %607
  %localIdZ74 = zext i16 %localIdZ to i32
  %631 = mul i32 %22, %localIdZ74
  %localIdY76 = zext i16 %localIdY to i32
  %632 = add i32 %631, %localIdY76
  %633 = mul i32 %632, %21
  %localIdX78 = zext i16 %localIdX to i32
  %634 = add i32 %633, %localIdX78
  %635 = lshr i32 %634, 4
  %636 = mul i32 %22, %21
  %637 = mul i32 %636, %23
  %638 = add i32 %637, 15
  %639 = lshr i32 %638, 4
  %640 = add nsw i32 %639, -1
  %641 = icmp ult i32 %635, %640
  br i1 %641, label %642, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

642:                                              ; preds = %630, %607
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit: ; preds = %630, %642
  %643 = ptrtoint ptr addrspace(4) %.ascast.i45 to i64
  %644 = and i64 %643, -64
  %645 = trunc i64 %643 to i32
  %646 = lshr i32 %645, 2
  %647 = and i32 %646, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %644, i32 1023, i32 7, i32 1023, i32 %647, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %625)
  %648 = getelementptr inbounds float, ptr addrspace(1) %609, i64 16
  %649 = bitcast float %590 to i32
  %650 = bitcast float %591 to i32
  %651 = bitcast float %592 to i32
  %652 = bitcast float %593 to i32
  %653 = bitcast float %594 to i32
  %654 = bitcast float %595 to i32
  %655 = bitcast float %596 to i32
  %656 = bitcast float %597 to i32
  %657 = insertelement <8 x i32> undef, i32 %649, i32 0
  %658 = insertelement <8 x i32> %657, i32 %650, i32 1
  %659 = insertelement <8 x i32> %658, i32 %651, i32 2
  %660 = insertelement <8 x i32> %659, i32 %652, i32 3
  %661 = insertelement <8 x i32> %660, i32 %653, i32 4
  %662 = insertelement <8 x i32> %661, i32 %654, i32 5
  %663 = insertelement <8 x i32> %662, i32 %655, i32 6
  %664 = insertelement <8 x i32> %663, i32 %656, i32 7
  %.ascast.i46 = addrspacecast ptr addrspace(1) %648 to ptr addrspace(4)
  %665 = mul i32 %22, %21
  %666 = mul i32 %665, %23
  %667 = and i32 %666, 15
  %668 = icmp eq i32 %667, 0
  br i1 %668, label %681, label %669

669:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  %localIdZ85 = zext i16 %localIdZ to i32
  %670 = mul i32 %22, %localIdZ85
  %localIdY87 = zext i16 %localIdY to i32
  %671 = add i32 %670, %localIdY87
  %672 = mul i32 %671, %21
  %localIdX89 = zext i16 %localIdX to i32
  %673 = add i32 %672, %localIdX89
  %674 = lshr i32 %673, 4
  %675 = mul i32 %22, %21
  %676 = mul i32 %675, %23
  %677 = add i32 %676, 15
  %678 = lshr i32 %677, 4
  %679 = add nsw i32 %678, -1
  %680 = icmp ult i32 %674, %679
  br i1 %680, label %681, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47

681:                                              ; preds = %669, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47: ; preds = %669, %681
  %682 = ptrtoint ptr addrspace(4) %.ascast.i46 to i64
  %683 = and i64 %682, -64
  %684 = trunc i64 %682 to i32
  %685 = lshr i32 %684, 2
  %686 = and i32 %685, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %683, i32 1023, i32 7, i32 1023, i32 %686, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %664)
  %687 = getelementptr inbounds float, ptr addrspace(1) %609, i64 32
  %688 = bitcast float %582 to i32
  %689 = bitcast float %583 to i32
  %690 = bitcast float %584 to i32
  %691 = bitcast float %585 to i32
  %692 = bitcast float %586 to i32
  %693 = bitcast float %587 to i32
  %694 = bitcast float %588 to i32
  %695 = bitcast float %589 to i32
  %696 = insertelement <8 x i32> undef, i32 %688, i32 0
  %697 = insertelement <8 x i32> %696, i32 %689, i32 1
  %698 = insertelement <8 x i32> %697, i32 %690, i32 2
  %699 = insertelement <8 x i32> %698, i32 %691, i32 3
  %700 = insertelement <8 x i32> %699, i32 %692, i32 4
  %701 = insertelement <8 x i32> %700, i32 %693, i32 5
  %702 = insertelement <8 x i32> %701, i32 %694, i32 6
  %703 = insertelement <8 x i32> %702, i32 %695, i32 7
  %.ascast.i48 = addrspacecast ptr addrspace(1) %687 to ptr addrspace(4)
  %704 = mul i32 %22, %21
  %705 = mul i32 %704, %23
  %706 = and i32 %705, 15
  %707 = icmp eq i32 %706, 0
  br i1 %707, label %720, label %708

708:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47
  %localIdZ96 = zext i16 %localIdZ to i32
  %709 = mul i32 %22, %localIdZ96
  %localIdY98 = zext i16 %localIdY to i32
  %710 = add i32 %709, %localIdY98
  %711 = mul i32 %710, %21
  %localIdX100 = zext i16 %localIdX to i32
  %712 = add i32 %711, %localIdX100
  %713 = lshr i32 %712, 4
  %714 = mul i32 %22, %21
  %715 = mul i32 %714, %23
  %716 = add i32 %715, 15
  %717 = lshr i32 %716, 4
  %718 = add nsw i32 %717, -1
  %719 = icmp ult i32 %713, %718
  br i1 %719, label %720, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49

720:                                              ; preds = %708, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit47
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49: ; preds = %708, %720
  %721 = ptrtoint ptr addrspace(4) %.ascast.i48 to i64
  %722 = and i64 %721, -64
  %723 = trunc i64 %721 to i32
  %724 = lshr i32 %723, 2
  %725 = and i32 %724, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %722, i32 1023, i32 7, i32 1023, i32 %725, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %703)
  %726 = getelementptr inbounds float, ptr addrspace(1) %609, i64 48
  %727 = bitcast float %574 to i32
  %728 = bitcast float %575 to i32
  %729 = bitcast float %576 to i32
  %730 = bitcast float %577 to i32
  %731 = bitcast float %578 to i32
  %732 = bitcast float %579 to i32
  %733 = bitcast float %580 to i32
  %734 = bitcast float %581 to i32
  %735 = insertelement <8 x i32> undef, i32 %727, i32 0
  %736 = insertelement <8 x i32> %735, i32 %728, i32 1
  %737 = insertelement <8 x i32> %736, i32 %729, i32 2
  %738 = insertelement <8 x i32> %737, i32 %730, i32 3
  %739 = insertelement <8 x i32> %738, i32 %731, i32 4
  %740 = insertelement <8 x i32> %739, i32 %732, i32 5
  %741 = insertelement <8 x i32> %740, i32 %733, i32 6
  %742 = insertelement <8 x i32> %741, i32 %734, i32 7
  %.ascast.i50 = addrspacecast ptr addrspace(1) %726 to ptr addrspace(4)
  %743 = mul i32 %22, %21
  %744 = mul i32 %743, %23
  %745 = and i32 %744, 15
  %746 = icmp eq i32 %745, 0
  br i1 %746, label %759, label %747

747:                                              ; preds = %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49
  %localIdZ107 = zext i16 %localIdZ to i32
  %748 = mul i32 %22, %localIdZ107
  %localIdY109 = zext i16 %localIdY to i32
  %749 = add i32 %748, %localIdY109
  %750 = mul i32 %749, %21
  %localIdX111 = zext i16 %localIdX to i32
  %751 = add i32 %750, %localIdX111
  %752 = lshr i32 %751, 4
  %753 = mul i32 %22, %21
  %754 = mul i32 %753, %23
  %755 = add i32 %754, 15
  %756 = lshr i32 %755, 4
  %757 = add nsw i32 %756, -1
  %758 = icmp ult i32 %752, %757
  br i1 %758, label %759, label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51

759:                                              ; preds = %747, %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit49
  br label %__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51

__builtin_spriv_OpJointMatrixStoreINTEL_Accumulator_RowMajor_SG16_8x16_i32_8_global_pi64_v8i8.698.exit51: ; preds = %747, %759
  %760 = ptrtoint ptr addrspace(4) %.ascast.i50 to i64
  %761 = and i64 %760, -64
  %762 = trunc i64 %760 to i32
  %763 = lshr i32 %762, 2
  %764 = and i32 %763, 15
  call void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64 %761, i32 1023, i32 7, i32 1023, i32 %764, i32 0, i32 32, i32 16, i32 8, i32 1, i1 false, i1 false, i32 0, <8 x i32> %742)
  %765 = add nuw nsw i32 %563, 64, !spirv.Decorations !743
  br label %562

766:                                              ; preds = %568
  %767 = zext i32 %573 to i64
  %768 = getelementptr inbounds %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %501, i64 %767
  %769 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %768)
  %770 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 64
  %771 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %770)
  %772 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 128
  %773 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %772)
  %774 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 192
  %775 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %774)
  %776 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 256
  %777 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %776)
  %778 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 320
  %779 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %778)
  %780 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 384
  %781 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %780)
  %782 = getelementptr inbounds i16, ptr addrspace(3) %768, i64 448
  %783 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %782)
  %784 = insertelement <8 x i16> undef, i16 %769, i32 0
  %785 = insertelement <8 x i16> %784, i16 %771, i32 1
  %786 = insertelement <8 x i16> %785, i16 %773, i32 2
  %787 = insertelement <8 x i16> %786, i16 %775, i32 3
  %788 = insertelement <8 x i16> %787, i16 %777, i32 4
  %789 = insertelement <8 x i16> %788, i16 %779, i32 5
  %790 = insertelement <8 x i16> %789, i16 %781, i32 6
  %791 = insertelement <8 x i16> %790, i16 %783, i32 7
  %792 = shl nuw nsw i32 %573, 7, !spirv.Decorations !743
  %793 = zext i32 %792 to i64
  %794 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %567, i64 %793
  %795 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %794)
  %796 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 64
  %797 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %796)
  %798 = insertelement <2 x i16> undef, i16 %795, i32 0
  %799 = insertelement <2 x i16> %798, i16 %797, i32 1
  %800 = bitcast <2 x i16> %799 to i32
  %801 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 128
  %802 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %801)
  %803 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 192
  %804 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %803)
  %805 = insertelement <2 x i16> undef, i16 %802, i32 0
  %806 = insertelement <2 x i16> %805, i16 %804, i32 1
  %807 = bitcast <2 x i16> %806 to i32
  %808 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 256
  %809 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %808)
  %810 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 320
  %811 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %810)
  %812 = insertelement <2 x i16> undef, i16 %809, i32 0
  %813 = insertelement <2 x i16> %812, i16 %811, i32 1
  %814 = bitcast <2 x i16> %813 to i32
  %815 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 384
  %816 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %815)
  %817 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 448
  %818 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %817)
  %819 = insertelement <2 x i16> undef, i16 %816, i32 0
  %820 = insertelement <2 x i16> %819, i16 %818, i32 1
  %821 = bitcast <2 x i16> %820 to i32
  %822 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 512
  %823 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %822)
  %824 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 576
  %825 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %824)
  %826 = insertelement <2 x i16> undef, i16 %823, i32 0
  %827 = insertelement <2 x i16> %826, i16 %825, i32 1
  %828 = bitcast <2 x i16> %827 to i32
  %829 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 640
  %830 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %829)
  %831 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 704
  %832 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %831)
  %833 = insertelement <2 x i16> undef, i16 %830, i32 0
  %834 = insertelement <2 x i16> %833, i16 %832, i32 1
  %835 = bitcast <2 x i16> %834 to i32
  %836 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 768
  %837 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %836)
  %838 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 832
  %839 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %838)
  %840 = insertelement <2 x i16> undef, i16 %837, i32 0
  %841 = insertelement <2 x i16> %840, i16 %839, i32 1
  %842 = bitcast <2 x i16> %841 to i32
  %843 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 896
  %844 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %843)
  %845 = getelementptr inbounds i32, ptr addrspace(3) %794, i64 960
  %846 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %845)
  %847 = insertelement <2 x i16> undef, i16 %844, i32 0
  %848 = insertelement <2 x i16> %847, i16 %846, i32 1
  %849 = bitcast <2 x i16> %848 to i32
  %850 = insertelement <8 x i32> undef, i32 %800, i32 0
  %851 = insertelement <8 x i32> %850, i32 %807, i32 1
  %852 = insertelement <8 x i32> %851, i32 %814, i32 2
  %853 = insertelement <8 x i32> %852, i32 %821, i32 3
  %854 = insertelement <8 x i32> %853, i32 %828, i32 4
  %855 = insertelement <8 x i32> %854, i32 %835, i32 5
  %856 = insertelement <8 x i32> %855, i32 %842, i32 6
  %857 = insertelement <8 x i32> %856, i32 %849, i32 7
  %858 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %572, <8 x i16> %791, <8 x i32> %857, i32 12, i32 12, i32 8, i32 8, i1 false)
  %859 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 16
  %860 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %859)
  %861 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 144
  %862 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %861)
  %863 = insertelement <2 x i16> undef, i16 %860, i32 0
  %864 = insertelement <2 x i16> %863, i16 %862, i32 1
  %865 = bitcast <2 x i16> %864 to i32
  %866 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 272
  %867 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %866)
  %868 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 400
  %869 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %868)
  %870 = insertelement <2 x i16> undef, i16 %867, i32 0
  %871 = insertelement <2 x i16> %870, i16 %869, i32 1
  %872 = bitcast <2 x i16> %871 to i32
  %873 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 528
  %874 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %873)
  %875 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 656
  %876 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %875)
  %877 = insertelement <2 x i16> undef, i16 %874, i32 0
  %878 = insertelement <2 x i16> %877, i16 %876, i32 1
  %879 = bitcast <2 x i16> %878 to i32
  %880 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 784
  %881 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %880)
  %882 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 912
  %883 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %882)
  %884 = insertelement <2 x i16> undef, i16 %881, i32 0
  %885 = insertelement <2 x i16> %884, i16 %883, i32 1
  %886 = bitcast <2 x i16> %885 to i32
  %887 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1040
  %888 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %887)
  %889 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1168
  %890 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %889)
  %891 = insertelement <2 x i16> undef, i16 %888, i32 0
  %892 = insertelement <2 x i16> %891, i16 %890, i32 1
  %893 = bitcast <2 x i16> %892 to i32
  %894 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1296
  %895 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %894)
  %896 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1424
  %897 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %896)
  %898 = insertelement <2 x i16> undef, i16 %895, i32 0
  %899 = insertelement <2 x i16> %898, i16 %897, i32 1
  %900 = bitcast <2 x i16> %899 to i32
  %901 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1552
  %902 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %901)
  %903 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1680
  %904 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %903)
  %905 = insertelement <2 x i16> undef, i16 %902, i32 0
  %906 = insertelement <2 x i16> %905, i16 %904, i32 1
  %907 = bitcast <2 x i16> %906 to i32
  %908 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1808
  %909 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %908)
  %910 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1936
  %911 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %910)
  %912 = insertelement <2 x i16> undef, i16 %909, i32 0
  %913 = insertelement <2 x i16> %912, i16 %911, i32 1
  %914 = bitcast <2 x i16> %913 to i32
  %915 = insertelement <8 x i32> undef, i32 %865, i32 0
  %916 = insertelement <8 x i32> %915, i32 %872, i32 1
  %917 = insertelement <8 x i32> %916, i32 %879, i32 2
  %918 = insertelement <8 x i32> %917, i32 %886, i32 3
  %919 = insertelement <8 x i32> %918, i32 %893, i32 4
  %920 = insertelement <8 x i32> %919, i32 %900, i32 5
  %921 = insertelement <8 x i32> %920, i32 %907, i32 6
  %922 = insertelement <8 x i32> %921, i32 %914, i32 7
  %923 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %571, <8 x i16> %791, <8 x i32> %922, i32 12, i32 12, i32 8, i32 8, i1 false)
  %924 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 32
  %925 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %924)
  %926 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 160
  %927 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %926)
  %928 = insertelement <2 x i16> undef, i16 %925, i32 0
  %929 = insertelement <2 x i16> %928, i16 %927, i32 1
  %930 = bitcast <2 x i16> %929 to i32
  %931 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 288
  %932 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %931)
  %933 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 416
  %934 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %933)
  %935 = insertelement <2 x i16> undef, i16 %932, i32 0
  %936 = insertelement <2 x i16> %935, i16 %934, i32 1
  %937 = bitcast <2 x i16> %936 to i32
  %938 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 544
  %939 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %938)
  %940 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 672
  %941 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %940)
  %942 = insertelement <2 x i16> undef, i16 %939, i32 0
  %943 = insertelement <2 x i16> %942, i16 %941, i32 1
  %944 = bitcast <2 x i16> %943 to i32
  %945 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 800
  %946 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %945)
  %947 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 928
  %948 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %947)
  %949 = insertelement <2 x i16> undef, i16 %946, i32 0
  %950 = insertelement <2 x i16> %949, i16 %948, i32 1
  %951 = bitcast <2 x i16> %950 to i32
  %952 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1056
  %953 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %952)
  %954 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1184
  %955 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %954)
  %956 = insertelement <2 x i16> undef, i16 %953, i32 0
  %957 = insertelement <2 x i16> %956, i16 %955, i32 1
  %958 = bitcast <2 x i16> %957 to i32
  %959 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1312
  %960 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %959)
  %961 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1440
  %962 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %961)
  %963 = insertelement <2 x i16> undef, i16 %960, i32 0
  %964 = insertelement <2 x i16> %963, i16 %962, i32 1
  %965 = bitcast <2 x i16> %964 to i32
  %966 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1568
  %967 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %966)
  %968 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1696
  %969 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %968)
  %970 = insertelement <2 x i16> undef, i16 %967, i32 0
  %971 = insertelement <2 x i16> %970, i16 %969, i32 1
  %972 = bitcast <2 x i16> %971 to i32
  %973 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1824
  %974 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %973)
  %975 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1952
  %976 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %975)
  %977 = insertelement <2 x i16> undef, i16 %974, i32 0
  %978 = insertelement <2 x i16> %977, i16 %976, i32 1
  %979 = bitcast <2 x i16> %978 to i32
  %980 = insertelement <8 x i32> undef, i32 %930, i32 0
  %981 = insertelement <8 x i32> %980, i32 %937, i32 1
  %982 = insertelement <8 x i32> %981, i32 %944, i32 2
  %983 = insertelement <8 x i32> %982, i32 %951, i32 3
  %984 = insertelement <8 x i32> %983, i32 %958, i32 4
  %985 = insertelement <8 x i32> %984, i32 %965, i32 5
  %986 = insertelement <8 x i32> %985, i32 %972, i32 6
  %987 = insertelement <8 x i32> %986, i32 %979, i32 7
  %988 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %570, <8 x i16> %791, <8 x i32> %987, i32 12, i32 12, i32 8, i32 8, i1 false)
  %989 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 48
  %990 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %989)
  %991 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 176
  %992 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %991)
  %993 = insertelement <2 x i16> undef, i16 %990, i32 0
  %994 = insertelement <2 x i16> %993, i16 %992, i32 1
  %995 = bitcast <2 x i16> %994 to i32
  %996 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 304
  %997 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %996)
  %998 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 432
  %999 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %998)
  %1000 = insertelement <2 x i16> undef, i16 %997, i32 0
  %1001 = insertelement <2 x i16> %1000, i16 %999, i32 1
  %1002 = bitcast <2 x i16> %1001 to i32
  %1003 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 560
  %1004 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1003)
  %1005 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 688
  %1006 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1005)
  %1007 = insertelement <2 x i16> undef, i16 %1004, i32 0
  %1008 = insertelement <2 x i16> %1007, i16 %1006, i32 1
  %1009 = bitcast <2 x i16> %1008 to i32
  %1010 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 816
  %1011 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1010)
  %1012 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 944
  %1013 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1012)
  %1014 = insertelement <2 x i16> undef, i16 %1011, i32 0
  %1015 = insertelement <2 x i16> %1014, i16 %1013, i32 1
  %1016 = bitcast <2 x i16> %1015 to i32
  %1017 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1072
  %1018 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1017)
  %1019 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1200
  %1020 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1019)
  %1021 = insertelement <2 x i16> undef, i16 %1018, i32 0
  %1022 = insertelement <2 x i16> %1021, i16 %1020, i32 1
  %1023 = bitcast <2 x i16> %1022 to i32
  %1024 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1328
  %1025 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1024)
  %1026 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1456
  %1027 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1026)
  %1028 = insertelement <2 x i16> undef, i16 %1025, i32 0
  %1029 = insertelement <2 x i16> %1028, i16 %1027, i32 1
  %1030 = bitcast <2 x i16> %1029 to i32
  %1031 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1584
  %1032 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1031)
  %1033 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1712
  %1034 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1033)
  %1035 = insertelement <2 x i16> undef, i16 %1032, i32 0
  %1036 = insertelement <2 x i16> %1035, i16 %1034, i32 1
  %1037 = bitcast <2 x i16> %1036 to i32
  %1038 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1840
  %1039 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1038)
  %1040 = getelementptr %"class.sycl::_V1::detail::half_impl::half", ptr addrspace(3) %794, i64 1968
  %1041 = call i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3) %1040)
  %1042 = insertelement <2 x i16> undef, i16 %1039, i32 0
  %1043 = insertelement <2 x i16> %1042, i16 %1041, i32 1
  %1044 = bitcast <2 x i16> %1043 to i32
  %1045 = insertelement <8 x i32> undef, i32 %995, i32 0
  %1046 = insertelement <8 x i32> %1045, i32 %1002, i32 1
  %1047 = insertelement <8 x i32> %1046, i32 %1009, i32 2
  %1048 = insertelement <8 x i32> %1047, i32 %1016, i32 3
  %1049 = insertelement <8 x i32> %1048, i32 %1023, i32 4
  %1050 = insertelement <8 x i32> %1049, i32 %1030, i32 5
  %1051 = insertelement <8 x i32> %1050, i32 %1037, i32 6
  %1052 = insertelement <8 x i32> %1051, i32 %1044, i32 7
  %1053 = call <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float> %569, <8 x i16> %791, <8 x i32> %1052, i32 12, i32 12, i32 8, i32 8, i1 false)
  %1054 = add nuw nsw i32 %573, 16, !spirv.Decorations !743
  br label %568

.loopexit:                                        ; preds = %562
  br label %1055

1055:                                             ; preds = %.loopexit, %558
  %.3201316 = phi i16 [ %.1199204, %.loopexit ], [ %.0198132, %558 ]
  %.3201317 = phi i16 [ %.1199205, %.loopexit ], [ %.0198133, %558 ]
  %.3201318 = phi i16 [ %.1199206, %.loopexit ], [ %.0198134, %558 ]
  %.3201319 = phi i16 [ %.1199207, %.loopexit ], [ %.0198135, %558 ]
  %.3201320 = phi i16 [ %.1199208, %.loopexit ], [ %.0198136, %558 ]
  %.3201321 = phi i16 [ %.1199209, %.loopexit ], [ %.0198137, %558 ]
  %.3201322 = phi i16 [ %.1199210, %.loopexit ], [ %.0198138, %558 ]
  %.3201323 = phi i16 [ %.1199211, %.loopexit ], [ %.0198139, %558 ]
  %.3197324 = phi i32 [ %.1195212, %.loopexit ], [ %.0194140, %558 ]
  %.3197325 = phi i32 [ %.1195213, %.loopexit ], [ %.0194141, %558 ]
  %.3197326 = phi i32 [ %.1195214, %.loopexit ], [ %.0194142, %558 ]
  %.3197327 = phi i32 [ %.1195215, %.loopexit ], [ %.0194143, %558 ]
  %.3197328 = phi i32 [ %.1195216, %.loopexit ], [ %.0194144, %558 ]
  %.3197329 = phi i32 [ %.1195217, %.loopexit ], [ %.0194145, %558 ]
  %.3197330 = phi i32 [ %.1195218, %.loopexit ], [ %.0194146, %558 ]
  %.3197331 = phi i32 [ %.1195219, %.loopexit ], [ %.0194147, %558 ]
  %.3193332 = phi i32 [ %.1191220, %.loopexit ], [ %.0190148, %558 ]
  %.3193333 = phi i32 [ %.1191221, %.loopexit ], [ %.0190149, %558 ]
  %.3193334 = phi i32 [ %.1191222, %.loopexit ], [ %.0190150, %558 ]
  %.3193335 = phi i32 [ %.1191223, %.loopexit ], [ %.0190151, %558 ]
  %.3193336 = phi i32 [ %.1191224, %.loopexit ], [ %.0190152, %558 ]
  %.3193337 = phi i32 [ %.1191225, %.loopexit ], [ %.0190153, %558 ]
  %.3193338 = phi i32 [ %.1191226, %.loopexit ], [ %.0190154, %558 ]
  %.3193339 = phi i32 [ %.1191227, %.loopexit ], [ %.0190155, %558 ]
  %.3189340 = phi i32 [ %.1187228, %.loopexit ], [ %.0186156, %558 ]
  %.3189341 = phi i32 [ %.1187229, %.loopexit ], [ %.0186157, %558 ]
  %.3189342 = phi i32 [ %.1187230, %.loopexit ], [ %.0186158, %558 ]
  %.3189343 = phi i32 [ %.1187231, %.loopexit ], [ %.0186159, %558 ]
  %.3189344 = phi i32 [ %.1187232, %.loopexit ], [ %.0186160, %558 ]
  %.3189345 = phi i32 [ %.1187233, %.loopexit ], [ %.0186161, %558 ]
  %.3189346 = phi i32 [ %.1187234, %.loopexit ], [ %.0186162, %558 ]
  %.3189347 = phi i32 [ %.1187235, %.loopexit ], [ %.0186163, %558 ]
  %.3348 = phi i32 [ %.1236, %.loopexit ], [ %.0164, %558 ]
  %.3349 = phi i32 [ %.1237, %.loopexit ], [ %.0165, %558 ]
  %.3350 = phi i32 [ %.1238, %.loopexit ], [ %.0166, %558 ]
  %.3351 = phi i32 [ %.1239, %.loopexit ], [ %.0167, %558 ]
  %.3352 = phi i32 [ %.1240, %.loopexit ], [ %.0168, %558 ]
  %.3353 = phi i32 [ %.1241, %.loopexit ], [ %.0169, %558 ]
  %.3354 = phi i32 [ %.1242, %.loopexit ], [ %.0170, %558 ]
  %.3355 = phi i32 [ %.1243, %.loopexit ], [ %.0171, %558 ]
  %.sroa.0.2356 = phi i32 [ %.sroa.0.1244, %.loopexit ], [ %.sroa.0.0172, %558 ]
  %.sroa.0.2357 = phi i32 [ %.sroa.0.1245, %.loopexit ], [ %.sroa.0.0173, %558 ]
  %.sroa.0.2358 = phi i32 [ %.sroa.0.1246, %.loopexit ], [ %.sroa.0.0174, %558 ]
  %.sroa.0.2359 = phi i32 [ %.sroa.0.1247, %.loopexit ], [ %.sroa.0.0175, %558 ]
  %.sroa.0.2360 = phi i32 [ %.sroa.0.1248, %.loopexit ], [ %.sroa.0.0176, %558 ]
  %.sroa.0.2361 = phi i32 [ %.sroa.0.1249, %.loopexit ], [ %.sroa.0.0177, %558 ]
  %.sroa.0.2362 = phi i32 [ %.sroa.0.1250, %.loopexit ], [ %.sroa.0.0178, %558 ]
  %.sroa.0.2363 = phi i32 [ %.sroa.0.1251, %.loopexit ], [ %.sroa.0.0179, %558 ]
  %.sroa.0180.2364 = phi i32 [ %.sroa.0180.1252, %.loopexit ], [ %.sroa.0180.0180, %558 ]
  %.sroa.0180.2365 = phi i32 [ %.sroa.0180.1253, %.loopexit ], [ %.sroa.0180.0181, %558 ]
  %.sroa.0180.2366 = phi i32 [ %.sroa.0180.1254, %.loopexit ], [ %.sroa.0180.0182, %558 ]
  %.sroa.0180.2367 = phi i32 [ %.sroa.0180.1255, %.loopexit ], [ %.sroa.0180.0183, %558 ]
  %.sroa.0180.2368 = phi i32 [ %.sroa.0180.1256, %.loopexit ], [ %.sroa.0180.0184, %558 ]
  %.sroa.0180.2369 = phi i32 [ %.sroa.0180.1257, %.loopexit ], [ %.sroa.0180.0185, %558 ]
  %.sroa.0180.2370 = phi i32 [ %.sroa.0180.1258, %.loopexit ], [ %.sroa.0180.0186, %558 ]
  %.sroa.0180.2371 = phi i32 [ %.sroa.0180.1259, %.loopexit ], [ %.sroa.0180.0187, %558 ]
  %.sroa.0182.2372 = phi i32 [ %.sroa.0182.1260, %.loopexit ], [ %.sroa.0182.0188, %558 ]
  %.sroa.0182.2373 = phi i32 [ %.sroa.0182.1261, %.loopexit ], [ %.sroa.0182.0189, %558 ]
  %.sroa.0182.2374 = phi i32 [ %.sroa.0182.1262, %.loopexit ], [ %.sroa.0182.0190, %558 ]
  %.sroa.0182.2375 = phi i32 [ %.sroa.0182.1263, %.loopexit ], [ %.sroa.0182.0191, %558 ]
  %.sroa.0182.2376 = phi i32 [ %.sroa.0182.1264, %.loopexit ], [ %.sroa.0182.0192, %558 ]
  %.sroa.0182.2377 = phi i32 [ %.sroa.0182.1265, %.loopexit ], [ %.sroa.0182.0193, %558 ]
  %.sroa.0182.2378 = phi i32 [ %.sroa.0182.1266, %.loopexit ], [ %.sroa.0182.0194, %558 ]
  %.sroa.0182.2379 = phi i32 [ %.sroa.0182.1267, %.loopexit ], [ %.sroa.0182.0195, %558 ]
  %.sroa.0184.2380 = phi i32 [ %.sroa.0184.1268, %.loopexit ], [ %.sroa.0184.0196, %558 ]
  %.sroa.0184.2381 = phi i32 [ %.sroa.0184.1269, %.loopexit ], [ %.sroa.0184.0197, %558 ]
  %.sroa.0184.2382 = phi i32 [ %.sroa.0184.1270, %.loopexit ], [ %.sroa.0184.0198, %558 ]
  %.sroa.0184.2383 = phi i32 [ %.sroa.0184.1271, %.loopexit ], [ %.sroa.0184.0199, %558 ]
  %.sroa.0184.2384 = phi i32 [ %.sroa.0184.1272, %.loopexit ], [ %.sroa.0184.0200, %558 ]
  %.sroa.0184.2385 = phi i32 [ %.sroa.0184.1273, %.loopexit ], [ %.sroa.0184.0201, %558 ]
  %.sroa.0184.2386 = phi i32 [ %.sroa.0184.1274, %.loopexit ], [ %.sroa.0184.0202, %558 ]
  %.sroa.0184.2387 = phi i32 [ %.sroa.0184.1275, %.loopexit ], [ %.sroa.0184.0203, %558 ]
  %1056 = add nuw nsw i32 %506, 128, !spirv.Decorations !743
  %1057 = icmp eq i32 %506, 0
  br i1 %1057, label %1058, label %1059

1058:                                             ; preds = %1055
  call void @llvm.genx.GenISA.memoryfence(i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i32 0)
  call void @llvm.genx.GenISA.threadgroupbarrier()
  br label %1059

1059:                                             ; preds = %1058, %1055
  br label %505

1060:                                             ; preds = %508, %20
  ret void
}

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
; Function Attrs: convergent nounwind willreturn memory(none)
declare <8 x i32> @llvm.genx.GenISA.sub.group.dpas.v8i32.v8i32.v8i16.v8i32(<8 x i32>, <8 x i16>, <8 x i32>, i32, i32, i32, i32, i1) #3

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
; Function Attrs: convergent nounwind willreturn memory(none)
declare <8 x float> @llvm.genx.GenISA.sub.group.dpas.v8f32.v8f32.v8i16.v8i32(<8 x float>, <8 x i16>, <8 x i32>, i32, i32, i32, i32, i1) #3

; Function Attrs: convergent nounwind
declare spir_func i32 @__builtin_IB_get_simd_size() local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func i32 @__builtin_IB_get_simd_id() local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func void @__builtin_IB_simd_block_write_1_local(ptr addrspace(3) noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func zeroext i16 @__builtin_IB_simd_block_read_1_local_h(ptr addrspace(3) noundef) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smin.i64(i64, i64) #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_fmax(float noundef, float noundef) local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_native_exp2f(float noundef) local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_frnd_zi(float noundef) local_unnamed_addr #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #5

; Function Attrs: convergent nounwind
declare spir_func void @__builtin_IB_memfence(i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i1 noundef zeroext, i32 noundef) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func ptr addrspace(3) @__builtin_IB_to_local(ptr addrspace(4) noundef) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func void @__builtin_IB_sub_group_barrier() local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func void @__builtin_IB_thread_group_barrier() local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_group_id(i32 noundef) local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_id_x() local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_id_y() local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_id_z() local_unnamed_addr #6

; Function Attrs: convergent nounwind
declare spir_func ptr @__builtin_IB_to_private(ptr addrspace(4) noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_sub_group_reduce_FAdd_f32(float noundef) local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func float @__builtin_IB_sub_group_reduce_FMax_f32(float noundef) local_unnamed_addr #6

; Function Attrs: convergent nounwind
declare spir_func <8 x i16> @__builtin_IB_subgroup_block_read_flat_cacheopts_u16_wi8_m8k16v1(i64 noundef, i32 noundef, i32 noundef, i32 noundef, <2 x i32> noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func <8 x i32> @__builtin_IB_subgroup_block_read_flat_cacheopts_transpose_u32_wi8_m16_k8(i64 noundef, i32 noundef, i32 noundef, i32 noundef, <2 x i32> noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: convergent nounwind
declare spir_func void @__builtin_IB_subgroup_block_write_flat_cacheopts_u32_wi8_m8k16v1(i64 noundef, i32 noundef, i32 noundef, i32 noundef, <2 x i32> noundef, <8 x i32> noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_size(i32 noundef) local_unnamed_addr #6

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare spir_func i32 @__builtin_IB_get_local_thread_id() local_unnamed_addr #6

declare i32 @printf(ptr addrspace(2), ...)

; Function Desc: 
; Output: 
; Function Attrs: nounwind willreturn memory(none)
declare i16 @llvm.genx.GenISA.simdLaneId() #7

; Function Desc: 
; Output: 
; Arg 0: 
; Arg 1: 
; Function Attrs: convergent nounwind memory(write)
declare void @llvm.genx.GenISA.simdBlockWrite.p3.i32(ptr addrspace(3), i32) #8

; Function Desc: 
; Output: 
; Function Attrs: convergent nounwind memory(readwrite)
declare void @llvm.genx.GenISA.wavebarrier() #9

; Function Desc: 
; Output: 
; Arg 0: 
; Arg 1: 
; Arg 2: 
; Arg 3: 
; Function Attrs: convergent nounwind memory(inaccessiblemem: readwrite)
declare float @llvm.genx.GenISA.WaveAll.f32(float, i8, i1, i32) #10

; Function Desc: 
; Output: 
; Arg 0: 
; Function Attrs: convergent nounwind willreturn memory(read)
declare i16 @llvm.genx.GenISA.simdBlockRead.i16.p3(ptr addrspace(3)) #11

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
; Arg 9: 
; Arg 10: 
; Arg 11: 
; Arg 12: 
; Function Attrs: nounwind memory(readwrite)
declare <8 x i16> @llvm.genx.GenISA.LSC2DBlockRead.v8i16(i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i1, i1, i32) #12

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
; Arg 9: 
; Arg 10: 
; Arg 11: 
; Arg 12: 
; Function Attrs: nounwind memory(readwrite)
declare <8 x i32> @llvm.genx.GenISA.LSC2DBlockRead.v8i32(i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i1, i1, i32) #12

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
; Arg 9: 
; Arg 10: 
; Arg 11: 
; Arg 12: 
; Arg 13: 
; Function Attrs: nounwind memory(readwrite)
declare void @llvm.genx.GenISA.LSC2DBlockWrite.v8i32(i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i1, i1, i32, <8 x i32>) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.trunc.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.exp2.f32(float) #5

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
declare void @llvm.genx.GenISA.memoryfence(i1, i1, i1, i1, i1, i1, i1, i1, i32) #9

; Function Desc: 
; Output: 
; Function Attrs: convergent nounwind memory(readwrite)
declare void @llvm.genx.GenISA.threadgroupbarrier() #9

attributes #0 = { convergent nounwind "less-precise-fpmad"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { convergent nounwind willreturn memory(none) }
attributes #4 = { convergent nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { convergent mustprogress nofree nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { convergent nounwind memory(write) }
attributes #9 = { convergent nounwind memory(readwrite) }
attributes #10 = { convergent nounwind memory(inaccessiblemem: readwrite) }
attributes #11 = { convergent nounwind willreturn memory(read) }
attributes #12 = { nounwind memory(readwrite) }

!spirv.MemoryModel = !{!0}
!spirv.Source = !{!1}
!spirv.Generator = !{!2}
!igc.functions = !{!3, !6, !7, !8, !9, !10, !11, !12}
!IGCMetadata = !{!13}
!opencl.ocl.version = !{!736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736}
!opencl.spir.version = !{!736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736, !736}
!llvm.ident = !{!737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737, !737}
!llvm.module.flags = !{!738}

!0 = !{i32 2, i32 2}
!1 = !{i32 4, i32 100000}
!2 = !{i16 6, i16 14}
!3 = !{ptr @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE, !4}
!4 = !{!5}
!5 = !{!"function_type", i32 0}
!6 = !{ptr @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE, !4}
!7 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE, !4}
!8 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE, !4}
!9 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE, !4}
!10 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE, !4}
!11 = !{ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE, !4}
!12 = !{ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE, !4}
!13 = !{!"ModuleMD", !14, !15, !126, !570, !601, !618, !639, !649, !651, !652, !667, !668, !669, !670, !671, !675, !676, !683, !684, !685, !686, !687, !688, !689, !690, !691, !693, !697, !698, !699, !700, !701, !702, !703, !704, !705, !706, !707, !708, !709, !710, !711, !267, !712, !713, !714, !716, !718, !721, !722, !723, !725, !726, !727, !732, !733, !734, !735}
!14 = !{!"isPrecise", i1 false}
!15 = !{!"compOpt", !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125}
!16 = !{!"DenormsAreZero", i1 false}
!17 = !{!"BFTFDenormsAreZero", i1 false}
!18 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!19 = !{!"OptDisable", i1 false}
!20 = !{!"MadEnable", i1 true}
!21 = !{!"NoSignedZeros", i1 false}
!22 = !{!"NoNaNs", i1 false}
!23 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!24 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!25 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!26 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!27 = !{!"FloatRoundingMode", i32 0}
!28 = !{!"FloatCvtIntRoundingMode", i32 3}
!29 = !{!"LoadCacheDefault", i32 4}
!30 = !{!"StoreCacheDefault", i32 2}
!31 = !{!"VISAPreSchedRPThreshold", i32 0}
!32 = !{!"VISAPreSchedCtrl", i32 0}
!33 = !{!"SetLoopUnrollThreshold", i32 0}
!34 = !{!"UnsafeMathOptimizations", i1 false}
!35 = !{!"disableCustomUnsafeOpts", i1 false}
!36 = !{!"disableReducePow", i1 false}
!37 = !{!"disableSqrtOpt", i1 false}
!38 = !{!"FiniteMathOnly", i1 false}
!39 = !{!"FastRelaxedMath", i1 false}
!40 = !{!"DashGSpecified", i1 false}
!41 = !{!"FastCompilation", i1 false}
!42 = !{!"UseScratchSpacePrivateMemory", i1 true}
!43 = !{!"RelaxedBuiltins", i1 false}
!44 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!45 = !{!"GreaterThan2GBBufferRequired", i1 true}
!46 = !{!"GreaterThan4GBBufferRequired", i1 true}
!47 = !{!"DisableA64WA", i1 false}
!48 = !{!"ForceEnableA64WA", i1 false}
!49 = !{!"PushConstantsEnable", i1 true}
!50 = !{!"HasPositivePointerOffset", i1 false}
!51 = !{!"HasBufferOffsetArg", i1 true}
!52 = !{!"BufferOffsetArgOptional", i1 true}
!53 = !{!"replaceGlobalOffsetsByZero", i1 false}
!54 = !{!"forcePixelShaderSIMDMode", i32 0}
!55 = !{!"forceTotalGRFNum", i32 0}
!56 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!57 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!58 = !{!"UniformWGS", i1 false}
!59 = !{!"disableVertexComponentPacking", i1 false}
!60 = !{!"disablePartialVertexComponentPacking", i1 false}
!61 = !{!"PreferBindlessImages", i1 true}
!62 = !{!"UseBindlessMode", i1 true}
!63 = !{!"UseLegacyBindlessMode", i1 false}
!64 = !{!"disableMathRefactoring", i1 false}
!65 = !{!"atomicBranch", i1 false}
!66 = !{!"spillCompression", i1 false}
!67 = !{!"AllowLICM", i1 true}
!68 = !{!"DisableEarlyOut", i1 false}
!69 = !{!"ForceInt32DivRemEmu", i1 false}
!70 = !{!"ForceInt32DivRemEmuSP", i1 false}
!71 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!72 = !{!"DisableFastestSingleCSSIMD", i1 false}
!73 = !{!"DisableFastestLinearScan", i1 false}
!74 = !{!"UseStatelessforPrivateMemory", i1 false}
!75 = !{!"EnableTakeGlobalAddress", i1 false}
!76 = !{!"IsLibraryCompilation", i1 false}
!77 = !{!"LibraryCompileSIMDSize", i32 0}
!78 = !{!"FastVISACompile", i1 false}
!79 = !{!"MatchSinCosPi", i1 false}
!80 = !{!"ExcludeIRFromZEBinary", i1 false}
!81 = !{!"EmitZeBinVISASections", i1 false}
!82 = !{!"FP64GenEmulationEnabled", i1 false}
!83 = !{!"FP64GenConvEmulationEnabled", i1 false}
!84 = !{!"allowDisableRematforCS", i1 false}
!85 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!86 = !{!"DisableCPSOmaskWA", i1 false}
!87 = !{!"DisableFastestGopt", i1 false}
!88 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!89 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!90 = !{!"DisableConstantCoalescing", i1 false}
!91 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!92 = !{!"WaEnableALTModeVisaWA", i1 false}
!93 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!94 = !{!"EnableLdStCombineforLoad", i1 false}
!95 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!96 = !{!"ForceUniformBuffer", i1 false}
!97 = !{!"ForceUniformSurfaceSampler", i1 false}
!98 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!99 = !{!"NewSpillCostFunction", i1 false}
!100 = !{!"EnableVRT", i1 true}
!101 = !{!"ForceLargeGRFNum4RQ", i1 false}
!102 = !{!"DisableEUFusion", i1 false}
!103 = !{!"DisableFDivToFMulInvOpt", i1 false}
!104 = !{!"initializePhiSampleSourceWA", i1 false}
!105 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!106 = !{!"DisableLoosenSimd32Occu", i1 false}
!107 = !{!"FastestS1Options", i32 0}
!108 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!109 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!110 = !{!"LscSamplerRouting", i32 0}
!111 = !{!"UseBarrierControlFlowOptimization", i1 false}
!112 = !{!"EnableDynamicRQManagement", i1 false}
!113 = !{!"WaDisablePayloadCoalescing", i1 false}
!114 = !{!"Quad8InputThreshold", i32 0}
!115 = !{!"UseResourceLoopUnrollNested", i1 false}
!116 = !{!"DisableLoopUnroll", i1 false}
!117 = !{!"ForcePushConstantMode", i32 0}
!118 = !{!"UseInstructionHoistingOptimization", i1 false}
!119 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!120 = !{!"ForceVRTGRFCeiling", i32 0}
!121 = !{!"DisableSamplerBackingByLSC", i32 0}
!122 = !{!"UseLinearScanRA", i1 false}
!123 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!124 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!125 = !{!"VISASpillAllowed", i32 0}
!126 = !{!"FuncMD", !127, !128, !347, !348, !352, !353, !501, !502, !548, !549, !555, !556, !560, !561, !565, !566}
!127 = !{!"FuncMDMap[0]", ptr @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE}
!128 = !{!"FuncMDValue[0]", !129, !133, !137, !140, !141, !142, !143, !144, !189, !190, !191, !214, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !290, !301, !312, !323, !334, !345, !346}
!129 = !{!"localOffsets", !130}
!130 = !{!"localOffsetsVec[0]", !131, !132}
!131 = !{!"m_Offset", i32 268435456}
!132 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi2EEE-ExtSLM}
!133 = !{!"workGroupWalkOrder", !134, !135, !136}
!134 = !{!"dim0", i32 0}
!135 = !{!"dim1", i32 1}
!136 = !{!"dim2", i32 2}
!137 = !{!"threadGroupSize", !134, !138, !139}
!138 = !{!"dim1", i32 0}
!139 = !{!"dim2", i32 0}
!140 = !{!"threadGroupSizeHint", !134, !138, !139}
!141 = !{!"vecTypeHint", !""}
!142 = !{!"funcArgs"}
!143 = !{!"argInfoList"}
!144 = !{!"implicitArgInfoList", !145, !151, !153, !155, !157, !159, !161, !163, !166, !168, !170, !172, !174, !176, !178, !180, !182, !183, !184, !185, !186, !187, !188}
!145 = !{!"implicitArgInfoListVec[0]", !146, !147, !148, !149, !150}
!146 = !{!"argId", i32 0}
!147 = !{!"explicitArgNum", i32 -1}
!148 = !{!"structArgOffset", i32 -1}
!149 = !{!"imgAccessFloatCoords", i32 -1}
!150 = !{!"imgAccessIntCoords", i32 -1}
!151 = !{!"implicitArgInfoListVec[1]", !152, !147, !148, !149, !150}
!152 = !{!"argId", i32 2}
!153 = !{!"implicitArgInfoListVec[2]", !154, !147, !148, !149, !150}
!154 = !{!"argId", i32 6}
!155 = !{!"implicitArgInfoListVec[3]", !156, !147, !148, !149, !150}
!156 = !{!"argId", i32 8}
!157 = !{!"implicitArgInfoListVec[4]", !158, !147, !148, !149, !150}
!158 = !{!"argId", i32 9}
!159 = !{!"implicitArgInfoListVec[5]", !160, !147, !148, !149, !150}
!160 = !{!"argId", i32 10}
!161 = !{!"implicitArgInfoListVec[6]", !162, !147, !148, !149, !150}
!162 = !{!"argId", i32 13}
!163 = !{!"implicitArgInfoListVec[7]", !164, !165, !148, !149, !150}
!164 = !{!"argId", i32 15}
!165 = !{!"explicitArgNum", i32 2}
!166 = !{!"implicitArgInfoListVec[8]", !164, !167, !148, !149, !150}
!167 = !{!"explicitArgNum", i32 3}
!168 = !{!"implicitArgInfoListVec[9]", !164, !169, !148, !149, !150}
!169 = !{!"explicitArgNum", i32 4}
!170 = !{!"implicitArgInfoListVec[10]", !164, !171, !148, !149, !150}
!171 = !{!"explicitArgNum", i32 5}
!172 = !{!"implicitArgInfoListVec[11]", !164, !173, !148, !149, !150}
!173 = !{!"explicitArgNum", i32 6}
!174 = !{!"implicitArgInfoListVec[12]", !164, !175, !148, !149, !150}
!175 = !{!"explicitArgNum", i32 7}
!176 = !{!"implicitArgInfoListVec[13]", !164, !177, !148, !149, !150}
!177 = !{!"explicitArgNum", i32 8}
!178 = !{!"implicitArgInfoListVec[14]", !164, !179, !148, !149, !150}
!179 = !{!"explicitArgNum", i32 9}
!180 = !{!"implicitArgInfoListVec[15]", !181, !165, !148, !149, !150}
!181 = !{!"argId", i32 54}
!182 = !{!"implicitArgInfoListVec[16]", !181, !167, !148, !149, !150}
!183 = !{!"implicitArgInfoListVec[17]", !181, !169, !148, !149, !150}
!184 = !{!"implicitArgInfoListVec[18]", !181, !171, !148, !149, !150}
!185 = !{!"implicitArgInfoListVec[19]", !181, !173, !148, !149, !150}
!186 = !{!"implicitArgInfoListVec[20]", !181, !175, !148, !149, !150}
!187 = !{!"implicitArgInfoListVec[21]", !181, !177, !148, !149, !150}
!188 = !{!"implicitArgInfoListVec[22]", !181, !179, !148, !149, !150}
!189 = !{!"functionType", !"KernelFunction"}
!190 = !{!"requiredSubGroupSize", i32 16}
!191 = !{!"rtInfo", !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !209, !210, !211, !212, !213}
!192 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!193 = !{!"isContinuation", i1 false}
!194 = !{!"hasTraceRayPayload", i1 false}
!195 = !{!"hasHitAttributes", i1 false}
!196 = !{!"hasCallableData", i1 false}
!197 = !{!"ShaderStackSize", i32 0}
!198 = !{!"ShaderHash", i64 0}
!199 = !{!"ShaderName", !""}
!200 = !{!"ParentName", !""}
!201 = !{!"SlotNum", ptr null}
!202 = !{!"NOSSize", i32 0}
!203 = !{!"globalRootSignatureSize", i32 0}
!204 = !{!"Entries"}
!205 = !{!"SpillUnions"}
!206 = !{!"CustomHitAttrSizeInBytes", i32 0}
!207 = !{!"Types", !208}
!208 = !{!"FullFrameTys"}
!209 = !{!"Aliases"}
!210 = !{!"numSyncRTStacks", i32 0}
!211 = !{!"NumCoherenceHintBits", i32 0}
!212 = !{!"useSyncHWStack", i1 false}
!213 = !{!"OriginatingShaderName", !""}
!214 = !{!"resAllocMD", !215, !216, !217, !218, !255}
!215 = !{!"uavsNumType", i32 0}
!216 = !{!"srvsNumType", i32 0}
!217 = !{!"samplersNumType", i32 0}
!218 = !{!"argAllocMDList", !219, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254}
!219 = !{!"argAllocMDListVec[0]", !220, !221, !222}
!220 = !{!"type", i32 0}
!221 = !{!"extensionType", i32 -1}
!222 = !{!"indexType", i32 -1}
!223 = !{!"argAllocMDListVec[1]", !220, !221, !222}
!224 = !{!"argAllocMDListVec[2]", !220, !221, !222}
!225 = !{!"argAllocMDListVec[3]", !220, !221, !222}
!226 = !{!"argAllocMDListVec[4]", !220, !221, !222}
!227 = !{!"argAllocMDListVec[5]", !220, !221, !222}
!228 = !{!"argAllocMDListVec[6]", !220, !221, !222}
!229 = !{!"argAllocMDListVec[7]", !220, !221, !222}
!230 = !{!"argAllocMDListVec[8]", !220, !221, !222}
!231 = !{!"argAllocMDListVec[9]", !220, !221, !222}
!232 = !{!"argAllocMDListVec[10]", !220, !221, !222}
!233 = !{!"argAllocMDListVec[11]", !220, !221, !222}
!234 = !{!"argAllocMDListVec[12]", !220, !221, !222}
!235 = !{!"argAllocMDListVec[13]", !220, !221, !222}
!236 = !{!"argAllocMDListVec[14]", !220, !221, !222}
!237 = !{!"argAllocMDListVec[15]", !220, !221, !222}
!238 = !{!"argAllocMDListVec[16]", !220, !221, !222}
!239 = !{!"argAllocMDListVec[17]", !220, !221, !222}
!240 = !{!"argAllocMDListVec[18]", !220, !221, !222}
!241 = !{!"argAllocMDListVec[19]", !220, !221, !222}
!242 = !{!"argAllocMDListVec[20]", !220, !221, !222}
!243 = !{!"argAllocMDListVec[21]", !220, !221, !222}
!244 = !{!"argAllocMDListVec[22]", !220, !221, !222}
!245 = !{!"argAllocMDListVec[23]", !220, !221, !222}
!246 = !{!"argAllocMDListVec[24]", !220, !221, !222}
!247 = !{!"argAllocMDListVec[25]", !220, !221, !222}
!248 = !{!"argAllocMDListVec[26]", !220, !221, !222}
!249 = !{!"argAllocMDListVec[27]", !220, !221, !222}
!250 = !{!"argAllocMDListVec[28]", !220, !221, !222}
!251 = !{!"argAllocMDListVec[29]", !220, !221, !222}
!252 = !{!"argAllocMDListVec[30]", !220, !221, !222}
!253 = !{!"argAllocMDListVec[31]", !220, !221, !222}
!254 = !{!"argAllocMDListVec[32]", !220, !221, !222}
!255 = !{!"inlineSamplersMD"}
!256 = !{!"maxByteOffsets"}
!257 = !{!"IsInitializer", i1 false}
!258 = !{!"IsFinalizer", i1 false}
!259 = !{!"CompiledSubGroupsNumber", i32 0}
!260 = !{!"maxRegPressure", i32 0}
!261 = !{!"maxRegPressureSimd16", i32 0}
!262 = !{!"maxRegPressureSimd32", i32 0}
!263 = !{!"hasInlineVmeSamplers", i1 false}
!264 = !{!"localSize", i32 0}
!265 = !{!"localIDPresent", i1 false}
!266 = !{!"groupIDPresent", i1 false}
!267 = !{!"privateMemoryPerWI", i32 0}
!268 = !{!"prevFPOffset", i32 0}
!269 = !{!"globalIDPresent", i1 false}
!270 = !{!"hasSyncRTCalls", i1 false}
!271 = !{!"hasPrintfCalls", i1 false}
!272 = !{!"requireAssertBuffer", i1 false}
!273 = !{!"requireSyncBuffer", i1 false}
!274 = !{!"hasIndirectCalls", i1 false}
!275 = !{!"hasNonKernelArgLoad", i1 false}
!276 = !{!"hasNonKernelArgStore", i1 false}
!277 = !{!"hasNonKernelArgAtomic", i1 false}
!278 = !{!"UserAnnotations"}
!279 = !{!"m_OpenCLArgAddressSpaces", !280, !281, !282, !283, !284, !285, !286, !287, !288, !289}
!280 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 0}
!281 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 3}
!282 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 1}
!283 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 1}
!284 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 1}
!285 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 1}
!286 = !{!"m_OpenCLArgAddressSpacesVec[6]", i32 1}
!287 = !{!"m_OpenCLArgAddressSpacesVec[7]", i32 1}
!288 = !{!"m_OpenCLArgAddressSpacesVec[8]", i32 1}
!289 = !{!"m_OpenCLArgAddressSpacesVec[9]", i32 1}
!290 = !{!"m_OpenCLArgAccessQualifiers", !291, !292, !293, !294, !295, !296, !297, !298, !299, !300}
!291 = !{!"m_OpenCLArgAccessQualifiersVec[0]", !"none"}
!292 = !{!"m_OpenCLArgAccessQualifiersVec[1]", !"none"}
!293 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!294 = !{!"m_OpenCLArgAccessQualifiersVec[3]", !"none"}
!295 = !{!"m_OpenCLArgAccessQualifiersVec[4]", !"none"}
!296 = !{!"m_OpenCLArgAccessQualifiersVec[5]", !"none"}
!297 = !{!"m_OpenCLArgAccessQualifiersVec[6]", !"none"}
!298 = !{!"m_OpenCLArgAccessQualifiersVec[7]", !"none"}
!299 = !{!"m_OpenCLArgAccessQualifiersVec[8]", !"none"}
!300 = !{!"m_OpenCLArgAccessQualifiersVec[9]", !"none"}
!301 = !{!"m_OpenCLArgTypes", !302, !303, !304, !305, !306, !307, !308, !309, !310, !311}
!302 = !{!"m_OpenCLArgTypesVec[0]", !"int"}
!303 = !{!"m_OpenCLArgTypesVec[1]", !"char*"}
!304 = !{!"m_OpenCLArgTypesVec[2]", !"char*"}
!305 = !{!"m_OpenCLArgTypesVec[3]", !"char*"}
!306 = !{!"m_OpenCLArgTypesVec[4]", !"float*"}
!307 = !{!"m_OpenCLArgTypesVec[5]", !"float*"}
!308 = !{!"m_OpenCLArgTypesVec[6]", !"float*"}
!309 = !{!"m_OpenCLArgTypesVec[7]", !"char*"}
!310 = !{!"m_OpenCLArgTypesVec[8]", !"float*"}
!311 = !{!"m_OpenCLArgTypesVec[9]", !"float*"}
!312 = !{!"m_OpenCLArgBaseTypes", !313, !314, !315, !316, !317, !318, !319, !320, !321, !322}
!313 = !{!"m_OpenCLArgBaseTypesVec[0]", !"int"}
!314 = !{!"m_OpenCLArgBaseTypesVec[1]", !"char*"}
!315 = !{!"m_OpenCLArgBaseTypesVec[2]", !"char*"}
!316 = !{!"m_OpenCLArgBaseTypesVec[3]", !"char*"}
!317 = !{!"m_OpenCLArgBaseTypesVec[4]", !"float*"}
!318 = !{!"m_OpenCLArgBaseTypesVec[5]", !"float*"}
!319 = !{!"m_OpenCLArgBaseTypesVec[6]", !"float*"}
!320 = !{!"m_OpenCLArgBaseTypesVec[7]", !"char*"}
!321 = !{!"m_OpenCLArgBaseTypesVec[8]", !"float*"}
!322 = !{!"m_OpenCLArgBaseTypesVec[9]", !"float*"}
!323 = !{!"m_OpenCLArgTypeQualifiers", !324, !325, !326, !327, !328, !329, !330, !331, !332, !333}
!324 = !{!"m_OpenCLArgTypeQualifiersVec[0]", !""}
!325 = !{!"m_OpenCLArgTypeQualifiersVec[1]", !""}
!326 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!327 = !{!"m_OpenCLArgTypeQualifiersVec[3]", !""}
!328 = !{!"m_OpenCLArgTypeQualifiersVec[4]", !""}
!329 = !{!"m_OpenCLArgTypeQualifiersVec[5]", !""}
!330 = !{!"m_OpenCLArgTypeQualifiersVec[6]", !""}
!331 = !{!"m_OpenCLArgTypeQualifiersVec[7]", !""}
!332 = !{!"m_OpenCLArgTypeQualifiersVec[8]", !""}
!333 = !{!"m_OpenCLArgTypeQualifiersVec[9]", !""}
!334 = !{!"m_OpenCLArgNames", !335, !336, !337, !338, !339, !340, !341, !342, !343, !344}
!335 = !{!"m_OpenCLArgNamesVec[0]", !""}
!336 = !{!"m_OpenCLArgNamesVec[1]", !""}
!337 = !{!"m_OpenCLArgNamesVec[2]", !""}
!338 = !{!"m_OpenCLArgNamesVec[3]", !""}
!339 = !{!"m_OpenCLArgNamesVec[4]", !""}
!340 = !{!"m_OpenCLArgNamesVec[5]", !""}
!341 = !{!"m_OpenCLArgNamesVec[6]", !""}
!342 = !{!"m_OpenCLArgNamesVec[7]", !""}
!343 = !{!"m_OpenCLArgNamesVec[8]", !""}
!344 = !{!"m_OpenCLArgNamesVec[9]", !""}
!345 = !{!"m_OpenCLArgScalarAsPointers"}
!346 = !{!"m_OptsToDisablePerFunc"}
!347 = !{!"FuncMDMap[1]", ptr @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE}
!348 = !{!"FuncMDValue[1]", !349, !133, !137, !140, !141, !142, !143, !144, !189, !190, !191, !214, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !290, !301, !312, !323, !334, !345, !346}
!349 = !{!"localOffsets", !350}
!350 = !{!"localOffsetsVec[0]", !131, !351}
!351 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_121Xe2KvTorchAbiS1KernelILi4EEE-ExtSLM}
!352 = !{!"FuncMDMap[2]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE}
!353 = !{!"FuncMDValue[2]", !354, !133, !137, !140, !141, !142, !143, !357, !189, !190, !191, !393, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !415, !432, !443, !461, !479, !490, !345, !346}
!354 = !{!"localOffsets", !355}
!355 = !{!"localOffsetsVec[0]", !131, !356}
!356 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi2ELb0EEE-ExtSLM}
!357 = !{!"implicitArgInfoList", !145, !151, !153, !155, !157, !159, !161, !358, !360, !168, !361, !362, !364, !366, !368, !370, !372, !374, !376, !378, !380, !381, !382, !383, !384, !385, !386, !387, !388, !389, !390, !391, !392}
!358 = !{!"implicitArgInfoListVec[7]", !164, !359, !148, !149, !150}
!359 = !{!"explicitArgNum", i32 1}
!360 = !{!"implicitArgInfoListVec[8]", !164, !165, !148, !149, !150}
!361 = !{!"implicitArgInfoListVec[10]", !164, !179, !148, !149, !150}
!362 = !{!"implicitArgInfoListVec[11]", !164, !363, !148, !149, !150}
!363 = !{!"explicitArgNum", i32 10}
!364 = !{!"implicitArgInfoListVec[12]", !164, !365, !148, !149, !150}
!365 = !{!"explicitArgNum", i32 11}
!366 = !{!"implicitArgInfoListVec[13]", !164, !367, !148, !149, !150}
!367 = !{!"explicitArgNum", i32 12}
!368 = !{!"implicitArgInfoListVec[14]", !164, !369, !148, !149, !150}
!369 = !{!"explicitArgNum", i32 13}
!370 = !{!"implicitArgInfoListVec[15]", !164, !371, !148, !149, !150}
!371 = !{!"explicitArgNum", i32 15}
!372 = !{!"implicitArgInfoListVec[16]", !164, !373, !148, !149, !150}
!373 = !{!"explicitArgNum", i32 16}
!374 = !{!"implicitArgInfoListVec[17]", !164, !375, !148, !149, !150}
!375 = !{!"explicitArgNum", i32 17}
!376 = !{!"implicitArgInfoListVec[18]", !164, !377, !148, !149, !150}
!377 = !{!"explicitArgNum", i32 18}
!378 = !{!"implicitArgInfoListVec[19]", !164, !379, !148, !149, !150}
!379 = !{!"explicitArgNum", i32 19}
!380 = !{!"implicitArgInfoListVec[20]", !181, !359, !148, !149, !150}
!381 = !{!"implicitArgInfoListVec[21]", !181, !165, !148, !149, !150}
!382 = !{!"implicitArgInfoListVec[22]", !181, !169, !148, !149, !150}
!383 = !{!"implicitArgInfoListVec[23]", !181, !179, !148, !149, !150}
!384 = !{!"implicitArgInfoListVec[24]", !181, !363, !148, !149, !150}
!385 = !{!"implicitArgInfoListVec[25]", !181, !365, !148, !149, !150}
!386 = !{!"implicitArgInfoListVec[26]", !181, !367, !148, !149, !150}
!387 = !{!"implicitArgInfoListVec[27]", !181, !369, !148, !149, !150}
!388 = !{!"implicitArgInfoListVec[28]", !181, !371, !148, !149, !150}
!389 = !{!"implicitArgInfoListVec[29]", !181, !373, !148, !149, !150}
!390 = !{!"implicitArgInfoListVec[30]", !181, !375, !148, !149, !150}
!391 = !{!"implicitArgInfoListVec[31]", !181, !377, !148, !149, !150}
!392 = !{!"implicitArgInfoListVec[32]", !181, !379, !148, !149, !150}
!393 = !{!"resAllocMD", !215, !216, !217, !394, !255}
!394 = !{!"argAllocMDList", !219, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !395, !396, !397, !398, !399, !400, !401, !402, !403, !404, !405, !406, !407, !408, !409, !410, !411, !412, !413, !414}
!395 = !{!"argAllocMDListVec[33]", !220, !221, !222}
!396 = !{!"argAllocMDListVec[34]", !220, !221, !222}
!397 = !{!"argAllocMDListVec[35]", !220, !221, !222}
!398 = !{!"argAllocMDListVec[36]", !220, !221, !222}
!399 = !{!"argAllocMDListVec[37]", !220, !221, !222}
!400 = !{!"argAllocMDListVec[38]", !220, !221, !222}
!401 = !{!"argAllocMDListVec[39]", !220, !221, !222}
!402 = !{!"argAllocMDListVec[40]", !220, !221, !222}
!403 = !{!"argAllocMDListVec[41]", !220, !221, !222}
!404 = !{!"argAllocMDListVec[42]", !220, !221, !222}
!405 = !{!"argAllocMDListVec[43]", !220, !221, !222}
!406 = !{!"argAllocMDListVec[44]", !220, !221, !222}
!407 = !{!"argAllocMDListVec[45]", !220, !221, !222}
!408 = !{!"argAllocMDListVec[46]", !220, !221, !222}
!409 = !{!"argAllocMDListVec[47]", !220, !221, !222}
!410 = !{!"argAllocMDListVec[48]", !220, !221, !222}
!411 = !{!"argAllocMDListVec[49]", !220, !221, !222}
!412 = !{!"argAllocMDListVec[50]", !220, !221, !222}
!413 = !{!"argAllocMDListVec[51]", !220, !221, !222}
!414 = !{!"argAllocMDListVec[52]", !220, !221, !222}
!415 = !{!"m_OpenCLArgAddressSpaces", !280, !416, !282, !417, !284, !418, !419, !420, !421, !289, !422, !423, !424, !425, !426, !427, !428, !429, !430, !431}
!416 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 1}
!417 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 0}
!418 = !{!"m_OpenCLArgAddressSpacesVec[5]", i32 3}
!419 = !{!"m_OpenCLArgAddressSpacesVec[6]", i32 0}
!420 = !{!"m_OpenCLArgAddressSpacesVec[7]", i32 0}
!421 = !{!"m_OpenCLArgAddressSpacesVec[8]", i32 0}
!422 = !{!"m_OpenCLArgAddressSpacesVec[10]", i32 1}
!423 = !{!"m_OpenCLArgAddressSpacesVec[11]", i32 1}
!424 = !{!"m_OpenCLArgAddressSpacesVec[12]", i32 1}
!425 = !{!"m_OpenCLArgAddressSpacesVec[13]", i32 1}
!426 = !{!"m_OpenCLArgAddressSpacesVec[14]", i32 0}
!427 = !{!"m_OpenCLArgAddressSpacesVec[15]", i32 1}
!428 = !{!"m_OpenCLArgAddressSpacesVec[16]", i32 1}
!429 = !{!"m_OpenCLArgAddressSpacesVec[17]", i32 1}
!430 = !{!"m_OpenCLArgAddressSpacesVec[18]", i32 1}
!431 = !{!"m_OpenCLArgAddressSpacesVec[19]", i32 1}
!432 = !{!"m_OpenCLArgAccessQualifiers", !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !433, !434, !435, !436, !437, !438, !439, !440, !441, !442}
!433 = !{!"m_OpenCLArgAccessQualifiersVec[10]", !"none"}
!434 = !{!"m_OpenCLArgAccessQualifiersVec[11]", !"none"}
!435 = !{!"m_OpenCLArgAccessQualifiersVec[12]", !"none"}
!436 = !{!"m_OpenCLArgAccessQualifiersVec[13]", !"none"}
!437 = !{!"m_OpenCLArgAccessQualifiersVec[14]", !"none"}
!438 = !{!"m_OpenCLArgAccessQualifiersVec[15]", !"none"}
!439 = !{!"m_OpenCLArgAccessQualifiersVec[16]", !"none"}
!440 = !{!"m_OpenCLArgAccessQualifiersVec[17]", !"none"}
!441 = !{!"m_OpenCLArgAccessQualifiersVec[18]", !"none"}
!442 = !{!"m_OpenCLArgAccessQualifiersVec[19]", !"none"}
!443 = !{!"m_OpenCLArgTypes", !302, !303, !304, !444, !445, !446, !447, !448, !449, !450, !451, !452, !453, !454, !455, !456, !457, !458, !459, !460}
!444 = !{!"m_OpenCLArgTypesVec[3]", !"int"}
!445 = !{!"m_OpenCLArgTypesVec[4]", !"int*"}
!446 = !{!"m_OpenCLArgTypesVec[5]", !"char*"}
!447 = !{!"m_OpenCLArgTypesVec[6]", !"long"}
!448 = !{!"m_OpenCLArgTypesVec[7]", !"long"}
!449 = !{!"m_OpenCLArgTypesVec[8]", !"long"}
!450 = !{!"m_OpenCLArgTypesVec[9]", !"char*"}
!451 = !{!"m_OpenCLArgTypesVec[10]", !"char*"}
!452 = !{!"m_OpenCLArgTypesVec[11]", !"float*"}
!453 = !{!"m_OpenCLArgTypesVec[12]", !"float*"}
!454 = !{!"m_OpenCLArgTypesVec[13]", !"float*"}
!455 = !{!"m_OpenCLArgTypesVec[14]", !"int"}
!456 = !{!"m_OpenCLArgTypesVec[15]", !"float*"}
!457 = !{!"m_OpenCLArgTypesVec[16]", !"float*"}
!458 = !{!"m_OpenCLArgTypesVec[17]", !"char*"}
!459 = !{!"m_OpenCLArgTypesVec[18]", !"float*"}
!460 = !{!"m_OpenCLArgTypesVec[19]", !"float*"}
!461 = !{!"m_OpenCLArgBaseTypes", !313, !314, !315, !462, !463, !464, !465, !466, !467, !468, !469, !470, !471, !472, !473, !474, !475, !476, !477, !478}
!462 = !{!"m_OpenCLArgBaseTypesVec[3]", !"int"}
!463 = !{!"m_OpenCLArgBaseTypesVec[4]", !"int*"}
!464 = !{!"m_OpenCLArgBaseTypesVec[5]", !"char*"}
!465 = !{!"m_OpenCLArgBaseTypesVec[6]", !"long"}
!466 = !{!"m_OpenCLArgBaseTypesVec[7]", !"long"}
!467 = !{!"m_OpenCLArgBaseTypesVec[8]", !"long"}
!468 = !{!"m_OpenCLArgBaseTypesVec[9]", !"char*"}
!469 = !{!"m_OpenCLArgBaseTypesVec[10]", !"char*"}
!470 = !{!"m_OpenCLArgBaseTypesVec[11]", !"float*"}
!471 = !{!"m_OpenCLArgBaseTypesVec[12]", !"float*"}
!472 = !{!"m_OpenCLArgBaseTypesVec[13]", !"float*"}
!473 = !{!"m_OpenCLArgBaseTypesVec[14]", !"int"}
!474 = !{!"m_OpenCLArgBaseTypesVec[15]", !"float*"}
!475 = !{!"m_OpenCLArgBaseTypesVec[16]", !"float*"}
!476 = !{!"m_OpenCLArgBaseTypesVec[17]", !"char*"}
!477 = !{!"m_OpenCLArgBaseTypesVec[18]", !"float*"}
!478 = !{!"m_OpenCLArgBaseTypesVec[19]", !"float*"}
!479 = !{!"m_OpenCLArgTypeQualifiers", !324, !325, !326, !327, !328, !329, !330, !331, !332, !333, !480, !481, !482, !483, !484, !485, !486, !487, !488, !489}
!480 = !{!"m_OpenCLArgTypeQualifiersVec[10]", !""}
!481 = !{!"m_OpenCLArgTypeQualifiersVec[11]", !""}
!482 = !{!"m_OpenCLArgTypeQualifiersVec[12]", !""}
!483 = !{!"m_OpenCLArgTypeQualifiersVec[13]", !""}
!484 = !{!"m_OpenCLArgTypeQualifiersVec[14]", !""}
!485 = !{!"m_OpenCLArgTypeQualifiersVec[15]", !""}
!486 = !{!"m_OpenCLArgTypeQualifiersVec[16]", !""}
!487 = !{!"m_OpenCLArgTypeQualifiersVec[17]", !""}
!488 = !{!"m_OpenCLArgTypeQualifiersVec[18]", !""}
!489 = !{!"m_OpenCLArgTypeQualifiersVec[19]", !""}
!490 = !{!"m_OpenCLArgNames", !335, !336, !337, !338, !339, !340, !341, !342, !343, !344, !491, !492, !493, !494, !495, !496, !497, !498, !499, !500}
!491 = !{!"m_OpenCLArgNamesVec[10]", !""}
!492 = !{!"m_OpenCLArgNamesVec[11]", !""}
!493 = !{!"m_OpenCLArgNamesVec[12]", !""}
!494 = !{!"m_OpenCLArgNamesVec[13]", !""}
!495 = !{!"m_OpenCLArgNamesVec[14]", !""}
!496 = !{!"m_OpenCLArgNamesVec[15]", !""}
!497 = !{!"m_OpenCLArgNamesVec[16]", !""}
!498 = !{!"m_OpenCLArgNamesVec[17]", !""}
!499 = !{!"m_OpenCLArgNamesVec[18]", !""}
!500 = !{!"m_OpenCLArgNamesVec[19]", !""}
!501 = !{!"FuncMDMap[3]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE}
!502 = !{!"FuncMDValue[3]", !503, !133, !137, !140, !141, !142, !143, !506, !189, !190, !191, !393, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !522, !432, !528, !538, !479, !490, !345, !346}
!503 = !{!"localOffsets", !504}
!504 = !{!"localOffsetsVec[0]", !131, !505}
!505 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi2ELb0ELi64EEE-ExtSLM}
!506 = !{!"implicitArgInfoList", !145, !151, !153, !155, !157, !159, !161, !163, !166, !507, !508, !509, !510, !511, !512, !370, !372, !374, !376, !378, !514, !515, !516, !517, !518, !519, !520, !521, !388, !389, !390, !391, !392}
!507 = !{!"implicitArgInfoListVec[9]", !164, !171, !148, !149, !150}
!508 = !{!"implicitArgInfoListVec[10]", !164, !363, !148, !149, !150}
!509 = !{!"implicitArgInfoListVec[11]", !164, !365, !148, !149, !150}
!510 = !{!"implicitArgInfoListVec[12]", !164, !367, !148, !149, !150}
!511 = !{!"implicitArgInfoListVec[13]", !164, !369, !148, !149, !150}
!512 = !{!"implicitArgInfoListVec[14]", !164, !513, !148, !149, !150}
!513 = !{!"explicitArgNum", i32 14}
!514 = !{!"implicitArgInfoListVec[20]", !181, !165, !148, !149, !150}
!515 = !{!"implicitArgInfoListVec[21]", !181, !167, !148, !149, !150}
!516 = !{!"implicitArgInfoListVec[22]", !181, !171, !148, !149, !150}
!517 = !{!"implicitArgInfoListVec[23]", !181, !363, !148, !149, !150}
!518 = !{!"implicitArgInfoListVec[24]", !181, !365, !148, !149, !150}
!519 = !{!"implicitArgInfoListVec[25]", !181, !367, !148, !149, !150}
!520 = !{!"implicitArgInfoListVec[26]", !181, !369, !148, !149, !150}
!521 = !{!"implicitArgInfoListVec[27]", !181, !513, !148, !149, !150}
!522 = !{!"m_OpenCLArgAddressSpaces", !280, !523, !282, !283, !524, !285, !525, !420, !421, !526, !422, !423, !424, !425, !527, !427, !428, !429, !430, !431}
!523 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 0}
!524 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 0}
!525 = !{!"m_OpenCLArgAddressSpacesVec[6]", i32 3}
!526 = !{!"m_OpenCLArgAddressSpacesVec[9]", i32 0}
!527 = !{!"m_OpenCLArgAddressSpacesVec[14]", i32 1}
!528 = !{!"m_OpenCLArgTypes", !302, !529, !304, !305, !530, !531, !532, !448, !449, !533, !451, !534, !453, !454, !535, !456, !457, !536, !459, !537}
!529 = !{!"m_OpenCLArgTypesVec[1]", !"int"}
!530 = !{!"m_OpenCLArgTypesVec[4]", !"int"}
!531 = !{!"m_OpenCLArgTypesVec[5]", !"int*"}
!532 = !{!"m_OpenCLArgTypesVec[6]", !"char*"}
!533 = !{!"m_OpenCLArgTypesVec[9]", !"long"}
!534 = !{!"m_OpenCLArgTypesVec[11]", !"char*"}
!535 = !{!"m_OpenCLArgTypesVec[14]", !"float*"}
!536 = !{!"m_OpenCLArgTypesVec[17]", !"float*"}
!537 = !{!"m_OpenCLArgTypesVec[19]", !"char*"}
!538 = !{!"m_OpenCLArgBaseTypes", !313, !539, !315, !316, !540, !541, !542, !466, !467, !543, !469, !544, !471, !472, !545, !474, !475, !546, !477, !547}
!539 = !{!"m_OpenCLArgBaseTypesVec[1]", !"int"}
!540 = !{!"m_OpenCLArgBaseTypesVec[4]", !"int"}
!541 = !{!"m_OpenCLArgBaseTypesVec[5]", !"int*"}
!542 = !{!"m_OpenCLArgBaseTypesVec[6]", !"char*"}
!543 = !{!"m_OpenCLArgBaseTypesVec[9]", !"long"}
!544 = !{!"m_OpenCLArgBaseTypesVec[11]", !"char*"}
!545 = !{!"m_OpenCLArgBaseTypesVec[14]", !"float*"}
!546 = !{!"m_OpenCLArgBaseTypesVec[17]", !"float*"}
!547 = !{!"m_OpenCLArgBaseTypesVec[19]", !"char*"}
!548 = !{!"FuncMDMap[4]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE}
!549 = !{!"FuncMDValue[4]", !550, !133, !137, !140, !141, !142, !143, !506, !189, !190, !191, !393, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !522, !432, !553, !554, !479, !490, !345, !346}
!550 = !{!"localOffsets", !551}
!551 = !{!"localOffsetsVec[0]", !131, !552}
!552 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi2ELb0EEE-ExtSLM}
!553 = !{!"m_OpenCLArgTypes", !302, !529, !304, !305, !530, !531, !532, !448, !449, !533, !451, !534, !453, !454, !535, !456, !457, !458, !459, !460}
!554 = !{!"m_OpenCLArgBaseTypes", !313, !539, !315, !316, !540, !541, !542, !466, !467, !543, !469, !544, !471, !472, !545, !474, !475, !476, !477, !478}
!555 = !{!"FuncMDMap[5]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE}
!556 = !{!"FuncMDValue[5]", !557, !133, !137, !140, !141, !142, !143, !357, !189, !190, !191, !393, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !415, !432, !443, !461, !479, !490, !345, !346}
!557 = !{!"localOffsets", !558}
!558 = !{!"localOffsetsVec[0]", !131, !559}
!559 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedSmallKernelILi4ELb0EEE-ExtSLM}
!560 = !{!"FuncMDMap[6]", ptr @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE}
!561 = !{!"FuncMDValue[6]", !562, !133, !137, !140, !141, !142, !143, !506, !189, !190, !191, !393, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !522, !432, !528, !538, !479, !490, !345, !346}
!562 = !{!"localOffsets", !563}
!563 = !{!"localOffsetsVec[0]", !131, !564}
!564 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_131Xe2KvTorchAbiS1PagedReuseKernelILi4ELb0ELi64EEE-ExtSLM}
!565 = !{!"FuncMDMap[7]", ptr @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE}
!566 = !{!"FuncMDValue[7]", !567, !133, !137, !140, !141, !142, !143, !506, !189, !190, !191, !393, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !522, !432, !553, !554, !479, !490, !345, !346}
!567 = !{!"localOffsets", !568}
!568 = !{!"localOffsetsVec[0]", !131, !569}
!569 = !{!"m_Var", ptr addrspace(3) @_ZTSN12_GLOBAL__N_126Xe2KvTorchAbiS1PagedKernelILi4ELb0EEE-ExtSLM}
!570 = !{!"pushInfo", !571, !572, !573, !577, !578, !579, !580, !581, !582, !583, !584, !597, !598, !599, !600}
!571 = !{!"pushableAddresses"}
!572 = !{!"bindlessPushInfo"}
!573 = !{!"dynamicBufferInfo", !574, !575, !576}
!574 = !{!"firstIndex", i32 0}
!575 = !{!"numOffsets", i32 0}
!576 = !{!"forceDisabled", i1 false}
!577 = !{!"MaxNumberOfPushedBuffers", i32 0}
!578 = !{!"inlineConstantBufferSlot", i32 -1}
!579 = !{!"inlineConstantBufferOffset", i32 -1}
!580 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!581 = !{!"constants"}
!582 = !{!"inputs"}
!583 = !{!"constantReg"}
!584 = !{!"simplePushInfoArr", !585, !594, !595, !596}
!585 = !{!"simplePushInfoArrVec[0]", !586, !587, !588, !589, !590, !591, !592, !593}
!586 = !{!"cbIdx", i32 0}
!587 = !{!"pushableAddressGrfOffset", i32 -1}
!588 = !{!"pushableOffsetGrfOffset", i32 -1}
!589 = !{!"offset", i32 0}
!590 = !{!"size", i32 0}
!591 = !{!"isStateless", i1 false}
!592 = !{!"isBindless", i1 false}
!593 = !{!"simplePushLoads"}
!594 = !{!"simplePushInfoArrVec[1]", !586, !587, !588, !589, !590, !591, !592, !593}
!595 = !{!"simplePushInfoArrVec[2]", !586, !587, !588, !589, !590, !591, !592, !593}
!596 = !{!"simplePushInfoArrVec[3]", !586, !587, !588, !589, !590, !591, !592, !593}
!597 = !{!"simplePushBufferUsed", i32 0}
!598 = !{!"pushAnalysisWIInfos"}
!599 = !{!"inlineRTGlobalPtrOffset", i32 0}
!600 = !{!"rtSyncSurfPtrOffset", i32 0}
!601 = !{!"psInfo", !602, !603, !604, !605, !606, !607, !608, !609, !610, !611, !612, !613, !614, !615, !616, !617}
!602 = !{!"BlendStateDisabledMask", i8 0}
!603 = !{!"SkipSrc0Alpha", i1 false}
!604 = !{!"DualSourceBlendingDisabled", i1 false}
!605 = !{!"ForceEnableSimd32", i1 false}
!606 = !{!"DisableSimd32WithDiscard", i1 false}
!607 = !{!"outputDepth", i1 false}
!608 = !{!"outputStencil", i1 false}
!609 = !{!"outputMask", i1 false}
!610 = !{!"blendToFillEnabled", i1 false}
!611 = !{!"forceEarlyZ", i1 false}
!612 = !{!"hasVersionedLoop", i1 false}
!613 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!614 = !{!"blendOptimizationMode"}
!615 = !{!"colorOutputMask"}
!616 = !{!"isBlendEnabled"}
!617 = !{!"WaDisableVRS", i1 false}
!618 = !{!"csInfo", !619, !620, !621, !622, !55, !31, !32, !623, !33, !624, !625, !626, !627, !628, !629, !630, !631, !632, !633, !634, !66, !635, !636, !637, !638}
!619 = !{!"maxWorkGroupSize", i32 0}
!620 = !{!"waveSize", i32 0}
!621 = !{!"ComputeShaderSecondCompile"}
!622 = !{!"forcedSIMDSize", i8 0}
!623 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!624 = !{!"forceSpillCompression", i1 false}
!625 = !{!"allowLowerSimd", i1 false}
!626 = !{!"disableSimd32Slicing", i1 false}
!627 = !{!"disableSplitOnSpill", i1 false}
!628 = !{!"enableNewSpillCostFunction", i1 false}
!629 = !{!"forceVISAPreSched", i1 false}
!630 = !{!"disableLocalIdOrderOptimizations", i1 false}
!631 = !{!"disableDispatchAlongY", i1 false}
!632 = !{!"neededThreadIdLayout", ptr null}
!633 = !{!"forceTileYWalk", i1 false}
!634 = !{!"atomicBranch", i32 0}
!635 = !{!"disableEarlyOut", i1 false}
!636 = !{!"walkOrderEnabled", i1 false}
!637 = !{!"walkOrderOverride", i32 0}
!638 = !{!"ResForHfPacking"}
!639 = !{!"msInfo", !640, !641, !642, !643, !644, !645, !646, !647, !648}
!640 = !{!"PrimitiveTopology", i32 3}
!641 = !{!"MaxNumOfPrimitives", i32 0}
!642 = !{!"MaxNumOfVertices", i32 0}
!643 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!644 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!645 = !{!"WorkGroupSize", i32 0}
!646 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!647 = !{!"IndexFormat", i32 6}
!648 = !{!"SubgroupSize", i32 0}
!649 = !{!"taskInfo", !650, !645, !646, !648}
!650 = !{!"MaxNumOfOutputs", i32 0}
!651 = !{!"NBarrierCnt", i32 0}
!652 = !{!"rtInfo", !653, !654, !655, !656, !657, !658, !659, !660, !661, !662, !663, !664, !665, !666, !210}
!653 = !{!"RayQueryAllocSizeInBytes", i32 0}
!654 = !{!"NumContinuations", i32 0}
!655 = !{!"RTAsyncStackAddrspace", i32 -1}
!656 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!657 = !{!"SWHotZoneAddrspace", i32 -1}
!658 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!659 = !{!"SWStackAddrspace", i32 -1}
!660 = !{!"SWStackSurfaceStateOffset", ptr null}
!661 = !{!"RTSyncStackAddrspace", i32 -1}
!662 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!663 = !{!"doSyncDispatchRays", i1 false}
!664 = !{!"MemStyle", !"Xe"}
!665 = !{!"GlobalDataStyle", !"Xe"}
!666 = !{!"uberTileDimensions", ptr null}
!667 = !{!"hasSliceLayoutDependency", i1 false}
!668 = !{!"CurUniqueIndirectIdx", i32 0}
!669 = !{!"inlineDynTextures"}
!670 = !{!"inlineResInfoData"}
!671 = !{!"immConstant", !672, !673, !674}
!672 = !{!"data"}
!673 = !{!"sizes"}
!674 = !{!"zeroIdxs"}
!675 = !{!"stringConstants"}
!676 = !{!"inlineBuffers", !677, !681, !682}
!677 = !{!"inlineBuffersVec[0]", !678, !679, !680}
!678 = !{!"alignment", i32 0}
!679 = !{!"allocSize", i64 0}
!680 = !{!"Buffer"}
!681 = !{!"inlineBuffersVec[1]", !678, !679, !680}
!682 = !{!"inlineBuffersVec[2]", !678, !679, !680}
!683 = !{!"GlobalBufferAddressRelocInfo"}
!684 = !{!"ConstantBufferAddressRelocInfo"}
!685 = !{!"forceLscCacheList"}
!686 = !{!"SrvMap"}
!687 = !{!"RasterizerOrderedByteAddressBuffer"}
!688 = !{!"RasterizerOrderedViews"}
!689 = !{!"MinNOSPushConstantSize", i32 0}
!690 = !{!"inlineProgramScopeOffsets"}
!691 = !{!"shaderData", !692}
!692 = !{!"numReplicas", i32 0}
!693 = !{!"URBInfo", !694, !695, !696}
!694 = !{!"has64BVertexHeaderInput", i1 false}
!695 = !{!"has64BVertexHeaderOutput", i1 false}
!696 = !{!"hasVertexHeader", i1 true}
!697 = !{!"UseBindlessImage", i1 true}
!698 = !{!"HasBindlessImageRead", i1 false}
!699 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!700 = !{!"enableRangeReduce", i1 false}
!701 = !{!"allowMatchMadOptimizationforVS", i1 false}
!702 = !{!"disableMatchMadOptimizationForCS", i1 false}
!703 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!704 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!705 = !{!"statefulResourcesNotAliased", i1 false}
!706 = !{!"disableMixMode", i1 false}
!707 = !{!"genericAccessesResolved", i1 false}
!708 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!709 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!710 = !{!"disableSeparateScratchWA", i1 false}
!711 = !{!"enableRemoveUnusedTGMFence", i1 false}
!712 = !{!"PrivateMemoryPerFG"}
!713 = !{!"m_OptsToDisable"}
!714 = !{!"capabilities", !715}
!715 = !{!"globalVariableDecorationsINTEL", i1 false}
!716 = !{!"extensions", !717}
!717 = !{!"spvINTELBindlessImages", i1 false}
!718 = !{!"m_ShaderResourceViewMcsMask", !719, !720}
!719 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!720 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!721 = !{!"computedDepthMode", i32 0}
!722 = !{!"isHDCFastClearShader", i1 false}
!723 = !{!"argRegisterReservations", !724}
!724 = !{!"argRegisterReservationsVec[0]", i32 0}
!725 = !{!"SIMD16_SpillThreshold", i8 0}
!726 = !{!"SIMD32_SpillThreshold", i8 0}
!727 = !{!"m_CacheControlOption", !728, !729, !730, !731}
!728 = !{!"LscLoadCacheControlOverride", i8 0}
!729 = !{!"LscStoreCacheControlOverride", i8 0}
!730 = !{!"TgmLoadCacheControlOverride", i8 0}
!731 = !{!"TgmStoreCacheControlOverride", i8 0}
!732 = !{!"ModuleUsesBindless", i1 false}
!733 = !{!"predicationMap"}
!734 = !{!"lifeTimeStartMap"}
!735 = !{!"HitGroups"}
!736 = !{i32 2, i32 0}
!737 = !{!"clang version 17.0.6"}
!738 = !{i32 1, !"wchar_size", i32 4}
!739 = !{!740}
!740 = !{i32 44, i32 4}
!741 = !{!742}
!742 = !{i32 4469}
!743 = !{!742, !744}
!744 = !{i32 4470}
!745 = distinct !{!745, !746}
!746 = !{!"llvm.loop.unroll.enable"}
!747 = distinct !{!747, !746}
!748 = !{!749}
!749 = !{i32 40, i32 196620}
!750 = distinct !{!750, !746}
!751 = distinct !{!751, !746}
!752 = distinct !{!752, !746}
!753 = distinct !{!753, !746}
!754 = distinct !{!754, !746}
!755 = distinct !{!755, !746}
!756 = !{!744}
!757 = distinct !{!757, !746}
!758 = distinct !{!758, !746}
!759 = distinct !{!759, !746}
!760 = distinct !{!760, !746}
!761 = !{!762}
!762 = !{i32 44, i32 2}
!763 = distinct !{!763, !746}
!764 = distinct !{!764, !746}
!765 = distinct !{!765, !746}
!766 = distinct !{!766, !746}
!767 = distinct !{!767, !746}
!768 = distinct !{!768, !746}
!769 = distinct !{!769, !746}
!770 = distinct !{!770, !746}
!771 = distinct !{!771, !746}
!772 = distinct !{!772, !746}
!773 = distinct !{!773, !774}
!774 = !{!"llvm.loop.unroll.disable"}
!775 = distinct !{!775, !746}
!776 = distinct !{!776, !746}
!777 = distinct !{!777, !746}
!778 = distinct !{!778, !746}
!779 = distinct !{!779, !746}
!780 = distinct !{!780, !746}
!781 = distinct !{!781, !746}
!782 = distinct !{!782, !746}
!783 = distinct !{!783, !746}
!784 = distinct !{!784, !746}
!785 = distinct !{!785, !746}
!786 = distinct !{!786, !746}
!787 = distinct !{!787, !746}
!788 = distinct !{!788, !746}
!789 = distinct !{!789, !746}
!790 = distinct !{!790, !746}
!791 = distinct !{!791, !746}
!792 = distinct !{!792, !746}
!793 = distinct !{!793, !746}
!794 = distinct !{!794, !774}
!795 = distinct !{!795, !746}
!796 = distinct !{!796, !746}
!797 = distinct !{!797, !746}
!798 = distinct !{!798, !746}
!799 = distinct !{!799, !746}
